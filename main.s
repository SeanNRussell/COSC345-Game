	.file	"main.c"
	.text
	.def	time;	.scl	3;	.type	32;	.endef
	.seh_proc	time
time:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	movq	__imp__time64(%rip), %rax
	call	*%rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	c_black
	.section .rdata,"dr"
	.align 4
c_black:
	.space 4
	.globl	c_dkgray
	.align 4
c_dkgray:
	.long	4210752
	.globl	c_gray
	.align 4
c_gray:
	.long	8421504
	.globl	c_ltgray
	.align 4
c_ltgray:
	.long	12632256
	.globl	c_white
	.align 4
c_white:
	.long	16777215
	.globl	c_red
	.align 4
c_red:
	.long	255
	.globl	c_orange
	.align 4
c_orange:
	.long	33023
	.globl	c_yellow
	.align 4
c_yellow:
	.long	65535
	.globl	c_lime
	.align 4
c_lime:
	.long	65408
	.globl	c_green
	.align 4
c_green:
	.long	65280
	.globl	c_slime
	.align 4
c_slime:
	.long	8453888
	.globl	c_aqua
	.align 4
c_aqua:
	.long	16776960
	.globl	c_sky
	.align 4
c_sky:
	.long	16744448
	.globl	c_blue
	.align 4
c_blue:
	.long	16711680
	.globl	c_purple
	.align 4
c_purple:
	.long	16711808
	.globl	c_fuchsia
	.align 4
c_fuchsia:
	.long	16711935
	.globl	c_rose
	.align 4
c_rose:
	.long	8388863
	.globl	glob_draw_alpha
	.data
	.align 4
glob_draw_alpha:
	.long	255
	.globl	glob_draw_colour
	.align 4
glob_draw_colour:
	.long	16777215
	.globl	glob_vk_right
	.bss
	.align 4
glob_vk_right:
	.space 4
	.globl	glob_vk_left
	.align 4
glob_vk_left:
	.space 4
	.globl	glob_vk_up
	.align 4
glob_vk_up:
	.space 4
	.globl	glob_vk_down
	.align 4
glob_vk_down:
	.space 4
	.globl	glob_vk_space
	.align 4
glob_vk_space:
	.space 4
	.globl	glob_vk_enter
	.align 4
glob_vk_enter:
	.space 4
	.globl	glob_vk_f2
	.align 4
glob_vk_f2:
	.space 4
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Unable to clear the surface. Error returned: %s\12\0"
	.text
	.globl	clear_screen
	.def	clear_screen;	.scl	2;	.type	32;	.endef
	.seh_proc	clear_screen
clear_screen:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	32(%rbp), %rax
	movl	$-16777152, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	SDL_FillRect
	testl	%eax, %eax
	jns	.L5
	call	SDL_GetError
	movq	%rax, %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L5:
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	make_color_rgb
	.def	make_color_rgb;	.scl	2;	.type	32;	.endef
	.seh_proc	make_color_rgb
make_color_rgb:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	16(%rbp), %eax
	movzbl	%al, %edx
	movl	24(%rbp), %eax
	sall	$8, %eax
	movzwl	%ax, %eax
	orl	%eax, %edx
	movl	32(%rbp), %eax
	sall	$16, %eax
	andl	$16711680, %eax
	orl	%edx, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	lerp
	.def	lerp;	.scl	2;	.type	32;	.endef
	.seh_proc	lerp
