Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B553B3E4BD1
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 20:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234597AbhHISEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 14:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234947AbhHISEe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 14:04:34 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FA5C0613D3;
        Mon,  9 Aug 2021 11:04:13 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b11so6424321wrx.6;
        Mon, 09 Aug 2021 11:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QtQqwt3VI+trnMEx32LMLIe8V5MgPCsexLq/UHW/lps=;
        b=GlMehTIt3clj/opou7/HNpCqR8E7xoRAnzRjV0F096VOLDGNY9Z6AW3P+DplXaIDz+
         6WH2yU6AtDoE0lBsNmJDPgSFOGL89BHxGIS9jbSVAZh3qLH7Hcchr1PlS4zqjC1fXRvG
         LRw/0w0R1QInmHmlc4p/QWzYH0TCiYfWWBxotZRyM3KPm1zqf7Avva9OkfDe4pSgCg8E
         72jdVHx3H6vGpvKnYZymzr4jXMdn+oLC/e5OxfruCfG0vrYZsUGUpIzhzZ92ml/Utthb
         ByLrtgW4ERnd4B/bKiH5z8C4yqZx8BR+ePUnX7HTI+rFiWuqUgngarXnR6T1b7ew3IAZ
         VRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QtQqwt3VI+trnMEx32LMLIe8V5MgPCsexLq/UHW/lps=;
        b=jr1k1OOvybRiKerHCdsVuOaPrGAwY4rdD/bQ+FzngonQmYdQ91wnnj9VXzOIWPNxkH
         xM+0XmkoTXq2LH8ueqU5UcjaDufXMA02M1tVryKzJyW2xYHvdRXX1Q1SfXgcVf9pehM6
         SZvXXvzTTyV098drPkqASPy+Wq7TWNpQGEYwQSAhY66oGqVC0MxtVSm5dyVA+lMgzoo9
         Z5bzAZ24kxSD2vQhT5++4IRK9/UQRrH5mU34lbfLfLvjjJp9wcdes8Kv/q0IWryviZ9w
         H1APHX/JreunK0XgrtIlOA1pLfGE40/lH9PD1uBhctVR+91hB2FL7SKws08cn5w4LVEY
         Z88w==
X-Gm-Message-State: AOAM5300gLGlDEcWPAbXObeOZycRWvSF4MxYJojRK+J2oRRR/nb7Hm4n
        QV07+Yi9V+jimDdX/qgsf8epCTSTausGAg==
X-Google-Smtp-Source: ABdhPJxPG8cvzM8MDr2R5bsDfeI9wG/Eo1v9ODMH3nlO48uHgQ/ic0QcHaH4kOr2o6bMLd3LMDn35w==
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr26545217wru.313.1628532251963;
        Mon, 09 Aug 2021 11:04:11 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id b20sm19508185wmj.48.2021.08.09.11.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 11:04:11 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <elezegarcia@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v3 05/10] media: uapi: Add VP9 stateless decoder controls
Date:   Mon, 09 Aug 2021 20:04:09 +0200
Message-ID: <5154683.x8GX3iSW2O@kista>
In-Reply-To: <20210805144246.11998-6-andrzej.p@collabora.com>
References: <20210805144246.11998-1-andrzej.p@collabora.com> <20210805144246.11998-6-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej!

Dne =C4=8Detrtek, 05. avgust 2021 ob 16:42:41 CEST je Andrzej Pietrasiewicz=
=20
napisal(a):
> Add the VP9 stateless decoder controls plus the documentation that goes
> with it.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  .../userspace-api/media/v4l/biblio.rst        |  10 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 545 ++++++++++++++++++
>  .../media/v4l/pixfmt-compressed.rst           |  15 +
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   8 +
>  .../media/v4l/vidioc-queryctrl.rst            |  12 +
>  .../media/videodev2.h.rst.exceptions          |   2 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 174 ++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   8 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/media/v4l2-ctrls.h                    |   4 +
>  include/uapi/linux/v4l2-controls.h            | 433 ++++++++++++++
>  include/uapi/linux/videodev2.h                |   6 +
>  12 files changed, 1218 insertions(+)
>=20

<snip>

> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-
controls.h
> index 5532b5f68493..8f8c3c1ad885 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2010,6 +2010,439 @@ struct v4l2_ctrl_hdr10_mastering_display {
>  	__u32 min_display_mastering_luminance;
>  };
> =20
> +/* Stateless VP9 controls */
> +
> +/**
> + * enum v4l2_vp9_loop_filter_flags - VP9 loop filter flags
> + *
> + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED: the filter level depends on
> + *	the mode and reference frame used to predict a block
> + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE: the bitstream contains=20
additional
> + *	syntax elements that specify which mode and reference frame deltas=20
are to be updated
> + *
> + * Those are the flags that may be passed to &v4l2_vp9_loop_filter.flags=
=2E See
> + * section '7.2.8 Loop filter semantics' of the VP9 specification for mo=
re
> + * details.
> + */
> +enum v4l2_vp9_loop_filter_flags {
> +	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED =3D 1 << 0,
> +	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE =3D 1 << 1,
> +};
> +
> +/**
> + * struct v4l2_vp9_loop_filter - VP9 loop filter parameters
> + *
> + * @ref_deltas: contains the adjustment needed for the filter level base=
d on=20
the chosen
> + *	reference frame. If this syntax element is not present in the=20
bitstream, users
> + *	should pass its last value.
> + * @mode_deltas: contains the adjustment needed for the filter level bas=
ed=20
on the chosen mode.
> + *	If this syntax element is not present in the bitstream, users
> + *	should pass its last value.
> + * @level: indicates the loop filter strength
> + * @sharpness: indicates the sharpness level
> + * @flags: combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags
> + * @reserved: padding field. Should be zeroed by applications.
> + *
> + * This structure contains all loop filter related parameters. See secti=
ons
> + * '7.2.8 Loop filter semantics' of the VP9 specification for more detai=
ls.
> + */
> +struct v4l2_vp9_loop_filter {
> +	__s8 ref_deltas[4];
> +	__s8 mode_deltas[2];
> +	__u8 level;
> +	__u8 sharpness;
> +	__u8 flags;
> +	__u8 reserved[7];
> +};
> +
> +/**
> + * struct v4l2_vp9_quantization - VP9 quantization parameters
> + *
> + * @base_q_idx: indicates the base frame qindex
> + * @delta_q_y_dc: indicates the Y DC quantizer relative to base_q_idx
> + * @delta_q_uv_dc: indicates the UV DC quantizer relative to base_q_idx
> + * @delta_q_uv_ac: indicates the UV AC quantizer relative to base_q_idx
> + * @reserved: padding field. Should be zeroed by applications.
> + *
> + * Encodes the quantization parameters. See section '7.2.9 Quantization=
=20
params
> + * syntax' of the VP9 specification for more details.
> + */
> +struct v4l2_vp9_quantization {
> +	__u8 base_q_idx;
> +	__s8 delta_q_y_dc;
> +	__s8 delta_q_uv_dc;
> +	__s8 delta_q_uv_ac;
> +	__u8 reserved[4];
> +};
> +
> +/**
> + * enum v4l2_vp9_segmentation_flags - VP9 segmentation flags
> + *
> + * @V4L2_VP9_SEGMENTATION_FLAG_ENABLED: indicates that this frame makes =
use=20
of
> + *	the segmentation tool
> + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP: indicates that the segmentati=
on=20
map
> + *	should be updated during the decoding of this frame
> + * @V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE: indicates that the updat=
es=20
to
> + *	the segmentation map are coded relative to the existing=20
segmentation map
> + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA: indicates that new parameter=
s=20
are
> + *	about to be specified for each segment
> + * @V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE: indicates that the
> + *	segmentation parameters represent the actual values to be used
> + *
> + * Those are the flags that may be passed to &v4l2_vp9_segmentation.flag=
s.=20
See
> + * section '7.2.10 Segmentation params syntax' of the VP9 specification =
for
> + * more details.
> + */
> +enum v4l2_vp9_segmentation_flags {
> +	V4L2_VP9_SEGMENTATION_FLAG_ENABLED =3D 1 << 0,
> +	V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP =3D 1 << 1,
> +	V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE =3D 1 << 2,
> +	V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA =3D 1 << 3,
> +	V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE =3D 1 << 4,
> +};
> +
> +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED(id)	(1 << (id))
> +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED_MASK	0xf
> +
> +/**
> + * enum v4l2_vp9_segment_feature - VP9 segment feature IDs
> + *
> + * @V4L2_VP9_SEG_LVL_ALT_Q: quantizer segment feature
> + * @V4L2_VP9_SEG_LVL_ALT_L: loop filter segment feature
> + * @V4L2_VP9_SEG_LVL_REF_FRAME reference frame segment feature
> + * @V4L2_VP9_SEG_LVL_SKIP: skip segment feature
> + * @V4L2_VP9_SEG_LVV_MAX: number of segment features
> + *
> + * Segment feature IDs. See section '7.2.10 Segmentation params syntax' =
of=20
the
> + * VP9 specification for more details.
> + */
> +enum v4l2_vp9_segment_feature {
> +	V4L2_VP9_SEG_LVL_ALT_Q,
> +	V4L2_VP9_SEG_LVL_ALT_L,
> +	V4L2_VP9_SEG_LVL_REF_FRAME,
> +	V4L2_VP9_SEG_LVL_SKIP,
> +	V4L2_VP9_SEG_LVL_MAX,
> +};

