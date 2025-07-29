Return-Path: <linux-media+bounces-38615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7EDB14949
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 09:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6966189E3A1
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 07:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739742652B2;
	Tue, 29 Jul 2025 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="cyHen8k8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D0F25BEE7
	for <linux-media@vger.kernel.org>; Tue, 29 Jul 2025 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753774952; cv=none; b=UIuxJqdqYC3slRJtn40lJQ3/nO47F0gR0iZkyVxA5DYPpNOW78/Dzn7uaLofChYtxmdGWxZchMvFwLI+u1RU5ZQgtZV7AyDdzt9ANY1JXzTDMEJJoNRwfyUOwa/WBM7npisziCMCMJXY8WZAR2ZTqgh523ASXLb4FpedS1dz3NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753774952; c=relaxed/simple;
	bh=FdqjicPlmiCBkE4Bc3VGntuRYeWEQVM1zmiWTRYDgwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOMToq9z0dDQnGz7tIENgwL6bLL1yJIFeaVxQe9jLavKH+WdyOnhTPn0sSbj/uONUbfzrRU5/sfcjk+Z4WsGxjfq1ocp5aShauDN6O3b6KzDFxH92NanXfC2HnayGOZpp3HGGaeQNh4ifUotb32EdGK4aG70iW0eHt/DdhLy0pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=cyHen8k8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748e81d37a7so3496147b3a.1
        for <linux-media@vger.kernel.org>; Tue, 29 Jul 2025 00:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753774943; x=1754379743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8uw7PlKFphM3SmZXiqTQm/uA75mNtlJdWwvEIE7Yock=;
        b=cyHen8k8Mm0ROZ4vBADPE/71rSZnnu2jgWnQJoE8qUCkhv5kaH7SnrzLwy4FCxJGeT
         A1qimg7FjqqR6uTHfCEXjluIT3vBqzlzIjdcCDevjyPSXc9xHbdA0ysiX0W+klaOhHmn
         9be4qWueUsmYWv7XUUYmmZJ9euLWaSPI8SRjEtSHpSzRVBiP+VLo6c9aoSW4rrY+a7mT
         nWXESvrq0KfkEZXu6VHVD4bAkYkAlPvH1bwHkzo45zCIpyZobjKLgoZYhR4XiFsizDPo
         FLj0AwuceLJbJNAVRaRB0tWghIYh4O6OAkclnNbdXW/zpfb2tBd+qgTU+PS/VINHS91L
         iIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753774943; x=1754379743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uw7PlKFphM3SmZXiqTQm/uA75mNtlJdWwvEIE7Yock=;
        b=SHIbJSV/t3/tE/i8svNON+HpeUT62Dz3zwCUundb8BaVVKRWLpPBx9JfLnNXCMA0ii
         Q6JLdhctrut4hZqVVE3bwWa+0H8yfVHVSn8UBsoNkrT9CaWA/e4OjzceWgwITRYzi9Lk
         OfLOV7BSau51g0xjb16W8XwPgJ9mfzkSC1GNyrvhokYJUqYL+f961Q6+qW6gxht+MOtK
         1rSU6WG91G6cTC1EWaR6MXhMp9UOYoh1g43BgnsRm6s9H/4oGCTuXMjqktav/krOSr+B
         1fQqu3puj2n4BigDUnfPHQ6hqjBv4v4N/3MbHv0urM7aEGZMm8S5oS1x4s+DWpgUi8A+
         uz3w==
X-Forwarded-Encrypted: i=1; AJvYcCVhzqpv+uwF7x9ESJZk5yqYQeFZg0kJktyX5evscQr8qihpbZl4uHEzbvpOvEQmq8H7WfvXCdVh9d/Cgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDDqw4Mwh2WE336dmtE1zqWeAHRqxr1nJQqPBroJw5bXEOSsLQ
	ysR8P2dMdlG0PphrM2Gn2b5d4b199FQNTnsJxsvChZNsc10tWmEEqnm95XhOauvhQHOl
X-Gm-Gg: ASbGnct8PEY9ooyw8y3R69ahrfuwWZpeaFpIcZQaYCY08a8b3qwGexrk/hIVOTkHpxW
	1+UDA2yH45B+IpcgiooSN66xTU0yyUCZ4aKxtM0Bnijt5UHqLZ5nHAb1M7IQ4Slx07PAJEwDMDH
	vnoMctT4G+CWYzxB4wqRTjl9I8uNWhju+2QXNimuPDVctBLpCY8BX3OCcqW4u97udDTgXIhZXsw
	GhLBeJP00V4AGK6IOt9SGy68vrqiIoHYO/jXnU5vwOLf1ObZZ+g7ZrHC37zGwTEqODlXJrUMcXW
	o8MrkJh3KjsCYGni3PhIcaRPxnE4JhNMNpLsNcl9u9rUJbJhuc5ZRxfvvdvFjYOM8pZot1KSgfR
	Ceg3P2f3xGz2hC+S46VJKLsit
X-Google-Smtp-Source: AGHT+IHG3JlUwigF15T0XwhDxzlsY2s/tUjrYQgDnnRgkFRBCyrBoP03AMu5+REr9myqURLGjXjqYQ==
X-Received: by 2002:a05:6a00:4fcf:b0:749:4fd7:3513 with SMTP id d2e1a72fcca58-763389ac8ddmr21558966b3a.16.1753774942464;
        Tue, 29 Jul 2025 00:42:22 -0700 (PDT)
Received: from sultan-box ([79.127.217.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408feb6casm7296388b3a.59.2025.07.29.00.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 00:42:21 -0700 (PDT)
Date: Tue, 29 Jul 2025 00:42:16 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
Message-ID: <aIh7WB0TGNU15Zm1@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box>
 <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
 <aIVXVpg_9XxRXUAH@sultan-box>
 <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LPdxapUyg6j0wNvs"
Content-Disposition: inline
In-Reply-To: <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com>


--LPdxapUyg6j0wNvs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
> Thanks Sultan, please see my comments
> 
> On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
> > On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
> > > > I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
> > > > 
> > > > I cannot for the life of me get the webcam working under Linux. The webcam works
> > > > under Windows so it's not a hardware issue.
> > > > 
> > > > With this patchset and all of the patches you link here applied to 6.15, I get
> > > > the following errors:
> > > >     [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
> > > >     [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed
> > > > 
> > > > With the old ispkernel code from February [1] applied on 6.15, the webcam
> > > > indicator LED lights up but there's no image. I see these messages at boot:
> > > >     [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
> > > >     [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
> > > >     [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
> > > >     [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
> > > >     [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
> > > >     [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
> > > > 
> > > > And then the kernel crashes due to the same use-after-free issues I pointed out
> > > > in my other email [2].
> > > > 
> > > > Any idea what's going on?
> > > > 
> > > > [1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
> > > > [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
> > > Hi Sultan,
> > > 
> > > [1] is for kernel 6.8, believe it can't be applied to 6.15. We didn't verify
> > > on 6.15 but we are really glad to help, would you please provide some info,
> > > 1. Suppose you are using Ubuntu, right? What's the version?
> > > 2. 6.15, do you mean https://github.com/torvalds/linux/tree/v6.15 ?
> > > 
> > > After your confirmation, we'll see what we can do to enable your camera
> > > quickly and easily
> > > 
> > > Regards,
> > > Bin
> > 
> > Thank you, Bin!
> > 
> > 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
> > 2. Yes, here is my kernel source [2].
> > 
> > I have some more findings:
> > 
> > Currently, the first blocking issue is that the I2C adapter fails to initialize.
> > This is because the ISP tile isn't powered on.
> > 
> > I noticed that in the old version of amd_isp_i2c_designware [3], there were
> > calls to isp_power_set(), which is available in the old ISP4 sources [4].
> > Without isp_power_set(), the I2C adapter always fails to initialize for me.
> > 
> > How is the ISP tile supposed to get powered on in the current ISP4 code?
> > 
> You are correct, yes, i believe the I2C adapter failure is caused by ISP not
> being powered up. Currently in latest code, isp_power_set is no longer
> available, instead, we implemented genPD for ISP in amdgpu
> https://lore.kernel.org/all/20250618221923.3944751-1-pratap.nirujogi@amd.com/
> Both amd_isp_i2c and amd_isp_capture are in the power domain and use the
> standard runtime PM API to do the power control

Thanks for that link, I found it along with another patch on the list to make
the fwnode work ("drm/amd/amdgpu: Initialize swnode for ISP MFD device").

> > Also, I noticed that the driver init ordering matters between all of the drivers
> > needed for the ISP4 camera. In particular, amd_isp_i2c_designware and amd_isp4
> > must be initialized before amd_capture, otherwise amd_capture will fail to find
> > the fwnode properties for the OV05C10 device attached to the I2C bus.
> > 
> > But there is no driver init ordering enforced, which also caused some issues for
> > me until I figured it out. Maybe probe deferral (-EPROBE_DEFER) should be used
> > to ensure each driver waits for its dependencies to init first?
> > 
> amd_isp_capture only has dependency on amd_isp4 which is the ACPI platform
> driver, it is init before amd_isp_catpure.
> Do you see in your side the amd_capture probe failure caused by failing to
> read fwnode properties? If that's the case please help to check if amd_isp4
> is loaded successfully

I got much further now: there aren't any driver initialization errors, but when
I open the camera, there's no image. The camera LED turns on so it's active.

And then shortly afterwards, amdgpu dies and the entire system freezes.

I've attached my full dmesg, please let me know what you think. Thanks!

Sultan

--LPdxapUyg6j0wNvs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=isp4-amdgpu-dies-dmesg.txt
Content-Transfer-Encoding: quoted-printable

[    4.221499] kernel: Linux version 6.16.0-00020-g541e951a4e8a (sultan@sul=
tan-box) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU Binutils) 2.44.0) #1 SMP P=
REEMPT_DYNAMIC Mon Jul 28 23:17:19 PDT 2025
[    4.221530] kernel: Command line: BOOT_IMAGE=3D/vmlinuz-linux-sultan roo=
t=3DUUID=3D18516d14-ae39-4b89-8899-95270912d67b rw module_blacklist=3Dnouve=
au,pcspkr,ntfs3 quiet cryptdevice=3DUUID=3D086cda6b-894f-4a2b-b380-33584642=
1e3f:cryptroot:allow-discards,no-read-workqueue,no-write-workqueue root=3D/=
dev/mapper/cryptroot audit=3D0 psi=3D0 init_on_alloc=3D0 tsx=3Doff memory_c=
orruption_check=3D0 noirqdebug zswap.enabled=3D0 iwlmvm.power_scheme=3D3 pc=
ie_aspm=3Dforce split_lock_detect=3Doff asus_wmi.fnlock_default=3Dfalse efi=
_pstore.pstore_disable=3D0
[    4.221535] kernel: x86/split lock detection: disabled
[    4.221539] kernel: BIOS-provided physical RAM map:
[    4.221543] kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009eff=
f] usable
[    4.221546] kernel: BIOS-e820: [mem 0x000000000009f000-0x000000000009fff=
f] reserved
[    4.221549] kernel: BIOS-e820: [mem 0x0000000000100000-0x0000000009effff=
f] usable
[    4.221553] kernel: BIOS-e820: [mem 0x0000000009f00000-0x0000000009f87ff=
f] ACPI NVS
[    4.221556] kernel: BIOS-e820: [mem 0x0000000009f88000-0x0000000044bcfff=
f] usable
[    4.221559] kernel: BIOS-e820: [mem 0x0000000044bd0000-0x00000000451cfff=
f] type 20
[    4.221562] kernel: BIOS-e820: [mem 0x00000000451d0000-0x000000004899bff=
f] reserved
[    4.221566] kernel: BIOS-e820: [mem 0x000000004899c000-0x000000004909bff=
f] ACPI NVS
[    4.221569] kernel: BIOS-e820: [mem 0x000000004909c000-0x000000004913dff=
f] ACPI data
[    4.221572] kernel: BIOS-e820: [mem 0x000000004913e000-0x0000000052bd1ff=
f] usable
[    4.221576] kernel: BIOS-e820: [mem 0x0000000052bd2000-0x0000000052bd2ff=
f] reserved
[    4.221579] kernel: BIOS-e820: [mem 0x0000000052bd3000-0x0000000052bdbff=
f] usable
[    4.221582] kernel: BIOS-e820: [mem 0x0000000052bdc000-0x0000000052bdcff=
f] reserved
[    4.221585] kernel: BIOS-e820: [mem 0x0000000052bdd000-0x000000005d133ff=
f] usable
[    4.221588] kernel: BIOS-e820: [mem 0x000000005d134000-0x000000005d138ff=
f] reserved
[    4.221590] kernel: BIOS-e820: [mem 0x000000005d139000-0x0000000077fffff=
f] usable
[    4.221593] kernel: BIOS-e820: [mem 0x0000000078000000-0x000000007bfffff=
f] reserved
[    4.221597] kernel: BIOS-e820: [mem 0x000000007d675000-0x000000007d6ffff=
f] reserved
[    4.221599] kernel: BIOS-e820: [mem 0x000000007d800000-0x000000007ffffff=
f] reserved
[    4.221602] kernel: BIOS-e820: [mem 0x00000000e0000000-0x00000000effffff=
f] reserved
[    4.221605] kernel: BIOS-e820: [mem 0x00000000fd300000-0x00000000fd3ffff=
f] reserved
[    4.221608] kernel: BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00ff=
f] reserved
[    4.221611] kernel: BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10ff=
f] reserved
[    4.221614] kernel: BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80ff=
f] reserved
[    4.221617] kernel: BIOS-e820: [mem 0x00000000fedf1000-0x00000000fedf1ff=
f] reserved
[    4.221620] kernel: BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00ff=
f] reserved
[    4.221622] kernel: BIOS-e820: [mem 0x0000000100000000-0x0000000f7e0bfff=
f] usable
[    4.221625] kernel: BIOS-e820: [mem 0x0000000f7e0c0000-0x00000010b01ffff=
f] reserved
[    4.221628] kernel: BIOS-e820: [mem 0x000000fd00000000-0x000000fd01fffff=
f] reserved
[    4.221630] kernel: NX (Execute Disable) protection: active
[    4.221633] kernel: APIC: Static calls initialized
[    4.221636] kernel: efi: EFI v2.8 by HP
[    4.221639] kernel: efi: ACPI=3D0x4913d000 ACPI 2.0=3D0x4913d014 SMBIOS=
=3D0x45ea0000 SMBIOS 3.0=3D0x45e9e000 ESRT=3D0x45e9c118 RTPROP=3D0x45e9c798=
 MEMATTR=3D0x37f04698=20
[    4.221642] kernel: efi: Remove mem65: MMIO range=3D[0xe0000000-0xefffff=
ff] (256MB) from e820 map
[    4.221645] kernel: e820: remove [mem 0xe0000000-0xefffffff] reserved
[    4.221648] kernel: efi: Remove mem66: MMIO range=3D[0xfd300000-0xfd3fff=
ff] (1MB) from e820 map
[    4.221652] kernel: e820: remove [mem 0xfd300000-0xfd3fffff] reserved
[    4.221655] kernel: efi: Not removing mem67: MMIO range=3D[0xfec00000-0x=
fec00fff] (4KB) from e820 map
[    4.221658] kernel: efi: Not removing mem68: MMIO range=3D[0xfec10000-0x=
fec10fff] (4KB) from e820 map
[    4.221661] kernel: efi: Not removing mem69: MMIO range=3D[0xfed80000-0x=
fed80fff] (4KB) from e820 map
[    4.221664] kernel: efi: Not removing mem70: MMIO range=3D[0xfedf1000-0x=
fedf1fff] (4KB) from e820 map
[    4.221666] kernel: efi: Not removing mem71: MMIO range=3D[0xfee00000-0x=
fee00fff] (4KB) from e820 map
[    4.221669] kernel: efi: Remove mem73: MMIO range=3D[0x1090000000-0x10b0=
1fffff] (514MB) from e820 map
[    4.221672] kernel: e820: remove [mem 0x1090000000-0x10b01fffff] reserved
[    4.221675] kernel: efi: Remove mem74: MMIO range=3D[0xfd00000000-0xfd01=
ffffff] (32MB) from e820 map
[    4.221678] kernel: e820: remove [mem 0xfd00000000-0xfd01ffffff] reserved
[    4.221681] kernel: SMBIOS 3.4.0 present.
[    4.221684] kernel: DMI: HP HP ZBook Ultra G1a 14 inch Mobile Workstatio=
n PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[    4.221687] kernel: DMI: Memory slots populated: 8/8
[    4.221690] kernel: tsc: Fast TSC calibration using PIT
[    4.221694] kernel: tsc: Detected 2994.065 MHz processor
[    4.221697] kernel: e820: update [mem 0x00000000-0x00000fff] usable =3D=
=3D> reserved
[    4.221700] kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
[    4.221704] kernel: last_pfn =3D 0xf7e0c0 max_arch_pfn =3D 0x400000000
[    4.221707] kernel: MTRR map: 8 entries (3 fixed + 5 variable; max 20), =
built from 9 variable MTRRs
[    4.221710] kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP=
  UC- WT =20
[    4.221713] kernel: last_pfn =3D 0x78000 max_arch_pfn =3D 0x400000000
[    4.221716] kernel: esrt: Reserving ESRT space from 0x0000000045e9c118 t=
o 0x0000000045e9c128.
[    4.221720] kernel: Using GB pages for direct mapping
[    4.221723] kernel: Secure boot disabled
[    4.221726] kernel: RAMDISK: [mem 0x2fc19000-0x33e03fff]
[    4.221730] kernel: ACPI: Early table checksum verification disabled
[    4.221733] kernel: ACPI: RSDP 0x000000004913D014 000024 (v02 HPQOEM)
[    4.221736] kernel: ACPI: XSDT 0x00000000490C1228 00019C (v01 HPQOEM SLI=
C-BPC 00000001      01000013)
[    4.221739] kernel: ACPI: FACP 0x0000000049129000 00010C (v05 HPQOEM SLI=
C-BPC 00000001 HP   00000001)
[    4.221742] kernel: ACPI: DSDT 0x0000000049108000 01A94C (v02 HPQOEM 8D0=
1     00000000 INTL 20200717)
[    4.221745] kernel: ACPI: FACS 0x0000000048D43000 000040
[    4.221748] kernel: ACPI: SSDT 0x000000004913B000 000353 (v02 HP     NVT=
EC    00000001 INTL 20200717)
[    4.221752] kernel: ACPI: SSDT 0x000000004913A000 00013E (v02 HP     Shm=
Table 00000001 INTL 20200717)
[    4.221755] kernel: ACPI: ASF! 0x0000000049139000 000085 (v32 HPQOEM EDK=
2     00000002      01000013)
[    4.221758] kernel: ACPI: SSDT 0x0000000049130000 00848D (v02 AMD    Amd=
Table 00000002 MSFT 04000000)
[    4.221761] kernel: ACPI: RTMA 0x000000004912F000 00009E (v01 HP     _HB=
MART_ 00001000 HP   00000001)
[    4.221765] kernel: ACPI: SSDT 0x000000004912D000 001A39 (v02 HP     Ucs=
iAcpi 00000001 INTL 20200717)
[    4.221768] kernel: ACPI: SSDT 0x000000004912C000 0000FB (v02 HP     Ucs=
iCntr 00000001 INTL 20200717)
[    4.221771] kernel: ACPI: SSDT 0x000000004912B000 0000BC (v01 HP     OPA=
LPWD  00000001 INTL 20200717)
[    4.221774] kernel: ACPI: OEML 0x000000004912A000 000028 (v03 HPQOEM EDK=
2     00000002      01000013)
[    4.221777] kernel: ACPI: MSDM 0x0000000049128000 000055 (v03 HPQOEM SLI=
C-BPC 00000000 HP   00000001)
[    4.221780] kernel: ACPI: WSMT 0x0000000049127000 000028 (v01 HPQOEM 8D0=
1     00000001 HP   00000001)
[    4.221783] kernel: ACPI: ASF! 0x0000000049126000 00006E (v32 HPQOEM 8D0=
1     00000001 HP   00000001)
[    4.221787] kernel: ACPI: HPET 0x0000000049125000 000038 (v01 HPQOEM 8D0=
1     00000001 HP   00000001)
[    4.221790] kernel: ACPI: APIC 0x0000000049124000 000222 (v02 HPQOEM 8D0=
1     00000001 HP   00000001)
[    4.221817] kernel: ACPI: MCFG 0x0000000049123000 00003C (v01 HPQOEM 8D0=
1     00000001 HP   00000001)
[    4.221820] kernel: ACPI: SSDT 0x0000000049107000 00014A (v01 HPQOEM AMD=
NFCI2 00000001 INTL 20200717)
[    4.221823] kernel: ACPI: SSDT 0x00000000490FC000 00A8CE (v02 AMD    AMD=
 CPU  00000001 AMD  00000001)
[    4.221827] kernel: ACPI: FPDT 0x00000000490FB000 000044 (v01 HPQOEM EDK=
2     00000002      01000013)
[    4.221830] kernel: ACPI: SSDT 0x00000000490FA000 000045 (v02 HP     HPN=
BCONV 00001000 INTL 20200717)
[    4.221833] kernel: ACPI: SSDT 0x00000000490F9000 00061A (v01 HP     AMD=
TPL   00001000 INTL 20200717)
[    4.221836] kernel: ACPI: SSDT 0x00000000490F3000 004430 (v02 HP     HPA=
MD_WL 00001000 INTL 20200717)
[    4.221840] kernel: ACPI: SSDT 0x000000004913C000 000032 (v02 HP     HPC=
ONDEV 00001000 INTL 20200717)
[    4.221843] kernel: ACPI: SSDT 0x00000000490F2000 000EE0 (v02 HPQOEM HPP=
ATT   00001000 INTL 20200717)
[    4.221846] kernel: ACPI: VFCT 0x00000000490ED000 004484 (v01 HPQOEM SLI=
C-BPC 00000001 AMD  33504F47)
[    4.221849] kernel: ACPI: SSDT 0x00000000490EB000 0017CA (v02 AMD    OEM=
ACP   00000001 INTL 20200717)
[    4.221853] kernel: ACPI: SSDT 0x00000000490E9000 001152 (v02 AMD    OEM=
PMF   00000001 INTL 20200717)
[    4.221856] kernel: ACPI: SSDT 0x00000000490E7000 001DB7 (v02 AMD    CPM=
PMF   00000001 INTL 20200717)
[    4.221859] kernel: ACPI: SSDT 0x00000000490E6000 00047A (v02 AMD    CPM=
WBH   00000001 INTL 20200717)
[    4.221863] kernel: ACPI: SSDT 0x00000000490DC000 009A93 (v02 AMD    CPM=
CMN   00000001 INTL 20200717)
[    4.221866] kernel: ACPI: BGRT 0x00000000490DB000 000038 (v01 HPQOEM EDK=
2     00000002      01000013)
[    4.221869] kernel: ACPI: SSDT 0x00000000490DA000 000612 (v02 AMD    CAM=
11    00000001 INTL 20200717)
[    4.221872] kernel: ACPI: SSDT 0x00000000490D9000 000A7F (v02 AMD    SDC=
R     00000001 INTL 20200717)
[    4.221876] kernel: ACPI: SSDT 0x00000000490D8000 000A34 (v02 AMD    LOM=
      00000001 INTL 20200717)
[    4.221879] kernel: ACPI: SSDT 0x00000000490D7000 000DB4 (v02 AMD    NVM=
E     00000001 INTL 20200717)
[    4.221882] kernel: ACPI: SSDT 0x00000000490D5000 001672 (v02 AMD    UPE=
P     00000001 INTL 20200717)
[    4.221886] kernel: ACPI: SSDT 0x00000000490D3000 0010BB (v02 AMD    GPP=
_PME_ 00000001 INTL 20200717)
[    4.221889] kernel: ACPI: SSDT 0x00000000490C9000 0097A5 (v02 AMD    INT=
BUSC_ 00000001 INTL 20200717)
[    4.221892] kernel: ACPI: SSDT 0x00000000490C4000 0046FB (v02 AMD    INT=
GPPA_ 00000001 INTL 20200717)
[    4.221895] kernel: ACPI: SSDT 0x00000000490C3000 000AE6 (v02 AMD    CPM=
GPIO0 00000001 INTL 20200717)
[    4.221898] kernel: ACPI: SSDT 0x00000000490C2000 000051 (v02 AMD    DRT=
M     00000001 INTL 20200717)
[    4.221902] kernel: ACPI: IVRS 0x00000000490F8000 0001F6 (v02 AMD    Amd=
Table 00000001 AMD  00000001)
[    4.221905] kernel: ACPI: SSDT 0x00000000490C0000 000500 (v02 AMD    MEM=
TOOL0 00000002 INTL 20200717)
[    4.221908] kernel: ACPI: SSDT 0x00000000490BF000 0009D0 (v02 AMD    CPM=
MSOSC 00000001 INTL 20200717)
[    4.221911] kernel: ACPI: SSDT 0x00000000490BE000 00008D (v02 AMD    CPM=
MSLPI 00000001 INTL 20200717)
[    4.221914] kernel: ACPI: SSDT 0x00000000490BD000 000509 (v02 AMD    CPM=
SFAML 00000001 INTL 20200717)
[    4.221918] kernel: ACPI: SSDT 0x00000000490BC000 000F5C (v02 AMD    CPM=
ACPV8 00000001 INTL 20200717)
[    4.221921] kernel: ACPI: Reserving FACP table memory at [mem 0x49129000=
-0x4912910b]
[    4.221926] kernel: ACPI: Reserving DSDT table memory at [mem 0x49108000=
-0x4912294b]
[    4.221929] kernel: ACPI: Reserving FACS table memory at [mem 0x48d43000=
-0x48d4303f]
[    4.221932] kernel: ACPI: Reserving SSDT table memory at [mem 0x4913b000=
-0x4913b352]
[    4.221935] kernel: ACPI: Reserving SSDT table memory at [mem 0x4913a000=
-0x4913a13d]
[    4.221938] kernel: ACPI: Reserving ASF! table memory at [mem 0x49139000=
-0x49139084]
[    4.221941] kernel: ACPI: Reserving SSDT table memory at [mem 0x49130000=
-0x4913848c]
[    4.221944] kernel: ACPI: Reserving RTMA table memory at [mem 0x4912f000=
-0x4912f09d]
[    4.221946] kernel: ACPI: Reserving SSDT table memory at [mem 0x4912d000=
-0x4912ea38]
[    4.221950] kernel: ACPI: Reserving SSDT table memory at [mem 0x4912c000=
-0x4912c0fa]
[    4.221953] kernel: ACPI: Reserving SSDT table memory at [mem 0x4912b000=
-0x4912b0bb]
[    4.221955] kernel: ACPI: Reserving OEML table memory at [mem 0x4912a000=
-0x4912a027]
[    4.221958] kernel: ACPI: Reserving MSDM table memory at [mem 0x49128000=
-0x49128054]
[    4.221961] kernel: ACPI: Reserving WSMT table memory at [mem 0x49127000=
-0x49127027]
[    4.221964] kernel: ACPI: Reserving ASF! table memory at [mem 0x49126000=
-0x4912606d]
[    4.221967] kernel: ACPI: Reserving HPET table memory at [mem 0x49125000=
-0x49125037]
[    4.221970] kernel: ACPI: Reserving APIC table memory at [mem 0x49124000=
-0x49124221]
[    4.221974] kernel: ACPI: Reserving MCFG table memory at [mem 0x49123000=
-0x4912303b]
[    4.221977] kernel: ACPI: Reserving SSDT table memory at [mem 0x49107000=
-0x49107149]
[    4.221980] kernel: ACPI: Reserving SSDT table memory at [mem 0x490fc000=
-0x491068cd]
[    4.221983] kernel: ACPI: Reserving FPDT table memory at [mem 0x490fb000=
-0x490fb043]
[    4.221986] kernel: ACPI: Reserving SSDT table memory at [mem 0x490fa000=
-0x490fa044]
[    4.221989] kernel: ACPI: Reserving SSDT table memory at [mem 0x490f9000=
-0x490f9619]
[    4.221992] kernel: ACPI: Reserving SSDT table memory at [mem 0x490f3000=
-0x490f742f]
[    4.221995] kernel: ACPI: Reserving SSDT table memory at [mem 0x4913c000=
-0x4913c031]
[    4.221998] kernel: ACPI: Reserving SSDT table memory at [mem 0x490f2000=
-0x490f2edf]
[    4.222003] kernel: ACPI: Reserving VFCT table memory at [mem 0x490ed000=
-0x490f1483]
[    4.222007] kernel: ACPI: Reserving SSDT table memory at [mem 0x490eb000=
-0x490ec7c9]
[    4.222012] kernel: ACPI: Reserving SSDT table memory at [mem 0x490e9000=
-0x490ea151]
[    4.222015] kernel: ACPI: Reserving SSDT table memory at [mem 0x490e7000=
-0x490e8db6]
[    4.222018] kernel: ACPI: Reserving SSDT table memory at [mem 0x490e6000=
-0x490e6479]
[    4.222022] kernel: ACPI: Reserving SSDT table memory at [mem 0x490dc000=
-0x490e5a92]
[    4.222025] kernel: ACPI: Reserving BGRT table memory at [mem 0x490db000=
-0x490db037]
[    4.222028] kernel: ACPI: Reserving SSDT table memory at [mem 0x490da000=
-0x490da611]
[    4.222030] kernel: ACPI: Reserving SSDT table memory at [mem 0x490d9000=
-0x490d9a7e]
[    4.222034] kernel: ACPI: Reserving SSDT table memory at [mem 0x490d8000=
-0x490d8a33]
[    4.222037] kernel: ACPI: Reserving SSDT table memory at [mem 0x490d7000=
-0x490d7db3]
[    4.222040] kernel: ACPI: Reserving SSDT table memory at [mem 0x490d5000=
-0x490d6671]
[    4.222043] kernel: ACPI: Reserving SSDT table memory at [mem 0x490d3000=
-0x490d40ba]
[    4.222046] kernel: ACPI: Reserving SSDT table memory at [mem 0x490c9000=
-0x490d27a4]
[    4.222049] kernel: ACPI: Reserving SSDT table memory at [mem 0x490c4000=
-0x490c86fa]
[    4.222052] kernel: ACPI: Reserving SSDT table memory at [mem 0x490c3000=
-0x490c3ae5]
[    4.222055] kernel: ACPI: Reserving SSDT table memory at [mem 0x490c2000=
-0x490c2050]
[    4.222057] kernel: ACPI: Reserving IVRS table memory at [mem 0x490f8000=
-0x490f81f5]
[    4.222061] kernel: ACPI: Reserving SSDT table memory at [mem 0x490c0000=
-0x490c04ff]
[    4.222064] kernel: ACPI: Reserving SSDT table memory at [mem 0x490bf000=
-0x490bf9cf]
[    4.222067] kernel: ACPI: Reserving SSDT table memory at [mem 0x490be000=
-0x490be08c]
[    4.222070] kernel: ACPI: Reserving SSDT table memory at [mem 0x490bd000=
-0x490bd508]
[    4.222073] kernel: ACPI: Reserving SSDT table memory at [mem 0x490bc000=
-0x490bcf5b]
[    4.222076] kernel: No NUMA configuration found
[    4.222079] kernel: Faking a node at [mem 0x0000000000000000-0x0000000f7=
e0bffff]
[    4.222083] kernel: NODE_DATA(0) allocated [mem 0xf7e095280-0xf7e0bffff]
[    4.222086] kernel: Zone ranges:
[    4.222089] kernel:   DMA      [mem 0x0000000000001000-0x0000000000fffff=
f]
[    4.222092] kernel:   DMA32    [mem 0x0000000001000000-0x00000000fffffff=
f]
[    4.222096] kernel:   Normal   [mem 0x0000000100000000-0x0000000f7e0bfff=
f]
[    4.222099] kernel:   Device   empty
[    4.222102] kernel: Movable zone start for each node
[    4.222105] kernel: Early memory node ranges
[    4.222109] kernel:   node   0: [mem 0x0000000000001000-0x000000000009ef=
ff]
[    4.222112] kernel:   node   0: [mem 0x0000000000100000-0x0000000009efff=
ff]
[    4.222115] kernel:   node   0: [mem 0x0000000009f88000-0x0000000044bcff=
ff]
[    4.222118] kernel:   node   0: [mem 0x000000004913e000-0x0000000052bd1f=
ff]
[    4.222121] kernel:   node   0: [mem 0x0000000052bd3000-0x0000000052bdbf=
ff]
[    4.222124] kernel:   node   0: [mem 0x0000000052bdd000-0x000000005d133f=
ff]
[    4.222127] kernel:   node   0: [mem 0x000000005d139000-0x0000000077ffff=
ff]
[    4.222131] kernel:   node   0: [mem 0x0000000100000000-0x0000000f7e0bff=
ff]
[    4.222134] kernel: Initmem setup node 0 [mem 0x0000000000001000-0x00000=
00f7e0bffff]
[    4.222137] kernel: On node 0, zone DMA: 1 pages in unavailable ranges
[    4.222140] kernel: On node 0, zone DMA: 97 pages in unavailable ranges
[    4.222143] kernel: On node 0, zone DMA32: 136 pages in unavailable rang=
es
[    4.222146] kernel: On node 0, zone DMA32: 17774 pages in unavailable ra=
nges
[    4.222150] kernel: On node 0, zone DMA32: 1 pages in unavailable ranges
[    4.222153] kernel: On node 0, zone DMA32: 1 pages in unavailable ranges
[    4.222156] kernel: On node 0, zone DMA32: 5 pages in unavailable ranges
[    4.222159] kernel: On node 0, zone Normal: 8000 pages in unavailable ra=
nges
[    4.222162] kernel: ACPI: PM-Timer IO Port: 0x408
[    4.222165] kernel: ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    4.222168] kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    4.222171] kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    4.222174] kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    4.222177] kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    4.222180] kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    4.222183] kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    4.222186] kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    4.222189] kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    4.222192] kernel: ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    4.222195] kernel: ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    4.222198] kernel: ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    4.222201] kernel: ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    4.222204] kernel: ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    4.222207] kernel: ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    4.222210] kernel: ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    4.222213] kernel: ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    4.222216] kernel: ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
[    4.222219] kernel: ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
[    4.222221] kernel: ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
[    4.222224] kernel: ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
[    4.222227] kernel: ACPI: LAPIC_NMI (acpi_id[0x15] high edge lint[0x1])
[    4.222231] kernel: ACPI: LAPIC_NMI (acpi_id[0x16] high edge lint[0x1])
[    4.222234] kernel: ACPI: LAPIC_NMI (acpi_id[0x17] high edge lint[0x1])
[    4.222237] kernel: ACPI: LAPIC_NMI (acpi_id[0x18] high edge lint[0x1])
[    4.222241] kernel: ACPI: LAPIC_NMI (acpi_id[0x19] high edge lint[0x1])
[    4.222244] kernel: ACPI: LAPIC_NMI (acpi_id[0x1a] high edge lint[0x1])
[    4.222247] kernel: ACPI: LAPIC_NMI (acpi_id[0x1b] high edge lint[0x1])
[    4.222250] kernel: ACPI: LAPIC_NMI (acpi_id[0x1c] high edge lint[0x1])
[    4.222253] kernel: ACPI: LAPIC_NMI (acpi_id[0x1d] high edge lint[0x1])
[    4.222256] kernel: ACPI: LAPIC_NMI (acpi_id[0x1e] high edge lint[0x1])
[    4.222259] kernel: ACPI: LAPIC_NMI (acpi_id[0x1f] high edge lint[0x1])
[    4.222261] kernel: IOAPIC[0]: apic_id 4, version 33, address 0xfec00000=
, GSI 0-23
[    4.222265] kernel: IOAPIC[1]: apic_id 5, version 33, address 0xfec01000=
, GSI 24-55
[    4.222268] kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low =
edge)
[    4.222271] kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl =
dfl)
[    4.222275] kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low =
level)
[    4.222278] kernel: ACPI: Using ACPI (MADT) for SMP configuration inform=
ation
[    4.222281] kernel: ACPI: HPET id: 0x10228210 base: 0xfed00000
[    4.222284] kernel: e820: update [mem 0x37bee000-0x37dfdfff] usable =3D=
=3D> reserved
[    4.222287] kernel: CPU topo: Max. logical packages:   1
[    4.222291] kernel: CPU topo: Max. logical dies:       2
[    4.222294] kernel: CPU topo: Max. dies per package:   2
[    4.222296] kernel: CPU topo: Max. threads per core:   2
[    4.222300] kernel: CPU topo: Num. cores per package:    16
[    4.222303] kernel: CPU topo: Num. threads per package:  32
[    4.222306] kernel: CPU topo: Allowing 32 present CPUs plus 0 hotplug CP=
Us
[    4.222309] kernel: PM: hibernation: Registered nosave memory: [mem 0x00=
000000-0x00000fff]
[    4.222313] kernel: PM: hibernation: Registered nosave memory: [mem 0x00=
09f000-0x000fffff]
[    4.222318] kernel: PM: hibernation: Registered nosave memory: [mem 0x09=
f00000-0x09f87fff]
[    4.222321] kernel: PM: hibernation: Registered nosave memory: [mem 0x37=
bee000-0x37dfdfff]
[    4.222325] kernel: PM: hibernation: Registered nosave memory: [mem 0x44=
bd0000-0x4913dfff]
[    4.222328] kernel: PM: hibernation: Registered nosave memory: [mem 0x52=
bd2000-0x52bd2fff]
[    4.222332] kernel: PM: hibernation: Registered nosave memory: [mem 0x52=
bdc000-0x52bdcfff]
[    4.222337] kernel: PM: hibernation: Registered nosave memory: [mem 0x5d=
134000-0x5d138fff]
[    4.222340] kernel: PM: hibernation: Registered nosave memory: [mem 0x78=
000000-0xffffffff]
[    4.222343] kernel: [mem 0x80000000-0xfebfffff] available for PCI devices
[    4.222348] kernel: Booting paravirtualized kernel on bare hardware
[    4.222351] kernel: clocksource: refined-jiffies: mask: 0xffffffff max_c=
ycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    4.222355] kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:32 nr_cpu=
_ids:32 nr_node_ids:1
[    4.222358] kernel: percpu: Embedded 62 pages/cpu s217088 r8192 d28672 u=
262144
[    4.222363] kernel: pcpu-alloc: s217088 r8192 d28672 u262144 alloc=3D1*2=
097152
[    4.222367] kernel: pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10=
 11 12 13 14 15=20
