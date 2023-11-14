Return-Path: <linux-media+bounces-351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EAE7EB939
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 23:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 536281C20B18
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 22:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA2E2E83A;
	Tue, 14 Nov 2023 22:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kfg5w9D7"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E302E82F
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 22:19:15 +0000 (UTC)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91AD3DF
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 14:19:13 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-45da9f949aaso2296714137.2
        for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 14:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700000352; x=1700605152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WCe0Da2+L6J7M0askrFLSj0kBp+5PK3HRVAorye/pE=;
        b=kfg5w9D7vcfPmXss9RaTofzwzli/yNJN0Rb2BnPYAWimuhEhEYZm9dQbGZOh4Vr6yv
         5FFJm7Pc02LyIkBwA9bd4iXL4xY6wepgXK7jRXjfoUi6LYsUbQ80RPF1wthyft1PqFr1
         Rm7JnK/wnAPhi3CurR3ouSDKQIQteTdM8puFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700000352; x=1700605152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WCe0Da2+L6J7M0askrFLSj0kBp+5PK3HRVAorye/pE=;
        b=KVWb3GmeRwTywJXsr/odF4iYUztPISU1MPmH8Smtdx6lMkO4u3yIMT6WVBEb1R3WIl
         EQHVKNKR8caOJFY3qPCnqgSH+yOR5M8Jb69noo1Qhe1y7+6ZuPrzeQT0NLVTyS8KaXkJ
         f1sQlNRf7jt6VYgLUFvtG1/p7Keqgnnk6+xTgyRaTpQfuzi8mWwnBMczTQ54scLGknIS
         BMwnmHwBNm6IvXybWw4C9HBcc4XiB0Tae4REqSMfhqBp2/xaPClnDJEUM0mJP4r6PMvC
         WLFusfjUIDL/l308G/9upx8RpIvuqHsMmYLc6fFjraIVAYluyLDDjBiRZNYd+Y1x9671
         xYXw==
X-Gm-Message-State: AOJu0YwkEpVSimmZmbd6rze/EoVXvDT0/W4QQnmTqlJi2h1aU/RxkTFm
	tidevTR5WEP9BWpeD+UT+HNxqcPczsjqBs89PkMzpg==
X-Google-Smtp-Source: AGHT+IFjHb+hp+O/G4FrhHR6As75cYlzId89ZTMnRj4s1m376FHj5QjcwiKDd6nzu9PQ9VYzddR4rUzBGdp0fKJq/X0=
X-Received: by 2002:a67:e08b:0:b0:45d:b889:3770 with SMTP id
 f11-20020a67e08b000000b0045db8893770mr9765796vsl.1.1700000352521; Tue, 14 Nov
 2023 14:19:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231004103720.3540436-1-hugues.fruchet@foss.st.com> <20231004103720.3540436-2-hugues.fruchet@foss.st.com>
In-Reply-To: <20231004103720.3540436-2-hugues.fruchet@foss.st.com>
From: Steve Cho <stevecho@chromium.org>
Date: Tue, 14 Nov 2023 14:19:01 -0800
Message-ID: <CAC-pXoMMsvNG2PCzKbgmBNev6dmPhJb15hJi=W=fki4cSZcupg@mail.gmail.com>
Subject: Re: [RFC 1/6] media: uapi: Add VP8 stateless encoder controls
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Marco Felsch <m.felsch@pengutronix.de>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Few comments.

> +               if (p_vp8_encode_params->loop_filter_level > 63)
> +                       return -EINVAL;
> +
> +               if (p_vp8_encode_params->sharpness_level > 7)
> +                       return -EINVAL;

Can we define these magic numbers 63, 7?


> +       case V4L2_CID_STATELESS_VP8_ENCODE_QP:                  return "V=
P8 Encode QP";

Can we add more details about this CID? Or let me know if I missed it
somewhere in the series.


> +#define V4L2_CID_STATELESS_VP8_ENCODE_PARAMS   (V4L2_CID_CODEC_STATELESS=
_BASE + 601)

Can we put 2 CIDs in the same place? I think it is more readable that
way. I also see that was the case for HEVC.
https://git.linuxtv.org/media_tree.git/tree/include/uapi/linux/v4l2-control=
s.h?h=3Dmaster&id=3Dc91fd7b7a8ae17ab8be0b6e765e4a38783749330#n2062


> + * @loop_filter_level: sets the strength of the applied loop filter.
> + *                    Set to a value from the rage 0..63.

typo s/rage/range/


> + * @copy_buffer_to_alternate: specifies the atlref frame refresh strateg=
y.
> + *                           Set to one of V4L2_VP8_FRAME_FLAG_ALTREF_{}=
.

nit: typo s/atlref/altref/