What is the reason not to assign values like 1 << 0, 1 << 1, etc. and inste=
ad=20
provide separate macro V4L2_VP9_SEGMENT_FEATURE_ENABLED()? This is a depart=
ure=20
from current practice.

> +
> +/**
> + * struct v4l2_vp9_segmentation - VP9 segmentation parameters
> + *
> + * @feature_data: data attached to each feature. Data entry is only vali=
d=20
if the feature is enabled
> + * @feature_enabled: bitmask defining which features are enabled in each=
=20
segment
> + * @tree_probs: specifies the probability values to be used when
> + *	decoding a Segment-ID. See '5.15. Segmentation map' section of the=20
VP9 specification
> + *	for more details.
> + * @pred_probs: specifies the probability values to be used when decodin=
g a
> + *	Predicted-Segment-ID. See '6.4.14. Get segment id syntax' section=20
of :ref:`vp9`
> + *	for more details.
> + * @flags: combination of V4L2_VP9_SEGMENTATION_FLAG_* flags
> + * @reserved: padding field. Should be zeroed by applications.
> + *
> + * Encodes the quantization parameters. See section '7.2.10 Segmentation=
=20
params syntax' of
> + * the VP9 specification for more details.
> + */
> +struct v4l2_vp9_segmentation {
> +	__s16 feature_data[8][4];
> +	__u8 feature_enabled[8];
> +	__u8 tree_probs[7];
> +	__u8 pred_probs[3];
> +	__u8 flags;
> +	__u8 reserved[5];
> +};
> +
> +/**
> + * enum v4l2_vp9_intra_prediction_mode - VP9 Intra prediction modes
> + *
> + * @V4L2_VP9_INTRA_PRED_MODE_DC_PRED: DC intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_V_PRED: vertical intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_H_PRED: horizontal intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D45_PRED: D45 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D135_PRED: D135 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D117_PRED: D117 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D153_PRED: D153 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D207_PRED: D207 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D63_PRED: D63 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_TM_PRED: True Motion intra prediction
> + *
> + * See section '7.4.5 Intra frame mode info semantics' for more details.
> + */
> +enum v4l2_vp9_intra_prediction_mode {
> +	V4L2_VP9_INTRA_PRED_MODE_DC_PRED,
> +	V4L2_VP9_INTRA_PRED_MODE_V_PRED,
> +	V4L2_VP9_INTRA_PRED_MODE_H_PRED,
> +	V4L2_VP9_INTRA_PRED_MODE_D45_PRED,
> +	V4L2_VP9_INTRA_PRED_MODE_D135_PRED,
> +	V4L2_VP9_INTRA_PRED_MODE_D117_PRED,
> +	V4L2_VP9_INTRA_PRED_MODE_D153_PRED,
> +	V4L2_VP9_INTRA_PRED_MODE_D207_PRED,
> +	V4L2_VP9_INTRA_PRED_MODE_D63_PRED,
> +	V4L2_VP9_INTRA_PRED_MODE_TM_PRED,
> +};

