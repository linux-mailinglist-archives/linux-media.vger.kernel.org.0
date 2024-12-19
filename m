Return-Path: <linux-media+bounces-23753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63FB9F71C8
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 02:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5E4D166692
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 01:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E02F7081C;
	Thu, 19 Dec 2024 01:29:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail2.tds.syn-alias.com (mail2.tds.syn-alias.com [129.159.94.43])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3502478F2A
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 01:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.159.94.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571767; cv=none; b=gjfzVWLn2NmZLXHp+KPeSRD8DzstE9ikfox7xdMxU97qTeHy4usDxdUbT5Y08eSPx0Fj5zEGMjIPJNovDkjVJeHYZ6wVToFqpgBbn3w2JLCzbLNckXmdQMweTJEcmWEN9VJyRXpx1gOtQMM3JyzD8qlG8vw6wToK20VAhAbysXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571767; c=relaxed/simple;
	bh=iDUDsj0k7a3Pd3k+pTx01M8tIy4n0Cp7aZ2XkBto/ec=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=MFY1jsPO7UNj/q5eDzVtPFXvm/L2etB1BjRaZC+pv2fxAiQyDwPK9Kh7JRkYsTzY0oQ+z8xeCT2WWnzmeQGdryqjZi0B7djx/Tf1bhBjWF5wEJ6+BMiDUsJ3eoar8ImlL77+UNSNpf/C/9EM3SRU+xlDfbYqONb9hi7is5+3MoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net; spf=pass smtp.mailfrom=chorus.net; arc=none smtp.client-ip=129.159.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chorus.net
X-Authed-Username: ZHVhbmVrQGNob3J1cy5uZXQ=
Received: from [10.219.153.33] ([10.219.153.33:15172] helo=md15.tds.email-ash1.sync.lan)
	by mail.tds.net (envelope-from <duanek@chorus.net>)
	(ecelerity 4.4.1.20033 r(msys-ecelerity:tags/4.4.1.0^0)) with ESMTP
	id AA/92-06351-CE673676; Wed, 18 Dec 2024 20:29:16 -0500
Date: Wed, 18 Dec 2024 20:29:16 -0500 (EST)
From: "duanek@chorus.net" <duanek@chorus.net>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media <linux-media@vger.kernel.org>, 
	libcamera-devel <libcamera-devel@lists.libcamera.org>
Message-ID: <578607689.101572908.1734571756163.JavaMail.zimbra@chorus.net>
In-Reply-To: <06dcddff-84b3-8717-fa56-53d49abcaf5d@linux.intel.com>
References: <1594170563.10937137.1728935697496.JavaMail.zimbra@chorus.net> <1385342589.100511352.1734536762106.JavaMail.zimbra@chorus.net> <45xboahdow6gy7uanhrdsiln3zxcu4xdy7hew3usqtgurf7byj@wl7gvzgtzg5s> <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net> <3csrwld4fbhg7fg7v4dm4fccvxkracxuwj6y7k5z7k7t5zpeha@qfgr6pmzyg6f> <698982370.100647689.1734540932591.JavaMail.zimbra@chorus.net> <4vlmoi3uto44j3cigzatkclqd5krybvihvkq77glwcblpdlrb5@yhdl6dvd2gmj> <06dcddff-84b3-8717-fa56-53d49abcaf5d@linux.intel.com>
Subject: Re: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16"
 Meteor Lake doesn't work
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 9.0.0_GA_4653 (ZimbraWebClient - GC131 (Linux)/9.0.0_GA_4653)
Thread-Topic: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16" Meteor Lake doesn't work
Thread-Index: n2TAVrRvnTOBCZTejJfdpB1gmb8rdQ==
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgeefuddrleelgdefhecutefuodetggdotefrodftvfcurfhrohhf
X-Vade-Analysis-2: ihhlvgemucfujgfpteevqfftpdfvfffupdfgpfggqdfvfffupdfqfgfvnecuuegrihhlohhuthemucef
X-Vade-Analysis-3: tddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefkjghfufggtgfg
X-Vade-Analysis-4: ihfothesthhqtgdtiidtjeenucfhrhhomhepfdguuhgrnhgvkhestghhohhruhhsrdhnvghtfdcuoegu
X-Vade-Analysis-5: uhgrnhgvkhestghhohhruhhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevjeffudeuveevieehvdet
X-Vade-Analysis-6: geeffeekteelhfdvgefgheekteehiedtffevfffgieenucfkphepuddtrddvudelrdduheefrdeffedp
X-Vade-Analysis-7: vddtjedrvddttddrvddvjedrgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgv
X-Vade-Analysis-8: thepuddtrddvudelrdduheefrdeffedphhgvlhhopehmugduhedrthgushdrvghmrghilhdqrghshhdu
X-Vade-Analysis-9: rdhshihntgdrlhgrnhdpmhgrihhlfhhrohhmpeguuhgrnhgvkhestghhohhruhhsrdhnvghtpdhrtghp
X-Vade-Analysis-10: thhtohepsghinhhgsghurdgtrghosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepjhgr
X-Vade-Analysis-11: tghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhig
X-Vade-Analysis-12: qdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhisggtrghmvghrrgdq
X-Vade-Analysis-13: uggvvhgvlheslhhishhtshdrlhhisggtrghmvghrrgdrohhrghdpmhhtrghhohhsthepshhmthhptddu
X-Vade-Analysis-14: rdhtughsrdgvmhgrihhlqdgrshhhuddrshihnhgtrdhlrghnpdhnsggprhgtphhtthhopeegpdhishgp
X-Vade-Analysis-15: nhgrpehfrghlshgvpdgruhhthhgpuhhsvghrpeguuhgrnhgvkhestghhohhruhhsrdhnvght
X-Vade-Client: TDS

Dear Bingbu Cao,

I appreciate your help.

Full disclosure: I rebooted to get you a 'clean' dmesg, but when I rebooted=
, I had to re-load the ov80x40 module

sudo dmesg:
[    0.000000] Linux version 6.12.5-ipu6 (root@DuanesSpectre16) (gcc (Debia=
n 14.2.0-11) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241215) #7 =
SMP PREEMPT_DYNAMIC Tue Dec 17 18:12:49 CST 2024
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-6.12.5-ipu6 root=3D=
UUID=3D7881f7bb-dbe6-4323-887f-dd718adb7a8b ro quiet splash
[    0.000000] x86/split lock detection: #AC: crashing the kernel on kernel=
 split_locks and warning on user-space split_locks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000057818fff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000057819000-0x000000005ad4dfff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000005ad4e000-0x000000005ae6dfff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x000000005ae6e000-0x000000005aff0fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000005aff1000-0x0000000065ffefff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000065fff000-0x0000000065ffffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000066000000-0x00000000787fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000c0000000-0x00000000cfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed7ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000087fffffff] usabl=
e
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0x4fe69018-0x4fe78c57] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ef=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009f000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x000000004fe690=
17] usable
[    0.000000] reserve setup_data: [mem 0x000000004fe69018-0x000000004fe78c=
57] usable
[    0.000000] reserve setup_data: [mem 0x000000004fe78c58-0x0000000057818f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000057819000-0x000000005ad4df=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000005ad4e000-0x000000005ae6df=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x000000005ae6e000-0x000000005aff0f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000005aff1000-0x0000000065ffef=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000065fff000-0x0000000065ffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000066000000-0x00000000787fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000c0000000-0x00000000cfffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fe000000-0x00000000fe010f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec00000-0x00000000fec00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed20000-0x00000000fed7ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000fee00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000087fffff=
ff] usable
[    0.000000] efi: EFI v2.9 by American Megatrends
[    0.000000] efi: ACPI=3D0x5ae6d000 ACPI 2.0=3D0x5ae6d014 TPMFinalLog=3D0=
x5af09000 SMBIOS=3D0x64a28000 SMBIOS 3.0=3D0x64a27000 MEMATTR=3D0x544a7818 =
ESRT=3D0x55b40d18 MOKvar=3D0x65a8a000 INITRD=3D0x540b6598 RNG=3D0x5ad87018 =
TPMEventLog=3D0x5ad77018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem89: MMIO range=3D[0xc0000000-0xcfffffff] (256=
MB) from e820 map
[    0.000000] e820: remove [mem 0xc0000000-0xcfffffff] reserved
[    0.000000] efi: Not removing mem90: MMIO range=3D[0xfe000000-0xfe010fff=
] (68KB) from e820 map
[    0.000000] efi: Not removing mem91: MMIO range=3D[0xfec00000-0xfec00fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem92: MMIO range=3D[0xfed00000-0xfed00fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem94: MMIO range=3D[0xfee00000-0xfee00fff=
] (4KB) from e820 map
[    0.000000] efi: Remove mem95: MMIO range=3D[0xff000000-0xffffffff] (16M=
B) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.6.0 present.
[    0.000000] DMI: HP HP Spectre x360 2-in-1 Laptop 16t-aa000/8C17, BIOS F=
.11 08/14/2024
[    0.000000] DMI: Memory slots populated: 2/2
[    0.000000] tsc: Detected 3000.000 MHz processor
[    0.000000] tsc: Detected 2995.200 MHz TSC
[    0.000007] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000009] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000014] last_pfn =3D 0x880000 max_arch_pfn =3D 0x400000000
[    0.000018] MTRR map: 8 entries (3 fixed + 5 variable; max 23), built fr=
om 10 variable MTRRs
[    0.000019] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.000463] x2apic: enabled by BIOS, switching to x2apic ops
[    0.000464] last_pfn =3D 0x66000 max_arch_pfn =3D 0x400000000
[    0.004826] esrt: Reserving ESRT space from 0x0000000055b40d18 to 0x0000=
000055b40d50.
[    0.004831] e820: update [mem 0x55b40000-0x55b40fff] usable =3D=3D> rese=
rved
[    0.004843] Using GB pages for direct mapping
[    0.005080] RAMDISK: [mem 0x3c687000-0x41486fff]
[    0.005083] ACPI: Early table checksum verification disabled
[    0.005086] ACPI: RSDP 0x000000005AE6D014 000024 (v02 HPQOEM)
[    0.005089] ACPI: XSDT 0x000000005AE6C728 000194 (v01 HPQOEM SLIC-MPC 01=
072009 AMI  01000013)
[    0.005093] ACPI: FACP 0x000000005AE53000 000114 (v06 HPQOEM SLIC-MPC 01=
072009 HP   01000013)
[    0.005097] ACPI: DSDT 0x000000005ADDB000 077690 (v02 HPQOEM 8C17     01=
072009 ACPI 20210930)
[    0.005098] ACPI: FACS 0x000000005AFEA000 000040
[    0.005100] ACPI: SSDT 0x000000005AE6B000 000689 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005101] ACPI: SSDT 0x000000005AE6A000 0005E4 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005103] ACPI: SSDT 0x000000005AE69000 0001AB (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005104] ACPI: SSDT 0x000000005AE68000 000394 (v02 HPQOEM 8C17     00=
003001 ACPI 20210930)
[    0.005106] ACPI: SSDT 0x000000005AE66000 001BAF (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005107] ACPI: SSDT 0x000000005AE64000 001620 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005108] ACPI: SSDT 0x000000005AE62000 001349 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005110] ACPI: SSDT 0x000000005AE61000 000FBB (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005111] ACPI: SSDT 0x000000005AE5D000 003BC8 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005113] ACPI: DTPR 0x000000005AE5C000 000098 (v01 HPQOEM 8C17     00=
000000 HP   00000000)
[    0.005114] ACPI: SSDT 0x000000005AE56000 0058E1 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005116] ACPI: SSDT 0x000000005AE54000 00165F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005117] ACPI: FIDT 0x000000005ADDA000 00009C (v01 HPQOEM 8C17     01=
072009 HP   00010013)
[    0.005119] ACPI: MSDM 0x000000005ADD9000 000055 (v03 HPQOEM SLIC-MPC 00=
000001 HP   00010013)
[    0.005120] ACPI: SSDT 0x000000005ADD8000 00038C (v02 HPQOEM 8C17     00=
000001 ACPI 20210930)
[    0.005122] ACPI: SSDT 0x000000005ADD5000 002494 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005123] ACPI: SSDT 0x000000005ADCA000 0000F9 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005124] ACPI: HPET 0x000000005ADC9000 000038 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005126] ACPI: APIC 0x000000005ADC8000 000358 (v05 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005127] ACPI: MCFG 0x000000005ADC7000 00003C (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005129] ACPI: SSDT 0x000000005ADC5000 00147F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005130] ACPI: SSDT 0x000000005ADC3000 00140F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005132] ACPI: SSDT 0x000000005ADB2000 01023F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005133] ACPI: UEFI 0x000000005AEF0000 000048 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005134] ACPI: NHLT 0x000000005ADB1000 000960 (v00 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005136] ACPI: LPIT 0x000000005ADB0000 0000CC (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005137] ACPI: SSDT 0x000000005ADAE000 000CA6 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005139] ACPI: SSDT 0x000000005ADA8000 005E42 (v02 HPQOEM 8C17     00=
000000 ACPI 20210930)
[    0.005140] ACPI: DBGP 0x000000005ADA7000 000034 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005142] ACPI: DBG2 0x000000005ADA6000 000054 (v00 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005143] ACPI: SSDT 0x000000005ADA4000 00113F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005145] ACPI: DMAR 0x000000005ADA3000 0000A8 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005146] ACPI: FPDT 0x000000005ADA2000 000044 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005147] ACPI: SSDT 0x000000005ADA0000 001021 (v02 HPQOEM 8C17     00=
000000 ACPI 20210930)
[    0.005149] ACPI: SSDT 0x000000005AD9D000 00281A (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005150] ACPI: SSDT 0x000000005AD9A000 0028D3 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005152] ACPI: SSDT 0x000000005AD99000 000060 (v01 HPQOEM 8C17     00=
000001 ACPI 20210930)
[    0.005153] ACPI: SSDT 0x000000005AD90000 0085C5 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005154] ACPI: OEM1 0x000000005AD8F000 0002B0 (v01 HPQOEM HPOEM1DC 00=
000000 HP   00000000)
[    0.005156] ACPI: SSDT 0x000000005AD8B000 003210 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005157] ACPI: PHAT 0x000000005AD8A000 000734 (v01 HPQOEM 8C17     00=
000005 HP   0100000D)
[    0.005159] ACPI: SSDT 0x000000005ADCB000 009BC2 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005160] ACPI: TPM2 0x000000005AD89000 00004C (v04 HPQOEM 8C17     00=
000001 HP   00000000)
[    0.005162] ACPI: WSMT 0x000000005ADAF000 000028 (v01 HPQOEM 8C17     01=
072009 HP   00010013)
[    0.005163] ACPI: BGRT 0x000000005AD88000 000038 (v01 HPQOEM 8C17     01=
072009 HP   00010013)
[    0.005164] ACPI: Reserving FACP table memory at [mem 0x5ae53000-0x5ae53=
113]
[    0.005165] ACPI: Reserving DSDT table memory at [mem 0x5addb000-0x5ae52=
68f]
[    0.005166] ACPI: Reserving FACS table memory at [mem 0x5afea000-0x5afea=
03f]
[    0.005166] ACPI: Reserving SSDT table memory at [mem 0x5ae6b000-0x5ae6b=
688]
[    0.005166] ACPI: Reserving SSDT table memory at [mem 0x5ae6a000-0x5ae6a=
5e3]
[    0.005167] ACPI: Reserving SSDT table memory at [mem 0x5ae69000-0x5ae69=
1aa]
[    0.005167] ACPI: Reserving SSDT table memory at [mem 0x5ae68000-0x5ae68=
393]
[    0.005168] ACPI: Reserving SSDT table memory at [mem 0x5ae66000-0x5ae67=
bae]
[    0.005168] ACPI: Reserving SSDT table memory at [mem 0x5ae64000-0x5ae65=
61f]
[    0.005168] ACPI: Reserving SSDT table memory at [mem 0x5ae62000-0x5ae63=
348]
[    0.005169] ACPI: Reserving SSDT table memory at [mem 0x5ae61000-0x5ae61=
fba]
[    0.005169] ACPI: Reserving SSDT table memory at [mem 0x5ae5d000-0x5ae60=
bc7]
[    0.005169] ACPI: Reserving DTPR table memory at [mem 0x5ae5c000-0x5ae5c=
097]
[    0.005170] ACPI: Reserving SSDT table memory at [mem 0x5ae56000-0x5ae5b=
8e0]
[    0.005170] ACPI: Reserving SSDT table memory at [mem 0x5ae54000-0x5ae55=
65e]
[    0.005170] ACPI: Reserving FIDT table memory at [mem 0x5adda000-0x5adda=
09b]
[    0.005171] ACPI: Reserving MSDM table memory at [mem 0x5add9000-0x5add9=
054]
[    0.005171] ACPI: Reserving SSDT table memory at [mem 0x5add8000-0x5add8=
38b]
[    0.005172] ACPI: Reserving SSDT table memory at [mem 0x5add5000-0x5add7=
493]
[    0.005172] ACPI: Reserving SSDT table memory at [mem 0x5adca000-0x5adca=
0f8]
[    0.005172] ACPI: Reserving HPET table memory at [mem 0x5adc9000-0x5adc9=
037]
[    0.005173] ACPI: Reserving APIC table memory at [mem 0x5adc8000-0x5adc8=
357]
[    0.005173] ACPI: Reserving MCFG table memory at [mem 0x5adc7000-0x5adc7=
03b]
[    0.005173] ACPI: Reserving SSDT table memory at [mem 0x5adc5000-0x5adc6=
47e]
[    0.005174] ACPI: Reserving SSDT table memory at [mem 0x5adc3000-0x5adc4=
40e]
[    0.005174] ACPI: Reserving SSDT table memory at [mem 0x5adb2000-0x5adc2=
23e]
[    0.005175] ACPI: Reserving UEFI table memory at [mem 0x5aef0000-0x5aef0=
047]
[    0.005175] ACPI: Reserving NHLT table memory at [mem 0x5adb1000-0x5adb1=
95f]
[    0.005175] ACPI: Reserving LPIT table memory at [mem 0x5adb0000-0x5adb0=
0cb]
[    0.005176] ACPI: Reserving SSDT table memory at [mem 0x5adae000-0x5adae=
ca5]
[    0.005176] ACPI: Reserving SSDT table memory at [mem 0x5ada8000-0x5adad=
e41]
[    0.005176] ACPI: Reserving DBGP table memory at [mem 0x5ada7000-0x5ada7=
033]
[    0.005177] ACPI: Reserving DBG2 table memory at [mem 0x5ada6000-0x5ada6=
053]
[    0.005177] ACPI: Reserving SSDT table memory at [mem 0x5ada4000-0x5ada5=
13e]
[    0.005178] ACPI: Reserving DMAR table memory at [mem 0x5ada3000-0x5ada3=
0a7]
[    0.005178] ACPI: Reserving FPDT table memory at [mem 0x5ada2000-0x5ada2=
043]
[    0.005178] ACPI: Reserving SSDT table memory at [mem 0x5ada0000-0x5ada1=
020]
[    0.005179] ACPI: Reserving SSDT table memory at [mem 0x5ad9d000-0x5ad9f=
819]
[    0.005179] ACPI: Reserving SSDT table memory at [mem 0x5ad9a000-0x5ad9c=
8d2]
[    0.005179] ACPI: Reserving SSDT table memory at [mem 0x5ad99000-0x5ad99=
05f]
[    0.005180] ACPI: Reserving SSDT table memory at [mem 0x5ad90000-0x5ad98=
5c4]
[    0.005180] ACPI: Reserving OEM1 table memory at [mem 0x5ad8f000-0x5ad8f=
2af]
[    0.005181] ACPI: Reserving SSDT table memory at [mem 0x5ad8b000-0x5ad8e=
20f]
[    0.005181] ACPI: Reserving PHAT table memory at [mem 0x5ad8a000-0x5ad8a=
733]
[    0.005181] ACPI: Reserving SSDT table memory at [mem 0x5adcb000-0x5add4=
bc1]
[    0.005182] ACPI: Reserving TPM2 table memory at [mem 0x5ad89000-0x5ad89=
04b]
[    0.005182] ACPI: Reserving WSMT table memory at [mem 0x5adaf000-0x5adaf=
027]
[    0.005183] ACPI: Reserving BGRT table memory at [mem 0x5ad88000-0x5ad88=
037]
[    0.005213] APIC: Switched APIC routing to: cluster x2apic
[    0.005418] No NUMA configuration found
[    0.005419] Faking a node at [mem 0x0000000000000000-0x000000087fffffff]
[    0.005423] NODE_DATA(0) allocated [mem 0x87ffd5680-0x87fffffff]
[    0.005588] Zone ranges:
[    0.005589]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.005590]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.005590]   Normal   [mem 0x0000000100000000-0x000000087fffffff]
[    0.005591]   Device   empty
[    0.005592] Movable zone start for each node
[    0.005593] Early memory node ranges
[    0.005593]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.005594]   node   0: [mem 0x0000000000100000-0x0000000057818fff]
[    0.005594]   node   0: [mem 0x0000000065fff000-0x0000000065ffffff]
[    0.005595]   node   0: [mem 0x0000000100000000-0x000000087fffffff]
[    0.005597] Initmem setup node 0 [mem 0x0000000000001000-0x000000087ffff=
fff]
[    0.005601] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.005621] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.007359] On node 0, zone DMA32: 26598 pages in unavailable ranges
[    0.007575] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.007968] ACPI: PM-Timer IO Port: 0x1808
[    0.007975] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.008008] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
119
[    0.008009] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.008011] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.008013] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.008014] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.008020] e820: update [mem 0x5453a000-0x54563fff] usable =3D=3D> rese=
rved
[    0.008027] TSC deadline timer available
[    0.008029] CPU topo: Max. logical packages:   1
[    0.008029] CPU topo: Max. logical dies:       1
[    0.008030] CPU topo: Max. dies per package:   1
[    0.008031] CPU topo: Max. threads per core:   2
[    0.008032] CPU topo: Num. cores per package:    16
[    0.008032] CPU topo: Num. threads per package:  22
[    0.008032] CPU topo: Allowing 22 present CPUs plus 0 hotplug CPUs
[    0.008042] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.008043] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0=
x000fffff]
[    0.008044] PM: hibernation: Registered nosave memory: [mem 0x4fe69000-0=
x4fe69fff]
[    0.008045] PM: hibernation: Registered nosave memory: [mem 0x4fe78000-0=
x4fe78fff]
[    0.008045] PM: hibernation: Registered nosave memory: [mem 0x5453a000-0=
x54563fff]
[    0.008046] PM: hibernation: Registered nosave memory: [mem 0x55b40000-0=
x55b40fff]
[    0.008047] PM: hibernation: Registered nosave memory: [mem 0x57819000-0=
x5ad4dfff]
[    0.008047] PM: hibernation: Registered nosave memory: [mem 0x5ad4e000-0=
x5ae6dfff]
[    0.008048] PM: hibernation: Registered nosave memory: [mem 0x5ae6e000-0=
x5aff0fff]
[    0.008048] PM: hibernation: Registered nosave memory: [mem 0x5aff1000-0=
x65ffefff]
[    0.008049] PM: hibernation: Registered nosave memory: [mem 0x66000000-0=
x787fffff]
[    0.008049] PM: hibernation: Registered nosave memory: [mem 0x78800000-0=
xfdffffff]
[    0.008049] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0=
xfe010fff]
[    0.008050] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0=
xfebfffff]
[    0.008050] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0=
xfec00fff]
[    0.008050] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0=
xfecfffff]
[    0.008051] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0=
xfed00fff]
[    0.008051] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0=
xfed1ffff]
[    0.008051] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0=
xfed7ffff]
[    0.008052] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0=
xfedfffff]
[    0.008052] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0=
xfee00fff]
[    0.008052] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0=
xffffffff]
[    0.008053] [mem 0x78800000-0xfdffffff] available for PCI devices
[    0.008054] Booting paravirtualized kernel on bare hardware
[    0.008056] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 7645519600211568 ns
[    0.011289] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:22 nr_cpu_ids:22 =
nr_node_ids:1
[    0.012587] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.012593] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=3D1*2097152
[    0.012596] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07=20
[    0.012598] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15=20
[    0.012600] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 -- --=20
[    0.012611] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-6.12.5-ipu6 =
root=3DUUID=3D7881f7bb-dbe6-4323-887f-dd718adb7a8b ro quiet splash
[    0.012650] Unknown kernel command line parameters "splash BOOT_IMAGE=3D=
/boot/vmlinuz-6.12.5-ipu6", will be passed to user space.
[    0.012658] printk: log_buf_len individual max cpu contribution: 4096 by=
tes
[    0.012659] printk: log_buf_len total cpu_extra contributions: 86016 byt=
es
[    0.012659] printk: log_buf_len min size: 131072 bytes
[    0.012817] printk: log_buf_len: 262144 bytes
[    0.012817] printk: early log buf free: 112576(85%)
[    0.015490] Dentry cache hash table entries: 4194304 (order: 13, 3355443=
2 bytes, linear)
[    0.016806] Inode-cache hash table entries: 2097152 (order: 12, 16777216=
 bytes, linear)
