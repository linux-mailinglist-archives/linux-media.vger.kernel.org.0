Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0E852DCB8
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 20:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235537AbiESS0U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 14:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbiESS0R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 14:26:17 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4346B13E01
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 11:26:16 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id b20so5369451qkc.6
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 11:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=qZh3mMH7KtZxmVWaxAkFkyp6f8MNv5MHQimKbHd8G6M=;
        b=eTYJTVFG4gSCgdwBHABw+4W+jLGSWm1xy2pSmJETkUFC0mDr8F+/43ICae1myFrsb9
         SbVun5oLsFxN1enZiNcFsFI9OYvDcy+IMXSp+zrv+0tL8zIOVIt9S65n6bJFROexeGsl
         m1yhED4IDINOyg3b4tWgNxJ3SsrJPttlOiyvRru9bcnNUDQawC4RVPEi34lk6YG9hzz+
         F71ylz3jwq6d7/g32yDw4FeAn29ncYW/LhzbTcitfDjnl2uMfIca8J4OwdBzegHQ68K1
         eJfjCTBhvUS3unEL4RPBMfnUcISFam0R560t/DTPK+6Zd8Vs252vl/9O9sNIsdQU2ZZS
         55mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=qZh3mMH7KtZxmVWaxAkFkyp6f8MNv5MHQimKbHd8G6M=;
        b=nM59R+Q/6g0OuwOwCfAf22gJzsiih0Sij7MZGM1O3M7XQwLYwTsP2nhq4EEbdlHhrt
         R1cpN5m3R36FhIsR8hASOTUXVg6jsGqENRazzjCaplx6Ce+f9zah9jtLIXw4RWLC8jYV
         QD6w1y/9fk0CAX723fInQG9fiWgR9htgdgDlSlD/QMCvbfYv7L8gape7rZ40RDxbcZBW
         KGn7Yuv2ai1CWbVqJZvxvQUYw6fw7DS69noyJbpOJtHkewVzRBew4S9O9hgy33hb9ChG
         eETKGe+MVEHCYCtWxdfB5/xryW9RhA91Fn/gdtL/ZRxEXcuUTxYPlQB9kII0HtnPJFpE
         87Lg==
X-Gm-Message-State: AOAM532nWjLJAqefbAR32FSUcm5UhgVerK0JaYrjodDBrZk5s9M+Cc1C
        AO8fHyCykQ0t3cXIun2bUZFHxo67cVSk3w==
X-Google-Smtp-Source: ABdhPJwP7rFsKB5jE799YHE2/YkkVTQ+A04f5nIqw9Y+wHAUTIoes5jHENZhOM2WD+yXs7j3SbxwcQ==
X-Received: by 2002:a05:620a:270c:b0:6a0:92b9:8196 with SMTP id b12-20020a05620a270c00b006a092b98196mr3964410qkp.417.1652984775361;
        Thu, 19 May 2022 11:26:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id p5-20020a05622a00c500b002f3f087c919sm1820826qtw.97.2022.05.19.11.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 11:26:14 -0700 (PDT)
Message-ID: <13e66a77bc5e30464bb59eacad8ea69bf819d5fb.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/6] media: v4l2_ctrl: Add region of interest auto
 control
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Date:   Thu, 19 May 2022 14:26:13 -0400
In-Reply-To: <CANqU6FcU7+wHKFDmH=EDk1irPC9YZ15VikExSgcocVKQQQ_0nQ@mail.gmail.com>
References: <20220516140434.1871022-1-yunkec@google.com>
         <20220516140434.1871022-3-yunkec@google.com>
         <e30531ef60ed12f40e1c778d7927214b15b79922.camel@ndufresne.ca>
         <CANqU6FcU7+wHKFDmH=EDk1irPC9YZ15VikExSgcocVKQQQ_0nQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 18 mai 2022 =C3=A0 10:11 +0900, Yunke Cao a =C3=A9crit=C2=A0:
> Thanks, I will add detailed behavior in the follow up version.
>=20
> On Tue, May 17, 2022 at 10:23 PM Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
> >=20
> > Le lundi 16 mai 2022 =C3=A0 23:04 +0900, Yunke Cao a =C3=A9crit :
> > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > ---
> > >  .../media/v4l/ext-ctrls-camera.rst            | 25 +++++++++++++++++=
++
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
> > >  include/uapi/linux/v4l2-controls.h            |  9 +++++++
> > >  3 files changed, 36 insertions(+)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.r=
st b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > index 86a1f09a8a1c..3da66e1e1fc7 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > @@ -665,3 +665,28 @@ enum v4l2_scene_mode -
> > >  ``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
> > >      This control determines the region of interest. Region of intere=
st is an
> > >      rectangular area represented by a struct v4l2_rect.
> > > +
> > > +``V4L2_CID_REGION_OF_INTEREST_AUTO (bitmask)``
> > > +    This determines which, if any, on board features should track to=
 the
