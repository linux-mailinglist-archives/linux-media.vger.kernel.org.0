Return-Path: <linux-media+bounces-23990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BCC9FA5CF
	for <lists+linux-media@lfdr.de>; Sun, 22 Dec 2024 14:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C3871659E0
	for <lists+linux-media@lfdr.de>; Sun, 22 Dec 2024 13:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3431218BBB0;
	Sun, 22 Dec 2024 13:36:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail2.tds.syn-alias.com (mail2.tds.syn-alias.com [129.159.94.43])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93D8DF59
	for <linux-media@vger.kernel.org>; Sun, 22 Dec 2024 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.159.94.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734874574; cv=none; b=dmrlG8cTzEzBSZyUyMIRefDZ7/2ys1FZnxkh74i813+GO1FHzvgjnU/r9EFHrdaswBv5X0JjM5h4CwWMVdo9ahe3SFSpmTvjZWwdqP3GYFEQXfpR+5zyvUEpEJGH60kOizu6CGPjr4X9GURmSA7Ui8TE5dt/ZHd6iIMO7/Pkah4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734874574; c=relaxed/simple;
	bh=bZTd0Gq8N+gOX0Nf4CvZpaagEmQbTlYPbag5+vJXYbY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Um211imAS1L7eStV0sGj1BvTu2Y2sHZdZuX9YIoI4pJCwMld22HoXqLOpzNmybUWvL1RcLOUC1o6NU029z/VQ1Ak7P0UU1KPDDBszclEFpN/kNGWnmqPud42iXkNdPerh5NHSwfHblCltZo0rY+LGcn1oqIad7Rk/Ega8Hf0Apc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net; spf=pass smtp.mailfrom=chorus.net; arc=none smtp.client-ip=129.159.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chorus.net
X-Authed-Username: ZHVhbmVrQGNob3J1cy5uZXQ=
Received: from [10.219.153.37] ([10.219.153.37:17937] helo=md15.tds.email-ash1.sync.lan)
	by mail.tds.net (envelope-from <duanek@chorus.net>)
	(ecelerity 4.4.1.20033 r(msys-ecelerity:tags/4.4.1.0^0)) with ESMTP
	id 80/21-22338-FB518676; Sun, 22 Dec 2024 08:35:59 -0500
Date: Sun, 22 Dec 2024 08:35:58 -0500 (EST)
From: "duanek@chorus.net" <duanek@chorus.net>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jason Chen <jason.z.chen@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media <linux-media@vger.kernel.org>
Message-ID: <1664997903.107383327.1734874558698.JavaMail.zimbra@chorus.net>
In-Reply-To: <ab8a2af5-f049-4ce8-b2cb-b6e012ffc9bb@redhat.com>
References: <20241220144130.66765-1-hdegoede@redhat.com> <21fb2807-3886-4559-a7a0-dca3031a5388@linaro.org> <759031849.104848728.1734717736340.JavaMail.zimbra@chorus.net> <3ad46a7f-e2c7-4b68-b6a9-6c5e093d14b2@linaro.org> <120983801.106092806.1734789603490.JavaMail.zimbra@chorus.net> <1deda413-a2cd-4d3b-a375-065d53bb6861@redhat.com> <594369434.106198845.1734793186348.JavaMail.zimbra@chorus.net> <ab8a2af5-f049-4ce8-b2cb-b6e012ffc9bb@redhat.com>
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
Thread-Index: W79xnG5fKtY7glxLlHQr6CNXb2i8LA==
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgheegucetufdoteggodetrfdotffvucfrrhho
X-Vade-Analysis-2: fhhilhgvmecuufgjpfetvefqtfdpvfffufdpgffpggdqvfffufdpqfgfvfenuceurghilhhouhhtmecu
X-Vade-Analysis-3: fedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevkfgjfhfugggt
X-Vade-Analysis-4: gfhiofhtsehtjegttdiitdejnecuhfhrohhmpedfughurghnvghksegthhhorhhushdrnhgvthdfuceo
X-Vade-Analysis-5: ughurghnvghksegthhhorhhushdrnhgvtheqnecuggftrfgrthhtvghrnhepjeetveektedvvefghfdv
X-Vade-Analysis-6: feevhedvveefkeefgeduueehudeggfevtdfgteejueefnecuffhomhgrihhnpehgihhthhhusgdrtgho
X-Vade-Analysis-7: mhenucfkphepuddtrddvudelrdduheefrdefjedpvddtjedrvddttddrvddvjedrgeegnecuvehluhhs
X-Vade-Analysis-8: thgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtrddvudelrdduheefrdefjedphhgvlhho
X-Vade-Analysis-9: pehmugduhedrthgushdrvghmrghilhdqrghshhdurdhshihntgdrlhgrnhdpmhgrihhlfhhrohhmpegu
X-Vade-Analysis-10: uhgrnhgvkhestghhohhruhhsrdhnvghtpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdr
X-Vade-Analysis-11: tghomhdprhgtphhtthhopegsrhihrghnrdhoughonhhoghhhuhgvsehlihhnrghrohdrohhrghdprhgt
X-Vade-Analysis-12: phhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthho
X-Vade-Analysis-13: pehjrghsohhnrdiirdgthhgvnhesihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehk
X-Vade-Analysis-14: vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghl
X-Vade-Analysis-15: rdhorhhgpdhmthgrhhhoshhtpehsmhhtphdtvddrthgushdrvghmrghilhdqrghshhdurdhshihntgdr
X-Vade-Analysis-16: lhgrnhdpnhgspghrtghpthhtohepiedpihhspghnrgepfhgrlhhsvg
X-Vade-Client: TDS

Dear All,

I was able to do some testing yesterday.

----- On Dec 21, 2024, at 9:53 AM, Hans de Goede hdegoede@redhat.com wrote:

> Hi,
> 
> On 21-Dec-24 3:59 PM, duanek@chorus.net wrote:
>> 
>> 
>> ----- On Dec 21, 2024, at 8:23 AM, Hans de Goede hdegoede@redhat.com wrote:
>> 
>>> Hi,
>>>
>>> On 21-Dec-24 3:00 PM, duanek@chorus.net wrote:
>>>> Dear All,
>>>>
>>>> I have tested a kernel implementing the latest patches from Hans, but the camera
>>>> still does not work on my HP Spectre 16" laptop.
>>>
>>> I believe you are running a git branch provided by Bryan, right ?
>>>
>>> It seems that Bryan's branch is missing the last 2 patches from this set,
>>> otherwise these messages:
>>>
>>> [    4.867524] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
>>>
>>> should not be in your log since patch 10/10 of the v2 series drops that,
>>> but that is otherwise harmless.
>>>
>>> I do wonder if your kernel has this commit, which as I mentioned before
>>> likely is also necessary:
>>>
>>> https://github.com/jwrdegoede/linux-sunxi/commit/c7803b1a32dab79f8a516e8aa9c08fb4ba74354d
>>>
>>> I have also attached 2 further patches which would be good to add
>>> and see if they help.
>> 
>> Dear Hans,
>> 
>> !!BINGO!! I am able to stream images from my camera under Linux.
> 
> That is very good to hear.
> 
>> I thought you had closed your work laptop for a couple of weeks ;)
> 
> Mostly, I'm still tracking this email thread because I felt
> we were close.
> 
>> Thank you _all_ for helping getting this to work.
> 
> You're welcome.
> 
> The next step would be to figure out which of the 3 extra
> patches are really needed.
> 
> The next step would be to figure out which of the 3 extra
> patches are really needed.
>
> Can you:
>
> 1. Drop the "media: ov08x40: Increase post reset deassert delay to 25 ms"
> patch and then try again.
>
reverting this change lead to a kernel that did not have a camera (20241221_original_sleep_delay_dmesg.txt - below)
[putting the patch back in made the camera work again]


> 2. If things are still ok after dropping that patch, drop:
> "platform/x86: int3472: Map GPIO type 0x12 to reset"

With the post reset deassert delay patch back in, I removed the 'Map GPIO type 0x12 to reset' patch.
(20241221_revert_map_GPIO_type_0x12_to_reset_dmesg.txt), in which cam --list shows a camera present, but when I try
to access it, cam locks up, and my system locks up too (20241221_revert_map_GPIO_type_0x12_to_reset_2_dmesg.txt)

restoring this patch got everything working again

>
> 3. Regardless of 1. and 2. (re-apply them if necessary to get
> things to work again) try dropping "media: ov08x40: HACK disable
> 3856x2416 mode"
>
I then reverted this change (it had already been done in the original ov08x40.c I had, so I just used your patch info)
qcam -s "width=1928,height=1208"    works as it had before

qcam -s "width=3856,height=2416"  works, framerate is slower (went from 30 fps to 10 fps, and snapshot is 3852x2416
according to GIMP)

