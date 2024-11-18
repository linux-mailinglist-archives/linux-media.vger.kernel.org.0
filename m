Return-Path: <linux-media+bounces-21532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 226D49D1249
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 14:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8A542830E5
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 13:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018251BD039;
	Mon, 18 Nov 2024 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="b6VCc1uW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7301A9B4D;
	Mon, 18 Nov 2024 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937219; cv=none; b=guT9TtDJblZzYYGYBBoZneV9DuvQREZQ0LjUsc4xyZkZ+QzJnoOh5eXr8w8sctbixUSmTtvdSbyvW66PWW4dI9jb6ARD5opjNZ7smL51BYKz9J7AXDaiN+FiXY0AJjMQpyA920OZs3cNZ4izkUT+036yYU7YqX6Z8NXm/HgRZCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937219; c=relaxed/simple;
	bh=0L0wzzkDtib2Wnd8hi1ULjk1/pzs7S/3Q3eiYVfK5O8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lZphQtMgYT+iBpa5r2Vb/XxUEIzqu+AB12QwwshJOxi0AEkfKai1sc8pUTUjZGJ+ayJFNtylPyBTc5vq/u1gWCBp2Q+rwPtxa3cptOjugAyypKBwltVQe699dWgo80J7M7OKuLggeldjkV7zPDVRkPvG8YAiNvSU2pvFlTMmgMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=b6VCc1uW; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIC2gsi026244;
	Mon, 18 Nov 2024 14:39:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	j5WNgw8r9+Ld0aSEqHvq7bt6ZOBQA4a8Zivto1yf4ZA=; b=b6VCc1uWTxxzSaQG
	OnugvQYe/m1ktcVeOtka/SCrPCy805qi27EhIbgETc1ELHmvCbE7Eshng1YMIwAh
	KrIjghE3Xvg2YAS4kHrZrGqAnbEN+sFJ1eIwIFJZ12xMuKLEqAtjFw+2XtEJW8YH
	1DB7S3cbzphwajy1mXapxlVtgdTTyteOrwz3jDu5mcPkGQ97x4Fha9fPtfAh0Hth
	7nn0nHdKd4qrKaw8X82dEeHRusdSxwb5Fj7OASWzX3K5xCOisWnZ4l/N9m3oep9x
	ZoOnseeWaFaUu5MmWXyAtyPKICXnCFrQBmxJmYLcS7+iOT7kibwTmrQ7ArH9ygYK
	dlYFCQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqh77pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:39:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0DC1A4005E;
	Mon, 18 Nov 2024 14:38:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F09FA275641;
	Mon, 18 Nov 2024 14:35:29 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:35:29 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 18 Nov 2024 14:35:29 +0100
Subject: [PATCH v3 06/15] media: stm32: dcmipp: rename dcmipp_parallel into
 dcmipp_input
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-csi_dcmipp_mp25-v3-6-c1914afb0a0f@foss.st.com>
References: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
In-Reply-To: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
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
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

In preparation of the introduction of dcmipp csi input support, rename
the dcmipp_parallel subdev into a generic dcmipp_input which will be in
charge of handling both parallel input & csi input.
Only structures / variables / functions and file naming are changed without
any functional modifications.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   4 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  12 +-
 .../{dcmipp-parallel.c => dcmipp-input.c}          | 178 ++++++++++-----------
 4 files changed, 98 insertions(+), 98 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 8920d9388a215757381ad7d58bd445c3ba76c792..159105fb40b88b8483368aab03f0170b133d4fac 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-parallel.o dcmipp-byteproc.o dcmipp-bytecap.o
+stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 7a7cf43baf24dd2b3242a191d2d8d870d26b5f58..fe5f97233f5e8bd2cd778930656b14464f52d22f 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -199,11 +199,11 @@ static inline void __reg_clear(struct device *dev, void __iomem *base, u32 reg,
 }
 
 /* DCMIPP subdev init / release entry points */
-struct dcmipp_ent_device *dcmipp_par_ent_init(struct device *dev,
+struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
 					      const char *entity_name,
 					      struct v4l2_device *v4l2_dev,
 					      void __iomem *regs);
