Return-Path: <linux-media+bounces-23787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 575699F7C56
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5F918925A9
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09980225416;
	Thu, 19 Dec 2024 13:26:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail2.tds.syn-alias.com (mail2.tds.syn-alias.com [129.159.94.43])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E0B2253E3
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.159.94.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734614789; cv=none; b=G2lehcTM+4jWlvYzepKUlxHQzWAKRhiRwICI/wJB4s3h/wd+EI2v2WwYRTDFk9CXLx0ipHFJQJIceTzNNoPpqw7rXd3ka6MBZpI61wavWeJO+vvo+sr8EnvsBlpE3MUs81avPRni2wfsp0sOKgdHb/xsB3s1THViPKppVDi+bI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734614789; c=relaxed/simple;
	bh=wf5Z8xNgYGgnka7SVYCBTRBix7qxYU/u9Cfo/yyGYxQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=bV42DMp3glSjmnIaejkq4ztcuvbHpkWdMB6HXMbmj6cOq/7iRwULzBFOWOBhUIvbFYyeMviJZjuz475f/fotFYY8jxfX52tkfuLoMjgbdgZaAd4zJcu5+UVpGi5rMMfMprFgDyI7N9VciZ7v2rftEWttyx9tvv+1fZt07uPOegs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net; spf=pass smtp.mailfrom=chorus.net; arc=none smtp.client-ip=129.159.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chorus.net
X-Authed-Username: ZHVhbmVrQGNob3J1cy5uZXQ=
Received: from [10.219.153.28] ([10.219.153.28:53654] helo=md15.tds.email-ash1.sync.lan)
	by mail.tds.net (envelope-from <duanek@chorus.net>)
	(ecelerity 4.4.1.20033 r(msys-ecelerity:tags/4.4.1.0^0)) with ESMTP
	id 45/96-06351-AFE14676; Thu, 19 Dec 2024 08:26:18 -0500
Date: Thu, 19 Dec 2024 08:26:18 -0500 (EST)
From: "duanek@chorus.net" <duanek@chorus.net>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media <linux-media@vger.kernel.org>, 
	libcamera-devel <libcamera-devel@lists.libcamera.org>
Message-ID: <1634366496.102345718.1734614778536.JavaMail.zimbra@chorus.net>
In-Reply-To: <22f3bfe0-23ca-1ba9-95a7-5288bea5a723@linux.intel.com>
References: <1594170563.10937137.1728935697496.JavaMail.zimbra@chorus.net> <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net> <3csrwld4fbhg7fg7v4dm4fccvxkracxuwj6y7k5z7k7t5zpeha@qfgr6pmzyg6f> <698982370.100647689.1734540932591.JavaMail.zimbra@chorus.net> <4vlmoi3uto44j3cigzatkclqd5krybvihvkq77glwcblpdlrb5@yhdl6dvd2gmj> <06dcddff-84b3-8717-fa56-53d49abcaf5d@linux.intel.com> <578607689.101572908.1734571756163.JavaMail.zimbra@chorus.net> <22f3bfe0-23ca-1ba9-95a7-5288bea5a723@linux.intel.com>
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
Thread-Index: ejW9e5I9WGhvVRF7c9vaW6i8WX0Lsg==
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddghedtucetufdoteggodetrfdotffvucfrrhho
X-Vade-Analysis-2: fhhilhgvmecuufgjpfetvefqtfdpvfffufdpgffpggdqvfffufdpqfgfvfenuceurghilhhouhhtmecu
X-Vade-Analysis-3: fedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevkfgjfhfugggt
X-Vade-Analysis-4: gfhiofhtsehtqhgttdiitdejnecuhfhrohhmpedfughurghnvghksegthhhorhhushdrnhgvthdfuceo
X-Vade-Analysis-5: ughurghnvghksegthhhorhhushdrnhgvtheqnecuggftrfgrthhtvghrnhepveejffduueevveeihedv
X-Vade-Analysis-6: teegfeefkeetlefhvdeggfehkeetheeitdffveffgfeinecukfhppedutddrvdduledrudehfedrvdek
X-Vade-Analysis-7: pddvtdejrddvtddtrddvvdejrdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhn
X-Vade-Analysis-8: vghtpedutddrvdduledrudehfedrvdekpdhhvghlohepmhguudehrdhtughsrdgvmhgrihhlqdgrshhh
X-Vade-Analysis-9: uddrshihnhgtrdhlrghnpdhmrghilhhfrhhomhepughurghnvghksegthhhorhhushdrnhgvthdprhgt
X-Vade-Analysis-10: phhtthhopegsihhnghgsuhdrtggroheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehj
X-Vade-Analysis-11: rggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhu
X-Vade-Analysis-12: gidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgstggrmhgvrhgr
X-Vade-Analysis-13: qdguvghvvghlsehlihhsthhsrdhlihgstggrmhgvrhgrrdhorhhgpdhmthgrhhhoshhtpehsmhhtphdt
X-Vade-Analysis-14: uddrthgushdrvghmrghilhdqrghshhdurdhshihntgdrlhgrnhdpnhgspghrtghpthhtohepgedpihhs
X-Vade-Analysis-15: pghnrgepfhgrlhhsvgdprghuthhhpghushgvrhepughurghnvghksegthhhorhhushdrnhgvth
X-Vade-Client: TDS

Dear Bingbu Cao,

Thanks for your patience.

I created the ipu.conf file, and rebooted. After re-booting the command:
LIBCAMERA_LOG_LEVELS=3D0 cam -c"\_SB_.PC00.LNK0" -C1

could not find a camera, so I re-loaded the ov08x40 module, and re-ran the =
above cam command, which then found a camera and generated dmesg output.

20241219_dmesg:
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
[    0.000008] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000009] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000014] last_pfn =3D 0x880000 max_arch_pfn =3D 0x400000000
[    0.000018] MTRR map: 8 entries (3 fixed + 5 variable; max 23), built fr=
om 10 variable MTRRs
[    0.000019] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.000463] x2apic: enabled by BIOS, switching to x2apic ops
[    0.000464] last_pfn =3D 0x66000 max_arch_pfn =3D 0x400000000
[    0.004832] esrt: Reserving ESRT space from 0x0000000055b40d18 to 0x0000=
000055b40d50.
[    0.004837] e820: update [mem 0x55b40000-0x55b40fff] usable =3D=3D> rese=
rved
[    0.004849] Using GB pages for direct mapping
[    0.005036] RAMDISK: [mem 0x3c687000-0x41486fff]
[    0.005040] ACPI: Early table checksum verification disabled
[    0.005043] ACPI: RSDP 0x000000005AE6D014 000024 (v02 HPQOEM)
[    0.005046] ACPI: XSDT 0x000000005AE6C728 000194 (v01 HPQOEM SLIC-MPC 01=
072009 AMI  01000013)
[    0.005050] ACPI: FACP 0x000000005AE53000 000114 (v06 HPQOEM SLIC-MPC 01=
072009 HP   01000013)
[    0.005055] ACPI: DSDT 0x000000005ADDB000 077690 (v02 HPQOEM 8C17     01=
072009 ACPI 20210930)
[    0.005057] ACPI: FACS 0x000000005AFEA000 000040
[    0.005058] ACPI: SSDT 0x000000005AE6B000 000689 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005060] ACPI: SSDT 0x000000005AE6A000 0005E4 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005061] ACPI: SSDT 0x000000005AE69000 0001AB (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005063] ACPI: SSDT 0x000000005AE68000 000394 (v02 HPQOEM 8C17     00=
003001 ACPI 20210930)
[    0.005064] ACPI: SSDT 0x000000005AE66000 001BAF (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005065] ACPI: SSDT 0x000000005AE64000 001620 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005067] ACPI: SSDT 0x000000005AE62000 001349 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005068] ACPI: SSDT 0x000000005AE61000 000FBB (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005070] ACPI: SSDT 0x000000005AE5D000 003BC8 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005072] ACPI: DTPR 0x000000005AE5C000 000098 (v01 HPQOEM 8C17     00=
000000 HP   00000000)
[    0.005073] ACPI: SSDT 0x000000005AE56000 0058E1 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005075] ACPI: SSDT 0x000000005AE54000 00165F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005076] ACPI: FIDT 0x000000005ADDA000 00009C (v01 HPQOEM 8C17     01=
072009 HP   00010013)
[    0.005077] ACPI: MSDM 0x000000005ADD9000 000055 (v03 HPQOEM SLIC-MPC 00=
000001 HP   00010013)
[    0.005079] ACPI: SSDT 0x000000005ADD8000 00038C (v02 HPQOEM 8C17     00=
000001 ACPI 20210930)
[    0.005080] ACPI: SSDT 0x000000005ADD5000 002494 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005082] ACPI: SSDT 0x000000005ADCA000 0000F9 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005083] ACPI: HPET 0x000000005ADC9000 000038 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005085] ACPI: APIC 0x000000005ADC8000 000358 (v05 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005086] ACPI: MCFG 0x000000005ADC7000 00003C (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005088] ACPI: SSDT 0x000000005ADC5000 00147F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005089] ACPI: SSDT 0x000000005ADC3000 00140F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005090] ACPI: SSDT 0x000000005ADB2000 01023F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005092] ACPI: UEFI 0x000000005AEF0000 000048 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005093] ACPI: NHLT 0x000000005ADB1000 000960 (v00 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005095] ACPI: LPIT 0x000000005ADB0000 0000CC (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005096] ACPI: SSDT 0x000000005ADAE000 000CA6 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005098] ACPI: SSDT 0x000000005ADA8000 005E42 (v02 HPQOEM 8C17     00=
000000 ACPI 20210930)
[    0.005099] ACPI: DBGP 0x000000005ADA7000 000034 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005101] ACPI: DBG2 0x000000005ADA6000 000054 (v00 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005102] ACPI: SSDT 0x000000005ADA4000 00113F (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005103] ACPI: DMAR 0x000000005ADA3000 0000A8 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005105] ACPI: FPDT 0x000000005ADA2000 000044 (v01 HPQOEM 8C17     01=
072009 HP   01000013)
[    0.005106] ACPI: SSDT 0x000000005ADA0000 001021 (v02 HPQOEM 8C17     00=
000000 ACPI 20210930)
[    0.005108] ACPI: SSDT 0x000000005AD9D000 00281A (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005109] ACPI: SSDT 0x000000005AD9A000 0028D3 (v02 HPQOEM 8C17     00=
003000 ACPI 20210930)
[    0.005111] ACPI: SSDT 0x000000005AD99000 000060 (v01 HPQOEM 8C17     00=
000001 ACPI 20210930)
[    0.005112] ACPI: SSDT 0x000000005AD90000 0085C5 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005113] ACPI: OEM1 0x000000005AD8F000 0002B0 (v01 HPQOEM HPOEM1DC 00=
000000 HP   00000000)
[    0.005115] ACPI: SSDT 0x000000005AD8B000 003210 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005116] ACPI: PHAT 0x000000005AD8A000 000734 (v01 HPQOEM 8C17     00=
000005 HP   0100000D)
[    0.005118] ACPI: SSDT 0x000000005ADCB000 009BC2 (v02 HPQOEM 8C17     00=
001000 ACPI 20210930)
[    0.005119] ACPI: TPM2 0x000000005AD89000 00004C (v04 HPQOEM 8C17     00=
000001 HP   00000000)
[    0.005121] ACPI: WSMT 0x000000005ADAF000 000028 (v01 HPQOEM 8C17     01=
072009 HP   00010013)
[    0.005122] ACPI: BGRT 0x000000005AD88000 000038 (v01 HPQOEM 8C17     01=
072009 HP   00010013)
[    0.005123] ACPI: Reserving FACP table memory at [mem 0x5ae53000-0x5ae53=
113]
[    0.005124] ACPI: Reserving DSDT table memory at [mem 0x5addb000-0x5ae52=
68f]
[    0.005124] ACPI: Reserving FACS table memory at [mem 0x5afea000-0x5afea=
03f]
[    0.005125] ACPI: Reserving SSDT table memory at [mem 0x5ae6b000-0x5ae6b=
688]
[    0.005125] ACPI: Reserving SSDT table memory at [mem 0x5ae6a000-0x5ae6a=
5e3]
[    0.005126] ACPI: Reserving SSDT table memory at [mem 0x5ae69000-0x5ae69=
1aa]
[    0.005126] ACPI: Reserving SSDT table memory at [mem 0x5ae68000-0x5ae68=
393]
[    0.005126] ACPI: Reserving SSDT table memory at [mem 0x5ae66000-0x5ae67=
bae]
[    0.005127] ACPI: Reserving SSDT table memory at [mem 0x5ae64000-0x5ae65=
61f]
[    0.005127] ACPI: Reserving SSDT table memory at [mem 0x5ae62000-0x5ae63=
348]
[    0.005128] ACPI: Reserving SSDT table memory at [mem 0x5ae61000-0x5ae61=
fba]
[    0.005128] ACPI: Reserving SSDT table memory at [mem 0x5ae5d000-0x5ae60=
bc7]
[    0.005128] ACPI: Reserving DTPR table memory at [mem 0x5ae5c000-0x5ae5c=
097]
[    0.005129] ACPI: Reserving SSDT table memory at [mem 0x5ae56000-0x5ae5b=
8e0]
[    0.005129] ACPI: Reserving SSDT table memory at [mem 0x5ae54000-0x5ae55=
65e]
[    0.005129] ACPI: Reserving FIDT table memory at [mem 0x5adda000-0x5adda=
09b]
[    0.005130] ACPI: Reserving MSDM table memory at [mem 0x5add9000-0x5add9=
054]
[    0.005130] ACPI: Reserving SSDT table memory at [mem 0x5add8000-0x5add8=
38b]
[    0.005131] ACPI: Reserving SSDT table memory at [mem 0x5add5000-0x5add7=
493]
[    0.005131] ACPI: Reserving SSDT table memory at [mem 0x5adca000-0x5adca=
0f8]
[    0.005131] ACPI: Reserving HPET table memory at [mem 0x5adc9000-0x5adc9=
037]
[    0.005132] ACPI: Reserving APIC table memory at [mem 0x5adc8000-0x5adc8=
357]
[    0.005132] ACPI: Reserving MCFG table memory at [mem 0x5adc7000-0x5adc7=
03b]
[    0.005132] ACPI: Reserving SSDT table memory at [mem 0x5adc5000-0x5adc6=
47e]
[    0.005133] ACPI: Reserving SSDT table memory at [mem 0x5adc3000-0x5adc4=
40e]
[    0.005133] ACPI: Reserving SSDT table memory at [mem 0x5adb2000-0x5adc2=
23e]
[    0.005134] ACPI: Reserving UEFI table memory at [mem 0x5aef0000-0x5aef0=
047]
[    0.005134] ACPI: Reserving NHLT table memory at [mem 0x5adb1000-0x5adb1=
95f]
[    0.005134] ACPI: Reserving LPIT table memory at [mem 0x5adb0000-0x5adb0=
0cb]
[    0.005135] ACPI: Reserving SSDT table memory at [mem 0x5adae000-0x5adae=
ca5]
[    0.005135] ACPI: Reserving SSDT table memory at [mem 0x5ada8000-0x5adad=
e41]
[    0.005136] ACPI: Reserving DBGP table memory at [mem 0x5ada7000-0x5ada7=
033]
[    0.005136] ACPI: Reserving DBG2 table memory at [mem 0x5ada6000-0x5ada6=
053]
[    0.005136] ACPI: Reserving SSDT table memory at [mem 0x5ada4000-0x5ada5=
13e]
[    0.005137] ACPI: Reserving DMAR table memory at [mem 0x5ada3000-0x5ada3=
0a7]
[    0.005137] ACPI: Reserving FPDT table memory at [mem 0x5ada2000-0x5ada2=
043]
[    0.005138] ACPI: Reserving SSDT table memory at [mem 0x5ada0000-0x5ada1=
020]
[    0.005138] ACPI: Reserving SSDT table memory at [mem 0x5ad9d000-0x5ad9f=
819]
[    0.005138] ACPI: Reserving SSDT table memory at [mem 0x5ad9a000-0x5ad9c=
8d2]
[    0.005139] ACPI: Reserving SSDT table memory at [mem 0x5ad99000-0x5ad99=
05f]
[    0.005139] ACPI: Reserving SSDT table memory at [mem 0x5ad90000-0x5ad98=
5c4]
[    0.005139] ACPI: Reserving OEM1 table memory at [mem 0x5ad8f000-0x5ad8f=
2af]
[    0.005140] ACPI: Reserving SSDT table memory at [mem 0x5ad8b000-0x5ad8e=
20f]
[    0.005140] ACPI: Reserving PHAT table memory at [mem 0x5ad8a000-0x5ad8a=
733]
[    0.005141] ACPI: Reserving SSDT table memory at [mem 0x5adcb000-0x5add4=
bc1]
[    0.005141] ACPI: Reserving TPM2 table memory at [mem 0x5ad89000-0x5ad89=
04b]
[    0.005142] ACPI: Reserving WSMT table memory at [mem 0x5adaf000-0x5adaf=
027]
[    0.005142] ACPI: Reserving BGRT table memory at [mem 0x5ad88000-0x5ad88=
037]
[    0.005176] APIC: Switched APIC routing to: cluster x2apic
[    0.005376] No NUMA configuration found
[    0.005377] Faking a node at [mem 0x0000000000000000-0x000000087fffffff]
[    0.005381] NODE_DATA(0) allocated [mem 0x87ffd5680-0x87fffffff]
[    0.005545] Zone ranges:
[    0.005545]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.005546]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.005547]   Normal   [mem 0x0000000100000000-0x000000087fffffff]
[    0.005548]   Device   empty
[    0.005548] Movable zone start for each node
[    0.005549] Early memory node ranges
[    0.005550]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.005550]   node   0: [mem 0x0000000000100000-0x0000000057818fff]
[    0.005551]   node   0: [mem 0x0000000065fff000-0x0000000065ffffff]
[    0.005551]   node   0: [mem 0x0000000100000000-0x000000087fffffff]
[    0.005554] Initmem setup node 0 [mem 0x0000000000001000-0x000000087ffff=
fff]
[    0.005558] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.005577] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.007312] On node 0, zone DMA32: 26598 pages in unavailable ranges
[    0.007537] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.007926] ACPI: PM-Timer IO Port: 0x1808
[    0.007933] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.007966] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
119
[    0.007968] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.007969] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.007971] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.007972] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.007978] e820: update [mem 0x5453a000-0x54563fff] usable =3D=3D> rese=
rved
[    0.007985] TSC deadline timer available
[    0.007987] CPU topo: Max. logical packages:   1
[    0.007988] CPU topo: Max. logical dies:       1
[    0.007988] CPU topo: Max. dies per package:   1
[    0.007989] CPU topo: Max. threads per core:   2
[    0.007990] CPU topo: Num. cores per package:    16
[    0.007990] CPU topo: Num. threads per package:  22
[    0.007991] CPU topo: Allowing 22 present CPUs plus 0 hotplug CPUs
[    0.008000] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.008001] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0=
x000fffff]
[    0.008002] PM: hibernation: Registered nosave memory: [mem 0x4fe69000-0=
x4fe69fff]
[    0.008003] PM: hibernation: Registered nosave memory: [mem 0x4fe78000-0=
x4fe78fff]
[    0.008004] PM: hibernation: Registered nosave memory: [mem 0x5453a000-0=
x54563fff]
[    0.008005] PM: hibernation: Registered nosave memory: [mem 0x55b40000-0=
x55b40fff]
[    0.008005] PM: hibernation: Registered nosave memory: [mem 0x57819000-0=
x5ad4dfff]
[    0.008006] PM: hibernation: Registered nosave memory: [mem 0x5ad4e000-0=
x5ae6dfff]
[    0.008006] PM: hibernation: Registered nosave memory: [mem 0x5ae6e000-0=
x5aff0fff]
[    0.008006] PM: hibernation: Registered nosave memory: [mem 0x5aff1000-0=
x65ffefff]
[    0.008007] PM: hibernation: Registered nosave memory: [mem 0x66000000-0=
x787fffff]
[    0.008007] PM: hibernation: Registered nosave memory: [mem 0x78800000-0=
xfdffffff]
[    0.008008] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0=
xfe010fff]
[    0.008008] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0=
xfebfffff]
[    0.008008] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0=
xfec00fff]
[    0.008008] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0=
xfecfffff]
[    0.008009] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0=
xfed00fff]
[    0.008009] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0=
xfed1ffff]
[    0.008009] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0=
xfed7ffff]
[    0.008010] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0=
xfedfffff]
[    0.008010] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0=
xfee00fff]
[    0.008010] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0=
xffffffff]
[    0.008011] [mem 0x78800000-0xfdffffff] available for PCI devices
[    0.008012] Booting paravirtualized kernel on bare hardware
[    0.008014] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 7645519600211568 ns
[    0.011256] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:22 nr_cpu_ids:22 =
nr_node_ids:1
[    0.012531] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.012537] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=3D1*2097152
[    0.012540] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07=20
[    0.012542] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15=20
[    0.012544] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 -- --=20
[    0.012556] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-6.12.5-ipu6 =
root=3DUUID=3D7881f7bb-dbe6-4323-887f-dd718adb7a8b ro quiet splash
[    0.012592] Unknown kernel command line parameters "splash BOOT_IMAGE=3D=
/boot/vmlinuz-6.12.5-ipu6", will be passed to user space.
[    0.012600] printk: log_buf_len individual max cpu contribution: 4096 by=
tes
[    0.012601] printk: log_buf_len total cpu_extra contributions: 86016 byt=
es
[    0.012601] printk: log_buf_len min size: 131072 bytes
[    0.012740] printk: log_buf_len: 262144 bytes
[    0.012741] printk: early log buf free: 112576(85%)
[    0.015386] Dentry cache hash table entries: 4194304 (order: 13, 3355443=
2 bytes, linear)
[    0.016704] Inode-cache hash table entries: 2097152 (order: 12, 16777216=
 bytes, linear)
