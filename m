Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFCA852AFB2
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 03:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbiERBMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 21:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbiERBME (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 21:12:04 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDAE53708
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 18:12:02 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2ef5380669cso8550227b3.9
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 18:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=83mxSflTBszx9cbrRtfaqSIACqTgr60P5HV2K7u8DLo=;
        b=b3AsMwpknXTxxrjmWWmQ5jfyD3cHfyB6cPbz1ZzIQfoxBTSvGVXwntCJPPCyndlZ/L
         K5jUrFJr4R5YvHLHDDQOXfiTX5Not0TCuKDbakZSAIK9ltFtppwQoGEcUbRYSE/P6EOt
         s02es43dKbd7/+/qo8MTaY7x1YE+8sk+KXRieHDyZfu9P+67/9IsmnfENst8YRO5eeHz
         MeMgmC2aYfUje6dOWvr4BNyp4b8oWN8ySFoNpf56GNU6fMphboawOpEzMKss1dXEzpwI
         aYVpWvkYygky9pjeaCjMYMsPFapOr40i5D5K9OHvUgRgAZZTVt2iaXHpJjQf3xjcHrs9
         scpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=83mxSflTBszx9cbrRtfaqSIACqTgr60P5HV2K7u8DLo=;
        b=RFgBR0JijBhHiTEfM7Qq51rlmQcDEai2dWCThAFEVnH7OmkFvUhhBth7CkQd+cVEN6
         iERr5eVmQcvlEuaCuZgVuQ9/WuvZksCPl3S8H/ByjlrFRfGP57h5NL6oyVbXUPdM4KQ3
         Q99j2cCHB77X8UT15bPvAnL5r3IwAVmoEY2uKiMYYe7TQa+kMKAXsuhGJdOqGP8LcEGV
         CaTIzVSnTh6q/IEZPr7lHRzIHcsUb+L/LD31j43VgBGB86omw4LclFp9lT+O98715zD3
         Qn0ZdSHQX9R6fHCj0ZTsnckdYJzpQtvnFmnsmc0rEu1XyaxLI39QCW5pKSICtUxhKduC
         nNHQ==
X-Gm-Message-State: AOAM532IfOGRIbxvs8lziumgX1FyuJykeQeqqBwuquOo6biEgvaqwJC2
        IsAeyCvcXqEU8xPTo+lWEL5rNODiQYwMfKvjwV4AXg==
X-Google-Smtp-Source: ABdhPJy+TQZhjRJAYWp/yEFggTULOsWF1GAxWa/8yMscjbyS8k/sqOcoRZ3M4167Kvk8y/0ioRdUPqrE+GE0iOlfQpU=
X-Received: by 2002:a05:690c:94:b0:2f1:98b3:fe7c with SMTP id
 be20-20020a05690c009400b002f198b3fe7cmr29952947ywb.284.1652836321615; Tue, 17
 May 2022 18:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220516140434.1871022-1-yunkec@google.com> <20220516140434.1871022-3-yunkec@google.com>
 <e30531ef60ed12f40e1c778d7927214b15b79922.camel@ndufresne.ca>
In-Reply-To: <e30531ef60ed12f40e1c778d7927214b15b79922.camel@ndufresne.ca>
From:   Yunke Cao <yunkec@google.com>
Date:   Wed, 18 May 2022 10:11:50 +0900
Message-ID: <CANqU6FcU7+wHKFDmH=EDk1irPC9YZ15VikExSgcocVKQQQ_0nQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: v4l2_ctrl: Add region of interest auto control
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks, I will add detailed behavior in the follow up version.

On Tue, May 17, 2022 at 10:23 PM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le lundi 16 mai 2022 =C3=A0 23:04 +0900, Yunke Cao a =C3=A9crit :
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  .../media/v4l/ext-ctrls-camera.rst            | 25 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
> >  include/uapi/linux/v4l2-controls.h            |  9 +++++++
> >  3 files changed, 36 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst=
 b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > index 86a1f09a8a1c..3da66e1e1fc7 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > @@ -665,3 +665,28 @@ enum v4l2_scene_mode -
> >  ``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
> >      This control determines the region of interest. Region of interest=
 is an
> >      rectangular area represented by a struct v4l2_rect.
> > +
> > +``V4L2_CID_REGION_OF_INTEREST_AUTO (bitmask)``
> > +    This determines which, if any, on board features should track to t=
he
> > +    Region of Interest.
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE``
> > +      - Auto Exposure.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS``
> > +      - Auto Iris.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> > +      - Auto White Balance.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS``
> > +      - Auto Focus.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> > +      - Auto Face Detect.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> > +      - Auto Detect and Track.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> > +      - Image Stabilization.
> > +    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> > +      - Higher Quality.
>
> Now I see the usage, the control is missing cross-reference and behaviour=
.
> Consider that someone may have to use or implement your feature on differ=
ent HW
> and in different context in the future. Right now you aren't writing a
> specification, but barely listing things that are already encoded in the =
item
> names. For each of this, add human readable prose that explain what is ex=
pected
> behaviour when the bit is set. This way, future implementation can check =
their
> behaviour and cross-over with the documentation to make sure it is a fit,=
 or if
> another bit need to be allocated.
>
> I still believe REGION_OF_INTEREST is too generic of a name for the purpo=
se, as
> in the context of the V4L2 API, we also support video encoders, and none =
of this
> (perhaps except QUALITY, but with encoder you have to specify a delta for=
 that).
> The name really needs to be specialized to be implemented this way. Other=
wise,
> it create confusion, and makes the V4L2 uAPI poorer over time. Naming is =
hard,
> but I need to make a suggestion, perhaps CAMERA_ROI ? We have classes, pe=
rhaps a
> class for the CAMERA controls is needed ?
>
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 95f39a2d2ad2..f28763bf95e9 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1043,6 +1043,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >       case V4L2_CID_CAMERA_ORIENTATION:       return "Camera Orientatio=
n";
> >       case V4L2_CID_CAMERA_SENSOR_ROTATION:   return "Camera Sensor Rot=
ation";
> >       case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Interes=
t Rectangle";
> > +     case V4L2_CID_REGION_OF_INTEREST_AUTO:  return "Region Of Interes=
t Auto Controls";
> >
> >       /* FM Radio Modulator controls */
> >       /* Keep the order of the 'case's the same as in v4l2-controls.h! =
*/
> > @@ -1415,6 +1416,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, en=
um v4l2_ctrl_type *type,
> >       case V4L2_CID_JPEG_ACTIVE_MARKER:
> >       case V4L2_CID_3A_LOCK:
> >       case V4L2_CID_AUTO_FOCUS_STATUS:
> > +     case V4L2_CID_REGION_OF_INTEREST_AUTO:
> >       case V4L2_CID_DV_TX_HOTPLUG:
> >       case V4L2_CID_DV_TX_RXSENSE:
> >       case V4L2_CID_DV_TX_EDID_PRESENT:
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index 499fcddb6254..f6938e4de129 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1009,6 +1009,15 @@ enum v4l2_auto_focus_range {
> >  #define V4L2_CID_CAMERA_SENSOR_ROTATION              (V4L2_CID_CAMERA_=
CLASS_BASE+35)
> >
> >  #define V4L2_CID_REGION_OF_INTEREST_RECT     (V4L2_CID_CAMERA_CLASS_BA=
SE+36)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO     (V4L2_CID_CAMERA_CLASS_BA=
SE+37)

The ROI controls are in V4L2_CID_CAMERA_CLASS
"(V4L2_CID_CAMERA_CLASS_BASE+36)" unless I miss anything.
Correct me if I'm wrong but I don't see "CAMERA" included in the name
of other camera controls.

> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE            (1 << 0)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS                        (=
1 << 1)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE               (=
1 << 2)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS                       (=
1 << 3)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT         (1 << 4)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK    (1 << 5)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION (1 << 6)
> > +#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY              (=
1 << 7)
> >
> >  /* FM Modulator class control IDs */
> >
>