[    0.016972] Fallback order for Node 0: 0=20
[    0.016975] Built 1 zonelists, mobility grouping on.  Total pages: 82226=
48
[    0.016976] Policy zone: Normal
[    0.016982] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.016993] software IO TLB: area num 32.
[    0.032342] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D22, =
Nodes=3D1
[    0.032391] ftrace: allocating 45562 entries in 178 pages
[    0.038290] ftrace: allocated 178 pages with 4 groups
[    0.038867] Dynamic Preempt: voluntary
[    0.038934] rcu: Preemptible hierarchical RCU implementation.
[    0.038934] rcu: =09RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_i=
ds=3D22.
[    0.038936] =09Trampoline variant of Tasks RCU enabled.
[    0.038936] =09Rude variant of Tasks RCU enabled.
[    0.038936] =09Tracing variant of Tasks RCU enabled.
[    0.038937] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.038937] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D22
[    0.038948] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjus=
t=3D1 rcu_task_cpu_ids=3D22.
[    0.038950] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_=
adjust=3D1 rcu_task_cpu_ids=3D22.
[    0.038952] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb=
_adjust=3D1 rcu_task_cpu_ids=3D22.
[    0.041199] NR_IRQS: 524544, nr_irqs: 2232, preallocated irqs: 16
[    0.041507] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.041693] Console: colour dummy device 80x25
[    0.041695] printk: legacy console [tty0] enabled
[    0.041729] ACPI: Core revision 20240827
[    0.042041] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.042134] APIC: Switch to symmetric I/O mode setup
[    0.042136] DMAR: Host address width 42
[    0.042137] DMAR: DRHD base: 0x000000fc800000 flags: 0x0
[    0.042143] DMAR: dmar0: reg_base_addr fc800000 ver 7:0 cap c9de008cee69=
0462 ecap 12ca9a00f0ef5e
[    0.042145] DMAR: DRHD base: 0x000000fc801000 flags: 0x1
[    0.042148] DMAR: dmar1: reg_base_addr fc801000 ver 7:0 cap c9de008cee69=
0462 ecap 12ca9a00f0efde
[    0.042150] DMAR: SATC flags: 0x1
[    0.042152] DMAR-IR: IOAPIC id 2 under DRHD base  0xfc801000 IOMMU 1
[    0.042153] DMAR-IR: HPET id 0 under DRHD base 0xfc801000
[    0.042154] DMAR-IR: Queued invalidation will be enabled to support x2ap=
ic and Intr-remapping.
[    0.043760] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.047633] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.047641] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5990.40 BogoMIPS (lpj=3D11980800)
[    0.047696] CPU0: Thermal monitoring enabled (TM1)
[    0.047698] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.047870] CET detected: Indirect Branch Tracking enabled
[    0.047872] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.047873] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.047875] process: using mwait in idle threads
[    0.047877] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.047878] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.047879] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.047880] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.047881] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.047889] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.047890] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.047890] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.047891] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys Us=
er registers'
[    0.047892] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User =
registers'
[    0.047892] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.047893] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.047893] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.047894] x86/fpu: Enabled xstate features 0xa07, context size is 856 =
bytes, using 'compacted' format.
[    0.051639] Freeing SMP alternatives memory: 40K
[    0.051639] pid_max: default: 32768 minimum: 301
[    0.051639] LSM: initializing lsm=3Dlockdown,capability,landlock,yama,ap=
parmor,tomoyo,bpf,ima,evm
[    0.051639] landlock: Up and running.
[    0.051639] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.051639] AppArmor: AppArmor initialized
[    0.051639] TOMOYO Linux initialized
[    0.051639] LSM support for eBPF active
[    0.051639] Mount-cache hash table entries: 65536 (order: 7, 524288 byte=
s, linear)
[    0.051639] Mountpoint-cache hash table entries: 65536 (order: 7, 524288=
 bytes, linear)
[    0.051639] smpboot: CPU0: Intel(R) Core(TM) Ultra 7 155H (family: 0x6, =
model: 0xaa, stepping: 0x4)
[    0.051639] Performance Events: XSAVE Architectural LBR, PEBS fmt4+-base=
line,  AnyThread deprecated, Meteorlake Hybrid events, 32-deep LBR, full-wi=
dth counters, Intel PMU driver.
[    0.051639] core: cpu_core PMU driver:=20
[    0.051639] ... version:                5
[    0.051639] ... bit width:              48
[    0.051639] ... generic registers:      8
[    0.051639] ... value mask:             0000ffffffffffff
[    0.051639] ... max period:             00007fffffffffff
[    0.051639] ... fixed-purpose events:   4
[    0.051639] ... event mask:             0001000f000000ff
[    0.051639] signal: max sigframe size: 3632
[    0.051639] Estimated ratio of average max frequency by base frequency (=
times 1024): 1638
[    0.051639] rcu: Hierarchical SRCU implementation.
[    0.051639] rcu: =09Max phase no-delay instances is 1000.
[    0.051639] Timer migration: 2 hierarchy levels; 8 children per group; 2=
 crossnode level
[    0.051639] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.051639] smp: Bringing up secondary CPUs ...
[    0.051639] smpboot: x86: Booting SMP configuration:
[    0.051639] .... node  #0, CPUs:        #1  #3  #6  #8 #10 #12 #13 #14 #=
15 #16 #17 #18 #19 #20 #21
[    0.009996] core: cpu_atom PMU driver: PEBS-via-PT=20
[    0.009996] ... version:                5
[    0.009996] ... bit width:              48
[    0.009996] ... generic registers:      8
[    0.009996] ... value mask:             0000ffffffffffff
[    0.009996] ... max period:             00007fffffffffff
[    0.009996] ... fixed-purpose events:   3
[    0.009996] ... event mask:             00000007000000ff
[    0.065128]   #2  #4  #5  #7  #9 #11
[    0.071714] smp: Brought up 1 node, 22 CPUs
[    0.071714] smpboot: Total of 22 processors activated (131788.80 BogoMIP=
S)
[    0.095692] node 0 deferred pages initialised in 20ms
[    0.095697] Memory: 32107908K/32890592K available (16384K kernel code, 2=
485K rwdata, 6840K rodata, 4128K init, 4988K bss, 760700K reserved, 0K cma-=
reserved)
[    0.096438] devtmpfs: initialized
[    0.096438] x86/mm: Memory block size: 128MB
[    0.097000] ACPI: PM: Registering ACPI NVS region [mem 0x5ae6e000-0x5aff=
0fff] (1585152 bytes)
[    0.097000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.097000] futex hash table entries: 8192 (order: 7, 524288 bytes, line=
ar)
[    0.097000] pinctrl core: initialized pinctrl subsystem
[    0.097000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.097000] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.099742] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.100116] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.100123] audit: initializing netlink subsys (disabled)
[    0.100131] audit: type=3D2000 audit(1734571172.052:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.100131] thermal_sys: Registered thermal governor 'fair_share'
[    0.100131] thermal_sys: Registered thermal governor 'bang_bang'
[    0.100131] thermal_sys: Registered thermal governor 'step_wise'
[    0.100131] thermal_sys: Registered thermal governor 'user_space'
[    0.100131] thermal_sys: Registered thermal governor 'power_allocator'
[    0.100131] cpuidle: using governor ladder
[    0.100131] cpuidle: using governor menu
[    0.100131] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.100131] PCI: ECAM [mem 0xc0000000-0xcfffffff] (base 0xc0000000) for =
domain 0000 [bus 00-ff]
[    0.100131] PCI: Using configuration type 1 for base access
[    0.100131] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.100131] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 page=
s
[    0.100131] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.100131] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 page=
s
[    0.100131] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.100131] ACPI: Added _OSI(Module Device)
[    0.100131] ACPI: Added _OSI(Processor Device)
[    0.100131] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.100131] ACPI: Added _OSI(Processor Aggregator Device)
[    0.168584] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PACT], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168596] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168600] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PABN], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168605] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168608] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PAS1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168611] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168617] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PMP0], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168621] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168637] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PMP1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168643] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168657] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA01], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168662] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168664] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.168667] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA02], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168671] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168674] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.168676] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA03], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168680] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168682] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.168684] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA04], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168688] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168691] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.168692] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA05], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168696] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168699] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.168701] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA06], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168704] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168707] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.168709] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA07], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168713] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168715] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.168717] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA08], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.168721] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.168724] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.170099] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.I=
2C3.TPD0], AE_NOT_FOUND (20240827/dswload2-162)
[    0.170105] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.170108] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.179450] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.T=
XHC.RHUB.SS01], AE_NOT_FOUND (20240827/dswload2-162)
[    0.179456] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.179459] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.179461] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.T=
XHC.RHUB.SS02], AE_NOT_FOUND (20240827/dswload2-162)
[    0.179465] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.179468] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.179470] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.T=
XHC.RHUB.SS03], AE_NOT_FOUND (20240827/dswload2-162)
[    0.179474] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.179477] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.179479] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.T=
XHC.RHUB.SS04], AE_NOT_FOUND (20240827/dswload2-162)
[    0.179483] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.179486] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.179513] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179517] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179520] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179522] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179526] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179529] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179534] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179538] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179541] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179542] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179546] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179549] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179553] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS03._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179557] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179560] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179562] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS03._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179566] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179568] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179573] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS04._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179577] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179579] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179581] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS04._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179585] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179588] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179592] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS05._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179596] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179599] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179600] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS05._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179604] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179607] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179611] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS06._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179615] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179618] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179619] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS06._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179623] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179626] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179630] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS07._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179634] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179637] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179638] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS07._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179643] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179646] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179651] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS08._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179655] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179657] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179659] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS08._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179663] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179666] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179670] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS09._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179674] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179677] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179678] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS09._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179682] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179685] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179689] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS10._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179693] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179696] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179698] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS10._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179701] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179704] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179788] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.SS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179792] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179795] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179797] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.SS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179800] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179803] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179808] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.SS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179812] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179815] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.179816] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.SS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.179820] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.179823] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.191291] ACPI: 28 ACPI AML tables successfully acquired and loaded
[    0.205521] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.205525] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.213682] ACPI: EC: EC started
[    0.213684] ACPI: EC: interrupt blocked
[    0.219843] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.219845] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC used to handle tran=
sactions
[    0.219847] ACPI: Interpreter enabled
[    0.219918] ACPI: PM: (supports S0 S3 S4 S5)
[    0.219920] ACPI: Using IOAPIC for interrupt routing
[    0.219985] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.219986] PCI: Ignoring E820 reservations for host bridge windows
[    0.222677] ACPI: Enabled 10 GPEs in block 00 to 7F
[    0.222698] ACPI: Enabled 8 GPEs in block 80 to DF
[    0.225267] ACPI: \_SB_.PC00.RP01.PXP_: New power resource
[    0.230227] ACPI: \_SB_.PC00.RP06.PXP_: New power resource
[    0.231752] ACPI: \_SB_.PC00.RP07.PXP_: New power resource
[    0.234333] ACPI: \_SB_.PC00.RP09.PXP_: New power resource
[    0.235532] ACPI: \_SB_.PC00.RP10.PXP_: New power resource
[    0.236925] ACPI: \_SB_.PC00.RP11.PXP_: New power resource
[    0.238407] ACPI: \_SB_.PC00.RP12.PXP_: New power resource
[    0.241968] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.BTRT: New power resource
[    0.242020] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.DBTR: New power resource
[    0.242169] ACPI: \_SB_.PC00.PAUD: New power resource
[    0.247818] ACPI: \_SB_.PC00.I2C3.PXTC: New power resource
[    0.254054] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.271548] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.271608] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.271663] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.289625] ACPI: \PIN_: New power resource
[    0.290214] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-fe])
[    0.290221] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    0.291064] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.292688] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotp=
lug PME PCIeCapability LTR]
[    0.294541] PCI host bridge to bus 0000:00
[    0.294544] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window=
]
[    0.294546] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window=
]
[    0.294547] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.294550] pci_bus 0000:00: root bus resource [mem 0x80000000-0xbffffff=
f window]
[    0.294551] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x3ffbf=
ffffff window]
[    0.294553] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.296578] pci 0000:00:00.0: [8086:7d01] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.296724] pci 0000:00:02.0: [8086:7d55] type 00 class 0x030000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.296736] pci 0000:00:02.0: BAR 0 [mem 0x5220000000-0x5220ffffff 64bit=
 pref]
[    0.296745] pci 0000:00:02.0: BAR 2 [mem 0x4210000000-0x421fffffff 64bit=
 pref]
[    0.296777] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.296781] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.296816] pci 0000:00:02.0: PME# supported from D0 D3hot
[    0.296834] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit =
pref]
[    0.296836] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit =
pref]: contains BAR 0 for 7 VFs
[    0.297023] pci 0000:00:04.0: [8086:7d03] type 00 class 0x118000 convent=
ional PCI endpoint
[    0.297039] pci 0000:00:04.0: BAR 0 [mem 0x52312c0000-0x52312dffff 64bit=
]
[    0.297284] pci 0000:00:05.0: [8086:7d19] type 00 class 0x048000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.297293] pci 0000:00:05.0: BAR 0 [mem 0x5230000000-0x5230ffffff 64bit=
]
[    0.297308] pci 0000:00:05.0: enabling Extended Tags
[    0.297433] pci 0000:00:06.0: [8086:7ecb] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.297458] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.297463] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff=
]
[    0.297547] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.297591] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.298373] pci 0000:00:07.0: [8086:7ec4] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.298405] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.298411] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff=
]
[    0.298420] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fff=
ffff 64bit pref]
[    0.298535] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.298566] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.299331] pci 0000:00:07.2: [8086:7ec6] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.299358] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.299363] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff=
]
[    0.299372] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fff=
ffff 64bit pref]
[    0.299487] pci 0000:00:07.2: PME# supported from D0 D3hot D3cold
[    0.299519] pci 0000:00:07.2: PTM enabled (root), 4ns granularity
[    0.300304] pci 0000:00:08.0: [8086:7e4c] type 00 class 0x088000 convent=
ional PCI endpoint
[    0.300319] pci 0000:00:08.0: BAR 0 [mem 0x5231327000-0x5231327fff 64bit=
]
[    0.300434] pci 0000:00:0a.0: [8086:7d0d] type 00 class 0x118000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.300441] pci 0000:00:0a.0: BAR 0 [mem 0x5231280000-0x52312bffff 64bit=
]
[    0.300458] pci 0000:00:0a.0: enabling Extended Tags
[    0.300531] pci 0000:00:0b.0: [8086:7d1d] type 00 class 0x120000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.300540] pci 0000:00:0b.0: BAR 0 [mem 0x5228000000-0x522fffffff 64bit=
]
[    0.300552] pci 0000:00:0b.0: BAR 4 [mem 0x5231326000-0x5231326fff 64bit=
]
[    0.300674] pci 0000:00:0d.0: [8086:7ec0] type 00 class 0x0c0330 convent=
ional PCI endpoint
[    0.300689] pci 0000:00:0d.0: BAR 0 [mem 0x5231300000-0x523130ffff 64bit=
]
[    0.300785] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.301209] pci 0000:00:0d.2: [8086:7ec2] type 00 class 0x0c0340 convent=
ional PCI endpoint
[    0.301224] pci 0000:00:0d.2: BAR 0 [mem 0x5231240000-0x523127ffff 64bit=
]
[    0.301233] pci 0000:00:0d.2: BAR 2 [mem 0x5231325000-0x5231325fff 64bit=
]
[    0.301279] pci 0000:00:0d.2: supports D1 D2
[    0.301280] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.301373] pci 0000:00:0d.3: [8086:7ec3] type 00 class 0x0c0340 convent=
ional PCI endpoint
[    0.301388] pci 0000:00:0d.3: BAR 0 [mem 0x5231200000-0x523123ffff 64bit=
]
[    0.301398] pci 0000:00:0d.3: BAR 2 [mem 0x5231324000-0x5231324fff 64bit=
]
[    0.301442] pci 0000:00:0d.3: supports D1 D2
[    0.301443] pci 0000:00:0d.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.301562] pci 0000:00:12.0: [8086:7e45] type 00 class 0x070000 convent=
ional PCI endpoint
[    0.301575] pci 0000:00:12.0: BAR 0 [mem 0x52312f0000-0x52312fffff 64bit=
]
[    0.301622] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.302322] pci 0000:00:14.0: [8086:7e7d] type 00 class 0x0c0330 convent=
ional PCI endpoint
[    0.302338] pci 0000:00:14.0: BAR 0 [mem 0x52312e0000-0x52312effff 64bit=
]
[    0.302398] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.302799] pci 0000:00:14.2: [8086:7e7f] type 00 class 0x050000 convent=
ional PCI endpoint
[    0.302817] pci 0000:00:14.2: BAR 0 [mem 0x5231318000-0x523131bfff 64bit=
]
[    0.302828] pci 0000:00:14.2: BAR 2 [mem 0x5231323000-0x5231323fff 64bit=
]
[    0.302933] pci 0000:00:14.3: [8086:7e40] type 00 class 0x028000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.302945] pci 0000:00:14.3: BAR 0 [mem 0x5231314000-0x5231317fff 64bit=
]
[    0.303015] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.303229] pci 0000:00:15.0: [8086:7e78] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.303282] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.303628] pci 0000:00:15.1: [8086:7e79] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.303659] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.304016] pci 0000:00:15.3: [8086:7e7b] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.304068] pci 0000:00:15.3: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.304375] pci 0000:00:16.0: [8086:7e70] type 00 class 0x078000 convent=
ional PCI endpoint
[    0.304393] pci 0000:00:16.0: BAR 0 [mem 0x523131f000-0x523131ffff 64bit=
]
[    0.304475] pci 0000:00:16.0: PME# supported from D3hot
[    0.305213] pci 0000:00:19.0: [8086:7e50] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.305264] pci 0000:00:19.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.305613] pci 0000:00:19.1: [8086:7e51] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.305665] pci 0000:00:19.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.305981] pci 0000:00:1c.0: [8086:7e38] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.306002] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.306006] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.306008] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff=
]
[    0.306016] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ff=
ffff 64bit pref]
[    0.306076] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.306105] pci 0000:00:1c.0: PTM enabled (root), 4ns granularity
[    0.306727] pci 0000:00:1f.0: [8086:7e02] type 00 class 0x060100 convent=
ional PCI endpoint
[    0.307101] pci 0000:00:1f.3: [8086:7e28] type 00 class 0x040100 convent=
ional PCI endpoint
[    0.307136] pci 0000:00:1f.3: BAR 0 [mem 0x5231310000-0x5231313fff 64bit=
]
[    0.307156] pci 0000:00:1f.3: BAR 4 [mem 0x5231000000-0x52311fffff 64bit=
]
[    0.307205] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.307280] pci 0000:00:1f.4: [8086:7e22] type 00 class 0x0c0500 convent=
ional PCI endpoint
[    0.307301] pci 0000:00:1f.4: BAR 0 [mem 0x523131c000-0x523131c0ff 64bit=
]
[    0.307325] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.307546] pci 0000:00:1f.5: [8086:7e23] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.307585] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.308090] pci 0000:01:00.0: [1c5c:1959] type 00 class 0x010802 PCIe En=
dpoint
[    0.308109] pci 0000:01:00.0: BAR 0 [mem 0x8d200000-0x8d203fff 64bit]
[    0.308402] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.308450] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.308501] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.308553] pci 0000:56:00.0: [10de:28a1] type 00 class 0x030000 PCIe Le=
gacy Endpoint
[    0.308566] pci 0000:56:00.0: BAR 0 [mem 0x8c000000-0x8cffffff]
[    0.308576] pci 0000:56:00.0: BAR 1 [mem 0x4000000000-0x41ffffffff 64bit=
 pref]
[    0.308586] pci 0000:56:00.0: BAR 3 [mem 0x4200000000-0x4201ffffff 64bit=
 pref]
[    0.308593] pci 0000:56:00.0: BAR 5 [io  0x3000-0x307f]
[    0.308600] pci 0000:56:00.0: ROM [mem 0x8d000000-0x8d07ffff pref]
[    0.308662] pci 0000:56:00.0: PME# supported from D0 D3hot
[    0.308741] pci 0000:56:00.0: 63.012 Gb/s available PCIe bandwidth, limi=
ted by 16.0 GT/s PCIe x4 link at 0000:00:1c.0 (capable of 126.024 Gb/s with=
 16.0 GT/s PCIe x8 link)
[    0.308937] pci 0000:56:00.1: [10de:22be] type 00 class 0x040300 PCIe En=
dpoint
[    0.308947] pci 0000:56:00.1: BAR 0 [mem 0x8d080000-0x8d083fff]
[    0.309089] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.313528] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.313668] ACPI: PCI: Interrupt link LNKB configured for IRQ 1
[    0.313803] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.313935] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.314070] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.314204] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.314338] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.314470] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.315414] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x1)
[    0.451374] Low-power S0 idle used by default for system suspend
[    0.461383] ACPI: EC: interrupt unblocked
[    0.461385] ACPI: EC: event unblocked
[    0.461406] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.461408] ACPI: EC: GPE=3D0x6e
[    0.461409] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC initialization comp=
lete
[    0.461410] ACPI: \_SB_.PC00.LPCB.EC0_: EC: Used to handle transactions =
and events
[    0.461498] iommu: Default domain type: Translated
[    0.461498] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.461498] pps_core: LinuxPPS API ver. 1 registered
[    0.461498] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.461498] PTP clock support registered
[    0.461498] EDAC MC: Ver: 3.0.0
[    0.461498] efivars: Registered efivars operations
[    0.461498] NetLabel: Initializing
[    0.461498] NetLabel:  domain hash size =3D 128
[    0.461498] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.461498] NetLabel:  unlabeled traffic allowed by default
[    0.461498] PCI: Using ACPI for IRQ routing
[    0.473271] PCI: pci_cache_line_size set to 64 bytes
[    0.473417] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't c=
laim; no compatible bridge window
[    0.473533] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.473535] e820: reserve RAM buffer [mem 0x4fe69018-0x4fffffff]
[    0.473536] e820: reserve RAM buffer [mem 0x5453a000-0x57ffffff]
[    0.473537] e820: reserve RAM buffer [mem 0x55b40000-0x57ffffff]
[    0.473538] e820: reserve RAM buffer [mem 0x57819000-0x57ffffff]
[    0.473538] e820: reserve RAM buffer [mem 0x66000000-0x67ffffff]
[    0.473570] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.473570] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.473570] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.473570] pci 0000:56:00.0: vgaarb: bridge control possible
[    0.473570] pci 0000:56:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dnone,locks=3Dnone
[    0.473570] vgaarb: loaded
[    0.473570] clocksource: Switched to clocksource tsc-early
[    0.473570] VFS: Disk quotas dquot_6.6.0
[    0.473570] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.473570] AppArmor: AppArmor Filesystem Enabled
[    0.473570] pnp: PnP ACPI init
[    0.473570] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.473570] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.473570] system 00:01: [io  0x1854-0x1857] has been reserved
[    0.473570] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.473570] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.473570] system 00:03: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    0.473570] system 00:03: [mem 0xc0000000-0xcfffffff] has been reserved
[    0.473570] system 00:03: [mem 0xfed20000-0xfed7ffff] could not be reser=
ved
[    0.473570] system 00:03: [mem 0xfc800000-0xfc81ffff] could not be reser=
ved
[    0.473570] system 00:03: [mem 0xfed45000-0xfed8ffff] could not be reser=
ved
[    0.473570] system 00:03: [mem 0xfee00000-0xfeefffff] could not be reser=
ved
[    0.474592] system 00:04: [io  0x2000-0x20fe] has been reserved
[    0.474909] system 00:05: [mem 0xfe02c008-0xfe02cfff] has been reserved
[    0.474911] system 00:05: [mem 0xfe02d000-0xfe02dfff] has been reserved
[    0.476013] pnp: PnP ACPI: found 6 devices
[    0.481635] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.481706] NET: Registered PF_INET protocol family
[    0.481938] IP idents hash table entries: 262144 (order: 9, 2097152 byte=
s, linear)
[    0.484828] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6=
, 262144 bytes, linear)
[    0.484871] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.485083] TCP established hash table entries: 262144 (order: 9, 209715=
2 bytes, linear)
[    0.485446] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    0.485554] TCP: Hash tables configured (established 262144 bind 65536)
[    0.485745] MPTCP token hash table entries: 32768 (order: 7, 786432 byte=
s, linear)
[    0.485842] UDP hash table entries: 16384 (order: 7, 524288 bytes, linea=
r)
[    0.485924] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, =
linear)
[    0.486009] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.486016] NET: Registered PF_XDP protocol family
[    0.486023] pci_bus 0000:00: max bus depth: 1 pci_try_num: 2
[    0.486036] pci 0000:00:02.0: VF BAR 0 [mem 0x4202000000-0x4208ffffff 64=
bit pref]: assigned
[    0.486041] pci 0000:00:07.0: bridge window [io  0x4000-0x4fff]: assigne=
d
[    0.486044] pci 0000:00:07.2: bridge window [io  0x5000-0x5fff]: assigne=
d
[    0.486045] pci 0000:00:15.0: BAR 0 [mem 0x4209000000-0x4209000fff 64bit=
]: assigned
[    0.486085] pci 0000:00:15.1: BAR 0 [mem 0x4209001000-0x4209001fff 64bit=
]: assigned
[    0.486099] pci 0000:00:15.3: BAR 0 [mem 0x4209002000-0x4209002fff 64bit=
]: assigned
[    0.486145] pci 0000:00:19.0: BAR 0 [mem 0x4209003000-0x4209003fff 64bit=
]: assigned
[    0.486157] pci 0000:00:19.1: BAR 0 [mem 0x4209004000-0x4209004fff 64bit=
]: assigned
[    0.486174] pci 0000:00:1f.5: BAR 0 [mem 0x8d100000-0x8d100fff]: assigne=
d
[    0.486185] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.486191] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff=
]
[    0.486198] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.486205] pci 0000:00:07.0:   bridge window [io  0x4000-0x4fff]
[    0.486209] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff=
]
[    0.486212] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fff=
ffff 64bit pref]
[    0.486216] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.486218] pci 0000:00:07.2:   bridge window [io  0x5000-0x5fff]
[    0.486222] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff=
]
[    0.486225] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fff=
ffff 64bit pref]
[    0.486231] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.486232] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.486236] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff=
]
[    0.486238] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ff=
ffff 64bit pref]
[    0.486242] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.486244] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.486245] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.486246] pci_bus 0000:00: resource 7 [mem 0x80000000-0xbfffffff windo=
w]
[    0.486247] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x3ffbfffffff =
window]
[    0.486249] pci_bus 0000:01: resource 1 [mem 0x8d200000-0x8d2fffff]
[    0.486250] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.486251] pci_bus 0000:02: resource 1 [mem 0x86000000-0x8bffffff]
[    0.486252] pci_bus 0000:02: resource 2 [mem 0x4a20000000-0x521fffffff 6=
4bit pref]
[    0.486253] pci_bus 0000:2c: resource 0 [io  0x5000-0x5fff]
[    0.486255] pci_bus 0000:2c: resource 1 [mem 0x80000000-0x85ffffff]
[    0.486256] pci_bus 0000:2c: resource 2 [mem 0x4220000000-0x4a1fffffff 6=
4bit pref]
[    0.486257] pci_bus 0000:56: resource 0 [io  0x3000-0x3fff]
[    0.486258] pci_bus 0000:56: resource 1 [mem 0x8c000000-0x8d0fffff]
[    0.486259] pci_bus 0000:56: resource 2 [mem 0x4000000000-0x4201ffffff 6=
4bit pref]
[    0.486844] pci 0000:56:00.1: extending delay after power-on from D3hot =
to 20 msec
[    0.486870] pci 0000:56:00.1: D0 power state depends on 0000:56:00.0
[    0.486874] PCI: CLS 64 bytes, default 64
[    0.486907] DMAR: No RMRR found
[    0.486907] DMAR: No ATSR found
[    0.486909] DMAR: IOMMU feature sc_support inconsistent
[    0.486911] DMAR: dmar0: Using Queued invalidation
[    0.486914] DMAR: dmar1: Using Queued invalidation
[    0.486941] Trying to unpack rootfs image as initramfs...
[    0.487448] pci 0000:00:02.0: Adding to iommu group 0
[    0.487482] pci 0000:00:00.0: Adding to iommu group 1
[    0.487492] pci 0000:00:04.0: Adding to iommu group 2
[    0.487503] pci 0000:00:05.0: Adding to iommu group 3
[    0.487536] pci 0000:00:06.0: Adding to iommu group 4
[    0.487554] pci 0000:00:07.0: Adding to iommu group 5
[    0.487565] pci 0000:00:07.2: Adding to iommu group 6
[    0.487575] pci 0000:00:08.0: Adding to iommu group 7
[    0.487584] pci 0000:00:0a.0: Adding to iommu group 8
[    0.487594] pci 0000:00:0b.0: Adding to iommu group 9
[    0.487615] pci 0000:00:0d.0: Adding to iommu group 10
[    0.487625] pci 0000:00:0d.2: Adding to iommu group 10
[    0.487635] pci 0000:00:0d.3: Adding to iommu group 10
[    0.487649] pci 0000:00:12.0: Adding to iommu group 11
[    0.487665] pci 0000:00:14.0: Adding to iommu group 12
[    0.487674] pci 0000:00:14.2: Adding to iommu group 12
[    0.487686] pci 0000:00:14.3: Adding to iommu group 13
[    0.487705] pci 0000:00:15.0: Adding to iommu group 14
[    0.487715] pci 0000:00:15.1: Adding to iommu group 14
[    0.487725] pci 0000:00:15.3: Adding to iommu group 14
[    0.487737] pci 0000:00:16.0: Adding to iommu group 15
[    0.487754] pci 0000:00:19.0: Adding to iommu group 16
[    0.487765] pci 0000:00:19.1: Adding to iommu group 16
[    0.487776] pci 0000:00:1c.0: Adding to iommu group 17
[    0.487798] pci 0000:00:1f.0: Adding to iommu group 18
[    0.487809] pci 0000:00:1f.3: Adding to iommu group 18
[    0.487821] pci 0000:00:1f.4: Adding to iommu group 18
[    0.487832] pci 0000:00:1f.5: Adding to iommu group 18
[    0.487867] pci 0000:01:00.0: Adding to iommu group 19
[    0.487886] pci 0000:56:00.0: Adding to iommu group 20
[    0.487899] pci 0000:56:00.1: Adding to iommu group 20
[    0.490853] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.490856] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.490857] software IO TLB: mapped [mem 0x00000000480b8000-0x000000004c=
0b8000] (64MB)
[    0.490888] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b2=
c8ec87c7, max_idle_ns: 440795278598 ns
[    0.491016] clocksource: Switched to clocksource tsc
[    0.491110] platform rtc_cmos: registered platform RTC device (no PNP de=
vice found)
[    0.494694] Initialise system trusted keyrings
[    0.494704] Key type blacklist registered
[    0.494741] workingset: timestamp_bits=3D36 max_order=3D23 bucket_order=
=3D0
[    0.494748] zbud: loaded
[    0.494840] fuse: init (API version 7.41)
[    0.494970] integrity: Platform Keyring initialized
[    0.494973] integrity: Machine keyring initialized
[    0.504209] Key type asymmetric registered
[    0.504211] Asymmetric key parser 'x509' registered
[    0.959914] Freeing initrd memory: 79872K
[    0.964477] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 246)
[    0.964517] io scheduler mq-deadline registered
[    0.966116] ledtrig-cpu: registered to indicate activity on CPUs
[    0.966933] pcieport 0000:00:06.0: PME: Signaling with IRQ 122
[    0.967342] pcieport 0000:00:07.0: PME: Signaling with IRQ 123
[    0.967362] pcieport 0000:00:07.0: pciehp: Slot #12 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAct=
Rep+
[    0.967688] pcieport 0000:00:07.2: PME: Signaling with IRQ 124
[    0.967706] pcieport 0000:00:07.2: pciehp: Slot #14 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAct=
Rep+
[    0.967988] pcieport 0000:00:1c.0: PME: Signaling with IRQ 125
[    0.968079] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.979506] ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-=
274000)
[    0.981825] thermal LNXTHERM:00: registered as thermal_zone0
[    0.981827] ACPI: thermal: Thermal Zone [TZ01] (69 C)
[    0.982015] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.982721] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    0.983078] hpet_acpi_add: no address or irqs in _CRS
[    0.983097] Linux agpgart interface v0.103
[    0.984968] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1D, rev-id 54)
[    1.099561] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq =
1
[    1.099564] i8042: PNP: PS/2 appears to have AUX port disabled, if this =
is incorrect please boot with i8042.nopnp
[    1.100761] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.101079] mousedev: PS/2 mouse device common for all mice
[    1.101281] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.102101] rtc_cmos rtc_cmos: registered as rtc0
[    1.102232] rtc_cmos rtc_cmos: setting system clock to 2024-12-19T01:19:=
33 UTC (1734571173)
[    1.102254] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nv=
ram
[    1.105070] intel_pstate: Intel P-state driver initializing
[    1.110242] intel_pstate: HWP enabled
[    1.110385] efifb: probing for efifb
[    1.110394] efifb: framebuffer at 0x70800000, using 20252k, total 20250k
[    1.110396] efifb: mode is 2880x1800x32, linelength=3D11520, pages=3D1
[    1.110397] efifb: scrolling: redraw
[    1.110397] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    1.110476] Console: switching to colour frame buffer device 180x56
[    1.112894] fb0: EFI VGA frame buffer device
[    1.113040] NET: Registered PF_INET6 protocol family
[    1.116750] Segment Routing with IPv6
[    1.116765] In-situ OAM (IOAM) with IPv6
[    1.116792] mip6: Mobile IPv6
[    1.116795] NET: Registered PF_PACKET protocol family
[    1.116813] mpls_gso: MPLS GSO support
[    1.120965] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.122133] microcode: Current revision: 0x00000020
[    1.122136] microcode: Updated early from: 0x0000001f
[    1.127321] IPI shorthand broadcast: enabled
[    1.128141] sched_clock: Marking stable (1121290113, 5996358)->(11780236=
42, -50737171)
[    1.128886] registered taskstats version 1
[    1.128994] Loading compiled-in X.509 certificates
[    1.144395] Loaded X.509 cert 'Build time autogenerated kernel key: b836=
7364ab86cd6d96862dfcfcdbc0b9ecc179c3'
[    1.145495] Demotion targets for Node 0: null
[    1.145588] Key type .fscrypt registered
[    1.145589] Key type fscrypt-provisioning registered
[    1.157369] Key type encrypted registered
[    1.157371] AppArmor: AppArmor sha256 policy hashing enabled
[    1.157657] integrity: Loading X.509 certificate: UEFI:db
[    1.157673] integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot D=
B 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    1.157674] integrity: Loading X.509 certificate: UEFI:db
[    1.157685] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b=
3244c935bce0d6628af39827421e32497d'
[    1.157686] integrity: Loading X.509 certificate: UEFI:db
[    1.157698] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows=
 UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    1.157698] integrity: Loading X.509 certificate: UEFI:db
