Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3973321CDC
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhBVQZ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbhBVQZi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:25:38 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48472C061794
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:24:33 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l13so5399739wmg.5
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=xYlpWgo9JgM9ggwc0YguwUCYCQjS6c9fxIjTEddMvis=;
        b=qPpQZ3in0qSU7j52l5j7j1wWr+gMqVCwwSBrTpimLxU1/RXpHAPdnYX3gqCllLiAkW
         wOrnolaeJ5N8m5s+BpDRcvK3TraOgFx0JePnjs+YUUnlAC/ycyYfko9QFzLcxtuQFE6E
         w9n4ln4nrd3kTEvnhL8wq7SNI4zvilOWmgIGqHUejLZ1IISjdgLP4GVk9gdmwHON2hvS
         LvNPCv5v13bGHI0mofBKM/eSbPf/YTioeP9JBKHOrq/jNOV1fitAQbzsGtJV7WQ8rYEm
         dOlXVoiEBef1atarmYRGnkan0z3HhCvgmfo6gk1ITGRVU1AtF6cHA64yWDCcEPbWFKCS
         QB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=xYlpWgo9JgM9ggwc0YguwUCYCQjS6c9fxIjTEddMvis=;
        b=sPGQql1/Ov6rs+tRHeBm0ypp3oYjy+Z+nxl7cmPtfvZv8LEI/kL4ysyhRMZdUAueam
         h9yBZrIlvuHK4/gPfHkYE5KJS4XWn0zMjMB+k8H450CIys9ndIVyePdfzViHmFFzWXQ9
         pr4gwtxITJuCLzPE0k5UqfUX6EOSVzKM9h/+znF6jJysMiS+BEJJKsNuYh1lrmj1wZE0
         hltr0iJncwANI/3sAVQrCsgYRa3fuAXtFnIrIrbtFd5LV9b+Djoxuff3+tQ0hb3GBDBG
         LEFzyP36OSy2cHoRFCcoPboVAmFQKVAa4Zco/nllwSkbE6FTwdqLP/cjoL8AAyuT8Wug
         ePxA==
X-Gm-Message-State: AOAM533uAC61kmb9FvEdEYHgUFgHXrxZxfhN5ZI04bJs0hM8ghcY2w6f
        8bNGW2UZoLwGAcXLTE8jqYNhwQ==
