Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4518651A10
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 05:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232807AbiLTEpW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 23:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbiLTEpV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 23:45:21 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D78713D65
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 20:45:18 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id pv25so7630829qvb.1
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 20:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKcdAfeoMB71h/bqH+UZL4XNeCm9YbzFDg1DwhMEMkU=;
        b=O+QrSVhBBRh4Nq7IR3ziqskTOiO5XQhFA5hvlDjGtIWHmdu6d5yD6E7mYuPboBqRhG
         /4oWFcuXhcnSy6rWvK9aON5K9n0vQwqahj55MVtGzyRXTfEs7ZZBs2pCHcJK5JIONDsz
         tIV3AH4Ypli9p5eX4de+QytLIQhC++GjA6h0HtaHRXYyNw3qhG91dB+o4IAPJA8Tzo7C
         scm8R7VAMeDD5X7GW076XrPFD2WT4V60Kd8XoUzj87svgkxdeOeG3mnnBh7RrL+fJtkt
         4YkEODIl7pomZjmkYC9LcTLw2N74j7N3pMMxaoCRN3WGiJkoFNmK4Zu6hYzsNdctXlvo
         eu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKcdAfeoMB71h/bqH+UZL4XNeCm9YbzFDg1DwhMEMkU=;
        b=jtj7y9MsYJGiOa2wTpz3avq5jTMdHuN3KngjUdy9pa1IXOnw9JyHmmq9XlRUBEwRB6
         D2NzRpft150tYquTPByMiv3Zm2A6OLcv9uy1PIgwuN15pFZvxgeQOHXxLV5tMsopCt9k
         a/ZZFV6yzpK6B3lF8osY9yVQkSAPzfBhXwNml0qXBGKyh633VOqEqFNmb3z4QLHF/T5j
         J91MWgyX0Ldh7AmOCQHPvRYkrcAun8OCtjf8I/Qdbxiek67WDjn/F6XQ29qFV+SWtMX+
         zr4Q1VkDOwdVZ1pBv0PMnv4AB9nAi7etn1IyJAHEuCB4ON7UVWVXKbHXsClGRzpGuXgf
         dkVg==
X-Gm-Message-State: ANoB5pl+GKGnaQi7DMi+4pvMWidnHXuEEe1VPd0Vii99Qq2UZ3grAp2S
        FwE+Lv64AaiChnRHD+DA2/EQbIDPGPBMxtrvqrXfyQ==
X-Google-Smtp-Source: AA0mqf6hxtPWypTRulYaL3sUGsMo6GAj0I3KKmTaw2lpWBgTHK+eU39a3G0tCiBxZWNTmHMPa6e69k6tzREyisR98+g=
X-Received: by 2002:a0c:9045:0:b0:4c7:74da:55ab with SMTP id
 o63-20020a0c9045000000b004c774da55abmr14648101qvo.59.1671511517305; Mon, 19
 Dec 2022 20:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com> <20221109060621.704531-7-yunkec@google.com>
 <72782fc9-ebe6-bab5-78b5-a66b226b4d74@ideasonboard.com> <CANqU6FeT3WtZYn8DVx5tkt+N9sdYhfOyHQeSzOHnS0E4dP_7_w@mail.gmail.com>
 <ff58878b-0503-43c8-9e93-2a371dc7f0c4@ideasonboard.com>
In-Reply-To: <ff58878b-0503-43c8-9e93-2a371dc7f0c4@ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 20 Dec 2022 13:45:06 +0900
Message-ID: <CANqU6Fe+zTMEf0eoaGoMe3pdrugtnaL+h8SEB0zzM8g-8uQT3w@mail.gmail.com>
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

