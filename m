Return-Path: <linux-media+bounces-22933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1009E9881
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2E7A160F94
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10DB1B0407;
	Mon,  9 Dec 2024 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EJ3PHX58"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A158233157
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753570; cv=none; b=RvH3MpiuymJYrZkmT//pYJxSAlcHyMCmEAUY0wjVeVInUaG7FiYdcxZhCiAeraJE4Jc50cdAauxW9HOF2jGtlgd9aNZRcKW+pPz1MY+lFU+kvWgKafl4iVOMfEQC4vLvfF+avI1ijV9KHKzpxm9QNn+ZJnaE+5psMIDdS2ggQdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753570; c=relaxed/simple;
	bh=zRj0Dyp0dstbh0hfs9DFji7YWK4ZPyd8Lk0iwuGk21Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOuRDcae1KYi1oTIx3WbqMpKv5pkBMmbWH8MAOt2OJPk4xov47oGJYUzkUfpATFrmFXTvgSBjK1fdQOykOQAbtPoR7sTGSSXs7Mqek1mLu5Unmn/u1xxBpRIeK/N/JVXHNapS+YrFTDeDt3jMjYYCVryxc3iQYYDTy+jpF864E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EJ3PHX58; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21644e6140cso11590905ad.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733753567; x=1734358367; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OKSZNRKTa08K0RGxRnbNV+OP+ZpwHCUefMFSWAEyiJo=;
        b=EJ3PHX58PJzBVqCejFy/+eYLBparsOd6eOqrb47IDGb+c8HsY/H3/1cF034L0nQVxB
         1h8jz05eHHI3PQUU5OgMnybMebgmw0sm7q3vQgva6Z+pCWYYQlAbGbtlqkEp7ro2pZWo
         hGZjCiKbuM665Z/YAwbkpt3Pd+3ua1S/+2cNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753567; x=1734358367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKSZNRKTa08K0RGxRnbNV+OP+ZpwHCUefMFSWAEyiJo=;
        b=evhkHtFejrmmpFcAYmJiaV7N0dk3cihQIvfSt0cMISVVc3cBmLOFzLPae0mQffl0gy
         ltqEHjonwW3hDrLLMzfhyTphWfS0r+JvNREpITey9x56YN3yHd/v+6HElSsIbsrNKWhE
         q3G9ZVul8F8rcwr3eHTEuwuhvh3y3PuZpbgaRbaSbRiQx0itIO/X+U7K7UWBVzFOuakg
         WtZHf7DCdxJMo6D9luVB4jkBntp404aVhRY4TLdql9s/vrA6eWjHKu72Ck9YJXM/cFbh
         mlfmGfRc6YXPMt05+c/E1jQXQAt06Xh5DIt9COAYhNYO59KpzsYHnQUSNmnjivRCgl/6
         gQtg==
X-Forwarded-Encrypted: i=1; AJvYcCWcBR2/aphJu3jcYOQwqzv51Gnnd9SCpEgfvMcsvltMC196O+x3sy0iIackzV9420c3gkJsMcJU6Pe//w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZuiCop8yTi/I1Lbmj9URONSIDa0EeHE0PpfFcPiodtUILiTZ
	VtNXJAqlm0IKXW6H8O8LS0CTDHLBmPl6RiTu+hv9BKt7s98rOdVrMH9CfUAj/tCEq3vNtO7uDXk
	=
X-Gm-Gg: ASbGnctHO3qzZAtw6QWdVb2wZpw76lYit983x6LexlTknuXCXxHhrsBwwk1nZukj7E5
	yIpyP7Bq+sIg2t+nqnbOhXmpOWdNaWp7qusZ2bnDQhxKhT3/SqnY8UP2NObFjjRi6hGtU4bVAMS
	5aAB8HypDOWuQrYmR43B1d1zSuuF51jFqbxFaP8u5gZh1kFO2aFTxc5OCbMyk71HIJG3OR85ny6
	/unETgaY5wwJZLD5KeA9+pM6vuhhgDqT+zvxTAlj/yxcA3XXbn6cR+3rzBbhTVU0VsOhG9MLJSR
	jkNmmkBVWW0L
