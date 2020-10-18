Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD38291774
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 14:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgJRMwv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 08:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgJRMwq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 08:52:46 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB94C0613D1;
        Sun, 18 Oct 2020 05:52:46 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id j136so10038523wmj.2;
        Sun, 18 Oct 2020 05:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CUpjsGFpI2BjYmiF7pe5Tqig2cImsk5D1pT2RLQsasI=;
        b=jco2ZbumgdtGc+nSnQoCYBkpUcweMZJcmQyM0N2prCYAG83Dr/ALmRIypBxoAzK1bZ
         OzBSeKK3J9Olh8bp+CGRrDPcUmAHoHH02kVR+9naDwguiATh2WEbTddiyXtH5rhJXcf+
         ElYLOivRXG7T/GZAqGVVPQF8nEO4kHnbo32gIU8N5WH0r5GY/LTEtx+1yO5xLwK274gc
         k6/gkIyy/pWomHj3D1WKBEX1nuk11UWAKzR9W1/mAW3G2zv9xsLeZVs7s2LnZ1urZI12
         F1owkz/7tH/9UQh041Cxcz4MTgSJIPkCIhc7y5iVYsMX9oMbChz20ID5BT1nLacUqdLh
         7WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CUpjsGFpI2BjYmiF7pe5Tqig2cImsk5D1pT2RLQsasI=;
        b=ZvUi4UIPgNcKCxYm9dRj4ry13x/OwYUjZPg3wdDC6J2ULmj9Izd/jW9IcJ0m8qHC5z
         H9ASIrAvPkV2/w6snYEwPZcIPk8KMR0RmkkgZMmS2ZfNuETVRYddgtuftMf4dkqT25nO
         L048ff7tyxtuqX+Hwb6/T6rbwK4J6dLFDyyw2YVODheDR6O3W3r5d2gsx5HsDqXYxpn8
         1dV+3AXa70QwhCw6ZlbydyF7YcjbRjpVVZW5xe12Lpv4jHeYtbMvQR0iVjbm2SlHPQdj
         AA3sScULWts2EMETv0RMX2oMMhCJ0XvpLZmwA5nLbRcsiluZVvAm93AW80q8P3tCPYrg
         k6fA==
X-Gm-Message-State: AOAM531hQ887RgMog0xk3+PaDF1EWr0aXWagDAx9+TJ147ninX7EdPXZ
        fxNuckTslD3MTl2/mpOYivQ=
X-Google-Smtp-Source: ABdhPJz6Bqop65XosAKAyTk3Ci91cVmY8llLkKWni8UlKRWbObJ4pniTG8+2cCXRAZ5d8YeyqslTBg==
X-Received: by 2002:a1c:ab55:: with SMTP id u82mr13559269wme.152.1603025564960;
        Sun, 18 Oct 2020 05:52:44 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u2sm11940158wme.1.2020.10.18.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:52:44 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 4/6] media: camss: Add support for SDM630/636/660 camera subsystem
Date:   Sun, 18 Oct 2020 14:52:35 +0200
Message-Id: <20201018125237.16717-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018125237.16717-1-kholk11@gmail.com>
References: <20201018125237.16717-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add support for the Qualcomm SDM630/636/660 and SDA variants' camera
subsystem. These SoCs are equipped with:
- 3x CSI PHY 3-Phase v1.0 (downstream csiphy-v3.5)
- 4x CSID v5.0
- 2x ISPIF v3.0
- 2x VFE 4.8
As a note, this camera subsystem is very similar to the one that
is found in the MSM8998/APQ8098 SoCs.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../media/platform/qcom/camss/camss-csid.c    |   9 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   3 +-
 .../media/platform/qcom/camss/camss-ispif.c   |  17 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  19 +-
 .../media/platform/qcom/camss/camss-video.c   |   3 +-
 drivers/media/platform/qcom/camss/camss.c     | 206 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 7 files changed, 238 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 2ffcda06706b..be3fe76f3dc3 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -383,7 +383,8 @@ static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
 			return 0;
 
 		return sink_code;