[    1.157709] integrity: Loaded X.509 cert 'Microsoft Windows Production P=
CA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.157710] integrity: Loading X.509 certificate: UEFI:db
[    1.157720] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA =
2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.158588] ima: Allocated hash algorithm: sha256
[    1.168968] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input0
[    1.318304] ima: No architecture policies found
[    1.318327] evm: Initialising EVM extended attributes:
[    1.318329] evm: security.selinux
[    1.318330] evm: security.SMACK64 (disabled)
[    1.318331] evm: security.SMACK64EXEC (disabled)
[    1.318332] evm: security.SMACK64TRANSMUTE (disabled)
[    1.318332] evm: security.SMACK64MMAP (disabled)
[    1.318333] evm: security.apparmor
[    1.318334] evm: security.ima
[    1.318334] evm: security.capability
[    1.318335] evm: HMAC attrs: 0x1
[    1.321850] RAS: Correctable Errors collector initialized.
[    1.321910] clk: Disabling unused clocks
[    1.321912] PM: genpd: Disabling unused power domains
[    1.330001] Freeing unused decrypted memory: 2028K
[    1.331618] Freeing unused kernel image (initmem) memory: 4128K
[    1.331629] Write protecting the kernel read-only data: 24576k
[    1.333314] Freeing unused kernel image (rodata/data gap) memory: 1352K
[    1.338015] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.338018] Run /init as init process
[    1.338019]   with arguments:
[    1.338019]     /init
[    1.338020]     splash
[    1.338020]   with environment:
[    1.338020]     HOME=3D/
[    1.338021]     TERM=3Dlinux
[    1.338021]     BOOT_IMAGE=3D/boot/vmlinuz-6.12.5-ipu6
[    1.398194] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input1
[    1.398221] ACPI: button: Sleep Button [SLPB]
[    1.398257] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input2
[    1.398269] ACPI: button: Lid Switch [LID0]
[    1.398284] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input3
[    1.407181] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6436-9F42-4=
2C8-BADC-0E9424F20C9A has zero instances
[    1.407187] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6435-9F42-4=
2C8-BADC-0E9424F20C9A has zero instances
[    1.407188] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 7391A661-223A-4=
7DB-A77A-7BE84C60822D has zero instances
[    1.407190] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: DF4E63B6-3BBC-4=
858-9737-C74F82F821F3 has zero instances
[    1.418529] ACPI: bus type thunderbolt registered
[    1.422083] ACPI: button: Power Button [PWRB]
[    1.422141] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input4
[    1.422255] ACPI: button: Power Button [PWRF]
[    1.424537] ACPI: bus type drm_connector registered
[    1.430776] ACPI: battery: Slot [BAT0] (battery present)
[    1.432431] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    1.432479] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    1.433397] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    1.433479] nvme nvme0: pci function 0000:01:00.0
[    1.435700] hid: raw HID events driver (C) Jiri Kosina
[    1.440563] ACPI: bus type USB registered
[    1.440583] usbcore: registered new interface driver usbfs
[    1.440588] usbcore: registered new interface driver hub
[    1.440597] usbcore: registered new device driver usb
[    1.445946] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
[    1.446244] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    1.451978] nvme nvme0: 22/0/0 default/read/poll queues
[    1.457024]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.465093] intel-lpss 0000:00:15.1: enabling device (0004 -> 0006)
[    1.465316] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    1.481725] intel-lpss 0000:00:15.3: enabling device (0004 -> 0006)
[    1.481859] idma64 idma64.2: Found Intel integrated DMA 64-bit
[    1.498017] intel-lpss 0000:00:19.0: enabling device (0004 -> 0006)
[    1.514105] intel-lpss 0000:00:19.1: enabling device (0004 -> 0006)
[    1.640154] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[    1.759733] i2c_hid_acpi i2c-ELAN2513:00: i2c_hid_get_input: IRQ trigger=
ed but there's no data
[    1.761441] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.761449] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus =
number 1
[    1.761844] input: ELAN07CE:00 04F3:32C8 Mouse as /devices/pci0000:00/00=
00:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input=
/input5
[    1.761912] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00=
/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/in=
put/input7
[    1.761964] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pc=
i0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8=
.0001/input/input8
[    1.762033] hid-generic 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.0=
0 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    1.762656] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x1=
20 quirks 0x0000000200009810
[    1.762986] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.762990] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus =
number 2
[    1.762993] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperS=
peed
[    1.763055] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.12
[    1.763058] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.763060] usb usb1: Product: xHCI Host Controller
[    1.763062] usb usb1: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.763063] usb usb1: SerialNumber: 0000:00:0d.0
[    1.763210] hub 1-0:1.0: USB hub found
[    1.763239] hub 1-0:1.0: 1 port detected
[    1.763246] input: ELAN2513:00 04F3:422C Touchscreen as /devices/pci0000=
:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002=
/input/input9
[    1.763316] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
10
[    1.763336] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
11
[    1.763354] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inpu=
t/input12
[    1.763410] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/in=
put/input13
[    1.763438] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input=
/input14
[    1.763455] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.12
[    1.763457] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.763458] usb usb2: Product: xHCI Host Controller
[    1.763459] usb usb2: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.763460] usb usb2: SerialNumber: 0000:00:0d.0
[    1.763501] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
16
[    1.763523] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
17
[    1.763555] hub 2-0:1.0: USB hub found
[    1.763557] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
18
[    1.763583] hub 2-0:1.0: 4 ports detected
[    1.765637] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.765641] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 3
[    1.766756] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x1=
20 quirks 0x0000000200009810
[    1.766983] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.766985] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 4
[    1.766986] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperS=
peed
[    1.767002] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.12
[    1.767004] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.767005] usb usb3: Product: xHCI Host Controller
[    1.767005] usb usb3: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.767006] usb usb3: SerialNumber: 0000:00:14.0
[    1.767072] hub 3-0:1.0: USB hub found
[    1.767084] hub 3-0:1.0: 12 ports detected
[    1.767538] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.12
[    1.767539] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.767540] usb usb4: Product: xHCI Host Controller
[    1.767541] usb usb4: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.767541] usb usb4: SerialNumber: 0000:00:14.0
[    1.767583] hub 4-0:1.0: USB hub found
[    1.767589] hub 4-0:1.0: 2 ports detected
[    1.807403] hid-generic 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.0=
0 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    1.968292] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00=
/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/in=
put/input22
[    1.968380] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pc=
i0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8=
.0001/input/input23
[    1.968421] hid-multitouch 0018:04F3:32C8.0001: input,hidraw0: I2C HID v=
1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    1.975770] i915 0000:00:02.0: [drm] Found METEORLAKE (device ID 7d55) d=
isplay version 14.00 stepping C0
[    1.976992] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    1.977057] Console: switching to colour dummy device 80x25
[    1.977068] i915 0000:00:02.0: vgaarb: deactivate vga console
[    1.977077] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    1.994098] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
[    2.003023] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/=
mtl_dmc.bin (v2.23)
[    2.031590] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/mtl_guc_70.b=
in version 70.29.2
[    2.045261] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    2.045263] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    2.045474] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    2.049676] i915 0000:00:02.0: [drm] GT1: can't init GSC proxy due to mi=
ssing mei component
[    2.049924] i915 0000:00:02.0: [drm] GT1: GuC firmware i915/mtl_guc_70.b=
in version 70.29.2
[    2.049926] i915 0000:00:02.0: [drm] GT1: HuC firmware i915/mtl_huc_gsc.=
bin version 8.5.4
[    2.072370] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for clear m=
edia
[    2.072792] i915 0000:00:02.0: [drm] GT1: GUC: submission enabled
[    2.072794] i915 0000:00:02.0: [drm] GT1: GUC: SLPC enabled
[    2.072867] i915 0000:00:02.0: [drm] GT1: GUC: RC enabled
[    2.075116] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected c=
ontent support initialized
[    2.078010] usb 3-3: new full-speed USB device number 2 using xhci_hcd
[    2.082764] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 0
[    2.083115] ACPI: video: Video Device [PXSX] (multi-head: no  rom: yes  =
post: no)
[    2.083145] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:01/LNXVIDEO:00/input/input24
[    2.115178] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  =
post: no)
[    2.115513] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:01/input/input25
[    2.121531] fbcon: i915drmfb (fb0) is primary device
[    2.126363] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
26
[    2.126404] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input27
[    2.126418] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input28
[    2.126432] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inpu=
t/input29
[    2.126466] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/in=
put/input30
[    2.126481] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input=
/input31
[    2.126515] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input33
[    2.126528] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input34
[    2.126539] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input35
[    2.170219] hid-multitouch 0018:04F3:422C.0002: input,hidraw1: I2C HID v=
1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.213723] i915 0000:00:02.0: [drm] GT1: Loaded GSC firmware i915/mtl_g=
sc_1.bin (cv1.0, r102.0.10.1878, svn 1)
[    2.215227] usb 3-3: New USB device found, idVendor=3D06cb, idProduct=3D=
016c, bcdDevice=3D 0.00
[    2.215231] usb 3-3: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D1
[    2.215232] usb 3-3: SerialNumber: 17f07122a011
[    2.222041] tpm tpm0: auth session is active
[    2.233645] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for all wor=
kloads
[    2.233652] i915 0000:00:02.0: [drm] *ERROR* GT1: GSC proxy handler fail=
ed to init
[    2.334308] usb 3-10: new full-speed USB device number 3 using xhci_hcd
[    2.473004] usb 3-10: New USB device found, idVendor=3D8087, idProduct=
=3D0033, bcdDevice=3D 0.00
[    2.473011] usb 3-10: New USB device strings: Mfr=3D0, Product=3D0, Seri=
alNumber=3D0
[    2.509077] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: e=
num_devices_done OK, num_hid_devices=3D6
[    2.515148] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.520960] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.530300] hid-generic 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.535340] hid-generic 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.540016] hid-generic 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.541404] hid-generic 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.545167] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.546161] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.546983] hid-sensor-hub 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.547629] hid-sensor-hub 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.548260] hid-sensor-hub 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.548418] hid-sensor-hub 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    3.502064] Console: switching to colour frame buffer device 180x56
[    3.511743] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.649999] raid6: avx2x4   gen() 20851 MB/s
[    3.717998] raid6: avx2x2   gen() 24501 MB/s
[    3.785999] raid6: avx2x1   gen() 21076 MB/s
[    3.786000] raid6: using algorithm avx2x2 gen() 24501 MB/s
[    3.853998] raid6: .... xor() 16216 MB/s, rmw enabled
[    3.853999] raid6: using avx2x2 recovery algorithm
[    3.856507] xor: automatically using best checksumming function   avx   =
   =20
[    3.858128] async_tx: api initialized (async)
[    4.240337] i915 0000:00:02.0: [drm] Selective fetch area calculation fa=
iled in pipe A
[    4.710606] Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
[    4.745483] PM: Image not found (code -22)
[   10.690120] EXT4-fs (nvme0n1p4): orphan cleanup on readonly fs
[   10.690349] EXT4-fs (nvme0n1p4): mounted filesystem 7881f7bb-dbe6-4323-8=
87f-dd718adb7a8b ro with ordered data mode. Quota mode: none.
[   10.724336] Not activating Mandatory Access Control as /sbin/tomoyo-init=
 does not exist.
[   10.762273] systemd[1]: Inserted module 'autofs4'
[   11.128598] systemd[1]: systemd 257-2 running in system mode (+PAM +AUDI=
T +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +AC=
L +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBC=
RYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP=
2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBA=
RCHIVE)
[   11.128615] systemd[1]: Detected architecture x86-64.
[   11.137883] systemd[1]: Hostname set to <DuanesSpectre16>.
[   11.183812] systemd[1]: bpf-restrict-fs: Failed to load BPF object: No s=
uch process
[   11.271565] systemd[1]: Queued start job for default target graphical.ta=
rget.
[   11.322128] systemd[1]: Created slice system-getty.slice - Slice /system=
/getty.
[   11.322924] systemd[1]: Created slice system-modprobe.slice - Slice /sys=
tem/modprobe.
[   11.323444] systemd[1]: Created slice system-systemd\x2dfsck.slice - Sli=
ce /system/systemd-fsck.
[   11.324038] systemd[1]: Created slice system-xfs_scrub.slice - xfs_scrub=
 background service slice.
[   11.324411] systemd[1]: Created slice user.slice - User and Session Slic=
e.
[   11.324486] systemd[1]: Started systemd-ask-password-wall.path - Forward=
 Password Requests to Wall Directory Watch.
[   11.324681] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automou=
nt - Arbitrary Executable File Formats File System Automount Point.
[   11.324706] systemd[1]: Expecting device dev-disk-by\x2duuid-12DE8F49DE8=
F2457.device - /dev/disk/by-uuid/12DE8F49DE8F2457...
[   11.324716] systemd[1]: Expecting device dev-disk-by\x2duuid-96c2339a\x2=
dae0c\x2d4a9d\x2d9d62\x2dfbbce901defc.device - /dev/disk/by-uuid/96c2339a-a=
e0c-4a9d-9d62-fbbce901defc...
[   11.324724] systemd[1]: Expecting device dev-disk-by\x2duuid-9DB2\x2d2D8=
0.device - /dev/disk/by-uuid/9DB2-2D80...
[   11.324759] systemd[1]: Reached target nss-user-lookup.target - User and=
 Group Name Lookups.
[   11.324788] systemd[1]: Reached target slices.target - Slice Units.
[   11.329208] systemd[1]: Listening on rpcbind.socket - RPCbind Server Act=
ivation Socket.
[   11.332439] systemd[1]: Listening on systemd-coredump.socket - Process C=
ore Dump Socket.
[   11.333061] systemd[1]: Listening on systemd-creds.socket - Credential E=
ncryption/Decryption.
[   11.333148] systemd[1]: Listening on systemd-initctl.socket - initctl Co=
mpatibility Named Pipe.
[   11.333227] systemd[1]: Listening on systemd-journald-dev-log.socket - J=
ournal Socket (/dev/log).
[   11.333301] systemd[1]: Listening on systemd-journald.socket - Journal S=
ockets.
[   11.333351] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements =
was skipped because of an unmet condition check (ConditionSecurity=3Dmeasur=
ed-uki).
[   11.333366] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was=
 skipped because of an unmet condition check (ConditionSecurity=3Dmeasured-=
uki).
[   11.333433] systemd[1]: Listening on systemd-udevd-control.socket - udev=
 Control Socket.
[   11.333482] systemd[1]: Listening on systemd-udevd-kernel.socket - udev =
Kernel Socket.
[   11.334562] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File S=
ystem...
[   11.335271] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue =
File System...
[   11.336088] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory=
 /run/lock...
[   11.336781] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug F=
ile System...
[   11.337489] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace=
 File System...
[   11.337577] systemd[1]: auth-rpcgss-module.service - Kernel Module suppo=
rting RPCSEC_GSS was skipped because of an unmet condition check (Condition=
PathExists=3D/etc/krb5.keytab).
[   11.338671] systemd[1]: Starting keyboard-setup.service - Set the consol=
e keyboard layout...
[   11.339473] systemd[1]: Starting kmod-static-nodes.service - Create List=
 of Static Device Nodes...
[   11.340194] systemd[1]: Starting modprobe@configfs.service - Load Kernel=
 Module configfs...
[   11.341056] systemd[1]: Starting modprobe@drm.service - Load Kernel Modu=
le drm...
[   11.342023] systemd[1]: Starting modprobe@efi_pstore.service - Load Kern=
el Module efi_pstore...
[   11.342673] systemd[1]: Starting modprobe@fuse.service - Load Kernel Mod=
ule fuse...
[   11.342791] systemd[1]: systemd-fsck-root.service - File System Check on=
 Root Device was skipped because of an unmet condition check (ConditionPath=
Exists=3D!/run/initramfs/fsck-root).
[   11.342830] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hi=
bernate Storage Info was skipped because of an unmet condition check (Condi=
tionPathExists=3D/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-=
428f-9387-6d876050dc67).
[   11.345992] systemd[1]: Starting systemd-journald.service - Journal Serv=
ice...
[   11.347092] systemd[1]: Starting systemd-modules-load.service - Load Ker=
nel Modules...
[   11.347112] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID =
Measurement was skipped because of an unmet condition check (ConditionSecur=
ity=3Dmeasured-uki).
[   11.348453] systemd[1]: Starting systemd-remount-fs.service - Remount Ro=
ot and Kernel File Systems...
[   11.348499] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK=
 Setup was skipped because of an unmet condition check (ConditionSecurity=
=3Dmeasured-uki).
[   11.349665] systemd[1]: Starting systemd-udev-load-credentials.service -=
 Load udev Rules from Credentials...
[   11.349928] pstore: Using crash dump compression: deflate
[   11.350841] systemd[1]: Starting systemd-udev-trigger.service - Coldplug=
 All udev Devices...
[   11.353165] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File Sy=
stem.
[   11.353287] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue F=
ile System.
[   11.353371] systemd[1]: Mounted run-lock.mount - Legacy Locks Directory =
/run/lock.
[   11.353449] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug Fi=
le System.
[   11.353523] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace =
File System.
[   11.353762] systemd[1]: Finished kmod-static-nodes.service - Create List=
 of Static Device Nodes.
[   11.354031] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[   11.354195] systemd[1]: Finished modprobe@configfs.service - Load Kernel=
 Module configfs.
[   11.354451] systemd[1]: modprobe@drm.service: Deactivated successfully.
[   11.354599] systemd[1]: Finished modprobe@drm.service - Load Kernel Modu=
le drm.
[   11.354829] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[   11.354966] systemd[1]: Finished modprobe@fuse.service - Load Kernel Mod=
ule fuse.
[   11.356399] systemd[1]: Mounting sys-fs-fuse-connections.mount - FUSE Co=
ntrol File System...
[   11.357191] systemd[1]: Mounting sys-kernel-config.mount - Kernel Config=
uration File System...
[   11.357884] systemd[1]: Starting systemd-tmpfiles-setup-dev-early.servic=
e - Create Static Device Nodes in /dev gracefully...
[   11.358547] systemd[1]: Finished systemd-udev-load-credentials.service -=
 Load udev Rules from Credentials.
[   11.359924] systemd-journald[576]: Collecting audit messages is disabled=
.
[   11.360075] lp: driver loaded but no devices found
[   11.360157] systemd[1]: Mounted sys-fs-fuse-connections.mount - FUSE Con=
trol File System.
[   11.361001] pstore: Registered efi_pstore as persistent store backend
[   11.361672] systemd[1]: modprobe@efi_pstore.service: Deactivated success=
fully.
[   11.361825] systemd[1]: Finished modprobe@efi_pstore.service - Load Kern=
el Module efi_pstore.
[   11.362931] ppdev: user-space parallel port driver
[   11.363619] systemd[1]: Mounted sys-kernel-config.mount - Kernel Configu=
ration File System.
[   11.371234] systemd[1]: Finished systemd-tmpfiles-setup-dev-early.servic=
e - Create Static Device Nodes in /dev gracefully.
[   11.372580] systemd[1]: Finished keyboard-setup.service - Set the consol=
e keyboard layout.
[   11.390690] systemd[1]: Started systemd-journald.service - Journal Servi=
ce.
[   11.400263] EXT4-fs (nvme0n1p4): re-mounted 7881f7bb-dbe6-4323-887f-dd71=
8adb7a8b r/w. Quota mode: none.
[   11.410871] systemd-journald[576]: Received client request to flush runt=
ime journal.
[   11.411566] systemd-journald[576]: File /var/log/journal/54ee1141a1d9472=
79019e6780d39ffc3/system.journal corrupted or uncleanly shut down, renaming=
 and replacing.