[    0.016863] Fallback order for Node 0: 0=20
[    0.016866] Built 1 zonelists, mobility grouping on.  Total pages: 82226=
48
[    0.016867] Policy zone: Normal
[    0.016872] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.016883] software IO TLB: area num 32.
[    0.032394] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D22, =
Nodes=3D1
[    0.032454] ftrace: allocating 45562 entries in 178 pages
[    0.038379] ftrace: allocated 178 pages with 4 groups
[    0.038961] Dynamic Preempt: voluntary
[    0.039029] rcu: Preemptible hierarchical RCU implementation.
[    0.039030] rcu: =09RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_i=
ds=3D22.
[    0.039031] =09Trampoline variant of Tasks RCU enabled.
[    0.039031] =09Rude variant of Tasks RCU enabled.
[    0.039031] =09Tracing variant of Tasks RCU enabled.
[    0.039032] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.039032] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D22
[    0.039043] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjus=
t=3D1 rcu_task_cpu_ids=3D22.
[    0.039045] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_=
adjust=3D1 rcu_task_cpu_ids=3D22.
[    0.039047] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb=
_adjust=3D1 rcu_task_cpu_ids=3D22.
[    0.041314] NR_IRQS: 524544, nr_irqs: 2232, preallocated irqs: 16
[    0.041615] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.041797] Console: colour dummy device 80x25
[    0.041799] printk: legacy console [tty0] enabled
[    0.041833] ACPI: Core revision 20240827
[    0.042155] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.042248] APIC: Switch to symmetric I/O mode setup
[    0.042250] DMAR: Host address width 42
[    0.042250] DMAR: DRHD base: 0x000000fc800000 flags: 0x0
[    0.042257] DMAR: dmar0: reg_base_addr fc800000 ver 7:0 cap c9de008cee69=
0462 ecap 12ca9a00f0ef5e
[    0.042259] DMAR: DRHD base: 0x000000fc801000 flags: 0x1
[    0.042262] DMAR: dmar1: reg_base_addr fc801000 ver 7:0 cap c9de008cee69=
0462 ecap 12ca9a00f0efde
[    0.042264] DMAR: SATC flags: 0x1
[    0.042266] DMAR-IR: IOAPIC id 2 under DRHD base  0xfc801000 IOMMU 1
[    0.042267] DMAR-IR: HPET id 0 under DRHD base 0xfc801000
[    0.042267] DMAR-IR: Queued invalidation will be enabled to support x2ap=
ic and Intr-remapping.
[    0.043884] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.047846] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.047853] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5990.40 BogoMIPS (lpj=3D11980800)
[    0.047908] CPU0: Thermal monitoring enabled (TM1)
[    0.047909] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.048080] CET detected: Indirect Branch Tracking enabled
[    0.048082] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.048082] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.048085] process: using mwait in idle threads
[    0.048086] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.048088] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.048089] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.048090] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.048091] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.048099] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.048100] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.048101] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.048101] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys Us=
er registers'
[    0.048102] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User =
registers'
[    0.048102] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.048103] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.048104] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.048104] x86/fpu: Enabled xstate features 0xa07, context size is 856 =
bytes, using 'compacted' format.
[    0.051851] Freeing SMP alternatives memory: 40K
[    0.051851] pid_max: default: 32768 minimum: 301
[    0.051851] LSM: initializing lsm=3Dlockdown,capability,landlock,yama,ap=
parmor,tomoyo,bpf,ima,evm
[    0.051851] landlock: Up and running.
[    0.051851] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.051851] AppArmor: AppArmor initialized
[    0.051851] TOMOYO Linux initialized
[    0.051851] LSM support for eBPF active
[    0.051851] Mount-cache hash table entries: 65536 (order: 7, 524288 byte=
s, linear)
[    0.051851] Mountpoint-cache hash table entries: 65536 (order: 7, 524288=
 bytes, linear)
[    0.051851] smpboot: CPU0: Intel(R) Core(TM) Ultra 7 155H (family: 0x6, =
model: 0xaa, stepping: 0x4)
[    0.051851] Performance Events: XSAVE Architectural LBR, PEBS fmt4+-base=
line,  AnyThread deprecated, Meteorlake Hybrid events, 32-deep LBR, full-wi=
dth counters, Intel PMU driver.
[    0.051851] core: cpu_core PMU driver:=20
[    0.051851] ... version:                5
[    0.051851] ... bit width:              48
[    0.051851] ... generic registers:      8
[    0.051851] ... value mask:             0000ffffffffffff
[    0.051851] ... max period:             00007fffffffffff
[    0.051851] ... fixed-purpose events:   4
[    0.051851] ... event mask:             0001000f000000ff
[    0.051851] signal: max sigframe size: 3632
[    0.051851] Estimated ratio of average max frequency by base frequency (=
times 1024): 1638
[    0.051851] rcu: Hierarchical SRCU implementation.
[    0.051851] rcu: =09Max phase no-delay instances is 1000.
[    0.051851] Timer migration: 2 hierarchy levels; 8 children per group; 2=
 crossnode level
[    0.051851] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.051851] smp: Bringing up secondary CPUs ...
[    0.051851] smpboot: x86: Booting SMP configuration:
[    0.051851] .... node  #0, CPUs:        #1  #3  #6  #8 #10 #12 #13 #14 #=
15 #16 #17 #18 #19 #20 #21
[    0.010105] core: cpu_atom PMU driver: PEBS-via-PT=20
[    0.010105] ... version:                5
[    0.010105] ... bit width:              48
[    0.010105] ... generic registers:      8
[    0.010105] ... value mask:             0000ffffffffffff
[    0.010105] ... max period:             00007fffffffffff
[    0.010105] ... fixed-purpose events:   3
[    0.010105] ... event mask:             00000007000000ff
[    0.071869]   #2  #4  #5  #7  #9 #11
[    0.089368] smp: Brought up 1 node, 22 CPUs
[    0.089368] smpboot: Total of 22 processors activated (131788.80 BogoMIP=
S)
[    0.104610] node 0 deferred pages initialised in 16ms
[    0.108465] Memory: 32108588K/32890592K available (16384K kernel code, 2=
485K rwdata, 6840K rodata, 4128K init, 4988K bss, 760692K reserved, 0K cma-=
reserved)
[    0.108658] devtmpfs: initialized
[    0.108658] x86/mm: Memory block size: 128MB
[    0.109188] ACPI: PM: Registering ACPI NVS region [mem 0x5ae6e000-0x5aff=
0fff] (1585152 bytes)
[    0.109188] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.109188] futex hash table entries: 8192 (order: 7, 524288 bytes, line=
ar)
[    0.109188] pinctrl core: initialized pinctrl subsystem
[    0.109188] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.112023] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.112388] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.112753] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.112760] audit: initializing netlink subsys (disabled)
[    0.112769] audit: type=3D2000 audit(1734614242.064:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.112769] thermal_sys: Registered thermal governor 'fair_share'
[    0.112769] thermal_sys: Registered thermal governor 'bang_bang'
[    0.112769] thermal_sys: Registered thermal governor 'step_wise'
[    0.112769] thermal_sys: Registered thermal governor 'user_space'
[    0.112769] thermal_sys: Registered thermal governor 'power_allocator'
[    0.112769] cpuidle: using governor ladder
[    0.112769] cpuidle: using governor menu
[    0.112769] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.112769] PCI: ECAM [mem 0xc0000000-0xcfffffff] (base 0xc0000000) for =
domain 0000 [bus 00-ff]
[    0.112769] PCI: Using configuration type 1 for base access
[    0.112769] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.112769] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 page=
s
[    0.112769] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.112769] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 page=
s
[    0.112769] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.112769] ACPI: Added _OSI(Module Device)
[    0.112769] ACPI: Added _OSI(Processor Device)
[    0.112769] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.112769] ACPI: Added _OSI(Processor Aggregator Device)
[    0.175805] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PACT], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175813] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175815] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PABN], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175817] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175819] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PAS1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175821] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175824] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PMP0], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175826] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175835] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PMP1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175838] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175847] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA01], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175850] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175852] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.175854] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA02], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175856] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175858] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.175859] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA03], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175861] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175862] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.175863] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA04], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175865] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175867] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.175872] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA05], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175891] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175903] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.175910] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA06], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175922] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175931] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.175935] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA07], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175946] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175954] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.175959] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.I2C3.PA08], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.175969] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.175977] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x5B82)
[    0.177535] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.I=
2C3.TPD0], AE_NOT_FOUND (20240827/dswload2-162)
[    0.177540] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.177544] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.186991] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.T=
XHC.RHUB.SS01], AE_NOT_FOUND (20240827/dswload2-162)
[    0.186997] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.187000] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.187003] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.T=
XHC.RHUB.SS02], AE_NOT_FOUND (20240827/dswload2-162)
[    0.187007] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.187010] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.187012] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.T=
XHC.RHUB.SS03], AE_NOT_FOUND (20240827/dswload2-162)
[    0.187016] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.187019] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.187021] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.T=
XHC.RHUB.SS04], AE_NOT_FOUND (20240827/dswload2-162)
[    0.187025] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (202408=
27/psobject-220)
[    0.187028] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0010)
[    0.187055] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187060] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187063] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187065] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187069] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187072] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187077] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187081] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187084] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187085] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187089] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187092] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187097] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS03._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187101] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187104] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187105] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS03._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187109] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187112] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187116] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS04._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187120] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187123] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187125] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS04._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187129] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187132] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187136] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS05._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187140] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187143] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187144] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS05._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187148] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187151] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187155] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS06._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187159] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187162] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187164] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS06._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187167] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187170] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187174] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS07._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187179] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187181] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187183] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS07._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187187] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187190] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187194] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS08._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187198] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187201] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187202] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS08._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187206] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187209] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187213] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS09._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187217] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187220] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187221] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS09._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187225] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187228] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187233] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS10._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187237] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187240] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187241] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.HS10._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187245] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187248] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187333] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.SS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187337] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187340] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187342] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.SS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187346] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187348] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187353] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.SS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187357] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187360] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.187361] ACPI BIOS Error (bug): Failure creating named object [\_SB.P=
C00.XHCI.RHUB.SS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.187365] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (2=
0240827/psobject-220)
[    0.187368] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (=
0x0014)
[    0.198949] ACPI: 28 ACPI AML tables successfully acquired and loaded
[    0.213762] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.213766] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.221518] ACPI: EC: EC started
[    0.221520] ACPI: EC: interrupt blocked
[    0.227567] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.227570] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC used to handle tran=
sactions
[    0.227572] ACPI: Interpreter enabled
[    0.227646] ACPI: PM: (supports S0 S3 S4 S5)
[    0.227647] ACPI: Using IOAPIC for interrupt routing
[    0.227714] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.227715] PCI: Ignoring E820 reservations for host bridge windows
[    0.230412] ACPI: Enabled 10 GPEs in block 00 to 7F
[    0.230433] ACPI: Enabled 8 GPEs in block 80 to DF
[    0.233024] ACPI: \_SB_.PC00.RP01.PXP_: New power resource
[    0.238071] ACPI: \_SB_.PC00.RP06.PXP_: New power resource
[    0.239612] ACPI: \_SB_.PC00.RP07.PXP_: New power resource
[    0.242229] ACPI: \_SB_.PC00.RP09.PXP_: New power resource
[    0.243442] ACPI: \_SB_.PC00.RP10.PXP_: New power resource
[    0.244850] ACPI: \_SB_.PC00.RP11.PXP_: New power resource
[    0.246353] ACPI: \_SB_.PC00.RP12.PXP_: New power resource
[    0.249935] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.BTRT: New power resource
[    0.249989] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.DBTR: New power resource
[    0.250137] ACPI: \_SB_.PC00.PAUD: New power resource
[    0.255754] ACPI: \_SB_.PC00.I2C3.PXTC: New power resource
[    0.262010] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.279601] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.279663] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.279719] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.298017] ACPI: \PIN_: New power resource
[    0.298603] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-fe])
[    0.298610] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    0.299451] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.301064] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotp=
lug PME PCIeCapability LTR]
[    0.302932] PCI host bridge to bus 0000:00
[    0.302935] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window=
]
[    0.302938] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window=
]
[    0.302939] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.302942] pci_bus 0000:00: root bus resource [mem 0x80000000-0xbffffff=
f window]
[    0.302943] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x3ffbf=
ffffff window]
[    0.302945] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.304994] pci 0000:00:00.0: [8086:7d01] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.305135] pci 0000:00:02.0: [8086:7d55] type 00 class 0x030000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.305148] pci 0000:00:02.0: BAR 0 [mem 0x5220000000-0x5220ffffff 64bit=
 pref]
[    0.305157] pci 0000:00:02.0: BAR 2 [mem 0x4210000000-0x421fffffff 64bit=
 pref]
[    0.305188] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.305192] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.305228] pci 0000:00:02.0: PME# supported from D0 D3hot
[    0.305246] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit =
pref]
[    0.305247] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit =
pref]: contains BAR 0 for 7 VFs
[    0.305429] pci 0000:00:04.0: [8086:7d03] type 00 class 0x118000 convent=
ional PCI endpoint
[    0.305444] pci 0000:00:04.0: BAR 0 [mem 0x52312c0000-0x52312dffff 64bit=
]
[    0.305685] pci 0000:00:05.0: [8086:7d19] type 00 class 0x048000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.305694] pci 0000:00:05.0: BAR 0 [mem 0x5230000000-0x5230ffffff 64bit=
]
[    0.305710] pci 0000:00:05.0: enabling Extended Tags
[    0.305966] pci 0000:00:06.0: [8086:7ecb] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.306061] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.306074] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff=
]
[    0.306217] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.306270] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.307107] pci 0000:00:07.0: [8086:7ec4] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.307133] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.307139] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff=
]
[    0.307154] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fff=
ffff 64bit pref]
[    0.307264] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.307301] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.308076] pci 0000:00:07.2: [8086:7ec6] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.308102] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.308107] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff=
]
[    0.308116] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fff=
ffff 64bit pref]
[    0.308231] pci 0000:00:07.2: PME# supported from D0 D3hot D3cold
[    0.308262] pci 0000:00:07.2: PTM enabled (root), 4ns granularity
[    0.309037] pci 0000:00:08.0: [8086:7e4c] type 00 class 0x088000 convent=
ional PCI endpoint
[    0.309054] pci 0000:00:08.0: BAR 0 [mem 0x5231327000-0x5231327fff 64bit=
]
[    0.309167] pci 0000:00:0a.0: [8086:7d0d] type 00 class 0x118000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.309175] pci 0000:00:0a.0: BAR 0 [mem 0x5231280000-0x52312bffff 64bit=
]
[    0.309191] pci 0000:00:0a.0: enabling Extended Tags
[    0.309264] pci 0000:00:0b.0: [8086:7d1d] type 00 class 0x120000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.309274] pci 0000:00:0b.0: BAR 0 [mem 0x5228000000-0x522fffffff 64bit=
]
[    0.309286] pci 0000:00:0b.0: BAR 4 [mem 0x5231326000-0x5231326fff 64bit=
]
[    0.309407] pci 0000:00:0d.0: [8086:7ec0] type 00 class 0x0c0330 convent=
ional PCI endpoint
[    0.309422] pci 0000:00:0d.0: BAR 0 [mem 0x5231300000-0x523130ffff 64bit=
]
[    0.309516] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.309949] pci 0000:00:0d.2: [8086:7ec2] type 00 class 0x0c0340 convent=
ional PCI endpoint
[    0.309964] pci 0000:00:0d.2: BAR 0 [mem 0x5231240000-0x523127ffff 64bit=
]
[    0.309974] pci 0000:00:0d.2: BAR 2 [mem 0x5231325000-0x5231325fff 64bit=
]
[    0.310105] pci 0000:00:0d.2: supports D1 D2
[    0.310107] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.310232] pci 0000:00:0d.3: [8086:7ec3] type 00 class 0x0c0340 convent=
ional PCI endpoint
[    0.310247] pci 0000:00:0d.3: BAR 0 [mem 0x5231200000-0x523123ffff 64bit=
]
[    0.310256] pci 0000:00:0d.3: BAR 2 [mem 0x5231324000-0x5231324fff 64bit=
]
[    0.310362] pci 0000:00:0d.3: supports D1 D2
[    0.310363] pci 0000:00:0d.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.310506] pci 0000:00:12.0: [8086:7e45] type 00 class 0x070000 convent=
ional PCI endpoint
[    0.310520] pci 0000:00:12.0: BAR 0 [mem 0x52312f0000-0x52312fffff 64bit=
]
[    0.310571] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.311278] pci 0000:00:14.0: [8086:7e7d] type 00 class 0x0c0330 convent=
ional PCI endpoint
[    0.311293] pci 0000:00:14.0: BAR 0 [mem 0x52312e0000-0x52312effff 64bit=
]
[    0.311353] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.311759] pci 0000:00:14.2: [8086:7e7f] type 00 class 0x050000 convent=
ional PCI endpoint
[    0.311776] pci 0000:00:14.2: BAR 0 [mem 0x5231318000-0x523131bfff 64bit=
]
[    0.311787] pci 0000:00:14.2: BAR 2 [mem 0x5231323000-0x5231323fff 64bit=
]
[    0.311891] pci 0000:00:14.3: [8086:7e40] type 00 class 0x028000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.311903] pci 0000:00:14.3: BAR 0 [mem 0x5231314000-0x5231317fff 64bit=
]
[    0.311974] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.312189] pci 0000:00:15.0: [8086:7e78] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.312240] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.312591] pci 0000:00:15.1: [8086:7e79] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.312646] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.313000] pci 0000:00:15.3: [8086:7e7b] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.313053] pci 0000:00:15.3: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.313371] pci 0000:00:16.0: [8086:7e70] type 00 class 0x078000 convent=
ional PCI endpoint
[    0.313389] pci 0000:00:16.0: BAR 0 [mem 0x523131f000-0x523131ffff 64bit=
]
[    0.313471] pci 0000:00:16.0: PME# supported from D3hot
[    0.314217] pci 0000:00:19.0: [8086:7e50] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.314269] pci 0000:00:19.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.314625] pci 0000:00:19.1: [8086:7e51] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.314676] pci 0000:00:19.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.314996] pci 0000:00:1c.0: [8086:7e38] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.315017] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.315021] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.315023] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff=
]
[    0.315031] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ff=
ffff 64bit pref]
[    0.315091] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.315120] pci 0000:00:1c.0: PTM enabled (root), 4ns granularity
[    0.315741] pci 0000:00:1f.0: [8086:7e02] type 00 class 0x060100 convent=
ional PCI endpoint
[    0.316132] pci 0000:00:1f.3: [8086:7e28] type 00 class 0x040100 convent=
ional PCI endpoint
[    0.316157] pci 0000:00:1f.3: BAR 0 [mem 0x5231310000-0x5231313fff 64bit=
]
[    0.316177] pci 0000:00:1f.3: BAR 4 [mem 0x5231000000-0x52311fffff 64bit=
]
[    0.316229] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.316305] pci 0000:00:1f.4: [8086:7e22] type 00 class 0x0c0500 convent=
ional PCI endpoint
[    0.316325] pci 0000:00:1f.4: BAR 0 [mem 0x523131c000-0x523131c0ff 64bit=
]
[    0.316350] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.316571] pci 0000:00:1f.5: [8086:7e23] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.316611] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.317113] pci 0000:01:00.0: [1c5c:1959] type 00 class 0x010802 PCIe En=
dpoint
[    0.317132] pci 0000:01:00.0: BAR 0 [mem 0x8d200000-0x8d203fff 64bit]
[    0.317425] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.317480] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.317525] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.317577] pci 0000:56:00.0: [10de:28a1] type 00 class 0x030000 PCIe Le=
gacy Endpoint
[    0.317590] pci 0000:56:00.0: BAR 0 [mem 0x8c000000-0x8cffffff]
[    0.317600] pci 0000:56:00.0: BAR 1 [mem 0x4000000000-0x41ffffffff 64bit=
 pref]
[    0.317611] pci 0000:56:00.0: BAR 3 [mem 0x4200000000-0x4201ffffff 64bit=
 pref]
[    0.317618] pci 0000:56:00.0: BAR 5 [io  0x3000-0x307f]
[    0.317625] pci 0000:56:00.0: ROM [mem 0x8d000000-0x8d07ffff pref]
[    0.317688] pci 0000:56:00.0: PME# supported from D0 D3hot
[    0.317770] pci 0000:56:00.0: 63.012 Gb/s available PCIe bandwidth, limi=
ted by 16.0 GT/s PCIe x4 link at 0000:00:1c.0 (capable of 126.024 Gb/s with=
 16.0 GT/s PCIe x8 link)
