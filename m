Return-Path: <linux-media+bounces-20867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4E09BC759
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F9F51F22E43
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BBB1FEFCB;
	Tue,  5 Nov 2024 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="7e9kUUUn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D94282F1;
	Tue,  5 Nov 2024 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730793120; cv=none; b=G/Nka7dFq+BIqryeuFBuQJK424mG4DvtF2F/rWn2K3hfk3b/kSzxe6w5RWIGOhSjZa1iUG8ijhY3ZBN07qKoYx5y+g+3vj4jjy/zWoXIKKvqtzvmoNUZyUmatpmh2CTbvEVld2s+7oviWT37qCwzTbOdJqPkgB6xpV5cdKDk94Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730793120; c=relaxed/simple;
	bh=RAbKXpSxicJQY5KFlUMpktE5KJy3SfEZldaI12SGjGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L8qoXGNJYA9Uirx98BAl5cWwr/VnZDRxr6K0qx3b4KxjP1udiJerPGJ4jhMCEW3DGk3+w02g06KbTstoZL2bG8rlUv/ZB4WsYAsMupGNH+SoD4h8Wg9gMLHYd7H92vKJo6tQi1IMJCVA8bVKQ3nc2cvzSeyxvwfUhd0McIQp4gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=7e9kUUUn; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A50majW015451;
	Tue, 5 Nov 2024 08:51:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iHx2eom3Akmcm5QWtlSVlU1UQOIIrq4QkF16il1vv7A=; b=7e9kUUUnNmPyh80c
	4mutBrqZScO3HOBqBENsYxdG4bIjAT0CY3DQq0qcBm9MgnAvKyGEXT5KcNMLf68F
	hlUlCJrYPLqq42JtvVrfvoqfR6NlMb4WU3XOo1ZUqyIZqrhlgTcY9qSWDGZ985O1
	ZdlgGFNipwMnCX1cboAdg/xHEEiesOoFysLYjMjvxKgyAIZ6qPH0Wq28FNdTY164
	BSS739WmIcHuVERYi3rTBfVN/fCb0Aj8C2bps4vlSFOjIM/1uoDayIU1zvlEeDcE
	uyfq+UbMMmo5GLknL57QfpGvuEUIhpHe/ESGbVS/2l+CKHAb7bBxGGEJCWxTGx77
	v9fAow==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbtu83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:51:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9E78C4004C;
	Tue,  5 Nov 2024 08:50:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8CCA25079F;
	Tue,  5 Nov 2024 08:49:32 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:32 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:10 +0100
Subject: [PATCH v2 07/15] media: stm32: dcmipp: add support for csi input
 into dcmipp-input
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-csi_dcmipp_mp25-v2-7-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

On stm32mp25, the dcmipp can accept data coming from a CSI bus in
addition to the parallel interface.  Add this support into
dcmipp-input subdev.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 134 +++++++++++++++++----
 1 file changed, 110 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 689eb4c72e1808bc30a2a175d907229c0910542d..7e5311b67d7ea4e84dec1456c58491153d69ef17 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/v4l2-mediabus.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-subdev.h>
 
@@ -19,6 +20,9 @@
 #define DCMIPP_PRCR_FORMAT_YUV422	0x1e
 #define DCMIPP_PRCR_FORMAT_RGB565	0x22
 #define DCMIPP_PRCR_FORMAT_RAW8		0x2a
+#define DCMIPP_PRCR_FORMAT_RAW10	0x2b
+#define DCMIPP_PRCR_FORMAT_RAW12	0x2c
+#define DCMIPP_PRCR_FORMAT_RAW14	0x2d
 #define DCMIPP_PRCR_FORMAT_G8		0x4a
 #define DCMIPP_PRCR_FORMAT_BYTE_STREAM	0x5a
 #define DCMIPP_PRCR_ESS			BIT(4)
@@ -31,43 +35,75 @@
 #define DCMIPP_PRESCR	0x108
 #define DCMIPP_PRESUR	0x10c
 
