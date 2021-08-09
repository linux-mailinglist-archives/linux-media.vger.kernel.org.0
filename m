Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B193E4787
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 16:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbhHIO37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 10:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbhHIO3x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 10:29:53 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89009C061796
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 07:29:32 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id o7-20020a05600c5107b0290257f956e02dso14854531wms.1
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 07:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=L999Yib9z6H/0B0JYuNS69UkBVl7RBvK1NmqkaAvqbc=;
        b=aMh55qQH3CSm6IHOwLSyWPTlMpgFW1ioRLjQrChb7QwPGAMH14PTonvsmfYzwWVoNW
         JFnAaSZ7ckp+5eBKlBHEN69wSkvYBwruriQ02uw/S8PxPYO6yOesROGVtWeaxyyXvsl6
         JTEECDcddSLwvF90ohli+Pfo1vikDXvCmirOIA1M0CoJ/an/BNby5abH0NS8kl1gQFTk
         zfCtL+PEmqP2ZEwJ2DfFNq55VipsbGv5YKFmx0CbwMogRUmAYdOSc6T6Y0LVFFbL/4sR
         CDz2IN3/aDOfbnejllJbl/8oHqH3arIzPhKscEyqtKuMC2GtMX5yWlzZQIUt5noKB6Sy
         sU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=L999Yib9z6H/0B0JYuNS69UkBVl7RBvK1NmqkaAvqbc=;
        b=CriK6gBYhNn/g3WXPyDIaFCo8xlsY+7Q0tFNvDZ6JuNiYtTk3VyExjVaUD1msO5OVf
         +oKnOk4aNaNHk01g+eCdLep/ZRT6a1yKIU0KsBTovaSqODYCHhLhcABEOf7M+BPRo0ep
         of+/h+91K+VPHARaJjSXzmoHrCWAd2bcBMoIlHSB8neVHfhWVYLLn6USkQpBfGs8d09m
         63Gvva+JqSQGaJY+Ykwo/hqUi1IuHi6UyK+kkK8TsLpWON9YKoNn38FvUMEIbTJu8R1O
         Sqgnvb08KItVORzE1pIZ3ocKQJIf7wLaZ5pvtZzmnNkweOyiKi3ZElde00oFtSwMPVF9
         ROew==
X-Gm-Message-State: AOAM532Av5Rwz95BLAgU23lNRsPKFqCT4+ZLA1EtExDXTgHSWEPhFRhY
        XbHY1eIUJZf7QaBVgonc3ZcYhA==
X-Google-Smtp-Source: ABdhPJzJQKZXaUTHo0dgxyBYN3G9VHHriB7v/onpxEw6Bg2btBanvR7MJ+MH/AmIO2DeJ7LR9B/t6A==
X-Received: by 2002:a05:600c:2242:: with SMTP id a2mr17243784wmm.180.1628519371129;
        Mon, 09 Aug 2021 07:29:31 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id j19sm206203wmi.3.2021.08.09.07.29.29
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 09 Aug 2021 07:29:30 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v13 2/9] media: hevc: Add decode params control
Date:   Mon, 09 Aug 2021 15:29:29 +0100
Message-ID: <h8e2hgh73r8lqgr8lgmuobubj2jcdg6mv5@4ax.com>
References: <20210603115004.915294-1-benjamin.gaignard@collabora.com> <20210603115004.915294-3-benjamin.gaignard@collabora.com>
In-Reply-To: <20210603115004.915294-3-benjamin.gaignard@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Add decode params control and the associated structure to group
>all the information that are needed to decode a reference frame as
>is described in ITU-T Rec. H.265 section "8.3.2 Decoding process
>for reference picture set".

I'm sorry I'm commenting late but I've only just got round to
implementing code based on this.

