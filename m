Return-Path: <linux-media+bounces-4941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD86850159
	for <lists+linux-media@lfdr.de>; Sat, 10 Feb 2024 01:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2DD51C23607
	for <lists+linux-media@lfdr.de>; Sat, 10 Feb 2024 00:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9251FC8;
	Sat, 10 Feb 2024 00:52:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD271FB3
	for <linux-media@vger.kernel.org>; Sat, 10 Feb 2024 00:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707526331; cv=none; b=XrOH9nC7VfxMxabKYiNB/Ix31SM/02/6QGp4YUXppbJkAUuaK0PpbNnSly22Lzj+6oIoIEWF3O7MUwhm3HPe/rIIyJ5KLLU11BiRok07jBbgBSg7ryAo7INA90+cKDq4ozLEbglc6Tdx4UNl6wOzfxi3dGZGGearh5l9Umb+f3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707526331; c=relaxed/simple;
	bh=9OTd0JvM2sGObTGG+NsLF0iph8y2C0ZsBcSTrNWRl8s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbrV68S2JYkO7EygQSeiG8p2rRaOGTdrn6WEpuNk62Lwv0d+eva1ifgqSX656U3hvksdeBai/zq2iNE6RtV56oSRlAZNtwYVXn8RFR4sqBDCXsYpgNy0XK4adDKwLJIW6TViKMm7w12fdiwWTQnUalVSvUx5fwwTV/arp5NAV88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 8111672C8F5;
	Sat, 10 Feb 2024 03:52:07 +0300 (MSK)
Received: from pony.office.basealt.ru (unknown [193.43.10.9])
	by imap.altlinux.org (Postfix) with ESMTPSA id 7939736D0246;
	Sat, 10 Feb 2024 03:52:07 +0300 (MSK)
Received: by pony.office.basealt.ru (Postfix, from userid 500)
	id 46081360AE77; Sat, 10 Feb 2024 03:52:07 +0300 (MSK)
Date: Sat, 10 Feb 2024 03:52:07 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Andrew Randrianasulu <randrianasulu@gmail.com>, 
	linux-media@vger.kernel.org, Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
	Anton Sviridenko <anton@corp.bluecherry.net>, Andrey Utkin <andrey_utkin@fastmail.com>, 
	Ismael Luceno <ismael@iodev.co.uk>
Subject: Re: drivers/media/pci/solo6x10 fails to crosscompile from 32-bit gcc
Message-ID: <2mjaw7rmys573bydbxxjjnzmi4jytzy7fraitxiihvap4ykag3@hzerk45ysaif>
References: <CA+rFky47GhkLBCis+ZmP_e+2MjNXt6oukqBhCf=qBGySxiGAJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+rFky47GhkLBCis+ZmP_e+2MjNXt6oukqBhCf=qBGySxiGAJA@mail.gmail.com>

On Thu, Nov 09, 2023 at 09:36:02PM +0300, Andrew Randrianasulu wrote:
> ===
> 
> make ARCH=x86_64 CROSS_COMPILE=x86_64-unknown-linux-gnu- -j8
> mkdir -p /dev/shm/linux-2.6/tools/objtool && make O=/dev/shm/linux-2.6
> subdir=tools/objtool --no-print-directory -C objtool
>   INSTALL libsubcmd_headers
>   CALL    scripts/checksyscalls.sh
>   CC [M]  drivers/media/pci/solo6x10/solo6x10-p2m.o
>   CHK     kernel/kheaders_data.tar.xz
>   CC [M]  drivers/media/pci/solo6x10/solo6x10-enc.o
> 
> cc1: out of memory allocating 301930784 bytes after a total of 149139456 bytes

We got the same error since v6.6.16 on 32-bit architectures (i586 and armv7hf),
native compilation with gcc 13.2.1. With the same toolchain on Linux v6.6.15
solo6x10-p2m.c compiles quickly and w/o problems.

Thanks,

ps. Compile log excerpt:

[i586]    gcc-13 -Wp,-MMD,drivers/media/pci/solo6x10/.solo6x10-p2m.o.d -nostdinc -I./arch/x86/include -I./arch/x86/include/generated  -I./include
-I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include
./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=./= -std=gnu11 -fshort-wchar -funsigned-char -fno-common
-fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=none -m32 -msoft-float -mregparm=3 -freg-struct-return -fno-pic
-mpreferred-stack-boundary=2 -march=i686 -Wa,-mtune=generic32 -ffreestanding -mstack-protector-guard-reg=fs -mstack-protector-guard-symbol=__stack_chk_guard
-Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -fno-jump-tables
-fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-calls
-fno-stack-clash-protection -fzero-call-used-regs=used-gpr -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -falign-functions=4 -fstrict-flex-arrays=3
-fno-strict-overflow -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type
-Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wframe-larger-than=2048 -Wno-main
-Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-dangling-pointer -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds
-Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion
-Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-restrict -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation
-Wno-stringop-overflow -Wno-stringop-truncation -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized
-Wno-sign-compare -g  -DMODULE  -DKBUILD_BASENAME='"solo6x10_p2m"' -DKBUILD_MODNAME='"solo6x10"' -D__KBUILD_MODNAME=kmod_solo6x10 -c -o
drivers/media/pci/solo6x10/solo6x10-p2m.o drivers/media/pci/solo6x10/solo6x10-p2m.c
[i586] cc1: out of memory allocating 135266296 bytes after a total of 235556864 bytes

> make[6]: *** [scripts/Makefile.build:243:
> drivers/media/pci/solo6x10/solo6x10-p2m.o] Ошибка 1
> make[6]: *** Ожидание завершения заданий…
> virtual memory exhausted: Невозможно выделить память
> make[6]: *** [scripts/Makefile.build:243:
> drivers/media/pci/solo6x10/solo6x10-enc.o] Ошибка 1
> make[5]: *** [scripts/Makefile.build:480: drivers/media/pci/solo6x10] Ошибка 2
> make[4]: *** [scripts/Makefile.build:480: drivers/media/pci] Ошибка 2
> make[3]: *** [scripts/Makefile.build:480: drivers/media] Ошибка 2
> make[2]: *** [scripts/Makefile.build:480: drivers] Ошибка 2
> make[1]: *** [/dev/shm/linux-2.6/Makefile:1911: .] Ошибка 2
> make: *** [Makefile:234: __sub-make] Ошибка 2
> 
> ===
> 
> kernel git 6bc986ab839c844e78a2333a02e55f02c9e57935
> 
> cross-gcc
> 
> x86_64-unknown-linux-gnu-gcc --version
> x86_64-unknown-linux-gnu-gcc (GCC) 11.4.0
> 
> cmd line
> 
> make ARCH=x86_64 CROSS_COMPILE=x86_64-unknown-linux-gnu- -j8
> 
> for now I think I'll just disable this driver

