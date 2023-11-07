Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9EE27E4928
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 20:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235181AbjKGT1M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 14:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232970AbjKGT1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 14:27:11 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4E9C2
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 11:27:09 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7788db95652so419484485a.2
        for <linux-media@vger.kernel.org>; Tue, 07 Nov 2023 11:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1699385228; x=1699990028; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9BoaVEt8MK15EAbZSv/SQoJod+vhxmiq7rbowdr4Hko=;
        b=Z/BFZKaf7KW9tYwBI0UzXkwwWVwfgdsh1TuUF16L0pDtY+VV6OC9QQne4kMlNo5+61
         hkhmw3H895dAqb3wv1sS0Fcd5jgJ6BCpGFPQse2pqBYgKuMDby9WCD29XwW2Xe3it76H
         mSKFphXoyrXYdZQ9vn+Doz1SqIuVLFSP3L0O3/2mfNBxzN9PKC+xhpBp2+QBkhY8OnSh
         UCpePPnOQ+n8GWLyqUb6gjqYz1lAlh/y37LBfnxiPEgdFLiIfArvWv4wnBnYpSRJmWjT
         qmPXl71404VepwzL5TIvM23QG3YjpHIFJUT8b+op1xLuHrWX41FSMWJHCm75iT/vfFdZ
         P0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699385228; x=1699990028;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9BoaVEt8MK15EAbZSv/SQoJod+vhxmiq7rbowdr4Hko=;
        b=FNa7iUl06ZezaFFD9vtv5o9mcBmu8XqJV8SR6IpT0rgrilIqjjZx7lYucKzjogK7mv
         yldN5/tczcsqfDSG0LhXPK/A8jH5Zy6vjMoNSTxuXrGMinlAdR4tQ5+Hq2IqorVoh9s/
         6YXpLBpMZ3mMHgmVYZU8ENmCq0ogp+WEfgrbA2z5+ZoGRjpfBkeZGCCsx2Qc/VpDHqKZ
         EeDwkkzEN8/W1uzKpO4HDt9bEShUYEP1/H6yvKBsIEMMU81+qi3vFHakpDoNsjOEGnPQ
         LE9njQYe1rSv+35HNlNcnVSkGrfE9oas4fiwa9RlVQW8Df5prm+FDpVpKL5nOlTnNt2Q
         hNfw==
X-Gm-Message-State: AOJu0YzEPyHOUeyqurcQGcZ2PMSRDx9p3x/UJZJ6TZciqGWZ7nnbauKo
        ay1oEjBOpE50FXeDhfnwy/2rhg==
X-Google-Smtp-Source: AGHT+IGkY0qLxCFusFnX3wR8M1gemcaINJ8koRsxKDg0lzK3igAJ54+1Sfh4Ff/1DygW6tlyXLJirg==
X-Received: by 2002:a05:620a:4551:b0:777:5044:8c2e with SMTP id u17-20020a05620a455100b0077750448c2emr39455301qkp.9.1699385228285;
        Tue, 07 Nov 2023 11:27:08 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:6dc0::c73? ([2606:6d00:17:6dc0::c73])
        by smtp.gmail.com with ESMTPSA id ou32-20020a05620a622000b0076c96e571f3sm206379qkn.26.2023.11.07.11.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 11:27:07 -0800 (PST)
Message-ID: <fe672e31315b8f9c44a693c909d464a299e76093.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
From:   nicolas@ndufresne.ca
To:     Esker Wong <esker@chromium.org>, Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 07 Nov 2023 14:27:07 -0500
In-Reply-To: <CAN_q1f_HV7Etb9i2c2_c6Trm2hAJUyd068UskJfMvT=OyiKXpA@mail.gmail.com>
References: <20231106-uvc-event-v2-1-7d8e36f0df16@chromium.org>
         <ZUjIlq0cxSv9Cut0@valkosipuli.retiisi.eu>
         <CAN_q1f_HV7Etb9i2c2_c6Trm2hAJUyd068UskJfMvT=OyiKXpA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le mardi 07 novembre 2023 =C3=A0 13:06 +0800, Esker Wong a =C3=A9crit=C2=A0=
