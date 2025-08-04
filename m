Return-Path: <linux-media+bounces-38871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5FB1AA06
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 22:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CFAE180307
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 20:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB0F218EA2;
	Mon,  4 Aug 2025 20:22:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B74128E3F
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754338951; cv=none; b=JX2aZJWb45FVbIdLpO772oq/Ew0i3hxA4LkPcsJ/LpxdU6DflJ3oJifF6MtpQeoY4rzeIxrbrWxgog0XVhzuQCWbDLeL9UAGQabCvO3J2SbMe+tpmZhZsJEsQlrQBajQB2Vy/7pNQUwVblGAZt/i7KegcHoB7b1cMYVVTOYhLsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754338951; c=relaxed/simple;
	bh=EQZkrcHwBiIAideA7Cm2rrBxjQcXYJZlvoo/WmBoBcg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=acRwo+/pJHVATYiGT41kTqZ7T1bxFOeKZJ59qM90b6w9XAGcfYldCw+d4OoRjIcklQ5LhuWKMi+wUV2DUL3+13P+YHpyRKRDZ6js6prcoqXURJmuPzzQCr/rmlQ/jnB9uwARo0af14LNix/vlAztgHjN6jposrV5TlUt9Gqj8xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1DE2C33FECD;
	Mon, 04 Aug 2025 20:22:27 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Sean Young <sean@mess.org>
Cc: James Le Cuirot <chewi@gentoo.org>,  linux-media@vger.kernel.org
Subject: Re: [PATCH] meson: Allow BPF code to be built with GCC
In-Reply-To: <aJB5rmwRfiYv7sJb@gofer.mess.org>
Organization: Gentoo
References: <20250803081759.13952-1-chewi@gentoo.org>
	<aJB5rmwRfiYv7sJb@gofer.mess.org>
User-Agent: mu4e 1.12.12; emacs 31.0.50
Date: Mon, 04 Aug 2025 21:22:25 +0100
Message-ID: <87v7n2q1ku.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sean Young <sean@mess.org> writes:

> On Sun, Aug 03, 2025 at 09:17:59AM +0100, James Le Cuirot wrote:
>> GCC can also target BPF, but it does not understand the "-target bpf"
>> arguments passed to Clang.
>> 
>> Detect it as either bpf-gcc, bpf-none-gcc, or bpf-unknown-none-gcc, the
>> same as systemd does.
>
> Thank you for the patch, I had not looked into this yet.
>
>> Determine the include paths with the compiler used by the rest of the
>> build rather than Clang, which might not be installed or might not give
>> the right answer, especially when cross-compiling.
>
> Fair enough.
>  
>> Check whether Clang actually supports the BPF target so that
>> auto-detection doesn't cause the build to fail when it doesn't.
>
> clang has supported BPF for a really long time. We've never bothered to
> test whether clang supports BPF before and I've never seen this be a
> problem; why introduce this test?

Clang takes a long time to build and you don't actually have to enable
all targets.

>
>> Disclaimer: I haven't actually tested the result of the GCC build.
>
> Let me test this.
>
> I do wonder why you default to bpf-gcc rather than clang. Any particular
> reason?

Clang *tends* to have BPF as a target (just not always), so having the
less common option > the more common one means the less common one can
be used.

i.e. if Clang was first, even if you have a cross BPF toolchain w/ GCC,
you probably can't then use the GCC path. But maybe it should be an
option instead.