>Adapt Cedrus driver to these changes.
>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>---
>version 11:
> - Split what was done in v4l2-ctrls.c in v4l2-ctrls-core.c and =
v4l2-ctrls-defs.c
>
> .../media/v4l/ext-ctrls-codec.rst             | 94 +++++++++++++++----
> .../media/v4l/vidioc-queryctrl.rst            |  6 ++
> drivers/media/v4l2-core/v4l2-ctrls-core.c     | 21 +++--
> drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +
> drivers/staging/media/sunxi/cedrus/cedrus.c   |  6 ++
> drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
> .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
> .../staging/media/sunxi/cedrus/cedrus_h265.c  | 12 ++-
> include/media/hevc-ctrls.h                    | 29 ++++--
> 9 files changed, 136 insertions(+), 39 deletions(-)
>
>diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>index 9cfb471fc6be..9120c5bcaf90 100644
>--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>@@ -2997,9 +2997,6 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>     * - __u8
>       - ``pic_struct``
>       -
>-    * - __u8
>-      - ``num_active_dpb_entries``
>-      - The number of entries in ``dpb``.
>     * - __u8
>       - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>       - The list of L0 reference elements as indices in the DPB.
>@@ -3007,22 +3004,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>       - ``ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>       - The list of L1 reference elements as indices in the DPB.
>     * - __u8
>-      - ``num_rps_poc_st_curr_before``
>-      - The number of reference pictures in the short-term set that =
come before
>-        the current frame.
>-    * - __u8
>-      - ``num_rps_poc_st_curr_after``
>-      - The number of reference pictures in the short-term set that =
come after
>-        the current frame.
>-    * - __u8
>-      - ``num_rps_poc_lt_curr``
>-      - The number of reference pictures in the long-term set.
>-    * - __u8
>-      - ``padding[7]``
>+      - ``padding``
>       - Applications and drivers must set this to zero.
>-    * - struct :c:type:`v4l2_hevc_dpb_entry`
>-      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>-      - The decoded picture buffer, for meta-data about reference =
frames.
>     * - struct :c:type:`v4l2_hevc_pred_weight_table`
>       - ``pred_weight_table``
>       - The prediction weight coefficients for inter-picture =
prediction.
>@@ -3278,3 +3261,78 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>     encoding the next frame queued after setting this control.
>     This provides a bitmask which consists of bits [0, LTR_COUNT-1].
>     This is applicable to the H264 and HEVC encoders.
>+
>+``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS (struct)``
>+    Specifies various decode parameters, especially the references =
picture order
>+    count (POC) for all the lists (short, long, before, current, after)=
 and the
>+    number of entries for each of them.
>+    These parameters are defined according to :ref:`hevc`.
>+    They are described in section 8.3 "Slice decoding process" of the
>+    specification.
>+
>+.. c:type:: v4l2_ctrl_hevc_decode_params
>+
>+.. cssclass:: longtable
>+
>+.. flat-table:: struct v4l2_ctrl_hevc_decode_params
>+    :header-rows:  0
>+    :stub-columns: 0
>+    :widths:       1 1 2
>+
>+    * - __s32
>+      - ``pic_order_cnt_val``
>+      - PicOrderCntVal as described in section 8.3.1 "Decoding process
>+        for picture order count" of the specification.
>+    * - __u8
>+      - ``num_active_dpb_entries``
>+      - The number of entries in ``dpb``.
>+    * - struct :c:type:`v4l2_hevc_dpb_entry`
>+      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>+      - The decoded picture buffer, for meta-data about reference =
frames.
>+    * - __u8
>+      - ``num_poc_st_curr_before``
>+      - The number of reference pictures in the short-term set that =
come before
>+        the current frame.
>+    * - __u8
>+      - ``num_poc_st_curr_after``
>+      - The number of reference pictures in the short-term set that =
come after
>+        the current frame.
>+    * - __u8
>+      - ``num_poc_lt_curr``
>+      - The number of reference pictures in the long-term set.
>+    * - __u8
>+      - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>+      - PocStCurrBefore as described in section 8.3.2 "Decoding process=
 for reference
>+        picture set.
>+    * - __u8
>+      - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>+      - PocStCurrAfter as described in section 8.3.2 "Decoding process =
for reference
>+        picture set.
>+    * - __u8
>+      - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>+      - PocLtCurr as described in section 8.3.2 "Decoding process for =
reference
>+        picture set.

Two things here

1) By my understanding poc_st_curr_before/after & poc_lt_curr attempt to
hold a POC (as per 8.3.2). That is a 32bit signed value not U8.  You can
get away with U16 if you mask & sign extend your comparisions but U8 I'm
pretty sure is too small.

2) I think you can calculate these list from the info in the DPB
structure. Certainly v4l2_hevc_dpb_entry.rps contains which list every
entry is in.

Regards

John Cox


