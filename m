Return-Path: <linux-media+bounces-23980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B939FA0D5
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 15:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA7DA1692C7
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 14:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD27A2EB00;
	Sat, 21 Dec 2024 14:00:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail2.tds.syn-alias.com (mail2.tds.syn-alias.com [129.159.94.43])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22B91F866B
	for <linux-media@vger.kernel.org>; Sat, 21 Dec 2024 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.159.94.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734789618; cv=none; b=qIYllVdqfcBsYynh4pUjcdByul7NHOWFRzi/XCJPwVgb1UDZegNsflhievj0m6PgGQjwrqxjezSpRzcF/WEjfhHYUgd86cvscVUG2S1gSRJ1YGWNjxyvetVGAHhX9DY5vhSY8DLup7nrcnQBTEk4lJjw6pxG6Q3GX+EDQIIIxKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734789618; c=relaxed/simple;
	bh=FU9hEIS30E41XAAKmEH1CZ7BjO3OY6jZVWpQJyM4Rgo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mY3xaETdFFbu+cCVWbuRL5QL0GFTVXXjNeuKFj/B8lqPov9noLd1sKbaqS71ej+yYKsPmfP8R5QifiQpLb9kEaplJiqRgeCBUWzb2/eSoKygk7tSncFWIlOd5TBi83Uu0x2fJMvtpDC8o/6ExmtSxIvDmvU+ZaP9dJtZFLLwbS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net; spf=pass smtp.mailfrom=chorus.net; arc=none smtp.client-ip=129.159.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chorus.net
X-Authed-Username: ZHVhbmVrQGNob3J1cy5uZXQ=
Received: from [10.219.153.38] ([10.219.153.38:20729] helo=md15.tds.email-ash1.sync.lan)
	by mail.tds.net (envelope-from <duanek@chorus.net>)
	(ecelerity 4.4.1.20033 r(msys-ecelerity:tags/4.4.1.0^0)) with ESMTP
	id 97/98-06351-3E9C6676; Sat, 21 Dec 2024 09:00:03 -0500
Date: Sat, 21 Dec 2024 09:00:03 -0500 (EST)
From: "duanek@chorus.net" <duanek@chorus.net>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jason Chen <jason.z.chen@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media <linux-media@vger.kernel.org>
Message-ID: <120983801.106092806.1734789603490.JavaMail.zimbra@chorus.net>
In-Reply-To: <3ad46a7f-e2c7-4b68-b6a9-6c5e093d14b2@linaro.org>
References: <20241220144130.66765-1-hdegoede@redhat.com> <b17e044e-b219-4245-9c03-88cfdce2f65f@linaro.org> <c8975cb9-3d57-4290-8ce9-7b13fd9c2639@redhat.com> <21fb2807-3886-4559-a7a0-dca3031a5388@linaro.org> <759031849.104848728.1734717736340.JavaMail.zimbra@chorus.net> <3ad46a7f-e2c7-4b68-b6a9-6c5e093d14b2@linaro.org>
Subject: Re: [PATCH v2 00/10] media: ov08x40: Various improvements
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 9.0.0_GA_4653 (ZimbraWebClient - GC131 (Linux)/9.0.0_GA_4653)
Thread-Topic: media: ov08x40: Various improvements
Thread-Index: jn2yV7IBN1vAobi0ZKEEH8L3EMVdOw==
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgeefuddruddthedgfeehucetufdoteggodetrfdotffvucfrrhho
X-Vade-Analysis-2: fhhilhgvmecuufgjpfetvefqtfdpvfffufdpgffpggdqvfffufdpqfgfvfenuceurghilhhouhhtmecu
X-Vade-Analysis-3: fedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevkfgjfhfugggt
X-Vade-Analysis-4: gfhiofhtsehtjegttdiitdejnecuhfhrohhmpedfughurghnvghksegthhhorhhushdrnhgvthdfuceo
X-Vade-Analysis-5: ughurghnvghksegthhhorhhushdrnhgvtheqnecuggftrfgrthhtvghrnheptdejudelteekudefudfg
X-Vade-Analysis-6: vefgffdtvedvffeitdefffdukeeggfevudehjedugeetnecukfhppedutddrvdduledrudehfedrfeek
X-Vade-Analysis-7: pddvtdejrddvtddtrddvvdejrdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhn
X-Vade-Analysis-8: vghtpedutddrvdduledrudehfedrfeekpdhhvghlohepmhguudehrdhtughsrdgvmhgrihhlqdgrshhh
X-Vade-Analysis-9: uddrshihnhgtrdhlrghnpdhmrghilhhfrhhomhepughurghnvghksegthhhorhhushdrnhgvthdprhgt
X-Vade-Analysis-10: phhtthhopegsrhihrghnrdhoughonhhoghhhuhgvsehlihhnrghrohdrohhrghdprhgtphhtthhopehh
X-Vade-Analysis-11: uggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehl
X-Vade-Analysis-12: ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrshhonhdriidrtghhvghnsehinhhtvghl
X-Vade-Analysis-13: rdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
X-Vade-Analysis-14: nhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpmhhtrghhohhsthepshhmthhptddu
X-Vade-Analysis-15: rdhtughsrdgvmhgrihhlqdgrshhhuddrshihnhgtrdhlrghnpdhnsggprhgtphhtthhopeeipdhishgp
X-Vade-Analysis-16: nhgrpehfrghlshgv
X-Vade-Client: TDS

Dear All,

I have tested a kernel implementing the latest patches from Hans, but the camera still does not work on my HP Spectre 16" laptop.