+#define DCMIPP_CMCR	0x204
+#define DCMIPP_CMCR_INSEL	BIT(0)
+
+#define DCMIPP_P0FSCR	0x404
+#define DCMIPP_P0FSCR_DTMODE_MASK	GENMASK(17, 16)
+#define DCMIPP_P0FSCR_DTMODE_SHIFT	16
+#define DCMIPP_P0FSCR_DTMODE_DTIDA	0x00
+#define DCMIPP_P0FSCR_DTMODE_ALLDT	0x03
+#define DCMIPP_P0FSCR_DTIDA_MASK	GENMASK(5, 0)
+#define DCMIPP_P0FSCR_DTIDA_SHIFT	0
+
 #define IS_SINK(pad) (!(pad))
 #define IS_SRC(pad)  ((pad))
 
 struct dcmipp_inp_pix_map {
 	unsigned int code_sink;
 	unsigned int code_src;
+	/* Parallel related information */
 	u8 prcr_format;
 	u8 prcr_swapcycles;
+	/* CSI related information */
+	unsigned int dt;
 };
 
-#define PIXMAP_SINK_SRC_PRCR_SWAP(sink, src, prcr, swap)	\
+#define PIXMAP_SINK_SRC_PRCR_SWAP(sink, src, prcr, swap, data_type)	\
 	{							\
 		.code_sink = MEDIA_BUS_FMT_##sink,		\
 		.code_src = MEDIA_BUS_FMT_##src,		\
 		.prcr_format = DCMIPP_PRCR_FORMAT_##prcr,	\
 		.prcr_swapcycles = swap,			\
+		.dt = data_type,				\
 	}
 static const struct dcmipp_inp_pix_map dcmipp_inp_pix_map_list[] = {
 	/* RGB565 */
-	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_LE, RGB565_2X8_LE, RGB565, 1),
-	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_BE, RGB565_2X8_LE, RGB565, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_LE, RGB565_2X8_LE, RGB565, 1, MIPI_CSI2_DT_RGB565),
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_BE, RGB565_2X8_LE, RGB565, 0, MIPI_CSI2_DT_RGB565),
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_1X16, RGB565_1X16, RGB565, 0, MIPI_CSI2_DT_RGB565),
 	/* YUV422 */
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 1),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 1),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 1),
-	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 1),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_1X16, YUYV8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_1X16, UYVY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_1X16, YVYU8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_1X16, VYUY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	/* GREY */
-	PIXMAP_SINK_SRC_PRCR_SWAP(Y8_1X8, Y8_1X8, G8, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(Y8_1X8, Y8_1X8, G8, 0, MIPI_CSI2_DT_RAW8),
 	/* Raw Bayer */
-	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR8_1X8, SBGGR8_1X8, RAW8, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG8_1X8, SGBRG8_1X8, RAW8, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG8_1X8, SGRBG8_1X8, RAW8, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB8_1X8, SRGGB8_1X8, RAW8, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR8_1X8, SBGGR8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG8_1X8, SGBRG8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG8_1X8, SGRBG8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB8_1X8, SRGGB8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR10_1X10, SBGGR10_1X10, RAW10, 0, MIPI_CSI2_DT_RAW10),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG10_1X10, SGBRG10_1X10, RAW10, 0, MIPI_CSI2_DT_RAW10),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG10_1X10, SGRBG10_1X10, RAW10, 0, MIPI_CSI2_DT_RAW10),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB10_1X10, SRGGB10_1X10, RAW10, 0, MIPI_CSI2_DT_RAW10),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR12_1X12, SBGGR12_1X12, RAW12, 0, MIPI_CSI2_DT_RAW12),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG12_1X12, SGBRG12_1X12, RAW12, 0, MIPI_CSI2_DT_RAW12),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG12_1X12, SGRBG12_1X12, RAW12, 0, MIPI_CSI2_DT_RAW12),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB12_1X12, SRGGB12_1X12, RAW12, 0, MIPI_CSI2_DT_RAW12),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR14_1X14, SBGGR14_1X14, RAW14, 0, MIPI_CSI2_DT_RAW14),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG14_1X14, SGBRG14_1X14, RAW14, 0, MIPI_CSI2_DT_RAW14),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG14_1X14, SGRBG14_1X14, RAW14, 0, MIPI_CSI2_DT_RAW14),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB14_1X14, SRGGB14_1X14, RAW14, 0, MIPI_CSI2_DT_RAW14),
 	/* JPEG */
