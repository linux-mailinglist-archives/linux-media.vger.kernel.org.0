Return-Path: <linux-media+bounces-811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 721E87F4798
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C957B20D4A
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEA751033;
	Wed, 22 Nov 2023 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Um7ABIw7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557571BC
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 05:19:29 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5cccd2d4c4dso2238557b3.3
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 05:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700659168; x=1701263968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vB3h17ZiZ1W4dA7P94tMnhpktj3v+3WDCq3z7CXQplU=;
        b=Um7ABIw75/7Zu3kE8hojnBlSlnTXIKIykW86iovazp6BwkDpkOUMOSgtpbKeVoGkdV
         Ywz8rSaTv22fikUJyychvl9sDWuDsMmgPgxDvi5QpJ8rbw4CVlKJGnPQF5OkSrsBE+iW
         DJuAr8NfdV6SwJwogoYlQwtbTR+sZP5eheq2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700659168; x=1701263968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vB3h17ZiZ1W4dA7P94tMnhpktj3v+3WDCq3z7CXQplU=;
        b=gEyLMtC+QSbmICesf3VzbAjfFbnPJe54xLAjbjmZ4YvZ3Ywt3Na9vBnyl12xwZrjor
         Ryyge+ajFCs0rZLGC5yBOFHXdOAHrxqLQzkGD1CppR+iyLtTpoA54XQLzWEZCc8ZfELs
         fJ1U+mFdV6lHym6KEpRDQzlSsTqHPf7DlRFvoqxclK2cP+xabonZ7tB7rzjsA/uYkpTf
         b8wES96MZgx103RY3HPY44yp+kzwrV25qycqvEzpiuQd6xlYGQ1qBskEVo91ncbky9Bb
         iqPAAlK3YEVQgZ6OwK/SWNejZxcg0QdKByh6+N/Voi4QZUkGG6int0kva7TecNgP4IJT
         ml2w==
X-Gm-Message-State: AOJu0Yx71ip8tVVTK3zbcbdG2cxbd/iU/vPKAXtTMhMnEN9QiY7bVgXk
	kcuOtm6D7DE8RHq5rREhyQe7bylTDT4ONstWJj8FkQ==
X-Google-Smtp-Source: AGHT+IHC43TWZUG2FyQ2r5jhjUe0aF/lQJM5GnPYO5NfxM9+JEGsmBunr3aEH+CzMpUYtfd63kbIzg==
X-Received: by 2002:a81:ae06:0:b0:5cc:770e:b9a5 with SMTP id m6-20020a81ae06000000b005cc770eb9a5mr1442318ywh.11.1700659168332;
        Wed, 22 Nov 2023 05:19:28 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id p65-20020a0dff44000000b005c08cfb7cadsm3699876ywf.57.2023.11.22.05.19.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 05:19:27 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-daf7ed42ea6so6632552276.0
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 05:19:27 -0800 (PST)
X-Received: by 2002:a25:6605:0:b0:da3:ab41:33c6 with SMTP id
 a5-20020a256605000000b00da3ab4133c6mr1946922ybc.65.1700659167137; Wed, 22 Nov
 2023 05:19:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106-uvc-event-v3-1-c2d2fdaa2e2c@chromium.org> <995f8f26-ed20-44d2-a76a-e354fc68d65e@xs4all.nl>
In-Reply-To: <995f8f26-ed20-44d2-a76a-e354fc68d65e@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 14:19:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCvniNQOfQ1a3o33UPf4roEa4-EOE=1ggHrwumpyNsxR5g@mail.gmail.com>
Message-ID: <CANiDSCvniNQOfQ1a3o33UPf4roEa4-EOE=1ggHrwumpyNsxR5g@mail.gmail.com>
Subject: Re: [PATCH v3] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Esker Wong <esker@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Tue, 21 Nov 2023 at 11:37, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Ricardo,
>
> Sorry, I missed the whole discussion for the v2 patch. I've now read it and
> will reply here.
>
> On 11/6/23 12:00, Ricardo Ribalda wrote:
> > Add support for the frame_sync event, so user-space can become aware
> > earlier of new frames.

Will fix the description in the next version thanks!


