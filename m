Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7735A08B9
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 08:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbiHYGQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 02:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235060AbiHYGQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 02:16:03 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4869F8D6
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 23:16:02 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-33dc345ad78so3984087b3.3
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 23:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dobj17J5IBRu/WvjA2UwLEmuyNudys/JryI1IHgwaUA=;
        b=WpSkg56l6VO5yS8B6sAW52db2Pf4azpZ0Kwb+J70ZKhWO1r+R50cg4RVLzWFAxqYBC
         W+9OGDQs4HnEtZOCCPmtzbq7s+A1l40Y92Q4dWhoTB/BJ5joOqLHkiydd3xbxMVQGdfT
         EAgtpEUpoIA8TFtCS5l5UvgnvmvOhIKQmm3p+Vz3FXmyZOQ8xHLKOUr0kai8kP4YvrVC
         pvsK93BTZCeMC5usUhFb8Np0N8sAbk+ZjiJIOsFicc29qCfP/9sPUhvargIoymKCnA3S
         b/zJvTCZhdeYGd7BZk0fXVBF8/aeHavh2ZnLX4Jd2POYV8Uy5SmIOdqTaD4DOn++4Jud
         Mafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dobj17J5IBRu/WvjA2UwLEmuyNudys/JryI1IHgwaUA=;
        b=OKnDgonAfrzt/nBZHDbo0e5C/bnyMWefV2UGtoLF5iH8VPF6OTyz7K3Egosdciz9Cv
         zg7R09rD8VEhbNadMyegVD/IBTIAGGj5AH8HOxaXnAdKzTD4RPYuw0BLw2IRH37Dn6Et
         CZ92m3/0hgRR0kRELfkyCaC3BUD09XSVGoDJ0wB7iU1QUPCgdf6wB/K3/XkalZwHKAww
         lFQXeJiLk60/4KJ3WbOvFVJqU6WlntKDqWaY3HCB+RpYnDGrlNtoiovTbHyt7KKME3FA
         Uir/OzSejmv1if7QKiu+424vfgkq7xr/YkTVnjO1MJfKiUlQ8UN/ZVr3yVHtEmJdqEEt
         YMRA==
X-Gm-Message-State: ACgBeo2NCcGbjaRzMQ7P8Z5Sc2mhBLUML01DdAntha5rbrqw6F1YTlWf
        Rz3K0yTWg6dPMDUQvFF7AJyE9R4l/i1RRKFjr6rDcA==
X-Google-Smtp-Source: AA6agR58rt3NdG/khOSkwxUjVuRzn1rzD6ZfO0uP1E6tf3pLrI5FkpbeqmkO5mdon5TE34Gn1kJYQLf+ouT4ANTSOQY=
X-Received: by 2002:a25:e209:0:b0:67c:234a:f08c with SMTP id
 h9-20020a25e209000000b0067c234af08cmr2167103ybe.19.1661408160900; Wed, 24 Aug
 2022 23:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-2-yunkec@google.com>
 <7b59fffc-fb69-dc87-c3cf-4e01632154f4@xs4all.nl>
In-Reply-To: <7b59fffc-fb69-dc87-c3cf-4e01632154f4@xs4all.nl>
From:   Yunke Cao <yunkec@google.com>
Date:   Thu, 25 Aug 2022 15:15:49 +0900
Message-ID: <CANqU6FfGB5Vn1vkuQZ5F4NTzcxrS+=C0qSNL3xfkDPc+kUbWZA@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Hans, Hi Laurent,

Thank you for the review!

On Wed, Aug 24, 2022 at 5:50 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Yunke,
>
> You will need to rebase this since some of the v4l2-ctrl internals
> have changed.
>

Thanks, I will rebase for the next version.

> On 28/06/2022 09:56, Yunke Cao wrote:
> > Add p_rect to struct v4l2_ext_control with basic support in
> > v4l2-ctrls.
> >
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
> >  .../media/videodev2.h.rst.exceptions          |  1 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
> >  include/media/v4l2-ctrls.h                    |  2 ++
> >  include/uapi/linux/videodev2.h                |  2 ++
> >  5 files changed, 29 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > index 29971a45a2d4..7473baa4e977 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > @@ -189,6 +189,10 @@ still cause this situation.
> >        - ``p_area``
> >        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> >          of type ``V4L2_CTRL_TYPE_AREA``.
> > +    * - struct :c:type:`v4l2_rect` *
> > +      - ``p_rect``
> > +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
> > +        of type ``V4L2_CTRL_TYPE_RECT``.
> >      * - struct :c:type:`v4l2_ctrl_h264_sps` *
> >        - ``p_h264_sps``
> >        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
>
> You also need to update Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst.
>

