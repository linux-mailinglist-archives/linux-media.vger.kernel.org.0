Return-Path: <linux-media+bounces-2174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E3180E0E8
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 02:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F953B216DB
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 01:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BB680C;
	Tue, 12 Dec 2023 01:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0yw9vWeK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8006ECF
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 17:33:15 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso3445a12.1
        for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 17:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702344794; x=1702949594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtf5RISi7GNB6l1jz1Ya+TfpnG0nsFfYwSkgPO3umfM=;
        b=0yw9vWeKojsj3PQoHaBerRMdklkZ1eGIAur1bOQy7Fz+JlmC4dexHwQCBfHlYMlR2Z
         8xu6pJATWC1PE01vVWu8T9UHbfoa9Hm3ppxtihFeQZLeQrXTIoqh1fKeWZAagY4MFuE1
         R7olU/pYDRtZM1WKYZ5DJgsO4sllR/sit0sbGMNmscrvPQkLc98+3HEsji1iuu/sCi2z
         9DGgd8SgKUSUIK01tvppFr1I7ZTx7PJOzFva2TqEKXQdKUNCrzUqK5Up0i31HNJ0rfI3
         aXo1ZUDXvgt73AnJUh+DQLQ7ejqRVVyczmm9lT6PsoPomVOnLXOSGzrGGaCf8DrjPxaz
         HRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702344794; x=1702949594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtf5RISi7GNB6l1jz1Ya+TfpnG0nsFfYwSkgPO3umfM=;
        b=mjo7MTKgEY+vJUe63KxDQG47Yt4ZbvMl6KyLeUHJANVXgUPA2jcSSwq5/mhDM3liEQ
         4/wZYcZHbVxxfTyw6yoHQuBmC17Knk3BbNL3EkDt4Hfz/fxwj24uspoVWue7Wo4JFliZ
         PZjME82bMk9F1Lc0tWTBvvlt4mEb15tstRNx1FufiJ47uAgBDOYUJFlD0TCQbUJWZhPa
         emgtsrm6tHcwdXzEFsryBZOanos7Gae2HO6t8wl08zHJWhGJKruGC9j0AWr3R2eTtkWW
         LQu9wA5orbW5lQDFZq3dLf83fKADESeAPBIZVr0FxItCbUmdseODEoPPqqcq7Er46zv1
         DRuQ==
X-Gm-Message-State: AOJu0YzpDsVK/xTdD6Oc9A5/ngjOOAMu8KYfhKnZp14pGy1CxCW7t4P4
	ON4mE21bsTrwjreTWF96S2caMP6d95YuxdM0fJSrhA==
X-Google-Smtp-Source: AGHT+IHLRiAxd/t9od45ppgs10e0kIGE5+oZo6fqon3BYGC5I1TsBHcbqCPDt0FQjY3bnAzUQ+ruHpRLnqLeFMh6RO8=
X-Received: by 2002:a50:c249:0:b0:544:e2b8:ba6a with SMTP id
 t9-20020a50c249000000b00544e2b8ba6amr299858edf.3.1702344793769; Mon, 11 Dec
 2023 17:33:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com> <20231201071907.3080126-2-yunkec@google.com>
 <a328cfe8-cf87-4260-aad1-933f7a6057cf@xs4all.nl> <20231208134125.GG25616@pendragon.ideasonboard.com>
In-Reply-To: <20231208134125.GG25616@pendragon.ideasonboard.com>
From: Yunke Cao <yunkec@google.com>
Date: Tue, 12 Dec 2023 10:33:02 +0900
Message-ID: <CANqU6Fe-GzKWMwOrmbPKRvBqW+Z1x-vWH=XU_G7ax4pxqHUMPg@mail.gmail.com>
Subject: Re: [PATCH v14 01/11] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent, Hans,

