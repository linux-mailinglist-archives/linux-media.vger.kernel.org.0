Return-Path: <linux-media+bounces-23704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5FC9F6601
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 13:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60F9F188F2F3
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 12:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF0A1A23AD;
	Wed, 18 Dec 2024 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IuBVehtb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BF41534EC
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525360; cv=none; b=BOtmbZLCELr0FMLDeoMC4oEKgdA/1wrlrU5c+T4HKhtTAeKc8KeewxH7LY0NF7dS6Kx1kKrCQ0rWP1oqJxfUb9NElAarLfoPhqGPe2THx6uLqHlw0OTg4dYr4racTEckniizr54bt+VjO2A16nOrpgF5z4KhB05EZas6TpkRawg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525360; c=relaxed/simple;
	bh=4LjFAuytF7l86zX2vfeR99J5aPcv0n5VoUmDvYMoH7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=am/CBuziDDvlUY2m+5qkQeULkMuu8k+qHFkhzSwSrdwfeZseZeybRG/6usrotYCQCDLVsbbTVbtGq9xwFc1/79tvf8zdjQ65W+KCd26s7g+Oxug0HSfQ20JzeX/eWPFZVmQ/b5Q9ZBHp8gAfzMVuR+H6cHLtoCg1nd1hD2lyc6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IuBVehtb; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21680814d42so53348415ad.2
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 04:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734525357; x=1735130157; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4NOUyrl6HSE1J9gQBuQuqV/BWc/i8sgU2AgutVrI5sk=;
        b=IuBVehtbLwT0nddkIFCtt467NUZyxCTKbBHLRlq6ORs88x7gVY8hcArIxbIWa179vW
         64Va4YpSkCYO5S4NyXg5h9VwMOAcmU3pU+tqcytqoMgRkrP8QMS9/+BqVRGegrymAWc3
         /QQ0po1LcMaUsBBu0l+W5XbxAw/VP3SWq5Sl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734525357; x=1735130157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NOUyrl6HSE1J9gQBuQuqV/BWc/i8sgU2AgutVrI5sk=;
        b=K758uRQ9scVGf3PywyGtY/jJxwP5JmZNqq/pfbJNuVq/mDQfY3Nf5Y/GEkcyyHKdJa
         ZQELTKpMjzTnYg4nmtrI4AgUo94Xn3egWJw03LlYDvtrTily8EbboFfHIOd3Rqrj9uPn
         +9m+1u5c25BWFiLl9/0FRGhHbd+xAzaMbPGTiZ3tZ70xRFzhsCUF41LM80djm6g/kL43
         +CGVsMZXYpY36pgutI48/ap2f5CUjEsrLasAm2OwBb/mxY5UHmxvfy7zWmp4A9wgnb8P
         g3uR6KN0Tr7WVuhZYmKElgdxcbSWQLMVFkC95o9m6THnG88x13nrd2wEq7Ea44WqDLNa
         h5cg==
X-Forwarded-Encrypted: i=1; AJvYcCXd1otosu2knK45cnjtWFuriQDFXbvQtahLP1/lc9yFRIyrCrdWhpe8TulGNuciS5RIx0eZRQhRa+5UeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5wPMmSFKPK5sg2O3pLNtu8q22ZSZt2rty1La4mb3nlBbUG0oW
	qU+gx7VKpGwmdAIsG1zs8GvsNSjHPw5ee5rU9i6vXfArn7zeYVh80lOQngpUldAJzvubOy3pMyE
	=
X-Gm-Gg: ASbGnctFAb3d8mEetggvuDJJBJjRssLEfj/D7uB9S6+MH9Jyw4gdsizgaDwcAGoltwF
	+tjdEIPvU1u/yn5qgx3mtFIhHliB2p9oYWOfH8C3WAN0hjYrWMdCgUk+sHCr7F9eoZLFBNtAQwS
	n66nAU1zse6MSgzCCRT22pUumFqhwqYV0dHbTKLy4fDPg4azl8EXF425YEBPQDs/jxVKu4WIvpw
	+rJDlAxKVYyEljUd+5ohToumMBUdneSp2kB6cuNVMqla0y/289CzryRroH0ZWPKQyOOO37yMYd1
	u+Owqb5BolJP3n9gUIrhehU=
X-Google-Smtp-Source: AGHT+IHp0yn589x3aka2LMbyhEr3ZwJ66nz6VJq5k34HcZI2VmoBCcPhaIrWV+402CrgITyYSqsM7Q==
X-Received: by 2002:a17:902:e5d2:b0:215:577b:ab77 with SMTP id d9443c01a7336-218d7252841mr36655245ad.39.1734525357612;
        Wed, 18 Dec 2024 04:35:57 -0800 (PST)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64161sm75144055ad.221.2024.12.18.04.35.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 04:35:57 -0800 (PST)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-218c80a97caso17382915ad.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 04:35:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkjHkt322GYoHxOdtM8eYMFAijwUX6horh63AX2pecGnXnkIejBBuyCTk7YRFI9G/kLv1TE6ziq+eOzA==@vger.kernel.org
