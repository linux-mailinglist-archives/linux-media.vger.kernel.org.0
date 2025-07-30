Return-Path: <linux-media+bounces-38652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDDDB15884
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 07:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39AD67A8FB8
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 05:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E641E5B97;
	Wed, 30 Jul 2025 05:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="edx4nVqs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A751E1E1E
	for <linux-media@vger.kernel.org>; Wed, 30 Jul 2025 05:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753853892; cv=none; b=NWxCFqmXkofX4YNy4cddoPfPhY0F0rDZ3n+xwcLa7fY2DWNrfMGSOnMrGIKHFeZ6dIAvl0a7+SxC0vjJiTdml18KZZlR/V2NPK6hsJl2rg/PHZIrfDUIypzXtjF7ICNs3EHQvBGGSmFR0eJtme85/UDAlQ3MGFBOJdMcJdViRac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753853892; c=relaxed/simple;
	bh=tD2G47Iy2dDV0FXIWdVT0h4L1NBLfG8caLPethMYEDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJr0Rq8BeqwLGldD336yP0eaFFceu3ilsNMjCghHEV2oVHFJbPZAuV2gYyRNnDiI3FKGa1WcFZqrJyvGDTkooJG5YR7mv4iPjocpPx6zP7ImD9EURo1CwlFa3/LaTFxet5piy3vvjIy5B6qmYArqVIp8i0Rnn4aaJFsUee3fA3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=edx4nVqs; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23ffa7b3b30so35313485ad.1
        for <linux-media@vger.kernel.org>; Tue, 29 Jul 2025 22:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753853889; x=1754458689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9EkAevO+qvIyyz5Kc0E4nEE1oejClY5HimXQj2hGp8=;
        b=edx4nVqspZlqiojmdS+hbH2T9LS9WJ3oVFvUTgFMx20zdcpfdbwFz3muOKWtmLXeRR
         7Ic425yiItprL4TEdHYbWeUTTnVzFOsGDqMH6biq8vha7y2mRJ1huEGvDu94MVuMmQDl
         NHWJhhCqVsYLTD5ZPdQ7k5qXoDHJWouxdnB+I35xCwNGfMjww231HZrPS61vdt6hBtKM
         EK3GL2MtFE+jDzLk5wuOmh8Ou7+fLPCN5+oO/kxDEy1TZEDvAX9uhESQFmcixN1Qe+e/
         g83ZJowNLLJVi7qUexRPAWaQcygK6Fm/GIGwXSouQi9VSRifpHlUcnwaHYcaYk7Uraf/
         oVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753853889; x=1754458689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9EkAevO+qvIyyz5Kc0E4nEE1oejClY5HimXQj2hGp8=;
        b=ENHgBnbgyZBV/PGDm852xAL+K3NQZvpaV9RcGpH5tFcyBDT/CptKxrqlxYtlLoSey0
         T65EVJdmIEw39q0rkcDSwZWUpD9qApqK/7EUuxCbbz9Igw9FdIWqROCYRoHbVH2R/5bf
         2KnsjmvLg7dZaK+ErynhAJLYbWX4JWZQLUodQ/B1K4rji0loh+uUV04thrBRk+f67vF3
         K/Ltr+b0efdUcVl8u3lwlKa83lsZuQfRwruw/4ITVczCSIKkb4NmJK0/dIab+r/oTncX
         5RCl262vKXnul6pp5pmL0T4cpqEKLO+YOHOSvPYZTWRjB2YdqxMZ/UUI3fWmjtImHe7M
         HEMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3QSl+jeAPX7sN3scKgFfcjqAkFpCstQuDsFdRa1hRjOY2V2bAlvCdB9e4JrQcuoqrR+AzIk3cbkXTQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/vfaz8aOB1k+pnSuy192U3zye5liCQYiFBUs83u9HMcZvLAzQ
	Hc1RXT/CtcKFIeuu7Y2gVlstVsPAJ/qD1sDRu5sX61VRnJdZPFCd+YxIjv4ZIf/B3QKz