:
> [send again in text mode]
> Hi Sakari,
>=20
> Sequence number is important to us. We need it to measure the latency
> from this event to the time we display the frame.

how much precision do you expect, because as described, this number
will be completely false for bulk.

Aren't UVC timestamp support to allow measuring latency properly ?

Nicolas

>=20
> Regards,
> Esker
>=20
>=20
> On Mon, Nov 6, 2023 at 7:06=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi>=
 wrote:
> >=20
> > Hi Ricardo,
> >=20
> > On Mon, Nov 06, 2023 at 10:52:27AM +0000, Ricardo Ribalda wrote:
> > > Add support for the frame_sync event, so user-space can become aware
> > > earlier of new frames.
> > >=20
> > > Suggested-by: Esker Wong <esker@chromium.org>
> > > Tested-by: Esker Wong <esker@chromium.org>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > > We have measured a latency of around 30msecs between frame sync
> > > and dqbuf.
> > > ---
> > > Changes in v2:
> > > - Suggested by Laurent. Split sequence++ and event init.
> > > - Link to v1: https://lore.kernel.org/r/20231020-uvc-event-v1-1-3baa0=
e9f6952@chromium.org
> > > ---
> > >  drivers/media/usb/uvc/uvc_v4l2.c  | 2 ++
> > >  drivers/media/usb/uvc/uvc_video.c | 7 +++++++
> > >  2 files changed, 9 insertions(+)
> > >=20
> > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc=
/uvc_v4l2.c
> > > index f4988f03640a..9f3fb5fd2375 100644
> > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > @@ -1352,6 +1352,8 @@ static int uvc_ioctl_subscribe_event(struct v4l=
2_fh *fh,
> > >       switch (sub->type) {
> > >       case V4L2_EVENT_CTRL:
> > >               return v4l2_event_subscribe(fh, sub, 0, &uvc_ctrl_sub_e=
v_ops);
> > > +     case V4L2_EVENT_FRAME_SYNC:
> > > +             return v4l2_event_subscribe(fh, sub, 0, NULL);
> > >       default:
> > >               return -EINVAL;
> > >       }
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uv=
c/uvc_video.c
> > > index 28dde08ec6c5..4f3a510ca4fe 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -1073,9 +1073,16 @@ static int uvc_video_decode_start(struct uvc_s=
treaming *stream,
> > >        * that discontinuous sequence numbers always indicate lost fra=
mes.
> > >        */
> > >       if (stream->last_fid !=3D fid) {
> > > +             struct v4l2_event event =3D {
> > > +                     .type =3D V4L2_EVENT_FRAME_SYNC,
> > > +             };
> > > +
> > >               stream->sequence++;
> > >               if (stream->sequence)
> > >                       uvc_video_stats_update(stream);
> > > +
> > > +             event.u.frame_sync.frame_sequence =3D stream->sequence,
> > > +             v4l2_event_queue(&stream->vdev, &event);
> >=20
> > uvc_video_decode_start() is called when the reception of the entire fra=
me
> > has been completed. However, the documentation for V4L2_EVENT_FRAME_SYN=
C
> > says that the event is "Triggered immediately when the reception of a f=
rame
> > has begun.". The functionality here doesn't seem to fit to this patch.
> >=20
> > Wouldn't V4L2_EVENT_VSYNC be a better fit, even if we don't really have=
 a
> > concept of vertical sync in the case of USB? That event doesn't have th=
e
> > sequence though but I guess it's not an issue at least if your case.
> >=20
> > Another technically correct option could be to create a new event for t=
his
> > but I'm not sure it's worth it.
> >=20
> > >       }
> > >=20
> > >       uvc_video_clock_decode(stream, buf, data, len);
> > >=20
> >=20
> > --
> > Regards,
> >=20
> > Sakari Ailus