[    4.222370] kernel: pcpu-alloc: [0] 16 17 18 19 20 21 22 23 [0] 24 25 26=
 27 28 29 30 31=20
[    4.222374] kernel: Kernel command line: BOOT_IMAGE=3D/vmlinuz-linux-sul=
tan root=3DUUID=3D18516d14-ae39-4b89-8899-95270912d67b rw module_blacklist=
=3Dnouveau,pcspkr,ntfs3 quiet cryptdevice=3DUUID=3D086cda6b-894f-4a2b-b380-=
335846421e3f:cryptroot:allow-discards,no-read-workqueue,no-write-workqueue =
root=3D/dev/mapper/cryptroot audit=3D0 psi=3D0 init_on_alloc=3D0 tsx=3Doff =
memory_corruption_check=3D0 noirqdebug zswap.enabled=3D0 iwlmvm.power_schem=
e=3D3 pcie_aspm=3Dforce split_lock_detect=3Doff asus_wmi.fnlock_default=3Df=
alse efi_pstore.pstore_disable=3D0
[    4.222380] kernel: audit: disabled (until reboot)
[    4.222384] kernel: IRQ lockup detection disabled
[    4.222389] kernel: PCIe ASPM is forcibly enabled
[    4.222392] kernel: Unknown kernel command line parameters "BOOT_IMAGE=
=3D/vmlinuz-linux-sultan cryptdevice=3DUUID=3D086cda6b-894f-4a2b-b380-33584=
6421e3f:cryptroot:allow-discards,no-read-workqueue,no-write-workqueue tsx=
=3Doff split_lock_detect=3Doff", will be passed to user space.
[    4.222396] kernel: random: crng init done
[    4.222400] kernel: printk: log_buf_len individual max cpu contribution:=
 4096 bytes
[    4.222403] kernel: printk: log_buf_len total cpu_extra contributions: 1=
26976 bytes
[    4.222406] kernel: printk: log_buf_len min size: 131072 bytes
[    4.222409] kernel: printk: log buffer data + meta data: 262144 + 917504=
 =3D 1179648 bytes
[    4.222412] kernel: printk: early log buf free: 110568(84%)
[    4.222416] kernel: Dentry cache hash table entries: 8388608 (order: 14,=
 67108864 bytes, linear)
[    4.222419] kernel: Inode-cache hash table entries: 4194304 (order: 13, =
33554432 bytes, linear)
[    4.222422] kernel: software IO TLB: area num 32.
[    4.222425] kernel: Fallback order for Node 0: 0=20
[    4.222429] kernel: Built 1 zonelists, mobility grouping on.  Total page=
s: 15669857
[    4.222432] kernel: Policy zone: Normal
[    4.222435] kernel: mem auto-init: stack:all(zero), heap alloc:off, heap=
 free:off
[    4.222438] kernel: SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPU=
s=3D32, Nodes=3D1
[    4.222442] kernel: ftrace: allocating 55816 entries in 220 pages
[    4.222445] kernel: ftrace: allocated 220 pages with 5 groups
[    4.222448] kernel: Dynamic Preempt: full
[    4.222451] kernel: rcu: Preemptible hierarchical RCU implementation.
[    4.222455] kernel: rcu:         RCU restricting CPUs from NR_CPUS=3D819=
2 to nr_cpu_ids=3D32.
[    4.222459] kernel: rcu:         RCU priority boosting: priority 1 delay=
 500 ms.
[    4.222463] kernel:         Trampoline variant of Tasks RCU enabled.
[    4.222466] kernel:         Rude variant of Tasks RCU enabled.
[    4.222470] kernel:         Tracing variant of Tasks RCU enabled.
[    4.222473] kernel: rcu: RCU calculated value of scheduler-enlistment de=
lay is 100 jiffies.
[    4.222476] kernel: rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr=
_cpu_ids=3D32
[    4.222479] kernel: RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_=
cb_adjust=3D1 rcu_task_cpu_ids=3D32.
[    4.222482] kernel: RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_=
task_cb_adjust=3D1 rcu_task_cpu_ids=3D32.
[    4.222485] kernel: RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu=
_task_cb_adjust=3D1 rcu_task_cpu_ids=3D32.
[    4.222489] kernel: NR_IRQS: 524544, nr_irqs: 1224, preallocated irqs: 16
[    4.222492] kernel: rcu: srcu_init: Setting srcu_struct sizes based on c=
ontention.
[    4.222496] kernel: kfence: initialized - using 2097152 bytes for 255 ob=
jects at 0x(____ptrval____)-0x(____ptrval____)
[    4.222501] kernel: Console: colour dummy device 80x25
[    4.222504] kernel: printk: legacy console [tty0] enabled
[    4.222507] kernel: ACPI: Core revision 20250404
[    4.222511] kernel: clocksource: hpet: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 133484873504 ns
[    4.222516] kernel: APIC: Switch to symmetric I/O mode setup
[    4.222519] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID00, rdevid:0xa0
[    4.222523] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID01, rdevid:0xa0
[    4.222526] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID02, rdevid:0xa0
[    4.222530] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID03, rdevid:0xa0
[    4.222533] kernel: AMD-Vi: ivrs, add hid:MSFT0201, uid:1, rdevid:0x60
[    4.222536] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID04, rdevid:0xa0
[    4.222539] kernel: AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EF=
R2:0x10
[    4.222542] kernel: ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1=
 pin2=3D-1
[    4.222547] kernel: clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x2b285e92338, max_idle_ns: 440795203718 ns
[    4.222551] kernel: Calibrating delay loop (skipped), value calculated u=
sing timer frequency.. 5988.13 BogoMIPS (lpj=3D2994065)
[    4.222556] kernel: x86/cpu: User Mode Instruction Prevention (UMIP) act=
ivated
[    4.222561] kernel: LVT offset 1 assigned for vector 0xf9
[    4.222564] kernel: LVT offset 2 assigned for vector 0xf4
[    4.222567] kernel: Last level iTLB entries: 4KB 64, 2MB 64, 4MB 32
[    4.222571] kernel: Last level dTLB entries: 4KB 128, 2MB 128, 4MB 64, 1=
GB 0
[    4.222574] kernel: process: using mwait in idle threads
[    4.222577] kernel: Speculative Store Bypass: Mitigation: Speculative St=
ore Bypass disabled via prctl
[    4.222580] kernel: Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    4.222583] kernel: Spectre V2 : User space: Mitigation: STIBP always-on=
 protection
[    4.222587] kernel: Speculative Return Stack Overflow: Mitigation: IBPB =
on VMEXIT only
[    4.222590] kernel: Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    4.222594] kernel: Spectre V2 : mitigation: Enabling conditional Indire=
ct Branch Prediction Barrier
[    4.222597] kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    4.222600] kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    4.222603] kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    4.222606] kernel: x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 op=
mask'
[    4.222609] kernel: x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi=
256'
[    4.222612] kernel: x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZM=
M_Hi256'
[    4.222616] kernel: x86/fpu: Supporting XSAVE feature 0x200: 'Protection=
 Keys User registers'
[    4.222619] kernel: x86/fpu: Supporting XSAVE feature 0x800: 'Control-fl=
ow User registers'
[    4.222622] kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    4.222626] kernel: x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   =
64
[    4.222629] kernel: x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  5=
12
[    4.222632] kernel: x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 10=
24
[    4.222635] kernel: x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:   =
 8
[    4.222638] kernel: x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]: =
  16
[    4.222641] kernel: x86/fpu: Enabled xstate features 0xae7, context size=
 is 2456 bytes, using 'compacted' format.
[    4.222644] kernel: Freeing SMP alternatives memory: 56K
[    4.222648] kernel: pid_max: default: 32768 minimum: 301
[    4.222651] kernel: LSM: initializing lsm=3Dcapability,landlock,lockdown=
,yama,bpf
[    4.222654] kernel: landlock: Up and running.
[    4.222657] kernel: Yama: becoming mindful.
[    4.222660] kernel: LSM support for eBPF active
[    4.222663] kernel: Mount-cache hash table entries: 131072 (order: 8, 10=
48576 bytes, linear)
[    4.222666] kernel: Mountpoint-cache hash table entries: 131072 (order: =
8, 1048576 bytes, linear)
[    4.222670] kernel: smpboot: CPU0: AMD RYZEN AI MAX+ PRO 395 w/ Radeon 8=
060S (family: 0x1a, model: 0x70, stepping: 0x0)
[    4.222674] kernel: Performance Events: Fam17h+ 16-deep LBR, core perfct=
r, AMD PMU driver.
[    4.222677] kernel: ... version:                2
[    4.222680] kernel: ... bit width:              48
[    4.222684] kernel: ... generic registers:      6
[    4.222687] kernel: ... value mask:             0000ffffffffffff
[    4.222690] kernel: ... max period:             00007fffffffffff
[    4.222693] kernel: ... fixed-purpose events:   0
[    4.222699] kernel: ... event mask:             000000000000003f
[    4.222703] kernel: signal: max sigframe size: 3376
[    4.222706] kernel: rcu: Hierarchical SRCU implementation.
[    4.222709] kernel: rcu:         Max phase no-delay instances is 400.
[    4.222712] kernel: Timer migration: 2 hierarchy levels; 8 children per =
group; 2 crossnode level
[    4.222715] kernel: MCE: In-kernel MCE decoding enabled.
[    4.222718] kernel: NMI watchdog: Enabled. Permanently consumes one hw-P=
MU counter.
[    4.222721] kernel: smp: Bringing up secondary CPUs ...
[    4.222724] kernel: smpboot: x86: Booting SMP configuration:
[    4.222728] kernel: .... node  #0, CPUs:        #2  #4  #6  #8 #10 #12 #=
14 #16 #18 #20 #22 #24 #26 #28 #30  #1  #3  #5  #7  #9 #11 #13 #15 #17 #19 =
#21 #23 #25 #27 #29 #31
[    4.222731] kernel: Spectre V2 : Update user space SMT mitigation: STIBP=
 always-on
[    4.222734] kernel: smp: Brought up 1 node, 32 CPUs
[    4.222737] kernel: smpboot: Total of 32 processors activated (191620.16=
 BogoMIPS)
[    4.222740] kernel: Memory: 61357380K/62679428K available (19619K kernel=
 code, 2940K rwdata, 15820K rodata, 4644K init, 5040K bss, 1283092K reserve=
d, 0K cma-reserved)
[    4.222743] kernel: devtmpfs: initialized
[    4.222747] kernel: x86/mm: Memory block size: 128MB
[    4.222752] kernel: ACPI: PM: Registering ACPI NVS region [mem 0x09f0000=
0-0x09f87fff] (557056 bytes)
[    4.222757] kernel: ACPI: PM: Registering ACPI NVS region [mem 0x4899c00=
0-0x4909bfff] (7340032 bytes)
[    4.222760] kernel: clocksource: jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1911260446275000 ns
[    4.222763] kernel: posixtimers hash table entries: 16384 (order: 6, 262=
144 bytes, linear)
[    4.222766] kernel: futex hash table entries: 8192 (524288 bytes on 1 NU=
MA nodes, total 512 KiB, linear).
[    4.222769] kernel: pinctrl core: initialized pinctrl subsystem
[    4.222772] kernel: PM: RTC time: 06:54:06, date: 2025-07-29
[    4.222775] kernel: NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    4.222778] kernel: DMA: preallocated 4096 KiB GFP_KERNEL pool for atomi=
c allocations
[    4.222782] kernel: DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool f=
or atomic allocations
[    4.222785] kernel: DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool=
 for atomic allocations
[    4.222788] kernel: thermal_sys: Registered thermal governor 'fair_share'
[    4.222791] kernel: thermal_sys: Registered thermal governor 'bang_bang'
[    4.222794] kernel: thermal_sys: Registered thermal governor 'step_wise'
[    4.222798] kernel: thermal_sys: Registered thermal governor 'user_space'
[    4.222801] kernel: thermal_sys: Registered thermal governor 'power_allo=
cator'
[    4.222803] kernel: cpuidle: using governor ladder
[    4.222807] kernel: cpuidle: using governor menu
[    4.222811] kernel: ACPI FADT declares the system doesn't support PCIe A=
SPM, so disable it
[    4.222814] kernel: acpiphp: ACPI Hot Plug PCI Controller Driver version=
: 0.5
[    4.222817] kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe00000=
00) for domain 0000 [bus 00-ff]
[    4.222820] kernel: PCI: Using configuration type 1 for base access
[    4.222824] kernel: kprobes: kprobe jump-optimization is enabled. All kp=
robes are optimized if possible.
[    4.222827] kernel: HugeTLB: allocation took 0ms with hugepage_allocatio=
n_threads=3D8
[    4.222830] kernel: HugeTLB: registered 1.00 GiB page size, pre-allocate=
d 0 pages
[    4.222833] kernel: HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 G=
iB page
[    4.222836] kernel: HugeTLB: registered 2.00 MiB page size, pre-allocate=
d 0 pages
[    4.222840] kernel: HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB =
page
[    4.222843] kernel: raid6: skipped pq benchmark and selected avx512x4
[    4.222846] kernel: raid6: using avx512x2 recovery algorithm
[    4.222849] kernel: ACPI: Added _OSI(Module Device)
[    4.222852] kernel: ACPI: Added _OSI(Processor Device)
[    4.222856] kernel: ACPI: Added _OSI(Processor Aggregator Device)
[    4.222859] kernel: ACPI: 34 ACPI AML tables successfully acquired and l=
oaded
[    4.222862] kernel: ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    4.222865] kernel: ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe=
+ XDomain+
[    4.222868] kernel: ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe=
+ XDomain+
[    4.222872] kernel: ACPI: EC: EC started
[    4.222875] kernel: ACPI: EC: interrupt blocked
[    4.222878] kernel: ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    4.222881] kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to han=
dle transactions
[    4.222884] kernel: ACPI: Interpreter enabled
[    4.222888] kernel: ACPI: PM: (supports S0 S4 S5)
[    4.222891] kernel: ACPI: Using IOAPIC for interrupt routing
[    4.222894] kernel: PCI: Using host bridge windows from ACPI; if necessa=
ry, use "pci=3Dnocrs" and report a bug
[    4.222897] kernel: PCI: Ignoring E820 reservations for host bridge wind=
ows
[    4.222901] kernel: ACPI: Enabled 6 GPEs in block 00 to 1F
[    4.222904] kernel: ACPI: \_SB_.PCI0.GP11.PWRS: New power resource
[    4.222907] kernel: ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New power resource
[    4.222910] kernel: ACPI: \_SB_.PCI0.GP12.PWRS: New power resource
[    4.222913] kernel: ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New power resource
[    4.222916] kernel: ACPI: \_SB_.PCI0.GP21.PWRS: New power resource
[    4.222919] kernel: ACPI: \_SB_.PCI0.GP22.PWRS: New power resource
[    4.222922] kernel: ACPI: \_SB_.PCI0.GP23.NCRD.WRST: New power resource
[    4.222926] kernel: ACPI: \_SB_.PCI0.GP25.P0NV: New power resource
[    4.222929] kernel: ACPI: \_SB_.PCI0.GPPA.PWRS: New power resource
[    4.222932] kernel: ACPI: \_SB_.PCI0.GPPA.GFX0.PWRS: New power resource
[    4.222935] kernel: ACPI: \_SB_.PCI0.GPPA.HDAU.PWRS: New power resource
[    4.222938] kernel: ACPI: \_SB_.PCI0.GPPA.XHC1.PWRS: New power resource
[    4.222941] kernel: ACPI: \_SB_.PCI0.GPPA.ACP_.PWRS: New power resource
[    4.222945] kernel: ACPI: \_SB_.PCI0.GPPA.HDEF.PWRS: New power resource
[    4.222948] kernel: ACPI: \_SB_.PCI0.BUSC.XHC0.PWRS: New power resource
[    4.222952] kernel: ACPI: \_SB_.PCI0.BUSC.XHC0.RHUB.HS05.DBTR: New power=
 resource
[    4.222955] kernel: ACPI: \_SB_.PCI0.BUSC.XHC3.PWRS: New power resource
[    4.222958] kernel: ACPI: \_SB_.PCI0.BUSC.XHC4.PWRS: New power resource
[    4.222961] kernel: ACPI: \_SB_.PCI0.BUSC.NHI0.PWRS: New power resource
[    4.222965] kernel: ACPI: \_SB_.PCI0.BUSC.NHI1.PWRS: New power resource
[    4.222968] kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff=
])
[    4.223054] kernel: acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig A=
SPM ClockPM Segments MSI EDR HPX-Type3]
[    4.223094] kernel: acpi PNP0A08:00: _OSC: platform does not support [SH=
PCHotplug AER]
[    4.223129] kernel: acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug =
PME PCIeCapability LTR DPC]
[    4.223163] kernel: acpi PNP0A08:00: FADT indicates ASPM is unsupported,=
 using BIOS configuration
[    4.223167] kernel: PCI host bridge to bus 0000:00
[    4.223206] kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x0cf=
7 window]
[    4.223237] kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xfff=
f window]
[    4.223267] kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0=
x000bffff window]
[    4.223297] kernel: pci_bus 0000:00: root bus resource [mem 0x000c0000-0=
x000cffff window]
[    4.223327] kernel: pci_bus 0000:00: root bus resource [mem 0x000d0000-0=
x000effff window]
[    4.223357] kernel: pci_bus 0000:00: root bus resource [mem 0x80000000-0=
xefffffff window]
[    4.223387] kernel: pci_bus 0000:00: root bus resource [mem 0xfed45000-0=
xfed814ff window]
[    4.223416] kernel: pci_bus 0000:00: root bus resource [mem 0xfed81900-0=
xfed81fff window]
[    4.223446] kernel: pci_bus 0000:00: root bus resource [mem 0xfedc0000-0=
xfedc0fff window]
[    4.223476] kernel: pci_bus 0000:00: root bus resource [mem 0xfedc6000-0=
xfedc6fff window]
[    4.223506] kernel: pci_bus 0000:00: root bus resource [mem 0xf7e0c0000-=
0x108fffffff window]
[    4.223535] kernel: pci_bus 0000:00: root bus resource [mem 0x10b0200000=
-0x8b4fffffff window]
[    4.223564] kernel: pci_bus 0000:00: root bus resource [bus 00-ff]
[    4.223605] kernel: pci 0000:00:00.0: [1022:1507] type 00 class 0x060000=
 conventional PCI endpoint
[    4.223642] kernel: pci 0000:00:00.2: [1022:1508] type 00 class 0x080600=
 conventional PCI endpoint
[    4.223678] kernel: pci 0000:00:01.0: [1022:1509] type 00 class 0x060000=
 conventional PCI endpoint
[    4.223714] kernel: pci 0000:00:01.1: [1022:150a] type 01 class 0x060400=
 PCIe Root Port