On Fri, Dec 16, 2022 at 9:19 PM Dan Scally <dan.scally@ideasonboard.com> wr=
ote:
>
> Hello
>
> On 16/12/2022 01:30, Yunke Cao wrote:
> > Hi Dan,
> >
> > On Fri, Dec 16, 2022 at 12:55 AM Dan Scally <dan.scally@ideasonboard.co=
m> wrote:
> >> Hi Yunke
> >>
> >> On 09/11/2022 06:06, Yunke Cao wrote:
> >>> Implement support for ROI as described in UVC 1.5:
> >>> 4.2.2.1.20 Digital Region of Interest (ROI) Control
> >>>
> >>> ROI control is implemented using V4L2 control API as
> >>> two UVC-specific controls:
> >>> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> >>> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> >>>
> >>> Signed-off-by: Yunke Cao <yunkec@google.com>
> >>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>> Changelog since v9:
> >>> - No change.
> >>> Changelog since v8:
> >>> - No change.
> >>> Changelog since v7:
> >>> - Fix a few style issues.
> >>> - Only allow 4-byte aligned data.
> >>> - Add control names.
> >>> - Move initialization to 7/10.
> >>>
> >>> Question:
> >>> - Is V4L2_CID_CAMERA_UVC_BASE defined correctly?
> >>>     Should we use V4L2_CID_PRIVATE_BASE?
> >>>
> >>>    drivers/media/usb/uvc/uvc_ctrl.c   | 111 +++++++++++++++++++++++++=
++--
> >>>    drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
> >>>    drivers/media/usb/uvc/uvcvideo.h   |   7 ++
> >>>    include/uapi/linux/usb/video.h     |   1 +
> >>>    include/uapi/linux/uvcvideo.h      |  13 ++++
> >>>    include/uapi/linux/v4l2-controls.h |   9 +++
> >>>    6 files changed, 140 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc=
/uvc_ctrl.c
> >>> index 7d86aa695b34..6279a3edf944 100644
> >>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> >>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> >>> @@ -356,6 +356,24 @@ static const struct uvc_control_info uvc_ctrls[]=
 =3D {
> >>>                .flags          =3D UVC_CTRL_FLAG_GET_CUR
> >>>                                | UVC_CTRL_FLAG_AUTO_UPDATE,
> >>>        },
> >>> +     /*
> >>> +      * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get =
updated
> >>> +      * by sensors.
> >>> +      * "This RoI should be the same as specified in most recent SET=
_CUR
> >>> +      * except in the case where the =E2=80=98Auto Detect and Track=
=E2=80=99 and/or
> >>> +      * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
> >>> +      * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> >>> +      */
> >>> +     {
> >>> +             .entity         =3D UVC_GUID_UVC_CAMERA,
> >>> +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> >>> +             .index          =3D 21,
> >>> +             .size           =3D 10,
> >>> +             .flags          =3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FL=
AG_GET_CUR
> >>> +                             | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG=
_GET_MAX
> >>> +                             | UVC_CTRL_FLAG_GET_DEF
> >>> +                             | UVC_CTRL_FLAG_AUTO_UPDATE,
> >>> +     },
> >>>    };
> >>>
> >>>    static const u32 uvc_control_classes[] =3D {
> >>> @@ -431,6 +449,57 @@ static void uvc_ctrl_set_rel_speed(struct uvc_co=
ntrol_mapping *mapping,
> >>>        data[first+1] =3D min_t(int, abs(value), 0xff);
> >>>    }
> >>>
> >>> +static int uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
> >>> +                         const struct uvc_rect *uvc_rect)
> >>> +{
> >>> +     if (uvc_rect->top < uvc_rect->bottom ||
> >>> +         uvc_rect->right < uvc_rect->left)
> >>> +             return -EINVAL;
> >>> +
> >>> +     v4l2_rect->top =3D uvc_rect->top;
> >>> +     v4l2_rect->left =3D uvc_rect->left;
> >>> +     v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
> >>> +     v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
> >>> +                         const struct v4l2_rect *v4l2_rect)
> >>> +{
> >>> +     /* Safely converts s32 and u32 to u16. */
> >>> +     if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
> >>> +         v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
> >>> +         v4l2_rect->height > U16_MAX || v4l2_rect->height =3D=3D 0 |=
|
> >>> +         v4l2_rect->width > U16_MAX || v4l2_rect->width =3D=3D 0 ||
> >>> +         v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
> >>> +         v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
> >>> +             return -ERANGE;
> >>> +
> >>> +     uvc_rect->top =3D v4l2_rect->top;
> >>> +     uvc_rect->left =3D v4l2_rect->left;
> >>> +     uvc_rect->bottom =3D v4l2_rect->height + v4l2_rect->top - 1;
> >>> +     uvc_rect->right =3D v4l2_rect->width + v4l2_rect->left - 1;
> >>> +     return 0;
> >>> +}
> >>
> >> uvc_ctrl_set() clamps out of range values...which is of course hard to
> >> do at that point with the compound controls, but I think it would be o=
k
> >> to simplify this function by clamping the values from v4l2_rect.
> >>
> > Sorry, I didn't get it. Do you mean clamping the value in [0, U16_MAX] =
?
>
>
> Sorry, that was poorly explained. I meant to the control's min, max
> values in the same way that uvc_ctrl_set() clamps controls of type
> V4L2_CTRL_TYPE_INTEGER [1], which would inherently guarantee that they
> were within 0 to U16_MAX (because the min/max for that control have to
> be within that range anyway) and so simplify this function...but the
> clamping wouldn't be in this function, it would have to be in
> uvc_set_compound_rect(), and would also necessitate re-ordering the
> series such that support for V4L2_CTRL_WHICH_MIN/MAX_VAL were added
> first. In addition to simplifying this function without that (unless I'm
> missing something) there's nothing to stop userspace from calling
> uvc_ioctl_s_try_ext_ctls() with a p_rect that is outside the min/max for
> the control.
>
>
> What do you think?
>
>
>
> [1]
> https://elixir.bootlin.com/linux/v6.1/source/drivers/media/usb/uvc/uvc_ct=
rl.c#L1769
>