I dislike using enums without assigning values. I see that historically (at=
=20
the beginning of this file), values were always assigned. However, if=20
maintainers agree with you, that's fine by me.

> +
> +/**
> + * enum v4l2_vp9_reset_frame_context - Valid values for
> + *			&v4l2_ctrl_vp9_frame->reset_frame_context
> + *
> + * @V4L2_VP9_RESET_FRAME_CTX_NONE: don't reset any frame context
> + * @V4L2_VP9_RESET_FRAME_CTX_SPEC: reset the frame context pointed by
> + *	&v4l2_ctrl_vp9_frame.frame_context_idx
> + * @V4L2_VP9_RESET_FRAME_CTX_ALL: reset all frame contexts
> + *
> + * See section '7.2 Uncompressed header semantics' of the VP9 specificat=
ion=20
for more details.
> + */
> +enum v4l2_vp9_reset_frame_context {
> +	V4L2_VP9_RESET_FRAME_CTX_NONE,
> +	V4L2_VP9_RESET_FRAME_CTX_SPEC,
> +	V4L2_VP9_RESET_FRAME_CTX_ALL,
> +};
> +
> +/**
> + * enum v4l2_vp9_interpolation_filter - VP9 interpolation filter types
> + *
> + * @V4L2_VP9_INTERP_FILTER_EIGHTTAP: eight tap filter
> + * @V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH: eight tap smooth filter
> + * @V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP: eight tap sharp filter
> + * @V4L2_VP9_INTERP_FILTER_BILINEAR: bilinear filter
> + * @V4L2_VP9_INTERP_FILTER_SWITCHABLE: filter selection is signaled at t=
he=20
block level
> + *
> + * See section '7.2.7 Interpolation filter semantics' of the VP9=20
specification
> + * for more details.
> + */
> +enum v4l2_vp9_interpolation_filter {
> +	V4L2_VP9_INTERP_FILTER_EIGHTTAP,
> +	V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH,
> +	V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP,
> +	V4L2_VP9_INTERP_FILTER_BILINEAR,
> +	V4L2_VP9_INTERP_FILTER_SWITCHABLE,
> +};
> +
> +/**
> + * enum v4l2_vp9_reference_mode - VP9 reference modes
> + *
> + * @V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE: indicates that all the int=
er=20
blocks use only a
> + *	single reference frame to generate motion compensated prediction
> + * @V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE: requires all the inter=20
blocks to use compound mode.
> + *	Single reference frame prediction is not allowed
> + * @V4L2_VP9_REFERENCE_MODE_SELECT: allows each individual inter block t=
o=20
select between single
> + *	and compound prediction modes
> + *
> + * See section '7.3.6 Frame reference mode semantics' of the VP9=20
specification
> + * for more details.
> + */
> +enum v4l2_vp9_reference_mode {
> +	V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE,
> +	V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE,
> +	V4L2_VP9_REFERENCE_MODE_SELECT,
> +};
> +
> +/**
> + * enum v4l2_vp9_tx_mode - VP9 TX modes
> + *
> + * @V4L2_VP9_TX_MODE_ONLY_4X4: transform size is 4x4
> + * @V4L2_VP9_TX_MODE_ALLOW_8X8: transform size can be up to 8x8
> + * @V4L2_VP9_TX_MODE_ALLOW_16X16: transform size can be up to 16x16
> + * @V4L2_VP9_TX_MODE_ALLOW_32X32: transform size can be up to 32x32
> + * @V4L2_VP9_TX_MODE_SELECT: bitstream contains the transform size for e=
ach=20
block
> + *
> + * See section '7.3.1 Tx mode semantics' of the VP9 specification for mo=
re=20
details.
> + */
> +enum v4l2_vp9_tx_mode {
> +	V4L2_VP9_TX_MODE_ONLY_4X4,
> +	V4L2_VP9_TX_MODE_ALLOW_8X8,
> +	V4L2_VP9_TX_MODE_ALLOW_16X16,
> +	V4L2_VP9_TX_MODE_ALLOW_32X32,
> +	V4L2_VP9_TX_MODE_SELECT,
> +};
> +
> +/**
> + * enum v4l2_vp9_frame_flags - VP9 frame flags
> + * @V4L2_VP9_FRAME_FLAG_KEY_FRAME: the frame is a key frame
> + * @V4L2_VP9_FRAME_FLAG_SHOW_FRAME: the frame should be displayed
> + * @V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT: the decoding should be error=20
resilient
> + * @V4L2_VP9_FRAME_FLAG_INTRA_ONLY: the frame does not reference other=20
frames
> + * @V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV: the frame can use high=20
precision motion vectors
> + * @V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX: frame context should be updat=
ed=20
after decoding
> + * @V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE: parallel decoding is used
> + * @V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING: vertical subsampling is enabled
> + * @V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING: horizontal subsampling is enabled
> + * @V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING: full UV range is used
> + *
> + * Check the VP9 specification for more details.
> + */
> +enum v4l2_vp9_frame_flags {
> +	V4L2_VP9_FRAME_FLAG_KEY_FRAME =3D 1 << 0,
> +	V4L2_VP9_FRAME_FLAG_SHOW_FRAME =3D 1 << 1,
> +	V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT =3D 1 << 2,
> +	V4L2_VP9_FRAME_FLAG_INTRA_ONLY =3D 1 << 3,
> +	V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV =3D 1 << 4,
> +	V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX =3D 1 << 5,
> +	V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE =3D 1 << 6,
> +	V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING =3D 1 << 7,
> +	V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING =3D 1 << 8,
> +	V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING =3D 1 << 9,
> +};
> +
> +/**
> + * enum v4l2_vp9_ref_frame_sign_bias - Whether ref_frame_sign_bias is 1 =
for=20
a given reference frame
> + * @V4L2_VP9_SIGN_BIAS_LAST: ref_frame_sign_bias is 1 for the "last"=20
reference frame
> + * @V4L2_VP9_SIGN_BIAS_GOLDEN: ref_frame_sign_bias is 1 for the "golden"=
=20
reference frame
> + * @V4L2_VP9_SIGN_BIAS_ALT: ref_frame_sign_bias is 1 for the "alt"=20
reference frame
> + */
> +
> +enum v4l2_vp9_ref_frame_sign_bias {
> +	V4L2_VP9_SIGN_BIAS_LAST,
> +	V4L2_VP9_SIGN_BIAS_GOLDEN,
> +	V4L2_VP9_SIGN_BIAS_ALT,
> +};