[    0.317964] pci 0000:56:00.1: [10de:22be] type 00 class 0x040300 PCIe En=
dpoint
[    0.317975] pci 0000:56:00.1: BAR 0 [mem 0x8d080000-0x8d083fff]
[    0.318115] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.322611] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.322751] ACPI: PCI: Interrupt link LNKB configured for IRQ 1
[    0.322889] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.323026] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.323163] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.323300] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.323436] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.323570] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.324525] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x1)
[    0.460581] Low-power S0 idle used by default for system suspend
[    0.470680] ACPI: EC: interrupt unblocked
[    0.470681] ACPI: EC: event unblocked
[    0.470702] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.470703] ACPI: EC: GPE=3D0x6e
[    0.470704] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC initialization comp=
lete
[    0.470706] ACPI: \_SB_.PC00.LPCB.EC0_: EC: Used to handle transactions =
and events
[    0.470798] iommu: Default domain type: Translated
[    0.470798] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.470798] pps_core: LinuxPPS API ver. 1 registered
[    0.470798] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.470798] PTP clock support registered
[    0.470798] EDAC MC: Ver: 3.0.0
[    0.470798] efivars: Registered efivars operations
[    0.470798] NetLabel: Initializing
[    0.470798] NetLabel:  domain hash size =3D 128
[    0.470798] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.470798] NetLabel:  unlabeled traffic allowed by default
[    0.470798] PCI: Using ACPI for IRQ routing
[    0.482740] PCI: pci_cache_line_size set to 64 bytes
[    0.482890] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't c=
laim; no compatible bridge window
[    0.483014] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.483016] e820: reserve RAM buffer [mem 0x4fe69018-0x4fffffff]
[    0.483017] e820: reserve RAM buffer [mem 0x5453a000-0x57ffffff]
[    0.483018] e820: reserve RAM buffer [mem 0x55b40000-0x57ffffff]
[    0.483019] e820: reserve RAM buffer [mem 0x57819000-0x57ffffff]
[    0.483020] e820: reserve RAM buffer [mem 0x66000000-0x67ffffff]
[    0.483051] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.483051] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.483051] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.483051] pci 0000:56:00.0: vgaarb: bridge control possible
[    0.483051] pci 0000:56:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dnone,locks=3Dnone
[    0.483051] vgaarb: loaded
[    0.483051] clocksource: Switched to clocksource tsc-early
[    0.483051] VFS: Disk quotas dquot_6.6.0
[    0.483051] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.483051] AppArmor: AppArmor Filesystem Enabled
[    0.483051] pnp: PnP ACPI init
[    0.483051] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.483051] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.483051] system 00:01: [io  0x1854-0x1857] has been reserved
[    0.483051] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.483051] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.483051] system 00:03: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    0.483051] system 00:03: [mem 0xc0000000-0xcfffffff] has been reserved
[    0.483051] system 00:03: [mem 0xfed20000-0xfed7ffff] could not be reser=
ved
[    0.483051] system 00:03: [mem 0xfc800000-0xfc81ffff] could not be reser=
ved
[    0.483051] system 00:03: [mem 0xfed45000-0xfed8ffff] could not be reser=
ved
[    0.483051] system 00:03: [mem 0xfee00000-0xfeefffff] could not be reser=
ved
[    0.483051] system 00:04: [io  0x2000-0x20fe] has been reserved
[    0.483138] system 00:05: [mem 0xfe02c008-0xfe02cfff] has been reserved
[    0.483140] system 00:05: [mem 0xfe02d000-0xfe02dfff] has been reserved
[    0.484222] pnp: PnP ACPI: found 6 devices
[    0.489829] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.489895] NET: Registered PF_INET protocol family
[    0.490133] IP idents hash table entries: 262144 (order: 9, 2097152 byte=
s, linear)
[    0.493280] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6=
, 262144 bytes, linear)
[    0.493324] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.493546] TCP established hash table entries: 262144 (order: 9, 209715=
2 bytes, linear)
[    0.493910] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    0.494019] TCP: Hash tables configured (established 262144 bind 65536)
[    0.494211] MPTCP token hash table entries: 32768 (order: 7, 786432 byte=
s, linear)
[    0.494317] UDP hash table entries: 16384 (order: 7, 524288 bytes, linea=
r)
[    0.494399] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, =
linear)
[    0.494480] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.494487] NET: Registered PF_XDP protocol family
[    0.494494] pci_bus 0000:00: max bus depth: 1 pci_try_num: 2
[    0.494505] pci 0000:00:02.0: VF BAR 0 [mem 0x4202000000-0x4208ffffff 64=
bit pref]: assigned
[    0.494511] pci 0000:00:07.0: bridge window [io  0x4000-0x4fff]: assigne=
d
[    0.494513] pci 0000:00:07.2: bridge window [io  0x5000-0x5fff]: assigne=
d
[    0.494515] pci 0000:00:15.0: BAR 0 [mem 0x4209000000-0x4209000fff 64bit=
]: assigned
[    0.494553] pci 0000:00:15.1: BAR 0 [mem 0x4209001000-0x4209001fff 64bit=
]: assigned
[    0.494570] pci 0000:00:15.3: BAR 0 [mem 0x4209002000-0x4209002fff 64bit=
]: assigned
[    0.494582] pci 0000:00:19.0: BAR 0 [mem 0x4209003000-0x4209003fff 64bit=
]: assigned
[    0.494598] pci 0000:00:19.1: BAR 0 [mem 0x4209004000-0x4209004fff 64bit=
]: assigned
[    0.494611] pci 0000:00:1f.5: BAR 0 [mem 0x8d100000-0x8d100fff]: assigne=
d
[    0.494621] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.494627] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff=
]
[    0.494634] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.494640] pci 0000:00:07.0:   bridge window [io  0x4000-0x4fff]
[    0.494643] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff=
]
[    0.494646] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fff=
ffff 64bit pref]
[    0.494651] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.494653] pci 0000:00:07.2:   bridge window [io  0x5000-0x5fff]
[    0.494657] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff=
]
[    0.494660] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fff=
ffff 64bit pref]
[    0.494665] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.494667] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.494670] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff=
]
[    0.494672] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ff=
ffff 64bit pref]
[    0.494677] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.494678] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.494680] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.494681] pci_bus 0000:00: resource 7 [mem 0x80000000-0xbfffffff windo=
w]
[    0.494682] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x3ffbfffffff =
window]
[    0.494683] pci_bus 0000:01: resource 1 [mem 0x8d200000-0x8d2fffff]
[    0.494685] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.494686] pci_bus 0000:02: resource 1 [mem 0x86000000-0x8bffffff]
[    0.494687] pci_bus 0000:02: resource 2 [mem 0x4a20000000-0x521fffffff 6=
4bit pref]
[    0.494688] pci_bus 0000:2c: resource 0 [io  0x5000-0x5fff]
[    0.494689] pci_bus 0000:2c: resource 1 [mem 0x80000000-0x85ffffff]
[    0.494690] pci_bus 0000:2c: resource 2 [mem 0x4220000000-0x4a1fffffff 6=
4bit pref]
[    0.494692] pci_bus 0000:56: resource 0 [io  0x3000-0x3fff]
[    0.494693] pci_bus 0000:56: resource 1 [mem 0x8c000000-0x8d0fffff]
[    0.494694] pci_bus 0000:56: resource 2 [mem 0x4000000000-0x4201ffffff 6=
4bit pref]
[    0.495259] pci 0000:56:00.1: extending delay after power-on from D3hot =
to 20 msec
[    0.495284] pci 0000:56:00.1: D0 power state depends on 0000:56:00.0
[    0.495290] PCI: CLS 64 bytes, default 64
[    0.495359] DMAR: No RMRR found
[    0.495360] DMAR: No ATSR found
[    0.495361] DMAR: IOMMU feature sc_support inconsistent
[    0.495363] DMAR: dmar0: Using Queued invalidation
[    0.495366] DMAR: dmar1: Using Queued invalidation
[    0.495395] Trying to unpack rootfs image as initramfs...
[    0.495725] pci 0000:00:02.0: Adding to iommu group 0
[    0.495758] pci 0000:00:00.0: Adding to iommu group 1
[    0.495768] pci 0000:00:04.0: Adding to iommu group 2
[    0.495778] pci 0000:00:05.0: Adding to iommu group 3
[    0.495811] pci 0000:00:06.0: Adding to iommu group 4
[    0.495829] pci 0000:00:07.0: Adding to iommu group 5
[    0.495841] pci 0000:00:07.2: Adding to iommu group 6
[    0.495850] pci 0000:00:08.0: Adding to iommu group 7
[    0.495859] pci 0000:00:0a.0: Adding to iommu group 8
[    0.495872] pci 0000:00:0b.0: Adding to iommu group 9
[    0.495892] pci 0000:00:0d.0: Adding to iommu group 10
[    0.495901] pci 0000:00:0d.2: Adding to iommu group 10
[    0.495911] pci 0000:00:0d.3: Adding to iommu group 10
[    0.495925] pci 0000:00:12.0: Adding to iommu group 11
[    0.495941] pci 0000:00:14.0: Adding to iommu group 12
[    0.495951] pci 0000:00:14.2: Adding to iommu group 12
[    0.495960] pci 0000:00:14.3: Adding to iommu group 13
[    0.495980] pci 0000:00:15.0: Adding to iommu group 14
[    0.495991] pci 0000:00:15.1: Adding to iommu group 14
[    0.496001] pci 0000:00:15.3: Adding to iommu group 14
[    0.496013] pci 0000:00:16.0: Adding to iommu group 15
[    0.496030] pci 0000:00:19.0: Adding to iommu group 16
[    0.496041] pci 0000:00:19.1: Adding to iommu group 16
[    0.496052] pci 0000:00:1c.0: Adding to iommu group 17
[    0.496076] pci 0000:00:1f.0: Adding to iommu group 18
[    0.496087] pci 0000:00:1f.3: Adding to iommu group 18
[    0.496098] pci 0000:00:1f.4: Adding to iommu group 18
[    0.496110] pci 0000:00:1f.5: Adding to iommu group 18
[    0.496144] pci 0000:01:00.0: Adding to iommu group 19
[    0.496162] pci 0000:56:00.0: Adding to iommu group 20
[    0.496175] pci 0000:56:00.1: Adding to iommu group 20
[    0.498980] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.498982] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.498983] software IO TLB: mapped [mem 0x00000000480b8000-0x000000004c=
0b8000] (64MB)
[    0.499013] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b2=
c8ec87c7, max_idle_ns: 440795278598 ns
[    0.499052] clocksource: Switched to clocksource tsc
[    0.499079] platform rtc_cmos: registered platform RTC device (no PNP de=
vice found)
[    0.502762] Initialise system trusted keyrings
[    0.502772] Key type blacklist registered
[    0.502813] workingset: timestamp_bits=3D36 max_order=3D23 bucket_order=
=3D0
[    0.502819] zbud: loaded
[    0.502908] fuse: init (API version 7.41)
[    0.503030] integrity: Platform Keyring initialized
[    0.503034] integrity: Machine keyring initialized
[    0.512172] Key type asymmetric registered
[    0.512173] Asymmetric key parser 'x509' registered
[    0.941912] Freeing initrd memory: 79872K
[    0.946526] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 246)
[    0.946569] io scheduler mq-deadline registered
[    0.947889] ledtrig-cpu: registered to indicate activity on CPUs
[    0.948446] pcieport 0000:00:06.0: PME: Signaling with IRQ 122
[    0.948757] pcieport 0000:00:07.0: PME: Signaling with IRQ 123
[    0.948769] pcieport 0000:00:07.0: pciehp: Slot #12 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAct=
Rep+
[    0.949002] pcieport 0000:00:07.2: PME: Signaling with IRQ 124
[    0.949013] pcieport 0000:00:07.2: pciehp: Slot #14 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAct=
Rep+
[    0.949198] pcieport 0000:00:1c.0: PME: Signaling with IRQ 125
[    0.949264] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.961051] ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-=
274000)
[    0.963370] thermal LNXTHERM:00: registered as thermal_zone0
[    0.963371] ACPI: thermal: Thermal Zone [TZ01] (62 C)
[    0.963540] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.964055] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    0.964254] hpet_acpi_add: no address or irqs in _CRS
[    0.964283] Linux agpgart interface v0.103
[    0.966114] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1D, rev-id 54)
[    1.081054] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq =
1
[    1.081058] i8042: PNP: PS/2 appears to have AUX port disabled, if this =
is incorrect please boot with i8042.nopnp
[    1.082394] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.082587] mousedev: PS/2 mouse device common for all mice
[    1.082598] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.083311] rtc_cmos rtc_cmos: registered as rtc0
[    1.083441] rtc_cmos rtc_cmos: setting system clock to 2024-12-19T13:17:=
23 UTC (1734614243)
[    1.083459] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nv=
ram
[    1.085289] intel_pstate: Intel P-state driver initializing
[    1.088064] intel_pstate: HWP enabled
[    1.088172] efifb: probing for efifb
[    1.088180] efifb: framebuffer at 0x70800000, using 20252k, total 20250k
[    1.088181] efifb: mode is 2880x1800x32, linelength=3D11520, pages=3D1
[    1.088182] efifb: scrolling: redraw
[    1.088182] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    1.088243] Console: switching to colour frame buffer device 180x56
[    1.089943] fb0: EFI VGA frame buffer device
[    1.090034] NET: Registered PF_INET6 protocol family
[    1.094229] Segment Routing with IPv6
[    1.094233] In-situ OAM (IOAM) with IPv6
[    1.094243] mip6: Mobile IPv6
[    1.094245] NET: Registered PF_PACKET protocol family
[    1.094275] mpls_gso: MPLS GSO support
[    1.096661] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.097589] microcode: Current revision: 0x00000020
[    1.097591] microcode: Updated early from: 0x0000001f
[    1.098676] IPI shorthand broadcast: enabled
[    1.099177] sched_clock: Marking stable (1092537277, 6105799)->(11525870=
32, -53943956)
[    1.099374] registered taskstats version 1
[    1.099431] Loading compiled-in X.509 certificates
[    1.112959] Loaded X.509 cert 'Build time autogenerated kernel key: b836=
7364ab86cd6d96862dfcfcdbc0b9ecc179c3'
[    1.113805] Demotion targets for Node 0: null
[    1.114010] Key type .fscrypt registered
[    1.114011] Key type fscrypt-provisioning registered
[    1.126693] Key type encrypted registered
[    1.126696] AppArmor: AppArmor sha256 policy hashing enabled
[    1.126971] integrity: Loading X.509 certificate: UEFI:db
[    1.126993] integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot D=
B 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    1.126995] integrity: Loading X.509 certificate: UEFI:db
[    1.127011] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b=
3244c935bce0d6628af39827421e32497d'
[    1.127012] integrity: Loading X.509 certificate: UEFI:db
[    1.127029] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows=
 UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    1.127030] integrity: Loading X.509 certificate: UEFI:db
[    1.127047] integrity: Loaded X.509 cert 'Microsoft Windows Production P=
CA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.127048] integrity: Loading X.509 certificate: UEFI:db
[    1.127065] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA =
2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.128445] ima: Allocated hash algorithm: sha256
[    1.147994] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input0
[    1.297166] ima: No architecture policies found
[    1.297186] evm: Initialising EVM extended attributes:
[    1.297188] evm: security.selinux
[    1.297189] evm: security.SMACK64 (disabled)
[    1.297190] evm: security.SMACK64EXEC (disabled)
[    1.297191] evm: security.SMACK64TRANSMUTE (disabled)
[    1.297192] evm: security.SMACK64MMAP (disabled)
[    1.297192] evm: security.apparmor
[    1.297193] evm: security.ima
[    1.297194] evm: security.capability
[    1.297195] evm: HMAC attrs: 0x1
[    1.300509] RAS: Correctable Errors collector initialized.
[    1.300794] clk: Disabling unused clocks
[    1.300797] PM: genpd: Disabling unused power domains
[    1.302420] Freeing unused decrypted memory: 2028K
[    1.303275] Freeing unused kernel image (initmem) memory: 4128K
[    1.303297] Write protecting the kernel read-only data: 24576k
[    1.304003] Freeing unused kernel image (rodata/data gap) memory: 1352K
[    1.313540] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.313552] Run /init as init process
[    1.313555]   with arguments:
[    1.313557]     /init
[    1.313557]     splash
[    1.313558]   with environment:
[    1.313559]     HOME=3D/
[    1.313560]     TERM=3Dlinux
[    1.313561]     BOOT_IMAGE=3D/boot/vmlinuz-6.12.5-ipu6
[    1.374217] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input1
[    1.374259] ACPI: button: Sleep Button [SLPB]
[    1.374331] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input2
[    1.374347] ACPI: button: Lid Switch [LID0]
[    1.374364] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input3
[    1.378476] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6436-9F42-4=
2C8-BADC-0E9424F20C9A has zero instances
[    1.378480] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6435-9F42-4=
2C8-BADC-0E9424F20C9A has zero instances
[    1.378481] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 7391A661-223A-4=
7DB-A77A-7BE84C60822D has zero instances
[    1.378482] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: DF4E63B6-3BBC-4=
858-9737-C74F82F821F3 has zero instances
[    1.385986] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    1.386033] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    1.391027] ACPI: bus type USB registered
[    1.391042] usbcore: registered new interface driver usbfs
[    1.391046] usbcore: registered new interface driver hub
[    1.391052] usbcore: registered new device driver usb
[    1.394444] ACPI: bus type thunderbolt registered
[    1.398201] ACPI: button: Power Button [PWRB]
[    1.398254] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input4
[    1.398366] ACPI: button: Power Button [PWRF]
[    1.402432] ACPI: bus type drm_connector registered
[    1.407938] ACPI: battery: Slot [BAT0] (battery present)
[    1.592214] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[    1.596389] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    1.596469] nvme nvme0: pci function 0000:01:00.0
[    1.598749] hid: raw HID events driver (C) Jiri Kosina
[    1.606120] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
[    1.606327] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    1.616294] nvme nvme0: 22/0/0 default/read/poll queues
[    1.621237]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.622122] intel-lpss 0000:00:15.1: enabling device (0004 -> 0006)
[    1.622547] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    1.622919] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.622924] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus =
number 1
[    1.624017] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x1=
20 quirks 0x0000000200009810
[    1.624284] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.624285] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus =
number 2
[    1.624286] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperS=
peed
[    1.624312] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.12
[    1.624313] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.624314] usb usb1: Product: xHCI Host Controller
[    1.624315] usb usb1: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.624315] usb usb1: SerialNumber: 0000:00:0d.0
[    1.624421] hub 1-0:1.0: USB hub found
[    1.624428] hub 1-0:1.0: 1 port detected
[    1.624671] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.12
[    1.624672] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.624673] usb usb2: Product: xHCI Host Controller
[    1.624674] usb usb2: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.624674] usb usb2: SerialNumber: 0000:00:0d.0
[    1.624754] hub 2-0:1.0: USB hub found
[    1.624762] hub 2-0:1.0: 4 ports detected
[    1.627038] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.627044] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 3
[    1.628150] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x1=
20 quirks 0x0000000200009810
[    1.628386] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.628389] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 4
[    1.628391] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperS=
peed
[    1.628413] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.12
[    1.628414] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.628415] usb usb3: Product: xHCI Host Controller
[    1.628416] usb usb3: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.628417] usb usb3: SerialNumber: 0000:00:14.0
[    1.628583] hub 3-0:1.0: USB hub found
[    1.629115] hub 3-0:1.0: 12 ports detected
[    1.629835] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.12
[    1.629838] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.629838] usb usb4: Product: xHCI Host Controller
[    1.629839] usb usb4: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.629840] usb usb4: SerialNumber: 0000:00:14.0
[    1.629892] hub 4-0:1.0: USB hub found
[    1.629898] hub 4-0:1.0: 2 ports detected
[    1.644443] intel-lpss 0000:00:15.3: enabling device (0004 -> 0006)
[    1.644663] idma64 idma64.2: Found Intel integrated DMA 64-bit
[    1.661875] intel-lpss 0000:00:19.0: enabling device (0004 -> 0006)
[    1.678145] intel-lpss 0000:00:19.1: enabling device (0004 -> 0006)
[    1.731857] i2c_hid_acpi i2c-ELAN2513:00: i2c_hid_get_input: IRQ trigger=
ed but there's no data
[    1.734781] input: ELAN07CE:00 04F3:32C8 Mouse as /devices/pci0000:00/00=
00:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input=
/input5
[    1.734854] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00=
/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/in=
put/input7
[    1.734911] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pc=
i0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8=
.0001/input/input8
[    1.734945] hid-generic 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.0=
0 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    1.736054] input: ELAN2513:00 04F3:422C Touchscreen as /devices/pci0000=
:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002=
/input/input9
[    1.736097] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
10
[    1.736111] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
11
[    1.736128] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inpu=
t/input12
[    1.736163] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/in=
put/input13
[    1.736180] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input=
/input14
[    1.736212] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
16
[    1.736227] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
17
[    1.736241] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
18
[    1.787443] hid-generic 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.0=
0 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    1.882125] usb 3-3: new full-speed USB device number 2 using xhci_hcd
[    1.956846] i915 0000:00:02.0: [drm] Found METEORLAKE (device ID 7d55) d=
isplay version 14.00 stepping C0
[    1.958036] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    1.958099] Console: switching to colour dummy device 80x25
[    1.958114] i915 0000:00:02.0: vgaarb: deactivate vga console
[    1.958125] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    1.978223] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
[    1.986516] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/=
mtl_dmc.bin (v2.23)
[    1.995837] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00=
/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/in=
put/input22
[    1.995870] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pc=
i0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8=
.0001/input/input23
[    1.995885] hid-multitouch 0018:04F3:32C8.0001: input,hidraw0: I2C HID v=
1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    2.019477] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/mtl_guc_70.b=
in version 70.29.2
[    2.023352] usb 3-3: New USB device found, idVendor=3D06cb, idProduct=3D=
016c, bcdDevice=3D 0.00
[    2.023355] usb 3-3: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D1
[    2.023356] usb 3-3: SerialNumber: 17f07122a011
[    2.033361] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    2.033365] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    2.033579] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    2.038094] i915 0000:00:02.0: [drm] GT1: can't init GSC proxy due to mi=
ssing mei component
[    2.038316] i915 0000:00:02.0: [drm] GT1: GuC firmware i915/mtl_guc_70.b=
in version 70.29.2
[    2.038318] i915 0000:00:02.0: [drm] GT1: HuC firmware i915/mtl_huc_gsc.=
bin version 8.5.4
[    2.060472] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for clear m=
edia
[    2.060840] i915 0000:00:02.0: [drm] GT1: GUC: submission enabled
[    2.060841] i915 0000:00:02.0: [drm] GT1: GUC: SLPC enabled
[    2.060913] i915 0000:00:02.0: [drm] GT1: GUC: RC enabled
[    2.063152] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected c=
ontent support initialized
[    2.070498] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 0
[    2.070925] ACPI: video: Video Device [PXSX] (multi-head: no  rom: yes  =
post: no)
[    2.070957] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:01/LNXVIDEO:00/input/input24
[    2.142117] usb 3-10: new full-speed USB device number 3 using xhci_hcd
[    2.163577] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  =
post: no)
[    2.163934] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:01/input/input25
[    2.169730] fbcon: i915drmfb (fb0) is primary device
[    2.174734] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
26
[    2.174790] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input27
[    2.174806] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input28
[    2.174823] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inpu=
t/input29
[    2.174861] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/in=
put/input30
[    2.174880] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input=
/input31
[    2.174917] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input33
[    2.174932] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input34
[    2.174948] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input35
[    2.201914] i915 0000:00:02.0: [drm] GT1: Loaded GSC firmware i915/mtl_g=
sc_1.bin (cv1.0, r102.0.10.1878, svn 1)
[    2.221753] hid-multitouch 0018:04F3:422C.0002: input,hidraw1: I2C HID v=
1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.221912] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for all wor=
kloads
[    2.221917] i915 0000:00:02.0: [drm] *ERROR* GT1: GSC proxy handler fail=
ed to init
[    2.222148] tpm tpm0: auth session is active
[    2.280293] usb 3-10: New USB device found, idVendor=3D8087, idProduct=
=3D0033, bcdDevice=3D 0.00
[    2.280297] usb 3-10: New USB device strings: Mfr=3D0, Product=3D0, Seri=
alNumber=3D0
[    2.462443] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: e=
num_devices_done OK, num_hid_devices=3D6
[    2.468616] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.474068] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.483923] hid-generic 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.489868] hid-generic 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.494813] hid-generic 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.496342] hid-generic 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.499085] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.499867] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.500437] hid-sensor-hub 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.501069] hid-sensor-hub 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.501666] hid-sensor-hub 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.501810] hid-sensor-hub 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    3.567577] Console: switching to colour frame buffer device 180x56
[    3.577120] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.698114] raid6: avx2x4   gen() 59639 MB/s
[    3.766108] raid6: avx2x2   gen() 62036 MB/s
[    3.834163] raid6: avx2x1   gen() 60606 MB/s
[    3.834163] raid6: using algorithm avx2x2 gen() 62036 MB/s
[    3.902108] raid6: .... xor() 43297 MB/s, rmw enabled
[    3.902109] raid6: using avx2x2 recovery algorithm
[    3.904419] xor: automatically using best checksumming function   avx   =
   =20
[    3.905900] async_tx: api initialized (async)
[    4.291262] i915 0000:00:02.0: [drm] Selective fetch area calculation fa=
iled in pipe A
[    4.762729] Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
[    4.814029] PM: Image not found (code -22)
[    4.886435] EXT4-fs (nvme0n1p4): orphan cleanup on readonly fs
[    4.886614] EXT4-fs (nvme0n1p4): mounted filesystem 7881f7bb-dbe6-4323-8=
87f-dd718adb7a8b ro with ordered data mode. Quota mode: none.
[    4.941588] Not activating Mandatory Access Control as /sbin/tomoyo-init=
 does not exist.
