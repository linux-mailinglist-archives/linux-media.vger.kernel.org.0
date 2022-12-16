Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F84A64E5A1
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 02:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiLPBbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 20:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiLPBbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 20:31:07 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C340E3E0AA
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 17:31:05 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id q10so724992qvt.10
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 17:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mLjpn/05cJyzF2Y7wCBUhKhSZ0n7/qvz9iIRqwUpxU=;
        b=AZhoJKRMeKEVrRi5BYbgPAH31AXRtZm/0LLiavKJIhWyt86BykDsOoUANieWafjU7Z
         JPvN7u6dZTi8Nkt1pDEsU6cCeXGMKdKhdXqYmnNvVIbOzGnXVUaBV2Djq98wLUrEf6k4
         /vSvkYJ8Fpscsvzq4PKq2+B8UpGD4zffjDDdicthczWPRptkRzeh3e7ZVGZ94I5EsyXO
         klEPID9y9tFxJwh+d/QnPH46lYUh+mkMk1d2E4i8tuhQQwHnzohOqW9rpllXpnOwqsuO
         yXajHKduNiP7CaJ4F7bhefqAUXTRc6Y3TGQJogSMgHHmmuu3tvJdj5QdP7/TFOI4erVZ
         x3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mLjpn/05cJyzF2Y7wCBUhKhSZ0n7/qvz9iIRqwUpxU=;
        b=EabLxUklZ/4m1wbOI5A5uGz6KA1XpnjPQ8uL4oEaSx3Z1UUEw8mBr9GvCLir85RaKw
         jDvfJGfuRoeiQdnVDdd3FchFGaIaFWzqHsNPRUEYvsGQ/q2JXm6wzzOy9D9A+p7OBG2j
         IDaUXfjPnl489y/Z5w8r1fG2BXVMg26dgcP1qDZL+rRGi5Npj405YHbH3s3alZdYxPiI
         Guae7spAENSWi5WyDWZ0kdbuNUx5GbaO35AI8AH5CNY0QB9Y9STPNIZsQIT8BR2tI18L
         mOy2jlHJJHbGg3P5Lm5j3GCkvRLbi77wt23gYhiXL4pL+nAvE5wKZqlQ99FTPWAqEqMW
         Cc6Q==
X-Gm-Message-State: ANoB5pm2+nPn54r+NLR9u9RaoHF0ypKbj3BXHb//L7An+0yjRhDaq3be
        PVN0jFZ1Q/722KlKmru80bZOhgNB4TMrx4g+BI6aHw==
X-Google-Smtp-Source: AA0mqf4Fc5JLHWLCq5V3N8SGCpVjp+L/kcnc5J0ZkEI3YpWTJdCxbURF0kFMLLSLMiRStnS9A/INcyVU1ECrBwzmyrw=
X-Received: by 2002:a0c:9045:0:b0:4c7:74da:55ab with SMTP id
 o63-20020a0c9045000000b004c774da55abmr13965673qvo.59.1671154264512; Thu, 15
 Dec 2022 17:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com> <20221109060621.704531-7-yunkec@google.com>
 <72782fc9-ebe6-bab5-78b5-a66b226b4d74@ideasonboard.com>