-	PIXMAP_SINK_SRC_PRCR_SWAP(JPEG_1X8, JPEG_1X8, BYTE_STREAM, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(JPEG_1X8, JPEG_1X8, BYTE_STREAM, 0, 0),
 };
 
 /*
@@ -260,8 +296,8 @@ static int dcmipp_inp_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int dcmipp_inp_configure(struct dcmipp_inp_device *inp,
-				struct v4l2_subdev_state *state)
+static int dcmipp_inp_configure_parallel(struct dcmipp_inp_device *inp,
+					 struct v4l2_subdev_state *state)
 {
 	u32 val = 0;
 	const struct dcmipp_inp_pix_map *vpix;
@@ -315,6 +351,52 @@ static int dcmipp_inp_configure(struct dcmipp_inp_device *inp,
 
 	reg_write(inp, DCMIPP_PRCR, val);
 
+	/* Select the DCMIPP parallel interface */
+	reg_write(inp, DCMIPP_CMCR, 0);
+
+	/* Enable parallel interface */
+	reg_set(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+
+	return 0;
+}
+
+static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
+				    struct v4l2_subdev_state *state)
+{
+	const struct dcmipp_inp_pix_map *vpix;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+
+	/* Get format information */
+	sink_fmt = v4l2_subdev_state_get_format(state, 0);
+	src_fmt = v4l2_subdev_state_get_format(state, 1);
+
+	vpix = dcmipp_inp_pix_map_by_code(sink_fmt->code, src_fmt->code);
+	if (!vpix) {
+		dev_err(inp->dev, "Invalid sink/src format configuration\n");
+		return -EINVAL;
+	}
+
+	/* Apply configuration on each input pipe */
+	reg_clear(inp, DCMIPP_P0FSCR,
+		  DCMIPP_P0FSCR_DTMODE_MASK | DCMIPP_P0FSCR_DTIDA_MASK);
+
+	/* In case of JPEG we don't know the DT so we allow all data */
+	/*
+	 * TODO - check instead dt == 0 for the time being to allow other
+	 * unknown data-type
+	 */
+	if (!vpix->dt)
+		reg_set(inp, DCMIPP_P0FSCR,
+			DCMIPP_P0FSCR_DTMODE_ALLDT << DCMIPP_P0FSCR_DTMODE_SHIFT);
+	else
+		reg_set(inp, DCMIPP_P0FSCR,
+			vpix->dt << DCMIPP_P0FSCR_DTIDA_SHIFT |
+			DCMIPP_P0FSCR_DTMODE_DTIDA);
+
+	/* Select the DCMIPP CSI interface */
+	reg_write(inp, DCMIPP_CMCR, DCMIPP_CMCR_INSEL);
+
 	return 0;
 }
 
@@ -326,7 +408,7 @@ static int dcmipp_inp_enable_streams(struct v4l2_subdev *sd,
 				container_of(sd, struct dcmipp_inp_device, sd);
 	struct v4l2_subdev *s_subdev;
 	struct media_pad *s_pad;
-	int ret;
+	int ret = 0;
 
 	/* Get source subdev */
 	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
@@ -334,13 +416,14 @@ static int dcmipp_inp_enable_streams(struct v4l2_subdev *sd,
 		return -EINVAL;
 	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
 
-	ret = dcmipp_inp_configure(inp, state);
+	if (inp->ved.bus_type == V4L2_MBUS_PARALLEL ||
+	    inp->ved.bus_type == V4L2_MBUS_BT656)
+		ret = dcmipp_inp_configure_parallel(inp, state);
+	else if (inp->ved.bus_type == V4L2_MBUS_CSI2_DPHY)
+		ret = dcmipp_inp_configure_csi(inp, state);
 	if (ret)
 		return ret;
 
-	/* Enable parallel interface */
-	reg_set(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
-
 	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
 	if (ret < 0) {
 		dev_err(inp->dev,
@@ -374,8 +457,11 @@ static int dcmipp_inp_disable_streams(struct v4l2_subdev *sd,
 		return ret;
 	}
 
-	/* Disable parallel interface */
-	reg_clear(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	if (inp->ved.bus_type == V4L2_MBUS_PARALLEL ||
+	    inp->ved.bus_type == V4L2_MBUS_BT656) {
+		/* Disable parallel interface */
+		reg_clear(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	}
 
 	return 0;
 }

-- 
2.25.1