-	} else if (csid->camss->version == CAMSS_8x96) {
+	} else if (csid->camss->version == CAMSS_8x96 ||
+		   csid->camss->version == CAMSS_660) {
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_SBGGR10_1X10:
 		{
@@ -718,7 +719,8 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 		val |= df << CAMSS_CSID_CID_n_CFG_DECODE_FORMAT_SHIFT;
 		val |= CAMSS_CSID_CID_n_CFG_RDI_MODE_RAW_DUMP;
 
-		if (csid->camss->version == CAMSS_8x96) {
+		if (csid->camss->version == CAMSS_8x96 ||
+		    csid->camss->version == CAMSS_660) {
 			u32 sink_code = csid->fmt[MSM_CSID_PAD_SINK].code;
 			u32 src_code = csid->fmt[MSM_CSID_PAD_SRC].code;
 
@@ -1098,7 +1100,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 		csid->formats = csid_formats_8x16;
 		csid->nformats =
 				ARRAY_SIZE(csid_formats_8x16);
-	} else if (camss->version == CAMSS_8x96) {
+	} else if (camss->version == CAMSS_8x96 ||
+		   camss->version == CAMSS_660) {
 		csid->formats = csid_formats_8x96;
 		csid->nformats =
 				ARRAY_SIZE(csid_formats_8x96);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 03ef9c5f4774..c00f25aac21b 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -552,7 +552,8 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		csiphy->ops = &csiphy_ops_2ph_1_0;
 		csiphy->formats = csiphy_formats_8x16;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x16);
-	} else if (camss->version == CAMSS_8x96) {
+	} else if (camss->version == CAMSS_8x96 ||
+		   camss->version == CAMSS_660) {
 		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_8x96;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index 252db6b33dab..adeb92808998 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -263,6 +263,7 @@ static irqreturn_t ispif_isr_8x16(int irq, void *dev)
 
 static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
 {
+	unsigned long time;
 	u32 val;
 
 	if (vfe_id > (to_camss(ispif)->vfe_num - 1)) {
@@ -315,7 +316,6 @@ static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
  */
 static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
 {
-	unsigned long time;
 	int ret;
 
 	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE0);
@@ -825,7 +825,8 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
 		ispif_select_csid(ispif, intf, csid, vfe, 1);
 		ispif_select_cid(ispif, intf, cid, vfe, 1);
 		ispif_config_irq(ispif, intf, vfe, 1);
-		if (to_camss(ispif)->version == CAMSS_8x96)
+		if (to_camss(ispif)->version == CAMSS_8x96 ||
+		    to_camss(ispif)->version == CAMSS_660)
 			ispif_config_pack(ispif,
 					  line->fmt[MSM_ISPIF_PAD_SINK].code,
 					  intf, cid, vfe, 1);
@@ -842,7 +843,8 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
 			return ret;
 
 		mutex_lock(&ispif->config_lock);
-		if (to_camss(ispif)->version == CAMSS_8x96)
+		if (to_camss(ispif)->version == CAMSS_8x96 ||
+		    to_camss(ispif)->version == CAMSS_660)
 			ispif_config_pack(ispif,
 					  line->fmt[MSM_ISPIF_PAD_SINK].code,
 					  intf, cid, vfe, 0);
@@ -1098,7 +1100,8 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
 	/* Number of ISPIF lines - same as number of CSID hardware modules */
 	if (to_camss(ispif)->version == CAMSS_8x16)
 		ispif->line_num = 2;
-	else if (to_camss(ispif)->version == CAMSS_8x96)
+	else if (to_camss(ispif)->version == CAMSS_8x96 ||
+		 to_camss(ispif)->version == CAMSS_660)
 		ispif->line_num = 4;
 	else
 		return -EINVAL;
@@ -1116,7 +1119,8 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
 			ispif->line[i].formats = ispif_formats_8x16;
 			ispif->line[i].nformats =
 					ARRAY_SIZE(ispif_formats_8x16);
-		} else if (to_camss(ispif)->version == CAMSS_8x96) {
+		} else if (to_camss(ispif)->version == CAMSS_8x96 ||
+			   to_camss(ispif)->version == CAMSS_660) {
 			ispif->line[i].formats = ispif_formats_8x96;
 			ispif->line[i].nformats =
 					ARRAY_SIZE(ispif_formats_8x96);
@@ -1156,7 +1160,8 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
 	if (to_camss(ispif)->version == CAMSS_8x16)
 		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x16,
 			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
-	else if (to_camss(ispif)->version == CAMSS_8x96)
+	else if (to_camss(ispif)->version == CAMSS_8x96 ||
+		 to_camss(ispif)->version == CAMSS_660)
 		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x96,
 			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
 	else
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b7d2293a5004..fae2b513b2f9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -205,7 +205,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 
 			return sink_code;
 		}
-	else if (vfe->camss->version == CAMSS_8x96)
+	else if (vfe->camss->version == CAMSS_8x96 ||
+		 vfe->camss->version == CAMSS_660)
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_2X8:
 		{
@@ -1991,12 +1992,19 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	vfe->isr_ops.comp_done = vfe_isr_comp_done;
 	vfe->isr_ops.wm_done = vfe_isr_wm_done;
 
-	if (camss->version == CAMSS_8x16)
+	switch (camss->version) {
+	case CAMSS_8x16:
 		vfe->ops = &vfe_ops_4_1;
-	else if (camss->version == CAMSS_8x96)
+		break;
+	case CAMSS_8x96:
 		vfe->ops = &vfe_ops_4_7;
-	else
+		break;
+	case CAMSS_660:
+		vfe->ops = &vfe_ops_4_8;
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	/* Memory */
 
@@ -2095,7 +2103,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 				l->formats = formats_rdi_8x16;
 				l->nformats = ARRAY_SIZE(formats_rdi_8x16);
 			}
-		} else if (camss->version == CAMSS_8x96) {
+		} else if (camss->version == CAMSS_8x96 ||
+			   camss->version == CAMSS_660) {
 			if (i == VFE_LINE_PIX) {
 				l->formats = formats_pix_8x96;
 				l->nformats = ARRAY_SIZE(formats_pix_8x96);
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 114c3ae4a4ab..fbba9e45d732 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -970,7 +970,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 			video->formats = formats_rdi_8x16;
 			video->nformats = ARRAY_SIZE(formats_rdi_8x16);
 		}
-	} else if (video->camss->version == CAMSS_8x96) {
+	} else if (video->camss->version == CAMSS_8x96 ||
+		   video->camss->version == CAMSS_660) {
 		if (is_pix) {
 			video->formats = formats_pix_8x96;
 			video->nformats = ARRAY_SIZE(formats_pix_8x96);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9186881afc98..8fefce57bc49 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -283,6 +283,188 @@ static const struct resources vfe_res_8x96[] = {
 	}
 };
 
+static const struct resources csiphy_res_660[] = {
+	/* CSIPHY0 */
+	{
+		.regulator = { NULL },
+		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer",
+			   "csi0_phy", "csiphy_ahb2crif" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 269333333 },
+				{ 0 } },
+		.reg = { "csiphy0", "csiphy0_clk_mux" },
+		.interrupt = { "csiphy0" }
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulator = { NULL },
+		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer",
+			   "csi1_phy", "csiphy_ahb2crif" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 269333333 },
+				{ 0 } },
+		.reg = { "csiphy1", "csiphy1_clk_mux" },
+		.interrupt = { "csiphy1" }
+	},
+
+	/* CSIPHY2 */
+	{
+		.regulator = { NULL },
+		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy2_timer",
+			   "csi2_phy", "csiphy_ahb2crif" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 269333333 },
+				{ 0 } },
+		.reg = { "csiphy2", "csiphy2_clk_mux" },
+		.interrupt = { "csiphy2" }
+	}
+};
+
+static const struct resources csid_res_660[] = {
+	/* CSID0 */
+	{
+		.regulator = { "vdda", "vdd_sec" },
+		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
+			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi",
+			   "cphy_csid0" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 310000000,
+				  404000000, 465000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" }
+	},
+
+	/* CSID1 */
+	{
+		.regulator = { "vdda", "vdd_sec" },
+		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
+			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi",
+			   "cphy_csid1" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 310000000,
+				  404000000, 465000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" }
+	},
+
+	/* CSID2 */
+	{
+		.regulator = { "vdda", "vdd_sec" },
+		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
+			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi",
+			   "cphy_csid2" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 310000000,
+				  404000000, 465000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" }
+	},
+
+	/* CSID3 */
+	{
+		.regulator = { "vdda", "vdd_sec" },
+		.clock = { "top_ahb", "ispif_ahb", "csi3_ahb", "ahb",
+			   "csi3", "csi3_phy", "csi3_pix", "csi3_rdi",
+			   "cphy_csid3" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 310000000,
+				  404000000, 465000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid3" },
+		.interrupt = { "csid3" }
+	}
+};
+
+static const struct resources_ispif ispif_res_660 = {
+	/* ISPIF */
+	.clock = { "top_ahb", "ahb", "ispif_ahb",
+		   "csi0", "csi0_pix", "csi0_rdi",
+		   "csi1", "csi1_pix", "csi1_rdi",
+		   "csi2", "csi2_pix", "csi2_rdi",
+		   "csi3", "csi3_pix", "csi3_rdi" },
+	.clock_for_reset = { "vfe0", "csi_vfe0", "vfe1", "csi_vfe1" },
+	.reg = { "ispif", "csi_clk_mux" },
+	.interrupt = "ispif"
+};
+
+static const struct resources vfe_res_660[] = {
+	/* VFE0 */
+	{
+		.regulator = { NULL },
+		.clock = { "throttle_axi", "top_ahb", "ahb", "vfe0",
+			   "csi_vfe0", "vfe_ahb", "vfe0_ahb", "vfe_axi",
+			   "vfe0_stream"},
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 120000000, 200000000, 256000000,
+				  300000000, 404000000, 480000000,
+				  540000000, 576000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" }
+	},
+
+	/* VFE1 */
+	{
+		.regulator = { NULL },
+		.clock = { "throttle_axi", "top_ahb", "ahb", "vfe1",
+			   "csi_vfe1", "vfe_ahb", "vfe1_ahb", "vfe_axi",
+			   "vfe1_stream"},
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 120000000, 200000000, 256000000,
+				  300000000, 404000000, 480000000,
+				  540000000, 576000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" }
+	}
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -397,7 +579,8 @@ int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
 
 int camss_pm_domain_on(struct camss *camss, int id)
 {
-	if (camss->version == CAMSS_8x96) {
+	if (camss->version == CAMSS_8x96 ||
+	    camss->version == CAMSS_660) {
 		camss->genpd_link[id] = device_link_add(camss->dev,
 				camss->genpd[id], DL_FLAG_STATELESS |
 				DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
@@ -411,7 +594,8 @@ int camss_pm_domain_on(struct camss *camss, int id)
 
 void camss_pm_domain_off(struct camss *camss, int id)
 {
-	if (camss->version == CAMSS_8x96)
+	if (camss->version == CAMSS_8x96 ||
+	    camss->version == CAMSS_660)
 		device_link_del(camss->genpd_link[id]);
 }
 
@@ -533,6 +717,11 @@ static int camss_init_subdevices(struct camss *camss)
 		csid_res = csid_res_8x96;
 		ispif_res = &ispif_res_8x96;
 		vfe_res = vfe_res_8x96;
+	} else if (camss->version == CAMSS_660) {
+		csiphy_res = csiphy_res_660;
+		csid_res = csid_res_660;
+		ispif_res = &ispif_res_660;
+		vfe_res = vfe_res_660;
 	} else {
 		return -EINVAL;
 	}
@@ -833,6 +1022,12 @@ static int camss_probe(struct platform_device *pdev)
 		camss->csiphy_num = 3;
 		camss->csid_num = 4;
 		camss->vfe_num = 2;
+	} else if (of_device_is_compatible(dev->of_node,
+					   "qcom,sdm660-camss")) {
+		camss->version = CAMSS_660;
+		camss->csiphy_num = 3;
+		camss->csid_num = 4;
+		camss->vfe_num = 2;
 	} else {
 		ret = -EINVAL;
 		goto err_free;
@@ -919,7 +1114,8 @@ static int camss_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (camss->version == CAMSS_8x96) {
+	if (camss->version == CAMSS_8x96 ||
+	    camss->version == CAMSS_660) {
 		camss->genpd[PM_DOMAIN_VFE0] = dev_pm_domain_attach_by_id(
 						camss->dev, PM_DOMAIN_VFE0);
 		if (IS_ERR(camss->genpd[PM_DOMAIN_VFE0]))
@@ -958,7 +1154,8 @@ void camss_delete(struct camss *camss)
 
 	pm_runtime_disable(camss->dev);
 
-	if (camss->version == CAMSS_8x96) {
+	if (camss->version == CAMSS_8x96 ||
+	    camss->version == CAMSS_660) {
 		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0], true);
 		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE1], true);
 	}
@@ -989,6 +1186,7 @@ static int camss_remove(struct platform_device *pdev)
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss" },
 	{ .compatible = "qcom,msm8996-camss" },
+	{ .compatible = "qcom,sdm660-camss" },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 1376b07889bf..3a0484683cd6 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -65,6 +65,7 @@ enum pm_domain {
 enum camss_version {
 	CAMSS_8x16,
 	CAMSS_8x96,
+	CAMSS_660,
 };
 
 struct camss {
-- 
2.28.0