lerp:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movsd	%xmm0, 16(%rbp)
	movsd	%xmm1, 24(%rbp)
	movsd	%xmm2, 32(%rbp)
	movsd	24(%rbp), %xmm0
	subsd	16(%rbp), %xmm0
	mulsd	32(%rbp), %xmm0
	addsd	16(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_get_alpha
	.def	draw_get_alpha;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_get_alpha
draw_get_alpha:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	glob_draw_alpha(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_get_colour
	.def	draw_get_colour;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_get_colour
draw_get_colour:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	glob_draw_colour(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_set_color
	.def	draw_set_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_set_color
draw_set_color:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	andl	$16777215, %eax
	movl	%eax, glob_draw_colour(%rip)
	call	draw_get_alpha
	movzbl	%al, %edx
	movl	24(%rbp), %eax
	sarl	$16, %eax
	movzbl	%al, %r9d
	movl	24(%rbp), %eax
	sarl	$8, %eax
	movzbl	%al, %r8d
	movl	24(%rbp), %eax
	movzbl	%al, %eax
	movq	16(%rbp), %rcx
	movl	%edx, 32(%rsp)
	movl	%eax, %edx
	call	SDL_SetRenderDrawColor
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_get_color
	.def	draw_get_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_get_color
draw_get_color:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	glob_draw_colour(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_set_alpha
	.def	draw_set_alpha;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_set_alpha
draw_set_alpha:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, glob_draw_alpha(%rip)
	call	draw_get_colour
	movl	%eax, -4(%rbp)
	movl	24(%rbp), %eax
	movzbl	%al, %edx
	movl	-4(%rbp), %eax
	sarl	$16, %eax
	movzbl	%al, %r9d
	movl	-4(%rbp), %eax
	sarl	$8, %eax
	movzbl	%al, %r8d
	movl	-4(%rbp), %eax
	movzbl	%al, %eax
	movq	16(%rbp), %rcx
	movl	%edx, 32(%rsp)
	movl	%eax, %edx
	call	SDL_SetRenderDrawColor
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_clear
	.def	draw_clear;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_clear
draw_clear:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderClear
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_clear_alpha
	.def	draw_clear_alpha;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_clear_alpha
draw_clear_alpha:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	32(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_alpha
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_rectangle
	.def	draw_rectangle;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_rectangle
draw_rectangle:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	32(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	40(%rbp), %eax
	subl	24(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	48(%rbp), %eax
	subl	32(%rbp), %eax
	movl	%eax, -4(%rbp)
	leaq	-16(%rbp), %rax
	movq	16(%rbp), %rcx
	movq	%rax, %rdx
	call	SDL_RenderFillRect
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_rectangle_color
	.def	draw_rectangle_color;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_rectangle_color
draw_rectangle_color:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	call	draw_get_color
	movl	%eax, -4(%rbp)
	movl	56(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	40(%rbp), %r9d
	movl	32(%rbp), %r8d
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	movl	48(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle
	movl	-4(%rbp), %edx
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_image
	.def	draw_image;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_image
draw_image:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	32(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	40(%rbp), %eax
	subl	24(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	48(%rbp), %eax
	subl	32(%rbp), %eax
	movl	%eax, -4(%rbp)
	leaq	-16(%rbp), %rcx
	movq	56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_image_part
	.def	draw_image_part;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_image_part
draw_image_part:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	32(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	40(%rbp), %eax
	subl	24(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	48(%rbp), %eax
	subl	32(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	64(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	72(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	80(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	88(%rbp), %eax
	movl	%eax, -20(%rbp)
	leaq	-16(%rbp), %r8
	leaq	-32(%rbp), %rcx
	movq	56(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	SDL_RenderCopy
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	draw_text
	.def	draw_text;	.scl	2;	.type	32;	.endef
	.seh_proc	draw_text
draw_text:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movq	64(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movl	%eax, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$35, %eax
	movsbl	%al, %eax
	subl	$32, %eax
	movl	%eax, -24(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L25
.L28:
	movl	-12(%rbp), %eax
	cltq
	movq	64(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$32, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jne	.L26
	movl	-12(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	64(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$32, %eax
	cmpl	%eax, -24(%rbp)
	je	.L26
	movl	$0, -4(%rbp)
	movl	48(%rbp), %eax
	addl	%eax, -8(%rbp)
	jmp	.L27
.L26:
	movl	-20(%rbp), %eax
	imull	72(%rbp), %eax
	movl	%eax, %ecx
	movl	32(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%eax, %edx
	movl	48(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%eax, %edx
	movl	40(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	32(%rbp), %edx
	movl	-8(%rbp), %eax
	leal	(%rdx,%rax), %r10d
	movl	24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%eax, %edx
	movq	16(%rbp), %rax
	movl	80(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	72(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	56(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	%r8d, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	movl	40(%rbp), %eax
	addl	%eax, -4(%rbp)
.L27:
	addl	$1, -12(%rbp)
.L25:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L28
	nop
	nop
	addq	$112, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	keyboard_check
	.def	keyboard_check;	.scl	2;	.type	32;	.endef
	.seh_proc	keyboard_check
keyboard_check:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	glob_vk_down(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	keyboard_check_pressed
	.def	keyboard_check_pressed;	.scl	2;	.type	32;	.endef
	.seh_proc	keyboard_check_pressed
keyboard_check_pressed:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	glob_vk_down(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	keyboard_check_released
	.def	keyboard_check_released;	.scl	2;	.type	32;	.endef
	.seh_proc	keyboard_check_released
keyboard_check_released:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	glob_vk_down(%rip), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	mux_int
	.def	mux_int;	.scl	2;	.type	32;	.endef
	.seh_proc	mux_int
mux_int:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L36
.L37:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L36:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L37
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	mux_sdltex
	.def	mux_sdltex;	.scl	2;	.type	32;	.endef
	.seh_proc	mux_sdltex
mux_sdltex:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L40
.L41:
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movq	(%rax), %rax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L40:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L41
	movl	-4(%rbp), %eax
	cltq
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	pos_int
	.def	pos_int;	.scl	2;	.type	32;	.endef
	.seh_proc	pos_int
pos_int:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L44
.L47:
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	24(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jne	.L45
	movl	-4(%rbp), %eax
	jmp	.L48
.L45:
	addl	$1, -4(%rbp)
.L44:
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L47
	movl	$-1, %eax
.L48:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	BG
	.def	BG;	.scl	2;	.type	32;	.endef
	.seh_proc	BG
BG:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	movl	16(%rbp), %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	sqr
	.def	sqr;	.scl	2;	.type	32;	.endef
	.seh_proc	sqr
sqr:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	imull	%eax, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	degtorad
	.def	degtorad;	.scl	2;	.type	32;	.endef
	.seh_proc	degtorad
degtorad:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movsd	%xmm0, 16(%rbp)
	movsd	16(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm2
	movapd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.globl	radtodeg
	.def	radtodeg;	.scl	2;	.type	32;	.endef
	.seh_proc	radtodeg
radtodeg:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movsd	%xmm0, 16(%rbp)
	movsd	16(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm2
	movapd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.globl	get_timer
	.def	get_timer;	.scl	2;	.type	32;	.endef
	.seh_proc	get_timer
get_timer:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	SDL_GetTicks
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	point_in_rectangle
	.def	point_in_rectangle;	.scl	2;	.type	32;	.endef
	.seh_proc	point_in_rectangle
point_in_rectangle:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	16(%rbp), %eax
	cmpl	32(%rbp), %eax
	jl	.L60
	movl	16(%rbp), %eax
	cmpl	48(%rbp), %eax
	jge	.L60
	movl	24(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L60
	movl	24(%rbp), %eax
	cmpl	56(%rbp), %eax
	jge	.L60
	movl	$1, %eax
	jmp	.L62
.L60:
	movl	$0, %eax
.L62:
	popq	%rbp
	ret
	.seh_endproc
	.globl	rectangle_in_rectangle
	.def	rectangle_in_rectangle;	.scl	2;	.type	32;	.endef
	.seh_proc	rectangle_in_rectangle
rectangle_in_rectangle:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	$0, -4(%rbp)
	movl	56(%rbp), %r9d
	movl	48(%rbp), %r8d
	movl	24(%rbp), %edx
	movl	16(%rbp), %eax
	movl	72(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	64(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	point_in_rectangle
	addl	%eax, -4(%rbp)
	movl	56(%rbp), %r9d
	movl	48(%rbp), %r8d
	movl	24(%rbp), %edx
	movl	32(%rbp), %eax
	movl	72(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	64(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	point_in_rectangle
	addl	%eax, -4(%rbp)
	movl	56(%rbp), %r9d
	movl	48(%rbp), %r8d
	movl	40(%rbp), %edx
	movl	16(%rbp), %eax
	movl	72(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	64(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	point_in_rectangle
	addl	%eax, -4(%rbp)
	movl	56(%rbp), %r9d
	movl	48(%rbp), %r8d
	movl	40(%rbp), %edx
	movl	32(%rbp), %eax
	movl	72(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	64(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	point_in_rectangle
	addl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L64
	movl	$0, %eax
	jmp	.L65
.L64:
	cmpl	$4, -4(%rbp)
	jne	.L66
	movl	$1, %eax
	jmp	.L65
.L66:
	movl	$2, %eax
.L65:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	string_pos
	.def	string_pos;	.scl	2;	.type	32;	.endef
	.seh_proc	string_pos
string_pos:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	movq	%rax, -16(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movl	%eax, -20(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L68
.L71:
	movl	-4(%rbp), %eax
	cltq
	movq	24(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	cmpb	%al, %dl
	jne	.L69
	movl	-4(%rbp), %eax
	jmp	.L70
.L69:
	addl	$1, -4(%rbp)
.L68:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L71
	movl	$-1, %eax
.L70:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	game_level_load
	.def	game_level_load;	.scl	2;	.type	32;	.endef
	.seh_proc	game_level_load
game_level_load:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "faulty at the moment.\0"
.LC4:
	.ascii "r\0"
.LC5:
	.ascii "cosc345-game.tmx\0"
.LC6:
	.ascii "wb\0"
.LC7:
	.ascii "level-new.dat\0"
.LC8:
	.ascii "i=%i/%i: %i (%i,%i,%i)\12,\0"
	.text
	.globl	dev_tiled_to_leveldata
	.def	dev_tiled_to_leveldata;	.scl	2;	.type	32;	.endef
	.seh_proc	dev_tiled_to_leveldata
dev_tiled_to_leveldata:
	pushq	%rbp
	.seh_pushreg	%rbp
	movl	$131200, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	131200
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, glob_vk_f2(%rip)
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 131040(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 131032(%rbp)
	movl	$131072, 131028(%rbp)
	movl	$32, 131028(%rbp)
	movl	$0, 131068(%rbp)
	jmp	.L74
.L75:
	movl	131068(%rbp), %eax
	cltq
	movb	$0, -48(%rbp,%rax)
	addl	$1, 131068(%rbp)
.L74:
	movl	131068(%rbp), %eax
	cmpl	131028(%rbp), %eax
	jl	.L75
	movl	$0, 131064(%rbp)
	jmp	.L76
.L77:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	addl	$1, 131064(%rbp)
.L76:
	cmpl	$501, 131064(%rbp)
	jle	.L77
	movl	$44, %eax
	movb	%al, 131027(%rbp)
	movl	$0, 131060(%rbp)
.L90:
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, 131026(%rbp)
	cmpb	$60, 131026(%rbp)
	je	.L91
	movl	131060(%rbp), %eax
	cmpl	131028(%rbp), %eax
	jge	.L92
	movl	$0, 131056(%rbp)
	jmp	.L81
.L82:
	movl	131056(%rbp), %eax
	cltq
	movb	$48, -51(%rbp,%rax)
	addl	$1, 131056(%rbp)
.L81:
	cmpl	$2, 131056(%rbp)
	jle	.L82
	movzbl	131026(%rbp), %eax
	movb	%al, -51(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, 131026(%rbp)
	movzbl	131026(%rbp), %eax
	cmpb	131027(%rbp), %al
	je	.L83
	movzbl	131026(%rbp), %eax
	movb	%al, -50(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, 131026(%rbp)
	movzbl	131026(%rbp), %eax
	cmpb	131027(%rbp), %al
	je	.L84
	movzbl	131026(%rbp), %eax
	movb	%al, -49(%rbp)
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fgetc
	jmp	.L85
.L84:
	movzbl	-50(%rbp), %eax
	movb	%al, -49(%rbp)
	movzbl	-51(%rbp), %eax
	movb	%al, -50(%rbp)
	movb	$48, -51(%rbp)
	jmp	.L85
.L83:
	movzbl	-51(%rbp), %eax
	movb	%al, -49(%rbp)
	movb	$48, -51(%rbp)
.L85:
	movl	$0, 131052(%rbp)
	jmp	.L86
.L87:
	movl	131052(%rbp), %eax
	cltq
	movzbl	-51(%rbp,%rax), %eax
	subl	$48, %eax
	movl	131052(%rbp), %edx
	movslq	%edx, %rdx
	movb	%al, -51(%rbp,%rdx)
	addl	$1, 131052(%rbp)
.L86:
	cmpl	$2, 131052(%rbp)
	jle	.L87
	movzbl	-51(%rbp), %eax
	movl	$100, %edx
	imull	%edx, %eax
	movl	%eax, %ecx
	movzbl	-50(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	leal	(%rcx,%rax), %edx
	movzbl	-49(%rbp), %eax
	addl	%edx, %eax
	movb	%al, 131051(%rbp)
	cmpb	$0, 131051(%rbp)
	jne	.L88
	movb	$-1, 131051(%rbp)
	jmp	.L89
.L88:
	subb	$1, 131051(%rbp)
.L89:
	movzbl	-49(%rbp), %eax
	movzbl	%al, %r8d
	movzbl	-50(%rbp), %eax
	movzbl	%al, %ecx
	movzbl	-51(%rbp), %eax
	movzbl	%al, %edx
	movzbl	131051(%rbp), %r9d
	movl	131028(%rbp), %r10d
	movl	131060(%rbp), %eax
	movl	%r8d, 48(%rsp)
	movl	%ecx, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%r10d, %r8d
	movl	%eax, %edx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	131060(%rbp), %eax
	movslq	%eax, %rdx
	movzbl	131051(%rbp), %eax
	movb	%al, -48(%rbp,%rdx)
	addl	$1, 131060(%rbp)
	jmp	.L90
.L91:
	nop
	jmp	.L79
.L92:
	nop
.L79:
	movl	131028(%rbp), %eax
	movslq	%eax, %rdx
	movq	131032(%rbp), %rcx
	leaq	-48(%rbp), %rax
	movq	%rcx, %r9
	movl	$1, %r8d
	movq	%rax, %rcx
	call	fwrite
	movq	131040(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	131032(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	nop
	addq	$131200, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	play_WAV
	.def	play_WAV;	.scl	2;	.type	32;	.endef
	.seh_proc	play_WAV
play_WAV:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.globl	MAX_WATER_PARTICLES
	.section .rdata,"dr"
	.align 4
MAX_WATER_PARTICLES:
	.long	100
	.globl	waterParticles
	.bss
	.align 8
waterParticles:
	.space 8
	.text
	.globl	createWaterParticle
	.def	createWaterParticle;	.scl	2;	.type	32;	.endef
	.seh_proc	createWaterParticle
createWaterParticle:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	call	rand
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1427937179, %rax, %rax
	shrq	$32, %rax
	sarl	$8, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$770, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	leal	298(%rax), %ecx
	movq	waterParticles(%rip), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movss	%xmm0, (%rax)
	call	rand
	cltd
	idivl	32(%rbp)
	movl	%edx, %eax
	negl	%eax
	movl	%eax, %ecx
	movq	waterParticles(%rip), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	%ecx, %xmm0
	movss	%xmm0, 4(%rax)
	movq	waterParticles(%rip), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	.LC9(%rip), %xmm0
	movss	%xmm0, 8(%rax)
	movq	waterParticles(%rip), %rdx
	movl	16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$1, 12(%rax)
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	audioCallback
	.def	audioCallback;	.scl	2;	.type	32;	.endef
	.seh_proc	audioCallback
audioCallback:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	12(%rax), %edx
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	jb	.L96
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
.L96:
	movq	-8(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	12(%rax), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, -12(%rbp)
	movl	32(%rbp), %eax
	movl	-12(%rbp), %edx
	cmpl	%eax, %edx
	cmovbe	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %ecx
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, %eax
	addq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	SDL_memcpy
	movq	-8(%rbp), %rax
	movl	12(%rax), %edx
	movl	-16(%rbp), %eax
	addl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 12(%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Failed to allocate memory for water particles\12\0"
.LC11:
	.ascii "SDL init error:%s\12\0"
.LC12:
	.ascii "COSC345 - Game\0"
.LC13:
	.ascii "Window error\0"
.LC14:
	.ascii "Render error\0"
.LC15:
	.ascii "Surface error\0"
	.align 8
.LC16:
	.ascii "SDL_ttf could not initialize! TTF_Error: %s\12\0"
.LC17:
	.ascii "font.ttf\0"
	.align 8
.LC18:
	.ascii "Failed to load font! SDL_ttf Error: %s\12\0"
	.align 8
.LC19:
	.ascii "Renderer could not be created! SDL_Error: %s\12\0"
.LC20:
	.ascii "img/spr_grass.png\0"
.LC21:
	.ascii "img/spr_sand.png\0"
.LC22:
	.ascii "img/spr_water.png\0"
.LC23:
	.ascii "img/spr_lava.png\0"
.LC24:
	.ascii "img/player_strip8.png\0"
.LC25:
	.ascii "img/ascii_strip96.png\0"
.LC26:
	.ascii "rb\0"
.LC27:
	.ascii "level.dat\0"
.LC28:
	.ascii "music.wav\0"
.LC29:
	.ascii "Failed to load WAV file: %s\12\0"
	.align 8
.LC30:
	.ascii "Failed to open audio device: %s\12\0"
.LC31:
	.ascii "img/img_lands.png\0"
.LC32:
	.ascii "Press SPACE to continue.\0"
.LC33:
	.ascii "Entering main loop...\0"
.LC34:
	.ascii "F2 started!\0"
.LC35:
	.ascii "F2 finished!\0"
.LC36:
	.ascii "Location:#DUNEDIN#NEW ZEALAND\0"
.LC37:
	.ascii "LVL: XYZ/255\0"
.LC38:
	.ascii "X\0"
.LC39:
	.ascii "Y\0"
.LC40:
	.ascii "Z\0"
.LC41:
	.ascii "title has no texture!\0"
.LC44:
	.ascii "Score: %d\0"
.LC45:
	.ascii "...exited main loop.\0"
.LC46:
	.ascii "%s Error returned: %s\12\0"
	.text
	.globl	SDL_main
	.def	SDL_main;	.scl	2;	.type	32;	.endef
	.seh_proc	SDL_main
SDL_main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movl	$66360, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	66360
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, 66304(%rbp)
	movq	%rdx, 66312(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rsi
	movq	$256, 66160(%rbp)
	movq	66160(%rbp), %rax
	subq	$1, %rax
	movq	%rax, 66152(%rbp)
	movq	66160(%rbp), %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movq	66160(%rbp), %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	66160(%rbp), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 66144(%rbp)
	movl	$1366, 66140(%rbp)
	movl	$768, 66136(%rbp)
	movl	66140(%rbp), %eax
	subl	66136(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 66132(%rbp)
	movl	$0, 66128(%rbp)
	movl	66136(%rbp), %eax
	movl	%eax, 66124(%rbp)
	movl	66136(%rbp), %eax
	movl	%eax, 66120(%rbp)
	movl	66132(%rbp), %edx
	movl	66124(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66116(%rbp)
	movl	66128(%rbp), %edx
	movl	66120(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 66112(%rbp)
	movl	$16, 66108(%rbp)
	movl	$16, 66104(%rbp)
	movl	66108(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, %edi
	movl	66136(%rbp), %eax
	cltd
	idivl	%edi
	movl	%eax, 66100(%rbp)
	movl	66100(%rbp), %eax
	movl	%eax, 66096(%rbp)
	movl	$100, %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, waterParticles(%rip)
	movq	waterParticles(%rip), %rax
	testq	%rax, %rax
	jne	.L98
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %r9
	movl	$46, %r8d
	movl	$1, %edx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	movl	$1, %eax
	jmp	.L99
.L98:
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, 66220(%rbp)
	jmp	.L100
.L101:
	movl	66136(%rbp), %ecx
	movl	66140(%rbp), %edx
	movl	66220(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
	addl	$1, 66220(%rbp)
.L100:
	movl	$100, %eax
	cmpl	%eax, 66220(%rbp)
	jl	.L101
	movl	$62001, 66092(%rbp)
	movl	66092(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_Init
	testl	%eax, %eax
	je	.L102
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L99
.L102:
	movl	66140(%rbp), %edx
	movl	$0, 40(%rsp)
	movl	66136(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	movl	$536805376, %r8d
	movl	$536805376, %edx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	SDL_CreateWindow
	movq	%rax, 66080(%rbp)
	cmpq	$0, 66080(%rbp)
	jne	.L103
	movq	66160(%rbp), %rdx
	movq	66144(%rbp), %rax
	leaq	.LC13(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L104
.L103:
	movq	66080(%rbp), %rax
	movl	$4, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66072(%rbp)
	cmpq	$0, 66072(%rbp)
	jne	.L105
	movq	66160(%rbp), %rdx
	movq	66144(%rbp), %rax
	leaq	.LC14(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L104
.L105:
	movl	$0, 66068(%rbp)
	movw	$48, 65726(%rbp)
	movq	66080(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_GetWindowSurface
	movq	%rax, 66056(%rbp)
	cmpq	$0, 66056(%rbp)
	jne	.L106
	movq	66160(%rbp), %rdx
	movq	66144(%rbp), %rax
	leaq	.LC15(%rip), %r8
	movq	%rax, %rcx
	call	snprintf
	jmp	.L104
.L106:
	movl	$800, 65696(%rbp)
	movl	$100, 65700(%rbp)
	movl	$100, 65704(%rbp)
	movl	$100, 65708(%rbp)
	movabsq	$2338613357913204068, %rax
	movq	%rax, 65680(%rbp)
	movabsq	$28542640894207341, %rax
	movq	%rax, 65688(%rbp)
	leaq	65680(%rbp), %rax
	movq	%rax, 66048(%rbp)
	movl	$0, 66216(%rbp)
	call	TTF_Init
	cmpl	$-1, %eax
	jne	.L107
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L99
.L107:
	movl	$12, %edx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	TTF_OpenFont
	movq	%rax, 66040(%rbp)
	cmpq	$0, 66040(%rbp)
	jne	.L108
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L99
.L108:
	movl	$0, 66212(%rbp)
	movb	$-1, 65676(%rbp)
	movb	$-1, 65677(%rbp)
	movb	$-1, 65678(%rbp)
	movb	$-1, 65679(%rbp)
	movq	66080(%rbp), %rax
	movl	$2, %r8d
	movl	$-1, %edx
	movq	%rax, %rcx
	call	SDL_CreateRenderer
	movq	%rax, 66032(%rbp)
	cmpq	$0, 66072(%rbp)
	jne	.L109
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L109:
	movl	$2, %ecx
	call	IMG_Init
	movq	66072(%rbp), %rax
	leaq	.LC20(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66024(%rbp)
	movq	66072(%rbp), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66016(%rbp)
	movq	66072(%rbp), %rax
	leaq	.LC22(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66008(%rbp)
	movq	66072(%rbp), %rax
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 66000(%rbp)
	movq	66072(%rbp), %rax
	leaq	.LC24(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65992(%rbp)
	movq	66072(%rbp), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65984(%rbp)
	movl	$8, 65980(%rbp)
	movl	$16, 65976(%rbp)
	movl	66108(%rbp), %eax
	movl	%eax, %ecx
	call	sqr
	movl	%eax, 65972(%rbp)
	movl	$256, 65968(%rbp)
	movl	$0, 66208(%rbp)
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC27(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 65960(%rbp)
	movl	$0, 66204(%rbp)
	jmp	.L110
.L111:
	movl	66204(%rbp), %eax
	cltq
	movb	$0, 128(%rbp,%rax)
	addl	$1, 66204(%rbp)
.L110:
	movl	65972(%rbp), %eax
	imull	65968(%rbp), %eax
	cmpl	%eax, 66204(%rbp)
	jl	.L111
	movq	65960(%rbp), %rdx
	leaq	128(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$65536, %edx
	movq	%rax, %rcx
	call	fread
	movq	65960(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	66100(%rbp), %eax
	imull	66104(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66132(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 96(%rbp)
	movl	66096(%rbp), %eax
	imull	66104(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	66128(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 100(%rbp)
	movb	$0, 112(%rbp)
	movb	$0, 113(%rbp)
	movb	$1, 114(%rbp)
	movb	$12, 115(%rbp)
	movb	$0, 116(%rbp)
	movb	$2, 117(%rbp)
	movb	$12, 118(%rbp)
	leaq	.LC28(%rip), %rax
	movq	%rax, 65952(%rbp)
	movq	65952(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rcx
	call	SDL_RWFromFile
	movq	%rax, %rcx
	leaq	56(%rbp), %r8
	leaq	64(%rbp), %rdx
	leaq	52(%rbp), %rax
	movq	%rax, 32(%rsp)
	movq	%r8, %r9
	movq	%rdx, %r8
	movl	$1, %edx
	call	SDL_LoadWAV_RW
	testq	%rax, %rax
	jne	.L112
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L113
.L112:
	movq	56(%rbp), %rax
	movq	%rax, 32(%rbp)
	movl	52(%rbp), %eax
	movl	%eax, 40(%rbp)
	movl	$0, 44(%rbp)
	leaq	audioCallback(%rip), %rax
	movq	%rax, 80(%rbp)
	leaq	32(%rbp), %rax
	movq	%rax, 88(%rbp)
	leaq	64(%rbp), %rax
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	SDL_OpenAudioDevice
	movl	%eax, 65948(%rbp)
	cmpl	$0, 65948(%rbp)
	jne	.L114
	call	SDL_GetError
	movq	%rax, %rdx
	leaq	.LC30(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	jmp	.L113
.L114:
	movl	52(%rbp), %ecx
	movq	56(%rbp), %rdx
	movl	65948(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	SDL_QueueAudio
	movl	65948(%rbp), %eax
	movl	$0, %edx
	movl	%eax, %ecx
	call	SDL_PauseAudioDevice
	movl	$1, 66200(%rbp)
	movq	66072(%rbp), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rax, %rcx
	call	IMG_LoadTexture
	movq	%rax, 65936(%rbp)
	leaq	.LC32(%rip), %rax
	movq	%rax, 65928(%rbp)
	movl	$0, 65924(%rbp)
	movl	$1, 66196(%rbp)
	leaq	.LC33(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L115
.L154:
	movl	65728(%rbp), %eax
	cmpl	$769, %eax
	je	.L117
	cmpl	$769, %eax
	ja	.L116
	cmpl	$256, %eax
	je	.L118
	cmpl	$768, %eax
	je	.L119
	jmp	.L116
.L118:
	movl	$0, 66196(%rbp)
	jmp	.L116
.L119:
	movl	$1, 65792(%rbp)
	movl	65748(%rbp), %eax
	cmpl	$57, %eax
	jg	.L120
	cmpl	$27, %eax
	jge	.L121
	jmp	.L116
.L138:
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L116
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L124(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L124(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L124:
	.long	.L129-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L128-.L124
	.long	.L127-.L124
	.long	.L126-.L124
	.long	.L125-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L116-.L124
	.long	.L123-.L124
	.text
.L121:
	subl	$27, %eax
	cmpl	$30, %eax
	ja	.L116
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L131(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L131(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L131:
	.long	.L137-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L136-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L135-.L131
	.long	.L134-.L131
	.long	.L133-.L131
	.long	.L132-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L116-.L131
	.long	.L130-.L131
	.text
.L120:
	cmpl	$1073741912, %eax
	jg	.L116
	cmpl	$1073741883, %eax
	jge	.L138
	jmp	.L116
.L137:
	movl	$0, 66196(%rbp)
	jmp	.L122
.L128:
	movl	65792(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L122
.L127:
	movl	65792(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L122
.L125:
	movl	65792(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L122
.L126:
	movl	65792(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L122
.L136:
	movl	65792(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L122
.L123:
	movl	65792(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L122
.L129:
	movl	65792(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	jmp	.L122
.L130:
	cmpl	$0, 66216(%rbp)
	jne	.L139
	movl	$1, 66216(%rbp)
	leaq	65680(%rbp), %rax
	movabsq	$3184362091757007472, %rdi
	movq	%rdi, (%rax)
	movabsq	$14685297085393969, %rdi
	movq	%rdi, 6(%rax)
	jmp	.L122
.L139:
	movl	$0, 66216(%rbp)
	jmp	.L122
.L135:
	cmpl	$1, 66216(%rbp)
	jne	.L196
	leaq	65680(%rbp), %rax
	movabsq	$8315178112915959673, %rdi
	movq	%rdi, (%rax)
	movabsq	$13827889429705573, %rbx
	movq	%rbx, 6(%rax)
	addl	$50, 66212(%rbp)
	jmp	.L196
.L134:
	cmpl	$1, 66216(%rbp)
	jne	.L197
	leaq	65680(%rbp), %rax
	movabsq	$8315178112915959673, %rdi
	movq	%rdi, (%rax)
	movabsq	$14109364406416229, %rbx
	movq	%rbx, 6(%rax)
	jmp	.L197
.L133:
	cmpl	$1, 66216(%rbp)
	jne	.L198
	leaq	65680(%rbp), %rax
	movabsq	$8315178112915959673, %rdi
	movq	%rdi, (%rax)
	movabsq	$14390839383126885, %rbx
	movq	%rbx, 6(%rax)
	jmp	.L198
.L132:
	cmpl	$1, 66216(%rbp)
	jne	.L199
	leaq	65680(%rbp), %rax
	movabsq	$8315178112915959673, %rdi
	movq	%rdi, (%rax)
	movabsq	$14672314359837541, %rbx
	movq	%rbx, 6(%rax)
	jmp	.L199
.L196:
	nop
	jmp	.L116
.L197:
	nop
	jmp	.L116
.L198:
	nop
	jmp	.L116
.L199:
	nop
.L122:
	jmp	.L116
.L117:
	movl	$0, 65796(%rbp)
	movl	65748(%rbp), %eax
	cmpl	$32, %eax
	je	.L145
	cmpl	$32, %eax
	jl	.L200
	cmpl	$1073741912, %eax
	jg	.L200
	cmpl	$1073741883, %eax
	jl	.L200
	subl	$1073741883, %eax
	cmpl	$29, %eax
	ja	.L200
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L148(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L148(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L148:
	.long	.L153-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L152-.L148
	.long	.L151-.L148
	.long	.L150-.L148
	.long	.L149-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L200-.L148
	.long	.L147-.L148
	.text
.L152:
	movl	65796(%rbp), %eax
	movl	%eax, glob_vk_right(%rip)
	jmp	.L146
.L151:
	movl	65796(%rbp), %eax
	movl	%eax, glob_vk_left(%rip)
	jmp	.L146
.L149:
	movl	65796(%rbp), %eax
	movl	%eax, glob_vk_up(%rip)
	jmp	.L146
.L150:
	movl	65796(%rbp), %eax
	movl	%eax, glob_vk_down(%rip)
	jmp	.L146
.L145:
	movl	65796(%rbp), %eax
	movl	%eax, glob_vk_space(%rip)
	jmp	.L146
.L147:
	movl	65796(%rbp), %eax
	movl	%eax, glob_vk_enter(%rip)
	jmp	.L146
.L153:
	movl	65796(%rbp), %eax
	movl	%eax, glob_vk_f2(%rip)
	nop
.L146:
.L200:
	nop
.L116:
	leaq	65728(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_PollEvent
	testl	%eax, %eax
	jne	.L154
	movl	glob_vk_f2(%rip), %eax
	testl	%eax, %eax
	je	.L155
	leaq	.LC34(%rip), %rax
	movq	%rax, %rcx
	call	puts
	call	dev_tiled_to_leveldata
	leaq	.LC35(%rip), %rax
	movq	%rax, %rcx
	call	puts
.L155:
	movl	glob_vk_right(%rip), %eax
	testl	%eax, %eax
	je	.L156
	movb	$0, 112(%rbp)
	movl	96(%rbp), %edx
	movzbl	118(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 96(%rbp)
.L156:
	movl	glob_vk_up(%rip), %eax
	testl	%eax, %eax
	je	.L157
	movb	$1, 112(%rbp)
	movl	100(%rbp), %edx
	movzbl	118(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 100(%rbp)
.L157:
	movl	glob_vk_left(%rip), %eax
	testl	%eax, %eax
	je	.L158
	movb	$2, 112(%rbp)
	movl	96(%rbp), %edx
	movzbl	118(%rbp), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, 96(%rbp)
.L158:
	movl	glob_vk_down(%rip), %eax
	testl	%eax, %eax
	je	.L159
	movb	$3, 112(%rbp)
	movl	100(%rbp), %edx
	movzbl	118(%rbp), %eax
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, 100(%rbp)
.L159:
	movl	glob_vk_right(%rip), %edx
	movl	glob_vk_left(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_up(%rip), %eax
	orl	%eax, %edx
	movl	glob_vk_down(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L160
	movzbl	113(%rbp), %edx
	movzbl	114(%rbp), %eax
	addl	%edx, %eax
	movb	%al, 113(%rbp)
	movzbl	116(%rbp), %ecx
	movzbl	113(%rbp), %edx
	movzbl	115(%rbp), %eax
	cmpb	%al, %dl
	setnb	%al
	addl	%ecx, %eax
	movb	%al, 116(%rbp)
	movzbl	113(%rbp), %eax
	movzbl	115(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 113(%rbp)
	movzbl	116(%rbp), %eax
	movzbl	117(%rbp), %edx
	movzbl	%al, %eax
	divb	%dl
	movzbl	%ah, %eax
	movb	%al, 116(%rbp)
	movl	66104(%rbp), %eax
	imull	66100(%rbp), %eax
	movl	66116(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 65920(%rbp)
	movl	66128(%rbp), %eax
	movl	%eax, 65916(%rbp)
	movl	66132(%rbp), %eax
	movl	%eax, 65912(%rbp)
	movl	66104(%rbp), %eax
	imull	66096(%rbp), %eax
	movl	66112(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, 65908(%rbp)
	movl	$0, 65904(%rbp)
	movl	96(%rbp), %eax
	cmpl	%eax, 65920(%rbp)
	jl	.L161
	movl	100(%rbp), %eax
	cmpl	%eax, 65908(%rbp)
	jl	.L161
	movl	96(%rbp), %eax
	cmpl	%eax, 65912(%rbp)
	jg	.L161
	movl	100(%rbp), %eax
	cmpl	%eax, 65916(%rbp)
	jle	.L162
.L161:
	movl	$1, %eax
	jmp	.L163
.L162:
	movl	$0, %eax
.L163:
	movl	%eax, 65904(%rbp)
	movl	96(%rbp), %eax
	cmpl	%eax, 65920(%rbp)
	jge	.L164
	movl	65912(%rbp), %eax
	movl	%eax, 96(%rbp)
	addl	$1, 66208(%rbp)
.L164:
	movl	100(%rbp), %eax
	cmpl	%eax, 65916(%rbp)
	jle	.L165
	movl	65908(%rbp), %eax
	movl	%eax, 100(%rbp)
	pxor	%xmm2, %xmm2
	cvtsi2sdl	65968(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	subl	%eax, 66208(%rbp)
.L165:
	movl	96(%rbp), %eax
	cmpl	%eax, 65912(%rbp)
	jle	.L166
	movl	65920(%rbp), %eax
	movl	%eax, 96(%rbp)
	subl	$1, 66208(%rbp)
.L166:
	movl	100(%rbp), %eax
	cmpl	%eax, 65908(%rbp)
	jge	.L167
	movl	65916(%rbp), %eax
	movl	%eax, 100(%rbp)
	pxor	%xmm3, %xmm3
	cvtsi2sdl	65968(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sqrt
	cvttsd2sil	%xmm0, %eax
	addl	%eax, 66208(%rbp)
.L167:
	cmpl	$0, 65904(%rbp)
	je	.L168
	movl	65968(%rbp), %eax
	addl	%eax, 66208(%rbp)
	movl	66208(%rbp), %eax
	cltd
	idivl	65968(%rbp)
	movl	%edx, 66208(%rbp)
	jmp	.L168
.L160:
	movb	$0, 113(%rbp)
	movb	$0, 116(%rbp)
.L168:
	movl	glob_vk_space(%rip), %edx
	movl	glob_vk_enter(%rip), %eax
	orl	%edx, %eax
	testl	%eax, %eax
	je	.L169
	movl	$0, 66200(%rbp)
.L169:
	movl	96(%rbp), %eax
	movl	%eax, 104(%rbp)
	movl	100(%rbp), %eax
	movl	%eax, 108(%rbp)
	movl	$0, %edx
	movq	66072(%rbp), %rax
	movq	%rax, %rcx
	call	draw_clear
	movl	$16777215, %edx
	movq	66072(%rbp), %rax
	movq	%rax, %rcx
	call	draw_set_color
	movl	$33023, %edx
	movl	66132(%rbp), %ecx
	movq	66072(%rbp), %rax
	movl	%edx, 40(%rsp)
	movl	66136(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%ecx, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$8388863, %ecx
	movl	66140(%rbp), %eax
	subl	66132(%rbp), %eax
	movl	%eax, %r8d
	movl	66132(%rbp), %edx
	movq	66072(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	66136(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	$33023, %edx
	movl	66140(%rbp), %eax
	subl	66132(%rbp), %eax
	movl	66140(%rbp), %r8d
	movq	66072(%rbp), %rcx
	movl	%edx, 40(%rsp)
	movl	66136(%rbp), %edx
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	$0, %r8d
	movl	%eax, %edx
	call	draw_rectangle_color
	movl	$0, 65900(%rbp)
	movl	$0, 65896(%rbp)
	cmpl	$0, 66200(%rbp)
	jne	.L170
	movl	66096(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66100(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	65896(%rbp), %r10d
	movl	65900(%rbp), %edx
	movq	66072(%rbp), %rax
	movl	65976(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	65980(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	leaq	.LC36(%rip), %r8
	movq	%r8, 48(%rsp)
	movq	65984(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L170:
	movl	66116(%rbp), %eax
	movl	%eax, 65900(%rbp)
	movl	$0, 65896(%rbp)
	cmpl	$0, 66200(%rbp)
	jne	.L171
	movq	%rsp, %rax
	movq	%rax, %rdi
	leaq	.LC37(%rip), %rax
	movq	%rax, 65888(%rbp)
	movq	65888(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 65880(%rbp)
	movq	%rax, %r12
	movl	$0, %r13d
	movq	%rax, %r14
	movl	$0, %r15d
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	80(%rsp), %rax
	addq	$0, %rax
	movq	%rax, 65872(%rbp)
	movq	65888(%rbp), %rdx
	movq	65872(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	movl	66208(%rbp), %eax
	movb	%al, 65871(%rbp)
	movzbl	65871(%rbp), %eax
	movl	$41, %edx
	mulb	%dl
	shrw	$8, %ax
	movl	%eax, %ecx
	shrb	$4, %cl
	movl	$-51, %edx
	movl	%edx, %eax
	mulb	%cl
	shrw	$8, %ax
	movl	%eax, %edx
	shrb	$3, %dl
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	48(%rdx), %ebx
	movq	65872(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC38(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65872(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65871(%rbp), %eax
	movl	$-51, %edx
	mulb	%dl
	shrw	$8, %ax
	movl	%eax, %ecx
	shrb	$3, %cl
	movl	$-51, %edx
	movl	%edx, %eax
	mulb	%cl
	shrw	$8, %ax
	movl	%eax, %edx
	shrb	$3, %dl
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	48(%rdx), %ebx
	movq	65872(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC39(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65872(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movzbl	65871(%rbp), %ecx
	movl	$-51, %edx
	movl	%edx, %eax
	mulb	%cl
	shrw	$8, %ax
	movl	%eax, %edx
	shrb	$3, %dl
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	48(%rdx), %ebx
	movq	65872(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC40(%rip), %rax
	movq	%rax, %rcx
	call	string_pos
	movl	%ebx, %ecx
	movq	65872(%rbp), %rdx
	cltq
	movb	%cl, (%rdx,%rax)
	movl	66096(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66100(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	65896(%rbp), %r10d
	movl	65900(%rbp), %edx
	movq	66072(%rbp), %rax
	movl	65976(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	65980(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	65872(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	65984(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
	movq	%rdi, %rsp
.L171:
	movl	$0, 66192(%rbp)
	jmp	.L172
.L181:
	movl	$0, 66188(%rbp)
	jmp	.L173
.L180:
	movl	66192(%rbp), %eax
	imull	66108(%rbp), %eax
	movl	66188(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65828(%rbp)
	movl	66188(%rbp), %eax
	imull	66100(%rbp), %eax
	imull	66104(%rbp), %eax
	movl	66132(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65824(%rbp)
	movl	66192(%rbp), %eax
	imull	66096(%rbp), %eax
	imull	66104(%rbp), %eax
	movl	66128(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65820(%rbp)
	movl	66188(%rbp), %eax
	addl	$1, %eax
	imull	66100(%rbp), %eax
	imull	66104(%rbp), %eax
	movl	66132(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65816(%rbp)
	movl	66192(%rbp), %eax
	addl	$1, %eax
	imull	66096(%rbp), %eax
	imull	66104(%rbp), %eax
	movl	66128(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65812(%rbp)
	movl	$16711680, %r9d
	movl	$65280, %r8d
	movl	$255, %r10d
	movl	65828(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$1431655766, %rax, %rax
	shrq	$32, %rax
	movl	%ecx, %edx
	sarl	$31, %edx
	subl	%edx, %eax
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%r10d, %edx
	movl	%eax, %ecx
	call	mux_int
	movl	%eax, 65808(%rbp)
	movl	65816(%rbp), %r9d
	movl	65820(%rbp), %r8d
	movl	65824(%rbp), %edx
	movq	66072(%rbp), %rax
	movl	65808(%rbp), %ecx
	movl	%ecx, 40(%rsp)
	movl	65812(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_rectangle_color
	movl	65972(%rbp), %eax
	imull	66208(%rbp), %eax
	movl	65828(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, 65804(%rbp)
	movl	65804(%rbp), %eax
	cltq
	movzbl	128(%rbp,%rax), %eax
	movzbl	%al, %eax
	andl	$3, %eax
	movl	%eax, 65800(%rbp)
	cmpl	$3, 65800(%rbp)
	je	.L174
	cmpl	$3, 65800(%rbp)
	jg	.L175
	cmpl	$2, 65800(%rbp)
	je	.L176
	cmpl	$2, 65800(%rbp)
	jg	.L175
	cmpl	$0, 65800(%rbp)
	je	.L177
	cmpl	$1, 65800(%rbp)
	je	.L178
	jmp	.L175
.L177:
	movq	66024(%rbp), %rax
	movq	%rax, 66176(%rbp)
	jmp	.L179
.L178:
	movq	66016(%rbp), %rax
	movq	%rax, 66176(%rbp)
	jmp	.L179
.L176:
	movq	66008(%rbp), %rax
	movq	%rax, 66176(%rbp)
	jmp	.L179
.L174:
	movq	66000(%rbp), %rax
	movq	%rax, 66176(%rbp)
	jmp	.L179
.L175:
	movq	66024(%rbp), %rax
	movq	%rax, 66176(%rbp)
	leaq	.LC41(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
.L179:
	movl	65816(%rbp), %r9d
	movl	65820(%rbp), %r8d
	movl	65824(%rbp), %edx
	movq	66072(%rbp), %rax
	movq	66176(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	65812(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	addl	$1, 66188(%rbp)
.L173:
	movl	66188(%rbp), %eax
	cmpl	66108(%rbp), %eax
	jl	.L180
	addl	$1, 66192(%rbp)
.L172:
	movl	66192(%rbp), %eax
	cmpl	66108(%rbp), %eax
	jl	.L181
	movl	66104(%rbp), %eax
	movl	%eax, 65864(%rbp)
	movzbl	112(%rbp), %eax
	movzbl	%al, %eax
	imull	65864(%rbp), %eax
	movl	%eax, %edx
	movzbl	117(%rbp), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movzbl	116(%rbp), %eax
	movzbl	%al, %eax
	imull	65864(%rbp), %eax
	leal	(%rdx,%rax), %r8d
	movl	100(%rbp), %edx
	movl	65864(%rbp), %eax
	imull	66096(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	96(%rbp), %edx
	movl	65864(%rbp), %eax
	imull	66100(%rbp), %eax
	leal	(%rdx,%rax), %r11d
	movl	100(%rbp), %r10d
	movl	96(%rbp), %edx
	movq	66072(%rbp), %rax
	movl	65864(%rbp), %r9d
	movl	%r9d, 72(%rsp)
	movl	65864(%rbp), %r9d
	movl	%r9d, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movq	65992(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r11d, %r9d
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_image_part
	movl	$0, 66172(%rbp)
	jmp	.L182
.L186:
	movq	waterParticles(%rip), %rdx
	movl	66172(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L183
	movq	waterParticles(%rip), %rdx
	movl	66172(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movq	waterParticles(%rip), %rdx
	movl	66172(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	8(%rax), %xmm0
	movq	waterParticles(%rip), %rdx
	movl	66172(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	movq	waterParticles(%rip), %rdx
	movl	66172(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	66136(%rbp), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L183
	call	rand
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1374389535, %rax, %rax
	shrq	$32, %rax
	sarl	$5, %eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	imull	$100, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cmpl	$4, %eax
	jg	.L185
	movq	waterParticles(%rip), %rdx
	movl	66172(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
	jmp	.L183
.L185:
	movl	66136(%rbp), %ecx
	movl	66140(%rbp), %edx
	movl	66172(%rbp), %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	createWaterParticle
.L183:
	addl	$1, 66172(%rbp)
.L182:
	movl	$100, %eax
	cmpl	%eax, 66172(%rbp)
	jl	.L186
	movl	$0, 66168(%rbp)
	jmp	.L187
.L189:
	movq	waterParticles(%rip), %rdx
	movl	66168(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	je	.L188
	movq	waterParticles(%rip), %rdx
	movl	66168(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movss	.LC42(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %edx
	movq	waterParticles(%rip), %rcx
	movl	66168(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	.LC43(%rip), %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %r9d
	movq	waterParticles(%rip), %rcx
	movl	66168(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	4(%rax), %xmm0
	cvttss2sil	%xmm0, %r10d
	movq	waterParticles(%rip), %rcx
	movl	66168(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	cvttss2sil	%xmm0, %eax
	movq	66072(%rbp), %rcx
	movq	66008(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%r10d, %r8d
	movl	%eax, %edx
	call	draw_image
.L188:
	addl	$1, 66168(%rbp)
.L187:
	movl	$100, %eax
	cmpl	%eax, 66168(%rbp)
	jl	.L189
	cmpl	$0, 66200(%rbp)
	je	.L190
	movl	66116(%rbp), %r9d
	movl	66128(%rbp), %r8d
	movl	66132(%rbp), %edx
	movq	66072(%rbp), %rax
	movq	65936(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movl	66112(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	draw_image
	movl	66096(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %ecx
	movl	66100(%rbp), %eax
	leal	0(,%rax,8), %r9d
	movl	66128(%rbp), %r10d
	movl	66132(%rbp), %edx
	movq	66072(%rbp), %rax
	movl	65976(%rbp), %r8d
	movl	%r8d, 64(%rsp)
	movl	65980(%rbp), %r8d
	movl	%r8d, 56(%rsp)
	movq	65928(%rbp), %r8
	movq	%r8, 48(%rsp)
	movq	65984(%rbp), %r8
	movq	%r8, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	draw_text
.L190:
	cmpl	$0, 66216(%rbp)
	jle	.L191
	movq	66072(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$255, %r9d
	movl	$255, %r8d
	movl	$255, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	leaq	65696(%rbp), %rax
	movq	66072(%rbp), %rcx
	movq	%rax, %rdx
	call	SDL_RenderFillRect
	movl	$0, -20(%rbp)
	movb	$-1, -20(%rbp)
	movl	-20(%rbp), %ecx
	movq	66048(%rbp), %rdx
	movq	66040(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	TTF_RenderText_Solid
	movq	%rax, 65856(%rbp)
	movq	65856(%rbp), %rdx
	movq	66072(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65848(%rbp)
	movl	65696(%rbp), %ecx
	movl	65704(%rbp), %r8d
	movq	65856(%rbp), %rax
	movl	16(%rax), %edx
	movl	%r8d, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ecx, %eax
	movl	%eax, -48(%rbp)
	movl	65700(%rbp), %ecx
	movl	65708(%rbp), %r8d
	movq	65856(%rbp), %rax
	movl	20(%rax), %edx
	movl	%r8d, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%ecx, %eax
	movl	%eax, -44(%rbp)
	movq	65856(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -40(%rbp)
	movq	65856(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -36(%rbp)
	leaq	-48(%rbp), %rcx
	movq	65848(%rbp), %rdx
	movq	66072(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	65856(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65848(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
.L191:
	movq	66072(%rbp), %rax
	movl	$255, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	SDL_SetRenderDrawColor
	movl	66212(%rbp), %edx
	movq	%rbp, %rax
	movl	%edx, %r9d
	leaq	.LC44(%rip), %r8
	movl	$20, %edx
	movq	%rax, %rcx
	call	snprintf
	movl	65676(%rbp), %edx
	movq	%rbp, %rax
	movq	66040(%rbp), %rcx
	movl	%edx, %r8d
	movq	%rax, %rdx
	call	TTF_RenderText_Solid
	movq	%rax, 65840(%rbp)
	movq	65840(%rbp), %rdx
	movq	66072(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_CreateTextureFromSurface
	movq	%rax, 65832(%rbp)
	movl	$10, -16(%rbp)
	movl	$720, -12(%rbp)
	movq	65840(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -8(%rbp)
	movq	65840(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -4(%rbp)
	leaq	-16(%rbp), %rcx
	movq	65832(%rbp), %rdx
	movq	66072(%rbp), %rax
	movq	%rcx, %r9
	movl	$0, %r8d
	movq	%rax, %rcx
	call	SDL_RenderCopy
	movq	65840(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeSurface
	movq	65832(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66072(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_RenderPresent
	movl	$16, %ecx
	call	SDL_Delay
.L115:
	cmpl	$0, 66196(%rbp)
	jne	.L116
	leaq	.LC45(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movq	waterParticles(%rip), %rax
	movq	%rax, %rcx
	call	free
	movq	66040(%rbp), %rax
	movq	%rax, %rcx
	call	TTF_CloseFont
	movq	66024(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66016(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66008(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	66000(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65992(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65936(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	movq	65984(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyTexture
	call	IMG_Quit
	movl	65948(%rbp), %eax
	movl	%eax, %ecx
	call	SDL_CloseAudioDevice
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_FreeWAV
	movq	66072(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyRenderer
	movq	66080(%rbp), %rax
	movq	%rax, %rcx
	call	SDL_DestroyWindow
	call	SDL_Quit
	movl	$500, %ecx
	call	SDL_Delay
	movl	$0, %eax
	jmp	.L99
.L104:
	call	SDL_GetError
	movq	%rax, %rbx
	movl	$2, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	66144(%rbp), %rax
	movq	%rbx, %r9
	movq	%rax, %r8
	leaq	.LC46(%rip), %rax
	movq	%rax, %rdx
	call	fprintf
	call	SDL_Quit
	movl	$1, %ecx
	call	exit
.L99:
	movq	%rsi, %rsp
	jmp	.L97
.L113:
	movq	%rsi, %rsp
.L97:
	leaq	66232(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1080459264
	.align 8
.LC2:
	.long	1413754136
	.long	1074340347
	.align 4
.LC9:
	.long	1092616192
	.align 4
.LC42:
	.long	1097859072
	.align 4
.LC43:
	.long	1084227584
	.ident	"GCC: (x86_64-posix-seh-rev2, Built by MinGW-W64 project) 12.2.0"
	.def	SDL_FillRect;	.scl	2;	.type	32;	.endef
	.def	SDL_GetError;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_Quit;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	SDL_SetRenderDrawColor;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderClear;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderFillRect;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderCopy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	SDL_GetTicks;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	SDL_memcpy;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	SDL_Init;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateWindow;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_GetWindowSurface;	.scl	2;	.type	32;	.endef
	.def	TTF_Init;	.scl	2;	.type	32;	.endef
	.def	TTF_OpenFont;	.scl	2;	.type	32;	.endef
	.def	IMG_Init;	.scl	2;	.type	32;	.endef
	.def	IMG_LoadTexture;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	SDL_RWFromFile;	.scl	2;	.type	32;	.endef
	.def	SDL_LoadWAV_RW;	.scl	2;	.type	32;	.endef
	.def	SDL_OpenAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_FreeWAV;	.scl	2;	.type	32;	.endef
	.def	SDL_QueueAudio;	.scl	2;	.type	32;	.endef
	.def	SDL_PauseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_PollEvent;	.scl	2;	.type	32;	.endef
	.def	sqrt;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	TTF_RenderText_Solid;	.scl	2;	.type	32;	.endef
	.def	SDL_CreateTextureFromSurface;	.scl	2;	.type	32;	.endef
	.def	SDL_FreeSurface;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyTexture;	.scl	2;	.type	32;	.endef
	.def	SDL_RenderPresent;	.scl	2;	.type	32;	.endef
	.def	SDL_Delay;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	TTF_CloseFont;	.scl	2;	.type	32;	.endef
	.def	IMG_Quit;	.scl	2;	.type	32;	.endef
	.def	SDL_CloseAudioDevice;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyRenderer;	.scl	2;	.type	32;	.endef
	.def	SDL_DestroyWindow;	.scl	2;	.type	32;	.endef