As I mentioned before, you probably want to assign values here, since value=
s=20
are used as bitmap.

> +
> +#define V4L2_VP9_PROFILE_MAX		3
> +
> +#define V4L2_CID_STATELESS_VP9_FRAME	(V4L2_CID_CODEC_STATELESS_BASE +=20
300)
> +/**
> + * struct v4l2_ctrl_vp9_frame - VP9 frame decoding control
> + *
> + * @lf: loop filter parameters. See &v4l2_vp9_loop_filter for more detai=
ls
> + * @quant: quantization parameters. See &v4l2_vp9_quantization for more=
=20
details
> + * @seg: segmentation parameters. See &v4l2_vp9_segmentation for more=20
details
> + * @flags: combination of V4L2_VP9_FRAME_FLAG_* flags
> + * @compressed_header_size: compressed header size in bytes
> + * @uncompressed_header_size: uncompressed header size in bytes
> + * @frame_width_minus_1: add 1 to it and you'll get the frame width=20
expressed in pixels
> + * @frame_height_minus_1: add 1 to it and you'll get the frame height=20
expressed in pixels
> + * @render_width_minus_1: add 1 to it and you'll get the expected render=
=20
width expressed in
> + *	pixels. This is not used during the decoding process but might be=20
used by HW scalers
> + *	to prepare a frame that's ready for scanout
> + * @render_height_minus_1: add 1 to it and you'll get the expected rende=
r=20
height expressed in
> + *	pixels. This is not used during the decoding process but might be=20
used by HW scalers
> + *	to prepare a frame that's ready for scanout
> + * @last_frame_ts: "last" reference buffer timestamp.
> + * The timestamp refers to the timestamp field in struct v4l2_buffer.
> + * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
> + * @golden_frame_ts: "golden" reference buffer timestamp.
> + * The timestamp refers to the timestamp field in struct v4l2_buffer.
> + * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
> + * @alt_frame_ts: "alt" reference buffer timestamp.
> + * The timestamp refers to the timestamp field in struct v4l2_buffer.
> + * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
> + * @ref_frame_sign_bias: a bitfield specifying whether the sign bias is =
set=20
for a given
> + *	reference frame. See &v4l2_vp9_ref_frame_sign_bias for more=20
details.
> + * @reset_frame_context: specifies whether the frame context should be r=
eset=20
to default values.
> + *	See &v4l2_vp9_reset_frame_context for more details
> + * @frame_context_idx: frame context that should be used/updated
> + * @profile: VP9 profile. Can be 0, 1, 2 or 3
> + * @bit_depth: bits per components. Can be 8, 10 or 12. Note that not al=
l=20
profiles support
> + *	10 and/or 12 bits depths
> + * @interpolation_filter: specifies the filter selection used for perfor=
ming=20
inter prediction.
> + *	See &v4l2_vp9_interpolation_filter for more details
> + * @tile_cols_log2: specifies the base 2 logarithm of the width of each =
tile=20
(where the width
> + *	is measured in units of 8x8 blocks). Shall be less than or equal=20
to 6
> + * @tile_rows_log2: specifies the base 2 logarithm of the height of each=
=20
tile (where the height
> + *	is measured in units of 8x8 blocks)
> + * @tx_mode: specifies the TX mode. See &v4l2_vp9_tx_mode for more detai=
ls
> + * @reference_mode: specifies the type of inter prediction to be used. S=
ee
> + *	&v4l2_vp9_reference_mode for more details
> + * @reserved: padding field. Should be zeroed by applications.
> + */
> +struct v4l2_ctrl_vp9_frame {
> +	struct v4l2_vp9_loop_filter lf;
> +	struct v4l2_vp9_quantization quant;
> +	struct v4l2_vp9_segmentation seg;
> +	__u32 flags;
> +	__u16 compressed_header_size;
> +	__u16 uncompressed_header_size;
> +	__u16 frame_width_minus_1;
> +	__u16 frame_height_minus_1;
> +	__u16 render_width_minus_1;
> +	__u16 render_height_minus_1;
> +	__u64 last_frame_ts;
> +	__u64 golden_frame_ts;
> +	__u64 alt_frame_ts;
> +	__u8 ref_frame_sign_bias;
> +	__u8 reset_frame_context;
> +	__u8 frame_context_idx;
> +	__u8 profile;
> +	__u8 bit_depth;
> +	__u8 interpolation_filter;
> +	__u8 tile_cols_log2;
> +	__u8 tile_rows_log2;
> +	__u8 tx_mode;

AFAICS, TX mode is part of compressed header in chapter 6.3.1. Any reason i=
t's=20
here and not in  v4l2_ctrl_vp9_compressed_hdr_probs?

> +	__u8 reference_mode;
> +	__u8 reserved[6];
> +};
> +
> +#define V4L2_VP9_NUM_FRAME_CTX	4
> +
> +/**
> + * struct v4l2_vp9_mv_compressed_hdr_probs - VP9 Motion vector probabili=
ty=20
updates
> + * @joint: motion vector joint probability updates
> + * @sign: motion vector sign probability updates
> + * @classes: motion vector class probability updates
> + * @class0_bit: motion vector class0 bit probability updates
> + * @bits: motion vector bits probability updates
> + * @class0_fr: motion vector class0 fractional bit probability updates
> + * @fr: motion vector fractional bit probability updates
> + * @class0_hp: motion vector class0 high precision fractional bit=20
probability updates
> + * @hp: motion vector high precision fractional bit probability updates
> + *
> + * This structure contains new values of motion vector probabilities.
> + * A value of zero in an array element means there is no update of the=20
relevant probability.
> + * See `struct v4l2_vp9_prob_updates` for details.
> + */
> +struct v4l2_vp9_mv_compressed_hdr_probs {
> +	__u8 joint[3];
> +	__u8 sign[2];
> +	__u8 classes[2][10];
> +	__u8 class0_bit[2];
> +	__u8 bits[2][10];
> +	__u8 class0_fr[2][2][3];
> +	__u8 fr[2][3];
> +	__u8 class0_hp[2];
> +	__u8 hp[2];
> +};
> +
> +#define V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS=09
(V4L2_CID_CODEC_STATELESS_BASE + 301)
> +/**
> + * struct v4l2_ctrl_vp9_compressed_hdr_probs - VP9 probability updates=20
control
> + * @tx8: TX 8x8 probability updates
> + * @tx16: TX 16x16 probability updates
> + * @tx32: TX 32x32 probability updates
> + * @coef: coefficient probability updates
> + * @skip: skip probability updates
> + * @inter_mode: inter mode probability updates
> + * @interp_filter: interpolation filter probability updates
> + * @is_inter: is inter-block probability updates
> + * @comp_mode: compound prediction mode probability updates
> + * @single_ref: single ref probability updates
> + * @comp_ref: compound ref probability updates
> + * @y_mode: Y prediction mode probability updates
> + * @uv_mode: UV prediction mode probability updates
> + * @partition: partition probability updates
> + * @mv: motion vector probability updates
> + *
> + * This structure holds the probabilities update as parsed in the=20
compressed
> + * header (Spec 6.3). These values represent the value of probability=20
update after
> + * being translated with inv_map_table[] (see 6.3.5). A value of zero in=
 an=20
array element
> + * means that there is no update of the relevant probability.
> + */
> +struct v4l2_ctrl_vp9_compressed_hdr_probs {
> +	__u8 tx8[2][1];
> +	__u8 tx16[2][2];
> +	__u8 tx32[2][3];
> +	__u8 coef[4][2][2][6][6][3];
> +	__u8 skip[3];
> +	__u8 inter_mode[7][3];
> +	__u8 interp_filter[4][2];
> +	__u8 is_inter[4];
> +	__u8 comp_mode[5];
> +	__u8 single_ref[5][2];
> +	__u8 comp_ref[5];
> +	__u8 y_mode[4][9];
> +	__u8 uv_mode[10][9];
> +	__u8 partition[16][3];
> +
> +	struct v4l2_vp9_mv_compressed_hdr_probs mv;

v4l2_ctrl_vp9_compressed_hdr_probs and v4l2_vp9_mv_compressed_hdr_probs are=
 so=20
confusingly similar, it's easy to mess up quickly. Can we find more distinc=
t=20
names?

Note, I just skimmed this patch, maybe I'll have some more questions later.=
=20
Great work!

Best regards,
Jernej

> +};
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 58392dcd3bf5..4abe4362519e 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -703,6 +703,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
>  #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 pa=
rsed=20
frame */
>  #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
> +#define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* VP9 pa=
rsed=20
frame */
>  #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC ak=
a H.
265 */
>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Wa=
lsh=20
Hadamard Transform (vicodec) */
>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') =
/*=20
Stateless FWHT (vicodec) */
> @@ -1755,6 +1756,8 @@ struct v4l2_ext_control {
>  		struct v4l2_ctrl_mpeg2_sequence __user=20
*p_mpeg2_sequence;
>  		struct v4l2_ctrl_mpeg2_picture __user *p_mpeg2_picture;
>  		struct v4l2_ctrl_mpeg2_quantisation __user=20
*p_mpeg2_quantisation;
> +		struct v4l2_ctrl_vp9_compressed_hdr_probs __user=20
*p_vp9_compressed_hdr_probs;
> +		struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
>  		void __user *ptr;
>  	};
>  } __attribute__ ((packed));
> @@ -1819,6 +1822,9 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_MPEG2_QUANTISATION   =3D 0x0250,
>  	V4L2_CTRL_TYPE_MPEG2_SEQUENCE       =3D 0x0251,
>  	V4L2_CTRL_TYPE_MPEG2_PICTURE        =3D 0x0252,
> +
> +	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS	=3D 0x0260,
> +	V4L2_CTRL_TYPE_VP9_FRAME		=3D 0x0261,
>  };
> =20
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> --=20
> 2.17.1
>=20
>=20



