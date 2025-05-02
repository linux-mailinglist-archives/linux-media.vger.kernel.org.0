Return-Path: <linux-media+bounces-31607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BC7AA758D
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AD1B7B64F4
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C355B2571DD;
	Fri,  2 May 2025 15:06:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CE913BAF1
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198394; cv=none; b=OU8PhY7DriDCQqDpexLbnQ4uQcEC/8YH5C/u1bK/n9CkVrc/c3H/dYtWwL/uMyo3iTlMxOfXc96t90XV9rap0mgjmcug+NnAKsqAy/i+KN9FE6TifB/Zc/hwy9lqBvlf4CVsX/HniHTQkfXNVVebbuMApFpBZqxgPJqdqNXm+S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198394; c=relaxed/simple;
	bh=t3WGRy0nmVFVXwowyiOyQFmOVYaG/7lhAXIm1oIKIYk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B8RpY9gvCiWFeSj4T3v/aqBDs0mVZTaR7Go6iRLvG/ZWXuwLjcXuqN77ZXjI0B8AdlLwSoedsXSnGJhr6jY3r1CpnHBqO2ae4Arhen8reZqEWOmQ7OPGl3wIGQj7u9xJZtBpv5LYRANunwu5sejCjJdHo9LZBM1rA2HCjtUWqRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uAry0-0004HG-9b; Fri, 02 May 2025 17:06:20 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paulk@sys-base.io,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com,
	ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [RFC PATCH 02/11] media: uapi: add documentation for the V4L2 H.264 stateless encoding API
Date: Fri,  2 May 2025 17:05:05 +0200
Message-Id: <20250502150513.4169098-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

From: Michael Tretter <m.tretter@pengutronix.de>

Document the parameters that are passed to the stateless encoding API
since they need to be filled by user space and knowing what the
parameters do helps when filling it.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 include/uapi/linux/v4l2-controls.h | 46 ++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 4f6b37513edc..670f822ee758 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1696,6 +1696,32 @@ struct v4l2_ctrl_h264_decode_params {
 
 #define V4L2_CID_STATELESS_H264_ENCODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 8)
 
+/**
+ * struct v4l2_ctrl_h264_encode_params - H264 encoding parameters
+ *
+ * @slice_type: selects slice type. Set to one of V4L2_H264_SLICE_TYPE_{}
+ * @pic_parameter_set_id: identifies the picture parameter set that is referred to
+ * in the slice header. The value shall be in the range of 0 to 255, inclusive.
+ * @frame_num: an identifier for pictures.
+ * @idr_pic_id: identifies an IDR picture.
+ * @cabac_init_idc: index for determining the initialization table used in the
+ * initialization process for context variables. The value of cabac_init_idc
+ * shall be in the range of 0 to 2, inclusive.
+ * @disable_deblocking_filter_idc: specifies whether the operation of the
+ * deblocking filter shall be disabled across some block edges of the slice and
+ * specifies for which edges the filtering is disabled.
+ * @slice_alpha_c0_offset_div2: offset used in accessing the alpha and tC0
+ * deblocking filter tables for filtering operations controlled by the macroblocks
+ * within the slice.
+ * @slice_beta_offset_div2: offset used in accessing the beta deblocking filter
+ * table for filtering operations controlled by the macroblocks within the slice.
+ * @slice_size_mb_rows: number of macroblock rows in a slice.
+ * @pic_init_qp_minus26: initial value minus 26 of luma qp for each slice.
+ * @chroma_qp_index_offset: offset that shall be added to qp luma for addressing the
+ * table of qp chroma values for the Cb chroma component.
+ * @flags: combination of V4L2_H264_ENCODE_FLAG_{} flags.
+ * @reference_ts: timestamp of the V4L2 buffer to use as reference
+ */
 struct v4l2_ctrl_h264_encode_params {
 	/* Slice parameters */
 
@@ -1710,8 +1736,16 @@ struct v4l2_ctrl_h264_encode_params {
 
 	__s32 slice_size_mb_rows;
 
-	/* PPS parameters */
-
+	/*
+	 * PPS parameters
+	 *
+	 * TODO Duplicating the PPS in the encode_params may not be necessary,
+	 * if the PPS are set via separate control. Otherwise, it may be useful
+	 * to just use struct v4l2_ctrl_h264_pps here.
+	 *
+	 * Needs to be consistent with the values set in the PPS referenced by
+	 * pic_parameter_set_id.
+	 */
 	__s8 pic_init_qp_minus26;
 	__s8 chroma_qp_index_offset;
 
@@ -1728,6 +1762,14 @@ struct v4l2_ctrl_h264_encode_params {
 
 #define V4L2_CID_STATELESS_H264_ENCODE_RC	(V4L2_CID_CODEC_STATELESS_BASE + 9)
 
+/**
+ * struct v4l2_ctrl_h264_encode_rc
+ *
+ * @qp: quantization parameter for the currently encoded slice
+ *
+ * TODO Setting the QP is enough for implementing const QP, but probably the
+ * entire rate control mechanism has to be reworked.
+ */
 struct v4l2_ctrl_h264_encode_rc {
 	__u32 qp;
 	__u32 qp_min;
-- 
2.39.5


