Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2978F5F8D3C
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 20:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbiJIShO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 14:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiJIShJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 14:37:09 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C07C255AE
        for <linux-media@vger.kernel.org>; Sun,  9 Oct 2022 11:37:08 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id s2so13306400edd.2
        for <linux-media@vger.kernel.org>; Sun, 09 Oct 2022 11:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7ibMfN1OlSZEzikWBCpF77L0XuDKzYJAH36cuAfswg=;
        b=CT3Slm/NNm24I9faznowoYraYCyP2+b1Z02CA7ep1Ln0Zto7eW3syQ86lYCzydTsjt
         vKSnX5VQX339bTWU3IPVLVBU3v/kf5jzOQ0K7BmG6M4WMledChPaKzNdInMBrOCYnAzI
         2n5mU6xJqvbczlTqm4hPIlw1pCVd6C4TSzggRv8Fhr3CdGeWrxiLMqr3A4PG2CQJNqAm
         c49p9TvfnhZc36omF571sWO2qcuG64DUk1x4Sq8Eozy9r6V3JoUjmaa5XJKdxD/GxQBV
         WRAf4QqpTXcAFEAYio97qRMH3u+KYc5RWKsVhtNZ/KsoKVGlwZu5WyRzOOlCeBZvGIXb
         qKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7ibMfN1OlSZEzikWBCpF77L0XuDKzYJAH36cuAfswg=;
        b=R+aYLuLWCCjchbNFGIueWPFPMKT760OYjtt9j0a7mqUYx8uMZPmixHsIFigs4JbbMB
         Ef4+BaZUsRUpnIh5LNDXa7rcWyEUjuWcUwXrYAHLN1LNmYUXgC+vh7hrREVrmTkS6NOn
         OZiaLfJWUAxPbXIZAx8aTyb3r7w635VyXwvJHJNNCZ46kZpFS1XKUvRRvI5TXkwPa3+e
         rtldhvx0dOubMdyj3fYItFQLRc1c0e1DxjQcdH7YtDbQtd5H61FhmVqXFRYF6f37Aauv
         EXzT4g+4Oe0nNfA+VZw3mx1qw7nUfDemZk9r+QiH5fjGB988AitVTcIpeEjs/V5k3LeP
         kZ3Q==
X-Gm-Message-State: ACrzQf17TvM5B2XS1q+tPm/4URr2plPhqNyGt/nIzs5a+oPDw0ka4Z7P
        Y30Qkz7kPXj8kxLxvNqtVGxAb9nqxzfuVWR5
X-Google-Smtp-Source: AMsMyM4mqWg2iKCRGP6bvzn+Dt7/d69pbCMIl/+VFF/3XA1x67+Y6PpjF7lqbLZVtzJqAL9eq4o9hA==
X-Received: by 2002:a05:6402:d5f:b0:458:dc7e:f728 with SMTP id ec31-20020a0564020d5f00b00458dc7ef728mr14760001edb.220.1665340626452;
        Sun, 09 Oct 2022 11:37:06 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5370.dip0.t-ipconnect.de. [84.172.83.112])
        by smtp.googlemail.com with ESMTPSA id o14-20020a50fd8e000000b00459148fbb3csm5610050edt.86.2022.10.09.11.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 11:37:06 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] media: rcar-vin: Add support for Gen3 UDS (Up Down Scaler)
Date:   Sun,  9 Oct 2022 20:35:51 +0200
Message-Id: <20221009183551.1664631-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221009183551.1664631-1-niklas.soderlund+renesas@ragnatech.se>
References: <20221009183551.1664631-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the UDS (Up Down Scaler) found in some Gen3 SoCs.

Not all Gen3 SoCs have scalers, and for those that do it's only
available to the master node of each VIN group. The setup for which SoCs
and nodes have access to a scaler are dealt with at probe time and then
function transparently reusing the schema from the already present Gen2
scaler.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     |  9 +++
 .../platform/renesas/rcar-vin/rcar-dma.c      | 70 +++++++++++++++++++
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  3 +
 .../platform/renesas/rcar-vin/rcar-vin.h      |  1 +
 4 files changed, 83 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c70c29a82ce1..fec6d623afe4 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1181,6 +1181,7 @@ static const struct rvin_info rcar_info_r8a7795 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a7795_routes,
+	.scaler = rvin_scaler_gen3,
 };
 
 static const struct rvin_group_route rcar_info_r8a7795es1_routes[] = {
@@ -1216,6 +1217,7 @@ static const struct rvin_info rcar_info_r8a7796 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a7796_routes,
+	.scaler = rvin_scaler_gen3,
 };
 
 static const struct rvin_group_route rcar_info_r8a77965_routes[] = {
@@ -1233,6 +1235,7 @@ static const struct rvin_info rcar_info_r8a77965 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77965_routes,
+	.scaler = rvin_scaler_gen3,
 };
 
 static const struct rvin_group_route rcar_info_r8a77970_routes[] = {
@@ -1275,6 +1278,7 @@ static const struct rvin_info rcar_info_r8a77990 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77990_routes,
+	.scaler = rvin_scaler_gen3,
 };
 
 static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