X-Google-Smtp-Source: ABdhPJwlI29Mg9yLFhZ0Av1dNoE8tDZ3aDWT3OKfO5PfhW/H3uD0qQYCM6ImmIcZXEWfgtP7PBuDAg==
X-Received: by 2002:a7b:cb4f:: with SMTP id v15mr21026350wmj.162.1614011072040;
        Mon, 22 Feb 2021 08:24:32 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id j14sm17298058wrw.34.2021.02.22.08.24.30
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 22 Feb 2021 08:24:31 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 1/9] media: hevc: Modify structures to follow H265 ITU spec
Date:   Mon, 22 Feb 2021 16:24:31 +0000
Message-ID: <cam73g1am20fqav4bsoakml5natvtgq4qq@4ax.com>
References: <20210218191844.297869-1-benjamin.gaignard@collabora.com> <20210218191844.297869-2-benjamin.gaignard@collabora.com>
In-Reply-To: <20210218191844.297869-2-benjamin.gaignard@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>The H.265 ITU specification (section 7.4) define the general
>slice segment header semantics.
>Modified/added fields are:
>- video_parameter_set_id: (7.4.3.1) identifies the VPS for
>reference by other syntax elements.
>- seq_parameter_set_id: (7.4.3.2.1) specifies the value of
>the vps_video_parameter_set_id of the active VPS.
>- chroma_format_idc: (7.4.3.2.1) specifies the chroma sampling
> relative to the luma sampling
>- pic_parameter_set_id: (7.4.3.3.1) identifies the PPS for
>reference by other syntax elements
>- num_ref_idx_l0_default_active_minus1: (7.4.3.3.1) specifies
>the inferred value of num_ref_idx_l0_active_minus1
>- num_ref_idx_l1_default_active_minus1: (7.4.3.3.1) specifies
>the inferred value of num_ref_idx_l1_active_minus1
>- slice_segment_addr: (7.4.7.1) specifies the address of
>the first coding tree block in the slice segment
>- num_entry_point_offsets: (7.4.7.1) specifies the number of
>entry_point_offset_minus1[ i ] syntax elements in the slice header
>
>Add HEVC decode params contains the information used in section
>"8.3 Slice decoding process" of the specification to let the hardware
>perform decoding of a slices.
>
>Adapt Cedrus driver according to these changes.
>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>---
>version 2:
>- remove all change related to scaling
>- squash commits to a coherent split
>- be more verbose about the added fields
>
> drivers/media/v4l2-core/v4l2-ctrls.c          | 26 ++++++++---
> drivers/staging/media/sunxi/cedrus/cedrus.c   |  6 +++
> drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
> .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
> .../staging/media/sunxi/cedrus/cedrus_h265.c  |  6 ++-
> include/media/hevc-ctrls.h                    | 45 +++++++++++++++----
> 6 files changed, 69 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c =
b/drivers/media/v4l2-core/v4l2-ctrls.c
>index 016cf6204cbb..4060b5bcc3c0 100644
>--- a/drivers/media/v4l2-core/v4l2-ctrls.c
>+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>@@ -1028,6 +1028,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> 	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			return "HEVC Sequence Parameter =
Set";
> 	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			return "HEVC Picture Parameter =
Set";
> 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice =
Parameters";
>+	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:		return "HEVC Decode =
Parameters";
> 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
> 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
>=20
>@@ -1482,6 +1483,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, =
enum v4l2_ctrl_type *type,
> 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
> 		*type =3D V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
> 		break;
>+	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:
>+		*type =3D V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
>+		break;
> 	case V4L2_CID_UNIT_CELL_SIZE:
> 		*type =3D V4L2_CTRL_TYPE_AREA;
> 		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>@@ -1833,6 +1837,7 @@ static int std_validate_compound(const struct =
v4l2_ctrl *ctrl, u32 idx,
> 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>+	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> 	struct v4l2_area *area;
> 	void *p =3D ptr.p + idx * ctrl->elem_size;
> 	unsigned int i;
>@@ -2108,23 +2113,27 @@ static int std_validate_compound(const struct =
v4l2_ctrl *ctrl, u32 idx,
> 		zero_padding(*p_hevc_pps);
> 		break;
>=20
>-	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>-		p_hevc_slice_params =3D p;
>+	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
>+		p_hevc_decode_params =3D p;
>=20
>-		if (p_hevc_slice_params->num_active_dpb_entries >
>+		if (p_hevc_decode_params->num_active_dpb_entries >
> 		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> 			return -EINVAL;
>=20
>-		zero_padding(p_hevc_slice_params->pred_weight_table);
>-
>-		for (i =3D 0; i < p_hevc_slice_params->num_active_dpb_entries;
>+		for (i =3D 0; i < p_hevc_decode_params->num_active_dpb_entries;
> 		     i++) {
> 			struct v4l2_hevc_dpb_entry *dpb_entry =3D
>-				&p_hevc_slice_params->dpb[i];
>+				&p_hevc_decode_params->dpb[i];
>=20
> 			zero_padding(*dpb_entry);
> 		}
>=20
>+		break;
>+
>+	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>+		p_hevc_slice_params =3D p;
>+
>+		zero_padding(p_hevc_slice_params->pred_weight_table);
> 		zero_padding(*p_hevc_slice_params);
> 		break;
>=20
>@@ -2821,6 +2830,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct =
v4l2_ctrl_handler *hdl,
> 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> 		elem_size =3D sizeof(struct v4l2_ctrl_hevc_slice_params);
> 		break;
>+	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
>+		elem_size =3D sizeof(struct v4l2_ctrl_hevc_decode_params);
>+		break;
> 	case V4L2_CTRL_TYPE_AREA:
> 		elem_size =3D sizeof(struct v4l2_area);
> 		break;
>diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c =
b/drivers/staging/media/sunxi/cedrus/cedrus.c
>index 7bd9291c8d5f..4cd3cab1a257 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
>@@ -151,6 +151,12 @@ static const struct cedrus_control =
cedrus_controls[] =3D {
> 		},
> 		.codec		=3D CEDRUS_CODEC_VP8,
> 	},
>+	{
>+		.cfg =3D {
>+			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
>+		},
>+		.codec		=3D CEDRUS_CODEC_H265,
>+	},
> };
>=20
> #define CEDRUS_CONTROLS_COUNT	ARRAY_SIZE(cedrus_controls)
>diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h =
b/drivers/staging/media/sunxi/cedrus/cedrus.h
>index 251a6a660351..2ca33ac38b9a 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
>@@ -76,6 +76,7 @@ struct cedrus_h265_run {
> 	const struct v4l2_ctrl_hevc_sps			*sps;
> 	const struct v4l2_ctrl_hevc_pps			*pps;
> 	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
>+	const struct v4l2_ctrl_hevc_decode_params	*decode_params;
> };
>=20
> struct cedrus_vp8_run {
>diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c =
b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>index a9090daf626a..cd821f417a14 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>@@ -68,6 +68,8 @@ void cedrus_device_run(void *priv)
> 			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
> 		run.h265.slice_params =3D cedrus_find_control_data(ctx,
> 			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
>+		run.h265.decode_params =3D cedrus_find_control_data(ctx,
>+			V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS);
> 		break;
>=20
> 	case V4L2_PIX_FMT_VP8_FRAME:
>diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c =
b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>index ce497d0197df..dce5db6be13a 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>@@ -245,6 +245,7 @@ static void cedrus_h265_setup(struct cedrus_ctx =
*ctx,
> 	const struct v4l2_ctrl_hevc_sps *sps;
> 	const struct v4l2_ctrl_hevc_pps *pps;
> 	const struct v4l2_ctrl_hevc_slice_params *slice_params;
>+	const struct v4l2_ctrl_hevc_decode_params *decode_params;
> 	const struct v4l2_hevc_pred_weight_table *pred_weight_table;
> 	dma_addr_t src_buf_addr;
> 	dma_addr_t src_buf_end_addr;
>@@ -256,6 +257,7 @@ static void cedrus_h265_setup(struct cedrus_ctx =
*ctx,
> 	sps =3D run->h265.sps;
> 	pps =3D run->h265.pps;
> 	slice_params =3D run->h265.slice_params;
>+	decode_params =3D run->h265.decode_params;
> 	pred_weight_table =3D &slice_params->pred_weight_table;
>=20
> 	/* MV column buffer size and allocation. */
>@@ -487,7 +489,7 @@ static void cedrus_h265_setup(struct cedrus_ctx =
*ctx,
>=20
> 	reg =3D =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_TC_OFFSET_DIV2(slice_params->slice_=
tc_offset_div2) |
> 	      =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_BETA_OFFSET_DIV2(slice_params->slic=
e_beta_offset_div2) |
>-	      =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(slice_params->=
num_rps_poc_st_curr_after =3D=3D 0) |
>+	      =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(decode_params-=
>num_rps_poc_st_curr_after =3D=3D 0) |
> 	      =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(slice_params->slice_cr=
_qp_offset) |
> 	      =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(slice_params->slice_cb=
_qp_offset) |
> 	      =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_QP_DELTA(slice_params->slice_qp_del=
ta);
>@@ -528,7 +530,7 @@ static void cedrus_h265_setup(struct cedrus_ctx =
*ctx,
>=20
> 	/* Write decoded picture buffer in pic list. */
> 	cedrus_h265_frame_info_write_dpb(ctx, slice_params->dpb,
>-					 slice_params->num_active_dpb_entries);
>+					 decode_params->num_active_dpb_entries);
>=20
> 	/* Output frame. */
>=20
>diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>index b4cb2ef02f17..7fe704a08f77 100644
>--- a/include/media/hevc-ctrls.h
>+++ b/include/media/hevc-ctrls.h
>@@ -19,6 +19,7 @@
> #define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
> #define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
> #define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + =
1010)
>+#define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE + =
1012)
> #define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + =
1015)
> #define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + =
1016)
>=20
>@@ -26,6 +27,7 @@
> #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
> #define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
> #define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
>+#define V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS 0x0124
>=20
> enum v4l2_mpeg_video_hevc_decode_mode {
> 	V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
>@@ -54,6 +56,9 @@ enum v4l2_mpeg_video_hevc_start_code {
> /* The controls are not stable at the moment and will likely be =
reworked. */
> struct v4l2_ctrl_hevc_sps {
> 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
>+	__u8	video_parameter_set_id;

Whilst I don't object to the addition of vps id why do we need
it if the VPS is never passed?

>+	__u8	seq_parameter_set_id;
>+	__u8	chroma_format_idc;
> 	__u16	pic_width_in_luma_samples;
> 	__u16	pic_height_in_luma_samples;
> 	__u8	bit_depth_luma_minus8;
>@@ -74,9 +79,9 @@ struct v4l2_ctrl_hevc_sps {
> 	__u8	log2_diff_max_min_pcm_luma_coding_block_size;
> 	__u8	num_short_term_ref_pic_sets;
> 	__u8	num_long_term_ref_pics_sps;
>-	__u8	chroma_format_idc;
>=20
>-	__u8	padding;
>+	__u8	num_slices;
>+	__u8	padding[6];
>=20
> 	__u64	flags;
> };
>@@ -100,10 +105,15 @@ struct v4l2_ctrl_hevc_sps {
> #define V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER	(1ULL << 16)
> #define V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT		(1ULL << 17)
> #define V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT (1ULL=
 << 18)
>+#define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT	(1ULL << =
19)
>+#define V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING			(1ULL << 20)
>=20
> struct v4l2_ctrl_hevc_pps {
> 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
>+	__u8	pic_parameter_set_id;
> 	__u8	num_extra_slice_header_bits;
>+	__u8	num_ref_idx_l0_default_active_minus1;
>+	__u8	num_ref_idx_l1_default_active_minus1;
> 	__s8	init_qp_minus26;
> 	__u8	diff_cu_qp_delta_depth;
> 	__s8	pps_cb_qp_offset;
>@@ -116,7 +126,7 @@ struct v4l2_ctrl_hevc_pps {
> 	__s8	pps_tc_offset_div2;
> 	__u8	log2_parallel_merge_level_minus2;
>=20
>-	__u8	padding[4];
>+	__u8	padding;
> 	__u64	flags;
> };
>=20
>@@ -165,6 +175,10 @@ struct v4l2_ctrl_hevc_slice_params {
> 	__u32	bit_size;
> 	__u32	data_bit_offset;
>=20
>+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
>+	__u32	slice_segment_addr;
>+	__u32	num_entry_point_offsets;
>+
> 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
> 	__u8	nal_unit_type;
> 	__u8	nuh_temporal_id_plus1;
>@@ -190,15 +204,13 @@ struct v4l2_ctrl_hevc_slice_params {
> 	__u8	pic_struct;
>=20
> 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
>-	__u8	num_active_dpb_entries;
> 	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> 	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>=20
>-	__u8	num_rps_poc_st_curr_before;
>-	__u8	num_rps_poc_st_curr_after;
>-	__u8	num_rps_poc_lt_curr;
>+	__u16	short_term_ref_pic_set_size;
>+	__u16	long_term_ref_pic_set_size;
>=20
>-	__u8	padding;
>+	__u8	padding[5];
>=20
> 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
> 	struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>@@ -209,4 +221,21 @@ struct v4l2_ctrl_hevc_slice_params {
> 	__u64	flags;
> };
>=20
>+#define V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC		0x1
>+#define V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC		0x2
>+#define V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR  0x4
>+
>+struct v4l2_ctrl_hevc_decode_params {
>+	__s32	pic_order_cnt_val;
>+	__u8	num_active_dpb_entries;
>+	struct	v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__u8	num_rps_poc_st_curr_before;
>+	__u8	num_rps_poc_st_curr_after;
>+	__u8	num_rps_poc_lt_curr;
>+	__u8	rps_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__u8	rps_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__u8	rps_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__u64	flags;
>+};
>+
> #endif

While you are adding stuff is there any chance you could also add:

#define V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT	(1ULL << 9)

to the slice flags?  The rpi H265 decoder needs it to deal with
cases where dependant_slice_segment is set in the slice header.

Thanks

John Cox