X-Google-Smtp-Source: AGHT+IH/2IKM3d4RYZUxLiXdP5ft5y1GsWqnyxzhuALfz4RxFBTPxSc9ilRFxxjpm2R181FbeftC0g==
X-Received: by 2002:a17:902:d583:b0:215:8d29:af2d with SMTP id d9443c01a7336-2166a07d852mr11164725ad.38.1733753567440;
        Mon, 09 Dec 2024 06:12:47 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21631cbf90bsm37412675ad.39.2024.12.09.06.12.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:12:46 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2efb17478adso766814a91.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:12:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUII74mOWuIxu7NI+hN3W+4Zcn0M7cnc41ORk+M40iJ1b+R9jeShRV6yBlCLhLk6/c21+OcP+iGRTvM1g==@vger.kernel.org
X-Received: by 2002:a17:90b:314e:b0:2ee:b2be:f398 with SMTP id
 98e67ed59e1d1-2efcf1365dbmr974106a91.2.1733753565451; Mon, 09 Dec 2024
 06:12:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-15-64cfeb56b6f8@chromium.org> <d99f507b-1890-4ad3-aabc-494a3b0a0dd8@redhat.com>
In-Reply-To: <d99f507b-1890-4ad3-aabc-494a3b0a0dd8@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 9 Dec 2024 15:12:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCsM1GK-FEmCtRQzQxoSVUEvfCnZ6bKM-3DkVYtgsJt0Uw@mail.gmail.com>
X-Gm-Features: AZHOrDm_6WUkRZYd-DbeqxdxhIN5YYXvWTtGNwzKWRsLlXzCZviKWNmMJT6hqdU
Message-ID: <CANiDSCsM1GK-FEmCtRQzQxoSVUEvfCnZ6bKM-3DkVYtgsJt0Uw@mail.gmail.com>
Subject: Re: [PATCH v15 15/19] media: uvcvideo: let v4l2_query_v4l2_ctrl()
 work with v4l2_query_ext_ctrl
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ricardo Ribalda <ribalda@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Dec 2024 at 15:09, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> > v4l2_query_ext_ctrl contains information that is missing in
> > v4l2_queryctrl, like elem_size and elems.
> >
> > With this change we can handle all the element_size information inside
> > uvc_ctrl.c.
> >
> > Now that we are at it, remove the memset of the reserved fields, the
> > v4l2 ioctl handler should do that for us.
> >
> > There is no functional change expected from this change.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Doesn't the v4l2-core ioctl wrapping offers queryctrl emulation
> using query_ext_ctrl ? If not maybe that should be added there?
> (this can be done later)

It does not look like. I also thought about that, but then I realised
that most of the drivers use the ctrl framework and then this is not
needed.

But anyway, as you said, it can be done later. I will add it to my todo :).

Regards!


