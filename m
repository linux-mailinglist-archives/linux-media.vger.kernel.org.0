Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E957A7E2096
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 12:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjKFL6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 06:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjKFL6p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 06:58:45 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3176894
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 03:58:42 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6711dd6595fso24253916d6.3
        for <linux-media@vger.kernel.org>; Mon, 06 Nov 2023 03:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699271921; x=1699876721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxY/A/ZH0GsH1dXM733hMHUZh53IfBcqLDaCydQdCfY=;
        b=V8Al2OQ0odGmg5yeSZc1kb9fqQtWzWTTfBcPDvczvSmQkrNAA4ci8+8BpDTHzAlUDK
         Ln3eB53VMfFJRWdnp3nffWit9vri6iqiXtnw2u4XXl4sq+4p7X2aXoUhZUAZANLtnn8W
         JrWNPHhAO2ZYjloU6M3zz3maGtbcv1M5TYYMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271921; x=1699876721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxY/A/ZH0GsH1dXM733hMHUZh53IfBcqLDaCydQdCfY=;
        b=sLWwGu3mVX2HICnWUp9Z5+ErZImHwQ976yvkUlRAHSsYkz3M754vgzX2z7WoRU2pq/
         Fmiq2XCu8vpaHBZdf6VJlYc6HcbLAavkAFRXbLp8oYiShtKgyugk+Hm6b/9dDogE4eoJ
         ek277IJRWNn+BO2niMAScKCion6/RuWfajTyrAyN96vP96U6PlAzJq65OGL0tbdH7wvV
         23BmuKDNM/bxXOr5d62YW7tFz55WMwSTkGI7u96tx3IZgYufkGxsTtZFnus4AwfHqyrm
         vG9DIw3xHF1GGS6GBw/B2/knppOYocowX2SbBptz+njbKUNuF9C+j/3hCmtuIZz1nk8T
         3u5A==
X-Gm-Message-State: AOJu0YzV5r/t9VgFs+mQQQd7FTe5DMCldd53jpU6flKG+SQzL3aef1GP
        Fn0COWi7JT6i4zAcRw1xV1RH9XxAyLUy+irqzerToQ==
X-Google-Smtp-Source: AGHT+IH4wu2b9m7Mrx2q62EXF9dvnxlwKJz6GZI0Zva3YELsqwXv8hJHcm06BBk+pPW7N1gg51bOjg==
X-Received: by 2002:a05:6214:4115:b0:66d:a22a:464f with SMTP id kc21-20020a056214411500b0066da22a464fmr26006289qvb.16.1699271920752;
        Mon, 06 Nov 2023 03:58:40 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id t11-20020a0ce58b000000b00674a45499dcsm3355707qvm.88.2023.11.06.03.58.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 03:58:40 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-66d11fec9a5so24229316d6.1
        for <linux-media@vger.kernel.org>; Mon, 06 Nov 2023 03:58:39 -0800 (PST)
X-Received: by 2002:a05:6214:1d24:b0:672:1d32:9d37 with SMTP id
 f4-20020a0562141d2400b006721d329d37mr23768504qvd.26.1699271919453; Mon, 06
 Nov 2023 03:58:39 -0800 (PST)
MIME-Version: 1.0
References: <20231106-uvc-event-v2-1-7d8e36f0df16@chromium.org> <ZUjIlq0cxSv9Cut0@valkosipuli.retiisi.eu>
In-Reply-To: <ZUjIlq0cxSv9Cut0@valkosipuli.retiisi.eu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 6 Nov 2023 12:58:24 +0100
X-Gmail-Original-Message-ID: <CANiDSCv6ajVV4ETZghv80rnrjEKs0-_tOHG99PvjWStsBpWhOw@mail.gmail.com>
Message-ID: <CANiDSCv6ajVV4ETZghv80rnrjEKs0-_tOHG99PvjWStsBpWhOw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
To:     Sakari Ailus <sakari.ailus@iki.fi>, Esker Wong <esker@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Esker Wong <esker@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Mon, 6 Nov 2023 at 12:06, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Mon, Nov 06, 2023 at 10:52:27AM +0000, Ricardo Ribalda wrote:
> > Add support for the frame_sync event, so user-space can become aware
> > earlier of new frames.
> >
> > Suggested-by: Esker Wong <esker@chromium.org>
> > Tested-by: Esker Wong <esker@chromium.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > We have measured a latency of around 30msecs between frame sync
> > and dqbuf.
> > ---
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
> > index 28dde08ec6c5..4f3a510ca4fe 100644
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
> > +             event.u.frame_sync.frame_sequence = stream->sequence,
> > +             v4l2_event_queue(&stream->vdev, &event);
>
> uvc_video_decode_start() is called when the reception of the entire frame
> has been completed. However, the documentation for V4L2_EVENT_FRAME_SYNC
> says that the event is "Triggered immediately when the reception of a frame
> has begun.". The functionality here doesn't seem to fit to this patch.

If I understand correctly, there are two types of transfers, BULK and ISOC.

For bulk frames are typically divided in multiple packages and the
event is generated in the first package. So I guess we fit the
description

For isoc we receive the whole frame at once and we trigger the event
before we process it... It is maybe a bit more borderline
implementation of the event description, but not very far away.


>
> Wouldn't V4L2_EVENT_VSYNC be a better fit, even if we don't really have a
> concept of vertical sync in the case of USB? That event doesn't have the
> sequence though but I guess it's not an issue at least if your case.

All that said, If Esker does not need the sequence number I have no
issue converting it. @Esker Wong WDYT?

>
> Another technically correct option could be to create a new event for this
> but I'm not sure it's worth it.
>
> >       }
> >
> >       uvc_video_clock_decode(stream, buf, data, len);
> >
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