> 
> Once we know which patches are necessary we can see from there.
> 
----begin 20241221_original_sleep_delay_dmesg.txt ----------
[    0.000000] Linux version 6.13.0-rc2-ipu6+ (duane@DuanesSpectre16) (gcc (Debian 14.2.0-11) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241215) #6 SMP PREEMPT_DYNAMIC Sat Dec 21 14:53:27 CST 2024
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
[    0.000009] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000014] last_pfn = 0x880000 max_arch_pfn = 0x400000000
[    0.000017] MTRR map: 8 entries (3 fixed + 5 variable; max 23), built from 10 variable MTRRs
[    0.000019] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000467] x2apic: enabled by BIOS, switching to x2apic ops
[    0.000469] last_pfn = 0x66000 max_arch_pfn = 0x400000000
[    0.005181] esrt: Reserving ESRT space from 0x0000000055b40d18 to 0x0000000055b40d50.
[    0.005185] e820: update [mem 0x55b40000-0x55b40fff] usable ==> reserved
[    0.005198] Using GB pages for direct mapping
[    0.005433] Secure boot disabled
[    0.005433] RAMDISK: [mem 0x3c30e000-0x412b3fff]
[    0.005437] ACPI: Early table checksum verification disabled
[    0.005439] ACPI: RSDP 0x000000005AE6D014 000024 (v02 HPQOEM)
[    0.005442] ACPI: XSDT 0x000000005AE6C728 000194 (v01 HPQOEM SLIC-MPC 01072009 AMI  01000013)
[    0.005446] ACPI: FACP 0x000000005AE53000 000114 (v06 HPQOEM SLIC-MPC 01072009 HP   01000013)
[    0.005449] ACPI: DSDT 0x000000005ADDB000 077690 (v02 HPQOEM 8C17     01072009 ACPI 20210930)
[    0.005451] ACPI: FACS 0x000000005AFEA000 000040
[    0.005452] ACPI: SSDT 0x000000005AE6B000 000689 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005454] ACPI: SSDT 0x000000005AE6A000 0005E4 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005455] ACPI: SSDT 0x000000005AE69000 0001AB (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005456] ACPI: SSDT 0x000000005AE68000 000394 (v02 HPQOEM 8C17     00003001 ACPI 20210930)
[    0.005458] ACPI: SSDT 0x000000005AE66000 001BAF (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005459] ACPI: SSDT 0x000000005AE64000 001620 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005461] ACPI: SSDT 0x000000005AE62000 001349 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005462] ACPI: SSDT 0x000000005AE61000 000FBB (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005464] ACPI: SSDT 0x000000005AE5D000 003BC8 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005465] ACPI: DTPR 0x000000005AE5C000 000098 (v01 HPQOEM 8C17     00000000 HP   00000000)
[    0.005467] ACPI: SSDT 0x000000005AE56000 0058E1 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005468] ACPI: SSDT 0x000000005AE54000 00165F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005470] ACPI: FIDT 0x000000005ADDA000 00009C (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005472] ACPI: MSDM 0x000000005ADD9000 000055 (v03 HPQOEM SLIC-MPC 00000001 HP   00010013)
[    0.005473] ACPI: SSDT 0x000000005ADD8000 00038C (v02 HPQOEM 8C17     00000001 ACPI 20210930)
[    0.005475] ACPI: SSDT 0x000000005ADD5000 002494 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005477] ACPI: SSDT 0x000000005ADCA000 0000F9 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005478] ACPI: HPET 0x000000005ADC9000 000038 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005480] ACPI: APIC 0x000000005ADC8000 000358 (v05 HPQOEM 8C17     01072009 HP   01000013)
[    0.005481] ACPI: MCFG 0x000000005ADC7000 00003C (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005483] ACPI: SSDT 0x000000005ADC5000 00147F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005485] ACPI: SSDT 0x000000005ADC3000 00140F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005486] ACPI: SSDT 0x000000005ADB2000 01023F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005488] ACPI: UEFI 0x000000005AEF0000 000048 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005489] ACPI: NHLT 0x000000005ADB1000 000960 (v00 HPQOEM 8C17     01072009 HP   01000013)
[    0.005491] ACPI: LPIT 0x000000005ADB0000 0000CC (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005492] ACPI: SSDT 0x000000005ADAE000 000CA6 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005493] ACPI: SSDT 0x000000005ADA8000 005E42 (v02 HPQOEM 8C17     00000000 ACPI 20210930)
[    0.005495] ACPI: DBGP 0x000000005ADA7000 000034 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005496] ACPI: DBG2 0x000000005ADA6000 000054 (v00 HPQOEM 8C17     01072009 HP   01000013)
[    0.005498] ACPI: SSDT 0x000000005ADA4000 00113F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005499] ACPI: DMAR 0x000000005ADA3000 0000A8 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005501] ACPI: FPDT 0x000000005ADA2000 000044 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005502] ACPI: SSDT 0x000000005ADA0000 001021 (v02 HPQOEM 8C17     00000000 ACPI 20210930)
[    0.005504] ACPI: SSDT 0x000000005AD9D000 00281A (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005505] ACPI: SSDT 0x000000005AD9A000 0028D3 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005507] ACPI: SSDT 0x000000005AD99000 000060 (v01 HPQOEM 8C17     00000001 ACPI 20210930)
[    0.005508] ACPI: SSDT 0x000000005AD90000 0085C5 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005510] ACPI: OEM1 0x000000005AD8F000 0002B0 (v01 HPQOEM HPOEM1DC 00000000 HP   00000000)
[    0.005511] ACPI: SSDT 0x000000005AD8B000 003210 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005512] ACPI: PHAT 0x000000005AD8A000 000734 (v01 HPQOEM 8C17     00000005 HP   0100000D)
[    0.005514] ACPI: SSDT 0x000000005ADCB000 009BC2 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005515] ACPI: TPM2 0x000000005AD89000 00004C (v04 HPQOEM 8C17     00000001 HP   00000000)
[    0.005517] ACPI: WSMT 0x000000005ADAF000 000028 (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005518] ACPI: BGRT 0x000000005AD88000 000038 (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005519] ACPI: Reserving FACP table memory at [mem 0x5ae53000-0x5ae53113]
[    0.005520] ACPI: Reserving DSDT table memory at [mem 0x5addb000-0x5ae5268f]
[    0.005521] ACPI: Reserving FACS table memory at [mem 0x5afea000-0x5afea03f]
[    0.005521] ACPI: Reserving SSDT table memory at [mem 0x5ae6b000-0x5ae6b688]
[    0.005522] ACPI: Reserving SSDT table memory at [mem 0x5ae6a000-0x5ae6a5e3]
[    0.005522] ACPI: Reserving SSDT table memory at [mem 0x5ae69000-0x5ae691aa]
[    0.005522] ACPI: Reserving SSDT table memory at [mem 0x5ae68000-0x5ae68393]
[    0.005523] ACPI: Reserving SSDT table memory at [mem 0x5ae66000-0x5ae67bae]
[    0.005523] ACPI: Reserving SSDT table memory at [mem 0x5ae64000-0x5ae6561f]
[    0.005523] ACPI: Reserving SSDT table memory at [mem 0x5ae62000-0x5ae63348]
[    0.005524] ACPI: Reserving SSDT table memory at [mem 0x5ae61000-0x5ae61fba]
[    0.005524] ACPI: Reserving SSDT table memory at [mem 0x5ae5d000-0x5ae60bc7]
[    0.005525] ACPI: Reserving DTPR table memory at [mem 0x5ae5c000-0x5ae5c097]
[    0.005525] ACPI: Reserving SSDT table memory at [mem 0x5ae56000-0x5ae5b8e0]
[    0.005525] ACPI: Reserving SSDT table memory at [mem 0x5ae54000-0x5ae5565e]
[    0.005526] ACPI: Reserving FIDT table memory at [mem 0x5adda000-0x5adda09b]
[    0.005526] ACPI: Reserving MSDM table memory at [mem 0x5add9000-0x5add9054]
[    0.005526] ACPI: Reserving SSDT table memory at [mem 0x5add8000-0x5add838b]
[    0.005527] ACPI: Reserving SSDT table memory at [mem 0x5add5000-0x5add7493]
[    0.005527] ACPI: Reserving SSDT table memory at [mem 0x5adca000-0x5adca0f8]
[    0.005527] ACPI: Reserving HPET table memory at [mem 0x5adc9000-0x5adc9037]
[    0.005528] ACPI: Reserving APIC table memory at [mem 0x5adc8000-0x5adc8357]
[    0.005528] ACPI: Reserving MCFG table memory at [mem 0x5adc7000-0x5adc703b]
[    0.005529] ACPI: Reserving SSDT table memory at [mem 0x5adc5000-0x5adc647e]
[    0.005529] ACPI: Reserving SSDT table memory at [mem 0x5adc3000-0x5adc440e]
[    0.005529] ACPI: Reserving SSDT table memory at [mem 0x5adb2000-0x5adc223e]
[    0.005530] ACPI: Reserving UEFI table memory at [mem 0x5aef0000-0x5aef0047]
[    0.005530] ACPI: Reserving NHLT table memory at [mem 0x5adb1000-0x5adb195f]
[    0.005530] ACPI: Reserving LPIT table memory at [mem 0x5adb0000-0x5adb00cb]
[    0.005531] ACPI: Reserving SSDT table memory at [mem 0x5adae000-0x5adaeca5]
[    0.005531] ACPI: Reserving SSDT table memory at [mem 0x5ada8000-0x5adade41]
[    0.005532] ACPI: Reserving DBGP table memory at [mem 0x5ada7000-0x5ada7033]
[    0.005532] ACPI: Reserving DBG2 table memory at [mem 0x5ada6000-0x5ada6053]
[    0.005532] ACPI: Reserving SSDT table memory at [mem 0x5ada4000-0x5ada513e]
[    0.005533] ACPI: Reserving DMAR table memory at [mem 0x5ada3000-0x5ada30a7]
[    0.005533] ACPI: Reserving FPDT table memory at [mem 0x5ada2000-0x5ada2043]
[    0.005533] ACPI: Reserving SSDT table memory at [mem 0x5ada0000-0x5ada1020]
[    0.005534] ACPI: Reserving SSDT table memory at [mem 0x5ad9d000-0x5ad9f819]
[    0.005534] ACPI: Reserving SSDT table memory at [mem 0x5ad9a000-0x5ad9c8d2]
[    0.005535] ACPI: Reserving SSDT table memory at [mem 0x5ad99000-0x5ad9905f]
[    0.005535] ACPI: Reserving SSDT table memory at [mem 0x5ad90000-0x5ad985c4]
[    0.005535] ACPI: Reserving OEM1 table memory at [mem 0x5ad8f000-0x5ad8f2af]
[    0.005536] ACPI: Reserving SSDT table memory at [mem 0x5ad8b000-0x5ad8e20f]
[    0.005536] ACPI: Reserving PHAT table memory at [mem 0x5ad8a000-0x5ad8a733]
[    0.005536] ACPI: Reserving SSDT table memory at [mem 0x5adcb000-0x5add4bc1]
[    0.005537] ACPI: Reserving TPM2 table memory at [mem 0x5ad89000-0x5ad8904b]
[    0.005537] ACPI: Reserving WSMT table memory at [mem 0x5adaf000-0x5adaf027]
[    0.005538] ACPI: Reserving BGRT table memory at [mem 0x5ad88000-0x5ad88037]
[    0.005574] APIC: Switched APIC routing to: cluster x2apic
[    0.005769] No NUMA configuration found
[    0.005770] Faking a node at [mem 0x0000000000000000-0x000000087fffffff]
[    0.005774] NODE_DATA(0) allocated [mem 0x87ffd5680-0x87fffffff]
[    0.005930] Zone ranges:
[    0.005931]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.005932]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.005933]   Normal   [mem 0x0000000100000000-0x000000087fffffff]
[    0.005934]   Device   empty
[    0.005934] Movable zone start for each node
[    0.005935] Early memory node ranges
[    0.005935]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.005936]   node   0: [mem 0x0000000000100000-0x0000000057818fff]
[    0.005937]   node   0: [mem 0x0000000065fff000-0x0000000065ffffff]
[    0.005937]   node   0: [mem 0x0000000100000000-0x000000087fffffff]
[    0.005940] Initmem setup node 0 [mem 0x0000000000001000-0x000000087fffffff]
[    0.005943] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.005962] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.007834] On node 0, zone DMA32: 26598 pages in unavailable ranges
[    0.008064] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.008450] ACPI: PM-Timer IO Port: 0x1808
[    0.008457] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.008491] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.008493] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.008494] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.008497] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.008497] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.008505] e820: update [mem 0x5453a000-0x54563fff] usable ==> reserved
[    0.008512] TSC deadline timer available
[    0.008514] CPU topo: Max. logical packages:   1
[    0.008515] CPU topo: Max. logical dies:       1
[    0.008515] CPU topo: Max. dies per package:   1
[    0.008517] CPU topo: Max. threads per core:   2
[    0.008518] CPU topo: Num. cores per package:    16
[    0.008518] CPU topo: Num. threads per package:  22
[    0.008518] CPU topo: Allowing 22 present CPUs plus 0 hotplug CPUs
[    0.008529] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.008530] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.008531] PM: hibernation: Registered nosave memory: [mem 0x4fe69000-0x4fe69fff]
[    0.008532] PM: hibernation: Registered nosave memory: [mem 0x4fe78000-0x4fe78fff]
[    0.008533] PM: hibernation: Registered nosave memory: [mem 0x5453a000-0x54563fff]
[    0.008533] PM: hibernation: Registered nosave memory: [mem 0x55b40000-0x55b40fff]
[    0.008534] PM: hibernation: Registered nosave memory: [mem 0x57819000-0x5ad4dfff]
[    0.008534] PM: hibernation: Registered nosave memory: [mem 0x5ad4e000-0x5ae6dfff]
[    0.008535] PM: hibernation: Registered nosave memory: [mem 0x5ae6e000-0x5aff0fff]
[    0.008535] PM: hibernation: Registered nosave memory: [mem 0x5aff1000-0x65ffefff]
[    0.008536] PM: hibernation: Registered nosave memory: [mem 0x66000000-0x787fffff]
[    0.008536] PM: hibernation: Registered nosave memory: [mem 0x78800000-0xfdffffff]
[    0.008537] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.008537] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.008537] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.008538] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.008538] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.008538] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed1ffff]
[    0.008539] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfed7ffff]
[    0.008539] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xfedfffff]
[    0.008539] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.008540] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xffffffff]
[    0.008540] [mem 0x78800000-0xfdffffff] available for PCI devices
[    0.008541] Booting paravirtualized kernel on bare hardware
[    0.008543] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.011928] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:22 nr_cpu_ids:22 nr_node_ids:1
[    0.013270] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.013277] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=1*2097152
[    0.013279] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07 
[    0.013282] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15 
[    0.013284] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 -- -- 
[    0.013295] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+ root=UUID=7881f7bb-dbe6-4323-887f-dd718adb7a8b ro intel_skl_int3472_discrete.dyndbg
[    0.013327] Unknown kernel command line parameters "BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+", will be passed to user space.
[    0.013335] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.013336] printk: log_buf_len total cpu_extra contributions: 86016 bytes
[    0.013336] printk: log_buf_len min size: 131072 bytes
[    0.013487] printk: log buffer data + meta data: 262144 + 917504 = 1179648 bytes
[    0.013488] printk: early log buf free: 112520(85%)
[    0.016155] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.017488] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.017652] Fallback order for Node 0: 0 
[    0.017655] Built 1 zonelists, mobility grouping on.  Total pages: 8222648
[    0.017656] Policy zone: Normal
[    0.017662] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.017672] software IO TLB: area num 32.
[    0.033219] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=22, Nodes=1
[    0.033275] ftrace: allocating 45850 entries in 180 pages
[    0.044336] ftrace: allocated 180 pages with 4 groups
[    0.044898] Dynamic Preempt: voluntary
[    0.044964] rcu: Preemptible hierarchical RCU implementation.
[    0.044965] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=22.
[    0.044966] 	Trampoline variant of Tasks RCU enabled.
[    0.044966] 	Rude variant of Tasks RCU enabled.
[    0.044966] 	Tracing variant of Tasks RCU enabled.
[    0.044967] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.044967] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=22
[    0.044978] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.044985] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.044986] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.047508] NR_IRQS: 524544, nr_irqs: 2232, preallocated irqs: 16
[    0.047797] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.047966] Console: colour dummy device 80x25
[    0.047968] printk: legacy console [tty0] enabled
[    0.048197] ACPI: Core revision 20240827
[    0.048508] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.048601] APIC: Switch to symmetric I/O mode setup
[    0.048603] DMAR: Host address width 42
[    0.048605] DMAR: DRHD base: 0x000000fc800000 flags: 0x0
[    0.048611] DMAR: dmar0: reg_base_addr fc800000 ver 7:0 cap c9de008cee690462 ecap 12ca9a00f0ef5e
[    0.048614] DMAR: DRHD base: 0x000000fc801000 flags: 0x1
[    0.048620] DMAR: dmar1: reg_base_addr fc801000 ver 7:0 cap c9de008cee690462 ecap 12ca9a00f0efde
[    0.048622] DMAR: SATC flags: 0x1
[    0.048625] DMAR-IR: IOAPIC id 2 under DRHD base  0xfc801000 IOMMU 1
[    0.048626] DMAR-IR: HPET id 0 under DRHD base 0xfc801000
[    0.048628] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.050239] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.054199] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.054206] Calibrating delay loop (skipped), value calculated using timer frequency.. 5990.40 BogoMIPS (lpj=11980800)
[    0.054263] CPU0: Thermal monitoring enabled (TM1)
[    0.054266] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.054438] CET detected: Indirect Branch Tracking enabled
[    0.054440] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.054441] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.054444] process: using mwait in idle threads
[    0.054446] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.054448] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.054450] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.054452] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.054454] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.054463] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.054464] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.054466] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.054467] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.054468] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
[    0.054470] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.054471] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.054472] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.054474] x86/fpu: Enabled xstate features 0xa07, context size is 856 bytes, using 'compacted' format.
[    0.058204] Freeing SMP alternatives memory: 40K
[    0.058204] pid_max: default: 32768 minimum: 301
[    0.058204] LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor,tomoyo,bpf,ima,evm
[    0.058204] landlock: Up and running.
[    0.058204] Yama: becoming mindful.
[    0.058204] AppArmor: AppArmor initialized
[    0.058204] TOMOYO Linux initialized
[    0.058204] LSM support for eBPF active
[    0.058204] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.058204] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.058204] smpboot: CPU0: Intel(R) Core(TM) Ultra 7 155H (family: 0x6, model: 0xaa, stepping: 0x4)
[    0.058204] Performance Events: XSAVE Architectural LBR, PEBS fmt4+-baseline,  AnyThread deprecated, Meteorlake Hybrid events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.058204] core: cpu_core PMU driver: 
[    0.058204] ... version:                5
[    0.058204] ... bit width:              48
[    0.058204] ... generic registers:      8
[    0.058204] ... value mask:             0000ffffffffffff
[    0.058204] ... max period:             00007fffffffffff
[    0.058204] ... fixed-purpose events:   4
[    0.058204] ... event mask:             0001000f000000ff
[    0.058204] signal: max sigframe size: 3632
[    0.058204] Estimated ratio of average max frequency by base frequency (times 1024): 1638
[    0.058204] rcu: Hierarchical SRCU implementation.
[    0.058204] rcu: 	Max phase no-delay instances is 1000.
[    0.058204] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.058204] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.058204] smp: Bringing up secondary CPUs ...
[    0.058204] smpboot: x86: Booting SMP configuration:
[    0.058204] .... node  #0, CPUs:        #1  #3  #6  #8 #10 #12 #13 #14 #15 #16 #17 #18 #19 #20 #21
[    0.010279] core: cpu_atom PMU driver: PEBS-via-PT 
[    0.010279] ... version:                5
[    0.010279] ... bit width:              48
[    0.010279] ... generic registers:      8
[    0.010279] ... value mask:             0000ffffffffffff
[    0.010279] ... max period:             00007fffffffffff
[    0.010279] ... fixed-purpose events:   3
[    0.010279] ... event mask:             00000007000000ff
[    0.066299]   #2  #4  #5  #7  #9 #11
[    0.074287] smp: Brought up 1 node, 22 CPUs
[    0.074287] smpboot: Total of 22 processors activated (131788.80 BogoMIPS)
[    0.094263] node 0 deferred pages initialised in 16ms
[    0.096943] Memory: 32106408K/32890592K available (16384K kernel code, 2504K rwdata, 6904K rodata, 4148K init, 4924K bss, 762380K reserved, 0K cma-reserved)
[    0.096943] devtmpfs: initialized
[    0.096943] x86/mm: Memory block size: 128MB
[    0.099506] ACPI: PM: Registering ACPI NVS region [mem 0x5ae6e000-0x5aff0fff] (1585152 bytes)
[    0.099506] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.099506] futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
[    0.099506] pinctrl core: initialized pinctrl subsystem
[    0.099506] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.099506] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.099649] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.100015] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.100023] audit: initializing netlink subsys (disabled)
[    0.100030] audit: type=2000 audit(1734814591.000:1): state=initialized audit_enabled=0 res=1
[    0.100030] thermal_sys: Registered thermal governor 'fair_share'
[    0.100030] thermal_sys: Registered thermal governor 'bang_bang'
[    0.100030] thermal_sys: Registered thermal governor 'step_wise'
[    0.100030] thermal_sys: Registered thermal governor 'user_space'
[    0.100030] thermal_sys: Registered thermal governor 'power_allocator'
[    0.100030] cpuidle: using governor ladder
[    0.100030] cpuidle: using governor menu
[    0.100030] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.100030] PCI: ECAM [mem 0xc0000000-0xcfffffff] (base 0xc0000000) for domain 0000 [bus 00-ff]
[    0.100030] PCI: Using configuration type 1 for base access
[    0.100030] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.100030] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.100030] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.100030] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.100030] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.102265] ACPI: Added _OSI(Module Device)
[    0.102266] ACPI: Added _OSI(Processor Device)
[    0.102267] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.102269] ACPI: Added _OSI(Processor Aggregator Device)
[    0.163834] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PACT], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163839] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163841] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PABN], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163844] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163845] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PAS1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163848] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163851] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PMP0], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163853] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163862] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PMP1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163866] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163873] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA01], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163876] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163878] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.163880] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA02], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163882] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163883] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.163885] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA03], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163887] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163888] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.163890] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA04], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163892] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163893] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.163895] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA05], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163897] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163898] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.163900] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA06], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163902] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163903] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.163905] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA07], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163907] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163909] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.163910] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA08], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.163912] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.163913] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.164714] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.I2C3.TPD0], AE_NOT_FOUND (20240827/dswload2-162)
[    0.164717] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.164718] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.170126] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS01], AE_NOT_FOUND (20240827/dswload2-162)
[    0.170129] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.170131] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.170133] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS02], AE_NOT_FOUND (20240827/dswload2-162)
[    0.170135] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.170137] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.170138] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS03], AE_NOT_FOUND (20240827/dswload2-162)
[    0.170140] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.170142] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.170144] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS04], AE_NOT_FOUND (20240827/dswload2-162)
[    0.170146] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.170147] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.170163] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170166] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170167] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170169] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170171] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170173] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170176] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170178] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170180] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170181] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170183] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170185] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170188] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS03._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170190] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170192] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170193] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS03._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170195] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170197] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170201] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS04._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170203] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170205] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170212] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS04._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170244] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170255] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170296] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS05._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170311] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170321] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170329] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS05._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170341] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170350] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170369] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS06._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170381] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170385] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170388] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS06._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170392] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170395] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170400] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS07._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170405] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170408] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170410] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS07._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170414] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170417] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170423] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS08._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170427] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170430] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170433] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS08._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170437] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170440] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170445] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS09._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170449] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170452] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170455] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS09._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170459] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170462] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170468] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS10._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170472] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170475] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170478] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS10._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170482] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170485] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170649] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170654] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170657] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170660] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170664] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170667] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170673] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170677] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170680] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.170683] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170687] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170690] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.178295] ACPI: 28 ACPI AML tables successfully acquired and loaded
[    0.194315] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomain+
[    0.194315] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomain+
[    0.200804] ACPI: EC: EC started
[    0.200807] ACPI: EC: interrupt blocked
[    0.210417] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.210421] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC used to handle transactions
[    0.210424] ACPI: Interpreter enabled
[    0.210497] ACPI: PM: (supports S0 S3 S4 S5)
[    0.210500] ACPI: Using IOAPIC for interrupt routing
[    0.210567] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.210570] PCI: Ignoring E820 reservations for host bridge windows
[    0.213240] ACPI: Enabled 10 GPEs in block 00 to 7F
[    0.213262] ACPI: Enabled 8 GPEs in block 80 to DF
[    0.215845] ACPI: \_SB_.PC00.RP01.PXP_: New power resource
[    0.220855] ACPI: \_SB_.PC00.RP06.PXP_: New power resource
[    0.222391] ACPI: \_SB_.PC00.RP07.PXP_: New power resource
[    0.224991] ACPI: \_SB_.PC00.RP09.PXP_: New power resource
[    0.226199] ACPI: \_SB_.PC00.RP10.PXP_: New power resource
[    0.227600] ACPI: \_SB_.PC00.RP11.PXP_: New power resource
[    0.229098] ACPI: \_SB_.PC00.RP12.PXP_: New power resource
[    0.232734] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.BTRT: New power resource
[    0.232790] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.DBTR: New power resource
[    0.232947] ACPI: \_SB_.PC00.PAUD: New power resource
[    0.238632] ACPI: \_SB_.PC00.I2C3.PXTC: New power resource
[    0.244909] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.262417] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.262479] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.262537] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.280531] ACPI: \PIN_: New power resource
[    0.281125] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-fe])
[    0.281133] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.281978] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.283611] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME PCIeCapability LTR]
[    0.285461] PCI host bridge to bus 0000:00
[    0.285466] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.285469] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.285471] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.285476] pci_bus 0000:00: root bus resource [mem 0x80000000-0xbfffffff window]
[    0.285478] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x3ffbfffffff window]
[    0.285481] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.287512] pci 0000:00:00.0: [8086:7d01] type 00 class 0x060000 conventional PCI endpoint
[    0.287654] pci 0000:00:02.0: [8086:7d55] type 00 class 0x030000 PCIe Root Complex Integrated Endpoint
[    0.287669] pci 0000:00:02.0: BAR 0 [mem 0x5220000000-0x5220ffffff 64bit pref]
[    0.287679] pci 0000:00:02.0: BAR 2 [mem 0x4210000000-0x421fffffff 64bit pref]
[    0.287713] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.287718] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.287754] pci 0000:00:02.0: PME# supported from D0 D3hot
[    0.287773] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit pref]
[    0.287776] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit pref]: contains BAR 0 for 7 VFs
[    0.287961] pci 0000:00:04.0: [8086:7d03] type 00 class 0x118000 conventional PCI endpoint
[    0.287978] pci 0000:00:04.0: BAR 0 [mem 0x52312c0000-0x52312dffff 64bit]
[    0.288223] pci 0000:00:05.0: [8086:7d19] type 00 class 0x048000 PCIe Root Complex Integrated Endpoint
[    0.288233] pci 0000:00:05.0: BAR 0 [mem 0x5230000000-0x5230ffffff 64bit]
[    0.288250] pci 0000:00:05.0: enabling Extended Tags
[    0.288375] pci 0000:00:06.0: [8086:7ecb] type 01 class 0x060400 PCIe Root Port
[    0.288407] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.288421] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff]
[    0.288540] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.288628] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.289492] pci 0000:00:07.0: [8086:7ec4] type 01 class 0x060400 PCIe Root Port
[    0.289520] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.289527] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff]
[    0.289543] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.289655] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.289691] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.290478] pci 0000:00:07.2: [8086:7ec6] type 01 class 0x060400 PCIe Root Port
[    0.290506] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.290513] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff]
[    0.290523] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.290639] pci 0000:00:07.2: PME# supported from D0 D3hot D3cold
[    0.290671] pci 0000:00:07.2: PTM enabled (root), 4ns granularity
[    0.291439] pci 0000:00:08.0: [8086:7e4c] type 00 class 0x088000 conventional PCI endpoint
[    0.291455] pci 0000:00:08.0: BAR 0 [mem 0x5231327000-0x5231327fff 64bit]
[    0.291569] pci 0000:00:0a.0: [8086:7d0d] type 00 class 0x118000 PCIe Root Complex Integrated Endpoint
[    0.291579] pci 0000:00:0a.0: BAR 0 [mem 0x5231280000-0x52312bffff 64bit]
[    0.291597] pci 0000:00:0a.0: enabling Extended Tags
[    0.291670] pci 0000:00:0b.0: [8086:7d1d] type 00 class 0x120000 PCIe Root Complex Integrated Endpoint
[    0.291682] pci 0000:00:0b.0: BAR 0 [mem 0x5228000000-0x522fffffff 64bit]
[    0.291695] pci 0000:00:0b.0: BAR 4 [mem 0x5231326000-0x5231326fff 64bit]
[    0.291819] pci 0000:00:0d.0: [8086:7ec0] type 00 class 0x0c0330 conventional PCI endpoint
[    0.291836] pci 0000:00:0d.0: BAR 0 [mem 0x5231300000-0x523130ffff 64bit]
[    0.291929] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.292363] pci 0000:00:0d.2: [8086:7ec2] type 00 class 0x0c0340 conventional PCI endpoint
[    0.292380] pci 0000:00:0d.2: BAR 0 [mem 0x5231240000-0x523127ffff 64bit]
[    0.292391] pci 0000:00:0d.2: BAR 2 [mem 0x5231325000-0x5231325fff 64bit]
[    0.292525] pci 0000:00:0d.2: supports D1 D2
[    0.292527] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.292626] pci 0000:00:0d.3: [8086:7ec3] type 00 class 0x0c0340 conventional PCI endpoint
[    0.292642] pci 0000:00:0d.3: BAR 0 [mem 0x5231200000-0x523123ffff 64bit]
[    0.292653] pci 0000:00:0d.3: BAR 2 [mem 0x5231324000-0x5231324fff 64bit]
[    0.292745] pci 0000:00:0d.3: supports D1 D2
[    0.292747] pci 0000:00:0d.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.292871] pci 0000:00:12.0: [8086:7e45] type 00 class 0x070000 conventional PCI endpoint
[    0.292886] pci 0000:00:12.0: BAR 0 [mem 0x52312f0000-0x52312fffff 64bit]
[    0.292938] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.293638] pci 0000:00:14.0: [8086:7e7d] type 00 class 0x0c0330 conventional PCI endpoint
[    0.293655] pci 0000:00:14.0: BAR 0 [mem 0x52312e0000-0x52312effff 64bit]
[    0.293716] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.294120] pci 0000:00:14.2: [8086:7e7f] type 00 class 0x050000 conventional PCI endpoint
[    0.294139] pci 0000:00:14.2: BAR 0 [mem 0x5231318000-0x523131bfff 64bit]
[    0.294152] pci 0000:00:14.2: BAR 2 [mem 0x5231323000-0x5231323fff 64bit]
[    0.294258] pci 0000:00:14.3: [8086:7e40] type 00 class 0x028000 PCIe Root Complex Integrated Endpoint
[    0.294285] pci 0000:00:14.3: BAR 0 [mem 0x5231314000-0x5231317fff 64bit]
[    0.294372] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.294602] pci 0000:00:15.0: [8086:7e78] type 00 class 0x0c8000 conventional PCI endpoint
[    0.294655] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.295007] pci 0000:00:15.1: [8086:7e79] type 00 class 0x0c8000 conventional PCI endpoint
[    0.295064] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.295451] pci 0000:00:15.3: [8086:7e7b] type 00 class 0x0c8000 conventional PCI endpoint
[    0.295502] pci 0000:00:15.3: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.295846] pci 0000:00:16.0: [8086:7e70] type 00 class 0x078000 conventional PCI endpoint
[    0.295866] pci 0000:00:16.0: BAR 0 [mem 0x523131f000-0x523131ffff 64bit]
[    0.295949] pci 0000:00:16.0: PME# supported from D3hot
[    0.296691] pci 0000:00:19.0: [8086:7e50] type 00 class 0x0c8000 conventional PCI endpoint
[    0.296742] pci 0000:00:19.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.297092] pci 0000:00:19.1: [8086:7e51] type 00 class 0x0c8000 conventional PCI endpoint
[    0.297144] pci 0000:00:19.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.297469] pci 0000:00:1c.0: [8086:7e38] type 01 class 0x060400 PCIe Root Port
[    0.297492] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.297496] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.297500] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff]
[    0.297508] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.297570] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.297600] pci 0000:00:1c.0: PTM enabled (root), 4ns granularity
[    0.298227] pci 0000:00:1f.0: [8086:7e02] type 00 class 0x060100 conventional PCI endpoint
[    0.298603] pci 0000:00:1f.3: [8086:7e28] type 00 class 0x040100 conventional PCI endpoint
[    0.298629] pci 0000:00:1f.3: BAR 0 [mem 0x5231310000-0x5231313fff 64bit]
[    0.298654] pci 0000:00:1f.3: BAR 4 [mem 0x5231000000-0x52311fffff 64bit]
[    0.298719] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.298790] pci 0000:00:1f.4: [8086:7e22] type 00 class 0x0c0500 conventional PCI endpoint
[    0.298811] pci 0000:00:1f.4: BAR 0 [mem 0x523131c000-0x523131c0ff 64bit]
[    0.298836] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.299056] pci 0000:00:1f.5: [8086:7e23] type 00 class 0x0c8000 conventional PCI endpoint
[    0.299092] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.299600] pci 0000:01:00.0: [1c5c:1959] type 00 class 0x010802 PCIe Endpoint
[    0.299620] pci 0000:01:00.0: BAR 0 [mem 0x8d200000-0x8d203fff 64bit]
[    0.299916] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.299966] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.300019] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.300074] pci 0000:56:00.0: [10de:28a1] type 00 class 0x030000 PCIe Legacy Endpoint
[    0.300089] pci 0000:56:00.0: BAR 0 [mem 0x8c000000-0x8cffffff]
[    0.300100] pci 0000:56:00.0: BAR 1 [mem 0x4000000000-0x41ffffffff 64bit pref]
[    0.300112] pci 0000:56:00.0: BAR 3 [mem 0x4200000000-0x4201ffffff 64bit pref]
[    0.300120] pci 0000:56:00.0: BAR 5 [io  0x3000-0x307f]
[    0.300128] pci 0000:56:00.0: ROM [mem 0x8d000000-0x8d07ffff pref]
[    0.300192] pci 0000:56:00.0: PME# supported from D0 D3hot
[    0.300274] pci 0000:56:00.0: 63.012 Gb/s available PCIe bandwidth, limited by 16.0 GT/s PCIe x4 link at 0000:00:1c.0 (capable of 126.024 Gb/s with 16.0 GT/s PCIe x8 link)
[    0.300473] pci 0000:56:00.1: [10de:22be] type 00 class 0x040300 PCIe Endpoint
[    0.300486] pci 0000:56:00.1: BAR 0 [mem 0x8d080000-0x8d083fff]
[    0.300628] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.305100] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.305241] ACPI: PCI: Interrupt link LNKB configured for IRQ 1
[    0.305377] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.305512] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.305647] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.305783] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.305919] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.306054] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.306996] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x1)
[    0.443478] Low-power S0 idle used by default for system suspend
[    0.453796] ACPI: EC: interrupt unblocked
[    0.453799] ACPI: EC: event unblocked
[    0.453820] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.453822] ACPI: EC: GPE=0x6e
[    0.453824] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC initialization complete
[    0.453827] ACPI: \_SB_.PC00.LPCB.EC0_: EC: Used to handle transactions and events
[    0.453924] iommu: Default domain type: Translated
[    0.453924] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.453924] pps_core: LinuxPPS API ver. 1 registered
[    0.453924] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.453924] PTP clock support registered
[    0.453924] EDAC MC: Ver: 3.0.0
[    0.454307] efivars: Registered efivars operations
[    0.454452] NetLabel: Initializing
[    0.454454] NetLabel:  domain hash size = 128
[    0.454456] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.454475] NetLabel:  unlabeled traffic allowed by default
[    0.454482] PCI: Using ACPI for IRQ routing
[    0.465889] PCI: pci_cache_line_size set to 64 bytes
[    0.466046] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't claim; no compatible bridge window
[    0.466170] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.466172] e820: reserve RAM buffer [mem 0x4fe69018-0x4fffffff]
[    0.466173] e820: reserve RAM buffer [mem 0x5453a000-0x57ffffff]
[    0.466174] e820: reserve RAM buffer [mem 0x55b40000-0x57ffffff]
[    0.466175] e820: reserve RAM buffer [mem 0x57819000-0x57ffffff]
[    0.466176] e820: reserve RAM buffer [mem 0x66000000-0x67ffffff]
[    0.466243] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.466243] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.466243] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.466243] pci 0000:56:00.0: vgaarb: bridge control possible
[    0.466243] pci 0000:56:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.466243] vgaarb: loaded
[    0.466300] clocksource: Switched to clocksource tsc-early
[    0.466434] VFS: Disk quotas dquot_6.6.0
[    0.466445] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.466572] AppArmor: AppArmor Filesystem Enabled
[    0.466586] pnp: PnP ACPI init
[    0.466778] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.466783] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.466919] system 00:01: [io  0x1854-0x1857] has been reserved
[    0.467638] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.467644] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.467671] system 00:03: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    0.467674] system 00:03: [mem 0xc0000000-0xcfffffff] has been reserved
[    0.467676] system 00:03: [mem 0xfed20000-0xfed7ffff] could not be reserved
[    0.467679] system 00:03: [mem 0xfc800000-0xfc81ffff] could not be reserved
[    0.467681] system 00:03: [mem 0xfed45000-0xfed8ffff] could not be reserved
[    0.467684] system 00:03: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.469253] system 00:04: [io  0x2000-0x20fe] has been reserved
[    0.469572] system 00:05: [mem 0xfe02c008-0xfe02cfff] has been reserved
[    0.469576] system 00:05: [mem 0xfe02d000-0xfe02dfff] has been reserved
[    0.470528] pnp: PnP ACPI: found 6 devices
[    0.476131] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.476203] NET: Registered PF_INET protocol family
[    0.476450] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.479421] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.479466] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.479868] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.480286] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.480393] TCP: Hash tables configured (established 262144 bind 65536)
[    0.480581] MPTCP token hash table entries: 32768 (order: 7, 786432 bytes, linear)
[    0.480731] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.480906] UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.481023] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.481032] NET: Registered PF_XDP protocol family
[    0.481039] pci_bus 0000:00: max bus depth: 1 pci_try_num: 2
[    0.481053] pci 0000:00:02.0: VF BAR 0 [mem 0x4202000000-0x4208ffffff 64bit pref]: assigned
[    0.481060] pci 0000:00:07.0: bridge window [io  0x4000-0x4fff]: assigned
[    0.481064] pci 0000:00:07.2: bridge window [io  0x5000-0x5fff]: assigned
[    0.481067] pci 0000:00:15.0: BAR 0 [mem 0x4209000000-0x4209000fff 64bit]: assigned
[    0.481107] pci 0000:00:15.1: BAR 0 [mem 0x4209001000-0x4209001fff 64bit]: assigned
[    0.481153] pci 0000:00:15.3: BAR 0 [mem 0x4209002000-0x4209002fff 64bit]: assigned
[    0.481199] pci 0000:00:19.0: BAR 0 [mem 0x4209003000-0x4209003fff 64bit]: assigned
[    0.481242] pci 0000:00:19.1: BAR 0 [mem 0x4209004000-0x4209004fff 64bit]: assigned
[    0.481285] pci 0000:00:1f.5: BAR 0 [mem 0x8d100000-0x8d100fff]: assigned
[    0.481296] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.481303] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff]
[    0.481311] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.481318] pci 0000:00:07.0:   bridge window [io  0x4000-0x4fff]
[    0.481323] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff]
[    0.481327] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.481333] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.481336] pci 0000:00:07.2:   bridge window [io  0x5000-0x5fff]
[    0.481340] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff]
[    0.481344] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.481352] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.481354] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.481358] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff]
[    0.481362] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.481368] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.481370] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.481372] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.481375] pci_bus 0000:00: resource 7 [mem 0x80000000-0xbfffffff window]
[    0.481377] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x3ffbfffffff window]
[    0.481380] pci_bus 0000:01: resource 1 [mem 0x8d200000-0x8d2fffff]
[    0.481382] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.481384] pci_bus 0000:02: resource 1 [mem 0x86000000-0x8bffffff]
[    0.481386] pci_bus 0000:02: resource 2 [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.481389] pci_bus 0000:2c: resource 0 [io  0x5000-0x5fff]
[    0.481391] pci_bus 0000:2c: resource 1 [mem 0x80000000-0x85ffffff]
[    0.481393] pci_bus 0000:2c: resource 2 [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.481396] pci_bus 0000:56: resource 0 [io  0x3000-0x3fff]
[    0.481398] pci_bus 0000:56: resource 1 [mem 0x8c000000-0x8d0fffff]
[    0.481400] pci_bus 0000:56: resource 2 [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.481982] pci 0000:56:00.1: extending delay after power-on from D3hot to 20 msec
[    0.482008] pci 0000:56:00.1: D0 power state depends on 0000:56:00.0
[    0.482015] PCI: CLS 64 bytes, default 64
[    0.482077] DMAR: Intel-IOMMU force enabled due to platform opt in
[    0.482087] DMAR: No RMRR found
[    0.482089] DMAR: No ATSR found
[    0.482091] DMAR: IOMMU feature sc_support inconsistent
[    0.482093] DMAR: dmar0: Using Queued invalidation
[    0.482098] DMAR: dmar1: Using Queued invalidation
[    0.482120] Trying to unpack rootfs image as initramfs...
[    0.482494] pci 0000:00:02.0: Adding to iommu group 0
[    0.482531] pci 0000:00:00.0: Adding to iommu group 1
[    0.482543] pci 0000:00:04.0: Adding to iommu group 2
[    0.482554] pci 0000:00:05.0: Adding to iommu group 3
[    0.482588] pci 0000:00:06.0: Adding to iommu group 4
[    0.482610] pci 0000:00:07.0: Adding to iommu group 5
[    0.482622] pci 0000:00:07.2: Adding to iommu group 6
[    0.482632] pci 0000:00:08.0: Adding to iommu group 7
[    0.482644] pci 0000:00:0a.0: Adding to iommu group 8
[    0.482658] pci 0000:00:0b.0: Adding to iommu group 9
[    0.482681] pci 0000:00:0d.0: Adding to iommu group 10
[    0.482692] pci 0000:00:0d.2: Adding to iommu group 10
[    0.482703] pci 0000:00:0d.3: Adding to iommu group 10
[    0.482720] pci 0000:00:12.0: Adding to iommu group 11
[    0.482738] pci 0000:00:14.0: Adding to iommu group 12
[    0.482749] pci 0000:00:14.2: Adding to iommu group 12
[    0.482760] pci 0000:00:14.3: Adding to iommu group 13
[    0.482783] pci 0000:00:15.0: Adding to iommu group 14
[    0.482795] pci 0000:00:15.1: Adding to iommu group 14
[    0.482807] pci 0000:00:15.3: Adding to iommu group 14
[    0.482821] pci 0000:00:16.0: Adding to iommu group 15
[    0.482839] pci 0000:00:19.0: Adding to iommu group 16
[    0.482851] pci 0000:00:19.1: Adding to iommu group 16
[    0.482863] pci 0000:00:1c.0: Adding to iommu group 17
[    0.482888] pci 0000:00:1f.0: Adding to iommu group 18
[    0.482901] pci 0000:00:1f.3: Adding to iommu group 18
[    0.482913] pci 0000:00:1f.4: Adding to iommu group 18
[    0.482926] pci 0000:00:1f.5: Adding to iommu group 18
[    0.482962] pci 0000:01:00.0: Adding to iommu group 19
[    0.482983] pci 0000:56:00.0: Adding to iommu group 20
[    0.482996] pci 0000:56:00.1: Adding to iommu group 20
[    0.483338] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.483340] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.483343] software IO TLB: mapped [mem 0x00000000480b8000-0x000000004c0b8000] (64MB)
[    0.483376] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.483415] clocksource: Switched to clocksource tsc
[    0.483442] platform rtc_cmos: registered platform RTC device (no PNP device found)
[    0.486940] Initialise system trusted keyrings
[    0.486953] Key type blacklist registered
[    0.486987] workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.486996] zbud: loaded
[    0.487088] fuse: init (API version 7.41)
[    0.487215] integrity: Platform Keyring initialized
[    0.487221] integrity: Machine keyring initialized
[    0.496428] Key type asymmetric registered
[    0.496431] Asymmetric key parser 'x509' registered
[    0.996253] Freeing initrd memory: 81560K
[    1.000929] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
[    1.000971] io scheduler mq-deadline registered
[    1.002565] ledtrig-cpu: registered to indicate activity on CPUs
[    1.003275] pcieport 0000:00:06.0: PME: Signaling with IRQ 122
[    1.003714] pcieport 0000:00:07.0: PME: Signaling with IRQ 123
[    1.003740] pcieport 0000:00:07.0: pciehp: Slot #12 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    1.004069] pcieport 0000:00:07.2: PME: Signaling with IRQ 124
[    1.004088] pcieport 0000:00:07.2: pciehp: Slot #14 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    1.004375] pcieport 0000:00:1c.0: PME: Signaling with IRQ 125
[    1.004476] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.016501] ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-274000)
[    1.019411] thermal LNXTHERM:00: registered as thermal_zone0
[    1.019414] ACPI: thermal: Thermal Zone [TZ01] (76 C)
[    1.019610] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.020330] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    1.020675] hpet_acpi_add: no address or irqs in _CRS
[    1.020699] Linux agpgart interface v0.103
[    1.023085] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1D, rev-id 54)
[    1.137127] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    1.137133] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    1.138745] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.139041] mousedev: PS/2 mouse device common for all mice
[    1.139066] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.139878] rtc_cmos rtc_cmos: registered as rtc0
[    1.140010] rtc_cmos rtc_cmos: setting system clock to 2024-12-21T20:56:32 UTC (1734814592)
[    1.140034] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nvram
[    1.142755] intel_pstate: Intel P-state driver initializing
[    1.147682] intel_pstate: HWP enabled
[    1.147782] efifb: probing for efifb
[    1.147789] efifb: framebuffer at 0x70800000, using 20252k, total 20250k
[    1.147790] efifb: mode is 2880x1800x32, linelength=11520, pages=1
[    1.147791] efifb: scrolling: redraw
[    1.147792] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    1.149398] Console: switching to colour frame buffer device 180x56
[    1.150930] fb0: EFI VGA frame buffer device
[    1.151053] NET: Registered PF_INET6 protocol family
[    1.154875] Segment Routing with IPv6
[    1.154900] In-situ OAM (IOAM) with IPv6
[    1.154937] mip6: Mobile IPv6
[    1.154952] NET: Registered PF_PACKET protocol family
[    1.154994] mpls_gso: MPLS GSO support
[    1.157420] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.158950] microcode: Current revision: 0x00000020
[    1.158971] microcode: Updated early from: 0x0000001f
[    1.160137] IPI shorthand broadcast: enabled
[    1.161065] sched_clock: Marking stable (1153822321, 6279942)->(1202198619, -42096356)
[    1.161873] registered taskstats version 1
[    1.161999] Loading compiled-in X.509 certificates
[    1.179664] Loaded X.509 cert 'Build time autogenerated kernel key: 24a2ef881874b1f607ad746af78b458b87f50423'
[    1.181343] Demotion targets for Node 0: null
[    1.181925] Key type .fscrypt registered
[    1.181936] Key type fscrypt-provisioning registered
[    1.194967] Key type encrypted registered
[    1.195004] AppArmor: AppArmor sha256 policy hashing enabled
[    1.195328] integrity: Loading X.509 certificate: UEFI:db
[    1.195383] integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    1.195433] integrity: Loading X.509 certificate: UEFI:db
[    1.195483] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
[    1.195527] integrity: Loading X.509 certificate: UEFI:db
[    1.195570] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    1.195622] integrity: Loading X.509 certificate: UEFI:db
[    1.195667] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.195716] integrity: Loading X.509 certificate: UEFI:db
[    1.195762] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.197131] ima: Allocated hash algorithm: sha256
[    1.203810] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    1.353376] ima: No architecture policies found
[    1.354778] evm: Initialising EVM extended attributes:
[    1.355866] evm: security.selinux
[    1.356599] evm: security.SMACK64 (disabled)
[    1.357320] evm: security.SMACK64EXEC (disabled)
[    1.358027] evm: security.SMACK64TRANSMUTE (disabled)
[    1.358733] evm: security.SMACK64MMAP (disabled)
[    1.359431] evm: security.apparmor
[    1.360167] evm: security.ima
[    1.360841] evm: security.capability
[    1.361509] evm: HMAC attrs: 0x1
[    1.365642] RAS: Correctable Errors collector initialized.
[    1.366621] clk: Disabling unused clocks
[    1.367433] PM: genpd: Disabling unused power domains
[    1.370146] Freeing unused decrypted memory: 2028K
[    1.371797] Freeing unused kernel image (initmem) memory: 4148K
[    1.372406] Write protecting the kernel read-only data: 24576k
[    1.374383] Freeing unused kernel image (rodata/data gap) memory: 1288K
[    1.380067] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.380587] Run /init as init process
[    1.381137]   with arguments:
[    1.381138]     /init
[    1.381138]   with environment:
[    1.381139]     HOME=/
[    1.381139]     TERM=linux
[    1.381139]     BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+
[    1.441009] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    1.441604] ACPI: button: Sleep Button [SLPB]
[    1.442200] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
[    1.443027] ACPI: button: Lid Switch [LID0]
[    1.443761] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input3
[    1.451924] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    1.452809] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    1.453730] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 7391A661-223A-47DB-A77A-7BE84C60822D has zero instances
[    1.454704] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: DF4E63B6-3BBC-4858-9737-C74F82F821F3 has zero instances
[    1.467124] ACPI: bus type drm_connector registered
[    1.469486] ACPI: bus type thunderbolt registered
[    1.470305] ACPI: button: Power Button [PWRB]
[    1.470967] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
[    1.471699] ACPI: button: Power Button [PWRF]
[    1.478678] ACPI: battery: Slot [BAT0] (battery present)
[    1.481307] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    1.482388] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    1.484371] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    1.485518] nvme nvme0: pci function 0000:01:00.0
[    1.487225] hid: raw HID events driver (C) Jiri Kosina
[    1.490274] ACPI: bus type USB registered
[    1.491134] usbcore: registered new interface driver usbfs
[    1.491676] usbcore: registered new interface driver hub
[    1.492203] usbcore: registered new device driver usb
[    1.494293] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
[    1.495202] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    1.505897] nvme nvme0: 22/0/0 default/read/poll queues
[    1.510898]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.512590] intel-lpss 0000:00:15.1: enabling device (0004 -> 0006)
[    1.513471] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    1.530293] intel-lpss 0000:00:15.3: enabling device (0004 -> 0006)
[    1.531597] idma64 idma64.2: Found Intel integrated DMA 64-bit
[    1.550031] intel-lpss 0000:00:19.0: enabling device (0004 -> 0006)
[    1.569465] intel-lpss 0000:00:19.1: enabling device (0004 -> 0006)
[    1.688371] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[    1.808303] i2c_hid_acpi i2c-ELAN2513:00: i2c_hid_get_input: IRQ triggered but there's no data
[    1.810445] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.811812] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    1.813321] input: ELAN07CE:00 04F3:32C8 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input5
[    1.813757] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    1.815265] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input7
[    1.816106] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.816873] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input8
[    1.817387] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
[    1.818199] hid-generic 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    1.818994] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperSpeed
[    1.820429] input: ELAN2513:00 04F3:422C Touchscreen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input9
[    1.820702] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    1.821641] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input10
[    1.822502] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.823506] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input11
[    1.824404] usb usb1: Product: xHCI Host Controller
[    1.825287] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input12
[    1.826226] usb usb1: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.827382] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input13
[    1.828070] usb usb1: SerialNumber: 0000:00:0d.0
[    1.829045] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input14
[    1.830147] hub 1-0:1.0: USB hub found
[    1.831295] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input16
[    1.832385] hub 1-0:1.0: 1 port detected
[    1.833603] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input17
[    1.834837] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    1.835917] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input18
[    1.837822] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.841290] usb usb2: Product: xHCI Host Controller
[    1.843106] usb usb2: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.844874] usb usb2: SerialNumber: 0000:00:0d.0
[    1.846696] hub 2-0:1.0: USB hub found
[    1.847688] hub 2-0:1.0: 4 ports detected
[    1.849662] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.850665] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    1.852596] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    1.853689] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.854684] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
[    1.855590] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperSpeed
[    1.856506] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    1.857411] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.858327] usb usb3: Product: xHCI Host Controller
[    1.859267] usb usb3: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.860402] usb usb3: SerialNumber: 0000:00:14.0
[    1.861354] hub 3-0:1.0: USB hub found
[    1.862261] hub 3-0:1.0: 12 ports detected
[    1.863928] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    1.864804] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.865675] usb usb4: Product: xHCI Host Controller
[    1.866653] usb usb4: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.867521] usb usb4: SerialNumber: 0000:00:14.0
[    1.868435] hub 4-0:1.0: USB hub found
[    1.869318] hub 4-0:1.0: 2 ports detected
[    1.884098] hid-generic 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.060747] i915 0000:00:02.0: [drm] Found meteorlake (device ID 7d55) display version 14.00 stepping C0
[    2.063444] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    2.064543] Console: switching to colour dummy device 80x25
[    2.064559] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.064572] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    2.082389] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
[    2.090682] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/mtl_dmc.bin (v2.23)
[    2.110308] usb 3-3: new full-speed USB device number 2 using xhci_hcd
[    2.125557] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/mtl_guc_70.bin version 70.36.0
[    2.132277] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input22
[    2.132344] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input23
[    2.132378] hid-multitouch 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    2.138974] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    2.138978] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    2.139187] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    2.143866] i915 0000:00:02.0: [drm] GT1: can't init GSC proxy due to missing mei component
[    2.144088] i915 0000:00:02.0: [drm] GT1: GuC firmware i915/mtl_guc_70.bin version 70.36.0
[    2.144090] i915 0000:00:02.0: [drm] GT1: HuC firmware i915/mtl_huc_gsc.bin version 8.5.4
[    2.166288] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for clear media
[    2.166641] i915 0000:00:02.0: [drm] GT1: GUC: submission enabled
[    2.166642] i915 0000:00:02.0: [drm] GT1: GUC: SLPC enabled
[    2.166749] i915 0000:00:02.0: [drm] GT1: GUC: RC enabled
[    2.168795] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected content support initialized
[    2.175970] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 0
[    2.176232] ACPI: video: Video Device [PXSX] (multi-head: no  rom: yes  post: no)
[    2.176251] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/LNXVIDEO:00/input/input24
[    2.191522] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    2.191748] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input25
[    2.247548] usb 3-3: New USB device found, idVendor=06cb, idProduct=016c, bcdDevice= 0.00
[    2.247556] usb 3-3: New USB device strings: Mfr=0, Product=0, SerialNumber=1
[    2.247560] usb 3-3: SerialNumber: 17f07122a011
[    2.258313] tpm tpm0: auth session is active
[    2.307502] i915 0000:00:02.0: [drm] GT1: Loaded GSC firmware i915/mtl_gsc_1.bin (cv1.0, r102.1.15.1926, svn 1)
[    2.314017] fbcon: i915drmfb (fb0) is primary device
[    2.323180] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input26
[    2.323227] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input27
[    2.323245] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input28
[    2.323264] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input29
[    2.323306] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input30
[    2.323325] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input31
[    2.323364] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input33
[    2.323380] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input34
[    2.323396] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input35
[    2.327855] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for all workloads
[    2.327861] i915 0000:00:02.0: [drm] *ERROR* GT1: GSC proxy handler failed to init
[    2.366367] usb 3-10: new full-speed USB device number 3 using xhci_hcd
[    2.369199] hid-multitouch 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.504891] usb 3-10: New USB device found, idVendor=8087, idProduct=0033, bcdDevice= 0.00
[    2.504898] usb 3-10: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.563037] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=6
[    2.569985] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.575719] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.585170] hid-generic 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.590844] hid-generic 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.596378] hid-generic 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.597889] hid-generic 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.601700] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.602787] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.603462] hid-sensor-hub 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.604202] hid-sensor-hub 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.604843] hid-sensor-hub 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.605020] hid-sensor-hub 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    3.699215] Console: switching to colour frame buffer device 180x56
[    3.708829] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.822284] raid6: avx2x4   gen() 20415 MB/s
[    3.890284] raid6: avx2x2   gen() 24268 MB/s
[    3.958295] raid6: avx2x1   gen() 20811 MB/s
[    3.959130] raid6: using algorithm avx2x2 gen() 24268 MB/s
[    4.026284] raid6: .... xor() 16196 MB/s, rmw enabled
[    4.027107] raid6: using avx2x2 recovery algorithm
[    4.029898] xor: automatically using best checksumming function   avx       
[    4.033351] async_tx: api initialized (async)
[    4.244809] Btrfs loaded, zoned=yes, fsverity=yes
[    4.303969] PM: Image not found (code -22)
[    4.367643] EXT4-fs (nvme0n1p4): orphan cleanup on readonly fs
[    4.367780] EXT4-fs (nvme0n1p4): mounted filesystem 7881f7bb-dbe6-4323-887f-dd718adb7a8b ro with ordered data mode. Quota mode: none.
[    4.401756] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
[    4.438307] systemd[1]: Inserted module 'autofs4'
[    4.468546] systemd[1]: systemd 257.1-3 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
[    4.468549] systemd[1]: Detected architecture x86-64.
[    4.475738] systemd[1]: Hostname set to <DuanesSpectre16>.
[    4.527473] systemd[1]: bpf-restrict-fs: Failed to load BPF object: No such process
[    4.632533] systemd[1]: Queued start job for default target graphical.target.
[    4.677888] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[    4.678974] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[    4.682670] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[    4.683589] systemd[1]: Created slice system-xfs_scrub.slice - xfs_scrub background service slice.
[    4.684442] systemd[1]: Created slice user.slice - User and Session Slice.
[    4.685364] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[    4.686566] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[    4.687829] systemd[1]: Expecting device dev-disk-by\x2duuid-12DE8F49DE8F2457.device - /dev/disk/by-uuid/12DE8F49DE8F2457...
[    4.689094] systemd[1]: Expecting device dev-disk-by\x2duuid-96c2339a\x2dae0c\x2d4a9d\x2d9d62\x2dfbbce901defc.device - /dev/disk/by-uuid/96c2339a-ae0c-4a9d-9d62-fbbce901defc...
[    4.689740] systemd[1]: Expecting device dev-disk-by\x2duuid-9DB2\x2d2D80.device - /dev/disk/by-uuid/9DB2-2D80...
[    4.691014] systemd[1]: Reached target nss-user-lookup.target - User and Group Name Lookups.
[    4.692301] systemd[1]: Reached target slices.target - Slice Units.
[    4.700177] systemd[1]: Listening on rpcbind.socket - RPCbind Server Activation Socket.
[    4.705070] systemd[1]: Listening on systemd-coredump.socket - Process Core Dump Socket.
[    4.706781] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[    4.708051] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[    4.709614] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[    4.711215] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[    4.712045] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.712055] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.712092] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[    4.716650] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    4.719906] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
[    4.721820] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[    4.724601] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
[    4.727234] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[    4.730711] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[    4.732096] systemd[1]: auth-rpcgss-module.service - Kernel Module supporting RPCSEC_GSS was skipped because of an unmet condition check (ConditionPathExists=/etc/krb5.keytab).
[    4.733008] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
[    4.735257] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[    4.737906] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[    4.740227] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[    4.744248] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[    4.747157] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[    4.751123] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
[    4.753563] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    4.755003] pstore: Using crash dump compression: deflate
[    4.759493] systemd[1]: Starting systemd-journald.service - Journal Service...
[    4.762818] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[    4.764190] pstore: Registered efi_pstore as persistent store backend
[    4.765410] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.766081] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[    4.767620] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.768555] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[    4.772712] systemd-journald[549]: Collecting audit messages is disabled.
[    4.775399] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[    4.782837] lp: driver loaded but no devices found
[    4.783043] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
[    4.786088] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[    4.787728] systemd[1]: Mounted run-lock.mount - Legacy Locks Directory /run/lock.
[    4.789105] ppdev: user-space parallel port driver
[    4.792253] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[    4.795226] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[    4.797945] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[    4.800625] systemd[1]: Started systemd-journald.service - Journal Service.
[    4.819127] EXT4-fs (nvme0n1p4): re-mounted 7881f7bb-dbe6-4323-887f-dd718adb7a8b r/w. Quota mode: none.
[    4.850109] systemd-journald[549]: Received client request to flush runtime journal.
[    4.933325] ACPI: AC: AC Adapter [ADP1] (off-line)
[    4.938624] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[    4.939676] int3472-discrete INT3472:01: Sensor module id: 'CJFME62'
[    4.940601] int3472-discrete INT3472:01: reset \_SB.GPI0 pin 65 active-low
[    4.941392] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin number mismatch _DSM 11 resource 107
[    4.941396] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
[    4.942176] input: Intel HID events as /devices/platform/INTC1077:00/input/input37
[    4.943373] intel-hid INTC1077:00: failed to enable HID power button
[    4.944606] int3472-discrete INT3472:02: Sensor module id: 'CJFME62'
[    4.946094] Consider using thermal netlink events interface
[    4.948069] int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mismatch _DSM 49 resource 209
[    4.949502] int3472-discrete INT3472:02: reset \_SB.GPI0 pin 209 active-low
[    4.951026] input: Intel HID events as /devices/platform/INT33D5:00/input/input38
[    4.951850] pci 0000:00:08.0: Setting to D3hot
[    4.952247] intel-hid INT33D5:00: platform supports 5 button array
[    4.952394] mc: Linux media interface: v0.10
[    4.954351] input: Intel HID 5 button array as /devices/platform/INT33D5:00/input/input39
[    4.964257] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.LPCB.HEC.DPTF.FCHG], AE_NOT_FOUND (20240827/psargs-332)
[    4.965641] ACPI Error: Aborting method \_SB.IETM.CHRG.PPSS due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
[    4.966359] pci 0000:00:05.0: Setting to D3hot
[    4.972176] Serial bus multi instantiate pseudo device driver CSC3551:00: Instantiated 2 I2C devices.
[    4.972191] resource: resource sanity check: requesting [mem 0x00000000fedc0000-0x00000000fedcffff], which spans more than pnp 00:03 [mem 0xfedc0000-0xfedc7fff]
[    4.972196] caller igen6_probe+0x17f/0x7f2 [igen6_edac] mapping multiple BARs
[    4.972465] videodev: Linux video capture interface: v2.00
[    4.976335] EDAC MC0: Giving out device to module igen6_edac controller Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[    4.981876] pci 0000:00:0b.0: Setting to D3hot
[    4.982651] EDAC MC1: Giving out device to module igen6_edac controller Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[    4.982672] EDAC igen6 MC1: HANDLING IBECC MEMORY ERROR
[    4.982673] EDAC igen6 MC1: ADDR 0x7fffffffe0 
[    4.982675] EDAC igen6 MC0: HANDLING IBECC MEMORY ERROR
[    4.982676] EDAC igen6 MC0: ADDR 0x7fffffffe0 
[    4.982845] EDAC igen6: v2.5.1
[    4.991997] iTCO_vendor_support: vendor-support=0
[    4.992122] pci 0000:00:14.2: enabling device (0000 -> 0002)
[    4.994086] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[    4.995228] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.997233] intel_pmc_core INT33A1:00: Assuming a default substate order for this platform
[    4.997294] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.998153] intel-ipu6 0000:00:05.0: IPU6 in secure mode touch 0x80000000 mask 0x0
[    4.998762] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.999460] intel_pmc_core INT33A1:00:  initialized
[    5.000880] input: PC Speaker as /devices/platform/pcspkr/input/input40
[    5.003072] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    5.007170] intel-ipu6 0000:00:05.0: FW version: 20230925
[    5.011316] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    5.011391] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
[    5.011427] intel-ipu6 0000:00:05.0: Connected 1 cameras
[    5.012176] ov08x40 i2c-OVTI08F4:00: supply dovdd not found, using dummy regulator
[    5.012703] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
[    5.018270] ov08x40 i2c-OVTI08F4:00: supply avdd not found, using dummy regulator
[    5.018278] ov08x40 i2c-OVTI08F4:00: supply dvdd not found, using dummy regulator
[    5.025954] ov08x40 i2c-OVTI08F4:00: error reading chip-id register: -121
[    5.026266] ov08x40 i2c-OVTI08F4:00: probe with driver ov08x40 failed with error -121
[    5.051206] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[    5.084541] Bluetooth: Core ver 2.22
[    5.084701] NET: Registered PF_BLUETOOTH protocol family
[    5.084703] Bluetooth: HCI device and connection manager initialized
[    5.084709] Bluetooth: HCI socket layer initialized
[    5.084713] Bluetooth: L2CAP socket layer initialized
[    5.084719] Bluetooth: SCO socket layer initialized
[    5.085991] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400)
[    5.087189] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    5.088047] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[    5.089987] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.094200] Adding 66559996k swap on /dev/nvme0n1p7.  Priority:-2 extents:1 across:66559996k SS
[    5.095137] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    5.099340] intel-ipu6 0000:00:05.0: CSE authenticate_run done
[    5.101170] cfg80211: loaded regulatory.db is malformed or signature is missing/invalid
[    5.101447] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
[    5.106219] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 655360 ms ovfl timer
[    5.106222] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    5.106223] RAPL PMU: hw unit of domain package 2^-14 Joules
[    5.106223] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    5.148054] Error: Driver 'pcspkr' is already registered, aborting...
[    5.149663] input: HP WMI hotkeys as /devices/virtual/input/input41
[    5.150019] cryptd: max_cpu_qlen set to 1000
[    5.154325] Intel(R) Wireless WiFi driver for Linux
[    5.154371] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    5.155426] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 0002)
[    5.155574] intel_rapl_common: Found RAPL domain package
[    5.156292] iwlwifi 0000:00:14.3: Detected crf-id 0x400410, cnv-id 0x1080800 wfpm id 0x80005b20
[    5.159819] iwlwifi 0000:00:14.3: PCI dev 7e40/0094, rev=0x441, rfid=0x2010d000
[    5.159823] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6E AX211 160MHz
[    5.159933] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Adding DSD properties for 103C8C17
[    5.162748] typec port0: bound usb3-port1 (ops connector_ops [usbcore])
[    5.162768] typec port0: bound usb2-port1 (ops connector_ops [usbcore])
[    5.163052] AES CTR mode by8 optimization enabled
[    5.163532] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Using extra _DSD properties, bypassing _DSD in ACPI
[    5.168298] usbcore: registered new interface driver btusb
[    5.170465] Bluetooth: hci0: Device revision is 0
[    5.170469] Bluetooth: hci0: Secure boot is enabled
[    5.170470] Bluetooth: hci0: OTP lock is enabled
[    5.170470] Bluetooth: hci0: API lock is enabled
[    5.170471] Bluetooth: hci0: Debug lock is disabled
[    5.170472] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    5.170473] Bluetooth: hci0: Bootloader timestamp 2022.18 buildtype 1 build 49266
[    5.170658] Bluetooth: hci0: DSM reset method type: 0x00
[    5.171127] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.0.3.94
[    5.171762] iwlwifi 0000:00:14.3: loaded firmware version 89.6b44fa0b.0 ma-b0-gf-a0-89.ucode op_mode iwlmvm
[    5.174994] Bluetooth: hci0: Found device firmware: intel/ibt-0180-0041.sfi
[    5.179163] intel_rapl_msr: PL4 support detected.
[    5.179838] Bluetooth: hci0: Boot Address: 0x100800
[    5.180602] intel_rapl_common: Found RAPL domain package
[    5.181892] Bluetooth: hci0: Firmware Version: 99-33.24
[    5.183191] intel_rapl_common: Found RAPL domain core
[    5.183192] intel_rapl_common: Found RAPL domain uncore
[    5.190569] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[    5.190630] snd_hda_intel 0000:56:00.1: enabling device (0000 -> 0002)
[    5.190919] snd_hda_intel 0000:56:00.1: Disabling MSI
[    5.190931] snd_hda_intel 0000:56:00.1: Handle vga_switcheroo audio client
[    5.200343] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cirrus Logic CS35L41 (35a40), Revision: B2
[    5.200476] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Adding DSD properties for 103C8C17
[    5.200617] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Using extra _DSD properties, bypassing _DSD in ACPI
[    5.200619] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Reset line busy, assuming shared reset
[    5.212220] [675] intel-ipu6 0000:00:05.0: remote endpoint port 0 with 4 lanes added
[    5.236862] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cirrus Logic CS35L41 (35a40), Revision: B2
[    5.308093] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input42
[    5.308161] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input43
[    5.308227] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input44
[    5.308287] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input45
[    5.344993] sof-audio-pci-intel-mtl 0000:00:1f.3: enabling device (0000 -> 0002)
[    5.345996] sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
[    5.346188] sof-audio-pci-intel-mtl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[    5.353079] sof-audio-pci-intel-mtl 0000:00:1f.3: use msi interrupt mode
[    5.368605] sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
[    5.368607] sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now
[    5.368611] sof-audio-pci-intel-mtl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
[    5.368612] sof-audio-pci-intel-mtl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
[    5.368613] sof-audio-pci-intel-mtl 0000:00:1f.3: DMICs detected in NHLT tables: 2
[    5.371641] sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
[    5.371643] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/mtl/sof-mtl.ri
[    5.371643] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/mtl
[    5.371644] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
[    5.372205] sof-audio-pci-intel-mtl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.11.1.1
[    5.489495] sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.11.1.1
[    5.491474] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[    5.491615] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    5.492301] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[    5.493456] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    5.495991] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    5.495999] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    5.499130] iwlwifi 0000:00:14.3: loaded PNVM version 16611aa6
[    5.501854] sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
[    5.502022] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card not yet available, widget card binding deferred
[    5.514182] iwlwifi 0000:00:14.3: Detected RF GF, rfid=0x2010d000
[    5.519639] snd_hda_codec_realtek ehdaudio0D0: ALC245: picked fixup  for PCI SSID 103c:8c17
[    5.521048] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    5.521051] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight Time
[    5.579922] iwlwifi 0000:00:14.3: base HW address: d0:65:78:ec:0a:e5
[    5.616525] iwlwifi 0000:00:14.3 wlo1: renamed from wlan0
[    5.872377] audit: type=1400 audit(1734814597.228:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=1024 comm="apparmor_parser"
[    5.873093] audit: type=1400 audit(1734814597.228:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=1024 comm="apparmor_parser"
[    5.873095] audit: type=1400 audit(1734814597.228:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-senddoc" pid=1030 comm="apparmor_parser"
[    5.873097] audit: type=1400 audit(1734814597.228:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/libexec/ibus-engine-hangul" pid=1034 comm="apparmor_parser"
[    5.875178] audit: type=1400 audit(1734814597.228:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=1021 comm="apparmor_parser"
[    5.875180] audit: type=1400 audit(1734814597.228:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oosplash" pid=1029 comm="apparmor_parser"
[    5.876571] audit: type=1400 audit(1734814597.228:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=1032 comm="apparmor_parser"
[    5.876590] audit: type=1400 audit(1734814597.228:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=1028 comm="apparmor_parser"
[    5.877714] audit: type=1400 audit(1734814597.228:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_filter" pid=1028 comm="apparmor_parser"
[    5.877716] audit: type=1400 audit(1734814597.228:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_groff" pid=1028 comm="apparmor_parser"
[    5.955764] nvme nvme0: using unchecked data buffer
[    5.963973] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    5.963975] Bluetooth: BNEP filters: protocol multicast
[    5.963977] Bluetooth: BNEP socket layer initialized
[    5.974881] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 400a4 vendor: 0x2 v0.60.0, 2 algorithms
[    5.976646] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bin: v0.60.0
[    5.976649] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: C:\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_tooling_4KHz-6dBhighshelf\HP_
[    5.985436] block nvme0n1: No UUID available providing old NGUID
[    6.018065] NET: Registered PF_QIPCRTR protocol family
[    6.035661] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Calibration applied: R0=10501
[    6.050493] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded - Type: spk-prot, Gain: 17
[    6.051613] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 103C8C17, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 0
[    6.052400] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35l41-hda.0 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    6.053599] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    6.054127] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight Time
[    6.417214] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[    6.419274] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[    6.419360] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    6.422097] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    6.423774] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    6.423783] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    6.508427] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 400a4 vendor: 0x2 v0.60.0, 2 algorithms
[    6.509464] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, with index: 0
[    6.511218] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bin: v0.60.0
[    6.512531] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: C:\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_tooling_4KHz-6dBhighshelf\HP_
[    6.551640] iwlwifi 0000:00:14.3: Master Disable Timed Out, 100 usec
[    6.571367] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration applied: R0=10902
[    6.588221] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded - Type: spk-prot, Gain: 17
[    6.589250] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SSID: 103C8C17, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 0
[    6.590289] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35l41-hda.1 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    6.591886] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC245: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    6.591890] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    6.591891] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    6.591893] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=0x0
[    6.591894] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[    6.591895] snd_hda_codec_realtek ehdaudio0D0:      Mic=0x19
[    6.635126] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
[    6.653956] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input46
[    6.655345] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input47
[    6.655995] input: sof-hda-dsp HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input48
[    6.656569] input: sof-hda-dsp HDMI/DP,pcm=4 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input49
[    6.657103] input: sof-hda-dsp HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input50
[    6.671416] Bluetooth: hci0: Waiting for firmware download to complete
[    6.672073] Bluetooth: hci0: Firmware loaded in 1457274 usecs
[    6.672653] Bluetooth: hci0: Waiting for device to boot
[    6.690308] hid-sensor-hub 001F:8087:0AC2.0005: hid_field_extract() called with n (192) > 32! (kworker/13:1)
[    6.714444] Bluetooth: hci0: Device booted in 40823 usecs
[    6.717758] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0180-0041.ddc
[    6.721557] Bluetooth: hci0: Applying Intel DDC parameters completed
[    6.724557] Bluetooth: hci0: Firmware timestamp 2024.33 buildtype 1 build 3427
[    6.725640] Bluetooth: hci0: Firmware SHA1: 0xd028ffe4
[    6.730520] Bluetooth: hci0: Fseq status: Success (0x00)
[    6.731391] Bluetooth: hci0: Fseq executed: 00.00.03.94
[    6.732205] Bluetooth: hci0: Fseq BT Top: 00.00.03.94
[    6.732263] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[    6.735234] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[    6.735273] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    6.735290] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    6.735296] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    6.735304] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    6.833748] Bluetooth: MGMT ver 1.23
[    6.839310] NET: Registered PF_ALG protocol family
[    6.870460] RPC: Registered named UNIX socket transport module.
[    6.870978] RPC: Registered udp transport module.
[    6.871666] RPC: Registered tcp transport module.
[    6.871666] RPC: Registered tcp-with-tls transport module.
[    6.871666] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    6.873508] Bluetooth: RFCOMM TTY layer initialized
[    6.874301] Bluetooth: RFCOMM socket layer initialized
[    6.875098] Bluetooth: RFCOMM ver 1.11
[   10.851692] netfs: FS-Cache loaded
[   10.853138] Key type dns_resolver registered
[   10.905965] Key type cifs.spnego registered
[   10.906894] Key type cifs.idmap registered
[   10.908256] CIFS: VFS: Use of the less secure dialect vers=1.0 is not recommended unless required for access to very old servers
[   10.908978] CIFS: Attempting to mount //192.168.1.248/NetFolder
[   10.909710] CIFS: VFS: Error connecting to socket. Aborting operation.
[   10.910404] CIFS: VFS: cifs_mount failed w/return code = -101
[   10.958340] NFS: Registering the id_resolver key type
[   10.958822] Key type id_resolver registered
[   10.959336] Key type id_legacy registered
[   11.197248] i915 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A
[   19.430860] wlo1: authenticate with f8:85:f9:0d:a2:e0 (local address=d0:65:78:ec:0a:e5)
[   19.431455] wlo1: send auth to f8:85:f9:0d:a2:e0 (try 1/3)
[   19.460753] wlo1: authenticated
[   19.462552] wlo1: associate with f8:85:f9:0d:a2:e0 (try 1/3)
[   19.476479] wlo1: RX AssocResp from f8:85:f9:0d:a2:e0 (capab=0x1431 status=0 aid=2)
[   19.484121] wlo1: associated
[   19.543247] wlo1: Limiting TX power to 30 (30 - 0) dBm as advertised by f8:85:f9:0d:a2:e0
[   19.719235] show_signal: 20 callbacks suppressed
[   19.719239] traps: light-locker[2262] trap int3 ip:7fa4849e5f37 sp:7ffc0cf48670 error:0 in libglib-2.0.so.0.8200.4[64f37,7fa48499f000+a0000]
[   19.840435] warning: `kdeconnectd' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211
[   20.130502] audit: type=1400 audit(1734814611.488:32): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/system/node/" pid=2460 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   20.169243] audit: type=1400 audit(1734814611.524:33): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/system/node/" pid=2461 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   20.192674] audit: type=1400 audit(1734814611.548:34): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/usr/share/mariadb/charsets/Index.xml" pid=2461 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   20.201808] audit: type=1400 audit(1734814611.556:35): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/block/" pid=2461 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   20.214135] audit: type=1400 audit(1734814611.568:36): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/proc/2461/cgroup" pid=2461 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
[   20.214646] audit: type=1400 audit(1734814611.572:37): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/nvme/nvme0/nvme0n1/queue/physical_block_size" pid=2461 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   20.476385] audit: type=1400 audit(1734814611.832:38): apparmor="DENIED" operation="exec" class="file" profile="mariadbd_akonadi" name="/usr/bin/mariadb" pid=2497 comm="sh" requested_mask="x" denied_mask="x" fsuid=1000 ouid=0
[   24.306657] input: MX Anywhere 3S Mouse as /devices/virtual/misc/uhid/0005:046D:B037.0009/input/input51
[   24.306905] hid-generic 0005:046D:B037.0009: input,hidraw8: BLUETOOTH HID v0.03 Mouse [MX Anywhere 3S] on d0:65:78:ec:0a:e9
[   68.035018] ov08x40 i2c-OVTI08F4:00: supply dovdd not found, using dummy regulator
[   68.035045] ov08x40 i2c-OVTI08F4:00: supply avdd not found, using dummy regulator
[   68.035049] ov08x40 i2c-OVTI08F4:00: supply dvdd not found, using dummy regulator
[   68.043280] ov08x40 i2c-OVTI08F4:00: error reading chip-id register: -121
[   68.043865] ov08x40 i2c-OVTI08F4:00: probe with driver ov08x40 failed with error -121

----end  20241221_original_sleep_delay_dmesg.txt ----------

----begin   20241221_revert_map_GPIO_type_0x12_to_reset_dmesg.txt ----------


----end  20241221_revert_map_GPIO_type_0x12_to_reset_dmesg.txt ----------

[    0.000000] Linux version 6.13.0-rc2-ipu6+ (duane@DuanesSpectre16) (gcc (Debian 14.2.0-11) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241215) #6 SMP PREEMPT_DYNAMIC Sat Dec 21 14:53:27 CST 2024
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
[    0.000013] last_pfn = 0x880000 max_arch_pfn = 0x400000000
[    0.000016] MTRR map: 8 entries (3 fixed + 5 variable; max 23), built from 10 variable MTRRs
[    0.000018] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000460] x2apic: enabled by BIOS, switching to x2apic ops
[    0.000461] last_pfn = 0x66000 max_arch_pfn = 0x400000000
[    0.005065] esrt: Reserving ESRT space from 0x0000000055b40d18 to 0x0000000055b40d50.
[    0.005070] e820: update [mem 0x55b40000-0x55b40fff] usable ==> reserved
[    0.005082] Using GB pages for direct mapping
[    0.005203] Secure boot disabled
[    0.005203] RAMDISK: [mem 0x3c30e000-0x412b3fff]
[    0.005206] ACPI: Early table checksum verification disabled
[    0.005208] ACPI: RSDP 0x000000005AE6D014 000024 (v02 HPQOEM)
[    0.005211] ACPI: XSDT 0x000000005AE6C728 000194 (v01 HPQOEM SLIC-MPC 01072009 AMI  01000013)
[    0.005215] ACPI: FACP 0x000000005AE53000 000114 (v06 HPQOEM SLIC-MPC 01072009 HP   01000013)
[    0.005218] ACPI: DSDT 0x000000005ADDB000 077690 (v02 HPQOEM 8C17     01072009 ACPI 20210930)
[    0.005220] ACPI: FACS 0x000000005AFEA000 000040
[    0.005221] ACPI: SSDT 0x000000005AE6B000 000689 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005223] ACPI: SSDT 0x000000005AE6A000 0005E4 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005224] ACPI: SSDT 0x000000005AE69000 0001AB (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005226] ACPI: SSDT 0x000000005AE68000 000394 (v02 HPQOEM 8C17     00003001 ACPI 20210930)
[    0.005227] ACPI: SSDT 0x000000005AE66000 001BAF (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005229] ACPI: SSDT 0x000000005AE64000 001620 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005230] ACPI: SSDT 0x000000005AE62000 001349 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005231] ACPI: SSDT 0x000000005AE61000 000FBB (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005233] ACPI: SSDT 0x000000005AE5D000 003BC8 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005234] ACPI: DTPR 0x000000005AE5C000 000098 (v01 HPQOEM 8C17     00000000 HP   00000000)
[    0.005236] ACPI: SSDT 0x000000005AE56000 0058E1 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005237] ACPI: SSDT 0x000000005AE54000 00165F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005239] ACPI: FIDT 0x000000005ADDA000 00009C (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005240] ACPI: MSDM 0x000000005ADD9000 000055 (v03 HPQOEM SLIC-MPC 00000001 HP   00010013)
[    0.005242] ACPI: SSDT 0x000000005ADD8000 00038C (v02 HPQOEM 8C17     00000001 ACPI 20210930)
[    0.005243] ACPI: SSDT 0x000000005ADD5000 002494 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005245] ACPI: SSDT 0x000000005ADCA000 0000F9 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005246] ACPI: HPET 0x000000005ADC9000 000038 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005248] ACPI: APIC 0x000000005ADC8000 000358 (v05 HPQOEM 8C17     01072009 HP   01000013)
[    0.005249] ACPI: MCFG 0x000000005ADC7000 00003C (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005251] ACPI: SSDT 0x000000005ADC5000 00147F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005252] ACPI: SSDT 0x000000005ADC3000 00140F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005253] ACPI: SSDT 0x000000005ADB2000 01023F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005255] ACPI: UEFI 0x000000005AEF0000 000048 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005256] ACPI: NHLT 0x000000005ADB1000 000960 (v00 HPQOEM 8C17     01072009 HP   01000013)
[    0.005258] ACPI: LPIT 0x000000005ADB0000 0000CC (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005259] ACPI: SSDT 0x000000005ADAE000 000CA6 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005261] ACPI: SSDT 0x000000005ADA8000 005E42 (v02 HPQOEM 8C17     00000000 ACPI 20210930)
[    0.005262] ACPI: DBGP 0x000000005ADA7000 000034 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005264] ACPI: DBG2 0x000000005ADA6000 000054 (v00 HPQOEM 8C17     01072009 HP   01000013)
[    0.005265] ACPI: SSDT 0x000000005ADA4000 00113F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005267] ACPI: DMAR 0x000000005ADA3000 0000A8 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005268] ACPI: FPDT 0x000000005ADA2000 000044 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005270] ACPI: SSDT 0x000000005ADA0000 001021 (v02 HPQOEM 8C17     00000000 ACPI 20210930)
[    0.005271] ACPI: SSDT 0x000000005AD9D000 00281A (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005272] ACPI: SSDT 0x000000005AD9A000 0028D3 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005274] ACPI: SSDT 0x000000005AD99000 000060 (v01 HPQOEM 8C17     00000001 ACPI 20210930)
[    0.005275] ACPI: SSDT 0x000000005AD90000 0085C5 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005277] ACPI: OEM1 0x000000005AD8F000 0002B0 (v01 HPQOEM HPOEM1DC 00000000 HP   00000000)
[    0.005278] ACPI: SSDT 0x000000005AD8B000 003210 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005280] ACPI: PHAT 0x000000005AD8A000 000734 (v01 HPQOEM 8C17     00000005 HP   0100000D)
[    0.005281] ACPI: SSDT 0x000000005ADCB000 009BC2 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005283] ACPI: TPM2 0x000000005AD89000 00004C (v04 HPQOEM 8C17     00000001 HP   00000000)
[    0.005284] ACPI: WSMT 0x000000005ADAF000 000028 (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005286] ACPI: BGRT 0x000000005AD88000 000038 (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005287] ACPI: Reserving FACP table memory at [mem 0x5ae53000-0x5ae53113]
[    0.005288] ACPI: Reserving DSDT table memory at [mem 0x5addb000-0x5ae5268f]
[    0.005288] ACPI: Reserving FACS table memory at [mem 0x5afea000-0x5afea03f]
[    0.005288] ACPI: Reserving SSDT table memory at [mem 0x5ae6b000-0x5ae6b688]
[    0.005289] ACPI: Reserving SSDT table memory at [mem 0x5ae6a000-0x5ae6a5e3]
[    0.005289] ACPI: Reserving SSDT table memory at [mem 0x5ae69000-0x5ae691aa]
[    0.005290] ACPI: Reserving SSDT table memory at [mem 0x5ae68000-0x5ae68393]
[    0.005290] ACPI: Reserving SSDT table memory at [mem 0x5ae66000-0x5ae67bae]
[    0.005290] ACPI: Reserving SSDT table memory at [mem 0x5ae64000-0x5ae6561f]
[    0.005291] ACPI: Reserving SSDT table memory at [mem 0x5ae62000-0x5ae63348]
[    0.005291] ACPI: Reserving SSDT table memory at [mem 0x5ae61000-0x5ae61fba]
[    0.005291] ACPI: Reserving SSDT table memory at [mem 0x5ae5d000-0x5ae60bc7]
[    0.005292] ACPI: Reserving DTPR table memory at [mem 0x5ae5c000-0x5ae5c097]
[    0.005292] ACPI: Reserving SSDT table memory at [mem 0x5ae56000-0x5ae5b8e0]
[    0.005292] ACPI: Reserving SSDT table memory at [mem 0x5ae54000-0x5ae5565e]
[    0.005293] ACPI: Reserving FIDT table memory at [mem 0x5adda000-0x5adda09b]
[    0.005293] ACPI: Reserving MSDM table memory at [mem 0x5add9000-0x5add9054]
[    0.005294] ACPI: Reserving SSDT table memory at [mem 0x5add8000-0x5add838b]
[    0.005294] ACPI: Reserving SSDT table memory at [mem 0x5add5000-0x5add7493]
[    0.005294] ACPI: Reserving SSDT table memory at [mem 0x5adca000-0x5adca0f8]
[    0.005295] ACPI: Reserving HPET table memory at [mem 0x5adc9000-0x5adc9037]
[    0.005295] ACPI: Reserving APIC table memory at [mem 0x5adc8000-0x5adc8357]
[    0.005295] ACPI: Reserving MCFG table memory at [mem 0x5adc7000-0x5adc703b]
[    0.005296] ACPI: Reserving SSDT table memory at [mem 0x5adc5000-0x5adc647e]
[    0.005296] ACPI: Reserving SSDT table memory at [mem 0x5adc3000-0x5adc440e]
[    0.005296] ACPI: Reserving SSDT table memory at [mem 0x5adb2000-0x5adc223e]
[    0.005297] ACPI: Reserving UEFI table memory at [mem 0x5aef0000-0x5aef0047]
[    0.005297] ACPI: Reserving NHLT table memory at [mem 0x5adb1000-0x5adb195f]
[    0.005298] ACPI: Reserving LPIT table memory at [mem 0x5adb0000-0x5adb00cb]
[    0.005298] ACPI: Reserving SSDT table memory at [mem 0x5adae000-0x5adaeca5]
[    0.005298] ACPI: Reserving SSDT table memory at [mem 0x5ada8000-0x5adade41]
[    0.005299] ACPI: Reserving DBGP table memory at [mem 0x5ada7000-0x5ada7033]
[    0.005299] ACPI: Reserving DBG2 table memory at [mem 0x5ada6000-0x5ada6053]
[    0.005299] ACPI: Reserving SSDT table memory at [mem 0x5ada4000-0x5ada513e]
[    0.005300] ACPI: Reserving DMAR table memory at [mem 0x5ada3000-0x5ada30a7]
[    0.005300] ACPI: Reserving FPDT table memory at [mem 0x5ada2000-0x5ada2043]
[    0.005301] ACPI: Reserving SSDT table memory at [mem 0x5ada0000-0x5ada1020]
[    0.005301] ACPI: Reserving SSDT table memory at [mem 0x5ad9d000-0x5ad9f819]
[    0.005301] ACPI: Reserving SSDT table memory at [mem 0x5ad9a000-0x5ad9c8d2]
[    0.005302] ACPI: Reserving SSDT table memory at [mem 0x5ad99000-0x5ad9905f]
[    0.005302] ACPI: Reserving SSDT table memory at [mem 0x5ad90000-0x5ad985c4]
[    0.005302] ACPI: Reserving OEM1 table memory at [mem 0x5ad8f000-0x5ad8f2af]
[    0.005303] ACPI: Reserving SSDT table memory at [mem 0x5ad8b000-0x5ad8e20f]
[    0.005303] ACPI: Reserving PHAT table memory at [mem 0x5ad8a000-0x5ad8a733]
[    0.005304] ACPI: Reserving SSDT table memory at [mem 0x5adcb000-0x5add4bc1]
[    0.005304] ACPI: Reserving TPM2 table memory at [mem 0x5ad89000-0x5ad8904b]
[    0.005304] ACPI: Reserving WSMT table memory at [mem 0x5adaf000-0x5adaf027]
[    0.005305] ACPI: Reserving BGRT table memory at [mem 0x5ad88000-0x5ad88037]
[    0.005341] APIC: Switched APIC routing to: cluster x2apic
[    0.005536] No NUMA configuration found
[    0.005537] Faking a node at [mem 0x0000000000000000-0x000000087fffffff]
[    0.005541] NODE_DATA(0) allocated [mem 0x87ffd5680-0x87fffffff]
[    0.005689] Zone ranges:
[    0.005689]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.005690]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.005691]   Normal   [mem 0x0000000100000000-0x000000087fffffff]
[    0.005692]   Device   empty
[    0.005692] Movable zone start for each node
[    0.005693] Early memory node ranges
[    0.005694]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.005694]   node   0: [mem 0x0000000000100000-0x0000000057818fff]
[    0.005695]   node   0: [mem 0x0000000065fff000-0x0000000065ffffff]
[    0.005695]   node   0: [mem 0x0000000100000000-0x000000087fffffff]
[    0.005698] Initmem setup node 0 [mem 0x0000000000001000-0x000000087fffffff]
[    0.005702] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.005721] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.007570] On node 0, zone DMA32: 26598 pages in unavailable ranges
[    0.007789] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.008182] ACPI: PM-Timer IO Port: 0x1808
[    0.008189] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.008224] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.008226] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.008227] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.008230] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.008231] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.008237] e820: update [mem 0x5453a000-0x54563fff] usable ==> reserved
[    0.008245] TSC deadline timer available
[    0.008247] CPU topo: Max. logical packages:   1
[    0.008248] CPU topo: Max. logical dies:       1
[    0.008248] CPU topo: Max. dies per package:   1
[    0.008250] CPU topo: Max. threads per core:   2
[    0.008250] CPU topo: Num. cores per package:    16
[    0.008251] CPU topo: Num. threads per package:  22
[    0.008251] CPU topo: Allowing 22 present CPUs plus 0 hotplug CPUs
[    0.008261] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.008262] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.008263] PM: hibernation: Registered nosave memory: [mem 0x4fe69000-0x4fe69fff]
[    0.008264] PM: hibernation: Registered nosave memory: [mem 0x4fe78000-0x4fe78fff]
[    0.008265] PM: hibernation: Registered nosave memory: [mem 0x5453a000-0x54563fff]
[    0.008266] PM: hibernation: Registered nosave memory: [mem 0x55b40000-0x55b40fff]
[    0.008266] PM: hibernation: Registered nosave memory: [mem 0x57819000-0x5ad4dfff]
[    0.008267] PM: hibernation: Registered nosave memory: [mem 0x5ad4e000-0x5ae6dfff]
[    0.008267] PM: hibernation: Registered nosave memory: [mem 0x5ae6e000-0x5aff0fff]
[    0.008267] PM: hibernation: Registered nosave memory: [mem 0x5aff1000-0x65ffefff]
[    0.008268] PM: hibernation: Registered nosave memory: [mem 0x66000000-0x787fffff]
[    0.008269] PM: hibernation: Registered nosave memory: [mem 0x78800000-0xfdffffff]
[    0.008269] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.008269] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.008270] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.008270] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.008270] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.008271] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed1ffff]
[    0.008271] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfed7ffff]
[    0.008271] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xfedfffff]
[    0.008272] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.008272] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xffffffff]
[    0.008273] [mem 0x78800000-0xfdffffff] available for PCI devices
[    0.008274] Booting paravirtualized kernel on bare hardware
[    0.008276] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.011625] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:22 nr_cpu_ids:22 nr_node_ids:1
[    0.012958] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.012965] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=1*2097152
[    0.012967] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07 
[    0.012969] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15 
[    0.012972] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 -- -- 
[    0.012984] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+ root=UUID=7881f7bb-dbe6-4323-887f-dd718adb7a8b ro intel_skl_int3472_discrete.dyndbg
[    0.013015] Unknown kernel command line parameters "BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+", will be passed to user space.
[    0.013024] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.013024] printk: log_buf_len total cpu_extra contributions: 86016 bytes
[    0.013025] printk: log_buf_len min size: 131072 bytes
[    0.013163] printk: log buffer data + meta data: 262144 + 917504 = 1179648 bytes
[    0.013164] printk: early log buf free: 112520(85%)
[    0.015795] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.017134] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.017299] Fallback order for Node 0: 0 
[    0.017302] Built 1 zonelists, mobility grouping on.  Total pages: 8222648
[    0.017302] Policy zone: Normal
[    0.017309] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.017319] software IO TLB: area num 32.
[    0.032750] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=22, Nodes=1
[    0.032805] ftrace: allocating 45850 entries in 180 pages
[    0.044049] ftrace: allocated 180 pages with 4 groups
[    0.044615] Dynamic Preempt: voluntary
[    0.044684] rcu: Preemptible hierarchical RCU implementation.
[    0.044685] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=22.
[    0.044686] 	Trampoline variant of Tasks RCU enabled.
[    0.044686] 	Rude variant of Tasks RCU enabled.
[    0.044686] 	Tracing variant of Tasks RCU enabled.
[    0.044687] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.044687] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=22
[    0.044698] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.044700] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.044702] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.047185] NR_IRQS: 524544, nr_irqs: 2232, preallocated irqs: 16
[    0.047473] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.047644] Console: colour dummy device 80x25
[    0.047646] printk: legacy console [tty0] enabled
[    0.047877] ACPI: Core revision 20240827
[    0.048202] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.048295] APIC: Switch to symmetric I/O mode setup
[    0.048297] DMAR: Host address width 42
[    0.048299] DMAR: DRHD base: 0x000000fc800000 flags: 0x0
[    0.048305] DMAR: dmar0: reg_base_addr fc800000 ver 7:0 cap c9de008cee690462 ecap 12ca9a00f0ef5e
[    0.048308] DMAR: DRHD base: 0x000000fc801000 flags: 0x1
[    0.048314] DMAR: dmar1: reg_base_addr fc801000 ver 7:0 cap c9de008cee690462 ecap 12ca9a00f0efde
[    0.048316] DMAR: SATC flags: 0x1
[    0.048319] DMAR-IR: IOAPIC id 2 under DRHD base  0xfc801000 IOMMU 1
[    0.048320] DMAR-IR: HPET id 0 under DRHD base 0xfc801000
[    0.048322] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.049932] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.053906] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.053913] Calibrating delay loop (skipped), value calculated using timer frequency.. 5990.40 BogoMIPS (lpj=11980800)
[    0.053969] CPU0: Thermal monitoring enabled (TM1)
[    0.053971] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.054142] CET detected: Indirect Branch Tracking enabled
[    0.054144] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.054145] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.054148] process: using mwait in idle threads
[    0.054150] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.054152] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.054154] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.054156] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.054158] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.054167] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.054169] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.054170] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.054171] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.054173] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
[    0.054174] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.054176] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.054177] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.054178] x86/fpu: Enabled xstate features 0xa07, context size is 856 bytes, using 'compacted' format.
[    0.057911] Freeing SMP alternatives memory: 40K
[    0.057911] pid_max: default: 32768 minimum: 301
[    0.057911] LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor,tomoyo,bpf,ima,evm
[    0.057911] landlock: Up and running.
[    0.057911] Yama: becoming mindful.
[    0.057911] AppArmor: AppArmor initialized
[    0.057911] TOMOYO Linux initialized
[    0.057911] LSM support for eBPF active
[    0.057911] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.057911] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.057911] smpboot: CPU0: Intel(R) Core(TM) Ultra 7 155H (family: 0x6, model: 0xaa, stepping: 0x4)
[    0.057911] Performance Events: XSAVE Architectural LBR, PEBS fmt4+-baseline,  AnyThread deprecated, Meteorlake Hybrid events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.057911] core: cpu_core PMU driver: 
[    0.057911] ... version:                5
[    0.057911] ... bit width:              48
[    0.057911] ... generic registers:      8
[    0.057911] ... value mask:             0000ffffffffffff
[    0.057911] ... max period:             00007fffffffffff
[    0.057911] ... fixed-purpose events:   4
[    0.057911] ... event mask:             0001000f000000ff
[    0.057911] signal: max sigframe size: 3632
[    0.057911] Estimated ratio of average max frequency by base frequency (times 1024): 1638
[    0.057911] rcu: Hierarchical SRCU implementation.
[    0.057911] rcu: 	Max phase no-delay instances is 1000.
[    0.057911] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.057911] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.057911] smp: Bringing up secondary CPUs ...
[    0.057911] smpboot: x86: Booting SMP configuration:
[    0.057911] .... node  #0, CPUs:        #1  #3  #6  #8 #10 #12 #13 #14 #15 #16 #17 #18 #19 #20 #21
[    0.010307] core: cpu_atom PMU driver: PEBS-via-PT 
[    0.010307] ... version:                5
[    0.010307] ... bit width:              48
[    0.010307] ... generic registers:      8
[    0.010307] ... value mask:             0000ffffffffffff
[    0.010307] ... max period:             00007fffffffffff
[    0.010307] ... fixed-purpose events:   3
[    0.010307] ... event mask:             00000007000000ff
[    0.061998]   #2  #4  #5  #7  #9 #11
[    0.083968] smp: Brought up 1 node, 22 CPUs
[    0.083968] smpboot: Total of 22 processors activated (131788.80 BogoMIPS)
[    0.105439] node 0 deferred pages initialised in 16ms
[    0.105440] Memory: 32106548K/32890592K available (16384K kernel code, 2504K rwdata, 6904K rodata, 4148K init, 4924K bss, 762392K reserved, 0K cma-reserved)
[    0.106336] devtmpfs: initialized
[    0.106336] x86/mm: Memory block size: 128MB
[    0.107288] ACPI: PM: Registering ACPI NVS region [mem 0x5ae6e000-0x5aff0fff] (1585152 bytes)
[    0.107288] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.107288] futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
[    0.107288] pinctrl core: initialized pinctrl subsystem
[    0.107288] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.107288] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.107347] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.107714] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.107721] audit: initializing netlink subsys (disabled)
[    0.107728] audit: type=2000 audit(1734815106.000:1): state=initialized audit_enabled=0 res=1
[    0.107728] thermal_sys: Registered thermal governor 'fair_share'
[    0.107728] thermal_sys: Registered thermal governor 'bang_bang'
[    0.107728] thermal_sys: Registered thermal governor 'step_wise'
[    0.107728] thermal_sys: Registered thermal governor 'user_space'
[    0.107728] thermal_sys: Registered thermal governor 'power_allocator'
[    0.107728] cpuidle: using governor ladder
[    0.107728] cpuidle: using governor menu
[    0.107728] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.109928] PCI: ECAM [mem 0xc0000000-0xcfffffff] (base 0xc0000000) for domain 0000 [bus 00-ff]
[    0.109940] PCI: Using configuration type 1 for base access
[    0.109994] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.109994] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.109994] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.109994] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.109994] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.110006] ACPI: Added _OSI(Module Device)
[    0.110006] ACPI: Added _OSI(Processor Device)
[    0.110006] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.110006] ACPI: Added _OSI(Processor Aggregator Device)
[    0.178785] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PACT], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178795] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178800] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PABN], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178804] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178807] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PAS1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178811] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178817] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PMP0], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178822] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178838] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PMP1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178845] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178859] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA01], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178864] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178867] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.178871] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA02], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178875] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178877] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.178880] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA03], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178884] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178887] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.178890] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA04], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178894] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178897] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.178900] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA05], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178903] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178906] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.178909] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA06], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178913] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178916] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.178919] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA07], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178923] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178926] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.178929] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA08], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.178933] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.178935] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.180339] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.I2C3.TPD0], AE_NOT_FOUND (20240827/dswload2-162)
[    0.180345] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.180348] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.189759] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS01], AE_NOT_FOUND (20240827/dswload2-162)
[    0.189765] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.189768] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.189772] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS02], AE_NOT_FOUND (20240827/dswload2-162)
[    0.189776] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.189779] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.189783] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS03], AE_NOT_FOUND (20240827/dswload2-162)
[    0.189787] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.189790] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.189793] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS04], AE_NOT_FOUND (20240827/dswload2-162)
[    0.189797] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.189800] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.189828] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189833] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189836] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189839] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189844] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189847] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189853] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189857] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189860] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189863] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189867] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189870] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189875] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS03._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189880] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189883] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189886] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS03._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189890] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189892] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189898] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS04._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189902] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189905] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189908] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS04._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189912] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189915] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189921] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS05._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189925] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189928] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189931] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS05._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189935] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189938] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189943] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS06._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189948] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189950] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189953] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS06._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189957] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189960] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189966] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS07._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189970] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189973] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189976] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS07._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189980] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189983] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189988] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS08._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.189992] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.189995] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.189998] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS08._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.190002] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.190005] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.190010] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS09._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.190015] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.190017] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.190020] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS09._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.190024] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.190027] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.190033] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS10._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.190037] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.190040] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.190043] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS10._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.190047] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.190050] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.190135] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.190140] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.190143] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.190145] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.190149] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.190152] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.190158] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.190162] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.190165] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.190168] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.190172] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.190175] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.197746] ACPI: 28 ACPI AML tables successfully acquired and loaded
[    0.215796] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomain+
[    0.215802] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomain+
[    0.220314] ACPI: EC: EC started
[    0.220317] ACPI: EC: interrupt blocked
[    0.226264] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.226268] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC used to handle transactions
[    0.226271] ACPI: Interpreter enabled
[    0.226345] ACPI: PM: (supports S0 S3 S4 S5)
[    0.226347] ACPI: Using IOAPIC for interrupt routing
[    0.226415] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.226418] PCI: Ignoring E820 reservations for host bridge windows
[    0.229112] ACPI: Enabled 10 GPEs in block 00 to 7F
[    0.229134] ACPI: Enabled 8 GPEs in block 80 to DF
[    0.231739] ACPI: \_SB_.PC00.RP01.PXP_: New power resource
[    0.236751] ACPI: \_SB_.PC00.RP06.PXP_: New power resource
[    0.238289] ACPI: \_SB_.PC00.RP07.PXP_: New power resource
[    0.240892] ACPI: \_SB_.PC00.RP09.PXP_: New power resource
[    0.242102] ACPI: \_SB_.PC00.RP10.PXP_: New power resource
[    0.243372] ACPI: \_SB_.PC00.RP11.PXP_: New power resource
[    0.244659] ACPI: \_SB_.PC00.RP12.PXP_: New power resource
[    0.248255] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.BTRT: New power resource
[    0.248311] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.DBTR: New power resource
[    0.248459] ACPI: \_SB_.PC00.PAUD: New power resource
[    0.254097] ACPI: \_SB_.PC00.I2C3.PXTC: New power resource
[    0.260364] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.277963] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.278024] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.278080] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.296476] ACPI: \PIN_: New power resource
[    0.297071] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-fe])
[    0.297080] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.297940] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.299607] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME PCIeCapability LTR]
[    0.301558] PCI host bridge to bus 0000:00
[    0.301563] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.301566] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.301569] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.301571] pci_bus 0000:00: root bus resource [mem 0x80000000-0xbfffffff window]
[    0.301574] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x3ffbfffffff window]
[    0.301577] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.303793] pci 0000:00:00.0: [8086:7d01] type 00 class 0x060000 conventional PCI endpoint
[    0.303937] pci 0000:00:02.0: [8086:7d55] type 00 class 0x030000 PCIe Root Complex Integrated Endpoint
[    0.303952] pci 0000:00:02.0: BAR 0 [mem 0x5220000000-0x5220ffffff 64bit pref]
[    0.303963] pci 0000:00:02.0: BAR 2 [mem 0x4210000000-0x421fffffff 64bit pref]
[    0.303996] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.304001] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.304039] pci 0000:00:02.0: PME# supported from D0 D3hot
[    0.304058] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit pref]
[    0.304061] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit pref]: contains BAR 0 for 7 VFs
[    0.304247] pci 0000:00:04.0: [8086:7d03] type 00 class 0x118000 conventional PCI endpoint
[    0.304264] pci 0000:00:04.0: BAR 0 [mem 0x52312c0000-0x52312dffff 64bit]
[    0.304510] pci 0000:00:05.0: [8086:7d19] type 00 class 0x048000 PCIe Root Complex Integrated Endpoint
[    0.304521] pci 0000:00:05.0: BAR 0 [mem 0x5230000000-0x5230ffffff 64bit]
[    0.304538] pci 0000:00:05.0: enabling Extended Tags
[    0.304801] pci 0000:00:06.0: [8086:7ecb] type 01 class 0x060400 PCIe Root Port
[    0.304922] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.304959] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff]
[    0.305106] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.305179] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.310011] pci 0000:00:07.0: [8086:7ec4] type 01 class 0x060400 PCIe Root Port
[    0.310045] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.310052] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff]
[    0.310062] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.310179] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.310212] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.310982] pci 0000:00:07.2: [8086:7ec6] type 01 class 0x060400 PCIe Root Port
[    0.311011] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.311017] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff]
[    0.311027] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.311146] pci 0000:00:07.2: PME# supported from D0 D3hot D3cold
[    0.311180] pci 0000:00:07.2: PTM enabled (root), 4ns granularity
[    0.311954] pci 0000:00:08.0: [8086:7e4c] type 00 class 0x088000 conventional PCI endpoint
[    0.311971] pci 0000:00:08.0: BAR 0 [mem 0x5231327000-0x5231327fff 64bit]
[    0.312087] pci 0000:00:0a.0: [8086:7d0d] type 00 class 0x118000 PCIe Root Complex Integrated Endpoint
[    0.312097] pci 0000:00:0a.0: BAR 0 [mem 0x5231280000-0x52312bffff 64bit]
[    0.312114] pci 0000:00:0a.0: enabling Extended Tags
[    0.312188] pci 0000:00:0b.0: [8086:7d1d] type 00 class 0x120000 PCIe Root Complex Integrated Endpoint
[    0.312199] pci 0000:00:0b.0: BAR 0 [mem 0x5228000000-0x522fffffff 64bit]
[    0.312212] pci 0000:00:0b.0: BAR 4 [mem 0x5231326000-0x5231326fff 64bit]
[    0.312337] pci 0000:00:0d.0: [8086:7ec0] type 00 class 0x0c0330 conventional PCI endpoint
[    0.312353] pci 0000:00:0d.0: BAR 0 [mem 0x5231300000-0x523130ffff 64bit]
[    0.312456] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.312871] pci 0000:00:0d.2: [8086:7ec2] type 00 class 0x0c0340 conventional PCI endpoint
[    0.312887] pci 0000:00:0d.2: BAR 0 [mem 0x5231240000-0x523127ffff 64bit]
[    0.312898] pci 0000:00:0d.2: BAR 2 [mem 0x5231325000-0x5231325fff 64bit]
[    0.312974] pci 0000:00:0d.2: supports D1 D2
[    0.312977] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.313072] pci 0000:00:0d.3: [8086:7ec3] type 00 class 0x0c0340 conventional PCI endpoint
[    0.313088] pci 0000:00:0d.3: BAR 0 [mem 0x5231200000-0x523123ffff 64bit]
[    0.313099] pci 0000:00:0d.3: BAR 2 [mem 0x5231324000-0x5231324fff 64bit]
[    0.313239] pci 0000:00:0d.3: supports D1 D2
[    0.313241] pci 0000:00:0d.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.313390] pci 0000:00:12.0: [8086:7e45] type 00 class 0x070000 conventional PCI endpoint
[    0.313405] pci 0000:00:12.0: BAR 0 [mem 0x52312f0000-0x52312fffff 64bit]
[    0.313456] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.314176] pci 0000:00:14.0: [8086:7e7d] type 00 class 0x0c0330 conventional PCI endpoint
[    0.314193] pci 0000:00:14.0: BAR 0 [mem 0x52312e0000-0x52312effff 64bit]
[    0.314253] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.314661] pci 0000:00:14.2: [8086:7e7f] type 00 class 0x050000 conventional PCI endpoint
[    0.314680] pci 0000:00:14.2: BAR 0 [mem 0x5231318000-0x523131bfff 64bit]
[    0.314693] pci 0000:00:14.2: BAR 2 [mem 0x5231323000-0x5231323fff 64bit]
[    0.314799] pci 0000:00:14.3: [8086:7e40] type 00 class 0x028000 PCIe Root Complex Integrated Endpoint
[    0.314826] pci 0000:00:14.3: BAR 0 [mem 0x5231314000-0x5231317fff 64bit]
[    0.314913] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.315143] pci 0000:00:15.0: [8086:7e78] type 00 class 0x0c8000 conventional PCI endpoint
[    0.315196] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.315579] pci 0000:00:15.1: [8086:7e79] type 00 class 0x0c8000 conventional PCI endpoint
[    0.315631] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.315993] pci 0000:00:15.3: [8086:7e7b] type 00 class 0x0c8000 conventional PCI endpoint
[    0.316049] pci 0000:00:15.3: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.316392] pci 0000:00:16.0: [8086:7e70] type 00 class 0x078000 conventional PCI endpoint
[    0.316412] pci 0000:00:16.0: BAR 0 [mem 0x523131f000-0x523131ffff 64bit]
[    0.316495] pci 0000:00:16.0: PME# supported from D3hot
[    0.317239] pci 0000:00:19.0: [8086:7e50] type 00 class 0x0c8000 conventional PCI endpoint
[    0.317294] pci 0000:00:19.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.317674] pci 0000:00:19.1: [8086:7e51] type 00 class 0x0c8000 conventional PCI endpoint
[    0.317725] pci 0000:00:19.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.318049] pci 0000:00:1c.0: [8086:7e38] type 01 class 0x060400 PCIe Root Port
[    0.318072] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.318076] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.318080] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff]
[    0.318088] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.318150] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.318180] pci 0000:00:1c.0: PTM enabled (root), 4ns granularity
[    0.318807] pci 0000:00:1f.0: [8086:7e02] type 00 class 0x060100 conventional PCI endpoint
[    0.319199] pci 0000:00:1f.3: [8086:7e28] type 00 class 0x040100 conventional PCI endpoint
[    0.319232] pci 0000:00:1f.3: BAR 0 [mem 0x5231310000-0x5231313fff 64bit]
[    0.319254] pci 0000:00:1f.3: BAR 4 [mem 0x5231000000-0x52311fffff 64bit]
[    0.319335] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.319418] pci 0000:00:1f.4: [8086:7e22] type 00 class 0x0c0500 conventional PCI endpoint
[    0.319440] pci 0000:00:1f.4: BAR 0 [mem 0x523131c000-0x523131c0ff 64bit]
[    0.319465] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.319688] pci 0000:00:1f.5: [8086:7e23] type 00 class 0x0c8000 conventional PCI endpoint
[    0.319725] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.320239] pci 0000:01:00.0: [1c5c:1959] type 00 class 0x010802 PCIe Endpoint
[    0.320259] pci 0000:01:00.0: BAR 0 [mem 0x8d200000-0x8d203fff 64bit]
[    0.320558] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.320608] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.320657] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.320713] pci 0000:56:00.0: [10de:28a1] type 00 class 0x030000 PCIe Legacy Endpoint
[    0.320727] pci 0000:56:00.0: BAR 0 [mem 0x8c000000-0x8cffffff]
[    0.320738] pci 0000:56:00.0: BAR 1 [mem 0x4000000000-0x41ffffffff 64bit pref]
[    0.320750] pci 0000:56:00.0: BAR 3 [mem 0x4200000000-0x4201ffffff 64bit pref]
[    0.320759] pci 0000:56:00.0: BAR 5 [io  0x3000-0x307f]
[    0.320766] pci 0000:56:00.0: ROM [mem 0x8d000000-0x8d07ffff pref]
[    0.320830] pci 0000:56:00.0: PME# supported from D0 D3hot
[    0.320912] pci 0000:56:00.0: 63.012 Gb/s available PCIe bandwidth, limited by 16.0 GT/s PCIe x4 link at 0000:00:1c.0 (capable of 126.024 Gb/s with 16.0 GT/s PCIe x8 link)
[    0.321112] pci 0000:56:00.1: [10de:22be] type 00 class 0x040300 PCIe Endpoint
[    0.321124] pci 0000:56:00.1: BAR 0 [mem 0x8d080000-0x8d083fff]
[    0.321266] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.325745] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.325886] ACPI: PCI: Interrupt link LNKB configured for IRQ 1
[    0.326025] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.326160] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.326296] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.326431] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.326567] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.326702] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.327651] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x1)
[    0.464852] Low-power S0 idle used by default for system suspend
[    0.475422] ACPI: EC: interrupt unblocked
[    0.475425] ACPI: EC: event unblocked
[    0.475447] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.475449] ACPI: EC: GPE=0x6e
[    0.475451] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC initialization complete
[    0.475454] ACPI: \_SB_.PC00.LPCB.EC0_: EC: Used to handle transactions and events
[    0.475554] iommu: Default domain type: Translated
[    0.475554] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.475554] pps_core: LinuxPPS API ver. 1 registered
[    0.475554] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.475554] PTP clock support registered
[    0.475554] EDAC MC: Ver: 3.0.0
[    0.475554] efivars: Registered efivars operations
[    0.475554] NetLabel: Initializing
[    0.475554] NetLabel:  domain hash size = 128
[    0.475554] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.475554] NetLabel:  unlabeled traffic allowed by default
[    0.475554] PCI: Using ACPI for IRQ routing
[    0.487551] PCI: pci_cache_line_size set to 64 bytes
[    0.487710] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't claim; no compatible bridge window
[    0.487826] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.487828] e820: reserve RAM buffer [mem 0x4fe69018-0x4fffffff]
[    0.487829] e820: reserve RAM buffer [mem 0x5453a000-0x57ffffff]
[    0.487830] e820: reserve RAM buffer [mem 0x55b40000-0x57ffffff]
[    0.487831] e820: reserve RAM buffer [mem 0x57819000-0x57ffffff]
[    0.487831] e820: reserve RAM buffer [mem 0x66000000-0x67ffffff]
[    0.487866] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.487866] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.487866] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.487866] pci 0000:56:00.0: vgaarb: bridge control possible
[    0.487866] pci 0000:56:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.487866] vgaarb: loaded
[    0.487866] clocksource: Switched to clocksource tsc-early
[    0.487866] VFS: Disk quotas dquot_6.6.0
[    0.487866] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.487866] AppArmor: AppArmor Filesystem Enabled
[    0.487866] pnp: PnP ACPI init
[    0.487866] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.487866] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.487866] system 00:01: [io  0x1854-0x1857] has been reserved
[    0.487866] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.487866] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.487866] system 00:03: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    0.487866] system 00:03: [mem 0xc0000000-0xcfffffff] has been reserved
[    0.487866] system 00:03: [mem 0xfed20000-0xfed7ffff] could not be reserved
[    0.487866] system 00:03: [mem 0xfc800000-0xfc81ffff] could not be reserved
[    0.487866] system 00:03: [mem 0xfed45000-0xfed8ffff] could not be reserved
[    0.487866] system 00:03: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.488896] system 00:04: [io  0x2000-0x20fe] has been reserved
[    0.489214] system 00:05: [mem 0xfe02c008-0xfe02cfff] has been reserved
[    0.489218] system 00:05: [mem 0xfe02d000-0xfe02dfff] has been reserved
[    0.490299] pnp: PnP ACPI: found 6 devices
[    0.495953] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.496016] NET: Registered PF_INET protocol family
[    0.496254] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.499352] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.499400] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.499618] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.500044] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.500151] TCP: Hash tables configured (established 262144 bind 65536)
[    0.500333] MPTCP token hash table entries: 32768 (order: 7, 786432 bytes, linear)
[    0.500483] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.500668] UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.500801] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.500809] NET: Registered PF_XDP protocol family
[    0.500816] pci_bus 0000:00: max bus depth: 1 pci_try_num: 2
[    0.500832] pci 0000:00:02.0: VF BAR 0 [mem 0x4202000000-0x4208ffffff 64bit pref]: assigned
[    0.500839] pci 0000:00:07.0: bridge window [io  0x4000-0x4fff]: assigned
[    0.500843] pci 0000:00:07.2: bridge window [io  0x5000-0x5fff]: assigned
[    0.500845] pci 0000:00:15.0: BAR 0 [mem 0x4209000000-0x4209000fff 64bit]: assigned
[    0.500885] pci 0000:00:15.1: BAR 0 [mem 0x4209001000-0x4209001fff 64bit]: assigned
[    0.500930] pci 0000:00:15.3: BAR 0 [mem 0x4209002000-0x4209002fff 64bit]: assigned
[    0.500976] pci 0000:00:19.0: BAR 0 [mem 0x4209003000-0x4209003fff 64bit]: assigned
[    0.501022] pci 0000:00:19.1: BAR 0 [mem 0x4209004000-0x4209004fff 64bit]: assigned
[    0.501065] pci 0000:00:1f.5: BAR 0 [mem 0x8d100000-0x8d100fff]: assigned
[    0.501076] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.501083] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff]
[    0.501091] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.501098] pci 0000:00:07.0:   bridge window [io  0x4000-0x4fff]
[    0.501102] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff]
[    0.501106] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.501113] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.501115] pci 0000:00:07.2:   bridge window [io  0x5000-0x5fff]
[    0.501120] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff]
[    0.501124] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.501132] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.501134] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.501138] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff]
[    0.501142] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.501148] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.501150] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.501152] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.501155] pci_bus 0000:00: resource 7 [mem 0x80000000-0xbfffffff window]
[    0.501157] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x3ffbfffffff window]
[    0.501160] pci_bus 0000:01: resource 1 [mem 0x8d200000-0x8d2fffff]
[    0.501162] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.501164] pci_bus 0000:02: resource 1 [mem 0x86000000-0x8bffffff]
[    0.501166] pci_bus 0000:02: resource 2 [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.501169] pci_bus 0000:2c: resource 0 [io  0x5000-0x5fff]
[    0.501171] pci_bus 0000:2c: resource 1 [mem 0x80000000-0x85ffffff]
[    0.501173] pci_bus 0000:2c: resource 2 [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.501176] pci_bus 0000:56: resource 0 [io  0x3000-0x3fff]
[    0.501178] pci_bus 0000:56: resource 1 [mem 0x8c000000-0x8d0fffff]
[    0.501180] pci_bus 0000:56: resource 2 [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.501774] pci 0000:56:00.1: extending delay after power-on from D3hot to 20 msec
[    0.501800] pci 0000:56:00.1: D0 power state depends on 0000:56:00.0
[    0.501808] PCI: CLS 64 bytes, default 64
[    0.501869] DMAR: Intel-IOMMU force enabled due to platform opt in
[    0.501879] DMAR: No RMRR found
[    0.501880] DMAR: No ATSR found
[    0.501882] DMAR: IOMMU feature sc_support inconsistent
[    0.501884] DMAR: dmar0: Using Queued invalidation
[    0.501889] DMAR: dmar1: Using Queued invalidation
[    0.501914] Trying to unpack rootfs image as initramfs...
[    0.502284] pci 0000:00:02.0: Adding to iommu group 0
[    0.502325] pci 0000:00:00.0: Adding to iommu group 1
[    0.502336] pci 0000:00:04.0: Adding to iommu group 2
[    0.502348] pci 0000:00:05.0: Adding to iommu group 3
[    0.502380] pci 0000:00:06.0: Adding to iommu group 4
[    0.502400] pci 0000:00:07.0: Adding to iommu group 5
[    0.502411] pci 0000:00:07.2: Adding to iommu group 6
[    0.502421] pci 0000:00:08.0: Adding to iommu group 7
[    0.502434] pci 0000:00:0a.0: Adding to iommu group 8
[    0.502446] pci 0000:00:0b.0: Adding to iommu group 9
[    0.502467] pci 0000:00:0d.0: Adding to iommu group 10
[    0.502478] pci 0000:00:0d.2: Adding to iommu group 10
[    0.502488] pci 0000:00:0d.3: Adding to iommu group 10
[    0.502504] pci 0000:00:12.0: Adding to iommu group 11
[    0.502522] pci 0000:00:14.0: Adding to iommu group 12
[    0.502533] pci 0000:00:14.2: Adding to iommu group 12
[    0.502543] pci 0000:00:14.3: Adding to iommu group 13
[    0.502564] pci 0000:00:15.0: Adding to iommu group 14
[    0.502575] pci 0000:00:15.1: Adding to iommu group 14
[    0.502586] pci 0000:00:15.3: Adding to iommu group 14
[    0.502599] pci 0000:00:16.0: Adding to iommu group 15
[    0.502615] pci 0000:00:19.0: Adding to iommu group 16
[    0.502627] pci 0000:00:19.1: Adding to iommu group 16
[    0.502639] pci 0000:00:1c.0: Adding to iommu group 17
[    0.502663] pci 0000:00:1f.0: Adding to iommu group 18
[    0.502675] pci 0000:00:1f.3: Adding to iommu group 18
[    0.502687] pci 0000:00:1f.4: Adding to iommu group 18
[    0.502698] pci 0000:00:1f.5: Adding to iommu group 18
[    0.502732] pci 0000:01:00.0: Adding to iommu group 19
[    0.502751] pci 0000:56:00.0: Adding to iommu group 20
[    0.502764] pci 0000:56:00.1: Adding to iommu group 20
[    0.503079] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.503081] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.503083] software IO TLB: mapped [mem 0x00000000480b8000-0x000000004c0b8000] (64MB)
[    0.503110] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.503147] clocksource: Switched to clocksource tsc
[    0.503168] platform rtc_cmos: registered platform RTC device (no PNP device found)
[    0.506908] Initialise system trusted keyrings
[    0.506917] Key type blacklist registered
[    0.506965] workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.506974] zbud: loaded
[    0.507074] fuse: init (API version 7.41)
[    0.507206] integrity: Platform Keyring initialized
[    0.507212] integrity: Machine keyring initialized
[    0.516376] Key type asymmetric registered
[    0.516381] Asymmetric key parser 'x509' registered
[    0.963376] Freeing initrd memory: 81560K
[    0.968007] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
[    0.968072] io scheduler mq-deadline registered
[    0.969642] ledtrig-cpu: registered to indicate activity on CPUs
[    0.970432] pcieport 0000:00:06.0: PME: Signaling with IRQ 122
[    0.970857] pcieport 0000:00:07.0: PME: Signaling with IRQ 123
[    0.970882] pcieport 0000:00:07.0: pciehp: Slot #12 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.971262] pcieport 0000:00:07.2: PME: Signaling with IRQ 124
[    0.971284] pcieport 0000:00:07.2: pciehp: Slot #14 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.971604] pcieport 0000:00:1c.0: PME: Signaling with IRQ 125
[    0.971705] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.984360] ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-274000)
[    0.986660] thermal LNXTHERM:00: registered as thermal_zone0
[    0.986662] ACPI: thermal: Thermal Zone [TZ01] (74 C)
[    0.986896] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.987634] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    0.988050] hpet_acpi_add: no address or irqs in _CRS
[    0.988071] Linux agpgart interface v0.103
[    0.989945] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1D, rev-id 54)
[    1.104034] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    1.104039] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    1.105386] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.105600] mousedev: PS/2 mouse device common for all mice
[    1.105639] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.106499] rtc_cmos rtc_cmos: registered as rtc0
[    1.106632] rtc_cmos rtc_cmos: setting system clock to 2024-12-21T21:05:07 UTC (1734815107)
[    1.106657] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nvram
[    1.109105] intel_pstate: Intel P-state driver initializing
[    1.113942] intel_pstate: HWP enabled
[    1.114038] efifb: probing for efifb
[    1.114046] efifb: framebuffer at 0x70800000, using 20252k, total 20250k
[    1.114048] efifb: mode is 2880x1800x32, linelength=11520, pages=1
[    1.114049] efifb: scrolling: redraw
[    1.114050] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    1.116016] Console: switching to colour frame buffer device 180x56
[    1.117543] fb0: EFI VGA frame buffer device
[    1.117656] NET: Registered PF_INET6 protocol family
[    1.121471] Segment Routing with IPv6
[    1.121488] In-situ OAM (IOAM) with IPv6
[    1.121509] mip6: Mobile IPv6
[    1.121517] NET: Registered PF_PACKET protocol family
[    1.121549] mpls_gso: MPLS GSO support
[    1.124599] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.125655] microcode: Current revision: 0x00000020
[    1.125669] microcode: Updated early from: 0x0000001f
[    1.127003] IPI shorthand broadcast: enabled
[    1.127693] sched_clock: Marking stable (1120635752, 6307081)->(1176604298, -49661465)
[    1.128225] registered taskstats version 1
[    1.128350] Loading compiled-in X.509 certificates
[    1.138867] Loaded X.509 cert 'Build time autogenerated kernel key: 24a2ef881874b1f607ad746af78b458b87f50423'
[    1.140376] Demotion targets for Node 0: null
[    1.140483] Key type .fscrypt registered
[    1.140498] Key type fscrypt-provisioning registered
[    1.152586] Key type encrypted registered
[    1.152640] AppArmor: AppArmor sha256 policy hashing enabled
[    1.153228] integrity: Loading X.509 certificate: UEFI:db
[    1.153267] integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    1.153293] integrity: Loading X.509 certificate: UEFI:db
[    1.153318] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
[    1.153342] integrity: Loading X.509 certificate: UEFI:db
[    1.153365] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    1.153392] integrity: Loading X.509 certificate: UEFI:db
[    1.153415] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.153441] integrity: Loading X.509 certificate: UEFI:db
[    1.153465] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.154831] ima: Allocated hash algorithm: sha256
[    1.174320] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    1.321990] ima: No architecture policies found
[    1.323601] evm: Initialising EVM extended attributes:
[    1.324499] evm: security.selinux
[    1.325136] evm: security.SMACK64 (disabled)
[    1.325690] evm: security.SMACK64EXEC (disabled)
[    1.326274] evm: security.SMACK64TRANSMUTE (disabled)
[    1.327004] evm: security.SMACK64MMAP (disabled)
[    1.327603] evm: security.apparmor
[    1.328210] evm: security.ima
[    1.328748] evm: security.capability
[    1.329252] evm: HMAC attrs: 0x1
[    1.334006] RAS: Correctable Errors collector initialized.
[    1.334656] clk: Disabling unused clocks
[    1.335173] PM: genpd: Disabling unused power domains
[    1.341392] Freeing unused decrypted memory: 2028K
[    1.342636] Freeing unused kernel image (initmem) memory: 4148K
[    1.343164] Write protecting the kernel read-only data: 24576k
[    1.345138] Freeing unused kernel image (rodata/data gap) memory: 1288K
[    1.350689] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.351225] Run /init as init process
[    1.351745]   with arguments:
[    1.351745]     /init
[    1.351746]   with environment:
[    1.351746]     HOME=/
[    1.351747]     TERM=linux
[    1.351747]     BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+
[    1.414590] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    1.415840] ACPI: button: Sleep Button [SLPB]
[    1.417230] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
[    1.418698] ACPI: button: Lid Switch [LID0]
[    1.420027] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input3
[    1.426884] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    1.427897] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    1.428891] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 7391A661-223A-47DB-A77A-7BE84C60822D has zero instances
[    1.429887] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: DF4E63B6-3BBC-4858-9737-C74F82F821F3 has zero instances
[    1.434361] ACPI: button: Power Button [PWRB]
[    1.435368] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
[    1.436840] ACPI: button: Power Button [PWRF]
[    1.451956] ACPI: battery: Slot [BAT0] (battery present)
[    1.454746] ACPI: bus type thunderbolt registered
[    1.460880] ACPI: bus type drm_connector registered
[    1.463198] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    1.463943] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    1.466386] ACPI: bus type USB registered
[    1.466449] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    1.467122] usbcore: registered new interface driver usbfs
[    1.468093] nvme nvme0: pci function 0000:01:00.0
[    1.468915] usbcore: registered new interface driver hub
[    1.470529] usbcore: registered new device driver usb
[    1.471659] hid: raw HID events driver (C) Jiri Kosina
[    1.481068] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
[    1.481750] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    1.487467] nvme nvme0: 22/0/0 default/read/poll queues
[    1.493957]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.498323] intel-lpss 0000:00:15.1: enabling device (0004 -> 0006)
[    1.499114] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    1.514342] intel-lpss 0000:00:15.3: enabling device (0004 -> 0006)
[    1.515690] idma64 idma64.2: Found Intel integrated DMA 64-bit
[    1.534103] intel-lpss 0000:00:19.0: enabling device (0004 -> 0006)
[    1.550338] intel-lpss 0000:00:19.1: enabling device (0004 -> 0006)
[    1.668423] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[    1.788461] i2c_hid_acpi i2c-ELAN2513:00: i2c_hid_get_input: IRQ triggered but there's no data
[    1.792400] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.792708] input: ELAN07CE:00 04F3:32C8 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input5
[    1.792986] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    1.793792] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input7
[    1.795243] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input8
[    1.795560] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    1.796034] hid-generic 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    1.796749] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.797999] input: ELAN2513:00 04F3:422C Touchscreen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input9
[    1.798202] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
[    1.799202] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input10
[    1.800049] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperSpeed
[    1.801011] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input11
[    1.801949] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    1.802983] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input12
[    1.803952] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.804907] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input13
[    1.805881] usb usb1: Product: xHCI Host Controller
[    1.807027] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input14
[    1.807747] usb usb1: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.808764] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input16
[    1.809860] usb usb1: SerialNumber: 0000:00:0d.0
[    1.811072] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input17
[    1.812173] hub 1-0:1.0: USB hub found
[    1.813326] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input18
[    1.814473] hub 1-0:1.0: 1 port detected
[    1.817145] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    1.818343] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.819623] usb usb2: Product: xHCI Host Controller
[    1.820927] usb usb2: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.822228] usb usb2: SerialNumber: 0000:00:0d.0
[    1.823561] hub 2-0:1.0: USB hub found
[    1.824456] hub 2-0:1.0: 4 ports detected
[    1.826433] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.827318] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    1.829253] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    1.830435] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.831324] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
[    1.832213] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperSpeed
[    1.833117] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    1.834006] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.835152] usb usb3: Product: xHCI Host Controller
[    1.836023] usb usb3: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.836893] usb usb3: SerialNumber: 0000:00:14.0
[    1.837798] hub 3-0:1.0: USB hub found
[    1.838867] hub 3-0:1.0: 12 ports detected
[    1.840156] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    1.841008] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.841855] usb usb4: Product: xHCI Host Controller
[    1.842862] usb usb4: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.843718] usb usb4: SerialNumber: 0000:00:14.0
[    1.844615] hub 4-0:1.0: USB hub found
[    1.845467] hub 4-0:1.0: 2 ports detected
[    1.861009] hid-generic 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.037228] i915 0000:00:02.0: [drm] Found meteorlake (device ID 7d55) display version 14.00 stepping C0
[    2.039764] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    2.040720] Console: switching to colour dummy device 80x25
[    2.040733] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.040742] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    2.058402] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
[    2.066658] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/mtl_dmc.bin (v2.23)
[    2.094325] usb 3-3: new full-speed USB device number 2 using xhci_hcd
[    2.097375] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/mtl_guc_70.bin version 70.36.0
[    2.108166] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input22
[    2.108231] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input23
[    2.108261] hid-multitouch 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    2.110998] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    2.111001] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    2.111212] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    2.115477] i915 0000:00:02.0: [drm] GT1: can't init GSC proxy due to missing mei component
[    2.115720] i915 0000:00:02.0: [drm] GT1: GuC firmware i915/mtl_guc_70.bin version 70.36.0
[    2.115722] i915 0000:00:02.0: [drm] GT1: HuC firmware i915/mtl_huc_gsc.bin version 8.5.4
[    2.138319] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for clear media
[    2.138673] i915 0000:00:02.0: [drm] GT1: GUC: submission enabled
[    2.138674] i915 0000:00:02.0: [drm] GT1: GUC: SLPC enabled
[    2.138781] i915 0000:00:02.0: [drm] GT1: GUC: RC enabled
[    2.140812] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected content support initialized
[    2.147906] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 0
[    2.148129] ACPI: video: Video Device [PXSX] (multi-head: no  rom: yes  post: no)
[    2.148146] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/LNXVIDEO:00/input/input24
[    2.171705] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    2.171992] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input25
[    2.226348] tpm tpm0: auth session is active
[    2.235571] usb 3-3: New USB device found, idVendor=06cb, idProduct=016c, bcdDevice= 0.00
[    2.235581] usb 3-3: New USB device strings: Mfr=0, Product=0, SerialNumber=1
[    2.235584] usb 3-3: SerialNumber: 17f07122a011
[    2.241890] fbcon: i915drmfb (fb0) is primary device
[    2.279543] i915 0000:00:02.0: [drm] GT1: Loaded GSC firmware i915/mtl_gsc_1.bin (cv1.0, r102.1.15.1926, svn 1)
[    2.296882] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input26
[    2.296930] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input27
[    2.296947] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input28
[    2.296966] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input29
[    2.297004] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input30
[    2.297023] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input31
[    2.297060] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input33
[    2.297076] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input34
[    2.297092] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input35
[    2.299875] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for all workloads
[    2.299880] i915 0000:00:02.0: [drm] *ERROR* GT1: GSC proxy handler failed to init
[    2.340375] hid-multitouch 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.358354] usb 3-10: new full-speed USB device number 3 using xhci_hcd
[    2.496336] usb 3-10: New USB device found, idVendor=8087, idProduct=0033, bcdDevice= 0.00
[    2.496344] usb 3-10: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.542961] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=6
[    2.550152] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.556010] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.564792] hid-generic 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.570728] hid-generic 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.576368] hid-generic 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.578113] hid-generic 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.582196] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.583705] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.584584] hid-sensor-hub 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.585243] hid-sensor-hub 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.585855] hid-sensor-hub 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.586016] hid-sensor-hub 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    3.631726] Console: switching to colour frame buffer device 180x56
[    3.641733] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.758310] raid6: avx2x4   gen() 20943 MB/s
[    3.826309] raid6: avx2x2   gen() 24176 MB/s
[    3.894310] raid6: avx2x1   gen() 20759 MB/s
[    3.895134] raid6: using algorithm avx2x2 gen() 24176 MB/s
[    3.962308] raid6: .... xor() 16131 MB/s, rmw enabled
[    3.963141] raid6: using avx2x2 recovery algorithm
[    3.965865] xor: automatically using best checksumming function   avx       
[    3.969087] async_tx: api initialized (async)
[    4.158355] Btrfs loaded, zoned=yes, fsverity=yes
[    4.219059] PM: Image not found (code -22)
[    4.277009] EXT4-fs (nvme0n1p4): orphan cleanup on readonly fs
[    4.277177] EXT4-fs (nvme0n1p4): mounted filesystem 7881f7bb-dbe6-4323-887f-dd718adb7a8b ro with ordered data mode. Quota mode: none.
[    4.312018] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
[    4.349791] systemd[1]: Inserted module 'autofs4'
[    4.381027] systemd[1]: systemd 257.1-3 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
[    4.381034] systemd[1]: Detected architecture x86-64.
[    4.387690] systemd[1]: Hostname set to <DuanesSpectre16>.
[    4.440287] systemd[1]: bpf-restrict-fs: Failed to load BPF object: No such process
[    4.521052] systemd[1]: Queued start job for default target graphical.target.
[    4.553259] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[    4.554611] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[    4.556057] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[    4.557427] systemd[1]: Created slice system-xfs_scrub.slice - xfs_scrub background service slice.
[    4.558401] systemd[1]: Created slice user.slice - User and Session Slice.
[    4.559630] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[    4.561076] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[    4.562170] systemd[1]: Expecting device dev-disk-by\x2duuid-12DE8F49DE8F2457.device - /dev/disk/by-uuid/12DE8F49DE8F2457...
[    4.563764] systemd[1]: Expecting device dev-disk-by\x2duuid-96c2339a\x2dae0c\x2d4a9d\x2d9d62\x2dfbbce901defc.device - /dev/disk/by-uuid/96c2339a-ae0c-4a9d-9d62-fbbce901defc...
[    4.565438] systemd[1]: Expecting device dev-disk-by\x2duuid-9DB2\x2d2D80.device - /dev/disk/by-uuid/9DB2-2D80...
[    4.567089] systemd[1]: Reached target nss-user-lookup.target - User and Group Name Lookups.
[    4.569182] systemd[1]: Reached target slices.target - Slice Units.
[    4.574685] systemd[1]: Listening on rpcbind.socket - RPCbind Server Activation Socket.
[    4.577483] systemd[1]: Listening on systemd-coredump.socket - Process Core Dump Socket.
[    4.579305] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[    4.581014] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[    4.583382] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[    4.585490] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[    4.587620] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.587634] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.587664] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[    4.592034] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    4.595465] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
[    4.597948] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[    4.600396] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
[    4.603890] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[    4.608128] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[    4.610419] systemd[1]: auth-rpcgss-module.service - Kernel Module supporting RPCSEC_GSS was skipped because of an unmet condition check (ConditionPathExists=/etc/krb5.keytab).
[    4.611261] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
[    4.614898] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[    4.618848] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[    4.621459] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[    4.625969] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[    4.629077] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[    4.631400] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
[    4.631425] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    4.633005] pstore: Using crash dump compression: deflate
[    4.640864] systemd[1]: Starting systemd-journald.service - Journal Service...
[    4.644066] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[    4.646130] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.646742] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[    4.649732] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    4.652404] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[    4.653063] systemd-journald[544]: Collecting audit messages is disabled.
[    4.653323] pstore: Registered efi_pstore as persistent store backend
[    4.660174] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[    4.663166] lp: driver loaded but no devices found
[    4.663860] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
[    4.666817] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[    4.669412] systemd[1]: Mounted run-lock.mount - Legacy Locks Directory /run/lock.
[    4.669515] ppdev: user-space parallel port driver
[    4.673550] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[    4.676443] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[    4.679538] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[    4.681970] systemd[1]: Started systemd-journald.service - Journal Service.
[    4.691003] EXT4-fs (nvme0n1p4): re-mounted 7881f7bb-dbe6-4323-887f-dd718adb7a8b r/w. Quota mode: none.
[    4.721852] systemd-journald[544]: Received client request to flush runtime journal.
[    4.822474] ACPI: AC: AC Adapter [ADP1] (off-line)
[    4.827448] Consider using thermal netlink events interface
[    4.827453] input: Intel HID events as /devices/platform/INTC1077:00/input/input37
[    4.827797] int3472-discrete INT3472:01: Sensor module id: 'CJFME62'
[    4.828493] int3472-discrete INT3472:01: reset \_SB.GPI0 pin 65 active-low
[    4.828778] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[    4.830955] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin number mismatch _DSM 11 resource 107
[    4.830958] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
[    4.832719] mc: Linux media interface: v0.10
[    4.833865] int3472-discrete INT3472:02: Sensor module id: 'CJFME62'
[    4.834876] int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mismatch _DSM 49 resource 209
[    4.834880] int3472-discrete INT3472:02: reset \_SB.GPI0 pin 209 active-low
[    4.836693] intel-hid INTC1077:00: failed to enable HID power button
[    4.841446] pci 0000:00:08.0: Setting to D3hot
[    4.842990] input: Intel HID events as /devices/platform/INT33D5:00/input/input38
[    4.844011] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.LPCB.HEC.DPTF.FCHG], AE_NOT_FOUND (20240827/psargs-332)
[    4.844019] ACPI Error: 
[    4.844027] intel-hid INT33D5:00: platform supports 5 button array
[    4.844049] Aborting method \_SB.IETM.CHRG.PPSS due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
[    4.846680] input: Intel HID 5 button array as /devices/platform/INT33D5:00/input/input39
[    4.853467] pci 0000:00:05.0: Setting to D3hot
[    4.857752] videodev: Linux video capture interface: v2.00
[    4.857924] resource: resource sanity check: requesting [mem 0x00000000fedc0000-0x00000000fedcffff], which spans more than pnp 00:03 [mem 0xfedc0000-0xfedc7fff]
[    4.857929] caller igen6_probe+0x17f/0x7f2 [igen6_edac] mapping multiple BARs
[    4.865117] EDAC MC0: Giving out device to module igen6_edac controller Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[    4.866368] pci 0000:00:0b.0: Setting to D3hot
[    4.874037] EDAC MC1: Giving out device to module igen6_edac controller Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[    4.874064] EDAC igen6 MC1: HANDLING IBECC MEMORY ERROR
[    4.874065] EDAC igen6 MC1: ADDR 0x7fffffffe0 
[    4.874066] EDAC igen6 MC0: HANDLING IBECC MEMORY ERROR
[    4.874067] EDAC igen6 MC0: ADDR 0x7fffffffe0 
[    4.874413] Serial bus multi instantiate pseudo device driver CSC3551:00: Instantiated 2 I2C devices.
[    4.874699] EDAC igen6: v2.5.1
[    4.880768] pci 0000:00:14.2: enabling device (0000 -> 0002)
[    4.882547] intel_pmc_core INT33A1:00: Assuming a default substate order for this platform
[    4.883162] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.885101] intel_pmc_core INT33A1:00:  initialized
[    4.886326] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[    4.886972] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.888583] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.889028] intel-ipu6 0000:00:05.0: IPU6 in secure mode touch 0x80000000 mask 0x0
[    4.890901] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.896156] intel-ipu6 0000:00:05.0: FW version: 20230925
[    4.897414] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.897513] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
[    4.897561] intel-ipu6 0000:00:05.0: Connected 1 cameras
[    4.898873] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
[    4.913990] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    4.914194] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    4.914378] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    4.917534] Bluetooth: Core ver 2.22
[    4.917551] NET: Registered PF_BLUETOOTH protocol family
[    4.917552] Bluetooth: HCI device and connection manager initialized
[    4.917555] Bluetooth: HCI socket layer initialized
[    4.917556] Bluetooth: L2CAP socket layer initialized
[    4.917558] Bluetooth: SCO socket layer initialized
[    4.918573] cfg80211: loaded regulatory.db is malformed or signature is missing/invalid
[    4.922014] iTCO_vendor_support: vendor-support=0
[    4.924706] ov08x40 i2c-OVTI08F4:00: supply dovdd not found, using dummy regulator
[    4.928895] ov08x40 i2c-OVTI08F4:00: supply avdd not found, using dummy regulator
[    4.928904] ov08x40 i2c-OVTI08F4:00: supply dvdd not found, using dummy regulator
[    4.933479] input: PC Speaker as /devices/platform/pcspkr/input/input41
[    4.933910] input: HP WMI hotkeys as /devices/virtual/input/input40
[    4.936523] ov08x40 i2c-OVTI08F4:00: error reading chip-id register: -121
[    4.939687] ov08x40 i2c-OVTI08F4:00: probe with driver ov08x40 failed with error -121
[    4.939759] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[    4.942316] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400)
[    4.942651] Error: Driver 'pcspkr' is already registered, aborting...
[    4.942689] Intel(R) Wireless WiFi driver for Linux
[    4.942734] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    4.944440] iwlwifi 0000:00:14.3: Detected crf-id 0x400410, cnv-id 0x1080800 wfpm id 0x80005b20
[    4.944820] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[    4.945845] iwlwifi 0000:00:14.3: PCI dev 7e40/0094, rev=0x441, rfid=0x2010d000
[    4.955488] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6E AX211 160MHz
[    4.962444] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.0.3.94
[    4.962735] iwlwifi 0000:00:14.3: loaded firmware version 89.6b44fa0b.0 ma-b0-gf-a0-89.ucode op_mode iwlmvm
[    4.982476] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 655360 ms ovfl timer
[    4.982478] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    4.982480] RAPL PMU: hw unit of domain package 2^-14 Joules
[    4.982481] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    4.986212] intel-ipu6 0000:00:05.0: CSE authenticate_run done
[    4.988533] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
[    5.019343] cryptd: max_cpu_qlen set to 1000
[    5.021803] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 0002)
[    5.022050] intel_rapl_common: Found RAPL domain package
[    5.038945] Adding 66559996k swap on /dev/nvme0n1p7.  Priority:-2 extents:1 across:66559996k SS
[    5.071151] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Adding DSD properties for 103C8C17
[    5.071403] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Using extra _DSD properties, bypassing _DSD in ACPI
[    5.072160] intel_rapl_msr: PL4 support detected.
[    5.074470] intel_rapl_common: Found RAPL domain package
[    5.074473] intel_rapl_common: Found RAPL domain core
[    5.074475] intel_rapl_common: Found RAPL domain uncore
[    5.074846] AES CTR mode by8 optimization enabled
[    5.080107] typec port0: bound usb3-port1 (ops connector_ops [usbcore])
[    5.080133] typec port0: bound usb2-port1 (ops connector_ops [usbcore])
[    5.106197] usbcore: registered new interface driver btusb
[    5.107913] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cirrus Logic CS35L41 (35a40), Revision: B2
[    5.108013] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Adding DSD properties for 103C8C17
[    5.108187] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Using extra _DSD properties, bypassing _DSD in ACPI
[    5.108191] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Reset line busy, assuming shared reset
[    5.108611] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[    5.108690] snd_hda_intel 0000:56:00.1: enabling device (0000 -> 0002)
[    5.108973] snd_hda_intel 0000:56:00.1: Disabling MSI
[    5.108985] snd_hda_intel 0000:56:00.1: Handle vga_switcheroo audio client
[    5.112275] Bluetooth: hci0: Device revision is 0
[    5.116801] Bluetooth: hci0: Secure boot is enabled
[    5.116803] Bluetooth: hci0: OTP lock is enabled
[    5.116803] Bluetooth: hci0: API lock is enabled
[    5.116804] Bluetooth: hci0: Debug lock is disabled
[    5.116804] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    5.116806] Bluetooth: hci0: Bootloader timestamp 2022.18 buildtype 1 build 49266
[    5.118580] Bluetooth: hci0: DSM reset method type: 0x00
[    5.124571] Bluetooth: hci0: Found device firmware: intel/ibt-0180-0041.sfi
[    5.124593] Bluetooth: hci0: Boot Address: 0x100800
[    5.124595] Bluetooth: hci0: Firmware Version: 99-33.24
[    5.142125] [628] intel-ipu6 0000:00:05.0: remote endpoint port 0 with 4 lanes added
[    5.143606] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cirrus Logic CS35L41 (35a40), Revision: B2
[    5.146535] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input42
[    5.146577] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input43
[    5.146614] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input44
[    5.146646] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input45
[    5.197200] sof-audio-pci-intel-mtl 0000:00:1f.3: enabling device (0000 -> 0002)
[    5.197383] sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
[    5.197431] sof-audio-pci-intel-mtl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[    5.204397] sof-audio-pci-intel-mtl 0000:00:1f.3: use msi interrupt mode
[    5.220513] sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
[    5.220515] sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now
[    5.220516] sof-audio-pci-intel-mtl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
[    5.220517] sof-audio-pci-intel-mtl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
[    5.220518] sof-audio-pci-intel-mtl 0000:00:1f.3: DMICs detected in NHLT tables: 2
[    5.223465] sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
[    5.224210] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/mtl/sof-mtl.ri
[    5.224211] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/mtl
[    5.224211] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
[    5.224783] sof-audio-pci-intel-mtl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.11.1.1
[    5.314294] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[    5.314356] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    5.314376] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    5.314384] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    5.314401] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    5.314965] iwlwifi 0000:00:14.3: loaded PNVM version 16611aa6
[    5.315128] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[    5.331041] iwlwifi 0000:00:14.3: Detected RF GF, rfid=0x2010d000
[    5.350829] sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.11.1.1
[    5.355285] sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
[    5.355512] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card not yet available, widget card binding deferred
[    5.372995] snd_hda_codec_realtek ehdaudio0D0: ALC245: picked fixup  for PCI SSID 103c:8c17
[    5.374583] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    5.374586] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight Time
[    5.396669] iwlwifi 0000:00:14.3: base HW address: d0:65:78:ec:0a:e5
[    5.445971] iwlwifi 0000:00:14.3 wlo1: renamed from wlan0
[    5.770483] audit: type=1400 audit(1734815112.160:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=1040 comm="apparmor_parser"
[    5.770524] audit: type=1400 audit(1734815112.160:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-senddoc" pid=1038 comm="apparmor_parser"
[    5.770599] audit: type=1400 audit(1734815112.160:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=1029 comm="apparmor_parser"
[    5.771901] audit: type=1400 audit(1734815112.160:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oosplash" pid=1037 comm="apparmor_parser"
[    5.771907] audit: type=1400 audit(1734815112.160:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/libexec/ibus-engine-hangul" pid=1042 comm="apparmor_parser"
[    5.771910] audit: type=1400 audit(1734815112.160:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=1032 comm="apparmor_parser"
[    5.773780] audit: type=1400 audit(1734815112.160:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=1032 comm="apparmor_parser"
[    5.773782] audit: type=1400 audit(1734815112.160:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=1036 comm="apparmor_parser"
[    5.773783] audit: type=1400 audit(1734815112.160:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_filter" pid=1036 comm="apparmor_parser"
[    5.775608] audit: type=1400 audit(1734815112.160:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_groff" pid=1036 comm="apparmor_parser"
[    5.828319] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 400a4 vendor: 0x2 v0.60.0, 2 algorithms
[    5.829417] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bin: v0.60.0
[    5.830813] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: C:\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_tooling_4KHz-6dBhighshelf\HP_
[    5.867446] nvme nvme0: using unchecked data buffer
[    5.870328] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    5.870330] Bluetooth: BNEP filters: protocol multicast
[    5.870332] Bluetooth: BNEP socket layer initialized
[    5.890926] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Calibration applied: R0=10501
[    5.893039] block nvme0n1: No UUID available providing old NGUID
[    5.904540] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded - Type: spk-prot, Gain: 17
[    5.904642] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 103C8C17, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 0
[    5.904647] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35l41-hda.0 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    5.905517] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[    5.907374] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight Time
[    5.925165] NET: Registered PF_QIPCRTR protocol family
[    6.307259] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[    6.309308] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    6.309324] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[    6.310496] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    6.312751] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    6.313757] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    6.361736] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 400a4 vendor: 0x2 v0.60.0, 2 algorithms
[    6.364028] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bin: v0.60.0
[    6.364689] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: C:\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_tooling_4KHz-6dBhighshelf\HP_
[    6.398573] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, with index: 0
[    6.424429] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration applied: R0=10902
[    6.439965] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded - Type: spk-prot, Gain: 17
[    6.441289] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SSID: 103C8C17, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 0
[    6.442716] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35l41-hda.1 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[    6.443375] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC245: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    6.444453] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    6.444455] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    6.446036] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=0x0
[    6.446037] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[    6.446046] snd_hda_codec_realtek ehdaudio0D0:      Mic=0x19
[    6.490982] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
[    6.508749] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input46
[    6.509261] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input47
[    6.509770] input: sof-hda-dsp HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input48
[    6.510488] input: sof-hda-dsp HDMI/DP,pcm=4 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input49
[    6.510537] input: sof-hda-dsp HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input50
[    6.538792] hid-sensor-hub 001F:8087:0AC2.0005: hid_field_extract() called with n (192) > 32! (kworker/12:1)
[    6.613853] Bluetooth: hci0: Failed to send firmware data (-38)
[    6.614681] Bluetooth: hci0: Intel reset sent to retry FW download
[    6.618416] usb 3-10: USB disconnect, device number 3
[    6.639688] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[    6.641754] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[    6.641818] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    6.644161] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    6.644168] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[    6.644176] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    6.741772] RPC: Registered named UNIX socket transport module.
[    6.741776] RPC: Registered udp transport module.
[    6.741777] RPC: Registered tcp transport module.
[    6.741777] RPC: Registered tcp-with-tls transport module.
[    6.741778] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    7.062676] usb 3-10: new full-speed USB device number 4 using xhci_hcd
[    7.200415] usb 3-10: New USB device found, idVendor=8087, idProduct=0033, bcdDevice= 0.00
[    7.201654] usb 3-10: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    7.206489] Bluetooth: hci0: Device revision is 0
[    7.207593] Bluetooth: hci0: Secure boot is enabled
[    7.208556] Bluetooth: hci0: OTP lock is enabled
[    7.209503] Bluetooth: hci0: API lock is enabled
[    7.210322] Bluetooth: hci0: Debug lock is disabled
[    7.210899] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    7.210901] Bluetooth: hci0: Bootloader timestamp 2022.18 buildtype 1 build 49266
[    7.211149] Bluetooth: hci0: DSM reset method type: 0x00
[    7.213687] Bluetooth: hci0: Found device firmware: intel/ibt-0180-0041.sfi
[    7.213695] Bluetooth: hci0: Boot Address: 0x100800
[    7.213695] Bluetooth: hci0: Firmware Version: 99-33.24
[    8.673428] Bluetooth: hci0: Waiting for firmware download to complete
[    8.674443] Bluetooth: hci0: Firmware loaded in 1426517 usecs
[    8.675526] Bluetooth: hci0: Waiting for device to boot
[    8.717261] Bluetooth: hci0: Device booted in 40778 usecs
[    8.729788] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0180-0041.ddc
[    8.732306] Bluetooth: hci0: Applying Intel DDC parameters completed
[    8.736344] Bluetooth: hci0: Firmware timestamp 2024.33 buildtype 1 build 3427
[    8.736348] Bluetooth: hci0: Firmware SHA1: 0xd028ffe4
[    8.740349] Bluetooth: hci0: Fseq status: Success (0x00)
[    8.741150] Bluetooth: hci0: Fseq executed: 00.00.03.94
[    8.741843] Bluetooth: hci0: Fseq BT Top: 00.00.03.94
[    8.843261] Bluetooth: MGMT ver 1.23
[    8.849004] NET: Registered PF_ALG protocol family
[    8.869921] Bluetooth: RFCOMM TTY layer initialized
[    8.870580] Bluetooth: RFCOMM socket layer initialized
[    8.871386] Bluetooth: RFCOMM ver 1.11
[   10.770401] netfs: FS-Cache loaded
[   10.771596] Key type dns_resolver registered
[   10.824612] Key type cifs.spnego registered
[   10.825561] Key type cifs.idmap registered
[   10.826615] CIFS: VFS: Use of the less secure dialect vers=1.0 is not recommended unless required for access to very old servers
[   10.826628] CIFS: Attempting to mount //192.168.1.248/NetFolder
[   10.826662] CIFS: VFS: Error connecting to socket. Aborting operation.
[   10.826664] CIFS: VFS: cifs_mount failed w/return code = -101
[   10.876009] NFS: Registering the id_resolver key type
[   10.876502] Key type id_resolver registered
[   10.876956] Key type id_legacy registered
[   11.162044] i915 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A
[   17.178766] input: MX Anywhere 3S Mouse as /devices/virtual/misc/uhid/0005:046D:B037.0009/input/input51
[   17.179465] hid-generic 0005:046D:B037.0009: input,hidraw8: BLUETOOTH HID v0.03 Mouse [MX Anywhere 3S] on d0:65:78:ec:0a:e9
[   18.645134] wlo1: authenticate with f8:85:f9:0d:a2:e1 (local address=d0:65:78:ec:0a:e5)
[   18.645707] wlo1: send auth to f8:85:f9:0d:a2:e1 (try 1/3)
[   18.676922] wlo1: authenticated
[   18.678328] wlo1: associate with f8:85:f9:0d:a2:e1 (try 1/3)
[   18.687960] wlo1: RX AssocResp from f8:85:f9:0d:a2:e1 (capab=0x1511 status=0 aid=4)
[   18.692300] wlo1: associated
[   18.751023] wlo1: Limiting TX power to 30 (30 - 0) dBm as advertised by f8:85:f9:0d:a2:e1
[   18.873454] show_signal: 20 callbacks suppressed
[   18.873459] traps: light-locker[2213] trap int3 ip:7ff42e010f37 sp:7ffe4a6f0380 error:0 in libglib-2.0.so.0.8200.4[64f37,7ff42dfca000+a0000]
[   19.014818] warning: `kdeconnectd' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211
[   19.358957] audit: type=1400 audit(1734815125.748:32): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/system/node/" pid=2427 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   19.393087] audit: type=1400 audit(1734815125.780:33): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/system/node/" pid=2431 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   19.410025] audit: type=1400 audit(1734815125.796:34): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/usr/share/mariadb/charsets/Index.xml" pid=2431 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   19.420016] audit: type=1400 audit(1734815125.808:35): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/block/" pid=2431 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   19.432762] audit: type=1400 audit(1734815125.820:36): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/proc/2431/cgroup" pid=2431 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
[   19.433323] audit: type=1400 audit(1734815125.820:37): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/nvme/nvme0/nvme0n1/queue/physical_block_size" pid=2431 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   19.599243] audit: type=1400 audit(1734815125.988:38): apparmor="DENIED" operation="exec" class="file" profile="mariadbd_akonadi" name="/usr/bin/mariadb" pid=2464 comm="sh" requested_mask="x" denied_mask="x" fsuid=1000 ouid=0
[   83.218701] ov08x40 i2c-OVTI08F4:00: supply dovdd not found, using dummy regulator
[   83.218771] ov08x40 i2c-OVTI08F4:00: supply avdd not found, using dummy regulator
[   83.218786] ov08x40 i2c-OVTI08F4:00: supply dvdd not found, using dummy regulator
[   83.226511] ov08x40 i2c-OVTI08F4:00: error reading chip-id register: -121
[   83.226728] ov08x40 i2c-OVTI08F4:00: probe with driver ov08x40 failed with error -121

