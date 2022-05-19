Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A4252DCAA
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 20:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243824AbiESSXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 14:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbiESSXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 14:23:43 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833D144A0C
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 11:23:41 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id c1so5333296qkf.13
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 11:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Dhd3B20KJ4CPyIErJ9eF9HQUX7N1tC24SRe8DWT0a4Y=;
        b=fx9oPR+TmMyTI577KTkXo1sA9ayotPmzha8+gMxDZrpPJbgZV88DAXw7SBfQLJPlnD
         joC7+X+Gf8A+JF+lKZAoZKRNWVQzvuocgOoOIoQco/V0axwU0VE8ganlr/pZCJ8VRXkp
         RofbBkK5K8DTIO0kvVRzzq5fnC9VJ06cxsyCMf1cOaZO4Bc36DOtx22DihgjjugFlhhU
         8Pn2m1PAMMbLDnIPRjrOMsbPr7AYbRqJqGSPneQ9VqCelADIVUDrOcx0ToD/UikR+7mf
         QptrxdZqPWLrcYtEDYX1LNW7Tayru4Ji3DDzcM56W5uinUqgEBJl0nnAUE4qdwqH+/h1
         ZWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Dhd3B20KJ4CPyIErJ9eF9HQUX7N1tC24SRe8DWT0a4Y=;
        b=S+ntW0o+ZiRNfoXs7vj3sS9DkM3diiDK6Ur+nOWw/r/+sMrPNL8JWvlcMNqU1pd05B
         uENQDds59YwDwG8cf5PFQ82IyzntUET1WuxR0oIW/uO6aifZp0QW1V/WMVGhNXajsT5x
         8G7mSI2++RRcWf7PmjMQS1IEuSDvf7fqlatIqftMxC2ZwCBVwqfyhcbV5HXLEnyoCXVh
         V8A1zBdthrtVSc4wdi02/gzwR25wIqIX6cVHTbKAFhhvGkNiJQs/nPz4CkjgqNk+AcIx
         sUHI7Szf6YLO2EMRCrGdZQE+db0lM48Q9oIUJ1yFJS45sIWmsJjz88sRJiu/HHnslS6H
         K75w==
X-Gm-Message-State: AOAM532H+ImxEnNv9qXv/LBx7Hl/xgUqelm7n7TzjVZn86D7+7WKa/4L
        +ovVdUQClm8wKbcrUtea3nq7jKyu4+YZfg==
X-Google-Smtp-Source: ABdhPJwUhCf7/5QYSM43eb9HFpKAD/ROBLSlgMRAY89DyjcRsLtukyGS4wUKiiL3RZ5w3738ZHlmlw==
X-Received: by 2002:a05:620a:4612:b0:6a0:125b:56be with SMTP id br18-20020a05620a461200b006a0125b56bemr3924880qkb.369.1652984620606;
        Thu, 19 May 2022 11:23:40 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id z20-20020ac875d4000000b002f39b99f678sm1598224qtq.18.2022.05.19.11.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 11:23:39 -0700 (PDT)
Message-ID: <f66dcb4fb41edb8f157bedc3c82af193933e77ef.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/6] media: v4l2_ctrl: Add region of interest
 rectangle control
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Date:   Thu, 19 May 2022 14:23:38 -0400
In-Reply-To: <CAAFQd5AHWG_=8wtUZ1WVer7h5fU6UQyPuN8LUDQz=y5emZhxCg@mail.gmail.com>
References: <20220516140434.1871022-1-yunkec@google.com>
         <20220516140434.1871022-2-yunkec@google.com>
         <50d89e76f3c5f99363aa4062b40b579d94855136.camel@ndufresne.ca>
         <CAAFQd5AHWG_=8wtUZ1WVer7h5fU6UQyPuN8LUDQz=y5emZhxCg@mail.gmail.com>
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