>+    * - __u64
>+      - ``flags``
>+      - See :ref:`Decode Parameters Flags <hevc_decode_params_flags>`
>+
>+.. _hevc_decode_params_flags:
>+
>+``Decode Parameters Flags``
>+
>+.. cssclass:: longtable
>+
>+.. flat-table::
>+    :header-rows:  0
>+    :stub-columns: 0
>+    :widths:       1 1 2
>+
>+    * - ``V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC``
>+      - 0x00000001
>+      -
>+    * - ``V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC``
>+      - 0x00000002
>+      -
>+    * - ``V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR``
>+      - 0x00000004
>+      -
>diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst =
b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>index 07e54029e1e9..f9ecf6276129 100644
>--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>@@ -501,6 +501,12 @@ See also the examples in :ref:`control`.
>       - n/a
>       - A struct :c:type:`v4l2_ctrl_vp8_frame`, containing VP8
> 	frame parameters for stateless video decoders.
>+    * - ``V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS``
>+      - n/a
>+      - n/a
>+      - n/a
>+      - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing =
HEVC
>+	decoding parameters for stateless video decoders.
>=20
> .. raw:: latex
>=20
>diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c =
b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>index 081439224357..c4b5082849b6 100644
>--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>@@ -337,6 +337,7 @@ static int std_validate_compound(const struct =
v4l2_ctrl *ctrl, u32 idx,
> 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>+	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> 	struct v4l2_area *area;
> 	void *p =3D ptr.p + idx * ctrl->elem_size;
> 	unsigned int i;
>@@ -616,23 +617,26 @@ static int std_validate_compound(const struct =
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
>+		break;
>=20
>+	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>+		p_hevc_slice_params =3D p;
>+
>+		zero_padding(p_hevc_slice_params->pred_weight_table);
> 		zero_padding(*p_hevc_slice_params);
> 		break;
>=20
>@@ -1236,6 +1240,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct =
v4l2_ctrl_handler *hdl,
> 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> 		elem_size =3D sizeof(struct v4l2_ctrl_hevc_slice_params);
> 		break;
>+	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
>+		elem_size =3D sizeof(struct v4l2_ctrl_hevc_decode_params);
>+		break;
> 	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> 		elem_size =3D sizeof(struct v4l2_ctrl_hdr10_cll_info);
> 		break;
>diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c =
b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>index 7963c7b43450..b6344bbf1e00 100644
>--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>@@ -996,6 +996,7 @@ const char *v4l2_ctrl_get_name(u32 id)
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
>@@ -1487,6 +1488,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, =
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
>diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c =
b/drivers/staging/media/sunxi/cedrus/cedrus.c
>index fa348c09f844..c0d005dafc6c 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
>@@ -157,6 +157,12 @@ static const struct cedrus_control =
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
>index bbcdcd0787cf..88afba17b78b 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
>@@ -77,6 +77,7 @@ struct cedrus_h265_run {
> 	const struct v4l2_ctrl_hevc_sps			*sps;
> 	const struct v4l2_ctrl_hevc_pps			*pps;
> 	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
>+	const struct v4l2_ctrl_hevc_decode_params	*decode_params;
> };
>=20
> struct cedrus_vp8_run {
>diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c =
b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>index 97e410d92506..40e8c4123f76 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>@@ -70,6 +70,8 @@ void cedrus_device_run(void *priv)
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
>index 10744fab7cea..6821e3d05d34 100644
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
>num_poc_st_curr_after =3D=3D 0) |
> 	      =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(slice_params->slice_cr=
_qp_offset) |
> 	      =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(slice_params->slice_cb=
_qp_offset) |
> 	      =
VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_QP_DELTA(slice_params->slice_qp_del=
ta);
>@@ -527,8 +529,8 @@ static void cedrus_h265_setup(struct cedrus_ctx =
*ctx,
> 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
>=20
> 	/* Write decoded picture buffer in pic list. */
>-	cedrus_h265_frame_info_write_dpb(ctx, slice_params->dpb,
>-					 slice_params->num_active_dpb_entries);
>+	cedrus_h265_frame_info_write_dpb(ctx, decode_params->dpb,
>+					 decode_params->num_active_dpb_entries);
>=20
> 	/* Output frame. */
>=20
>@@ -545,7 +547,7 @@ static void cedrus_h265_setup(struct cedrus_ctx =
*ctx,
>=20
> 	/* Reference picture list 0 (for P/B frames). */
> 	if (slice_params->slice_type !=3D V4L2_HEVC_SLICE_TYPE_I) {
>-		cedrus_h265_ref_pic_list_write(dev, slice_params->dpb,
>+		cedrus_h265_ref_pic_list_write(dev, decode_params->dpb,
> 					       slice_params->ref_idx_l0,
> 					       slice_params->num_ref_idx_l0_active_minus1 + 1,
> 					       VE_DEC_H265_SRAM_OFFSET_REF_PIC_LIST0);
>@@ -564,7 +566,7 @@ static void cedrus_h265_setup(struct cedrus_ctx =
*ctx,
>=20
> 	/* Reference picture list 1 (for B frames). */
> 	if (slice_params->slice_type =3D=3D V4L2_HEVC_SLICE_TYPE_B) {
>-		cedrus_h265_ref_pic_list_write(dev, slice_params->dpb,
>+		cedrus_h265_ref_pic_list_write(dev, decode_params->dpb,
> 					       slice_params->ref_idx_l1,
> 					       slice_params->num_ref_idx_l1_active_minus1 + 1,
> 					       VE_DEC_H265_SRAM_OFFSET_REF_PIC_LIST1);
>diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>index 245052c15864..e53666a1127f 100644
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
>@@ -195,18 +197,10 @@ struct v4l2_ctrl_hevc_slice_params {
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
>-
>-	__u8	padding;
>-
>-	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
>-	struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__u8	padding[5];
>=20
> 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction parameter */
> 	struct v4l2_hevc_pred_weight_table pred_weight_table;
>@@ -214,4 +208,21 @@ struct v4l2_ctrl_hevc_slice_params {
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
>+	__u8	num_poc_st_curr_before;
>+	__u8	num_poc_st_curr_after;
>+	__u8	num_poc_lt_curr;
>+	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__u64	flags;
>+};
>+
> #endif
