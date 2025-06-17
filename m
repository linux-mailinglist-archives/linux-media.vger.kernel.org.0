Return-Path: <linux-media+bounces-35062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89351ADC91A
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754383A18C4
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7F32DBF4A;
	Tue, 17 Jun 2025 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OrBcyEHS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C13249F9
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158598; cv=none; b=koQrvdoTnZUqGwtgzsl5CV7TLWj9aUckvIHmxIP4/KH6zJQHez9xsMP3a5+60EDev3CY4yxGGZaOzyN/BibhKjkHB5Uma/KeKMI7f8FHawuPnVnwRrSXWgd8xkmATtqG4Tgs5oqi5jAKY8r7AMlweaxMU9/rR/KVLNE6bAhh/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158598; c=relaxed/simple;
	bh=3iABfpoY3Y0mGanrAe+hXLbHOqil9tZWsE5h0Errohc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edMEDZKEJbA5x8mLhoVW8nW7KDJ6UqIbo1WGG+cYApn27dkQS8/kWB/bUxh5aNtEsiwqzryYD2kD02y6400sv4MPUD6Qh6TPwhZMy2BKs2fuaGou2B/LGO5N419cSpMwdgiokn4ipohPKVMHR7K28ZXwFT6BkZWUMdJfc8MRMkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OrBcyEHS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so6286009e87.1
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750158595; x=1750763395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/xVAGKUYkaeSZvFs9ozze0xQ8vJD4D6EzU0DgFzpE8s=;
        b=OrBcyEHSdP9PXo2jr7IWlyJ3KJHYDaNIrsSvXqifRdLH3P/tPF94QYjDpxQCOmddS5
         zIkUckTEhC5xHEFJ2HinTpyJjuSVMCcgQwW24Rad/zcN9xHuVo9KTjZpaFsob6o8zni5
         Pl6Q+2jzVvJqyclO0+KeKOOpWEz9OvgYp32Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750158595; x=1750763395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xVAGKUYkaeSZvFs9ozze0xQ8vJD4D6EzU0DgFzpE8s=;
        b=ssGQQ8Ij5uChcRY5umdtp5ToGBG+pg//hjs43neMdDma5dx03Y/i6vzyFqbjsqcm2s
         zy+lyBBRWcB7ImktAC4leLwH70ihhZ/su66i0wvWWMBajv1HgUQE1MQGnUgO7jf/GY8i
         YK8hRIjMxnrxwM2Vynyet/PzcIutZ3aCNhaC3TmNd7drvZfhmW6jAnCZxL38HmGYFvw8
         oA/UWJZbxXLzMRo4NsQA9cSc2w4R1uOeU1gUVua/I5pHWOFawBCVIbANWj71qvlrwx/k
         EvJZTnP3L2OSjCZKbiayMID9isWVPdHoQ88KHCks231ewXGj8Cl12xfHGw4EzbannXVj
         Zquw==
X-Forwarded-Encrypted: i=1; AJvYcCV0RNmIX7nQF/yVymCpGJ7CCTHFhc4qMq9ZdqNJkB9gYx3UZyW3BbI7IfjEUpdVv/FserFvKaaqWlKO8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy79OL/HnJzc6D+mMRf9tpIDLYd+VsCRwS7meQjwahelRv3tXxs
	LB1AkGoBLmqlk37i8cVzde5hPmDl5fSLk5eQB6vheJQi/J+XPtBItTmGpqJ3atlNsVN+APD3Ef0
	DgSk=
X-Gm-Gg: ASbGncvMp1mTE+wKYgMry17rDjUg9UKhTjqbwxTtzyLZNoH1PV8iEmONbPsvkxLkb1q
	C/N/umKT1h1VOImA7Vbpdx4MflsebzLlnQZ6DBVCFxhvXpKOzisujDmAfl7pO5Bc1XHH5KqbC6N
	9CUAJbmmkdD24nChvCftqaRzGe7GZtkO8xc4Rg5H/6CtnApsDZdrDbH6heXzmmBbF/LyaDGNw0M
	fsZ/HUezP/PPwIZKyxCEYNnuOhq1c/cfJ4nxJa2YHjppf63+2M3UUSEgvt9nqh3fPPWmg7QzfuE
	F5/Sf56knFaGjoMUUbVtP82+C+OPk0CM7EJ0Bd57+1PVrVbDuAgRZsZbIIm5Mp1rbi8FKNjX+G6
	E/OjiBpWy7h92he5+sw6B9XcM
