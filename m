Return-Path: <linux-media+bounces-38822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88559B19EB3
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 11:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 176F6189AA23
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 09:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DDA24500A;
	Mon,  4 Aug 2025 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="arM02J4u"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A2BE55B
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754299394; cv=none; b=EW3O9FA5mN8qSZLIEppQqESDJy52iR5LPIP3XhaNfGpjiuIxdeY9Rs3XznfFUa78lfQ5P0NhCJWbZpFUQE7WEd4WYJudz+JkA6CbKv47CJLAKVdrY/CIQJgVql++I97qAdq7DYph8azvFBpVNhCnpRHFkgkvsgUYj3j9+X8Du0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754299394; c=relaxed/simple;
	bh=01E726RWTq4C2iczchTrqN9s7aL2C8zc5dRL6MTT4vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5PaYX1vF2U90Jx9RPqYtCCcKkom8cLJHH/Zory6GFJ7dF6nW9NbPWH8rAI7B6jdHsdc7dUOtfQSWwxEt7ZtMB+BzOylEpCW5SC5xIhFY77g1ZKsWsd39zV5DHgx9N9hSeMxmQuxUk4KPNHgwxmo/qSStJBHPvUVgjus7pPWoqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=arM02J4u; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1754298798; bh=01E726RWTq4C2iczchTrqN9s7aL2C8zc5dRL6MTT4vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arM02J4uvqwBwPMN2uqItQuno1GFM3jNBnsgo9nH0IJpc/RvIFrllIyfuN3juVgCr
	 ATM666eqxHgk/VzX2tXmDH4NHexaMRcKCkpPTFYJMIme8XVjkP+krvouAGeLF/5ZXa
	 eyn3c+a7fP6R95EDumUw8bMULdrXsTIc5WcQ5yGg9OI2AwsQf+9uYrmHLODCdoTuqw
	 Zbt5L5/QutSnapJjpHR5DOlO91xdwx0p0bDNUZDl6R5VDkJ1+QMkJFeYSHdz9rUt3C
	 BWrK6F4LZw5g8q7yTtFyV5mzBowE6wZdrBq5rS8kF3RrxaMowMAXoTZzMAgN6BYcZs
	 3Qlmj7sDWOALQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 5C670100090; Mon,  4 Aug 2025 10:13:18 +0100 (BST)
Date: Mon, 4 Aug 2025 10:13:18 +0100
From: Sean Young <sean@mess.org>
To: James Le Cuirot <chewi@gentoo.org>
Cc: linux-media@vger.kernel.org, Sam James <sam@gentoo.org>
Subject: Re: [PATCH] meson: Allow BPF code to be built with GCC
Message-ID: <aJB5rmwRfiYv7sJb@gofer.mess.org>
References: <20250803081759.13952-1-chewi@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803081759.13952-1-chewi@gentoo.org>

On Sun, Aug 03, 2025 at 09:17:59AM +0100, James Le Cuirot wrote:
> GCC can also target BPF, but it does not understand the "-target bpf"
> arguments passed to Clang.
> 
> Detect it as either bpf-gcc, bpf-none-gcc, or bpf-unknown-none-gcc, the
> same as systemd does.

Thank you for the patch, I had not looked into this yet.

> Determine the include paths with the compiler used by the rest of the
> build rather than Clang, which might not be installed or might not give
> the right answer, especially when cross-compiling.

Fair enough.
 
> Check whether Clang actually supports the BPF target so that
> auto-detection doesn't cause the build to fail when it doesn't.

clang has supported BPF for a really long time. We've never bothered to
test whether clang supports BPF before and I've never seen this be a
problem; why introduce this test?

> Disclaimer: I haven't actually tested the result of the GCC build.

Let me test this.

I do wonder why you default to bpf-gcc rather than clang. Any particular
reason?

Thanks,

Sean

> 
> Signed-off-by: James Le Cuirot <chewi@gentoo.org>
> ---
>  meson.build                                   | 23 ++++++++++++++++++-
>  .../keytable/bpf_protocols/cc_sys_includes.sh | 10 ++++++++
>  .../bpf_protocols/clang_sys_includes.sh       |  9 --------
>  utils/keytable/bpf_protocols/meson.build      | 12 +++++-----
>  utils/keytable/meson.build                    |  2 +-
>  5 files changed, 39 insertions(+), 17 deletions(-)
>  create mode 100755 utils/keytable/bpf_protocols/cc_sys_includes.sh
>  delete mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
> 
> diff --git a/meson.build b/meson.build
> index 88781e59..0aff6970 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -83,11 +83,32 @@ endif
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
> +    if not prog_bpf.found()
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
> 