>
> Thanks,
>
> Sean
>
>> 
>> Signed-off-by: James Le Cuirot <chewi@gentoo.org>
>> ---
>>  meson.build                                   | 23 ++++++++++++++++++-
>>  .../keytable/bpf_protocols/cc_sys_includes.sh | 10 ++++++++
>>  .../bpf_protocols/clang_sys_includes.sh       |  9 --------
>>  utils/keytable/bpf_protocols/meson.build      | 12 +++++-----
>>  utils/keytable/meson.build                    |  2 +-
>>  5 files changed, 39 insertions(+), 17 deletions(-)
>>  create mode 100755 utils/keytable/bpf_protocols/cc_sys_includes.sh
>>  delete mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
>> 
>> diff --git a/meson.build b/meson.build
>> index 88781e59..0aff6970 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -83,11 +83,32 @@ endif
>>  v4l2_utils_incdir = include_directories(v4l2_utils_incdir_arr)
>>  
>>  prog_bash = find_program('bash')
>> -prog_clang = find_program('clang', required : get_option('bpf'))
>>  prog_doxygen = find_program('doxygen', required : get_option('doxygen-doc'))
>>  prog_grep = find_program('grep')
>>  prog_perl = find_program('perl')
>>  
>> +if get_option('bpf').allowed()
>> +    bpf_args = []
>> +    prog_bpf = find_program('bpf-gcc',
>> +                            'bpf-none-gcc',
>> +                            'bpf-unknown-none-gcc',
>> +                            required : false)
>> +
>> +    if not prog_bpf.found()
>> +        prog_bpf = find_program('clang', required : get_option('bpf'))
>> +        if prog_bpf.found()
>> +            target_bpf = run_command(prog_bpf, '-target', 'bpf', '--print-supported-cpus', check : get_option('bpf').enabled())
>> +            if target_bpf.returncode() == 0
>> +                bpf_args += ['-target', 'bpf']
>> +            else
>> +                prog_bpf = disabler()
>> +            endif
>> +        endif
>> +    endif
>> +else
>> +    prog_bpf = disabler()
>> +endif
>> +
>>  dep_alsa = dependency('alsa', required : false)
>>  if dep_alsa.found()
>>      conf.set('HAVE_ALSA', 1)
>> diff --git a/utils/keytable/bpf_protocols/cc_sys_includes.sh b/utils/keytable/bpf_protocols/cc_sys_includes.sh
>> new file mode 100755
>> index 00000000..0a8fa277
>> --- /dev/null
>> +++ b/utils/keytable/bpf_protocols/cc_sys_includes.sh
>> @@ -0,0 +1,10 @@
>> +#!/bin/sh
>> +# Get C compiler's default includes on this system, as the BPF toolchain
>> +# generally doesn't see the Linux headers. This fixes "missing" files on some
>> +# architectures/distros, such as asm/byteorder.h, asm/socket.h, asm/sockios.h,
>> +# sys/cdefs.h etc.
>> +#
>> +# Use '-idirafter': Don't interfere with include mechanics except where the
>> +# build would have failed anyways.
>> +"$@" -v -E - </dev/null 2>&1 \
>> +	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }'
>> diff --git a/utils/keytable/bpf_protocols/clang_sys_includes.sh b/utils/keytable/bpf_protocols/clang_sys_includes.sh
>> deleted file mode 100755
>> index 9dc4af12..00000000
>> --- a/utils/keytable/bpf_protocols/clang_sys_includes.sh
>> +++ /dev/null
>> @@ -1,9 +0,0 @@
>> -#!/bin/sh
>> -# Get Clang's default includes on this system, as opposed to those seen by
>> -# '-target bpf'. This fixes "missing" files on some architectures/distros,
>> -# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
>> -#
>> -# Use '-idirafter': Don't interfere with include mechanics except where the
>> -# build would have failed anyways.
>> -$CLANG -v -E - </dev/null 2>&1 \
>> -	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }'
>> diff --git a/utils/keytable/bpf_protocols/meson.build b/utils/keytable/bpf_protocols/meson.build
>> index 1e4f0064..dbb926c4 100644
>> --- a/utils/keytable/bpf_protocols/meson.build
>> +++ b/utils/keytable/bpf_protocols/meson.build
>> @@ -10,9 +10,9 @@ bpf_protocols_files = [
>>      'xbox-dvd',
>>  ]
>>  
>> -clang_sys_includes = run_command('clang_sys_includes.sh',
>> -                                 check : true,
>> -                                 env : ['CLANG=' + prog_clang.full_path()])
>> +bpf_args += run_command('cc_sys_includes.sh',
>> +                        cc.cmd_array(),
>> +                        check : true).stdout().split()
>>  
>>  foreach file : bpf_protocols_files
>>      output = file + '.o'
>> @@ -21,9 +21,9 @@ foreach file : bpf_protocols_files
>>                    output : output,
>>                    input : input,
>>                    command : [
>> -                      prog_clang,
>> -                      clang_sys_includes.stdout().split(),
>> -                      '-D__linux__', '-fno-stack-protector', '-target', 'bpf',
>> +                      prog_bpf,
>> +                      bpf_args,
>> +                      '-D__linux__', '-fno-stack-protector',
>>                        '-O2', '-c', '@INPUT@', '-o', '@OUTPUT@',
>>                    ],
>>                    install : true,
>> diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
>> index e214e0b5..56e61a79 100644
>> --- a/utils/keytable/meson.build
>> +++ b/utils/keytable/meson.build
>> @@ -22,7 +22,7 @@ ir_keytable_c_args = [
>>      '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
>>  ]
>>  
>> -ir_bpf_enabled = prog_clang.found() and dep_libbpf.found() and dep_libelf.found()
>> +ir_bpf_enabled = prog_bpf.found() and dep_libbpf.found() and dep_libelf.found()
>>  
>>  if ir_bpf_enabled
>>      ir_keytable_sources += files(
>> -- 
>> 2.50.1
>> 