[    4.223749] kernel: pci 0000:00:01.1: PCI bridge to [bus 01-60]
[    4.223782] kernel: pci 0000:00:01.1:   bridge window [io  0x6000-0x9fff]
[    4.223816] kernel: pci 0000:00:01.1:   bridge window [mem 0xbc000000-0x=
d3ffffff]
[    4.223852] kernel: pci 0000:00:01.1:   bridge window [mem 0x3800000000-=
0x57ffffffff 64bit pref]
[    4.223885] kernel: pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    4.223920] kernel: pci 0000:00:01.2: [1022:150a] type 01 class 0x060400=
 PCIe Root Port
[    4.223954] kernel: pci 0000:00:01.2: PCI bridge to [bus 61-c0]
[    4.223987] kernel: pci 0000:00:01.2:   bridge window [io  0x2000-0x5fff]
[    4.224025] kernel: pci 0000:00:01.2:   bridge window [mem 0xa4000000-0x=
bbffffff]
[    4.224060] kernel: pci 0000:00:01.2:   bridge window [mem 0x1800000000-=
0x37ffffffff 64bit pref]
[    4.224092] kernel: pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    4.224127] kernel: pci 0000:00:02.0: [1022:1509] type 00 class 0x060000=
 conventional PCI endpoint
[    4.224162] kernel: pci 0000:00:02.3: [1022:150b] type 01 class 0x060400=
 PCIe Root Port
[    4.224197] kernel: pci 0000:00:02.3: PCI bridge to [bus c1]
[    4.224230] kernel: pci 0000:00:02.3:   bridge window [mem 0xd4000000-0x=
d42fffff]
[    4.224263] kernel: pci 0000:00:02.3: PME# supported from D0 D3hot D3cold
[    4.224298] kernel: pci 0000:00:02.5: [1022:150b] type 01 class 0x060400=
 PCIe Root Port
[    4.224332] kernel: pci 0000:00:02.5: PCI bridge to [bus c2]
[    4.224366] kernel: pci 0000:00:02.5:   bridge window [mem 0xd4900000-0x=
d49fffff]
[    4.224399] kernel: pci 0000:00:02.5: PME# supported from D0 D3hot D3cold
[    4.224433] kernel: pci 0000:00:03.0: [1022:1509] type 00 class 0x060000=
 conventional PCI endpoint
[    4.224469] kernel: pci 0000:00:08.0: [1022:1509] type 00 class 0x060000=
 conventional PCI endpoint
[    4.224503] kernel: pci 0000:00:08.1: [1022:150c] type 01 class 0x060400=
 PCIe Root Port
[    4.224537] kernel: pci 0000:00:08.1: PCI bridge to [bus c3]
[    4.224571] kernel: pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    4.224604] kernel: pci 0000:00:08.1:   bridge window [mem 0x90000000-0x=
a04fffff]
[    4.224638] kernel: pci 0000:00:08.1:   bridge window [mem 0x5800000000-=
0x59007fffff 64bit pref]
[    4.224672] kernel: pci 0000:00:08.1: enabling Extended Tags
[    4.224705] kernel: pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    4.224739] kernel: pci 0000:00:08.2: [1022:150c] type 01 class 0x060400=
 PCIe Root Port
[    4.224772] kernel: pci 0000:00:08.2: PCI bridge to [bus c4]
[    4.224805] kernel: pci 0000:00:08.2:   bridge window [mem 0xd4700000-0x=
d48fffff]
[    4.224840] kernel: pci 0000:00:08.2:   bridge window [mem 0x5900800000-=
0x59008fffff 64bit pref]
[    4.224873] kernel: pci 0000:00:08.2: enabling Extended Tags
[    4.224907] kernel: pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    4.224941] kernel: pci 0000:00:08.3: [1022:150c] type 01 class 0x060400=
 PCIe Root Port
[    4.224975] kernel: pci 0000:00:08.3: PCI bridge to [bus c5]
[    4.225012] kernel: pci 0000:00:08.3:   bridge window [mem 0xd4300000-0x=
d46fffff]
[    4.225045] kernel: pci 0000:00:08.3: enabling Extended Tags
[    4.225079] kernel: pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
[    4.225113] kernel: pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500=
 conventional PCI endpoint
[    4.225147] kernel: pci 0000:00:14.3: [1022:790e] type 00 class 0x060100=
 conventional PCI endpoint
[    4.225181] kernel: pci 0000:00:18.0: [1022:12b8] type 00 class 0x060000=
 conventional PCI endpoint
[    4.225216] kernel: pci 0000:00:18.1: [1022:12b9] type 00 class 0x060000=
 conventional PCI endpoint
[    4.225250] kernel: pci 0000:00:18.2: [1022:12ba] type 00 class 0x060000=
 conventional PCI endpoint
[    4.225286] kernel: pci 0000:00:18.3: [1022:12bb] type 00 class 0x060000=
 conventional PCI endpoint
[    4.225321] kernel: pci 0000:00:18.4: [1022:12bc] type 00 class 0x060000=
 conventional PCI endpoint
[    4.225356] kernel: pci 0000:00:18.5: [1022:12bd] type 00 class 0x060000=
 conventional PCI endpoint
[    4.225391] kernel: pci 0000:00:18.6: [1022:12be] type 00 class 0x060000=
 conventional PCI endpoint
[    4.225429] kernel: pci 0000:00:18.7: [1022:12bf] type 00 class 0x060000=
 conventional PCI endpoint
[    4.225464] kernel: pci 0000:00:01.1: PCI bridge to [bus 01-60]
[    4.225498] kernel: pci 0000:00:01.2: PCI bridge to [bus 61-c0]
[    4.225537] kernel: pci 0000:c1:00.0: [14c3:7925] type 00 class 0x028000=
 PCIe Endpoint
[    4.225572] kernel: pci 0000:c1:00.0: BAR 0 [mem 0xd4000000-0xd41fffff 6=
4bit]
[    4.225607] kernel: pci 0000:c1:00.0: BAR 2 [mem 0xd4200000-0xd4207fff 6=
4bit]
[    4.225655] kernel: pci 0000:c1:00.0: PME# supported from D0 D3hot D3cold
[    4.225689] kernel: pci 0000:00:02.3: PCI bridge to [bus c1]
[    4.225725] kernel: pci 0000:c2:00.0: [144d:a80c] type 00 class 0x010802=
 PCIe Endpoint
[    4.225760] kernel: pci 0000:c2:00.0: BAR 0 [mem 0xd4900000-0xd4903fff 6=
4bit]
[    4.225794] kernel: pci 0000:00:02.5: PCI bridge to [bus c2]
[    4.225829] kernel: pci 0000:c3:00.0: [1002:1586] type 00 class 0x038000=
 PCIe Legacy Endpoint
[    4.225863] kernel: pci 0000:c3:00.0: BAR 0 [mem 0x5800000000-0x58ffffff=
ff 64bit pref]
[    4.225897] kernel: pci 0000:c3:00.0: BAR 2 [mem 0x90000000-0x9fffffff 6=
4bit pref]
[    4.225931] kernel: pci 0000:c3:00.0: BAR 4 [io  0x1000-0x10ff]
[    4.225966] kernel: pci 0000:c3:00.0: BAR 5 [mem 0xa0300000-0xa03fffff]
[    4.226001] kernel: pci 0000:c3:00.0: enabling Extended Tags
[    4.226038] kernel: pci 0000:c3:00.0: PME# supported from D1 D2 D3hot D3=
cold
[    4.226073] kernel: pci 0000:c3:00.1: [1002:1640] type 00 class 0x040300=
 PCIe Legacy Endpoint
[    4.226107] kernel: pci 0000:c3:00.1: BAR 0 [mem 0xa0448000-0xa044bfff]
[    4.226140] kernel: pci 0000:c3:00.1: enabling Extended Tags
[    4.226173] kernel: pci 0000:c3:00.1: PME# supported from D1 D2 D3hot D3=
cold
[    4.226209] kernel: pci 0000:c3:00.2: [1022:17e0] type 00 class 0x108000=
 PCIe Endpoint
[    4.226243] kernel: pci 0000:c3:00.2: BAR 2 [mem 0xa0200000-0xa02fffff]
[    4.226278] kernel: pci 0000:c3:00.2: BAR 5 [mem 0xa044e000-0xa044ffff]
[    4.226312] kernel: pci 0000:c3:00.2: enabling Extended Tags
[    4.226348] kernel: pci 0000:c3:00.4: [1022:1587] type 00 class 0x0c0330=
 PCIe Endpoint
[    4.226382] kernel: pci 0000:c3:00.4: BAR 0 [mem 0xa0000000-0xa00fffff 6=
4bit]
[    4.226416] kernel: pci 0000:c3:00.4: enabling Extended Tags
[    4.226450] kernel: pci 0000:c3:00.4: PME# supported from D0 D3hot D3cold
[    4.226485] kernel: pci 0000:c3:00.5: [1022:15e2] type 00 class 0x048000=
 PCIe Endpoint
[    4.226520] kernel: pci 0000:c3:00.5: BAR 0 [mem 0xa0400000-0xa043ffff]
[    4.226554] kernel: pci 0000:c3:00.5: BAR 2 [mem 0x5900000000-0x59007fff=
ff 64bit pref]
[    4.226587] kernel: pci 0000:c3:00.5: enabling Extended Tags
[    4.226621] kernel: pci 0000:c3:00.5: PME# supported from D0 D3hot D3cold
[    4.226655] kernel: pci 0000:c3:00.6: [1022:15e3] type 00 class 0x040300=
 PCIe Endpoint
[    4.226689] kernel: pci 0000:c3:00.6: BAR 0 [mem 0xa0440000-0xa0447fff]
[    4.226723] kernel: pci 0000:c3:00.6: enabling Extended Tags
[    4.226756] kernel: pci 0000:c3:00.6: PME# supported from D0 D3hot D3cold
[    4.226792] kernel: pci 0000:c3:00.7: [1022:164a] type 00 class 0x118000=
 PCIe Endpoint
[    4.226826] kernel: pci 0000:c3:00.7: BAR 2 [mem 0xa0100000-0xa01fffff]
[    4.226859] kernel: pci 0000:c3:00.7: BAR 5 [mem 0xa044c000-0xa044dfff]
[    4.226893] kernel: pci 0000:c3:00.7: enabling Extended Tags
[    4.226925] kernel: pci 0000:00:08.1: PCI bridge to [bus c3]
[    4.226960] kernel: pci 0000:c4:00.0: [1022:150d] type 00 class 0x130000=
 PCIe Endpoint
[    4.226995] kernel: pci 0000:c4:00.0: enabling Extended Tags
[    4.227041] kernel: pci 0000:c4:00.1: [1022:17f0] type 00 class 0x118000=
 PCIe Endpoint
[    4.227077] kernel: pci 0000:c4:00.1: BAR 0 [mem 0xd4700000-0xd47fffff]
[    4.227110] kernel: pci 0000:c4:00.1: BAR 1 [mem 0xd4800000-0xd4801fff]
[    4.227143] kernel: pci 0000:c4:00.1: BAR 2 [mem 0x5900800000-0x590087ff=
ff 64bit pref]
[    4.227177] kernel: pci 0000:c4:00.1: BAR 4 [mem 0xd4803000-0xd4803fff]
[    4.227210] kernel: pci 0000:c4:00.1: BAR 5 [mem 0xd4802000-0xd4802fff]
[    4.227244] kernel: pci 0000:c4:00.1: enabling Extended Tags
[    4.227277] kernel: pci 0000:00:08.2: PCI bridge to [bus c4]
[    4.227312] kernel: pci 0000:c5:00.0: [1022:1588] type 00 class 0x0c0330=
 PCIe Endpoint
[    4.227347] kernel: pci 0000:c5:00.0: BAR 0 [mem 0xd4300000-0xd43fffff 6=
4bit]
[    4.227382] kernel: pci 0000:c5:00.0: enabling Extended Tags
[    4.227417] kernel: pci 0000:c5:00.0: PME# supported from D0 D3hot D3cold
[    4.227452] kernel: pci 0000:c5:00.3: [1022:1589] type 00 class 0x0c0330=
 PCIe Endpoint
[    4.227486] kernel: pci 0000:c5:00.3: BAR 0 [mem 0xd4400000-0xd44fffff 6=
4bit]
[    4.227520] kernel: pci 0000:c5:00.3: enabling Extended Tags
[    4.227555] kernel: pci 0000:c5:00.3: PME# supported from D0 D3hot D3cold
[    4.227591] kernel: pci 0000:c5:00.4: [1022:158b] type 00 class 0x0c0330=
 PCIe Endpoint
[    4.227627] kernel: pci 0000:c5:00.4: BAR 0 [mem 0xd4500000-0xd45fffff 6=
4bit]
[    4.227660] kernel: pci 0000:c5:00.4: enabling Extended Tags
[    4.227695] kernel: pci 0000:c5:00.4: PME# supported from D0 D3hot D3cold
[    4.227732] kernel: pci 0000:c5:00.5: [1022:158d] type 00 class 0x0c0340=
 PCIe Endpoint
[    4.227766] kernel: pci 0000:c5:00.5: BAR 0 [mem 0xd4600000-0xd467ffff 6=
4bit]
[    4.227801] kernel: pci 0000:c5:00.5: Max Payload Size set to 128 (was 2=
56, max 256)
[    4.227835] kernel: pci 0000:c5:00.5: enabling Extended Tags
[    4.227869] kernel: pci 0000:c5:00.5: PME# supported from D0 D3hot D3cold
[    4.227906] kernel: pci 0000:c5:00.6: [1022:158e] type 00 class 0x0c0340=
 PCIe Endpoint
[    4.227942] kernel: pci 0000:c5:00.6: BAR 0 [mem 0xd4680000-0xd46fffff 6=
4bit]
[    4.227976] kernel: pci 0000:c5:00.6: Max Payload Size set to 128 (was 2=
56, max 256)
[    4.228014] kernel: pci 0000:c5:00.6: enabling Extended Tags
[    4.228049] kernel: pci 0000:c5:00.6: PME# supported from D0 D3hot D3cold
[    4.228083] kernel: pci 0000:00:08.3: PCI bridge to [bus c5]
[    4.228087] kernel: Low-power S0 idle used by default for system suspend
[    4.228091] kernel: ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    4.228095] kernel: ACPI: PCI: Interrupt link LNKA disabled
[    4.228099] kernel: ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    4.228102] kernel: ACPI: PCI: Interrupt link LNKB disabled
[    4.228106] kernel: ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    4.228110] kernel: ACPI: PCI: Interrupt link LNKC disabled
[    4.228113] kernel: ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    4.228117] kernel: ACPI: PCI: Interrupt link LNKD disabled
[    4.228120] kernel: ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    4.228124] kernel: ACPI: PCI: Interrupt link LNKE disabled
[    4.228127] kernel: ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    4.228131] kernel: ACPI: PCI: Interrupt link LNKF disabled
[    4.228133] kernel: ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    4.228137] kernel: ACPI: PCI: Interrupt link LNKG disabled
[    4.228140] kernel: ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    4.228143] kernel: ACPI: PCI: Interrupt link LNKH disabled
[    4.228147] kernel: ACPI: EC: interrupt unblocked
[    4.228151] kernel: ACPI: EC: event unblocked
[    4.228154] kernel: ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    4.228158] kernel: ACPI: EC: GPE=3D0x3
[    4.228162] kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initializat=
ion complete
[    4.228165] kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle trans=
actions and events
[    4.228169] kernel: iommu: Default domain type: Translated
[    4.228172] kernel: iommu: DMA domain TLB invalidation policy: lazy mode
[    4.228178] kernel: SCSI subsystem initialized
[    4.228182] kernel: libata version 3.00 loaded.
[    4.228185] kernel: ACPI: bus type USB registered
[    4.228188] kernel: usbcore: registered new interface driver usbfs
[    4.228192] kernel: usbcore: registered new interface driver hub
[    4.228195] kernel: usbcore: registered new device driver usb
[    4.228198] kernel: EDAC MC: Ver: 3.0.0
[    4.228202] kernel: efivars: Registered efivars operations
[    4.228205] kernel: NetLabel: Initializing
[    4.228209] kernel: NetLabel:  domain hash size =3D 128
[    4.228212] kernel: NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    4.228215] kernel: NetLabel:  unlabeled traffic allowed by default
[    4.228219] kernel: mctp: management component transport protocol core
[    4.228222] kernel: NET: Registered PF_MCTP protocol family
[    4.228226] kernel: PCI: Using ACPI for IRQ routing
[    4.228230] kernel: PCI: pci_cache_line_size set to 64 bytes
[    4.228233] kernel: e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    4.228237] kernel: e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
[    4.228240] kernel: e820: reserve RAM buffer [mem 0x37bee000-0x37ffffff]
[    4.228244] kernel: e820: reserve RAM buffer [mem 0x44bd0000-0x47ffffff]
[    4.228247] kernel: e820: reserve RAM buffer [mem 0x52bd2000-0x53ffffff]
[    4.228250] kernel: e820: reserve RAM buffer [mem 0x52bdc000-0x53ffffff]
[    4.228253] kernel: e820: reserve RAM buffer [mem 0x5d134000-0x5fffffff]
[    4.228257] kernel: e820: reserve RAM buffer [mem 0xf7e0c0000-0xf7ffffff=
f]
[    4.228261] kernel: vgaarb: loaded
[    4.228264] kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    4.228267] kernel: hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    4.228270] kernel: clocksource: Switched to clocksource tsc-early
[    4.228274] kernel: VFS: Disk quotas dquot_6.6.0
[    4.228278] kernel: VFS: Dquot-cache hash table entries: 512 (order 0, 4=
096 bytes)
[    4.228281] kernel: pnp: PnP ACPI init
[    4.228317] kernel: system 00:01: [io  0x0400-0x04cf] has been reserved
[    4.228350] kernel: system 00:01: [io  0x04d0-0x04d1] has been reserved
[    4.228382] kernel: system 00:01: [io  0x04d6] has been reserved
[    4.228413] kernel: system 00:01: [io  0x0680-0x06ff] has been reserved
[    4.228445] kernel: system 00:01: [io  0x077a] has been reserved
[    4.228475] kernel: system 00:01: [io  0x0c00-0x0c01] has been reserved
[    4.228507] kernel: system 00:01: [io  0x0c14] has been reserved
[    4.228538] kernel: system 00:01: [io  0x0c50-0x0c52] has been reserved
[    4.228568] kernel: system 00:01: [io  0x0c6c] has been reserved
[    4.228599] kernel: system 00:01: [io  0x0c6f] has been reserved
[    4.228629] kernel: system 00:01: [io  0x0cd0-0x0cdb] has been reserved
[    4.228660] kernel: system 00:01: [io  0x0840-0x0847] has been reserved
[    4.228692] kernel: system 00:02: [mem 0x000e0000-0x000fffff] could not =
be reserved
[    4.228725] kernel: system 00:04: [io  0x0600-0x067f] has been reserved
[    4.228756] kernel: system 00:04: [mem 0xfedf1000-0xfedf1fff] has been r=
eserved
[    4.228788] kernel: system 00:05: [mem 0xfec00000-0xfec00fff] could not =
be reserved
[    4.228819] kernel: system 00:05: [mem 0xfee00000-0xfee00fff] has been r=
eserved
[    4.228850] kernel: system 00:05: [mem 0xfec20000-0xfec20fff] has been r=
eserved
[    4.228883] kernel: system 00:06: [mem 0xfed40000-0xfed44fff] has been r=
eserved
[    4.228887] kernel: pnp: PnP ACPI: found 7 devices
[    4.228891] kernel: clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xf=
fffff, max_idle_ns: 2085701024 ns
[    4.228894] kernel: NET: Registered PF_INET protocol family
[    4.228898] kernel: IP idents hash table entries: 262144 (order: 9, 2097=
152 bytes, linear)
[    4.228901] kernel: tcp_listen_portaddr_hash hash table entries: 32768 (=
order: 7, 524288 bytes, linear)
[    4.228904] kernel: Table-perturb hash table entries: 65536 (order: 6, 2=
62144 bytes, linear)
[    4.228908] kernel: TCP established hash table entries: 524288 (order: 1=
0, 4194304 bytes, linear)
[    4.228912] kernel: TCP bind hash table entries: 65536 (order: 9, 209715=
2 bytes, linear)
[    4.228915] kernel: TCP: Hash tables configured (established 524288 bind=
 65536)
[    4.228918] kernel: MPTCP token hash table entries: 65536 (order: 8, 157=
2864 bytes, linear)
[    4.228922] kernel: UDP hash table entries: 32768 (order: 9, 2097152 byt=
es, linear)
[    4.228925] kernel: UDP-Lite hash table entries: 32768 (order: 9, 209715=
2 bytes, linear)
[    4.228929] kernel: NET: Registered PF_UNIX/PF_LOCAL protocol family
[    4.228933] kernel: NET: Registered PF_XDP protocol family
[    4.228966] kernel: pci 0000:00:01.1: PCI bridge to [bus 01-60]
[    4.229001] kernel: pci 0000:00:01.1:   bridge window [io  0x6000-0x9fff]
[    4.229037] kernel: pci 0000:00:01.1:   bridge window [mem 0xbc000000-0x=
d3ffffff]
[    4.229070] kernel: pci 0000:00:01.1:   bridge window [mem 0x3800000000-=
0x57ffffffff 64bit pref]
[    4.229104] kernel: pci 0000:00:01.2: PCI bridge to [bus 61-c0]
[    4.229136] kernel: pci 0000:00:01.2:   bridge window [io  0x2000-0x5fff]
[    4.229171] kernel: pci 0000:00:01.2:   bridge window [mem 0xa4000000-0x=
bbffffff]
[    4.229204] kernel: pci 0000:00:01.2:   bridge window [mem 0x1800000000-=
0x37ffffffff 64bit pref]
[    4.229237] kernel: pci 0000:00:02.3: PCI bridge to [bus c1]
[    4.229269] kernel: pci 0000:00:02.3:   bridge window [mem 0xd4000000-0x=
d42fffff]
[    4.229302] kernel: pci 0000:00:02.5: PCI bridge to [bus c2]
[    4.229335] kernel: pci 0000:00:02.5:   bridge window [mem 0xd4900000-0x=
d49fffff]
[    4.229369] kernel: pci 0000:00:08.1: PCI bridge to [bus c3]
[    4.229402] kernel: pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    4.229435] kernel: pci 0000:00:08.1:   bridge window [mem 0x90000000-0x=
a04fffff]
[    4.229468] kernel: pci 0000:00:08.1:   bridge window [mem 0x5800000000-=
0x59007fffff 64bit pref]
[    4.229502] kernel: pci 0000:00:08.2: PCI bridge to [bus c4]
[    4.229535] kernel: pci 0000:00:08.2:   bridge window [mem 0xd4700000-0x=
d48fffff]
[    4.229567] kernel: pci 0000:00:08.2:   bridge window [mem 0x5900800000-=
0x59008fffff 64bit pref]
[    4.229600] kernel: pci 0000:00:08.3: PCI bridge to [bus c5]
[    4.229633] kernel: pci 0000:00:08.3:   bridge window [mem 0xd4300000-0x=
d46fffff]
[    4.229665] kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 windo=
w]
[    4.229696] kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xffff windo=
w]
[    4.229726] kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bff=
ff window]
[    4.229755] kernel: pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000cff=
ff window]
[    4.229784] kernel: pci_bus 0000:00: resource 8 [mem 0x000d0000-0x000eff=
ff window]
[    4.229814] kernel: pci_bus 0000:00: resource 9 [mem 0x80000000-0xefffff=
ff window]
[    4.229843] kernel: pci_bus 0000:00: resource 10 [mem 0xfed45000-0xfed81=
4ff window]
[    4.229873] kernel: pci_bus 0000:00: resource 11 [mem 0xfed81900-0xfed81=
fff window]
[    4.229901] kernel: pci_bus 0000:00: resource 12 [mem 0xfedc0000-0xfedc0=
fff window]
[    4.229931] kernel: pci_bus 0000:00: resource 13 [mem 0xfedc6000-0xfedc6=
fff window]
[    4.229960] kernel: pci_bus 0000:00: resource 14 [mem 0xf7e0c0000-0x108f=
ffffff window]
[    4.229989] kernel: pci_bus 0000:00: resource 15 [mem 0x10b0200000-0x8b4=
fffffff window]
[    4.230071] kernel: pci_bus 0000:01: resource 0 [io  0x6000-0x9fff]
[    4.230102] kernel: pci_bus 0000:01: resource 1 [mem 0xbc000000-0xd3ffff=
ff]
[    4.230134] kernel: pci_bus 0000:01: resource 2 [mem 0x3800000000-0x57ff=
ffffff 64bit pref]
[    4.230169] kernel: pci_bus 0000:61: resource 0 [io  0x2000-0x5fff]
[    4.230200] kernel: pci_bus 0000:61: resource 1 [mem 0xa4000000-0xbbffff=
ff]
[    4.230230] kernel: pci_bus 0000:61: resource 2 [mem 0x1800000000-0x37ff=
ffffff 64bit pref]
[    4.230265] kernel: pci_bus 0000:c1: resource 1 [mem 0xd4000000-0xd42fff=
ff]
[    4.230301] kernel: pci_bus 0000:c2: resource 1 [mem 0xd4900000-0xd49fff=
ff]
[    4.230338] kernel: pci_bus 0000:c3: resource 0 [io  0x1000-0x1fff]
[    4.230369] kernel: pci_bus 0000:c3: resource 1 [mem 0x90000000-0xa04fff=
ff]
[    4.230401] kernel: pci_bus 0000:c3: resource 2 [mem 0x5800000000-0x5900=
7fffff 64bit pref]
[    4.230437] kernel: pci_bus 0000:c4: resource 1 [mem 0xd4700000-0xd48fff=
ff]
[    4.230467] kernel: pci_bus 0000:c4: resource 2 [mem 0x5900800000-0x5900=
8fffff 64bit pref]
[    4.230503] kernel: pci_bus 0000:c5: resource 1 [mem 0xd4300000-0xd46fff=
ff]
[    4.230538] kernel: pci 0000:c3:00.1: D0 power state depends on 0000:c3:=
00.0
[    4.230574] kernel: pci 0000:c3:00.4: enabling device (0000 -> 0002)
[    4.230609] kernel: pci 0000:c5:00.0: enabling device (0000 -> 0002)
[    4.230643] kernel: pci 0000:c5:00.3: enabling device (0000 -> 0002)
[    4.230677] kernel: pci 0000:c5:00.4: enabling device (0000 -> 0002)
[    4.230682] kernel: PCI: CLS 0 bytes, default 64
[    4.230715] kernel: pci 0000:00:00.2: AMD-Vi: IOMMU performance counters=
 supported