Ah, I missed that. Will add it in v8.

> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index 9cbb7a0c354a..7b423475281d 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> > +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index 949c1884d9c1..35d43ba650db 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -84,6 +84,11 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
> >               return ptr1.p_u16[idx] == ptr2.p_u16[idx];
> >       case V4L2_CTRL_TYPE_U32:
> >               return ptr1.p_u32[idx] == ptr2.p_u32[idx];
> > +     case V4L2_CTRL_TYPE_RECT:
> > +             return ptr1.p_rect->top == ptr2.p_rect->top &&
> > +                    ptr1.p_rect->left == ptr2.p_rect->left &&
> > +                    ptr1.p_rect->height == ptr2.p_rect->height &&
> > +                    ptr1.p_rect->width == ptr2.p_rect->width;
>
> You don't need to do anything here, it will fallback to a memcmp, and
> that's fine for struct v4l2_rect.
>

Thanks! Will remove it in v8.

Best,
Yunke

> >       default:
> >               if (ctrl->is_int)
> >                       return ptr1.p_s32[idx] == ptr2.p_s32[idx];
> > @@ -307,6 +312,11 @@ static void std_log(const struct v4l2_ctrl *ctrl)
> >       case V4L2_CTRL_TYPE_VP9_FRAME:
> >               pr_cont("VP9_FRAME");
> >               break;
> > +     case V4L2_CTRL_TYPE_RECT:
> > +             pr_cont("%ux%u@%dx%d",
> > +                     ptr.p_rect->width, ptr.p_rect->height,
> > +                     ptr.p_rect->left, ptr.p_rect->top);
> > +             break;
> >       default:
> >               pr_cont("unknown type %d", ctrl->type);
> >               break;
> > @@ -525,6 +535,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >       struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> >       struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> >       struct v4l2_area *area;
> > +     struct v4l2_rect *rect;
> >       void *p = ptr.p + idx * ctrl->elem_size;
> >       unsigned int i;
> >
> > @@ -888,6 +899,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >                       return -EINVAL;
> >               break;
> >
> > +     case V4L2_CTRL_TYPE_RECT:
> > +             rect = p;
> > +             if (!rect->width || !rect->height)
> > +                     return -EINVAL;
> > +             break;
> > +
> >       default:
> >               return -EINVAL;
> >       }
> > @@ -1455,6 +1472,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >       case V4L2_CTRL_TYPE_AREA:
> >               elem_size = sizeof(struct v4l2_area);
> >               break;
> > +     case V4L2_CTRL_TYPE_RECT:
> > +             elem_size = sizeof(struct v4l2_rect);
> > +             break;
> >       default:
> >               if (type < V4L2_CTRL_COMPOUND_TYPES)
> >                       elem_size = sizeof(s32);
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index b3ce438f1329..919e104de50b 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -58,6 +58,7 @@ struct video_device;
> >   * @p_hdr10_cll:             Pointer to an HDR10 Content Light Level structure.
> >   * @p_hdr10_mastering:               Pointer to an HDR10 Mastering Display structure.
> >   * @p_area:                  Pointer to an area.
> > + * @p_rect:                  Pointer to a rectangle.
> >   * @p:                               Pointer to a compound value.
> >   * @p_const:                 Pointer to a constant compound value.
> >   */
> > @@ -87,6 +88,7 @@ union v4l2_ctrl_ptr {
> >       struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
> >       struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> >       struct v4l2_area *p_area;
> > +     struct v4l2_rect *p_rect;
> >       void *p;
> >       const void *p_const;
> >  };
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 343b95107fce..2e36bb610ea6 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -1754,6 +1754,7 @@ struct v4l2_ext_control {
> >               __u16 __user *p_u16;
> >               __u32 __user *p_u32;
> >               struct v4l2_area __user *p_area;
> > +             struct v4l2_rect __user *p_rect;
> >               struct v4l2_ctrl_h264_sps __user *p_h264_sps;
> >               struct v4l2_ctrl_h264_pps *p_h264_pps;
> >               struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
> > @@ -1813,6 +1814,7 @@ enum v4l2_ctrl_type {
> >       V4L2_CTRL_TYPE_U16           = 0x0101,
> >       V4L2_CTRL_TYPE_U32           = 0x0102,
> >       V4L2_CTRL_TYPE_AREA          = 0x0106,
> > +     V4L2_CTRL_TYPE_RECT          = 0x0107,
> >
> >       V4L2_CTRL_TYPE_HDR10_CLL_INFO           = 0x0110,
> >       V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY  = 0x0111,
>
> Regards,
>
>         Hans