>
> Othwerise looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Regards,
>
> Hans
>
>
>
>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 24 ++++++++++++++----------
> >  drivers/media/usb/uvc/uvc_v4l2.c | 35 +++++++++++++++--------------------
> >  drivers/media/usb/uvc/uvcvideo.h |  2 +-
> >  3 files changed, 30 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 72ed7dc9cfc1..1bc019138995 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1252,7 +1252,8 @@ static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
> >  }
> >
> >  static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
> > -                             u32 found_id, struct v4l2_queryctrl *v4l2_ctrl)
> > +                             u32 found_id,
> > +                             struct v4l2_query_ext_ctrl *v4l2_ctrl)
> >  {
> >       int idx;
> >
> > @@ -1400,7 +1401,7 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> >  static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
> >                                     struct uvc_control *ctrl,
> >                                     struct uvc_control_mapping *mapping,
> > -                                   struct v4l2_queryctrl *v4l2_ctrl)
> > +                                   struct v4l2_query_ext_ctrl *v4l2_ctrl)
> >  {
> >       if (!ctrl->cached) {
> >               int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > @@ -1465,7 +1466,7 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
> >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >                                struct uvc_control *ctrl,
> >                                struct uvc_control_mapping *mapping,
> > -                              struct v4l2_queryctrl *v4l2_ctrl)
> > +                              struct v4l2_query_ext_ctrl *v4l2_ctrl)
> >  {
> >       struct uvc_control_mapping *master_map = NULL;
> >       struct uvc_control *master_ctrl = NULL;
> > @@ -1503,6 +1504,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >                       v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> >       }
> >
> > +     v4l2_ctrl->elem_size = sizeof(s32);
> > +     v4l2_ctrl->elems = 1;
> > +
> >       if (v4l2_ctrl->type >= V4L2_CTRL_COMPOUND_TYPES) {
> >               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_PAYLOAD;
> >               v4l2_ctrl->default_value = 0;
> > @@ -1516,7 +1520,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >  }
> >
> >  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > -     struct v4l2_queryctrl *v4l2_ctrl)
> > +                     struct v4l2_query_ext_ctrl *v4l2_ctrl)
> >  {
> >       struct uvc_control *ctrl;
> >       struct uvc_control_mapping *mapping;
> > @@ -1642,7 +1646,7 @@ static void uvc_ctrl_fill_event(struct uvc_video_chain *chain,
> >       struct uvc_control_mapping *mapping,
> >       s32 value, u32 changes)
> >  {
> > -     struct v4l2_queryctrl v4l2_ctrl;
> > +     struct v4l2_query_ext_ctrl v4l2_ctrl;
> >
> >       __uvc_query_v4l2_ctrl(chain, ctrl, mapping, &v4l2_ctrl);
> >
> > @@ -2119,7 +2123,7 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
> >                                    struct uvc_control_mapping *mapping,
> >                                    u32 which, struct v4l2_ext_control *xctrl)
> >  {
> > -     struct v4l2_queryctrl qc;
> > +     struct v4l2_query_ext_ctrl qec;
> >       int ret;
> >
> >       switch (which) {
> > @@ -2133,19 +2137,19 @@ static int uvc_mapping_get_xctrl_std(struct uvc_video_chain *chain,
> >               return -EINVAL;
> >       }
> >
> > -     ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, &qc);
> > +     ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, &qec);
> >       if (ret < 0)
> >               return ret;
> >
> >       switch (which) {
> >       case V4L2_CTRL_WHICH_DEF_VAL:
> > -             xctrl->value = qc.default_value;
> > +             xctrl->value = qec.default_value;
> >               break;
> >       case V4L2_CTRL_WHICH_MIN_VAL:
> > -             xctrl->value = qc.minimum;
> > +             xctrl->value = qec.minimum;
> >               break;
> >       case V4L2_CTRL_WHICH_MAX_VAL:
> > -             xctrl->value = qc.maximum;
> > +             xctrl->value = qec.maximum;
> >               break;
> >       }
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 7e284770149d..5000c74271e0 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1014,40 +1014,35 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
> >       return ret;
> >  }
> >
> > -static int uvc_ioctl_queryctrl(struct file *file, void *fh,
> > -                            struct v4l2_queryctrl *qc)
> > +static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
> > +                                 struct v4l2_query_ext_ctrl *qec)
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_video_chain *chain = handle->chain;
> >
> > -     return uvc_query_v4l2_ctrl(chain, qc);
> > +     return uvc_query_v4l2_ctrl(chain, qec);
> >  }
> >
> > -static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
> > -                                 struct v4l2_query_ext_ctrl *qec)
> > +static int uvc_ioctl_queryctrl(struct file *file, void *fh,
> > +                            struct v4l2_queryctrl *qc)
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_video_chain *chain = handle->chain;
> > -     struct v4l2_queryctrl qc = { qec->id };
> > +     struct v4l2_query_ext_ctrl qec = { qc->id };
> >       int ret;
> >
> > -     ret = uvc_query_v4l2_ctrl(chain, &qc);
> > +     ret = uvc_query_v4l2_ctrl(chain, &qec);
> >       if (ret)
> >               return ret;
> >
> > -     qec->id = qc.id;
> > -     qec->type = qc.type;
> > -     strscpy(qec->name, qc.name, sizeof(qec->name));
> > -     qec->minimum = qc.minimum;
> > -     qec->maximum = qc.maximum;
> > -     qec->step = qc.step;
> > -     qec->default_value = qc.default_value;
> > -     qec->flags = qc.flags;
> > -     qec->elem_size = 4;
> > -     qec->elems = 1;
> > -     qec->nr_of_dims = 0;
> > -     memset(qec->dims, 0, sizeof(qec->dims));
> > -     memset(qec->reserved, 0, sizeof(qec->reserved));
> > +     qc->id = qec.id;
> > +     qc->type = qec.type;
> > +     strscpy(qc->name, qec.name, sizeof(qc->name));
> > +     qc->minimum = qec.minimum;
> > +     qc->maximum = qec.maximum;
> > +     qc->step = qec.step;
> > +     qc->default_value = qec.default_value;
> > +     qc->flags = qec.flags;
> >
> >       return 0;
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index f429f325433b..8aca1a2fe587 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -766,7 +766,7 @@ void uvc_status_put(struct uvc_device *dev);
> >  extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;
> >
> >  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > -                     struct v4l2_queryctrl *v4l2_ctrl);
> > +                     struct v4l2_query_ext_ctrl *v4l2_ctrl);
> >  int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
> >                       struct v4l2_querymenu *query_menu);
> >
> >
>


-- 
Ricardo Ribalda

