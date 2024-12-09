Return-Path: <linux-media+bounces-22970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEBE9E9FFD
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 21:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59AAD281870
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE9E19ADBF;
	Mon,  9 Dec 2024 20:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k5BOuKrt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3382D199230
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733774548; cv=none; b=JW+5bRwpTk5puIG1dac7rA4s5UdX7b70BkmgCeMcM4auYkmOyCDNcFNP+QJr5MziZiCu1mKSi0ucV4tIpfKWMiJnfK+/iWvwo24sU9Pu4l3wSt2twctFsSymE5cytr68ALsEEfifFN+nDHSPbGfuj5SaBCLkP8QuHewcLLJJaSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733774548; c=relaxed/simple;
	bh=0Ayw37wUejtQ5m+rsSeIg82/mR7t7LSqI1T/BKoym3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZDI8VPiqSDxUwjnVH7N7p6Y5+pPvlTWvrsLaIjy3/5h78Y9VYHk4Zhqsfkw+hUjLYFG2psrF958NdEoA00o1/Qjp82BqWkAHMS2hL2KdMT0XmEbMX6rszFTLfj9hT2n0dvM+7QTpvkPJgmDY07T+tTyy+RZyU1X772XKJTj888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k5BOuKrt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216395e151bso11955005ad.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 12:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733774546; x=1734379346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=33O92irM5rjPnkOEmFcL92w9iQOp7kWbD3T8HmnoBQA=;
        b=k5BOuKrtkwl8EYe2eQf39nbMoS18649hvE0SRqtq+OlDgwy0meQ8R1oPmtpgS6PMma
         fdlwtJZErHGMWZxswHMPXnYiWq+1zXYTR/YoABfxd7qx4jrJb07MuIHGUeEHz+Dp95Fg
         oNea1NlYV48eHJ3rqTgQH2KmDEdK4WVgtluCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733774546; x=1734379346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33O92irM5rjPnkOEmFcL92w9iQOp7kWbD3T8HmnoBQA=;
        b=QIWZD8+v+ArfeI3NSvO1sz+cuHeCunPCrQKK3WnyKOeTkr1w+6WVuLhyemWRzT/hem
         7J5Ur0U4RXxjp/kmjFRUJPLmcdIvNrOgNWjKtOkzSQOot80bMxiWH9iKfa7eEB9rZucf
         /hQXXBtRFEpUb41Sl/uWP0L9l1IqPL5jGosXKqNMwdaot6fsBNjNX6BluiPK8S1FNayA
         6I/IjDQbOD2RvuXR1ypMoF67cNoEJXjeIqA/z5AKgx2SGQPhi5ySDk5dIhBN2TLe9NFb
         UDRg+DZm+ZLXVBkYgtHDoQuWfQSL+kEkj8gJ8bPTqdqnz6ZfcfiwGI4WfNArCEJXPISu
         pGAw==
X-Forwarded-Encrypted: i=1; AJvYcCXYSgXg5PlJ9x4BfmZoaBWdt1BP+g7TpVoqLx87JFkS0SYgm842iTqoXe8PPJJjfAYMkxYwPySMBCeumQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHB8wrjE2hGzr3Ml9EfhSqG+97wMMkR9z8cCsacQZgoetxjGPT
	m2E0MI7fho2ipCxut2Xf8T8ujOBj5VaWMLF/LtrtPK+V8e08OJD1XhkDDSovz/k2VH8zGJCJobY
	=
X-Gm-Gg: ASbGncvKvRWENyuJ+20IkF0PzoQc0CKeSuBeB6O62ggwH9C87C1exvBQwdNGAHFpCe8
	BQaDLxFcte2zIZ3rr8u9mkVDKNXlfXX13za47lLWknsJyctMeRiEXWXPhg3DiB1UiE3N6/GJ1Ye
	kAJZfETIxW7KVJ5hGMdtZuSPlQVQNY9Mg6WLGz5WaoYcFklieddH9qAitG/nmoEWdhKK9xzSI0G
	QngrHHckFgBgF4Np4h3UFwGyDDA7eMk7l9tWkuLm5n9BGYRLRpVeLvBsIlwjrILfD6ScWwX7mdF
	+W/+FK8ZS/F1M5yEZjDm
