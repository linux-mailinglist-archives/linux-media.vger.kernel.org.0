Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67FB67E34C7
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 06:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbjKGFGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 00:06:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233448AbjKGFGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 00:06:35 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E7D115
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 21:06:31 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7af20c488so63638427b3.1
        for <linux-media@vger.kernel.org>; Mon, 06 Nov 2023 21:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699333591; x=1699938391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MNdTKVIaJss4ZqgmyFYAFnq1SDnac/PDATg0+wIP+4=;
        b=YNPT0KnQMu7/pXc4vgx7kOO7SE3xd0AZQd7MyTJPdH55/QDL1z0w+DTeG3nc/13YVj
         MVJ6B4kb2/k35JKRoyrGA24Ge2v81J4HQOASSos+wxEhUXKlPbs+T/pkx+uETUrIN36i
         IvGMfwk/srcjUmgJHhdgpMWd1l+laja14JNng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699333591; x=1699938391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MNdTKVIaJss4ZqgmyFYAFnq1SDnac/PDATg0+wIP+4=;
        b=Wt8rWaHVKX6XP8vNHy8mUaaYHUXiqX6Cqg5v8jEqitgnoLk54MDBcGiIAv6LYClhlR
         ORKKXyZphcHTxM7eNeKcTQJKqsyrSgl9JaVjYLda7+HVbj+biir6rHow3tDgvm305Zhu
         1zrmyN80Z9L/orGFEqiyshJjIzLyF3NGXQpXYpi7L6fFWl91UcR4EsDLRyUIQsZpDiPu
         Uc3n3SY1LwJn3v0rR0Fr+37FGpKdEpUCGqre8OYxoeZ6zrfyU0cwcFPTd+5seIW5x1VG
         A7O1qoNLEgYt4iR0ILQbMCSxdC7TPzAF4VwMO1rlFwjM8J2bRofuhxUeXj7PUyhKtbEE
         JmGw==
X-Gm-Message-State: AOJu0YzZRUMam7900XHsvKhoYVLWYss1qex1zmkUU0sNx9jlZzO1w1Vy
        +jaryn2sgsF7rSacC1gM1/EiRcMbMOZajbZWmtOgYg==
X-Google-Smtp-Source: AGHT+IHHR2kktPP4c8ykqfn0f6TaQEG5alfT22TZVKb5oILOfelyCw9fUnwjJrHEAgm/JZnIJ+lBp2N4kyQgw5g2T6g=
X-Received: by 2002:a0d:d890:0:b0:5a7:dbd6:14ae with SMTP id
 a138-20020a0dd890000000b005a7dbd614aemr13927520ywe.29.1699333591101; Mon, 06
 Nov 2023 21:06:31 -0800 (PST)
MIME-Version: 1.0
References: <20231106-uvc-event-v2-1-7d8e36f0df16@chromium.org> <ZUjIlq0cxSv9Cut0@valkosipuli.retiisi.eu>
In-Reply-To: <ZUjIlq0cxSv9Cut0@valkosipuli.retiisi.eu>
From:   Esker Wong <esker@chromium.org>
Date:   Tue, 7 Nov 2023 13:06:20 +0800
Message-ID: <CAN_q1f_HV7Etb9i2c2_c6Trm2hAJUyd068UskJfMvT=OyiKXpA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[send again in text mode]
Hi Sakari,

Sequence number is important to us. We need it to measure the latency
from this event to the time we display the frame.

Regards,
Esker


On Mon, Nov 6, 2023 at 7:06=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi> w=
rote:
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
> > - Link to v1: https://lore.kernel.org/r/20231020-uvc-event-v1-1-3baa0e9=
f6952@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c  | 2 ++
> >  drivers/media/usb/uvc/uvc_video.c | 7 +++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c
> > index f4988f03640a..9f3fb5fd2375 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1352,6 +1352,8 @@ static int uvc_ioctl_subscribe_event(struct v4l2_=
fh *fh,
> >       switch (sub->type) {
> >       case V4L2_EVENT_CTRL:
> >               return v4l2_event_subscribe(fh, sub, 0, &uvc_ctrl_sub_ev_=
ops);
> > +     case V4L2_EVENT_FRAME_SYNC:
> > +             return v4l2_event_subscribe(fh, sub, 0, NULL);
> >       default:
> >               return -EINVAL;
> >       }
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/=
uvc_video.c
> > index 28dde08ec6c5..4f3a510ca4fe 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1073,9 +1073,16 @@ static int uvc_video_decode_start(struct uvc_str=
eaming *stream,
> >        * that discontinuous sequence numbers always indicate lost frame=
s.
> >        */
> >       if (stream->last_fid !=3D fid) {
> > +             struct v4l2_event event =3D {
> > +                     .type =3D V4L2_EVENT_FRAME_SYNC,
> > +             };
> > +
> >               stream->sequence++;
> >               if (stream->sequence)
> >                       uvc_video_stats_update(stream);
> > +
> > +             event.u.frame_sync.frame_sequence =3D stream->sequence,
> > +             v4l2_event_queue(&stream->vdev, &event);
>
> uvc_video_decode_start() is called when the reception of the entire frame
> has been completed. However, the documentation for V4L2_EVENT_FRAME_SYNC
> says that the event is "Triggered immediately when the reception of a fra=
me
> has begun.". The functionality here doesn't seem to fit to this patch.
>
> Wouldn't V4L2_EVENT_VSYNC be a better fit, even if we don't really have a
> concept of vertical sync in the case of USB? That event doesn't have the
> sequence though but I guess it's not an issue at least if your case.
>
> Another technically correct option could be to create a new event for thi=
s
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
