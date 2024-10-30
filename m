Return-Path: <linux-media+bounces-20603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE19B66EF
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 16:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37A871F22201
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 15:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79081FBCB2;
	Wed, 30 Oct 2024 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q5Kh91s6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9AD1FAC26
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 15:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730300664; cv=none; b=fptpEVMs899EkprmIKyOi+Y8DeOZsmvpYJopMSBrPefyFguAxSwXov5JUsMaYsprsdfaaeh4+MtP3kIRapBkFnHhK7RX9z0IBn23fQogu2FmTEZGm4fyD7MMbQVVCyUcm1Bx3F6sj1PxZGF7IFxdy1kmY1mXajzUFBvYCeFFCr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730300664; c=relaxed/simple;
	bh=o/XbwYlFhJUpxnV2RQsjnbpHbK33LnqqX+SaHgV/jQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QchfUX7xwfefHc8C6HGDTKdfxD5f/bxFDHRvSu7FpfFuRN0kb8qhSxGrToTMh53qUOntK66WxOo99bs9SuQHw9RgRaqfp2mfpk66nCvhLWEh+RLTjcn1SQDHR9lmLp+/shN4Wacm58KkE3lNbDJChIYblZ15GssxyXzE1hwm1SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q5Kh91s6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7206304f93aso3826613b3a.0
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 08:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730300661; x=1730905461; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GpQpcFBSyfon4JPQEq5TlNusivnoI5GYC4+WlZOOl+4=;
        b=Q5Kh91s6lD8nsMiXD/2cR+spoNzGit8qR7W5IVjOW/A9mfWrTD18ieoEJsfTfKfg8O
         DSZNr8JqB4YW1hvyWpZ/lv3BvdrfG7NY5cY7tgHOAMfyieJmdW47EeWi2fAqZY3joE2v
         4+F8Mga+a3z6c2E8E7Wtlcs4OGv98FpbDkG8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730300661; x=1730905461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpQpcFBSyfon4JPQEq5TlNusivnoI5GYC4+WlZOOl+4=;
        b=tVZww5NL1xDwVwvMLk191oUquDvc2PEblEY/uYsYoRlIVd7/2AofyZbCs6ulB0CY8C
         z4Q+JtJSggMcRS+iyaUVEHECWMLdGFM8fweDkj7i9RmV7X6p9ckEuHiemjofOiutnZDw
         YMtROEzI43wl/0b/RHxpt8G5Mqg27Mn+svJFP47/6+imzSk3EDgEMA21KtwSeWxIdA0W
         0+4tYr13uV3MnHgFvkKY/pe8U8SNaTqXrWn44ebaw/8CB9TjdPj3C8D3HWmE/g9q5h+5
         9CpR0qwH243EL1AQ4R/VGAGfyiAO97twWP75CKvVeJHVzikRH8YsXQ3VmJ8VmZr8R7Mr
         pumA==
X-Forwarded-Encrypted: i=1; AJvYcCXTvzQhg95bfM7y3w2ISiLjxAhGXCoVqbRm+zONXE75Bgb1dJFv5qzFN4m2fSF1oz6z6od+iUj+AHJAKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpuUza2GbjLY1L+/GSGQt6RumlzebiYN9DRY6KiJxgq8PKwuR
	7tbN86YuaGjvFcBTEudzWHhnoBZaA7GKJ+mPs64qxE3CLupUxslSC98Omy/DvHc6F6H5fKHciCk
	=
X-Google-Smtp-Source: AGHT+IFalybjRV9VF9iEKKKySmRx7IgBCi+a8orvrAnd54bVLxr0LBPeHCOZSqU8OtL3nj5aDY9JWw==
X-Received: by 2002:a05:6a21:394b:b0:1db:8f39:4446 with SMTP id adf61e73a8af0-1db8f395d80mr200269637.43.1730300661186;
        Wed, 30 Oct 2024 08:04:21 -0700 (PDT)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a3f0bdsm9321196b3a.212.2024.10.30.08.04.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:04:20 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2e8c8915eso5219002a91.3
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 08:04:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXF7cQGaj+xDqiipAqnmGcFkmiwxgzQm3HpR1zxW9j7z0mcq34PjT621XJt6dkAvtgvPUjesQbNiHnCXQ==@vger.kernel.org
X-Received: by 2002:a17:90a:c90b:b0:2e0:9d3e:bc2a with SMTP id
 98e67ed59e1d1-2e8f11a878fmr16639200a91.32.1730300659606; Wed, 30 Oct 2024
 08:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>
 <ZyJB4Kxn3Gm79_MH@valkosipuli.retiisi.eu>
In-Reply-To: <ZyJB4Kxn3Gm79_MH@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Oct 2024 16:04:06 +0100
X-Gmail-Original-Message-ID: <CANiDSCvGTGo+O14Z=pL=CaZo-9DrzVJ-JwD5GG0Z=cJDTcUG4w@mail.gmail.com>
Message-ID: <CANiDSCvGTGo+O14Z=pL=CaZo-9DrzVJ-JwD5GG0Z=cJDTcUG4w@mail.gmail.com>
Subject: Re: UVC: Privacy gpio as subdevice
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunke Cao <yunkec@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Wed, 30 Oct 2024 at 15:25, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Wed, Oct 30, 2024 at 02:03:18PM +0100, Ricardo Ribalda wrote:
> > Hi Hans (de Goede, but others are welcome as well :) )
> >
> > Some notebooks have a button to disable the camera (not to be mistaken
> > with the mechanical cover). This is a standard GPIO linked to the
> > camera via the ACPI table.
> >
> > 4 years ago we added support for this button in UVC via the Privacy control.
> > This has two issues:
> > - If the camera has its own privacy control, it will be masked
> > - We need to power-up the camera to read the privacy control gpio.
> >
> > We tried to fix the power-up issues implementing "granular power
> > saving" but it has been more complicated than anticipated....
> >
> > Last year, we proposed a patchset to implement the privacy gpio as a
> > subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/
> >
> > I think it is a pretty clean solution and makes sense to use a
> > subdevice for something that is a sub device of the camera :).
> >
> > Before moving forward, Laurent and I would like to hear your opinion.
>
> I remember we discussed this and I wasn't very enthusiastic about the
> proposal but thinking about it again, there are situations where this is
> the only feasible solution, including on raw cameras with a privacy GPIO,
> besides the first issue you brought up above.
>
> Regarding the second one, why would you need to power on the camera to get
> the GPIO's value?

In order to read the control, you need to open the device, and once
you open the device the device is powered up:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_v4l2.c#n621

In a perfect world it would only be powered up during streamon(), but
uvc is a complicated monster:
- We have delayed controls
- We have buttons
If we only power up the device during streamon those things would not
work properly.

I think I have a solution for delayed controls...assuming the device
implements the standard properly.
I have no solution to support buttons :(. Luckily not that many
cameras have that today

Regards!


>
> I'll review the set.
>
> While in the case of UVC it's fairly clear what the sub-device is related
> to, but for the general case it'd be good to have an ancillary link there.
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