To clamp the rectangle, we need to first populate_cache() and read the
min and max.
I found it hard to do it in uvc_set_compound_rect(). What do you think
about doing it in __uvc_ctrl_set_compound() ?
Like:

@@ -2060,7 +2051,8 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain *cha=
in,
        return ret;
 }

-static int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
+static int __uvc_ctrl_set_compound(struct uvc_video_chain *chain,
+                                  struct uvc_control_mapping *mapping,
                                   struct v4l2_ext_control *xctrl,
                                   struct uvc_control *ctrl)
 {
@@ -2078,6 +2070,36 @@ static int __uvc_ctrl_set_compound(struct
uvc_control_mapping *mapping,
        if (ret < 0)
                goto out;

+       switch (mapping->v4l2_type) {
+       case V4L2_CTRL_TYPE_RECT:
+               struct v4l2_rect *rect =3D xctrl->p_rect;
+               struct v4l2_rect min_rect;
+               struct v4l2_rect max_rect;
+
+               if (!ctrl->cached) {
+                       ret =3D uvc_ctrl_populate_cache(chain, ctrl);
+                       if (ret < 0)
+                               return ret;
+               }
+
+               mapping->get_compound(mapping,
+                                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN=
),
+                                     (u8 *)&min_rect);
+               mapping->get_compound(mapping,
+                                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX=
),
+                                     (u8 *)&max_rect);
+
+               rect->left =3D clamp_t(s32, rect->left, 0, U16_MAX);
+               rect->top =3D clamp_t(s32, rect->top, 0, U16_MAX);
+               rect->width =3D clamp_t(u32, rect->width, min_rect.width,
+                                     max_rect.width);
+               rect->height =3D clamp_t(u32, rect->width, min_rect.height,
+                                      max_rect.height);
+               break;
+       default:
+               break;
+       }

Does it look fine to you?

Also, do we have to clamp the value here?
The document seems to say that returning ERANGE (the original behavior
in this patch) is also a valid option.
"When the value is out of bounds drivers can choose to take the
closest valid value or return an ERANGE error code, whatever seems
more appropriate." [1]

I'm not sure which is the better option...

[1]
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-g-ext=
-ctrls.html?highlight=3Ds_ext_ctr

Best,
Yunke