----end  20241221_No_Map_GPIO_type_0x12_to_reset_patch.txt ----------

----begin  20241221_revert_map_GPIO_type_0x12_to_reset_2_dmesg.txt ----------
[    0.000000] Linux version 6.13.0-rc2-ipu6+ (duane@DuanesSpectre16) (gcc (Debian 14.2.0-11) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241215) #11 SMP PREEMPT_DYNAMIC Sat Dec 21 15:54:38 CST 2024
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
[    0.000009] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000014] last_pfn = 0x880000 max_arch_pfn = 0x400000000
[    0.000017] MTRR map: 8 entries (3 fixed + 5 variable; max 23), built from 10 variable MTRRs
[    0.000018] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000466] x2apic: enabled by BIOS, switching to x2apic ops
[    0.000467] last_pfn = 0x66000 max_arch_pfn = 0x400000000
[    0.005211] esrt: Reserving ESRT space from 0x0000000055b40d18 to 0x0000000055b40d50.
[    0.005216] e820: update [mem 0x55b40000-0x55b40fff] usable ==> reserved
[    0.005228] Using GB pages for direct mapping
[    0.005356] Secure boot disabled
[    0.005356] RAMDISK: [mem 0x3c308000-0x412adfff]
[    0.005360] ACPI: Early table checksum verification disabled
[    0.005363] ACPI: RSDP 0x000000005AE6D014 000024 (v02 HPQOEM)
[    0.005365] ACPI: XSDT 0x000000005AE6C728 000194 (v01 HPQOEM SLIC-MPC 01072009 AMI  01000013)
[    0.005369] ACPI: FACP 0x000000005AE53000 000114 (v06 HPQOEM SLIC-MPC 01072009 HP   01000013)
[    0.005372] ACPI: DSDT 0x000000005ADDB000 077690 (v02 HPQOEM 8C17     01072009 ACPI 20210930)
[    0.005374] ACPI: FACS 0x000000005AFEA000 000040
[    0.005375] ACPI: SSDT 0x000000005AE6B000 000689 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005377] ACPI: SSDT 0x000000005AE6A000 0005E4 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005379] ACPI: SSDT 0x000000005AE69000 0001AB (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005380] ACPI: SSDT 0x000000005AE68000 000394 (v02 HPQOEM 8C17     00003001 ACPI 20210930)
[    0.005381] ACPI: SSDT 0x000000005AE66000 001BAF (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005383] ACPI: SSDT 0x000000005AE64000 001620 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005384] ACPI: SSDT 0x000000005AE62000 001349 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005386] ACPI: SSDT 0x000000005AE61000 000FBB (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005387] ACPI: SSDT 0x000000005AE5D000 003BC8 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005389] ACPI: DTPR 0x000000005AE5C000 000098 (v01 HPQOEM 8C17     00000000 HP   00000000)
[    0.005390] ACPI: SSDT 0x000000005AE56000 0058E1 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005392] ACPI: SSDT 0x000000005AE54000 00165F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005393] ACPI: FIDT 0x000000005ADDA000 00009C (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005395] ACPI: MSDM 0x000000005ADD9000 000055 (v03 HPQOEM SLIC-MPC 00000001 HP   00010013)
[    0.005396] ACPI: SSDT 0x000000005ADD8000 00038C (v02 HPQOEM 8C17     00000001 ACPI 20210930)
[    0.005398] ACPI: SSDT 0x000000005ADD5000 002494 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005399] ACPI: SSDT 0x000000005ADCA000 0000F9 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005401] ACPI: HPET 0x000000005ADC9000 000038 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005402] ACPI: APIC 0x000000005ADC8000 000358 (v05 HPQOEM 8C17     01072009 HP   01000013)
[    0.005404] ACPI: MCFG 0x000000005ADC7000 00003C (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005405] ACPI: SSDT 0x000000005ADC5000 00147F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005406] ACPI: SSDT 0x000000005ADC3000 00140F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005408] ACPI: SSDT 0x000000005ADB2000 01023F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005409] ACPI: UEFI 0x000000005AEF0000 000048 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005411] ACPI: NHLT 0x000000005ADB1000 000960 (v00 HPQOEM 8C17     01072009 HP   01000013)
[    0.005412] ACPI: LPIT 0x000000005ADB0000 0000CC (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005414] ACPI: SSDT 0x000000005ADAE000 000CA6 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005415] ACPI: SSDT 0x000000005ADA8000 005E42 (v02 HPQOEM 8C17     00000000 ACPI 20210930)
[    0.005417] ACPI: DBGP 0x000000005ADA7000 000034 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005418] ACPI: DBG2 0x000000005ADA6000 000054 (v00 HPQOEM 8C17     01072009 HP   01000013)
[    0.005419] ACPI: SSDT 0x000000005ADA4000 00113F (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005421] ACPI: DMAR 0x000000005ADA3000 0000A8 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005422] ACPI: FPDT 0x000000005ADA2000 000044 (v01 HPQOEM 8C17     01072009 HP   01000013)
[    0.005424] ACPI: SSDT 0x000000005ADA0000 001021 (v02 HPQOEM 8C17     00000000 ACPI 20210930)
[    0.005425] ACPI: SSDT 0x000000005AD9D000 00281A (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005427] ACPI: SSDT 0x000000005AD9A000 0028D3 (v02 HPQOEM 8C17     00003000 ACPI 20210930)
[    0.005428] ACPI: SSDT 0x000000005AD99000 000060 (v01 HPQOEM 8C17     00000001 ACPI 20210930)
[    0.005430] ACPI: SSDT 0x000000005AD90000 0085C5 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005431] ACPI: OEM1 0x000000005AD8F000 0002B0 (v01 HPQOEM HPOEM1DC 00000000 HP   00000000)
[    0.005433] ACPI: SSDT 0x000000005AD8B000 003210 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005434] ACPI: PHAT 0x000000005AD8A000 000734 (v01 HPQOEM 8C17     00000005 HP   0100000D)
[    0.005436] ACPI: SSDT 0x000000005ADCB000 009BC2 (v02 HPQOEM 8C17     00001000 ACPI 20210930)
[    0.005438] ACPI: TPM2 0x000000005AD89000 00004C (v04 HPQOEM 8C17     00000001 HP   00000000)
[    0.005439] ACPI: WSMT 0x000000005ADAF000 000028 (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005441] ACPI: BGRT 0x000000005AD88000 000038 (v01 HPQOEM 8C17     01072009 HP   00010013)
[    0.005442] ACPI: Reserving FACP table memory at [mem 0x5ae53000-0x5ae53113]
[    0.005443] ACPI: Reserving DSDT table memory at [mem 0x5addb000-0x5ae5268f]
[    0.005443] ACPI: Reserving FACS table memory at [mem 0x5afea000-0x5afea03f]
[    0.005444] ACPI: Reserving SSDT table memory at [mem 0x5ae6b000-0x5ae6b688]
[    0.005444] ACPI: Reserving SSDT table memory at [mem 0x5ae6a000-0x5ae6a5e3]
[    0.005444] ACPI: Reserving SSDT table memory at [mem 0x5ae69000-0x5ae691aa]
[    0.005445] ACPI: Reserving SSDT table memory at [mem 0x5ae68000-0x5ae68393]
[    0.005445] ACPI: Reserving SSDT table memory at [mem 0x5ae66000-0x5ae67bae]
[    0.005445] ACPI: Reserving SSDT table memory at [mem 0x5ae64000-0x5ae6561f]
[    0.005446] ACPI: Reserving SSDT table memory at [mem 0x5ae62000-0x5ae63348]
[    0.005446] ACPI: Reserving SSDT table memory at [mem 0x5ae61000-0x5ae61fba]
[    0.005447] ACPI: Reserving SSDT table memory at [mem 0x5ae5d000-0x5ae60bc7]
[    0.005447] ACPI: Reserving DTPR table memory at [mem 0x5ae5c000-0x5ae5c097]
[    0.005447] ACPI: Reserving SSDT table memory at [mem 0x5ae56000-0x5ae5b8e0]
[    0.005448] ACPI: Reserving SSDT table memory at [mem 0x5ae54000-0x5ae5565e]
[    0.005448] ACPI: Reserving FIDT table memory at [mem 0x5adda000-0x5adda09b]
[    0.005448] ACPI: Reserving MSDM table memory at [mem 0x5add9000-0x5add9054]
[    0.005449] ACPI: Reserving SSDT table memory at [mem 0x5add8000-0x5add838b]
[    0.005449] ACPI: Reserving SSDT table memory at [mem 0x5add5000-0x5add7493]
[    0.005449] ACPI: Reserving SSDT table memory at [mem 0x5adca000-0x5adca0f8]
[    0.005450] ACPI: Reserving HPET table memory at [mem 0x5adc9000-0x5adc9037]
[    0.005450] ACPI: Reserving APIC table memory at [mem 0x5adc8000-0x5adc8357]
[    0.005451] ACPI: Reserving MCFG table memory at [mem 0x5adc7000-0x5adc703b]
[    0.005451] ACPI: Reserving SSDT table memory at [mem 0x5adc5000-0x5adc647e]
[    0.005451] ACPI: Reserving SSDT table memory at [mem 0x5adc3000-0x5adc440e]
[    0.005452] ACPI: Reserving SSDT table memory at [mem 0x5adb2000-0x5adc223e]
[    0.005452] ACPI: Reserving UEFI table memory at [mem 0x5aef0000-0x5aef0047]
[    0.005452] ACPI: Reserving NHLT table memory at [mem 0x5adb1000-0x5adb195f]
[    0.005453] ACPI: Reserving LPIT table memory at [mem 0x5adb0000-0x5adb00cb]
[    0.005453] ACPI: Reserving SSDT table memory at [mem 0x5adae000-0x5adaeca5]
[    0.005454] ACPI: Reserving SSDT table memory at [mem 0x5ada8000-0x5adade41]
[    0.005454] ACPI: Reserving DBGP table memory at [mem 0x5ada7000-0x5ada7033]
[    0.005454] ACPI: Reserving DBG2 table memory at [mem 0x5ada6000-0x5ada6053]
[    0.005455] ACPI: Reserving SSDT table memory at [mem 0x5ada4000-0x5ada513e]
[    0.005455] ACPI: Reserving DMAR table memory at [mem 0x5ada3000-0x5ada30a7]
[    0.005455] ACPI: Reserving FPDT table memory at [mem 0x5ada2000-0x5ada2043]
[    0.005456] ACPI: Reserving SSDT table memory at [mem 0x5ada0000-0x5ada1020]
[    0.005456] ACPI: Reserving SSDT table memory at [mem 0x5ad9d000-0x5ad9f819]
[    0.005456] ACPI: Reserving SSDT table memory at [mem 0x5ad9a000-0x5ad9c8d2]
[    0.005457] ACPI: Reserving SSDT table memory at [mem 0x5ad99000-0x5ad9905f]
[    0.005457] ACPI: Reserving SSDT table memory at [mem 0x5ad90000-0x5ad985c4]
[    0.005458] ACPI: Reserving OEM1 table memory at [mem 0x5ad8f000-0x5ad8f2af]
[    0.005458] ACPI: Reserving SSDT table memory at [mem 0x5ad8b000-0x5ad8e20f]
[    0.005458] ACPI: Reserving PHAT table memory at [mem 0x5ad8a000-0x5ad8a733]
[    0.005459] ACPI: Reserving SSDT table memory at [mem 0x5adcb000-0x5add4bc1]
[    0.005459] ACPI: Reserving TPM2 table memory at [mem 0x5ad89000-0x5ad8904b]
[    0.005460] ACPI: Reserving WSMT table memory at [mem 0x5adaf000-0x5adaf027]
[    0.005460] ACPI: Reserving BGRT table memory at [mem 0x5ad88000-0x5ad88037]
[    0.005498] APIC: Switched APIC routing to: cluster x2apic
[    0.005695] No NUMA configuration found
[    0.005695] Faking a node at [mem 0x0000000000000000-0x000000087fffffff]
[    0.005700] NODE_DATA(0) allocated [mem 0x87ffd5680-0x87fffffff]
[    0.005859] Zone ranges:
[    0.005860]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.005861]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.005862]   Normal   [mem 0x0000000100000000-0x000000087fffffff]
[    0.005863]   Device   empty
[    0.005863] Movable zone start for each node
[    0.005864] Early memory node ranges
[    0.005864]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.005865]   node   0: [mem 0x0000000000100000-0x0000000057818fff]
[    0.005866]   node   0: [mem 0x0000000065fff000-0x0000000065ffffff]
[    0.005866]   node   0: [mem 0x0000000100000000-0x000000087fffffff]
[    0.005869] Initmem setup node 0 [mem 0x0000000000001000-0x000000087fffffff]
[    0.005873] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.005892] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.007755] On node 0, zone DMA32: 26598 pages in unavailable ranges
[    0.007979] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.008371] ACPI: PM-Timer IO Port: 0x1808
[    0.008378] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.008411] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.008413] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.008414] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.008417] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.008417] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.008424] e820: update [mem 0x5453a000-0x54563fff] usable ==> reserved
[    0.008431] TSC deadline timer available
[    0.008434] CPU topo: Max. logical packages:   1
[    0.008434] CPU topo: Max. logical dies:       1
[    0.008435] CPU topo: Max. dies per package:   1
[    0.008436] CPU topo: Max. threads per core:   2
[    0.008437] CPU topo: Num. cores per package:    16
[    0.008437] CPU topo: Num. threads per package:  22
[    0.008438] CPU topo: Allowing 22 present CPUs plus 0 hotplug CPUs
[    0.008448] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.008449] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.008450] PM: hibernation: Registered nosave memory: [mem 0x4fe69000-0x4fe69fff]
[    0.008451] PM: hibernation: Registered nosave memory: [mem 0x4fe78000-0x4fe78fff]
[    0.008452] PM: hibernation: Registered nosave memory: [mem 0x5453a000-0x54563fff]
[    0.008453] PM: hibernation: Registered nosave memory: [mem 0x55b40000-0x55b40fff]
[    0.008453] PM: hibernation: Registered nosave memory: [mem 0x57819000-0x5ad4dfff]
[    0.008454] PM: hibernation: Registered nosave memory: [mem 0x5ad4e000-0x5ae6dfff]
[    0.008454] PM: hibernation: Registered nosave memory: [mem 0x5ae6e000-0x5aff0fff]
[    0.008455] PM: hibernation: Registered nosave memory: [mem 0x5aff1000-0x65ffefff]
[    0.008455] PM: hibernation: Registered nosave memory: [mem 0x66000000-0x787fffff]
[    0.008456] PM: hibernation: Registered nosave memory: [mem 0x78800000-0xfdffffff]
[    0.008456] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.008456] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.008457] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.008457] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.008457] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.008458] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0xfed1ffff]
[    0.008458] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfed7ffff]
[    0.008458] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0xfedfffff]
[    0.008459] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.008459] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xffffffff]
[    0.008460] [mem 0x78800000-0xfdffffff] available for PCI devices
[    0.008461] Booting paravirtualized kernel on bare hardware
[    0.008463] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.011838] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:22 nr_cpu_ids:22 nr_node_ids:1
[    0.013174] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.013181] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=1*2097152
[    0.013183] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07 
[    0.013186] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15 
[    0.013188] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 -- -- 
[    0.013199] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+ root=UUID=7881f7bb-dbe6-4323-887f-dd718adb7a8b ro intel_skl_int3472_discrete.dyndbg
[    0.013230] Unknown kernel command line parameters "BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+", will be passed to user space.
[    0.013239] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.013240] printk: log_buf_len total cpu_extra contributions: 86016 bytes
[    0.013240] printk: log_buf_len min size: 131072 bytes
[    0.013380] printk: log buffer data + meta data: 262144 + 917504 = 1179648 bytes
[    0.013381] printk: early log buf free: 112520(85%)
[    0.016007] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.017341] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.017500] Fallback order for Node 0: 0 
[    0.017505] Built 1 zonelists, mobility grouping on.  Total pages: 8222648
[    0.017506] Policy zone: Normal
[    0.017515] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.017527] software IO TLB: area num 32.
[    0.033089] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=22, Nodes=1
[    0.033144] ftrace: allocating 45850 entries in 180 pages
[    0.044429] ftrace: allocated 180 pages with 4 groups
[    0.044991] Dynamic Preempt: voluntary
[    0.045062] rcu: Preemptible hierarchical RCU implementation.
[    0.045063] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=22.
[    0.045064] 	Trampoline variant of Tasks RCU enabled.
[    0.045064] 	Rude variant of Tasks RCU enabled.
[    0.045065] 	Tracing variant of Tasks RCU enabled.
[    0.045065] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.045066] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=22
[    0.045077] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.045079] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.045080] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=22.
[    0.047609] NR_IRQS: 524544, nr_irqs: 2232, preallocated irqs: 16
[    0.047905] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.048077] Console: colour dummy device 80x25
[    0.048079] printk: legacy console [tty0] enabled
[    0.048304] ACPI: Core revision 20240827
[    0.048622] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.048715] APIC: Switch to symmetric I/O mode setup
[    0.048717] DMAR: Host address width 42
[    0.048718] DMAR: DRHD base: 0x000000fc800000 flags: 0x0
[    0.048725] DMAR: dmar0: reg_base_addr fc800000 ver 7:0 cap c9de008cee690462 ecap 12ca9a00f0ef5e
[    0.048728] DMAR: DRHD base: 0x000000fc801000 flags: 0x1
[    0.048734] DMAR: dmar1: reg_base_addr fc801000 ver 7:0 cap c9de008cee690462 ecap 12ca9a00f0efde
[    0.048737] DMAR: SATC flags: 0x1
[    0.048739] DMAR-IR: IOAPIC id 2 under DRHD base  0xfc801000 IOMMU 1
[    0.048741] DMAR-IR: HPET id 0 under DRHD base 0xfc801000
[    0.048742] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.050339] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.054257] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.054265] Calibrating delay loop (skipped), value calculated using timer frequency.. 5990.40 BogoMIPS (lpj=11980800)
[    0.054322] CPU0: Thermal monitoring enabled (TM1)
[    0.054324] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.054497] CET detected: Indirect Branch Tracking enabled
[    0.054499] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.054500] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.054503] process: using mwait in idle threads
[    0.054506] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.054508] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.054510] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.054512] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.054514] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.054523] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.054524] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.054526] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.054527] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.054528] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
[    0.054530] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.054531] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.054533] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.054534] x86/fpu: Enabled xstate features 0xa07, context size is 856 bytes, using 'compacted' format.
[    0.058263] Freeing SMP alternatives memory: 40K
[    0.058263] pid_max: default: 32768 minimum: 301
[    0.058263] LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor,tomoyo,bpf,ima,evm
[    0.058263] landlock: Up and running.
[    0.058263] Yama: becoming mindful.
[    0.058263] AppArmor: AppArmor initialized
[    0.058263] TOMOYO Linux initialized
[    0.058263] LSM support for eBPF active
[    0.058263] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.058263] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.058263] smpboot: CPU0: Intel(R) Core(TM) Ultra 7 155H (family: 0x6, model: 0xaa, stepping: 0x4)
[    0.058263] Performance Events: XSAVE Architectural LBR, PEBS fmt4+-baseline,  AnyThread deprecated, Meteorlake Hybrid events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.058263] core: cpu_core PMU driver: 
[    0.058263] ... version:                5
[    0.058263] ... bit width:              48
[    0.058263] ... generic registers:      8
[    0.058263] ... value mask:             0000ffffffffffff
[    0.058263] ... max period:             00007fffffffffff
[    0.058263] ... fixed-purpose events:   4
[    0.058263] ... event mask:             0001000f000000ff
[    0.058263] signal: max sigframe size: 3632
[    0.058263] Estimated ratio of average max frequency by base frequency (times 1024): 1638
[    0.058263] rcu: Hierarchical SRCU implementation.
[    0.058263] rcu: 	Max phase no-delay instances is 1000.
[    0.058263] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.058263] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.058263] smp: Bringing up secondary CPUs ...
[    0.058263] smpboot: x86: Booting SMP configuration:
[    0.058263] .... node  #0, CPUs:        #1  #3  #6  #8 #10 #12 #13 #14 #15 #16 #17 #18 #19 #20 #21
[    0.010227] core: cpu_atom PMU driver: PEBS-via-PT 
[    0.010227] ... version:                5
[    0.010227] ... bit width:              48
[    0.010227] ... generic registers:      8
[    0.010227] ... value mask:             0000ffffffffffff
[    0.010227] ... max period:             00007fffffffffff
[    0.010227] ... fixed-purpose events:   3
[    0.010227] ... event mask:             00000007000000ff
[    0.062349]   #2  #4  #5  #7  #9 #11
[    0.083840] smp: Brought up 1 node, 22 CPUs
[    0.083840] smpboot: Total of 22 processors activated (131788.80 BogoMIPS)
[    0.102322] node 0 deferred pages initialised in 16ms
[    0.104395] Memory: 32106676K/32890592K available (16384K kernel code, 2504K rwdata, 6904K rodata, 4148K init, 4924K bss, 762376K reserved, 0K cma-reserved)
[    0.104395] devtmpfs: initialized
[    0.104395] x86/mm: Memory block size: 128MB
[    0.106849] ACPI: PM: Registering ACPI NVS region [mem 0x5ae6e000-0x5aff0fff] (1585152 bytes)
[    0.106849] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.106849] futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
[    0.106849] pinctrl core: initialized pinctrl subsystem
[    0.106867] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.107322] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.107690] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.108059] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.108066] audit: initializing netlink subsys (disabled)
[    0.108073] audit: type=2000 audit(1734818642.000:1): state=initialized audit_enabled=0 res=1
[    0.108073] thermal_sys: Registered thermal governor 'fair_share'
[    0.108073] thermal_sys: Registered thermal governor 'bang_bang'
[    0.108073] thermal_sys: Registered thermal governor 'step_wise'
[    0.108073] thermal_sys: Registered thermal governor 'user_space'
[    0.108073] thermal_sys: Registered thermal governor 'power_allocator'
[    0.108073] cpuidle: using governor ladder
[    0.108073] cpuidle: using governor menu
[    0.108073] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.108073] PCI: ECAM [mem 0xc0000000-0xcfffffff] (base 0xc0000000) for domain 0000 [bus 00-ff]
[    0.108073] PCI: Using configuration type 1 for base access
[    0.108073] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.108073] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.108073] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.108073] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.108073] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.108073] ACPI: Added _OSI(Module Device)
[    0.108073] ACPI: Added _OSI(Processor Device)
[    0.108073] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.108073] ACPI: Added _OSI(Processor Aggregator Device)
[    0.170861] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PACT], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170867] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170869] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PABN], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170871] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170873] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PAS1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170875] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170879] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PMP0], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170882] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170890] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PMP1], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170893] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170900] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA01], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170903] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170905] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.170907] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA02], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170909] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170911] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.170912] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA03], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170914] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170916] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.170917] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA04], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170919] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170921] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.170922] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA05], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170924] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170926] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.170927] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA06], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170929] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170931] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.170933] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA07], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170934] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170936] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.170938] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2C3.PA08], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.170940] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.170941] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x5B82)
[    0.171743] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.I2C3.TPD0], AE_NOT_FOUND (20240827/dswload2-162)
[    0.171745] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.171747] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.177144] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS01], AE_NOT_FOUND (20240827/dswload2-162)
[    0.177147] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.177148] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.177150] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS02], AE_NOT_FOUND (20240827/dswload2-162)
[    0.177152] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.177154] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.177155] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS03], AE_NOT_FOUND (20240827/dswload2-162)
[    0.177157] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.177159] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.177161] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.TXHC.RHUB.SS04], AE_NOT_FOUND (20240827/dswload2-162)
[    0.177163] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20240827/psobject-220)
[    0.177164] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
[    0.177180] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177183] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177184] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177186] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177188] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177189] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177193] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177195] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177197] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177198] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177200] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177202] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177205] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS03._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177207] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177209] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177210] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS03._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177212] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177214] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177217] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS04._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177219] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177220] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177222] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS04._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177224] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177225] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177228] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS05._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177230] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177232] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177233] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS05._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177235] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177237] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177240] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS06._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177242] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177243] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177245] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS06._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177247] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177248] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177251] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS07._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177254] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177255] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177257] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS07._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177259] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177260] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177263] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS08._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177265] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177267] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177268] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS08._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177270] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177272] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177275] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS09._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177277] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177278] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177280] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS09._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177282] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177283] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177286] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS10._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177288] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177290] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177291] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.HS10._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177293] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177295] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177348] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS01._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177351] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177352] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177354] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS01._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177356] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177357] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177360] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS02._UPC], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177362] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177364] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.177365] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.XHCI.RHUB.SS02._PLD], AE_ALREADY_EXISTS (20240827/dswload2-326)
[    0.177367] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20240827/psobject-220)
[    0.177369] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0014)
[    0.183940] ACPI: 28 ACPI AML tables successfully acquired and loaded
[    0.192274] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomain+
[    0.192274] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomain+
[    0.197233] ACPI: EC: EC started
[    0.197234] ACPI: EC: interrupt blocked
[    0.203284] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.203286] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC used to handle transactions
[    0.203288] ACPI: Interpreter enabled
[    0.203331] ACPI: PM: (supports S0 S3 S4 S5)
[    0.203333] ACPI: Using IOAPIC for interrupt routing
[    0.203369] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.203371] PCI: Ignoring E820 reservations for host bridge windows
[    0.204890] ACPI: Enabled 10 GPEs in block 00 to 7F
[    0.204908] ACPI: Enabled 8 GPEs in block 80 to DF
[    0.206441] ACPI: \_SB_.PC00.RP01.PXP_: New power resource
[    0.209354] ACPI: \_SB_.PC00.RP06.PXP_: New power resource
[    0.210241] ACPI: \_SB_.PC00.RP07.PXP_: New power resource
[    0.211750] ACPI: \_SB_.PC00.RP09.PXP_: New power resource
[    0.212462] ACPI: \_SB_.PC00.RP10.PXP_: New power resource
[    0.213353] ACPI: \_SB_.PC00.RP11.PXP_: New power resource
[    0.214457] ACPI: \_SB_.PC00.RP12.PXP_: New power resource
[    0.218104] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.BTRT: New power resource
[    0.218159] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.DBTR: New power resource
[    0.218159] ACPI: \_SB_.PC00.PAUD: New power resource
[    0.219988] ACPI: \_SB_.PC00.I2C3.PXTC: New power resource
[    0.226190] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.243568] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.243635] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.243691] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.261892] ACPI: \PIN_: New power resource
[    0.262492] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-fe])
[    0.262501] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.263324] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.264915] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME PCIeCapability LTR]
[    0.266761] PCI host bridge to bus 0000:00
[    0.266766] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.266769] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.266771] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.266774] pci_bus 0000:00: root bus resource [mem 0x80000000-0xbfffffff window]
[    0.266777] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x3ffbfffffff window]
[    0.266780] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.268751] pci 0000:00:00.0: [8086:7d01] type 00 class 0x060000 conventional PCI endpoint
[    0.268895] pci 0000:00:02.0: [8086:7d55] type 00 class 0x030000 PCIe Root Complex Integrated Endpoint
[    0.268910] pci 0000:00:02.0: BAR 0 [mem 0x5220000000-0x5220ffffff 64bit pref]
[    0.268921] pci 0000:00:02.0: BAR 2 [mem 0x4210000000-0x421fffffff 64bit pref]
[    0.268954] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.268959] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.268996] pci 0000:00:02.0: PME# supported from D0 D3hot
[    0.269016] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit pref]
[    0.269019] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit pref]: contains BAR 0 for 7 VFs
[    0.269205] pci 0000:00:04.0: [8086:7d03] type 00 class 0x118000 conventional PCI endpoint
[    0.269222] pci 0000:00:04.0: BAR 0 [mem 0x52312c0000-0x52312dffff 64bit]
[    0.269465] pci 0000:00:05.0: [8086:7d19] type 00 class 0x048000 PCIe Root Complex Integrated Endpoint
[    0.269476] pci 0000:00:05.0: BAR 0 [mem 0x5230000000-0x5230ffffff 64bit]
[    0.269492] pci 0000:00:05.0: enabling Extended Tags
[    0.269620] pci 0000:00:06.0: [8086:7ecb] type 01 class 0x060400 PCIe Root Port
[    0.269646] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.269653] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff]
[    0.269738] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.269782] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.270559] pci 0000:00:07.0: [8086:7ec4] type 01 class 0x060400 PCIe Root Port
[    0.270594] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.270601] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff]
[    0.270611] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.270727] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.270760] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.271514] pci 0000:00:07.2: [8086:7ec6] type 01 class 0x060400 PCIe Root Port
[    0.271542] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.271549] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff]
[    0.271559] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.271675] pci 0000:00:07.2: PME# supported from D0 D3hot D3cold
[    0.271707] pci 0000:00:07.2: PTM enabled (root), 4ns granularity
[    0.272462] pci 0000:00:08.0: [8086:7e4c] type 00 class 0x088000 conventional PCI endpoint
[    0.272478] pci 0000:00:08.0: BAR 0 [mem 0x5231327000-0x5231327fff 64bit]
[    0.272596] pci 0000:00:0a.0: [8086:7d0d] type 00 class 0x118000 PCIe Root Complex Integrated Endpoint
[    0.272605] pci 0000:00:0a.0: BAR 0 [mem 0x5231280000-0x52312bffff 64bit]
[    0.272623] pci 0000:00:0a.0: enabling Extended Tags
[    0.272697] pci 0000:00:0b.0: [8086:7d1d] type 00 class 0x120000 PCIe Root Complex Integrated Endpoint
[    0.272709] pci 0000:00:0b.0: BAR 0 [mem 0x5228000000-0x522fffffff 64bit]
[    0.272722] pci 0000:00:0b.0: BAR 4 [mem 0x5231326000-0x5231326fff 64bit]
[    0.272856] pci 0000:00:0d.0: [8086:7ec0] type 00 class 0x0c0330 conventional PCI endpoint
[    0.272873] pci 0000:00:0d.0: BAR 0 [mem 0x5231300000-0x523130ffff 64bit]
[    0.272963] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.273369] pci 0000:00:0d.2: [8086:7ec2] type 00 class 0x0c0340 conventional PCI endpoint
[    0.273385] pci 0000:00:0d.2: BAR 0 [mem 0x5231240000-0x523127ffff 64bit]
[    0.273396] pci 0000:00:0d.2: BAR 2 [mem 0x5231325000-0x5231325fff 64bit]
[    0.273472] pci 0000:00:0d.2: supports D1 D2
[    0.273474] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.273600] pci 0000:00:0d.3: [8086:7ec3] type 00 class 0x0c0340 conventional PCI endpoint
[    0.273616] pci 0000:00:0d.3: BAR 0 [mem 0x5231200000-0x523123ffff 64bit]
[    0.273627] pci 0000:00:0d.3: BAR 2 [mem 0x5231324000-0x5231324fff 64bit]
[    0.273749] pci 0000:00:0d.3: supports D1 D2
[    0.273751] pci 0000:00:0d.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.273894] pci 0000:00:12.0: [8086:7e45] type 00 class 0x070000 conventional PCI endpoint
[    0.273909] pci 0000:00:12.0: BAR 0 [mem 0x52312f0000-0x52312fffff 64bit]
[    0.273956] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.274644] pci 0000:00:14.0: [8086:7e7d] type 00 class 0x0c0330 conventional PCI endpoint
[    0.274660] pci 0000:00:14.0: BAR 0 [mem 0x52312e0000-0x52312effff 64bit]
[    0.274720] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.275120] pci 0000:00:14.2: [8086:7e7f] type 00 class 0x050000 conventional PCI endpoint
[    0.275138] pci 0000:00:14.2: BAR 0 [mem 0x5231318000-0x523131bfff 64bit]
[    0.275151] pci 0000:00:14.2: BAR 2 [mem 0x5231323000-0x5231323fff 64bit]
[    0.275256] pci 0000:00:14.3: [8086:7e40] type 00 class 0x028000 PCIe Root Complex Integrated Endpoint
[    0.275283] pci 0000:00:14.3: BAR 0 [mem 0x5231314000-0x5231317fff 64bit]
[    0.275368] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.275583] pci 0000:00:15.0: [8086:7e78] type 00 class 0x0c8000 conventional PCI endpoint
[    0.275634] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.276013] pci 0000:00:15.1: [8086:7e79] type 00 class 0x0c8000 conventional PCI endpoint
[    0.276064] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.276451] pci 0000:00:15.3: [8086:7e7b] type 00 class 0x0c8000 conventional PCI endpoint
[    0.276508] pci 0000:00:15.3: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.276845] pci 0000:00:16.0: [8086:7e70] type 00 class 0x078000 conventional PCI endpoint
[    0.276866] pci 0000:00:16.0: BAR 0 [mem 0x523131f000-0x523131ffff 64bit]
[    0.276949] pci 0000:00:16.0: PME# supported from D3hot
[    0.277672] pci 0000:00:19.0: [8086:7e50] type 00 class 0x0c8000 conventional PCI endpoint
[    0.277724] pci 0000:00:19.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.278072] pci 0000:00:19.1: [8086:7e51] type 00 class 0x0c8000 conventional PCI endpoint
[    0.278124] pci 0000:00:19.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.278460] pci 0000:00:1c.0: [8086:7e38] type 01 class 0x060400 PCIe Root Port
[    0.278483] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.278487] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.278491] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff]
[    0.278499] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.278561] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.278591] pci 0000:00:1c.0: PTM enabled (root), 4ns granularity
[    0.279205] pci 0000:00:1f.0: [8086:7e02] type 00 class 0x060100 conventional PCI endpoint
[    0.279585] pci 0000:00:1f.3: [8086:7e28] type 00 class 0x040100 conventional PCI endpoint
[    0.279619] pci 0000:00:1f.3: BAR 0 [mem 0x5231310000-0x5231313fff 64bit]
[    0.279641] pci 0000:00:1f.3: BAR 4 [mem 0x5231000000-0x52311fffff 64bit]
[    0.279709] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.279800] pci 0000:00:1f.4: [8086:7e22] type 00 class 0x0c0500 conventional PCI endpoint
[    0.279822] pci 0000:00:1f.4: BAR 0 [mem 0x523131c000-0x523131c0ff 64bit]
[    0.279847] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.280067] pci 0000:00:1f.5: [8086:7e23] type 00 class 0x0c8000 conventional PCI endpoint
[    0.280103] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.280620] pci 0000:01:00.0: [1c5c:1959] type 00 class 0x010802 PCIe Endpoint
[    0.280640] pci 0000:01:00.0: BAR 0 [mem 0x8d200000-0x8d203fff 64bit]
[    0.280943] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.280994] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.281047] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.281103] pci 0000:56:00.0: [10de:28a1] type 00 class 0x030000 PCIe Legacy Endpoint
[    0.281117] pci 0000:56:00.0: BAR 0 [mem 0x8c000000-0x8cffffff]
[    0.281128] pci 0000:56:00.0: BAR 1 [mem 0x4000000000-0x41ffffffff 64bit pref]
[    0.281140] pci 0000:56:00.0: BAR 3 [mem 0x4200000000-0x4201ffffff 64bit pref]
[    0.281148] pci 0000:56:00.0: BAR 5 [io  0x3000-0x307f]
[    0.281156] pci 0000:56:00.0: ROM [mem 0x8d000000-0x8d07ffff pref]
[    0.281220] pci 0000:56:00.0: PME# supported from D0 D3hot
[    0.281300] pci 0000:56:00.0: 63.012 Gb/s available PCIe bandwidth, limited by 16.0 GT/s PCIe x4 link at 0000:00:1c.0 (capable of 126.024 Gb/s with 16.0 GT/s PCIe x8 link)
[    0.281499] pci 0000:56:00.1: [10de:22be] type 00 class 0x040300 PCIe Endpoint
[    0.281512] pci 0000:56:00.1: BAR 0 [mem 0x8d080000-0x8d083fff]
[    0.281652] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.286062] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.286199] ACPI: PCI: Interrupt link LNKB configured for IRQ 1
[    0.286335] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.286468] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.286599] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.286731] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.286863] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.286995] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.287928] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x1)
[    0.423851] Low-power S0 idle used by default for system suspend
[    0.433752] ACPI: EC: interrupt unblocked
[    0.433755] ACPI: EC: event unblocked
[    0.434263] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.434263] ACPI: EC: GPE=0x6e
[    0.434263] ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC initialization complete
[    0.434263] ACPI: \_SB_.PC00.LPCB.EC0_: EC: Used to handle transactions and events
[    0.434291] iommu: Default domain type: Translated
[    0.434291] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.434394] pps_core: LinuxPPS API ver. 1 registered
[    0.434397] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.434401] PTP clock support registered
[    0.434414] EDAC MC: Ver: 3.0.0
[    0.438350] efivars: Registered efivars operations
[    0.438515] NetLabel: Initializing
[    0.438517] NetLabel:  domain hash size = 128
[    0.438519] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.438538] NetLabel:  unlabeled traffic allowed by default
[    0.438545] PCI: Using ACPI for IRQ routing
[    0.445904] PCI: pci_cache_line_size set to 64 bytes
[    0.446064] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't claim; no compatible bridge window
[    0.446183] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.446184] e820: reserve RAM buffer [mem 0x4fe69018-0x4fffffff]
[    0.446185] e820: reserve RAM buffer [mem 0x5453a000-0x57ffffff]
[    0.446186] e820: reserve RAM buffer [mem 0x55b40000-0x57ffffff]
[    0.446187] e820: reserve RAM buffer [mem 0x57819000-0x57ffffff]
[    0.446188] e820: reserve RAM buffer [mem 0x66000000-0x67ffffff]
[    0.446292] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.446292] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.446292] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.446292] pci 0000:56:00.0: vgaarb: bridge control possible
[    0.446292] pci 0000:56:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.446292] vgaarb: loaded
[    0.446346] clocksource: Switched to clocksource tsc-early
[    0.450295] VFS: Disk quotas dquot_6.6.0
[    0.450295] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.450295] AppArmor: AppArmor Filesystem Enabled
[    0.450295] pnp: PnP ACPI init
[    0.450295] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.450295] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.450295] system 00:01: [io  0x1854-0x1857] has been reserved
[    0.450295] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.450295] pnp 00:03: disabling [mem 0x00000000-0x00000fff] because it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.450295] system 00:03: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    0.450295] system 00:03: [mem 0xc0000000-0xcfffffff] has been reserved
[    0.450295] system 00:03: [mem 0xfed20000-0xfed7ffff] could not be reserved
[    0.450295] system 00:03: [mem 0xfc800000-0xfc81ffff] could not be reserved
[    0.450295] system 00:03: [mem 0xfed45000-0xfed8ffff] could not be reserved
[    0.450295] system 00:03: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.450295] system 00:04: [io  0x2000-0x20fe] has been reserved
[    0.450295] system 00:05: [mem 0xfe02c008-0xfe02cfff] has been reserved
[    0.450295] system 00:05: [mem 0xfe02d000-0xfe02dfff] has been reserved
[    0.502608] pnp: PnP ACPI: found 6 devices
[    0.508229] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.508304] NET: Registered PF_INET protocol family
[    0.508544] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.511706] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.511753] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.511970] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.512389] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.512499] TCP: Hash tables configured (established 262144 bind 65536)
[    0.512686] MPTCP token hash table entries: 32768 (order: 7, 786432 bytes, linear)
[    0.512847] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.513014] UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.513130] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.513138] NET: Registered PF_XDP protocol family
[    0.513146] pci_bus 0000:00: max bus depth: 1 pci_try_num: 2
[    0.513160] pci 0000:00:02.0: VF BAR 0 [mem 0x4202000000-0x4208ffffff 64bit pref]: assigned
[    0.513168] pci 0000:00:07.0: bridge window [io  0x4000-0x4fff]: assigned
[    0.513171] pci 0000:00:07.2: bridge window [io  0x5000-0x5fff]: assigned
[    0.513174] pci 0000:00:15.0: BAR 0 [mem 0x4209000000-0x4209000fff 64bit]: assigned
[    0.513214] pci 0000:00:15.1: BAR 0 [mem 0x4209001000-0x4209001fff 64bit]: assigned
[    0.513257] pci 0000:00:15.3: BAR 0 [mem 0x4209002000-0x4209002fff 64bit]: assigned
[    0.513303] pci 0000:00:19.0: BAR 0 [mem 0x4209003000-0x4209003fff 64bit]: assigned
[    0.513346] pci 0000:00:19.1: BAR 0 [mem 0x4209004000-0x4209004fff 64bit]: assigned
[    0.513393] pci 0000:00:1f.5: BAR 0 [mem 0x8d100000-0x8d100fff]: assigned
[    0.513405] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.513476] pci 0000:00:06.0:   bridge window [mem 0x8d200000-0x8d2fffff]
[    0.513512] pci 0000:00:07.0: PCI bridge to [bus 02-2b]
[    0.513524] pci 0000:00:07.0:   bridge window [io  0x4000-0x4fff]
[    0.513529] pci 0000:00:07.0:   bridge window [mem 0x86000000-0x8bffffff]
[    0.513533] pci 0000:00:07.0:   bridge window [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.513539] pci 0000:00:07.2: PCI bridge to [bus 2c-55]
[    0.513542] pci 0000:00:07.2:   bridge window [io  0x5000-0x5fff]
[    0.513547] pci 0000:00:07.2:   bridge window [mem 0x80000000-0x85ffffff]
[    0.513550] pci 0000:00:07.2:   bridge window [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.513558] pci 0000:00:1c.0: PCI bridge to [bus 56]
[    0.513560] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.513565] pci 0000:00:1c.0:   bridge window [mem 0x8c000000-0x8d0fffff]
[    0.513568] pci 0000:00:1c.0:   bridge window [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.513574] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.513576] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.513579] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.513581] pci_bus 0000:00: resource 7 [mem 0x80000000-0xbfffffff window]
[    0.513583] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x3ffbfffffff window]
[    0.513586] pci_bus 0000:01: resource 1 [mem 0x8d200000-0x8d2fffff]
[    0.513588] pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
[    0.513590] pci_bus 0000:02: resource 1 [mem 0x86000000-0x8bffffff]
[    0.513592] pci_bus 0000:02: resource 2 [mem 0x4a20000000-0x521fffffff 64bit pref]
[    0.513595] pci_bus 0000:2c: resource 0 [io  0x5000-0x5fff]
[    0.513597] pci_bus 0000:2c: resource 1 [mem 0x80000000-0x85ffffff]
[    0.513599] pci_bus 0000:2c: resource 2 [mem 0x4220000000-0x4a1fffffff 64bit pref]
[    0.513602] pci_bus 0000:56: resource 0 [io  0x3000-0x3fff]
[    0.513604] pci_bus 0000:56: resource 1 [mem 0x8c000000-0x8d0fffff]
[    0.513606] pci_bus 0000:56: resource 2 [mem 0x4000000000-0x4201ffffff 64bit pref]
[    0.514451] pci 0000:56:00.1: extending delay after power-on from D3hot to 20 msec
[    0.514478] pci 0000:56:00.1: D0 power state depends on 0000:56:00.0
[    0.514484] PCI: CLS 64 bytes, default 64
[    0.514546] DMAR: Intel-IOMMU force enabled due to platform opt in
[    0.514557] DMAR: No RMRR found
[    0.514559] DMAR: No ATSR found
[    0.514561] DMAR: IOMMU feature sc_support inconsistent
[    0.514563] DMAR: dmar0: Using Queued invalidation
[    0.514569] DMAR: dmar1: Using Queued invalidation
[    0.514588] Trying to unpack rootfs image as initramfs...
[    0.514908] pci 0000:00:02.0: Adding to iommu group 0
[    0.514946] pci 0000:00:00.0: Adding to iommu group 1
[    0.514961] pci 0000:00:04.0: Adding to iommu group 2
[    0.514974] pci 0000:00:05.0: Adding to iommu group 3
[    0.515007] pci 0000:00:06.0: Adding to iommu group 4
[    0.515028] pci 0000:00:07.0: Adding to iommu group 5
[    0.515040] pci 0000:00:07.2: Adding to iommu group 6
[    0.515051] pci 0000:00:08.0: Adding to iommu group 7
[    0.515064] pci 0000:00:0a.0: Adding to iommu group 8
[    0.515075] pci 0000:00:0b.0: Adding to iommu group 9
[    0.515097] pci 0000:00:0d.0: Adding to iommu group 10
[    0.515108] pci 0000:00:0d.2: Adding to iommu group 10
[    0.515119] pci 0000:00:0d.3: Adding to iommu group 10
[    0.515136] pci 0000:00:12.0: Adding to iommu group 11
[    0.515154] pci 0000:00:14.0: Adding to iommu group 12
[    0.515166] pci 0000:00:14.2: Adding to iommu group 12
[    0.515176] pci 0000:00:14.3: Adding to iommu group 13
[    0.515200] pci 0000:00:15.0: Adding to iommu group 14
[    0.515212] pci 0000:00:15.1: Adding to iommu group 14
[    0.515224] pci 0000:00:15.3: Adding to iommu group 14
[    0.515239] pci 0000:00:16.0: Adding to iommu group 15
[    0.515257] pci 0000:00:19.0: Adding to iommu group 16
[    0.515270] pci 0000:00:19.1: Adding to iommu group 16
[    0.515282] pci 0000:00:1c.0: Adding to iommu group 17
[    0.515307] pci 0000:00:1f.0: Adding to iommu group 18
[    0.515320] pci 0000:00:1f.3: Adding to iommu group 18
[    0.515332] pci 0000:00:1f.4: Adding to iommu group 18
[    0.515345] pci 0000:00:1f.5: Adding to iommu group 18
[    0.515380] pci 0000:01:00.0: Adding to iommu group 19
[    0.515401] pci 0000:56:00.0: Adding to iommu group 20
[    0.515415] pci 0000:56:00.1: Adding to iommu group 20
[    0.515701] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.515703] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.515705] software IO TLB: mapped [mem 0x00000000480b8000-0x000000004c0b8000] (64MB)
[    0.515736] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b2c8ec87c7, max_idle_ns: 440795278598 ns
[    0.515776] clocksource: Switched to clocksource tsc
[    0.515800] platform rtc_cmos: registered platform RTC device (no PNP device found)
[    0.518750] Initialise system trusted keyrings
[    0.518763] Key type blacklist registered
[    0.518813] workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.518823] zbud: loaded
[    0.518914] fuse: init (API version 7.41)
[    0.519037] integrity: Platform Keyring initialized
[    0.519044] integrity: Machine keyring initialized
[    0.528215] Key type asymmetric registered
[    0.528219] Asymmetric key parser 'x509' registered
[    1.027619] Freeing initrd memory: 81560K
[    1.032477] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
[    1.032525] io scheduler mq-deadline registered
[    1.034123] ledtrig-cpu: registered to indicate activity on CPUs
[    1.035024] pcieport 0000:00:06.0: PME: Signaling with IRQ 122
[    1.035471] pcieport 0000:00:07.0: PME: Signaling with IRQ 123
[    1.035500] pcieport 0000:00:07.0: pciehp: Slot #12 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    1.035866] pcieport 0000:00:07.2: PME: Signaling with IRQ 124
[    1.035885] pcieport 0000:00:07.2: pciehp: Slot #14 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    1.036180] pcieport 0000:00:1c.0: PME: Signaling with IRQ 125
[    1.036286] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.047898] ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-274000)
[    1.050240] thermal LNXTHERM:00: registered as thermal_zone0
[    1.050244] ACPI: thermal: Thermal Zone [TZ01] (84 C)
[    1.050447] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.051121] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    1.051478] hpet_acpi_add: no address or irqs in _CRS
[    1.051501] Linux agpgart interface v0.103
[    1.053376] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0x1D, rev-id 54)
[    1.169276] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    1.169281] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    1.170691] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.170988] mousedev: PS/2 mouse device common for all mice
[    1.171014] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.171849] rtc_cmos rtc_cmos: registered as rtc0
[    1.171981] rtc_cmos rtc_cmos: setting system clock to 2024-12-21T22:04:03 UTC (1734818643)
[    1.172004] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nvram
[    1.174639] intel_pstate: Intel P-state driver initializing
[    1.178380] intel_pstate: HWP enabled
[    1.178524] efifb: probing for efifb
[    1.178535] efifb: framebuffer at 0x70800000, using 20252k, total 20250k
[    1.178537] efifb: mode is 2880x1800x32, linelength=11520, pages=1
[    1.178540] efifb: scrolling: redraw
[    1.178541] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    1.181001] Console: switching to colour frame buffer device 180x56
[    1.183433] fb0: EFI VGA frame buffer device
[    1.183597] NET: Registered PF_INET6 protocol family
[    1.187811] Segment Routing with IPv6
[    1.187844] In-situ OAM (IOAM) with IPv6
[    1.187887] mip6: Mobile IPv6
[    1.187902] NET: Registered PF_PACKET protocol family
[    1.188021] mpls_gso: MPLS GSO support
[    1.191173] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.192368] microcode: Current revision: 0x00000020
[    1.192387] microcode: Updated early from: 0x0000001f
[    1.197409] IPI shorthand broadcast: enabled
[    1.198244] sched_clock: Marking stable (1192002129, 6227947)->(1243697027, -45466951)
[    1.198779] registered taskstats version 1
[    1.198891] Loading compiled-in X.509 certificates
[    1.213536] Loaded X.509 cert 'Build time autogenerated kernel key: 24a2ef881874b1f607ad746af78b458b87f50423'
[    1.214925] Demotion targets for Node 0: null
[    1.215248] Key type .fscrypt registered
[    1.215267] Key type fscrypt-provisioning registered
[    1.228998] Key type encrypted registered
[    1.229020] AppArmor: AppArmor sha256 policy hashing enabled
[    1.229430] integrity: Loading X.509 certificate: UEFI:db
[    1.229480] integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    1.229527] integrity: Loading X.509 certificate: UEFI:db
[    1.229566] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
[    1.229608] integrity: Loading X.509 certificate: UEFI:db
[    1.229646] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    1.229694] integrity: Loading X.509 certificate: UEFI:db
[    1.229732] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.229778] integrity: Loading X.509 certificate: UEFI:db
[    1.229817] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.231294] ima: Allocated hash algorithm: sha256
[    1.238542] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    1.390927] ima: No architecture policies found
[    1.392169] evm: Initialising EVM extended attributes:
[    1.393168] evm: security.selinux
[    1.393831] evm: security.SMACK64 (disabled)
[    1.394451] evm: security.SMACK64EXEC (disabled)
[    1.395042] evm: security.SMACK64TRANSMUTE (disabled)
[    1.395717] evm: security.SMACK64MMAP (disabled)
[    1.396259] evm: security.apparmor
[    1.396758] evm: security.ima
[    1.397250] evm: security.capability
[    1.397739] evm: HMAC attrs: 0x1
[    1.402553] RAS: Correctable Errors collector initialized.
[    1.403146] clk: Disabling unused clocks
[    1.403655] PM: genpd: Disabling unused power domains
[    1.409086] Freeing unused decrypted memory: 2028K
[    1.410423] Freeing unused kernel image (initmem) memory: 4148K
[    1.410933] Write protecting the kernel read-only data: 24576k
[    1.412611] Freeing unused kernel image (rodata/data gap) memory: 1288K
[    1.419906] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.420741] Run /init as init process
[    1.421563]   with arguments:
[    1.421564]     /init
[    1.421565]   with environment:
[    1.421565]     HOME=/
[    1.421566]     TERM=linux
[    1.421567]     BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc2-ipu6+
[    1.480541] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
[    1.481723] ACPI: button: Sleep Button [SLPB]
[    1.483288] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
[    1.484410] ACPI: button: Lid Switch [LID0]
[    1.485116] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input3
[    1.487291] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    1.488134] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    1.488988] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: 7391A661-223A-47DB-A77A-7BE84C60822D has zero instances
[    1.489751] wmi_bus wmi_bus-PNP0C14:04: [Firmware Info]: DF4E63B6-3BBC-4858-9737-C74F82F821F3 has zero instances
[    1.501136] ACPI: bus type thunderbolt registered
[    1.506296] ACPI: button: Power Button [PWRB]
[    1.507117] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
[    1.507822] ACPI: button: Power Button [PWRF]
[    1.509399] ACPI: bus type drm_connector registered
[    1.510860] ACPI: bus type USB registered
[    1.511454] usbcore: registered new interface driver usbfs
[    1.512013] usbcore: registered new interface driver hub
[    1.512560] usbcore: registered new device driver usb
[    1.516791] ACPI: battery: Slot [BAT0] (battery present)
[    1.518698] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    1.519481] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    1.520877] hid: raw HID events driver (C) Jiri Kosina
[    1.520969] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    1.522556] nvme nvme0: pci function 0000:01:00.0
[    1.530237] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
[    1.531140] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    1.541167] nvme nvme0: 22/0/0 default/read/poll queues
[    1.546620]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.548257] intel-lpss 0000:00:15.1: enabling device (0004 -> 0006)
[    1.549077] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    1.566041] intel-lpss 0000:00:15.3: enabling device (0004 -> 0006)
[    1.567700] idma64 idma64.2: Found Intel integrated DMA 64-bit
[    1.586245] intel-lpss 0000:00:19.0: enabling device (0004 -> 0006)
[    1.606243] intel-lpss 0000:00:19.1: enabling device (0004 -> 0006)
[    1.724367] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[    1.728414] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.729643] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    1.731614] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    1.732301] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.732757] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
[    1.733218] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperSpeed
[    1.733726] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    1.734204] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.734867] usb usb1: Product: xHCI Host Controller
[    1.735336] usb usb1: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.735806] usb usb1: SerialNumber: 0000:00:0d.0
[    1.736331] hub 1-0:1.0: USB hub found
[    1.736812] hub 1-0:1.0: 1 port detected
[    1.737417] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    1.737904] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.738470] usb usb2: Product: xHCI Host Controller
[    1.738944] usb usb2: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.739419] usb usb2: SerialNumber: 0000:00:0d.0
[    1.739931] hub 2-0:1.0: USB hub found
[    1.740419] hub 2-0:1.0: 4 ports detected
[    1.741853] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.742381] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    1.743908] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    1.744579] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.745052] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
[    1.745522] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperSpeed
[    1.745997] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[    1.746573] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.747078] usb usb3: Product: xHCI Host Controller
[    1.747536] usb usb3: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.748001] usb usb3: SerialNumber: 0000:00:14.0
[    1.748525] hub 3-0:1.0: USB hub found
[    1.749014] hub 3-0:1.0: 12 ports detected
[    1.749978] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[    1.750567] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.751057] usb usb4: Product: xHCI Host Controller
[    1.751543] usb usb4: Manufacturer: Linux 6.13.0-rc2-ipu6+ xhci-hcd
[    1.752043] usb usb4: SerialNumber: 0000:00:14.0
[    1.752606] hub 4-0:1.0: USB hub found
[    1.753107] hub 4-0:1.0: 2 ports detected
[    1.844482] i2c_hid_acpi i2c-ELAN2513:00: i2c_hid_get_input: IRQ triggered but there's no data
[    1.846481] input: ELAN07CE:00 04F3:32C8 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input5
[    1.847917] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input7
[    1.848804] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input8
[    1.849609] hid-generic 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    1.850962] input: ELAN2513:00 04F3:422C Touchscreen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input9
[    1.851567] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input10
[    1.852175] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input11
[    1.852779] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input12
[    1.853444] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input13
[    1.854068] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input14
[    1.854911] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input16
[    1.855759] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input17
[    1.856452] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input18
[    1.902023] hid-generic 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.018341] usb 3-3: new full-speed USB device number 2 using xhci_hcd
[    2.079695] i915 0000:00:02.0: [drm] Found meteorlake (device ID 7d55) display version 14.00 stepping C0
[    2.081284] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    2.082033] Console: switching to colour dummy device 80x25
[    2.082049] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.082065] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    2.106318] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
[    2.115494] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/mtl_dmc.bin (v2.23)
[    2.146600] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/mtl_guc_70.bin version 70.36.0
[    2.161481] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    2.161484] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    2.161692] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    2.163544] usb 3-3: New USB device found, idVendor=06cb, idProduct=016c, bcdDevice= 0.00
[    2.163548] usb 3-3: New USB device strings: Mfr=0, Product=0, SerialNumber=1
[    2.163551] usb 3-3: SerialNumber: 17f07122a011
[    2.166032] i915 0000:00:02.0: [drm] GT1: can't init GSC proxy due to missing mei component
[    2.166258] i915 0000:00:02.0: [drm] GT1: GuC firmware i915/mtl_guc_70.bin version 70.36.0
[    2.166260] i915 0000:00:02.0: [drm] GT1: HuC firmware i915/mtl_huc_gsc.bin version 8.5.4
[    2.172225] input: ELAN07CE:00 04F3:32C8 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input22
[    2.172293] input: ELAN07CE:00 04F3:32C8 Consumer Control as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-ELAN07CE:00/0018:04F3:32C8.0001/input/input23
[    2.172327] hid-multitouch 0018:04F3:32C8.0001: input,hidraw0: I2C HID v1.00 Mouse [ELAN07CE:00 04F3:32C8] on i2c-ELAN07CE:00
[    2.188594] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for clear media
[    2.188950] i915 0000:00:02.0: [drm] GT1: GUC: submission enabled
[    2.188951] i915 0000:00:02.0: [drm] GT1: GUC: SLPC enabled
[    2.189017] i915 0000:00:02.0: [drm] GT1: GUC: RC enabled
[    2.191292] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected content support initialized
[    2.204432] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 0
[    2.204749] ACPI: video: Video Device [PXSX] (multi-head: no  rom: yes  post: no)
[    2.204772] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/LNXVIDEO:00/input/input24
[    2.239854] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    2.240332] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input25
[    2.282239] usb 3-10: new full-speed USB device number 3 using xhci_hcd
[    2.294269] tpm tpm0: auth session is active
[    2.326186] fbcon: i915drmfb (fb0) is primary device
[    2.336980] i915 0000:00:02.0: [drm] GT1: Loaded GSC firmware i915/mtl_gsc_1.bin (cv1.0, r102.1.15.1926, svn 1)
[    2.357232] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for all workloads
[    2.357238] i915 0000:00:02.0: [drm] *ERROR* GT1: GSC proxy handler failed to init
[    2.359094] input: ELAN2513:00 04F3:422C as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input26
[    2.359145] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input27
[    2.359162] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input28
[    2.359181] input: ELAN2513:00 04F3:422C Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input29
[    2.359220] input: ELAN2513:00 04F3:422C Keyboard as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input30
[    2.359239] input: ELAN2513:00 04F3:422C Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input31
[    2.359276] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input33
[    2.359292] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input34
[    2.359307] input: ELAN2513:00 04F3:422C UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-ELAN2513:00/0018:04F3:422C.0002/input/input35
[    2.402974] hid-multitouch 0018:04F3:422C.0002: input,hidraw1: I2C HID v1.00 Keyboard [ELAN2513:00 04F3:422C] on i2c-ELAN2513:00
[    2.420089] usb 3-10: New USB device found, idVendor=8087, idProduct=0033, bcdDevice= 0.00
[    2.420094] usb 3-10: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.599230] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=6
[    2.606567] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.612351] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.620175] hid-generic 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.626044] hid-generic 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.631702] hid-generic 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.633299] hid-generic 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.637080] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.638225] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.638994] hid-sensor-hub 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.639663] hid-sensor-hub 001F:8087:0AC2.0006: hidraw5: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.640232] hid-sensor-hub 001F:8087:0AC2.0007: hidraw6: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    2.640376] hid-sensor-hub 001F:8087:0AC2.0008: hidraw7: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[    3.702480] Console: switching to colour frame buffer device 180x56
[    3.712506] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.846245] raid6: avx2x4   gen() 54355 MB/s
[    3.914231] raid6: avx2x2   gen() 56340 MB/s
[    3.982231] raid6: avx2x1   gen() 52732 MB/s
[    3.983140] raid6: using algorithm avx2x2 gen() 56340 MB/s
[    4.050232] raid6: .... xor() 37410 MB/s, rmw enabled
[    4.050981] raid6: using avx2x2 recovery algorithm
[    4.053457] xor: automatically using best checksumming function   avx       
[    4.056381] async_tx: api initialized (async)
[    4.228438] Btrfs loaded, zoned=yes, fsverity=yes
[    4.275637] PM: Image not found (code -22)
[   10.477612] EXT4-fs (nvme0n1p4): orphan cleanup on readonly fs
[   10.478323] EXT4-fs (nvme0n1p4): mounted filesystem 7881f7bb-dbe6-4323-887f-dd718adb7a8b ro with ordered data mode. Quota mode: none.
[   10.517070] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
[   10.558069] systemd[1]: Inserted module 'autofs4'
[   10.590308] systemd[1]: systemd 257.1-3 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
[   10.590318] systemd[1]: Detected architecture x86-64.
[   10.596560] systemd[1]: Hostname set to <DuanesSpectre16>.
[   10.654907] systemd[1]: bpf-restrict-fs: Failed to load BPF object: No such process
[   10.737212] systemd[1]: Queued start job for default target graphical.target.
[   10.760880] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[   10.761767] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[   10.764307] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[   10.766105] systemd[1]: Created slice system-xfs_scrub.slice - xfs_scrub background service slice.
[   10.767653] systemd[1]: Created slice user.slice - User and Session Slice.
[   10.769268] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[   10.771294] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[   10.773332] systemd[1]: Expecting device dev-disk-by\x2duuid-12DE8F49DE8F2457.device - /dev/disk/by-uuid/12DE8F49DE8F2457...
[   10.775549] systemd[1]: Expecting device dev-disk-by\x2duuid-96c2339a\x2dae0c\x2d4a9d\x2d9d62\x2dfbbce901defc.device - /dev/disk/by-uuid/96c2339a-ae0c-4a9d-9d62-fbbce901defc...
[   10.778243] systemd[1]: Expecting device dev-disk-by\x2duuid-9DB2\x2d2D80.device - /dev/disk/by-uuid/9DB2-2D80...
[   10.780989] systemd[1]: Reached target nss-user-lookup.target - User and Group Name Lookups.
[   10.783328] systemd[1]: Reached target slices.target - Slice Units.
[   10.788452] systemd[1]: Listening on rpcbind.socket - RPCbind Server Activation Socket.
[   10.793840] systemd[1]: Listening on systemd-coredump.socket - Process Core Dump Socket.
[   10.795641] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[   10.797547] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[   10.799939] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[   10.802389] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[   10.804801] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   10.804813] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   10.804872] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[   10.810102] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[   10.814003] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
[   10.816436] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[   10.818679] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
[   10.822944] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[   10.825614] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[   10.827719] systemd[1]: auth-rpcgss-module.service - Kernel Module supporting RPCSEC_GSS was skipped because of an unmet condition check (ConditionPathExists=/etc/krb5.keytab).
[   10.828493] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
[   10.833159] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[   10.835898] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[   10.838278] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[   10.840526] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[   10.842676] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[   10.845024] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
[   10.847432] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[   10.848393] pstore: Using crash dump compression: deflate
[   10.853802] systemd[1]: Starting systemd-journald.service - Journal Service...
[   10.857170] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[   10.859437] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   10.860994] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[   10.863069] pstore: Registered efi_pstore as persistent store backend
[   10.865415] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   10.866125] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[   10.868029] systemd-journald[573]: Collecting audit messages is disabled.
[   10.871940] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[   10.873048] lp: driver loaded but no devices found
[   10.877709] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
[   10.878517] ppdev: user-space parallel port driver
[   10.880974] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[   10.883645] systemd[1]: Mounted run-lock.mount - Legacy Locks Directory /run/lock.
[   10.886203] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[   10.888271] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[   10.891114] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[   10.894069] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[   10.894187] systemd[1]: Finished modprobe@configfs.service - Load Kernel Module configfs.
[   10.902680] systemd[1]: modprobe@drm.service: Deactivated successfully.
[   10.902751] systemd[1]: Finished modprobe@drm.service - Load Kernel Module drm.
[   10.908405] EXT4-fs (nvme0n1p4): re-mounted 7881f7bb-dbe6-4323-887f-dd718adb7a8b r/w. Quota mode: none.
[   10.912317] systemd[1]: Started systemd-journald.service - Journal Service.
[   10.934663] systemd-journald[573]: Received client request to flush runtime journal.
[   10.935775] systemd-journald[573]: File /var/log/journal/54ee1141a1d947279019e6780d39ffc3/system.journal corrupted or uncleanly shut down, renaming and replacing.
[   11.041917] ACPI: AC: AC Adapter [ADP1] (on-line)
[   11.047083] input: Intel HID events as /devices/platform/INTC1077:00/input/input37
[   11.047276] Consider using thermal netlink events interface
[   11.047522] intel-hid INTC1077:00: failed to enable HID power button
[   11.048399] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[   11.052001] mc: Linux media interface: v0.10
[   11.054265] input: Intel HID events as /devices/platform/INT33D5:00/input/input38
[   11.056802] intel-hid INT33D5:00: platform supports 5 button array
[   11.058693] input: Intel HID 5 button array as /devices/platform/INT33D5:00/input/input39
[   11.061616] int3472-discrete INT3472:01: Sensor module id: 'CJFME62'
[   11.062102] int3472-discrete INT3472:01: unknown \_SB.GPI0 pin 65 active-high
[   11.062105] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
[   11.062169] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin number mismatch _DSM 11 resource 107
[   11.064825] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
[   11.067972] int3472-discrete INT3472:02: Sensor module id: 'CJFME62'
[   11.068404] int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mismatch _DSM 49 resource 209
[   11.068407] int3472-discrete INT3472:02: reset \_SB.GPI0 pin 209 active-low
[   11.069436] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.LPCB.HEC.DPTF.FCHG], AE_NOT_FOUND (20240827/psargs-332)
[   11.070939] videodev: Linux video capture interface: v2.00
[   11.072053] ACPI Error: 
[   11.072101] pci 0000:00:08.0: Setting to D3hot
[   11.076821] Aborting method \_SB.IETM.CHRG.PPSS due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
[   11.079410] resource: resource sanity check: requesting [mem 0x00000000fedc0000-0x00000000fedcffff], which spans more than pnp 00:03 [mem 0xfedc0000-0xfedc7fff]
[   11.079415] caller igen6_probe+0x17f/0x7f2 [igen6_edac] mapping multiple BARs
[   11.082245] pci 0000:00:05.0: Setting to D3hot
[   11.084336] Serial bus multi instantiate pseudo device driver CSC3551:00: Instantiated 2 I2C devices.
[   11.085276] EDAC MC0: Giving out device to module igen6_edac controller Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[   11.090569] EDAC MC1: Giving out device to module igen6_edac controller Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[   11.090597] EDAC igen6 MC1: HANDLING IBECC MEMORY ERROR
[   11.090598] EDAC igen6 MC1: ADDR 0x7fffffffe0 
[   11.090599] EDAC igen6 MC0: HANDLING IBECC MEMORY ERROR
[   11.090599] EDAC igen6 MC0: ADDR 0x7fffffffe0 
[   11.091872] EDAC igen6: v2.5.1
[   11.097043] pci 0000:00:0b.0: Setting to D3hot
[   11.100669] input: PC Speaker as /devices/platform/pcspkr/input/input40
[   11.101657] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[   11.102690] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[   11.106948] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[   11.110255] pci 0000:00:14.2: enabling device (0000 -> 0002)
[   11.110259] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[   11.110587] intel_pmc_core INT33A1:00: Assuming a default substate order for this platform
[   11.110588] intel-ipu6 0000:00:05.0: IPU6 in secure mode touch 0x80000000 mask 0x0
[   11.110631] intel_pmc_core INT33A1:00:  initialized
[   11.111072] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[   11.117288] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[   11.124365] intel-ipu6 0000:00:05.0: FW version: 20230925
[   11.124949] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
[   11.127262] intel-ipu6 0000:00:05.0: Connected 1 cameras
[   11.128486] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
[   11.137737] ov08x40 i2c-OVTI08F4:00: supply dovdd not found, using dummy regulator
[   11.137777] ov08x40 i2c-OVTI08F4:00: supply avdd not found, using dummy regulator
[   11.137789] ov08x40 i2c-OVTI08F4:00: supply dvdd not found, using dummy regulator
[   11.147804] Bluetooth: Core ver 2.22
[   11.147821] NET: Registered PF_BLUETOOTH protocol family
[   11.147822] Bluetooth: HCI device and connection manager initialized
[   11.147825] Bluetooth: HCI socket layer initialized
[   11.147827] Bluetooth: L2CAP socket layer initialized
[   11.147829] Bluetooth: SCO socket layer initialized
[   11.163633] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[   11.174292] iTCO_vendor_support: vendor-support=0
[   11.174657] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   11.174801] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   11.174899] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[   11.175998] cfg80211: loaded regulatory.db is malformed or signature is missing/invalid
[   11.176616] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400)
[   11.176658] input: HP WMI hotkeys as /devices/virtual/input/input41
[   11.176766] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 655360 ms ovfl timer
[   11.176767] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[   11.176768] RAPL PMU: hw unit of domain package 2^-14 Joules
[   11.176768] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[   11.176772] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[   11.178948] cryptd: max_cpu_qlen set to 1000
[   11.180581] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 0002)
[   11.180714] intel_rapl_common: Found RAPL domain package
[   11.188078] Error: Driver 'pcspkr' is already registered, aborting...
[   11.188243] Intel(R) Wireless WiFi driver for Linux
[   11.188281] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[   11.188338] usbcore: registered new interface driver btusb
[   11.189939] Bluetooth: hci0: Device revision is 0
[   11.189943] Bluetooth: hci0: Secure boot is enabled
[   11.189943] Bluetooth: hci0: OTP lock is enabled
[   11.189944] Bluetooth: hci0: API lock is enabled
[   11.189945] Bluetooth: hci0: Debug lock is disabled
[   11.189946] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[   11.189947] Bluetooth: hci0: Bootloader timestamp 2022.18 buildtype 1 build 49266
[   11.190053] Bluetooth: hci0: DSM reset method type: 0x00
[   11.190133] iwlwifi 0000:00:14.3: Detected crf-id 0x400410, cnv-id 0x1080800 wfpm id 0x80005b20
[   11.190136] iwlwifi 0000:00:14.3: PCI dev 7e40/0094, rev=0x441, rfid=0x2010d000
[   11.190137] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6E AX211 160MHz
[   11.190424] AES CTR mode by8 optimization enabled
[   11.195546] Bluetooth: hci0: Found device firmware: intel/ibt-0180-0041.sfi
[   11.200010] Adding 66559996k swap on /dev/nvme0n1p7.  Priority:-2 extents:1 across:66559996k SS
[   11.200398] Bluetooth: hci0: Boot Address: 0x100800
[   11.200875] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.0.3.94
[   11.201601] Bluetooth: hci0: Firmware Version: 99-33.24
[   11.202769] iwlwifi 0000:00:14.3: loaded firmware version 89.6b44fa0b.0 ma-b0-gf-a0-89.ucode op_mode iwlmvm
[   11.211036] intel-ipu6 0000:00:05.0: CSE authenticate_run done
[   11.211467] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
[   11.228032] intel_rapl_msr: PL4 support detected.
[   11.228081] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Adding DSD properties for 103C8C17
[   11.228152] intel_rapl_common: Found RAPL domain package
[   11.228153] intel_rapl_common: Found RAPL domain core
[   11.228154] intel_rapl_common: Found RAPL domain uncore
[   11.228276] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Using extra _DSD properties, bypassing _DSD in ACPI
[   11.238283] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[   11.238361] snd_hda_intel 0000:56:00.1: enabling device (0000 -> 0002)
[   11.239600] snd_hda_intel 0000:56:00.1: Disabling MSI
[   11.240261] snd_hda_intel 0000:56:00.1: Handle vga_switcheroo audio client
[   11.255756] [637] intel-ipu6 0000:00:05.0: remote endpoint port 0 with 4 lanes added
[   11.255763] [637] intel_ipu6_isys.isys intel_ipu6.isys.40: bind ov08x40 4-0036 nlanes is 4 port is 0
[   11.264197] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cirrus Logic CS35L41 (35a40), Revision: B2
[   11.264263] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Adding DSD properties for 103C8C17
[   11.264359] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Using extra _DSD properties, bypassing _DSD in ACPI
[   11.264360] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Reset line busy, assuming shared reset
[   11.299560] typec port0: bound usb3-port1 (ops connector_ops [usbcore])
[   11.299578] typec port0: bound usb2-port1 (ops connector_ops [usbcore])
[   11.299653] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cirrus Logic CS35L41 (35a40), Revision: B2
[   11.341719] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input42
[   11.342471] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input43
[   11.343161] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input44
[   11.343843] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1c.0/0000:56:00.1/sound/card0/input45
[   11.384409] sof-audio-pci-intel-mtl 0000:00:1f.3: enabling device (0000 -> 0002)
[   11.385079] sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
[   11.385630] sof-audio-pci-intel-mtl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[   11.392927] sof-audio-pci-intel-mtl 0000:00:1f.3: use msi interrupt mode
[   11.410173] sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask 5
[   11.410728] sof-audio-pci-intel-mtl 0000:00:1f.3: using HDA machine driver skl_hda_dsp_generic now
[   11.411160] sof-audio-pci-intel-mtl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
[   11.411595] sof-audio-pci-intel-mtl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
[   11.412011] sof-audio-pci-intel-mtl 0000:00:1f.3: DMICs detected in NHLT tables: 2
[   11.416083] sof-audio-pci-intel-mtl 0000:00:1f.3: Firmware paths/files for ipc type 1:
[   11.416084] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/mtl/sof-mtl.ri
[   11.416085] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/mtl
[   11.416086] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file:     intel/sof-ace-tplg/sof-hda-generic-2ch.tplg
[   11.416740] sof-audio-pci-intel-mtl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.11.1.1
[   11.534596] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[   11.536277] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[   11.536286] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[   11.538073] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   11.539779] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[   11.539787] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   11.544731] sof-audio-pci-intel-mtl 0000:00:1f.3: Booted firmware version: 2.11.1.1
[   11.548380] iwlwifi 0000:00:14.3: loaded PNVM version 16611aa6
[   11.551697] sof-audio-pci-intel-mtl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
[   11.552435] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card not yet available, widget card binding deferred
[   11.563352] iwlwifi 0000:00:14.3: Detected RF GF, rfid=0x2010d000
[   11.571105] snd_hda_codec_realtek ehdaudio0D0: ALC245: picked fixup  for PCI SSID 103c:8c17
[   11.573202] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[   11.573653] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight Time
[   11.629811] iwlwifi 0000:00:14.3: base HW address: d0:65:78:ec:0a:e5
[   11.671750] iwlwifi 0000:00:14.3 wlo1: renamed from wlan0
[   11.980894] audit: type=1400 audit(1734818654.304:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-senddoc" pid=1061 comm="apparmor_parser"
[   11.980899] audit: type=1400 audit(1734818654.304:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=1063 comm="apparmor_parser"
[   11.980961] audit: type=1400 audit(1734818654.304:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/libexec/ibus-engine-hangul" pid=1065 comm="apparmor_parser"
[   11.981211] audit: type=1400 audit(1734818654.304:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=1055 comm="apparmor_parser"
[   11.981213] audit: type=1400 audit(1734818654.304:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=1055 comm="apparmor_parser"
[   11.981431] audit: type=1400 audit(1734818654.304:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=1059 comm="apparmor_parser"
[   11.981433] audit: type=1400 audit(1734818654.304:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_filter" pid=1059 comm="apparmor_parser"
[   11.981434] audit: type=1400 audit(1734818654.304:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_groff" pid=1059 comm="apparmor_parser"
[   11.981483] audit: type=1400 audit(1734818654.304:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=1052 comm="apparmor_parser"
[   11.981564] audit: type=1400 audit(1734818654.304:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oosplash" pid=1060 comm="apparmor_parser"
[   12.028430] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: Firmware: 400a4 vendor: 0x2 v0.60.0, 2 algorithms
[   12.029651] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-l0.bin: v0.60.0
[   12.029657] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: spk-prot: C:\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_tooling_4KHz-6dBhighshelf\HP_
[   12.059393] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   12.059395] Bluetooth: BNEP filters: protocol multicast
[   12.059397] Bluetooth: BNEP socket layer initialized
[   12.062000] nvme nvme0: using unchecked data buffer
[   12.085177] block nvme0n1: No UUID available providing old NGUID
[   12.088621] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Calibration applied: R0=10501
[   12.102629] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded - Type: spk-prot, Gain: 17
[   12.102725] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 103C8C17, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 0
[   12.102730] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35l41-hda.0 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[   12.103439] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: format 3 timestamp 0x630cb3c2
[   12.105854] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17.wmfw: Mon 29 Aug 2022 14:40:34 W. Europe Daylight Time
[   12.114935] NET: Registered PF_QIPCRTR protocol family
[   12.509345] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[   12.511459] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[   12.511483] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[   12.512624] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   12.514810] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[   12.514819] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   12.560028] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: Firmware: 400a4 vendor: 0x2 v0.60.0, 2 algorithms
[   12.562515] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: cirrus/cs35l41-dsp1-spk-prot-103c8c17-spkid0-r0.bin: v0.60.0
[   12.562521] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: DSP1: spk-prot: C:\Users\tlu\Desktop\HP_Consumer\CY23\Herbie\Official_release\20230512_tooling_4KHz-6dBhighshelf\HP_
[   12.600030] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, with index: 0
[   12.621389] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration applied: R0=10902
[   12.636146] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded - Type: spk-prot, Gain: 17
[   12.636761] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SSID: 103C8C17, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 0
[   12.637820] snd_hda_codec_realtek ehdaudio0D0: bound i2c-CSC3551:00-cs35l41-hda.1 (ops cs35l41_hda_comp_ops [snd_hda_scodec_cs35l41])
[   12.639340] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC245: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[   12.639343] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   12.639344] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[   12.639345] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=0x0
[   12.639345] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[   12.639346] snd_hda_codec_realtek ehdaudio0D0:      Mic=0x19
[   12.682150] Bluetooth: hci0: Waiting for firmware download to complete
[   12.683445] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
[   12.683569] Bluetooth: hci0: Firmware loaded in 1448452 usecs
[   12.685252] Bluetooth: hci0: Waiting for device to boot
[   12.701164] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input46
[   12.702226] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input47
[   12.703532] input: sof-hda-dsp HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input48
[   12.703669] input: sof-hda-dsp HDMI/DP,pcm=4 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input49
[   12.703834] input: sof-hda-dsp HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card1/input50
[   12.727008] Bluetooth: hci0: Device booted in 40795 usecs
[   12.730406] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0180-0041.ddc
[   12.732037] Bluetooth: hci0: Applying Intel DDC parameters completed
[   12.734945] Bluetooth: hci0: Firmware timestamp 2024.33 buildtype 1 build 3427
[   12.735072] hid-sensor-hub 001F:8087:0AC2.0005: hid_field_extract() called with n (192) > 32! (kworker/13:1)
[   12.735817] Bluetooth: hci0: Firmware SHA1: 0xd028ffe4
[   12.739928] Bluetooth: hci0: Fseq status: Success (0x00)
[   12.739929] Bluetooth: hci0: Fseq executed: 00.00.03.94
[   12.739931] Bluetooth: hci0: Fseq BT Top: 00.00.03.94
[   12.812909] iwlwifi 0000:00:14.3: Not valid error log pointer 0x0024B5C0 for RT uCode
[   12.814922] iwlwifi 0000:00:14.3: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[   12.814958] iwlwifi 0000:00:14.3: RFIm is deactivated, reason = 4
[   12.816523] iwlwifi 0000:00:14.3: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[   12.818178] iwlwifi 0000:00:14.3: WFPM_AUTH_KEY_0: 0x80
[   12.819238] iwlwifi 0000:00:14.3: CNVI_SCU_SEQ_DATA_DW9: 0x0
[   12.832314] Bluetooth: MGMT ver 1.23
[   12.837286] NET: Registered PF_ALG protocol family
[   12.855793] Bluetooth: RFCOMM TTY layer initialized
[   12.856752] Bluetooth: RFCOMM socket layer initialized
[   12.857681] Bluetooth: RFCOMM ver 1.11
[   12.949186] RPC: Registered named UNIX socket transport module.
[   12.949629] RPC: Registered udp transport module.
[   12.950061] RPC: Registered tcp transport module.
[   12.950061] RPC: Registered tcp-with-tls transport module.
[   12.950061] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   16.891358] netfs: FS-Cache loaded
[   16.892434] Key type dns_resolver registered
[   16.940605] Key type cifs.spnego registered
[   16.941496] Key type cifs.idmap registered
[   16.942728] CIFS: VFS: Use of the less secure dialect vers=1.0 is not recommended unless required for access to very old servers
[   16.942739] CIFS: Attempting to mount //192.168.1.248/NetFolder
[   16.942768] CIFS: VFS: Error connecting to socket. Aborting operation.
[   16.942770] CIFS: VFS: cifs_mount failed w/return code = -101
[   17.001074] NFS: Registering the id_resolver key type
[   17.001638] Key type id_resolver registered
[   17.002175] Key type id_legacy registered
[   17.223527] i915 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A
[   22.133483] systemd-journald[573]: File /var/log/journal/54ee1141a1d947279019e6780d39ffc3/user-1000.journal corrupted or uncleanly shut down, renaming and replacing.
[   26.187565] wlo1: authenticate with f8:85:f9:0d:a2:e0 (local address=d0:65:78:ec:0a:e5)
[   26.188146] wlo1: send auth to f8:85:f9:0d:a2:e0 (try 1/3)
[   26.318250] wlo1: send auth to f8:85:f9:0d:a2:e0 (try 2/3)
[   26.321683] wlo1: authenticated
[   26.326243] wlo1: associate with f8:85:f9:0d:a2:e0 (try 1/3)
[   26.339848] wlo1: RX AssocResp from f8:85:f9:0d:a2:e0 (capab=0x1431 status=0 aid=2)
[   26.345944] wlo1: associated
[   26.432532] wlo1: Limiting TX power to 30 (30 - 0) dBm as advertised by f8:85:f9:0d:a2:e0
[   26.510965] show_signal: 20 callbacks suppressed
[   26.510970] traps: light-locker[2302] trap int3 ip:7fe60951df37 sp:7ffea100c160 error:0 in libglib-2.0.so.0.8200.4[64f37,7fe6094d7000+a0000]
[   26.642113] warning: `kdeconnectd' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211
[   27.007890] audit: type=1400 audit(1734818669.332:32): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/system/node/" pid=2511 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   27.042697] audit: type=1400 audit(1734818669.368:33): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/system/node/" pid=2515 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   27.062254] audit: type=1400 audit(1734818669.384:34): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/usr/share/mariadb/charsets/Index.xml" pid=2515 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   27.070864] audit: type=1400 audit(1734818669.396:35): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/block/" pid=2515 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   27.082994] audit: type=1400 audit(1734818669.408:36): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/proc/2515/cgroup" pid=2515 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
[   27.083480] audit: type=1400 audit(1734818669.408:37): apparmor="DENIED" operation="open" class="file" profile="mariadbd_akonadi" name="/sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/nvme/nvme0/nvme0n1/queue/physical_block_size" pid=2515 comm="mysqld" requested_mask="r" denied_mask="r" fsuid=1000 ouid=0
[   28.151806] audit: type=1400 audit(1734818670.476:38): apparmor="DENIED" operation="exec" class="file" profile="mariadbd_akonadi" name="/usr/bin/mariadb" pid=2636 comm="sh" requested_mask="x" denied_mask="x" fsuid=1000 ouid=0
[   29.654750] input: MX Anywhere 3S Mouse as /devices/virtual/misc/uhid/0005:046D:B037.0009/input/input51
[   29.655305] hid-generic 0005:046D:B037.0009: input,hidraw8: BLUETOOTH HID v0.03 Mouse [MX Anywhere 3S] on d0:65:78:ec:0a:e9
[  267.705384] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: configured size 4719936, buffer size 4719936
[  267.705390] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buffer 0 for Intel IPU6 ISYS Capture 0
[  267.705391] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: iova: iova 0x00000000ff36b000
[  267.705392] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: media pipeline is not ready for Intel IPU6 ISYS Capture 0
[  267.705393] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: stream: Intel IPU6 ISYS Capture 0: width 1928, height 1208, css pixelformat 24
[  267.705399] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: validating link "Intel IPU6 CSI2 0":1 -> "Intel IPU6 ISYS Capture 0"
[  267.718083] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 20 scale 2, did: value 20 scale 2
[  267.718606] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: prepare stream: external entity ov08x40 4-0036
[  267.718607] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: queue 1 of 1
[  267.718610] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x2, index 2, offset 0x0, value 0x1
[  267.718727] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 2, error 0, details 0
[  267.718730] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 1023 scale 2, did: value 337 scale 2
[  267.718732] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x1, index 1, offset 0x0, value 0x42
[  267.718847] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 1, error 0, details 0
[  267.718849] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: mem_open_threshold: 12
[  267.718849] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x3, index 3, offset 0x0, value 0xc
[  267.718964] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 3, error 0, details 0
[  267.718965] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: threshold: 89 critical: 108
[  267.718966] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x0, index 0, offset 0x0, value 0x6c
[  267.719083] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 0, error 0, details 0
[  267.719086] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: buffer 0
[  267.719087] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: get buffer list 0000000062ed5d2c, 1 buffers
[  267.719090] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: set stream: 1
[  267.719093] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[  267.719094] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS_STREAM_CFG_DATA
[  267.719095] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: compfmt = 0
[  267.719096] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: src = 0
[  267.719098] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: vc = 0
[  267.719099] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: isl_use = 0
[  267.719100] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: sensor_type = 0
[  267.719101] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof_discarded = 0
[  267.719102] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof_discarded = 0
[  267.719103] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_sof_discarded = 0
[  267.719105] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eof_discarded = 0
[  267.719106] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: crop:
[  267.719107] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.left_top = [0, 0]
[  267.719108] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.right_bottom = [0, 0]
[  267.719110] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: nof_input_pins = 1
[  267.719111] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: input pin[0]:
[  267.719112] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.dt = 0x2b
[  267.719113] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.mipi_store_mode = 0
[  267.719115] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.bits_per_pix = 10
[  267.719116] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.mapped_dt = 0x40
[  267.719117] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.input_res = 1928x1208
[  267.719119] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.mipi_decompression = 0
[  267.719120] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.capture_mode = 0
[  267.719121] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: nof_output_pins = 1
[  267.719122] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0]:
[  267.719124] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.input_pin_id = 0
[  267.719125] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.output_res = 1928x1208
[  267.719126] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.stride = 3904
[  267.719127] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.pt = 3
[  267.719128] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.payload_buf_size = 0
[  267.719130] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.ft = 24
[  267.719131] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.watermark_in_lines = 0
[  267.719132] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.send_irq = 1
[  267.719133] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.reserve_compression = 0
[  267.719134] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.snoopable = 1
[  267.719135] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.error_handling_enable = 0
[  267.719137] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.sensor_type = 14
[  267.719138] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[  267.719139] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_OPEN
[  267.719512] <intr> intel_ipu6_isys.isys intel_ipu6.isys.40: FW resp 00 STREAM_OPEN_DONE, stream 0, ts 0x0000000000000000, pin 0
[  267.719530] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: start stream: open complete
[  267.719532] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buf list 0000000062ed5d2c flags 2, s 0, 1 bufs
[  267.719535] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[  267.719536] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS_FRAME_BUFF_SET
[  267.719537] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0]:
[  267.719539] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.out_buf_id = 1
[  267.719540] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.addr = 0xff36b000
[  267.719541] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.compress = 0
[  267.719542] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof = 0x1
[  267.719544] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof = 0x0
[  267.719545] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_sof = 0x1
[  267.719546] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eof = 0x0
[  267.719547] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_ack = 0x1
[  267.719548] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_done = 0x0
[  267.719550] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_ack = 0x1
[  267.719551] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_done = 0x1
[  267.719552] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[  267.719554] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_START_AND_CAPTURE
[  267.719749] <intr> intel_ipu6_isys.isys intel_ipu6.isys.40: FW resp 02 STREAM_START_AND_CAPTURE_ACK, stream 0, ts 0x0000000000000000, pin 0
[  267.719762] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: start stream: complete
[  267.719764] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel IPU6 CSI2 0 pad 1 mask 0x1
[  267.719767] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: ctermen 0 csettle 680 dtermen 0 dsettle 660
[  267.719769] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on CSI2-0 with 4 lanes
[  267.719981] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: config phy 0 and 1 in aggr mode
[  267.719983] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 0
[  267.719985] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23803c = data 0x0
[  267.719987] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238038 = data 0x0
[  267.719988] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238048 = data 0x0
[  267.719990] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x2
[  267.719991] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 1
[  267.719992] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238070 = data 0x0
[  267.719993] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23806c = data 0x0
[  267.719995] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23807c = data 0x0
[  267.719996] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x2
[  267.719997] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x1330
[  267.720014] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x133 = 0x1
[  267.720015] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x11331
[  267.720018] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1330
[  267.720034] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x133 = 0x1
[  267.720036] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1331
[  267.720038] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3070
[  267.720053] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x307 = 0x0
[  267.720054] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x43071
[  267.720056] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3070
[  267.720069] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x307 = 0x0
[  267.720070] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3071
[  267.720072] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x5080
[  267.720085] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x508 = 0x0
[  267.720086] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x205081
[  267.720088] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x5080
[  267.720101] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x508 = 0x0
[  267.720102] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x205081
[  267.720104] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x7080
[  267.720117] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x708 = 0x0
[  267.720118] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x207081
[  267.720120] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x7080
[  267.720133] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x708 = 0x0
[  267.720133] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x207081
[  267.720135] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3080
[  267.720149] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x308 = 0x0
[  267.720150] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3081
[  267.720152] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3080
[  267.720165] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x308 = 0x0
[  267.720166] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x83081
[  267.720168] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe00
[  267.720181] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe0 = 0x0
[  267.720182] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x30e01
[  267.720184] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe10
[  267.720197] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe1 = 0x0
[  267.720197] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x20e11
[  267.720199] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3070
[  267.720213] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x307 = 0x0
[  267.720213] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x83071
[  267.720215] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3040
[  267.720228] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x304 = 0x0
[  267.720229] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x803041
[  267.720231] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3050
[  267.720244] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x305 = 0x0
[  267.720245] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xa3051
[  267.720247] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: config Dphy 0 with 800 mbps
[  267.720248] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238040 = data 0x0
[  267.720249] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238040 = data 0x19
[  267.720250] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0xe40
[  267.720263] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe4 = 0x0
[  267.720264] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x10e41
[  267.720266] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0xe20
[  267.720279] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe2 = 0x0
[  267.720280] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x4f0e21
[  267.720282] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0xe30
[  267.720295] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe3 = 0x0
[  267.720296] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x10e31
[  267.720298] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x80
[  267.720311] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x8 = 0x1c
[  267.720312] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3c0081
[  267.720314] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: ref_clk = 384 clk_freqrange = 85
[  267.720315] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238044 = data 0x0
[  267.720316] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238044 = data 0x55
[  267.720317] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238068 = data 0x0
[  267.720317] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238068 = data 0x10
[  267.720319] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238068 = data 0x10
[  267.720319] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238068 = data 0x110
[  267.720320] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: config Dphy 1 with 800 mbps
[  267.720321] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238074 = data 0x0
[  267.720322] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238074 = data 0x19
[  267.720322] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe40
[  267.720336] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe4 = 0x0
[  267.720336] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x10e41
[  267.720338] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe20
[  267.720352] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe2 = 0x0
[  267.720352] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x4f0e21
[  267.720354] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe30
[  267.720368] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0xe3 = 0x0
[  267.720368] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x10e31
[  267.720370] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x80
[  267.720383] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x8 = 0x1c
[  267.720384] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3c0081
[  267.720386] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: ref_clk = 384 clk_freqrange = 85
[  267.720387] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238078 = data 0x0
[  267.720387] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238078 = data 0x55
[  267.720389] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x23809c = data 0x0
[  267.720389] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23809c = data 0x10
[  267.720391] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x23809c = data 0x10
[  267.720391] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23809c = data 0x110
[  267.720392] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238038 = data 0x1
[  267.720414] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23803c = data 0x1
[  267.720415] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x1e0
[  267.720428] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x11
[  267.720531] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x1e0
[  267.720545] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x16
[  267.720647] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x1e0
[  267.720661] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x17
[  267.720662] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238068 = data 0x110
[  267.720662] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238068 = data 0x100
[  267.720664] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x238068 = data 0x100
[  267.720664] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238068 = data 0x0
[  267.720665] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Dphy 0 is ready!
[  267.720666] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23806c = data 0x1
[  267.720688] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238070 = data 0x1
[  267.720689] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1e0
[  267.720702] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x11
[  267.720805] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1e0
[  267.720819] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x19
[  267.720921] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1e0
[  267.720935] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc read 0x1e = 0x17
[  267.720936] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x23809c = data 0x110
[  267.720936] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23809c = data 0x100
[  267.720938] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: read: reg 0x23809c = data 0x100
[  267.720938] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23809c = data 0x0
[  267.720939] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Dphy 1 is ready!
[  267.891506] ov08x40 i2c-OVTI08F4:00: Failed to write reg 0x4c03. error = -121
[  267.891521] ov08x40 i2c-OVTI08F4:00: ov08x40_start_streaming failed to set mode
[  267.891538] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: stream off CSI2-0 with 0 lanes
[  267.891550] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Powerdown phy 0 with 0 lanes
[  267.891553] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 0
[  267.891556] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23803c = data 0x0
[  267.891558] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238038 = data 0x0
[  267.891560] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238048 = data 0x0
[  267.891562] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x2
[  267.891564] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel IPU6 CSI2 0 failed with -121
[  267.891568] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_FLUSH
[  269.910501] intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time out
[  269.910534] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Intel IPU6 ISYS Capture 0: return 0 back to videobuf2
[  269.910545] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x2, index 2, offset 0x0, value 0x0
[  269.910724] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 2, error 0, details 0
[  269.910728] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 20 scale 2, did: value 20 scale 2
[  269.910731] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x0, index 0, offset 0x0, value 0x60
[  269.910855] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 0, error 0, details 0
[  269.911811] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: configured size 4719936, buffer size 4719936
[  269.911819] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buffer 1 for Intel IPU6 ISYS Capture 0
[  269.911822] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: iova: iova 0x00000000feeea000
[  269.911824] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: media pipeline is not ready for Intel IPU6 ISYS Capture 0
[  269.911827] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: stream: Intel IPU6 ISYS Capture 0: width 1928, height 1208, css pixelformat 24
[  269.911848] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: validating link "Intel IPU6 CSI2 0":1 -> "Intel IPU6 ISYS Capture 0"
[  269.912439] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: prepare stream: external entity ov08x40 4-0036
[  269.912442] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: queue 1 of 1
[  269.912453] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x2, index 2, offset 0x0, value 0x1
[  269.912577] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 2, error 0, details 0
[  269.912580] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: ltr: value 1023 scale 2, did: value 337 scale 2
[  269.912582] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x1, index 1, offset 0x0, value 0x42
[  269.912746] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 1, error 0, details 0
[  269.912749] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: mem_open_threshold: 12
[  269.912751] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x3, index 3, offset 0x0, value 0xc
[  269.912882] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 3, error 0, details 0
[  269.912885] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: threshold: 89 critical: 108
[  269.912886] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: proxy send: req_id 0x0, index 0, offset 0x0, value 0x6c
[  269.913051] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Proxy response: id 0, error 0, details 0
[  269.913055] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer: Intel IPU6 ISYS Capture 0: buffer 1
[  269.913057] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: get buffer list 00000000e4674141, 1 buffers
[  269.913060] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: set stream: 1
[  269.913064] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[  269.913066] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS_STREAM_CFG_DATA
[  269.913067] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: compfmt = 0
[  269.913069] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: src = 0
[  269.913070] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: vc = 0
[  269.913071] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: isl_use = 0
[  269.913072] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: sensor_type = 0
[  269.913073] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof_discarded = 0
[  269.913075] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof_discarded = 0
[  269.913076] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_sof_discarded = 0
[  269.913077] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eof_discarded = 0
[  269.913079] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: crop:
[  269.913080] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.left_top = [0, 0]
[  269.913081] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.right_bottom = [0, 0]
[  269.913082] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: nof_input_pins = 1
[  269.913083] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: input pin[0]:
[  269.913084] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.dt = 0x2b
[  269.913086] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.mipi_store_mode = 0
[  269.913087] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.bits_per_pix = 10
[  269.913088] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.mapped_dt = 0x40
[  269.913089] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.input_res = 1928x1208
[  269.913090] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.mipi_decompression = 0
[  269.913091] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.capture_mode = 0
[  269.913093] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: nof_output_pins = 1
[  269.913094] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0]:
[  269.913095] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.input_pin_id = 0
[  269.913096] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.output_res = 1928x1208
[  269.913098] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.stride = 3904
[  269.913099] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.pt = 3
[  269.913100] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.payload_buf_size = 0
[  269.913101] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.ft = 24
[  269.913102] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.watermark_in_lines = 0
[  269.913103] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.send_irq = 1
[  269.913104] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.reserve_compression = 0
[  269.913105] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.snoopable = 1
[  269.913106] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.error_handling_enable = 0
[  269.913107] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.sensor_type = 15
[  269.913109] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[  269.913110] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_OPEN
[  269.913518] <intr> intel_ipu6_isys.isys intel_ipu6.isys.40: FW resp 00 STREAM_OPEN_DONE, stream 0, ts 0x0000000000000000, pin 0
[  269.913567] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: start stream: open complete
[  269.913579] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: queue buf list 00000000e4674141 flags 2, s 0, 1 bufs
[  269.913583] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[  269.913584] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: IPU6_FW_ISYS_FRAME_BUFF_SET
[  269.913586] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: output_pin[0]:
[  269.913587] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.out_buf_id = 2
[  269.913588] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.addr = 0xfeeea000
[  269.913589] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: 	.compress = 0
[  269.913590] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_sof = 0x1
[  269.913591] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_eof = 0x0
[  269.913592] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_sof = 0x1
[  269.913594] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_eof = 0x0
[  269.913595] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_ack = 0x1
[  269.913596] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_irq_capture_done = 0x0
[  269.913597] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_ack = 0x1
[  269.913598] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_resp_capture_done = 0x1
[  269.913599] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: -----------------------------------------------------
[  269.913600] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: send_token: STREAM_START_AND_CAPTURE
[  269.913789] <intr> intel_ipu6_isys.isys intel_ipu6.isys.40: FW resp 02 STREAM_START_AND_CAPTURE_ACK, stream 0, ts 0x0000000000000000, pin 0
[  269.913918] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: start stream: complete
[  269.913928] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel IPU6 CSI2 0 pad 1 mask 0x1
[  269.913944] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: ctermen 0 csettle 680 dtermen 0 dsettle 660
[  269.913948] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on CSI2-0 with 4 lanes
[  269.914184] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: config phy 0 and 1 in aggr mode
[  269.914189] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 0
[  269.914192] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23803c = data 0x0
[  269.914196] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238038 = data 0x0
[  269.914197] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238048 = data 0x0
[  269.914199] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x2
[  269.914201] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: Reset phy 1
[  269.914202] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238070 = data 0x0
[  269.914204] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23806c = data 0x0
[  269.914240] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23807c = data 0x0
[  269.914242] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x2
[  269.914244] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x1330
[  274.937590] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  274.937609] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x1330
[  279.967136] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  279.967148] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3070
[  284.996648] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  284.996655] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3070
[  290.026169] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  290.026176] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x5080
[  295.055671] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  295.055678] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x5080
[  300.085189] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  300.085198] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x7080
[  305.114696] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  305.114708] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x7080
[  310.144214] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  310.144227] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x23804c = data 0x3080
[  315.173725] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  315.173776] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0x3080
[  320.203237] intel_ipu6_isys.isys intel_ipu6.isys.40: DWC ifc request read timeout
[  320.203244] [3452] intel_ipu6_isys.isys intel_ipu6.isys.40: write: reg 0x238080 = data 0xe00

Sincerely,
Duane