> > > +    Region of Interest.
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE``
> > > +      - Auto Exposure.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS``
> > > +      - Auto Iris.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> > > +      - Auto White Balance.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS``
> > > +      - Auto Focus.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> > > +      - Auto Face Detect.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> > > +      - Auto Detect and Track.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> > > +      - Image Stabilization.
> > > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> > > +      - Higher Quality.
> >=20
> > Now I see the usage, the control is missing cross-reference and behavio=
ur.
> > Consider that someone may have to use or implement your feature on diff=
erent HW
> > and in different context in the future. Right now you aren't writing a
> > specification, but barely listing things that are already encoded in th=
e item
> > names. For each of this, add human readable prose that explain what is =
expected
> > behaviour when the bit is set. This way, future implementation can chec=
k their
> > behaviour and cross-over with the documentation to make sure it is a fi=
t, or if
> > another bit need to be allocated.
> >=20
> > I still believe REGION_OF_INTEREST is too generic of a name for the pur=
pose, as
> > in the context of the V4L2 API, we also support video encoders, and non=
e of this
> > (perhaps except QUALITY, but with encoder you have to specify a delta f=
or that).
> > The name really needs to be specialized to be implemented this way. Oth=
erwise,
> > it create confusion, and makes the V4L2 uAPI poorer over time. Naming i=
s hard,
> > but I need to make a suggestion, perhaps CAMERA_ROI ? We have classes, =
perhaps a
> > class for the CAMERA controls is needed ?
> >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-defs.c
> > > index 95f39a2d2ad2..f28763bf95e9 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > @@ -1043,6 +1043,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >       case V4L2_CID_CAMERA_ORIENTATION:       return "Camera Orientat=
ion";
> > >       case V4L2_CID_CAMERA_SENSOR_ROTATION:   return "Camera Sensor R=
otation";
> > >       case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Inter=
est Rectangle";
> > > +     case V4L2_CID_REGION_OF_INTEREST_AUTO:  return "Region Of Inter=
est Auto Controls";
> > >=20
> > >       /* FM Radio Modulator controls */
> > >       /* Keep the order of the 'case's the same as in v4l2-controls.h=
! */
> > > @@ -1415,6 +1416,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, =
enum v4l2_ctrl_type *type,
> > >       case V4L2_CID_JPEG_ACTIVE_MARKER:
> > >       case V4L2_CID_3A_LOCK:
> > >       case V4L2_CID_AUTO_FOCUS_STATUS:
> > > +     case V4L2_CID_REGION_OF_INTEREST_AUTO:
> > >       case V4L2_CID_DV_TX_HOTPLUG:
> > >       case V4L2_CID_DV_TX_RXSENSE:
> > >       case V4L2_CID_DV_TX_EDID_PRESENT:
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> > > index 499fcddb6254..f6938e4de129 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -1009,6 +1009,15 @@ enum v4l2_auto_focus_range {
> > >  #define V4L2_CID_CAMERA_SENSOR_ROTATION              (V4L2_CID_CAMER=
A_CLASS_BASE+35)
> > >=20
> > >  #define V4L2_CID_REGION_OF_INTEREST_RECT     (V4L2_CID_CAMERA_CLASS_=
BASE+36)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO     (V4L2_CID_CAMERA_CLASS_=
BASE+37)
>=20
> The ROI controls are in V4L2_CID_CAMERA_CLASS
> "(V4L2_CID_CAMERA_CLASS_BASE+36)" unless I miss anything.
> Correct me if I'm wrong but I don't see "CAMERA" included in the name
> of other camera controls.

Namespace should be extended when its obviously going to clash with other
similar concept. In this case it obviously clash with video encoder ROI.

regards,
Nicolas

>=20
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE            (1 << 0=
)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS                       =
 (1 << 1)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE              =
 (1 << 2)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS                      =
 (1 << 3)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT         (1 << 4=
)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK    (1 << 5=
)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION (1 << 6=
)
> > > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY             =
 (1 << 7)
> > >=20
> > >  /* FM Modulator class control IDs */
> > >=20
> >=20