> >
> > Best,
> > Yunke
> >
> >>> +
> >>> +static int uvc_get_compound_rect(struct uvc_control_mapping *mapping=
,
> >>> +                              const u8 *data,  u8 *data_out)
> >>> +{
> >>> +     struct uvc_rect *uvc_rect;
> >>> +
> >>> +     uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
> >>> +     return uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect)=
;
> >>> +}
> >>> +
> >>> +static int uvc_set_compound_rect(struct uvc_control_mapping *mapping=
,
> >>> +                              const u8 *data_in, u8 *data)
> >>> +{
> >>> +     struct uvc_rect *uvc_rect;
> >>> +
> >>> +     uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
> >>> +     return v4l2_to_uvc_rect(uvc_rect, (struct v4l2_rect *)data_in);
> >>> +}
> >>> +
> >>>    static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
> >>>        {
> >>>                .id             =3D V4L2_CID_BRIGHTNESS,
> >>> @@ -719,6 +788,29 @@ static const struct uvc_control_mapping uvc_ctrl=
_mappings[] =3D {
> >>>                .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >>>                .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> >>>        },
> >>> +     {
> >>> +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_REC=
T,
> >>> +             .entity         =3D UVC_GUID_UVC_CAMERA,
> >>> +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> >>> +             .v4l2_size      =3D sizeof(struct v4l2_rect) * 8,
> >>> +             .data_size      =3D sizeof(struct uvc_rect) * 8,
> >>> +             .offset         =3D 0,
> >>> +             .v4l2_type      =3D V4L2_CTRL_TYPE_RECT,
> >>> +             .data_type      =3D UVC_CTRL_DATA_TYPE_RECT,
> >>> +             .get_compound   =3D uvc_get_compound_rect,
> >>> +             .set_compound   =3D uvc_set_compound_rect,
> >>> +             .name           =3D "Region Of Interest Rectangle",
> >>> +     },
> >>> +     {
> >>> +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUT=
O,
> >>> +             .entity         =3D UVC_GUID_UVC_CAMERA,
> >>> +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> >>> +             .data_size      =3D 16,
> >>> +             .offset         =3D 64,
> >>> +             .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> >>> +             .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> >>> +             .name           =3D "Region Of Interest Auto Controls",
> >>> +     },
> >>>    };
> >>>
> >>>    static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] =
=3D {
> >>> @@ -2444,12 +2536,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_=
video_chain *chain,
> >>>        }
> >>>
> >>>        if (uvc_ctrl_mapping_is_compound(map)) {
> >>> -             if (map->data_size !=3D map->v4l2_size)
> >>> -                     return -EINVAL;
> >>> +             switch (map->v4l2_type) {
> >>> +             case V4L2_CTRL_TYPE_RECT:
> >>> +                     /* Only supports 4 bytes-aligned data. */
> >>> +                     if (WARN_ON(map->offset % 32))
> >>> +                             return -EINVAL;
> >>> +                     break;
> >>> +             default:
> >>> +                     if (WARN_ON(map->data_size !=3D map->v4l2_size)=
)
> >>> +                             return -EINVAL;
> >>> +
> >>> +                     /* Only supports byte-aligned data. */
> >>> +                     if (WARN_ON(map->offset % 8 || map->data_size %=
 8))
> >>> +                             return -EINVAL;
> >>> +             }
> >>>
> >>> -             /* Only supports byte-aligned data. */
> >>> -             if (WARN_ON(map->offset % 8 || map->data_size % 8))
> >>> -                     return -EINVAL;
> >>>        }
> >>>
> >>>        if (!map->get && !uvc_ctrl_mapping_is_compound(map))
> >>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc=
/uvc_v4l2.c
> >>> index 36ff1d0d6edb..52a7dc9ad4b9 100644
> >>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >>> @@ -1002,7 +1002,10 @@ static int uvc_ioctl_query_ext_ctrl(struct fil=
e *file, void *fh,
> >>>        qec->step =3D qc.step;
> >>>        qec->default_value =3D qc.default_value;
> >>>        qec->flags =3D qc.flags;
> >>> -     qec->elem_size =3D 4;
> >>> +     if (qc.type =3D=3D V4L2_CTRL_TYPE_RECT)
> >>> +             qec->elem_size =3D sizeof(struct v4l2_rect);
> >>> +     else
> >>> +             qec->elem_size =3D 4;
> >>>        qec->elems =3D 1;
> >>>        qec->nr_of_dims =3D 0;
> >>>        memset(qec->dims, 0, sizeof(qec->dims));
> >>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc=
/uvcvideo.h
> >>> index 1e1bccd3b2e5..c47304a63a7d 100644
> >>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>> @@ -291,6 +291,13 @@ struct uvc_streaming_header {
> >>>        u8 bTriggerUsage;
> >>>    };
> >>>
> >>> +struct uvc_rect {
> >>> +     u16 top;
> >>> +     u16 left;
> >>> +     u16 bottom;
> >>> +     u16 right;
> >>> +} __packed;
> >>> +
> >>>    enum uvc_buffer_state {
> >>>        UVC_BUF_STATE_IDLE      =3D 0,
> >>>        UVC_BUF_STATE_QUEUED    =3D 1,
> >>> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/=
video.h
> >>> index bfdae12cdacf..9076a444758a 100644
> >>> --- a/include/uapi/linux/usb/video.h
> >>> +++ b/include/uapi/linux/usb/video.h
> >>> @@ -104,6 +104,7 @@
> >>>    #define UVC_CT_ROLL_ABSOLUTE_CONTROL                        0x0f
> >>>    #define UVC_CT_ROLL_RELATIVE_CONTROL                        0x10
> >>>    #define UVC_CT_PRIVACY_CONTROL                              0x11
> >>> +#define UVC_CT_REGION_OF_INTEREST_CONTROL            0x14
> >>>
> >>>    /* A.9.5. Processing Unit Control Selectors */
> >>>    #define UVC_PU_CONTROL_UNDEFINED                    0x00
> >>> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvi=
deo.h
> >>> index 8288137387c0..ae5eaa14eca2 100644
> >>> --- a/include/uapi/linux/uvcvideo.h
> >>> +++ b/include/uapi/linux/uvcvideo.h
> >>> @@ -16,6 +16,7 @@
> >>>    #define UVC_CTRL_DATA_TYPE_BOOLEAN  3
> >>>    #define UVC_CTRL_DATA_TYPE_ENUM             4
> >>>    #define UVC_CTRL_DATA_TYPE_BITMASK  5
> >>> +#define UVC_CTRL_DATA_TYPE_RECT              6
> >>>
> >>>    /* Control flags */
> >>>    #define UVC_CTRL_FLAG_SET_CUR               (1 << 0)
> >>> @@ -36,6 +37,18 @@
> >>>         UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
> >>>         UVC_CTRL_FLAG_GET_DEF)
> >>>
> >>> +/* V4L2 driver-specific controls */
> >>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT (V4L2_CID_CAMERA_UVC_BA=
SE + 1)
> >>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (V4L2_CID_CAMERA_UVC_BA=
SE + 2)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE            (1 << 0=
)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                       =
 (1 << 1)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE              =
 (1 << 2)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                      =
 (1 << 3)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT         (1 << 4=
)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK    (1 << 5=
)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION (1 << 6=
)
> >>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY             =
 (1 << 7)
> >>> +
> >>>    struct uvc_menu_info {
> >>>        __u32 value;
> >>>        __u8 name[32];
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> >>> index b5e7d082b8ad..b3544355be8f 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -1019,6 +1019,15 @@ enum v4l2_auto_focus_range {
> >>>
> >>>    #define V4L2_CID_CAMERA_SENSOR_ROTATION             (V4L2_CID_CAME=
RA_CLASS_BASE+35)
> >>>
> >>> +/* CAMERA-class private control IDs */
> >>> +
> >>> +/*
> >>> + * The base for the uvc driver controls.
> >>> + * See linux/uvcvideo.h for the list of controls.
> >>> + * We reserve 64 controls for this driver.
> >>> + */
> >>> +#define V4L2_CID_CAMERA_UVC_BASE             (V4L2_CID_CAMERA_CLASS_=
BASE + 0x1000)
> >>> +
> >>>    /* FM Modulator class control IDs */
> >>>
> >>>    #define V4L2_CID_FM_TX_CLASS_BASE           (V4L2_CTRL_CLASS_FM_TX=
 | 0x900)
