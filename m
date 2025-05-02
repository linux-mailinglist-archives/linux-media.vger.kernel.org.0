Return-Path: <linux-media+bounces-31608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F43AA7591
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C45E4C2835
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32DA257426;
	Fri,  2 May 2025 15:07:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1494B13BAF1
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198422; cv=none; b=HmqD6F66M01vJtw2jMeN3dKU0v7ANx2G33J0CMIUTuWMatYwH7Cl0iiAXtqyX8zwHNWQtIwAtsUdmOPujt5+WzLd/7HBnzcTvaduev3/MMkSsYfkasYbyr9zFA38fkaP1U4/Btk/kmyJv7rvmfpNSMoLYB2DChzFoAg+fH72oG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198422; c=relaxed/simple;
	bh=TeltxFsbUfWoGKzVcntQrAOxj0LPJuGeu35YD90asLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sjX6dejBSKeP4ny+GcsY78cLvn3F1Crm06A1EHMA3yBIhXoESG7XzfCjL8tCZ2MCkFOtPUdYf/I8u7RxoWwqobunPRfwvv7LQvdDe+wshjkmxGv8kSmgb1az7IGx+IRJ99VbFQ1RAwHfZ4tQuAf4dlsPJ578rjc99Tkd7L2Qv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uAryS-0004HG-57; Fri, 02 May 2025 17:06:48 +0200
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
Subject: [RFC PATCH 03/11] media: uapi: add nal unit header fields to encode_params
Date: Fri,  2 May 2025 17:05:06 +0200
Message-Id: <20250502150513.4169098-4-m.felsch@pengutronix.de>
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

The VEPU540 and VEPU580 may prepare the NAL unit headers in the coded
params. These values have to be provided by user space and be written
into the hardware registers.

Furthermore, nal_ref_idc indicates if a picture will be used as
reference and is a hint to the driver, if it needs to keep the
reconstructed buffer or not.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 include/uapi/linux/v4l2-controls.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 670f822ee758..a8df393c9ead 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1694,6 +1694,9 @@ struct v4l2_ctrl_h264_decode_params {
 	__u32 flags;
 };
 
+#define V4L2_H264_NAL_CODED_SLICE_NON_IDR_PIC	1
+#define V4L2_H264_NAL_CODED_SLICE_IDR_PIC	5
+
 #define V4L2_CID_STATELESS_H264_ENCODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 8)
 
 /**
@@ -1719,6 +1722,8 @@ struct v4l2_ctrl_h264_decode_params {
  * @pic_init_qp_minus26: initial value minus 26 of luma qp for each slice.
  * @chroma_qp_index_offset: offset that shall be added to qp luma for addressing the
  * table of qp chroma values for the Cb chroma component.
+ * @nal_ref_idc: nal_ref_idc for the header of the generated NAL unit
+ * @nal_unit_type: one of the V4L2_H264_NAL_CODED_SLICE_{} values
  * @flags: combination of V4L2_H264_ENCODE_FLAG_{} flags.
  * @reference_ts: timestamp of the V4L2 buffer to use as reference
  */
@@ -1751,6 +1756,16 @@ struct v4l2_ctrl_h264_encode_params {
 
 	__u32 flags; /* V4L2_H264_ENCODE_FLAG_ */
 
+	/*
+	 * If nal_ref_idc is 0, the NAL unit won't be used as reference by
+	 * later NAL units. Any other value indicates that the NAL unit may be
+	 * used as reference.
+	 */
+	__u8 nal_ref_idc;
+
+	/* TODO Can we infer the nal_unit_type from the slice_type? */
+	__u8 nal_unit_type;
+
 	/* Reference */
 
 	__u64 reference_ts;
-- 
2.39.5