[    4.974595] systemd[1]: Inserted module 'autofs4'
[    5.343447] systemd[1]: systemd 257-2 running in system mode (+PAM +AUDI=
T +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +AC=
L +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBC=
RYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP=
2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBA=
RCHIVE)
[    5.343461] systemd[1]: Detected architecture x86-64.
[    5.353031] systemd[1]: Hostname set to <DuanesSpectre16>.
[    5.405818] systemd[1]: bpf-restrict-fs: Failed to load BPF object: No s=
uch process
[    5.486827] systemd[1]: Queued start job for default target graphical.ta=
rget.
[    5.521321] systemd[1]: Created slice system-getty.slice - Slice /system=
/getty.
[    5.521570] systemd[1]: Created slice system-modprobe.slice - Slice /sys=
tem/modprobe.
[    5.521775] systemd[1]: Created slice system-systemd\x2dfsck.slice - Sli=
ce /system/systemd-fsck.
[    5.522013] systemd[1]: Created slice system-xfs_scrub.slice - xfs_scrub=
 background service slice.
[    5.522161] systemd[1]: Created slice user.slice - User and Session Slic=
e.
[    5.522193] systemd[1]: Started systemd-ask-password-wall.path - Forward=
 Password Requests to Wall Directory Watch.
[    5.522300] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automou=
nt - Arbitrary Executable File Formats File System Automount Point.
[    5.522312] systemd[1]: Expecting device dev-disk-by\x2duuid-12DE8F49DE8=
F2457.device - /dev/disk/by-uuid/12DE8F49DE8F2457...
[    5.522316] systemd[1]: Expecting device dev-disk-by\x2duuid-96c2339a\x2=
dae0c\x2d4a9d\x2d9d62\x2dfbbce901defc.device - /dev/disk/by-uuid/96c2339a-a=
e0c-4a9d-9d62-fbbce901defc...
[    5.522320] systemd[1]: Expecting device dev-disk-by\x2duuid-9DB2\x2d2D8=
0.device - /dev/disk/by-uuid/9DB2-2D80...
[    5.522337] systemd[1]: Reached target nss-user-lookup.target - User and=
 Group Name Lookups.
[    5.522351] systemd[1]: Reached target slices.target - Slice Units.
[    5.525728] systemd[1]: Listening on rpcbind.socket - RPCbind Server Act=
ivation Socket.
[    5.529196] systemd[1]: Listening on systemd-coredump.socket - Process C=
ore Dump Socket.
[    5.529751] systemd[1]: Listening on systemd-creds.socket - Credential E=
ncryption/Decryption.
[    5.529808] systemd[1]: Listening on systemd-initctl.socket - initctl Co=
mpatibility Named Pipe.
[    5.529852] systemd[1]: Listening on systemd-journald-dev-log.socket - J=
ournal Socket (/dev/log).
[    5.529890] systemd[1]: Listening on systemd-journald.socket - Journal S=
ockets.
[    5.529918] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements =
was skipped because of an unmet condition check (ConditionSecurity=3Dmeasur=
ed-uki).
[    5.529927] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was=
 skipped because of an unmet condition check (ConditionSecurity=3Dmeasured-=
uki).
[    5.529959] systemd[1]: Listening on systemd-udevd-control.socket - udev=
 Control Socket.
[    5.529985] systemd[1]: Listening on systemd-udevd-kernel.socket - udev =
Kernel Socket.
[    5.530717] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File S=
ystem...
[    5.531165] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue =
File System...
[    5.532061] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory=
 /run/lock...
[    5.532783] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug F=
ile System...
[    5.533502] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace=
 File System...
[    5.533602] systemd[1]: auth-rpcgss-module.service - Kernel Module suppo=
rting RPCSEC_GSS was skipped because of an unmet condition check (Condition=
PathExists=3D/etc/krb5.keytab).
[    5.534263] systemd[1]: Starting keyboard-setup.service - Set the consol=
e keyboard layout...
[    5.535173] systemd[1]: Starting kmod-static-nodes.service - Create List=
 of Static Device Nodes...
[    5.535654] systemd[1]: Starting modprobe@configfs.service - Load Kernel=
 Module configfs...
[    5.536141] systemd[1]: Starting modprobe@drm.service - Load Kernel Modu=
le drm...
[    5.536609] systemd[1]: Starting modprobe@efi_pstore.service - Load Kern=
el Module efi_pstore...
[    5.537558] systemd[1]: Starting modprobe@fuse.service - Load Kernel Mod=
ule fuse...
[    5.537690] systemd[1]: systemd-fsck-root.service - File System Check on=
 Root Device was skipped because of an unmet condition check (ConditionPath=
Exists=3D!/run/initramfs/fsck-root).
[    5.537735] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hi=
bernate Storage Info was skipped because of an unmet condition check (Condi=
tionPathExists=3D/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-=
428f-9387-6d876050dc67).
[    5.540453] systemd[1]: Starting systemd-journald.service - Journal Serv=
ice...
[    5.541156] systemd[1]: Starting systemd-modules-load.service - Load Ker=
nel Modules...
[    5.541177] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID =
Measurement was skipped because of an unmet condition check (ConditionSecur=
ity=3Dmeasured-uki).
[    5.541502] pstore: Using crash dump compression: deflate
[    5.541949] systemd[1]: Starting systemd-remount-fs.service - Remount Ro=
ot and Kernel File Systems...
[    5.541992] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK=
 Setup was skipped because of an unmet condition check (ConditionSecurity=
=3Dmeasured-uki).
[    5.542797] systemd[1]: Starting systemd-udev-load-credentials.service -=
 Load udev Rules from Credentials...
[    5.543471] systemd[1]: Starting systemd-udev-trigger.service - Coldplug=
 All udev Devices...
[    5.544927] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File Sy=
stem.
[    5.544972] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue F=
ile System.
[    5.545005] systemd[1]: Mounted run-lock.mount - Legacy Locks Directory =
/run/lock.
[    5.545037] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug Fi=
le System.
[    5.545068] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace =
File System.
[    5.545182] systemd[1]: Finished kmod-static-nodes.service - Create List=
 of Static Device Nodes.
[    5.545301] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    5.545368] systemd[1]: Finished modprobe@configfs.service - Load Kernel=
 Module configfs.
[    5.545462] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    5.545524] systemd[1]: Finished modprobe@drm.service - Load Kernel Modu=
le drm.
[    5.545611] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    5.545674] systemd[1]: Finished modprobe@fuse.service - Load Kernel Mod=
ule fuse.
[    5.546189] systemd[1]: Mounting sys-fs-fuse-connections.mount - FUSE Co=
ntrol File System...
[    5.546844] systemd[1]: Mounting sys-kernel-config.mount - Kernel Config=
uration File System...
[    5.547373] systemd[1]: Starting systemd-tmpfiles-setup-dev-early.servic=
e - Create Static Device Nodes in /dev gracefully...
[    5.549711] systemd[1]: Finished systemd-udev-load-credentials.service -=
 Load udev Rules from Credentials.
[    5.550238] systemd[1]: Mounted sys-fs-fuse-connections.mount - FUSE Con=
trol File System.
[    5.550281] systemd[1]: Mounted sys-kernel-config.mount - Kernel Configu=
ration File System.
[    5.551027] pstore: Registered efi_pstore as persistent store backend
[    5.551542] systemd[1]: modprobe@efi_pstore.service: Deactivated success=
fully.
[    5.551627] systemd[1]: Finished modprobe@efi_pstore.service - Load Kern=
el Module efi_pstore.
[    5.552847] systemd-journald[547]: Collecting audit messages is disabled=
.
[    5.555747] lp: driver loaded but no devices found
[    5.559015] ppdev: user-space parallel port driver
[    5.561550] systemd[1]: Finished systemd-tmpfiles-setup-dev-early.servic=
e - Create Static Device Nodes in /dev gracefully.
[    5.567141] systemd[1]: Finished keyboard-setup.service - Set the consol=
e keyboard layout.
[    5.579275] EXT4-fs (nvme0n1p4): re-mounted 7881f7bb-dbe6-4323-887f-dd71=
8adb7a8b r/w. Quota mode: none.
[    5.580053] systemd[1]: Finished systemd-remount-fs.service - Remount Ro=
ot and Kernel File Systems.
[    5.580278] systemd[1]: systemd-hwdb-update.service - Rebuild Hardware D=
atabase was skipped because of an unmet condition check (ConditionNeedsUpda=
te=3D/etc).
[    5.580304] systemd[1]: systemd-pstore.service - Platform Persistent Sto=
rage Archival was skipped because of an unmet condition check (ConditionDir=
ectoryNotEmpty=3D/sys/fs/pstore).
[    5.581021] systemd[1]: Starting systemd-random-seed.service - Load/Save=
 OS Random Seed...
[    5.581065] systemd[1]: systemd-sysusers.service - Create System Users w=
as skipped because no trigger condition checks were met.
[    5.581778] systemd[1]: Starting systemd-tmpfiles-setup-dev.service - Cr=
eate Static Device Nodes in /dev...
[    5.581810] systemd[1]: systemd-tpm2-setup.service - TPM SRK Setup was s=
kipped because of an unmet condition check (ConditionSecurity=3Dmeasured-uk=
i).
[    5.581975] systemd[1]: Started systemd-journald.service - Journal Servi=
ce.
[    5.597680] systemd-journald[547]: Received client request to flush runt=
ime journal.
[    5.638605] nvidia: loading out-of-tree module taints kernel.
[    5.638613] nvidia: module license 'NVIDIA' taints kernel.
[    5.638614] Disabling lock debugging due to kernel taint
[    5.638616] nvidia: module verification failed: signature and/or require=
d key missing - tainting kernel
[    5.638617] nvidia: module license taints kernel.
[    5.656891] ACPI: AC: AC Adapter [ADP1] (on-line)
[    5.657899] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sen=
sor may not work
[    5.658025] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin numbe=
r mismatch _DSM 11 resource 107
[    5.661600] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[    5.661789] Consider using thermal netlink events interface
[    5.661814] input: Intel HID events as /devices/platform/INTC1077:00/inp=
ut/input37
[    5.662556] intel-hid INTC1077:00: failed to enable HID power button
[    5.662670] int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mism=
atch _DSM 49 resource 209
[    5.663650] mc: Linux media interface: v0.10
[    5.671970] input: Intel HID events as /devices/platform/INT33D5:00/inpu=
t/input38
[    5.672350] intel-hid INT33D5:00: platform supports 5 button array
[    5.673222] input: Intel HID 5 button array as /devices/platform/INT33D5=
:00/input/input39
[    5.723796] Adding 66559996k swap on /dev/nvme0n1p7.  Priority:-2 extent=
s:1 across:66559996k SS
[    5.731498] pci 0000:00:08.0: Setting to D3hot
[    5.734949] resource: resource sanity check: requesting [mem 0x00000000f=
edc0000-0x00000000fedcffff], which spans more than pnp 00:03 [mem 0xfedc000=
0-0xfedc7fff]
[    5.734957] caller igen6_probe+0x15e/0x7c0 [igen6_edac] mapping multiple=
 BARs
[    5.735035] EDAC MC0: Giving out device to module igen6_edac controller =
Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[    5.735125] EDAC MC1: Giving out device to module igen6_edac controller =
Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[    5.735154] EDAC igen6 MC1: HANDLING IBECC MEMORY ERROR
[    5.735155] EDAC igen6 MC1: ADDR 0x7fffffffe0=20
[    5.735157] EDAC igen6 MC0: HANDLING IBECC MEMORY ERROR
[    5.735158] EDAC igen6 MC0: ADDR 0x7fffffffe0=20
[    5.735211] EDAC igen6: v2.5.1
[    5.742118] pci 0000:00:05.0: Setting to D3hot
[    5.746721] Serial bus multi instantiate pseudo device driver CSC3551:00=
: Instantiated 2 I2C devices.
[    5.754120] pci 0000:00:0b.0: Setting to D3hot
[    5.766127] pci 0000:00:14.2: enabling device (0000 -> 0002)
[    5.766584] intel_pmc_core INT33A1:00: Assuming a default substate order=
 for this platform
[    5.766636] intel_pmc_core INT33A1:00:  initialized
[    5.801038] input: PC Speaker as /devices/platform/pcspkr/input/input40
[    5.801923] nvidia-nvlink: Nvlink Core is being initialized, major devic=
e number 236

[    5.804413] videodev: Linux video capture interface: v2.00
[    5.805427] iTCO_vendor_support: vendor-support=3D0
[    5.805836] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.L=
PCB.HEC.DPTF.FCHG], AE_NOT_FOUND (20240827/psargs-332)
[    5.805844] ACPI Error: Aborting method \_SB.IETM.CHRG.PPSS due to previ=
ous error (AE_NOT_FOUND) (20240827/psparse-529)
[    5.807583] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=3D6=
, TCOBASE=3D0x0400)
[    5.807670] iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=
=3D0)
[    5.809991] input: HP WMI hotkeys as /devices/virtual/input/input41
[    5.813277] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 655360=
 ms ovfl timer
[    5.813280] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    5.813281] RAPL PMU: hw unit of domain package 2^-14 Joules
[    5.813282] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    5.813823] ov08x40 i2c-OVTI08F4:00: can't get clock frequency
[    5.813825] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -22
[    5.813952] ov08x40 i2c-OVTI08F4:00: probe with driver ov08x40 failed wi=
th error -22
[    5.817441] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[    5.817529] intel-ipu6 0000:00:05.0: IPU6 in secure mode touch 0x8000000=
0 mask 0x0
[    5.826439] intel-ipu6 0000:00:05.0: FW version: 20230925
[    5.827981] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
[    5.828013] intel-ipu6 0000:00:05.0: Connected 1 cameras
[    5.829706] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
[    5.833830] Bluetooth: Core ver 2.22
[    5.833844] NET: Registered PF_BLUETOOTH protocol family
[    5.833845] Bluetooth: HCI device and connection manager initialized
[    5.833847] Bluetooth: HCI socket layer initialized
[    5.833849] Bluetooth: L2CAP socket layer initialized
[    5.833851] Bluetooth: SCO socket layer initialized
[    5.855074] cryptd: max_cpu_qlen set to 1000
[    5.855187] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    5.855296] Loaded X.509 cert 'benh@debian.org: 577e021cb980e0e820821ba7=
b54b4961b8b4fadf'
[    5.855383] Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6ec146e09d1=
b6016ab9d6cf71dd233f0328'
[    5.855468] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.855550] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db1=
8c600'
[    5.858907] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 0002=
)
[    5.859065] intel_rapl_common: Found RAPL domain package
[    5.859126] AES CTR mode by8 optimization enabled
[    5.861568] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Adding DSD propert=
ies for 103C8C17
[    5.861856] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Using extra _DSD p=
roperties, bypassing _DSD in ACPI
[    5.863417] usbcore: registered new interface driver btusb
[    5.864982] Bluetooth: hci0: Device revision is 0
[    5.864986] Bluetooth: hci0: Secure boot is enabled
[    5.864987] Bluetooth: hci0: OTP lock is enabled
[    5.864988] Bluetooth: hci0: API lock is enabled
[    5.864988] Bluetooth: hci0: Debug lock is disabled
[    5.864989] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    5.864991] Bluetooth: hci0: Bootloader timestamp 2022.18 buildtype 1 bu=
ild 49266
[    5.865107] Bluetooth: hci0: DSM reset method type: 0x00
[    5.866529] Bluetooth: hci0: Found device firmware: intel/ibt-0180-0041.=
sfi
[    5.866549] Bluetooth: hci0: Boot Address: 0x100800
[    5.866550] Bluetooth: hci0: Firmware Version: 171-18.24
[    5.870121] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[    5.874324] intel_rapl_msr: PL4 support detected.
[    5.874344] Intel(R) Wireless WiFi driver for Linux
[    5.874362] intel_rapl_common: Found RAPL domain package
[    5.874364] intel_rapl_common: Found RAPL domain core
[    5.874365] intel_rapl_common: Found RAPL domain uncore
[    5.874393] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    5.876288] iwlwifi 0000:00:14.3: Detected crf-id 0x400410, cnv-id 0x108=
0800 wfpm id 0x80005b20
[    5.876299] iwlwifi 0000:00:14.3: PCI dev 7e40/0094, rev=3D0x441, rfid=
=3D0x2010d000
[    5.876301] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6E AX211 160MH=
z
[    5.876843] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ p=
latform, using SOF driver
[    5.876893] snd_hda_intel 0000:56:00.1: enabling device (0000 -> 0002)
[    5.877008] snd_hda_intel 0000:56:00.1: Disabling MSI
[    5.877012] snd_hda_intel 0000:56:00.1: Handle vga_switcheroo audio clie=
nt
[    5.878451] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.0=
.3.94
[    5.878729] iwlwifi 0000:00:14.3: firmware: failed to load iwl-debug-yoy=
o.bin (-2)
[    5.878734] iwlwifi 0000:00:14.3: firmware: failed to load iwl-debug-yoy=
o.bin (-2)
[    5.878736] iwlwifi 0000:00:14.3: loaded firmware version 89.202a2f7b.0 =
ma-b0-gf-a0-89.ucode op_mode iwlmvm
[    5.897579] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cirrus Logic CS35L=
41 (35a40), Revision: B2
[    5.897696] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Adding DSD propert=
ies for 103C8C17
[    5.897831] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Using extra _DSD p=
roperties, bypassing _DSD in ACPI
[    5.897833] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Reset line busy, a=
ssuming shared reset
[    5.899580] nvidia 0000:56:00.0: enabling device (0002 -> 0003)
[    5.899976] nvidia 0000:56:00.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dnone
[    5.916817] intel-ipu6 0000:00:05.0: CSE authenticate_run done
[    5.916827] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
[    5.932812] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cirrus Logic CS35L=
41 (35a40), Revision: B2
[    5.961595] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  535.216.03  =
Fri Oct 25 22:43:06 UTC 2024
[    5.982696] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input42
[    5.982732] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input43
[    5.982764] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input44
[    5.982800] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input45
[    6.003721] typec port0: bound usb3-port1 (ops connector_ops [usbcore])
[    6.003744] typec port0: bound usb2-port1 (ops connector_ops [usbcore])
[    6.004765] sof-audio-pci-intel-mtl 0000:00:1f.3: enabling device (0000 =
-> 0002)
[    6.004864] sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI =
class/subclass/prog-if 0x040100
[    6.004906] sof-audio-pci-intel-mtl 0000:00:1f.3: bound 0000:00:02.0 (op=
s i915_audio_component_bind_ops [i915])
[    6.008039] [658] intel-ipu6 0000:00:05.0: remote endpoint port 0 with 4=
 lanes added
[    6.011367] sof-audio-pci-intel-mtl 0000:00:1f.3: use msi interrupt mode
[    6.016634] nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver fo=
r UNIX platforms  535.216.03  Fri Oct 25 22:41:13 UTC 2024
[    6.031392] sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask=
 5
[    6.031396] sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driv=
er skl_hda_dsp_generic now
[    6.031398] sof-audio-pci-intel-mtl 0000:00:1f.3: NHLT device BT(0) dete=
cted, ssp_mask 0x4
[    6.031399] sof-audio-pci-intel-mtl 0000:00:1f.3: BT link detected in NH=
LT tables: 0x4
[    6.031560] sof-audio-pci-intel-mtl 0000:00:1f.3: DMICs detected in NHLT=
 tables: 2
[    6.034167] sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files f=
or ipc type 1:
[    6.034169] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     in=
tel/sof-ipc4/mtl/sof-mtl.ri
[    6.034170] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: in=
tel/sof-ipc4-lib/mtl
[    6.034171] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     in=
tel/sof-ace-tplg/sof-hda-generic-2ch.tplg
[    6.034802] sof-audio-pci-intel-mtl 0000:00:1f.3: Loaded firmware librar=
y: ADSPFW, version: 2.11.1.1
[    6.046066] [drm] [nvidia-drm] [GPU ID 0x00005600] Loading driver
[    6.046069] [drm] Initialized nvidia-drm 0.0.0 for 0000:56:00.0 on minor=
 1
[    6.048927] ------------[ cut here ]------------
[    6.048929] WARNING: CPU: 2 PID: 457 at drivers/gpu/drm/drm_file.c:312 d=
rm_open_helper+0x132/0x150 [drm]
[    6.048967] Modules linked in: nvidia_drm(POE) intel_uncore_frequency(+)=
 intel_uncore_frequency_common x86_pkg_temp_thermal snd_hda_codec_realtek s=
nd_hda_codec_generic snd_hda_scodec_component snd_soc_dmic nvidia_modeset(P=
OE) snd_sof_pci_intel_mtl snd_sof_intel_hda_generic soundwire_intel soundwi=
re_generic_allocation soundwire_cadence snd_sof_intel_hda_common snd_soc_hd=
ac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda intel_ipu6_isys snd_sof_pc=
i snd_sof_xtensa_dsp videobuf2_dma_sg videobuf2_memops intel_powerclamp snd=
_sof videobuf2_v4l2 snd_sof_utils snd_hda_scodec_cs35l41_spi coretemp snd_h=
da_ext_core regmap_spi iwlmvm(+) videobuf2_common snd_soc_acpi_intel_match =
kvm_intel snd_soc_acpi mac80211 snd_soc_core snd_hda_codec_hdmi snd_compres=
s libarc4 kvm snd_pcm_dmaengine soundwire_bus snd_hda_intel snd_intel_dspcf=
g crct10dif_pclmul snd_intel_sdw_acpi intel_rapl_msr ghash_clmulni_intel sn=
d_hda_codec iwlwifi sha512_ssse3 sha256_ssse3 btusb sha1_ssse3 snd_hda_scod=
ec_cs35l41_i2c snd_hda_core btrtl snd_hda_scodec_cs35l41
[    6.048988]  aesni_intel processor_thermal_device_pci btintel processor_=
thermal_device snd_hda_cs_dsp_ctls gf128mul processor_thermal_wt_hint btbcm=
 ucsi_acpi snd_hwdep snd_soc_cs_amp_lib crypto_simd processor_thermal_rfim =
btmtk snd_pcm cs_dsp typec_ucsi cryptd hid_sensor_magn_3d hid_sensor_gyro_3=
d hid_sensor_accel_3d hid_sensor_rotation processor_thermal_rapl cfg80211 b=
luetooth snd_timer ov08x40 snd_soc_cs35l41_lib hid_sensor_trigger intel_rap=
l_common typec hid_sensor_iio_common mei_me rapl processor_thermal_wt_req v=
4l2_fwnode snd iTCO_wdt industrialio_triggered_buffer hp_wmi processor_ther=
mal_power_floor kfifo_buf intel_pmc_bxt intel_cstate v4l2_async processor_t=
hermal_mbox int3403_thermal intel_ipu6 iTCO_vendor_support platform_profile=
 intel_uncore wmi_bmof pcspkr industrialio watchdog mei soundcore rfkill ro=