@@ -1288,6 +1292,7 @@ static const struct rvin_info rcar_info_r8a77995 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77995_routes,
+	.scaler = rvin_scaler_gen3,
 };
 
 static const struct rvin_info rcar_info_r8a779a0 = {
@@ -1416,6 +1421,10 @@ static int rcar_vin_probe(struct platform_device *pdev)
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
 		ret = rvin_csi2_init(vin);
+
+		if (vin->info->scaler &&
+		    rvin_group_id_to_master(vin->id) == vin->id)
+			vin->scaler = vin->info->scaler;
 	} else {
 		ret = rvin_parallel_init(vin);
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 0efd98998acb..ae3f93e95ac9 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -74,6 +74,10 @@
 
 /* Register offsets specific for Gen3 */
 #define VNCSI_IFMD_REG		0x20 /* Video n CSI2 Interface Mode Register */
+#define VNUDS_CTRL_REG		0x80 /* Video n scaling control register */
+#define VNUDS_SCALE_REG		0x84 /* Video n scaling factor register */
+#define VNUDS_PASS_BWIDTH_REG	0x90 /* Video n passband register */
+#define VNUDS_CLIP_SIZE_REG	0xa4 /* Video n UDS output size clipping reg */
 
 /* Register bit fields for R-Car VIN */
 /* Video n Main Control Register bits */
@@ -140,6 +144,9 @@
 #define VNCSI_IFMD_DES0		(1 << 25)
 #define VNCSI_IFMD_CSI_CHSEL(n) (((n) & 0xf) << 0)
 
+/* Video n scaling control register (Gen3) */
+#define VNUDS_CTRL_AMD		(1 << 30)
+
 struct rvin_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head list;
@@ -591,6 +598,69 @@ void rvin_scaler_gen2(struct rvin_dev *vin)
 		0, 0);
 }
 
+static unsigned int rvin_uds_scale_ratio(unsigned int in, unsigned int out)
+{
+	unsigned int ratio;
+
+	ratio = in * 4096 / out;
+	return ratio >= 0x10000 ? 0xffff : ratio;
+}
+
+static unsigned int rvin_uds_filter_width(unsigned int ratio)
+{
+	if (ratio >= 0x1000)
+		return 64 * (ratio & 0xf000) / ratio;
+
+	return 64;
+}
+
+void rvin_scaler_gen3(struct rvin_dev *vin)
+{
+	unsigned int ratio_h, ratio_v;
+	unsigned int bwidth_h, bwidth_v;
+	u32 vnmc, clip_size;
+
+	vnmc = rvin_read(vin, VNMC_REG);
+
+	/* Disable scaler if not needed. */
+	if (!rvin_scaler_needed(vin)) {
+		rvin_write(vin, vnmc & ~VNMC_SCLE, VNMC_REG);
+		return;
+	}
+
+	ratio_h = rvin_uds_scale_ratio(vin->crop.width, vin->compose.width);
+	bwidth_h = rvin_uds_filter_width(ratio_h);
+
+	ratio_v = rvin_uds_scale_ratio(vin->crop.height, vin->compose.height);
+	bwidth_v = rvin_uds_filter_width(ratio_v);
+
+	clip_size = vin->compose.width << 16;
+
+	switch (vin->format.field) {
+	case V4L2_FIELD_INTERLACED_TB:
+	case V4L2_FIELD_INTERLACED_BT:
+	case V4L2_FIELD_INTERLACED:
+	case V4L2_FIELD_SEQ_TB:
+	case V4L2_FIELD_SEQ_BT:
+		clip_size |= vin->compose.height / 2;
+		break;
+	default:
+		clip_size |= vin->compose.height;
+		break;
+	}
+
+	rvin_write(vin, vnmc | VNMC_SCLE, VNMC_REG);
+	rvin_write(vin, VNUDS_CTRL_AMD, VNUDS_CTRL_REG);
+	rvin_write(vin, (ratio_h << 16) | ratio_v, VNUDS_SCALE_REG);
+	rvin_write(vin, (bwidth_h << 16) | bwidth_v, VNUDS_PASS_BWIDTH_REG);
+	rvin_write(vin, clip_size, VNUDS_CLIP_SIZE_REG);
+
+	vin_dbg(vin, "Pre-Clip: %ux%u@%u:%u Post-Clip: %ux%u@%u:%u\n",
+		vin->crop.width, vin->crop.height, vin->crop.left,
+		vin->crop.top, vin->compose.width, vin->compose.height,
+		vin->compose.left, vin->compose.top);
+}
+
 void rvin_crop_scale_comp(struct rvin_dev *vin)
 {
 	const struct rvin_video_format *fmt;
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 07564e05ed8c..073f70c6ac68 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -918,6 +918,9 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
 	.vidioc_s_fmt_vid_cap		= rvin_mc_s_fmt_vid_cap,
 	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
 
+	.vidioc_g_selection		= rvin_g_selection,
+	.vidioc_s_selection		= rvin_s_selection,
+
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
 	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
 	.vidioc_querybuf		= vb2_ioctl_querybuf,
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 334c327889a0..cb206d3976dd 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -308,6 +308,7 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
 
 /* Cropping, composing and scaling */
 void rvin_scaler_gen2(struct rvin_dev *vin);
+void rvin_scaler_gen3(struct rvin_dev *vin);
 void rvin_crop_scale_comp(struct rvin_dev *vin);
 
 int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel);
-- 
2.37.3