On Fri, Dec 8, 2023 at 10:41=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Hans,
>
> On Fri, Dec 01, 2023 at 09:35:21AM +0100, Hans Verkuil wrote:
> > On 01/12/2023 08:18, Yunke Cao wrote:
> > > Add p_rect to struct v4l2_ext_control with basic support in
> > > v4l2-ctrls.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > ---
> > > Changelog since v12:
> > > - No Change.
> > > Changelog since v11:
> > > - Added reviewed-by from Hans
> > > Changelog since v10:
> > > - Added reviewed-by from Sergey and Daniel.
> > > Changelog since v9:
> > > - No Change.
> > > Changelog since v8:
> > > - No change.
> > > Changelog since v7:
> > > - Document V4L2_CTRL_TYPE_RECT in vidioc-queryctrl.rst.
> > > - Rebased to media-stage master.
> > > - Do not assign each field in std_equal
> > >
> > >  .../media/v4l/vidioc-g-ext-ctrls.rst             |  4 ++++
> > >  .../userspace-api/media/v4l/vidioc-queryctrl.rst |  7 +++++++
> > >  .../media/videodev2.h.rst.exceptions             |  1 +
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c        | 16 ++++++++++++++=
+-
> > >  include/media/v4l2-ctrls.h                       |  2 ++
> > >  include/uapi/linux/videodev2.h                   |  2 ++
> > >  6 files changed, 31 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls=
.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > index f9f73530a6be..7b1001d11f9c 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > @@ -199,6 +199,10 @@ still cause this situation.
> > >        - ``p_area``
> > >        - A pointer to a struct :c:type:`v4l2_area`. Valid if this con=
trol is
> > >          of type ``V4L2_CTRL_TYPE_AREA``.
> > > +    * - struct :c:type:`v4l2_rect` *
> > > +      - ``p_rect``
> > > +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this con=
trol is
> > > +        of type ``V4L2_CTRL_TYPE_RECT``.
> > >      * - struct :c:type:`v4l2_ctrl_h264_sps` *
> > >        - ``p_h264_sps``
> > >        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if=
 this control is
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.r=
st b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > > index 4d38acafe8e1..56d5c8b0b88b 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > > @@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
> > >        - n/a
> > >        - A struct :c:type:`v4l2_area`, containing the width and the h=
eight
> > >          of a rectangular area. Units depend on the use case.
> > > +    * - ``V4L2_CTRL_TYPE_RECT``
> > > +      - n/a
> > > +      - n/a
> > > +      - n/a
> > > +      - A struct :c:type:`v4l2_rect`, containing a rectangle describ=
ed by
> > > +   the position of its top-left corner, the width and the height. Un=
its
> > > +   depend on the use case.
> > >      * - ``V4L2_CTRL_TYPE_H264_SPS``
> > >        - n/a
> > >        - n/a
> > > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.except=
ions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > index 3e58aac4ef0b..c46082ef0e4d 100644
> > > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > @@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v=
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
> > > index a662fb60f73f..f1486ab032cf 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > @@ -367,7 +367,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctr=
l *ctrl)
> > >     case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
> > >             pr_cont("AV1_FILM_GRAIN");
> > >             break;
> > > -
> > > +   case V4L2_CTRL_TYPE_RECT:
> > > +           pr_cont("%ux%u@%dx%d",
> > > +                   ptr.p_rect->width, ptr.p_rect->height,
> > > +                   ptr.p_rect->left, ptr.p_rect->top);
> > > +           break;
> > >     default:
> > >             pr_cont("unknown type %d", ctrl->type);
> > >             break;
> > > @@ -812,6 +816,7 @@ static int std_validate_compound(const struct v4l=
2_ctrl *ctrl, u32 idx,
> > >     struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> > >     struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> > >     struct v4l2_area *area;
> > > +   struct v4l2_rect *rect;
> > >     void *p =3D ptr.p + idx * ctrl->elem_size;
> > >     unsigned int i;
> > >
> > > @@ -1169,6 +1174,12 @@ static int std_validate_compound(const struct =
v4l2_ctrl *ctrl, u32 idx,
> > >                     return -EINVAL;
> > >             break;
> > >
> > > +   case V4L2_CTRL_TYPE_RECT:
> > > +           rect =3D p;
> > > +           if (!rect->width || !rect->height)
> > > +                   return -EINVAL;
> > > +           break;
> > > +
> > >     default:
> > >             return -EINVAL;
> > >     }
> > > @@ -1868,6 +1879,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v=
4l2_ctrl_handler *hdl,
> > >     case V4L2_CTRL_TYPE_AREA:
> > >             elem_size =3D sizeof(struct v4l2_area);
> > >             break;
> > > +   case V4L2_CTRL_TYPE_RECT:
> > > +           elem_size =3D sizeof(struct v4l2_rect);
> > > +           break;
> > >     default:
> > >             if (type < V4L2_CTRL_COMPOUND_TYPES)
> > >                     elem_size =3D sizeof(s32);
> > > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > > index 59679a42b3e7..b0db167a3ac4 100644
> > > --- a/include/media/v4l2-ctrls.h
> > > +++ b/include/media/v4l2-ctrls.h
> > > @@ -56,6 +56,7 @@ struct video_device;
> > >   * @p_av1_tile_group_entry:        Pointer to an AV1 tile group entr=
y structure.
> > >   * @p_av1_frame:           Pointer to an AV1 frame structure.
> > >   * @p_av1_film_grain:              Pointer to an AV1 film grain stru=
cture.
> > > + * @p_rect:                        Pointer to a rectangle.
> > >   * @p:                             Pointer to a compound value.
> > >   * @p_const:                       Pointer to a constant compound va=
lue.
> > >   */
> > > @@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
> > >     struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
> > >     struct v4l2_ctrl_av1_frame *p_av1_frame;
> > >     struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
> > > +   struct v4l2_rect *p_rect;
> > >     void *p;
> > >     const void *p_const;
> > >  };
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index c3d4e490ce7c..82d86abcf89c 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -1815,6 +1815,7 @@ struct v4l2_ext_control {
> > >             __s32 __user *p_s32;
> > >             __s64 __user *p_s64;
> > >             struct v4l2_area __user *p_area;
> > > +           struct v4l2_rect __user *p_rect;
> > >             struct v4l2_ctrl_h264_sps __user *p_h264_sps;
> > >             struct v4l2_ctrl_h264_pps *p_h264_pps;
> > >             struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scali=
ng_matrix;
> >
> > This will probably not apply cleanly anymore to the latest staging tree=
 due
> > to a change to this struct that was merged there.
> >
> > Laurent, are you planning to make a PR for this? If so, then you can fi=
x this
> > up yourself, ditto for the very small typo in patch 06/11 that I found.
>
> 'git am' complained indeed, but 'patch' was happy with a bit of fuzz.
> I've checked the result and it's all fine.
>
> I'm reviewing the rest of the series now.
>

Thanks for reviewing the series!!!! I will prepare a v15.
Should I base v15 on top of git.linuxtv.org/media_stage.git ?

Best,
Yunke

> > I'm happy with the v4l2 control changes, so this is ready to go as far =
as I am
> > concerned.
> >
> > > @@ -1883,6 +1884,7 @@ enum v4l2_ctrl_type {
> > >     V4L2_CTRL_TYPE_U16           =3D 0x0101,
> > >     V4L2_CTRL_TYPE_U32           =3D 0x0102,
> > >     V4L2_CTRL_TYPE_AREA          =3D 0x0106,
> > > +   V4L2_CTRL_TYPE_RECT          =3D 0x0107,
> > >
> > >     V4L2_CTRL_TYPE_HDR10_CLL_INFO           =3D 0x0110,
> > >     V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY  =3D 0x0111,
>
> --
> Regards,
>
> Laurent Pinchart