In-Reply-To: <72782fc9-ebe6-bab5-78b5-a66b226b4d74@ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Fri, 16 Dec 2022 10:30:53 +0900
Message-ID: <CANqU6FeT3WtZYn8DVx5tkt+N9sdYhfOyHQeSzOHnS0E4dP_7_w@mail.gmail.com>
Subject: Re: [PATCH v10 06/11] media: uvcvideo: implement UVC v1.5 ROI
To:     Dan Scally <dan.scally@ideasonboard.com>
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
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Fri, Dec 16, 2022 at 12:55 AM Dan Scally <dan.scally@ideasonboard.com> w=
rote:
>
> Hi Yunke
>
> On 09/11/2022 06:06, Yunke Cao wrote:
> > Implement support for ROI as described in UVC 1.5:
> > 4.2.2.1.20 Digital Region of Interest (ROI) Control
> >
> > ROI control is implemented using V4L2 control API as
> > two UVC-specific controls:
> > V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> > V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> >
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changelog since v9:
> > - No change.
> > Changelog since v8:
> > - No change.
> > Changelog since v7:
> > - Fix a few style issues.
> > - Only allow 4-byte aligned data.
> > - Add control names.
> > - Move initialization to 7/10.
> >
> > Question:
> > - Is V4L2_CID_CAMERA_UVC_BASE defined correctly?
> >    Should we use V4L2_CID_PRIVATE_BASE?
> >
> >   drivers/media/usb/uvc/uvc_ctrl.c   | 111 +++++++++++++++++++++++++++-=
-
> >   drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
> >   drivers/media/usb/uvc/uvcvideo.h   |   7 ++
> >   include/uapi/linux/usb/video.h     |   1 +
> >   include/uapi/linux/uvcvideo.h      |  13 ++++
> >   include/uapi/linux/v4l2-controls.h |   9 +++
> >   6 files changed, 140 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index 7d86aa695b34..6279a3edf944 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -356,6 +356,24 @@ static const struct uvc_control_info uvc_ctrls[] =
=3D {
> >               .flags          =3D UVC_CTRL_FLAG_GET_CUR
> >                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> >       },
> > +     /*
> > +      * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get up=
dated
> > +      * by sensors.
> > +      * "This RoI should be the same as specified in most recent SET_C=
UR
> > +      * except in the case where the =E2=80=98Auto Detect and Track=E2=
=80=99 and/or
> > +      * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> > +      * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> > +      */
> > +     {
> > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .index          =3D 21,
> > +             .size           =3D 10,
> > +             .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG=
_GET_CUR
> > +                             | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_G=
ET_MAX
> > +                             | UVC_CTRL_FLAG_GET_DEF
> > +                             | UVC_CTRL_FLAG_AUTO_UPDATE,
> > +     },
> >   };
> >
> >   static const u32 uvc_control_classes[] =3D {
> > @@ -431,6 +449,57 @@ static void uvc_ctrl_set_rel_speed(struct uvc_cont=
rol_mapping *mapping,
> >       data[first+1] =3D min_t(int, abs(value), 0xff);
> >   }
> >
> > +static int uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
> > +                         const struct uvc_rect *uvc_rect)
> > +{
> > +     if (uvc_rect->top < uvc_rect->bottom ||
> > +         uvc_rect->right < uvc_rect->left)
> > +             return -EINVAL;
> > +
> > +     v4l2_rect->top =3D uvc_rect->top;
> > +     v4l2_rect->left =3D uvc_rect->left;
> > +     v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> > +     v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
> > +     return 0;
> > +}
> > +
> > +static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
> > +                         const struct v4l2_rect *v4l2_rect)
> > +{
> > +     /* Safely converts s32 and u32 to u16. */
> > +     if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
> > +         v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
> > +         v4l2_rect->height > U16_MAX || v4l2_rect->height =3D=3D 0 ||
> > +         v4l2_rect->width > U16_MAX || v4l2_rect->width =3D=3D 0 ||
> > +         v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
> > +         v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
> > +             return -ERANGE;
> > +
> > +     uvc_rect->top =3D v4l2_rect->top;
> > +     uvc_rect->left =3D v4l2_rect->left;
> > +     uvc_rect->bottom =3D v4l2_rect->height + v4l2_rect->top - 1;
> > +     uvc_rect->right =3D v4l2_rect->width + v4l2_rect->left - 1;
> > +     return 0;
> > +}
>
>
> uvc_ctrl_set() clamps out of range values...which is of course hard to
> do at that point with the compound controls, but I think it would be ok
> to simplify this function by clamping the values from v4l2_rect.
>

Sorry, I didn't get it. Do you mean clamping the value in [0, U16_MAX] ?

Best,
Yunke

