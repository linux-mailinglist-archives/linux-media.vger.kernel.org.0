Return-Path: <linux-media+bounces-22565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8429A9E2DDA
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 22:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45E79166F9C
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9008209F4D;
	Tue,  3 Dec 2024 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lsIeUEHl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7844205E2F
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 21:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733260269; cv=none; b=Rir2OvGdMsx2zE0s+DnTPtT5EEhm6oZFKoi3YmcpMmK9qfOjQ1Je5KqI/ByZC4HEDfohPXPJsAjKrc+KpNE2jf9IplldSVXq8x9dcHOfJiIQcl7SSgBYD054eiGDQTKF9fswb4Da95TmNrc4uf3xY7Wn+26uVpil3Tc0WSubGZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733260269; c=relaxed/simple;
	bh=mldf0Wu7ZhdNc39LmyRnpOOAa3Bd2fL7/nfxKBLLYZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxbJ/iIUcJJUw6vfM1fkFZKcF/F92Jw6m6TV6PZcOdfnhYwfXHs4sZUENZ2w2JToaXw06RTHuvAsBmuMwEDyBHZ9olutchDWm/pezymUJLptTxGz1vfimANxHUASYEDSlTyaSloM5fWGA4WYNu3D661FR8XRe08f99mOVKRpRLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lsIeUEHl; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-724f41d520cso3610012b3a.1
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 13:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733260267; x=1733865067; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/i3jPBDipLqisE7gTwvhfw99QUxA4cWmIpareouCiQ=;
        b=lsIeUEHlmfTKliJMqllXVeyNQQaFeRZWyzpwL8cFTJxkkH3b93t5s9JUP+eYEl+rwf
         KNT7glEL/WQfRhYjpJZi518KnVly919aN8W/VCRWElhtygyYPMpVjbzjISyj1Rl5Xl8z
         jiY+s5BrJ1fIzE/5dVPTfUJSSkyVSDl+qg8pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733260267; x=1733865067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/i3jPBDipLqisE7gTwvhfw99QUxA4cWmIpareouCiQ=;
        b=n3CcVQWBzu1OuHUwIKdMEY6vtdJfck02njR5oThwYqLT/dKJ47RakCCBUW5Fxc4/JW
         wvHc0o7g1zhhmAipwQ5hFVVSvdBn4gNZVFIuyHhKbyUOESxVsGJaDoIk/GXBOWv31IfW
         0fTW5PzRyW/C0mvDTWwV6k0lY+2/iRrQIWc3bQSOvXdNvH46opLcjeKlHYpogIwXbP36
         VC0uBwGmxKw6xRtfIdKr+giwgs7Y+Zp09jXEV1OqBZ/uCZN+MQGKpCgYtdpZMxtDkgMy
         +oI6/nyLkFuAOgc2SvtP7LUnw1eAsW/6xU/AeAcGqN9PXEuzUdHRwvFY2l5uwMQK0Ddh
         y75w==
X-Forwarded-Encrypted: i=1; AJvYcCVCzAbzoPLhMKNKNMrWUFFYh135OnlO8B5Bm3LS0ROJ/mL6dKfFKhFqupNJTaqUq8d7LX8ZAKqKTQzC2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YytbgIP1+hgpoPA/bpjYy31kmzBFnnfCz+/K7E+aDi3CgHfpnEV
	bZ6hmFHzpcGeQOPvMd3z5Tm+cFXh5gSl/0jatN5R2Ftt5ZM+yld1RtyY/J09jsdYGCyIMPEAdm4
	=
X-Gm-Gg: ASbGncuCA/GO7CekLegs0j00HrBi31J6jEjrrxG8FUy3MKkGsklYq62cTLamff1FaHU
	c/8qD7z44orX8JcotbdgWTN7QwpqPIcyqzxU51sQynXCTfgMDX02xZ70abqb3UyvqPE9nfhM00j
	2N7hdb6x5YxI2W9lpvwvrYjdzrKMCse+tkpgXjicq4FEUd7YZgBT8RAZ6AJUqbza5Nlf6+U+u+K
	WfiPFSeuGiU8RaCoVR2z8xWAZSPgDj4z4IQ+1v3iY24oHCX4e9I2/QpMJcCOrsnUA3D0xYCEpp7
	nwhDt59uNzHb
X-Google-Smtp-Source: AGHT+IHXAW8f+rqM246idO1a3p8hfBoaq0Yz8I4zXRhdWmqsyGbOxbHEVV9ZEQLzJIAtQhhK5UbyVw==
X-Received: by 2002:a17:902:d4cf:b0:20c:fb47:5c1c with SMTP id d9443c01a7336-215bd1c2812mr43495695ad.14.1733260265305;
        Tue, 03 Dec 2024 13:11:05 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215411c3588sm82158815ad.51.2024.12.03.13.11.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 13:11:03 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2eeb64f3588so2320072a91.2
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 13:11:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6OaSc02FEKS2DIiLuPJJENG1B0P++XRS7r6dV8QlNvIbqAlQz9LEMuYvoR5uR8Crgb41IlMTI0hk9Ww==@vger.kernel.org
X-Received: by 2002:a17:90b:1c10:b0:2ee:94d1:7a89 with SMTP id
 98e67ed59e1d1-2ef011dedcemr5013685a91.1.1733260262121; Tue, 03 Dec 2024
 13:11:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-5-6658c1fe312b@chromium.org> <67f78128-dcc0-4253-a6f7-5905ca375b06@redhat.com>
 <20241203203748.GD5196@pendragon.ideasonboard.com>
In-Reply-To: <20241203203748.GD5196@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 3 Dec 2024 22:10:50 +0100
X-Gmail-Original-Message-ID: <CANiDSCs2VXdM5pekzEHTqddR=1G5U2wa+zdkRgDKvVhfxw73Mw@mail.gmail.com>
Message-ID: <CANiDSCs2VXdM5pekzEHTqddR=1G5U2wa+zdkRgDKvVhfxw73Mw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] media: uvcvideo: Flush the control cache when we
 get an event
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 21:38, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Dec 02, 2024 at 03:45:57PM +0100, Hans de Goede wrote:
> > Hi,
> >
> > On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
> > > Asynchronous controls trigger an event when they have completed their
> > > operation.
> > >
> > > This can make that the control cached value does not match the value in
> > > the device.
> > >
> > > Let's flush the cache to be on the safe side.



> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index e90bf2aeb5e4..75d534072f50 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1672,6 +1672,9 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
> > >     struct uvc_device *dev = chain->dev;
> > >     struct uvc_ctrl_work *w = &dev->async_ctrl;
> > >
> > > +   /* Flush the control cache, the data might have changed. */
> > > +   ctrl->loaded = 0;
> > > +
> > >     if (list_empty(&ctrl->info.mappings))
> > >             return false;
> > >
> >
> > Thank you for the patch.
> >
> > I'm not familiar enough with UVC yet to really have an opinion on this one,
> > so I'll defer reviewing this one to Laurent.
>
> Conceptually this change looks fine, but the commit message needs to
> explain why this is safe to do without protecting ctrl->loaded with a
> lock.

Just realised that loaded is a bit field... and we shall not be
creative with lockless writes with those.

I am going to move it to uvc_ctrl_status_event(). It will not work
with controls without mappings... but I guess we do not care about the
cache for those.

Feel free to land the whole series without this patch if we need
further discussion or changes.

>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

