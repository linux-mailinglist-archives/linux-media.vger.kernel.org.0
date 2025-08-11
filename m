Return-Path: <linux-media+bounces-39475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29520B21839
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 00:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA08D627991
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 22:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56852E5418;
	Mon, 11 Aug 2025 22:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="AfTdqwGv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62E4221FC9
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 22:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950694; cv=none; b=skq4XDf6CTqoFu7wqb0FZE+uCpQkbmPN6UaM4L/9dNK6zQDHqq94aeQ3c6siemMoGscnVZKurTsM+2oyg811gvBnAxSbMdOQNiLn8C8cLLyTTu2HKqPV4NqCzjj0haUKzI6J1ZlZVkjy8X/yXA66g0nHf69kIpGv4VL5m2eC/aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950694; c=relaxed/simple;
	bh=t7ZbDxGlYZ9EUjcH2soHjztGn98u6aoqmRPredz0uNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQH6aFJpkG0W4YNvJbQpsKJ0tzPO3uZ3MpHr/ATTwD8FlJvfMvLQWj0f7AH/n9arIqCZ7DDLo8hJeCs3lpwZ0NeIvzxQEI7OO7hr0P917LoDTOS22yMucz9p8yC+JMQtzWClkYD1NaiU19Pi0FDWYLtolMACRtCFb6DKQN9tA4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=AfTdqwGv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24014cd385bso52497875ad.0
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 15:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1754950690; x=1755555490; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVIxFgIahrSzQnVFQgUo0sbORBScLXcn3D4uWDylD+o=;
        b=AfTdqwGvcar21S6NL8hGbtFVLNHjmsrkzNplGFo3kwklioLSAl49YPQorh+x7dRVO2
         T4UsJ63RFtDV7+DTFfxBC7L0JcT3I+QyDRjVOu6+vpA0RyxAuv8lQzRcuFjZc4nNZzlB
         sR4foDZtfObLGmUNRV3eY4ZwChM5Tzjq4mGtLX5LsFrKqOTH1OQtSn6okLnhBuizSx6L
         6G9/ZMY/PgaagXYfZ8Sc/2dheXgBVFU7xhzdtndLJz6m33Rvir6lFtza0dAETiPyAp6J
         0KjxB7oylL+nqcgWcnLJVaR0fAjUmr4JfaGoVbtSsV7L0mJIKEECa3cTHZtr2kiDBRb8
         vT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754950690; x=1755555490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVIxFgIahrSzQnVFQgUo0sbORBScLXcn3D4uWDylD+o=;
        b=irpdWvCyc/oSX4Uquxdo0Y0HXb5PQynB7f5ozKlsp31J+gzcwc2JO1V+pv6tiskNTS
         OT8U7qu4aQG2gFYGXZKKceKas6R7w1c2waKcfj1h7o6lWH72WEMfWXJbekHB+7fFxPWN
         gx9Spn3pzNi9VR00bGEuzj/ksH4M22jE3R3i5lIGK9quLHkCSzJvkdwD4DDatAlovmDA
         S4srgdTBSjA5rSpZJ+BCzhV/Pp91PluUgv6sYrrAHhkDIg/k7x9YUSH7zcGcXiCXvpWW
         Q2INsW0XvZzcYSF7Fe1VL8pJ/pBRIla6T9OnMQFl4+9sPFZvVOsHVESoz1j3iA+UI5+Q
         9p1w==
X-Forwarded-Encrypted: i=1; AJvYcCXAtX97D1V2zUa1l8fjpDnKiQ5T0wlQoRz8r0lnvgcRVzpEwaavqobL6wzmcJ1/aKBKGSreyAQ+nYwPsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNcoIbmbJjWJnjmPbJYqdr/m2vR9rPQxNikS7GSj9HdWCbajm
	i+aCiCO39Y88Ai3tZ3PFpFssoauYl0Tu7vi5rEow/XpZbNbnbQOjJ0cd/ZwJzzC0UzSz
