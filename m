Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C248F529A95
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 09:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240281AbiEQHLz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 03:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241205AbiEQHL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 03:11:28 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E99BC04
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 00:11:26 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2fb9a85a124so174188647b3.13
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 00:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cr2z7a+ylb3TqVzmaZ+/w1UEGzmUdmx31/xJ9vG6D38=;
        b=mNxl5pV/DU54yrLtTLV7QAYeRJGWit1coJ5fg3IjsiVQExHuZoHfyF/50guBaL/tME
         rFb+DZtdsrhQhc3Qtv75IdZf6E4L72e62BoasvI6gYbMEsM0BzvPziFeuz+t2u5pLort
         miFHJhgdvW8070z/SD27G2D16kXzM1nj8gWwSKBpqQrNhudT1PSUfVHEmjb8Z7qPeAHJ
         xrkYI2all6IgObqodTVkkyO1ZLmTMKRylAMTsmP9W2ES7KnBSKT6Tr4lvWtSfhTncNPs
         ZVQJHMC4shMA14h0exxor7wi0Dgp9pV9aCI2dzrlAKAj4cbiPNYJiLaOKD/az7exU31V
         24pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cr2z7a+ylb3TqVzmaZ+/w1UEGzmUdmx31/xJ9vG6D38=;
        b=oCbe733I0G70LU6l7Rtc8Q2/g7TlHN1SnZbkpSE+etT5aQH6b/o0dmlQxsCQVUXFiy
         pGoVVNiWvxfQAZHs8rbp6OUy/2rdrVjD44+CGoEizuHd2DxifMcaqMREnOmccdvO8NeL
         LIUNozC0nDMMzyZOMMX0/qsUQz+RKvSycLcW50LG4C+E7jjGGbQvWesDVVapRV+H2dGG
         g5gGbUE9DY0qLnmegeeugPHxOxnSoik55X5LgC3OGhxpyJR1AWFbvwuP1gePl1vB9vvx
         giryhKomBZl76bxJAmPsvLFTJ3ldZ4KUW+tIH0snoBB7nkjhNXLDjNV3nKQeCRC6J0dj
         oA5w==
X-Gm-Message-State: AOAM5324nbd68iFg6cZGmd7yPQa6CX15o1DPxnodMJ9Ij4KvK+0o4Wzi
        z1xi9CmOcg25D7rZ432VFqDISxIXuWrwfA+YwOv0Ew==
X-Google-Smtp-Source: ABdhPJxdBrJld66FGDevITfur34X2YQhKymi7Q64UUZQIIPtYRt3omp98bR/R/cv2XDuAEU0kNGkxLcmg7acEHgu7SI=
X-Received: by 2002:a0d:f041:0:b0:2f4:cdae:6046 with SMTP id
 z62-20020a0df041000000b002f4cdae6046mr22984728ywe.315.1652771485157; Tue, 17
 May 2022 00:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220516140434.1871022-1-yunkec@google.com> <20220516140434.1871022-2-yunkec@google.com>
 <50d89e76f3c5f99363aa4062b40b579d94855136.camel@ndufresne.ca>
In-Reply-To: <50d89e76f3c5f99363aa4062b40b579d94855136.camel@ndufresne.ca>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 17 May 2022 16:11:14 +0900
Message-ID: <CANqU6FfcN7keHKJ3yXQHi1B1zJ+XHwBVefJjGXkNE6XhCaU5rg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] media: v4l2_ctrl: Add region of interest rectangle control
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

Hi Nicolas,

Thanks for the feedback. I will send v3 updating the documentation.

Yes, the current implementation only cares about 1 ROI.
For naming, my worry about using something like FOCUS_AREA is that the
ROI does more than auto focus.
See the list of controls V4L2_CID_REGION_OF_INTEREST_AUTO_* in Patch 2/6.
Let me know what you think.

Best,
Yunke


