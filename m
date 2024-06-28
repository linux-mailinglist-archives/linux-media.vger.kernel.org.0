Return-Path: <linux-media+bounces-14345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CD91BF8A
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 15:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 659141C2136F
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 13:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E931BE858;
	Fri, 28 Jun 2024 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RPHLfvym"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0341DA23
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581419; cv=none; b=Vp80BPeOpgfY1JsqsSZEtnEtljSKHiCiHtnerBowC/ACgn2R9jB4RKhsEBu+aG0LBpuLij/ZK6+6fh/5ubETwRAZc3+Pb1WV2gi0qgIqxLJOiHp1S57SQw9erzFfO/wttwYWi5I0QSTKP2WefTRtykkKq9j9eZGrvUu0kw2JdG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581419; c=relaxed/simple;
	bh=9voITgKdqlQuD9LkGFbPAUVl+3U+UCEC+OrKHEAi1ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmD0LzHUPMtDfjAiaf3wJoKhr0nbuW61mhyLelp65p3mtQgG1AkANAgYtgEsplrvO+6QKYMP3ikENpNFngUcLImWx7aTXH5he2PFcFvLtW/UaqCkbVRsWVOwadt4+AV1ROmFT6q/4CD2sEfAxqxpSrK352FhLlEzXj/FnVXuDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RPHLfvym; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EDCA1BB3;
	Fri, 28 Jun 2024 15:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719581382;
	bh=9voITgKdqlQuD9LkGFbPAUVl+3U+UCEC+OrKHEAi1ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RPHLfvymjQTEU//su1C5E8K26RMKTvkMuf5D+/rp+qJ/rbMwz7L8GLeKElMs9Rk38
	 aSimK1uolsqgSEH5Ls2hiEetCP/pQaemdM/z1StBOhFb8hsnhjFEVDsqvZwBIM8NY5
	 FnlFWJxgOdxyVDNdvmKNBSOjLEaUQWnJEzLHS/IQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Naushir Patuck <naush@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 5/5] media: uapi: pisp_be_config: Add extra config fields
Date: Fri, 28 Jun 2024 15:29:46 +0200
Message-ID: <20240628132948.871568-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628132948.871568-1-jacopo.mondi@ideasonboard.com>
References: <20240628132948.871568-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete the pisp_be_config strcture by adding fields that even if not
written to the HW are relevant to complete the uAPI and put it in par
with the BSP driver.

Fixes: c6c49bac8770 ("media: uapi: Add Raspberry Pi PiSP Back End uAPI")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../linux/media/raspberrypi/pisp_be_config.h  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
index f8650ca92bf8..cbeb714f4d61 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -716,6 +716,13 @@ struct pisp_be_hog_buffer_config {
 /**
  * struct pisp_be_config - RaspberryPi PiSP Back End Processing configuration
  *
+ * @input_buffer:		Input buffer addresses
+ * @tdn_input_buffer:		TDN input buffer addresses
+ * @stitch_input_buffer:	Stitch input buffer addresses
+ * @tdn_output_buffer:		TDN output buffer addresses
+ * @stitch_output_buffer:	Stitch output buffer addresses
+ * @output_buffer:		Output buffers addresses
+ * @hog_buffer:			HOG buffer addresses
  * @global:			Global PiSP configuration
  * @input_format:		Input image format
  * @decompress:			Decompress configuration
@@ -753,8 +760,30 @@ struct pisp_be_hog_buffer_config {
  * @resample:			Resampling configuration
  * @output_format:		Output format configuration
  * @hog:			HOG configuration
+ * @axi:			AXI bus configuration
+ * @lsc_extra:			LSC extra info
+ * @cac_extra:			CAC extra info
+ * @downscale_extra:		Downscaler extra info
+ * @resample_extra:		Resample extra info
+ * @crop:			Crop configuration
+ * @hog_format:			HOG format info
+ * @dirty_flags_bayer:		Bayer enable dirty flags
+ *				(:c:type:`pisp_be_bayer_enable`)
+ * @dirty_flags_rgb:		RGB enable dirty flags
+ *				(:c:type:`pisp_be_rgb_enable`)
+ * @dirty_flags_extra:		Extra dirty flags
  */
 struct pisp_be_config {
+	/* I/O configuration: */
+	struct pisp_be_input_buffer_config input_buffer;
+	struct pisp_be_tdn_input_buffer_config tdn_input_buffer;
+	struct pisp_be_stitch_input_buffer_config stitch_input_buffer;
+	struct pisp_be_tdn_output_buffer_config tdn_output_buffer;
+	struct pisp_be_stitch_output_buffer_config stitch_output_buffer;
+	struct pisp_be_output_buffer_config
+				output_buffer[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_hog_buffer_config hog_buffer;
+	/* Processing configuration: */
 	struct pisp_be_global_config global;
 	struct pisp_image_format_config input_format;
 	struct pisp_decompress_config decompress;
@@ -793,6 +822,18 @@ struct pisp_be_config {
 	struct pisp_be_output_format_config
 				output_format[PISP_BACK_END_NUM_OUTPUTS];
 	struct pisp_be_hog_config hog;
+	struct pisp_be_axi_config axi;
+	/* Non-register fields: */
+	struct pisp_be_lsc_extra lsc_extra;
+	struct pisp_be_cac_extra cac_extra;
+	struct pisp_be_downscale_extra
+				downscale_extra[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_resample_extra resample_extra[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_crop_config crop;
+	struct pisp_image_format_config hog_format;
+	__u32 dirty_flags_bayer; /* these use pisp_be_bayer_enable */
+	__u32 dirty_flags_rgb; /* use pisp_be_rgb_enable */
+	__u32 dirty_flags_extra; /* these use pisp_be_dirty_t */
 } __attribute__((packed));
 
 /**
-- 
2.45.2