>
> I don't think this describes why you want this. Specifically, you want to use
> this to measure latency inside the driver between the arrival of the first USB
> packet and the time the buffer is dequeued.
>
> And this is presumably meant for debugging/measuring, but not for normal
> capturing. Right?
>
> Based on the discussion it looks like everyone is OK with this for the BULK
> case, and V4L2_EVENT_FRAME_SYNC makes sense to me there. You want to see the
> sequence number in the event, and the description of the event matches what
> happens.
>
> The problem is the ISOC case where it is debatable if this adds anything.
>
> Perhaps in the ISOC case this event shouldn't be supported? Unless you can
> show that it does provide useful information in the ISOC case. I didn't see
> that in the v2 discussion, but I might have missed it.

There are the following times
- t_exposure: Time when the exposure happens. We can get it from
v4l2_buffer.timestamp based on the hw timestamp
- t_usb_first: Time when the first usb frame arrives at the usb host.
We cannot get it (or better said.. I do not know how to get it)
- t_urb: Time when the first urb is processed by the driver.
Implemented as V4L2_EVENT_FRAME_SYNC in this driver
- t_dqbuf: Time when the buffer can be dequeded by userspace.
Implemented a timestamp in userspace when the syscall finishes.

What we would like to measure is (t_dqbuf-t_usb_first), but we cannot
obtain t_usb_first.

(t_urb-t_usb_first) is relatively small so it can be ignored: For ISO
the max we have measured is 1.8 msec vs 31 msec (t_dqbuf-t_urb)
(t_urb-t_usb_first) is also always constant. If you are measuring
trends, you do not care about an offset.

There are two proposed alternatives to this patch:
- that we use (t_dqbuf-t_exposure), but that measurement is dependent
on the exposure time, so we cannot use that measurement.
- use ftrace: but we will have to use different userspace methods for
every driver, which defeats the purpose of V4L2_EVENT_FRAME_SYNC, and
the metric will be as "bad" as the current proposal.

If you are curious you can take a look at a trace here:
https://ui.perfetto.dev/#!/?s=061a0fb7ebb0333e5dcbe35f487c18980e8e00a6e1b227c98d5e2569163924e0

Thanks!


>
> Regards,
>
>         Hans
>
> >
> > Suggested-by: Esker Wong <esker@chromium.org>
> > Tested-by: Esker Wong <esker@chromium.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > We have measured a latency of around 30msecs between frame sync
> > and dqbuf.
> > ---
> > Changes in v3:
> > - Sent wrong patch as v2 sorry :S
> > - Link to v2: https://lore.kernel.org/r/20231106-uvc-event-v2-1-7d8e36f0df16@chromium.org
> >
> > Changes in v2:
> > - Suggested by Laurent. Split sequence++ and event init.
> > - Link to v1: https://lore.kernel.org/r/20231020-uvc-event-v1-1-3baa0e9f6952@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c  | 2 ++
> >  drivers/media/usb/uvc/uvc_video.c | 7 +++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index f4988f03640a..9f3fb5fd2375 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1352,6 +1352,8 @@ static int uvc_ioctl_subscribe_event(struct v4l2_fh *fh,
> >       switch (sub->type) {
> >       case V4L2_EVENT_CTRL:
> >               return v4l2_event_subscribe(fh, sub, 0, &uvc_ctrl_sub_ev_ops);
> > +     case V4L2_EVENT_FRAME_SYNC:
> > +             return v4l2_event_subscribe(fh, sub, 0, NULL);
> >       default:
> >               return -EINVAL;
> >       }
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 28dde08ec6c5..6a9410133908 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1073,9 +1073,16 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >        * that discontinuous sequence numbers always indicate lost frames.
> >        */
> >       if (stream->last_fid != fid) {
> > +             struct v4l2_event event = {
> > +                     .type = V4L2_EVENT_FRAME_SYNC,
> > +             };
> > +
> >               stream->sequence++;
> >               if (stream->sequence)
> >                       uvc_video_stats_update(stream);
> > +
> > +             event.u.frame_sync.frame_sequence = stream->sequence;
> > +             v4l2_event_queue(&stream->vdev, &event);
> >       }
> >
> >       uvc_video_clock_decode(stream, buf, data, len);
> >
> > ---
> > base-commit: ce55c22ec8b223a90ff3e084d842f73cfba35588
> > change-id: 20231020-uvc-event-d3d1bbbdcb2f
> >
> > Best regards,
>


--
Ricardo Ribalda

