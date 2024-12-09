Return-Path: <linux-media+bounces-22934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4049E988A
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39A961883337
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E822C1B0403;
	Mon,  9 Dec 2024 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VidCF00g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24391798F
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753728; cv=none; b=YVhaJv31GFMjdBs99gUe/eF8K6UzJ7ZgjQ4ni/bvVBZsyUJBjZ6ufQyxjnsONe7bcA86ZaqOQ+HplURFI4Or/SAq0WPpYe8GFuzKcvJZkdFEGw7+qT9m3jLiBAx4kiGRrBW0b8NsvZ3dfYOdgRU69tzZ+0f3CB++n+dXNC2OaUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753728; c=relaxed/simple;
	bh=VFVhE2QTlvv6e1vmvz2TkVwkpNZdis5j2cIivqIwFtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFRUlw91jL/vdBh/PaTkHjF+U/2ydDN88aNLc6zLFf7M6n9VJC698LRrhsQKobvv/uFp2bh+wtdSAUApAx+3pOtjiozhKe/SJrG5MGLLLNhteN30Ke4KLKvOGi/6yMrBt4GCg4bmJNB78hI8vQOtFf0jc+VGwZuro8NToId+v2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VidCF00g; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea8de14848so2740847a12.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733753726; x=1734358526; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xzxXRCzTVTG5CQYsalZ5w45qQHvajfokh5rpMY9TcsI=;
        b=VidCF00gOQoq7h6hJdpJMVWNZscyreCGOmqBKvDuyeoYACS4FRwmr7kBQ5D/tijLr6
         f3iCo+qXt9A6vSVI7/cgM0+4BOnX1qfS+r1zMA/Hux+FpPeJN4h+/askbgkPATGTi2xc
         5qOI106DXDj54+Pfe01U2Yk3Kw1wuhvSIQBAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753726; x=1734358526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzxXRCzTVTG5CQYsalZ5w45qQHvajfokh5rpMY9TcsI=;
        b=LIiw6clddX8ximHMtdPzU8XLtiPE9Jy/QvYEQy81a9QwhMf691H6NH/MRrMp1lHx9K
         zIBktgM3F8Sr3Slhd60EcoIq1pwp7Us9h25JNxIDOZGr1wZWGC6DgvSFjYtBQMSIoejB
         mEw6mpvxG6BDv5sbXm+rix5jyS7rqQCC8i4txXMwx4IHyFT02SijkMKFGtHr/3j19Jw/
         zxmxPUV1f6+KP936tRMtjS+WwOsT0uTOy2TOPVcyw5tLA0qUAlvuMSBTT6IUlEABs03J
         /eNtoNrDBRG8caAT3LWlKgSbNXLaPJO7C3O/jc7n+K2y4RalvKDXEaFDrB7drXv2DM8B
         BcGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD23FgsMKqttiZ5g3O1jQx9w9VGscHHJDvWa+WA0I3NRKLAOK4c4jqcHuuHGlAyUzADojtQ2Yu700aLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0M5MZhzMBQPuzncI2/egTNsksDeU1V0X/epVPDFtlgN88lD1G
	yelxzz3G79Iyaqje0hjvYnC/EADBc840noDniUqETdBjlSLi4rSvcMI/OGBiOF2nnFIHIFfWLD0
	=
X-Gm-Gg: ASbGncu4PDYIfwTsScIQC8YApqztE0jmnb2w3xZW5TiMWl1d/v7uZfqOIFALCNVfb/1
	VtQiN9oxndFFE7w4TNXIWp5sOB06Ub09pzcKY1OVLz+7Mgin8FndLP1PbrOwjcQBwwyMnFEUv/5
	mDGFsjrzPyBnfHWHWbFo5jVMV0jYAr0VVnkLRmkXnsJwySWsmp5usHYJyYEo8appMpleXI44PQw
	wV5ku0xA0rqjK0DUYr37r4YDAdPlX5E95qbJ1h6+JoJ41h6Y8eKzuynqQn9fzJ2aPW1y6KIA3de
	5l1WNuWLvF5Wz7pO
X-Google-Smtp-Source: AGHT+IEhAspZKvFr7XjJpyt4FAfPjzEzmLh4UCRpGZ8oMahnXGhmuZa5eK5Ke2Z3DuWUvIbrmEjhgg==
X-Received: by 2002:a17:902:f602:b0:216:282d:c67b with SMTP id d9443c01a7336-2166a03d552mr11126335ad.35.1733753725909;
        Mon, 09 Dec 2024 06:15:25 -0800 (PST)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21615dbcd48sm56698935ad.109.2024.12.09.06.15.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:15:24 -0800 (PST)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ea8de14848so2740813a12.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:15:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXUtkF++843uak80Ry+rKKgSJDGi3YBaswz8mNpnYGIazYJPtM8N3Nd+vYs0CSwZKpdmgkG1JuXmSzcAg==@vger.kernel.org
X-Received: by 2002:a17:90b:530b:b0:2ee:fc08:1bc1 with SMTP id
 98e67ed59e1d1-2efcf2ba6d4mr1028618a91.37.1733753723393; Mon, 09 Dec 2024
 06:15:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-17-64cfeb56b6f8@chromium.org> <8258ce59-cd06-46ba-b275-97eb9ae4d64c@redhat.com>
In-Reply-To: <8258ce59-cd06-46ba-b275-97eb9ae4d64c@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 9 Dec 2024 15:15:11 +0100
X-Gmail-Original-Message-ID: <CANiDSCt_5aArcnhLvAKKfOW4sUBNZtB0QQGkS_-AWmTxh_vKMA@mail.gmail.com>
X-Gm-Features: AZHOrDnj6sP9Y52Rjxyokva7bCUrrfnBh_aHGTI1dw9kdeFQcdL7UjePmPkl7k0
Message-ID: <CANiDSCt_5aArcnhLvAKKfOW4sUBNZtB0QQGkS_-AWmTxh_vKMA@mail.gmail.com>
Subject: Re: [PATCH v15 17/19] media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ricardo Ribalda <ribalda@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Dec 2024 at 15:12, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> > Do not process unknown data types.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 5000c74271e0..4c88dab15554 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -106,6 +106,12 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
> >       struct uvc_control_mapping *map;
> >       int ret;
> >
> > +     if (xmap->data_type > UVC_CTRL_DATA_TYPE_BITMASK) {
> > +             uvc_dbg(chain->dev, CONTROL,
> > +                     "Unsupported UVC data type %u\n", xmap->data_type);
> > +             return -ENOTTY;
>
> This seems like a textbook case for -EINVAL ?

Indeed, :) https://lore.kernel.org/linux-media/8258ce59-cd06-46ba-b275-97eb9ae4d64c@redhat.com/T/#m2d38a4cf184ad3e4ea335e92ea74258d1da267c1

Thanks!

>
> Otherwise patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans
>
>
>
> > +     }
> > +
> >       map = kzalloc(sizeof(*map), GFP_KERNEL);
> >       if (map == NULL)
> >               return -ENOMEM;
> >
>


--
Ricardo Ribalda

