Return-Path: <linux-media+bounces-38617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D50B14956
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 09:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7487D3A7147
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 07:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE649263F4A;
	Tue, 29 Jul 2025 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="GlxFpxZb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF52571BC
	for <linux-media@vger.kernel.org>; Tue, 29 Jul 2025 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753775147; cv=none; b=IjT5nQRO81Gvc/O6zee5ZJJmzeurr/MRpTTdUyG5x5RYI4C4vayLG6Zy434WdDq7bYT9qrm4xdLgiOSF8UMc6h4C0KwwkV7wu/XYOTPV8tPjXkrO13aO7TTEs+p40Cqe3jZzUJ3eLtY9LP8gQPZJnm2RFIDD0DxFPuYYkBg8RSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753775147; c=relaxed/simple;
	bh=cFticMHp5jFLRVtZav4MT7bGjKaA7x1ww0DkFagI4YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0nBAAtEeVXnURLMjzwO0GTNQCJXo70RI7/ZQg6f4ZtbpWIfxDsXj27oYKW7pC99f2iqH0czP0UtwpbLBUH+BrYLuiV/BeeomXF/kN8YViHuHGzJHqxcI6QkpvVpCXAa63R7chEtbKLg+tti+D417H1DG20I0oOeHutrT7tn+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=GlxFpxZb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23ffa7b3b30so22935995ad.1
        for <linux-media@vger.kernel.org>; Tue, 29 Jul 2025 00:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753775145; x=1754379945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tGm54EbCHZoz70giSmTC6+R0IC8NxL6CQ8fr0Y7M3pg=;
        b=GlxFpxZbxlB3hOoRgnu2ACUl0GrhxoIXttXAIF4j2ltuQD78Sv+8fKFpiffK2JGPFW
         OeLrYMKhNcjvD4565X9yuk+lSsYOL7tTJ8pMPNLMzeQ6foHX0D6tYWh1yAGbCXv2chWK
         C7sJJn80YhorX0vMVbdbZTtdQFV7LZsz7adqOBxDA3bW6ytvOfIrW4BI/aLT6DT+T5OO
         WRVzADJwQsWPe8sx+k9fbX+UYmEnsc7HKnea2bswBz4VyhJlZ9Q44s6pUqpbTsC+IpR3
         xO0O+oK+YjNIaMC1gV68c2fe/Rg0NKrxSlxZr4y/70DnrrVE03E3maVcRcNkjqJI0JnV
         33Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753775145; x=1754379945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGm54EbCHZoz70giSmTC6+R0IC8NxL6CQ8fr0Y7M3pg=;
        b=PVREupFJ2o3a0BtC7X6a/Gk5QRLx7yxoNF9giMFb4vqd5TaJExKW9nBVtFGKnjSmKj
         1fz7LZZT4DwvLtiy4lvRAWlwmUFh6MeXWmyXSOAB3vsjbe3KAC5sA46NQh0rIXfepIl2
         hwteVRbMd8ilQynU6soeeM0liKzjpGA+mgmkqGYNx+ileRr7yMzwJGm51+Er+EmFegnq
         ZBWkUqj7juXah3uCDtZjRkco8Iiq34OHuA2x2yclYGCirsOfif6CyyQidLyI+QThMXp1
         DJ2pZfH3suyudO/NC+g3dOklQcNjAf1zRAhhoEi+PFQyXh/EX75AU4PDuAjWhDrf4iP2
         a+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUPp45KhzxvRmwhSc70MwotNjLh49PJAlTL83RtoXZfaUEiaJOIBQU8cr7j7ZyBDQ4waTT1DBtCrBmInw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYjAtjZ9YQxjHjO+k68oOxQbflnDjjGHfkUA02JpogvAg91Ixt
	l+BKV2CLGJQzVVdu7szsMbvhPtH9Y1OLWR3vj3dRIbSBkqvrvxGCEzov/VwJMuFUyjwE
X-Gm-Gg: ASbGncsJ/JHB8OprwAoHmc+4bw7tOHQyjhmOACfdgjiiOPj8HZ3QdN8OBSX8ibbo7t/
	pMtQ/YxlsKk52mGMlv/+18zNIkJitNSbg+VbBSRClxESaJasap2lHNN9fsWu6+7BnSHNUosnONq
	c8s/Qm4L4dR0PTERIaLlGUddZSNUAtVEk2UOxqVnWE7bQEc1E9xXyP8/WYwGoZbOFUaYkvVTAFz
	b/OvjPGl3q+RXk4hrCuHnR48IHwuVyC5YTARZ3yDvMJAYLITaxr9XWaWTF9ZuqCXU+62WgZzOPe
	ZQh//InrrjCqnsJtpxMexVcz00vIIjnUma4sECUwfLhhX48ByNePreMau7PaZYSmyX+w1/jTvZG
	bOuhzvRA/htkxT3LlKYOlm39r