X-Received: by 2002:a17:903:22c1:b0:216:31c2:3db8 with SMTP id
 d9443c01a7336-218d72526ccmr40466595ad.37.1734525356256; Wed, 18 Dec 2024
 04:35:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217112138.1891708-1-isaac.scott@ideasonboard.com>
 <20241217112138.1891708-2-isaac.scott@ideasonboard.com> <CANiDSCtkgRJdPQmwPV6GStLMv_xEYC51LDED1St6i9bnmNEPfg@mail.gmail.com>
 <CANiDSCuJVn9sSP+OWNp+AVM9NCsYaLC_x2AdtPhwwGsVMVK3Lg@mail.gmail.com>
 <0cd5abccbbd307b0346fb4c542dc0a2764665fb7.camel@ideasonboard.com>
 <CANiDSCv-KqBk9UQrdTztzS7+zczu-chFw7owECcfOoGLEtXa0w@mail.gmail.com> <20241217170229.GK20432@pendragon.ideasonboard.com>
In-Reply-To: <20241217170229.GK20432@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Dec 2024 13:35:44 +0100
X-Gmail-Original-Message-ID: <CANiDSCtRH+R=DJZR-Y=PVm3e477pDp0LTbxsfQdL1gwryTi1RA@mail.gmail.com>
X-Gm-Features: AbW1kvb57GLJBNqhO-gTRsJ0tcsm6MKhnfLR-6oFD-vi76CqpAk9A25KqQVFDUM
Message-ID: <CANiDSCtRH+R=DJZR-Y=PVm3e477pDp0LTbxsfQdL1gwryTi1RA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] media: uvcvideo: Add no drop parameter for
 MJPEG_NO_EOF quirk
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Dec 2024 at 18:02, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Dec 17, 2024 at 05:02:43PM +0100, Ricardo Ribalda wrote:
> > On Tue, 17 Dec 2024 at 16:43, Isaac Scott wrote:
> > > On Tue, 2024-12-17 at 13:08 +0100, Ricardo Ribalda wrote:
> > > > On Tue, 17 Dec 2024 at 12:58, Ricardo Ribalda wrote:
> > > > > On Tue, 17 Dec 2024 at 12:22, Isaac Scott wrote:
> > > > > >
> > > > > > In use cases where a camera needs to use the UVC_QUIRK_MJPEG_NO_EOF,
> > > > > > erroneous frames that do not conform to MJPEG standards are correctly
> > > > > > being marked as erroneous. However, when using the camera in a product,
> > > > > > manufacturers usually want to enable the quirk in order to pass the
> > > > > > buffers into user space. To do this, they have to enable the uvc_no_drop
> > > > > > parameter. To avoid the extra steps to configure the kernel in such a
> > > > > > way, enable the no_drop parameter by default to comply with this use
> > > > > > case.
> > > > >
> > > > > I am not sure what you want to do with this patch.
> > > > >
> > > > > Why can't people simply set the quirk with
> > > > >
> > > > > modprobe uvcvideo quirks=0x20000
> > > >
> > > > Sorry, I meant
> > > >
> > > > modprobe uvcvideo nodrop=1
> > > >
> > > > or
> > > >
> > > > echo 1 > /sys/module/uvcvideo/parameters/nodrop
> > > >
> > >
> > > That would also work, absolutely!
> > >
> > > If a user has these cameras, they should always add the no_drop to
> > > avoid losing frames that would otherwise be discarded as they are
> > > erroneous.
> > >
> > > This quirk will always trigger, and it is likely they would want to
> > > have all the frames sent by the camera, while still marking them as
> > > errors they can handle later in user space if they want to.
> >
> > Besides what Laurent is saying:
> > ```
> > One issue with this is that it becomes impossible for someone to unset
> > the no_drop parameter.
> > ```
> >
> > There is also the issue that with your current implementation you are
> > changing the module parameter for ALL the cameras probed after this
> > one:
> >
> > I believe that you have to do:
> > -       ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
> > +       ret = uvc_queue_init(queue, type, !uvc_no_drop_param &&
> > +                                         !(dev->quirks &
> > UVC_QUIRK_MJPEG_NO_EOF))
> >
> >
> > But maybe before that we need to have the discussion about: shall we
> > remove uvc_no_drop_param altogether?. We could start by swapping the
> > default value and see what happens....
>
> Unless someone objects, I think swapping the default value and waiting a
> bit is a good idea. If the universe doesn't collapse immediately, we
> could later drop the parameter.

I have prepared a series with this:

https://patchwork.linuxtv.org/project/linux-media/list/?series=14229
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