X-Google-Smtp-Source: AGHT+IFN3yvo9miR0YUZN2CsHV9ELSXIuBuPmvrmeT9GgX65nRpn+uD/+KODSplkJH3xGlU8OpRhnQ==
X-Received: by 2002:a05:6512:3501:b0:553:263d:ab97 with SMTP id 2adb3069b0e04-553b6e6d296mr3260655e87.1.1750158594691;
        Tue, 17 Jun 2025 04:09:54 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f7627sm1854797e87.221.2025.06.17.04.09.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:09:53 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d98aa5981so7058159e87.0
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 04:09:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIf464Yf389/JiGwJBOtlp6JAPCunrqoJHOaMRIrpfjAVnAjkDgcqBrr0NL6pNV1WbEG2y/qRgtKlc0w==@vger.kernel.org
X-Received: by 2002:a05:6512:2351:b0:553:330e:59da with SMTP id
 2adb3069b0e04-553b6f5a965mr3157365e87.53.1750158592973; Tue, 17 Jun 2025
 04:09:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-5-250286570ee7@chromium.org> <CANiDSCur8zys_CSZC9+-QdD0U556A7HLLdSN8mJuOpXm+Ls8Wg@mail.gmail.com>
 <20250617100730.GA10006@pendragon.ideasonboard.com>
In-Reply-To: <20250617100730.GA10006@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 13:09:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCvfbB+wwFqNGJKBbSGNhXWvxxK=dvGuej7VmHc+hAUNEA@mail.gmail.com>
X-Gm-Features: AX0GCFsrYvLMa-VmDVbj6JS2jtMAUXpZqw4PEB6foGSUqQfRugJhp1UBgzTyc50
Message-ID: <CANiDSCvfbB+wwFqNGJKBbSGNhXWvxxK=dvGuej7VmHc+hAUNEA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: uvcvideo: Use prio state from v4l2_device
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 12:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jun 16, 2025 at 08:30:08PM +0200, Ricardo Ribalda wrote:
> > On Mon, 16 Jun 2025 at 17:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > Currently, a UVC device can have multiple chains, and each chain maintains
> > > its own priority state. While this behavior is technically correct for UVC,
> > > uvcvideo is the *only* V4L2 driver that does not utilize the priority state
> > > defined within `v4l2_device`.
> > >
> > > This patch modifies uvcvideo to use the `v4l2_device` priority state. While
> > > this might not be strictly "correct" for uvcvideo's multi-chain design, it
> > > aligns uvcvideo with the rest of the V4L2 drivers, providing "correct enough"
> > > behavior and enabling code cleanup in v4l2-core. Also, multi-chain
> > > devices are extremely rare, they are typically implemented as two
> > > independent usb devices.
> >
> > As the cover letter says, this last patch 5/5 is a RFC. We can decide
> > if it is worth to keep it or not.
> >
> > The pros is that we can do some cleanup in the core,
>
> What cleanups would that be ?
>
> > the cons is that it might break kAPI.
>
> Multi-chain devices are essentially multiple video devices inside a
> single USB function. They are exposed as completely separate devices to
> userspace, having the priority ioctls on one chain impact the other
> chain wouldn't make much sense to me. I think we should drop this patch.

Ack, let's drop it.

PS: Do you know about a multi chain device that is commercially
available? I would love to buy one for testing.
Also do you know any "output" device that I can buy?

>
> > I checked in the debian sourcecode and I could only find a user of
> > PRIORITY for dvb and was optional.
>
> We could discuss deprecating the priority ioctls overall if we think
> they're not useful (and used) by userspace. I was however considering
> using them in libcamera though, to prevent other applications from
> modifying the camera configuration behind the library's back.

For the record:
From: https://codesearch.debian.net/search?q=VIDIOC_S_PRIORITY
If I am not wrong, this is the only relevant usecase:
https://sources.debian.org/src/zvbi/0.2.44-1/daemon/proxyd.c/?hl=1523#L1523

O_EXCL does not work for you?


>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 2 --
> > >  drivers/media/usb/uvc/uvcvideo.h   | 1 -
> > >  2 files changed, 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index accfb4ca3c72cb899185ddc8ecf4e29143d58fc6..e3795e40f14dc325e5bd120f5f45b60937841641 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -1728,7 +1728,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
> > >         INIT_LIST_HEAD(&chain->entities);
> > >         mutex_init(&chain->ctrl_mutex);
> > >         chain->dev = dev;
> > > -       v4l2_prio_init(&chain->prio);
> > >
> > >         return chain;
> > >  }
> > > @@ -2008,7 +2007,6 @@ int uvc_register_video_device(struct uvc_device *dev,
> > >         vdev->fops = fops;
> > >         vdev->ioctl_ops = ioctl_ops;
> > >         vdev->release = uvc_release;
> > > -       vdev->prio = &stream->chain->prio;
> > >         vdev->queue = &queue->queue;
> > >         vdev->lock = &queue->mutex;
> > >         if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db..5ed9785d59c698cc7e0ac69955b892f932961617 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -354,7 +354,6 @@ struct uvc_video_chain {
> > >                                                  * uvc_fh.pending_async_ctrls
> > >                                                  */
> > >
> > > -       struct v4l2_prio_state prio;            /* V4L2 priority state */
> > >         u32 caps;                               /* V4L2 chain-wide caps */
> > >         u8 ctrl_class_bitmap;                   /* Bitmap of valid classes */
> > >  };
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