X-Google-Smtp-Source: AGHT+IGOtHnUoG3JDpdVaDKRnEAOOvtaBq6NnJsssiK8bKEgtOyiYt6ufJ6HtgphaU94/qf0lcjhTw==
X-Received: by 2002:a17:902:d2c7:b0:215:58be:334e with SMTP id d9443c01a7336-21670a06c6fmr8982025ad.10.1733774546237;
        Mon, 09 Dec 2024 12:02:26 -0800 (PST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21644979a14sm27981135ad.145.2024.12.09.12.02.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 12:02:24 -0800 (PST)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fd377ff3c5so1881403a12.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 12:02:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqBEKv7gxdNvIXW+csqq1n1EHG9AHzdPlBPtCVsx9gHKpwuKXw5tIi9w9D1Iy+gDDnrkVXJdnSiAQzYQ==@vger.kernel.org
X-Received: by 2002:a17:90b:50e:b0:2ef:6cbd:3c0b with SMTP id
 98e67ed59e1d1-2efd5869946mr938178a91.3.1733774543037; Mon, 09 Dec 2024
 12:02:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
 <20241209-queryctrl-v1-1-deff7acfcdcb@chromium.org> <4bd4796f-858a-48f7-9b32-ef6991ebe194@xs4all.nl>
In-Reply-To: <4bd4796f-858a-48f7-9b32-ef6991ebe194@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 9 Dec 2024 21:02:11 +0100
X-Gmail-Original-Message-ID: <CANiDSCt_rpf=RjTYR+Fmy4fsWb0z6J5NU7iKrERDmvUrcxZwig@mail.gmail.com>
X-Gm-Features: AZHOrDlRlIITa-MC0kxLj6pBufnFBS38Pperkg5q-RePWpzWtd1V-2fTVWLSvh4
Message-ID: <CANiDSCt_rpf=RjTYR+Fmy4fsWb0z6J5NU7iKrERDmvUrcxZwig@mail.gmail.com>
Subject: Re: [PATCH 01/10] media: ioctl: Simulate v4l2_queryctrl with v4l2_query_ext_ctrl
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 9 Dec 2024 at 20:34, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 09/12/2024 20:25, Ricardo Ribalda wrote:
> > v4l2_queryctrl is a subset of v4l2_query_ext_ctrl. If the driver does
> > not implement v4l2_queryctrl we can implement it with
> > v4l2_query_ext_ctrl.
> >
> > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c   |  3 ++-
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 22 +++++++++++++++++++++-
> >  2 files changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index 5bcaeeba4d09..252308a67fa8 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -572,7 +572,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
> >          and that can't be tested here. If the bit for these control ioctls
> >          is set, then the ioctl is valid. But if it is 0, then it can still
> >          be valid if the filehandle passed the control handler. */
> > -     if (vdev->ctrl_handler || ops->vidioc_queryctrl)
> > +     if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
> > +         ops->vidioc_query_ext_ctrl)
> >               __set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
> >       if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
> >               __set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 0304daa8471d..a5562f2f1fc9 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -2284,9 +2284,11 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
> >                               struct file *file, void *fh, void *arg)
> >  {
> >       struct video_device *vfd = video_devdata(file);
> > +     struct v4l2_query_ext_ctrl qec;
> >       struct v4l2_queryctrl *p = arg;
> >       struct v4l2_fh *vfh =
> >               test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
> > +     int ret;
> >
> >       if (vfh && vfh->ctrl_handler)
> >               return v4l2_queryctrl(vfh->ctrl_handler, p);
> > @@ -2294,7 +2296,25 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
> >               return v4l2_queryctrl(vfd->ctrl_handler, p);
> >       if (ops->vidioc_queryctrl)
> >               return ops->vidioc_queryctrl(file, fh, p);
> > -     return -ENOTTY;
> > +     if (!ops->vidioc_query_ext_ctrl)
> > +             return -ENOTTY;
> > +
> > +     /* Simulate query_ext_ctr using query_ctrl. */
> > +     qec.id = p->id;
> > +     ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
> > +     if (ret)
> > +             return ret;
> > +
> > +     p->id = qec.id;
> > +     p->type = qec.type;
> > +     strscpy(p->name, qec.name, sizeof(p->name));
> > +     p->minimum = qec.minimum;
> > +     p->maximum = qec.maximum;
> > +     p->step = qec.step;
> > +     p->default_value = qec.default_value;
> > +     p->flags = qec.flags;
>
> That's not quite correct. See v4l2_queryctrl() in v4l2-ctrls-api.c
> on how to do this: for types that VIDIOC_QUERYCTRL doesn't support,
> some of these fields must be set to 0.
>
> In fact, once vidioc_queryctrl has been removed, then you can also
> remove v4l2_queryctrl() and just rely on this code. Unless I missed
> something.

Thanks for the mega-fast review :)

I do not think that we can easily remove v4l2_queryctrl(). It is still
called by v4l2-subdev.c

We could do something to remove the code duplication... but it will
probably make the code more difficult to follow.

I will send a new version with the fix that you proposed, as well as:

-- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2290,10 +2290,6 @@ static int v4l_queryctrl(const struct
v4l2_ioctl_ops *ops,
                test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
        int ret;

-       if (vfh && vfh->ctrl_handler)
-               return v4l2_queryctrl(vfh->ctrl_handler, p);
-       if (vfd->ctrl_handler)
-               return v4l2_queryctrl(vfd->ctrl_handler, p);
        if (!ops->vidioc_query_ext_ctrl)
                return -ENOTTY;

>
> Regards,
>
>         Hans
>
> > +
> > +     return 0;
> >  }
> >
> >  static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
> >
>


-- 
Ricardo Ribalda