On Tue, May 17, 2022 at 4:02 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Hi,
>
> thanks for working on this, see my comments below ...
>
> Le lundi 16 mai 2022 =C3=A0 23:04 +0900, Yunke Cao a =C3=A9crit :
> > Including:
> > 1. Add a control ID.
> > 2. Add p_rect to struct v4l2_ext_control with basic support in
> >    v4l2-ctrls.
> >
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  .../media/v4l/ext-ctrls-camera.rst            |  4 ++++
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
> >  .../media/videodev2.h.rst.exceptions          |  1 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++++
> >  include/media/v4l2-ctrls.h                    |  2 ++
> >  include/uapi/linux/v4l2-controls.h            |  2 ++
> >  include/uapi/linux/videodev2.h                |  2 ++
> >  8 files changed, 39 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst=
 b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > index 4c5061aa9cd4..86a1f09a8a1c 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > @@ -661,3 +661,7 @@ enum v4l2_scene_mode -
> >  .. [#f1]
> >     This control may be changed to a menu control in the future, if mor=
e
> >     options are required.
> > +
> > +``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
> > +    This control determines the region of interest. Region of interest=
 is an
> > +    rectangular area represented by a struct v4l2_rect.
>
> This control documentation is missing some important information. Notably=
, what
> will happen if this rectangle is set ? Is there a value to unset it ?
>
> The name is very generic and I would expect that to be usable in general.=
 But it
> won't work for encoders, as you only allow 1 rectangle and it would be mi=
ssing
> some QP delta parameter. I think I would prefer if we specialize this typ=
e of
> control a bit more. In your case, I'm guessing you only care about 1 ROI =
when
> taking a picture, and this ROI will be used for automatic focus. If my gu=
ess is
> right, perhaps a FOCUS_AERA could be a better name ?
>
> regards,
> Nicolas
>
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.r=
st b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > index 29971a45a2d4..f4e205ead0a2 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > @@ -189,6 +189,10 @@ still cause this situation.
> >        - ``p_area``
> >        - A pointer to a struct :c:type:`v4l2_area`. Valid if this contr=
ol is
> >          of type ``V4L2_CTRL_TYPE_AREA``.
> > +    * - struct :c:type:`v4l2_rect` *
> > +      - ``p_area``
> > +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this contr=
ol is
> > +        of type ``V4L2_CTRL_TYPE_RECT``.
> >      * - struct :c:type:`v4l2_ctrl_h264_sps` *
> >        - ``p_h264_sps``
> >        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if t=
his control is
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptio=
ns b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index 9cbb7a0c354a..7b423475281d 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l=
2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_typ=
e`
> >  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> > +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_ty=
pe`
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/=
v4l2-core/v4l2-ctrls-core.c
> > index 8968cec8454e..dcde405c2713 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -84,6 +84,11 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, =
u32 idx,
> >               return ptr1.p_u16[idx] =3D=3D ptr2.p_u16[idx];
> >       case V4L2_CTRL_TYPE_U32:
> >               return ptr1.p_u32[idx] =3D=3D ptr2.p_u32[idx];
> > +     case V4L2_CTRL_TYPE_RECT:
> > +             return ptr1.p_rect->top =3D=3D ptr2.p_rect->top &&
> > +                    ptr1.p_rect->left =3D=3D ptr2.p_rect->left &&
> > +                    ptr1.p_rect->height =3D=3D ptr2.p_rect->height &&
> > +                    ptr1.p_rect->width =3D=3D ptr2.p_rect->width;
> >       default:
> >               if (ctrl->is_int)
> >                       return ptr1.p_s32[idx] =3D=3D ptr2.p_s32[idx];
> > @@ -307,6 +312,11 @@ static void std_log(const struct v4l2_ctrl *ctrl)
> >       case V4L2_CTRL_TYPE_VP9_FRAME:
> >               pr_cont("VP9_FRAME");
> >               break;
> > +     case V4L2_CTRL_TYPE_RECT:
> > +             pr_cont("l: %d, t: %d, w: %u, h: %u",
> > +                     ptr.p_rect->left, ptr.p_rect->top,
> > +                     ptr.p_rect->width, ptr.p_rect->height);
> > +             break;
> >       default:
> >               pr_cont("unknown type %d", ctrl->type);
> >               break;
> > @@ -525,6 +535,7 @@ static int std_validate_compound(const struct v4l2_=
ctrl *ctrl, u32 idx,
> >       struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> >       struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> >       struct v4l2_area *area;
> > +     struct v4l2_rect *rect;
> >       void *p =3D ptr.p + idx * ctrl->elem_size;
> >       unsigned int i;
> >
> > @@ -888,6 +899,12 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
> >                       return -EINVAL;
> >               break;
> >
> > +     case V4L2_CTRL_TYPE_RECT:
> > +             rect =3D p;
> > +             if (!rect->width || !rect->height)
> > +                     return -EINVAL;
> > +             break;
> > +
> >       default:
> >               return -EINVAL;
> >       }
> > @@ -1456,6 +1473,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l=
2_ctrl_handler *hdl,
> >       case V4L2_CTRL_TYPE_AREA:
> >               elem_size =3D sizeof(struct v4l2_area);
> >               break;
> > +     case V4L2_CTRL_TYPE_RECT:
> > +             elem_size =3D sizeof(struct v4l2_rect);
> > +             break;
> >       default:
> >               if (type < V4L2_CTRL_COMPOUND_TYPES)
> >                       elem_size =3D sizeof(s32);
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 54ca4e6b820b..95f39a2d2ad2 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >       case V4L2_CID_UNIT_CELL_SIZE:           return "Unit Cell Size";
> >       case V4L2_CID_CAMERA_ORIENTATION:       return "Camera Orientatio=
n";
> >       case V4L2_CID_CAMERA_SENSOR_ROTATION:   return "Camera Sensor Rot=
ation";
> > +     case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Interes=
t Rectangle";
> >
> >       /* FM Radio Modulator controls */
> >       /* Keep the order of the 'case's the same as in v4l2-controls.h! =
*/
> > @@ -1524,6 +1525,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, en=
um v4l2_ctrl_type *type,
> >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> >               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> >               break;
> > +     case V4L2_CID_REGION_OF_INTEREST_RECT:
> > +             *type =3D V4L2_CTRL_TYPE_RECT;
> > +             break;
> >       default:
> >               *type =3D V4L2_CTRL_TYPE_INTEGER;
> >               break;
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index b3ce438f1329..919e104de50b 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -58,6 +58,7 @@ struct video_device;
> >   * @p_hdr10_cll:             Pointer to an HDR10 Content Light Level s=
tructure.
> >   * @p_hdr10_mastering:               Pointer to an HDR10 Mastering Dis=
play structure.
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
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index bb40129446d4..499fcddb6254 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1008,6 +1008,8 @@ enum v4l2_auto_focus_range {
> >
> >  #define V4L2_CID_CAMERA_SENSOR_ROTATION              (V4L2_CID_CAMERA_=
CLASS_BASE+35)
> >
> > +#define V4L2_CID_REGION_OF_INTEREST_RECT     (V4L2_CID_CAMERA_CLASS_BA=
SE+36)
> > +
> >  /* FM Modulator class control IDs */
> >
> >  #define V4L2_CID_FM_TX_CLASS_BASE            (V4L2_CTRL_CLASS_FM_TX | =
0x900)
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index 3768a0a80830..b712412cf763 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -1751,6 +1751,7 @@ struct v4l2_ext_control {
> >               __u16 __user *p_u16;
> >               __u32 __user *p_u32;
> >               struct v4l2_area __user *p_area;
> > +             struct v4l2_rect __user *p_rect;
> >               struct v4l2_ctrl_h264_sps __user *p_h264_sps;
> >               struct v4l2_ctrl_h264_pps *p_h264_pps;
> >               struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scali=
ng_matrix;
> > @@ -1810,6 +1811,7 @@ enum v4l2_ctrl_type {
> >       V4L2_CTRL_TYPE_U16           =3D 0x0101,
> >       V4L2_CTRL_TYPE_U32           =3D 0x0102,
> >       V4L2_CTRL_TYPE_AREA          =3D 0x0106,
> > +     V4L2_CTRL_TYPE_RECT          =3D 0x0107,
> >
> >       V4L2_CTRL_TYPE_HDR10_CLL_INFO           =3D 0x0110,
> >       V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY  =3D 0x0111,
>
