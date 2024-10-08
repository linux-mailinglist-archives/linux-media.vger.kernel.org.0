Return-Path: <linux-media+bounces-19230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D519946B0
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80907284E5F
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCCC1DF75F;
	Tue,  8 Oct 2024 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NQEG+zG6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728BE1DF723;
	Tue,  8 Oct 2024 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386513; cv=none; b=eqUWTt+GaqXvL3++7vg7KfyhErgiGmthtL1cM7OkUYtbSeVvZjfVZNVFPjlunTYE1mZRX9BxQYypdIcgvIC/HtXXgRrsWPXiMkc6FLjWd7FO8cS4+/t6TXUrS96b2Emj5rvYpcX4iUkzdPrpIKV+UODn8G983jY6skPV/kyXghc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386513; c=relaxed/simple;
	bh=EulZ42ek7j1DU5gWBHa75/sHuKweFDV9TM9Z9GZKC4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DaWZQW6iS4kCd9Ravmy6iPX36r5Y1nF8XHT80zcEEyVUquJfXB3rD/HxTbzobS/SO2xxoOL8VSY6Qc+mcVRbcG6Xwi6XO7z4EvOZaEV4A+5eUu/gpKIqH9TL4Y+dIk2Pe1FYXJJQZKMFEZJAN3fFcJ6w2LX7Glhls4bu8D0j448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NQEG+zG6; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989eiZh006897;
	Tue, 8 Oct 2024 13:21:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	YsBzoyzlazmSVnHyA0MsMLskGEWr3CiphbHy7RxsFIk=; b=NQEG+zG62UblX3MN
	0bYVME0xfVQ4xQRYhk7K+MoKxFLrtiKYxW51iAhYNeyKhtomI/wWAIoDipuQLMcH
	dERU83ZCuf4P9YDECnx48BFww4F9UAM7zc5eKIGdwuXfQ/kbPVDs6LLHg36BMDa/
	x+5IIsuuWgLNkLrO10TgGYj4VHiqBma2jnplYn0lLSFrFxF+3u62IjA462SuchOP
	5+UrGZdt1l2py6/zCnTeXozknAbPzmMPdrjEurxcUH5u1r2dFCB2452Gf8K7y0pC
	P9ArN8oNUJwVPjJR2AKcCyMg05SObriaa0DslUQdPdtANkm9hVZPlxy6oJpfoJf3
	gX/1zQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv760rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B7E8A40057;
	Tue,  8 Oct 2024 13:20:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C85F285196;
	Tue,  8 Oct 2024 13:18:17 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:17 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:08 +0200
Subject: [PATCH 06/15] media: stm32: dcmipp: rename dcmipp_parallel into
 dcmipp_input
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-6-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
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
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
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
index 8920d9388a21..159105fb40b8 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-parallel.o dcmipp-byteproc.o dcmipp-bytecap.o
+stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 7a7cf43baf24..fe5f97233f5e 100644
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
index 7f771ea49b78..50b9b964fbc4 100644
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
index ffb71c9fc947..106f2a559812 100644
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
 
-	ret = dcmipp_par_configure(par);
+	ret = dcmipp_inp_configure(inp);
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