Le mercredi 18 mai 2022 =C3=A0 14:19 +0900, Tomasz Figa a =C3=A9crit=C2=A0:
> Hi Nicolas,
>=20
> On Tue, May 17, 2022 at 4:02 AM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> >=20
> > Hi,
> >=20
> > thanks for working on this, see my comments below ...
> >=20
> > Le lundi 16 mai 2022 =C3=A0 23:04 +0900, Yunke Cao a =C3=A9crit :
> > > Including:
> > > 1. Add a control ID.
> > > 2. Add p_rect to struct v4l2_ext_control with basic support in
> > >    v4l2-ctrls.
> > >=20
> > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > ---
> > >  .../media/v4l/ext-ctrls-camera.rst            |  4 ++++
> > >  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
> > >  .../media/videodev2.h.rst.exceptions          |  1 +
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++=
++
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++++
> > >  include/media/v4l2-ctrls.h                    |  2 ++
> > >  include/uapi/linux/v4l2-controls.h            |  2 ++
> > >  include/uapi/linux/videodev2.h                |  2 ++
> > >  8 files changed, 39 insertions(+)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.r=
st b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > index 4c5061aa9cd4..86a1f09a8a1c 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > @@ -661,3 +661,7 @@ enum v4l2_scene_mode -
> > >  .. [#f1]
> > >     This control may be changed to a menu control in the future, if m=
ore
> > >     options are required.
> > > +
> > > +``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
> > > +    This control determines the region of interest. Region of intere=
st is an
> > > +    rectangular area represented by a struct v4l2_rect.
> >=20
> > This control documentation is missing some important information. Notab=
ly, what
> > will happen if this rectangle is set ? Is there a value to unset it ?
> >=20
>=20
> Thanks for the review!
>=20
> In V4L2 all the controls are always set to something. There is no way
> to unset a control. Since controls have default values, perhaps the
> way to "unset" (or rather reset it to the initial configuration) is to
> set it to the default value?

That's why a lot of similar controls comes with a companion boolean control=
 to
enable/disable the feature, or an enum that specify what else is to be used=
,
could be an "automatic" default or something.

>=20
> > The name is very generic and I would expect that to be usable in genera=
l. But it
> > won't work for encoders, as you only allow 1 rectangle and it would be =
missing
> > some QP delta parameter. I think I would prefer if we specialize this t=
ype of
> > control a bit more. In your case, I'm guessing you only care about 1 RO=
I when
> > taking a picture, and this ROI will be used for automatic focus. If my =
guess is
> > right, perhaps a FOCUS_AERA could be a better name ?
>=20
> I wonder if an array control is what we need here to make it flexible
> enough? For a UVC camera obviously we would only need 1 element, but
> other devices could accept more.

See Hans and Laurent's comment on V3. They don't believe camera region of
interest is likely to exists outside of UVC, and suggested making all these
control entirely UVC specific, which also allow making it 1:1 with UVC with=
out
any headache.

And this way we don't need to think about encoder ROI just yet.

>=20
> Best regards,
> Tomasz
>=20
> >=20
> > regards,
> > Nicolas
> >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls=
.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > index 29971a45a2d4..f4e205ead0a2 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > @@ -189,6 +189,10 @@ still cause this situation.
> > >        - ``p_area``
> > >        - A pointer to a struct :c:type:`v4l2_area`. Valid if this con=
trol is
> > >          of type ``V4L2_CTRL_TYPE_AREA``.
> > > +    * - struct :c:type:`v4l2_rect` *
> > > +      - ``p_area``
> > > +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this con=
trol is
> > > +        of type ``V4L2_CTRL_TYPE_RECT``.
> > >      * - struct :c:type:`v4l2_ctrl_h264_sps` *
> > >        - ``p_h264_sps``
> > >        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if=
 this control is
> > > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.except=
ions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > index 9cbb7a0c354a..7b423475281d 100644
> > > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > @@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v=
4l2_ctrl_type`
> > >  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
> > >  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_t=
ype`
> > >  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> > > +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
> > >  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> > >  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
> > >  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_=
type`
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-core.c
> > > index 8968cec8454e..dcde405c2713 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > @@ -84,6 +84,11 @@ static bool std_equal(const struct v4l2_ctrl *ctrl=
, u32 idx,
> > >               return ptr1.p_u16[idx] =3D=3D ptr2.p_u16[idx];
> > >       case V4L2_CTRL_TYPE_U32:
> > >               return ptr1.p_u32[idx] =3D=3D ptr2.p_u32[idx];
> > > +     case V4L2_CTRL_TYPE_RECT:
> > > +             return ptr1.p_rect->top =3D=3D ptr2.p_rect->top &&
> > > +                    ptr1.p_rect->left =3D=3D ptr2.p_rect->left &&
> > > +                    ptr1.p_rect->height =3D=3D ptr2.p_rect->height &=
&
> > > +                    ptr1.p_rect->width =3D=3D ptr2.p_rect->width;
> > >       default:
> > >               if (ctrl->is_int)
> > >                       return ptr1.p_s32[idx] =3D=3D ptr2.p_s32[idx];
> > > @@ -307,6 +312,11 @@ static void std_log(const struct v4l2_ctrl *ctrl=
)
> > >       case V4L2_CTRL_TYPE_VP9_FRAME:
> > >               pr_cont("VP9_FRAME");
> > >               break;
> > > +     case V4L2_CTRL_TYPE_RECT:
> > > +             pr_cont("l: %d, t: %d, w: %u, h: %u",
> > > +                     ptr.p_rect->left, ptr.p_rect->top,
> > > +                     ptr.p_rect->width, ptr.p_rect->height);
> > > +             break;
> > >       default:
> > >               pr_cont("unknown type %d", ctrl->type);
> > >               break;
> > > @@ -525,6 +535,7 @@ static int std_validate_compound(const struct v4l=
2_ctrl *ctrl, u32 idx,
> > >       struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> > >       struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> > >       struct v4l2_area *area;
> > > +     struct v4l2_rect *rect;
> > >       void *p =3D ptr.p + idx * ctrl->elem_size;
> > >       unsigned int i;
> > >=20
> > > @@ -888,6 +899,12 @@ static int std_validate_compound(const struct v4=
l2_ctrl *ctrl, u32 idx,
> > >                       return -EINVAL;
> > >               break;
> > >=20
> > > +     case V4L2_CTRL_TYPE_RECT:
> > > +             rect =3D p;
> > > +             if (!rect->width || !rect->height)
> > > +                     return -EINVAL;
> > > +             break;
> > > +
> > >       default:
> > >               return -EINVAL;
> > >       }
> > > @@ -1456,6 +1473,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v=
4l2_ctrl_handler *hdl,
> > >       case V4L2_CTRL_TYPE_AREA:
> > >               elem_size =3D sizeof(struct v4l2_area);
> > >               break;
> > > +     case V4L2_CTRL_TYPE_RECT:
> > > +             elem_size =3D sizeof(struct v4l2_rect);
> > > +             break;
> > >       default:
> > >               if (type < V4L2_CTRL_COMPOUND_TYPES)
> > >                       elem_size =3D sizeof(s32);
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-defs.c
> > > index 54ca4e6b820b..95f39a2d2ad2 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >       case V4L2_CID_UNIT_CELL_SIZE:           return "Unit Cell Size"=
;
> > >       case V4L2_CID_CAMERA_ORIENTATION:       return "Camera Orientat=
ion";
> > >       case V4L2_CID_CAMERA_SENSOR_ROTATION:   return "Camera Sensor R=
otation";
> > > +     case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Inter=
est Rectangle";
> > >=20
> > >       /* FM Radio Modulator controls */
> > >       /* Keep the order of the 'case's the same as in v4l2-controls.h=
! */
> > > @@ -1524,6 +1525,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, =
enum v4l2_ctrl_type *type,
> > >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> > >               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> > >               break;
> > > +     case V4L2_CID_REGION_OF_INTEREST_RECT:
> > > +             *type =3D V4L2_CTRL_TYPE_RECT;
> > > +             break;
> > >       default:
> > >               *type =3D V4L2_CTRL_TYPE_INTEGER;
> > >               break;
> > > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > > index b3ce438f1329..919e104de50b 100644
> > > --- a/include/media/v4l2-ctrls.h
> > > +++ b/include/media/v4l2-ctrls.h
> > > @@ -58,6 +58,7 @@ struct video_device;
> > >   * @p_hdr10_cll:             Pointer to an HDR10 Content Light Level=
 structure.
> > >   * @p_hdr10_mastering:               Pointer to an HDR10 Mastering D=
isplay structure.
> > >   * @p_area:                  Pointer to an area.
> > > + * @p_rect:                  Pointer to a rectangle.
> > >   * @p:                               Pointer to a compound value.
> > >   * @p_const:                 Pointer to a constant compound value.
> > >   */
> > > @@ -87,6 +88,7 @@ union v4l2_ctrl_ptr {
> > >       struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
> > >       struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> > >       struct v4l2_area *p_area;
> > > +     struct v4l2_rect *p_rect;
> > >       void *p;
> > >       const void *p_const;
> > >  };
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> > > index bb40129446d4..499fcddb6254 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -1008,6 +1008,8 @@ enum v4l2_auto_focus_range {
> > >=20
> > >  #define V4L2_CID_CAMERA_SENSOR_ROTATION              (V4L2_CID_CAMER=
A_CLASS_BASE+35)
> > >=20
> > > +#define V4L2_CID_REGION_OF_INTEREST_RECT     (V4L2_CID_CAMERA_CLASS_=
BASE+36)
> > > +
> > >  /* FM Modulator class control IDs */
> > >=20
> > >  #define V4L2_CID_FM_TX_CLASS_BASE            (V4L2_CTRL_CLASS_FM_TX =
| 0x900)
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index 3768a0a80830..b712412cf763 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -1751,6 +1751,7 @@ struct v4l2_ext_control {
> > >               __u16 __user *p_u16;
> > >               __u32 __user *p_u32;
> > >               struct v4l2_area __user *p_area;
> > > +             struct v4l2_rect __user *p_rect;
> > >               struct v4l2_ctrl_h264_sps __user *p_h264_sps;
> > >               struct v4l2_ctrl_h264_pps *p_h264_pps;
> > >               struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_sca=
ling_matrix;
> > > @@ -1810,6 +1811,7 @@ enum v4l2_ctrl_type {
> > >       V4L2_CTRL_TYPE_U16           =3D 0x0101,
> > >       V4L2_CTRL_TYPE_U32           =3D 0x0102,
> > >       V4L2_CTRL_TYPE_AREA          =3D 0x0106,
> > > +     V4L2_CTRL_TYPE_RECT          =3D 0x0107,
> > >=20
> > >       V4L2_CTRL_TYPE_HDR10_CLL_INFO           =3D 0x0110,
> > >       V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY  =3D 0x0111,
> >=20

