Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7505612AC
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 08:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbiF3Gmi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 02:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbiF3Gm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 02:42:29 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0A52F679
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:42:28 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-f2a4c51c45so24544005fac.9
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Kbqn252jHYTtiRPDwoZqtbiULgGhl11/IAsVnzjHE0M=;
        b=Z6oS4zDxYCWw+U+VlgGAVn7/Nx1R5nTtz2Vj/5DlzdZGzX6kouS3V/ekddUbuc/mB3
         E/8SZAFPt7pVyFsTKzZK99iKOShavOpebEN3ZNrLxdT67Uc+FjGXw+fRO7WI79bOIgkw
         C7C6PVhgF67LPSGgyZGHK21tpBGKwG0PiWDuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Kbqn252jHYTtiRPDwoZqtbiULgGhl11/IAsVnzjHE0M=;
        b=xjZ2a5LRZnqAIlxj6qDTAW5cM4b6l6YMNCgu7wGdezhZ66xQEYynLfXMgTeip+vCoM
         EktbxpeGiffhTZJO3IS7sE4Fee5HR1aehkUz64OPd8L5sS3S6WTaPsdpC9Wwebg+wjMh
         fnQDNs8t3cJgLCvHvWsZcJ9SdDmnRCELfLizazzLP206rcC7/XvOMThAk0gWcCrNQwkX
         Sy/0IKnV+/WjxQt/ExIAf5dP/c1yliy8ooy3Bu6IevMsq3qWVkDdzhK0T8P0RHMZaaad
         jHYNu7F4RZZJnkP2rL8sEgx9GfXf+bFpboXGFjkImyTBLFkPa79ILbFV0WTNJDGQao3M
         xr3A==
X-Gm-Message-State: AJIora9uYi0uzU7TFFPeK1R8KdzTIbdrncMiOpZv5b28egj9oq2Z8BfE
        33cW2bduorufIIpzI+FI1EH3PH5ivTk7Rw==
X-Google-Smtp-Source: AGRyM1tT+hvdnbcY8y5Wku3aFhFulZA7CR9NnjhjHz10YPXLDXdZzcD53gWF+I9O8PribhcNt66Cqw==
X-Received: by 2002:a05:6870:e99f:b0:f1:f471:cda7 with SMTP id r31-20020a056870e99f00b000f1f471cda7mr4449319oao.271.1656571347344;
        Wed, 29 Jun 2022 23:42:27 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id a2-20020a05680804c200b0032e3cca8561sm9811856oie.21.2022.06.29.23.42.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 23:42:26 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-101ab23ff3fso24621895fac.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:42:25 -0700 (PDT)
X-Received: by 2002:a05:6870:4799:b0:f1:46f8:6ea4 with SMTP id
 c25-20020a056870479900b000f146f86ea4mr4217065oaq.223.1656571345377; Wed, 29
 Jun 2022 23:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-5-yunkec@google.com>