les igen6_edac ipu_bridge videodev serial_multi_instantiate intel_pmc_core =
int340x_thermal_zone intel_skl_int3472_tps68470 mc intel_vsec int3400_therm=
al pmt_telemetry intel_hid intel_skl_int3472_discrete
[    6.049012]  soc_button_array acpi_tad joydev acpi_thermal_rel pmt_class=
 intel_skl_int3472_common sparse_keymap acpi_pad ac evdev serio_raw nvidia(=
POE) msr parport_pc ppdev lp parport efi_pstore configfs nfnetlink ip_table=
s x_tables autofs4 ext4 crc16 mbcache jbd2 btrfs blake2b_generic efivarfs r=
aid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xo=
r raid6_pq libcrc32c crc32c_generic raid1 raid0 md_mod hid_sensor_custom hi=
d_sensor_hub intel_ishtp_hid i915 hid_multitouch drm_buddy i2c_algo_bit drm=
_display_helper cec hid_generic rc_core i2c_hid_acpi ttm xhci_pci i2c_hid x=
hci_hcd drm_kms_helper hid nvme intel_lpss_pci drm mxm_wmi thunderbolt usbc=
ore intel_ish_ipc crc32_pclmul i2c_i801 intel_lpss nvme_core crc32c_intel i=
2c_smbus video intel_ishtp battery idma64 usb_common fan wmi pinctrl_meteor=
lake button
[    6.049041] CPU: 2 UID: 0 PID: 457 Comm: plymouthd Tainted: P           =
OE      6.12.5-ipu6 #7=20
[    6.049044] Tainted: [P]=3DPROPRIETARY_MODULE, [O]=3DOOT_MODULE, [E]=3DU=
NSIGNED_MODULE
[    6.049045] Hardware name: HP HP Spectre x360 2-in-1 Laptop 16t-aa000/8C=
17, BIOS F.11 08/14/2024
[    6.049046] RIP: 0010:drm_open_helper+0x132/0x150 [drm]
[    6.049071] Code: 83 c9 ee 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 =
5f c3 cc cc cc cc 48 89 df 89 44 24 04 e8 64 fa ff ff 8b 44 24 04 eb db <0f=
> 0b b8 ea ff ff ff eb d2 b8 ea ff ff ff eb cb b8 f0 ff ff ff eb
[    6.049072] RSP: 0018:ffffa12041e1fb10 EFLAGS: 00010246
[    6.049074] RAX: ffffffffc60cb220 RBX: ffff90adcc6dae68 RCX: 00000000000=
00000
[    6.049075] RDX: ffff90add4ba8000 RSI: ffff90adcc6dae68 RDI: ffff90adcdb=
efc80
[    6.049075] RBP: ffff90adcdbefc80 R08: ffff90add5e3be10 R09: ffff90adc02=
53dd0
[    6.049076] R10: 00000000000000e2 R11: 0000000000000002 R12: ffff90b083f=
db800
[    6.049077] R13: ffffffffc60cb220 R14: 00000000ffffffed R15: ffff90adc63=
8d2d0
[    6.049078] FS:  00007efc19913000(0000) GS:ffff90b51fb00000(0000) knlGS:=
0000000000000000
[    6.049079] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.049080] CR2: 00007ffc5e287400 CR3: 0000000114b5e001 CR4: 0000000000f=
72ef0
[    6.049081] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[    6.049082] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 00000000000=
00400
[    6.049083] PKRU: 55555554
[    6.049083] Call Trace:
[    6.049086]  <TASK>
[    6.049086]  ? drm_open_helper+0x132/0x150 [drm]
[    6.049111]  ? __warn.cold+0x93/0xf6
[    6.049114]  ? drm_open_helper+0x132/0x150 [drm]
[    6.049139]  ? report_bug+0xff/0x140
[    6.049140]  ? handle_bug+0x58/0x90
[    6.049142]  ? exc_invalid_op+0x17/0x70
[    6.049143]  ? asm_exc_invalid_op+0x1a/0x20
[    6.049147]  ? drm_open_helper+0x132/0x150 [drm]
[    6.049171]  drm_open+0x73/0x110 [drm]
[    6.049195]  drm_stub_open+0x9b/0xd0 [drm]
[    6.049219]  chrdev_open+0xb2/0x230
[    6.049222]  ? __pfx_chrdev_open+0x10/0x10
[    6.049223]  do_dentry_open+0x14c/0x440
[    6.049225]  vfs_open+0x2e/0xe0
[    6.049227]  path_openat+0x82e/0x12d0
[    6.049230]  do_filp_open+0xc4/0x170
[    6.049232]  do_sys_openat2+0xae/0xe0
[    6.049234]  __x64_sys_openat+0x55/0xa0
[    6.049236]  do_syscall_64+0x82/0x190
[    6.049239]  ? __x64_sys_getrandom+0x84/0xe0
[    6.049242]  ? syscall_exit_to_user_mode+0x4d/0x210
[    6.049243]  ? do_syscall_64+0x8e/0x190
[    6.049245]  ? intel_thermal_interrupt+0x175/0x330
[    6.049248]  ? __irq_exit_rcu+0x37/0xb0
[    6.049251]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    6.049253] RIP: 0033:0x7efc19bb8bb8
[    6.049255] Code: 48 89 44 24 20 75 96 44 89 54 24 0c e8 a1 b6 f8 ff 44 =
8b 54 24 0c 89 da 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 30 44 89 c7 89 44 24 0c e8 f4 b6 f8 ff 8b 44
[    6.049256] RSP: 002b:00007fff19371660 EFLAGS: 00000293 ORIG_RAX: 000000=
0000000101
[    6.049257] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007efc19b=
b8bb8
[    6.049258] RDX: 0000000000000002 RSI: 000055cc943694c0 RDI: 00000000fff=
fff9c
[    6.049259] RBP: 000055cc943694c0 R08: 0000000000000000 R09: 00000000000=
00007
[    6.049259] R10: 0000000000000000 R11: 0000000000000293 R12: 00007efc199=
12f88
[    6.049260] R13: 00007efc19cd4840 R14: 000000000000000b R15: 000055cc943=
65cc0
[    6.049262]  </TASK>
[    6.049262] ---[ end trace 0000000000000000 ]---
[    6.156802] sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware versio=
n: 2.11.1.1
[    6.161479] sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 K=
ernel ABI 3:23:1
[    6.161671] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card n=
ot yet available, widget card binding deferred
[    6.180671] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.wmfw (-2)
[    6.180753] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.wmfw (-2)
[    6.180827] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-l0.wmfw (-2)
[    6.180902] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-l0.wmfw (-2)
[    6.181082] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[    6.181094] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[    6.181730] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bincfg (-2)
[    6.181805] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bincfg (-2)
[    6.181807] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    6.181809] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight=
 Time
[    6.206402] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for RT uCode
[    6.206431] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    6.206446] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    6.206453] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    6.206460] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    6.206757] iwlwifi 0000:00:14.3: loaded PNVM version 35148b80
[    6.207256] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[    6.222521] iwlwifi 0000:00:14.3: Detected RF GF, rfid=3D0x2010d000
[    6.288140] iwlwifi 0000:00:14.3: base HW address: d0:65:78:ec:0a:e5
[    6.332133] iwlwifi 0000:00:14.3 wlo1: renamed from wlan0
[    6.635486] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 40=
0a4 vendor: 0x2 v0.60.0, 2 algorithms
[    6.636581] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17-spkid0-l0.bin: v0.60.0
[    6.636585] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: C:=
\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_toolin=
g_4KHz-6dBhighshelf\HP_
[    6.643339] audit: type=3D1400 audit(1734614249.056:2): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-s=
enddoc" pid=3D996 comm=3D"apparmor_parser"
[    6.643435] audit: type=3D1400 audit(1734614249.056:3): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be" pid=3D990 comm=3D"apparmor_parser"
[    6.643441] audit: type=3D1400 audit(1734614249.056:4): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be//kmod" pid=3D990 comm=3D"apparmor_parser"
[    6.643456] audit: type=3D1400 audit(1734614249.056:5): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-x=
pdfimport" pid=3D998 comm=3D"apparmor_parser"
[    6.643882] audit: type=3D1400 audit(1734614249.056:6): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-o=
osplash" pid=3D995 comm=3D"apparmor_parser"
[    6.643985] audit: type=3D1400 audit(1734614249.056:7): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/man"=
 pid=3D994 comm=3D"apparmor_parser"
[    6.643986] audit: type=3D1400 audit(1734614249.056:8): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_filter" p=
id=3D994 comm=3D"apparmor_parser"
[    6.643990] audit: type=3D1400 audit(1734614249.056:9): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_groff" pi=
d=3D994 comm=3D"apparmor_parser"
[    6.644020] audit: type=3D1400 audit(1734614249.056:10): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"lsb_release"=
 pid=3D987 comm=3D"apparmor_parser"
[    6.644048] audit: type=3D1400 audit(1734614249.056:11): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/libexec=
/ibus-engine-hangul" pid=3D1000 comm=3D"apparmor_parser"
[    6.695345] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Calibration applie=
d: R0=3D10501
[    6.709255] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded - =
Type: spk-prot, Gain: 17
[    6.709322] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SS=
ID: 103C8C17, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 0
[    6.709326] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35=
l41-hda.0 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    6.709451] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.wmfw (-2)
[    6.709527] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.wmfw (-2)
[    6.709618] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-r0.wmfw (-2)
[    6.709697] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-r0.wmfw (-2)
[    6.709704] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[    6.709708] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[    6.710010] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bincfg (-2)
[    6.710016] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bincfg (-2)
[    6.710018] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    6.710020] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight=
 Time
