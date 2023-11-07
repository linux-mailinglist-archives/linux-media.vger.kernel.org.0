Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E02D17E3AA8
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 11:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbjKGK7p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 05:59:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbjKGK7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 05:59:24 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B25101
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 02:58:14 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-778a6c440faso288895285a.3
        for <linux-media@vger.kernel.org>; Tue, 07 Nov 2023 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699354694; x=1699959494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvWgzBGbnNIgZ9ZBCni1UwPMLFAWW2SsB1tYdhJN5so=;
        b=VrBi7JcEtm0Ive0egqghlUv8XP0U3pCfxD20f+PE99RyWIf9AF8Q165x4F6Mz3UVmw
         +JlZeXpvvLj8kUsopQt1MMHvUziWsF932Y657pjvJ4LrNMn+WKh+jIYXuoXLiArtua9P
         EI0IzwobIPcjp5feNxloB6U4ShtC/SwP4GmKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354694; x=1699959494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvWgzBGbnNIgZ9ZBCni1UwPMLFAWW2SsB1tYdhJN5so=;
        b=oCYNsmHGUXv3XR09ypRMuJRnz6HjTAyAV9/HIqHBuGObxyLzXRhhsSXsMw/p/fpaQm
         0C0qFfkVeEa30v+o7GHnylUKuvERQ787Y+V0YzuwzCDx1xQnopaojPy2c6NfXxgEqrLx
         LkT0IRxLET6xyXVyEn9E8m4i1ZyNTvWKmGantjTRrvPZ2NrqpNri36QSukT9j91B4sWL
         ryVi8jqWsk4lduG06uyDxwi8WDpgAi9o6AzQzJBH0NKjVLQBpKOPfCkgkFOihgcw/3bQ
         tiRzqcYe/1HVCkej/C1ZiumUV64f0L046wJntph/YcKCWa4FKuxj6qrUhovLvmOYoE3g
         eHWg==
X-Gm-Message-State: AOJu0Yz0T82tsWhdjzIk5bMczW/E2adIEzLCNap9//OZLd7HKtZqE3CO
        tfCjA9Qu2yD14nNzZVfkYTSRMN95IjHl2tjVfae8XA==
X-Google-Smtp-Source: AGHT+IE+e2EYR1YijN+0McJmLbOyzC+LPY9TIFrRZ7s7Hiw9kKgZhbcrz+6L8g5HZNJCvgHCtoKvig==
X-Received: by 2002:a05:620a:170e:b0:779:fb0e:ba96 with SMTP id az14-20020a05620a170e00b00779fb0eba96mr32918724qkb.3.1699354693688;
        Tue, 07 Nov 2023 02:58:13 -0800 (PST)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id g1-20020a05620a40c100b007757eddae8bsm4062083qko.62.2023.11.07.02.58.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:58:13 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6711dd6595fso31049286d6.3
        for <linux-media@vger.kernel.org>; Tue, 07 Nov 2023 02:58:12 -0800 (PST)
X-Received: by 2002:ad4:5ec6:0:b0:66d:4fdb:5e36 with SMTP id
 jm6-20020ad45ec6000000b0066d4fdb5e36mr30469112qvb.36.1699354692205; Tue, 07
 Nov 2023 02:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20231106-uvc-event-v2-1-7d8e36f0df16@chromium.org>
 <ZUjIlq0cxSv9Cut0@valkosipuli.retiisi.eu> <CAN_q1f_HV7Etb9i2c2_c6Trm2hAJUyd068UskJfMvT=OyiKXpA@mail.gmail.com>
 <ZUnpE1Wfe2dImqU0@valkosipuli.retiisi.eu>
In-Reply-To: <ZUnpE1Wfe2dImqU0@valkosipuli.retiisi.eu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 7 Nov 2023 11:58:00 +0100
X-Gmail-Original-Message-ID: <CANiDSCs9VX8DC7uC97CiGtmbWAuXa3a50Owth9ep78sWc5PgvQ@mail.gmail.com>
Message-ID: <CANiDSCs9VX8DC7uC97CiGtmbWAuXa3a50Owth9ep78sWc5PgvQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Esker Wong <esker@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, 7 Nov 2023 at 08:37, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Esker,
>
> On Tue, Nov 07, 2023 at 01:06:20PM +0800, Esker Wong wrote:
> > [send again in text mode]
> > Hi Sakari,
> >
> > Sequence number is important to us. We need it to measure the latency
> > from this event to the time we display the frame.
>
> I think we could also add the sequence number to V4L2_EVENT_VSYNC.
>
> Cc Hans.
I think you forgot to add him :)