[    4.230719] kernel: Trying to unpack rootfs image as initramfs...
[    4.230753] kernel: pci 0000:00:00.0: Adding to iommu group 0
[    4.230787] kernel: pci 0000:00:01.0: Adding to iommu group 1
[    4.230822] kernel: pci 0000:00:01.1: Adding to iommu group 2
[    4.230854] kernel: pci 0000:00:01.2: Adding to iommu group 3
[    4.230887] kernel: pci 0000:00:02.0: Adding to iommu group 4
[    4.230920] kernel: pci 0000:00:02.3: Adding to iommu group 5
[    4.230953] kernel: pci 0000:00:02.5: Adding to iommu group 6
[    4.230986] kernel: pci 0000:00:03.0: Adding to iommu group 7
[    4.231022] kernel: pci 0000:00:08.0: Adding to iommu group 8
[    4.231056] kernel: pci 0000:00:08.1: Adding to iommu group 9
[    4.231090] kernel: pci 0000:00:08.2: Adding to iommu group 10
[    4.231123] kernel: pci 0000:00:08.3: Adding to iommu group 11
[    4.231156] kernel: pci 0000:00:14.0: Adding to iommu group 12
[    4.231189] kernel: pci 0000:00:14.3: Adding to iommu group 12
[    4.231222] kernel: pci 0000:00:18.0: Adding to iommu group 13
[    4.231255] kernel: pci 0000:00:18.1: Adding to iommu group 13
[    4.231288] kernel: pci 0000:00:18.2: Adding to iommu group 13
[    4.231321] kernel: pci 0000:00:18.3: Adding to iommu group 13
[    4.231355] kernel: pci 0000:00:18.4: Adding to iommu group 13
[    4.231388] kernel: pci 0000:00:18.5: Adding to iommu group 13
[    4.231422] kernel: pci 0000:00:18.6: Adding to iommu group 13
[    4.231455] kernel: pci 0000:00:18.7: Adding to iommu group 13
[    4.231488] kernel: pci 0000:c1:00.0: Adding to iommu group 14
[    4.231523] kernel: pci 0000:c2:00.0: Adding to iommu group 15
[    4.231556] kernel: pci 0000:c3:00.0: Adding to iommu group 16
[    4.231591] kernel: pci 0000:c3:00.1: Adding to iommu group 17
[    4.231625] kernel: pci 0000:c3:00.2: Adding to iommu group 18
[    4.231660] kernel: pci 0000:c3:00.4: Adding to iommu group 19
[    4.231694] kernel: pci 0000:c3:00.5: Adding to iommu group 20
[    4.231728] kernel: pci 0000:c3:00.6: Adding to iommu group 21
[    4.231763] kernel: pci 0000:c3:00.7: Adding to iommu group 22
[    4.231797] kernel: pci 0000:c4:00.0: Adding to iommu group 23
[    4.231831] kernel: pci 0000:c4:00.1: Adding to iommu group 24
[    4.231865] kernel: pci 0000:c5:00.0: Adding to iommu group 25
[    4.231900] kernel: pci 0000:c5:00.3: Adding to iommu group 26
[    4.231934] kernel: pci 0000:c5:00.4: Adding to iommu group 27
[    4.231967] kernel: pci 0000:c5:00.5: Adding to iommu group 28
[    4.232002] kernel: pci 0000:c5:00.6: Adding to iommu group 29
[    4.232008] kernel: AMD-Vi: Extended features (0x246577efa2254afa, 0x10)=
: PPR NX GT [5] IA GA PC GA_vAPIC
[    4.232014] kernel: AMD-Vi: Interrupt remapping enabled
[    4.232019] kernel: AMD-Vi: Virtual APIC enabled
[    4.232024] kernel: PCI-DMA: Using software bounce buffering for IO (SWI=
OTLB)
[    4.232029] kernel: software IO TLB: mapped [mem 0x0000000074000000-0x00=
00000078000000] (64MB)
[    4.232034] kernel: LVT offset 0 assigned for vector 0x400
[    4.232038] kernel: perf: AMD IBS detected (0x00081bff)
[    4.232042] kernel: perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 co=
unters/bank).
[    4.232046] kernel: Initialise system trusted keyrings
[    4.232050] kernel: Key type blacklist registered
[    4.232054] kernel: workingset: timestamp_bits=3D36 max_order=3D24 bucke=
t_order=3D0
[    4.232057] kernel: fuse: init (API version 7.44)
[    4.232061] kernel: integrity: Platform Keyring initialized
[    4.232065] kernel: integrity: Machine keyring initialized
[    4.232068] kernel: xor: automatically using best checksumming function =
  avx      =20
[    4.232072] kernel: Key type asymmetric registered
[    4.232076] kernel: Asymmetric key parser 'x509' registered
[    4.232079] kernel: Block layer SCSI generic (bsg) driver version 0.4 lo=
aded (major 246)
[    4.232083] kernel: io scheduler mq-deadline registered
[    4.232086] kernel: io scheduler kyber registered
[    4.232090] kernel: io scheduler bfq registered
[    4.232094] kernel: Freeing initrd memory: 67500K
[    4.232097] kernel: ledtrig-cpu: registered to indicate activity on CPUs
[    4.232129] kernel: pcieport 0000:00:01.1: PME: Signaling with IRQ 32
[    4.232163] kernel: pcieport 0000:00:01.1: pciehp: Slot #0 AttnBtn- PwrC=
trl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis=
- LLActRep+
[    4.232198] kernel: pcieport 0000:00:01.2: PME: Signaling with IRQ 33
[    4.232231] kernel: pcieport 0000:00:01.2: pciehp: Slot #0 AttnBtn- PwrC=
trl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis=
- LLActRep+
[    4.232264] kernel: pcieport 0000:00:02.3: PME: Signaling with IRQ 34
[    4.232298] kernel: pcieport 0000:00:02.5: PME: Signaling with IRQ 35
[    4.232331] kernel: pcieport 0000:00:08.1: PME: Signaling with IRQ 36
[    4.232363] kernel: pcieport 0000:00:08.2: PME: Signaling with IRQ 37
[    4.232396] kernel: pcieport 0000:00:08.3: PME: Signaling with IRQ 38
[    4.232400] kernel: ACPI: AC: AC Adapter [AC] (off-line)
[    4.232403] kernel: input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS=
:00/PNP0C0C:00/input/input0
[    4.232407] kernel: ACPI: button: Power Button [PWRB]
[    4.232410] kernel: input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS=
:00/PNP0C0E:00/input/input1
[    4.232414] kernel: ACPI: button: Sleep Button [SLPB]
[    4.232418] kernel: input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:0=
0/PNP0C0D:00/input/input2
[    4.232421] kernel: ACPI: button: Lid Switch [LID]
[    4.232424] kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN=
:00/input/input3
[    4.232428] kernel: ACPI: button: Power Button [PWRF]
[    4.232431] kernel: Monitor-Mwait will be used to enter C-1 state
[    4.232435] kernel: Estimated ratio of average max frequency by base fre=
quency (times 1024): 1397
[    4.232471] kernel: thermal LNXTHERM:00: registered as thermal_zone0
[    4.232477] kernel: ACPI: thermal: Thermal Zone [CPUZ] (49 C)
[    4.232512] kernel: thermal LNXTHERM:01: registered as thermal_zone1
[    4.232517] kernel: ACPI: thermal: Thermal Zone [GFXZ] (25 C)
[    4.232551] kernel: thermal LNXTHERM:02: registered as thermal_zone2
[    4.232556] kernel: ACPI: thermal: Thermal Zone [EXTZ] (0 C)
[    4.232591] kernel: thermal LNXTHERM:03: registered as thermal_zone3
[    4.232596] kernel: ACPI: thermal: Thermal Zone [LOCZ] (47 C)
[    4.232630] kernel: thermal LNXTHERM:04: registered as thermal_zone4
[    4.232636] kernel: ACPI: thermal: Thermal Zone [BATZ] (30 C)
[    4.232670] kernel: thermal LNXTHERM:05: registered as thermal_zone5
[    4.232675] kernel: ACPI: thermal: Thermal Zone [CHGZ] (45 C)
[    4.232709] kernel: thermal LNXTHERM:06: registered as thermal_zone6
[    4.232714] kernel: ACPI: thermal: Thermal Zone [MSHZ] (30 C)
[    4.232717] kernel: Serial: 8250/16550 driver, 32 ports, IRQ sharing ena=
bled
[    4.232721] kernel: Non-volatile memory driver v1.3
[    4.232724] kernel: Linux agpgart interface v0.103
[    4.232728] kernel: ACPI: bus type drm_connector registered
[    4.232762] kernel: xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    4.232798] kernel: xhci_hcd 0000:c3:00.4: new USB bus registered, assig=
ned bus number 1
[    4.232832] kernel: xhci_hcd 0000:c3:00.4: hcc params 0x0118ffc5 hci ver=
sion 0x120 quirks 0x0000000200000010
[    4.232866] kernel: xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    4.232900] kernel: xhci_hcd 0000:c3:00.4: new USB bus registered, assig=
ned bus number 2
[    4.232935] kernel: xhci_hcd 0000:c3:00.4: Host supports USB 3.1 Enhance=
d SuperSpeed
[    4.232972] kernel: usb usb1: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0002, bcdDevice=3D 6.16
[    4.233004] kernel: usb usb1: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1
[    4.233032] kernel: usb usb1: Product: xHCI Host Controller
[    4.233059] kernel: usb usb1: Manufacturer: Linux 6.16.0-00020-g541e951a=
4e8a xhci-hcd
[    4.233086] kernel: usb usb1: SerialNumber: 0000:c3:00.4
[    4.233130] kernel: hub 1-0:1.0: USB hub found
[    4.233173] kernel: hub 1-0:1.0: 1 port detected
[    4.233214] kernel: usb usb2: We don't know the algorithms for LPM for t=
his host, disabling LPM.
[    4.233245] kernel: usb usb2: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0003, bcdDevice=3D 6.16
[    4.233272] kernel: usb usb2: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1
[    4.233299] kernel: usb usb2: Product: xHCI Host Controller
[    4.233324] kernel: usb usb2: Manufacturer: Linux 6.16.0-00020-g541e951a=
4e8a xhci-hcd
[    4.233350] kernel: usb usb2: SerialNumber: 0000:c3:00.4
[    4.233389] kernel: hub 2-0:1.0: USB hub found
[    4.233426] kernel: hub 2-0:1.0: 1 port detected
[    4.233462] kernel: xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    4.233496] kernel: xhci_hcd 0000:c5:00.0: new USB bus registered, assig=
ned bus number 3
[    4.233530] kernel: xhci_hcd 0000:c5:00.0: hcc params 0x0128ffc5 hci ver=
sion 0x120 quirks 0x0000000200000010
[    4.233564] kernel: xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    4.233598] kernel: xhci_hcd 0000:c5:00.0: new USB bus registered, assig=
ned bus number 4
[    4.233633] kernel: xhci_hcd 0000:c5:00.0: Host supports USB 3.1 Enhance=
d SuperSpeed
[    4.233663] kernel: usb usb3: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0002, bcdDevice=3D 6.16
[    4.233690] kernel: usb usb3: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1
[    4.233718] kernel: usb usb3: Product: xHCI Host Controller
[    4.233743] kernel: usb usb3: Manufacturer: Linux 6.16.0-00020-g541e951a=
4e8a xhci-hcd
[    4.233770] kernel: usb usb3: SerialNumber: 0000:c5:00.0
[    4.233808] kernel: hub 3-0:1.0: USB hub found
[    4.233845] kernel: hub 3-0:1.0: 5 ports detected
[    4.233885] kernel: usb usb4: We don't know the algorithms for LPM for t=
his host, disabling LPM.
[    4.233914] kernel: usb usb4: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0003, bcdDevice=3D 6.16
[    4.233942] kernel: usb usb4: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1
[    4.233968] kernel: usb usb4: Product: xHCI Host Controller
[    4.233995] kernel: usb usb4: Manufacturer: Linux 6.16.0-00020-g541e951a=
4e8a xhci-hcd
[    4.234026] kernel: usb usb4: SerialNumber: 0000:c5:00.0
[    4.234066] kernel: hub 4-0:1.0: USB hub found
[    4.234104] kernel: hub 4-0:1.0: 2 ports detected
[    4.234139] kernel: xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    4.234175] kernel: xhci_hcd 0000:c5:00.3: new USB bus registered, assig=
ned bus number 5
[    4.234209] kernel: xhci_hcd 0000:c5:00.3: hcc params 0x0118ffc5 hci ver=
sion 0x120 quirks 0x0000000200000010
[    4.234245] kernel: xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    4.234279] kernel: xhci_hcd 0000:c5:00.3: new USB bus registered, assig=
ned bus number 6
[    4.234313] kernel: xhci_hcd 0000:c5:00.3: Host supports USB 3.1 Enhance=
d SuperSpeed
[    4.234344] kernel: usb usb5: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0002, bcdDevice=3D 6.16
[    4.234372] kernel: usb usb5: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1
[    4.234399] kernel: usb usb5: Product: xHCI Host Controller
[    4.234426] kernel: usb usb5: Manufacturer: Linux 6.16.0-00020-g541e951a=
4e8a xhci-hcd
[    4.234452] kernel: usb usb5: SerialNumber: 0000:c5:00.3
[    4.234491] kernel: hub 5-0:1.0: USB hub found
[    4.234528] kernel: hub 5-0:1.0: 1 port detected
[    4.234569] kernel: usb usb6: We don't know the algorithms for LPM for t=
his host, disabling LPM.
[    4.234598] kernel: usb usb6: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0003, bcdDevice=3D 6.16
[    4.234626] kernel: usb usb6: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1
[    4.234653] kernel: usb usb6: Product: xHCI Host Controller
[    4.234679] kernel: usb usb6: Manufacturer: Linux 6.16.0-00020-g541e951a=
4e8a xhci-hcd
[    4.234705] kernel: usb usb6: SerialNumber: 0000:c5:00.3
[    4.234744] kernel: hub 6-0:1.0: USB hub found
[    4.234780] kernel: hub 6-0:1.0: 1 port detected
[    4.234815] kernel: xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    4.234849] kernel: xhci_hcd 0000:c5:00.4: new USB bus registered, assig=
ned bus number 7
[    4.234884] kernel: xhci_hcd 0000:c5:00.4: hcc params 0x0118ffc5 hci ver=
sion 0x120 quirks 0x0000000200000010
[    4.234919] kernel: xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    4.234953] kernel: xhci_hcd 0000:c5:00.4: new USB bus registered, assig=
ned bus number 8
[    4.234989] kernel: xhci_hcd 0000:c5:00.4: Host supports USB 3.1 Enhance=
d SuperSpeed
[    4.235023] kernel: usb usb7: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0002, bcdDevice=3D 6.16
[    4.235052] kernel: usb usb7: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1
[    4.235079] kernel: usb usb7: Product: xHCI Host Controller
[    4.235105] kernel: usb usb7: Manufacturer: Linux 6.16.0-00020-g541e951a=
4e8a xhci-hcd
[    4.235132] kernel: usb usb7: SerialNumber: 0000:c5:00.4
[    4.235170] kernel: hub 7-0:1.0: USB hub found
[    4.235208] kernel: hub 7-0:1.0: 1 port detected
[    4.235247] kernel: usb usb8: We don't know the algorithms for LPM for t=
his host, disabling LPM.
[    4.235276] kernel: usb usb8: New USB device found, idVendor=3D1d6b, idP=
roduct=3D0003, bcdDevice=3D 6.16
[    4.235303] kernel: usb usb8: New USB device strings: Mfr=3D3, Product=
=3D2, SerialNumber=3D1
[    4.235328] kernel: usb usb8: Product: xHCI Host Controller
[    4.235354] kernel: usb usb8: Manufacturer: Linux 6.16.0-00020-g541e951a=
4e8a xhci-hcd
[    4.235380] kernel: usb usb8: SerialNumber: 0000:c5:00.4
[    4.235419] kernel: hub 8-0:1.0: USB hub found
[    4.235458] kernel: hub 8-0:1.0: 1 port detected
[    4.235462] kernel: usbcore: registered new interface driver usbserial_g=
eneric
[    4.235466] kernel: usbserial: USB Serial support registered for generic
[    4.235469] kernel: i8042: PNP: PS/2 Controller [PNP0303:KBC0] at 0x60,0=
x64 irq 1
[    4.235473] kernel: i8042: PNP: PS/2 appears to have AUX port disabled, =
if this is incorrect please boot with i8042.nopnp
[    4.235477] kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
[    4.235510] kernel: rtc_cmos 00:00: RTC can wake from S4
[    4.235542] kernel: rtc_cmos 00:00: registered as rtc0
[    4.235573] kernel: rtc_cmos 00:00: setting system clock to 2025-07-29T0=
6:54:06 UTC (1753772046)
[    4.235604] kernel: rtc_cmos 00:00: alarms up to one month, y3k, 114 byt=
es nvram
[    4.235608] kernel: ACPI: battery: Slot [BAT0] (battery present)
[    4.235650] kernel: simple-framebuffer simple-framebuffer.0: [drm] Regis=
tered 1 planes with drm panic
[    4.235655] kernel: [drm] Initialized simpledrm 1.0.0 for simple-framebu=
ffer.0 on minor 0
[    4.235659] kernel: fbcon: Deferring console take-over
[    4.235693] kernel: simple-framebuffer simple-framebuffer.0: [drm] fb0: =
simpledrmdrmfb frame buffer device
[    4.235698] kernel: pstore: Using crash dump compression: deflate
[    4.235702] kernel: pstore: Registered efi_pstore as persistent store ba=
ckend
[    4.235706] kernel: hid: raw HID events driver (C) Jiri Kosina
[    4.235710] kernel: usbcore: registered new interface driver usbhid
[    4.235713] kernel: usbhid: USB HID core driver
[    4.235717] kernel: drop_monitor: Initializing network drop monitor serv=
ice
[    4.235720] kernel: NET: Registered PF_INET6 protocol family
[    4.235724] kernel: Segment Routing with IPv6
[    4.235728] kernel: RPL Segment Routing with IPv6
[    4.235731] kernel: In-situ OAM (IOAM) with IPv6
[    4.235735] kernel: NET: Registered PF_PACKET protocol family
[    4.235738] kernel: x86/amd: Previous system reset reason [0x00180800]: =
software wrote 0x6 to reset control register 0xCF9
[    4.235742] kernel: x86/amd: Previous system reset reason [0x00180800]: =
software wrote 0xE to reset control register 0xCF9
[    4.235745] kernel: microcode: Current revision: 0x0b700032
[    4.235749] kernel: resctrl: L3 allocation detected
[    4.235752] kernel: resctrl: MB allocation detected
[    4.235755] kernel: resctrl: SMBA allocation detected
[    4.235759] kernel: resctrl: L3 monitoring detected
[    4.235763] kernel: IPI shorthand broadcast: enabled
[    4.235766] kernel: sched_clock: Marking stable (466093501, 1406194)->(4=
89944784, -22445089)
[    4.235769] kernel: registered taskstats version 1
[    4.235773] kernel: Loading compiled-in X.509 certificates
[    4.235777] kernel: input: AT Translated Set 2 keyboard as /devices/plat=
form/i8042/serio0/input/input4
[    4.235780] kernel: Loaded X.509 cert 'Build time autogenerated kernel k=
ey: ed3e664c1852a069aadf6897aea0bb6fd2a49d18'
[    4.235784] kernel: Demotion targets for Node 0: null
[    4.235787] kernel: Key type .fscrypt registered
[    4.235791] kernel: Key type fscrypt-provisioning registered
[    4.235795] kernel: Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
[    4.235799] kernel: Key type big_key registered
[    4.235802] kernel: integrity: Loading X.509 certificate: UEFI:db
[    4.235805] kernel: integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secur=
e Boot DB 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    4.235809] kernel: integrity: Loading X.509 certificate: UEFI:db
[    4.235812] kernel: integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secur=
e Boot DB 2024: 9031be8bd10636d7ed703b1ec5807354b05cd8ee'
[    4.235816] kernel: integrity: Loading X.509 certificate: UEFI:db
[    4.235819] kernel: integrity: Loaded X.509 cert 'Microsoft Corporation:=
 Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    4.235823] kernel: integrity: Loading X.509 certificate: UEFI:db
[    4.235826] kernel: integrity: Loaded X.509 cert 'Microsoft Windows Prod=
uction PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    4.235830] kernel: PM:   Magic number: 1:711:924
[    4.235870] kernel: clockevents clockevent17: hash matches
[    4.235902] kernel: msr msr19: hash matches
[    4.235942] kernel: memory memory351: hash matches
[    4.235947] kernel: RAS: Correctable Errors collector initialized.
[    4.235952] kernel: clk: Disabling unused clocks
[    4.235955] kernel: PM: genpd: Disabling unused power domains
[    4.235959] kernel: Freeing unused decrypted memory: 2028K
[    4.235962] kernel: Freeing unused kernel image (initmem) memory: 4644K
[    4.235966] kernel: Write protecting the kernel read-only data: 36864k
[    4.235969] kernel: Freeing unused kernel image (text/rodata gap) memory=
: 860K
[    4.235973] kernel: Freeing unused kernel image (rodata/data gap) memory=
: 564K
[    4.235976] kernel: x86/mm: Checked W+X mappings: passed, no W+X pages f=
ound.
[    4.235980] kernel: rodata_test: all tests were successful
[    4.235984] kernel: Run /init as init process
[    4.235988] kernel:   with arguments:
[    4.235991] kernel:     /init
[    4.235994] kernel:   with environment:
[    4.235997] kernel:     HOME=3D/
[    4.236003] kernel:     TERM=3Dlinux
[    4.236007] kernel:     BOOT_IMAGE=3D/vmlinuz-linux-sultan
[    4.236012] kernel:     cryptdevice=3DUUID=3D086cda6b-894f-4a2b-b380-335=
846421e3f:cryptroot:allow-discards,no-read-workqueue,no-write-workqueue
[    4.236016] kernel:     tsx=3Doff
[    4.236020] kernel:     split_lock_detect=3Doff
[    4.236023] kernel: Key type psk registered
[    4.236059] kernel: ccp 0000:c3:00.2: tee enabled
[    4.236094] kernel: ccp 0000:c3:00.2: psp: TSME enabled
[    4.236128] kernel: ccp 0000:c3:00.2: psp enabled
[    4.236164] kernel: nvme 0000:c2:00.0: platform quirk: setting simple su=
spend
[    4.236198] kernel: nvme nvme0: pci function 0000:c2:00.0
[    4.236224] kernel: nvme nvme0: D3 entry latency set to 10 seconds
[    4.236250] kernel: nvme nvme0: 16/0/0 default/read/poll queues
[    4.236255] kernel:  nvme0n1: p1 p2 p3
[    4.236295] kernel: usb 3-5: new high-speed USB device number 2 using xh=
ci_hcd
[    4.236325] kernel: usb 3-5: New USB device found, idVendor=3D0e8d, idPr=
oduct=3D8c38, bcdDevice=3D 1.00
[    4.236354] kernel: usb 3-5: New USB device strings: Mfr=3D5, Product=3D=
6, SerialNumber=3D7
[    4.236381] kernel: usb 3-5: Product: Wireless_Device
[    4.236408] kernel: usb 3-5: Manufacturer: MediaTek Inc.
[    4.236436] kernel: usb 3-5: SerialNumber: 000000000
[    4.236440] kernel: device-mapper: uevent: version 1.0.3
[    4.236444] kernel: device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) init=
ialised: dm-devel@lists.linux.dev
[    4.236448] kernel: Key type encrypted registered
[    4.236451] kernel: fbcon: Taking over console
[    4.236455] kernel: Console: switching to colour frame buffer device 180=
x56
[    4.236459] kernel: tsc: Refined TSC clocksource calibration: 2994.413 M=
Hz
[    4.236463] kernel: clocksource: tsc: mask: 0xffffffffffffffff max_cycle=
s: 0x2b29a7619ca, max_idle_ns: 440795265835 ns
[    4.236466] kernel: clocksource: Switched to clocksource tsc
[    4.236470] kernel: EXT4-fs (dm-0): mounted filesystem 18516d14-ae39-4b8=
9-8899-95270912d67b r/w with ordered data mode. Quota mode: none.
[    4.236476] systemd[1]: systemd 257.7-1-arch running in system mode (+PA=
M +AUDIT -SELINUX -APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPEN=
SSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETU=
P +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM=
2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP -SYSVINI=
T +LIBARCHIVE)
[    4.236482] systemd[1]: Detected architecture x86-64.
[    4.236486] systemd[1]: Hostname set to <sultan-box>.
[    4.236490] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[    4.236494] systemd[1]: Queued start job for default target Graphical In=
terface.
[    4.236498] systemd[1]: Created slice Slice /system/dirmngr.
[    4.236502] systemd[1]: Created slice Slice /system/getty.
[    4.236506] systemd[1]: Created slice Slice /system/gpg-agent.
[    4.236510] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[    4.236514] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[    4.236517] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[    4.236521] systemd[1]: Created slice Slice /system/keyboxd.
[    4.236525] systemd[1]: Created slice Slice /system/modprobe.
[    4.236529] systemd[1]: Created slice Slice /system/systemd-fsck.
[    4.236533] systemd[1]: Created slice User and Session Slice.
[    4.236538] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    4.236542] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    4.236546] systemd[1]: Expecting device /dev/disk/by-uuid/1eac7954-5ada=
-45c6-a3bf-a282774abc56...
[    4.236550] systemd[1]: Expecting device /dev/disk/by-uuid/4D03-55DF...
[    4.236553] systemd[1]: Reached target Login Prompts.
[    4.236557] systemd[1]: Reached target Local Integrity Protected Volumes.
[    4.236561] systemd[1]: Reached target Remote File Systems.
[    4.236565] systemd[1]: Reached target Slice Units.
[    4.236568] systemd[1]: Reached target Swaps.
[    4.236573] systemd[1]: Reached target Local Verity Protected Volumes.
[    4.236576] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    4.236580] systemd[1]: Listening on LVM2 poll daemon socket.
[    4.236583] systemd[1]: Listening on Process Core Dump Socket.
[    4.236587] systemd[1]: Listening on Credential Encryption/Decryption.
[    4.236590] systemd[1]: Listening on Journal Socket (/dev/log).
[    4.236594] systemd[1]: Listening on Journal Sockets.
[    4.236598] systemd[1]: TPM PCR Measurements was skipped because of an u=
nmet condition check (ConditionSecurity=3Dmeasured-uki).
[    4.236601] systemd[1]: Make TPM PCR Policy was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    4.236606] systemd[1]: Listening on udev Control Socket.
[    4.236609] systemd[1]: Listening on udev Kernel Socket.
[    4.236613] systemd[1]: Mounting Huge Pages File System...
[    4.236617] systemd[1]: Mounting POSIX Message Queue File System...
[    4.236621] systemd[1]: Mounting Kernel Debug File System...
[    4.236624] systemd[1]: Mounting Kernel Trace File System...
[    4.236628] systemd[1]: tmp.mount: Directory /tmp to mount over is not e=
mpty, mounting anyway.
[    4.236632] systemd[1]: Mounting Temporary Directory /tmp...
[    4.236636] systemd[1]: Starting Create List of Static Device Nodes...
[    4.236640] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling...
[    4.236644] systemd[1]: Starting Load Kernel Module configfs...
[    4.236650] systemd[1]: Starting Load Kernel Module dm_mod...
[    4.236655] systemd[1]: Starting Load Kernel Module drm...
[    4.236659] systemd[1]: Starting Load Kernel Module efi_pstore...
[    4.236662] systemd[1]: Starting Load Kernel Module fuse...
[    4.236666] systemd[1]: Starting Load Kernel Module loop...
[    4.236669] systemd[1]: File System Check on Root Device was skipped bec=
ause of an unmet condition check (ConditionPathIsReadWrite=3D!/).
[    4.236673] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    4.236677] systemd[1]: Starting Journal Service...
[    4.236681] systemd[1]: Starting Load Kernel Modules...
[    4.236685] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    4.236689] systemd[1]: Starting Remount Root and Kernel File Systems...
[    4.236693] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    4.236697] systemd[1]: Starting Load udev Rules from Credentials...
[    4.236701] systemd[1]: Starting Coldplug All udev Devices...
[    4.236705] systemd[1]: Starting Virtual Console Setup...
[    4.236708] systemd[1]: Mounted Huge Pages File System.
[    4.236712] systemd[1]: Mounted POSIX Message Queue File System.
[    4.236715] systemd[1]: Mounted Kernel Debug File System.
[    4.236720] systemd[1]: Mounted Kernel Trace File System.
[    4.236724] systemd[1]: Mounted Temporary Directory /tmp.
[    4.236727] systemd[1]: Finished Create List of Static Device Nodes.
[    4.236731] kernel: loop: module loaded
[    4.236734] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    4.236738] systemd[1]: Finished Load Kernel Module configfs.
[    4.236742] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    4.236746] systemd[1]: Finished Load Kernel Module dm_mod.
[    4.236750] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    4.236754] systemd[1]: Finished Load Kernel Module drm.
[    4.236757] systemd[1]: modprobe@efi_pstore.service: Deactivated success=
fully.
[    4.236761] systemd[1]: Finished Load Kernel Module efi_pstore.
[    4.236765] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    4.236769] systemd[1]: Finished Load Kernel Module fuse.
[    4.236772] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    4.236776] systemd[1]: Finished Load Kernel Module loop.
[    4.236779] systemd[1]: Mounting FUSE Control File System...
[    4.236783] systemd[1]: Mounting Kernel Configuration File System...
[    4.236787] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    4.236791] systemd[1]: Starting Create Static Device Nodes in /dev grac=
efully...
[    4.236795] systemd[1]: Finished Load udev Rules from Credentials.
[    4.236798] systemd[1]: Mounted FUSE Control File System.
[    4.236811] systemd-journald[542]: Collecting audit messages is disabled.
[    4.236823] systemd[1]: Mounted Kernel Configuration File System.
[    4.236826] kernel: i2c_dev: i2c /dev entries driver
[    4.236830] systemd[1]: Finished Load Kernel Modules.
[    4.236834] systemd[1]: Starting Apply Kernel Variables...
[    4.236838] systemd[1]: Finished Virtual Console Setup.
[    4.236841] systemd[1]: Finished Apply Kernel Variables.
[    4.236845] systemd[1]: Finished Create Static Device Nodes in /dev grac=
efully.
[    4.237005] systemd[1]: Started Journal Service.
[    4.240039] kernel: EXT4-fs (dm-0): re-mounted 18516d14-ae39-4b89-8899-9=
5270912d67b.
[    4.303571] systemd-journald[542]: Received client request to flush runt=
ime journal.
[    4.386009] kernel: Serial bus multi instantiate pseudo device driver CS=
C3554:00: Instantiated 5 I2C devices.
[    4.402025] kernel: Module pcspkr is blacklisted
[    4.402225] kernel: input: Wireless hotkeys as /devices/virtual/input/in=
put5
[    4.409728] kernel: RAPL PMU: API unit is 2^-32 Joules, 2 fixed counters=
, 163840 ms ovfl timer
[    4.409792] kernel: RAPL PMU: hw unit of domain package 2^-16 Joules
[    4.409812] kernel: RAPL PMU: hw unit of domain core 2^-16 Joules
[    4.411013] kernel: wmi_bus wmi_bus-PNP0C14:00: [Firmware Info]: DF4E63B=
6-3BBC-4858-9737-C74F82F821F3 has zero instances
[    4.411872] kernel: wmi_bus wmi_bus-PNP0C14:00: [Firmware Info]: 8F1F643=
6-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    4.412069] kernel: pcie_mp2_amd 0000:c3:00.7: enabling device (0000 -> =
0002)
[    4.416008] kernel: piix4_smbus 0000:00:14.0: SMBus Host Controller at 0=
xb00, revision 0
[    4.416153] kernel: piix4_smbus 0000:00:14.0: Using register 0x02 for SM=
Bus port selection
[    4.421016] kernel: piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Contr=
oller at 0xb20
[    4.421161] kernel: i2c i2c-6: Successfully instantiated SPD at 0x50
[    4.422019] kernel: i2c i2c-6: Successfully instantiated SPD at 0x51
[    4.422176] kernel: i2c i2c-6: Successfully instantiated SPD at 0x52
[    4.423010] kernel: i2c i2c-6: Successfully instantiated SPD at 0x53
[    4.423181] kernel: i2c i2c-6: Successfully instantiated SPD at 0x54
[    4.424009] kernel: i2c i2c-6: Successfully instantiated SPD at 0x55
[    4.424163] kernel: i2c i2c-6: Successfully instantiated SPD at 0x56
[    4.425009] kernel: i2c i2c-6: Successfully instantiated SPD at 0x57
[    4.435005] kernel: ACPI: bus type thunderbolt registered
[    4.507023] kernel: Bluetooth: Core ver 2.22
[    4.507126] kernel: NET: Registered PF_BLUETOOTH protocol family
[    4.507138] kernel: Bluetooth: HCI device and connection manager initial=
ized
[    4.507147] kernel: Bluetooth: HCI socket layer initialized
[    4.507159] kernel: Bluetooth: L2CAP socket layer initialized
[    4.507169] kernel: Bluetooth: SCO socket layer initialized
[    4.555036] kernel: input: SYNA3133:00 06CB:CFE2 Mouse as /devices/platf=
orm/AMDI0010:00/i2c-0/i2c-SYNA3133:00/0018:06CB:CFE2.0001/input/input6
[    4.555236] kernel: input: SYNA3133:00 06CB:CFE2 Touchpad as /devices/pl=
atform/AMDI0010:00/i2c-0/i2c-SYNA3133:00/0018:06CB:CFE2.0001/input/input7
[    4.555281] kernel: hid-generic 0018:06CB:CFE2.0001: input,hidraw0: I2C =
HID v1.00 Mouse [SYNA3133:00 06CB:CFE2] on i2c-SYNA3133:00
[    4.564011] kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    4.564050] kernel: sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog=
 MMIO address
[    4.564260] kernel: sp5100-tco sp5100-tco: initialized. heartbeat=3D60 s=
ec (nowayout=3D0)
[    4.564437] kernel: ACPI: video: Video Device [GFX0] (multi-head: yes  r=
om: no  post: no)
[    4.564469] kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00=
/PNP0A08:00/device:13/LNXVIDEO:00/input/input9
[    4.577024] kernel: amdxdna 0000:c4:00.1: enabling device (0000 -> 0002)
[    4.578085] kernel: hp_wmi: query 0x4 returned error 0x5
[    4.588008] kernel: usbcore: registered new interface driver btusb
[    4.589007] kernel: input: HP WMI hotkeys as /devices/virtual/input/inpu=
t10
[    4.590007] kernel: Bluetooth: hci0: HW/SW Version: 0x00000000, Build Ti=
me: 20250526153203
[    4.594007] kernel: snd_acp_pci 0000:c3:00.5: enabling device (0000 -> 0=
002)
[    4.596018] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Cirrus Log=
ic CS35L54 Rev B0 OTP4 fw:3.4.4 (patched=3D0)
[    4.610337] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP system=
 name: '103C8D01', amp name: 'AMP1'
[    4.613007] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Reset GPIO=
 busy, assume shared reset
[    4.620008] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Cirrus Log=
ic CS35L54 Rev B0 OTP4 fw:3.4.4 (patched=3D0)
[    4.620184] kernel: input: SYNA3133:00 06CB:CFE2 Mouse as /devices/platf=
orm/AMDI0010:00/i2c-0/i2c-SYNA3133:00/0018:06CB:CFE2.0001/input/input11
[    4.621010] kernel: input: SYNA3133:00 06CB:CFE2 Touchpad as /devices/pl=
atform/AMDI0010:00/i2c-0/i2c-SYNA3133:00/0018:06CB:CFE2.0001/input/input12
[    4.621033] kernel: hid-multitouch 0018:06CB:CFE2.0001: input,hidraw0: I=
2C HID v1.00 Mouse [SYNA3133:00 06CB:CFE2] on i2c-SYNA3133:00
[    4.636013] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP system=
 name: '103C8D01', amp name: 'AMP2'
[    4.638007] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: Reset GPIO=
 busy, assume shared reset
[    4.646019] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: Cirrus Log=
ic CS35L54 Rev B0 OTP4 fw:3.4.4 (patched=3D0)
[    4.653007] kernel: cfg80211: Loading compiled-in X.509 certificates for=
 regulatory database
[    4.653044] kernel: snd_hda_intel 0000:c3:00.1: enabling device (0000 ->=
 0002)
[    4.653176] kernel: snd_hda_intel 0000:c3:00.6: enabling device (0000 ->=
 0002)
[    4.655015] kernel: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    4.655034] kernel: Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06=
c7248db18c600'
[    4.660016] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: DSP system=
 name: '103C8D01', amp name: 'AMP3'
[    4.662016] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: Reset GPIO=
 busy, assume shared reset
[    4.665008] kernel: mousedev: PS/2 mouse device common for all mice
[    4.667009] kernel: input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/=
pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input14
[    4.667028] kernel: input: HD-Audio Generic HDMI/DP,pcm=3D7 as /devices/=
pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input15
[    4.667039] kernel: input: HD-Audio Generic HDMI/DP,pcm=3D8 as /devices/=
pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input16
[    4.667047] kernel: input: HD-Audio Generic HDMI/DP,pcm=3D9 as /devices/=
pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input17
[    4.670007] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: Cirrus Log=
ic CS35L54 Rev B0 OTP4 fw:3.4.4 (patched=3D0)
[    4.679021] kernel: [drm] Initialized amdxdna_accel_driver 0.0.0 for 000=
0:c4:00.1 on minor 0
[    4.680007] kernel: snd_hda_codec_realtek hdaudioC1D0: ALC245: picked fi=
xup  for PCI SSID 103c:8d01
[    4.680144] kernel: snd_hda_codec_realtek hdaudioC1D0: Found 4 CSC3554 o=
n i2c (-%s:00-cs35l54-hda.%d)
[    4.681019] kernel: snd_hda_codec_realtek hdaudioC1D0: autoconfig for AL=
C245: line_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    4.681174] kernel: snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=
=3D0 (0x0/0x0/0x0/0x0/0x0)
[    4.681225] kernel: snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D1 (0=
x21/0x0/0x0/0x0/0x0)
[    4.681265] kernel: snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=
=3D0x0
[    4.681306] kernel: snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    4.681353] kernel: snd_hda_codec_realtek hdaudioC1D0:      Mic=3D0x19
[    4.683016] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: DSP system=
 name: '103C8D01', amp name: 'AMP4'
[    4.684024] kernel: kvm_amd: TSC scaling supported
[    4.684043] kernel: kvm_amd: Nested Virtualization enabled
[    4.684052] kernel: kvm_amd: Nested Paging enabled
[    4.684061] kernel: kvm_amd: LBR virtualization supported
[    4.684069] kernel: kvm_amd: Virtual VMLOAD VMSAVE supported
[    4.684078] kernel: kvm_amd: Virtual GIF supported
[    4.684082] kernel: kvm_amd: Virtual NMI enabled
[    4.686008] kernel: snd_hda_codec_realtek hdaudioC1D0: bound i2c-CSC3554=
:00-cs35l54-hda.0 (ops cs35l56_hda_comp_ops [snd_hda_scodec_cs35l56])
[    4.686232] kernel: snd_hda_codec_realtek hdaudioC1D0: bound i2c-CSC3554=
:00-cs35l54-hda.1 (ops cs35l56_hda_comp_ops [snd_hda_scodec_cs35l56])
[    4.686309] kernel: snd_hda_codec_realtek hdaudioC1D0: bound i2c-CSC3554=
:00-cs35l54-hda.2 (ops cs35l56_hda_comp_ops [snd_hda_scodec_cs35l56])
[    4.686452] kernel: input: PMF-TA output events as /devices/platform/AMD=
I0105:00/input/input18
[    4.686469] kernel: snd_hda_codec_realtek hdaudioC1D0: bound i2c-CSC3554=
:00-cs35l54-hda.3 (ops cs35l56_hda_comp_ops [snd_hda_scodec_cs35l56])
[    4.686532] kernel: amd-pmf AMDI0105:00: registered PMF device successfu=
lly
[    4.691016] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp 0x66300c2d
[    4.691140] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57 GMT Dayligh=
t Time
[    4.691199] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp 0x66300c2d
[    4.691260] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57 GMT Dayligh=
t Time
[    4.691313] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp 0x66300c2d
[    4.691370] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57 GMT Dayligh=
t Time
[    4.691421] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp 0x66300c2d
[    4.691477] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57 GMT Dayligh=
t Time
[    4.815026] kernel: input: HD-Audio Generic Mic as /devices/pci0000:00/0=
000:00:08.1/0000:c3:00.6/sound/card1/input19
[    4.815116] kernel: input: HD-Audio Generic Headphone as /devices/pci000=
0:00/0000:00:08.1/0000:c3:00.6/sound/card1/input20
[    4.823021] kernel: intel_rapl_common: Found RAPL domain package
[    4.823125] kernel: intel_rapl_common: Found RAPL domain core
[    4.824024] kernel: amd_atl: AMD Address Translation Library initialized
[    4.868029] kernel: mt7925e 0000:c1:00.0: enabling device (0000 -> 0002)
[    4.873014] kernel: mt7925e 0000:c1:00.0: ASIC revision: 79250000
[    4.948042] kernel: mt7925e 0000:c1:00.0: HW/SW Version: 0x8a108a10, Bui=
ld Time: 20250526152947a
[    5.430042] kernel: mt7925e 0000:c1:00.0: WM Firmware Version: ____00000=
0, Build Time: 20250526153043
[    5.673027] kernel: EXT4-fs (nvme0n1p2): mounted filesystem 1eac7954-5ad=
a-45c6-a3bf-a282774abc56 r/w with ordered data mode. Quota mode: none.
[    5.679024] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: Firm=
ware: 1a00d6 vendor: 0x2 v3.11.18, 41 algorithms
[    5.679256] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: DSP1: Firm=
ware: 1a00d6 vendor: 0x2 v3.11.18, 41 algorithms
[    5.680021] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: DSP1: Firm=
ware: 1a00d6 vendor: 0x2 v3.11.18, 41 algorithms
[    5.681022] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: Firm=
ware: 1a00d6 vendor: 0x2 v3.11.18, 41 algorithms
[    5.697021] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin: v3.11.18
[    5.697172] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: misc=
: C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Left_Tweeter (131=
118.360300.80216)-init.bin
[    5.712029] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin: v3.11.18
[    5.712227] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: DSP1: misc=
: C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Right_Woofer (131=
118.360000.80216)-init.bin
[    5.727021] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin: v3.11.18
[    5.727174] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: DSP1: misc=
: C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Right_Tweeter (13=
1118.360100.80216)-init.bin
[    5.742022] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirr=
us/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin: v3.11.18
[    5.742167] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: misc=
: C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Left_Woofer (1311=
18.360200.80216)-init.bin
[    6.199031] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Calibratio=
n applied
[    6.199209] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: Calibratio=
n applied
[    6.199323] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: Calibratio=
n applied
[    6.200023] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Calibratio=
n applied
[    6.201020] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Tuning PID=
: 0x131118, SID: 0x360300, TID: 0x80216
[    6.201172] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.3: Tuning PID=
: 0x131118, SID: 0x360000, TID: 0x80216
[    6.201283] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.2: Tuning PID=
: 0x131118, SID: 0x360100, TID: 0x80216
[    6.201394] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Tuning PID=
: 0x131118, SID: 0x360200, TID: 0x80216
[    6.228021] kernel: mt7925e 0000:c1:00.0 wlp193s0: renamed from wlan0
[    6.387021] kernel: Bluetooth: hci0: Device setup in 1757092 usecs
[    6.387057] kernel: Bluetooth: hci0: HCI Enhanced Setup Synchronous Conn=
ection command is advertised, but not supported.
[    6.474033] kernel: Bluetooth: hci0: AOSP extensions version v1.00
[    6.474067] kernel: Bluetooth: hci0: AOSP quality report is supported
[    6.703024] kernel: [drm] amdgpu kernel modesetting enabled.
[    6.704013] kernel: amdgpu: Virtual CRAT table created for CPU
[    6.704027] kernel: amdgpu: Topology: Add CPU node
[    6.706310] kernel: [drm] initializing kernel modesetting (IP DISCOVERY =
0x1002:0x1586 0x103C:0x8D01 0xD1).
[    6.706319] kernel: [drm] register mmio base: 0xA0300000
[    6.706327] kernel: [drm] register mmio size: 1048576
[    6.707034] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 0 <soc21_common>
[    6.707303] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 1 <gmc_v11_0>
[    6.707448] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 2 <ih_v6_1>
[    6.707572] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 3 <psp>
[    6.707699] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 4 <smu>
[    6.707840] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 5 <dm>
[    6.707966] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 6 <gfx_v11_0>
[    6.708050] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 7 <sdma_v6_0>
[    6.708115] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 8 <vcn_v4_0_5>
[    6.708175] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 9 <jpeg_v4_0_5>
[    6.708235] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 10 <mes_v11_0>
[    6.708295] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 11 <vpe_v6_1>
[    6.708356] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block numbe=
r 12 <isp_ip>
[    6.708424] kernel: amdgpu 0000:c3:00.0: amdgpu: Fetched VBIOS from VFCT
[    6.708487] kernel: amdgpu: ATOM BIOS: 113-STRXLGEN-001
[    6.716132] kernel: amdgpu 0000:c3:00.0: amdgpu: VPE: collaborate mode t=
rue
[    6.755045] kernel: Console: switching to colour dummy device 80x25
[    6.770009] kernel: amdgpu 0000:c3:00.0: amdgpu: Trusted Memory Zone (TM=
Z) feature disabled as experimental (default)
[    6.770299] kernel: [drm] vm size is 262144 GB, 4 levels, block size is =
9-bit, fragment size is 9-bit
[    6.770318] kernel: amdgpu 0000:c3:00.0: amdgpu: VRAM: 4096M 0x000000800=
0000000 - 0x00000080FFFFFFFF (4096M used)
[    6.770478] kernel: amdgpu 0000:c3:00.0: amdgpu: GART: 512M 0x00007FFF00=
000000 - 0x00007FFF1FFFFFFF
[    6.770609] kernel: [drm] Detected VRAM RAM=3D4096M, BAR=3D4096M
[    6.770624] kernel: [drm] RAM width 256bits LPDDR5
[    6.770639] kernel: [drm] amdgpu: 4096M of VRAM memory ready
[    6.770656] kernel: [drm] amdgpu: 30015M of GTT memory ready.
[    6.770673] kernel: [drm] GART: num cpu pages 131072, num gpu pages 1310=
72
[    6.771024] kernel: [drm] PCIE GART of 512M enabled (table at 0x00000080=
FFB00000).
[    6.772023] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Loading DMUB firm=
ware via PSP: version=3D0x09002600
[    6.772231] kernel: amdgpu 0000:c3:00.0: amdgpu: Found VCN firmware Vers=
ion ENC: 1.24 DEC: 9 VEP: 0 Revision: 11
[    6.772297] kernel: amdgpu 0000:c3:00.0: amdgpu: Found VCN firmware Vers=
ion ENC: 1.24 DEC: 9 VEP: 0 Revision: 11
[    6.795005] kernel: amdgpu 0000:c3:00.0: amdgpu: reserve 0x8c00000 from =
0x80e0000000 for PSP TMR
[    6.925005] kernel: input: keyd virtual keyboard as /devices/virtual/inp=
ut/input21
[    6.937015] kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    6.937034] kernel: Bluetooth: BNEP filters: protocol multicast
[    6.937040] kernel: Bluetooth: BNEP socket layer initialized
[    6.938006] kernel: Bluetooth: MGMT ver 1.23
[    6.944017] kernel: NET: Registered PF_ALG protocol family
[    7.005053] kernel: input: keyd virtual pointer as /devices/virtual/inpu=
t/input22
[    7.534315] kernel: amdgpu 0000:c3:00.0: amdgpu: RAS: optional ras ta uc=
ode is not available
[    7.537354] kernel: amdgpu 0000:c3:00.0: amdgpu: RAP: optional rap ta uc=
ode is not available
[    7.537882] kernel: amdgpu 0000:c3:00.0: amdgpu: SECUREDISPLAY: optional=
 securedisplay ta ucode is not available
[    7.575033] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU is initialized succ=
essfully!
[    7.578030] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Display Core v3.2=
=2E334 initialized on DCN 3.5.1
[    7.578210] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DP-HDMI FRL PCON =
supported
[    7.581020] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB hardware ini=
tialized: version=3D0x09002600
[    7.599030] kernel: snd_hda_intel 0000:c3:00.1: bound 0000:c3:00.0 (ops =
amdgpu_dm_audio_component_bind_ops [amdgpu])
[    7.660021] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Using ACPI provid=
ed EDID for eDP-1
[    7.663029] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] PSR support 1, DC=
 PSR ver 0, sink PSR ver 4 DPCD caps 0x3a su_y_granularity 4
[    7.663302] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] PSR support 0, DC=
 PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    7.663454] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] PSR support 0, DC=
 PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    7.663588] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] PSR support 0, DC=
 PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    7.663718] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] PSR support 0, DC=
 PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    7.663843] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] PSR support 0, DC=
 PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    7.663969] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] PSR support 0, DC=
 PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    7.664119] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] PSR support 0, DC=
 PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    7.664196] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] PSR support 0, DC=
 PSR ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
[    7.677050] kernel: kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    7.677463] kernel: kfd kfd: amdgpu: Total number of KFD nodes to be cre=
ated: 1
[    7.679018] kernel: amdgpu: Virtual CRAT table created for GPU
[    7.680016] kernel: amdgpu: Topology: Add dGPU node [0x1586:0x1002]
[    7.680034] kernel: kfd kfd: amdgpu: added device 1002:1586
[    7.680123] kernel: amdgpu 0000:c3:00.0: amdgpu: SE 2, SH per SE 2, CU p=
er SH 10, active_cu_number 40
[    7.680184] kernel: amdgpu 0000:c3:00.0: amdgpu: ring gfx_0.0.0 uses VM =
inv eng 0 on hub 0
[    7.680231] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.0 uses VM=
 inv eng 1 on hub 0
[    7.680279] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.0 uses VM=
 inv eng 4 on hub 0
[    7.680323] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.0 uses VM=
 inv eng 6 on hub 0
[    7.680365] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.0 uses VM=
 inv eng 7 on hub 0
[    7.680413] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.1 uses VM=
 inv eng 8 on hub 0
[    7.680460] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.1 uses VM=
 inv eng 9 on hub 0
[    7.680502] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.1 uses VM=
 inv eng 10 on hub 0
[    7.680545] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.1 uses VM=
 inv eng 11 on hub 0
[    7.680592] kernel: amdgpu 0000:c3:00.0: amdgpu: ring sdma0 uses VM inv =
eng 12 on hub 0
[    7.680634] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_0 uses=
 VM inv eng 0 on hub 8
[    7.680679] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_1 uses=
 VM inv eng 1 on hub 8
[    7.680721] kernel: amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_0 uses VM=
 inv eng 4 on hub 8
[    7.680767] kernel: amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_1 uses VM=
 inv eng 6 on hub 8
[    7.680808] kernel: amdgpu 0000:c3:00.0: amdgpu: ring mes_kiq_3.1.0 uses=
 VM inv eng 13 on hub 0
[    7.680849] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vpe uses VM inv en=
g 7 on hub 8
[    7.680892] kernel: amdgpu 0000:c3:00.0: amdgpu: Runtime PM not available
[    7.680941] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Using custom brig=
htness curve
[    7.682002] kernel: amdgpu 0000:c3:00.0: [drm] Registered 4 planes with =
drm panic
[    7.682051] kernel: [drm] Initialized amdgpu 3.64.0 for 0000:c3:00.0 on =
minor 1
[    7.688032] kernel: [drm] pre_validate_dsc:1627 MST_DSC dsc precompute i=
s not needed
[    8.665043] kernel: Console: switching to colour frame buffer device 180=
x56
[    8.675028] kernel: amdgpu 0000:c3:00.0: [drm] fb0: amdgpudrmfb frame bu=
ffer device
[    8.697010] kernel: mc: Linux media interface: v0.10
[    8.720021] kernel: videodev: Linux video capture interface: v2.00
[   11.850388] kernel: Unknown laptop placement
[   13.293020] kernel: Bluetooth: RFCOMM TTY layer initialized
[   13.293092] kernel: Bluetooth: RFCOMM socket layer initialized
[   13.293113] kernel: Bluetooth: RFCOMM ver 1.11
[   14.073385] kernel: hid-generic 0020:1022:0001.0002: hidraw1: SENSOR HUB=
 HID v0.00 Device [hid-amdsfh 1022:0001] on pcie_mp2_amd
[   14.074230] kernel: hid-generic 0020:1022:0001.0003: hidraw2: SENSOR HUB=
 HID v0.00 Device [hid-amdsfh 1022:0001] on pcie_mp2_amd
[   14.081109] kernel: hid-sensor-hub 0020:1022:0001.0002: hidraw1: SENSOR =
HUB HID v0.00 Device [hid-amdsfh 1022:0001] on pcie_mp2_amd
[   14.081875] kernel: hid-sensor-hub 0020:1022:0001.0003: hidraw2: SENSOR =
HUB HID v0.00 Device [hid-amdsfh 1022:0001] on pcie_mp2_amd
[   14.856025] kernel: nvme nvme0: using unchecked data buffer
[   26.531033] kernel: wlp193s0: authenticate with 1c:0b:8b:00:0f:94 (local=
 address=3D38:8d:3d:6d:2f:48)
[   26.880023] kernel: wlp193s0: send auth to 1c:0b:8b:00:0f:94 (try 1/3)
[   26.905030] kernel: wlp193s0: authenticate with 1c:0b:8b:00:0f:94 (local=
 address=3D38:8d:3d:6d:2f:48)
[   26.917023] kernel: wlp193s0: send auth to 1c:0b:8b:00:0f:94 (try 1/3)
[   26.921033] kernel: wlp193s0: authenticated
[   26.926034] kernel: wlp193s0: associate with 1c:0b:8b:00:0f:94 (try 1/3)
[   26.960039] kernel: wlp193s0: RX AssocResp from 1c:0b:8b:00:0f:94 (capab=
=3D0x1111 status=3D0 aid=3D2)
[   26.995035] kernel: wlp193s0: associated
[   27.251036] kernel: wlp193s0: Limiting TX power to 24 (24 - 0) dBm as ad=
vertised by 1c:0b:8b:00:0f:94
[  313.742472] kernel: usb 3-1: new high-speed USB device number 3 using xh=
ci_hcd
[  316.121425] kernel: usb 3-1: New USB device found, idVendor=3D090c, idPr=
oduct=3D1000, bcdDevice=3D11.00
[  316.122292] kernel: usb 3-1: New USB device strings: Mfr=3D1, Product=3D=
2, SerialNumber=3D3
[  316.122412] kernel: usb 3-1: Product: Flash Drive FIT
[  316.122501] kernel: usb 3-1: Manufacturer: Samsung
[  316.122587] kernel: usb 3-1: SerialNumber: 0375119060019940
[  316.155021] kernel: usb-storage 3-1:1.0: USB Mass Storage device detected
[  316.155405] kernel: scsi host0: usb-storage 3-1:1.0
[  316.155525] kernel: usbcore: registered new interface driver usb-storage
[  316.159012] kernel: usbcore: registered new interface driver uas
[  317.489118] kernel: scsi 0:0:0:0: Direct-Access     Samsung  Flash Drive=
 FIT  1100 PQ: 0 ANSI: 6
[  317.490027] kernel: sd 0:0:0:0: [sda] 62656641 512-byte logical blocks: =
(32.1 GB/29.9 GiB)
[  317.490208] kernel: sd 0:0:0:0: [sda] Write Protect is off
[  317.490265] kernel: sd 0:0:0:0: [sda] Mode Sense: 43 00 00 00
[  317.490337] kernel: sd 0:0:0:0: [sda] Write cache: enabled, read cache: =
enabled, doesn't support DPO or FUA
[  317.903035] kernel:  sda: sda1
[  317.903096] kernel: sd 0:0:0:0: [sda] Attached SCSI removable disk
[  339.555049] kernel: FAT-fs (sda1): Volume was not properly unmounted. So=
me data may be corrupt. Please run fsck.
[  356.145026] kernel: sda: detected capacity change from 62656641 to 0
[  356.872031] kernel: usb 3-1: USB disconnect, device number 3
[  899.237063] kernel: amd_isp_capture amd_isp_capture: fail to disable str=
eam
[  899.741037] kernel: amd_isp_capture amd_isp_capture: fail to stop steam
[  899.741200] kernel: amd_isp_capture amd_isp_capture: disabling streaming=
 failed (-110)