On Wed, Oct 4, 2023 at 3:37=E2=80=AFAM Hugues Fruchet
<hugues.fruchet@foss.st.com> wrote:
>
> From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>
> Add uAPI for stateless VP8 encoders.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 13 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c |  5 ++
>  include/media/v4l2-ctrls.h                |  2 +
>  include/uapi/linux/v4l2-controls.h        | 91 +++++++++++++++++++++++
>  include/uapi/linux/videodev2.h            |  3 +
>  5 files changed, 114 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index a662fb60f73f..c7799ceb3d6d 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -811,6 +811,7 @@ static int std_validate_compound(const struct v4l2_ct=
rl *ctrl, u32 idx,
>         struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>         struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>         struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> +       struct v4l2_ctrl_vp8_encode_params *p_vp8_encode_params;
>         struct v4l2_area *area;
>         void *p =3D ptr.p + idx * ctrl->elem_size;
>         unsigned int i;
> @@ -1047,6 +1048,15 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
>                 zero_padding(p_vp8_frame->coder_state);
>                 break;
>
> +       case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> +               p_vp8_encode_params =3D p;
> +               if (p_vp8_encode_params->loop_filter_level > 63)
> +                       return -EINVAL;
> +
> +               if (p_vp8_encode_params->sharpness_level > 7)
> +                       return -EINVAL;
> +               break;
> +
>         case V4L2_CTRL_TYPE_HEVC_SPS:
>                 p_hevc_sps =3D p;
>
> @@ -1868,6 +1878,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_=
ctrl_handler *hdl,
>         case V4L2_CTRL_TYPE_AREA:
>                 elem_size =3D sizeof(struct v4l2_area);
>                 break;
> +       case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> +               elem_size =3D sizeof(struct v4l2_ctrl_vp8_encode_params);
> +               break;
>         default:
>                 if (type < V4L2_CTRL_COMPOUND_TYPES)
>                         elem_size =3D sizeof(s32);
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index 8696eb1cdd61..bd26f1d89bd5 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1236,6 +1236,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:           return "A=
V1 Tile Group Entry";
>         case V4L2_CID_STATELESS_AV1_FRAME:                      return "A=
V1 Frame Parameters";
>         case V4L2_CID_STATELESS_AV1_FILM_GRAIN:                 return "A=
V1 Film Grain";
> +       case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:              return "V=
P8 Encode Parameters";
> +       case V4L2_CID_STATELESS_VP8_ENCODE_QP:                  return "V=
P8 Encode QP";
>
>         /* Colorimetry controls */
>         /* Keep the order of the 'case's the same as in v4l2-controls.h! =
*/
> @@ -1592,6 +1594,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>         case V4L2_CID_STATELESS_AV1_FILM_GRAIN:
>                 *type =3D V4L2_CTRL_TYPE_AV1_FILM_GRAIN;
>                 break;
> +       case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:
> +               *type =3D V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS;
> +               break;
>         case V4L2_CID_UNIT_CELL_SIZE:
>                 *type =3D V4L2_CTRL_TYPE_AREA;
>                 *flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 59679a42b3e7..a165719e1139 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -56,6 +56,7 @@ struct video_device;
>   * @p_av1_tile_group_entry:    Pointer to an AV1 tile group entry struct=
ure.
>   * @p_av1_frame:               Pointer to an AV1 frame structure.
>   * @p_av1_film_grain:          Pointer to an AV1 film grain structure.
> + * @p_vp8_encode_params:       Pointer to a VP8 encode parameter structu=
re.
>   * @p:                         Pointer to a compound value.
>   * @p_const:                   Pointer to a constant compound value.
>   */
> @@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
>         struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
>         struct v4l2_ctrl_av1_frame *p_av1_frame;
>         struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
> +       struct v4l2_ctrl_vp8_encode_params *p_vp8_encode_params;
>         void *p;
>         const void *p_const;
>  };
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index c3604a0a3e30..fdec5764e09c 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -3479,6 +3479,97 @@ struct v4l2_ctrl_av1_film_grain {
>         __u8 reserved[4];
>  };
>
> +#define V4L2_CID_STATELESS_VP8_ENCODE_PARAMS   (V4L2_CID_CODEC_STATELESS=
_BASE + 601)
> +
> +#define V4L2_VP8_FRAME_FLAG_SHOWFRAME                  0x1
> +#define V4L2_VP8_FRAME_FLAG_GOLDEN_REFRESH             0x2
> +#define V4L2_VP8_FRAME_FLAG_ALTREF_REFRESH             0x4
> +#define V4L2_VP8_FRAME_FLAG_SEGMENT_ENABLED            0x8
> +#define V4L2_VP8_FRAME_FLAG_LOOP_FILTER_ADJ_ENABLED    0x10
> +#define V4L2_VP8_FRAME_FLAG_REFRESH_ENTROPY_PROBS      0x20
> +
> +#define V4L2_VP8_FRAME_TYPE_KEYFRAME   0
> +#define V4L2_VP8_FRAME_TYPE_INTER      1
> +
> +#define V4L2_VP8_FRAME_COLOR_SPACE_YUV         0
> +#define V4L2_VP8_FRAME_COLOR_SPACE_RESERVED    1
> +
> +#define V4L2_VP8_FRAME_CLAMPING_REQUIRED       0
> +#define V4L2_VP8_FRAME_CLAMPING_NO             1
> +
> +#define V4L2_VP8_FRAME_FILTER_TYPE_NORMAL      0
> +#define V4L2_VP8_FRAME_FILTER_TYPE_SIMPLE      1
> +
> +#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_1    0
> +#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_2    1
> +#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_4    2
> +#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_8    3
> +
> +#define V4L2_VP8_FRAME_GOLDEN_KEEP             0
> +#define V4L2_VP8_FRAME_GOLDEN_LASTFRAME                1
> +#define V4L2_VP8_FRAME_GOLDEN_ALTREF           2
> +
> +#define V4L2_VP8_FRAME_ALTREF_KEEP             0
> +#define V4L2_VP8_FRAME_ALTREF_LASTFRAME                1
> +#define V4L2_VP8_FRAME_ALTREF_GOLDEN           2
> +
> +#define V4L2_VP8_FRAME_REF_LAST                0
> +#define V4L2_VP8_FRAME_REF_GOLDEN      1
> +#define V4L2_VP8_FRAME_REF_ALT         2
> +
> +/**
> + * struct v4l2_ctrl_vp8_encode_params - VP8 encode parameters
> + * @flags: combination of V4L2_VP8_FRAME_FLAG_{} flags.
> + * @frame_type: specifies the frame type (key or inter).
> + *             Set to one of V4L2_VP8_FRAME_TYPE_{}.
> + * @color_space: defines the YUV color space of the sequence.
> + *              V4L2_VP8_FRAME_TYPE_INTER frames shall set this field to=
 zero.
> + *              Set to one of V4L2_VP8_FRAME_COLOR_SPACE_{}.
> + * @clamping_type: defines pixel value clamping type.
> + *                V4L2_VP8_FRAME_TYPE_INTER frames shall set this field =
to zero.
> + *                Set to one of V4L2_VP8_FRAME_CLAMPING_{}.
> + * @loop_filter_type: selects the type of loop filter applied.
> + *                   Set to one of V4L2_VP8_FRAME_FILTER_TYPE_{}.
> + * @loop_filter_level: sets the strength of the applied loop filter.
> + *                    Set to a value from the rage 0..63.
> + * @sharpness_level: sets the sharpness of the applied loop filter.
> + *                  Set to a value from the range 0..7.
> + * @log2_nbr_of_dct_partitions: determines the number of separate partit=
ions
> + *                             containing the DCT coefficients of macrob=
locks.
> + *                             Set to one of V4L2_VP8_FRAME_NBR_DCT_PART=
ITIONS_{}.
> + * @prob_intra: indicates the probability of an intra macroblock.
> + *             Set to a value from the range 0..255.
> + * @prob_last: indicates the probability that the last reference frame i=
s used for inter-prediction.
> + *            Set to a value from the range 0..255.
> + * @prob_gf: indicates the probability that the golden reference frame i=
s used for inter-prediction.
> + *          Set to a value from the range 0..255.
> + * @copy_buffer_to_golden: specifies the golden frame refresh strategy.
> + *                        Set to one of V4L2_VP8_FRAME_FLAG_GOLDEN_{}.
> + * @copy_buffer_to_alternate: specifies the atlref frame refresh strateg=
y.
> + *                           Set to one of V4L2_VP8_FRAME_FLAG_ALTREF_{}=
.
> + * @reference_type: specifies what kind of reference to use for current =
inter frame.
> + *                 V4L2_VP8_FRAME_TYPE_KEYFRAME shall set this field to =
zero.
> + *                 Set to one of V4L2_VP8_FRAME_REF_{}.
> + */
> +struct v4l2_ctrl_vp8_encode_params {
> +       __u32 flags;
> +       __u8 frame_type;
> +       __u8 color_space;
> +       __u8 clamping_type;
> +       __u8 loop_filter_type;
> +       __u8 loop_filter_level;
> +       __u8 sharpness_level;
> +       __u8 log2_nbr_of_dct_partitions;
> +       __u8 prob_intra;
> +       __u8 prob_last;
> +       __u8 prob_gf;
> +       __u8 copy_buffer_to_golden;
> +       __u8 copy_buffer_to_alternate;
> +       __u8 reference_type;
> +};
> +
> +#define V4L2_CID_STATELESS_VP8_ENCODE_QP       (V4L2_CID_CODEC_STATELESS=
_BASE + 602)
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 78260e5d9985..b3cbdc60b82c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1836,6 +1836,7 @@ struct v4l2_ext_control {
>                 struct v4l2_ctrl_av1_tile_group_entry __user *p_av1_tile_=
group_entry;
>                 struct v4l2_ctrl_av1_frame __user *p_av1_frame;
>                 struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
> +               struct v4l2_ctrl_vp8_encode_params __user *p_vp8_encode_p=
arams;
>                 void __user *ptr;
>         };
>  } __attribute__ ((packed));
> @@ -1914,6 +1915,8 @@ enum v4l2_ctrl_type {
>         V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY =3D 0x281,
>         V4L2_CTRL_TYPE_AV1_FRAME            =3D 0x282,
>         V4L2_CTRL_TYPE_AV1_FILM_GRAIN       =3D 0x283,
> +
> +       V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS        =3D 0x0290,
>  };
>
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> --
> 2.25.1
>