[   11.436804] nvidia: loading out-of-tree module taints kernel.
[   11.436811] nvidia: module license 'NVIDIA' taints kernel.
[   11.436812] Disabling lock debugging due to kernel taint
[   11.436814] nvidia: module verification failed: signature and/or require=
d key missing - tainting kernel
[   11.436814] nvidia: module license taints kernel.
[   11.533688] ACPI: AC: AC Adapter [ADP1] (off-line)
[   11.550106] Adding 66559996k swap on /dev/nvme0n1p7.  Priority:-2 extent=
s:1 across:66559996k SS
[   11.590445] resource: resource sanity check: requesting [mem 0x00000000f=
edc0000-0x00000000fedcffff], which spans more than pnp 00:03 [mem 0xfedc000=
0-0xfedc7fff]
[   11.590454] caller igen6_probe+0x15e/0x7c0 [igen6_edac] mapping multiple=
 BARs
[   11.590598] mc: Linux media interface: v0.10
[   11.592671] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[   11.592829] EDAC MC0: Giving out device to module igen6_edac controller =
Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[   11.592879] iTCO_vendor_support: vendor-support=3D0
[   11.593141] nvidia-nvlink: Nvlink Core is being initialized, major devic=
e number 235

[   11.594911] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sen=
sor may not work
[   11.595033] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin numbe=
r mismatch _DSM 11 resource 107
[   11.596983] EDAC MC1: Giving out device to module igen6_edac controller =
Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[   11.597014] EDAC igen6 MC1: HANDLING IBECC MEMORY ERROR
[   11.597017] EDAC igen6 MC1: ADDR 0x7fffffffe0=20
[   11.597018] EDAC igen6 MC0: HANDLING IBECC MEMORY ERROR
[   11.597020] EDAC igen6 MC0: ADDR 0x7fffffffe0=20
[   11.597538] EDAC igen6: v2.5.1
[   11.597565] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[   11.598389] intel-ipu6 0000:00:05.0: IPU6 in secure mode touch 0x8000000=
0 mask 0x0
[   11.598659] Consider using thermal netlink events interface
[   11.599479] int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mism=
atch _DSM 49 resource 209
[   11.600767] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=3D6=
, TCOBASE=3D0x0400)
[   11.600930] iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=
=3D0)
[   11.603799] pci 0000:00:08.0: Setting to D3hot
[   11.604777] Serial bus multi instantiate pseudo device driver CSC3551:00=
: Instantiated 2 I2C devices.
[   11.604789] input: Intel HID events as /devices/platform/INTC1077:00/inp=
ut/input37
[   11.604927] intel-hid INTC1077:00: failed to enable HID power button
[   11.605145] input: Intel HID events as /devices/platform/INT33D5:00/inpu=
t/input38
[   11.605441] intel-hid INT33D5:00: platform supports 5 button array
[   11.605725] videodev: Linux video capture interface: v2.00
[   11.606236] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.L=
PCB.HEC.DPTF.FCHG], AE_NOT_FOUND (20240827/psargs-332)
[   11.606245] ACPI Error: Aborting method \_SB.IETM.CHRG.PPSS due to previ=
ous error (AE_NOT_FOUND) (20240827/psparse-529)
[   11.606378] input: Intel HID 5 button array as /devices/platform/INT33D5=
:00/input/input39
[   11.606463] input: PC Speaker as /devices/platform/pcspkr/input/input40
[   11.608879] input: HP WMI hotkeys as /devices/virtual/input/input41
[   11.613291] intel-ipu6 0000:00:05.0: FW version: 20230925
[   11.614021] pci 0000:00:0b.0: Setting to D3hot
[   11.614072] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
[   11.614106] intel-ipu6 0000:00:05.0: Connected 1 cameras
[   11.616310] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
[   11.626022] pci 0000:00:14.2: enabling device (0000 -> 0002)
[   11.626444] intel_pmc_core INT33A1:00: Assuming a default substate order=
 for this platform
[   11.626494] intel_pmc_core INT33A1:00:  initialized
[   11.635244] Bluetooth: Core ver 2.22
[   11.635288] NET: Registered PF_BLUETOOTH protocol family
[   11.635290] Bluetooth: HCI device and connection manager initialized
[   11.635297] Bluetooth: HCI socket layer initialized
[   11.635300] Bluetooth: L2CAP socket layer initialized
[   11.635303] Bluetooth: SCO socket layer initialized
[   11.656614] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[   11.658724] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[   11.658848] Loaded X.509 cert 'benh@debian.org: 577e021cb980e0e820821ba7=
b54b4961b8b4fadf'
[   11.658960] Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6ec146e09d1=
b6016ab9d6cf71dd233f0328'
[   11.659071] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   11.659186] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db1=
8c600'
[   11.659325] ov08x40 i2c-OVTI08F4:00: failed to find sensor: -5
[   11.659400] ov08x40 i2c-OVTI08F4:00: probe with driver ov08x40 failed wi=
th error -5
[   11.660494] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 655360=
 ms ovfl timer
[   11.660497] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[   11.660498] RAPL PMU: hw unit of domain package 2^-14 Joules
[   11.660498] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[   11.663373] cryptd: max_cpu_qlen set to 1000
[   11.664492] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Adding DSD propert=
ies for 103C8C17
[   11.664543] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 0002=
)
[   11.664826] intel_rapl_common: Found RAPL domain package
[   11.664845] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Using extra _DSD p=
roperties, bypassing _DSD in ACPI
[   11.667089] usbcore: registered new interface driver btusb
[   11.669466] Bluetooth: hci0: Device revision is 0
[   11.669479] Bluetooth: hci0: Secure boot is enabled
[   11.669483] Bluetooth: hci0: OTP lock is enabled
[   11.669486] Bluetooth: hci0: API lock is enabled
[   11.669489] Bluetooth: hci0: Debug lock is disabled
[   11.669492] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[   11.669497] Bluetooth: hci0: Bootloader timestamp 2022.18 buildtype 1 bu=
ild 49266
[   11.669835] AES CTR mode by8 optimization enabled
[   11.669870] Bluetooth: hci0: DSM reset method type: 0x00
[   11.676174] Bluetooth: hci0: Found device firmware: intel/ibt-0180-0041.=
sfi
[   11.676232] Bluetooth: hci0: Boot Address: 0x100800
[   11.676234] Bluetooth: hci0: Firmware Version: 171-18.24
[   11.676937] Intel(R) Wireless WiFi driver for Linux
[   11.676949] intel_rapl_msr: PL4 support detected.
[   11.676991] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[   11.676997] intel_rapl_common: Found RAPL domain package
[   11.676999] intel_rapl_common: Found RAPL domain core
[   11.677001] intel_rapl_common: Found RAPL domain uncore
[   11.679041] nvidia 0000:56:00.0: enabling device (0002 -> 0003)
[   11.679165] nvidia 0000:56:00.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dnone
[   11.679330] iwlwifi 0000:00:14.3: Detected crf-id 0x400410, cnv-id 0x108=
0800 wfpm id 0x80005b20
[   11.679342] iwlwifi 0000:00:14.3: PCI dev 7e40/0094, rev=3D0x441, rfid=
=3D0x2010d000
[   11.679345] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6E AX211 160MH=
z
[   11.681009] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ p=
latform, using SOF driver
[   11.681056] snd_hda_intel 0000:56:00.1: enabling device (0000 -> 0002)
[   11.681119] snd_hda_intel 0000:56:00.1: Disabling MSI
[   11.681124] snd_hda_intel 0000:56:00.1: Handle vga_switcheroo audio clie=
nt
[   11.681994] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.0=
.3.94
[   11.682571] iwlwifi 0000:00:14.3: firmware: failed to load iwl-debug-yoy=
o.bin (-2)
[   11.682582] iwlwifi 0000:00:14.3: firmware: failed to load iwl-debug-yoy=
o.bin (-2)
[   11.682585] iwlwifi 0000:00:14.3: loaded firmware version 89.202a2f7b.0 =
ma-b0-gf-a0-89.ucode op_mode iwlmvm
[   11.701812] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cirrus Logic CS35L=
41 (35a40), Revision: B2
[   11.701964] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Adding DSD propert=
ies for 103C8C17
[   11.702112] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Using extra _DSD p=
roperties, bypassing _DSD in ACPI
[   11.702115] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Reset line busy, a=
ssuming shared reset
[   11.703805] intel-ipu6 0000:00:05.0: CSE authenticate_run done
[   11.703818] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
[   11.732855] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input42
[   11.732896] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input43
[   11.732927] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input44
[   11.732954] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input45
[   11.737544] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cirrus Logic CS35L=
41 (35a40), Revision: B2
[   11.738308] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  535.216.03  =
Fri Oct 25 22:43:06 UTC 2024
[   11.790598] nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver fo=
r UNIX platforms  535.216.03  Fri Oct 25 22:41:13 UTC 2024
[   11.796120] typec port0: bound usb3-port1 (ops connector_ops [usbcore])
[   11.796151] typec port0: bound usb2-port1 (ops connector_ops [usbcore])
[   11.816817] sof-audio-pci-intel-mtl 0000:00:1f.3: enabling device (0000 =
-> 0002)
[   11.816995] sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI =
class/subclass/prog-if 0x040100
[   11.817053] sof-audio-pci-intel-mtl 0000:00:1f.3: bound 0000:00:02.0 (op=
s i915_audio_component_bind_ops [i915])
[   11.818335] [drm] [nvidia-drm] [GPU ID 0x00005600] Loading driver
[   11.818339] [drm] Initialized nvidia-drm 0.0.0 for 0000:56:00.0 on minor=
 1
[   11.818949] ------------[ cut here ]------------
[   11.818951] WARNING: CPU: 1 PID: 461 at drivers/gpu/drm/drm_file.c:312 d=
rm_open_helper+0x132/0x150 [drm]
[   11.818986] Modules linked in: intel_uncore_frequency(+) intel_uncore_fr=
equency_common nvidia_drm(POE) snd_sof_pci_intel_mtl(+) x86_pkg_temp_therma=
l snd_sof_intel_hda_generic soundwire_intel soundwire_generic_allocation so=
undwire_cadence snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda=
_mlink snd_sof_intel_hda snd_sof_pci intel_powerclamp snd_sof_xtensa_dsp sn=
d_sof coretemp intel_ipu6_isys snd_sof_utils snd_hda_ext_core iwlmvm(+) vid=
eobuf2_dma_sg snd_soc_acpi_intel_match snd_hda_scodec_cs35l41_spi videobuf2=
_memops nvidia_modeset(POE) kvm_intel snd_soc_acpi videobuf2_v4l2 regmap_sp=
i videobuf2_common snd_soc_core mac80211 kvm snd_hda_codec_hdmi snd_compres=
s snd_pcm_dmaengine libarc4 soundwire_bus crct10dif_pclmul ghash_clmulni_in=
tel snd_hda_intel sha512_ssse3 sha256_ssse3 snd_intel_dspcfg intel_rapl_msr=
 sha1_ssse3 snd_intel_sdw_acpi iwlwifi aesni_intel snd_hda_codec btusb gf12=
8mul crypto_simd btrtl processor_thermal_device_pci snd_hda_scodec_cs35l41_=
i2c snd_hda_scodec_cs35l41 btintel cryptd
[   11.819004]  processor_thermal_device snd_hda_core processor_thermal_wt_=
hint snd_hda_cs_dsp_ctls btbcm rapl processor_thermal_rfim snd_soc_cs_amp_l=
ib btmtk ov08x40 processor_thermal_rapl snd_hwdep cs_dsp cfg80211 v4l2_fwno=
de hid_sensor_accel_3d hid_sensor_gyro_3d intel_cstate hid_sensor_magn_3d h=
id_sensor_rotation intel_rapl_common snd_pcm hid_sensor_trigger snd_soc_cs3=
5l41_lib v4l2_async ucsi_acpi intel_skl_int3472_tps68470 processor_thermal_=
wt_req bluetooth intel_uncore hp_wmi pcspkr int3403_thermal snd_timer platf=
orm_profile typec_ucsi videodev intel_pmc_core wmi_bmof iTCO_wdt snd hid_se=
nsor_iio_common processor_thermal_power_floor mei_me intel_ipu6 industriali=
o_triggered_buffer typec intel_pmc_bxt intel_hid processor_thermal_mbox int=
3400_thermal pmt_telemetry kfifo_buf intel_skl_int3472_discrete iTCO_vendor=
_support watchdog soundcore mei industrialio rfkill intel_vsec ipu_bridge i=
nt340x_thermal_zone igen6_edac roles serial_multi_instantiate mc acpi_therm=
al_rel intel_skl_int3472_common acpi_tad sparse_keymap
[   11.819022]  soc_button_array pmt_class acpi_pad joydev ac evdev serio_r=
aw nvidia(POE) msr parport_pc ppdev lp parport configfs efi_pstore nfnetlin=
k ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 btrfs blake2b_generic =
efivarfs raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor a=
sync_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 md_mod hid_sensor=
_custom hid_sensor_hub intel_ishtp_hid i915 hid_multitouch drm_buddy i2c_al=
go_bit drm_display_helper cec rc_core hid_generic xhci_pci xhci_hcd ttm i2c=
_hid_acpi i2c_hid usbcore drm_kms_helper hid intel_lpss_pci nvme intel_ish_=
ipc video mxm_wmi i2c_i801 intel_lpss drm thunderbolt nvme_core crc32_pclmu=
l crc32c_intel intel_ishtp idma64 i2c_smbus usb_common battery pinctrl_mete=
orlake wmi fan button
[   11.819044] CPU: 1 UID: 0 PID: 461 Comm: plymouthd Tainted: P           =
OE      6.12.5-ipu6 #7=20
[   11.819047] Tainted: [P]=3DPROPRIETARY_MODULE, [O]=3DOOT_MODULE, [E]=3DU=
NSIGNED_MODULE
[   11.819048] Hardware name: HP HP Spectre x360 2-in-1 Laptop 16t-aa000/8C=
17, BIOS F.11 08/14/2024
[   11.819049] RIP: 0010:drm_open_helper+0x132/0x150 [drm]
[   11.819071] Code: 43 62 e4 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 =
5f c3 cc cc cc cc 48 89 df 89 44 24 04 e8 64 fa ff ff 8b 44 24 04 eb db <0f=
> 0b b8 ea ff ff ff eb d2 b8 ea ff ff ff eb cb b8 f0 ff ff ff eb
[   11.819072] RSP: 0018:ffffb34b40e2fad0 EFLAGS: 00010246
[   11.819074] RAX: ffffffffc6322220 RBX: ffff9f870ec5c7a8 RCX: 00000000000=
00000
[   11.819075] RDX: ffff9f8716ea8000 RSI: ffff9f870ec5c7a8 RDI: ffff9f87077=
12e40
[   11.819075] RBP: ffff9f8707712e40 R08: ffff9f872367c9f0 R09: ffff9f87002=
527d0
[   11.819076] R10: 00000000000000e2 R11: 0000000000000002 R12: ffff9f8780a=
4c800
[   11.819077] R13: ffffffffc6322220 R14: 00000000ffffffed R15: ffff9f88a80=
3a750
[   11.819078] FS:  00007f9fe3143000(0000) GS:ffff9f8e5fa80000(0000) knlGS:=
0000000000000000
[   11.819079] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.819079] CR2: 000056199b502e00 CR3: 0000000123646001 CR4: 0000000000f=
72ef0
[   11.819080] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[   11.819081] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 00000000000=
00400
[   11.819082] PKRU: 55555554
[   11.819082] Call Trace:
[   11.819084]  <TASK>
[   11.819085]  ? drm_open_helper+0x132/0x150 [drm]
[   11.819105]  ? __warn.cold+0x93/0xf6
[   11.819109]  ? drm_open_helper+0x132/0x150 [drm]
[   11.819130]  ? report_bug+0xff/0x140
[   11.819131]  ? handle_bug+0x58/0x90
[   11.819133]  ? exc_invalid_op+0x17/0x70
[   11.819134]  ? asm_exc_invalid_op+0x1a/0x20
[   11.819138]  ? drm_open_helper+0x132/0x150 [drm]
[   11.819158]  drm_open+0x73/0x110 [drm]
[   11.819179]  drm_stub_open+0x9b/0xd0 [drm]
[   11.819200]  chrdev_open+0xb2/0x230
[   11.819202]  ? __pfx_chrdev_open+0x10/0x10
[   11.819204]  do_dentry_open+0x14c/0x440
[   11.819206]  vfs_open+0x2e/0xe0
[   11.819208]  path_openat+0x82e/0x12d0
[   11.819210]  do_filp_open+0xc4/0x170
[   11.819212]  do_sys_openat2+0xae/0xe0
[   11.819214]  __x64_sys_openat+0x55/0xa0
[   11.819216]  do_syscall_64+0x82/0x190
[   11.819218]  ? syscall_exit_to_user_mode+0x4d/0x210
[   11.819219]  ? do_syscall_64+0x8e/0x190
[   11.819221]  ? __flush_tlb_all+0x13/0x30
[   11.819223]  ? __flush_smp_call_function_queue+0xab/0x410
[   11.819225]  ? __irq_exit_rcu+0x37/0xb0
[   11.819228]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   11.819230] RIP: 0033:0x7f9fe33e8bb8
[   11.819231] Code: 48 89 44 24 20 75 96 44 89 54 24 0c e8 a1 b6 f8 ff 44 =
8b 54 24 0c 89 da 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 30 44 89 c7 89 44 24 0c e8 f4 b6 f8 ff 8b 44
[   11.819232] RSP: 002b:00007ffe8fe04310 EFLAGS: 00000293 ORIG_RAX: 000000=
0000000101
[   11.819233] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f9fe33=
e8bb8
[   11.819234] RDX: 0000000000000002 RSI: 0000560e0c1439d0 RDI: 00000000fff=
fff9c
[   11.819235] RBP: 0000560e0c1439d0 R08: 0000000000000000 R09: 00000000000=
00000
[   11.819235] R10: 0000000000000000 R11: 0000000000000293 R12: 00007f9fe31=
42f88
[   11.819236] R13: 00007f9fe3504840 R14: 000000000000000b R15: 0000560e0c1=
438b0
[   11.819237]  </TASK>
[   11.819237] ---[ end trace 0000000000000000 ]---
[   11.824260] sof-audio-pci-intel-mtl 0000:00:1f.3: use msi interrupt mode
[   11.840355] sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask=
 5
[   11.840357] sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driv=
er skl_hda_dsp_generic now
[   11.840359] sof-audio-pci-intel-mtl 0000:00:1f.3: NHLT device BT(0) dete=
cted, ssp_mask 0x4
[   11.840360] sof-audio-pci-intel-mtl 0000:00:1f.3: BT link detected in NH=
LT tables: 0x4
[   11.840361] sof-audio-pci-intel-mtl 0000:00:1f.3: DMICs detected in NHLT=
 tables: 2
[   11.842822] sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files f=
or ipc type 1:
[   11.842824] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     in=
tel/sof-ipc4/mtl/sof-mtl.ri
[   11.842824] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: in=
tel/sof-ipc4-lib/mtl
[   11.842825] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     in=
tel/sof-ace-tplg/sof-hda-generic-2ch.tplg
[   11.843426] sof-audio-pci-intel-mtl 0000:00:1f.3: Loaded firmware librar=
y: ADSPFW, version: 2.11.1.1
[   11.976730] sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware versio=
n: 2.11.1.1
[   11.986579] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for RT uCode
[   11.986612] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[   11.986622] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   11.986628] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[   11.986635] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   11.987027] iwlwifi 0000:00:14.3: loaded PNVM version 35148b80
[   11.987416] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[   11.989737] sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 K=
ernel ABI 3:23:1
[   11.990156] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card n=
ot yet available, widget card binding deferred
[   12.002706] iwlwifi 0000:00:14.3: Detected RF GF, rfid=3D0x2010d000
[   12.010441] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.wmfw (-2)
[   12.010523] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.wmfw (-2)
[   12.010623] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-l0.wmfw (-2)
[   12.010720] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-l0.wmfw (-2)
[   12.010922] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[   12.010926] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[   12.011943] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bincfg (-2)
[   12.012022] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bincfg (-2)
[   12.012024] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[   12.012025] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight=
 Time
[   12.068374] iwlwifi 0000:00:14.3: base HW address: d0:65:78:ec:0a:e5
[   12.104506] iwlwifi 0000:00:14.3 wlo1: renamed from wlan0
[   12.464424] audit: type=3D1400 audit(1734571184.856:2): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-x=
pdfimport" pid=3D1025 comm=3D"apparmor_parser"
[   12.464531] audit: type=3D1400 audit(1734571184.856:3): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"lsb_release" =
pid=3D1014 comm=3D"apparmor_parser"
[   12.464596] audit: type=3D1400 audit(1734571184.856:4): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-o=
osplash" pid=3D1022 comm=3D"apparmor_parser"
[   12.464630] audit: type=3D1400 audit(1734571184.856:5): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-s=
enddoc" pid=3D1023 comm=3D"apparmor_parser"
[   12.464823] audit: type=3D1400 audit(1734571184.856:6): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be" pid=3D1017 comm=3D"apparmor_parser"
[   12.464826] audit: type=3D1400 audit(1734571184.856:7): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be//kmod" pid=3D1017 comm=3D"apparmor_parser"
[   12.465072] audit: type=3D1400 audit(1734571184.856:8): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/libexec/=
ibus-engine-hangul" pid=3D1027 comm=3D"apparmor_parser"
[   12.465113] audit: type=3D1400 audit(1734571184.856:9): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/sbin/cup=
s-browsed" pid=3D1029 comm=3D"apparmor_parser"
[   12.465214] audit: type=3D1400 audit(1734571184.856:10): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"mariadbd_ako=
nadi" pid=3D1015 comm=3D"apparmor_parser"
[   12.465506] audit: type=3D1400 audit(1734571184.856:11): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"mysqld_akona=
di" pid=3D1016 comm=3D"apparmor_parser"
[   12.465543] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 40=
0a4 vendor: 0x2 v0.60.0, 2 algorithms
[   12.466668] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17-spkid0-l0.bin: v0.60.0
[   12.466674] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: C:=
\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_toolin=
g_4KHz-6dBhighshelf\HP_
[   12.525554] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Calibration applie=
d: R0=3D10501
[   12.533725] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   12.533728] Bluetooth: BNEP filters: protocol multicast
[   12.533731] Bluetooth: BNEP socket layer initialized
[   12.539967] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded - =
Type: spk-prot, Gain: 17
[   12.540063] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SS=
ID: 103C8C17, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 0
[   12.540069] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35=
l41-hda.0 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[   12.540195] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.wmfw (-2)
[   12.540309] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.wmfw (-2)
[   12.540395] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-r0.wmfw (-2)
[   12.540508] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-r0.wmfw (-2)
[   12.540518] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[   12.540524] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[   12.540864] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bincfg (-2)
[   12.540873] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bincfg (-2)
[   12.540876] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[   12.540878] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight=
 Time