-void dcmipp_par_ent_release(struct dcmipp_ent_device *ved);
+void dcmipp_inp_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *
 dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
 			 struct v4l2_device *v4l2_dev, void __iomem *regs);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 7f771ea49b78484560af9f543e916406f4f2945e..50b9b964fbc4674b870189736a49f1d6a02b2503 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -95,9 +95,9 @@ struct dcmipp_pipeline_config {
 
 static const struct dcmipp_ent_config stm32mp13_ent_config[] = {
 	{
-		.name = "dcmipp_parallel",
-		.init = dcmipp_par_ent_init,
-		.release = dcmipp_par_ent_release,
+		.name = "dcmipp_input",
+		.init = dcmipp_inp_ent_init,
+		.release = dcmipp_inp_ent_release,
 	},
 	{
 		.name = "dcmipp_dump_postproc",
@@ -111,12 +111,12 @@ static const struct dcmipp_ent_config stm32mp13_ent_config[] = {
 	},
 };
 
-#define ID_PARALLEL 0
+#define ID_INPUT 0
 #define ID_DUMP_BYTEPROC 1
 #define ID_DUMP_CAPTURE 2
 
 static const struct dcmipp_ent_link stm32mp13_ent_links[] = {
-	DCMIPP_ENT_LINK(ID_PARALLEL,      1, ID_DUMP_BYTEPROC, 0,
+	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
 			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
 			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
@@ -309,7 +309,7 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	/* Parallel input device detected, connect it to parallel subdev */
-	sink = dcmipp->entity[ID_PARALLEL];
+	sink = dcmipp->entity[ID_INPUT];
 	sink->bus.flags = vep.bus.parallel.flags;
 	sink->bus.bus_width = vep.bus.parallel.bus_width;
 	sink->bus.data_shift = vep.bus.parallel.data_shift;
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
similarity index 66%
rename from drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
rename to drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 823c9da336a7fc63dca2aeeb2ac9377821bf6371..689eb4c72e1808bc30a2a175d907229c0910542d 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -34,7 +34,7 @@
 #define IS_SINK(pad) (!(pad))
 #define IS_SRC(pad)  ((pad))
 
-struct dcmipp_par_pix_map {
+struct dcmipp_inp_pix_map {
 	unsigned int code_sink;
 	unsigned int code_src;
 	u8 prcr_format;
@@ -48,7 +48,7 @@ struct dcmipp_par_pix_map {
 		.prcr_format = DCMIPP_PRCR_FORMAT_##prcr,	\
 		.prcr_swapcycles = swap,			\
 	}
-static const struct dcmipp_par_pix_map dcmipp_par_pix_map_list[] = {
+static const struct dcmipp_inp_pix_map dcmipp_inp_pix_map_list[] = {
 	/* RGB565 */
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_LE, RGB565_2X8_LE, RGB565, 1),
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_BE, RGB565_2X8_LE, RGB565, 0),
@@ -74,18 +74,18 @@ static const struct dcmipp_par_pix_map dcmipp_par_pix_map_list[] = {
  * Search through the pix_map table, skipping two consecutive entry with the
  * same code
  */
-static inline const struct dcmipp_par_pix_map *dcmipp_par_pix_map_by_index
+static inline const struct dcmipp_inp_pix_map *dcmipp_inp_pix_map_by_index
 						(unsigned int index,
 						 unsigned int pad)
 {
 	unsigned int i = 0;
 	u32 prev_code = 0, cur_code;
 
-	while (i < ARRAY_SIZE(dcmipp_par_pix_map_list)) {
+	while (i < ARRAY_SIZE(dcmipp_inp_pix_map_list)) {
 		if (IS_SRC(pad))
-			cur_code = dcmipp_par_pix_map_list[i].code_src;
+			cur_code = dcmipp_inp_pix_map_list[i].code_src;
 		else
-			cur_code = dcmipp_par_pix_map_list[i].code_sink;
+			cur_code = dcmipp_inp_pix_map_list[i].code_sink;
 
 		if (cur_code == prev_code) {
 			i++;
@@ -99,32 +99,32 @@ static inline const struct dcmipp_par_pix_map *dcmipp_par_pix_map_by_index
 		index--;
 	}
 
-	if (i >= ARRAY_SIZE(dcmipp_par_pix_map_list))
+	if (i >= ARRAY_SIZE(dcmipp_inp_pix_map_list))
 		return NULL;
 
-	return &dcmipp_par_pix_map_list[i];
+	return &dcmipp_inp_pix_map_list[i];
 }
 
-static inline const struct dcmipp_par_pix_map *dcmipp_par_pix_map_by_code
+static inline const struct dcmipp_inp_pix_map *dcmipp_inp_pix_map_by_code
 					(u32 code_sink, u32 code_src)
 {
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(dcmipp_par_pix_map_list); i++) {
-		if ((dcmipp_par_pix_map_list[i].code_sink == code_sink &&
-		     dcmipp_par_pix_map_list[i].code_src == code_src) ||
-		    (dcmipp_par_pix_map_list[i].code_sink == code_src &&
-		     dcmipp_par_pix_map_list[i].code_src == code_sink) ||
-		    (dcmipp_par_pix_map_list[i].code_sink == code_sink &&
+	for (i = 0; i < ARRAY_SIZE(dcmipp_inp_pix_map_list); i++) {
+		if ((dcmipp_inp_pix_map_list[i].code_sink == code_sink &&
+		     dcmipp_inp_pix_map_list[i].code_src == code_src) ||
+		    (dcmipp_inp_pix_map_list[i].code_sink == code_src &&
+		     dcmipp_inp_pix_map_list[i].code_src == code_sink) ||
+		    (dcmipp_inp_pix_map_list[i].code_sink == code_sink &&
 		     code_src == 0) ||
 		    (code_sink == 0 &&
-		     dcmipp_par_pix_map_list[i].code_src == code_src))
-			return &dcmipp_par_pix_map_list[i];
+		     dcmipp_inp_pix_map_list[i].code_src == code_src))
+			return &dcmipp_inp_pix_map_list[i];
 	}
 	return NULL;
 }
 
-struct dcmipp_par_device {
+struct dcmipp_inp_device {
 	struct dcmipp_ent_device ved;
 	struct v4l2_subdev sd;
 	struct device *dev;
@@ -142,7 +142,7 @@ static const struct v4l2_mbus_framefmt fmt_default = {
 	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
 };
 
-static int dcmipp_par_init_state(struct v4l2_subdev *sd,
+static int dcmipp_inp_init_state(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state)
 {
 	unsigned int i;
@@ -157,12 +157,12 @@ static int dcmipp_par_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int dcmipp_par_enum_mbus_code(struct v4l2_subdev *sd,
+static int dcmipp_inp_enum_mbus_code(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_mbus_code_enum *code)
 {
-	const struct dcmipp_par_pix_map *vpix =
-		dcmipp_par_pix_map_by_index(code->index, code->pad);
+	const struct dcmipp_inp_pix_map *vpix =
+		dcmipp_inp_pix_map_by_index(code->index, code->pad);
 
 	if (!vpix)
 		return -EINVAL;
@@ -172,17 +172,17 @@ static int dcmipp_par_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int dcmipp_par_enum_frame_size(struct v4l2_subdev *sd,
+static int dcmipp_inp_enum_frame_size(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_size_enum *fse)
 {
-	const struct dcmipp_par_pix_map *vpix;
+	const struct dcmipp_inp_pix_map *vpix;
 
 	if (fse->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table */
-	vpix = dcmipp_par_pix_map_by_code(IS_SINK(fse->pad) ? fse->code : 0,
+	vpix = dcmipp_inp_pix_map_by_code(IS_SINK(fse->pad) ? fse->code : 0,
 					  IS_SRC(fse->pad) ? fse->code : 0);
 	if (!vpix)
 		return -EINVAL;
@@ -195,20 +195,20 @@ static int dcmipp_par_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static void dcmipp_par_adjust_fmt(struct dcmipp_par_device *par,
+static void dcmipp_inp_adjust_fmt(struct dcmipp_inp_device *inp,
 				  struct v4l2_mbus_framefmt *fmt, __u32 pad)
 {
-	const struct dcmipp_par_pix_map *vpix;
+	const struct dcmipp_inp_pix_map *vpix;
 
 	/* Only accept code in the pix map table */
-	vpix = dcmipp_par_pix_map_by_code(IS_SINK(pad) ? fmt->code : 0,
+	vpix = dcmipp_inp_pix_map_by_code(IS_SINK(pad) ? fmt->code : 0,
 					  IS_SRC(pad) ? fmt->code : 0);
 	if (!vpix)
 		fmt->code = fmt_default.code;
 
 	/* Exclude JPEG if BT656 bus is selected */
 	if (vpix && vpix->code_sink == MEDIA_BUS_FMT_JPEG_1X8 &&
-	    par->ved.bus_type == V4L2_MBUS_BT656)
+	    inp->ved.bus_type == V4L2_MBUS_BT656)
 		fmt->code = fmt_default.code;
 
 	fmt->width = clamp_t(u32, fmt->width, DCMIPP_FRAME_MIN_WIDTH,
@@ -222,11 +222,11 @@ static void dcmipp_par_adjust_fmt(struct dcmipp_par_device *par,
 	dcmipp_colorimetry_clamp(fmt);
 }
 
-static int dcmipp_par_set_fmt(struct v4l2_subdev *sd,
+static int dcmipp_inp_set_fmt(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
-	struct dcmipp_par_device *par = v4l2_get_subdevdata(sd);
+	struct dcmipp_inp_device *inp = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
 
 	if (v4l2_subdev_is_streaming(sd))
@@ -235,10 +235,10 @@ static int dcmipp_par_set_fmt(struct v4l2_subdev *sd,
 	mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 
 	/* Set the new format */
-	dcmipp_par_adjust_fmt(par, &fmt->format, fmt->pad);
+	dcmipp_inp_adjust_fmt(inp, &fmt->format, fmt->pad);
 
-	dev_dbg(par->dev, "%s: format update: old:%dx%d (0x%x, %d, %d, %d, %d) new:%dx%d (0x%x, %d, %d, %d, %d)\n",
-		par->sd.name,
+	dev_dbg(inp->dev, "%s: format update: old:%dx%d (0x%x, %d, %d, %d, %d) new:%dx%d (0x%x, %d, %d, %d, %d)\n",
+		inp->sd.name,
 		/* old */
 		mf->width, mf->height, mf->code,
 		mf->colorspace,	mf->quantization,
@@ -254,30 +254,30 @@ static int dcmipp_par_set_fmt(struct v4l2_subdev *sd,
 	if (IS_SINK(fmt->pad)) {
 		mf = v4l2_subdev_state_get_format(sd_state, 1);
 		*mf = fmt->format;
-		dcmipp_par_adjust_fmt(par, mf, 1);
+		dcmipp_inp_adjust_fmt(inp, mf, 1);
 	}
 
 	return 0;
 }
 
-static int dcmipp_par_configure(struct dcmipp_par_device *par,
+static int dcmipp_inp_configure(struct dcmipp_inp_device *inp,
 				struct v4l2_subdev_state *state)
 {
 	u32 val = 0;
-	const struct dcmipp_par_pix_map *vpix;
+	const struct dcmipp_inp_pix_map *vpix;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_mbus_framefmt *src_fmt;
 
 	/* Set vertical synchronization polarity */
-	if (par->ved.bus.flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
+	if (inp->ved.bus.flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
 		val |= DCMIPP_PRCR_VSPOL;
 
 	/* Set horizontal synchronization polarity */
-	if (par->ved.bus.flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
+	if (inp->ved.bus.flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
 		val |= DCMIPP_PRCR_HSPOL;
 
 	/* Set pixel clock polarity */
-	if (par->ved.bus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+	if (inp->ved.bus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
 		val |= DCMIPP_PRCR_PCKPOL;
 
 	/*
@@ -287,23 +287,23 @@ static int dcmipp_par_configure(struct dcmipp_par_device *par,
 	 * SAV=0xff000080 & EAV=0xff00009d.
 	 * With DCMIPP this means LSC=SAV=0x80 & LEC=EAV=0x9d.
 	 */
-	if (par->ved.bus_type == V4L2_MBUS_BT656) {
+	if (inp->ved.bus_type == V4L2_MBUS_BT656) {
 		val |= DCMIPP_PRCR_ESS;
 
 		/* Unmask all codes */
-		reg_write(par, DCMIPP_PRESUR, 0xffffffff);/* FEC:LEC:LSC:FSC */
+		reg_write(inp, DCMIPP_PRESUR, 0xffffffff);/* FEC:LEC:LSC:FSC */
 
 		/* Trig on LSC=0x80 & LEC=0x9d codes, ignore FSC and FEC */
-		reg_write(par, DCMIPP_PRESCR, 0xff9d80ff);/* FEC:LEC:LSC:FSC */
+		reg_write(inp, DCMIPP_PRESCR, 0xff9d80ff);/* FEC:LEC:LSC:FSC */
 	}
 
 	/* Set format */
 	sink_fmt = v4l2_subdev_state_get_format(state, 0);
 	src_fmt = v4l2_subdev_state_get_format(state, 1);
 
-	vpix = dcmipp_par_pix_map_by_code(sink_fmt->code, src_fmt->code);
+	vpix = dcmipp_inp_pix_map_by_code(sink_fmt->code, src_fmt->code);
 	if (!vpix) {
-		dev_err(par->dev, "Invalid sink/src format configuration\n");
+		dev_err(inp->dev, "Invalid sink/src format configuration\n");
 		return -EINVAL;
 	}
 
@@ -313,17 +313,17 @@ static int dcmipp_par_configure(struct dcmipp_par_device *par,
 	if (vpix->prcr_swapcycles)
 		val |= DCMIPP_PRCR_SWAPCYCLES;
 
-	reg_write(par, DCMIPP_PRCR, val);
+	reg_write(inp, DCMIPP_PRCR, val);
 
 	return 0;
 }
 
-static int dcmipp_par_enable_streams(struct v4l2_subdev *sd,
+static int dcmipp_inp_enable_streams(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *state,
 				     u32 pad, u64 streams_mask)
 {
-	struct dcmipp_par_device *par =
-				container_of(sd, struct dcmipp_par_device, sd);
+	struct dcmipp_inp_device *inp =
+				container_of(sd, struct dcmipp_inp_device, sd);
 	struct v4l2_subdev *s_subdev;
 	struct media_pad *s_pad;
 	int ret;
@@ -334,16 +334,16 @@ static int dcmipp_par_enable_streams(struct v4l2_subdev *sd,
 		return -EINVAL;
 	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
 
-	ret = dcmipp_par_configure(par, state);
+	ret = dcmipp_inp_configure(inp, state);
 	if (ret)
 		return ret;
 
 	/* Enable parallel interface */
-	reg_set(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	reg_set(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
 
 	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
 	if (ret < 0) {
-		dev_err(par->dev,
+		dev_err(inp->dev,
 			"failed to start source subdev streaming (%d)\n", ret);
 		return ret;
 	}
@@ -351,12 +351,12 @@ static int dcmipp_par_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int dcmipp_par_disable_streams(struct v4l2_subdev *sd,
+static int dcmipp_inp_disable_streams(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_state *state,
 				      u32 pad, u64 streams_mask)
 {
-	struct dcmipp_par_device *par =
-				container_of(sd, struct dcmipp_par_device, sd);
+	struct dcmipp_inp_device *inp =
+				container_of(sd, struct dcmipp_inp_device, sd);
 	struct v4l2_subdev *s_subdev;
 	struct media_pad *s_pad;
 	int ret;
@@ -369,86 +369,86 @@ static int dcmipp_par_disable_streams(struct v4l2_subdev *sd,
 
 	ret = v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
 	if (ret < 0) {
-		dev_err(par->dev,
+		dev_err(inp->dev,
 			"failed to stop source subdev streaming (%d)\n", ret);
 		return ret;
 	}
 
 	/* Disable parallel interface */
-	reg_clear(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	reg_clear(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
 
 	return 0;
 }
 
-static const struct v4l2_subdev_pad_ops dcmipp_par_pad_ops = {
-	.enum_mbus_code		= dcmipp_par_enum_mbus_code,
-	.enum_frame_size	= dcmipp_par_enum_frame_size,
+static const struct v4l2_subdev_pad_ops dcmipp_inp_pad_ops = {
+	.enum_mbus_code		= dcmipp_inp_enum_mbus_code,
+	.enum_frame_size	= dcmipp_inp_enum_frame_size,
 	.get_fmt		= v4l2_subdev_get_fmt,
-	.set_fmt		= dcmipp_par_set_fmt,
-	.enable_streams		= dcmipp_par_enable_streams,
-	.disable_streams	= dcmipp_par_disable_streams,
+	.set_fmt		= dcmipp_inp_set_fmt,
+	.enable_streams		= dcmipp_inp_enable_streams,
+	.disable_streams	= dcmipp_inp_disable_streams,
 };
 
-static const struct v4l2_subdev_video_ops dcmipp_par_video_ops = {
+static const struct v4l2_subdev_video_ops dcmipp_inp_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
-static const struct v4l2_subdev_ops dcmipp_par_ops = {
-	.pad = &dcmipp_par_pad_ops,
-	.video = &dcmipp_par_video_ops,
+static const struct v4l2_subdev_ops dcmipp_inp_ops = {
+	.pad = &dcmipp_inp_pad_ops,
+	.video = &dcmipp_inp_video_ops,
 };
 
-static void dcmipp_par_release(struct v4l2_subdev *sd)
+static void dcmipp_inp_release(struct v4l2_subdev *sd)
 {
-	struct dcmipp_par_device *par =
-				container_of(sd, struct dcmipp_par_device, sd);
+	struct dcmipp_inp_device *inp =
+				container_of(sd, struct dcmipp_inp_device, sd);
 
-	kfree(par);
+	kfree(inp);
 }
 
-static const struct v4l2_subdev_internal_ops dcmipp_par_int_ops = {
-	.init_state = dcmipp_par_init_state,
-	.release = dcmipp_par_release,
+static const struct v4l2_subdev_internal_ops dcmipp_inp_int_ops = {
+	.init_state = dcmipp_inp_init_state,
+	.release = dcmipp_inp_release,
 };
 
-void dcmipp_par_ent_release(struct dcmipp_ent_device *ved)
+void dcmipp_inp_ent_release(struct dcmipp_ent_device *ved)
 {
-	struct dcmipp_par_device *par =
-			container_of(ved, struct dcmipp_par_device, ved);
+	struct dcmipp_inp_device *inp =
+			container_of(ved, struct dcmipp_inp_device, ved);
 
-	dcmipp_ent_sd_unregister(ved, &par->sd);
+	dcmipp_ent_sd_unregister(ved, &inp->sd);
 }
 
-struct dcmipp_ent_device *dcmipp_par_ent_init(struct device *dev,
+struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
 					      const char *entity_name,
 					      struct v4l2_device *v4l2_dev,
 					      void __iomem *regs)
 {
-	struct dcmipp_par_device *par;
+	struct dcmipp_inp_device *inp;
 	const unsigned long pads_flag[] = {
 		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
 	};
 	int ret;
 
-	/* Allocate the par struct */
-	par = kzalloc(sizeof(*par), GFP_KERNEL);
-	if (!par)
+	/* Allocate the inp struct */
+	inp = kzalloc(sizeof(*inp), GFP_KERNEL);
+	if (!inp)
 		return ERR_PTR(-ENOMEM);
 
-	par->regs = regs;
+	inp->regs = regs;
 
 	/* Initialize ved and sd */
-	ret = dcmipp_ent_sd_register(&par->ved, &par->sd, v4l2_dev,
+	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, v4l2_dev,
 				     entity_name, MEDIA_ENT_F_VID_IF_BRIDGE,
 				     ARRAY_SIZE(pads_flag), pads_flag,
-				     &dcmipp_par_int_ops, &dcmipp_par_ops,
+				     &dcmipp_inp_int_ops, &dcmipp_inp_ops,
 				     NULL, NULL);
 	if (ret) {
-		kfree(par);
+		kfree(inp);
 		return ERR_PTR(ret);
 	}
 
-	par->dev = dev;
+	inp->dev = dev;
 
-	return &par->ved;
+	return &inp->ved;
 }

-- 
2.25.1