In-Reply-To: <20220628075705.2278044-5-yunkec@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 30 Jun 2022 08:42:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCs5SFyVQtmqQXdEuYvTqWOFD00529epjkbp+fF7+48vmA@mail.gmail.com>
Message-ID: <CANiDSCs5SFyVQtmqQXdEuYvTqWOFD00529epjkbp+fF7+48vmA@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] media: uvcvideo: implement UVC v1.5 ROI
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 28 Jun 2022 at 09:57, Yunke Cao <yunkec@google.com> wrote:
>
> Implement support for ROI as described in UVC 1.5:
> 4.2.2.1.20 Digital Region of Interest (ROI) Control
>
> ROI control is implemented using V4L2 control API as
> two uvc-specific controls:
> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>
> Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 146 ++++++++++++++++++++++++++++-
>  drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
>  drivers/media/usb/uvc/uvcvideo.h   |   7 ++
>  include/uapi/linux/usb/video.h     |   1 +
>  include/uapi/linux/uvcvideo.h      |  13 +++
>  include/uapi/linux/v4l2-controls.h |   8 ++
>  6 files changed, 178 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index 508ee04afbcd..00482269233a 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -355,6 +355,23 @@ static const struct uvc_control_info uvc_ctrls[] =3D=
 {
>                 .flags          =3D UVC_CTRL_FLAG_GET_CUR
>                                 | UVC_CTRL_FLAG_AUTO_UPDATE,
>         },
> +       /* UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get up=
dated
> +        * by sensors.
> +        * "This RoI should be the same as specified in most recent SET_C=
UR
> +        * except in the case where the =E2=80=98Auto Detect and Track=E2=
=80=99 and/or
> +        * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> +        * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> +        */
> +       {
> +               .entity         =3D UVC_GUID_UVC_CAMERA,
> +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .index          =3D 21,
> +               .size           =3D 10,
> +               .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG=
_GET_CUR
> +                               | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_G=
ET_MAX
> +                               | UVC_CTRL_FLAG_GET_DEF
> +                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> +       },
>  };
>
>  static const u32 uvc_control_classes[] =3D {
> @@ -429,6 +446,64 @@ static void uvc_ctrl_set_rel_speed(struct uvc_contro=
l_mapping *mapping,
>         data[first+1] =3D min_t(int, abs(value), 0xff);
>  }
>
> +static void uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
> +                            const struct uvc_rect *uvc_rect)
> +{
> +       v4l2_rect->top =3D uvc_rect->top;
> +       v4l2_rect->left =3D uvc_rect->left;
> +       v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> +       v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
> +}
> +
> +static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
> +                           const struct v4l2_rect *v4l2_rect)
> +{
> +       // Safely converts s32 and u32 to u16.
> +       if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
> +           v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
> +           v4l2_rect->height > U16_MAX || v4l2_rect->height =3D=3D 0 ||
> +           v4l2_rect->width > U16_MAX || v4l2_rect->width =3D=3D 0 ||
> +           v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
> +           v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
> +               return -ERANGE;
> +
> +       uvc_rect->top =3D v4l2_rect->top;
> +       uvc_rect->left =3D v4l2_rect->left;
> +       uvc_rect->bottom =3D v4l2_rect->height + v4l2_rect->top - 1;
> +       uvc_rect->right =3D v4l2_rect->width + v4l2_rect->left - 1;
> +       return 0;
> +}
> +
> +static int uvc_get_array_rect(struct uvc_control_mapping *mapping,
> +                             const u8 *data,  u8 *data_out)
> +{
> +       struct uvc_rect *uvc_rect;
> +
> +       if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> +               return -EINVAL;
> +       if (WARN_ON(mapping->size / 8 !=3D sizeof(struct uvc_rect)))
> +               return -EINVAL;
> +
> +       uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
> +       uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);
> +
> +       return 0;
> +}
> +
> +static int uvc_set_array_rect(struct uvc_control_mapping *mapping,
> +                             const u8 *data_in, u8 *data)
> +{
> +       struct uvc_rect *uvc_rect;
> +
> +       if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> +               return -EINVAL;
> +       if (WARN_ON(mapping->size / 8 !=3D sizeof(struct uvc_rect)))
> +               return -EINVAL;
> +
> +       uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
> +       return v4l2_to_uvc_rect(uvc_rect, (struct v4l2_rect *)data_in);
> +}
> +
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
>         {
>                 .id             =3D V4L2_CID_BRIGHTNESS,
> @@ -728,6 +803,26 @@ static const struct uvc_control_mapping uvc_ctrl_map=
pings[] =3D {
>                 .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
>                 .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
>         },
> +       {
> +               .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> +               .entity         =3D UVC_GUID_UVC_CAMERA,
> +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .size           =3D 64,
> +               .offset         =3D 0,
> +               .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> +               .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> +               .get_array      =3D uvc_get_array_rect,
> +               .set_array      =3D uvc_set_array_rect,
> +       },
> +       {
> +               .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> +               .entity         =3D UVC_GUID_UVC_CAMERA,
> +               .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> +               .size           =3D 16,
> +               .offset         =3D 64,
> +               .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> +               .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> +       },
>  };
>
>  /* ---------------------------------------------------------------------=
---
> @@ -1061,7 +1156,16 @@ static int __uvc_ctrl_get_compound_to_user(struct =
uvc_control_mapping *mapping,
>         if (WARN_ON(!mapping->size % 8))
>                 return -EINVAL;
>
> -       size =3D mapping->size / 8;
> +       switch (mapping->v4l2_type) {
> +       case V4L2_CTRL_TYPE_RECT:
> +               size =3D sizeof(struct v4l2_rect);
> +               break;
> +
> +       default:
> +               size =3D mapping->size / 8;
> +               break;
> +       }
> +
>         if (xctrl->size < size) {
>                 xctrl->size =3D size;
>                 return -ENOSPC;
> @@ -2578,6 +2682,40 @@ static void uvc_ctrl_prune_entity(struct uvc_devic=
e *dev,
>         }
>  }
>
> +static int uvc_ctrl_init_roi(struct uvc_device *dev, struct uvc_control =
*ctrl)
> +{
> +       int ret;
> +
> +       ret =3D uvc_query_ctrl(dev, UVC_GET_DEF, ctrl->entity->id, dev->i=
ntfnum,
> +                            UVC_CT_REGION_OF_INTEREST_CONTROL,
> +                            uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> +                            ctrl->info.size);
> +       if (ret)
> +               goto out;
> +
> +       /*
> +        * Most firmwares have wrong GET_CURRENT configuration. E.g. it's
> +        * below GET_MIN, or have rectangle coordinates mixed up. This
> +        * causes problems sometimes, because we are unable to set
> +        * auto-controls value without first setting ROI rectangle to
> +        * valid configuration.
> +        *
> +        * We expect that default configuration is always correct and
> +        * is within the GET_MIN / GET_MAX boundaries.
> +        *
> +        * Set current ROI configuration to GET_DEF, so that we will
> +        * always have properly configured ROI.
> +        */
> +       ret =3D uvc_query_ctrl(dev, UVC_SET_CUR, 1, dev->intfnum,
> +                            UVC_CT_REGION_OF_INTEREST_CONTROL,
> +                            uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> +                            ctrl->info.size);
> +out:
> +       if (ret)
> +               dev_err(&dev->udev->dev, "Failed to fixup ROI (%d).\n", r=
et);
> +       return ret;
> +}
> +
>  /*
>   * Add control information and hardcoded stock control mappings to the g=
iven
>   * device.
> @@ -2590,6 +2728,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_cha=
in *chain,
>         const struct uvc_control_mapping *mapping =3D uvc_ctrl_mappings;
>         const struct uvc_control_mapping *mend =3D
>                 mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> +       const u8 camera_entity[16] =3D UVC_GUID_UVC_CAMERA;
>
>         /* XU controls initialization requires querying the device for co=
ntrol
>          * information. As some buggy UVC devices will crash when queried
> @@ -2610,6 +2749,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_ch=
ain *chain,
>                          * GET_INFO on standard controls.
>                          */
>                         uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info)=
;
> +
> +                       if (ctrl->info.selector =3D=3D
> +                               UVC_CT_REGION_OF_INTEREST_CONTROL &&
> +                           uvc_entity_match_guid(ctrl->entity, camera_en=
tity))
> +                               uvc_ctrl_init_roi(chain->dev, ctrl);
>                         break;
>                  }
>         }
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc=
_v4l2.c
> index 0366d05895a9..aad61af36271 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -998,7 +998,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file *fil=
e, void *fh,
>         qec->step =3D qc.step;
>         qec->default_value =3D qc.default_value;
>         qec->flags =3D qc.flags;
> -       qec->elem_size =3D 4;
> +       if (qc.type =3D=3D V4L2_CTRL_TYPE_RECT)
> +               qec->elem_size =3D sizeof(struct v4l2_rect);
> +       else
> +               qec->elem_size =3D 4;
>         qec->elems =3D 1;
>         qec->nr_of_dims =3D 0;
>         memset(qec->dims, 0, sizeof(qec->dims));
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index 2f9b75faae83..9ff95bbad251 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -431,6 +431,13 @@ struct uvc_streaming_header {
>         u8 bTriggerUsage;
>  };
>
> +struct uvc_rect {
> +       u16 top;
> +       u16 left;
> +       u16 bottom;
> +       u16 right;
> +} __packed;
> +
>  enum uvc_buffer_state {
>         UVC_BUF_STATE_IDLE      =3D 0,
>         UVC_BUF_STATE_QUEUED    =3D 1,
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/vide=
o.h
> index bfdae12cdacf..9076a444758a 100644
> --- a/include/uapi/linux/usb/video.h
> +++ b/include/uapi/linux/usb/video.h
> @@ -104,6 +104,7 @@
>  #define UVC_CT_ROLL_ABSOLUTE_CONTROL                   0x0f
>  #define UVC_CT_ROLL_RELATIVE_CONTROL                   0x10
>  #define UVC_CT_PRIVACY_CONTROL                         0x11
> +#define UVC_CT_REGION_OF_INTEREST_CONTROL              0x14
>
>  /* A.9.5. Processing Unit Control Selectors */
>  #define UVC_PU_CONTROL_UNDEFINED                       0x00
> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.=
h
> index 8288137387c0..e2feee15cb1b 100644
> --- a/include/uapi/linux/uvcvideo.h
> +++ b/include/uapi/linux/uvcvideo.h
> @@ -16,6 +16,7 @@
>  #define UVC_CTRL_DATA_TYPE_BOOLEAN     3
>  #define UVC_CTRL_DATA_TYPE_ENUM                4
>  #define UVC_CTRL_DATA_TYPE_BITMASK     5
> +#define UVC_CTRL_DATA_TYPE_RECT                6
>
>  /* Control flags */
>  #define UVC_CTRL_FLAG_SET_CUR          (1 << 0)
> @@ -36,6 +37,18 @@
>          UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
>          UVC_CTRL_FLAG_GET_DEF)
>
> +/* V4L2 private controls */
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT   (V4L2_CID_CAMERA_UVC_BASE=
 + 1)
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO   (V4L2_CID_CAMERA_UVC_BASE=
 + 2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE              (1 << 0)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                  (1 << 1)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE         (1 << 2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                 (1 << 3)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT           (1 << 4)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK      (1 << 5)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION   (1 << 6)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY                (=
1 << 7)
> +
>  struct uvc_menu_info {
>         __u32 value;
>         __u8 name[32];
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index dfff69ed88f7..d85be46e46f2 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1013,6 +1013,14 @@ enum v4l2_auto_focus_range {
>
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION                (V4L2_CID_CAMERA_=
CLASS_BASE+35)
>
> +/* CAMERA-class private control IDs */
> +
> +/*
> + * The base for the uvc driver controls. See linux/uvcvideo.h for the li=
st
> + * of controls. We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_CAMERA_UVC_BASE               (V4L2_CID_CAMERA_CLASS_BA=
SE + 0x1000)
> +
>  /* FM Modulator class control IDs */
>
>  #define V4L2_CID_FM_TX_CLASS_BASE              (V4L2_CTRL_CLASS_FM_TX | =
0x900)
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>


--=20
Ricardo Ribalda
