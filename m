Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2821B7E5082
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 07:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbjKHGyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 01:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjKHGyU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 01:54:20 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9640F1B5
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 22:54:18 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5b8f68ba4e5so4177151a12.1
        for <linux-media@vger.kernel.org>; Tue, 07 Nov 2023 22:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699426458; x=1700031258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhuw+/MAxDH+LKhW5lk+dQwqwTtU9a6DQq89FiNybxI=;
        b=U5YWUgwOcQAMnaKtQpvgPL3txkIXtcYFcus9Bsatotq17pVNQifsyEYUuid8VddTPh
         cQQ3v3m1NykTdvunLATz5sMlEDEzyBRhjLgvZNQOhDhOvx8UoobxWbLyyO0A8bAfqg9u
         MGx0ygGpbCs1fhJ/PZqdmGllkf6Tjz+UxuZMAf+K7TGMq/viOAP2rgf6W3vPjsOb0yPN
         k8NJ237+NT4fFjyeAD+NXY6sbYCJd4h+JDjgZb28VBZnRY/3P3Hl3Gj10duGWQN6d0rR
         NNIVU5I3QcEs3+9Z4+MFduitI3xuWz5Gw4zQKGNfpLaWkwdcgmX99F3svnjPWg9brYk9
         HsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699426458; x=1700031258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhuw+/MAxDH+LKhW5lk+dQwqwTtU9a6DQq89FiNybxI=;
        b=WxbOwqD+hejpj/LRR1Bi1+F6aDvcS7Aw3kBkEZtfsEXVKpUxgNAEq6oxhfzJ2WM4Qa
         xTHnMoxqvT/vgSQzMSzfHlOAzeZTiHaBw44R8ziahwb2T6QewuwJ7qtQZa43T7IPJFWS
         P/4/+YYk9B3WTu9VFlpnyVkHLuyAHAQqYwMnnw/dyw7wZafGTJCfuDctcjPbKTk05u6i
         AToTcNn4ooGtS0jWpcHPi+HxjuwFo3at1BXPZtnRFVDLCZvTUYQAjRCUql92MKdQOiSX
         aunaL8LNxTzO4/0+qHmPYEFJkHPod1jxUHoaTlOUr7rgkF54LOQv5MpGQU5GTaobkokA
         KcxA==
X-Gm-Message-State: AOJu0YwRZv92/V7i1WDt7p8DqWgRd5NnanVijiPVCh+oicE9oEpvPNGf
        5V7imZH8RzryWNZmRlQFOC/AcNQ1hVFtPt0jK1q3zw==
X-Google-Smtp-Source: AGHT+IGZgMOdX8wFdlvM+x1nbzazDDLCnOraMyZxEso0/KY16E2sWkauS1+5+pz2tHuJieKwCBP0vEgjJwlWV4CVXPI=
X-Received: by 2002:a05:6a20:72a0:b0:183:e7bb:5911 with SMTP id
 o32-20020a056a2072a000b00183e7bb5911mr1385320pzk.17.1699426457599; Tue, 07
 Nov 2023 22:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20231106-uvc-event-v2-1-7d8e36f0df16@chromium.org>
 <ZUjIlq0cxSv9Cut0@valkosipuli.retiisi.eu> <CAN_q1f_HV7Etb9i2c2_c6Trm2hAJUyd068UskJfMvT=OyiKXpA@mail.gmail.com>
 <fe672e31315b8f9c44a693c909d464a299e76093.camel@ndufresne.ca>
In-Reply-To: <fe672e31315b8f9c44a693c909d464a299e76093.camel@ndufresne.ca>
From:   Esker Wong <esker@google.com>
Date:   Wed, 8 Nov 2023 14:53:41 +0800
Message-ID: <CAEZL83qR2bDq35yvCV-WvkaL6ZbPvSxQH+j=ViG6Kq8-0Mzq1Q@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
To:     nicolas@ndufresne.ca, Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Esker Wong <esker@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicholas and Sakari,

We need it as precise as possible. Currently the earliest time of a
frame we can have in userspace  is the dqbuf.

And for UVC timestamp, it is somewhat awkward for us to use. Since
other functions in our stacks do not necessarily contain such
timestamps. So we want some event to be trigger and we can get the
system time directly.

If the V4L2_EVENT_FRAME_SYNC will be earlier then V4L2_EVENT_VSYNC,
then it has value. We would want to know the delay of a frame being
captured to the time it is displayed.

I'm not sure for bulk is the V4L2_EVENT_VSYNC more accurate?

Esker


On Wed, Nov 8, 2023 at 3:27=E2=80=AFAM <nicolas@ndufresne.ca> wrote:
>
> Hi,
>
> Le mardi 07 novembre 2023 =C3=A0 13:06 +0800, Esker Wong a =C3=A9crit :
> > [send again in text mode]
> > Hi Sakari,
> >
> > Sequence number is important to us. We need it to measure the latency
> > from this event to the time we display the frame.
>
> how much precision do you expect, because as described, this number
> will be completely false for bulk.
>
> Aren't UVC timestamp support to allow measuring latency properly ?
>
> Nicolas
>
> >
> > Regards,
> > Esker
> >
> >
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