@Hans

What do you prefer?

- Use V4L2_EVENT_FRAME_SYNC because we trigger it as soon as the
driver knows about the frame
- Use V4L2_EVENT_VSYNC, but extending it to support the frame sequence
- Use a new EVENT

Thanks!


>
> > On Mon, Nov 6, 2023 at 7:06=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.f=
i> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Mon, Nov 06, 2023 at 10:52:27AM +0000, Ricardo Ribalda wrote:
> > > > Add support for the frame_sync event, so user-space can become awar=
e
> > > > earlier of new frames.
> > > >
> > > > Suggested-by: Esker Wong <esker@chromium.org>
> > > > Tested-by: Esker Wong <esker@chromium.org>
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > We have measured a latency of around 30msecs between frame sync
> > > > and dqbuf.
> > > > ---
> > > > Changes in v2:
> > > > - Suggested by Laurent. Split sequence++ and event init.
> > > > - Link to v1: https://lore.kernel.org/r/20231020-uvc-event-v1-1-3ba=
a0e9f6952@chromium.org
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_v4l2.c  | 2 ++
> > > >  drivers/media/usb/uvc/uvc_video.c | 7 +++++++
> > > >  2 files changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/u=
vc/uvc_v4l2.c
> > > > index f4988f03640a..9f3fb5fd2375 100644
> > > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > @@ -1352,6 +1352,8 @@ static int uvc_ioctl_subscribe_event(struct v=
4l2_fh *fh,
> > > >       switch (sub->type) {
> > > >       case V4L2_EVENT_CTRL:
> > > >               return v4l2_event_subscribe(fh, sub, 0, &uvc_ctrl_sub=
_ev_ops);
> > > > +     case V4L2_EVENT_FRAME_SYNC:
> > > > +             return v4l2_event_subscribe(fh, sub, 0, NULL);
> > > >       default:
> > > >               return -EINVAL;
> > > >       }
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/=
uvc/uvc_video.c
> > > > index 28dde08ec6c5..4f3a510ca4fe 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -1073,9 +1073,16 @@ static int uvc_video_decode_start(struct uvc=
_streaming *stream,
> > > >        * that discontinuous sequence numbers always indicate lost f=
rames.
> > > >        */
> > > >       if (stream->last_fid !=3D fid) {
> > > > +             struct v4l2_event event =3D {
> > > > +                     .type =3D V4L2_EVENT_FRAME_SYNC,
> > > > +             };
> > > > +
> > > >               stream->sequence++;
> > > >               if (stream->sequence)
> > > >                       uvc_video_stats_update(stream);
> > > > +
> > > > +             event.u.frame_sync.frame_sequence =3D stream->sequenc=
e,
> > > > +             v4l2_event_queue(&stream->vdev, &event);
> > >
> > > uvc_video_decode_start() is called when the reception of the entire f=
rame
> > > has been completed. However, the documentation for V4L2_EVENT_FRAME_S=
YNC
> > > says that the event is "Triggered immediately when the reception of a=
 frame
> > > has begun.". The functionality here doesn't seem to fit to this patch=
.
> > >
> > > Wouldn't V4L2_EVENT_VSYNC be a better fit, even if we don't really ha=
ve a
> > > concept of vertical sync in the case of USB? That event doesn't have =
the
> > > sequence though but I guess it's not an issue at least if your case.
> > >
> > > Another technically correct option could be to create a new event for=
 this
> > > but I'm not sure it's worth it.
> > >
> > > >       }
> > > >
> > > >       uvc_video_clock_decode(stream, buf, data, len);
> > > >
> > >
> > > --
> > > Regards,
> > >
> > > Sakari Ailus
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda
