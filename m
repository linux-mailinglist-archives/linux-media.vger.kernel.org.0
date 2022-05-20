Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD50652E298
	for <lists+linux-media@lfdr.de>; Fri, 20 May 2022 04:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344762AbiETCo5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 22:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbiETCo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 22:44:56 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EC714675A
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 19:44:54 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id i68so4844929qke.11
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 19:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y5bKU69gBdwYXqKfBsd6lPoReCL7wSnrHfkcEkAaemQ=;
        b=R/0bZyZOK/gcR6XhH1gYl0lX70IDM2yA/5oOc6tt+5ZmMq5nkDiVTeNwSji8iK6EOB
         3haKzRZEQgeUqKm4wkUNyVYAo6uovd95QWM2TUOgsJpge4JqRNO18m4GcvQ478EEFlMk
         /iRC+4do65yJoaVtnNphaLJHvs+QHX4zZFKGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y5bKU69gBdwYXqKfBsd6lPoReCL7wSnrHfkcEkAaemQ=;
        b=5LECxrN6mX+KthEbAimtHSm3IAT5qkSNjnCS+9pj3fF7Ukcj/iYOOM3P71zpyWLr/V
         G3QatJoFOcdzgis37o3lIRE8sJPvm4xrtP10hJvAxu9WbrylkMPonq8sKQO5bMFGanUG
         wwJJoI17mYOFPHigYgkyeSenBmbm4490UKYqF53Z2H0Az8BhmhxyvRgWNuim0n0cDqU8
         sAWV+k05yOK/r0TG4k7/edLQKMOlYW0vI6E7AyvJJkQYZn5RwwEXvCCBytHfoOfnjmVr
         i6l7yLbtv5JPA1Y4zVYCJX3EErhWlj9G5wYX/aEyQz9NEF9ZM+Va+GR5nj10qqOP0fTX
         mqyg==
X-Gm-Message-State: AOAM533e67HhZEXv+Yip4fEtdvmOTJFp9bAJ76ydx3ee35LPCBGTw7VR
        EXIOlxz0vR9k5miMAUyvHMI+s9RdpeJIfliP
X-Google-Smtp-Source: ABdhPJzxtSbh+8RSfMoDsoQxIeVej09LG81joSG1C9i7dElF4Yng2jo3+hO9kGV7a59Xtw2Zud0frg==
X-Received: by 2002:a05:620a:14ba:b0:69f:bfbb:e79 with SMTP id x26-20020a05620a14ba00b0069fbfbb0e79mr5072479qkj.781.1653014693624;
        Thu, 19 May 2022 19:44:53 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id i2-20020a37b802000000b006a328ed2cecsm2206305qkf.29.2022.05.19.19.44.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 19:44:52 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id f16so12105439ybk.2
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 19:44:52 -0700 (PDT)
X-Received: by 2002:a25:496:0:b0:64f:59d4:dea2 with SMTP id
 144-20020a250496000000b0064f59d4dea2mr1317398ybe.493.1653014691789; Thu, 19
 May 2022 19:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220516140434.1871022-1-yunkec@google.com> <20220516140434.1871022-2-yunkec@google.com>
 <50d89e76f3c5f99363aa4062b40b579d94855136.camel@ndufresne.ca>
 <CAAFQd5AHWG_=8wtUZ1WVer7h5fU6UQyPuN8LUDQz=y5emZhxCg@mail.gmail.com> <f66dcb4fb41edb8f157bedc3c82af193933e77ef.camel@ndufresne.ca>
In-Reply-To: <f66dcb4fb41edb8f157bedc3c82af193933e77ef.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 20 May 2022 11:44:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bw4CfUtm4CQD4utWEQerJVHej991PNXHMzgJe=u-Mqeg@mail.gmail.com>
Message-ID: <CAAFQd5Bw4CfUtm4CQD4utWEQerJVHej991PNXHMzgJe=u-Mqeg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] media: v4l2_ctrl: Add region of interest rectangle control
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 20, 2022 at 3:23 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le mercredi 18 mai 2022 =C3=A0 14:19 +0900, Tomasz Figa a =C3=A9crit :
> > Hi Nicolas,
> >
> > On Tue, May 17, 2022 at 4:02 AM Nicolas Dufresne <nicolas@ndufresne.ca>=
 wrote:
> > >
> > > Hi,
> > >
> > > thanks for working on this, see my comments below ...
> > >
> > > Le lundi 16 mai 2022 =C3=A0 23:04 +0900, Yunke Cao a =C3=A9crit :
> > > > Including:
> > > > 1. Add a control ID.
> > > > 2. Add p_rect to struct v4l2_ext_control with basic support in
> > > >    v4l2-ctrls.
> > > >
> > > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > > ---
> > > >  .../media/v4l/ext-ctrls-camera.rst            |  4 ++++
> > > >  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
> > > >  .../media/videodev2.h.rst.exceptions          |  1 +
> > > >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++=
++++
> > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++++
> > > >  include/media/v4l2-ctrls.h                    |  2 ++
> > > >  include/uapi/linux/v4l2-controls.h            |  2 ++
> > > >  include/uapi/linux/videodev2.h                |  2 ++
> > > >  8 files changed, 39 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera=
.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > > index 4c5061aa9cd4..86a1f09a8a1c 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > > @@ -661,3 +661,7 @@ enum v4l2_scene_mode -
> > > >  .. [#f1]
> > > >     This control may be changed to a menu control in the future, if=
 more
> > > >     options are required.
> > > > +
> > > > +``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
> > > > +    This control determines the region of interest. Region of inte=
rest is an
> > > > +    rectangular area represented by a struct v4l2_rect.
> > >
> > > This control documentation is missing some important information. Not=
ably, what
> > > will happen if this rectangle is set ? Is there a value to unset it ?
> > >
> >
> > Thanks for the review!
> >
> > In V4L2 all the controls are always set to something. There is no way
> > to unset a control. Since controls have default values, perhaps the
> > way to "unset" (or rather reset it to the initial configuration) is to
> > set it to the default value?
>
> That's why a lot of similar controls comes with a companion boolean contr=
ol to
> enable/disable the feature, or an enum that specify what else is to be us=
ed,
> could be an "automatic" default or something.
>

True. I think the other bitmask control is the companion control in
this case, but it indeed wouldn't work for other use cases.

> >
> > > The name is very generic and I would expect that to be usable in gene=
ral. But it
> > > won't work for encoders, as you only allow 1 rectangle and it would b=
e missing
> > > some QP delta parameter. I think I would prefer if we specialize this=
 type of
> > > control a bit more. In your case, I'm guessing you only care about 1 =
ROI when
> > > taking a picture, and this ROI will be used for automatic focus. If m=
y guess is
> > > right, perhaps a FOCUS_AERA could be a better name ?
> >
> > I wonder if an array control is what we need here to make it flexible
> > enough? For a UVC camera obviously we would only need 1 element, but
> > other devices could accept more.
>
> See Hans and Laurent's comment on V3. They don't believe camera region of
> interest is likely to exists outside of UVC, and suggested making all the=
se
> control entirely UVC specific, which also allow making it 1:1 with UVC wi=
thout
> any headache.
>
> And this way we don't need to think about encoder ROI just yet.
>

Okay, I think that also works for us. :)

Best regards,
Tomasz

