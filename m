Return-Path: <linux-media+bounces-7820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3E88BCCB
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 09:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A03601F3AF4F
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 08:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A7B18B04;
	Tue, 26 Mar 2024 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G4QiNvQq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7331125B9
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443013; cv=none; b=hZTGSYfyXFzs0mowUMIE70Ld/TBxuNKRc+u9PVZftnD1DWyTY+x8GtaHCk1bkN0TQg6kUivXzdQuiFf5qrwOYoWbsYdVU29IzKcMfxpy06QbfK9dYX084FwEyZzCQar81tCDzJE8AhdxO4FeMCl5Nrfg8x4IKxNiP52P3YM3Thg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443013; c=relaxed/simple;
	bh=k/3BTC2/MjXvCIvTQq98EM6QtHwdBLO7nWv/TVfz+GQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIak0OKyk3iD00QRAos5t8vS88GX4/nLnrMt2D8X4yMDXqqPIkSNCZRxYNrEjbvn1eZ74408mbHWq6JAaE1vshyJ8DeUrlcYLiaHZweDYqVMHlwJcSv+gjN6DT7DvqP1PCe5ZhD1SnzQmJ6pOB1TyZ+YqHSI2DjNwMuYzvxDnP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G4QiNvQq; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-696719f8dfcso23337686d6.0
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 01:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711443010; x=1712047810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z3pBKOTW270Vha3g5EEZPuJtAMCR1sK7GVofzSa+F8c=;
        b=G4QiNvQqC13sce522EJotea8PxLzoHBmOamXncRQLAHPwrPMKks4SJl0pnnL9AhZvy
         yDnuf1b85IeO8rSaxC7zKi2l6yg+2+gYTq8Y8DU72O89QE2h4eNB+b2yFikDse25Ud0L
         ijSCLOpd7wKqQ/JcZhIIX0lSiaLd+a53xJIuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711443010; x=1712047810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3pBKOTW270Vha3g5EEZPuJtAMCR1sK7GVofzSa+F8c=;
        b=BMmFSFyocKDrg24djW7ttjlamVK065bml0zgvO70YssOixmcbbst3/J9K5ZXHPfkI6
         f4WGT0rcSBtCwRiC0cThrOwhZfDU6kXS29UUA6hA9tE4K5IVrT9B6RlQ2cpY+jHbtkKu
         CctnKjCK5nn+ZlxVmvjPYGvHvmEvPgCLnopZ27orvT4sCP46eHlOeK+UPN2yUwAaWaG5
         WZbp8pXDn5Isq2E8H34vOd9LSi2P6vU40ng2gGCWPMac5zGDHSOT+RNTWkMe1Z4O2BZH
         opvPTt5v/ZHXw3fEysuon8B9DKGatdeQHwabtuh4BomfLVVBlhMAXSaOOvyG/SEPhld7
         0T2g==
X-Forwarded-Encrypted: i=1; AJvYcCWh7Pt+NNh7Nlde4LoZh+yu/qmJ4ct7BR6cEoy42AwOhi4h24kGkhZ5P6FvBLCujgvea9zE+aQ5P7aPESmhbOFJp6k9LHxbCCybuvk=
X-Gm-Message-State: AOJu0Yzwz2qh8ggapvDrNd4UM6Z1/MB90DJQ6vbMDyNSAJDVzTrm6a9u
	u3Zl2J4+j4Lm+JCIoG8qiwZSbYF6Hf0PMDznrYLR1VkPxd3Zh/DC100+oWJ1XCuugzV3A3fZjVN
	OlQ==
X-Google-Smtp-Source: AGHT+IEG/8Fe6aRDe/JTSAN8Nb11in4XnjvKCPRW3L1v0vxZKDIf8SnngM36qejs1bkds2hqE+TgdA==
X-Received: by 2002:a05:6214:410a:b0:691:1a11:312f with SMTP id kc10-20020a056214410a00b006911a11312fmr14255703qvb.22.1711443010469;
        Tue, 26 Mar 2024 01:50:10 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id jp14-20020ad45f8e000000b0069678dcab9dsm3610284qvb.16.2024.03.26.01.50.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 01:50:09 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-695df25699fso44969756d6.2
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 01:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0mE2nv//pOd5X1ZJEybl2kFnJcfmN+DHob1H87jFhOdKzWjn1DncxmEW/ZejWZ+wsAqRGFxp3f2gW6o7o9e1pPtq22zw4JltYOxQ=
X-Received: by 2002:ad4:5e8f:0:b0:696:306f:7a54 with SMTP id
 jl15-20020ad45e8f000000b00696306f7a54mr10615890qvb.48.1711443008808; Tue, 26
 Mar 2024 01:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-guenter-mini-v3-0-c4bc61d84e03@chromium.org>
 <20240325-guenter-mini-v3-2-c4bc61d84e03@chromium.org> <20240326084217.GB1041856@google.com>
In-Reply-To: <20240326084217.GB1041856@google.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Mar 2024 09:49:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCuc2AKqhAXBq6tmxZ0oK2WamuSOwJJ4qFBrJ56w8_9JKA@mail.gmail.com>
Message-ID: <CANiDSCuc2AKqhAXBq6tmxZ0oK2WamuSOwJJ4qFBrJ56w8_9JKA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: Refactor the status irq API
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Max Staudt <mstaudt@chromium.org>, Tomasz Figa <tfiga@chromium.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sergey

On Tue, 26 Mar 2024 at 09:42, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (24/03/25 16:31), Ricardo Ribalda wrote:
> >  drivers/media/usb/uvc/uvc_driver.c | 13 ++-------
> >  drivers/media/usb/uvc/uvc_status.c | 57 ++++++++++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c   | 22 ++++-----------
> >  drivers/media/usb/uvc/uvcvideo.h   | 10 ++++---
> >  4 files changed, 68 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 17fc945c8deb6..b579644ac0745 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2116,7 +2116,6 @@ static int uvc_probe(struct usb_interface *intf,
> >       INIT_LIST_HEAD(&dev->streams);
> >       kref_init(&dev->ref);
> >       atomic_set(&dev->nmappings, 0);
> > -     mutex_init(&dev->lock);
>
> Where is this getting initialized?

in uvc_status_init((). It is now called status_lock

But it should be init before  (ep == NULL)... otherwise it will not
work in devices without the int_ep.

Let me send a new version

Thanks!




--
Ricardo Ribalda