[  899.758024] kernel: amd-pmf AMDI0105:00: SMU response timed out
[  899.842012] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  900.862011] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  901.745014] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  901.805024] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  902.645021] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  902.742022] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  902.742218] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  903.413051] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  903.853026] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  904.276023] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  905.377032] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  905.723023] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  905.723229] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  905.902023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  906.381012] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  907.338014] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  907.949015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  908.355015] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  908.692013] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  908.692096] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  909.359014] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  909.997014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  910.350012] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  911.254038] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  911.667030] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  911.667213] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  912.045032] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  912.140028] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  913.191024] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  914.093025] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  914.440012] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  914.637025] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  914.637247] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  915.431014] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  916.141014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  916.428014] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  917.347014] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  917.696013] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  917.696105] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  918.155855] kernel: BUG: kernel NULL pointer dereference, address: 00000=
00000000008
[  918.156334] kernel: #PF: supervisor read access in kernel mode
[  918.556330] kernel: #PF: error_code(0x0000) - not-present page
[  918.562283] kernel: PGD 0 P4D 0=20
[  918.562340] kernel: Oops: Oops: 0000 [#1] SMP NOPTI
[  918.562363] kernel: CPU: 4 UID: 0 PID: 5002 Comm: amd_isp4_thread Not ta=
inted 6.16.0-00020-g541e951a4e8a #1 PREEMPT(full)  ec39f80096e0b20fee1b3472=
ffc6dfe32b18badd
[  918.562383] kernel: Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile =
Workstation PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[  918.562417] kernel: RIP: 0010:isp_fw_log_print+0x3b/0x240 [amd_capture]
[  918.562436] kernel: Code: 55 53 48 83 ec 38 4c 8b b7 60 0b 00 00 80 bf 5=
8 0b 00 00 01 0f 85 fb 00 00 00 4d 85 f6 0f 84 f2 00 00 00 48 8b 87 30 02 0=
0 00 <4c> 8b 68 08 48 8b 40 20 44 89 6c 24 08 48 89 44 24 10 48 85 c0 0f
[  918.562457] kernel: RSP: 0018:ffffcf864dc7fd40 EFLAGS: 00010286
[  918.562475] kernel: RAX: 0000000000000000 RBX: 0000000000000001 RCX: 000=
0000000000000
[  918.562499] kernel: RDX: ffff8d5b56872180 RSI: ffff8d5b4267b810 RDI: fff=
f8d5b6c14f0a0
[  918.562521] kernel: RBP: ffff8d5b6c14f0a0 R08: 000000d5a123c41d R09: fff=
f8d69bd932340
[  918.562540] kernel: R10: 00000000ffffffff R11: 0000000000000008 R12: fff=
fcf864dc7fdd8
[  918.562561] kernel: R13: ffff8d5b6c14f0a0 R14: ffff8d5b8b400028 R15: 000=
0000000000000
[  918.562580] kernel: FS:  0000000000000000(0000) GS:ffff8d6a13031000(0000=
) knlGS:0000000000000000
[  918.562598] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  918.562619] kernel: CR2: 0000000000000008 CR3: 0000000137868000 CR4: 000=
0000000f50ef0
[  918.562639] kernel: PKRU: 55555554
[  918.562655] kernel: Call Trace:
[  918.562680] kernel:  <TASK>
[  918.562699] kernel:  isp4sd_fw_resp_func+0x58/0x1d0 [amd_capture 00147f3=
2a555e0c4384c29b5a17f76e9c9e1a01b]
[  918.562725] kernel:  ? lock_timer_base+0x70/0x90
[  918.562751] kernel:  isp4sd_fw_resp_thread_wrapper+0xdf/0x210 [amd_captu=
re 00147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  918.562768] kernel:  ? __pfx_autoremove_wake_function+0x10/0x10
[  918.562787] kernel:  ? __pfx_isp4sd_fw_resp_thread_wrapper+0x10/0x10 [am=
d_capture 00147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  918.562806] kernel:  kthread+0xf9/0x240
[  918.562822] kernel:  ? __pfx_kthread+0x10/0x10
[  918.562842] kernel:  ret_from_fork+0x198/0x1d0
[  918.562861] kernel:  ? __pfx_kthread+0x10/0x10
[  918.562879] kernel:  ret_from_fork_asm+0x1a/0x30
[  918.562902] kernel:  </TASK>
[  918.562920] kernel: Modules linked in: uas usb_storage ccm hid_sensor_gy=
ro_3d hid_sensor_prox hid_sensor_trigger industrialio_triggered_buffer kfif=
o_buf hid_sensor_iio_common industrialio hid_sensor_hub rfcomm snd_seq_dumm=
y snd_hrtimer snd_seq snd_seq_device ov05c10 v4l2_cci amd_capture v4l2_fwno=
de videobuf2_memops videobuf2_v4l2 videobuf2_common v4l2_async videodev mc =
i2c_designware_amdisp pinctrl_amdisp cmac algif_hash algif_skcipher af_alg =
bnep uinput nls_iso8859_1 vfat fat amdgpu mt7925e mt7925_common mt792x_lib =
snd_acp_legacy_mach mt76_connac_lib snd_acp_mach snd_soc_nau8821 mt76 snd_a=
cp3x_rn snd_acp70 amd_atl intel_rapl_msr snd_acp_i2s intel_rapl_common snd_=
acp_pdm snd_acp_pcm snd_soc_dmic snd_sof_amd_acp70 snd_sof_amd_acp63 mac802=
11 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd=
_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_so=
c_acpi_amd_match snd_amd_sdw_acpi snd_hda_scodec_cs35l56_spi soundwire_amd =
snd_ctl_led amdxcp soundwire_generic_allocation kvm_amd
[  918.563752] kernel:  drm_panel_backlight_quirks snd_hda_codec_realtek so=
undwire_bus drm_buddy drm_exec snd_hda_codec_generic drm_suballoc_helper sn=
d_soc_sdca joydev drm_ttm_helper snd_hda_scodec_component libarc4 snd_hda_c=
odec_hdmi mousedev snd_soc_core kvm snd_hda_intel ttm snd_intel_dspcfg cfg8=
0211 snd_intel_sdw_acpi snd_compress i2c_algo_bit ac97_bus snd_hda_codec dr=
m_display_helper snd_pcm_dmaengine snd_rpl_pci_acp6x snd_acp_pci snd_hda_co=
re snd_amd_acpi_mach cec btusb snd_hda_scodec_cs35l56_i2c snd_acp_legacy_co=
mmon snd_hda_scodec_cs35l56 btrtl snd_hwdep snd_pci_acp6x ucsi_acpi snd_hda=
_cirrus_scodec btintel snd_pcm typec_ucsi snd_soc_cs35l56_shared amd_pmf am=
dxdna snd_pci_acp5x spd5118 snd_soc_cs_amp_lib btbcm hp_wmi snd_rn_pci_acp3=
x typec wmi_bmof amdtee cs_dsp hid_multitouch snd_acp_config snd_timer btmt=
k video sparse_keymap sp5100_tco irqbypass roles bluetooth thunderbolt snd =
snd_soc_acpi i2c_piix4 gpu_sched amd_sfh rfkill rapl soundcore i2c_hid_acpi=
 wmi platform_profile snd_pci_acp3x i2c_smbus wireless_hotkey
[  918.563807] kernel:  amd_isp4 i2c_hid amd_pmc serial_multi_instantiate m=
ac_hid i2c_dev crypto_user loop nfnetlink ip_tables x_tables dm_crypt encry=
pted_keys trusted asn1_encoder tee dm_mod nvme nvme_core polyval_clmulni gh=
ash_clmulni_intel ccp sha512_ssse3 sha1_ssse3 aesni_intel nvme_keyring seri=
o_raw nvme_auth
[  918.563824] kernel: CR2: 0000000000000008
[  918.563845] kernel: ---[ end trace 0000000000000000 ]---
[  918.563868] kernel: BUG: kernel NULL pointer dereference, address: 00000=
00000000008
[  918.563926] kernel: #PF: supervisor read access in kernel mode
[  918.564027] kernel: #PF: error_code(0x0000) - not-present page
[  918.564094] kernel: PGD 0 P4D 0=20
[  918.564149] kernel: Oops: Oops: 0000 [#2] SMP NOPTI
[  918.564168] kernel: CPU: 12 UID: 0 PID: 5001 Comm: amd_isp4_thread Taint=
ed: G      D             6.16.0-00020-g541e951a4e8a #1 PREEMPT(full)  ec39f=
80096e0b20fee1b3472ffc6dfe32b18badd
[  918.564186] kernel: Tainted: [D]=3DDIE
[  918.564204] kernel: Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile =
Workstation PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[  918.564219] kernel: RIP: 0010:isp_fw_log_print+0x3b/0x240 [amd_capture]
[  918.564237] kernel: Code: 55 53 48 83 ec 38 4c 8b b7 60 0b 00 00 80 bf 5=
8 0b 00 00 01 0f 85 fb 00 00 00 4d 85 f6 0f 84 f2 00 00 00 48 8b 87 30 02 0=
0 00 <4c> 8b 68 08 48 8b 40 20 44 89 6c 24 08 48 89 44 24 10 48 85 c0 0f
[  918.564256] kernel: RSP: 0018:ffffcf864dc67d40 EFLAGS: 00010286
[  918.564278] kernel: RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000=
0000000000000
[  918.564296] kernel: RDX: ffff8d5b7585a180 RSI: ffff8d5b4267b810 RDI: fff=
f8d5b6c14f0a0
[  918.564313] kernel: RBP: ffff8d5b6c14f0a0 R08: 000000d5a29239c3 R09: fff=
f8d69bdb32340
[  918.564332] kernel: R10: 000000d5ac9cef00 R11: 00000000019f972a R12: fff=
fcf864dc67dd8
[  918.564346] kernel: R13: ffff8d5b6c14f0a0 R14: ffff8d5b8b400028 R15: 000=
0000000000000
[  918.564363] kernel: FS:  0000000000000000(0000) GS:ffff8d6a13231000(0000=
) knlGS:0000000000000000
[  918.564378] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  918.564395] kernel: CR2: 0000000000000008 CR3: 0000000f4c424000 CR4: 000=
0000000f50ef0
[  918.564415] kernel: PKRU: 55555554
[  918.564431] kernel: Call Trace:
[  918.564445] kernel:  <TASK>
[  918.564459] kernel:  isp4sd_fw_resp_func+0x58/0x1d0 [amd_capture 00147f3=
2a555e0c4384c29b5a17f76e9c9e1a01b]
[  918.564476] kernel:  ? lock_timer_base+0x70/0x90
[  918.564492] kernel:  isp4sd_fw_resp_thread_wrapper+0xdf/0x210 [amd_captu=
re 00147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  918.564506] kernel:  ? __pfx_autoremove_wake_function+0x10/0x10
[  918.564522] kernel:  ? __pfx_isp4sd_fw_resp_thread_wrapper+0x10/0x10 [am=
d_capture 00147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  918.564536] kernel:  kthread+0xf9/0x240
[  918.564550] kernel:  ? __pfx_kthread+0x10/0x10
[  918.564563] kernel:  ret_from_fork+0x198/0x1d0
[  918.564577] kernel:  ? __pfx_kthread+0x10/0x10
[  918.564591] kernel:  ret_from_fork_asm+0x1a/0x30
[  918.564606] kernel:  </TASK>
[  918.564621] kernel: Modules linked in: uas usb_storage ccm hid_sensor_gy=
ro_3d hid_sensor_prox hid_sensor_trigger industrialio_triggered_buffer kfif=
o_buf hid_sensor_iio_common industrialio hid_sensor_hub rfcomm snd_seq_dumm=
y snd_hrtimer snd_seq snd_seq_device ov05c10 v4l2_cci amd_capture v4l2_fwno=
de videobuf2_memops videobuf2_v4l2 videobuf2_common v4l2_async videodev mc =
i2c_designware_amdisp pinctrl_amdisp cmac algif_hash algif_skcipher af_alg =
bnep uinput nls_iso8859_1 vfat fat amdgpu mt7925e mt7925_common mt792x_lib =
snd_acp_legacy_mach mt76_connac_lib snd_acp_mach snd_soc_nau8821 mt76 snd_a=
cp3x_rn snd_acp70 amd_atl intel_rapl_msr snd_acp_i2s intel_rapl_common snd_=
acp_pdm snd_acp_pcm snd_soc_dmic snd_sof_amd_acp70 snd_sof_amd_acp63 mac802=
11 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd=
_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_so=
c_acpi_amd_match snd_amd_sdw_acpi snd_hda_scodec_cs35l56_spi soundwire_amd =
snd_ctl_led amdxcp soundwire_generic_allocation kvm_amd
[  918.564710] kernel:  drm_panel_backlight_quirks snd_hda_codec_realtek so=
undwire_bus drm_buddy drm_exec snd_hda_codec_generic drm_suballoc_helper sn=
d_soc_sdca joydev drm_ttm_helper snd_hda_scodec_component libarc4 snd_hda_c=
odec_hdmi mousedev snd_soc_core kvm snd_hda_intel ttm snd_intel_dspcfg cfg8=
0211 snd_intel_sdw_acpi snd_compress i2c_algo_bit ac97_bus snd_hda_codec dr=
m_display_helper snd_pcm_dmaengine snd_rpl_pci_acp6x snd_acp_pci snd_hda_co=
re snd_amd_acpi_mach cec btusb snd_hda_scodec_cs35l56_i2c snd_acp_legacy_co=
mmon snd_hda_scodec_cs35l56 btrtl snd_hwdep snd_pci_acp6x ucsi_acpi snd_hda=
_cirrus_scodec btintel snd_pcm typec_ucsi snd_soc_cs35l56_shared amd_pmf am=
dxdna snd_pci_acp5x spd5118 snd_soc_cs_amp_lib btbcm hp_wmi snd_rn_pci_acp3=
x typec wmi_bmof amdtee cs_dsp hid_multitouch snd_acp_config snd_timer btmt=
k video sparse_keymap sp5100_tco irqbypass roles bluetooth thunderbolt snd =
snd_soc_acpi i2c_piix4 gpu_sched amd_sfh rfkill rapl soundcore i2c_hid_acpi=
 wmi platform_profile snd_pci_acp3x i2c_smbus wireless_hotkey
[  918.564737] kernel:  amd_isp4 i2c_hid amd_pmc serial_multi_instantiate m=
ac_hid i2c_dev crypto_user loop nfnetlink ip_tables x_tables dm_crypt encry=
pted_keys trusted asn1_encoder tee dm_mod nvme nvme_core polyval_clmulni gh=
ash_clmulni_intel ccp sha512_ssse3 sha1_ssse3 aesni_intel nvme_keyring seri=
o_raw nvme_auth
[  918.564754] kernel: CR2: 0000000000000008
[  918.564769] kernel: ---[ end trace 0000000000000000 ]---
[  918.564782] kernel: RIP: 0010:isp_fw_log_print+0x3b/0x240 [amd_capture]
[  918.564799] kernel: Code: 55 53 48 83 ec 38 4c 8b b7 60 0b 00 00 80 bf 5=
8 0b 00 00 01 0f 85 fb 00 00 00 4d 85 f6 0f 84 f2 00 00 00 48 8b 87 30 02 0=
0 00 <4c> 8b 68 08 48 8b 40 20 44 89 6c 24 08 48 89 44 24 10 48 85 c0 0f
[  918.564814] kernel: RSP: 0018:ffffcf864dc7fd40 EFLAGS: 00010286
[  918.564827] kernel: RAX: 0000000000000000 RBX: 0000000000000001 RCX: 000=
0000000000000
[  918.564845] kernel: RDX: ffff8d5b56872180 RSI: ffff8d5b4267b810 RDI: fff=
f8d5b6c14f0a0
[  918.564859] kernel: RBP: ffff8d5b6c14f0a0 R08: 000000d5a123c41d R09: fff=
f8d69bd932340
[  918.564878] kernel: R10: 00000000ffffffff R11: 0000000000000008 R12: fff=
fcf864dc7fdd8
[  918.564893] kernel: R13: ffff8d5b6c14f0a0 R14: ffff8d5b8b400028 R15: 000=
0000000000000
[  918.564908] kernel: FS:  0000000000000000(0000) GS:ffff8d6a13031000(0000=
) knlGS:0000000000000000
[  918.564920] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  918.564934] kernel: CR2: 0000000000000008 CR3: 0000000f4c424000 CR4: 000=
0000000f50ef0
[  918.564950] kernel: PKRU: 55555554
[  918.564963] kernel: note: amd_isp4_thread[5002] exited with irqs disabled
[  918.564981] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  918.565375] kernel: RIP: 0010:isp_fw_log_print+0x3b/0x240 [amd_capture]
[  918.565394] kernel: Code: 55 53 48 83 ec 38 4c 8b b7 60 0b 00 00 80 bf 5=
8 0b 00 00 01 0f 85 fb 00 00 00 4d 85 f6 0f 84 f2 00 00 00 48 8b 87 30 02 0=
0 00 <4c> 8b 68 08 48 8b 40 20 44 89 6c 24 08 48 89 44 24 10 48 85 c0 0f
[  918.565408] kernel: RSP: 0018:ffffcf864dc7fd40 EFLAGS: 00010286
[  918.565421] kernel: RAX: 0000000000000000 RBX: 0000000000000001 RCX: 000=
0000000000000
[  918.565433] kernel: RDX: ffff8d5b56872180 RSI: ffff8d5b4267b810 RDI: fff=
f8d5b6c14f0a0
[  918.565447] kernel: RBP: ffff8d5b6c14f0a0 R08: 000000d5a123c41d R09: fff=
f8d69bd932340
[  918.565461] kernel: R10: 00000000ffffffff R11: 0000000000000008 R12: fff=
fcf864dc7fdd8
[  918.565479] kernel: R13: ffff8d5b6c14f0a0 R14: ffff8d5b8b400028 R15: 000=
0000000000000
[  918.565494] kernel: FS:  0000000000000000(0000) GS:ffff8d6a13231000(0000=
) knlGS:0000000000000000
[  918.565507] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  918.565521] kernel: CR2: 0000000000000008 CR3: 0000000f4c424000 CR4: 000=
0000000f50ef0
[  918.565533] kernel: PKRU: 55555554
[  918.565547] kernel: note: amd_isp4_thread[5001] exited with irqs disabled
[  919.077018] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  920.089013] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  920.238023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  920.646036] kernel: amdgpu 0000:c3:00.0: amdgpu: Dumping IP State
[  921.021024] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  921.508024] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  921.508222] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  921.848028] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  922.285023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  922.682036] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  923.515180] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  924.333010] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  924.350015] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  924.496016] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  924.496305] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  925.185029] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  926.009022] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  926.381025] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  926.838030] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  927.459023] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  927.459268] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  927.678029] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  928.430030] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  928.515027] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  929.351027] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  930.184022] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[  930.439023] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  930.439235] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  930.477023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  932.529902] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  933.404022] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  933.404261] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  934.573027] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  936.382034] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  936.389961] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  936.621027] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  938.669025] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  939.355032] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  939.355290] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  940.035030] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU: I'm not done with =
your previous command: SMN_C2PMSG_66:0x0000001A SMN_C2PMSG_82:0x00000000
[  940.041755] kernel: amdgpu 0000:c3:00.0: amdgpu: Failed to disable gfxof=
f!
[  940.613039] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* [CRTC:86:crtc-0] =
flip_done timed out
[  940.717023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  942.321041] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  942.327940] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  942.765015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  944.813026] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  946.861152] kernel: amdgpu 0000:c3:00.0: amdgpu: MES failed to respond t=
o msg=3DMISC (WAIT_REG_MEM)
[  946.868267] kernel: amdgpu 0000:c3:00.0: amdgpu: failed to reg_write_reg=
_wait
[  946.868449] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  948.157403] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[  948.909023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  950.957023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  951.028997] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[  953.006023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  953.900577] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[  953.950623] kernel: ------------[ cut here ]------------
[  953.950710] kernel: refcount_t: addition on 0; use-after-free.
[  953.950738] kernel: WARNING: CPU: 7 PID: 4999 at lib/refcount.c:25 refco=
unt_warn_saturate+0xe5/0x110
[  953.950764] kernel: Modules linked in: uas usb_storage ccm hid_sensor_gy=
ro_3d hid_sensor_prox hid_sensor_trigger industrialio_triggered_buffer kfif=
o_buf hid_sensor_iio_common industrialio hid_sensor_hub rfcomm snd_seq_dumm=
y snd_hrtimer snd_seq snd_seq_device ov05c10 v4l2_cci amd_capture v4l2_fwno=
de videobuf2_memops videobuf2_v4l2 videobuf2_common v4l2_async videodev mc =
i2c_designware_amdisp pinctrl_amdisp cmac algif_hash algif_skcipher af_alg =
bnep uinput nls_iso8859_1 vfat fat amdgpu mt7925e mt7925_common mt792x_lib =
snd_acp_legacy_mach mt76_connac_lib snd_acp_mach snd_soc_nau8821 mt76 snd_a=
cp3x_rn snd_acp70 amd_atl intel_rapl_msr snd_acp_i2s intel_rapl_common snd_=
acp_pdm snd_acp_pcm snd_soc_dmic snd_sof_amd_acp70 snd_sof_amd_acp63 mac802=
11 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd=
_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_so=
c_acpi_amd_match snd_amd_sdw_acpi snd_hda_scodec_cs35l56_spi soundwire_amd =
snd_ctl_led amdxcp soundwire_generic_allocation kvm_amd
[  953.950881] kernel:  drm_panel_backlight_quirks snd_hda_codec_realtek so=
undwire_bus drm_buddy drm_exec snd_hda_codec_generic drm_suballoc_helper sn=
d_soc_sdca joydev drm_ttm_helper snd_hda_scodec_component libarc4 snd_hda_c=
odec_hdmi mousedev snd_soc_core kvm snd_hda_intel ttm snd_intel_dspcfg cfg8=
0211 snd_intel_sdw_acpi snd_compress i2c_algo_bit ac97_bus snd_hda_codec dr=
m_display_helper snd_pcm_dmaengine snd_rpl_pci_acp6x snd_acp_pci snd_hda_co=
re snd_amd_acpi_mach cec btusb snd_hda_scodec_cs35l56_i2c snd_acp_legacy_co=
mmon snd_hda_scodec_cs35l56 btrtl snd_hwdep snd_pci_acp6x ucsi_acpi snd_hda=
_cirrus_scodec btintel snd_pcm typec_ucsi snd_soc_cs35l56_shared amd_pmf am=
dxdna snd_pci_acp5x spd5118 snd_soc_cs_amp_lib btbcm hp_wmi snd_rn_pci_acp3=
x typec wmi_bmof amdtee cs_dsp hid_multitouch snd_acp_config snd_timer btmt=
k video sparse_keymap sp5100_tco irqbypass roles bluetooth thunderbolt snd =
snd_soc_acpi i2c_piix4 gpu_sched amd_sfh rfkill rapl soundcore i2c_hid_acpi=
 wmi platform_profile snd_pci_acp3x i2c_smbus wireless_hotkey
[  953.950916] kernel:  amd_isp4 i2c_hid amd_pmc serial_multi_instantiate m=
ac_hid i2c_dev crypto_user loop nfnetlink ip_tables x_tables dm_crypt encry=
pted_keys trusted asn1_encoder tee dm_mod nvme nvme_core polyval_clmulni gh=
ash_clmulni_intel ccp sha512_ssse3 sha1_ssse3 aesni_intel nvme_keyring seri=
o_raw nvme_auth
[  953.950943] kernel: CPU: 7 UID: 1000 PID: 4999 Comm: cheese Tainted: G  =
    D             6.16.0-00020-g541e951a4e8a #1 PREEMPT(full)  ec39f80096e0=
b20fee1b3472ffc6dfe32b18badd
[  953.950981] kernel: Tainted: [D]=3DDIE
[  953.951012] kernel: Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile =
Workstation PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[  953.951036] kernel: RIP: 0010:refcount_warn_saturate+0xe5/0x110
[  953.951060] kernel: Code: 6b 81 ff 0f 0b c3 cc cc cc cc 80 3d 25 dd b4 0=
1 00 0f 85 5e ff ff ff 48 c7 c7 c0 0f 37 a9 c6 05 11 dd b4 01 01 e8 5b 6b 8=
1 ff <0f> 0b c3 cc cc cc cc 48 c7 c7 18 10 37 a9 c6 05 f5 dc b4 01 01 e8
[  953.951342] kernel: RSP: 0018:ffffcf864d31fa00 EFLAGS: 00010246
[  953.972367] kernel: RAX: 0000000000000000 RBX: ffff8d5b7585a180 RCX: 000=
0000000000027
[  953.972390] kernel: RDX: ffff8d69bd9dcf88 RSI: 0000000000000001 RDI: fff=
f8d69bd9dcf80
[  953.972411] kernel: RBP: ffff8d5b4267b810 R08: 0000000000000000 R09: 000=
00000ffffdfff
[  953.972439] kernel: R10: ffffffffaa972880 R11: ffffcf864d31f898 R12: 000=
0000000000000
[  953.972462] kernel: R13: 00000000ffffffff R14: ffff8d5b6c14f318 R15: 000=
0000000000000
[  953.972483] kernel: FS:  0000000000000000(0000) GS:ffff8d6a130f1000(0000=
) knlGS:0000000000000000
[  953.972503] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  953.972524] kernel: CR2: 0000564608b1b0f0 CR3: 0000000f4c424000 CR4: 000=
0000000f50ef0
[  953.972554] kernel: PKRU: 55555554
[  953.972574] kernel: Call Trace:
[  953.972597] kernel:  <TASK>
[  953.972618] kernel:  kthread_stop+0x16c/0x180
[  953.972644] kernel:  isp4sd_pwroff_and_deinit+0x6b/0x150 [amd_capture 00=
147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  953.972670] kernel:  pipeline_pm_power_one+0x116/0x120 [videodev 6ca953d=
590d5f834b55197bf3baeb0b473c0bf30]
[  953.972692] kernel:  pipeline_pm_power+0x59/0xa0 [videodev 6ca953d590d5f=
834b55197bf3baeb0b473c0bf30]
[  953.972714] kernel:  v4l2_pipeline_pm_use+0x40/0x70 [videodev 6ca953d590=
d5f834b55197bf3baeb0b473c0bf30]
[  953.972737] kernel:  v4l2_pipeline_pm_put+0x10/0x20 [videodev 6ca953d590=
d5f834b55197bf3baeb0b473c0bf30]
[  953.972758] kernel:  isp4vid_qops_stop_streaming+0xb7/0x230 [amd_capture=
 00147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  953.972776] kernel:  __vb2_queue_cancel+0x2a/0x2c0 [videobuf2_common 6dc=
0659913c788cb8cc89c12dbbcfa4a2ba9594f]
[  953.972798] kernel:  vb2_core_queue_release+0x22/0x80 [videobuf2_common =
6dc0659913c788cb8cc89c12dbbcfa4a2ba9594f]
[  953.972822] kernel:  _vb2_fop_release+0x58/0xb0 [videobuf2_v4l2 aca25aac=
ea650e334c13a3d6e210e973c75ec146]
[  953.972843] kernel:  v4l2_release+0xc0/0xd0 [videodev 6ca953d590d5f834b5=
5197bf3baeb0b473c0bf30]
[  953.972871] kernel:  __fput+0xe3/0x2a0
[  953.972891] kernel:  task_work_run+0x5a/0x90
[  953.972916] kernel:  do_exit+0x29c/0xa80
[  953.972938] kernel:  do_group_exit+0x2d/0xc0
[  953.972959] kernel:  ? _raw_spin_lock_irq+0x2f/0x40
[  953.972981] kernel:  get_signal+0x81c/0x840
[  953.973007] kernel:  arch_do_signal_or_restart+0x3f/0x280
[  953.973038] kernel:  exit_to_user_mode_loop+0x7e/0x150
[  953.973072] kernel:  do_syscall_64+0x1dd/0x970
[  953.973090] kernel:  ? __x64_sys_ioctl+0xb1/0xe0
[  953.973115] kernel:  ? do_syscall_64+0x81/0x970
[  953.973137] kernel:  ? exit_to_user_mode_loop+0xcf/0x150
[  953.973155] kernel:  ? do_syscall_64+0x215/0x970
[  953.973174] kernel:  ? do_syscall_64+0x81/0x970
[  953.973193] kernel:  ? do_syscall_64+0x81/0x970
[  953.973209] kernel:  ? do_syscall_64+0x81/0x970
[  953.973224] kernel:  ? do_syscall_64+0x81/0x970
[  953.973241] kernel:  ? do_syscall_64+0x81/0x970
[  953.973259] kernel:  ? exc_page_fault+0x7e/0x1a0
[  953.973282] kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  953.973300] kernel: RIP: 0033:0x7f2743d88e22
[  953.973323] kernel: Code: Unable to access opcode bytes at 0x7f2743d88df=
8.
[  953.973599] kernel: RSP: 002b:00007f26df3fe438 EFLAGS: 00000246 ORIG_RAX=
: 000000000000010f
[  953.994671] kernel: RAX: fffffffffffffdfe RBX: 0000000000000000 RCX: 000=
07f2743d88e22
[  953.994693] kernel: RDX: 0000000000000000 RSI: 0000000000000003 RDI: 000=
07f26b401e4e0
[  953.994721] kernel: RBP: 00007f26df3fe470 R08: 0000000000000008 R09: 000=
0000000000000
[  953.994739] kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f26d8015f60
[  953.994765] kernel: R13: 00007ffe1c359ef0 R14: 00007f26df3ffcdc R15: 000=
07f26d8015f60
[  953.994786] kernel:  </TASK>
[  953.994808] kernel: ---[ end trace 0000000000000000 ]---
[  953.994826] kernel: ------------[ cut here ]------------
[  953.994843] kernel: WARNING: CPU: 7 PID: 4999 at kernel/kthread.c:84 kth=
read_stop+0x144/0x180
[  953.994862] kernel: Modules linked in: uas usb_storage ccm hid_sensor_gy=
ro_3d hid_sensor_prox hid_sensor_trigger industrialio_triggered_buffer kfif=
o_buf hid_sensor_iio_common industrialio hid_sensor_hub rfcomm snd_seq_dumm=
y snd_hrtimer snd_seq snd_seq_device ov05c10 v4l2_cci amd_capture v4l2_fwno=
de videobuf2_memops videobuf2_v4l2 videobuf2_common v4l2_async videodev mc =
i2c_designware_amdisp pinctrl_amdisp cmac algif_hash algif_skcipher af_alg =
bnep uinput nls_iso8859_1 vfat fat amdgpu mt7925e mt7925_common mt792x_lib =
snd_acp_legacy_mach mt76_connac_lib snd_acp_mach snd_soc_nau8821 mt76 snd_a=
cp3x_rn snd_acp70 amd_atl intel_rapl_msr snd_acp_i2s intel_rapl_common snd_=
acp_pdm snd_acp_pcm snd_soc_dmic snd_sof_amd_acp70 snd_sof_amd_acp63 mac802=
11 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd=
_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_so=
c_acpi_amd_match snd_amd_sdw_acpi snd_hda_scodec_cs35l56_spi soundwire_amd =
snd_ctl_led amdxcp soundwire_generic_allocation kvm_amd
[  953.994894] kernel:  drm_panel_backlight_quirks snd_hda_codec_realtek so=
undwire_bus drm_buddy drm_exec snd_hda_codec_generic drm_suballoc_helper sn=
d_soc_sdca joydev drm_ttm_helper snd_hda_scodec_component libarc4 snd_hda_c=
odec_hdmi mousedev snd_soc_core kvm snd_hda_intel ttm snd_intel_dspcfg cfg8=
0211 snd_intel_sdw_acpi snd_compress i2c_algo_bit ac97_bus snd_hda_codec dr=
m_display_helper snd_pcm_dmaengine snd_rpl_pci_acp6x snd_acp_pci snd_hda_co=
re snd_amd_acpi_mach cec btusb snd_hda_scodec_cs35l56_i2c snd_acp_legacy_co=
mmon snd_hda_scodec_cs35l56 btrtl snd_hwdep snd_pci_acp6x ucsi_acpi snd_hda=
_cirrus_scodec btintel snd_pcm typec_ucsi snd_soc_cs35l56_shared amd_pmf am=
dxdna snd_pci_acp5x spd5118 snd_soc_cs_amp_lib btbcm hp_wmi snd_rn_pci_acp3=
x typec wmi_bmof amdtee cs_dsp hid_multitouch snd_acp_config snd_timer btmt=
k video sparse_keymap sp5100_tco irqbypass roles bluetooth thunderbolt snd =
snd_soc_acpi i2c_piix4 gpu_sched amd_sfh rfkill rapl soundcore i2c_hid_acpi=
 wmi platform_profile snd_pci_acp3x i2c_smbus wireless_hotkey