X-Gm-Gg: ASbGncv5jvIppZeTuoaAB7hEWjdZMyfamxhln3Oj054UM+S7kRUvs0BewzUnnOoZtoi
	j3gMUUr5oF2/QtgulX7aO7mjlesPZ0QkcfFBuGr28MzLb7kxAj4NPjPTyIOegz5dFFFqOzGymeD
	XQKmpbig8x33XFfTeu7sRdwD98wtdhZEPwQo86J/UV4Th5q4IWDZZRlBmQiG0YW5NU0NRWXA1KG
	dqjDgyNBcO2Z5aMzzB9Qick2/hsKd37PN2kgbbyqyP9f9H3HLLrJsjhQdCHkR45SbU3YYuc75Xv
	NOwbI9zmwwVjuHMkr8LmS97+pApv7pC/tT1FX0Ag41ZttykujoZ//g9Ys5ycZ0BkIiYk0ae4SXU
	aQ2OZWxZHaFX5Ewq35QzZj2w=
X-Google-Smtp-Source: AGHT+IHT1Dvm+yZB3/+p2bXS7S4XB2zP+2cwOIFQ17p4t29wHrQIBbp3P00v2cJ+0Rky/XA/etMvyA==
X-Received: by 2002:a17:903:32ca:b0:235:f143:9b07 with SMTP id d9443c01a7336-24096a4e1acmr31220195ad.5.1753853889198;
        Tue, 29 Jul 2025 22:38:09 -0700 (PDT)
