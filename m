Return-Path: <linux-media+bounces-39600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC14B2297D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF49A581221
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551222857C7;
	Tue, 12 Aug 2025 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="RSGybRpm"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0912280CD3
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006514; cv=none; b=Lm56lwL0NAig18VNB73lbO6/8O5coRRMk5Q6rbiDxgYIFhwDy51tuYcb0q6gD55Xjy/xY7LdvsiZlYCE0py+3PdFDXnQOU4Nhy70rBeZVowcDBpi0SBSWWIFRlIXhHLV7QDNYjAri2HULImH9Z2Ty3tAeVtPEOvmGOGImT8TMro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006514; c=relaxed/simple;
	bh=RB5Dyg0hpUogRLPTKLCdqKUFcrsgH6zQi3Vr17ro+OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z51GOI6tf++RrxZvPW4pSoo2cUurB9m9QsICM3BtQvDweejJ/RkTT1OPjTjAHqTnqqvnhnlzQ14y8ACx7Jje/FtaoGWVQmhu6Go1Si0i0vpftgdl99cwfLLJS5GGv3KNVDXY/5VxdAhwxGo2EKmyjz1gwZeFU0kpt1HUMFdZ4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=RSGybRpm; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1755006510; bh=RB5Dyg0hpUogRLPTKLCdqKUFcrsgH6zQi3Vr17ro+OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSGybRpm6FQtu1n7N3OqMip9IS+zICbiMQu6hWzbBW9Y3GAoVbKsIg6wsM3btVZiF
	 p7/01wYMSiNy2rBaPV8ht/TyHnr4Lx0V3+v6waxC2wNzYmTPbEzCbjRp8iCztZqfLT
	 OT/isVRcWwEOl5g74ahU1sRQZMf4dsSbOwo2AzSFrUlI4FrQRJ+uTcMPi8A5xp6xry
	 iMaRGgvw3dez5mWiAnoOVuqOJbMGQbcyaW4eJ6y7GGihOdWJf+7M5qTdt60CIpt5YK
	 pR6lj10D1JInK3uCaku1agKsqSZ0pMKiJKOi3WFR82UJPT3ZJpSk5mHuqcck8jX9R6
	 qb/g14TAitvug==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id BD89F1000D4; Tue, 12 Aug 2025 14:48:30 +0100 (BST)
Date: Tue, 12 Aug 2025 14:48:30 +0100
From: Sean Young <sean@mess.org>
To: James Le Cuirot <chewi@gentoo.org>
Cc: linux-media@vger.kernel.org, Sam James <sam@gentoo.org>
Subject: Re: [PATCH v2] meson: Allow BPF code to be built with GCC
Message-ID: <aJtGLpNHqsWTX6SY@gofer.mess.org>
References: <20250803081759.13952-1-chewi@gentoo.org>
 <20250810142005.29811-2-chewi@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810142005.29811-2-chewi@gentoo.org>

On Sun, Aug 10, 2025 at 03:20:06PM +0100, James Le Cuirot wrote:
> GCC can also target BPF, but it does not understand the "-target bpf"
> arguments passed to Clang.
> 
> Detect it as either bpf-gcc, bpf-none-gcc, or bpf-unknown-none-gcc, the
> same as systemd does.
> 
> Determine the include paths with the compiler used by the rest of the
> build rather than Clang, which might not be installed or might not give
> the right answer, especially when cross-compiling.
> 
> Check whether Clang actually supports the BPF target so that
> auto-detection doesn't cause the build to fail when it doesn't.
> 
> Signed-off-by: James Le Cuirot <chewi@gentoo.org>

Applied. Thank you very much!

Sean