X-Gm-Gg: ASbGnctlLSbTWEI5aaM71pbY9QZUvdf8eZKxNITrxFcfPuFSMiaekK7OdcsTrYCS3Hs
	tnZ8xtqOlvPi8/fRdJKS7WLbAgctuGCbMGQxAtb6EdDt0oD00CXYXrmD/5FsZk0a1eBrNJe9js8
	AcU0JH3N1IdePFZ20mzBq1gKECpAx1awKon5/rEm2PNnUrON31IveWMuzOc+k3asw/vViKCQ9dH
	QGSfMYrOS3dQ3G7NCOa/iI9ZsomsKnghdfP+ZsMJy5fWBXE7a+8yaxxinDCClbRNitKGhcSLoc6
	0fPOoeMcjmV0QQMFJ9QFXFeooDQ2SYHliUivqHIb6T9M4VgMWlNB7pXfUxpQVDiqliFzigxxA9u
	+GaXKe55t5p8NlBooSFrfoF2Hjic=
X-Google-Smtp-Source: AGHT+IHOAEL6L+Y4tAq59QnA686FQQSzagY3or/Ib9mVZHAT2/gvr9siWDq+LLfs8tyOVcObtSLyWg==
X-Received: by 2002:a17:902:f708:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-242c21fd174mr164142085ad.30.1754950689946;
        Mon, 11 Aug 2025 15:18:09 -0700 (PDT)