X-Google-Smtp-Source: AGHT+IGI8hwRjhPfWqqIfaH8WcvqvlbosGRJ6/9MKvGJPM2PYwCDd8KBUuiB5+aT0Qw0lrKMA+MWtA==
X-Received: by 2002:a17:902:dac9:b0:240:418c:b9f6 with SMTP id d9443c01a7336-240418cbaccmr82148825ad.49.1753775144566;
        Tue, 29 Jul 2025 00:45:44 -0700 (PDT)
Received: from sultan-box ([79.127.217.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe533b1esm70833165ad.158.2025.07.29.00.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 00:45:44 -0700 (PDT)
Date: Tue, 29 Jul 2025 00:45:40 -0700
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
Message-ID: <aIh8JPTv9Z5lphRQ@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box>
 <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
 <aIVXVpg_9XxRXUAH@sultan-box>
 <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com>
 <aIh7WB0TGNU15Zm1@sultan-box>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIh7WB0TGNU15Zm1@sultan-box>

On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
> On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
> > Thanks Sultan, please see my comments
> > 
> > On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
> > > On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
> > > > > I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
> > > > > 
> > > > > I cannot for the life of me get the webcam working under Linux. The webcam works
> > > > > under Windows so it's not a hardware issue.
> > > > > 
> > > > > With this patchset and all of the patches you link here applied to 6.15, I get
> > > > > the following errors:
> > > > >     [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
> > > > >     [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed
> > > > > 
> > > > > With the old ispkernel code from February [1] applied on 6.15, the webcam
> > > > > indicator LED lights up but there's no image. I see these messages at boot:
> > > > >     [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
> > > > >     [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
> > > > >     [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
> > > > >     [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
> > > > >     [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
> > > > >     [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
> > > > > 
> > > > > And then the kernel crashes due to the same use-after-free issues I pointed out
> > > > > in my other email [2].
> > > > > 
> > > > > Any idea what's going on?
> > > > > 
> > > > > [1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
> > > > > [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
> > > > Hi Sultan,
> > > > 
> > > > [1] is for kernel 6.8, believe it can't be applied to 6.15. We didn't verify
> > > > on 6.15 but we are really glad to help, would you please provide some info,
> > > > 1. Suppose you are using Ubuntu, right? What's the version?
> > > > 2. 6.15, do you mean https://github.com/torvalds/linux/tree/v6.15 ?
> > > > 
> > > > After your confirmation, we'll see what we can do to enable your camera
> > > > quickly and easily
> > > > 
> > > > Regards,
> > > > Bin
> > > 
> > > Thank you, Bin!
> > > 
> > > 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
> > > 2. Yes, here is my kernel source [2].
> > > 
> > > I have some more findings:
> > > 
> > > Currently, the first blocking issue is that the I2C adapter fails to initialize.
> > > This is because the ISP tile isn't powered on.
> > > 
> > > I noticed that in the old version of amd_isp_i2c_designware [3], there were
> > > calls to isp_power_set(), which is available in the old ISP4 sources [4].
> > > Without isp_power_set(), the I2C adapter always fails to initialize for me.
> > > 
> > > How is the ISP tile supposed to get powered on in the current ISP4 code?
> > > 
> > You are correct, yes, i believe the I2C adapter failure is caused by ISP not
> > being powered up. Currently in latest code, isp_power_set is no longer
> > available, instead, we implemented genPD for ISP in amdgpu
> > https://lore.kernel.org/all/20250618221923.3944751-1-pratap.nirujogi@amd.com/
> > Both amd_isp_i2c and amd_isp_capture are in the power domain and use the
> > standard runtime PM API to do the power control
> 
> Thanks for that link, I found it along with another patch on the list to make
> the fwnode work ("drm/amd/amdgpu: Initialize swnode for ISP MFD device").
> 
> > > Also, I noticed that the driver init ordering matters between all of the drivers
> > > needed for the ISP4 camera. In particular, amd_isp_i2c_designware and amd_isp4
> > > must be initialized before amd_capture, otherwise amd_capture will fail to find
> > > the fwnode properties for the OV05C10 device attached to the I2C bus.
> > > 
> > > But there is no driver init ordering enforced, which also caused some issues for
> > > me until I figured it out. Maybe probe deferral (-EPROBE_DEFER) should be used
> > > to ensure each driver waits for its dependencies to init first?
> > > 
> > amd_isp_capture only has dependency on amd_isp4 which is the ACPI platform
> > driver, it is init before amd_isp_catpure.
> > Do you see in your side the amd_capture probe failure caused by failing to
> > read fwnode properties? If that's the case please help to check if amd_isp4
> > is loaded successfully
> 
> I got much further now: there aren't any driver initialization errors, but when
> I open the camera, there's no image. The camera LED turns on so it's active.
> 
> And then shortly afterwards, amdgpu dies and the entire system freezes.
> 
> I've attached my full dmesg, please let me know what you think. Thanks!

I almost forgot, here is my current kernel tree:
https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16-sultan-isp4

Sultan