Received: from sultan-box ([79.127.217.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24025f4a8e5sm61542775ad.130.2025.07.29.22.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 22:38:08 -0700 (PDT)
Date: Tue, 29 Jul 2025 22:38:04 -0700
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
Message-ID: <aImvvC9JEgQ2xBki@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box>
 <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
 <aIVXVpg_9XxRXUAH@sultan-box>
 <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com>
 <aIh7WB0TGNU15Zm1@sultan-box>
 <aIh8JPTv9Z5lphRQ@sultan-box>
 <751e9265-889f-4fbf-acf8-7374311a6b6f@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <751e9265-889f-4fbf-acf8-7374311a6b6f@amd.com>

On Tue, Jul 29, 2025 at 06:13:50PM +0800, Du, Bin wrote:
> On 7/29/2025 3:45 PM, Sultan Alsawaf wrote:
> > On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
> > > On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
> > > > Thanks Sultan, please see my comments
> > > > 
> > > > On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
> > > > > On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
> > > > > > > I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
> > > > > > > 
> > > > > > > I cannot for the life of me get the webcam working under Linux. The webcam works
> > > > > > > under Windows so it's not a hardware issue.
> > > > > > > 
> > > > > > > With this patchset and all of the patches you link here applied to 6.15, I get
> > > > > > > the following errors:
> > > > > > >      [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
> > > > > > >      [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed
> > > > > > > 
> > > > > > > With the old ispkernel code from February [1] applied on 6.15, the webcam
> > > > > > > indicator LED lights up but there's no image. I see these messages at boot:
> > > > > > >      [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
> > > > > > >      [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
> > > > > > >      [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
> > > > > > >      [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
> > > > > > >      [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
> > > > > > >      [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
> > > > > > > 
> > > > > > > And then the kernel crashes due to the same use-after-free issues I pointed out
> > > > > > > in my other email [2].
> > > > > > > 
> > > > > > > Any idea what's going on?
> > > > > > > 
> > > > > > > [1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
> > > > > > > [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
> > > > > > Hi Sultan,
> > > > > > 
> > > > > > [1] is for kernel 6.8, believe it can't be applied to 6.15. We didn't verify
> > > > > > on 6.15 but we are really glad to help, would you please provide some info,
> > > > > > 1. Suppose you are using Ubuntu, right? What's the version?
> > > > > > 2. 6.15, do you mean https://github.com/torvalds/linux/tree/v6.15 ?
> > > > > > 
> > > > > > After your confirmation, we'll see what we can do to enable your camera
> > > > > > quickly and easily
> > > > > > 
> > > > > > Regards,
> > > > > > Bin
> > > > > 
> > > > > Thank you, Bin!
> > > > > 
> > > > > 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
> > > > > 2. Yes, here is my kernel source [2].
> > > > > 
> > > > > I have some more findings:
> > > > > 
> > > > > Currently, the first blocking issue is that the I2C adapter fails to initialize.
> > > > > This is because the ISP tile isn't powered on.
> > > > > 
> > > > > I noticed that in the old version of amd_isp_i2c_designware [3], there were
> > > > > calls to isp_power_set(), which is available in the old ISP4 sources [4].
> > > > > Without isp_power_set(), the I2C adapter always fails to initialize for me.
> > > > > 
> > > > > How is the ISP tile supposed to get powered on in the current ISP4 code?
> > > > > 
> > > > You are correct, yes, i believe the I2C adapter failure is caused by ISP not
> > > > being powered up. Currently in latest code, isp_power_set is no longer
> > > > available, instead, we implemented genPD for ISP in amdgpu
> > > > https://lore.kernel.org/all/20250618221923.3944751-1-pratap.nirujogi@amd.com/
> > > > Both amd_isp_i2c and amd_isp_capture are in the power domain and use the
> > > > standard runtime PM API to do the power control
> > > 
> > > Thanks for that link, I found it along with another patch on the list to make
> > > the fwnode work ("drm/amd/amdgpu: Initialize swnode for ISP MFD device").
> > > 
> > > > > Also, I noticed that the driver init ordering matters between all of the drivers
> > > > > needed for the ISP4 camera. In particular, amd_isp_i2c_designware and amd_isp4
> > > > > must be initialized before amd_capture, otherwise amd_capture will fail to find
> > > > > the fwnode properties for the OV05C10 device attached to the I2C bus.
> > > > > 
> > > > > But there is no driver init ordering enforced, which also caused some issues for
> > > > > me until I figured it out. Maybe probe deferral (-EPROBE_DEFER) should be used
> > > > > to ensure each driver waits for its dependencies to init first?
> > > > > 
> > > > amd_isp_capture only has dependency on amd_isp4 which is the ACPI platform
> > > > driver, it is init before amd_isp_catpure.
> > > > Do you see in your side the amd_capture probe failure caused by failing to
> > > > read fwnode properties? If that's the case please help to check if amd_isp4
> > > > is loaded successfully
> > > 
> > > I got much further now: there aren't any driver initialization errors, but when
> > > I open the camera, there's no image. The camera LED turns on so it's active.
> > > 
> > > And then shortly afterwards, amdgpu dies and the entire system freezes.
> > > 
> > > I've attached my full dmesg, please let me know what you think. Thanks!
> > 
> > I almost forgot, here is my current kernel tree:
> > https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16-sultan-isp4
> > 
> > Sultan
> 
> Thanks Sultan, yes, seems much close to the final success. Will have some
> internal discussion.

I got the webcam working. The same bug happened when I tried Ubuntu's linux-oem
kernel, which made me think that the issue was firmware.

And indeed, the culprit was a firmware update from February. I bisected
linux-firmware and found the commit which broke the webcam for me:

	commit 1cc8c1bfa11251ce8bfcc97d1f15e312f7fe4df0 (HEAD)
	Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
	Date:   Wed Feb 19 12:16:51 2025 -0500

	    amdgpu: Update ISP FW for isp v4.1.1
	    
	    From internal git commit:
	    5058202443e08a673b6772ea6339efb50853be28
	    
	    Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

	 amdgpu/isp_4_1_1.bin | Bin 4543184 -> 6083536 bytes
	 1 file changed, 0 insertions(+), 0 deletions(-)

Downgrading firmware to before that commit fixes the webcam. Any idea why?

Thanks,
Sultan