[  953.994923] kernel:  amd_isp4 i2c_hid amd_pmc serial_multi_instantiate m=
ac_hid i2c_dev crypto_user loop nfnetlink ip_tables x_tables dm_crypt encry=
pted_keys trusted asn1_encoder tee dm_mod nvme nvme_core polyval_clmulni gh=
ash_clmulni_intel ccp sha512_ssse3 sha1_ssse3 aesni_intel nvme_keyring seri=
o_raw nvme_auth
[  953.994937] kernel: CPU: 7 UID: 1000 PID: 4999 Comm: cheese Tainted: G  =
    D W           6.16.0-00020-g541e951a4e8a #1 PREEMPT(full)  ec39f80096e0=
b20fee1b3472ffc6dfe32b18badd
[  953.994954] kernel: Tainted: [D]=3DDIE, [W]=3DWARN
[  953.994984] kernel: Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile =
Workstation PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[  953.995004] kernel: RIP: 0010:kthread_stop+0x144/0x180
[  953.995022] kernel: Code: e9 64 ff ff ff 48 89 df e8 c9 7e fc ff e9 55 f=
f ff ff be 01 00 00 00 48 8d 7b 28 e8 76 4c 7b 00 f6 43 2e 20 0f 85 f5 fe f=
f ff <0f> 0b e9 ee fe ff ff be 03 00 00 00 48 8d 7b 28 e8 57 4c 7b 00 e9
[  953.995043] kernel: RSP: 0018:ffffcf864d31fa08 EFLAGS: 00010246
[  953.995059] kernel: RAX: 0000000000000000 RBX: ffff8d5b7585a180 RCX: 000=
0000000000027
[  953.995076] kernel: RDX: ffff8d69bd9dcf88 RSI: 0000000000000001 RDI: fff=
f8d69bd9dcf80
[  953.995090] kernel: RBP: ffff8d5b4267b810 R08: 0000000000000000 R09: 000=
00000ffffdfff
[  953.995112] kernel: R10: ffffffffaa972880 R11: ffffcf864d31f898 R12: 000=
0000000000000
[  953.995128] kernel: R13: 00000000ffffffff R14: ffff8d5b6c14f318 R15: 000=
0000000000000
[  953.995145] kernel: FS:  0000000000000000(0000) GS:ffff8d6a130f1000(0000=
) knlGS:0000000000000000
[  953.995165] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  953.995179] kernel: CR2: 0000564608b1b0f0 CR3: 0000000f4c424000 CR4: 000=
0000000f50ef0
[  953.995196] kernel: PKRU: 55555554
[  953.995211] kernel: Call Trace:
[  953.995228] kernel:  <TASK>
[  953.995240] kernel:  isp4sd_pwroff_and_deinit+0x6b/0x150 [amd_capture 00=
147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  953.995254] kernel:  pipeline_pm_power_one+0x116/0x120 [videodev 6ca953d=
590d5f834b55197bf3baeb0b473c0bf30]
[  953.995271] kernel:  pipeline_pm_power+0x59/0xa0 [videodev 6ca953d590d5f=
834b55197bf3baeb0b473c0bf30]
[  953.995285] kernel:  v4l2_pipeline_pm_use+0x40/0x70 [videodev 6ca953d590=
d5f834b55197bf3baeb0b473c0bf30]
[  953.995301] kernel:  v4l2_pipeline_pm_put+0x10/0x20 [videodev 6ca953d590=
d5f834b55197bf3baeb0b473c0bf30]
[  953.995313] kernel:  isp4vid_qops_stop_streaming+0xb7/0x230 [amd_capture=
 00147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  953.995329] kernel:  __vb2_queue_cancel+0x2a/0x2c0 [videobuf2_common 6dc=
0659913c788cb8cc89c12dbbcfa4a2ba9594f]
[  953.995343] kernel:  vb2_core_queue_release+0x22/0x80 [videobuf2_common =
6dc0659913c788cb8cc89c12dbbcfa4a2ba9594f]
[  953.995356] kernel:  _vb2_fop_release+0x58/0xb0 [videobuf2_v4l2 aca25aac=
ea650e334c13a3d6e210e973c75ec146]
[  953.995368] kernel:  v4l2_release+0xc0/0xd0 [videodev 6ca953d590d5f834b5=
5197bf3baeb0b473c0bf30]
[  953.995387] kernel:  __fput+0xe3/0x2a0
[  953.995401] kernel:  task_work_run+0x5a/0x90
[  953.995414] kernel:  do_exit+0x29c/0xa80
[  953.995428] kernel:  do_group_exit+0x2d/0xc0
[  953.995439] kernel:  ? _raw_spin_lock_irq+0x2f/0x40
[  953.995451] kernel:  get_signal+0x81c/0x840
[  953.995466] kernel:  arch_do_signal_or_restart+0x3f/0x280
[  953.995480] kernel:  exit_to_user_mode_loop+0x7e/0x150
[  953.995497] kernel:  do_syscall_64+0x1dd/0x970
[  953.995510] kernel:  ? __x64_sys_ioctl+0xb1/0xe0
[  953.995522] kernel:  ? do_syscall_64+0x81/0x970
[  953.995536] kernel:  ? exit_to_user_mode_loop+0xcf/0x150
[  953.995548] kernel:  ? do_syscall_64+0x215/0x970
[  953.995568] kernel:  ? do_syscall_64+0x81/0x970
[  953.995580] kernel:  ? do_syscall_64+0x81/0x970
[  953.995599] kernel:  ? do_syscall_64+0x81/0x970
[  953.995613] kernel:  ? do_syscall_64+0x81/0x970
[  953.995861] kernel:  ? do_syscall_64+0x81/0x970
[  954.017430] kernel:  ? exc_page_fault+0x7e/0x1a0
[  954.017445] kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  954.017487] kernel: RIP: 0033:0x7f2743d88e22
[  954.017513] kernel: Code: Unable to access opcode bytes at 0x7f2743d88df=
8.
[  954.017522] kernel: RSP: 002b:00007f26df3fe438 EFLAGS: 00000246 ORIG_RAX=
: 000000000000010f
[  954.017532] kernel: RAX: fffffffffffffdfe RBX: 0000000000000000 RCX: 000=
07f2743d88e22
[  954.017539] kernel: RDX: 0000000000000000 RSI: 0000000000000003 RDI: 000=
07f26b401e4e0
[  954.017543] kernel: RBP: 00007f26df3fe470 R08: 0000000000000008 R09: 000=
0000000000000
[  954.017547] kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f26d8015f60
[  954.017557] kernel: R13: 00007ffe1c359ef0 R14: 00007f26df3ffcdc R15: 000=
07f26d8015f60
[  954.017563] kernel:  </TASK>
[  954.017570] kernel: ---[ end trace 0000000000000000 ]---
[  954.017577] kernel: BUG: kernel NULL pointer dereference, address: 00000=
00000000000
[  954.017701] kernel: #PF: supervisor write access in kernel mode
[  954.017792] kernel: #PF: error_code(0x0002) - not-present page
[  954.017878] kernel: PGD 0 P4D 0=20
[  954.017944] kernel: Oops: Oops: 0002 [#3] SMP NOPTI
[  954.017955] kernel: CPU: 7 UID: 1000 PID: 4999 Comm: cheese Tainted: G  =
    D W           6.16.0-00020-g541e951a4e8a #1 PREEMPT(full)  ec39f80096e0=
b20fee1b3472ffc6dfe32b18badd
[  954.017962] kernel: Tainted: [D]=3DDIE, [W]=3DWARN
[  954.017968] kernel: Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile =
Workstation PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[  954.017972] kernel: RIP: 0010:kthread_stop+0x40/0x180
[  954.017985] kernel: Code: 00 f0 0f c1 43 28 85 c0 0f 84 3a 01 00 00 8d 5=
0 01 09 c2 0f 88 fd 00 00 00 f6 43 2e 20 0f 84 0b 01 00 00 48 8b ab a8 0b 0=
0 00 <f0> 80 4d 00 02 48 89 df e8 a3 fe ff ff f0 80 4b 02 02 48 89 df e8
[  954.017998] kernel: RSP: 0018:ffffcf864d31fa08 EFLAGS: 00010246
[  954.018011] kernel: RAX: 0000000000000000 RBX: ffff8d5b7585a180 RCX: 000=
0000000000027
[  954.018025] kernel: RDX: ffff8d69bd9dcf88 RSI: 0000000000000001 RDI: fff=
f8d69bd9dcf80
[  954.018031] kernel: RBP: 0000000000000000 R08: 0000000000000000 R09: 000=
00000ffffdfff
[  954.018038] kernel: R10: ffffffffaa972880 R11: ffffcf864d31f898 R12: 000=
0000000000000
[  954.018045] kernel: R13: 00000000ffffffff R14: ffff8d5b6c14f318 R15: 000=
0000000000000
[  954.018051] kernel: FS:  0000000000000000(0000) GS:ffff8d6a130f1000(0000=
) knlGS:0000000000000000
[  954.018062] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  954.018067] kernel: CR2: 0000000000000000 CR3: 0000000f4c424000 CR4: 000=
0000000f50ef0
[  954.018074] kernel: PKRU: 55555554
[  954.018082] kernel: Call Trace:
[  954.018088] kernel:  <TASK>
[  954.018094] kernel:  isp4sd_pwroff_and_deinit+0x6b/0x150 [amd_capture 00=
147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  954.018100] kernel:  pipeline_pm_power_one+0x116/0x120 [videodev 6ca953d=
590d5f834b55197bf3baeb0b473c0bf30]
[  954.018105] kernel:  pipeline_pm_power+0x59/0xa0 [videodev 6ca953d590d5f=
834b55197bf3baeb0b473c0bf30]
[  954.018113] kernel:  v4l2_pipeline_pm_use+0x40/0x70 [videodev 6ca953d590=
d5f834b55197bf3baeb0b473c0bf30]
[  954.018120] kernel:  v4l2_pipeline_pm_put+0x10/0x20 [videodev 6ca953d590=
d5f834b55197bf3baeb0b473c0bf30]
[  954.018125] kernel:  isp4vid_qops_stop_streaming+0xb7/0x230 [amd_capture=
 00147f32a555e0c4384c29b5a17f76e9c9e1a01b]
[  954.018135] kernel:  __vb2_queue_cancel+0x2a/0x2c0 [videobuf2_common 6dc=
0659913c788cb8cc89c12dbbcfa4a2ba9594f]
[  954.018142] kernel:  vb2_core_queue_release+0x22/0x80 [videobuf2_common =
6dc0659913c788cb8cc89c12dbbcfa4a2ba9594f]
[  954.018150] kernel:  _vb2_fop_release+0x58/0xb0 [videobuf2_v4l2 aca25aac=
ea650e334c13a3d6e210e973c75ec146]
[  954.018154] kernel:  v4l2_release+0xc0/0xd0 [videodev 6ca953d590d5f834b5=
5197bf3baeb0b473c0bf30]
[  954.018160] kernel:  __fput+0xe3/0x2a0
[  954.018167] kernel:  task_work_run+0x5a/0x90
[  954.018175] kernel:  do_exit+0x29c/0xa80
[  954.018181] kernel:  do_group_exit+0x2d/0xc0
[  954.018187] kernel:  ? _raw_spin_lock_irq+0x2f/0x40
[  954.018193] kernel:  get_signal+0x81c/0x840
[  954.018199] kernel:  arch_do_signal_or_restart+0x3f/0x280
[  954.018203] kernel:  exit_to_user_mode_loop+0x7e/0x150
[  954.018207] kernel:  do_syscall_64+0x1dd/0x970
[  954.018213] kernel:  ? __x64_sys_ioctl+0xb1/0xe0
[  954.018219] kernel:  ? do_syscall_64+0x81/0x970
[  954.018224] kernel:  ? exit_to_user_mode_loop+0xcf/0x150
[  954.018229] kernel:  ? do_syscall_64+0x215/0x970
[  954.018236] kernel:  ? do_syscall_64+0x81/0x970
[  954.018244] kernel:  ? do_syscall_64+0x81/0x970
[  954.018251] kernel:  ? do_syscall_64+0x81/0x970
[  954.018260] kernel:  ? do_syscall_64+0x81/0x970
[  954.018264] kernel:  ? do_syscall_64+0x81/0x970
[  954.018274] kernel:  ? exc_page_fault+0x7e/0x1a0
[  954.018278] kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  954.018283] kernel: RIP: 0033:0x7f2743d88e22
[  954.018290] kernel: Code: Unable to access opcode bytes at 0x7f2743d88df=
8.
[  954.018296] kernel: RSP: 002b:00007f26df3fe438 EFLAGS: 00000246 ORIG_RAX=
: 000000000000010f
[  954.018301] kernel: RAX: fffffffffffffdfe RBX: 0000000000000000 RCX: 000=
07f2743d88e22
[  954.018306] kernel: RDX: 0000000000000000 RSI: 0000000000000003 RDI: 000=
07f26b401e4e0
[  954.018564] kernel: RBP: 00007f26df3fe470 R08: 0000000000000008 R09: 000=
0000000000000
[  954.018572] kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f26d8015f60
[  954.018579] kernel: R13: 00007ffe1c359ef0 R14: 00007f26df3ffcdc R15: 000=
07f26d8015f60
[  954.018587] kernel:  </TASK>
[  954.018594] kernel: Modules linked in: uas usb_storage ccm hid_sensor_gy=
ro_3d hid_sensor_prox hid_sensor_trigger industrialio_triggered_buffer kfif=
o_buf hid_sensor_iio_common industrialio hid_sensor_hub rfcomm snd_seq_dumm=
y snd_hrtimer snd_seq snd_seq_device ov05c10 v4l2_cci amd_capture v4l2_fwno=
de videobuf2_memops videobuf2_v4l2 videobuf2_common v4l2_async videodev mc =
i2c_designware_amdisp pinctrl_amdisp cmac algif_hash algif_skcipher af_alg =
bnep uinput nls_iso8859_1 vfat fat amdgpu mt7925e mt7925_common mt792x_lib =
snd_acp_legacy_mach mt76_connac_lib snd_acp_mach snd_soc_nau8821 mt76 snd_a=
cp3x_rn snd_acp70 amd_atl intel_rapl_msr snd_acp_i2s intel_rapl_common snd_=
acp_pdm snd_acp_pcm snd_soc_dmic snd_sof_amd_acp70 snd_sof_amd_acp63 mac802=
11 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd=
_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_so=
c_acpi_amd_match snd_amd_sdw_acpi snd_hda_scodec_cs35l56_spi soundwire_amd =
snd_ctl_led amdxcp soundwire_generic_allocation kvm_amd
[  954.040885] kernel:  drm_panel_backlight_quirks snd_hda_codec_realtek so=
undwire_bus drm_buddy drm_exec snd_hda_codec_generic drm_suballoc_helper sn=
d_soc_sdca joydev drm_ttm_helper snd_hda_scodec_component libarc4 snd_hda_c=
odec_hdmi mousedev snd_soc_core kvm snd_hda_intel ttm snd_intel_dspcfg cfg8=
0211 snd_intel_sdw_acpi snd_compress i2c_algo_bit ac97_bus snd_hda_codec dr=
m_display_helper snd_pcm_dmaengine snd_rpl_pci_acp6x snd_acp_pci snd_hda_co=
re snd_amd_acpi_mach cec btusb snd_hda_scodec_cs35l56_i2c snd_acp_legacy_co=
mmon snd_hda_scodec_cs35l56 btrtl snd_hwdep snd_pci_acp6x ucsi_acpi snd_hda=
_cirrus_scodec btintel snd_pcm typec_ucsi snd_soc_cs35l56_shared amd_pmf am=
dxdna snd_pci_acp5x spd5118 snd_soc_cs_amp_lib btbcm hp_wmi snd_rn_pci_acp3=
x typec wmi_bmof amdtee cs_dsp hid_multitouch snd_acp_config snd_timer btmt=
k video sparse_keymap sp5100_tco irqbypass roles bluetooth thunderbolt snd =
snd_soc_acpi i2c_piix4 gpu_sched amd_sfh rfkill rapl soundcore i2c_hid_acpi=
 wmi platform_profile snd_pci_acp3x i2c_smbus wireless_hotkey
[  954.040898] kernel:  amd_isp4 i2c_hid amd_pmc serial_multi_instantiate m=
ac_hid i2c_dev crypto_user loop nfnetlink ip_tables x_tables dm_crypt encry=
pted_keys trusted asn1_encoder tee dm_mod nvme nvme_core polyval_clmulni gh=
ash_clmulni_intel ccp sha512_ssse3 sha1_ssse3 aesni_intel nvme_keyring seri=
o_raw nvme_auth
[  954.040908] kernel: CR2: 0000000000000000
[  954.040919] kernel: ---[ end trace 0000000000000000 ]---
[  954.285065] kernel: RIP: 0010:isp_fw_log_print+0x3b/0x240 [amd_capture]
[  954.285380] kernel: Code: 55 53 48 83 ec 38 4c 8b b7 60 0b 00 00 80 bf 5=
8 0b 00 00 01 0f 85 fb 00 00 00 4d 85 f6 0f 84 f2 00 00 00 48 8b 87 30 02 0=
0 00 <4c> 8b 68 08 48 8b 40 20 44 89 6c 24 08 48 89 44 24 10 48 85 c0 0f
[  954.285399] kernel: RSP: 0018:ffffcf864dc7fd40 EFLAGS: 00010286
[  954.285414] kernel: RAX: 0000000000000000 RBX: 0000000000000001 RCX: 000=
0000000000000
[  954.285433] kernel: RDX: ffff8d5b56872180 RSI: ffff8d5b4267b810 RDI: fff=
f8d5b6c14f0a0
[  954.285442] kernel: RBP: ffff8d5b6c14f0a0 R08: 000000d5a123c41d R09: fff=
f8d69bd932340
[  954.285532] kernel: R10: 00000000ffffffff R11: 0000000000000008 R12: fff=
fcf864dc7fdd8
[  954.285543] kernel: R13: ffff8d5b6c14f0a0 R14: ffff8d5b8b400028 R15: 000=
0000000000000
[  954.285555] kernel: FS:  0000000000000000(0000) GS:ffff8d6a130f1000(0000=
) knlGS:0000000000000000
[  954.285571] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  954.285583] kernel: CR2: 0000000000000000 CR3: 0000000f4c424000 CR4: 000=
0000000f50ef0
[  954.285594] kernel: PKRU: 55555554
[  954.285605] kernel: note: cheese[4999] exited with irqs disabled
[  954.285621] kernel: Fixing recursive fault but reboot is needed!
[  954.285730] kernel: BUG: scheduling while atomic: cheese/4999/0x00000000
[  954.285783] kernel: Modules linked in: uas usb_storage ccm hid_sensor_gy=
ro_3d hid_sensor_prox hid_sensor_trigger industrialio_triggered_buffer kfif=
o_buf hid_sensor_iio_common industrialio hid_sensor_hub rfcomm snd_seq_dumm=
y snd_hrtimer snd_seq snd_seq_device ov05c10 v4l2_cci amd_capture v4l2_fwno=
de videobuf2_memops videobuf2_v4l2 videobuf2_common v4l2_async videodev mc =
i2c_designware_amdisp pinctrl_amdisp cmac algif_hash algif_skcipher af_alg =
bnep uinput nls_iso8859_1 vfat fat amdgpu mt7925e mt7925_common mt792x_lib =
snd_acp_legacy_mach mt76_connac_lib snd_acp_mach snd_soc_nau8821 mt76 snd_a=
cp3x_rn snd_acp70 amd_atl intel_rapl_msr snd_acp_i2s intel_rapl_common snd_=
acp_pdm snd_acp_pcm snd_soc_dmic snd_sof_amd_acp70 snd_sof_amd_acp63 mac802=
11 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd=
_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_so=
c_acpi_amd_match snd_amd_sdw_acpi snd_hda_scodec_cs35l56_spi soundwire_amd =
snd_ctl_led amdxcp soundwire_generic_allocation kvm_amd
[  954.285852] kernel:  drm_panel_backlight_quirks snd_hda_codec_realtek so=
undwire_bus drm_buddy drm_exec snd_hda_codec_generic drm_suballoc_helper sn=
d_soc_sdca joydev drm_ttm_helper snd_hda_scodec_component libarc4 snd_hda_c=
odec_hdmi mousedev snd_soc_core kvm snd_hda_intel ttm snd_intel_dspcfg cfg8=
0211 snd_intel_sdw_acpi snd_compress i2c_algo_bit ac97_bus snd_hda_codec dr=
m_display_helper snd_pcm_dmaengine snd_rpl_pci_acp6x snd_acp_pci snd_hda_co=
re snd_amd_acpi_mach cec btusb snd_hda_scodec_cs35l56_i2c snd_acp_legacy_co=
mmon snd_hda_scodec_cs35l56 btrtl snd_hwdep snd_pci_acp6x ucsi_acpi snd_hda=
_cirrus_scodec btintel snd_pcm typec_ucsi snd_soc_cs35l56_shared amd_pmf am=
dxdna snd_pci_acp5x spd5118 snd_soc_cs_amp_lib btbcm hp_wmi snd_rn_pci_acp3=
x typec wmi_bmof amdtee cs_dsp hid_multitouch snd_acp_config snd_timer btmt=
k video sparse_keymap sp5100_tco irqbypass roles bluetooth thunderbolt snd =
snd_soc_acpi i2c_piix4 gpu_sched amd_sfh rfkill rapl soundcore i2c_hid_acpi=
 wmi platform_profile snd_pci_acp3x i2c_smbus wireless_hotkey
[  954.285872] kernel:  amd_isp4 i2c_hid amd_pmc serial_multi_instantiate m=
ac_hid i2c_dev crypto_user loop nfnetlink ip_tables x_tables dm_crypt encry=
pted_keys trusted asn1_encoder tee dm_mod nvme nvme_core polyval_clmulni gh=
ash_clmulni_intel ccp sha512_ssse3 sha1_ssse3 aesni_intel nvme_keyring seri=
o_raw nvme_auth
[  954.285882] kernel: CPU: 7 UID: 1000 PID: 4999 Comm: cheese Tainted: G  =
    D W           6.16.0-00020-g541e951a4e8a #1 PREEMPT(full)  ec39f80096e0=
b20fee1b3472ffc6dfe32b18badd
[  954.285895] kernel: Tainted: [D]=3DDIE, [W]=3DWARN
[  954.285905] kernel: Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile =
Workstation PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[  954.285914] kernel: Call Trace:
[  954.285934] kernel:  <TASK>
[  954.285942] kernel:  dump_stack_lvl+0x5d/0x80
[  954.285955] kernel:  __schedule_bug.cold+0x42/0x4e
[  954.285962] kernel:  __schedule+0x1080/0x1320
[  954.285980] kernel:  ? irq_work_queue+0x2d/0x50
[  954.285993] kernel:  ? _printk+0x6b/0x90
[  954.286015] kernel:  do_task_dead+0x4b/0xb0
[  954.286026] kernel:  make_task_dead.cold+0x10a/0x116
[  954.286035] kernel:  rewind_stack_and_make_dead+0x16/0x20
[  954.286047] kernel: RIP: 0033:0x7f2743d88e22
[  954.286054] kernel: Code: Unable to access opcode bytes at 0x7f2743d88df=
8.
[  954.286066] kernel: RSP: 002b:00007f26df3fe438 EFLAGS: 00000246 ORIG_RAX=
: 000000000000010f
[  954.286075] kernel: RAX: fffffffffffffdfe RBX: 0000000000000000 RCX: 000=
07f2743d88e22
[  954.286088] kernel: RDX: 0000000000000000 RSI: 0000000000000003 RDI: 000=
07f26b401e4e0
[  954.286096] kernel: RBP: 00007f26df3fe470 R08: 0000000000000008 R09: 000=
0000000000000
[  954.286108] kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f26d8015f60
[  954.286113] kernel: R13: 00007ffe1c359ef0 R14: 00007f26df3ffcdc R15: 000=
07f26d8015f60
[  954.286123] kernel:  </TASK>
[  955.116025] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  957.165016] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  959.213013] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  961.261015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  962.901024] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU: I'm not done with =
your previous command: SMN_C2PMSG_66:0x0000001A SMN_C2PMSG_82:0x00000000
[  962.908194] kernel: amdgpu 0000:c3:00.0: amdgpu: Failed to disable gfxof=
f!
[  963.309015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  965.357018] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  967.405013] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  969.453017] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  971.501015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  973.549019] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  975.597021] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  977.645020] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  979.693019] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  981.741032] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  983.789025] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  985.837015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  986.139012] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU: I'm not done with =
your previous command: SMN_C2PMSG_66:0x0000001A SMN_C2PMSG_82:0x00000000
[  986.139115] kernel: amdgpu 0000:c3:00.0: amdgpu: Failed to disable gfxof=
f!
[  987.885014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  989.933024] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  991.981023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  994.029029] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  996.077027] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[  998.125027] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1000.173011] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1002.221031] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1004.269023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1006.317028] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1008.365025] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1009.189023] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU: I'm not done with =
your previous command: SMN_C2PMSG_66:0x0000001A SMN_C2PMSG_82:0x00000000
[ 1009.195852] kernel: amdgpu 0000:c3:00.0: amdgpu: Failed to disable gfxof=
f!
[ 1009.196050] kernel: amdgpu 0000:c3:00.0: amdgpu: Dumping IP State Comple=
ted
[ 1009.196194] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] AMDGPU device cor=
edump file has been created
[ 1009.196325] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Check your /sys/c=
lass/drm/card1/device/devcoredump/data
[ 1009.196454] kernel: amdgpu 0000:c3:00.0: amdgpu: ring sdma0 timeout, sig=
naled seq=3D30914, emitted seq=3D30917
[ 1009.196584] kernel: amdgpu 0000:c3:00.0: amdgpu: Starting sdma0 ring res=
et
[ 1009.196709] kernel: amdgpu 0000:c3:00.0: amdgpu: reset sdma queue (0:0:0)
[ 1009.372022] kernel: amdgpu 0000:c3:00.0: [drm:amdgpu_ring_test_helper [a=
mdgpu]] *ERROR* ring sdma0 test failed (-110)
[ 1009.372212] kernel: amdgpu 0000:c3:00.0: amdgpu: Ring sdma0 reset failure
[ 1009.372349] kernel: amdgpu 0000:c3:00.0: amdgpu: GPU reset begin!
[ 1010.413028] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1012.461014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1014.509018] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1016.557019] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1032.645275] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU: I'm not done with =
your previous command: SMN_C2PMSG_66:0x0000001A SMN_C2PMSG_82:0x00000000
[ 1032.650837] kernel: amdgpu 0000:c3:00.0: amdgpu: Failed to power ungate =
VPE!
[ 1032.650911] kernel: [drm:vpe_set_powergating_state [amdgpu]] *ERROR* Dpm=
 enable vpe failed, ret =3D -62.