[   12.569425] block nvme0n1: No UUID available providing old NGUID
[   12.601605] NET: Registered PF_QIPCRTR protocol family
[   12.993322] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for RT uCode
[   12.993437] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[   12.993448] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   12.993454] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[   12.993462] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   12.994238] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[   12.994656] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 40=
0a4 vendor: 0x2 v0.60.0, 2 algorithms
[   12.995788] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17-spkid0-r0.bin: v0.60.0
[   12.995795] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: C:=
\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_toolin=
g_4KHz-6dBhighshelf\HP_
[   13.054856] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration applie=
d: R0=3D10902
[   13.069158] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded - =
Type: spk-prot, Gain: 17
[   13.069272] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SS=
ID: 103C8C17, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 0
[   13.069279] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35=
l41-hda.1 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[   13.069569] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC245: li=
ne_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[   13.069572] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[   13.069574] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[   13.069575] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=3D0x0
[   13.069576] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[   13.069577] snd_hda_codec_realtek ehdaudio0D0:      Mic=3D0x19
[   13.081735] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, wit=
h index: 0
[   13.113787] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_=
controls: no PCM in topology for HDMI converter 3
[   13.131352] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/s=
kl_hda_dsp_generic/sound/card1/input46
[   13.131432] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:=
1f.3/skl_hda_dsp_generic/sound/card1/input47
[   13.131493] input: sof-hda-dsp HDMI/DP,pcm=3D3 as /devices/pci0000:00/00=
00:00:1f.3/skl_hda_dsp_generic/sound/card1/input48
[   13.131547] input: sof-hda-dsp HDMI/DP,pcm=3D4 as /devices/pci0000:00/00=
00:00:1f.3/skl_hda_dsp_generic/sound/card1/input49
[   13.131587] input: sof-hda-dsp HDMI/DP,pcm=3D5 as /devices/pci0000:00/00=
00:00:1f.3/skl_hda_dsp_generic/sound/card1/input50
[   13.160147] Bluetooth: hci0: Waiting for firmware download to complete
[   13.160425] Bluetooth: hci0: Firmware loaded in 1449457 usecs
[   13.160509] Bluetooth: hci0: Waiting for device to boot
[   13.163350] hid-sensor-hub 001F:8087:0AC2.0005: hid_field_extract() call=
ed with n (192) > 32! (kworker/13:3)
[   13.202543] Bluetooth: hci0: Device booted in 41082 usecs
[   13.204908] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0180-=
0041.ddc
[   13.206672] Bluetooth: hci0: Applying Intel DDC parameters completed
[   13.209453] Bluetooth: hci0: Firmware timestamp 2024.18 buildtype 1 buil=
d 3243
[   13.209464] Bluetooth: hci0: Firmware SHA1: 0xa8bb3f39
[   13.213430] Bluetooth: hci0: Fseq status: Success (0x00)
[   13.213435] Bluetooth: hci0: Fseq executed: 00.00.03.94
[   13.213439] Bluetooth: hci0: Fseq BT Top: 00.00.03.94
[   13.305987] Bluetooth: MGMT ver 1.23
[   13.311680] NET: Registered PF_ALG protocol family
[   13.330037] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for RT uCode
[   13.330100] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[   13.330115] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   13.330121] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[   13.330129] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   13.330911] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[   13.336607] Bluetooth: RFCOMM TTY layer initialized
[   13.336633] Bluetooth: RFCOMM socket layer initialized
[   13.336638] Bluetooth: RFCOMM ver 1.11
[   13.452391] RPC: Registered named UNIX socket transport module.
[   13.452394] RPC: Registered udp transport module.
[   13.452394] RPC: Registered tcp transport module.
[   13.452395] RPC: Registered tcp-with-tls transport module.
[   13.452395] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   17.580780] netfs: FS-Cache loaded
[   17.581583] Key type dns_resolver registered
[   17.635335] Key type cifs.spnego registered
[   17.635346] Key type cifs.idmap registered
[   17.635876] CIFS: VFS: Use of the less secure dialect vers=3D1.0 is not =
recommended unless required for access to very old servers
[   17.635892] CIFS: Attempting to mount //192.168.1.248/NetFolder
[   17.635926] CIFS: VFS: Error connecting to socket. Aborting operation.
[   17.635929] CIFS: VFS: cifs_mount failed w/return code =3D -101
[   17.685136] NFS: Registering the id_resolver key type
[   17.685143] Key type id_resolver registered
[   17.685144] Key type id_legacy registered
[   25.349464] nvidia_uvm: module uses symbols nvUvmInterfaceDisableAccessC=
ntr from proprietary module nvidia, inheriting taint.
[   25.368445] nvidia-uvm: Loaded the UVM driver, major device number 510.
[   29.032201] wlo1: authenticate with f8:85:f9:0d:a2:e0 (local address=3Dd=
0:65:78:ec:0a:e5)
[   29.032766] wlo1: send auth to f8:85:f9:0d:a2:e0 (try 1/3)
[   29.062492] wlo1: authenticated
[   29.066023] wlo1: associate with f8:85:f9:0d:a2:e0 (try 1/3)
[   29.081034] wlo1: RX AssocResp from f8:85:f9:0d:a2:e0 (capab=3D0x1431 st=
atus=3D0 aid=3D3)
[   29.087529] wlo1: associated
[   29.218935] wlo1: Limiting TX power to 30 (30 - 0) dBm as advertised by =
f8:85:f9:0d:a2:e0
[   29.321105] show_signal: 20 callbacks suppressed
[   29.321111] traps: light-locker[2216] trap int3 ip:7f556c5e5f37 sp:7ffcb=
8af77d0 error:0 in libglib-2.0.so.0.8200.4[64f37,7f556c59f000+a0000]
[   29.416465] warning: `kdeconnectd' uses wireless extensions which will s=
top working for Wi-Fi 7 hardware; use nl80211
[   29.569199] audit: type=3D1400 audit(1734571201.960:32): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/devices/system/node/" pid=3D2363 comm=3D"mysqld" requested_mask=3D"r"=
 denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[   29.603952] audit: type=3D1400 audit(1734571202.000:33): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/devices/system/node/" pid=3D2365 comm=3D"mysqld" requested_mask=3D"r"=
 denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[   29.626091] audit: type=3D1400 audit(1734571202.020:34): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/usr/share/mariadb/charsets/Index.xml" pid=3D2365 comm=3D"mysqld" requeste=
d_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[   29.636102] audit: type=3D1400 audit(1734571202.028:35): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/block/" pid=3D2365 comm=3D"mysqld" requested_mask=3D"r" denied_mask=
=3D"r" fsuid=3D1000 ouid=3D0
[   29.652067] audit: type=3D1400 audit(1734571202.044:36): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/proc/2365/cgroup" pid=3D2365 comm=3D"mysqld" requested_mask=3D"r" denied_=
mask=3D"r" fsuid=3D1000 ouid=3D1000
[   29.652568] audit: type=3D1400 audit(1734571202.044:37): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/nvme/nvme0/nvme0n1/queue=
/physical_block_size" pid=3D2365 comm=3D"mysqld" requested_mask=3D"r" denie=
d_mask=3D"r" fsuid=3D1000 ouid=3D0
[   35.074483] input: MX Anywhere 3S Mouse as /devices/virtual/misc/uhid/00=
05:046D:B037.0009/input/input51
[   35.075035] hid-generic 0005:046D:B037.0009: input,hidraw8: BLUETOOTH HI=
D v0.03 Mouse [MX Anywhere 3S] on d0:65:78:ec:0a:e9
[  197.992581] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel IPU=
6 CSI2 0 failed with -5
[  200.014306] intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time ou=
t
[  264.846199] intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time ou=
t
[  266.862195] intel_ipu6_isys.isys intel_ipu6.isys.40: stream close time o=
ut

The test output:
duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=3D0 cam -c"\_SB_.P=
C00.LNK0" -C1
[0:03:17.712293544] [3128] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: =
IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
[0:03:17.712381262] [3128] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA =
module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
[0:03:17.712464042] [3128] DEBUG IPAModule ipa_module.cpp:333 ipa_soft_simp=
le.so: IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple=
.so is signed
[0:03:17.712480845] [3128] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA =
module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
[0:03:17.712525835] [3128]  INFO Camera camera_manager.cpp:327 libcamera v0=
.3.2+240-936a099e
[0:03:17.712742086] [3141] DEBUG Camera camera_manager.cpp:73 Starting came=
ra manager
[0:03:17.719547382] [3141] DEBUG DeviceEnumerator device_enumerator.cpp:230=
 New media device "intel-ipu6" created from /dev/media0
[0:03:17.720784066] [3141] DEBUG DeviceEnumerator device_enumerator_udev.cp=
p:96 Defer media device /dev/media0 due to 1 missing dependencies
[0:03:17.720885426] [3141] DEBUG DeviceEnumerator device_enumerator_udev.cp=
p:322 All dependencies for media device /dev/media0 found
[0:03:17.720892580] [3141] DEBUG DeviceEnumerator device_enumerator.cpp:258=
 Added device /dev/media0: intel-ipu6
[0:03:17.721065385] [3141] DEBUG Camera camera_manager.cpp:140 Found regist=
ered pipeline handler 'ipu3'
[0:03:17.721180166] [3141] DEBUG Camera camera_manager.cpp:140 Found regist=
ered pipeline handler 'simple'
[0:03:17.721203298] [3141] DEBUG DeviceEnumerator device_enumerator.cpp:318=
 Successful match for media device "intel-ipu6"
[0:03:17.721239496] [3141] DEBUG SimplePipeline simple.cpp:1585 Sensor foun=
d for /dev/media0
[0:03:17.721491759] [3141] DEBUG SimplePipeline simple.cpp:424 Found captur=
e device Intel IPU6 ISYS Capture 0
[0:03:17.721546686] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Exposure (0x00980911)
[0:03:17.721618232] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Horizontal Flip (0x00980914)
[0:03:17.721634232] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Vertical Flip (0x00980915)
[0:03:17.721645199] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Camera Orientation (0x009a0922)
[0:03:17.721673474] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Camera Sensor Rotation (0x009a0923)
[0:03:17.721682611] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Vertical Blanking (0x009e0901)
[0:03:17.721690062] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Horizontal Blanking (0x009e0902)
[0:03:17.721697427] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Analogue Gain (0x009e0903)
[0:03:17.721705109] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Link Frequency (0x009f0901)
[0:03:17.721714308] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Pixel Rate (0x009f0902)
[0:03:17.721722176] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Test Pattern (0x009f0903)
[0:03:17.721732704] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Digital Gain (0x009f0905)
[0:03:17.721917944] [3141] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-00=
36': Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
[0:03:17.721931002] [3141]  WARN CameraSensor camera_sensor_legacy.cpp:401 =
'ov08x40 4-0036': The PixelArraySize property has been defaulted to 3856x24=
16
[0:03:17.721937029] [3141] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-00=
36': Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
[0:03:17.721942397] [3141]  WARN CameraSensor camera_sensor_legacy.cpp:412 =
'ov08x40 4-0036': The PixelArrayActiveAreas property has been defaulted to =
(0, 0)/3856x2416
[0:03:17.721949477] [3141] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-00=
36': Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
[0:03:17.721953949] [3141]  WARN CameraSensor camera_sensor_legacy.cpp:420 =
'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
[0:03:17.721958290] [3141]  WARN CameraSensor camera_sensor_legacy.cpp:426 =
'ov08x40 4-0036': The sensor kernel driver needs to be fixed
[0:03:17.721962984] [3141]  WARN CameraSensor camera_sensor_legacy.cpp:428 =
'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in the l=
ibcamera sources for more information
[0:03:17.722592139] [3141]  WARN CameraSensorProperties camera_sensor_prope=
rties.cpp:458 No static properties available for 'ov08x40'
[0:03:17.722601700] [3141]  WARN CameraSensorProperties camera_sensor_prope=
rties.cpp:460 Please consider updating the camera sensor properties databas=
e
[0:03:17.722638174] [3141] DEBUG CameraSensor camera_sensor.cpp:401 Entity =
'ov08x40 4-0036' matched by CameraSensorLegacy
[0:03:17.722664549] [3141] DEBUG SimplePipeline simple.cpp:491 Found pipeli=
ne: [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Cap=
ture 0]
[0:03:17.722767593] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Exposure (0x00980911)
[0:03:17.722785964] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Horizontal Flip (0x00980914)
[0:03:17.722794781] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Vertical Flip (0x00980915)
[0:03:17.722801997] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Camera Orientation (0x009a0922)
[0:03:17.722812628] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Camera Sensor Rotation (0x009a0923)
[0:03:17.722820625] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Vertical Blanking (0x009e0901)
[0:03:17.722827793] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Horizontal Blanking (0x009e0902)
[0:03:17.722834740] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Analogue Gain (0x009e0903)
[0:03:17.722841976] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Link Frequency (0x009f0901)
[0:03:17.722850484] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Pixel Rate (0x009f0902)
[0:03:17.722859060] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Test Pattern (0x009f0903)
[0:03:17.722868759] [3141] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':=
 Control: Digital Gain (0x009f0905)
[0:03:17.722910749] [3141] DEBUG V4L2 v4l2_videodevice.cpp:631 /dev/video0[=
16:cap]: Opened device : isys: ipu6
[0:03:17.730833428] [3141] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106 =
Failed to open /dev/dma_heap/linux,cma: No such file or directory
[0:03:17.730848174] [3141] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106 =
Failed to open /dev/dma_heap/reserved: No such file or directory
[0:03:17.730856025] [3141] DEBUG DmaBufAllocator dma_buf_allocator.cpp:112 =
Using /dev/dma_heap/system
[0:03:17.734112003] [3141] DEBUG IPAManager ipa_manager.cpp:306 IPA module =
/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is v=
alid
[0:03:17.734215064] [3141] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializin=
g soft proxy: loading IPA from /usr/local/lib/x86_64-linux-gnu/libcamera/ip=
a_soft_simple.so
[0:03:17.735275411] [3141]  WARN IPAProxy ipa_proxy.cpp:160 Configuration f=
ile 'ov08x40.yaml' not found for IPA module 'simple', falling back to 'unca=
librated.yaml'
[0:03:17.735336675] [3141]  WARN IPASoft soft_simple.cpp:96 IPASoft: Failed=
 to create camera sensor helper for ov08x40
[0:03:17.735564927] [3141] DEBUG IPASoft soft_simple.cpp:117 IPASoft: Tunin=
g file version 1
[0:03:17.735652268] [3141] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instant=
iated algorithm 'BlackLevel'
[0:03:17.735713833] [3141] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instant=
iated algorithm 'Awb'
[0:03:17.735764837] [3141] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instant=
iated algorithm 'Lut'
[0:03:17.735794235] [3141] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instant=
iated algorithm 'Agc'
[0:03:17.735874903] [3141] DEBUG MediaDevice media_device.cpp:826 /dev/medi=
a0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
[0:03:17.735937929] [3141] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x4=
0 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 1928x1208-SG=
RBG10_1X10
[0:03:17.735950851] [3141] DEBUG SimplePipeline simple.cpp:780 Link 'Intel =
IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 1=
928x1208-SGRBG10_1X10
[0:03:17.735988395] [3141] DEBUG SimplePipeline simple.cpp:631 Adding confi=
guration for 1928x1208 in pixel formats [ BA10, pgAA ]
[0:03:17.736078147] [3141] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x4=
0 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 3856x2416-SG=
RBG10_1X10
[0:03:17.736086161] [3141] DEBUG SimplePipeline simple.cpp:780 Link 'Intel =
IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 3=
856x2416-SGRBG10_1X10
[0:03:17.736096530] [3141] DEBUG SimplePipeline simple.cpp:631 Adding confi=
guration for 3856x2416 in pixel formats [ BA10, pgAA ]
[0:03:17.736260807] [3141] DEBUG Camera camera_manager.cpp:161 Pipeline han=
dler "simple" matched
[0:03:17.736278108] [3141] DEBUG Camera camera_manager.cpp:140 Found regist=
ered pipeline handler 'uvcvideo'
[0:03:17.736602407] [3128] DEBUG SimplePipeline simple.cpp:1017 Largest str=
eam size is 3848x2416
[0:03:17.736620582] [3128] DEBUG SimplePipeline simple.cpp:1069 Picked 3856=
x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
[0:03:17.736654097] [3128] DEBUG Camera camera.cpp:1137 streams configurati=
on: (0) 3848x2416-ABGR8888
[0:03:17.736668859] [3128] DEBUG SimplePipeline simple.cpp:1017 Largest str=
eam size is 3848x2416
[0:03:17.736674307] [3128] DEBUG SimplePipeline simple.cpp:1069 Picked 3856=
x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
Using camera \_SB_.PC00.LNK0 as cam0
[0:03:17.736699152] [3128] DEBUG SimplePipeline simple.cpp:1017 Largest str=
eam size is 3848x2416
[0:03:17.736704790] [3128] DEBUG SimplePipeline simple.cpp:1069 Picked 3856=
x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
[0:03:17.736714214] [3128]  INFO Camera camera.cpp:1202 configuring streams=
: (0) 3848x2416-ABGR8888
[0:03:17.736839897] [3141] DEBUG MediaDevice media_device.cpp:826 /dev/medi=
a0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 0
[0:03:17.736868353] [3141] DEBUG MediaDevice media_device.cpp:826 /dev/medi=
a0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
[0:03:17.736923060] [3141] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x4=
0 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 3856x2416-SG=
RBG10_1X10
[0:03:17.736931545] [3141] DEBUG SimplePipeline simple.cpp:780 Link 'Intel =
IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 3=
856x2416-SGRBG10_1X10
[0:03:17.736964175] [3141]  WARN CameraSensor camera_sensor_legacy.cpp:501 =
'ov08x40 4-0036': No sensor delays found in static properties. Assuming unv=
erified defaults.
[0:03:17.737022032] [3141] DEBUG DelayedControls delayed_controls.cpp:99 Se=
t a delay of 2 and priority write flag 0 for Exposure
[0:03:17.737034898] [3141] DEBUG DelayedControls delayed_controls.cpp:99 Se=
t a delay of 1 and priority write flag 0 for Analogue Gain
[0:03:17.737144185] [3141]  INFO IPASoft soft_simple.cpp:251 IPASoft: Expos=
ure 4-4992, gain 0-1984 (1)
[0:03:17.740301040] [3141] DEBUG Buffer framebuffer.cpp:351 Buffer is conti=
guous
[0:03:17.743327531] [3141] DEBUG Buffer framebuffer.cpp:351 Buffer is conti=
guous
[0:03:17.746404511] [3141] DEBUG Buffer framebuffer.cpp:351 Buffer is conti=
guous
[0:03:17.749514426] [3141] DEBUG Buffer framebuffer.cpp:351 Buffer is conti=
guous
[0:03:17.749665071] [3128] DEBUG Request request.cpp:369 Created request - =
cookie: 0
[0:03:17.749728214] [3128] DEBUG Request request.cpp:369 Created request - =
cookie: 0
[0:03:17.749737106] [3128] DEBUG Request request.cpp:369 Created request - =
cookie: 0
[0:03:17.749744080] [3128] DEBUG Request request.cpp:369 Created request - =
cookie: 0
[0:03:17.749751335] [3128] DEBUG Camera camera.cpp:1360 Starting capture
[0:03:17.758990751] [3141] DEBUG V4L2 v4l2_videodevice.cpp:1311 /dev/video0=
[16:cap]: 3 buffers requested.
[0:03:17.759044143] [3141] DEBUG Buffer framebuffer.cpp:351 Buffer is conti=
guous
[0:03:17.759058275] [3141] DEBUG Buffer framebuffer.cpp:351 Buffer is conti=
guous
[0:03:17.759066688] [3141] DEBUG Buffer framebuffer.cpp:351 Buffer is conti=
guous
[0:03:17.759715976] [3141] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0=
[16:cap]: Queueing buffer 0
[0:03:20.009178069] [3141] ERROR V4L2 v4l2_videodevice.cpp:1754 /dev/video0=
[16:cap]: Failed to queue buffer 0: Input/output error
[0:03:20.009383268] [3141] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0=
[16:cap]: Queueing buffer 1
[0:03:20.196299744] [3141] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0=
[16:cap]: Queueing buffer 2
cam0: Capture 1 frames
^CExiting
[0:04:22.820128776] [3128] DEBUG Camera camera.cpp:1404 Stopping capture
[0:04:26.857118980] [3141] DEBUG Request request.cpp:129 Request(0:C:0/1:0)
[0:04:26.857335263] [3141] FATAL default v4l2_videodevice.cpp:2017 /dev/vid=
eo0[16:cap]: assertion "cache_->isEmpty()" failed in streamOff()
Backtrace:
libcamera::V4L2VideoDevice::streamOff()+0x31c (../src/libcamera/v4l2_videod=
evice.cpp:2019)
libcamera::SimplePipelineHandler::stopDevice(libcamera::Camera*)+0xbe (../s=
rc/libcamera/pipeline/simple/simple.cpp:1411)
libcamera::PipelineHandler::stop(libcamera::Camera*)+0x41 (../src/libcamera=
/pipeline_handler.cpp:367)
libcamera::BoundMethodMember<libcamera::PipelineHandler, void, libcamera::C=
amera*>::invoke(libcamera::Camera*)+0x66 (../include/libcamera/base/bound_m=
ethod.h:191)
std::enable_if<std::is_void<void>::value, void>::type libcamera::BoundMetho=
dArgs<void, libcamera::Camera*>::invokePack<0ul, void>(libcamera::BoundMeth=
odPackBase*, std::integer_sequence<unsigned long, 0ul>)+0x46 (../include/li=
bcamera/base/bound_method.h:116)
libcamera::BoundMethodArgs<void, libcamera::Camera*>::invokePack(libcamera:=
:BoundMethodPackBase*)+0x23 (../include/libcamera/base/bound_method.h:125)
libcamera::InvokeMessage::invoke()+0x42 (../src/libcamera/base/message.cpp:=
154)
libcamera::Object::message(libcamera::Message*)+0x76 (../src/libcamera/base=
/object.cpp:213)
libcamera::Thread::dispatchMessages(libcamera::Message::Type)+0x2d7 (../src=
/libcamera/base/thread.cpp:650)
libcamera::EventDispatcherPoll::processEvents()+0x25 (../src/libcamera/base=
/event_dispatcher_poll.cpp:149)
libcamera::Thread::exec()+0x5d (../src/libcamera/base/thread.cpp:310)
libcamera::CameraManager::Private::run()+0x105 (../src/libcamera/camera_man=
ager.cpp:91)
libcamera::Thread::startThread()+0xfa (../src/libcamera/base/thread.cpp:290=
)
void std::__invoke_impl<void, void (libcamera::Thread::*)(), libcamera::Thr=
ead*>(std::__invoke_memfun_deref, void (libcamera::Thread::*&&)(), libcamer=
a::Thread*&&)+0x5b (/usr/include/c++/14/bits/invoke.h:74)
std::__invoke_result<void (libcamera::Thread::*)(), libcamera::Thread*>::ty=
pe std::__invoke<void (libcamera::Thread::*)(), libcamera::Thread*>(void (l=
ibcamera::Thread::*&&)(), libcamera::Thread*&&)+0x37 (/usr/include/c++/14/b=
its/invoke.h:97)
void std::thread::_Invoker<std::tuple<void (libcamera::Thread::*)(), libcam=
era::Thread*> >::_M_invoke<0ul, 1ul>(std::_Index_tuple<0ul, 1ul>)+0x43 (/us=
r/include/c++/14/bits/std_thread.h:301)
std::thread::_Invoker<std::tuple<void (libcamera::Thread::*)(), libcamera::=
Thread*> >::operator()()+0x18 (/usr/include/c++/14/bits/std_thread.h:308)
std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (libcamera::=
Thread::*)(), libcamera::Thread*> > >::_M_run()+0x1c (/usr/include/c++/14/b=
its/std_thread.h:253)
??? [0x00007f423dce0ea4] (/usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.33 [0x=
00007f423dce0ea4])
start_thread+0x342 (./nptl/pthread_create.c:447)
__clone3+0x28 (../sysdeps/unix/sysv/linux/x86_64/clone3.S:80)
Aborted (core dumped)

  [ I hit Ctrl-C to exit]

Let me know if you need anything else.

Sincerely,
Duane


----- On Dec 18, 2024, at 6:50 PM, Bingbu Cao bingbu.cao@linux.intel.com wr=
ote:

> duanek,
>=20
> Could you share the kernel log(`dmesg`) and `media-ctl -p` output during =
the
> test?
>=20
> On 12/19/24 1:18 AM, Jacopo Mondi wrote:
>> On Wed, Dec 18, 2024 at 11:55:32AM -0500, duanek@chorus.net wrote:
>>> Dear Jacopo,
>>>
>>> Thank you for your patience. I do not see that option for qcam:
>>>
>>> duane@DuanesSpectre16:~/cameratest$  qcam --help
>>> Options:
>>>   -c, --camera camera                                   Specify which c=
amera to
>>>   operate on
>>>   -h, --help                                            Display this he=
lp message
>>>   -r, --renderer renderer                               Choose the rend=
erer type
>>>   {qt,gles} (default: qt)
>>>   -s, --stream key=3Dvalue[,key=3Dvalue,...] ...            Set configu=
ration of a
>>>   camera stream
>>>           colorspace=3Dstring                             Color space
>>>           height=3Dinteger                                Height in pix=
els
>>>           pixelformat=3Dstring                            Pixel format =
name
>>>           role=3Dstring                                   Role for the =
stream (viewfinder,
>>>           video, still, raw)
>>>           width=3Dinteger                                 Width in pixe=
ls
>>>   -v, --verbose                                         Print verbose l=
og messages
>>>
>>> The only option I can get to work is -c, like this:
>>=20
>> I'm sorry, I have probably confused the options for 'cam' with the
>> ones of 'qcam'.
>>=20
>>> duane@DuanesSpectre16:~/cameratest$ qcam -c"\_SB_.PC00.LNK0"
>>> [3:14:31.876601519] [31363]  INFO Camera camera_manager.cpp:327 libcame=
ra
>>> v0.3.2+240-936a099e
>>> [3:14:31.886875664] [31381] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40=
 4-0036':
>>> Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
>>> [3:14:31.886900048] [31381]  WARN CameraSensor camera_sensor_legacy.cpp=
:401
>>> 'ov08x40 4-0036': The PixelArraySize property has been defaulted to 385=
6x2416
>>> [3:14:31.886906346] [31381] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40=
 4-0036':
>>> Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
>>> [3:14:31.886912295] [31381]  WARN CameraSensor camera_sensor_legacy.cpp=
:412
>>> 'ov08x40 4-0036': The PixelArrayActiveAreas property has been defaulted=
 to (0,
>>> 0)/3856x2416
>>> [3:14:31.886920465] [31381] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40=
 4-0036':
>>> Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
>>> [3:14:31.886925006] [31381]  WARN CameraSensor camera_sensor_legacy.cpp=
:420
>>> 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
>>> [3:14:31.886929461] [31381]  WARN CameraSensor camera_sensor_legacy.cpp=
:426
>>> 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
>>> [3:14:31.886933697] [31381]  WARN CameraSensor camera_sensor_legacy.cpp=
:428
>>> 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in t=
he
>>> libcamera sources for more information
>>> [3:14:31.887689433] [31381]  WARN CameraSensorProperties
>>> camera_sensor_properties.cpp:458 No static properties available for 'ov=
08x40'
>>> [3:14:31.887701005] [31381]  WARN CameraSensorProperties
>>> camera_sensor_properties.cpp:460 Please consider updating the camera se=
nsor
>>> properties database
>>> [3:14:31.890987263] [31381]  WARN IPAProxy ipa_proxy.cpp:160 Configurat=
ion file
>>> 'ov08x40.yaml' not found for IPA module 'simple', falling back to
>>> 'uncalibrated.yaml'
>>> [3:14:31.891035884] [31381]  WARN IPASoft soft_simple.cpp:96 IPASoft: F=
ailed to
>>> create camera sensor helper for ov08x40
>>> [3:14:31.935843235] [31363]  INFO Camera camera.cpp:1202 configuring st=
reams:
>>> (0) 3848x2416-ABGR8888
>>> [3:14:31.936616226] [31381]  WARN CameraSensor camera_sensor_legacy.cpp=
:501
>>> 'ov08x40 4-0036': No sensor delays found in static properties. Assuming
>>> unverified defaults.
>>> [3:14:31.937070346] [31381]  INFO IPASoft soft_simple.cpp:251 IPASoft: =
Exposure
>>> 4-4992, gain 0-1984 (1)
>>> Zero-copy enabled
>>> [3:15:02.352735649] [31363]  INFO Camera camera.cpp:1202 configuring st=
reams:
>>> (0) 3848x2416-ABGR8888
>>> [3:15:02.353248777] [31381]  WARN CameraSensor camera_sensor_legacy.cpp=
:501
>>> 'ov08x40 4-0036': No sensor delays found in static properties. Assuming
>>> unverified defaults.
>>> [3:15:02.353398404] [31381]  INFO IPASoft soft_simple.cpp:251 IPASoft: =
Exposure
>>> 4-4992, gain 0-1984 (1)
>>> Zero-copy enabled
>>>
>>> Which presents a Qt window, which shows the offset camera outline with =
a slash
>>> through it.
>>> I can Stop and Play, but nothing changes in that window, or is saved
>>=20
>> Let's see if someone from the soft/simple/x86 camp has ideas, none of
>> the above error messages should prevent capture as far as I can
>> tell...
>>=20
>>>
>>> Sincerely,
>>> Duane
>>>
>>> ----- On Dec 18, 2024, at 10:36 AM, Jacopo Mondi jacopo.mondi@ideasonbo=
ard.com
>>> wrote:
>>>
>>>> Hi Duane
>>>>
>>>> On Wed, Dec 18, 2024 at 11:25:32AM -0500, duanek@chorus.net wrote:
>>>>> Dear Jacopo,
>>>>>
>>>>> Thanks for forwarding to libcamera - I'm a newbie and am not sure who=
 all should
>>>>> be involved.
>>>>>
>>>>> When I specify the camera, I get:
>>>>> duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=3D0 qcam
>>>>> -c"\_SB_.PC00.LNK0"
>>>>
>>>> You need '-C' to tell qcam you want to capture and how many frames
>>>>
>>>> qcam --help might help
>>>>
>>>>> [2:42:26.057450553] [29471] DEBUG IPAModule ipa_module.cpp:333 ipa_ip=
u3.so: IPA
>>>>> module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signe=
d
>>>>> [2:42:26.057555621] [29471] DEBUG IPAManager ipa_manager.cpp:235 Load=
ed IPA
>>>>> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
>>>>> [2:42:26.057657128] [29471] DEBUG IPAModule ipa_module.cpp:333
>>>>> ipa_soft_simple.so: IPA module
>>>>> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signe=
d
>>>>> [2:42:26.057679142] [29471] DEBUG IPAManager ipa_manager.cpp:235 Load=
ed IPA
>>>>> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
>>>>> [2:42:26.057753046] [29471]  INFO Camera camera_manager.cpp:327 libca=
mera
>>>>> v0.3.2+240-936a099e
>>>>> [2:42:26.057820003] [29488] DEBUG Camera camera_manager.cpp:73 Starti=
ng camera
>>>>> manager
>>>>> [2:42:26.064137023] [29488] DEBUG DeviceEnumerator device_enumerator.=
cpp:230 New
>>>>> media device "intel-ipu6" created from /dev/media0
>>>>> [2:42:26.065419467] [29488] DEBUG DeviceEnumerator device_enumerator_=
udev.cpp:96
>>>>> Defer media device /dev/media0 due to 1 missing dependencies
>>>>> [2:42:26.065544818] [29488] DEBUG DeviceEnumerator
>>>>> device_enumerator_udev.cpp:322 All dependencies for media device /dev=
/media0
>>>>> found
>>>>> [2:42:26.065552508] [29488] DEBUG DeviceEnumerator device_enumerator.=
cpp:258
>>>>> Added device /dev/media0: intel-ipu6
>>>>> [2:42:26.065764796] [29488] DEBUG Camera camera_manager.cpp:140 Found=
 registered
>>>>> pipeline handler 'ipu3'
>>>>> [2:42:26.065932776] [29488] DEBUG Camera camera_manager.cpp:140 Found=
 registered
>>>>> pipeline handler 'simple'
>>>>> [2:42:26.065961800] [29488] DEBUG DeviceEnumerator device_enumerator.=
cpp:318
>>>>> Successful match for media device "intel-ipu6"
>>>>> [2:42:26.066013314] [29488] DEBUG SimplePipeline simple.cpp:1585 Sens=
or found
>>>>> for /dev/media0
>>>>> [2:42:26.066363804] [29488] DEBUG SimplePipeline simple.cpp:424 Found=
 capture
>>>>> device Intel IPU6 ISYS Capture 0
>>>>> [2:42:26.066432874] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Exposure (0x00980911)
>>>>> [2:42:26.066533156] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Horizontal Flip (0x00980914)
>>>>> [2:42:26.066552146] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Vertical Flip (0x00980915)
>>>>> [2:42:26.066564186] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Camera Orientation (0x009a0922)
>>>>> [2:42:26.066598398] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>> [2:42:26.066607749] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Vertical Blanking (0x009e0901)
>>>>> [2:42:26.066615496] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>> [2:42:26.066624456] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Analogue Gain (0x009e0903)
>>>>> [2:42:26.066632496] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Link Frequency (0x009f0901)
>>>>> [2:42:26.066642252] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Pixel Rate (0x009f0902)
>>>>> [2:42:26.066650208] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Test Pattern (0x009f0903)
>>>>> [2:42:26.066661024] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Digital Gain (0x009f0905)
>>>>> [2:42:26.066898310] [29488] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x=
40 4-0036':
>>>>> Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
>>>>> [2:42:26.066913149] [29488]  WARN CameraSensor camera_sensor_legacy.c=
pp:401
>>>>> 'ov08x40 4-0036': The PixelArraySize property has been defaulted to 3=
856x2416
>>>>> [2:42:26.066919954] [29488] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x=
40 4-0036':
>>>>> Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
>>>>> [2:42:26.066925838] [29488]  WARN CameraSensor camera_sensor_legacy.c=
pp:412
>>>>> 'ov08x40 4-0036': The PixelArrayActiveAreas property has been default=
ed to (0,
>>>>> 0)/3856x2416
>>>>> [2:42:26.066933317] [29488] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x=
40 4-0036':
>>>>> Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
>>>>> [2:42:26.066938196] [29488]  WARN CameraSensor camera_sensor_legacy.c=
pp:420
>>>>> 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
>>>>> [2:42:26.066942687] [29488]  WARN CameraSensor camera_sensor_legacy.c=
pp:426
>>>>> 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
>>>>> [2:42:26.066947226] [29488]  WARN CameraSensor camera_sensor_legacy.c=
pp:428
>>>>> 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in=
 the
>>>>> libcamera sources for more information
>>>>> [2:42:26.067684243] [29488]  WARN CameraSensorProperties
>>>>> camera_sensor_properties.cpp:458 No static properties available for '=
ov08x40'
>>>>> [2:42:26.067693564] [29488]  WARN CameraSensorProperties
>>>>> camera_sensor_properties.cpp:460 Please consider updating the camera =
sensor
>>>>> properties database
>>>>> [2:42:26.067741878] [29488] DEBUG CameraSensor camera_sensor.cpp:401 =
Entity
>>>>> 'ov08x40 4-0036' matched by CameraSensorLegacy
>>>>> [2:42:26.067778580] [29488] DEBUG SimplePipeline simple.cpp:491 Found=
 pipeline:
>>>>> [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS C=
apture 0]
>>>>> [2:42:26.067916324] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Exposure (0x00980911)
>>>>> [2:42:26.067935252] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Horizontal Flip (0x00980914)
>>>>> [2:42:26.067945617] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Vertical Flip (0x00980915)
>>>>> [2:42:26.067954256] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Camera Orientation (0x009a0922)
>>>>> [2:42:26.067966526] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>> [2:42:26.067975684] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Vertical Blanking (0x009e0901)
>>>>> [2:42:26.067985047] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>> [2:42:26.067993028] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Analogue Gain (0x009e0903)
>>>>> [2:42:26.068007396] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Link Frequency (0x009f0901)
>>>>> [2:42:26.068017686] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Pixel Rate (0x009f0902)
>>>>> [2:42:26.068027135] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Test Pattern (0x009f0903)
>>>>> [2:42:26.068038204] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4=
-0036':
>>>>> Control: Digital Gain (0x009f0905)
>>>>> [2:42:26.068090416] [29488] DEBUG V4L2 v4l2_videodevice.cpp:631
>>>>> /dev/video0[28:cap]: Opened device : isys: ipu6
>>>>> [2:42:26.068226108] [29488] DEBUG DmaBufAllocator dma_buf_allocator.c=
pp:106
>>>>> Failed to open /dev/dma_heap/linux,cma: No such file or directory
>>>>> [2:42:26.068234837] [29488] DEBUG DmaBufAllocator dma_buf_allocator.c=
pp:106
>>>>> Failed to open /dev/dma_heap/reserved: No such file or directory
>>>>> [2:42:26.068241699] [29488] DEBUG DmaBufAllocator dma_buf_allocator.c=
pp:112
>>>>> Using /dev/dma_heap/system
>>>>> [2:42:26.070251295] [29488] DEBUG IPAManager ipa_manager.cpp:306 IPA =
module
>>>>> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signatur=
e is valid
>>>>> [2:42:26.070330771] [29488] DEBUG IPAProxy soft_ipa_proxy.cpp:45 init=
ializing
>>>>> soft proxy: loading IPA from
>>>>> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
>>>>> [2:42:26.070835928] [29488]  WARN IPAProxy ipa_proxy.cpp:160 Configur=
ation file
>>>>> 'ov08x40.yaml' not found for IPA module 'simple', falling back to
>>>>> 'uncalibrated.yaml'
>>>>> [2:42:26.070880076] [29488]  WARN IPASoft soft_simple.cpp:96 IPASoft:=
 Failed to
>>>>> create camera sensor helper for ov08x40
>>>>> [2:42:26.071040106] [29488] DEBUG IPASoft soft_simple.cpp:117 IPASoft=
: Tuning
>>>>> file version 1
>>>>> [2:42:26.071109941] [29488] DEBUG IPAModuleAlgo module.h:91 IPASoft:
>>>>> Instantiated algorithm 'BlackLevel'
>>>>> [2:42:26.071158211] [29488] DEBUG IPAModuleAlgo module.h:91 IPASoft:
>>>>> Instantiated algorithm 'Awb'
>>>>> [2:42:26.071203227] [29488] DEBUG IPAModuleAlgo module.h:91 IPASoft:
>>>>> Instantiated algorithm 'Lut'
>>>>> [2:42:26.071229619] [29488] DEBUG IPAModuleAlgo module.h:91 IPASoft:
>>>>> Instantiated algorithm 'Agc'
>>>>> [2:42:26.071324318] [29488] DEBUG MediaDevice media_device.cpp:826
>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS C=
apture
>>>>> 0'[0]: 0
>>>>> [2:42:26.071333254] [29488] DEBUG MediaDevice media_device.cpp:826
>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS C=
apture
>>>>> 0'[0]: 1
>>>>> [2:42:26.071401066] [29488] DEBUG SimplePipeline simple.cpp:780 Link =
'ov08x40
>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>> 1928x1208-SGRBG10_1X10
>>>>> [2:42:26.071416834] [29488] DEBUG SimplePipeline simple.cpp:780 Link =
'Intel IPU6
>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
>>>>> 1928x1208-SGRBG10_1X10
>>>>> [2:42:26.071466886] [29488] DEBUG SimplePipeline simple.cpp:631 Addin=
g
>>>>> configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
>>>>> [2:42:26.071554427] [29488] DEBUG SimplePipeline simple.cpp:780 Link =
'ov08x40
>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>> 3856x2416-SGRBG10_1X10
>>>>> [2:42:26.071561826] [29488] DEBUG SimplePipeline simple.cpp:780 Link =
'Intel IPU6
>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
>>>>> 3856x2416-SGRBG10_1X10
>>>>> [2:42:26.071572163] [29488] DEBUG SimplePipeline simple.cpp:631 Addin=
g
>>>>> configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
>>>>> [2:42:26.071786561] [29488] DEBUG Camera camera_manager.cpp:161 Pipel=
ine handler
>>>>> "simple" matched
>>>>> [2:42:26.071805509] [29488] DEBUG Camera camera_manager.cpp:140 Found=
 registered
>>>>> pipeline handler 'uvcvideo'
>>>>> [2:42:26.106083711] [29471] DEBUG SimplePipeline simple.cpp:1017 Larg=
est stream
>>>>> size is 3848x2416
>>>>> [2:42:26.106124827] [29471] DEBUG SimplePipeline simple.cpp:1069 Pick=
ed
>>>>> 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x=
2416
>>>>> [2:42:26.106193385] [29471] DEBUG Camera camera.cpp:1137 streams conf=
iguration:
>>>>> (0) 3848x2416-ABGR8888
>>>>> [2:42:26.106237153] [29471] DEBUG SimplePipeline simple.cpp:1017 Larg=
est stream
>>>>> size is 3848x2416
>>>>> [2:42:26.106243935] [29471] DEBUG SimplePipeline simple.cpp:1069 Pick=
ed
>>>>> 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x=
2416
>>>>> [2:42:26.106257446] [29471] DEBUG SimplePipeline simple.cpp:1017 Larg=
est stream
>>>>> size is 3848x2416
>>>>> [2:42:26.106264326] [29471] DEBUG SimplePipeline simple.cpp:1069 Pick=
ed
>>>>> 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x=
2416
>>>>> [2:42:26.106275551] [29471]  INFO Camera camera.cpp:1202 configuring =
streams:
>>>>> (0) 3848x2416-ABGR8888
>>>>> [2:42:26.106354216] [29488] DEBUG MediaDevice media_device.cpp:826
>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS C=
apture
>>>>> 0'[0]: 0
>>>>> [2:42:26.106386640] [29488] DEBUG MediaDevice media_device.cpp:826
>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS C=
apture
>>>>> 0'[0]: 1
>>>>> [2:42:26.106484769] [29488] DEBUG SimplePipeline simple.cpp:780 Link =
'ov08x40
>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>> 3856x2416-SGRBG10_1X10
>>>>> [2:42:26.106494021] [29488] DEBUG SimplePipeline simple.cpp:780 Link =
'Intel IPU6
>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
>>>>> 3856x2416-SGRBG10_1X10
>>>>> [2:42:26.106551423] [29488]  WARN CameraSensor camera_sensor_legacy.c=
pp:501
>>>>> 'ov08x40 4-0036': No sensor delays found in static properties. Assumi=
ng
>>>>> unverified defaults.
>>>>> [2:42:26.106642460] [29488] DEBUG DelayedControls delayed_controls.cp=
p:99 Set a
>>>>> delay of 2 and priority write flag 0 for Exposure
>>>>> [2:42:26.106658556] [29488] DEBUG DelayedControls delayed_controls.cp=
p:99 Set a
>>>>> delay of 1 and priority write flag 0 for Analogue Gain
>>>>> [2:42:26.106822531] [29488]  INFO IPASoft soft_simple.cpp:251 IPASoft=
: Exposure
>>>>> 4-4992, gain 0-1984 (1)
>>>>> Zero-copy enabled
>>>>> [2:42:26.110235367] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer i=
s
>>>>> contiguous
>>>>> [2:42:26.113343648] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer i=
s
>>>>> contiguous
>>>>> [2:42:26.116390199] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer i=
s
>>>>> contiguous
>>>>> [2:42:26.119374839] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer i=
s
>>>>> contiguous
>>>>> [2:42:26.125329380] [29471] DEBUG Request request.cpp:369 Created req=
uest -
>>>>> cookie: 0
>>>>> [2:42:26.125505377] [29471] DEBUG Request request.cpp:369 Created req=
uest -
>>>>> cookie: 0
>>>>> [2:42:26.125523467] [29471] DEBUG Request request.cpp:369 Created req=
uest -
>>>>> cookie: 0
>>>>> [2:42:26.125531018] [29471] DEBUG Request request.cpp:369 Created req=
uest -
>>>>> cookie: 0
>>>>> [2:42:26.125546767] [29471] DEBUG Camera camera.cpp:1360 Starting cap=
ture
>>>>> [2:42:26.135295574] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1311
>>>>> /dev/video0[28:cap]: 3 buffers requested.
>>>>> [2:42:26.135380273] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer i=
s
>>>>> contiguous
>>>>> [2:42:26.135397476] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer i=
s
>>>>> contiguous
>>>>> [2:42:26.135407136] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer i=
s
>>>>> contiguous
>>>>> [2:42:26.135749405] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750
>>>>> /dev/video0[28:cap]: Queueing buffer 0
>>>>> [2:42:26.294678108] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750
>>>>> /dev/video0[28:cap]: Queueing buffer 1
>>>>> [2:42:26.294710299] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750
>>>>> /dev/video0[28:cap]: Queueing buffer 2
>>>>> [2:42:46.501427517] [29471] DEBUG Camera camera.cpp:1404 Stopping cap=
ture
>>>>> [2:42:50.541207894] [29488] DEBUG Request request.cpp:129 Request(0:C=
:0/1:0)
>>>>> [2:42:50.541314260] [29488] DEBUG Request request.cpp:129 Request(1:C=
:0/1:0)
>>>>> [2:42:50.541329943] [29488] DEBUG Request request.cpp:129 Request(2:C=
:0/1:0)
>>>>> [2:42:50.541365704] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1596
>>>>> /dev/video0[28:cap]: Releasing buffers
>>>>> [2:42:50.545182849] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1311
>>>>> /dev/video0[28:cap]: 0 buffers requested.
>>>>> [2:42:50.545229101] [29488] DEBUG Request request.cpp:129 Request(3:X=
:0/1:0)
>>>>>
>>>>>
>>>>> ----- On Dec 18, 2024, at 10:09 AM, Jacopo Mondi jacopo.mondi@ideason=
board.com
>>>>> wrote:
>>>>>
>>>>>> Forwarded to the libcamera mailing list where experts on the
>>>>>> SimplePipeline and SoftwareISP can read (the ones that do not read
>>>>>> here)
>>>>>>
>>>>>> On Wed, Dec 18, 2024 at 10:46:02AM -0500, duanek@chorus.net wrote:
>>>>>>> Dear Jacopo,
>>>>>>>
>>>>>>> Thanks for your feedback.
>>>>>>>
>>>>>>>> However, as said, you should be able to get frames out
>>>>>>>
>>>>>>> Nope, I do not get any frames, just an offset image of a camera wit=
h a slash
>>>>>>> through it.
>>>>>>
>>>>>> That's the default qcam symbol for "camera not found" ?
>>>>>> Could you try with 'cam' saving frames to disk ?
>>>>>>
>>>>>>> qcam output:
>>>>>>>
>>>>>>> duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=3D0 qcam -=
s
>>>>>>> "width=3D1928,height=3D1208"
>>>>>>
>>>>>> Or pass the camera number to qcam maybe ?
>>>>>>
>>>>>> qcam -c1 -C
>>>>>>
>>>>>>> [2:08:48.367287574] [26884] DEBUG IPAModule ipa_module.cpp:333 ipa_=
ipu3.so: IPA
>>>>>>> module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is sig=
ned
>>>>>>> [2:08:48.367391256] [26884] DEBUG IPAManager ipa_manager.cpp:235 Lo=
aded IPA
>>>>>>> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
>>>>>>> [2:08:48.367477441] [26884] DEBUG IPAModule ipa_module.cpp:333
>>>>>>> ipa_soft_simple.so: IPA module
>>>>>>> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is sig=
ned
>>>>>>> [2:08:48.367493138] [26884] DEBUG IPAManager ipa_manager.cpp:235 Lo=
aded IPA
>>>>>>> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.s=
o'
>>>>>>> [2:08:48.367559794] [26884]  INFO Camera camera_manager.cpp:327 lib=
camera
>>>>>>> v0.3.2+240-936a099e
>>>>>>> [2:08:48.367620533] [26896] DEBUG Camera camera_manager.cpp:73 Star=
ting camera
>>>>>>> manager
>>>>>>> [2:08:48.376420422] [26896] DEBUG DeviceEnumerator device_enumerato=
r.cpp:230 New
>>>>>>> media device "intel-ipu6" created from /dev/media0
>>>>>>> [2:08:48.377733959] [26896] DEBUG DeviceEnumerator device_enumerato=
r_udev.cpp:96
>>>>>>> Defer media device /dev/media0 due to 1 missing dependencies
>>>>>>> [2:08:48.377858051] [26896] DEBUG DeviceEnumerator
>>>>>>> device_enumerator_udev.cpp:322 All dependencies for media device /d=
ev/media0
>>>>>>> found
>>>>>>> [2:08:48.377865948] [26896] DEBUG DeviceEnumerator device_enumerato=
r.cpp:258
>>>>>>> Added device /dev/media0: intel-ipu6
>>>>>>> [2:08:48.378074893] [26896] DEBUG Camera camera_manager.cpp:140 Fou=
nd registered
>>>>>>> pipeline handler 'ipu3'
>>>>>>> [2:08:48.378233208] [26896] DEBUG Camera camera_manager.cpp:140 Fou=
nd registered
>>>>>>> pipeline handler 'simple'
>>>>>>> [2:08:48.378263573] [26896] DEBUG DeviceEnumerator device_enumerato=
r.cpp:318
>>>>>>> Successful match for media device "intel-ipu6"
>>>>>>> [2:08:48.378311479] [26896] DEBUG SimplePipeline simple.cpp:1585 Se=
nsor found
>>>>>>> for /dev/media0
>>>>>>> [2:08:48.378648447] [26896] DEBUG SimplePipeline simple.cpp:424 Fou=
nd capture
>>>>>>> device Intel IPU6 ISYS Capture 0
>>>>>>> [2:08:48.378714621] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Exposure (0x00980911)
>>>>>>> [2:08:48.378808007] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Horizontal Flip (0x00980914)
>>>>>>> [2:08:48.378826380] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Vertical Flip (0x00980915)
>>>>>>> [2:08:48.378838332] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Camera Orientation (0x009a0922)
>>>>>>> [2:08:48.378871227] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>>>> [2:08:48.378881213] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Vertical Blanking (0x009e0901)
>>>>>>> [2:08:48.378889198] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>>>> [2:08:48.378898404] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Analogue Gain (0x009e0903)
>>>>>>> [2:08:48.378906624] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Link Frequency (0x009f0901)
>>>>>>> [2:08:48.378916258] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Pixel Rate (0x009f0902)
>>>>>>> [2:08:48.378924779] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Test Pattern (0x009f0903)
>>>>>>> [2:08:48.378936396] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Digital Gain (0x009f0905)
>>>>>>> [2:08:48.379155405] [26896] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov0=
8x40 4-0036':
>>>>>>> Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for devic=
e
>>>>>>> [2:08:48.379170976] [26896]  WARN CameraSensor camera_sensor_legacy=
.cpp:401
>>>>>>> 'ov08x40 4-0036': The PixelArraySize property has been defaulted to=
 3856x2416
>>>>>>> [2:08:48.379177570] [26896] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov0=
8x40 4-0036':
>>>>>>> Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for devic=
e
>>>>>>> [2:08:48.379183658] [26896]  WARN CameraSensor camera_sensor_legacy=
.cpp:412
>>>>>>> 'ov08x40 4-0036': The PixelArrayActiveAreas property has been defau=
lted to (0,
>>>>>>> 0)/3856x2416
>>>>>>> [2:08:48.379191552] [26896] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov0=
8x40 4-0036':
>>>>>>> Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for devic=
e
>>>>>>> [2:08:48.379196709] [26896]  WARN CameraSensor camera_sensor_legacy=
.cpp:420
>>>>>>> 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
>>>>>>> [2:08:48.379201526] [26896]  WARN CameraSensor camera_sensor_legacy=
.cpp:426
>>>>>>> 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
>>>>>>> [2:08:48.379206284] [26896]  WARN CameraSensor camera_sensor_legacy=
.cpp:428
>>>>>>> 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst =
in the
>>>>>>> libcamera sources for more information
>>>>>>> [2:08:48.379910066] [26896]  WARN CameraSensorProperties
>>>>>>> camera_sensor_properties.cpp:458 No static properties available for=
 'ov08x40'
>>>>>>> [2:08:48.379920385] [26896]  WARN CameraSensorProperties
>>>>>>> camera_sensor_properties.cpp:460 Please consider updating the camer=
a sensor
>>>>>>> properties database
>>>>>>> [2:08:48.379968649] [26896] DEBUG CameraSensor camera_sensor.cpp:40=
1 Entity
>>>>>>> 'ov08x40 4-0036' matched by CameraSensorLegacy
>>>>>>> [2:08:48.380012101] [26896] DEBUG SimplePipeline simple.cpp:491 Fou=
nd pipeline:
>>>>>>> [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS=
 Capture 0]
>>>>>>> [2:08:48.380147601] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Exposure (0x00980911)
>>>>>>> [2:08:48.380167842] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Horizontal Flip (0x00980914)
>>>>>>> [2:08:48.380178186] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Vertical Flip (0x00980915)
>>>>>>> [2:08:48.380187557] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Camera Orientation (0x009a0922)
>>>>>>> [2:08:48.380203877] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>>>> [2:08:48.380216208] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Vertical Blanking (0x009e0901)
>>>>>>> [2:08:48.380226671] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>>>> [2:08:48.380237572] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Analogue Gain (0x009e0903)
>>>>>>> [2:08:48.380248729] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Link Frequency (0x009f0901)
>>>>>>> [2:08:48.380261582] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Pixel Rate (0x009f0902)
>>>>>>> [2:08:48.380272330] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Test Pattern (0x009f0903)
>>>>>>> [2:08:48.380287929] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40=
 4-0036':
>>>>>>> Control: Digital Gain (0x009f0905)
>>>>>>> [2:08:48.380350326] [26896] DEBUG V4L2 v4l2_videodevice.cpp:631
>>>>>>> /dev/video0[28:cap]: Opened device : isys: ipu6
>>>>>>> [2:08:48.380489828] [26896] DEBUG DmaBufAllocator dma_buf_allocator=
.cpp:106
>>>>>>> Failed to open /dev/dma_heap/linux,cma: No such file or directory
>>>>>>> [2:08:48.380499245] [26896] DEBUG DmaBufAllocator dma_buf_allocator=
.cpp:106
>>>>>>> Failed to open /dev/dma_heap/reserved: No such file or directory
>>>>>>> [2:08:48.380506362] [26896] DEBUG DmaBufAllocator dma_buf_allocator=
.cpp:112
>>>>>>> Using /dev/dma_heap/system
>>>>>>> [2:08:48.382623926] [26896] DEBUG IPAManager ipa_manager.cpp:306 IP=
A module
>>>>>>> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signat=
ure is valid
>>>>>>> [2:08:48.382698965] [26896] DEBUG IPAProxy soft_ipa_proxy.cpp:45 in=
itializing
>>>>>>> soft proxy: loading IPA from
>>>>>>> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
>>>>>>> [2:08:48.383200984] [26896]  WARN IPAProxy ipa_proxy.cpp:160 Config=
uration file
>>>>>>> 'ov08x40.yaml' not found for IPA module 'simple', falling back to
>>>>>>> 'uncalibrated.yaml'
>>>>>>> [2:08:48.383245998] [26896]  WARN IPASoft soft_simple.cpp:96 IPASof=
t: Failed to
>>>>>>> create camera sensor helper for ov08x40
>>>>>>> [2:08:48.383400849] [26896] DEBUG IPASoft soft_simple.cpp:117 IPASo=
ft: Tuning
>>>>>>> file version 1
>>>>>>> [2:08:48.383470999] [26896] DEBUG IPAModuleAlgo module.h:91 IPASoft=
:
>>>>>>> Instantiated algorithm 'BlackLevel'
>>>>>>> [2:08:48.383519951] [26896] DEBUG IPAModuleAlgo module.h:91 IPASoft=
:
>>>>>>> Instantiated algorithm 'Awb'
>>>>>>> [2:08:48.383566360] [26896] DEBUG IPAModuleAlgo module.h:91 IPASoft=
:
>>>>>>> Instantiated algorithm 'Lut'
>>>>>>> [2:08:48.383593617] [26896] DEBUG IPAModuleAlgo module.h:91 IPASoft=
:
>>>>>>> Instantiated algorithm 'Agc'
>>>>>>> [2:08:48.383675638] [26896] DEBUG MediaDevice media_device.cpp:826
>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS=
 Capture
>>>>>>> 0'[0]: 0
>>>>>>> [2:08:48.383684688] [26896] DEBUG MediaDevice media_device.cpp:826
>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS=
 Capture
>>>>>>> 0'[0]: 1
>>>>>>> [2:08:48.383751789] [26896] DEBUG SimplePipeline simple.cpp:780 Lin=
k 'ov08x40
>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>> [2:08:48.383767562] [26896] DEBUG SimplePipeline simple.cpp:780 Lin=
k 'Intel IPU6
>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with forma=
t
>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>> [2:08:48.383814165] [26896] DEBUG SimplePipeline simple.cpp:631 Add=
ing
>>>>>>> configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
>>>>>>> [2:08:48.383903884] [26896] DEBUG SimplePipeline simple.cpp:780 Lin=
k 'ov08x40
>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>> 3856x2416-SGRBG10_1X10
>>>>>>> [2:08:48.383911671] [26896] DEBUG SimplePipeline simple.cpp:780 Lin=
k 'Intel IPU6
>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with forma=
t
>>>>>>> 3856x2416-SGRBG10_1X10
>>>>>>> [2:08:48.383922495] [26896] DEBUG SimplePipeline simple.cpp:631 Add=
ing
>>>>>>> configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
>>>>>>> [2:08:48.384191137] [26896] DEBUG Camera camera_manager.cpp:161 Pip=
eline handler
>>>>>>> "simple" matched
>>>>>>> [2:08:48.384220609] [26896] DEBUG Camera camera_manager.cpp:140 Fou=
nd registered
>>>>>>> pipeline handler 'uvcvideo'
>>>>>>> [2:08:48.416374408] [26884] DEBUG SimplePipeline simple.cpp:1017 La=
rgest stream
>>>>>>> size is 3848x2416
>>>>>>> [2:08:48.416415430] [26884] DEBUG SimplePipeline simple.cpp:1069 Pi=
cked
>>>>>>> 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 384=
8x2416
>>>>>>> [2:08:48.416475078] [26884] DEBUG Camera camera.cpp:1137 streams co=
nfiguration:
>>>>>>> (0) 3848x2416-ABGR8888
>>>>>>> [2:08:48.416517469] [26884] DEBUG SimplePipeline simple.cpp:1017 La=
rgest stream
>>>>>>> size is 1928x1208
>>>>>>> [2:08:48.416523658] [26884] DEBUG SimplePipeline simple.cpp:1069 Pi=
cked
>>>>>>> 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size 192=
8x1208
>>>>>>> [2:08:48.416534256] [26884] DEBUG SimplePipeline simple.cpp:1118 Ad=
justing size
>>>>>>> from 1928x1208 to 1924x1208
>>>>>>> Stream configuration adjusted to  1924x1208-ABGR8888
>>>>>>> [2:08:48.416569398] [26884] DEBUG SimplePipeline simple.cpp:1017 La=
rgest stream
>>>>>>> size is 1924x1208
>>>>>>> [2:08:48.416574746] [26884] DEBUG SimplePipeline simple.cpp:1069 Pi=
cked
>>>>>>> 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size 192=
4x1208
>>>>>>> [2:08:48.416582058] [26884]  INFO Camera camera.cpp:1202 configurin=
g streams:
>>>>>>> (0) 1924x1208-ABGR8888
>>>>>>> [2:08:48.416663364] [26896] DEBUG MediaDevice media_device.cpp:826
>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS=
 Capture
>>>>>>> 0'[0]: 0
>>>>>>> [2:08:48.416700163] [26896] DEBUG MediaDevice media_device.cpp:826
>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS=
 Capture
>>>>>>> 0'[0]: 1
>>>>>>> [2:08:48.416821955] [26896] DEBUG SimplePipeline simple.cpp:780 Lin=
k 'ov08x40
>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>> [2:08:48.416832271] [26896] DEBUG SimplePipeline simple.cpp:780 Lin=
k 'Intel IPU6
>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with forma=
t
>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>> [2:08:48.416891523] [26896]  WARN CameraSensor camera_sensor_legacy=
.cpp:501
>>>>>>> 'ov08x40 4-0036': No sensor delays found in static properties. Assu=
ming
>>>>>>> unverified defaults.
>>>>>>> [2:08:48.416984811] [26896] DEBUG DelayedControls delayed_controls.=
cpp:99 Set a
>>>>>>> delay of 2 and priority write flag 0 for Exposure
>>>>>>> [2:08:48.417002236] [26896] DEBUG DelayedControls delayed_controls.=
cpp:99 Set a
>>>>>>> delay of 1 and priority write flag 0 for Analogue Gain
>>>>>>> [2:08:48.417169477] [26896]  INFO IPASoft soft_simple.cpp:251 IPASo=
ft: Exposure
>>>>>>> 4-4442, gain 0-1984 (1)
>>>>>>> Zero-copy enabled
>>>>>>> [2:08:48.418429333] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer=
 is
>>>>>>> contiguous
>>>>>>> [2:08:48.419291593] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer=
 is
>>>>>>> contiguous
>>>>>>> [2:08:48.420117071] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer=
 is
>>>>>>> contiguous
>>>>>>> [2:08:48.420926235] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer=
 is
>>>>>>> contiguous
>>>>>>> [2:08:48.422633774] [26884] DEBUG Request request.cpp:369 Created r=
equest -
>>>>>>> cookie: 0
>>>>>>> [2:08:48.422717126] [26884] DEBUG Request request.cpp:369 Created r=
equest -
>>>>>>> cookie: 0
>>>>>>> [2:08:48.422726468] [26884] DEBUG Request request.cpp:369 Created r=
equest -
>>>>>>> cookie: 0
>>>>>>> [2:08:48.422733979] [26884] DEBUG Request request.cpp:369 Created r=
equest -
>>>>>>> cookie: 0
>>>>>>> [2:08:48.422746484] [26884] DEBUG Camera camera.cpp:1360 Starting c=
apture
>>>>>>> [2:08:48.425078945] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1311
>>>>>>> /dev/video0[28:cap]: 3 buffers requested.
>>>>>>> [2:08:48.425113504] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer=
 is
>>>>>>> contiguous
>>>>>>> [2:08:48.425127393] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer=
 is
>>>>>>> contiguous
>>>>>>> [2:08:48.425135907] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer=
 is
>>>>>>> contiguous
>>>>>>> [2:08:48.425417390] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1750
>>>>>>> /dev/video0[28:cap]: Queueing buffer 0
>>>>>>> [2:08:48.550791060] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1750
>>>>>>> /dev/video0[28:cap]: Queueing buffer 1
>>>>>>> [2:08:48.551301528] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1750
>>>>>>> /dev/video0[28:cap]: Queueing buffer 2
>>>>>>> [2:09:34.537747960] [26884] DEBUG Camera camera.cpp:1404 Stopping c=
apture
>>>>>>> [2:09:38.601196687] [26896] DEBUG Request request.cpp:129 Request(0=
:C:0/1:0)
>>>>>>> [2:09:38.601418601] [26896] DEBUG Request request.cpp:129 Request(1=
:C:0/1:0)
>>>>>>> [2:09:38.601442872] [26896] DEBUG Request request.cpp:129 Request(2=
:C:0/1:0)
>>>>>>> [2:09:38.601507834] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1596
>>>>>>> /dev/video0[28:cap]: Releasing buffers
>>>>>>> [2:09:38.603272250] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1311
>>>>>>> /dev/video0[28:cap]: 0 buffers requested.
>>>>>>> [2:09:38.603346754] [26896] DEBUG Request request.cpp:129 Request(3=
:X:0/1:0)
>>>>>>>
>>>>>>>
>>>>>>> Sincerely,
>>>>>>> Duane
>>>>>>>
>>>>>>> ----- On Dec 18, 2024, at 9:37 AM, Jacopo Mondi jacopo.mondi@ideaso=
nboard.com
>>>>>>> wrote:
>>>>>>>
>>>>>>>> Hi Duane
>>>>>>>>  if you refer to...
>>>>>>>>
>>>>>>>> On Wed, Dec 18, 2024 at 09:03:31AM -0500, duanek@chorus.net wrote:
>>>>>>>>> Dear All,
>>>>>>>>>
>>>>>>>>> I thought I would update the situation as it stands with kernel 6=
.12.5, and
>>>>>>>>> latest version of libcamera, I am still failing to retrieve the s=
ensor crop
>>>>>>>>> rectangle:
>>>>>>>>>
>>>>>>>>> duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=3D0 cam =
--list
>>>>>>>>> [1:39:08.877408033] [24095] DEBUG IPAModule ipa_module.cpp:333 ip=
a_ipu3.so: IPA
>>>>>>>>> module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is s=
igned
>>>>>>>>> [1:39:08.877493605] [24095] DEBUG IPAManager ipa_manager.cpp:235 =
Loaded IPA
>>>>>>>>> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
>>>>>>>>> [1:39:08.877574277] [24095] DEBUG IPAModule ipa_module.cpp:333
>>>>>>>>> ipa_soft_simple.so: IPA module
>>>>>>>>> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is s=
igned
>>>>>>>>> [1:39:08.877590565] [24095] DEBUG IPAManager ipa_manager.cpp:235 =
Loaded IPA
>>>>>>>>> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple=
.so'
>>>>>>>>> [1:39:08.877634522] [24095]  INFO Camera camera_manager.cpp:327 l=
ibcamera
>>>>>>>>> v0.3.2+240-936a099e
>>>>>>>>> [1:39:08.877842699] [24098] DEBUG Camera camera_manager.cpp:73 St=
arting camera
>>>>>>>>> manager
>>>>>>>>> [1:39:08.884214258] [24098] DEBUG DeviceEnumerator device_enumera=
tor.cpp:230 New
>>>>>>>>> media device "intel-ipu6" created from /dev/media0
>>>>>>>>> [1:39:08.885400683] [24098] DEBUG DeviceEnumerator device_enumera=
tor_udev.cpp:96
>>>>>>>>> Defer media device /dev/media0 due to 1 missing dependencies
>>>>>>>>> [1:39:08.885500639] [24098] DEBUG DeviceEnumerator
>>>>>>>>> device_enumerator_udev.cpp:322 All dependencies for media device =
/dev/media0
>>>>>>>>> found
>>>>>>>>> [1:39:08.885507438] [24098] DEBUG DeviceEnumerator device_enumera=
tor.cpp:258
>>>>>>>>> Added device /dev/media0: intel-ipu6
>>>>>>>>> [1:39:08.885678288] [24098] DEBUG Camera camera_manager.cpp:140 F=
ound registered
>>>>>>>>> pipeline handler 'ipu3'
>>>>>>>>> [1:39:08.885794024] [24098] DEBUG Camera camera_manager.cpp:140 F=
ound registered
>>>>>>>>> pipeline handler 'simple'
>>>>>>>>> [1:39:08.885815555] [24098] DEBUG DeviceEnumerator device_enumera=
tor.cpp:318
>>>>>>>>> Successful match for media device "intel-ipu6"
>>>>>>>>> [1:39:08.885851217] [24098] DEBUG SimplePipeline simple.cpp:1585 =
Sensor found
>>>>>>>>> for /dev/media0
>>>>>>>>> [1:39:08.886089353] [24098] DEBUG SimplePipeline simple.cpp:424 F=
ound capture
>>>>>>>>> device Intel IPU6 ISYS Capture 0
>>>>>>>>> [1:39:08.886141057] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Exposure (0x00980911)
>>>>>>>>> [1:39:08.886206532] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Horizontal Flip (0x00980914)
>>>>>>>>> [1:39:08.886223871] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Vertical Flip (0x00980915)
>>>>>>>>> [1:39:08.886234673] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Camera Orientation (0x009a0922)
>>>>>>>>> [1:39:08.886260625] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>>>>>> [1:39:08.886270047] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Vertical Blanking (0x009e0901)
>>>>>>>>> [1:39:08.886277150] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>>>>>> [1:39:08.886284629] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Analogue Gain (0x009e0903)
>>>>>>>>> [1:39:08.886292042] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Link Frequency (0x009f0901)
>>>>>>>>> [1:39:08.886300670] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Pixel Rate (0x009f0902)
>>>>>>>>> [1:39:08.886309739] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Test Pattern (0x009f0903)
>>>>>>>>> [1:39:08.886320963] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Digital Gain (0x009f0905)
>>>>>>>>> [1:39:08.886490155] [24098] ERROR V4L2 v4l2_subdevice.cpp:1127 'o=
v08x40 4-0036':
>>>>>>>>> Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for dev=
ice
>>>>>>>>> [1:39:08.886503025] [24098]  WARN CameraSensor camera_sensor_lega=
cy.cpp:401
>>>>>>>>> 'ov08x40 4-0036': The PixelArraySize property has been defaulted =
to 3856x2416
>>>>>>>>> [1:39:08.886508510] [24098] ERROR V4L2 v4l2_subdevice.cpp:1127 'o=
v08x40 4-0036':
>>>>>>>>> Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for dev=
ice
>>>>>>>>> [1:39:08.886517928] [24098]  WARN CameraSensor camera_sensor_lega=
cy.cpp:412
>>>>>>>>> 'ov08x40 4-0036': The PixelArrayActiveAreas property has been def=
aulted to (0,
>>>>>>>>> 0)/3856x2416
>>>>>>>>> [1:39:08.886524514] [24098] ERROR V4L2 v4l2_subdevice.cpp:1127 'o=
v08x40 4-0036':
>>>>>>>>> Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for dev=
ice
>>>>>>>>
>>>>>>>> ... this error
>>>>>>>>
>>>>>>>> it shouldn't be fatal and you should be able to get frames anyhow
>>>>>>>>
>>>>>>>>> [1:39:08.886528470] [24098]  WARN CameraSensor camera_sensor_lega=
cy.cpp:420
>>>>>>>>> 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
>>>>>>>>> [1:39:08.886532315] [24098]  WARN CameraSensor camera_sensor_lega=
cy.cpp:426
>>>>>>>>> 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
>>>>>>>>
>>>>>>>> However, as the error message reports "The sensor kernel driver ne=
eds
>>>>>>>> to be fixed" as it doesn't support the minium required feature set=
 to
>>>>>>>> be fully compliant with libcamera.
>>>>>>>>
>>>>>>>> However, as said, you should be able to get frames out
>>>>>>>>
>>>>>>>>
>>>>>>>>> [1:39:08.886536250] [24098]  WARN CameraSensor camera_sensor_lega=
cy.cpp:428
>>>>>>>>> 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rs=
t in the
>>>>>>>>> libcamera sources for more information
>>>>>>>>> [1:39:08.887129354] [24098]  WARN CameraSensorProperties
>>>>>>>>> camera_sensor_properties.cpp:458 No static properties available f=
or 'ov08x40'
>>>>>>>>> [1:39:08.887138313] [24098]  WARN CameraSensorProperties
>>>>>>>>> camera_sensor_properties.cpp:460 Please consider updating the cam=
era sensor
>>>>>>>>> properties database
>>>>>>>>> [1:39:08.887172183] [24098] DEBUG CameraSensor camera_sensor.cpp:=
401 Entity
>>>>>>>>> 'ov08x40 4-0036' matched by CameraSensorLegacy
>>>>>>>>> [1:39:08.887197696] [24098] DEBUG SimplePipeline simple.cpp:491 F=
ound pipeline:
>>>>>>>>> [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 IS=
YS Capture 0]
>>>>>>>>> [1:39:08.887296099] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Exposure (0x00980911)
>>>>>>>>> [1:39:08.887314603] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Horizontal Flip (0x00980914)
>>>>>>>>> [1:39:08.887324889] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Vertical Flip (0x00980915)
>>>>>>>>> [1:39:08.887334206] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Camera Orientation (0x009a0922)
>>>>>>>>> [1:39:08.887347541] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>>>>>> [1:39:08.887355861] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Vertical Blanking (0x009e0901)
>>>>>>>>> [1:39:08.887362771] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>>>>>> [1:39:08.887369888] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Analogue Gain (0x009e0903)
>>>>>>>>> [1:39:08.887377420] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Link Frequency (0x009f0901)
>>>>>>>>> [1:39:08.887386386] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Pixel Rate (0x009f0902)
>>>>>>>>> [1:39:08.887394363] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Test Pattern (0x009f0903)
>>>>>>>>> [1:39:08.887405686] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x=
40 4-0036':
>>>>>>>>> Control: Digital Gain (0x009f0905)
>>>>>>>>> [1:39:08.887447262] [24098] DEBUG V4L2 v4l2_videodevice.cpp:631
>>>>>>>>> /dev/video0[16:cap]: Opened device : isys: ipu6
>>>>>>>>> [1:39:08.887546046] [24098] DEBUG DmaBufAllocator dma_buf_allocat=
or.cpp:106
>>>>>>>>> Failed to open /dev/dma_heap/linux,cma: No such file or directory
>>>>>>>>> [1:39:08.887554189] [24098] DEBUG DmaBufAllocator dma_buf_allocat=
or.cpp:106
>>>>>>>>> Failed to open /dev/dma_heap/reserved: No such file or directory
>>>>>>>>> [1:39:08.887560100] [24098] DEBUG DmaBufAllocator dma_buf_allocat=
or.cpp:112
>>>>>>>>> Using /dev/dma_heap/system
>>>>>>>>> [1:39:08.889570199] [24098] DEBUG IPAManager ipa_manager.cpp:306 =
IPA module
>>>>>>>>> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so sign=
ature is valid
>>>>>>>>> [1:39:08.889667041] [24098] DEBUG IPAProxy soft_ipa_proxy.cpp:45 =
initializing
>>>>>>>>> soft proxy: loading IPA from
>>>>>>>>> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
>>>>>>>>> [1:39:08.890244616] [24098]  WARN IPAProxy ipa_proxy.cpp:160 Conf=
iguration file
>>>>>>>>> 'ov08x40.yaml' not found for IPA module 'simple', falling back to
>>>>>>>>> 'uncalibrated.yaml'
>>>>>>>>> [1:39:08.890291460] [24098]  WARN IPASoft soft_simple.cpp:96 IPAS=
oft: Failed to
>>>>>>>>> create camera sensor helper for ov08x40
>>>>>>>>> [1:39:08.890420321] [24098] DEBUG IPASoft soft_simple.cpp:117 IPA=
Soft: Tuning
>>>>>>>>> file version 1
>>>>>>>>> [1:39:08.890493102] [24098] DEBUG IPAModuleAlgo module.h:91 IPASo=
ft:
>>>>>>>>> Instantiated algorithm 'BlackLevel'
>>>>>>>>> [1:39:08.890548389] [24098] DEBUG IPAModuleAlgo module.h:91 IPASo=
ft:
>>>>>>>>> Instantiated algorithm 'Awb'
>>>>>>>>> [1:39:08.890592459] [24098] DEBUG IPAModuleAlgo module.h:91 IPASo=
ft:
>>>>>>>>> Instantiated algorithm 'Lut'
>>>>>>>>> [1:39:08.890619578] [24098] DEBUG IPAModuleAlgo module.h:91 IPASo=
ft:
>>>>>>>>> Instantiated algorithm 'Agc'
>>>>>>>>> [1:39:08.890700245] [24098] DEBUG MediaDevice media_device.cpp:82=
6
>>>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 IS=
YS Capture
>>>>>>>>> 0'[0]: 0
>>>>>>>>> [1:39:08.890708008] [24098] DEBUG MediaDevice media_device.cpp:82=
6
>>>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 IS=
YS Capture
>>>>>>>>> 0'[0]: 1
>>>>>>>>> [1:39:08.890768179] [24098] DEBUG SimplePipeline simple.cpp:780 L=
ink 'ov08x40
>>>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>>>> [1:39:08.890781364] [24098] DEBUG SimplePipeline simple.cpp:780 L=
ink 'Intel IPU6
>>>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with for=
mat
>>>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>>>> [1:39:08.890818896] [24098] DEBUG SimplePipeline simple.cpp:631 A=
dding
>>>>>>>>> configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
>>>>>>>>> [1:39:08.890890653] [24098] DEBUG SimplePipeline simple.cpp:780 L=
ink 'ov08x40
>>>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>>>> 3856x2416-SGRBG10_1X10
>>>>>>>>> [1:39:08.890897783] [24098] DEBUG SimplePipeline simple.cpp:780 L=
ink 'Intel IPU6
>>>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with for=
mat
>>>>>>>>> 3856x2416-SGRBG10_1X10
>>>>>>>>> [1:39:08.890908208] [24098] DEBUG SimplePipeline simple.cpp:631 A=
dding
>>>>>>>>> configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
>>>>>>>>> [1:39:08.891057954] [24098] DEBUG Camera camera_manager.cpp:161 P=
ipeline handler
>>>>>>>>> "simple" matched
>>>>>>>>> [1:39:08.891076593] [24098] DEBUG Camera camera_manager.cpp:140 F=
ound registered
>>>>>>>>> pipeline handler 'uvcvideo'
>>>>>>>>> Available cameras:
>>>>>>>>> 1: Internal front camera (\_SB_.PC00.LNK0)
>>>>>>>>>
>>>>>>>>> Please let me know of any other testing I can do!
>>>>>>>>>
>>>>>>>>> Sincerely,
>>>>>>>>> Duane
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> ----- On Oct 14, 2024, at 2:54 PM, duanek duanek@chorus.net wrote=
:
>>>>>>>>>
>>>>>>>>>> Dear All,
>>>>>>>>>> I would like to get the camera in my HP Spectre 16" laptop worki=
ng under linux.
>>>>>>>>>> I have reported this to the libcamera group, and they suggested =
posting here:
>>>>>>>>>> https://bugs.libcamera.org/show_bug.cgi?id=3D237
>>>>>>>>>>
>>>>>>>>>> I have compiled a custom kernel with the kernel module for what =
I _think_ is my
>>>>>>>>>> camera, and it is detected on boot:
>>>>>>>>>>
>>>>>>>>>> sudo dmesg |grep intel-ipu6
>>>>>>>>>> [   10.453585] intel-ipu6 0000:00:05.0: enabling device (0000 ->=
 0002)
>>>>>>>>>> [   10.453786] intel-ipu6 0000:00:05.0: IPU6 in secure mode touc=
h 0x80000000
>>>>>>>>>> mask 0x0
>>>>>>>>>> [   10.468306] intel-ipu6 0000:00:05.0: FW version: 20230925
>>>>>>>>>> [   10.471209] intel-ipu6 0000:00:05.0: Found supported sensor O=
VTI08F4:00
>>>>>>>>>> [   10.471268] intel-ipu6 0000:00:05.0: Connected 1 cameras
>>>>>>>>>> [   10.475739] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
>>>>>>>>>> [   10.515753] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN=
 to CSE
>>>>>>>>>> [   10.563160] intel-ipu6 0000:00:05.0: CSE authenticate_run don=
e
>>>>>>>>>> [   10.563175] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware v=
ersion 6
>>>>>>>>>>
>>>>>>>>>> I have also configured dmabuf for permissions.
>>>>>>>>>> I have downloaded libcamera, configured and built.
>>>>>>>>>>
>>>>>>>>>> When I run: LIBCAMERA_LOG_LEVELS=3D0 cam --list
>>>>>>>>>> [0:09:56.854835470] [6213] DEBUG IPAModule ipa_module.cpp:333 ip=
a_ipu3.so: IPA
>>>>>>>>>> module /usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
>>>>>>>>>> [0:09:56.854875988] [6213] DEBUG IPAManager ipa_manager.cpp:235 =
Loaded IPA
>>>>>>>>>> module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
>>>>>>>>>> [0:09:56.854894355] [6213] DEBUG IPAModule ipa_module.cpp:333
>>>>>>>>>> ipa_soft_simple.so: IPA module
>>>>>>>>>> /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
>>>>>>>>>> [0:09:56.854901746] [6213] DEBUG IPAManager ipa_manager.cpp:235 =
Loaded IPA
>>>>>>>>>> module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
>>>>>>>>>> [0:09:56.854913026] [6213] DEBUG IPAModule ipa_module.cpp:333 ip=
a_vimc.so: IPA
>>>>>>>>>> module /usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so is signed
>>>>>>>>>> [0:09:56.854917620] [6213] DEBUG IPAManager ipa_manager.cpp:235 =
Loaded IPA
>>>>>>>>>> module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so'
>>>>>>>>>> [0:09:56.854926011] [6213] ERROR IPAModule ipa_module.cpp:171 Sy=
mbol
>>>>>>>>>> ipaModuleInfo not found
>>>>>>>>>> [0:09:56.854929187] [6213] ERROR IPAModule ipa_module.cpp:291 v4=
l2-compat.so:
>>>>>>>>>> IPA module has no valid info
>>>>>>>>>> [0:09:56.854935275] [6213]  INFO Camera camera_manager.cpp:325 l=
ibcamera v0.3.2
>>>>>>>>>> [0:09:56.855123127] [6216] DEBUG Camera camera_manager.cpp:73 St=
arting camera
>>>>>>>>>> manager
>>>>>>>>>> [0:09:56.861202179] [6216] DEBUG DeviceEnumerator device_enumera=
tor.cpp:230 New
>>>>>>>>>> media device "intel-ipu6" created from /dev/media0
>>>>>>>>>> [0:09:56.862429442] [6216] DEBUG DeviceEnumerator device_enumera=
tor_udev.cpp:96
>>>>>>>>>> Defer media device /dev/media0 due to 1 missing dependencies
>>>>>>>>>> [0:09:56.862492043] [6216] DEBUG DeviceEnumerator device_enumera=
tor_udev.cpp:322
>>>>>>>>>> All dependencies for media device /dev/media0 found
>>>>>>>>>> [0:09:56.862494433] [6216] DEBUG DeviceEnumerator device_enumera=
tor.cpp:258
>>>>>>>>>> Added device /dev/media0: intel-ipu6
>>>>>>>>>> [0:09:56.862629885] [6216] DEBUG Camera camera_manager.cpp:138 F=
ound registered
>>>>>>>>>> pipeline handler 'ipu3'
>>>>>>>>>> [0:09:56.862637387] [6216] DEBUG Camera camera_manager.cpp:138 F=
ound registered
>>>>>>>>>> pipeline handler 'simple'
>>>>>>>>>> [0:09:56.862640029] [6216] DEBUG DeviceEnumerator device_enumera=
tor.cpp:318
>>>>>>>>>> Successful match for media device "intel-ipu6"
>>>>>>>>>> [0:09:56.862645091] [6216] DEBUG SimplePipeline simple.cpp:1552 =
Sensor found for
>>>>>>>>>> /dev/media0
>>>>>>>>>> [0:09:56.862665124] [6216] DEBUG SimplePipeline simple.cpp:416 F=
ound capture
>>>>>>>>>> device Intel IPU6 ISYS Capture 0
>>>>>>>>>> [0:09:56.862673488] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Exposure (0x00980911)
>>>>>>>>>> [0:09:56.862681127] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Horizontal Flip (0x00980914)
>>>>>>>>>> [0:09:56.862683897] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Vertical Flip (0x00980915)
>>>>>>>>>> [0:09:56.862686983] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Camera Orientation (0x009a0922)
>>>>>>>>>> [0:09:56.862692069] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>>>>>>> [0:09:56.862695160] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Vertical Blanking (0x009e0901)
>>>>>>>>>> [0:09:56.862697275] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>>>>>>> [0:09:56.862699995] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Analogue Gain (0x009e0903)
>>>>>>>>>> [0:09:56.862702951] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Link Frequency (0x009f0901)
>>>>>>>>>> [0:09:56.862705721] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Pixel Rate (0x009f0902)
>>>>>>>>>> [0:09:56.862708614] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Test Pattern (0x009f0903)
>>>>>>>>>> [0:09:56.862712618] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Digital Gain (0x009f0905)
>>>>>>>>>> [0:09:56.862725913] [6216] ERROR V4L2 v4l2_subdevice.cpp:1085 'o=
v08x40 4-0036':
>>>>>>>>>> Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for de=
vice
>>>>>>>>>> [0:09:56.862731090] [6216]  WARN CameraSensor camera_sensor.cpp:=
304 'ov08x40
>>>>>>>>>> 4-0036': The PixelArraySize property has been defaulted to 3856x=
2416
>>>>>>>>>> [0:09:56.862734575] [6216] ERROR V4L2 v4l2_subdevice.cpp:1085 'o=
v08x40 4-0036':
>>>>>>>>>> Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for de=
vice
>>>>>>>>>> [0:09:56.862737003] [6216]  WARN CameraSensor camera_sensor.cpp:=
315 'ov08x40
>>>>>>>>>> 4-0036': The PixelArrayActiveAreas property has been defaulted t=
o (0,
>>>>>>>>>> 0)/3856x2416
>>>>>>>>>> [0:09:56.862741568] [6216] ERROR V4L2 v4l2_subdevice.cpp:1085 'o=
v08x40 4-0036':
>>>>>>>>>> Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for de=
vice
>>>>>>>>>> [0:09:56.862743916] [6216]  WARN CameraSensor camera_sensor.cpp:=
323 'ov08x40
>>>>>>>>>> 4-0036': Failed to retrieve the sensor crop rectangle
>>>>>>>>>> [0:09:56.862746073] [6216]  WARN CameraSensor camera_sensor.cpp:=
329 'ov08x40
>>>>>>>>>> 4-0036': The sensor kernel driver needs to be fixed
>>>>>>>>>> [0:09:56.862748203] [6216]  WARN CameraSensor camera_sensor.cpp:=
331 'ov08x40
>>>>>>>>>> 4-0036': See Documentation/sensor_driver_requirements.rst in the=
 libcamera
>>>>>>>>>> sources for more information
>>>>>>>>>> [0:09:56.862886481] [6216]  WARN CameraSensorProperties
>>>>>>>>>> camera_sensor_properties.cpp:293 No static properties available =
for 'ov08x40'
>>>>>>>>>> [0:09:56.862891448] [6216]  WARN CameraSensorProperties
>>>>>>>>>> camera_sensor_properties.cpp:295 Please consider updating the ca=
mera sensor
>>>>>>>>>> properties database
>>>>>>>>>> [0:09:56.862894364] [6216] DEBUG SimplePipeline simple.cpp:486 F=
ound pipeline:
>>>>>>>>>> [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 I=
SYS Capture 0]
>>>>>>>>>> [0:09:56.862903916] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Exposure (0x00980911)
>>>>>>>>>> [0:09:56.862906875] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Horizontal Flip (0x00980914)
>>>>>>>>>> [0:09:56.862909364] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Vertical Flip (0x00980915)
>>>>>>>>>> [0:09:56.862911941] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Camera Orientation (0x009a0922)
>>>>>>>>>> [0:09:56.862915743] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>>>>>>> [0:09:56.862918412] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Vertical Blanking (0x009e0901)
>>>>>>>>>> [0:09:56.862920592] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>>>>>>> [0:09:56.862922756] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Analogue Gain (0x009e0903)
>>>>>>>>>> [0:09:56.862925354] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Link Frequency (0x009f0901)
>>>>>>>>>> [0:09:56.862928023] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Pixel Rate (0x009f0902)
>>>>>>>>>> [0:09:56.862930347] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Test Pattern (0x009f0903)
>>>>>>>>>> [0:09:56.862934434] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Digital Gain (0x009f0905)
>>>>>>>>>> [0:09:56.862943516] [6216] DEBUG V4L2 v4l2_videodevice.cpp:631
>>>>>>>>>> /dev/video0[16:cap]: Opened device : isys: ipu6
>>>>>>>>>> [0:09:56.862961969] [6216] DEBUG DmaBufAllocator dma_buf_allocat=
or.cpp:103
>>>>>>>>>> Failed to open /dev/dma_heap/linux,cma: No such file or director=
y
>>>>>>>>>> [0:09:56.862966349] [6216] DEBUG DmaBufAllocator dma_buf_allocat=
or.cpp:103
>>>>>>>>>> Failed to open /dev/dma_heap/reserved: No such file or directory
>>>>>>>>>> [0:09:56.862971624] [6216] DEBUG DmaBufAllocator dma_buf_allocat=
or.cpp:109 Using
>>>>>>>>>> /dev/dma_heap/system
>>>>>>>>>> [0:09:56.863135787] [6216] DEBUG IPAManager ipa_manager.cpp:306 =
IPA module
>>>>>>>>>> /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature=
 is valid
>>>>>>>>>> [0:09:56.863149345] [6216] DEBUG IPAProxy soft_ipa_proxy.cpp:45 =
initializing
>>>>>>>>>> soft proxy: loading IPA from
>>>>>>>>>> /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
>>>>>>>>>> [0:09:56.873712857] [6216]  WARN IPAProxy ipa_proxy.cpp:160 Conf=
iguration file
>>>>>>>>>> 'ov08x40.yaml' not found for IPA module 'simple', falling back t=
o
>>>>>>>>>> 'uncalibrated.yaml'
>>>>>>>>>> [0:09:56.873732979] [6216]  WARN IPASoft soft_simple.cpp:114 Fai=
led to create
>>>>>>>>>> camera sensor helper for ov08x40
>>>>>>>>>> [0:09:56.873831783] [6216] DEBUG IPASoft soft_simple.cpp:135 Tun=
ing file version
>>>>>>>>>> 1
>>>>>>>>>> [0:09:56.873849138] [6216] DEBUG MediaDevice media_device.cpp:82=
6
>>>>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 I=
SYS Capture
>>>>>>>>>> 0'[0]: 1
>>>>>>>>>> [0:09:56.873874763] [6216] DEBUG SimplePipeline simple.cpp:775 L=
ink 'ov08x40
>>>>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>>>>> [0:09:56.873878920] [6216] DEBUG SimplePipeline simple.cpp:775 L=
ink 'Intel IPU6
>>>>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with fo=
rmat
>>>>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>>>>> [0:09:56.873885965] [6216] DEBUG SimplePipeline simple.cpp:626 A=
dding
>>>>>>>>>> configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
>>>>>>>>>> [0:09:56.873901964] [6216] DEBUG SimplePipeline simple.cpp:775 L=
ink 'ov08x40
>>>>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>>>>> 3856x2416-SGRBG10_1X10
>>>>>>>>>> [0:09:56.873904715] [6216] DEBUG SimplePipeline simple.cpp:775 L=
ink 'Intel IPU6
>>>>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with fo=
rmat
>>>>>>>>>> 3856x2416-SGRBG10_1X10
>>>>>>>>>> [0:09:56.873908986] [6216] DEBUG SimplePipeline simple.cpp:626 A=
dding
>>>>>>>>>> configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
>>>>>>>>>> [0:09:56.873918943] [6216] DEBUG Camera camera_manager.cpp:159 P=
ipeline handler
>>>>>>>>>> "simple" matched
>>>>>>>>>> [0:09:56.873923366] [6216] DEBUG Camera camera_manager.cpp:138 F=
ound registered
>>>>>>>>>> pipeline handler 'uvcvideo'
>>>>>>>>>> [0:09:56.873926699] [6216] DEBUG Camera camera_manager.cpp:138 F=
ound registered
>>>>>>>>>> pipeline handler 'vimc'
>>>>>>>>>> Available cameras:
>>>>>>>>>> 1: Internal front camera (\_SB_.PC00.LNK0)
>>>>>>>>>>
>>>>>>>>>> which seems to indicate a camera found.
>>>>>>>>>>
>>>>>>>>>> This laptop has an electronic shutter, activated by a Function k=
ey, and under
>>>>>>>>>> linux (Debian Sid/Trixie), I can toggle the shutter.
>>>>>>>>>>
>>>>>>>>>> If I try: LIBCAMERA_LOG_LEVELS=3D0 qcam -s "width=3D1928,height=
=3D1208"  I get:
>>>>>>>>>>
>>>>>>>>>> [0:31:56.248638615] [8105] DEBUG IPAModule ipa_module.cpp:333 ip=
a_ipu3.so: IPA
>>>>>>>>>> module /usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
>>>>>>>>>> [0:31:56.248713977] [8105] DEBUG IPAManager ipa_manager.cpp:235 =
Loaded IPA
>>>>>>>>>> module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
>>>>>>>>>> [0:31:56.248745147] [8105] DEBUG IPAModule ipa_module.cpp:333
>>>>>>>>>> ipa_soft_simple.so: IPA module
>>>>>>>>>> /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
>>>>>>>>>> [0:31:56.248762096] [8105] DEBUG IPAManager ipa_manager.cpp:235 =
Loaded IPA
>>>>>>>>>> module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
>>>>>>>>>> [0:31:56.248783890] [8105] DEBUG IPAModule ipa_module.cpp:333 ip=
a_vimc.so: IPA
>>>>>>>>>> module /usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so is signed
>>>>>>>>>> [0:31:56.248797242] [8105] DEBUG IPAManager ipa_manager.cpp:235 =
Loaded IPA
>>>>>>>>>> module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so'
>>>>>>>>>> [0:31:56.248815534] [8105] ERROR IPAModule ipa_module.cpp:171 Sy=
mbol
>>>>>>>>>> ipaModuleInfo not found
>>>>>>>>>> [0:31:56.248823967] [8105] ERROR IPAModule ipa_module.cpp:291 v4=
l2-compat.so:
>>>>>>>>>> IPA module has no valid info
>>>>>>>>>> [0:31:56.248839450] [8105]  INFO Camera camera_manager.cpp:325 l=
ibcamera v0.3.2
>>>>>>>>>> [0:31:56.249067816] [8111] DEBUG Camera camera_manager.cpp:73 St=
arting camera
>>>>>>>>>> manager
>>>>>>>>>> [0:31:56.257921853] [8111] DEBUG DeviceEnumerator device_enumera=
tor.cpp:230 New
>>>>>>>>>> media device "intel-ipu6" created from /dev/media0
>>>>>>>>>> [0:31:56.259095802] [8111] DEBUG DeviceEnumerator device_enumera=
tor_udev.cpp:96
>>>>>>>>>> Defer media device /dev/media0 due to 1 missing dependencies
>>>>>>>>>> [0:31:56.259146226] [8111] DEBUG DeviceEnumerator device_enumera=
tor_udev.cpp:322
>>>>>>>>>> All dependencies for media device /dev/media0 found
>>>>>>>>>> [0:31:56.259148998] [8111] DEBUG DeviceEnumerator device_enumera=
tor.cpp:258
>>>>>>>>>> Added device /dev/media0: intel-ipu6
>>>>>>>>>> [0:31:56.259365000] [8111] DEBUG Camera camera_manager.cpp:138 F=
ound registered
>>>>>>>>>> pipeline handler 'ipu3'
>>>>>>>>>> [0:31:56.259376054] [8111] DEBUG Camera camera_manager.cpp:138 F=
ound registered
>>>>>>>>>> pipeline handler 'simple'
>>>>>>>>>> [0:31:56.259379285] [8111] DEBUG DeviceEnumerator device_enumera=
tor.cpp:318
>>>>>>>>>> Successful match for media device "intel-ipu6"
>>>>>>>>>> [0:31:56.259384622] [8111] DEBUG SimplePipeline simple.cpp:1552 =
Sensor found for
>>>>>>>>>> /dev/media0
>>>>>>>>>> [0:31:56.259405468] [8111] DEBUG SimplePipeline simple.cpp:416 F=
ound capture
>>>>>>>>>> device Intel IPU6 ISYS Capture 0
>>>>>>>>>> [0:31:56.259417404] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Exposure (0x00980911)
>>>>>>>>>> [0:31:56.259427279] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Horizontal Flip (0x00980914)
>>>>>>>>>> [0:31:56.259430625] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Vertical Flip (0x00980915)
>>>>>>>>>> [0:31:56.259434102] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Camera Orientation (0x009a0922)
>>>>>>>>>> [0:31:56.259439748] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>>>>>>> [0:31:56.259444731] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Vertical Blanking (0x009e0901)
>>>>>>>>>> [0:31:56.259448236] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>>>>>>> [0:31:56.259451979] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Analogue Gain (0x009e0903)
>>>>>>>>>> [0:31:56.259455940] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Link Frequency (0x009f0901)
>>>>>>>>>> [0:31:56.259459811] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Pixel Rate (0x009f0902)
>>>>>>>>>> [0:31:56.259463116] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Test Pattern (0x009f0903)
>>>>>>>>>> [0:31:56.259468191] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Digital Gain (0x009f0905)
>>>>>>>>>> [0:31:56.259482422] [8111] ERROR V4L2 v4l2_subdevice.cpp:1085 'o=
v08x40 4-0036':
>>>>>>>>>> Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for de=
vice
>>>>>>>>>> [0:31:56.259488780] [8111]  WARN CameraSensor camera_sensor.cpp:=
304 'ov08x40
>>>>>>>>>> 4-0036': The PixelArraySize property has been defaulted to 3856x=
2416
>>>>>>>>>> [0:31:56.259492249] [8111] ERROR V4L2 v4l2_subdevice.cpp:1085 'o=
v08x40 4-0036':
>>>>>>>>>> Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for de=
vice
>>>>>>>>>> [0:31:56.259495284] [8111]  WARN CameraSensor camera_sensor.cpp:=
315 'ov08x40
>>>>>>>>>> 4-0036': The PixelArrayActiveAreas property has been defaulted t=
o (0,
>>>>>>>>>> 0)/3856x2416
>>>>>>>>>> [0:31:56.259499843] [8111] ERROR V4L2 v4l2_subdevice.cpp:1085 'o=
v08x40 4-0036':
>>>>>>>>>> Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for de=
vice
>>>>>>>>>> [0:31:56.259502689] [8111]  WARN CameraSensor camera_sensor.cpp:=
323 'ov08x40
>>>>>>>>>> 4-0036': Failed to retrieve the sensor crop rectangle
>>>>>>>>>> [0:31:56.259505241] [8111]  WARN CameraSensor camera_sensor.cpp:=
329 'ov08x40
>>>>>>>>>> 4-0036': The sensor kernel driver needs to be fixed
>>>>>>>>>> [0:31:56.259507759] [8111]  WARN CameraSensor camera_sensor.cpp:=
331 'ov08x40
>>>>>>>>>> 4-0036': See Documentation/sensor_driver_requirements.rst in the=
 libcamera
>>>>>>>>>> sources for more information
>>>>>>>>>> [0:31:56.259634530] [8111]  WARN CameraSensorProperties
>>>>>>>>>> camera_sensor_properties.cpp:293 No static properties available =
for 'ov08x40'
>>>>>>>>>> [0:31:56.259638620] [8111]  WARN CameraSensorProperties
>>>>>>>>>> camera_sensor_properties.cpp:295 Please consider updating the ca=
mera sensor
>>>>>>>>>> properties database
>>>>>>>>>> [0:31:56.259642356] [8111] DEBUG SimplePipeline simple.cpp:486 F=
ound pipeline:
>>>>>>>>>> [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 I=
SYS Capture 0]
>>>>>>>>>> [0:31:56.259653932] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Exposure (0x00980911)
>>>>>>>>>> [0:31:56.259658031] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Horizontal Flip (0x00980914)
>>>>>>>>>> [0:31:56.259661609] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Vertical Flip (0x00980915)
>>>>>>>>>> [0:31:56.259665266] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Camera Orientation (0x009a0922)
>>>>>>>>>> [0:31:56.259669824] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Camera Sensor Rotation (0x009a0923)
>>>>>>>>>> [0:31:56.259673455] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Vertical Blanking (0x009e0901)
>>>>>>>>>> [0:31:56.259676909] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Horizontal Blanking (0x009e0902)
>>>>>>>>>> [0:31:56.259680356] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Analogue Gain (0x009e0903)
>>>>>>>>>> [0:31:56.259684182] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Link Frequency (0x009f0901)
>>>>>>>>>> [0:31:56.259687910] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Pixel Rate (0x009f0902)
>>>>>>>>>> [0:31:56.259691225] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Test Pattern (0x009f0903)
>>>>>>>>>> [0:31:56.259696017] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x=
40 4-0036':
>>>>>>>>>> Control: Digital Gain (0x009f0905)
>>>>>>>>>> [0:31:56.259706326] [8111] DEBUG V4L2 v4l2_videodevice.cpp:631
>>>>>>>>>> /dev/video0[224:cap]: Opened device : isys: ipu6
>>>>>>>>>> [0:31:56.259727296] [8111] DEBUG DmaBufAllocator dma_buf_allocat=
or.cpp:103
>>>>>>>>>> Failed to open /dev/dma_heap/linux,cma: No such file or director=
y
>>>>>>>>>> [0:31:56.259731671] [8111] DEBUG DmaBufAllocator dma_buf_allocat=
or.cpp:103
>>>>>>>>>> Failed to open /dev/dma_heap/reserved: No such file or directory
>>>>>>>>>> [0:31:56.259736325] [8111] DEBUG DmaBufAllocator dma_buf_allocat=
or.cpp:109 Using
>>>>>>>>>> /dev/dma_heap/system
>>>>>>>>>> [0:31:56.259902167] [8111] DEBUG IPAManager ipa_manager.cpp:306 =
IPA module
>>>>>>>>>> /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature=
 is valid
>>>>>>>>>> [0:31:56.259915328] [8111] DEBUG IPAProxy soft_ipa_proxy.cpp:45 =
initializing
>>>>>>>>>> soft proxy: loading IPA from
>>>>>>>>>> /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
>>>>>>>>>> [0:31:56.260253048] [8111]  WARN IPAProxy ipa_proxy.cpp:160 Conf=
iguration file
>>>>>>>>>> 'ov08x40.yaml' not found for IPA module 'simple', falling back t=
o
>>>>>>>>>> 'uncalibrated.yaml'
>>>>>>>>>> [0:31:56.260261868] [8111]  WARN IPASoft soft_simple.cpp:114 Fai=
led to create
>>>>>>>>>> camera sensor helper for ov08x40
>>>>>>>>>> [0:31:56.260285368] [8111] DEBUG IPASoft soft_simple.cpp:135 Tun=
ing file version
>>>>>>>>>> 1
>>>>>>>>>> [0:31:56.260299829] [8111] DEBUG MediaDevice media_device.cpp:82=
6
>>>>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 I=
SYS Capture
>>>>>>>>>> 0'[0]: 0
>>>>>>>>>> [0:31:56.260304036] [8111] DEBUG MediaDevice media_device.cpp:82=
6
>>>>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 I=
SYS Capture
>>>>>>>>>> 0'[0]: 1
>>>>>>>>>> [0:31:56.260323122] [8111] DEBUG SimplePipeline simple.cpp:775 L=
ink 'ov08x40
>>>>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>>>>> [0:31:56.260327682] [8111] DEBUG SimplePipeline simple.cpp:775 L=
ink 'Intel IPU6
>>>>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with fo=
rmat
>>>>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>>>>> [0:31:56.260334385] [8111] DEBUG SimplePipeline simple.cpp:626 A=
dding
>>>>>>>>>> configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
>>>>>>>>>> [0:31:56.260351261] [8111] DEBUG SimplePipeline simple.cpp:775 L=
ink 'ov08x40
>>>>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>>>>> 3856x2416-SGRBG10_1X10
>>>>>>>>>> [0:31:56.260354556] [8111] DEBUG SimplePipeline simple.cpp:775 L=
ink 'Intel IPU6
>>>>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with fo=
rmat
>>>>>>>>>> 3856x2416-SGRBG10_1X10
>>>>>>>>>> [0:31:56.260358905] [8111] DEBUG SimplePipeline simple.cpp:626 A=
dding
>>>>>>>>>> configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
>>>>>>>>>> [0:31:56.260368742] [8111] DEBUG Camera camera_manager.cpp:159 P=
ipeline handler
>>>>>>>>>> "simple" matched
>>>>>>>>>> [0:31:56.260372782] [8111] DEBUG Camera camera_manager.cpp:138 F=
ound registered
>>>>>>>>>> pipeline handler 'uvcvideo'
>>>>>>>>>> [0:31:56.260376628] [8111] DEBUG Camera camera_manager.cpp:138 F=
ound registered
>>>>>>>>>> pipeline handler 'vimc'
>>>>>>>>>> [0:32:00.473170819] [8105] DEBUG SimplePipeline simple.cpp:1002 =
Largest stream
>>>>>>>>>> size is 3848x2416
>>>>>>>>>> [0:32:00.473202717] [8105] DEBUG SimplePipeline simple.cpp:1054 =
Picked
>>>>>>>>>> 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size =
3848x2416
>>>>>>>>>> [0:32:00.473218465] [8105] DEBUG Camera camera.cpp:1132 streams =
configuration:
>>>>>>>>>> (0) 3848x2416-ABGR8888
>>>>>>>>>> [0:32:00.473245535] [8105] DEBUG SimplePipeline simple.cpp:1002 =
Largest stream
>>>>>>>>>> size is 1928x1208
>>>>>>>>>> [0:32:00.473250290] [8105] DEBUG SimplePipeline simple.cpp:1054 =
Picked
>>>>>>>>>> 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size =
1928x1208
>>>>>>>>>> [0:32:00.473255197] [8105] DEBUG SimplePipeline simple.cpp:1103 =
Adjusting size
>>>>>>>>>> from 1928x1208 to 1924x1208
>>>>>>>>>> Stream configuration adjusted to  1924x1208-ABGR8888
>>>>>>>>>> [0:32:00.473293271] [8105] DEBUG SimplePipeline simple.cpp:1002 =
Largest stream
>>>>>>>>>> size is 1924x1208
>>>>>>>>>> [0:32:00.473297929] [8105] DEBUG SimplePipeline simple.cpp:1054 =
Picked
>>>>>>>>>> 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size =
1924x1208
>>>>>>>>>> [0:32:00.473303721] [8105]  INFO Camera camera.cpp:1197 configur=
ing streams: (0)
>>>>>>>>>> 1924x1208-ABGR8888
>>>>>>>>>> [0:32:00.473326447] [8111] DEBUG MediaDevice media_device.cpp:82=
6
>>>>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 I=
SYS Capture
>>>>>>>>>> 0'[0]: 0
>>>>>>>>>> [0:32:00.473341438] [8111] DEBUG MediaDevice media_device.cpp:82=
6
>>>>>>>>>> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 I=
SYS Capture
>>>>>>>>>> 0'[0]: 1
>>>>>>>>>> [0:32:00.473382767] [8111] DEBUG SimplePipeline simple.cpp:775 L=
ink 'ov08x40
>>>>>>>>>> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
>>>>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>>>>> [0:32:00.473387953] [8111] DEBUG SimplePipeline simple.cpp:775 L=
ink 'Intel IPU6
>>>>>>>>>> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with fo=
rmat
>>>>>>>>>> 1928x1208-SGRBG10_1X10
>>>>>>>>>> [0:32:00.473403604] [8111]  INFO IPASoft soft_simple.cpp:232 Exp=
osure 4-4442,
>>>>>>>>>> gain 6.94777e-310-1984 (1)
>>>>>>>>>> Zero-copy enabled
>>>>>>>>>> [0:32:00.474651600] [8111] DEBUG Buffer framebuffer.cpp:351 Buff=
er is contiguous
>>>>>>>>>> [0:32:00.475671913] [8111] DEBUG Buffer framebuffer.cpp:351 Buff=
er is contiguous
>>>>>>>>>> [0:32:00.476681479] [8111] DEBUG Buffer framebuffer.cpp:351 Buff=
er is contiguous
>>>>>>>>>> [0:32:00.478147695] [8105] DEBUG Request request.cpp:369 Created=
 request -
>>>>>>>>>> cookie: 0
>>>>>>>>>> [0:32:00.478162670] [8105] DEBUG Request request.cpp:369 Created=
 request -
>>>>>>>>>> cookie: 0
>>>>>>>>>> [0:32:00.478166787] [8105] DEBUG Request request.cpp:369 Created=
 request -
>>>>>>>>>> cookie: 0
>>>>>>>>>> [0:32:00.478180310] [8105] DEBUG Camera camera.cpp:1355 Starting=
 capture
>>>>>>>>>> [0:32:00.484289849] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1279
>>>>>>>>>> /dev/video0[224:cap]: 3 buffers requested.
>>>>>>>>>> [0:32:00.484377532] [8111] DEBUG Buffer framebuffer.cpp:351 Buff=
er is contiguous
>>>>>>>>>> [0:32:00.484408807] [8111] DEBUG Buffer framebuffer.cpp:351 Buff=
er is contiguous
>>>>>>>>>> [0:32:00.484433473] [8111] DEBUG Buffer framebuffer.cpp:351 Buff=
er is contiguous
>>>>>>>>>> [0:32:00.485163250] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1718
>>>>>>>>>> /dev/video0[224:cap]: Queueing buffer 0
>>>>>>>>>> [0:32:00.610747330] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1718
>>>>>>>>>> /dev/video0[224:cap]: Queueing buffer 1
>>>>>>>>>> [0:32:00.610795989] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1718
>>>>>>>>>> /dev/video0[224:cap]: Queueing buffer 2
>>>>>>>>>> [0:32:04.580974685] [8105] DEBUG Camera camera.cpp:1399 Stopping=
 capture
>>>>>>>>>> [0:32:08.617087710] [8111] DEBUG Request request.cpp:129 Request=
(0:C:0/1:0)
>>>>>>>>>> [0:32:08.617207866] [8111] DEBUG Request request.cpp:129 Request=
(1:C:0/1:0)
>>>>>>>>>> [0:32:08.617222231] [8111] DEBUG Request request.cpp:129 Request=
(2:C:0/1:0)
>>>>>>>>>> [0:32:08.617240304] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1564
>>>>>>>>>> /dev/video0[224:cap]: Releasing buffers
>>>>>>>>>> [0:32:08.617274179] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1279
>>>>>>>>>> /dev/video0[224:cap]: 0 buffers requested.
>>>>>>>>>>
>>>>>>>>>> The image that qcam shows is attached. It _looks_ like the same =
symbol Windows
>>>>>>>>>> shows when the shutter is closed - just maybe reversed.
>>>>>>>>>>
>>>>>>>>>> If I try the same with the shutter open, my laptop freezes, and =
I have to do a
>>>>>>>>>> power-down reset.
>>>>>>>>>>
>>>>>>>>>> I am fairly handy and am willing to help, I just need some guida=
nce into what I
>>>>>>>>>> need to do next
>>>>>>>>>>
>>>>>>>>>> Sincerely,
>>>>>>>>>> Duane
>>=20
>=20
> --
> Best regards,
> Bingbu Cao