The output from dmesg:
[    0.000000] Linux version 6.13.0-rc2-ipu6+ (duane@DuanesSpectre16) (gcc (Debian 14.2.0-11) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241215) #1 SMP PREEMPT_DYNAMIC Fri Dec 20 20:11:57 CST 2024
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+ root=UUID=7881f7bb-dbe6-4323-887f-dd718adb7a8b ro intel_skl_int3472_discrete.dyndbg
[    0.000000] x86/split lock detection: #AC: crashing the kernel on kernel split_locks and warning on user-space split_locks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000057818fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000057819000-0x000000005ad4dfff] reserved
[    0.000000] BIOS-e820: [mem 0x000000005ad4e000-0x000000005ae6dfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000005ae6e000-0x000000005aff0fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000005aff1000-0x0000000065ffefff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000065fff000-0x0000000065ffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000066000000-0x00000000787fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000c0000000-0x00000000cfffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed7ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000087fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0x4fe69018-0x4fe78c57] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009f000-0x00000000000fffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x000000004fe69017] usable
[    0.000000] reserve setup_data: [mem 0x000000004fe69018-0x000000004fe78c57] usable
[    0.000000] reserve setup_data: [mem 0x000000004fe78c58-0x0000000057818fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000057819000-0x000000005ad4dfff] reserved
[    0.000000] reserve setup_data: [mem 0x000000005ad4e000-0x000000005ae6dfff] ACPI data
[    0.000000] reserve setup_data: [mem 0x000000005ae6e000-0x000000005aff0fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000005aff1000-0x0000000065ffefff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000065fff000-0x0000000065ffffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000066000000-0x00000000787fffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000c0000000-0x00000000cfffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed20000-0x00000000fed7ffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000087fffffff] usable
[    0.000000] efi: EFI v2.9 by American Megatrends
[    0.000000] efi: ACPI=0x5ae6d000 ACPI 2.0=0x5ae6d014 TPMFinalLog=0x5af09000 SMBIOS=0x64a28000 SMBIOS 3.0=0x64a27000 MEMATTR=0x544a7818 ESRT=0x55b40d18 MOKvar=0x65a8a000 INITRD=0x540b6598 RNG=0x5ad87018 TPMEventLog=0x5ad77018 
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem89: MMIO range=[0xc0000000-0xcfffffff] (256MB) from e820 map
[    0.000000] e820: remove [mem 0xc0000000-0xcfffffff] reserved
[    0.000000] efi: Not removing mem90: MMIO range=[0xfe000000-0xfe010fff] (68KB) from e820 map
[    0.000000] efi: Not removing mem91: MMIO range=[0xfec00000-0xfec00fff] (4KB) from e820 map
[    0.000000] efi: Not removing mem92: MMIO range=[0xfed00000-0xfed00fff] (4KB) from e820 map
[    0.000000] efi: Not removing mem94: MMIO range=[0xfee00000-0xfee00fff] (4KB) from e820 map
[    0.000000] efi: Remove mem95: MMIO range=[0xff000000-0xffffffff] (16MB) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
[    0.000000] SMBIOS 3.6.0 present.
[    0.000000] DMI: HP HP Spectre x360 2-in-1 Laptop 16t-aa000/8C17, BIOS F.11 08/14/2024
[    0.000000] DMI: Memory slots populated: 2/2
[    0.000000] tsc: Detected 3000.000 MHz processor
[    0.000000] tsc: Detected 2995.200 MHz TSC
[    0.000007] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000008] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000014] last_pfn = 0x880000 max_arch_pfn = 0x400000000
[    0.000017] MTRR map: 8 entries (3 fixed + 5 variable; max 23), built from 10 variable MTRRs
[    0.000018] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000460] x2apic: enabled by BIOS, switching to x2apic ops
[    0.000461] last_pfn = 0x66000 max_arch_pfn = 0x400000000
[    0.004895] esrt: Reserving ESRT space from 0x0000000055b40d18 to 0x0000000055b40d50.
[    0.004900] e820: update [mem 0x55b40000-0x55b40fff] usable ==> reserved
[    0.004913] Using GB pages for direct mapping
[    0.005147] Secure boot disabled
[    0.005148] RAMDISK: [mem 0x3c30b000-0x412b0fff]
[    0.005151] ACPI: Early table checksum verification disabled
[    0.005154] ACPI: RSDP 0x000000005AE6D014 000024 (v02 HPQOEM)
[    0.005156] ACPI: XSDT 0x000000005AE6C728 000194 (v01 HPQOEM SLIC-MPC 01072009 AMI  01000013)
[    0.005160] ACPI: FACP 0x000000005AE53000 000114 (v06 HPQOEM SLIC-MPC 01072009 HP   01000013)
[    0.005163] ACPI: DSDT 0x000000005ADDB000 077690 (v02 HPQOEM 8C17     01072009 ACPI 20210930)
[    0.005165] ACPI: FACS 0x000000005AFEA000 000040
[    0.005166] ACPI: SSDT 0x000000005AE6B000 000689 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005168] ACPI: SSDT 0x000000005AE6A000 0005E4 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005169] ACPI: SSDT 0x000000005AE69000 0001AB (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005171] ACPI: SSDT 0x000000005AE68000 000394 (v02 HPQOEM 8C17     00003001 ACPI 20210930)
[    0.005172] ACPI: SSDT 0x000000005AE66000 001BAF (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005173] ACPI: SSDT 0x000000005AE64000 001620 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005175] ACPI: SSDT 0x000000005AE62000 001349 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005176] ACPI: SSDT 0x000000005AE61000 000FBB (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005178] ACPI: SSDT 0x000000005AE5D000 003BC8 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005179] ACPI: DTPR 0x000000005AE5C000 000098 (v01 HPQOEM 8C17     00000000 HP   00000000)
[    0.005180] ACPI: SSDT 0x000000005AE56000 0058E1 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005182] ACPI: SSDT 0x000000005AE54000 00165F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005183] ACPI: FIDT 0x000000005ADDA000 00009C (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005185] ACPI: MSDM 0x000000005ADD9000 000055 (v03 HPQOEM SLIC-MPC 00000001 HP   00010013)
[    0.005186] ACPI: SSDT 0x000000005ADD8000 00038C (v02 HPQOEM 8C17     00000001 ACPI 20210930)
[    0.005188] ACPI: SSDT 0x000000005ADD5000 002494 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005189] ACPI: SSDT 0x000000005ADCA000 0000F9 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005190] ACPI: HPET 0x000000005ADC9000 000038 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005192] ACPI: APIC 0x000000005ADC8000 000358 (v05 HPQOEM 8C17     01072009 HP   01000013)
[    0.005193] ACPI: MCFG 0x000000005ADC7000 00003C (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005195] ACPI: SSDT 0x000000005ADC5000 00147F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005196] ACPI: SSDT 0x000000005ADC3000 00140F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005197] ACPI: SSDT 0x000000005ADB2000 01023F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005199] ACPI: UEFI 0x000000005AEF0000 000048 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005200] ACPI: NHLT 0x000000005ADB1000 000960 (v00 HPQOEM 8C17     01072009 HP   01000013)
[    0.005202] ACPI: LPIT 0x000000005ADB0000 0000CC (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005203] ACPI: SSDT 0x000000005ADAE000 000CA6 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005204] ACPI: SSDT 0x000000005ADA8000 005E42 (v02 HPQOEM 8C17     00000000 ACPI 20210930)
[    0.005206] ACPI: DBGP 0x000000005ADA7000 000034 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005207] ACPI: DBG2 0x000000005ADA6000 000054 (v00 HPQOEM 8C17     01072009 HP   01000013)
[    0.005209] ACPI: SSDT 0x000000005ADA4000 00113F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005210] ACPI: DMAR 0x000000005ADA3000 0000A8 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005211] ACPI: FPDT 0x000000005ADA2000 000044 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005213] ACPI: SSDT 0x000000005ADA0000 001021 (v02 HPQOEM 8C17     00000000 ACPI 20210930)
[    0.005214] ACPI: SSDT 0x000000005AD9D000 00281A (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005216] ACPI: SSDT 0x000000005AD9A000 0028D3 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005217] ACPI: SSDT 0x000000005AD99000 000060 (v01 HPQOEM 8C17     00000001 ACPI 20210930)
[    0.005219] ACPI: SSDT 0x000000005AD90000 0085C5 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005220] ACPI: OEM1 0x000000005AD8F000 0002B0 (v01 HPQOEM HPOEM1DC 00000000 HP   00000000)
[    0.005221] ACPI: SSDT 0x000000005AD8B000 003210 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005223] ACPI: PHAT 0x000000005AD8A000 000734 (v01 HPQOEM 8C17     00000005 HP   0100000D)
[    0.005224] ACPI: SSDT 0x000000005ADCB000 009BC2 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005226] ACPI: TPM2 0x000000005AD89000 00004C (v04 HPQOEM 8C17     00000001 HP   00000000)
[    0.005227] ACPI: WSMT 0x000000005ADAF000 000028 (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005229] ACPI: BGRT 0x000000005AD88000 000038 (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005230] ACPI: Reserving FACP table memory at [mem 0x5ae53000-0x5ae53113]
[    0.005231] ACPI: Reserving DSDT table memory at [mem 0x5addb000-0x5ae5268f]
[    0.005231] ACPI: Reserving FACS table memory at [mem 0x5afea000-0x5afea03f]
[    0.005231] ACPI: Reserving SSDT table memory at [mem 0x5ae6b000-0x5ae6b688]
[    0.005232] ACPI: Reserving SSDT table memory at [mem 0x5ae6a000-0x5ae6a5e3]
[    0.005232] ACPI: Reserving SSDT table memory at [mem 0x5ae69000-0x5ae691aa]
[    0.005233] ACPI: Reserving SSDT table memory at [mem 0x5ae68000-0x5ae68393]
[    0.005233] ACPI: Reserving SSDT table memory at [mem 0x5ae66000-0x5ae67bae]
[    0.005233] ACPI: Reserving SSDT table memory at [mem 0x5ae64000-0x5ae6561f]
[    0.005234] ACPI: Reserving SSDT table memory at [mem 0x5ae62000-0x5ae63348]
[    0.005234] ACPI: Reserving SSDT table memory at [mem 0x5ae61000-0x5ae61fba]
[    0.005234] ACPI: Reserving SSDT table memory at [mem 0x5ae5d000-0x5ae60bc7]
[    0.005235] ACPI: Reserving DTPR table memory at [mem 0x5ae5c000-0x5ae5c097]
[    0.005235] ACPI: Reserving SSDT table memory at [mem 0x5ae56000-0x5ae5b8e0]
[    0.005236] ACPI: Reserving SSDT table memory at [mem 0x5ae54000-0x5ae5565e]
[    0.005236] ACPI: Reserving FIDT table memory at [mem 0x5adda000-0x5adda09b]
[    0.005236] ACPI: Reserving MSDM table memory at [mem 0x5add9000-0x5add9054]
[    0.005237] ACPI: Reserving SSDT table memory at [mem 0x5add8000-0x5add838b]
[    0.005237] ACPI: Reserving SSDT table memory at [mem 0x5add5000-0x5add7493]
[    0.005237] ACPI: Reserving SSDT table memory at [mem 0x5adca000-0x5adca0f8]
[    0.005238] ACPI: Reserving HPET table memory at [mem 0x5adc9000-0x5adc9037]
[    0.005238] ACPI: Reserving APIC table memory at [mem 0x5adc8000-0x5adc8357]
[    0.005239] ACPI: Reserving MCFG table memory at [mem 0x5adc7000-0x5adc703b]
[    0.005239] ACPI: Reserving SSDT table memory at [mem 0x5adc5000-0x5adc647e]
[    0.005239] ACPI: Reserving SSDT table memory at [mem 0x5adc3000-0x5adc440e]
[    0.005240] ACPI: Reserving SSDT table memory at [mem 0x5adb2000-0x5adc223e]
[    0.005240] ACPI: Reserving UEFI table memory at [mem 0x5aef0000-0x5aef0047]
[    0.005240] ACPI: Reserving NHLT table memory at [mem 0x5adb1000-0x5adb195f]
[    0.005241] ACPI: Reserving LPIT table memory at [mem 0x5adb0000-0x5adb00cb]
[    0.005241] ACPI: Reserving SSDT table memory at [mem 0x5adae000-0x5adaeca5]
[    0.005242] ACPI: Reserving SSDT table memory at [mem 0x5ada8000-0x5adade41]
[    0.005242] ACPI: Reserving DBGP table memory at [mem 0x5ada7000-0x5ada7033]
[    0.005242] ACPI: Reserving DBG2 table memory at [mem 0x5ada6000-0x5ada6053]
[    0.005243] ACPI: Reserving SSDT table memory at [mem 0x5ada4000-0x5ada513e]
[    0.005243] ACPI: Reserving DMAR table memory at [mem 0x5ada3000-0x5ada30a7]
[    0.005243] ACPI: Reserving FPDT table memory at [mem 0x5ada2000-0x5ada2043]
[    0.005244] ACPI: Reserving SSDT table memory at [mem 0x5ada0000-0x5ada1020]
[    0.005244] ACPI: Reserving SSDT table memory at [mem 0x5ad9d000-0x5ad9f819]
[    0.005244] ACPI: Reserving SSDT table memory at [mem 0x5ad9a000-0x5ad9c8d2]
[    0.005245] ACPI: Reserving SSDT table memory at [mem 0x5ad99000-0x5ad9905f]
[    0.005245] ACPI: Reserving SSDT table memory at [mem 0x5ad90000-0x5ad985c4]
[    0.005246] ACPI: Reserving OEM1 table memory at [mem 0x5ad8f000-0x5ad8f2af]
[    0.005246] ACPI: Reserving SSDT table memory at [mem 0x5ad8b000-0x5ad8e20f]
[    0.005246] ACPI: Reserving PHAT table memory at [mem 0x5ad8a000-0x5ad8a733]
[    0.005247] ACPI: Reserving SSDT table memory at [mem 0x5adcb000-0x5add4bc1]
[    0.005247] ACPI: Reserving TPM2 table memory at [mem 0x5ad89000-0x5ad8904b]
[    0.005248] ACPI: Reserving WSMT table memory at [mem 0x5adaf000-0x5adaf027]
[    0.005248] ACPI: Reserving BGRT table memory at [mem 0x5ad88000-0x5ad88037]
[    0.005284] APIC: Switched APIC routing to: cluster x2apic
[    0.005481] No NUMA configuration found
[    0.005481] Faking a node at [mem 0x0000000000000000-0x000000087fffffff]
[    0.005485] NODE_DATA(0) allocated [mem 0x87ffd5680-0x87fffffff]
[    0.005648] Zone ranges:
[    0.005648]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.005650]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.005650]   Normal   [mem 0x0000000100000000-0x000000087fffffff]
[    0.005651]   Device   empty
[    0.005652] Movable zone start for each node
[    0.005653] Early memory node ranges
[    0.005653]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.005654]   node   0: [mem 0x0000000000100000-0x0000000057818fff]
[    0.005654]   node   0: [mem 0x0000000065fff000-0x0000000065ffffff]
[    0.005655]   node   0: [mem 0x0000000100000000-0x000000087fffffff]
[    0.005657] Initmem setup node 0 [mem 0x0000000000001000-0x000000087fffffff]
[    0.005661] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.005680] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.007499] On node 0, zone DMA32: 26598 pages in unavailable ranges
[    0.007724] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.008112] ACPI: PM-Timer IO Port: 0x1808
[    0.008119] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.008152] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.008154] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.008155] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.008158] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.008158] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.008165] e820: update [mem 0x5453a000-0x54563fff] usable ==> reserved
[    0.008173] TSC deadline timer available
[    0.008175] CPU topo: Max. logical packages:   1
[    0.008176] CPU topo: Max. logical dies:       1
[    0.008176] CPU topo: Max. dies per package:   1
[    0.008178] CPU topo: Max. threads per core:   2
[    0.008178] CPU topo: Num. cores per package:    16
[    0.008179] CPU topo: Num. threads per package:  22
[    0.008179] CPU topo: Allowing 22 present CPUs plus 0 hotplug CPUs
[    0.008190] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.008191] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.008192] PM: hibernation: Registered nosave memory: [mem 0x4fe69000-0x4fe69fff]
[    0.008193] PM: hibernation: Registered nosave memory: [mem 0x4fe78000-0x4fe78fff]
[    0.008194] PM: hibernation: Registered nosave memory: [mem 0x5453a000-0x54563fff]
[    0.008194] PM: hibernation: Registered nosave memory: [mem 0x55b40000-0x55b40fff]
[    0.008195] PM: hibernation: Registered nosave memory: [mem 0x57819000-0x5ad4dfff]
[    0.008195] PM: hibernation: Registered nosave memory: [mem 0x5ad4e000-0x5ae6dfff]
[    0.008196] PM: hibernation: Registered nosave memory: [mem 0x5ae6e000-0x5aff0fff]
[    0.008196] PM: hibernation: Registered nosave memory: [mem 0x5aff1000-0x65ffefff]
[    0.008197] PM: hibernation: Registered nosave memory: [mem 0x66000000-0x787fffff]
[    0.008197] PM: hibernation: Registered nosave memory: [mem 0x78800000-0xfdffffff]
[    0.008198] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.008198] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.008198] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.008199] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.008199] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.008199] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed1ffff]
[    0.008200] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfed7ffff]
[    0.008200] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xfedfffff]
[    0.008200] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.008201] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xffffffff]
[    0.008202] [mem 0x78800000-0xfdffffff] available for PCI devices
[    0.008202] Booting paravirtualized kernel on bare hardware
[    0.008204] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.011547] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:22 nr_cpu_ids:22 nr_node_ids:1
[    0.012872] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.012879] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=1*2097152
[    0.012881] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07 
[    0.012884] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15 
[    0.012886] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 -- -- 
[    0.012897] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+ root=UUID=7881f7bb-dbe6-4323-887f-dd718adb7a8b ro intel_skl_int3472_discrete.dyndbg
[    0.012929] Unknown kernel command line parameters "BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+", will be passed to user space.
[    0.012938] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.012939] printk: log_buf_len total cpu_extra contributions: 86016 bytes
[    0.012939] printk: log_buf_len min size: 131072 bytes
[    0.013085] printk: log buffer data + meta data: 262144 + 917504 = 1179648 bytes
[    0.013086] printk: early log buf free: 112520(85%)
[    0.015676] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.016986] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.017151] Fallback order for Node 0: 0 
[    0.017156] Built 1 zonelists, mobility grouping on.  Total pages: 8222648
[    0.017157] Policy zone: Normal
[    0.017165] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.017176] software IO TLB: area num 32.
[    0.032470] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=22, Nodes=1
[    0.032519] ftrace: allocating 45850 entries in 180 pages
[    0.043501] ftrace: allocated 180 pages with 4 groups
[    0.044061] Dynamic Preempt: voluntary
[    0.044127] rcu: Preemptible hierarchical RCU implementation.
[    0.044127] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=22.
[    0.044128] 	Trampoline variant of Tasks RCU enabled.
[    0.044129] 	Rude variant of Tasks RCU enabled.
[    0.044129] 	Tracing variant of Tasks RCU enabled.
[    0.044129] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.044130] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=22
[    0.044140] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.044142] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.044143] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.046613] NR_IRQS: 524544, nr_irqs: 2232, preallocated irqs: 16
[    0.046903] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.047076] Console: colour dummy device 80x25
[    0.047078] printk: legacy console [tty0] enabled
[    0.047298] ACPI: Core revision 20240827
[    0.047610] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.047703] APIC: Switch to symmetric I/O mode setup
[    0.047706] DMAR: Host address width 42
[    0.047707] DMAR: DRHD base: 0x000000fc800000 flags: 0x0
[    0.047714] DMAR: dmar0: reg_base_addr fc800000 ver 7:0 cap c9de008cee690462 ecap 12ca9a00f0ef5e
[    0.047717] DMAR: DRHD base: 0x000000fc801000 flags: 0x1
[    0.047722] DMAR: dmar1: reg_base_addr fc801000 ver 7:0 cap c9de008cee690462 ecap 12ca9a00f0efde
[    0.047725] DMAR: SATC flags: 0x1
[    0.047727] DMAR-IR: IOAPIC id 2 under DRHD base  0xfc801000 IOMMU 1
[    0.047729] DMAR-IR: HPET id 0 under DRHD base 0xfc801000
[    0.047730] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.049332] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.053292] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.053300] Calibrating delay loop (skipped), value calculated using timer frequency.. 5990.40 BogoMIPS (lpj=11980800)
[    0.053357] CPU0: Thermal monitoring enabled (TM1)
[    0.053359] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.053530] CET detected: Indirect Branch Tracking enabled
[    0.053531] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.053533] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.053536] process: using mwait in idle threads
[    0.053538] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.053540] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.053542] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.053544] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.053546] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.053555] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.053556] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.053557] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.053559] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.053560] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
[    0.053562] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.053563] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.053564] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.053566] x86/fpu: Enabled xstate features 0xa07, context size is 856 bytes, using 'compacted' format.
[    0.057298] Freeing SMP alternatives memory: 40K
[    0.057298] pid_max: default: 32768 minimum: 301
[    0.057298] LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor,tomoyo,bpf,ima,evm
[    0.057298] landlock: Up and running.
[    0.057298] Yama: becoming mindful.
[    0.057298] AppArmor: AppArmor initialized
[    0.057298] TOMOYO Linux initialized
[    0.057298] LSM support for eBPF active
[    0.057298] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.057298] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.057298] smpboot: CPU0: Intel(R) Core(TM) Ultra 7 155H (family: 0x6, model: 0xaa, stepping: 0x4)
[    0.057298] Performance Events: XSAVE Architectural LBR, PEBS fmt4+-baseline,  AnyThread deprecated, Meteorlake Hybrid events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.057298] core: cpu_core PMU driver: 
[    0.057298] ... version:                5
[    0.057298] ... bit width:              48
[    0.057298] ... generic registers:      8
[    0.057298] ... value mask:             0000ffffffffffff
[    0.057298] ... max period:             00007fffffffffff
[    0.057298] ... fixed-purpose events:   4
[    0.057298] ... event mask:             0001000f000000ff
[    0.057298] signal: max sigframe size: 3632
[    0.057298] Estimated ratio of average max frequency by base frequency (times 1024): 1638
[    0.057298] rcu: Hierarchical SRCU implementation.
[    0.057298] rcu: 	Max phase no-delay instances is 1000.
[    0.057298] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.057298] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.057298] smp: Bringing up secondary CPUs ...
[    0.057298] smpboot: x86: Booting SMP configuration:
[    0.057298] .... node  #0, CPUs:        #1  #3  #6  #8 #10 #12 #13 #14 #15 #16 #17 #18 #19 #20 #21
[    0.010262] core: cpu_atom PMU driver: PEBS-via-PT 
[    0.010262] ... version:                5
[    0.010262] ... bit width:              48
[    0.010262] ... generic registers:      8
[    0.010262] ... value mask:             0000ffffffffffff
[    0.010262] ... max period:             00007fffffffffff
[    0.010262] ... fixed-purpose events:   3
[    0.010262] ... event mask:             00000007000000ff
[    0.069323]   #2  #4  #5  #7  #9 #11
[    0.111126] smp: Brought up 1 node, 22 CPUs
[    0.111126] smpboot: Total of 22 processors activated (131788.80 BogoMIPS)
[    0.132406] node 0 deferred pages initialised in 16ms
[    0.132408] Memory: 32107260K/32890592K available (16384K kernel code, 2504K rwdata, 6904K rodata, 4148K init, 4924K bss, 762392K reserved, 0K cma-reserved)
[    0.134113] devtmpfs: initialized
[    0.134113] x86/mm: Memory block size: 128MB
[    0.134658] ACPI: PM: Registering ACPI NVS region [mem 0x5ae6e000-0x5aff0fff] (1585152 bytes)
[    0.134658] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.134658] futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
[    0.134658] pinctrl core: initialized pinctrl subsystem
[    0.134658] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.134658] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.134694] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.137404] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.137413] audit: initializing netlink subsys (disabled)
[    0.137420] audit: type=2000 audit(1734788178.084:1): state=initialized audit_enabled=0 res=1
[    0.137428] thermal_sys: Registered thermal governor 'fair_share'
[    0.137429] thermal_sys: Registered thermal governor 'bang_bang'
[    0.137432] thermal_sys: Registered thermal governor 'step_wise'
[    0.137433] thermal_sys: Registered thermal governor 'user_space'
[    0.137434] thermal_sys: Registered thermal governor 'power_allocator'
[    0.137441] cpuidle: using governor ladder
[    0.137441] cpuidle: using governor menu
[    0.137441] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.137441] PCI: ECAM [mem 0xc0000000-0xcfffffff] (base 0xc0000000) for domain 0000 [bus 00-ff]
[    0.137441] PCI: Using configuration type 1 for base access
[    0.137473] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.137473] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.137473] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.137473] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.137473] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.137473] ACPI: Added _OSI(Module Device)
[    0.137473] ACPI: Added _OSI(Processor Device)
[    0.137473] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.137473] ACPI: Added _OSI(Processor Aggregator Device)
[    0.199203] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PACT], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199208] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199210] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PABN], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199213] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199214] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PAS1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199216] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199220] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PMP0], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199222] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199231] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PMP1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199234] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199242] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA01], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199245] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199246] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.199248] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA02], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199250] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199252] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.199254] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA03], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199256] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199257] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.199259] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA04], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199261] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199262] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.199264] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA05], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199266] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199267] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.199269] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA06], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199271] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199272] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.199274] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA07], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199276] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199277] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.199279] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA08], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.199281] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.199282] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.200077] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.I2C3.TPD0], AE_NOT_FOUND (20240827/dswload2-162)
[    0.200079] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.200081] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.205435] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS01], AE_NOT_FOUND (20240827/dswload2-162)
[    0.205438] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.205440] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.205442] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS02], AE_NOT_FOUND (20240827/dswload2-162)
[    0.205444] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.205446] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.205448] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS03], AE_NOT_FOUND (20240827/dswload2-162)
[    0.205450] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.205452] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.205453] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS04], AE_NOT_FOUND (20240827/dswload2-162)
[    0.205456] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.205457] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.205474] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205477] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205478] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205480] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205482] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205484] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205487] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205490] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205491] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205493] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205495] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205496] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205500] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS03._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205502] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205504] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205505] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS03._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205507] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205509] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205512] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS04._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205514] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205516] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205517] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS04._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205520] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205521] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205524] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS05._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205527] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205528] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205530] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS05._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205532] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205533] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205537] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS06._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205539] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205540] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205542] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS06._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205544] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205546] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205549] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS07._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205551] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205552] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205554] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS07._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205556] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205558] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205561] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS08._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205563] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205564] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205566] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS08._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205568] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205570] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205573] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS09._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205575] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205577] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205578] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS09._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205580] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205582] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205585] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS10._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205588] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205589] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205591] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS10._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205593] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205594] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205649] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205652] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205653] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205655] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205657] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205659] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205662] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205664] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205666] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.205667] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.205670] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.205671] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.212199] ACPI: 28 ACPI AML tables successfully acquired and loaded
[    0.221683] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomain+
[    0.221687] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomain+
[    0.225357] ACPI: EC: EC started
[    0.225358] ACPI: EC: interrupt blocked
[    0.231464] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.231466] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC used to handle transactions
[    0.231468] ACPI: Interpreter enabled
[    0.231510] ACPI: PM: (supports S0 S3 S4 S5)
[    0.231512] ACPI: Using IOAPIC for interrupt routing
[    0.231549] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.231550] PCI: Ignoring E820 reservations for host bridge windows
[    0.233059] ACPI: Enabled 10 GPEs in block 00 to 7F
[    0.233078] ACPI: Enabled 8 GPEs in block 80 to DF
[    0.234628] ACPI: \_SB_.PC00.RP01.PXP_: New power resource
[    0.237511] ACPI: \_SB_.PC00.RP06.PXP_: New power resource
[    0.238390] ACPI: \_SB_.PC00.RP07.PXP_: New power resource
[    0.239867] ACPI: \_SB_.PC00.RP09.PXP_: New power resource
[    0.240563] ACPI: \_SB_.PC00.RP10.PXP_: New power resource
[    0.241371] ACPI: \_SB_.PC00.RP11.PXP_: New power resource
[    0.242325] ACPI: \_SB_.PC00.RP12.PXP_: New power resource
[    0.244313] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.BTRT: New power resource
[    0.244344] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.DBTR: New power resource
[    0.244425] ACPI: \_SB_.PC00.PAUD: New power resource
[    0.247504] ACPI: \_SB_.PC00.I2C3.PXTC: New power resource
[    0.250964] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.260523] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.260558] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.260589] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.271178] ACPI: \PIN_: New power resource
[    0.271594] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-fe])
[    0.271598] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.272294] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.273652] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME PCIeCapability LTR]
[    0.274797] PCI host bridge to bus 0000:00
[    0.274799] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.274801] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.274802] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.274804] pci_bus 0000:00: root bus resource [mem 0x80000000-0xbfffffff window]
[    0.274805] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x3ffbfffffff window]
[    0.274807] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.276043] pci 0000:00:00.0: [8086:7d01] type 00 class 0x060000 conventional PCI endpoint
[    0.276157] pci 0000:00:02.0: [8086:7d55] type 00 class 0x030000 PCIe Root Complex Integrated Endpoint
[    0.276168] pci 0000:00:02.0: BAR 0 [mem 0x5220000000-0x5220ffffff 64bit pref]
[    0.276177] pci 0000:00:02.0: BAR 2 [mem 0x4210000000-0x421fffffff 64bit pref]
[    0.276205] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.276209] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.276242] pci 0000:00:02.0: PME# supported from D0 D3hot
[    0.276259] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit pref]
[    0.276261] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit pref]: contains BAR 0 for 7 VFs
[    0.276402] pci 0000:00:04.0: [8086:7d03] type 00 class 0x118000 conventional PCI endpoint
[    0.276417] pci 0000:00:04.0: BAR 0 [mem 0x52312c0000-0x52312dffff 64bit]
[    0.276579] pci 0000:00:05.0: [8086:7d19] type 00 class 0x048000 PCIe Root Complex Integrated Endpoint
[    0.276587] pci 0000:00:05.0: BAR 0 [mem 0x5230000000-0x5230ffffff 64bit]
[    0.276602] pci 0000:00:05.0: enabling Extended Tags
[    0.276696] pci 0000:00:06.0: [8086:7ecb] type 01 class 0x060400 PCIe Root Port
[    0.276720] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.276725] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff]
[    0.276803] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.276845] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.277288] pci 0000:00:07.0: [8086:7ec4] type 01 class 0x060400 PCIe Root Port
[    0.277318] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.277323] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff]
[    0.277332] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.277422] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.277453] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.277926] pci 0000:00:07.2: [8086:7ec6] type 01 class 0x060400 PCIe Root Port
[    0.277951] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.277956] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff]
[    0.277965] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.278052] pci 0000:00:07.2: PME# supported from D0 D3hot D3cold
[    0.278082] pci 0000:00:07.2: PTM enabled (root), 4ns granularity
[    0.278543] pci 0000:00:08.0: [8086:7e4c] type 00 class 0x088000 conventional PCI endpoint
[    0.278556] pci 0000:00:08.0: BAR 0 [mem 0x5231327000-0x5231327fff 64bit]
[    0.278649] pci 0000:00:0a.0: [8086:7d0d] type 00 class 0x118000 PCIe Root Complex Integrated Endpoint
[    0.278657] pci 0000:00:0a.0: BAR 0 [mem 0x5231280000-0x52312bffff 64bit]
[    0.278672] pci 0000:00:0a.0: enabling Extended Tags
[    0.278732] pci 0000:00:0b.0: [8086:7d1d] type 00 class 0x120000 PCIe Root Complex Integrated Endpoint
[    0.278741] pci 0000:00:0b.0: BAR 0 [mem 0x5228000000-0x522fffffff 64bit]
[    0.278753] pci 0000:00:0b.0: BAR 4 [mem 0x5231326000-0x5231326fff 64bit]
[    0.278856] pci 0000:00:0d.0: [8086:7ec0] type 00 class 0x0c0330 conventional PCI endpoint
[    0.278870] pci 0000:00:0d.0: BAR 0 [mem 0x5231300000-0x523130ffff 64bit]
[    0.278927] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.279175] pci 0000:00:0d.2: [8086:7ec2] type 00 class 0x0c0340 conventional PCI endpoint
[    0.279188] pci 0000:00:0d.2: BAR 0 [mem 0x5231240000-0x523127ffff 64bit]
[    0.279198] pci 0000:00:0d.2: BAR 2 [mem 0x5231325000-0x5231325fff 64bit]
[    0.279238] pci 0000:00:0d.2: supports D1 D2
[    0.279239] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.279298] pci 0000:00:0d.3: [8086:7ec3] type 00 class 0x0c0340 conventional PCI endpoint
[    0.279311] pci 0000:00:0d.3: BAR 0 [mem 0x5231200000-0x523123ffff 64bit]
[    0.279321] pci 0000:00:0d.3: BAR 2 [mem 0x5231324000-0x5231324fff 64bit]
[    0.279361] pci 0000:00:0d.3: supports D1 D2
[    0.279362] pci 0000:00:0d.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.279444] pci 0000:00:12.0: [8086:7e45] type 00 class 0x070000 conventional PCI endpoint
[    0.279457] pci 0000:00:12.0: BAR 0 [mem 0x52312f0000-0x52312fffff 64bit]
[    0.279505] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.279928] pci 0000:00:14.0: [8086:7e7d] type 00 class 0x0c0330 conventional PCI endpoint
[    0.279942] pci 0000:00:14.0: BAR 0 [mem 0x52312e0000-0x52312effff 64bit]
[    0.279997] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.280237] pci 0000:00:14.2: [8086:7e7f] type 00 class 0x050000 conventional PCI endpoint
[    0.280253] pci 0000:00:14.2: BAR 0 [mem 0x5231318000-0x523131bfff 64bit]
[    0.280264] pci 0000:00:14.2: BAR 2 [mem 0x5231323000-0x5231323fff 64bit]
[    0.280358] pci 0000:00:14.3: [8086:7e40] type 00 class 0x028000 PCIe Root Complex Integrated Endpoint
[    0.280369] pci 0000:00:14.3: BAR 0 [mem 0x5231314000-0x5231317fff 64bit]
[    0.280423] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.280596] pci 0000:00:15.0: [8086:7e78] type 00 class 0x0c8000 conventional PCI endpoint
[    0.280625] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.280865] pci 0000:00:15.1: [8086:7e79] type 00 class 0x0c8000 conventional PCI endpoint
[    0.280886] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.281166] pci 0000:00:15.3: [8086:7e7b] type 00 class 0x0c8000 conventional PCI endpoint
[    0.281187] pci 0000:00:15.3: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.281263] pci 0000:00:16.0: [8086:7e70] type 00 class 0x078000 conventional PCI endpoint
[    0.281263] pci 0000:00:16.0: BAR 0 [mem 0x523131f000-0x523131ffff 64bit]
[    0.281263] pci 0000:00:16.0: PME# supported from D3hot
[    0.281263] pci 0000:00:19.0: [8086:7e50] type 00 class 0x0c8000 conventional PCI endpoint
[    0.281263] pci 0000:00:19.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.281263] pci 0000:00:19.1: [8086:7e51] type 00 class 0x0c8000 conventional PCI endpoint
[    0.281263] pci 0000:00:19.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.281263] pci 0000:00:1c.0: [8086:7e38] type 01 class 0x060400 PCIe Root Port
[    0.281263] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.281263] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.281263] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff]
[    0.281263] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.281263] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.281263] pci 0000:00:1c.0: PTM enabled (root), 4ns granularity
[    0.281263] pci 0000:00:1f.0: [8086:7e02] type 00 class 0x060100 conventional PCI endpoint
[    0.281263] pci 0000:00:1f.3: [8086:7e28] type 00 class 0x040100 conventional PCI endpoint
[    0.281263] pci 0000:00:1f.3: BAR 0 [mem 0x5231310000-0x5231313fff 64bit]
[    0.281263] pci 0000:00:1f.3: BAR 4 [mem 0x5231000000-0x52311fffff 64bit]
[    0.281263] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.281263] pci 0000:00:1f.4: [8086:7e22] type 00 class 0x0c0500 conventional PCI endpoint
[    0.281263] pci 0000:00:1f.4: BAR 0 [mem 0x523131c000-0x523131c0ff 64bit]
[    0.281263] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.281263] pci 0000:00:1f.5: [8086:7e23] type 00 class 0x0c8000 conventional PCI endpoint
[    0.281263] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.281410] pci 0000:01:00.0: [1c5c:1959] type 00 class 0x010802 PCIe Endpoint
[    0.281431] pci 0000:01:00.0: BAR 0 [mem 0x8d200000-0x8d203fff 64bit]
[    0.281732] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.281783] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.281836] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.281893] pci 0000:56:00.0: [10de:28a1] type 00 class 0x030000 PCIe Legacy Endpoint
[    0.281907] pci 0000:56:00.0: BAR 0 [mem 0x8c000000-0x8cffffff]
[    0.281918] pci 0000:56:00.0: BAR 1 [mem 0x4000000000-0x41ffffffff 64bit pref]
[    0.281930] pci 0000:56:00.0: BAR 3 [mem 0x4200000000-0x4201ffffff 64bit pref]
[    0.281938] pci 0000:56:00.0: BAR 5 [io  0x3000-0x307f]
[    0.281945] pci 0000:56:00.0: ROM [mem 0x8d000000-0x8d07ffff pref]
[    0.282009] pci 0000:56:00.0: PME# supported from D0 D3hot
[    0.282089] pci 0000:56:00.0: 63.012 Gb/s available PCIe bandwidth, limited by 16.0 GT/s PCIe x4 link at 0000:00:1c.0 (capable of 126.024 Gb/s with 16.0 GT/s PCIe x8 link)
[    0.282286] pci 0000:56:00.1: [10de:22be] type 00 class 0x040300 PCIe Endpoint
[    0.282299] pci 0000:56:00.1: BAR 0 [mem 0x8d080000-0x8d083fff]
[    0.282437] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.286888] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.287025] ACPI: PCI: Interrupt link LNKB configured for IRQ 1
[    0.287158] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.287290] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.287421] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.287553] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.287685] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.287817] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.288757] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x1)
[    0.424924] Low-power S0 idle used by default for system suspend
[    0.434731] ACPI: EC: interrupt unblocked
[    0.434735] ACPI: EC: event unblocked
[    0.434756] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.434758] ACPI: EC: GPE=0x6e
[    0.434760] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC initialization complete
[    0.434763] ACPI: \_SB_.PC00.LPCB.EC0_: EC: Used to handle transactions and events
[    0.437315] iommu: Default domain type: Translated
[    0.437315] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.437418] pps_core: LinuxPPS API ver. 1 registered
[    0.437421] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.437425] PTP clock support registered
[    0.437437] EDAC MC: Ver: 3.0.0
[    0.437656] efivars: Registered efivars operations
[    0.437656] NetLabel: Initializing
[    0.437656] NetLabel:  domain hash size = 128
[    0.437656] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.437656] NetLabel:  unlabeled traffic allowed by default
[    0.437656] PCI: Using ACPI for IRQ routing
[    0.446810] PCI: pci_cache_line_size set to 64 bytes
[    0.446956] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't claim; no compatible bridge window
[    0.447078] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.447079] e820: reserve RAM buffer [mem 0x4fe69018-0x4fffffff]
[    0.447080] e820: reserve RAM buffer [mem 0x5453a000-0x57ffffff]
[    0.447081] e820: reserve RAM buffer [mem 0x55b40000-0x57ffffff]
[    0.447082] e820: reserve RAM buffer [mem 0x57819000-0x57ffffff]
[    0.447083] e820: reserve RAM buffer [mem 0x66000000-0x67ffffff]
[    0.449354] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.449354] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.449354] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.449354] pci 0000:56:00.0: vgaarb: bridge control possible
[    0.449354] pci 0000:56:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.449354] vgaarb: loaded
[    0.449385] clocksource: Switched to clocksource tsc-early
[    0.449530] VFS: Disk quotas dquot_6.6.0
[    0.449540] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.449666] AppArmor: AppArmor Filesystem Enabled
[    0.449680] pnp: PnP ACPI init
[    0.449871] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.449875] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.450013] system 00:01: [io  0x1854-0x1857] has been reserved
[    0.450727] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.450733] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.450760] system 00:03: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    0.450763] system 00:03: [mem 0xc0000000-0xcfffffff] has been reserved
[    0.450766] system 00:03: [mem 0xfed20000-0xfed7ffff] could not be reserved
[    0.450769] system 00:03: [mem 0xfc800000-0xfc81ffff] could not be reserved
[    0.450771] system 00:03: [mem 0xfed45000-0xfed8ffff] could not be reserved
[    0.450774] system 00:03: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.452253] system 00:04: [io  0x2000-0x20fe] has been reserved
[    0.452565] system 00:05: [mem 0xfe02c008-0xfe02cfff] has been reserved
[    0.452569] system 00:05: [mem 0xfe02d000-0xfe02dfff] has been reserved
[    0.453981] pnp: PnP ACPI: found 6 devices
[    0.459608] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.459679] NET: Registered PF_INET protocol family
[    0.459907] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.463017] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.463064] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.463281] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.463691] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.463802] TCP: Hash tables configured (established 262144 bind 65536)
[    0.463987] MPTCP token hash table entries: 32768 (order: 7, 786432 bytes, linear)
[    0.464140] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.464314] UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.464429] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.464438] NET: Registered PF_XDP protocol family
[    0.464444] pci_bus 0000:00: max bus depth: 1 pci_try_num: 2
[    0.464456] pci 0000:00:02.0: VF BAR 0 [mem 0x4202000000-0x4208ffffff 64bit pref]: assigned
[    0.464463] pci 0000:00:07.0: bridge window [io  0x4000-0x4fff]: assigned
[    0.464466] pci 0000:00:07.2: bridge window [io  0x5000-0x5fff]: assigned
[    0.464470] pci 0000:00:15.0: BAR 0 [mem 0x4209000000-0x4209000fff 64bit]: assigned
[    0.464510] pci 0000:00:15.1: BAR 0 [mem 0x4209001000-0x4209001fff 64bit]: assigned
[    0.464556] pci 0000:00:15.3: BAR 0 [mem 0x4209002000-0x4209002fff 64bit]: assigned
[    0.464603] pci 0000:00:19.0: BAR 0 [mem 0x4209003000-0x4209003fff 64bit]: assigned
[    0.464650] pci 0000:00:19.1: BAR 0 [mem 0x4209004000-0x4209004fff 64bit]: assigned
[    0.464697] pci 0000:00:1f.5: BAR 0 [mem 0x8d100000-0x8d100fff]: assigned
[    0.464709] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.464716] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff]
[    0.464723] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.464730] pci 0000:00:07.0:   bridge window [io  0x4000-0x4fff]
[    0.464735] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff]
[    0.464739] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.464745] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.464748] pci 0000:00:07.2:   bridge window [io  0x5000-0x5fff]
[    0.464752] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff]
[    0.464756] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.464764] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.464766] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.464770] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff]
[    0.464774] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.464780] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.464782] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.464784] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.464787] pci_bus 0000:00: resource 7 [mem 0x80000000-0xbfffffff window]
[    0.464789] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x3ffbfffffff window]
[    0.464792] pci_bus 0000:01: resource 1 [mem 0x8d200000-0x8d2fffff]
[    0.464794] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.464796] pci_bus 0000:02: resource 1 [mem 0x86000000-0x8bffffff]
[    0.464798] pci_bus 0000:02: resource 2 [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.464801] pci_bus 0000:2c: resource 0 [io  0x5000-0x5fff]
[    0.464803] pci_bus 0000:2c: resource 1 [mem 0x80000000-0x85ffffff]
[    0.464805] pci_bus 0000:2c: resource 2 [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.464808] pci_bus 0000:56: resource 0 [io  0x3000-0x3fff]
[    0.464810] pci_bus 0000:56: resource 1 [mem 0x8c000000-0x8d0fffff]
[    0.464812] pci_bus 0000:56: resource 2 [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.465378] pci 0000:56:00.1: extending delay after power-on from D3hot to 20 msec
[    0.465406] pci 0000:56:00.1: D0 power state depends on 0000:56:00.0
[    0.465413] PCI: CLS 64 bytes, default 64
[    0.465476] DMAR: Intel-IOMMU force enabled due to platform opt in
[    0.465486] DMAR: No RMRR found
[    0.465488] DMAR: No ATSR found
[    0.465490] DMAR: IOMMU feature sc_support inconsistent
[    0.465492] DMAR: dmar0: Using Queued invalidation
[    0.465498] DMAR: dmar1: Using Queued invalidation
[    0.465522] Trying to unpack rootfs image as initramfs...
[    0.465893] pci 0000:00:02.0: Adding to iommu group 0
[    0.465931] pci 0000:00:00.0: Adding to iommu group 1
[    0.465942] pci 0000:00:04.0: Adding to iommu group 2
[    0.465954] pci 0000:00:05.0: Adding to iommu group 3
[    0.465988] pci 0000:00:06.0: Adding to iommu group 4
[    0.466008] pci 0000:00:07.0: Adding to iommu group 5
[    0.466020] pci 0000:00:07.2: Adding to iommu group 6
[    0.466031] pci 0000:00:08.0: Adding to iommu group 7
[    0.466042] pci 0000:00:0a.0: Adding to iommu group 8
[    0.466054] pci 0000:00:0b.0: Adding to iommu group 9
[    0.466076] pci 0000:00:0d.0: Adding to iommu group 10
[    0.466088] pci 0000:00:0d.2: Adding to iommu group 10
[    0.466099] pci 0000:00:0d.3: Adding to iommu group 10
[    0.466114] pci 0000:00:12.0: Adding to iommu group 11
[    0.466132] pci 0000:00:14.0: Adding to iommu group 12
[    0.466143] pci 0000:00:14.2: Adding to iommu group 12
[    0.466155] pci 0000:00:14.3: Adding to iommu group 13
[    0.466176] pci 0000:00:15.0: Adding to iommu group 14
[    0.466189] pci 0000:00:15.1: Adding to iommu group 14
[    0.466200] pci 0000:00:15.3: Adding to iommu group 14
[    0.466215] pci 0000:00:16.0: Adding to iommu group 15
[    0.466236] pci 0000:00:19.0: Adding to iommu group 16
[    0.466248] pci 0000:00:19.1: Adding to iommu group 16
[    0.466260] pci 0000:00:1c.0: Adding to iommu group 17
[    0.466293] pci 0000:00:1f.0: Adding to iommu group 18
[    0.466306] pci 0000:00:1f.3: Adding to iommu group 18
[    0.466320] pci 0000:00:1f.4: Adding to iommu group 18
[    0.466332] pci 0000:00:1f.5: Adding to iommu group 18
[    0.466365] pci 0000:01:00.0: Adding to iommu group 19
[    0.466387] pci 0000:56:00.0: Adding to iommu group 20
[    0.466401] pci 0000:56:00.1: Adding to iommu group 20
[    0.466770] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.466772] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.466774] software IO TLB: mapped [mem 0x00000000480b8000-0x000000004c0b8000] (64MB)
[    0.466806] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.466843] clocksource: Switched to clocksource tsc
[    0.466866] platform rtc_cmos: registered platform RTC device (no PNP device found)
[    0.470790] Initialise system trusted keyrings
[    0.470802] Key type blacklist registered
[    0.470838] workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.470847] zbud: loaded
[    0.470942] fuse: init (API version 7.41)
[    0.471067] integrity: Platform Keyring initialized
[    0.471072] integrity: Machine keyring initialized
[    0.480257] Key type asymmetric registered
[    0.480261] Asymmetric key parser 'x509' registered
[    0.978371] Freeing initrd memory: 81560K
[    0.982966] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
[    0.983014] io scheduler mq-deadline registered
[    0.984611] ledtrig-cpu: registered to indicate activity on CPUs
[    0.985381] pcieport 0000:00:06.0: PME: Signaling with IRQ 122
[    0.985825] pcieport 0000:00:07.0: PME: Signaling with IRQ 123
[    0.985848] pcieport 0000:00:07.0: pciehp: Slot #12 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.986181] pcieport 0000:00:07.2: PME: Signaling with IRQ 124
[    0.986207] pcieport 0000:00:07.2: pciehp: Slot #14 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.986513] pcieport 0000:00:1c.0: PME: Signaling with IRQ 125
[    0.986615] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.999001] ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-274000)
[    1.001527] thermal LNXTHERM:00: registered as thermal_zone0
[    1.001530] ACPI: thermal: Thermal Zone [TZ01] (48 C)
[    1.001681] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.001991] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    1.002317] hpet_acpi_add: no address or irqs in _CRS
[    1.002338] Linux agpgart interface v0.103
[    1.004212] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1D, rev-id 54)
[    1.119372] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    1.119379] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    1.120514] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.120757] mousedev: PS/2 mouse device common for all mice
[    1.120774] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.121549] rtc_cmos rtc_cmos: registered as rtc0
[    1.121679] rtc_cmos rtc_cmos: setting system clock to 2024-12-21T13:36:19 UTC (1734788179)
[    1.121703] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nvram
[    1.123610] intel_pstate: Intel P-state driver initializing
[    1.128486] intel_pstate: HWP enabled
[    1.128587] efifb: probing for efifb
[    1.128593] efifb: framebuffer at 0x70800000, using 20252k, total 20250k
[    1.128595] efifb: mode is 2880x1800x32, linelength=11520, pages=1
[    1.128596] efifb: scrolling: redraw
[    1.128597] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    1.130176] Console: switching to colour frame buffer device 180x56
[    1.131717] fb0: EFI VGA frame buffer device
[    1.131839] NET: Registered PF_INET6 protocol family
[    1.135406] Segment Routing with IPv6
[    1.135418] In-situ OAM (IOAM) with IPv6
[    1.135438] mip6: Mobile IPv6
[    1.135446] NET: Registered PF_PACKET protocol family
[    1.135479] mpls_gso: MPLS GSO support
[    1.137987] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.138899] microcode: Current revision: 0x00000020
[    1.138919] microcode: Updated early from: 0x0000001f
[    1.141105] IPI shorthand broadcast: enabled
[    1.142123] sched_clock: Marking stable (1134930021, 6262491)->(1187055438, -45862926)
[    1.142707] registered taskstats version 1
[    1.142818] Loading compiled-in X.509 certificates
[    1.159181] Loaded X.509 cert 'Build time autogenerated kernel key: 24a2ef881874b1f607ad746af78b458b87f50423'
[    1.160425] Demotion targets for Node 0: null
[    1.160960] Key type .fscrypt registered
[    1.160975] Key type fscrypt-provisioning registered
[    1.173904] Key type encrypted registered
[    1.173924] AppArmor: AppArmor sha256 policy hashing enabled
[    1.174231] integrity: Loading X.509 certificate: UEFI:db
[    1.174325] integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    1.174361] integrity: Loading X.509 certificate: UEFI:db
[    1.174390] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
[    1.174414] integrity: Loading X.509 certificate: UEFI:db
[    1.174437] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    1.174465] integrity: Loading X.509 certificate: UEFI:db
[    1.174488] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.174515] integrity: Loading X.509 certificate: UEFI:db
[    1.174538] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.175943] ima: Allocated hash algorithm: sha256
[    1.185193] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    1.333356] ima: No architecture policies found
[    1.334098] evm: Initialising EVM extended attributes:
[    1.334818] evm: security.selinux
[    1.335532] evm: security.SMACK64 (disabled)
[    1.336243] evm: security.SMACK64EXEC (disabled)
[    1.336948] evm: security.SMACK64TRANSMUTE (disabled)
[    1.337648] evm: security.SMACK64MMAP (disabled)
[    1.338343] evm: security.apparmor
[    1.339024] evm: security.ima
[    1.339694] evm: security.capability
[    1.340359] evm: HMAC attrs: 0x1
[    1.343230] RAS: Correctable Errors collector initialized.
[    1.344161] clk: Disabling unused clocks
[    1.345062] PM: genpd: Disabling unused power domains
[    1.348608] Freeing unused decrypted memory: 2028K
[    1.350229] Freeing unused kernel image (initmem) memory: 4148K
[    1.351139] Write protecting the kernel read-only data: 24576k
[    1.353045] Freeing unused kernel image (rodata/data gap) memory: 1288K
[    1.358616] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.359144] Run /init as init process
[    1.359666]   with arguments:
[    1.359667]     /init
[    1.359667]   with environment:
[    1.359668]     HOME=/
[    1.359668]     TERM=linux
[    1.359669]     BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+
[    1.419828] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    1.420416] ACPI: button: Sleep Button [SLPB]
[    1.420984] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
[    1.421747] ACPI: button: Lid Switch [LID0]
[    1.422471] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input3
[    1.425618] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    1.427108] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    1.428538] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 7391A661-223A-47DB-A77A-7BE84C60822D has zero instances
[    1.430142] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: DF4E63B6-3BBC-4858-9737-C74F82F821F3 has zero instances
[    1.437496] ACPI: bus type thunderbolt registered
[    1.437836] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    1.439247] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    1.445211] ACPI: bus type drm_connector registered
[    1.446300] ACPI: button: Power Button [PWRB]
[    1.446964] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
[    1.447596] ACPI: button: Power Button [PWRF]
[    1.457236] ACPI: battery: Slot [BAT0] (battery present)
[    1.644400] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[    1.649761] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    1.651831] nvme nvme0: pci function 0000:01:00.0
[    1.653747] hid: raw HID events driver (C) Jiri Kosina
[    1.657629] ACPI: bus type USB registered
[    1.658244] usbcore: registered new interface driver usbfs
[    1.659056] usbcore: registered new interface driver hub
[    1.659592] usbcore: registered new device driver usb
[    1.665836] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
[    1.667641] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    1.672238] nvme nvme0: 22/0/0 default/read/poll queues
[    1.679491]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.685031] intel-lpss 0000:00:15.1: enabling device (0004 -> 0006)
[    1.686425] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    1.705757] intel-lpss 0000:00:15.3: enabling device (0004 -> 0006)
[    1.706418] idma64 idma64.2: Found Intel integrated DMA 64-bit
[    1.722281] intel-lpss 0000:00:19.0: enabling device (0004 -> 0006)
[    1.740753] intel-lpss 0000:00:19.1: enabling device (0004 -> 0006)
[    1.803979] i2c_hid_acpi i2c-ELAN2513:00: i2c_hid_get_input: IRQ triggered but there's no data
[    1.805460] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.806846] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    1.808295] input: ELAN07CE:00 04F3:32C8 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input5
[    1.808807] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    1.809481] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input7
[    1.810194] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.810780] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input8
[    1.811443] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
[    1.812327] hid-generic 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    1.812878] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperSpeed
[    1.814217] input: ELAN2513:00 04F3:422C Touchscreen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input9
[    1.814561] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    1.815529] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input10
[    1.816278] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.817194] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input11
[    1.818110] usb usb1: Product: xHCI Host Controller
[    1.819077] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input12
[    1.819912] usb usb1: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.820687] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input13
[    1.821577] usb usb1: SerialNumber: 0000:00:0d.0
[    1.822670] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input14
[    1.823478] hub 1-0:1.0: USB hub found
[    1.824310] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input16
[    1.825425] hub 1-0:1.0: 1 port detected
[    1.826434] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input17
[    1.827696] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    1.828694] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input18
[    1.829825] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.832189] usb usb2: Product: xHCI Host Controller
[    1.833365] usb usb2: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.834355] usb usb2: SerialNumber: 0000:00:0d.0
[    1.835585] hub 2-0:1.0: USB hub found
[    1.836439] hub 2-0:1.0: 4 ports detected
[    1.838247] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.839451] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    1.841313] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    1.842335] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.843202] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
[    1.844024] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperSpeed
[    1.844866] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    1.845682] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.846640] usb usb3: Product: xHCI Host Controller
[    1.847492] usb usb3: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.848319] usb usb3: SerialNumber: 0000:00:14.0
[    1.849216] hub 3-0:1.0: USB hub found
[    1.850050] hub 3-0:1.0: 12 ports detected
[    1.851568] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    1.852396] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.853232] usb usb4: Product: xHCI Host Controller
[    1.854048] usb usb4: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.855166] usb usb4: SerialNumber: 0000:00:14.0
[    1.856012] hub 4-0:1.0: USB hub found
[    1.856819] hub 4-0:1.0: 2 ports detected
[    1.874687] hid-generic 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.031338] i915 0000:00:02.0: [drm] Found meteorlake (device ID 7d55) display version 14.00 stepping C0
[    2.033565] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    2.034537] Console: switching to colour dummy device 80x25
[    2.034553] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.034566] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    2.054354] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
[    2.062663] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/mtl_dmc.bin (v2.23)
[    2.095109] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/mtl_guc_70.bin version 70.36.0
[    2.109522] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    2.109525] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    2.109734] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    2.114273] i915 0000:00:02.0: [drm] GT1: can't init GSC proxy due to missing mei component
[    2.114495] i915 0000:00:02.0: [drm] GT1: GuC firmware i915/mtl_guc_70.bin version 70.36.0
[    2.114497] i915 0000:00:02.0: [drm] GT1: HuC firmware i915/mtl_huc_gsc.bin version 8.5.4
[    2.132248] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input22
[    2.132317] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input23
[    2.132349] hid-multitouch 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    2.134315] usb 3-3: new full-speed USB device number 2 using xhci_hcd
[    2.136624] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for clear media
[    2.136976] i915 0000:00:02.0: [drm] GT1: GUC: submission enabled
[    2.136978] i915 0000:00:02.0: [drm] GT1: GUC: SLPC enabled
[    2.137044] i915 0000:00:02.0: [drm] GT1: GUC: RC enabled
[    2.139323] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected content support initialized
[    2.146052] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 0
[    2.146464] ACPI: video: Video Device [PXSX] (multi-head: no  rom: yes  post: no)
[    2.146494] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/LNXVIDEO:00/input/input24
[    2.171655] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    2.172018] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input25
[    2.205867] fbcon: i915drmfb (fb0) is primary device
[    2.258312] tpm tpm0: auth session is active
[    2.272157] usb 3-3: New USB device found, idVendor=06cb, idProduct=016c, bcdDevice= 0.00
[    2.272161] usb 3-3: New USB device strings: Mfr=0, Product=0, SerialNumber=1
[    2.272163] usb 3-3: SerialNumber: 17f07122a011
[    2.278271] i915 0000:00:02.0: [drm] GT1: Loaded GSC firmware i915/mtl_gsc_1.bin (cv1.0, r102.1.15.1926, svn 1)
[    2.298362] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for all workloads
[    2.298369] i915 0000:00:02.0: [drm] *ERROR* GT1: GSC proxy handler failed to init
[    2.304686] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input26
[    2.304741] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input27
[    2.304760] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input28
[    2.304779] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input29
[    2.304823] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input30
[    2.304844] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input31
[    2.304886] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input33
[    2.304903] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input34
[    2.304920] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input35
[    2.348301] hid-multitouch 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.390281] usb 3-10: new full-speed USB device number 3 using xhci_hcd
[    2.528778] usb 3-10: New USB device found, idVendor=8087, idProduct=0033, bcdDevice= 0.00
[    2.528787] usb 3-10: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.723685] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=6
[    2.730741] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.736281] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.745678] hid-generic 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.752822] hid-generic 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.758782] hid-generic 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.760210] hid-generic 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.762240] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.763680] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.764864] hid-sensor-hub 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.765812] hid-sensor-hub 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.766769] hid-sensor-hub 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.767055] hid-sensor-hub 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    3.602349] Console: switching to colour frame buffer device 180x56
[    3.614858] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.750266] raid6: avx2x4   gen() 61745 MB/s
[    3.818281] raid6: avx2x2   gen() 62314 MB/s
[    3.886266] raid6: avx2x1   gen() 60798 MB/s
[    3.886972] raid6: using algorithm avx2x2 gen() 62314 MB/s
[    3.954266] raid6: .... xor() 42241 MB/s, rmw enabled
[    3.955029] raid6: using avx2x2 recovery algorithm
[    3.957738] xor: automatically using best checksumming function   avx       
[    3.959819] async_tx: api initialized (async)
[    4.141061] Btrfs loaded, zoned=yes, fsverity=yes
[    4.198188] PM: Image not found (code -22)
[    4.254622] EXT4-fs (nvme0n1p4): orphan cleanup on readonly fs
[    4.254783] EXT4-fs (nvme0n1p4): mounted filesystem 7881f7bb-dbe6-4323-887f-dd718adb7a8b ro with ordered data mode. Quota mode: none.
[    4.289508] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
[    4.327016] systemd[1]: Inserted module 'autofs4'
[    4.357878] systemd[1]: systemd 257.1-1 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
[    4.357885] systemd[1]: Detected architecture x86-64.
[    4.362389] systemd[1]: Hostname set to <DuanesSpectre16>.
[    4.418313] systemd[1]: bpf-restrict-fs: Failed to load BPF object: No such process
[    4.496358] systemd[1]: Queued start job for default target graphical.target.
[    4.549914] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[    4.550853] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[    4.551607] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[    4.552405] systemd[1]: Created slice system-xfs_scrub.slice - xfs_scrub background service slice.
[    4.553177] systemd[1]: Created slice user.slice - User and Session Slice.
[    4.553994] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[    4.555068] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[    4.555903] systemd[1]: Expecting device dev-disk-by\x2duuid-12DE8F49DE8F2457.device - /dev/disk/by-uuid/12DE8F49DE8F2457...
[    4.557084] systemd[1]: Expecting device dev-disk-by\x2duuid-96c2339a\x2dae0c\x2d4a9d\x2d9d62\x2dfbbce901defc.device - /dev/disk/by-uuid/96c2339a-ae0c-4a9d-9d62-fbbce901defc...
[    4.558408] systemd[1]: Expecting device dev-disk-by\x2duuid-9DB2\x2d2D80.device - /dev/disk/by-uuid/9DB2-2D80...
[    4.559035] systemd[1]: Reached target nss-user-lookup.target - User and Group Name Lookups.
[    4.560479] systemd[1]: Reached target slices.target - Slice Units.
[    4.563820] systemd[1]: Listening on rpcbind.socket - RPCbind Server Activation Socket.
[    4.567715] systemd[1]: Listening on systemd-coredump.socket - Process Core Dump Socket.
[    4.569390] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[    4.571194] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[    4.573187] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[    4.575231] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[    4.577246] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.577252] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.577282] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[    4.580942] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    4.584321] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
[    4.586631] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[    4.588758] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
[    4.592052] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[    4.595242] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[    4.597017] systemd[1]: auth-rpcgss-module.service - Kernel Module supporting RPCSEC_GSS was skipped because of an unmet condition check (ConditionPathExists=/etc/krb5.keytab).
[    4.597981] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
[    4.601506] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[    4.604554] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[    4.607049] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[    4.609604] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[    4.613962] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[    4.617651] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
[    4.617674] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    4.621753] pstore: Using crash dump compression: deflate
[    4.625463] systemd[1]: Starting systemd-journald.service - Journal Service...
[    4.629044] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[    4.630868] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.631722] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[    4.634480] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.635365] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[    4.635662] pstore: Registered efi_pstore as persistent store backend
[    4.640493] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[    4.644202] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
[    4.646275] systemd-journald[542]: Collecting audit messages is disabled.
[    4.646595] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[    4.649011] lp: driver loaded but no devices found
[    4.651020] systemd[1]: Mounted run-lock.mount - Legacy Locks Directory /run/lock.
[    4.653908] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[    4.656357] ppdev: user-space parallel port driver
[    4.658939] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[    4.661820] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[    4.664162] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    4.664246] systemd[1]: Finished modprobe@configfs.service - Load Kernel Module configfs.
[    4.668073] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    4.668147] systemd[1]: Finished modprobe@drm.service - Load Kernel Module drm.
[    4.671600] systemd[1]: modprobe@efi_pstore.service: Deactivated successfully.
[    4.672712] systemd[1]: Finished modprobe@efi_pstore.service - Load Kernel Module efi_pstore.
[    4.675519] systemd[1]: Started systemd-journald.service - Journal Service.
[    4.683078] EXT4-fs (nvme0n1p4): re-mounted 7881f7bb-dbe6-4323-887f-dd718adb7a8b r/w. Quota mode: none.
[    4.698181] systemd-journald[542]: Received client request to flush runtime journal.
[    4.803050] ACPI: AC: AC Adapter [ADP1] (off-line)
[    4.812395] input: Intel HID events as /devices/platform/INTC1077:00/input/input37
[    4.812865] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[    4.813404] int3472-discrete INT3472:01: Sensor module id: 'CJFME62'
[    4.814743] Consider using thermal netlink events interface
[    4.814919] int3472-discrete INT3472:01: unknown \_SB.GPI0 pin 65 active-high
[    4.814923] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
[    4.815009] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin number mismatch _DSM 11 resource 107
[    4.815011] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
[    4.815214] intel-hid INTC1077:00: failed to enable HID power button
[    4.818943] input: Intel HID events as /devices/platform/INT33D5:00/input/input38
[    4.818987] int3472-discrete INT3472:02: Sensor module id: 'CJFME62'
[    4.819385] int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mismatch _DSM 49 resource 209
[    4.820109] mc: Linux media interface: v0.10
[    4.822345] intel-hid INT33D5:00: platform supports 5 button array
[    4.822696] int3472-discrete INT3472:02: reset \_SB.GPI0 pin 209 active-low
[    4.824295] input: Intel HID 5 button array as /devices/platform/INT33D5:00/input/input39
[    4.830938] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.LPCB.HEC.DPTF.FCHG], AE_NOT_FOUND (20240827/psargs-332)
[    4.830943] ACPI Error: Aborting method \_SB.IETM.CHRG.PPSS due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
[    4.837449] videodev: Linux video capture interface: v2.00
[    4.837721] resource: resource sanity check: requesting [mem 0x00000000fedc0000-0x00000000fedcffff], which spans more than pnp 00:03 [mem 0xfedc0000-0xfedc7fff]
[    4.837726] caller igen6_probe+0x17f/0x7f2 [igen6_edac] mapping multiple BARs
[    4.838514] pci 0000:00:08.0: Setting to D3hot
[    4.841834] EDAC MC0: Giving out device to module igen6_edac controller Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[    4.844584] EDAC MC1: Giving out device to module igen6_edac controller Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[    4.844608] EDAC igen6 MC1: HANDLING IBECC MEMORY ERROR
[    4.844609] EDAC igen6 MC1: ADDR 0x7fffffffe0 
[    4.844611] EDAC igen6 MC0: HANDLING IBECC MEMORY ERROR
[    4.844612] EDAC igen6 MC0: ADDR 0x7fffffffe0 
[    4.844652] EDAC igen6: v2.5.1
[    4.847201] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[    4.851180] intel-ipu6 0000:00:05.0: IPU6 in secure mode touch 0x80000000 mask 0x0
[    4.851854] Serial bus multi instantiate pseudo device driver CSC3551:00: Instantiated 2 I2C devices.
[    4.854144] pci 0000:00:0b.0: Setting to D3hot
[    4.861315] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.864574] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.864646] iTCO_vendor_support: vendor-support=0
[    4.865722] input: PC Speaker as /devices/platform/pcspkr/input/input40
[    4.865744] intel-ipu6 0000:00:05.0: FW version: 20230925
[    4.867524] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.867607] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
[    4.867672] intel-ipu6 0000:00:05.0: Connected 1 cameras
[    4.868590] pci 0000:00:14.2: enabling device (0000 -> 0002)
[    4.869127] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
[    4.869600] ov08x40 i2c-OVTI08F4:00: supply dovdd not found, using dummy regulator
[    4.869617] ov08x40 i2c-OVTI08F4:00: supply avdd not found, using dummy regulator
[    4.869621] ov08x40 i2c-OVTI08F4:00: supply dvdd not found, using dummy regulator
[    4.871127] intel_pmc_core INT33A1:00: Assuming a default substate order for this platform
[    4.882306] intel_pmc_core INT33A1:00:  initialized
[    4.887644] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400)
[    4.887894] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[    4.888606] input: HP WMI hotkeys as /devices/virtual/input/input41
[    4.909858] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[    4.942904] Error: Driver 'pcspkr' is already registered, aborting...
[    4.942908] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 0002)
[    4.942935] Bluetooth: Core ver 2.22
[    4.943222] NET: Registered PF_BLUETOOTH protocol family
[    4.943223] Bluetooth: HCI device and connection manager initialized
[    4.943226] Bluetooth: HCI socket layer initialized
[    4.943228] Bluetooth: L2CAP socket layer initialized
[    4.943231] Bluetooth: SCO socket layer initialized
[    4.944037] intel_rapl_common: Found RAPL domain package
[    4.944276] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    4.944482] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    4.944666] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    4.954960] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 655360 ms ovfl timer
[    4.954962] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    4.954963] RAPL PMU: hw unit of domain package 2^-14 Joules
[    4.954963] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    4.955416] cfg80211: loaded regulatory.db is malformed or signature is missing/invalid
[    4.956073] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Adding DSD properties for 103C8C17
[    4.956899] intel-ipu6 0000:00:05.0: CSE authenticate_run done
[    4.958245] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Using extra _DSD properties, bypassing _DSD in ACPI
[    4.958886] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
[    4.961416] cryptd: max_cpu_qlen set to 1000
[    4.964748] intel_rapl_msr: PL4 support detected.
[    4.964781] intel_rapl_common: Found RAPL domain package
[    4.964783] intel_rapl_common: Found RAPL domain core
[    4.964784] intel_rapl_common: Found RAPL domain uncore
[    4.996360] Intel(R) Wireless WiFi driver for Linux
[    4.996405] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    4.998054] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cirrus Logic CS35L41 (35a40), Revision: B2
[    4.998230] iwlwifi 0000:00:14.3: Detected crf-id 0x400410, cnv-id 0x1080800 wfpm id 0x80005b20
[    4.998241] iwlwifi 0000:00:14.3: PCI dev 7e40/0094, rev=0x441, rfid=0x2010d000
[    4.998244] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6E AX211 160MHz
[    5.003789] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Adding DSD properties for 103C8C17
[    5.004210] usbcore: registered new interface driver btusb
[    5.004248] AES CTR mode by8 optimization enabled
[    5.004719] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Using extra _DSD properties, bypassing _DSD in ACPI
[    5.004721] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Reset line busy, assuming shared reset
[    5.005415] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.0.3.94
[    5.005866] iwlwifi 0000:00:14.3: loaded firmware version 89.6b44fa0b.0 ma-b0-gf-a0-89.ucode op_mode iwlmvm
[    5.006323] Bluetooth: hci0: Device revision is 0
[    5.009912] Adding 66559996k swap on /dev/nvme0n1p7.  Priority:-2 extents:1 across:66559996k SS
[    5.010175] Bluetooth: hci0: Secure boot is enabled
[    5.016902] Bluetooth: hci0: OTP lock is enabled
[    5.016904] Bluetooth: hci0: API lock is enabled
[    5.016904] Bluetooth: hci0: Debug lock is disabled
[    5.016905] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    5.016906] Bluetooth: hci0: Bootloader timestamp 2022.18 buildtype 1 build 49266
[    5.017134] Bluetooth: hci0: DSM reset method type: 0x00
[    5.025716] Bluetooth: hci0: Found device firmware: intel/ibt-0180-0041.sfi
[    5.025725] Bluetooth: hci0: Boot Address: 0x100800
[    5.025726] Bluetooth: hci0: Firmware Version: 99-33.24
[    5.039422] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cirrus Logic CS35L41 (35a40), Revision: B2
[    5.058764] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[    5.058826] snd_hda_intel 0000:56:00.1: enabling device (0000 -> 0002)
[    5.059016] snd_hda_intel 0000:56:00.1: Disabling MSI
[    5.059026] snd_hda_intel 0000:56:00.1: Handle vga_switcheroo audio client
[    5.074080] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input42
[    5.074138] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input43
[    5.074168] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input44
[    5.074218] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input45
[    5.079400] [643] intel-ipu6 0000:00:05.0: remote endpoint port 0 with 4 lanes added
[    5.079411] [643] intel_ipu6_isys.isys intel_ipu6.isys.40: bind ov08x40 4-0036 nlanes is 4 port is 0
[    5.083787] typec port0: bound usb3-port1 (ops connector_ops [usbcore])
[    5.083812] typec port0: bound usb2-port1 (ops connector_ops [usbcore])
[    5.152421] sof-audio-pci-intel-mtl 0000:00:1f.3: enabling device (0000 -> 0002)
[    5.152598] sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
[    5.152663] sof-audio-pci-intel-mtl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[    5.159424] sof-audio-pci-intel-mtl 0000:00:1f.3: use msi interrupt mode
[    5.177344] sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
[    5.177346] sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now
[    5.177347] sof-audio-pci-intel-mtl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
[    5.177348] sof-audio-pci-intel-mtl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
[    5.177349] sof-audio-pci-intel-mtl 0000:00:1f.3: DMICs detected in NHLT tables: 2
[    5.182099] sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
[    5.182100] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/mtl/sof-mtl.ri
[    5.182100] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/mtl
[    5.182101] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
[    5.182684] sof-audio-pci-intel-mtl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.11.1.1
[    5.318879] sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.11.1.1
[    5.319987] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[    5.320022] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    5.320038] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    5.320045] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    5.320053] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    5.320824] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[    5.327656] iwlwifi 0000:00:14.3: loaded PNVM version 16611aa6
[    5.331167] sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
[    5.331434] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card not yet available, widget card binding deferred
[    5.342628] iwlwifi 0000:00:14.3: Detected RF GF, rfid=0x2010d000
[    5.350407] snd_hda_codec_realtek ehdaudio0D0: ALC245: picked fixup  for PCI SSID 103c:8c17
[    5.352524] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    5.353173] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight Time
[    5.408579] iwlwifi 0000:00:14.3: base HW address: d0:65:78:ec:0a:e5
[    5.452551] iwlwifi 0000:00:14.3 wlo1: renamed from wlan0
[    5.744481] audit: type=1400 audit(1734788184.120:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=1033 comm="apparmor_parser"
[    5.744526] audit: type=1400 audit(1734788184.120:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-senddoc" pid=1031 comm="apparmor_parser"
[    5.745068] audit: type=1400 audit(1734788184.120:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=1029 comm="apparmor_parser"
[    5.745070] audit: type=1400 audit(1734788184.120:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_filter" pid=1029 comm="apparmor_parser"
[    5.745070] audit: type=1400 audit(1734788184.120:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_groff" pid=1029 comm="apparmor_parser"
[    5.745216] audit: type=1400 audit(1734788184.120:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/libexec/ibus-engine-hangul" pid=1035 comm="apparmor_parser"
[    5.745325] audit: type=1400 audit(1734788184.120:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oosplash" pid=1030 comm="apparmor_parser"
[    5.745375] audit: type=1400 audit(1734788184.120:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=1022 comm="apparmor_parser"
[    5.745573] audit: type=1400 audit(1734788184.120:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cups-browsed" pid=1037 comm="apparmor_parser"
[    5.745612] audit: type=1400 audit(1734788184.120:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=1025 comm="apparmor_parser"
[    5.805435] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 400a4 vendor: 0x2 v0.60.0, 2 algorithms
[    5.807319] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bin: v0.60.0
[    5.807323] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: C:\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_tooling_4KHz-6dBhighshelf\HP_
[    5.821816] nvme nvme0: using unchecked data buffer
[    5.823213] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    5.823215] Bluetooth: BNEP filters: protocol multicast
[    5.823218] Bluetooth: BNEP socket layer initialized
[    5.848455] block nvme0n1: No UUID available providing old NGUID
[    5.865926] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Calibration applied: R0=10501
[    5.873651] NET: Registered PF_QIPCRTR protocol family
[    5.880204] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded - Type: spk-prot, Gain: 17
[    5.880897] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 103C8C17, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 0
[    5.881477] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35l41-hda.0 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    5.882614] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    5.882616] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight Time
[    6.264974] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[    6.267057] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    6.267075] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[    6.268774] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    6.270844] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    6.271782] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    6.334462] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 400a4 vendor: 0x2 v0.60.0, 2 algorithms
[    6.336625] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bin: v0.60.0
[    6.337474] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: C:\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_tooling_4KHz-6dBhighshelf\HP_
[    6.357398] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, with index: 0
[    6.396782] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration applied: R0=10902
[    6.411423] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded - Type: spk-prot, Gain: 17
[    6.412505] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SSID: 103C8C17, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 0
[    6.413495] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35l41-hda.1 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    6.415642] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC245: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    6.415647] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    6.415650] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    6.415651] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=0x0
[    6.415652] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[    6.415654] snd_hda_codec_realtek ehdaudio0D0:      Mic=0x19
[    6.458624] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
[    6.475723] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input46
[    6.476458] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input47
[    6.477285] input: sof-hda-dsp HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input48
[    6.477943] input: sof-hda-dsp HDMI/DP,pcm=4 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input49
[    6.479398] input: sof-hda-dsp HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input50
[    6.509470] hid-sensor-hub 001F:8087:0AC2.0005: hid_field_extract() called with n (192) > 32! (kworker/15:1)
[    6.510886] Bluetooth: hci0: Waiting for firmware download to complete
[    6.512036] Bluetooth: hci0: Firmware loaded in 1451481 usecs
[    6.513113] Bluetooth: hci0: Waiting for device to boot
[    6.555291] Bluetooth: hci0: Device booted in 41205 usecs
[    6.558867] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0180-0041.ddc
[    6.560287] Bluetooth: hci0: Applying Intel DDC parameters completed
[    6.564430] Bluetooth: hci0: Firmware timestamp 2024.33 buildtype 1 build 3427
[    6.565507] Bluetooth: hci0: Firmware SHA1: 0xd028ffe4
[    6.570334] Bluetooth: hci0: Fseq status: Success (0x00)
[    6.571281] Bluetooth: hci0: Fseq executed: 00.00.03.94
[    6.571686] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[    6.572397] Bluetooth: hci0: Fseq BT Top: 00.00.03.94
[    6.574444] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    6.574464] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[    6.576089] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    6.576095] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    6.577168] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    6.674991] Bluetooth: MGMT ver 1.23
[    6.680311] NET: Registered PF_ALG protocol family
[    6.714868] Bluetooth: RFCOMM TTY layer initialized
[    6.716187] Bluetooth: RFCOMM socket layer initialized
[    6.716894] Bluetooth: RFCOMM ver 1.11
[    6.718027] RPC: Registered named UNIX socket transport module.
[    6.718733] RPC: Registered udp transport module.
[    6.719200] RPC: Registered tcp transport module.
[    6.719201] RPC: Registered tcp-with-tls transport module.
[    6.719201] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   10.573568] netfs: FS-Cache loaded
[   10.574845] Key type dns_resolver registered
[   10.627545] Key type cifs.spnego registered
[   10.628260] Key type cifs.idmap registered
[   10.629817] CIFS: VFS: Use of the less secure dialect vers=1.0 is not recommended unless required for access to very old servers
[   10.630718] CIFS: Attempting to mount //192.168.1.248/NetFolder
[   10.631830] CIFS: VFS: Error connecting to socket. Aborting operation.
[   10.631833] CIFS: VFS: cifs_mount failed w/return code = -101
[   10.683518] NFS: Registering the id_resolver key type
[   10.684372] Key type id_resolver registered
[   10.685188] Key type id_legacy registered
[   10.953201] i915 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A
[   19.997195] i915 0000:00:02.0: [drm] PHY A failed to request refclk after 1us.
[   21.137163] show_signal: 20 callbacks suppressed
[   21.137166] traps: light-locker[2375] trap int3 ip:7efc1e775f37 sp:7ffcd8f22cc0 error:0 in libglib-2.0.so.0.8200.4[64f37,7efc1e72f000+a0000]
[   21.208499] wlo1: authenticate with f8:85:f9:0d:a2:e1 (local address=d0:65:78:ec:0a:e5)
[   21.209076] wlo1: send auth to f8:85:f9:0d:a2:e1 (try 1/3)
[   21.239996] wlo1: authenticated
[   21.242354] wlo1: associate with f8:85:f9:0d:a2:e1 (try 1/3)
[   21.251645] wlo1: RX AssocResp from f8:85:f9:0d:a2:e1 (capab=0x1511 status=0 aid=5)
[   21.256324] wlo1: associated
[   21.256390] wlo1: Limiting TX power to 30 (30 - 0) dBm as advertised by f8:85:f9:0d:a2:e1
[   21.271852] warning: `kdeconnectd' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211
[   21.598030] audit: type=1400 audit(1734788199.972:32): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/system/node/" pid=2551 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   21.644010] audit: type=1400 audit(1734788200.020:33): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/system/node/" pid=2553 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   21.662236] audit: type=1400 audit(1734788200.036:34): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/usr/share/mariadb/charsets/Index.xml" pid=2553 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   21.670771] audit: type=1400 audit(1734788200.048:35): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/block/" pid=2553 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   21.683626] audit: type=1400 audit(1734788200.060:36): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/proc/2553/cgroup" pid=2553 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
[   21.684119] audit: type=1400 audit(1734788200.060:37): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/nvme/nvme0/nvme0n1/queue/physical_block_size" pid=2553 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   22.048486] audit: type=1400 audit(1734788200.424:38): apparmor="DENIED" operation="exec" class="file" profile="mariadbd_akonadi" name="/usr/bin/mariadb" pid=2575 comm="sh" requested_mask="x" denied_mask="x" fsuid=1000 ouid=0
[   28.378589] input: MX Anywhere 3S Mouse as /devices/virtual/misc/uhid/0005:046D:B037.0009/input/input51
[   28.378723] hid-generic 0005:046D:B037.0009: input,hidraw8: BLUETOOTH HID v0.03 Mouse [MX Anywhere 3S] on d0:65:78:ec:0a:e9
[   99.381714] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: configured size 18717248, buffer size 18717248
[   99.381720] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buffer 0 for Intel IPU6 ISYS Capture 0
[   99.381721] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: iova: iova 0x00000000fe612000
[   99.381723] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: media pipeline is not ready for Intel IPU6 ISYS Capture 0
[   99.381724] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: stream: Intel IPU6 ISYS Capture 0: width 3856, height 2416, css pixelformat 24
[   99.381731] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: validating link "Intel IPU6 CSI2 0":1 -> "Intel IPU6 ISYS Capture 0"
[   99.394266] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 20 scale 2, did: value 20 scale 2
[   99.394792] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: prepare stream: external entity ov08x40 4-0036
[   99.394794] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: queue 1 of 1
[   99.394802] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x2, index 2, offset 0x0, value 0x1
[   99.394920] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 2, error 0, details 0
[   99.394921] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 1023 scale 2, did: value 299 scale 2
[   99.394922] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x1, index 1, offset 0x0, value 0x42
[   99.395038] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 1, error 0, details 0
[   99.395039] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: mem_open_threshold: 12
[   99.395039] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x3, index 3, offset 0x0, value 0xc
[   99.395155] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 3, error 0, details 0
[   99.395156] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: threshold: 89 critical: 108
[   99.395156] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x0, index 0, offset 0x0, value 0x6c
[   99.395271] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 0, error 0, details 0
[   99.395273] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: buffer 0
[   99.395274] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: get buffer list 000000000925ee70, 1 buffers
[   99.395276] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: set stream: 1
[   99.395277] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[   99.395278] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS_STREAM_CFG_DATA
[   99.395279] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: compfmt = 0
[   99.395279] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: src = 0
[   99.395280] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: vc = 0
[   99.395280] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: isl_use = 0
[   99.395281] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: sensor_type = 0
[   99.395281] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof_discarded = 0
[   99.395282] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof_discarded = 0
[   99.395282] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_sof_discarded = 0
[   99.395283] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eof_discarded = 0
[   99.395283] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: crop:
[   99.395283] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.left_top = [0, 0]
[   99.395284] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.right_bottom = [0, 0]
[   99.395285] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: nof_input_pins = 1
[   99.395285] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: input pin[0]:
[   99.395286] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.dt = 0x2b
[   99.395286] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.mipi_store_mode = 0
[   99.395287] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.bits_per_pix = 10
[   99.395287] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.mapped_dt = 0x40
[   99.395288] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.input_res = 3856x2416
[   99.395289] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.mipi_decompression = 0
[   99.395289] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.capture_mode = 0
[   99.395290] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: nof_output_pins = 1
[   99.395290] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0]:
[   99.395291] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.input_pin_id = 0
[   99.395291] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.output_res = 3856x2416
[   99.395292] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.stride = 7744
[   99.395292] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.pt = 3
[   99.395293] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.payload_buf_size = 0
[   99.395293] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.ft = 24
[   99.395294] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.watermark_in_lines = 0
[   99.395294] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.send_irq = 1
[   99.395295] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.reserve_compression = 0
[   99.395295] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.snoopable = 1
[   99.395296] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.error_handling_enable = 0
[   99.395296] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.sensor_type = 14
[   99.395297] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[   99.395297] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_OPEN
[   99.395603] <intr> intel_ipu6_isys.isys intel_ipu6.isys.40: FW resp 00 STREAM_OPEN_DONE, stream 0, ts 0x0000000000000000, pin 0
[   99.395623] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: start stream: open complete
[   99.395626] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buf list 000000000925ee70 flags 2, s 0, 1 bufs
[   99.395629] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[   99.395631] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS_FRAME_BUFF_SET
[   99.395632] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0]:
[   99.395634] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.out_buf_id = 1
[   99.395636] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.addr = 0xfe612000
[   99.395638] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.compress = 0
[   99.395639] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof = 0x1
[   99.395641] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof = 0x0
[   99.395643] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_sof = 0x1
[   99.395644] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eof = 0x0
[   99.395646] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_ack = 0x1
[   99.395647] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_done = 0x0
[   99.395649] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_ack = 0x1
[   99.395650] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_done = 0x1
[   99.395652] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[   99.395654] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_START_AND_CAPTURE
[   99.395774] <intr> intel_ipu6_isys.isys intel_ipu6.isys.40: FW resp 02 STREAM_START_AND_CAPTURE_ACK, stream 0, ts 0x0000000000000000, pin 0
[   99.395781] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: start stream: complete
[   99.395782] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel IPU6 CSI2 0 pad 1 mask 0x1
[   99.395784] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: ctermen 0 csettle 680 dtermen 0 dsettle 660
[   99.395785] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on CSI2-0 with 4 lanes
[   99.395998] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: config phy 0 and 1 in aggr mode
[   99.396000] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 0
[   99.396002] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23803c = data 0x0
[   99.396005] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238038 = data 0x0
[   99.396006] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238048 = data 0x0
[   99.396008] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x2
[   99.396010] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 1
[   99.396011] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238070 = data 0x0
[   99.396013] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23806c = data 0x0
[   99.396015] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23807c = data 0x0
[   99.396017] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x2
[   99.396019] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x1330
[   99.396037] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x133 = 0x1
[   99.396039] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x11331
[   99.396043] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1330
[   99.396060] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x133 = 0x1
[   99.396061] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1331
[   99.396062] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3070
[   99.396076] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x307 = 0x0
[   99.396076] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x43071
[   99.396078] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3070
[   99.396092] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x307 = 0x0
[   99.396092] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3071
[   99.396094] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x5080
[   99.396108] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x508 = 0x0
[   99.396108] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x205081
[   99.396110] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x5080
[   99.396124] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x508 = 0x0
[   99.396124] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x205081
[   99.396126] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x7080
[   99.396139] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x708 = 0x0
[   99.396140] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x207081
[   99.396142] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x7080
[   99.396155] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x708 = 0x0
[   99.396156] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x207081
[   99.396158] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3080
[   99.396171] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x308 = 0x0
[   99.396172] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3081
[   99.396174] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3080
[   99.396187] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x308 = 0x0
[   99.396188] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x83081
[   99.396190] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe00
[   99.396203] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe0 = 0x0
[   99.396204] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x30e01
[   99.396206] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe10
[   99.396219] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe1 = 0x0
[   99.396220] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x20e11
[   99.396222] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3070
[   99.396235] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x307 = 0x0
[   99.396236] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x83071
[   99.396238] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3040
[   99.396251] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x304 = 0x0
[   99.396252] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x803041
[   99.396254] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3050
[   99.396267] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x305 = 0x0
[   99.396267] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xa3051
[   99.396269] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: config Dphy 0 with 800 mbps
[   99.396271] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238040 = data 0x0
[   99.396272] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238040 = data 0x19
[   99.396272] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0xe40
[   99.396286] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe4 = 0x0
[   99.396286] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x10e41
[   99.396288] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0xe20
[   99.396302] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe2 = 0x0
[   99.396302] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x4f0e21
[   99.396304] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0xe30
[   99.396318] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe3 = 0x0
[   99.396318] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x10e31
[   99.396320] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x80
[   99.396333] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x8 = 0x1c
[   99.396334] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3c0081
[   99.396336] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: ref_clk = 384 clk_freqrange = 85
[   99.396337] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238044 = data 0x0
[   99.396338] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238044 = data 0x55
[   99.396339] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238068 = data 0x0
[   99.396339] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238068 = data 0x10
[   99.396341] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238068 = data 0x10
[   99.396341] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238068 = data 0x110
[   99.396342] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: config Dphy 1 with 800 mbps
[   99.396343] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238074 = data 0x0
[   99.396344] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238074 = data 0x19
[   99.396344] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe40
[   99.396358] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe4 = 0x0
[   99.396358] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x10e41
[   99.396360] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe20
[   99.396373] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe2 = 0x0
[   99.396374] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x4f0e21
[   99.396376] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe30
[   99.396389] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe3 = 0x0
[   99.396390] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x10e31
[   99.396392] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x80
[   99.396405] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x8 = 0x1c
[   99.396406] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3c0081
[   99.396408] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: ref_clk = 384 clk_freqrange = 85
[   99.396409] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238078 = data 0x0
[   99.396410] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238078 = data 0x55
[   99.396411] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x23809c = data 0x0
[   99.396411] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23809c = data 0x10
[   99.396413] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x23809c = data 0x10
[   99.396413] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23809c = data 0x110
[   99.396414] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238038 = data 0x1
[   99.396436] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23803c = data 0x1
[   99.396437] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x1e0
[   99.396450] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x11
[   99.396552] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x1e0
[   99.396566] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x16
[   99.396668] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x1e0
[   99.396681] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x17
[   99.396682] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238068 = data 0x110
[   99.396683] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238068 = data 0x100
[   99.396684] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238068 = data 0x100
[   99.396685] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238068 = data 0x0
[   99.396685] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Dphy 0 is ready!
[   99.396686] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23806c = data 0x1
[   99.396708] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238070 = data 0x1
[   99.396709] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1e0
[   99.396722] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x11
[   99.396824] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1e0
[   99.396838] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x19
[   99.396940] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1e0
[   99.396954] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x17
[   99.396955] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x23809c = data 0x110
[   99.396955] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23809c = data 0x100
[   99.396956] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x23809c = data 0x100
[   99.396957] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23809c = data 0x0
[   99.396958] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Dphy 1 is ready!
[   99.540604] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: configured size 18717248, buffer size 18717248
[   99.540607] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buffer 1 for Intel IPU6 ISYS Capture 0
[   99.540608] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: iova: iova 0x00000000fd438000
[   99.540610] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: buffer 1
[   99.540610] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: get buffer list 000000006dbf51ce, 1 buffers
[   99.540612] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[   99.540613] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS_FRAME_BUFF_SET
[   99.540613] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0]:
[   99.540614] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.out_buf_id = 2
[   99.540614] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.addr = 0xfd438000
[   99.540615] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.compress = 0
[   99.540616] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof = 0x1
[   99.540616] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof = 0x0
[   99.540617] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_sof = 0x1
[   99.540617] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eof = 0x0
[   99.540618] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_ack = 0x0
[   99.540618] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_done = 0x0
[   99.540619] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_ack = 0x1
[   99.540619] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_done = 0x1
[   99.540620] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[   99.540620] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buf list 000000006dbf51ce flags 2, s 0, 1 bufs
[   99.540621] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_CAPTURE
[   99.540639] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: configured size 18717248, buffer size 18717248
[   99.540640] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buffer 2 for Intel IPU6 ISYS Capture 0
[   99.540640] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: iova: iova 0x00000000fc25e000
[   99.540641] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: buffer 2
[   99.540642] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: get buffer list 000000004ce07493, 1 buffers
[   99.540643] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[   99.540643] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS_FRAME_BUFF_SET
[   99.540644] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0]:
[   99.540644] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.out_buf_id = 3
[   99.540645] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.addr = 0xfc25e000
[   99.540645] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.compress = 0
[   99.540646] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof = 0x1
[   99.540646] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof = 0x0
[   99.540647] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_sof = 0x1
[   99.540647] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eof = 0x0
[   99.540648] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_ack = 0x0
[   99.540648] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_done = 0x0
[   99.540649] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_ack = 0x1
[   99.540649] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_done = 0x1
[   99.540650] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[   99.540650] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buf list 000000004ce07493 flags 2, s 0, 1 bufs
[   99.540651] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_CAPTURE
[  129.206871] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x2, index 2, offset 0x0, value 0x0
[  129.206992] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 2, error 0, details 0
[  129.206994] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 20 scale 2, did: value 20 scale 2
[  129.206996] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x0, index 0, offset 0x0, value 0x60
[  129.207111] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 0, error 0, details 0
[  129.207112] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: set stream: 0
[  129.207114] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_FLUSH
[  131.218345] intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time out
[  131.218355] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: stream off entity Intel IPU6 CSI2 0 pad:1 mask:0x1
[  131.218360] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: stream off CSI2-0 with 0 lanes
[  131.218365] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Powerdown phy 0 with 0 lanes
[  131.218366] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 0
[  131.218368] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23803c = data 0x0
[  131.218370] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238038 = data 0x0
[  131.218372] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238048 = data 0x0
[  131.218373] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x2
[  131.230800] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_CLOSE
[  133.234293] intel_ipu6_isys.isys intel_ipu6.isys.40: stream close time out
[  133.234860] [3250] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 1023 scale 5, did: value 1023 scale 2

commands used:
duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=0 cam --list
[0:01:00.127809741] [3023] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
[0:01:00.127903437] [3023] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
[0:01:00.128777972] [3023] DEBUG IPAModule ipa_module.cpp:333 ipa_soft_simple.so: IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
[0:01:00.128801351] [3023] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
[0:01:00.128857996] [3023]  INFO Camera camera_manager.cpp:327 libcamera v0.3.2+240-936a099e
[0:01:00.129250973] [3028] DEBUG Camera camera_manager.cpp:73 Starting camera manager
[0:01:00.135763362] [3028] DEBUG DeviceEnumerator device_enumerator.cpp:230 New media device "intel-ipu6" created from /dev/media0
[0:01:00.137019976] [3028] DEBUG DeviceEnumerator device_enumerator_udev.cpp:96 Defer media device /dev/media0 due to 1 missing dependencies
[0:01:00.137130506] [3028] DEBUG DeviceEnumerator device_enumerator_udev.cpp:322 All dependencies for media device /dev/media0 found
[0:01:00.137137056] [3028] DEBUG DeviceEnumerator device_enumerator.cpp:258 Added device /dev/media0: intel-ipu6
[0:01:00.137332647] [3028] DEBUG Camera camera_manager.cpp:140 Found registered pipeline handler 'ipu3'
[0:01:00.137475248] [3028] DEBUG Camera camera_manager.cpp:140 Found registered pipeline handler 'simple'
[0:01:00.137501432] [3028] DEBUG DeviceEnumerator device_enumerator.cpp:318 Successful match for media device "intel-ipu6"
[0:01:00.137545282] [3028] DEBUG SimplePipeline simple.cpp:1585 Sensor found for /dev/media0
[0:01:00.137847865] [3028] DEBUG SimplePipeline simple.cpp:424 Found capture device Intel IPU6 ISYS Capture 0
[0:01:00.137908838] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Exposure (0x00980911)
[0:01:00.137996723] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
[0:01:00.138014325] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
[0:01:00.138025715] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
[0:01:00.138060218] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
[0:01:00.138069845] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
[0:01:00.138076758] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
[0:01:00.138084285] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
[0:01:00.138091671] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
[0:01:00.138100260] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
[0:01:00.138108355] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
[0:01:00.138118912] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
[0:01:00.138347429] [3028] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036': Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
[0:01:00.138361971] [3028]  WARN CameraSensor camera_sensor_legacy.cpp:401 'ov08x40 4-0036': The PixelArraySize property has been defaulted to 3856x2416
[0:01:00.138368072] [3028] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036': Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
[0:01:00.138373361] [3028]  WARN CameraSensor camera_sensor_legacy.cpp:412 'ov08x40 4-0036': The PixelArrayActiveAreas property has been defaulted to (0, 0)/3856x2416
[0:01:00.138380560] [3028] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036': Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
[0:01:00.138384660] [3028]  WARN CameraSensor camera_sensor_legacy.cpp:420 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
[0:01:00.138388671] [3028]  WARN CameraSensor camera_sensor_legacy.cpp:426 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
[0:01:00.138392375] [3028]  WARN CameraSensor camera_sensor_legacy.cpp:428 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in the libcamera sources for more information
[0:01:00.139127809] [3028]  WARN CameraSensorProperties camera_sensor_properties.cpp:458 No static properties available for 'ov08x40'
[0:01:00.139137730] [3028]  WARN CameraSensorProperties camera_sensor_properties.cpp:460 Please consider updating the camera sensor properties database
[0:01:00.139181797] [3028] DEBUG CameraSensor camera_sensor.cpp:401 Entity 'ov08x40 4-0036' matched by CameraSensorLegacy
[0:01:00.139213350] [3028] DEBUG SimplePipeline simple.cpp:491 Found pipeline: [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Capture 0]
[0:01:00.139337139] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Exposure (0x00980911)
[0:01:00.139355680] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
[0:01:00.139364360] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
[0:01:00.139372116] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
[0:01:00.139383321] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
[0:01:00.139391325] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
[0:01:00.139398521] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
[0:01:00.139405723] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
[0:01:00.139412986] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
[0:01:00.139421946] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
[0:01:00.139428916] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
[0:01:00.139439336] [3028] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
[0:01:00.139492204] [3028] DEBUG V4L2 v4l2_videodevice.cpp:631 /dev/video0[16:cap]: Opened device : isys: ipu6
[0:01:00.139624271] [3028] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106 Failed to open /dev/dma_heap/linux,cma: No such file or directory
[0:01:00.139632204] [3028] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106 Failed to open /dev/dma_heap/reserved: No such file or directory
[0:01:00.139638709] [3028] DEBUG DmaBufAllocator dma_buf_allocator.cpp:112 Using /dev/dma_heap/system
[0:01:00.142523463] [3028] DEBUG IPAManager ipa_manager.cpp:306 IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is valid
[0:01:00.142613079] [3028] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializing soft proxy: loading IPA from /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
[0:01:00.143711843] [3028]  WARN IPAProxy ipa_proxy.cpp:160 Configuration file 'ov08x40.yaml' not found for IPA module 'simple', falling back to 'uncalibrated.yaml'
[0:01:00.143770501] [3028]  WARN IPASoft soft_simple.cpp:96 IPASoft: Failed to create camera sensor helper for ov08x40
[0:01:00.144024361] [3028] DEBUG IPASoft soft_simple.cpp:117 IPASoft: Tuning file version 1
[0:01:00.144117448] [3028] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'BlackLevel'
[0:01:00.144182636] [3028] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'Awb'
[0:01:00.144235165] [3028] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'Lut'
[0:01:00.144266348] [3028] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'Agc'
[0:01:00.144357246] [3028] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
[0:01:00.144432420] [3028] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:01:00.144448082] [3028] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:01:00.144496953] [3028] DEBUG SimplePipeline simple.cpp:631 Adding configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
[0:01:00.144586450] [3028] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:01:00.144593355] [3028] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:01:00.144603256] [3028] DEBUG SimplePipeline simple.cpp:631 Adding configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
[0:01:00.144793338] [3028] DEBUG Camera camera_manager.cpp:161 Pipeline handler "simple" matched
[0:01:00.144812812] [3028] DEBUG Camera camera_manager.cpp:140 Found registered pipeline handler 'uvcvideo'
Available cameras:
1: Internal front camera (\_SB_.PC00.LNK0)
duane@DuanesSpectre16:~/cameratest$ uname -a
Linux DuanesSpectre16 6.13.0-rc2-ipu6+ #1 SMP PREEMPT_DYNAMIC Fri Dec 20 20:11:57 CST 2024 x86_64 GNU/Linux
duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=0 cam -c"\_SB_.PC00.LNK0" -C1
[0:01:39.338358149] [3244] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
[0:01:39.338446395] [3244] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
[0:01:39.338519312] [3244] DEBUG IPAModule ipa_module.cpp:333 ipa_soft_simple.so: IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
[0:01:39.338536207] [3244] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
[0:01:39.338579045] [3244]  INFO Camera camera_manager.cpp:327 libcamera v0.3.2+240-936a099e
[0:01:39.338796296] [3250] DEBUG Camera camera_manager.cpp:73 Starting camera manager
[0:01:39.347181465] [3250] DEBUG DeviceEnumerator device_enumerator.cpp:230 New media device "intel-ipu6" created from /dev/media0
[0:01:39.349258834] [3250] DEBUG DeviceEnumerator device_enumerator_udev.cpp:96 Defer media device /dev/media0 due to 1 missing dependencies
[0:01:39.349438272] [3250] DEBUG DeviceEnumerator device_enumerator_udev.cpp:322 All dependencies for media device /dev/media0 found
[0:01:39.349449028] [3250] DEBUG DeviceEnumerator device_enumerator.cpp:258 Added device /dev/media0: intel-ipu6
[0:01:39.349801270] [3250] DEBUG Camera camera_manager.cpp:140 Found registered pipeline handler 'ipu3'
[0:01:39.350033027] [3250] DEBUG Camera camera_manager.cpp:140 Found registered pipeline handler 'simple'
[0:01:39.350077755] [3250] DEBUG DeviceEnumerator device_enumerator.cpp:318 Successful match for media device "intel-ipu6"
[0:01:39.350148975] [3250] DEBUG SimplePipeline simple.cpp:1585 Sensor found for /dev/media0
[0:01:39.350652718] [3250] DEBUG SimplePipeline simple.cpp:424 Found capture device Intel IPU6 ISYS Capture 0
[0:01:39.350748274] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Exposure (0x00980911)
[0:01:39.350887346] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
[0:01:39.350919311] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
[0:01:39.350942062] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
[0:01:39.350998375] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
[0:01:39.351017830] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
[0:01:39.351034245] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
[0:01:39.351050645] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
[0:01:39.351067852] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
[0:01:39.351087179] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
[0:01:39.351104152] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
[0:01:39.351126726] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
[0:01:39.351485095] [3250] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036': Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
[0:01:39.351504070] [3250]  WARN CameraSensor camera_sensor_legacy.cpp:401 'ov08x40 4-0036': The PixelArraySize property has been defaulted to 3856x2416
[0:01:39.351514382] [3250] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036': Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
[0:01:39.351523752] [3250]  WARN CameraSensor camera_sensor_legacy.cpp:412 'ov08x40 4-0036': The PixelArrayActiveAreas property has been defaulted to (0, 0)/3856x2416
[0:01:39.351537063] [3250] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036': Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
[0:01:39.351545270] [3250]  WARN CameraSensor camera_sensor_legacy.cpp:420 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
[0:01:39.351553072] [3250]  WARN CameraSensor camera_sensor_legacy.cpp:426 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
[0:01:39.351560611] [3250]  WARN CameraSensor camera_sensor_legacy.cpp:428 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in the libcamera sources for more information
[0:01:39.352630649] [3250]  WARN CameraSensorProperties camera_sensor_properties.cpp:458 No static properties available for 'ov08x40'
[0:01:39.352642409] [3250]  WARN CameraSensorProperties camera_sensor_properties.cpp:460 Please consider updating the camera sensor properties database
[0:01:39.352686468] [3250] DEBUG CameraSensor camera_sensor.cpp:401 Entity 'ov08x40 4-0036' matched by CameraSensorLegacy
[0:01:39.352718683] [3250] DEBUG SimplePipeline simple.cpp:491 Found pipeline: [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Capture 0]
[0:01:39.352841153] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Exposure (0x00980911)
[0:01:39.352860976] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
[0:01:39.352870450] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
[0:01:39.352878264] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
[0:01:39.352889764] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
[0:01:39.352897753] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
[0:01:39.352905094] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
[0:01:39.352912294] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
[0:01:39.352919984] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
[0:01:39.352929276] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
[0:01:39.352936506] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
[0:01:39.352946945] [3250] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
[0:01:39.352992410] [3250] DEBUG V4L2 v4l2_videodevice.cpp:631 /dev/video0[16:cap]: Opened device : isys: ipu6
[0:01:39.353110612] [3250] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106 Failed to open /dev/dma_heap/linux,cma: No such file or directory
[0:01:39.353117686] [3250] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106 Failed to open /dev/dma_heap/reserved: No such file or directory
[0:01:39.353123451] [3250] DEBUG DmaBufAllocator dma_buf_allocator.cpp:112 Using /dev/dma_heap/system
[0:01:39.355172314] [3250] DEBUG IPAManager ipa_manager.cpp:306 IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is valid
[0:01:39.355249080] [3250] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializing soft proxy: loading IPA from /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
[0:01:39.355832706] [3250]  WARN IPAProxy ipa_proxy.cpp:160 Configuration file 'ov08x40.yaml' not found for IPA module 'simple', falling back to 'uncalibrated.yaml'
[0:01:39.355876108] [3250]  WARN IPASoft soft_simple.cpp:96 IPASoft: Failed to create camera sensor helper for ov08x40
[0:01:39.356025585] [3250] DEBUG IPASoft soft_simple.cpp:117 IPASoft: Tuning file version 1
[0:01:39.356104118] [3250] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'BlackLevel'
[0:01:39.356159486] [3250] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'Awb'
[0:01:39.356206524] [3250] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'Lut'
[0:01:39.356233488] [3250] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'Agc'
[0:01:39.356314755] [3250] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 0
[0:01:39.356323447] [3250] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
[0:01:39.356387717] [3250] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:01:39.356400631] [3250] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:01:39.356442117] [3250] DEBUG SimplePipeline simple.cpp:631 Adding configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
[0:01:39.356521011] [3250] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:01:39.356527168] [3250] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:01:39.356536763] [3250] DEBUG SimplePipeline simple.cpp:631 Adding configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
[0:01:39.356705877] [3250] DEBUG Camera camera_manager.cpp:161 Pipeline handler "simple" matched
[0:01:39.356724564] [3250] DEBUG Camera camera_manager.cpp:140 Found registered pipeline handler 'uvcvideo'
[0:01:39.356940157] [3244] DEBUG SimplePipeline simple.cpp:1017 Largest stream size is 3848x2416
[0:01:39.356958396] [3244] DEBUG SimplePipeline simple.cpp:1069 Picked 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
[0:01:39.356991452] [3244] DEBUG Camera camera.cpp:1137 streams configuration: (0) 3848x2416-ABGR8888
[0:01:39.357003420] [3244] DEBUG SimplePipeline simple.cpp:1017 Largest stream size is 3848x2416
[0:01:39.357007631] [3244] DEBUG SimplePipeline simple.cpp:1069 Picked 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
Using camera \_SB_.PC00.LNK0 as cam0
[0:01:39.357029465] [3244] DEBUG SimplePipeline simple.cpp:1017 Largest stream size is 3848x2416
[0:01:39.357033783] [3244] DEBUG SimplePipeline simple.cpp:1069 Picked 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
[0:01:39.357040553] [3244]  INFO Camera camera.cpp:1202 configuring streams: (0) 3848x2416-ABGR8888
[0:01:39.357071265] [3250] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 0
[0:01:39.357078616] [3250] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
[0:01:39.357121732] [3250] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:01:39.357128960] [3250] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:01:39.357159258] [3250]  WARN CameraSensor camera_sensor_legacy.cpp:501 'ov08x40 4-0036': No sensor delays found in static properties. Assuming unverified defaults.
[0:01:39.357215453] [3250] DEBUG DelayedControls delayed_controls.cpp:99 Set a delay of 2 and priority write flag 0 for Exposure
[0:01:39.357226982] [3250] DEBUG DelayedControls delayed_controls.cpp:99 Set a delay of 1 and priority write flag 0 for Analogue Gain
[0:01:39.357329806] [3250]  INFO IPASoft soft_simple.cpp:251 IPASoft: Exposure 4-4992, gain 0-1984 (1)
[0:01:39.360583232] [3250] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:01:39.363720909] [3250] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:01:39.366821221] [3250] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:01:39.369848728] [3250] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:01:39.369997287] [3244] DEBUG Request request.cpp:369 Created request - cookie: 0
[0:01:39.370102283] [3244] DEBUG Request request.cpp:369 Created request - cookie: 0
[0:01:39.370111772] [3244] DEBUG Request request.cpp:369 Created request - cookie: 0
[0:01:39.370118875] [3244] DEBUG Request request.cpp:369 Created request - cookie: 0
[0:01:39.370126087] [3244] DEBUG Camera camera.cpp:1360 Starting capture
[0:01:39.374951117] [3250] DEBUG V4L2 v4l2_videodevice.cpp:1311 /dev/video0[16:cap]: 3 buffers requested.
[0:01:39.374989483] [3250] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:01:39.375000998] [3250] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:01:39.375008719] [3250] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:01:39.375442044] [3250] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0[16:cap]: Queueing buffer 0
[0:01:39.534307812] [3250] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0[16:cap]: Queueing buffer 1
[0:01:39.534380155] [3250] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0[16:cap]: Queueing buffer 2
cam0: Capture 1 frames
^CExiting
[0:02:09.199996813] [3244] DEBUG Camera camera.cpp:1404 Stopping capture
[0:02:13.229026130] [3250] DEBUG Request request.cpp:129 Request(0:C:0/1:0)
[0:02:13.229140205] [3250] DEBUG V4L2 v4l2_videodevice.cpp:1596 /dev/video0[16:cap]: Releasing buffers
[0:02:13.229186821] [3250] DEBUG V4L2 v4l2_videodevice.cpp:1311 /dev/video0[16:cap]: 0 buffers requested.

Please let me know what further testing I can do.

Sincerely,
Duane