Received: from sultan-box ([2603:3006:1034:c100:c50:2c2b:96b5:524f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aaaf1bsm285686575ad.159.2025.08.11.15.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 15:18:09 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:17:55 -0700
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
Message-ID: <aJpsEwdZ945jEZqi@sultan-box>
References: <aImvvC9JEgQ2xBki@sultan-box>
 <a3272335-1813-4706-813e-a79a9cabc659@amd.com>
 <aIq5EyQ_uuO63dJb@sultan-box>
 <1a9a4beb-97ab-4853-8201-bf08f1a030ab@amd.com>
 <d8c99b00-e8f2-49bb-8c72-ebc4e783e51d@amd.com>
 <aJA2S0EY7HhVSSzc@sultan-box>
 <17464bff-6b3e-4962-8b83-132cd7367d1d@amd.com>
 <aJmEaXkXDtfkVQiR@sultan-box>
 <f85fce70-64d6-4d33-9483-c8e6dc8a79bc@amd.com>
 <aJplOgN9BSbElDfi@sultan-box>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJplOgN9BSbElDfi@sultan-box>

On Mon, Aug 11, 2025 at 02:48:42PM -0700, Sultan Alsawaf wrote:
> On Mon, Aug 11, 2025 at 04:35:10PM +0800, Du, Bin wrote:
> > On 8/11/2025 1:49 PM, Sultan Alsawaf wrote:
> > > On Fri, Aug 08, 2025 at 05:11:39PM +0800, Du, Bin wrote:
> > > > On 8/4/2025 12:25 PM, Sultan Alsawaf wrote:
> > > > > On Mon, Aug 04, 2025 at 11:32:11AM +0800, Du, Bin wrote:
> > > > > > On 7/31/2025 6:04 PM, Du, Bin wrote:
> > > > > > > Thanks Sultan for your test
> > > > > > > 
> > > > > > > On 7/31/2025 8:30 AM, Sultan Alsawaf wrote:
> > > > > > > > On Wed, Jul 30, 2025 at 05:53:58PM +0800, Du, Bin wrote:
> > > > > > > > > On 7/30/2025 1:38 PM, Sultan Alsawaf wrote:
> > > > > > > > > > On Tue, Jul 29, 2025 at 06:13:50PM +0800, Du, Bin wrote:
> > > > > > > > > > > On 7/29/2025 3:45 PM, Sultan Alsawaf wrote:
> > > > > > > > > > > > On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
> > > > > > > > > > > > > On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
> > > > > > > > > > > > > > Thanks Sultan, please see my comments
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
> > > > > > > > > > > > > > > On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
> > > > > > > > > > > > > > > > > I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > I cannot for the life of me get
> > > > > > > > > > > > > > > > > the webcam working under Linux.
> > > > > > > > > > > > > > > > > The webcam works
> > > > > > > > > > > > > > > > > under Windows so it's not a hardware issue.
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > With this patchset and all of
> > > > > > > > > > > > > > > > > the patches you link here
> > > > > > > > > > > > > > > > > applied to 6.15, I get
> > > > > > > > > > > > > > > > > the following errors:
> > > > > > > > > > > > > > > > >          [   11.970038]
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware: Unknown
> > > > > > > > > > > > > > > > > Synopsys component type:
> > > > > > > > > > > > > > > > > 0xffffffff
> > > > > > > > > > > > > > > > >          [   11.973162]
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware: error
> > > > > > > > > > > > > > > > > -19: i2c_dw_probe failed
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > With the old ispkernel code from
> > > > > > > > > > > > > > > > > February [1] applied on 6.15,
> > > > > > > > > > > > > > > > > the webcam
> > > > > > > > > > > > > > > > > indicator LED lights up but
> > > > > > > > > > > > > > > > > there's no image. I see these
> > > > > > > > > > > > > > > > > messages at boot:
> > > > > > > > > > > > > > > > >          [    9.449005]
> > > > > > > > > > > > > > > > > amd_isp_capture
> > > > > > > > > > > > > > > > > amd_isp_capture.1.auto: amdgpu:
> > > > > > > > > > > > > > > > > AMD ISP v4l2 device registered
> > > > > > > > > > > > > > > > >          [    9.489005]
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware.2.auto:
> > > > > > > > > > > > > > > > > The OV05 sensor device is added
> > > > > > > > > > > > > > > > > to the ISP I2C bus
> > > > > > > > > > > > > > > > >          [    9.529012]
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware.2.auto:
> > > > > > > > > > > > > > > > > timeout while trying to abort
> > > > > > > > > > > > > > > > > current transfer
> > > > > > > > > > > > > > > > >          [    9.554046]
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware.2.auto:
> > > > > > > > > > > > > > > > > timeout in disabling adapter
> > > > > > > > > > > > > > > > >          [    9.554174]
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware.2.auto:
> > > > > > > > > > > > > > > > > timeout while trying to abort
> > > > > > > > > > > > > > > > > current transfer
> > > > > > > > > > > > > > > > >          [    9.580022]
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware
> > > > > > > > > > > > > > > > > amd_isp_i2c_designware.2.auto:
> > > > > > > > > > > > > > > > > timeout in disabling adapter
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > And then the kernel crashes due
> > > > > > > > > > > > > > > > > to the same use-after-free
> > > > > > > > > > > > > > > > > issues I pointed out
> > > > > > > > > > > > > > > > > in my other email [2].
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > Any idea what's going on?
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > [1]
> > > > > > > > > > > > > > > > > https://github.com/amd/Linux_ISP_Kernel/commit/
> > > > > > > > > > > > > > > > > c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
> > > > > > > > > > > > > > > > > [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
> > > > > > > > > > > > > > > > Hi Sultan,
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > [1] is for kernel 6.8, believe it
> > > > > > > > > > > > > > > > can't be applied to 6.15. We didn't
> > > > > > > > > > > > > > > > verify
> > > > > > > > > > > > > > > > on 6.15 but we are really glad to
> > > > > > > > > > > > > > > > help, would you please provide some
> > > > > > > > > > > > > > > > info,
> > > > > > > > > > > > > > > > 1. Suppose you are using Ubuntu, right? What's the version?
> > > > > > > > > > > > > > > > 2. 6.15, do you mean
> > > > > > > > > > > > > > > > https://github.com/torvalds/linux/tree/
> > > > > > > > > > > > > > > > v6.15 ?
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > After your confirmation, we'll see
> > > > > > > > > > > > > > > > what we can do to enable your camera
> > > > > > > > > > > > > > > > quickly and easily
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Regards,
> > > > > > > > > > > > > > > > Bin
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Thank you, Bin!
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
> > > > > > > > > > > > > > > 2. Yes, here is my kernel source [2].
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I have some more findings:
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Currently, the first blocking issue is
> > > > > > > > > > > > > > > that the I2C adapter fails to
> > > > > > > > > > > > > > > initialize.
> > > > > > > > > > > > > > > This is because the ISP tile isn't powered on.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I noticed that in the old version of
> > > > > > > > > > > > > > > amd_isp_i2c_designware [3], there were
> > > > > > > > > > > > > > > calls to isp_power_set(), which is
> > > > > > > > > > > > > > > available in the old ISP4 sources [4].
> > > > > > > > > > > > > > > Without isp_power_set(), the I2C adapter
> > > > > > > > > > > > > > > always fails to initialize for me.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > How is the ISP tile supposed to get
> > > > > > > > > > > > > > > powered on in the current ISP4 code?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > You are correct, yes, i believe the I2C
> > > > > > > > > > > > > > adapter failure is caused by ISP not
> > > > > > > > > > > > > > being powered up. Currently in latest code,
> > > > > > > > > > > > > > isp_power_set is no longer
> > > > > > > > > > > > > > available, instead, we implemented genPD for ISP in amdgpu
> > > > > > > > > > > > > > https://lore.kernel.org/all/20250618221923.3944751-1-
> > > > > > > > > > > > > > pratap.nirujogi@amd.com/
> > > > > > > > > > > > > > Both amd_isp_i2c and amd_isp_capture are in
> > > > > > > > > > > > > > the power domain and use the
> > > > > > > > > > > > > > standard runtime PM API to do the power control
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Thanks for that link, I found it along with
> > > > > > > > > > > > > another patch on the list to make
> > > > > > > > > > > > > the fwnode work ("drm/amd/amdgpu: Initialize
> > > > > > > > > > > > > swnode for ISP MFD device").
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Also, I noticed that the driver init
> > > > > > > > > > > > > > > ordering matters between all of the
> > > > > > > > > > > > > > > drivers
> > > > > > > > > > > > > > > needed for the ISP4 camera. In
> > > > > > > > > > > > > > > particular, amd_isp_i2c_designware and
> > > > > > > > > > > > > > > amd_isp4
> > > > > > > > > > > > > > > must be initialized before amd_capture,
> > > > > > > > > > > > > > > otherwise amd_capture will fail to find
> > > > > > > > > > > > > > > the fwnode properties for the OV05C10
> > > > > > > > > > > > > > > device attached to the I2C bus.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > But there is no driver init ordering
> > > > > > > > > > > > > > > enforced, which also caused some issues
> > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > me until I figured it out. Maybe probe
> > > > > > > > > > > > > > > deferral (-EPROBE_DEFER) should be used
> > > > > > > > > > > > > > > to ensure each driver waits for its dependencies to init first?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > amd_isp_capture only has dependency on
> > > > > > > > > > > > > > amd_isp4 which is the ACPI platform
> > > > > > > > > > > > > > driver, it is init before amd_isp_catpure.
> > > > > > > > > > > > > > Do you see in your side the amd_capture
> > > > > > > > > > > > > > probe failure caused by failing to
> > > > > > > > > > > > > > read fwnode properties? If that's the case
> > > > > > > > > > > > > > please help to check if amd_isp4
> > > > > > > > > > > > > > is loaded successfully
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I got much further now: there aren't any driver
> > > > > > > > > > > > > initialization errors, but when
> > > > > > > > > > > > > I open the camera, there's no image. The camera
> > > > > > > > > > > > > LED turns on so it's active.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > And then shortly afterwards, amdgpu dies and the
> > > > > > > > > > > > > entire system freezes.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I've attached my full dmesg, please let me know
> > > > > > > > > > > > > what you think. Thanks!
> > > > > > > > > > > > 
> > > > > > > > > > > > I almost forgot, here is my current kernel tree:
> > > > > > > > > > > > https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16-
> > > > > > > > > > > > sultan-isp4
> > > > > > > > > > > > 
> > > > > > > > > > > > Sultan
> > > > > > > > > > > 
> > > > > > > > > > > Thanks Sultan, yes, seems much close to the final
> > > > > > > > > > > success. Will have some
> > > > > > > > > > > internal discussion.
> > > > > > > > > > 
> > > > > > > > > > I got the webcam working. The same bug happened when I tried
> > > > > > > > > > Ubuntu's linux-oem
> > > > > > > > > > kernel, which made me think that the issue was firmware.
> > > > > > > > > > 
> > > > > > > > > > And indeed, the culprit was a firmware update from February. I bisected
> > > > > > > > > > linux-firmware and found the commit which broke the webcam for me:
> > > > > > > > > > 
> > > > > > > > > >       commit 1cc8c1bfa11251ce8bfcc97d1f15e312f7fe4df0 (HEAD)
> > > > > > > > > >       Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > > > > > > > >       Date:   Wed Feb 19 12:16:51 2025 -0500
> > > > > > > > > > 
> > > > > > > > > >           amdgpu: Update ISP FW for isp v4.1.1
> > > > > > > > > > 
> > > > > > > > > >           From internal git commit:
> > > > > > > > > >           5058202443e08a673b6772ea6339efb50853be28
> > > > > > > > > > 
> > > > > > > > > >           Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > > > > > > > > 
> > > > > > > > > >        amdgpu/isp_4_1_1.bin | Bin 4543184 -> 6083536 bytes
> > > > > > > > > >        1 file changed, 0 insertions(+), 0 deletions(-)
> > > > > > > > > > 
> > > > > > > > > > Downgrading firmware to before that commit fixes the webcam.
> > > > > > > > > > Any idea why?
> > > > > > > > > > 
> > > > > > > > > > Thanks,
> > > > > > > > > > Sultan
> > > > > > > > > 
> > > > > > > > > So, can i say the working firmware binary is this one?
> > > > > > > > > 
> > > > > > > > > Commit 8f070131
> > > > > > > > > amdgpu: Update ISP FW for isp v4.1.1
> > > > > > > > > 
> > > > > > > > >    From internal git commit:
> > > > > > > > > 39b007366cc76ef8c65e3bc6220ccb213f4861fb
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > > > > > > 
> > > > > > > > Correct.
> > > > > > > > 
> > > > > > > > > There are too many changes between them, so i can't tell exactly which
> > > > > > > > > change caused this. So, from my side
> > > > > > > > > 1. Will try these two firmware to see if we have the same issue.
> > > > > > > > > 2. It has been quite a long time since last release, will see if need to
> > > > > > > > > release a latest one.
> > > > > > > > 
> > > > > > > > Thanks. It was a quick bisect for me, so I'm happy to help test if a
> > > > > > > > bisect
> > > > > > > > between those two internal git commits is needed.
> > > > > > > > 
> > > > > > > Really appreciate your test.
> > > > > > > > In case it makes a difference, I have the laptop with the 2.8K OLED
> > > > > > > > display. I'm
> > > > > > > > aware there is one other display variant on other SKUs, which is a
> > > > > > > > WUXGA IPS.
> > > > > > > > 
> > > > > > > Good to know, I believe it won't make any difference for ISP
> > > > > > > 
> > > > > > > > Also, with that old firmware, my camera only works with the old isp4
> > > > > > > > driver from
> > > > > > > > that Linux_ISP_Kernel repo (which is the same isp4 driver used in
> > > > > > > > Ubuntu's
> > > > > > > > linux-oem kernel). Does the new isp4 driver you've submitted here
> > > > > > > > require newer
> > > > > > > > firmware than the old driver located in Linux_ISP_Kernel?
> > > > > > > > 
> > > > > > > > Sultan
> > > > > > > 
> > > > > > > We had a try, yes, both of the old FW can't work on the new ISP4 driver,
> > > > > > > as you know, for the last months, we did lots of driver modifications
> > > > > > > for upstream and cause it incompatible with old FW.
> > > > > > > Now, under internal discussion to upstream a new FW to support the new
> > > > > > > ISP driver
> > > > > > > 
> > > > > > > Regards,
> > > > > > > Bin
> > > > > > > 
> > > > > > > Hi Sultan,
> > > > > > 
> > > > > > This is the conclusion of your test,
> > > > > > Driver: https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
> > > > > > [1] It works on FW      8f070131(ext):39b00736(int)
> > > > > > [2] It can't work on FW 1cc8c1bf(ext):50582024(int)
> > > > > 
> > > > > Correct.
> > > > > 
> > > > > > Would you please help to check if CONFIG_VIDEO_OV05C is defined not in the
> > > > > > .config file when building the kernel? Our assumption is to make [1] work,
> > > > > > CONFIG_VIDEO_OV05C shouldn't be defined. to make [2] work,
> > > > > > CONFIG_VIDEO_OV05C should be defined.
> > > > > 
> > > > > Yes, it is enabled and I have only tested with it enabled:
> > > > > 
> > > > >       $ rg CONFIG_VIDEO_OV05C linux-oem-6.14/.config
> > > > >       CONFIG_VIDEO_OV05C=m
> > > > > 
> > > > > That's the Ubuntu linux-oem-6.14 kernel. You can get the full source and .config
> > > > > I tested by running the following commands:
> > > > > 
> > > > >       git clone https://git.launchpad.net/ubuntu/+source/linux-oem-6.14 -b applied/6.14.0-1006.6
> > > > >       cd linux-oem-6.14
> > > > >       python debian/scripts/misc/annotations -e --arch amd64 > .config
> > > > >       make olddefconfig
> > > > > 
> > > > > Let me know if that works.
> > > > > 
> > > > > Sultan
> > > > 
> > > > Thanks Sultan for the details, yes, we can reproduce the same issue on old
> > > > isp driver 4.0 release on FW 1cc8c1bf(ext):50582024(int), after debug, the
> > > > cause is
> > > >    - ov05c sensor device is added by amd i2c driver
> > > >    - When ov05c sensor driver probes, it will try to get gpio description but
> > > > it will fail because the amd-pinctl driver which creates the gpio resource
> > > > hasn't been loaded yet.
> > > >    - the ov05c sensor driver probe failure will finally make sensor not able
> > > > to work when start streaming
> > > > 
> > > > Add following patch is supposed to fix this issue to make it work on FW
> > > > 1cc8c1bf(ext):50582024(int) when CONFIG_VIDEO_OV05C is defined.
> > > > 
> > > > @@ -1121,6 +1129,7 @@ static struct i2c_driver ov05_i2c_driver = {
> > > > 
> > > > module_i2c_driver(ov05_i2c_driver);
> > > > 
> > > > +MODULE_SOFTDEP("pre: pinctrl-amdisp");
> > > > MODULE_ALIAS("ov05");
> > > > MODULE_DESCRIPTION("OmniVision OV05 sensor driver");
> > > > MODULE_LICENSE("GPL and additional rights");
> > > > 
> > > > Please help to see if it works if you get time.
> > > 
> > > There is no difference I'm afraid. I applied the patch and tested with FW
> > > 1cc8c1bf(ext):50582024(int) and the webcam is still broken on that FW:
> > > 
> > >    [   19.523006] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:0)|start_streaming
> > >    [   19.537000] amd_isp_capture amd_isp_capture.1.auto: ISP FW boot suc!
> > >    [   19.537009] amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting Phy
> > >    [   19.537050] PHY register access test success!
> > >    [   19.537901] Termination calibration observability: 0x0
> > >    [   19.539926] Wait for phyReady: 0x0
> > >    [   19.541932] Wait for phyReady: 0x1
> > >    [   20.901654] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
> > >    [   22.070676] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
> > >    ...
> > >    [   28.769372] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:1)|stop_streaming
> > >    [   28.769388] amd_isp_capture amd_isp_capture.1.auto: amdgpu: stopping Phy
> > >    [   28.769868] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[1]
> > >    [   28.771799] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[0]
> > > 
> > > Sultan
> > 
> > That's really weird, I tested kernel built from
> > https://github.com/amd/Linux_ISP_Kernel/tree/4.0 with CONFIG_VIDEO_OV05C=m
> > and above sensor driver probe failure patch on FW c8c1bf(ext):50582024(int),
> > camera APPs like cheese, qv4l2, Camera all work well.
> > 
> > Your failure still looks like sensor related, Would you help to add log to
> > sensor driver drivers/media/i2c/ov05c.c to see if its probe function gets
> > called and succeeds? Here is the log in success case,
> > 
> > amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting Phy
> > PHY register access test success!
> > Termination calibration observability: 0x0
> > Wait for phyReady: 0x0
> > Wait for phyReady: 0x1
> > amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting camera sensor
> > amd_isp_capture amd_isp_capture.1.auto: isp_intf_start_stream,cid:0,sid:0
> 
> Debug log output:
> 
> $ dmesg | rg SARU
> [    4.565697] amd-isp4 OMNI5C10:00: SARU: amd_isp_probe started...
> [    4.565753] amd-isp4 OMNI5C10:00: SARU: amd_isp_probe completed successfully
> [    6.937077] amd_isp_i2c_designware amd_isp_i2c_designware: SARU: amd_isp_dw_i2c_plat_probe started...
> [    6.937522] amdisp-pinctrl amdisp-pinctrl: SARU: amdisp_pinctrl_probe started...
> [    6.941264] amdisp-pinctrl amdisp-pinctrl: SARU: amdisp_pinctrl_probe completed successfully
> [    6.951967] amd_isp_i2c_designware amd_isp_i2c_designware: SARU: amd_isp_dw_i2c_plat_probe completed successfully
> 
> Log output when opening cheese:
> 
> [   46.957925] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:0)|start_streaming
> [   46.979797] amd_isp_capture amd_isp_capture.1.auto: ISP FW boot suc!
> [   46.979812] amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting Phy
> [   46.979860] PHY register access test success!
> [   46.980565] Termination calibration observability: 0x0
> [   46.982598] Wait for phyReady: 0x0
> [   46.984634] Wait for phyReady: 0x1
> [   48.340154] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
> [   49.509505] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
> [   51.823498] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:1)|stop_streaming
> [   51.823513] amd_isp_capture amd_isp_capture.1.auto: amdgpu: stopping Phy
> [   51.823962] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[1]
> [   51.825358] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[0]
> 
> Patch applied to tree:
> 
> --- a/drivers/i2c/busses/i2c-designware-amdisp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -42,2 +42,3 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>  	pdev->dev.init_name = DRV_NAME;
> +	dev_info(&pdev->dev, "SARU: %s started...", __func__);
>  
> @@ -95,2 +96,3 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>  
> +	dev_info(&pdev->dev, "SARU: %s completed successfully", __func__);
>  	return 0;
> --- a/drivers/media/i2c/ov05c.c
> +++ b/drivers/media/i2c/ov05c.c
> @@ -1031,2 +1031,3 @@ static int ov05_probe(struct i2c_client *client)
>  
> +	dev_info(&client->dev, "SARU: %s started...", __func__);
>  	ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
> @@ -1081,2 +1082,3 @@ static int ov05_probe(struct i2c_client *client)
>  
> +	dev_info(&client->dev, "SARU: %s completed successfully", __func__);
>  	return 0;
> @@ -1123,2 +1125,3 @@ module_i2c_driver(ov05_i2c_driver);
>  
> +MODULE_SOFTDEP("pre: pinctrl-amdisp");
>  MODULE_ALIAS("ov05");
> --- a/drivers/pinctrl/pinctrl-amdisp.c
> +++ b/drivers/pinctrl/pinctrl-amdisp.c
> @@ -183,2 +183,3 @@ static int amdisp_pinctrl_probe(struct platform_device *pdev)
>  	pdev->dev.init_name = DRV_NAME;
> +	dev_info(&pdev->dev, "SARU: %s started...", __func__);
>  
> @@ -215,2 +216,3 @@ static int amdisp_pinctrl_probe(struct platform_device *pdev)
>  
> +	dev_info(&pdev->dev, "SARU: %s completed successfully", __func__);
>  	return 0;
> --- a/drivers/platform/x86/amd/amd_isp4.c
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -365,2 +365,3 @@ static int amd_isp_probe(struct platform_device *pdev)
>  
> +	dev_info(&pdev->dev, "SARU: %s started...", __func__);
>  	pinfo = device_get_match_data(&pdev->dev);
> @@ -388,2 +389,3 @@ static int amd_isp_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, isp4_platform);
> +	dev_info(&pdev->dev, "SARU: %s completed successfully", __func__);
>  	return 0;

Sorry, please disregard my last two emails, as I was testing on the wrong
kernel. :(

I've confirmed that the MODULE_SOFTDEP("pre: pinctrl-amdisp") change indeed
fixes the newer firmware on the old isp driver 4.0 release. Without that change,
it is as you say: the ov05c sensor probe fails.

So now I can use FW 1cc8c1bf(ext):50582024(int).

Sultan