[    6.767155] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    6.767159] Bluetooth: BNEP filters: protocol multicast
[    6.767163] Bluetooth: BNEP socket layer initialized
[    6.792982] block nvme0n1: No UUID available providing old NGUID
[    6.824915] NET: Registered PF_QIPCRTR protocol family
[    7.163697] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 40=
0a4 vendor: 0x2 v0.60.0, 2 algorithms
[    7.164803] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17-spkid0-r0.bin: v0.60.0
[    7.164806] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: C:=
\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_toolin=
g_4KHz-6dBhighshelf\HP_
[    7.205620] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for RT uCode
[    7.205656] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    7.205674] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    7.205680] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    7.205686] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    7.206456] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[    7.223646] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration applie=
d: R0=3D10902
[    7.237292] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded - =
Type: spk-prot, Gain: 17
[    7.237444] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SS=
ID: 103C8C17, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 0
[    7.237450] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35=
l41-hda.1 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    7.237767] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC245: li=
ne_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    7.237771] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    7.237773] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[    7.237774] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=3D0x0
[    7.237775] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[    7.237777] snd_hda_codec_realtek ehdaudio0D0:      Mic=3D0x19
[    7.277915] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_=
controls: no PCM in topology for HDMI converter 3
[    7.291699] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, wit=
h index: 0
[    7.294384] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/s=
kl_hda_dsp_generic/sound/card1/input46
[    7.294427] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:=
1f.3/skl_hda_dsp_generic/sound/card1/input47
[    7.294456] input: sof-hda-dsp HDMI/DP,pcm=3D3 as /devices/pci0000:00/00=
00:00:1f.3/skl_hda_dsp_generic/sound/card1/input48
[    7.294480] input: sof-hda-dsp HDMI/DP,pcm=3D4 as /devices/pci0000:00/00=
00:00:1f.3/skl_hda_dsp_generic/sound/card1/input49
[    7.294504] input: sof-hda-dsp HDMI/DP,pcm=3D5 as /devices/pci0000:00/00=
00:00:1f.3/skl_hda_dsp_generic/sound/card1/input50
[    7.317916] hid-sensor-hub 001F:8087:0AC2.0005: hid_field_extract() call=
ed with n (192) > 32! (kworker/11:0)
[    7.337161] Bluetooth: hci0: Waiting for firmware download to complete
[    7.337945] Bluetooth: hci0: Firmware loaded in 1436926 usecs
[    7.337992] Bluetooth: hci0: Waiting for device to boot
[    7.379950] Bluetooth: hci0: Device booted in 40995 usecs
[    7.382568] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0180-=
0041.ddc
[    7.384079] Bluetooth: hci0: Applying Intel DDC parameters completed
[    7.386986] Bluetooth: hci0: Firmware timestamp 2024.18 buildtype 1 buil=
d 3243
[    7.386990] Bluetooth: hci0: Firmware SHA1: 0xa8bb3f39
[    7.390955] Bluetooth: hci0: Fseq status: Success (0x00)
[    7.390960] Bluetooth: hci0: Fseq executed: 00.00.03.94
[    7.390962] Bluetooth: hci0: Fseq BT Top: 00.00.03.94
[    7.483255] Bluetooth: MGMT ver 1.23
[    7.488177] NET: Registered PF_ALG protocol family
[    7.505122] Bluetooth: RFCOMM TTY layer initialized
[    7.505132] Bluetooth: RFCOMM socket layer initialized
[    7.505137] Bluetooth: RFCOMM ver 1.11
[    7.520891] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for RT uCode
[    7.520971] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    7.520987] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    7.520993] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    7.521000] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    7.521714] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[    7.624340] RPC: Registered named UNIX socket transport module.
[    7.624343] RPC: Registered udp transport module.
[    7.624343] RPC: Registered tcp transport module.
[    7.624344] RPC: Registered tcp-with-tls transport module.
[    7.624344] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   11.601946] netfs: FS-Cache loaded
[   11.602728] Key type dns_resolver registered
[   11.639501] Key type cifs.spnego registered
[   11.639506] Key type cifs.idmap registered
[   11.645788] CIFS: VFS: Use of the less secure dialect vers=3D1.0 is not =
recommended unless required for access to very old servers
[   11.645802] CIFS: Attempting to mount //192.168.1.248/NetFolder
[   11.645832] CIFS: VFS: Error connecting to socket. Aborting operation.
[   11.645835] CIFS: VFS: cifs_mount failed w/return code =3D -101
[   11.706465] NFS: Registering the id_resolver key type
[   11.706476] Key type id_resolver registered
[   11.706477] Key type id_legacy registered
[   19.505553] nvidia_uvm: module uses symbols nvUvmInterfaceDisableAccessC=
ntr from proprietary module nvidia, inheriting taint.
[   19.524094] nvidia-uvm: Loaded the UVM driver, major device number 510.
[   20.847658] show_signal: 20 callbacks suppressed
[   20.847662] traps: light-locker[2156] trap int3 ip:7f38fbba0f37 sp:7ffc0=
e34ea90 error:0 in libglib-2.0.so.0.8200.4[64f37,7f38fbb5a000+a0000]
[   20.982408] warning: `kdeconnectd' uses wireless extensions which will s=
top working for Wi-Fi 7 hardware; use nl80211
[   21.150466] audit: type=3D1400 audit(1734614263.564:32): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/devices/system/node/" pid=3D2326 comm=3D"mysqld" requested_mask=3D"r"=
 denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[   21.181083] audit: type=3D1400 audit(1734614263.592:33): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/devices/system/node/" pid=3D2328 comm=3D"mysqld" requested_mask=3D"r"=
 denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[   21.197103] audit: type=3D1400 audit(1734614263.608:34): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/usr/share/mariadb/charsets/Index.xml" pid=3D2328 comm=3D"mysqld" requeste=
d_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[   21.204844] audit: type=3D1400 audit(1734614263.616:35): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/block/" pid=3D2328 comm=3D"mysqld" requested_mask=3D"r" denied_mask=
=3D"r" fsuid=3D1000 ouid=3D0
[   21.220039] audit: type=3D1400 audit(1734614263.632:36): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/proc/2328/cgroup" pid=3D2328 comm=3D"mysqld" requested_mask=3D"r" denied_=
mask=3D"r" fsuid=3D1000 ouid=3D1000
[   21.220678] audit: type=3D1400 audit(1734614263.632:37): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/nvme/nvme0/nvme0n1/queue=
/physical_block_size" pid=3D2328 comm=3D"mysqld" requested_mask=3D"r" denie=
d_mask=3D"r" fsuid=3D1000 ouid=3D0
[   21.487635] audit: type=3D1400 audit(1734614263.900:38): apparmor=3D"DEN=
IED" operation=3D"exec" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/usr/bin/mariadb" pid=3D2350 comm=3D"sh" requested_mask=3D"x" denied_mask=
=3D"x" fsuid=3D1000 ouid=3D0
[   22.210229] wlo1: authenticate with f8:85:f9:0d:a2:e1 (local address=3Dd=
0:65:78:ec:0a:e5)
[   22.210788] wlo1: send auth to f8:85:f9:0d:a2:e1 (try 1/3)
[   22.242151] wlo1: authenticated
[   22.250322] wlo1: associate with f8:85:f9:0d:a2:e1 (try 1/3)
[   22.259550] wlo1: RX AssocResp from f8:85:f9:0d:a2:e1 (capab=3D0x1511 st=
atus=3D0 aid=3D1)
[   22.262559] wlo1: associated
[   22.326676] wlo1: Limiting TX power to 30 (30 - 0) dBm as advertised by =
f8:85:f9:0d:a2:e1
[   26.342525] input: MX Anywhere 3S Mouse as /devices/virtual/misc/uhid/00=
05:046D:B037.0009/input/input51
[   26.342708] hid-generic 0005:046D:B037.0009: input,hidraw8: BLUETOOTH HI=
D v0.03 Mouse [MX Anywhere 3S] on d0:65:78:ec:0a:e9
[  270.491157] [3208] intel_ipu6_isys.isys intel_ipu6.isys.40: bind ov08x40=
 4-0036 nlanes is 4 port is 0
[  312.920055] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Inte=
l IPU6 ISYS Capture 0: configured size 18717248, buffer size 18717248
[  312.920061] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buffer=
 0 for Intel IPU6 ISYS Capture 0
[  312.920063] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: iova: iova 0=
x00000000fe612000
[  312.920064] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: media pipeli=
ne is not ready for Intel IPU6 ISYS Capture 0
[  312.920065] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: stream: Inte=
l IPU6 ISYS Capture 0: width 3856, height 2416, css pixelformat 24
[  312.920072] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: validating l=
ink "Intel IPU6 CSI2 0":1 -> "Intel IPU6 ISYS Capture 0"
[  312.932767] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 2=
0 scale 2, did: value 20 scale 2
[  312.933315] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: prepare stre=
am: external entity ov08x40 4-0036
[  312.933319] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: queue 1 of 1
[  312.933328] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: =
req_id 0x2, index 2, offset 0x0, value 0x1
[  312.933446] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy respon=
se: id 2, error 0, details 0
[  312.933448] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 1=
023 scale 2, did: value 299 scale 2
[  312.933449] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: =
req_id 0x1, index 1, offset 0x0, value 0x42
[  312.933564] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy respon=
se: id 1, error 0, details 0
[  312.933565] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: mem_open_thr=
eshold: 12
[  312.933566] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: =
req_id 0x3, index 3, offset 0x0, value 0xc
[  312.933681] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy respon=
se: id 3, error 0, details 0
[  312.933683] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: threshold: 8=
9 critical: 108
[  312.933684] [3240] intelp: Slot #14 AttnBtn- PwrCtrl- MRL- AttnInd- PwrI=
nd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.949198] pcieport 0000:00:1c.0: PME: Signaling with IRQ 125
[    0.949264] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.961051] ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-=
274000)
[    0.963370] thermal LNXTHERM:00: registered as thermal_zone0
[    0.963371] ACPI: thermal: Thermal Zone [TZ01] (62 C)
[    0.963540] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.964055] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    0.964254] hpet_acpi_add: no address or irqs in _CRS
[    0.964283] Linux agpgart interface v0.103
[    0.966114] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1D, rev-id 54)
[    1.081054] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq =
1
[    1.081058] i8042: PNP: PS/2 appears to have AUX port disabled, if this =
is incorrect please boot with i8042.nopnp
[    1.082394] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.082587] mousedev: PS/2 mouse device common for all mice
[    1.082598] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.083311] rtc_cmos rtc_cmos: registered as rtc0
[    1.083441] rtc_cmos rtc_cmos: setting system clock to 2024-12-19T13:17:=
23 UTC (1734614243)
[    1.083459] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nv=
ram
[    1.085289] intel_pstate: Intel P-state driver initializing
[    1.088064] intel_pstate: HWP enabled
[    1.088172] efifb: probing for efifb
[    1.088180] efifb: framebuffer at 0x70800000, using 20252k, total 20250k
[    1.088181] efifb: mode is 2880x1800x32, linelength=3D11520, pages=3D1
[    1.088182] efifb: scrolling: redraw
[    1.088182] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    1.088243] Console: switching to colour frame buffer device 180x56
[    1.089943] fb0: EFI VGA frame buffer device
[    1.090034] NET: Registered PF_INET6 protocol family
[    1.094229] Segment Routing with IPv6
[    1.094233] In-situ OAM (IOAM) with IPv6
[    1.094243] mip6: Mobile IPv6
[    1.094245] NET: Registered PF_PACKET protocol family
[    1.094275] mpls_gso: MPLS GSO support
[    1.096661] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.097589] microcode: Current revision: 0x00000020
[    1.097591] microcode: Updated early from: 0x0000001f
[    1.098676] IPI shorthand broadcast: enabled
[    1.099177] sched_clock: Marking stable (1092537277, 6105799)->(11525870=
32, -53943956)
[    1.099374] registered taskstats version 1
[    1.099431] Loading compiled-in X.509 certificates
[    1.112959] Loaded X.509 cert 'Build time autogenerated kernel key: b836=
7364ab86cd6d96862dfcfcdbc0b9ecc179c3'
[    1.113805] Demotion targets for Node 0: null
[    1.114010] Key type .fscrypt registered
[    1.114011] Key type fscrypt-provisioning registered
[    1.126693] Key type encrypted registered
[    1.126696] AppArmor: AppArmor sha256 policy hashing enabled
[    1.126971] integrity: Loading X.509 certificate: UEFI:db
[    1.126993] integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot D=
B 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    1.126995] integrity: Loading X.509 certificate: UEFI:db
[    1.127011] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b=
3244c935bce0d6628af39827421e32497d'
[    1.127012] integrity: Loading X.509 certificate: UEFI:db
[    1.127029] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows=
 UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    1.127030] integrity: Loading X.509 certificate: UEFI:db
[    1.127047] integrity: Loaded X.509 cert 'Microsoft Windows Production P=
CA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.127048] integrity: Loading X.509 certificate: UEFI:db
[    1.127065] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA =
2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.128445] ima: Allocated hash algorithm: sha256
[    1.147994] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input0
[    1.297166] ima: No architecture policies found
[    1.297186] evm: Initialising EVM extended attributes:
[    1.297188] evm: security.selinux
[    1.297189] evm: security.SMACK64 (disabled)
[    1.297190] evm: security.SMACK64EXEC (disabled)
[    1.297191] evm: security.SMACK64TRANSMUTE (disabled)
[    1.297192] evm: security.SMACK64MMAP (disabled)
[    1.297192] evm: security.apparmor
[    1.297193] evm: security.ima
[    1.297194] evm: security.capability
[    1.297195] evm: HMAC attrs: 0x1
[    1.300509] RAS: Correctable Errors collector initialized.
[    1.300794] clk: Disabling unused clocks
[    1.300797] PM: genpd: Disabling unused power domains
[    1.302420] Freeing unused decrypted memory: 2028K
[    1.303275] Freeing unused kernel image (initmem) memory: 4128K
[    1.303297] Write protecting the kernel read-only data: 24576k
[    1.304003] Freeing unused kernel image (rodata/data gap) memory: 1352K
[    1.313540] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.313552] Run /init as init process
[    1.313555]   with arguments:
[    1.313557]     /init
[    1.313557]     splash
[    1.313558]   with environment:
[    1.313559]     HOME=3D/
[    1.313560]     TERM=3Dlinux
[    1.313561]     BOOT_IMAGE=3D/boot/vmlinuz-6.12.5-ipu6
[    1.374217] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input1
[    1.374259] ACPI: button: Sleep Button [SLPB]
[    1.374331] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input2
[    1.374347] ACPI: button: Lid Switch [LID0]
[    1.374364] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input3
[    1.378476] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6436-9F42-4=
2C8-BADC-0E9424F20C9A has zero instances
[    1.378480] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6435-9F42-4=
2C8-BADC-0E9424F20C9A has zero instances
[    1.378481] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 7391A661-223A-4=
7DB-A77A-7BE84C60822D has zero instances
[    1.378482] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: DF4E63B6-3BBC-4=
858-9737-C74F82F821F3 has zero instances
[    1.385986] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    1.386033] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    1.391027] ACPI: bus type USB registered
[    1.391042] usbcore: registered new interface driver usbfs
[    1.391046] usbcore: registered new interface driver hub
[    1.391052] usbcore: registered new device driver usb
[    1.394444] ACPI: bus type thunderbolt registered
[    1.398201] ACPI: button: Power Button [PWRB]
[    1.398254] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input4
[    1.398366] ACPI: button: Power Button [PWRF]
[    1.402432] ACPI: bus type drm_connector registered
[    1.407938] ACPI: battery: Slot [BAT0] (battery present)
[    1.592214] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[    1.596389] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    1.596469] nvme nvme0: pci function 0000:01:00.0
[    1.598749] hid: raw HID events driver (C) Jiri Kosina
[    1.606120] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
[    1.606327] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    1.616294] nvme nvme0: 22/0/0 default/read/poll queues
[    1.621237]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.622122] intel-lpss 0000:00:15.1: enabling device (0004 -> 0006)
[    1.622547] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    1.622919] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.622924] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus =
number 1
[    1.624017] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x1=
20 quirks 0x0000000200009810
[    1.624284] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.624285] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus =
number 2
[    1.624286] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperS=
peed
[    1.624312] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.12
[    1.624313] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.624314] usb usb1: Product: xHCI Host Controller
[    1.624315] usb usb1: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.624315] usb usb1: SerialNumber: 0000:00:0d.0
[    1.624421] hub 1-0:1.0: USB hub found
[    1.624428] hub 1-0:1.0: 1 port detected
[    1.624671] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.12
[    1.624672] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.624673] usb usb2: Product: xHCI Host Controller
[    1.624674] usb usb2: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.624674] usb usb2: SerialNumber: 0000:00:0d.0
[    1.624754] hub 2-0:1.0: USB hub found
[    1.624762] hub 2-0:1.0: 4 ports detected
[    1.627038] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.627044] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 3
[    1.628150] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x1=
20 quirks 0x0000000200009810
[    1.628386] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.628389] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 4
[    1.628391] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperS=
peed
[    1.628413] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.12
[    1.628414] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.628415] usb usb3: Product: xHCI Host Controller
[    1.628416] usb usb3: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.628417] usb usb3: SerialNumber: 0000:00:14.0
[    1.628583] hub 3-0:1.0: USB hub found
[    1.629115] hub 3-0:1.0: 12 ports detected
[    1.629835] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.12
[    1.629838] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.629838] usb usb4: Product: xHCI Host Controller
[    1.629839] usb usb4: Manufacturer: Linux 6.12.5-ipu6 xhci-hcd
[    1.629840] usb usb4: SerialNumber: 0000:00:14.0
[    1.629892] hub 4-0:1.0: USB hub found
[    1.629898] hub 4-0:1.0: 2 ports detected
[    1.644443] intel-lpss 0000:00:15.3: enabling device (0004 -> 0006)
[    1.644663] idma64 idma64.2: Found Intel integrated DMA 64-bit
[    1.661875] intel-lpss 0000:00:19.0: enabling device (0004 -> 0006)
[    1.678145] intel-lpss 0000:00:19.1: enabling device (0004 -> 0006)
[    1.731857] i2c_hid_acpi i2c-ELAN2513:00: i2c_hid_get_input: IRQ trigger=
ed but there's no data
[    1.734781] input: ELAN07CE:00 04F3:32C8 Mouse as /devices/pci0000:00/00=
00:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input=
/input5
[    1.734854] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00=
/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/in=
put/input7
[    1.734911] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pc=
i0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8=
.0001/input/input8
[    1.734945] hid-generic 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.0=
0 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    1.736054] input: ELAN2513:00 04F3:422C Touchscreen as /devices/pci0000=
:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002=
/input/input9
[    1.736097] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
10
[    1.736111] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
11
[    1.736128] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inpu=
t/input12
[    1.736163] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/in=
put/input13
[    1.736180] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input=
/input14
[    1.736212] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
16
[    1.736227] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
17
[    1.736241] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
18
[    1.787443] hid-generic 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.0=
0 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    1.882125] usb 3-3: new full-speed USB device number 2 using xhci_hcd
[    1.956846] i915 0000:00:02.0: [drm] Found METEORLAKE (device ID 7d55) d=
isplay version 14.00 stepping C0
[    1.958036] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    1.958099] Console: switching to colour dummy device 80x25
[    1.958114] i915 0000:00:02.0: vgaarb: deactivate vga console
[    1.958125] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    1.978223] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
[    1.986516] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/=
mtl_dmc.bin (v2.23)
[    1.995837] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00=
/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/in=
put/input22
[    1.995870] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pc=
i0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8=
.0001/input/input23
[    1.995885] hid-multitouch 0018:04F3:32C8.0001: input,hidraw0: I2C HID v=
1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    2.019477] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/mtl_guc_70.b=
in version 70.29.2
[    2.023352] usb 3-3: New USB device found, idVendor=3D06cb, idProduct=3D=
016c, bcdDevice=3D 0.00
[    2.023355] usb 3-3: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D1
[    2.023356] usb 3-3: SerialNumber: 17f07122a011
[    2.033361] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    2.033365] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    2.033579] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    2.038094] i915 0000:00:02.0: [drm] GT1: can't init GSC proxy due to mi=
ssing mei component
[    2.038316] i915 0000:00:02.0: [drm] GT1: GuC firmware i915/mtl_guc_70.b=
in version 70.29.2
[    2.038318] i915 0000:00:02.0: [drm] GT1: HuC firmware i915/mtl_huc_gsc.=
bin version 8.5.4
[    2.060472] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for clear m=
edia
[    2.060840] i915 0000:00:02.0: [drm] GT1: GUC: submission enabled
[    2.060841] i915 0000:00:02.0: [drm] GT1: GUC: SLPC enabled
[    2.060913] i915 0000:00:02.0: [drm] GT1: GUC: RC enabled
[    2.063152] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected c=
ontent support initialized
[    2.070498] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 0
[    2.070925] ACPI: video: Video Device [PXSX] (multi-head: no  rom: yes  =
post: no)
[    2.070957] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:01/LNXVIDEO:00/input/input24
[    2.142117] usb 3-10: new full-speed USB device number 3 using xhci_hcd
[    2.163577] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  =
post: no)
[    2.163934] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:01/input/input25
[    2.169730] fbcon: i915drmfb (fb0) is primary device
[    2.174734] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:=
15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input=
26
[    2.174790] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input27
[    2.174806] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input28
[    2.174823] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inpu=
t/input29
[    2.174861] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/in=
put/input30
[    2.174880] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input=
/input31
[    2.174917] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input33
[    2.174932] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input34
[    2.174948] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/=
0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/inp=
ut/input35
[    2.201914] i915 0000:00:02.0: [drm] GT1: Loaded GSC firmware i915/mtl_g=
sc_1.bin (cv1.0, r102.0.10.1878, svn 1)
[    2.221753] hid-multitouch 0018:04F3:422C.0002: input,hidraw1: I2C HID v=
1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.221912] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for all wor=
kloads
[    2.221917] i915 0000:00:02.0: [drm] *ERROR* GT1: GSC proxy handler fail=
ed to init
[    2.222148] tpm tpm0: auth session is active
[    2.280293] usb 3-10: New USB device found, idVendor=3D8087, idProduct=
=3D0033, bcdDevice=3D 0.00
[    2.280297] usb 3-10: New USB device strings: Mfr=3D0, Product=3D0, Seri=
alNumber=3D0
[    2.462443] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: e=
num_devices_done OK, num_hid_devices=3D6
[    2.468616] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.474068] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.483923] hid-generic 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.489868] hid-generic 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.494813] hid-generic 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.496342] hid-generic 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.=
00 Device [hid-ishtp 8087:0AC2] on=20
[    2.499085] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.499867] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.500437] hid-sensor-hub 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.501069] hid-sensor-hub 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.501666] hid-sensor-hub 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    2.501810] hid-sensor-hub 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID =
v2.00 Device [hid-ishtp 8087:0AC2] on=20
[    3.567577] Console: switching to colour frame buffer device 180x56
[    3.577120] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.698114] raid6: avx2x4   gen() 59639 MB/s
[    3.766108] raid6: avx2x2   gen() 62036 MB/s
[    3.834163] raid6: avx2x1   gen() 60606 MB/s
[    3.834163] raid6: using algorithm avx2x2 gen() 62036 MB/s
[    3.902108] raid6: .... xor() 43297 MB/s, rmw enabled
[    3.902109] raid6: using avx2x2 recovery algorithm
[    3.904419] xor: automatically using best checksumming function   avx   =
   =20
[    3.905900] async_tx: api initialized (async)
[    4.291262] i915 0000:00:02.0: [drm] Selective fetch area calculation fa=
iled in pipe A
[    4.762729] Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
[    4.814029] PM: Image not found (code -22)
[    4.886435] EXT4-fs (nvme0n1p4): orphan cleanup on readonly fs
[    4.886614] EXT4-fs (nvme0n1p4): mounted filesystem 7881f7bb-dbe6-4323-8=
87f-dd718adb7a8b ro with ordered data mode. Quota mode: none.
[    4.941588] Not activating Mandatory Access Control as /sbin/tomoyo-init=
 does not exist.
[    4.974595] systemd[1]: Inserted module 'autofs4'
[    5.343447] systemd[1]: systemd 257-2 running in system mode (+PAM +AUDI=
T +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +AC=
L +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBC=
RYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP=
2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBA=
RCHIVE)
[    5.343461] systemd[1]: Detected architecture x86-64.
[    5.353031] systemd[1]: Hostname set to <DuanesSpectre16>.
[    5.405818] systemd[1]: bpf-restrict-fs: Failed to load BPF object: No s=
uch process
[    5.486827] systemd[1]: Queued start job for default target graphical.ta=
rget.
[    5.521321] systemd[1]: Created slice system-getty.slice - Slice /system=
/getty.
[    5.521570] systemd[1]: Created slice system-modprobe.slice - Slice /sys=
tem/modprobe.
[    5.521775] systemd[1]: Created slice system-systemd\x2dfsck.slice - Sli=
ce /system/systemd-fsck.
[    5.522013] systemd[1]: Created slice system-xfs_scrub.slice - xfs_scrub=
 background service slice.
[    5.522161] systemd[1]: Created slice user.slice - User and Session Slic=
e.
[    5.522193] systemd[1]: Started systemd-ask-password-wall.path - Forward=
 Password Requests to Wall Directory Watch.
[    5.522300] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automou=
nt - Arbitrary Executable File Formats File System Automount Point.
[    5.522312] systemd[1]: Expecting device dev-disk-by\x2duuid-12DE8F49DE8=
F2457.device - /dev/disk/by-uuid/12DE8F49DE8F2457...
[    5.522316] systemd[1]: Expecting device dev-disk-by\x2duuid-96c2339a\x2=
dae0c\x2d4a9d\x2d9d62\x2dfbbce901defc.device - /dev/disk/by-uuid/96c2339a-a=
e0c-4a9d-9d62-fbbce901defc...
[    5.522320] systemd[1]: Expecting device dev-disk-by\x2duuid-9DB2\x2d2D8=
0.device - /dev/disk/by-uuid/9DB2-2D80...
[    5.522337] systemd[1]: Reached target nss-user-lookup.target - User and=
 Group Name Lookups.
[    5.522351] systemd[1]: Reached target slices.target - Slice Units.
[    5.525728] systemd[1]: Listening on rpcbind.socket - RPCbind Server Act=
ivation Socket.
[    5.529196] systemd[1]: Listening on systemd-coredump.socket - Process C=
ore Dump Socket.
[    5.529751] systemd[1]: Listening on systemd-creds.socket - Credential E=
ncryption/Decryption.
[    5.529808] systemd[1]: Listening on systemd-initctl.socket - initctl Co=
mpatibility Named Pipe.
[    5.529852] systemd[1]: Listening on systemd-journald-dev-log.socket - J=
ournal Socket (/dev/log).
[    5.529890] systemd[1]: Listening on systemd-journald.socket - Journal S=
ockets.
[    5.529918] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements =
was skipped because of an unmet condition check (ConditionSecurity=3Dmeasur=
ed-uki).
[    5.529927] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was=
 skipped because of an unmet condition check (ConditionSecurity=3Dmeasured-=
uki).
[    5.529959] systemd[1]: Listening on systemd-udevd-control.socket - udev=
 Control Socket.
[    5.529985] systemd[1]: Listening on systemd-udevd-kernel.socket - udev =
Kernel Socket.
[    5.530717] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File S=
ystem...
[    5.531165] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue =
File System...
[    5.532061] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory=
 /run/lock...
[    5.532783] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug F=
ile System...
[    5.533502] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace=
 File System...
[    5.533602] systemd[1]: auth-rpcgss-module.service - Kernel Module suppo=
rting RPCSEC_GSS was skipped because of an unmet condition check (Condition=
PathExists=3D/etc/krb5.keytab).
[    5.534263] systemd[1]: Starting keyboard-setup.service - Set the consol=
e keyboard layout...
[    5.535173] systemd[1]: Starting kmod-static-nodes.service - Create List=
 of Static Device Nodes...
[    5.535654] systemd[1]: Starting modprobe@configfs.service - Load Kernel=
 Module configfs...
[    5.536141] systemd[1]: Starting modprobe@drm.service - Load Kernel Modu=
le drm...
[    5.536609] systemd[1]: Starting modprobe@efi_pstore.service - Load Kern=
el Module efi_pstore...
[    5.537558] systemd[1]: Starting modprobe@fuse.service - Load Kernel Mod=
ule fuse...
[    5.537690] systemd[1]: systemd-fsck-root.service - File System Check on=
 Root Device was skipped because of an unmet condition check (ConditionPath=
Exists=3D!/run/initramfs/fsck-root).
[    5.537735] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hi=
bernate Storage Info was skipped because of an unmet condition check (Condi=
tionPathExists=3D/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-=
428f-9387-6d876050dc67).
[    5.540453] systemd[1]: Starting systemd-journald.service - Journal Serv=
ice...
[    5.541156] systemd[1]: Starting systemd-modules-load.service - Load Ker=
nel Modules...
[    5.541177] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID =
Measurement was skipped because of an unmet condition check (ConditionSecur=
ity=3Dmeasured-uki).
[    5.541502] pstore: Using crash dump compression: deflate
[    5.541949] systemd[1]: Starting systemd-remount-fs.service - Remount Ro=
ot and Kernel File Systems...
[    5.541992] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK=
 Setup was skipped because of an unmet condition check (ConditionSecurity=
=3Dmeasured-uki).
[    5.542797] systemd[1]: Starting systemd-udev-load-credentials.service -=
 Load udev Rules from Credentials...
[    5.543471] systemd[1]: Starting systemd-udev-trigger.service - Coldplug=
 All udev Devices...
[    5.544927] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File Sy=
stem.
[    5.544972] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue F=
ile System.
[    5.545005] systemd[1]: Mounted run-lock.mount - Legacy Locks Directory =
/run/lock.
[    5.545037] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug Fi=
le System.
[    5.545068] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace =
File System.
[    5.545182] systemd[1]: Finished kmod-static-nodes.service - Create List=
 of Static Device Nodes.
[    5.545301] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    5.545368] systemd[1]: Finished modprobe@configfs.service - Load Kernel=
 Module configfs.
[    5.545462] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    5.545524] systemd[1]: Finished modprobe@drm.service - Load Kernel Modu=
le drm.
[    5.545611] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    5.545674] systemd[1]: Finished modprobe@fuse.service - Load Kernel Mod=
ule fuse.
[    5.546189] systemd[1]: Mounting sys-fs-fuse-connections.mount - FUSE Co=
ntrol File System...
[    5.546844] systemd[1]: Mounting sys-kernel-config.mount - Kernel Config=
uration File System...
[    5.547373] systemd[1]: Starting systemd-tmpfiles-setup-dev-early.servic=
e - Create Static Device Nodes in /dev gracefully...
[    5.549711] systemd[1]: Finished systemd-udev-load-credentials.service -=
 Load udev Rules from Credentials.
[    5.550238] systemd[1]: Mounted sys-fs-fuse-connections.mount - FUSE Con=
trol File System.
[    5.550281] systemd[1]: Mounted sys-kernel-config.mount - Kernel Configu=
ration File System.
[    5.551027] pstore: Registered efi_pstore as persistent store backend
[    5.551542] systemd[1]: modprobe@efi_pstore.service: Deactivated success=
fully.
[    5.551627] systemd[1]: Finished modprobe@efi_pstore.service - Load Kern=
el Module efi_pstore.
[    5.552847] systemd-journald[547]: Collecting audit messages is disabled=
.
[    5.555747] lp: driver loaded but no devices found
[    5.559015] ppdev: user-space parallel port driver
[    5.561550] systemd[1]: Finished systemd-tmpfiles-setup-dev-early.servic=
e - Create Static Device Nodes in /dev gracefully.
[    5.567141] systemd[1]: Finished keyboard-setup.service - Set the consol=
e keyboard layout.
[    5.579275] EXT4-fs (nvme0n1p4): re-mounted 7881f7bb-dbe6-4323-887f-dd71=
8adb7a8b r/w. Quota mode: none.
[    5.580053] systemd[1]: Finished systemd-remount-fs.service - Remount Ro=
ot and Kernel File Systems.
[    5.580278] systemd[1]: systemd-hwdb-update.service - Rebuild Hardware D=
atabase was skipped because of an unmet condition check (ConditionNeedsUpda=
te=3D/etc).
[    5.580304] systemd[1]: systemd-pstore.service - Platform Persistent Sto=
rage Archival was skipped because of an unmet condition check (ConditionDir=
ectoryNotEmpty=3D/sys/fs/pstore).
[    5.581021] systemd[1]: Starting systemd-random-seed.service - Load/Save=
 OS Random Seed...
[    5.581065] systemd[1]: systemd-sysusers.service - Create System Users w=
as skipped because no trigger condition checks were met.
[    5.581778] systemd[1]: Starting systemd-tmpfiles-setup-dev.service - Cr=
eate Static Device Nodes in /dev...
[    5.581810] systemd[1]: systemd-tpm2-setup.service - TPM SRK Setup was s=
kipped because of an unmet condition check (ConditionSecurity=3Dmeasured-uk=
i).
[    5.581975] systemd[1]: Started systemd-journald.service - Journal Servi=
ce.
[    5.597680] systemd-journald[547]: Received client request to flush runt=
ime journal.
[    5.638605] nvidia: loading out-of-tree module taints kernel.
[    5.638613] nvidia: module license 'NVIDIA' taints kernel.
[    5.638614] Disabling lock debugging due to kernel taint
[    5.638616] nvidia: module verification failed: signature and/or require=
d key missing - tainting kernel
[    5.638617] nvidia: module license taints kernel.
[    5.656891] ACPI: AC: AC Adapter [ADP1] (on-line)
[    5.657899] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sen=
sor may not work
[    5.658025] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin numbe=
r mismatch _DSM 11 resource 107
[    5.661600] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[    5.661789] Consider using thermal netlink events interface
[    5.661814] input: Intel HID events as /devices/platform/INTC1077:00/inp=
ut/input37
[    5.662556] intel-hid INTC1077:00: failed to enable HID power button
[    5.662670] int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mism=
atch _DSM 49 resource 209
[    5.663650] mc: Linux media interface: v0.10
[    5.671970] input: Intel HID events as /devices/platform/INT33D5:00/inpu=
t/input38
[    5.672350] intel-hid INT33D5:00: platform supports 5 button array
[    5.673222] input: Intel HID 5 button array as /devices/platform/INT33D5=
:00/input/input39
[    5.723796] Adding 66559996k swap on /dev/nvme0n1p7.  Priority:-2 extent=
s:1 across:66559996k SS
[    5.731498] pci 0000:00:08.0: Setting to D3hot
[    5.734949] resource: resource sanity check: requesting [mem 0x00000000f=
edc0000-0x00000000fedcffff], which spans more than pnp 00:03 [mem 0xfedc000=
0-0xfedc7fff]
[    5.734957] caller igen6_probe+0x15e/0x7c0 [igen6_edac] mapping multiple=
 BARs
[    5.735035] EDAC MC0: Giving out device to module igen6_edac controller =
Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[    5.735125] EDAC MC1: Giving out device to module igen6_edac controller =
Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[    5.735154] EDAC igen6 MC1: HANDLING IBECC MEMORY ERROR
[    5.735155] EDAC igen6 MC1: ADDR 0x7fffffffe0=20
[    5.735157] EDAC igen6 MC0: HANDLING IBECC MEMORY ERROR
[    5.735158] EDAC igen6 MC0: ADDR 0x7fffffffe0=20
[    5.735211] EDAC igen6: v2.5.1
[    5.742118] pci 0000:00:05.0: Setting to D3hot
[    5.746721] Serial bus multi instantiate pseudo device driver CSC3551:00=
: Instantiated 2 I2C devices.
[    5.754120] pci 0000:00:0b.0: Setting to D3hot
[    5.766127] pci 0000:00:14.2: enabling device (0000 -> 0002)
[    5.766584] intel_pmc_core INT33A1:00: Assuming a default substate order=
 for this platform
[    5.766636] intel_pmc_core INT33A1:00:  initialized
[    5.801038] input: PC Speaker as /devices/platform/pcspkr/input/input40
[    5.801923] nvidia-nvlink: Nvlink Core is being initialized, major devic=
e number 236

[    5.804413] videodev: Linux video capture interface: v2.00
[    5.805427] iTCO_vendor_support: vendor-support=3D0
[    5.805836] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.L=
PCB.HEC.DPTF.FCHG], AE_NOT_FOUND (20240827/psargs-332)
[    5.805844] ACPI Error: Aborting method \_SB.IETM.CHRG.PPSS due to previ=
ous error (AE_NOT_FOUND) (20240827/psparse-529)
[    5.807583] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=3D6=
, TCOBASE=3D0x0400)
[    5.807670] iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=
=3D0)
[    5.809991] input: HP WMI hotkeys as /devices/virtual/input/input41
[    5.813277] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 655360=
 ms ovfl timer
[    5.813280] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    5.813281] RAPL PMU: hw unit of domain package 2^-14 Joules
[    5.813282] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    5.813823] ov08x40 i2c-OVTI08F4:00: can't get clock frequency
[    5.813825] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -22
[    5.813952] ov08x40 i2c-OVTI08F4:00: probe with driver ov08x40 failed wi=
th error -22
[    5.817441] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[    5.817529] intel-ipu6 0000:00:05.0: IPU6 in secure mode touch 0x8000000=
0 mask 0x0
[    5.826439] intel-ipu6 0000:00:05.0: FW version: 20230925
[    5.827981] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
[    5.828013] intel-ipu6 0000:00:05.0: Connected 1 cameras
[    5.829706] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
[    5.833830] Bluetooth: Core ver 2.22
[    5.833844] NET: Registered PF_BLUETOOTH protocol family
[    5.833845] Bluetooth: HCI device and connection manager initialized
[    5.833847] Bluetooth: HCI socket layer initialized
[    5.833849] Bluetooth: L2CAP socket layer initialized
[    5.833851] Bluetooth: SCO socket layer initialized
[    5.855074] cryptd: max_cpu_qlen set to 1000
[    5.855187] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    5.855296] Loaded X.509 cert 'benh@debian.org: 577e021cb980e0e820821ba7=
b54b4961b8b4fadf'
[    5.855383] Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6ec146e09d1=
b6016ab9d6cf71dd233f0328'
[    5.855468] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.855550] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db1=
8c600'
[    5.858907] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 0002=
)
[    5.859065] intel_rapl_common: Found RAPL domain package
[    5.859126] AES CTR mode by8 optimization enabled
[    5.861568] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Adding DSD propert=
ies for 103C8C17
[    5.861856] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Using extra _DSD p=
roperties, bypassing _DSD in ACPI
[    5.863417] usbcore: registered new interface driver btusb
[    5.864982] Bluetooth: hci0: Device revision is 0
[    5.864986] Bluetooth: hci0: Secure boot is enabled
[    5.864987] Bluetooth: hci0: OTP lock is enabled
[    5.864988] Bluetooth: hci0: API lock is enabled
[    5.864988] Bluetooth: hci0: Debug lock is disabled
[    5.864989] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    5.864991] Bluetooth: hci0: Bootloader timestamp 2022.18 buildtype 1 bu=
ild 49266
[    5.865107] Bluetooth: hci0: DSM reset method type: 0x00
[    5.866529] Bluetooth: hci0: Found device firmware: intel/ibt-0180-0041.=
sfi
[    5.866549] Bluetooth: hci0: Boot Address: 0x100800
[    5.866550] Bluetooth: hci0: Firmware Version: 171-18.24
[    5.870121] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[    5.874324] intel_rapl_msr: PL4 support detected.
[    5.874344] Intel(R) Wireless WiFi driver for Linux
[    5.874362] intel_rapl_common: Found RAPL domain package
[    5.874364] intel_rapl_common: Found RAPL domain core
[    5.874365] intel_rapl_common: Found RAPL domain uncore
[    5.874393] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    5.876288] iwlwifi 0000:00:14.3: Detected crf-id 0x400410, cnv-id 0x108=
0800 wfpm id 0x80005b20
[    5.876299] iwlwifi 0000:00:14.3: PCI dev 7e40/0094, rev=3D0x441, rfid=
=3D0x2010d000
[    5.876301] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6E AX211 160MH=
z
[    5.876843] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ p=
latform, using SOF driver
[    5.876893] snd_hda_intel 0000:56:00.1: enabling device (0000 -> 0002)
[    5.877008] snd_hda_intel 0000:56:00.1: Disabling MSI
[    5.877012] snd_hda_intel 0000:56:00.1: Handle vga_switcheroo audio clie=
nt
[    5.878451] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.0=
.3.94
[    5.878729] iwlwifi 0000:00:14.3: firmware: failed to load iwl-debug-yoy=
o.bin (-2)
[    5.878734] iwlwifi 0000:00:14.3: firmware: failed to load iwl-debug-yoy=
o.bin (-2)
[    5.878736] iwlwifi 0000:00:14.3: loaded firmware version 89.202a2f7b.0 =
ma-b0-gf-a0-89.ucode op_mode iwlmvm
[    5.897579] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cirrus Logic CS35L=
41 (35a40), Revision: B2
[    5.897696] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Adding DSD propert=
ies for 103C8C17
[    5.897831] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Using extra _DSD p=
roperties, bypassing _DSD in ACPI
[    5.897833] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Reset line busy, a=
ssuming shared reset
[    5.899580] nvidia 0000:56:00.0: enabling device (0002 -> 0003)
[    5.899976] nvidia 0000:56:00.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dnone
[    5.916817] intel-ipu6 0000:00:05.0: CSE authenticate_run done
[    5.916827] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
[    5.932812] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cirrus Logic CS35L=
41 (35a40), Revision: B2
[    5.961595] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  535.216.03  =
Fri Oct 25 22:43:06 UTC 2024
[    5.982696] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input42
[    5.982732] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input43
[    5.982764] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input44
[    5.982800] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/000=
0:00:1c.0/0000:56:00.1/sound/card0/input45
[    6.003721] typec port0: bound usb3-port1 (ops connector_ops [usbcore])
[    6.003744] typec port0: bound usb2-port1 (ops connector_ops [usbcore])
[    6.004765] sof-audio-pci-intel-mtl 0000:00:1f.3: enabling device (0000 =
-> 0002)
[    6.004864] sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI =
class/subclass/prog-if 0x040100
[    6.004906] sof-audio-pci-intel-mtl 0000:00:1f.3: bound 0000:00:02.0 (op=
s i915_audio_component_bind_ops [i915])
[    6.008039] [658] intel-ipu6 0000:00:05.0: remote endpoint port 0 with 4=
 lanes added
[    6.011367] sof-audio-pci-intel-mtl 0000:00:1f.3: use msi interrupt mode
[    6.016634] nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver fo=
r UNIX platforms  535.216.03  Fri Oct 25 22:41:13 UTC 2024
[    6.031392] sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask=
 5
[    6.031396] sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driv=
er skl_hda_dsp_generic now
[    6.031398] sof-audio-pci-intel-mtl 0000:00:1f.3: NHLT device BT(0) dete=
cted, ssp_mask 0x4
[    6.031399] sof-audio-pci-intel-mtl 0000:00:1f.3: BT link detected in NH=
LT tables: 0x4
[    6.031560] sof-audio-pci-intel-mtl 0000:00:1f.3: DMICs detected in NHLT=
 tables: 2
[    6.034167] sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files f=
or ipc type 1:
[    6.034169] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     in=
tel/sof-ipc4/mtl/sof-mtl.ri
[    6.034170] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: in=
tel/sof-ipc4-lib/mtl
[    6.034171] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     in=
tel/sof-ace-tplg/sof-hda-generic-2ch.tplg
[    6.034802] sof-audio-pci-intel-mtl 0000:00:1f.3: Loaded firmware librar=
y: ADSPFW, version: 2.11.1.1
[    6.046066] [drm] [nvidia-drm] [GPU ID 0x00005600] Loading driver
[    6.046069] [drm] Initialized nvidia-drm 0.0.0 for 0000:56:00.0 on minor=
 1
[    6.048927] ------------[ cut here ]------------
[    6.048929] WARNING: CPU: 2 PID: 457 at drivers/gpu/drm/drm_file.c:312 d=
rm_open_helper+0x132/0x150 [drm]
[    6.048967] Modules linked in: nvidia_drm(POE) intel_uncore_frequency(+)=
 intel_uncore_frequency_common x86_pkg_temp_thermal snd_hda_codec_realtek s=
nd_hda_codec_generic snd_hda_scodec_component snd_soc_dmic nvidia_modeset(P=
OE) snd_sof_pci_intel_mtl snd_sof_intel_hda_generic soundwire_intel soundwi=
re_generic_allocation soundwire_cadence snd_sof_intel_hda_common snd_soc_hd=
ac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda intel_ipu6_isys snd_sof_pc=
i snd_sof_xtensa_dsp videobuf2_dma_sg videobuf2_memops intel_powerclamp snd=
_sof videobuf2_v4l2 snd_sof_utils snd_hda_scodec_cs35l41_spi coretemp snd_h=
da_ext_core regmap_spi iwlmvm(+) videobuf2_common snd_soc_acpi_intel_match =
kvm_intel snd_soc_acpi mac80211 snd_soc_core snd_hda_codec_hdmi snd_compres=
s libarc4 kvm snd_pcm_dmaengine soundwire_bus snd_hda_intel snd_intel_dspcf=
g crct10dif_pclmul snd_intel_sdw_acpi intel_rapl_msr ghash_clmulni_intel sn=
d_hda_codec iwlwifi sha512_ssse3 sha256_ssse3 btusb sha1_ssse3 snd_hda_scod=
ec_cs35l41_i2c snd_hda_core btrtl snd_hda_scodec_cs35l41
[    6.048988]  aesni_intel processor_thermal_device_pci btintel processor_=
thermal_device snd_hda_cs_dsp_ctls gf128mul processor_thermal_wt_hint btbcm=
 ucsi_acpi snd_hwdep snd_soc_cs_amp_lib crypto_simd processor_thermal_rfim =
btmtk snd_pcm cs_dsp typec_ucsi cryptd hid_sensor_magn_3d hid_sensor_gyro_3=
d hid_sensor_accel_3d hid_sensor_rotation processor_thermal_rapl cfg80211 b=
luetooth snd_timer ov08x40 snd_soc_cs35l41_lib hid_sensor_trigger intel_rap=
l_common typec hid_sensor_iio_common mei_me rapl processor_thermal_wt_req v=
4l2_fwnode snd iTCO_wdt industrialio_triggered_buffer hp_wmi processor_ther=
mal_power_floor kfifo_buf intel_pmc_bxt intel_cstate v4l2_async processor_t=
hermal_mbox int3403_thermal intel_ipu6 iTCO_vendor_support platform_profile=
 intel_uncore wmi_bmof pcspkr industrialio watchdog mei soundcore rfkill ro=
les igen6_edac ipu_bridge videodev serial_multi_instantiate intel_pmc_core =
int340x_thermal_zone intel_skl_int3472_tps68470 mc intel_vsec int3400_therm=
al pmt_telemetry intel_hid intel_skl_int3472_discrete
[    6.049012]  soc_button_array acpi_tad joydev acpi_thermal_rel pmt_class=
 intel_skl_int3472_common sparse_keymap acpi_pad ac evdev serio_raw nvidia(=
POE) msr parport_pc ppdev lp parport efi_pstore configfs nfnetlink ip_table=
s x_tables autofs4 ext4 crc16 mbcache jbd2 btrfs blake2b_generic efivarfs r=
aid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xo=
r raid6_pq libcrc32c crc32c_generic raid1 raid0 md_mod hid_sensor_custom hi=
d_sensor_hub intel_ishtp_hid i915 hid_multitouch drm_buddy i2c_algo_bit drm=
_display_helper cec hid_generic rc_core i2c_hid_acpi ttm xhci_pci i2c_hid x=
hci_hcd drm_kms_helper hid nvme intel_lpss_pci drm mxm_wmi thunderbolt usbc=
ore intel_ish_ipc crc32_pclmul i2c_i801 intel_lpss nvme_core crc32c_intel i=
2c_smbus video intel_ishtp battery idma64 usb_common fan wmi pinctrl_meteor=
lake button
[    6.049041] CPU: 2 UID: 0 PID: 457 Comm: plymouthd Tainted: P           =
OE      6.12.5-ipu6 #7=20
[    6.049044] Tainted: [P]=3DPROPRIETARY_MODULE, [O]=3DOOT_MODULE, [E]=3DU=
NSIGNED_MODULE
[    6.049045] Hardware name: HP HP Spectre x360 2-in-1 Laptop 16t-aa000/8C=
17, BIOS F.11 08/14/2024
[    6.049046] RIP: 0010:drm_open_helper+0x132/0x150 [drm]
[    6.049071] Code: 83 c9 ee 31 c0 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 =
5f c3 cc cc cc cc 48 89 df 89 44 24 04 e8 64 fa ff ff 8b 44 24 04 eb db <0f=
> 0b b8 ea ff ff ff eb d2 b8 ea ff ff ff eb cb b8 f0 ff ff ff eb
[    6.049072] RSP: 0018:ffffa12041e1fb10 EFLAGS: 00010246
[    6.049074] RAX: ffffffffc60cb220 RBX: ffff90adcc6dae68 RCX: 00000000000=
00000
[    6.049075] RDX: ffff90add4ba8000 RSI: ffff90adcc6dae68 RDI: ffff90adcdb=
efc80
[    6.049075] RBP: ffff90adcdbefc80 R08: ffff90add5e3be10 R09: ffff90adc02=
53dd0
[    6.049076] R10: 00000000000000e2 R11: 0000000000000002 R12: ffff90b083f=
db800
[    6.049077] R13: ffffffffc60cb220 R14: 00000000ffffffed R15: ffff90adc63=
8d2d0
[    6.049078] FS:  00007efc19913000(0000) GS:ffff90b51fb00000(0000) knlGS:=
0000000000000000
[    6.049079] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.049080] CR2: 00007ffc5e287400 CR3: 0000000114b5e001 CR4: 0000000000f=
72ef0
[    6.049081] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[    6.049082] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 00000000000=
00400
[    6.049083] PKRU: 55555554
[    6.049083] Call Trace:
[    6.049086]  <TASK>
[    6.049086]  ? drm_open_helper+0x132/0x150 [drm]
[    6.049111]  ? __warn.cold+0x93/0xf6
[    6.049114]  ? drm_open_helper+0x132/0x150 [drm]
[    6.049139]  ? report_bug+0xff/0x140
[    6.049140]  ? handle_bug+0x58/0x90
[    6.049142]  ? exc_invalid_op+0x17/0x70
[    6.049143]  ? asm_exc_invalid_op+0x1a/0x20
[    6.049147]  ? drm_open_helper+0x132/0x150 [drm]
[    6.049171]  drm_open+0x73/0x110 [drm]
[    6.049195]  drm_stub_open+0x9b/0xd0 [drm]
[    6.049219]  chrdev_open+0xb2/0x230
[    6.049222]  ? __pfx_chrdev_open+0x10/0x10
[    6.049223]  do_dentry_open+0x14c/0x440
[    6.049225]  vfs_open+0x2e/0xe0
[    6.049227]  path_openat+0x82e/0x12d0
[    6.049230]  do_filp_open+0xc4/0x170
[    6.049232]  do_sys_openat2+0xae/0xe0
[    6.049234]  __x64_sys_openat+0x55/0xa0
[    6.049236]  do_syscall_64+0x82/0x190
[    6.049239]  ? __x64_sys_getrandom+0x84/0xe0
[    6.049242]  ? syscall_exit_to_user_mode+0x4d/0x210
[    6.049243]  ? do_syscall_64+0x8e/0x190
[    6.049245]  ? intel_thermal_interrupt+0x175/0x330
[    6.049248]  ? __irq_exit_rcu+0x37/0xb0
[    6.049251]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    6.049253] RIP: 0033:0x7efc19bb8bb8
[    6.049255] Code: 48 89 44 24 20 75 96 44 89 54 24 0c e8 a1 b6 f8 ff 44 =
8b 54 24 0c 89 da 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 30 44 89 c7 89 44 24 0c e8 f4 b6 f8 ff 8b 44
[    6.049256] RSP: 002b:00007fff19371660 EFLAGS: 00000293 ORIG_RAX: 000000=
0000000101
[    6.049257] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007efc19b=
b8bb8
[    6.049258] RDX: 0000000000000002 RSI: 000055cc943694c0 RDI: 00000000fff=
fff9c
[    6.049259] RBP: 000055cc943694c0 R08: 0000000000000000 R09: 00000000000=
00007
[    6.049259] R10: 0000000000000000 R11: 0000000000000293 R12: 00007efc199=
12f88
[    6.049260] R13: 00007efc19cd4840 R14: 000000000000000b R15: 000055cc943=
65cc0
[    6.049262]  </TASK>
[    6.049262] ---[ end trace 0000000000000000 ]---
[    6.156802] sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware versio=
n: 2.11.1.1
[    6.161479] sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 K=
ernel ABI 3:23:1
[    6.161671] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card n=
ot yet available, widget card binding deferred
[    6.180671] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.wmfw (-2)
[    6.180753] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.wmfw (-2)
[    6.180827] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-l0.wmfw (-2)
[    6.180902] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-l0.wmfw (-2)
[    6.181082] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[    6.181094] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[    6.181730] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bincfg (-2)
[    6.181805] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bincfg (-2)
[    6.181807] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    6.181809] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight=
 Time
[    6.206402] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for RT uCode
[    6.206431] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    6.206446] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    6.206453] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    6.206460] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    6.206757] iwlwifi 0000:00:14.3: loaded PNVM version 35148b80
[    6.207256] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[    6.222521] iwlwifi 0000:00:14.3: Detected RF GF, rfid=3D0x2010d000
[    6.288140] iwlwifi 0000:00:14.3: base HW address: d0:65:78:ec:0a:e5
[    6.332133] iwlwifi 0000:00:14.3 wlo1: renamed from wlan0
[    6.635486] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 40=
0a4 vendor: 0x2 v0.60.0, 2 algorithms
[    6.636581] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17-spkid0-l0.bin: v0.60.0
[    6.636585] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: C:=
\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_toolin=
g_4KHz-6dBhighshelf\HP_
[    6.643339] audit: type=3D1400 audit(1734614249.056:2): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-s=
enddoc" pid=3D996 comm=3D"apparmor_parser"
[    6.643435] audit: type=3D1400 audit(1734614249.056:3): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be" pid=3D990 comm=3D"apparmor_parser"
[    6.643441] audit: type=3D1400 audit(1734614249.056:4): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modpro=
be//kmod" pid=3D990 comm=3D"apparmor_parser"
[    6.643456] audit: type=3D1400 audit(1734614249.056:5): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-x=
pdfimport" pid=3D998 comm=3D"apparmor_parser"
[    6.643882] audit: type=3D1400 audit(1734614249.056:6): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffice-o=
osplash" pid=3D995 comm=3D"apparmor_parser"
[    6.643985] audit: type=3D1400 audit(1734614249.056:7): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/man"=
 pid=3D994 comm=3D"apparmor_parser"
[    6.643986] audit: type=3D1400 audit(1734614249.056:8): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_filter" p=
id=3D994 comm=3D"apparmor_parser"
[    6.643990] audit: type=3D1400 audit(1734614249.056:9): apparmor=3D"STAT=
US" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_groff" pi=
d=3D994 comm=3D"apparmor_parser"
[    6.644020] audit: type=3D1400 audit(1734614249.056:10): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"lsb_release"=
 pid=3D987 comm=3D"apparmor_parser"
[    6.644048] audit: type=3D1400 audit(1734614249.056:11): apparmor=3D"STA=
TUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/libexec=
/ibus-engine-hangul" pid=3D1000 comm=3D"apparmor_parser"
[    6.695345] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Calibration applie=
d: R0=3D10501
[    6.709255] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded - =
Type: spk-prot, Gain: 17
[    6.709322] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SS=
ID: 103C8C17, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 0
[    6.709326] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35=
l41-hda.0 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    6.709451] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.wmfw (-2)
[    6.709527] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.wmfw (-2)
[    6.709618] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-r0.wmfw (-2)
[    6.709697] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-r0.wmfw (-2)
[    6.709704] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[    6.709708] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0.wmfw (-2)
[    6.710010] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bincfg (-2)
[    6.710016] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: firmware: failed t=
o load cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bincfg (-2)
[    6.710018] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    6.710020] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight=
 Time
[    6.767155] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    6.767159] Bluetooth: BNEP filters: protocol multicast
[    6.767163] Bluetooth: BNEP socket layer initialized
[    6.792982] block nvme0n1: No UUID available providing old NGUID
[    6.824915] NET: Registered PF_QIPCRTR protocol family
[    7.163697] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 40=
0a4 vendor: 0x2 v0.60.0, 2 algorithms
[    7.164803] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l=
41-dsp1-spk-prot-103c8c17-spkid0-r0.bin: v0.60.0
[    7.164806] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: C:=
\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_toolin=
g_4KHz-6dBhighshelf\HP_
[    7.205620] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for RT uCode
[    7.205656] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    7.205674] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    7.205680] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    7.205686] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    7.206456] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[    7.223646] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration applie=
d: R0=3D10902
[    7.237292] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded - =
Type: spk-prot, Gain: 17
[    7.237444] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SS=
ID: 103C8C17, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 0
[    7.237450] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35=
l41-hda.1 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    7.237767] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC245: li=
ne_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    7.237771] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    7.237773] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[    7.237774] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=3D0x0
[    7.237775] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[    7.237777] snd_hda_codec_realtek ehdaudio0D0:      Mic=3D0x19
[    7.277915] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_=
controls: no PCM in topology for HDMI converter 3
[    7.291699] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, wit=
h index: 0
[    7.294384] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/s=
kl_hda_dsp_generic/sound/card1/input46
[    7.294427] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:=
1f.3/skl_hda_dsp_generic/sound/card1/input47
[    7.294456] input: sof-hda-dsp HDMI/DP,pcm=3D3 as /devices/pci0000:00/00=
00:00:1f.3/skl_hda_dsp_generic/sound/card1/input48
[    7.294480] input: sof-hda-dsp HDMI/DP,pcm=3D4 as /devices/pci0000:00/00=
00:00:1f.3/skl_hda_dsp_generic/sound/card1/input49
[    7.294504] input: sof-hda-dsp HDMI/DP,pcm=3D5 as /devices/pci0000:00/00=
00:00:1f.3/skl_hda_dsp_generic/sound/card1/input50
[    7.317916] hid-sensor-hub 001F:8087:0AC2.0005: hid_field_extract() call=
ed with n (192) > 32! (kworker/11:0)
[    7.337161] Bluetooth: hci0: Waiting for firmware download to complete
[    7.337945] Bluetooth: hci0: Firmware loaded in 1436926 usecs
[    7.337992] Bluetooth: hci0: Waiting for device to boot
[    7.379950] Bluetooth: hci0: Device booted in 40995 usecs
[    7.382568] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0180-=
0041.ddc
[    7.384079] Bluetooth: hci0: Applying Intel DDC parameters completed
[    7.386986] Bluetooth: hci0: Firmware timestamp 2024.18 buildtype 1 buil=
d 3243
[    7.386990] Bluetooth: hci0: Firmware SHA1: 0xa8bb3f39
[    7.390955] Bluetooth: hci0: Fseq status: Success (0x00)
[    7.390960] Bluetooth: hci0: Fseq executed: 00.00.03.94
[    7.390962] Bluetooth: hci0: Fseq BT Top: 00.00.03.94
[    7.483255] Bluetooth: MGMT ver 1.23
[    7.488177] NET: Registered PF_ALG protocol family
[    7.505122] Bluetooth: RFCOMM TTY layer initialized
[    7.505132] Bluetooth: RFCOMM socket layer initialized
[    7.505137] Bluetooth: RFCOMM ver 1.11
[    7.520891] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0=
 for RT uCode
[    7.520971] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    7.520987] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    7.520993] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    7.521000] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    7.521714] iwlwifi 0000:00:14.3: RFIm is deactivated, reason =3D 4
[    7.624340] RPC: Registered named UNIX socket transport module.
[    7.624343] RPC: Registered udp transport module.
[    7.624343] RPC: Registered tcp transport module.
[    7.624344] RPC: Registered tcp-with-tls transport module.
[    7.624344] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   11.601946] netfs: FS-Cache loaded
[   11.602728] Key type dns_resolver registered
[   11.639501] Key type cifs.spnego registered
[   11.639506] Key type cifs.idmap registered
[   11.645788] CIFS: VFS: Use of the less secure dialect vers=3D1.0 is not =
recommended unless required for access to very old servers
[   11.645802] CIFS: Attempting to mount //192.168.1.248/NetFolder
[   11.645832] CIFS: VFS: Error connecting to socket. Aborting operation.
[   11.645835] CIFS: VFS: cifs_mount failed w/return code =3D -101
[   11.706465] NFS: Registering the id_resolver key type
[   11.706476] Key type id_resolver registered
[   11.706477] Key type id_legacy registered
[   19.505553] nvidia_uvm: module uses symbols nvUvmInterfaceDisableAccessC=
ntr from proprietary module nvidia, inheriting taint.
[   19.524094] nvidia-uvm: Loaded the UVM driver, major device number 510.
[   20.847658] show_signal: 20 callbacks suppressed
[   20.847662] traps: light-locker[2156] trap int3 ip:7f38fbba0f37 sp:7ffc0=
e34ea90 error:0 in libglib-2.0.so.0.8200.4[64f37,7f38fbb5a000+a0000]
[   20.982408] warning: `kdeconnectd' uses wireless extensions which will s=
top working for Wi-Fi 7 hardware; use nl80211
[   21.150466] audit: type=3D1400 audit(1734614263.564:32): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/devices/system/node/" pid=3D2326 comm=3D"mysqld" requested_mask=3D"r"=
 denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[   21.181083] audit: type=3D1400 audit(1734614263.592:33): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/devices/system/node/" pid=3D2328 comm=3D"mysqld" requested_mask=3D"r"=
 denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[   21.197103] audit: type=3D1400 audit(1734614263.608:34): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/usr/share/mariadb/charsets/Index.xml" pid=3D2328 comm=3D"mysqld" requeste=