> > +
> > +static int uvc_get_compound_rect(struct uvc_control_mapping *mapping,
> > +                              const u8 *data,  u8 *data_out)
> > +{
> > +     struct uvc_rect *uvc_rect;
> > +
> > +     uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
> > +     return uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);
> > +}
> > +
> > +static int uvc_set_compound_rect(struct uvc_control_mapping *mapping,
> > +                              const u8 *data_in, u8 *data)
> > +{
> > +     struct uvc_rect *uvc_rect;
> > +
> > +     uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
> > +     return v4l2_to_uvc_rect(uvc_rect, (struct v4l2_rect *)data_in);
> > +}
> > +
> >   static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
> >       {
> >               .id             =3D V4L2_CID_BRIGHTNESS,
> > @@ -719,6 +788,29 @@ static const struct uvc_control_mapping uvc_ctrl_m=
appings[] =3D {
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> >       },
> > +     {
> > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .v4l2_size      =3D sizeof(struct v4l2_rect) * 8,
> > +             .data_size      =3D sizeof(struct uvc_rect) * 8,
> > +             .offset         =3D 0,
> > +             .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> > +             .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> > +             .get_compound   =3D uvc_get_compound_rect,
> > +             .set_compound   =3D uvc_set_compound_rect,
> > +             .name           =3D "Region Of Interest Rectangle",
> > +     },
> > +     {
> > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .data_size      =3D 16,
> > +             .offset         =3D 64,
> > +             .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> > +             .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> > +             .name           =3D "Region Of Interest Auto Controls",
> > +     },
> >   };
> >
> >   static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] =3D=
 {
> > @@ -2444,12 +2536,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_vi=
deo_chain *chain,
> >       }
> >
> >       if (uvc_ctrl_mapping_is_compound(map)) {
> > -             if (map->data_size !=3D map->v4l2_size)
> > -                     return -EINVAL;
> > +             switch (map->v4l2_type) {
> > +             case V4L2_CTRL_TYPE_RECT:
> > +                     /* Only supports 4 bytes-aligned data. */
> > +                     if (WARN_ON(map->offset % 32))
> > +                             return -EINVAL;
> > +                     break;
> > +             default:
> > +                     if (WARN_ON(map->data_size !=3D map->v4l2_size))
> > +                             return -EINVAL;
> > +
> > +                     /* Only supports byte-aligned data. */
> > +                     if (WARN_ON(map->offset % 8 || map->data_size % 8=
))
> > +                             return -EINVAL;
> > +             }
> >
> > -             /* Only supports byte-aligned data. */
> > -             if (WARN_ON(map->offset % 8 || map->data_size % 8))
> > -                     return -EINVAL;
> >       }
> >
> >       if (!map->get && !uvc_ctrl_mapping_is_compound(map))
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c
> > index 36ff1d0d6edb..52a7dc9ad4b9 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1002,7 +1002,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file =
*file, void *fh,
> >       qec->step =3D qc.step;
> >       qec->default_value =3D qc.default_value;
> >       qec->flags =3D qc.flags;
> > -     qec->elem_size =3D 4;
> > +     if (qc.type =3D=3D V4L2_CTRL_TYPE_RECT)
> > +             qec->elem_size =3D sizeof(struct v4l2_rect);
> > +     else
> > +             qec->elem_size =3D 4;
> >       qec->elems =3D 1;
> >       qec->nr_of_dims =3D 0;
> >       memset(qec->dims, 0, sizeof(qec->dims));
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index 1e1bccd3b2e5..c47304a63a7d 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -291,6 +291,13 @@ struct uvc_streaming_header {
> >       u8 bTriggerUsage;
> >   };
> >
> > +struct uvc_rect {
> > +     u16 top;
> > +     u16 left;
> > +     u16 bottom;
> > +     u16 right;
> > +} __packed;
> > +
> >   enum uvc_buffer_state {
> >       UVC_BUF_STATE_IDLE      =3D 0,
> >       UVC_BUF_STATE_QUEUED    =3D 1,
> > diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/vi=
deo.h
> > index bfdae12cdacf..9076a444758a 100644
> > --- a/include/uapi/linux/usb/video.h
> > +++ b/include/uapi/linux/usb/video.h
> > @@ -104,6 +104,7 @@
> >   #define UVC_CT_ROLL_ABSOLUTE_CONTROL                        0x0f
> >   #define UVC_CT_ROLL_RELATIVE_CONTROL                        0x10
> >   #define UVC_CT_PRIVACY_CONTROL                              0x11
> > +#define UVC_CT_REGION_OF_INTEREST_CONTROL            0x14
> >
> >   /* A.9.5. Processing Unit Control Selectors */
> >   #define UVC_PU_CONTROL_UNDEFINED                    0x00
> > diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvide=
o.h
> > index 8288137387c0..ae5eaa14eca2 100644
> > --- a/include/uapi/linux/uvcvideo.h
> > +++ b/include/uapi/linux/uvcvideo.h
> > @@ -16,6 +16,7 @@
> >   #define UVC_CTRL_DATA_TYPE_BOOLEAN  3
> >   #define UVC_CTRL_DATA_TYPE_ENUM             4
> >   #define UVC_CTRL_DATA_TYPE_BITMASK  5
> > +#define UVC_CTRL_DATA_TYPE_RECT              6
> >
> >   /* Control flags */
> >   #define UVC_CTRL_FLAG_SET_CUR               (1 << 0)
> > @@ -36,6 +37,18 @@
> >        UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
> >        UVC_CTRL_FLAG_GET_DEF)
> >
> > +/* V4L2 driver-specific controls */
> > +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT (V4L2_CID_CAMERA_UVC_BASE=
 + 1)
> > +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (V4L2_CID_CAMERA_UVC_BASE=
 + 2)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE            (1 << 0)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                        (=
1 << 1)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE               (=
1 << 2)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                       (=
1 << 3)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT         (1 << 4)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK    (1 << 5)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION (1 << 6)
> > +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY              (=
1 << 7)
> > +
> >   struct uvc_menu_info {
> >       __u32 value;
> >       __u8 name[32];
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index b5e7d082b8ad..b3544355be8f 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1019,6 +1019,15 @@ enum v4l2_auto_focus_range {
> >
> >   #define V4L2_CID_CAMERA_SENSOR_ROTATION             (V4L2_CID_CAMERA_=
CLASS_BASE+35)
> >
> > +/* CAMERA-class private control IDs */
> > +
> > +/*
> > + * The base for the uvc driver controls.
> > + * See linux/uvcvideo.h for the list of controls.
> > + * We reserve 64 controls for this driver.
> > + */
> > +#define V4L2_CID_CAMERA_UVC_BASE             (V4L2_CID_CAMERA_CLASS_BA=
SE + 0x1000)
> > +
> >   /* FM Modulator class control IDs */
> >
> >   #define V4L2_CID_FM_TX_CLASS_BASE           (V4L2_CTRL_CLASS_FM_TX | =
0x900)