> >
> > Best regards,
> > Tomasz
> >
> > >
> > > regards,
> > > Nicolas
> > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctr=
ls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > > index 29971a45a2d4..f4e205ead0a2 100644
> > > > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > > @@ -189,6 +189,10 @@ still cause this situation.
> > > >        - ``p_area``
> > > >        - A pointer to a struct :c:type:`v4l2_area`. Valid if this c=
ontrol is
> > > >          of type ``V4L2_CTRL_TYPE_AREA``.
> > > > +    * - struct :c:type:`v4l2_rect` *
> > > > +      - ``p_area``
> > > > +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this c=
ontrol is
> > > > +        of type ``V4L2_CTRL_TYPE_RECT``.
> > > >      * - struct :c:type:`v4l2_ctrl_h264_sps` *
> > > >        - ``p_h264_sps``
> > > >        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid =
if this control is
> > > > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exce=
ptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > > index 9cbb7a0c354a..7b423475281d 100644
> > > > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > > @@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:=
`v4l2_ctrl_type`
> > > >  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
> > > >  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl=
_type`
> > > >  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> > > > +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
> > > >  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> > > >  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
> > > >  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctr=
l_type`
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/me=
dia/v4l2-core/v4l2-ctrls-core.c
> > > > index 8968cec8454e..dcde405c2713 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > > @@ -84,6 +84,11 @@ static bool std_equal(const struct v4l2_ctrl *ct=
rl, u32 idx,
> > > >               return ptr1.p_u16[idx] =3D=3D ptr2.p_u16[idx];
> > > >       case V4L2_CTRL_TYPE_U32:
> > > >               return ptr1.p_u32[idx] =3D=3D ptr2.p_u32[idx];
> > > > +     case V4L2_CTRL_TYPE_RECT:
> > > > +             return ptr1.p_rect->top =3D=3D ptr2.p_rect->top &&
> > > > +                    ptr1.p_rect->left =3D=3D ptr2.p_rect->left &&
> > > > +                    ptr1.p_rect->height =3D=3D ptr2.p_rect->height=
 &&
> > > > +                    ptr1.p_rect->width =3D=3D ptr2.p_rect->width;
> > > >       default:
> > > >               if (ctrl->is_int)
> > > >                       return ptr1.p_s32[idx] =3D=3D ptr2.p_s32[idx]=
;
> > > > @@ -307,6 +312,11 @@ static void std_log(const struct v4l2_ctrl *ct=
rl)
> > > >       case V4L2_CTRL_TYPE_VP9_FRAME:
> > > >               pr_cont("VP9_FRAME");
> > > >               break;
> > > > +     case V4L2_CTRL_TYPE_RECT:
> > > > +             pr_cont("l: %d, t: %d, w: %u, h: %u",
> > > > +                     ptr.p_rect->left, ptr.p_rect->top,
> > > > +                     ptr.p_rect->width, ptr.p_rect->height);
> > > > +             break;
> > > >       default:
> > > >               pr_cont("unknown type %d", ctrl->type);
> > > >               break;
> > > > @@ -525,6 +535,7 @@ static int std_validate_compound(const struct v=
4l2_ctrl *ctrl, u32 idx,
> > > >       struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> > > >       struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> > > >       struct v4l2_area *area;
> > > > +     struct v4l2_rect *rect;
> > > >       void *p =3D ptr.p + idx * ctrl->elem_size;
> > > >       unsigned int i;
> > > >
> > > > @@ -888,6 +899,12 @@ static int std_validate_compound(const struct =
v4l2_ctrl *ctrl, u32 idx,
> > > >                       return -EINVAL;
> > > >               break;
> > > >
> > > > +     case V4L2_CTRL_TYPE_RECT:
> > > > +             rect =3D p;
> > > > +             if (!rect->width || !rect->height)
> > > > +                     return -EINVAL;
> > > > +             break;
> > > > +
> > > >       default:
> > > >               return -EINVAL;
> > > >       }
> > > > @@ -1456,6 +1473,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct=
 v4l2_ctrl_handler *hdl,
> > > >       case V4L2_CTRL_TYPE_AREA:
> > > >               elem_size =3D sizeof(struct v4l2_area);
> > > >               break;
> > > > +     case V4L2_CTRL_TYPE_RECT:
> > > > +             elem_size =3D sizeof(struct v4l2_rect);
> > > > +             break;
> > > >       default:
> > > >               if (type < V4L2_CTRL_COMPOUND_TYPES)
> > > >                       elem_size =3D sizeof(s32);
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/me=
dia/v4l2-core/v4l2-ctrls-defs.c
> > > > index 54ca4e6b820b..95f39a2d2ad2 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > > @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > >       case V4L2_CID_UNIT_CELL_SIZE:           return "Unit Cell Siz=
e";
> > > >       case V4L2_CID_CAMERA_ORIENTATION:       return "Camera Orient=
ation";
> > > >       case V4L2_CID_CAMERA_SENSOR_ROTATION:   return "Camera Sensor=
 Rotation";
> > > > +     case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Int=
erest Rectangle";
> > > >
> > > >       /* FM Radio Modulator controls */
> > > >       /* Keep the order of the 'case's the same as in v4l2-controls=
.h! */
> > > > @@ -1524,6 +1525,9 @@ void v4l2_ctrl_fill(u32 id, const char **name=
, enum v4l2_ctrl_type *type,
> > > >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> > > >               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> > > >               break;
> > > > +     case V4L2_CID_REGION_OF_INTEREST_RECT:
> > > > +             *type =3D V4L2_CTRL_TYPE_RECT;
> > > > +             break;
> > > >       default:
> > > >               *type =3D V4L2_CTRL_TYPE_INTEGER;
> > > >               break;
> > > > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.=
h
> > > > index b3ce438f1329..919e104de50b 100644
> > > > --- a/include/media/v4l2-ctrls.h
> > > > +++ b/include/media/v4l2-ctrls.h
> > > > @@ -58,6 +58,7 @@ struct video_device;
> > > >   * @p_hdr10_cll:             Pointer to an HDR10 Content Light Lev=
el structure.
> > > >   * @p_hdr10_mastering:               Pointer to an HDR10 Mastering=
 Display structure.
> > > >   * @p_area:                  Pointer to an area.
> > > > + * @p_rect:                  Pointer to a rectangle.
> > > >   * @p:                               Pointer to a compound value.
> > > >   * @p_const:                 Pointer to a constant compound value.
> > > >   */
> > > > @@ -87,6 +88,7 @@ union v4l2_ctrl_ptr {
> > > >       struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
> > > >       struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> > > >       struct v4l2_area *p_area;
> > > > +     struct v4l2_rect *p_rect;
> > > >       void *p;
> > > >       const void *p_const;
> > > >  };
> > > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linu=
x/v4l2-controls.h
> > > > index bb40129446d4..499fcddb6254 100644
> > > > --- a/include/uapi/linux/v4l2-controls.h
> > > > +++ b/include/uapi/linux/v4l2-controls.h
> > > > @@ -1008,6 +1008,8 @@ enum v4l2_auto_focus_range {
> > > >
> > > >  #define V4L2_CID_CAMERA_SENSOR_ROTATION              (V4L2_CID_CAM=
ERA_CLASS_BASE+35)
> > > >
> > > > +#define V4L2_CID_REGION_OF_INTEREST_RECT     (V4L2_CID_CAMERA_CLAS=
S_BASE+36)
> > > > +
> > > >  /* FM Modulator class control IDs */
> > > >
> > > >  #define V4L2_CID_FM_TX_CLASS_BASE            (V4L2_CTRL_CLASS_FM_T=
X | 0x900)
> > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vi=
deodev2.h
> > > > index 3768a0a80830..b712412cf763 100644
> > > > --- a/include/uapi/linux/videodev2.h
> > > > +++ b/include/uapi/linux/videodev2.h
> > > > @@ -1751,6 +1751,7 @@ struct v4l2_ext_control {
> > > >               __u16 __user *p_u16;
> > > >               __u32 __user *p_u32;
> > > >               struct v4l2_area __user *p_area;
> > > > +             struct v4l2_rect __user *p_rect;
> > > >               struct v4l2_ctrl_h264_sps __user *p_h264_sps;
> > > >               struct v4l2_ctrl_h264_pps *p_h264_pps;
> > > >               struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_s=
caling_matrix;
> > > > @@ -1810,6 +1811,7 @@ enum v4l2_ctrl_type {
> > > >       V4L2_CTRL_TYPE_U16           =3D 0x0101,
> > > >       V4L2_CTRL_TYPE_U32           =3D 0x0102,
> > > >       V4L2_CTRL_TYPE_AREA          =3D 0x0106,
> > > > +     V4L2_CTRL_TYPE_RECT          =3D 0x0107,
> > > >
> > > >       V4L2_CTRL_TYPE_HDR10_CLL_INFO           =3D 0x0110,
> > > >       V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY  =3D 0x0111,
> > >
>