d_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
[   21.204844] audit: type=3D1400 audit(1734614263.616:35): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/block/" pid=3D2328 comm=3D"mysqld" requested_mask=3D"r" denied_mask=
=3D"r" fsuid=3D1000 ouid=3D0
[   21.220039] audit: type=3D1400 audit(1734614263.632:36): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/proc/2328/cgroup" pid=3D2328 comm=3D"mysqld" requested_mask=3D"r" denied_=
mask=3D"r" fsuid=3D1000 ouid=3D1000
[   21.220678] audit: type=3D1400 audit(1734614263.632:37): apparmor=3D"DEN=
IED" operation=3D"open" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/nvme/nvme0/nvme0n1/queue=
/physical_block_size" pid=3D2328 comm=3D"mysqld" requested_mask=3D"r" denie=
d_mask=3D"r" fsuid=3D1000 ouid=3D0
[   21.487635] audit: type=3D1400 audit(1734614263.900:38): apparmor=3D"DEN=
IED" operation=3D"exec" class=3D"file" profile=3D"mariadbd_akonadi" name=3D=
"/usr/bin/mariadb" pid=3D2350 comm=3D"sh" requested_mask=3D"x" denied_mask=
=3D"x" fsuid=3D1000 ouid=3D0
[   22.210229] wlo1: authenticate with f8:85:f9:0d:a2:e1 (local address=3Dd=
0:65:78:ec:0a:e5)
[   22.210788] wlo1: send auth to f8:85:f9:0d:a2:e1 (try 1/3)
[   22.242151] wlo1: authenticated
[   22.250322] wlo1: associate with f8:85:f9:0d:a2:e1 (try 1/3)
[   22.259550] wlo1: RX AssocResp from f8:85:f9:0d:a2:e1 (capab=3D0x1511 st=
atus=3D0 aid=3D1)
[   22.262559] wlo1: associated
[   22.326676] wlo1: Limiting TX power to 30 (30 - 0) dBm as advertised by =
f8:85:f9:0d:a2:e1
[   26.342525] input: MX Anywhere 3S Mouse as /devices/virtual/misc/uhid/00=
05:046D:B037.0009/input/input51
[   26.342708] hid-generic 0005:046D:B037.0009: input,hidraw8: BLUETOOTH HI=
D v0.03 Mouse [MX Anywhere 3S] on d0:65:78:ec:0a:e9
[  270.491157] [3208] intel_ipu6_isys.isys intel_ipu6.isys.40: bind ov08x40=
 4-0036 nlanes is 4 port is 0