[ 1046.080016] kernel: ACPI Error: Aborting method \_SB.A018 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1046.086586] kernel: ACPI Error: Aborting method \_SB.A032 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1046.086630] kernel: ACPI Error: Aborting method \_SB.ALIB due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1046.086659] kernel: ACPI Error: Aborting method \_SB.PLOV due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1046.086697] kernel: ACPI Error: Aborting method \_SB.APX8 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1046.086726] kernel: ACPI Error: Aborting method \_SB.PMF.PMF8 due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1046.086750] kernel: ACPI Error: Aborting method \_SB.PMF.APMF due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1046.086771] kernel: amd-pmf AMDI0105:00: APMF method:8 call failed
[ 1050.097014] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU: I'm not done with =
your previous command: SMN_C2PMSG_66:0x0000001A SMN_C2PMSG_82:0x00000000
[ 1050.103571] kernel: amdgpu 0000:c3:00.0: amdgpu: Failed to disable gfxof=
f!
[ 1050.920019] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1051.743015] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1052.610015] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1053.541011] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1054.474015] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1055.397014] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1056.503015] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1057.392014] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1058.479014] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1059.348027] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1076.091014] kernel: ACPI Error: Aborting method \_SB.A018 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1076.097404] kernel: ACPI Error: Aborting method \_SB.A032 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1076.097424] kernel: ACPI Error: Aborting method \_SB.ALIB due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1076.097439] kernel: ACPI Error: Aborting method \_SB.PLOV due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1076.097451] kernel: ACPI Error: Aborting method \_SB.APX8 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1076.097464] kernel: ACPI Error: Aborting method \_SB.PMF.PMF8 due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1076.097475] kernel: ACPI Error: Aborting method \_SB.PMF.APMF due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1076.097486] kernel: amd-pmf AMDI0105:00: APMF method:8 call failed
[ 1077.092016] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1079.149015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1081.197014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1083.245014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1085.293014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1087.341014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1089.389014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1091.437013] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1093.485014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1093.967013] kernel: ------------[ cut here ]------------
[ 1093.973545] kernel: WARNING: CPU: 6 PID: 3965 at drivers/gpu/drm/amd/amd=
gpu/../display/dc/clk_mgr/dcn35/dcn35_smu.c:175 dcn35_smu_send_msg_with_par=
am+0x10c/0x1d0 [amdgpu]
[ 1093.973564] kernel: Modules linked in: uas usb_storage ccm hid_sensor_gy=
ro_3d hid_sensor_prox hid_sensor_trigger industrialio_triggered_buffer kfif=
o_buf hid_sensor_iio_common industrialio hid_sensor_hub rfcomm snd_seq_dumm=
y snd_hrtimer snd_seq snd_seq_device ov05c10 v4l2_cci amd_capture v4l2_fwno=
de videobuf2_memops videobuf2_v4l2 videobuf2_common v4l2_async videodev mc =
i2c_designware_amdisp pinctrl_amdisp cmac algif_hash algif_skcipher af_alg =
bnep uinput nls_iso8859_1 vfat fat amdgpu mt7925e mt7925_common mt792x_lib =
snd_acp_legacy_mach mt76_connac_lib snd_acp_mach snd_soc_nau8821 mt76 snd_a=
cp3x_rn snd_acp70 amd_atl intel_rapl_msr snd_acp_i2s intel_rapl_common snd_=
acp_pdm snd_acp_pcm snd_soc_dmic snd_sof_amd_acp70 snd_sof_amd_acp63 mac802=
11 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd=
_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_so=
c_acpi_amd_match snd_amd_sdw_acpi snd_hda_scodec_cs35l56_spi soundwire_amd =
snd_ctl_led amdxcp soundwire_generic_allocation kvm_amd
[ 1093.973646] kernel:  drm_panel_backlight_quirks snd_hda_codec_realtek so=
undwire_bus drm_buddy drm_exec snd_hda_codec_generic drm_suballoc_helper sn=
d_soc_sdca joydev drm_ttm_helper snd_hda_scodec_component libarc4 snd_hda_c=
odec_hdmi mousedev snd_soc_core kvm snd_hda_intel ttm snd_intel_dspcfg cfg8=
0211 snd_intel_sdw_acpi snd_compress i2c_algo_bit ac97_bus snd_hda_codec dr=
m_display_helper snd_pcm_dmaengine snd_rpl_pci_acp6x snd_acp_pci snd_hda_co=
re snd_amd_acpi_mach cec btusb snd_hda_scodec_cs35l56_i2c snd_acp_legacy_co=
mmon snd_hda_scodec_cs35l56 btrtl snd_hwdep snd_pci_acp6x ucsi_acpi snd_hda=
_cirrus_scodec btintel snd_pcm typec_ucsi snd_soc_cs35l56_shared amd_pmf am=
dxdna snd_pci_acp5x spd5118 snd_soc_cs_amp_lib btbcm hp_wmi snd_rn_pci_acp3=
x typec wmi_bmof amdtee cs_dsp hid_multitouch snd_acp_config snd_timer btmt=
k video sparse_keymap sp5100_tco irqbypass roles bluetooth thunderbolt snd =
snd_soc_acpi i2c_piix4 gpu_sched amd_sfh rfkill rapl soundcore i2c_hid_acpi=
 wmi platform_profile snd_pci_acp3x i2c_smbus wireless_hotkey
[ 1093.973668] kernel:  amd_isp4 i2c_hid amd_pmc serial_multi_instantiate m=
ac_hid i2c_dev crypto_user loop nfnetlink ip_tables x_tables dm_crypt encry=
pted_keys trusted asn1_encoder tee dm_mod nvme nvme_core polyval_clmulni gh=
ash_clmulni_intel ccp sha512_ssse3 sha1_ssse3 aesni_intel nvme_keyring seri=
o_raw nvme_auth
[ 1093.973686] kernel: CPU: 6 UID: 0 PID: 3965 Comm: kworker/u128:3 Tainted=
: G      D W           6.16.0-00020-g541e951a4e8a #1 PREEMPT(full)  ec39f80=
096e0b20fee1b3472ffc6dfe32b18badd
[ 1093.973704] kernel: Tainted: [D]=3DDIE, [W]=3DWARN
[ 1093.973721] kernel: Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile =
Workstation PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[ 1093.973731] kernel: Workqueue: amdgpu-reset-dev drm_sched_job_timedout [=
gpu_sched]
[ 1093.973744] kernel: RIP: 0010:dcn35_smu_send_msg_with_param+0x10c/0x1d0 =
[amdgpu]
[ 1093.973761] kernel: Code: cd 48 8b 3b 3d ff 00 00 00 0f 84 8a 00 00 00 4=
8 83 c4 08 48 c7 c2 10 21 27 c2 be 93 62 01 00 5b 5d 41 5c 41 5d e9 94 b3 e=
e ff <0f> 0b bd 80 84 1e 00 48 c7 c2 f0 1f 27 c2 be 9b 62 01 00 e8 7c b3
[ 1093.973776] kernel: RSP: 0018:ffffcf864dabf818 EFLAGS: 00010246
[ 1093.973790] kernel: RAX: 0000000000000000 RBX: ffff8d5b477bfc00 RCX: 000=
0000000000006
[ 1093.973803] kernel: RDX: 0000000000007ddc RSI: 00000000000074f5 RDI: fff=
f8d5b47f8eb00
[ 1093.973817] kernel: RBP: 00000000ffffffff R08: ffffcf864dabf81c R09: 000=
0000000000016
[ 1093.973830] kernel: R10: 00000000000039bc R11: 00000000000039ba R12: 000=
0000000000015
[ 1093.973843] kernel: R13: 0000000000000700 R14: ffff8d5b477bfc00 R15: fff=
f8d5c6dc00000
[ 1093.973855] kernel: FS:  0000000000000000(0000) GS:ffff8d6a130b1000(0000=
) knlGS:0000000000000000
[ 1093.973868] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1093.973878] kernel: CR2: 00007fd9b32edce8 CR3: 0000000f4c424000 CR4: 000=
0000000f50ef0
[ 1093.973888] kernel: PKRU: 55555554
[ 1093.973898] kernel: Call Trace:
[ 1093.973913] kernel:  <TASK>
[ 1093.973926] kernel:  dcn35_smu_set_zstate_support+0x58/0x190 [amdgpu 983=
cbf93452e2aff0ee5d819daca7797cd468da1]
[ 1093.973940] kernel:  dcn35_update_clocks+0xc8/0x620 [amdgpu 983cbf93452e=
2aff0ee5d819daca7797cd468da1]
[ 1093.973951] kernel:  dcn20_optimize_bandwidth+0x119/0x220 [amdgpu 983cbf=
93452e2aff0ee5d819daca7797cd468da1]
[ 1093.973964] kernel:  dcn35_optimize_bandwidth+0x58/0xd0 [amdgpu 983cbf93=
452e2aff0ee5d819daca7797cd468da1]
[ 1093.973975] kernel:  dc_commit_state_no_check+0xd0b/0xf70 [amdgpu 983cbf=
93452e2aff0ee5d819daca7797cd468da1]
[ 1093.973986] kernel:  dc_commit_streams+0x2c9/0x480 [amdgpu 983cbf93452e2=
aff0ee5d819daca7797cd468da1]
[ 1093.974010] kernel:  dm_suspend+0x221/0x280 [amdgpu 983cbf93452e2aff0ee5=
d819daca7797cd468da1]
[ 1093.974022] kernel:  amdgpu_ip_block_suspend+0x24/0x50 [amdgpu 983cbf934=
52e2aff0ee5d819daca7797cd468da1]
[ 1093.974071] kernel:  amdgpu_device_ip_suspend_phase1+0xaa/0xc0 [amdgpu 9=
83cbf93452e2aff0ee5d819daca7797cd468da1]
[ 1093.974122] kernel:  amdgpu_device_ip_suspend+0x2c/0x80 [amdgpu 983cbf93=
452e2aff0ee5d819daca7797cd468da1]
[ 1093.974140] kernel:  ? amdgpu_device_ip_need_full_reset+0x16/0x80 [amdgp=
u 983cbf93452e2aff0ee5d819daca7797cd468da1]
[ 1093.974162] kernel:  amdgpu_device_pre_asic_reset+0xe9/0x2c0 [amdgpu 983=
cbf93452e2aff0ee5d819daca7797cd468da1]
[ 1093.974179] kernel:  amdgpu_device_asic_reset+0x56/0x46f [amdgpu 983cbf9=
3452e2aff0ee5d819daca7797cd468da1]
[ 1093.974202] kernel:  amdgpu_device_gpu_recover.cold+0x1e3/0x238 [amdgpu =
983cbf93452e2aff0ee5d819daca7797cd468da1]
[ 1093.974221] kernel:  amdgpu_job_timedout.cold+0x20a/0x450 [amdgpu 983cbf=
93452e2aff0ee5d819daca7797cd468da1]
[ 1093.974240] kernel:  drm_sched_job_timedout+0x85/0x120 [gpu_sched ba418b=
4c7d9c20d3d2bb52ba3c60dabf01715081]
[ 1093.974272] kernel:  process_one_work+0x190/0x350
[ 1093.974295] kernel:  worker_thread+0x2d7/0x410
[ 1093.974312] kernel:  ? __pfx_worker_thread+0x10/0x10
[ 1093.974335] kernel:  kthread+0xf9/0x240
[ 1093.974356] kernel:  ? __pfx_kthread+0x10/0x10
[ 1093.974373] kernel:  ? __pfx_kthread+0x10/0x10
[ 1093.974390] kernel:  ret_from_fork+0x198/0x1d0
[ 1093.974406] kernel:  ? __pfx_kthread+0x10/0x10
[ 1093.974421] kernel:  ret_from_fork_asm+0x1a/0x30
[ 1093.974439] kernel:  </TASK>
[ 1093.974458] kernel: ---[ end trace 0000000000000000 ]---
[ 1095.533025] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1097.581015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1099.629026] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1129.274032] kernel: amdgpu 0000:c3:00.0: [drm] SMU response after wait: =
0, msg id =3D 21
[ 1130.666029] kernel: ACPI Error: Aborting method \_SB.A018 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1130.670760] kernel: ACPI Error: Aborting method \_SB.A032 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1130.670795] kernel: ACPI Error: Aborting method \_SB.ALIB due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1130.670818] kernel: ACPI Error: Aborting method \_SB.PLOV due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1130.670840] kernel: ACPI Error: Aborting method \_SB.APX8 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1130.670863] kernel: ACPI Error: Aborting method \_SB.PMF.PMF8 due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1130.670883] kernel: ACPI Error: Aborting method \_SB.PMF.APMF due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1130.670904] kernel: amd-pmf AMDI0105:00: APMF method:8 call failed
[ 1131.674023] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1160.678035] kernel: ACPI Error: Aborting method \_SB.A018 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1160.684188] kernel: ACPI Error: Aborting method \_SB.A032 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1160.684221] kernel: ACPI Error: Aborting method \_SB.ALIB due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1160.684242] kernel: ACPI Error: Aborting method \_SB.PLOV due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1160.684265] kernel: ACPI Error: Aborting method \_SB.APX8 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1160.684288] kernel: ACPI Error: Aborting method \_SB.PMF.PMF8 due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1160.684309] kernel: ACPI Error: Aborting method \_SB.PMF.APMF due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1160.684329] kernel: amd-pmf AMDI0105:00: APMF method:8 call failed
[ 1162.733014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1164.033051] kernel: ------------[ cut here ]------------
[ 1164.039477] kernel: WARNING: CPU: 14 PID: 3965 at drivers/gpu/drm/amd/am=
dgpu/../display/dc/clk_mgr/dcn35/dcn35_smu.c:143 dcn35_smu_send_msg_with_pa=
ram+0x164/0x1d0 [amdgpu]
[ 1164.039523] kernel: Modules linked in: uas usb_storage ccm hid_sensor_gy=
ro_3d hid_sensor_prox hid_sensor_trigger industrialio_triggered_buffer kfif=
o_buf hid_sensor_iio_common industrialio hid_sensor_hub rfcomm snd_seq_dumm=
y snd_hrtimer snd_seq snd_seq_device ov05c10 v4l2_cci amd_capture v4l2_fwno=
de videobuf2_memops videobuf2_v4l2 videobuf2_common v4l2_async videodev mc =
i2c_designware_amdisp pinctrl_amdisp cmac algif_hash algif_skcipher af_alg =
bnep uinput nls_iso8859_1 vfat fat amdgpu mt7925e mt7925_common mt792x_lib =
snd_acp_legacy_mach mt76_connac_lib snd_acp_mach snd_soc_nau8821 mt76 snd_a=
cp3x_rn snd_acp70 amd_atl intel_rapl_msr snd_acp_i2s intel_rapl_common snd_=
acp_pdm snd_acp_pcm snd_soc_dmic snd_sof_amd_acp70 snd_sof_amd_acp63 mac802=
11 snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd=
_acp snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps snd_so=
c_acpi_amd_match snd_amd_sdw_acpi snd_hda_scodec_cs35l56_spi soundwire_amd =
snd_ctl_led amdxcp soundwire_generic_allocation kvm_amd
[ 1164.039628] kernel:  drm_panel_backlight_quirks snd_hda_codec_realtek so=
undwire_bus drm_buddy drm_exec snd_hda_codec_generic drm_suballoc_helper sn=
d_soc_sdca joydev drm_ttm_helper snd_hda_scodec_component libarc4 snd_hda_c=
odec_hdmi mousedev snd_soc_core kvm snd_hda_intel ttm snd_intel_dspcfg cfg8=
0211 snd_intel_sdw_acpi snd_compress i2c_algo_bit ac97_bus snd_hda_codec dr=
m_display_helper snd_pcm_dmaengine snd_rpl_pci_acp6x snd_acp_pci snd_hda_co=
re snd_amd_acpi_mach cec btusb snd_hda_scodec_cs35l56_i2c snd_acp_legacy_co=
mmon snd_hda_scodec_cs35l56 btrtl snd_hwdep snd_pci_acp6x ucsi_acpi snd_hda=
_cirrus_scodec btintel snd_pcm typec_ucsi snd_soc_cs35l56_shared amd_pmf am=
dxdna snd_pci_acp5x spd5118 snd_soc_cs_amp_lib btbcm hp_wmi snd_rn_pci_acp3=
x typec wmi_bmof amdtee cs_dsp hid_multitouch snd_acp_config snd_timer btmt=
k video sparse_keymap sp5100_tco irqbypass roles bluetooth thunderbolt snd =
snd_soc_acpi i2c_piix4 gpu_sched amd_sfh rfkill rapl soundcore i2c_hid_acpi=
 wmi platform_profile snd_pci_acp3x i2c_smbus wireless_hotkey
[ 1164.039665] kernel:  amd_isp4 i2c_hid amd_pmc serial_multi_instantiate m=
ac_hid i2c_dev crypto_user loop nfnetlink ip_tables x_tables dm_crypt encry=
pted_keys trusted asn1_encoder tee dm_mod nvme nvme_core polyval_clmulni gh=
ash_clmulni_intel ccp sha512_ssse3 sha1_ssse3 aesni_intel nvme_keyring seri=
o_raw nvme_auth
[ 1164.039688] kernel: CPU: 14 UID: 0 PID: 3965 Comm: kworker/u128:3 Tainte=
d: G      D W           6.16.0-00020-g541e951a4e8a #1 PREEMPT(full)  ec39f8=
0096e0b20fee1b3472ffc6dfe32b18badd
[ 1164.039714] kernel: Tainted: [D]=3DDIE, [W]=3DWARN
[ 1164.039739] kernel: Hardware name: HP HP ZBook Ultra G1a 14 inch Mobile =
Workstation PC/8D01, BIOS X89 Ver. 01.03.00 04/25/2025
[ 1164.039768] kernel: Workqueue: amdgpu-reset-dev drm_sched_job_timedout [=
gpu_sched]
[ 1164.039793] kernel: RIP: 0010:dcn35_smu_send_msg_with_param+0x164/0x1d0 =
[amdgpu]
[ 1164.039816] kernel: Code: 3b 48 8b 17 48 89 f8 0f b6 92 ca 01 00 00 01 e=
a 8d 6a ff 75 c4 48 8b 40 10 48 8b 38 48 85 ff 0f 85 8a 17 27 00 e9 89 17 2=
7 00 <0f> 0b 48 8b 57 10 48 8b 3a 48 85 ff 0f 84 4f 17 27 00 e9 46 17 27
[ 1164.039849] kernel: RSP: 0018:ffffcf864dabf820 EFLAGS: 00010246
[ 1164.039876] kernel: RAX: 0000000000000000 RBX: ffff8d5b477bfc00 RCX: 000=
000000000000e
[ 1164.039896] kernel: RDX: 0000000000007fda RSI: 00000000000074f5 RDI: fff=
f8d5b47f8eb00
[ 1164.039917] kernel: RBP: 00000000ffffffff R08: 0000000000000000 R09: fff=
f8d5b4bf47540
[ 1164.039934] kernel: R10: 0000000000000000 R11: 0000000000000000 R12: 000=
0000000000004
[ 1164.039961] kernel: R13: 0000000000000032 R14: ffff8d5b477bfc00 R15: fff=
f8d5c6dc00000
[ 1164.039981] kernel: FS:  0000000000000000(0000) GS:ffff8d6a132b1000(0000=
) knlGS:0000000000000000
[ 1164.040016] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1164.040039] kernel: CR2: 00007fd9b3cdc7c4 CR3: 0000000f4c424000 CR4: 000=
0000000f50ef0
[ 1164.040072] kernel: PKRU: 55555554
[ 1164.040095] kernel: Call Trace:
[ 1164.040116] kernel:  <TASK>
[ 1164.040137] kernel:  ? amdgpu_dm_is_headless+0x7a/0xb0 [amdgpu 983cbf934=
52e2aff0ee5d819daca7797cd468da1]
[ 1164.040158] kernel:  dcn35_smu_set_dispclk+0x44/0x90 [amdgpu 983cbf93452=
e2aff0ee5d819daca7797cd468da1]
[ 1164.040177] kernel:  dcn35_update_clocks+0x270/0x620 [amdgpu 983cbf93452=
e2aff0ee5d819daca7797cd468da1]
[ 1164.040194] kernel:  dcn20_optimize_bandwidth+0x119/0x220 [amdgpu 983cbf=
93452e2aff0ee5d819daca7797cd468da1]
[ 1164.040216] kernel:  dcn35_optimize_bandwidth+0x58/0xd0 [amdgpu 983cbf93=
452e2aff0ee5d819daca7797cd468da1]
[ 1164.040233] kernel:  dc_commit_state_no_check+0xd0b/0xf70 [amdgpu 983cbf=
93452e2aff0ee5d819daca7797cd468da1]
[ 1164.040258] kernel:  dc_commit_streams+0x2c9/0x480 [amdgpu 983cbf93452e2=
aff0ee5d819daca7797cd468da1]
[ 1164.040276] kernel:  dm_suspend+0x221/0x280 [amdgpu 983cbf93452e2aff0ee5=
d819daca7797cd468da1]
[ 1164.040289] kernel:  amdgpu_ip_block_suspend+0x24/0x50 [amdgpu 983cbf934=
52e2aff0ee5d819daca7797cd468da1]
[ 1164.040305] kernel:  amdgpu_device_ip_suspend_phase1+0xaa/0xc0 [amdgpu 9=
83cbf93452e2aff0ee5d819daca7797cd468da1]
[ 1164.040322] kernel:  amdgpu_device_ip_suspend+0x2c/0x80 [amdgpu 983cbf93=
452e2aff0ee5d819daca7797cd468da1]
[ 1164.040348] kernel:  ? amdgpu_device_ip_need_full_reset+0x16/0x80 [amdgp=
u 983cbf93452e2aff0ee5d819daca7797cd468da1]
[ 1164.040367] kernel:  amdgpu_device_pre_asic_reset+0xe9/0x2c0 [amdgpu 983=
cbf93452e2aff0ee5d819daca7797cd468da1]
[ 1164.040385] kernel:  amdgpu_device_asic_reset+0x56/0x46f [amdgpu 983cbf9=
3452e2aff0ee5d819daca7797cd468da1]
[ 1164.040398] kernel:  amdgpu_device_gpu_recover.cold+0x1e3/0x238 [amdgpu =
983cbf93452e2aff0ee5d819daca7797cd468da1]
[ 1164.040417] kernel:  amdgpu_job_timedout.cold+0x20a/0x450 [amdgpu 983cbf=
93452e2aff0ee5d819daca7797cd468da1]
[ 1164.040435] kernel:  drm_sched_job_timedout+0x85/0x120 [gpu_sched ba418b=
4c7d9c20d3d2bb52ba3c60dabf01715081]
[ 1164.040450] kernel:  process_one_work+0x190/0x350
[ 1164.040469] kernel:  worker_thread+0x2d7/0x410
[ 1164.040486] kernel:  ? __pfx_worker_thread+0x10/0x10
[ 1164.040501] kernel:  kthread+0xf9/0x240
[ 1164.040523] kernel:  ? __pfx_kthread+0x10/0x10
[ 1164.040544] kernel:  ? __pfx_kthread+0x10/0x10
[ 1164.040562] kernel:  ret_from_fork+0x198/0x1d0
[ 1164.040580] kernel:  ? __pfx_kthread+0x10/0x10
[ 1164.040595] kernel:  ret_from_fork_asm+0x1a/0x30
[ 1164.040613] kernel:  </TASK>
[ 1164.040634] kernel: ---[ end trace 0000000000000000 ]---
[ 1164.040648] kernel: amdgpu 0000:c3:00.0: [drm] SMU response after wait: =
0, msg id =3D 4
[ 1164.781033] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1166.829016] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1168.877014] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1170.925015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1172.973015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1175.021015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1177.069015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1179.117015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1181.165015] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1183.213013] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1185.261024] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1198.250025] kernel: amdgpu 0000:c3:00.0: [drm] SMU response after wait: =
0, msg id =3D 6
[ 1199.058025] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* dc_dmub_srv_log_d=
iagnostic_data: DMCUB error - collecting diagnostic data
[ 1199.571025] kernel: [drm] Register(0) [regVPEC_QUEUE_RESET_REQ_6_1_1] fa=
iled to reach value 0x00000000 !=3D 0x00000001n
[ 1199.582725] kernel: amdgpu 0000:c3:00.0: amdgpu: VPE queue reset failed
[ 1200.110027] kernel: [drm] Register(1) [regVPEC_QUEUE_RESET_REQ_6_1_1] fa=
iled to reach value 0x00000000 !=3D 0x00000001n
[ 1200.110100] kernel: amdgpu 0000:c3:00.0: amdgpu: VPE queue reset failed
[ 1202.991904] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[ 1205.862193] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[ 1208.732549] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[ 1211.601321] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[ 1214.470739] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[ 1215.241048] kernel: ACPI Error: Aborting method \_SB.A018 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1215.247590] kernel: ACPI Error: Aborting method \_SB.A032 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1215.247631] kernel: ACPI Error: Aborting method \_SB.ALIB due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1215.247654] kernel: ACPI Error: Aborting method \_SB.PLOV due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1215.247676] kernel: ACPI Error: Aborting method \_SB.APX8 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1215.247694] kernel: ACPI Error: Aborting method \_SB.PMF.PMF8 due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1215.247715] kernel: ACPI Error: Aborting method \_SB.PMF.APMF due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1215.247740] kernel: amd-pmf AMDI0105:00: APMF method:8 call failed
[ 1217.343433] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[ 1220.215993] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[ 1223.087728] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[ 1225.959234] kernel: amdgpu 0000:c3:00.0: amdgpu: MES ring buffer is full.
[ 1225.965756] kernel: amdgpu 0000:c3:00.0: amdgpu: MODE2 reset
[ 1237.536018] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU: I'm not done with =
your previous command: SMN_C2PMSG_66:0x0000001A SMN_C2PMSG_82:0x00000000
[ 1237.544616] kernel: amdgpu 0000:c3:00.0: amdgpu: Failed to mode2 reset!
[ 1237.544694] kernel: amdgpu 0000:c3:00.0: amdgpu: Mode2 reset failed!
[ 1237.544755] kernel: amdgpu 0000:c3:00.0: amdgpu: ASIC reset failed with =
error, -62 for drm dev, 0000:c3:00.0
[ 1237.544814] kernel: amdgpu 0000:c3:00.0: amdgpu: GPU reset end with ret =
=3D -62
[ 1237.544872] kernel: amdgpu 0000:c3:00.0: amdgpu: GPU Recovery Failed: -62
[ 1239.621017] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* flip_done timed o=
ut
[ 1239.627828] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* [CRTC:86:crtc-0] =
commit wait timed out
[ 1245.253013] kernel: ACPI Error: Aborting method \_SB.A018 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1245.261324] kernel: ACPI Error: Aborting method \_SB.A032 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1245.261343] kernel: ACPI Error: Aborting method \_SB.ALIB due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1245.261357] kernel: ACPI Error: Aborting method \_SB.PLOV due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1245.261371] kernel: ACPI Error: Aborting method \_SB.APX8 due to previou=
s error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1245.261383] kernel: ACPI Error: Aborting method \_SB.PMF.PMF8 due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1245.261396] kernel: ACPI Error: Aborting method \_SB.PMF.APMF due to pre=
vious error (AE_AML_LOOP_TIMEOUT) (20250404/psparse-529)
[ 1245.261409] kernel: amd-pmf AMDI0105:00: APMF method:8 call failed
[ 1246.263009] kernel: amd-pmf AMDI0105:00: failed to talk to SMU
[ 1247.813039] kernel: amdgpu 0000:c3:00.0: amdgpu: Dumping IP State
[ 1247.820272] kernel: amdgpu 0000:c3:00.0: amdgpu: Dumping IP State Comple=
ted
[ 1247.820347] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] AMDGPU device cor=
edump file has been created
[ 1247.820402] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Check your /sys/c=
lass/drm/card1/device/devcoredump/data
[ 1247.820454] kernel: amdgpu 0000:c3:00.0: amdgpu: ring sdma0 timeout, sig=
naled seq=3D30914, emitted seq=3D30917
[ 1247.820502] kernel: amdgpu 0000:c3:00.0: amdgpu: Starting sdma0 ring res=
et
[ 1247.820553] kernel: amdgpu 0000:c3:00.0: amdgpu: reset sdma queue (0:0:0)
[ 1247.996012] kernel: amdgpu 0000:c3:00.0: [drm:amdgpu_ring_test_helper [a=
mdgpu]] *ERROR* ring sdma0 test failed (-110)
[ 1247.996248] kernel: amdgpu 0000:c3:00.0: amdgpu: Ring sdma0 reset failure
[ 1247.996396] kernel: amdgpu 0000:c3:00.0: amdgpu: GPU reset begin!
[ 1249.861028] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* flip_done timed o=
ut
[ 1249.870138] kernel: amdgpu 0000:c3:00.0: [drm] *ERROR* [PLANE:59:plane-3=
] commit wait timed out

--LPdxapUyg6j0wNvs--