> ---
>  meson.build                                   | 25 ++++++++++++++++++-
>  .../keytable/bpf_protocols/cc_sys_includes.sh | 10 ++++++++
>  .../bpf_protocols/clang_sys_includes.sh       |  9 -------
>  utils/keytable/bpf_protocols/meson.build      | 12 ++++-----
>  utils/keytable/meson.build                    |  2 +-
>  5 files changed, 41 insertions(+), 17 deletions(-)
>  create mode 100755 utils/keytable/bpf_protocols/cc_sys_includes.sh
>  delete mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
> 
> This revision adds the -ftree-switch-conversion flag for GCC, which
> reportedly fixes the "invalid mem access" error. I couldn't figure out
> how to test without any hardware, so I wasn't able to reproduce the
> issue myself, but I trust that it works now.
> 
> diff --git a/meson.build b/meson.build
> index 88781e59..62d271b4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -83,11 +83,34 @@ endif
>  v4l2_utils_incdir = include_directories(v4l2_utils_incdir_arr)
> 
>  prog_bash = find_program('bash')
> -prog_clang = find_program('clang', required : get_option('bpf'))
>  prog_doxygen = find_program('doxygen', required : get_option('doxygen-doc'))
>  prog_grep = find_program('grep')
>  prog_perl = find_program('perl')
> 
> +if get_option('bpf').allowed()
> +    bpf_args = []
> +    prog_bpf = find_program('bpf-gcc',
> +                            'bpf-none-gcc',
> +                            'bpf-unknown-none-gcc',
> +                            required : false)
> +
> +    if prog_bpf.found()
> +        bpf_args += ['-fno-tree-switch-conversion']
> +    else
> +        prog_bpf = find_program('clang', required : get_option('bpf'))
> +        if prog_bpf.found()
> +            target_bpf = run_command(prog_bpf, '-target', 'bpf', '--print-supported-cpus', check : get_option('bpf').enabled())
> +            if target_bpf.returncode() == 0
> +                bpf_args += ['-target', 'bpf']
> +            else
> +                prog_bpf = disabler()
> +            endif
> +        endif
> +    endif
> +else
> +    prog_bpf = disabler()
> +endif
> +
>  dep_alsa = dependency('alsa', required : false)
>  if dep_alsa.found()
>      conf.set('HAVE_ALSA', 1)
> diff --git a/utils/keytable/bpf_protocols/cc_sys_includes.sh b/utils/keytable/bpf_protocols/cc_sys_includes.sh
> new file mode 100755
> index 00000000..0a8fa277
> --- /dev/null
> +++ b/utils/keytable/bpf_protocols/cc_sys_includes.sh
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +# Get C compiler's default includes on this system, as the BPF toolchain
> +# generally doesn't see the Linux headers. This fixes "missing" files on some
> +# architectures/distros, such as asm/byteorder.h, asm/socket.h, asm/sockios.h,
> +# sys/cdefs.h etc.
> +#
> +# Use '-idirafter': Don't interfere with include mechanics except where the
> +# build would have failed anyways.
> +"$@" -v -E - </dev/null 2>&1 \
> +	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }'
> diff --git a/utils/keytable/bpf_protocols/clang_sys_includes.sh b/utils/keytable/bpf_protocols/clang_sys_includes.sh
> deleted file mode 100755
> index 9dc4af12..00000000
> --- a/utils/keytable/bpf_protocols/clang_sys_includes.sh
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -#!/bin/sh
> -# Get Clang's default includes on this system, as opposed to those seen by
> -# '-target bpf'. This fixes "missing" files on some architectures/distros,
> -# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
> -#
> -# Use '-idirafter': Don't interfere with include mechanics except where the
> -# build would have failed anyways.
> -$CLANG -v -E - </dev/null 2>&1 \
> -	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }'
> diff --git a/utils/keytable/bpf_protocols/meson.build b/utils/keytable/bpf_protocols/meson.build
> index 1e4f0064..dbb926c4 100644
> --- a/utils/keytable/bpf_protocols/meson.build
> +++ b/utils/keytable/bpf_protocols/meson.build
> @@ -10,9 +10,9 @@ bpf_protocols_files = [
>      'xbox-dvd',
>  ]
> 
> -clang_sys_includes = run_command('clang_sys_includes.sh',
> -                                 check : true,
> -                                 env : ['CLANG=' + prog_clang.full_path()])
> +bpf_args += run_command('cc_sys_includes.sh',
> +                        cc.cmd_array(),
> +                        check : true).stdout().split()
> 
>  foreach file : bpf_protocols_files
>      output = file + '.o'
> @@ -21,9 +21,9 @@ foreach file : bpf_protocols_files
>                    output : output,
>                    input : input,
>                    command : [
> -                      prog_clang,
> -                      clang_sys_includes.stdout().split(),
> -                      '-D__linux__', '-fno-stack-protector', '-target', 'bpf',
> +                      prog_bpf,
> +                      bpf_args,
> +                      '-D__linux__', '-fno-stack-protector',
>                        '-O2', '-c', '@INPUT@', '-o', '@OUTPUT@',
>                    ],
>                    install : true,
> diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> index e214e0b5..56e61a79 100644
> --- a/utils/keytable/meson.build
> +++ b/utils/keytable/meson.build
> @@ -22,7 +22,7 @@ ir_keytable_c_args = [
>      '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
>  ]
> 
> -ir_bpf_enabled = prog_clang.found() and dep_libbpf.found() and dep_libelf.found()
> +ir_bpf_enabled = prog_bpf.found() and dep_libbpf.found() and dep_libelf.found()
> 
>  if ir_bpf_enabled
>      ir_keytable_sources += files(
> --
> 2.50.1