[  312.920055] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Inte=
l IPU6 ISYS Capture 0: configured size 18717248, buffer size 18717248
[  312.920061] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buffer=
 0 for Intel IPU6 ISYS Capture 0
[  312.920063] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: iova: iova 0=
x00000000fe612000
[  312.920064] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: media pipeli=
ne is not ready for Intel IPU6 ISYS Capture 0
[  312.920065] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: stream: Inte=
l IPU6 ISYS Capture 0: width 3856, height 2416, css pixelformat 24
[  312.920072] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: validating l=
ink "Intel IPU6 CSI2 0":1 -> "Intel IPU6 ISYS Capture 0"
[  312.932767] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 2=
0 scale 2, did: value 20 scale 2
[  312.933315] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: prepare stre=
am: external entity ov08x40 4-0036
[  312.933319] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: queue 1 of 1
[  312.933328] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: =
req_id 0x2, index 2, offset 0x0, value 0x1
[  312.933446] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy respon=
se: id 2, error 0, details 0
[  312.933448] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 1=
023 scale 2, did: value 299 scale 2
[  312.933449] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: =
req_id 0x1, index 1, offset 0x0, value 0x42
[  312.933564] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy respon=
se: id 1, error 0, details 0
[  312.933565] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: mem_open_thr=
eshold: 12
[  312.933566] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: =
req_id 0x3, index 3, offset 0x0, value 0xc
[  312.933681] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy respon=
se: id 3, error 0, details 0
[  312.933683] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: threshold: 8=
9 critical: 108
[  312.933684] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: =
req_id 0x0, index 0, offset 0x0, value 0x6c
[  312.933799] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy respon=
se: id 0, error 0, details 0
[  312.933801] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Inte=
l IPU6 ISYS Capture 0: buffer 0
[  312.933802] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: get buffer l=
ist 00000000ea7e1b34, 1 buffers
[  312.933804] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: set stream: =
1
[  312.933806] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ------------=
-----------------------------------------
[  312.933806] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS=
_STREAM_CFG_DATA
[  312.933807] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: compfmt =3D =
0
[  312.933808] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: src =3D 0
[  312.933809] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: vc =3D 0
[  312.933810] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: isl_use =3D =
0
[  312.933810] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: sensor_type =
=3D 0
[  312.933811] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof=
_discarded =3D 0
[  312.933812] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof=
_discarded =3D 0
[  312.933813] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_so=
f_discarded =3D 0
[  312.933813] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eo=
f_discarded =3D 0
[  312.933814] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: crop:
[  312.933815] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.left_top=
 =3D [0, 0]
[  312.933816] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.right_bo=
ttom =3D [0, 0]
[  312.933817] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: nof_input_pi=
ns =3D 1
[  312.933817] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: input pin[0]=
:
[  312.933818] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.dt =3D 0=
x2b
[  312.933819] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.mipi_sto=
re_mode =3D 0
[  312.933820] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.bits_per=
_pix =3D 10
[  312.933821] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.mapped_d=
t =3D 0x40
[  312.933822] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.input_re=
s =3D 3856x2416
[  312.933823] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.mipi_dec=
ompression =3D 0
[  312.933824] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.capture_=
mode =3D 0
[  312.933824] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: nof_output_p=
ins =3D 1
[  312.933825] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0=
]:
[  312.933826] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.input_pi=
n_id =3D 0
[  312.933826] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.output_r=
es =3D 3856x2416
[  312.933827] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.stride =
=3D 7744
[  312.933828] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.pt =3D 3
[  312.933828] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.payload_=
buf_size =3D 0
[  312.933829] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.ft =3D 2=
4
[  312.933829] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.watermar=
k_in_lines =3D 0
[  312.933830] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.send_irq=
 =3D 1
[  312.933830] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.reserve_=
compression =3D 0
[  312.933831] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.snoopabl=
e =3D 1
[  312.933832] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.error_ha=
ndling_enable =3D 0
[  312.933833] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.sensor_t=
ype =3D 14
[  312.933833] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ------------=
-----------------------------------------
[  312.933834] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: =
STREAM_OPEN
[  312.934107] <intr> intel_ipu6_isys.isys intel_ipu6.isys.40: FW resp 00 S=
TREAM_OPEN_DONE, stream 0, ts 0x0000000000000000, pin 0
[  312.934129] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: start stream=
: open complete
[  312.934130] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buf li=
st 00000000ea7e1b34 flags 2, s 0, 1 bufs
[  312.934131] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ------------=
-----------------------------------------
[  312.934132] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS=
_FRAME_BUFF_SET
[  312.934132] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0=
]:
[  312.934133] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.out_buf_=
id =3D 1
[  312.934133] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.addr =3D=
 0xfe612000
[  312.934134] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.compress=
 =3D 0
[  312.934135] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof=
 =3D 0x1
[  312.934135] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof=
 =3D 0x0
[  312.934136] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_so=
f =3D 0x1
[  312.934136] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eo=
f =3D 0x0
[  312.934137] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_cap=
ture_ack =3D 0x1
[  312.934137] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_cap=
ture_done =3D 0x0
[  312.934138] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_ca=
pture_ack =3D 0x1
[  312.934138] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_ca=
pture_done =3D 0x1
[  312.934139] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ------------=
-----------------------------------------
[  312.934140] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: =
STREAM_START_AND_CAPTURE
[  312.934318] <intr> intel_ipu6_isys.isys intel_ipu6.isys.40: FW resp 02 S=
TREAM_START_AND_CAPTURE_ACK, stream 0, ts 0x0000000000000000, pin 0
[  312.934326] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: start stream=
: complete
[  312.934327] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on In=
tel IPU6 CSI2 0 pad 1 mask 0x1
[  312.934331] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ctermen 0 cs=
ettle 680 dtermen 0 dsettle 660
[  312.934333] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on CS=
I2-0 with 4 lanes
[  312.934545] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: config phy 0=
 and 1 in aggr mode
[  312.934546] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 0
[  312.934548] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23803c =3D data 0x0
[  312.934550] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238038 =3D data 0x0
[  312.934552] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238048 =3D data 0x0
[  312.934553] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x2
[  312.934554] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 1
[  312.934556] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238070 =3D data 0x0
[  312.934557] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23806c =3D data 0x0
[  312.934558] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23807c =3D data 0x0
[  312.934560] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x2
[  312.934561] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x1330
[  312.934577] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x133 =3D 0x1
[  312.934579] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x11331
[  312.934582] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x1330
[  312.934599] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x133 =3D 0x1
[  312.934602] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x1331
[  312.934604] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x3070
[  312.934618] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x307 =3D 0x0
[  312.934618] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x43071
[  312.934620] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x3070
[  312.934633] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x307 =3D 0x0
[  312.934634] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x3071
[  312.934636] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x5080
[  312.934649] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x508 =3D 0x0
[  312.934650] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x205081
[  312.934652] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x5080
[  312.934665] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x508 =3D 0x0
[  312.934666] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x205081
[  312.934668] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x7080
[  312.934681] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x708 =3D 0x0
[  312.934681] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x207081
[  312.934683] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x7080
[  312.934697] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x708 =3D 0x0
[  312.934697] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x207081
[  312.934699] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x3080
[  312.934712] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x308 =3D 0x0
[  312.934713] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x3081
[  312.934715] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x3080
[  312.934728] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x308 =3D 0x0
[  312.934729] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x83081
[  312.934731] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0xe00
[  312.934744] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0xe0 =3D 0x0
[  312.934745] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x30e01
[  312.934747] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0xe10
[  312.934760] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0xe1 =3D 0x0
[  312.934760] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x20e11
[  312.934762] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x3070
[  312.934776] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x307 =3D 0x0
[  312.934776] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x83071
[  312.934778] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x3040
[  312.934791] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x304 =3D 0x0
[  312.934792] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x803041
[  312.934794] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x3050
[  312.934807] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x305 =3D 0x0
[  312.934808] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0xa3051
[  312.934810] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: config Dphy =
0 with 800 mbps
[  312.934811] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
238040 =3D data 0x0
[  312.934812] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238040 =3D data 0x19
[  312.934813] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0xe40
[  312.934826] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0xe4 =3D 0x0
[  312.934826] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x10e41
[  312.934828] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0xe20
[  312.934842] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0xe2 =3D 0x0
[  312.934842] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x4f0e21
[  312.934844] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0xe30
[  312.934857] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0xe3 =3D 0x0
[  312.934858] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x10e31
[  312.934860] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x80
[  312.934873] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x8 =3D 0x1c
[  312.934874] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x3c0081
[  312.934876] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ref_clk =3D =
384 clk_freqrange =3D 85
[  312.934877] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
238044 =3D data 0x0
[  312.934878] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238044 =3D data 0x55
[  312.934879] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
238068 =3D data 0x0
[  312.934879] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238068 =3D data 0x10
[  312.934881] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
238068 =3D data 0x10
[  312.934881] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238068 =3D data 0x110
[  312.934882] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: config Dphy =
1 with 800 mbps
[  312.934883] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
238074 =3D data 0x0
[  312.934884] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238074 =3D data 0x19
[  312.934885] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0xe40
[  312.934898] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0xe4 =3D 0x0
[  312.934899] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x10e41
[  312.934900] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0xe20
[  312.934914] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0xe2 =3D 0x0
[  312.934914] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x4f0e21
[  312.934916] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0xe30
[  312.934929] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0xe3 =3D 0x0
[  312.934930] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x10e31
[  312.934932] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x80
[  312.934945] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x8 =3D 0x1c
[  312.934946] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x3c0081
[  312.934948] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ref_clk =3D =
384 clk_freqrange =3D 85
[  312.934949] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
238078 =3D data 0x0
[  312.934949] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238078 =3D data 0x55
[  312.934951] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
23809c =3D data 0x0
[  312.934951] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23809c =3D data 0x10
[  312.934953] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
23809c =3D data 0x10
[  312.934953] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23809c =3D data 0x110
[  312.934954] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238038 =3D data 0x1
[  312.934976] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23803c =3D data 0x1
[  312.934977] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x1e0
[  312.934990] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x1e =3D 0x11
[  312.935092] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x1e0
[  312.935106] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x1e =3D 0x16
[  312.935208] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x1e0
[  312.935222] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x1e =3D 0x17
[  312.935223] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
238068 =3D data 0x110
[  312.935224] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238068 =3D data 0x100
[  312.935225] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
238068 =3D data 0x100
[  312.935225] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238068 =3D data 0x0
[  312.935226] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Dphy 0 is re=
ady!
[  312.935227] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23806c =3D data 0x1
[  312.935249] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238070 =3D data 0x1
[  312.935250] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x1e0
[  312.935263] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x1e =3D 0x11
[  312.935366] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x1e0
[  312.935379] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x1e =3D 0x19
[  312.935482] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238080 =3D data 0x1e0
[  312.935495] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read=
 0x1e =3D 0x17
[  312.935496] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
23809c =3D data 0x110
[  312.935497] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23809c =3D data 0x100
[  312.935498] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x=
23809c =3D data 0x100
[  312.935499] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23809c =3D data 0x0
[  312.935500] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Dphy 1 is re=
ady!
[  313.076919] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Inte=
l IPU6 ISYS Capture 0: configured size 18717248, buffer size 18717248
[  313.076925] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buffer=
 1 for Intel IPU6 ISYS Capture 0
[  313.076925] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: iova: iova 0=
x00000000fd438000
[  313.076927] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Inte=
l IPU6 ISYS Capture 0: buffer 1
[  313.076928] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: get buffer l=
ist 000000002348050c, 1 buffers
[  313.076930] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ------------=
-----------------------------------------
[  313.076931] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS=
_FRAME_BUFF_SET
[  313.076931] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0=
]:
[  313.076932] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.out_buf_=
id =3D 2
[  313.076932] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.addr =3D=
 0xfd438000
[  313.076933] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.compress=
 =3D 0
[  313.076934] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof=
 =3D 0x1
[  313.076934] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof=
 =3D 0x0
[  313.076935] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_so=
f =3D 0x1
[  313.076935] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eo=
f =3D 0x0
[  313.076936] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_cap=
ture_ack =3D 0x0
[  313.076936] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_cap=
ture_done =3D 0x0
[  313.076937] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_ca=
pture_ack =3D 0x1
[  313.076937] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_ca=
pture_done =3D 0x1
[  313.076938] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ------------=
-----------------------------------------
[  313.076939] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buf li=
st 000000002348050c flags 2, s 0, 1 bufs
[  313.076941] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: =
STREAM_CAPTURE
[  313.076958] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Inte=
l IPU6 ISYS Capture 0: configured size 18717248, buffer size 18717248
[  313.076959] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buffer=
 2 for Intel IPU6 ISYS Capture 0
[  313.076960] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: iova: iova 0=
x00000000fc25e000
[  313.076961] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Inte=
l IPU6 ISYS Capture 0: buffer 2
[  313.076961] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: get buffer l=
ist 00000000580a1ac9, 1 buffers
[  313.076962] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ------------=
-----------------------------------------
[  313.076963] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS=
_FRAME_BUFF_SET
[  313.076964] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0=
]:
[  313.076964] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.out_buf_=
id =3D 3
[  313.076965] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.addr =3D=
 0xfc25e000
[  313.076966] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: =09.compress=
 =3D 0
[  313.076966] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof=
 =3D 0x1
[  313.076967] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof=
 =3D 0x0
[  313.076967] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_so=
f =3D 0x1
[  313.076968] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eo=
f =3D 0x0
[  313.076968] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_cap=
ture_ack =3D 0x0
[  313.076969] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_cap=
ture_done =3D 0x0
[  313.076969] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_ca=
pture_ack =3D 0x1
[  313.076970] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_ca=
pture_done =3D 0x1
[  313.076970] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ------------=
-----------------------------------------
[  313.076971] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buf li=
st 00000000580a1ac9 flags 2, s 0, 1 bufs
[  313.076972] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: =
STREAM_CAPTURE
[  324.332730] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: =
req_id 0x2, index 2, offset 0x0, value 0x0
[  324.332858] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy respon=
se: id 2, error 0, details 0
[  324.332861] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 2=
0 scale 2, did: value 20 scale 2
[  324.332862] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: =
req_id 0x0, index 0, offset 0x0, value 0x60
[  324.332977] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy respon=
se: id 0, error 0, details 0
[  324.332979] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: set stream: =
0
[  324.332981] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: =
STREAM_FLUSH
[  326.350292] intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time ou=
t
[  326.350303] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: stream off e=
ntity Intel IPU6 CSI2 0 pad:1 mask:0x1
[  326.350312] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: stream off C=
SI2-0 with 0 lanes
[  326.350319] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Powerdown ph=
y 0 with 0 lanes
[  326.350321] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 0
[  326.350323] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23803c =3D data 0x0
[  326.350325] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238038 =3D data 0x0
[  326.350326] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x238048 =3D data 0x0
[  326.350328] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0=
x23804c =3D data 0x2
[  326.362955] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: =
STREAM_CLOSE
[  328.366189] intel_ipu6_isys.isys intel_ipu6.isys.40: stream close time o=
ut
[  328.366768] [3240] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 1=
023 scale 5, did: value 1023 scale 2


----- On Dec 19, 2024, at 6:03 AM, Bingbu Cao bingbu.cao@linux.intel.com wr=
ote:

> Duane,
>=20
> From the driver log, I see:
> [  197.992581] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel I=
PU6
> CSI2 0 failed with -5
>=20
> The IPU6 isys driver will call the sensor driver .s_stream callback. The =
failure
> here is either from isys or sensor driver.
>=20
> Could you create /etc/modprobe.d/ipu.conf, add 2 lines below and reboot t=
o
> capture a new dmesg log?
>=20
> options intel_ipu6_isys dyndbg=3D+pt
> options ov08x40 dyndbg=3D+pt
>=20
> On 12/19/24 9:29 AM, duanek@chorus.net wrote:
>> Dear Bingbu Cao,
>>=20
>> I appreciate your help.
>>=20
>> Full disclosure: I rebooted to get you a 'clean' dmesg, but when I reboo=
ted, I
>> had to re-load the ov80x40 module
>>=20
>=20
> <--snip-->
>=20
> --
> Best regards,
> Bingbu Cao

