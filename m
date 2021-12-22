Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D6447CA68
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239995AbhLVAgG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:36:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239931AbhLVAgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:36:05 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE17C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:05 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id e5so1334721wrc.5
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7fyU18k+mvpWurEKXRhHfbJerjTd/u2Xk8Iya05ZuYM=;
        b=LTIY654+0uM1MMx5Gmq4Qb2OgoOx2Ap/sz4xOWV9bKP/UoalfuEXKLcAbUDZnZ0Lj2
         rSGJXtiMyGf+fnFOFa/pgMkPgFfqSbCJQIDlM/AZ9LgwjZqzJqN9wG6tPQ05mobbhkvD
         dbqgr1sUTT2FLb1i3alcIcT0r0EC76kGwEcCeZ1TAwi5d1QyL/1CEIhaH+jZZcjusM6f
         BGpkbGd6y2tJu8q3woh/kivuCCgTL/flEek7SEln7AIJoidcOYh68N6Yg/9rbRPQmLM/
         vpau3pQ4A9FkvxR4tlMOvNBKVUDJ/0gap2jaub1RnfFrabXqAYjK7EsnQTdqhEAwL3vv
         hB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7fyU18k+mvpWurEKXRhHfbJerjTd/u2Xk8Iya05ZuYM=;
        b=ny4vP9lmBBgcNNwBPpqy/pVnORmys1cX09WCz0Rx6dCDmzkH9wbYMVJcbe5zxCLiXz
         aFV6a/OhaFJTwLhHy0AkdGHKTD1oklbb60vwczobn1FzT4EtOntckBrHc1GbgwlwaFRQ
         IOGz8c3GUFY/HQ5tZv0dlP5j9J3Rvs7nUZ7JIUonr/YHDzlXNNe5ngC3FBJT8/XFXrSe
         OOpEIvo0cj/jLhMcGikvodh08HMPq0GNcOhj7Iwf8ltP7XnCxCK+2DYs4l378BVwsD2g
         zaEbGI7Uof1VSRnnDjA6IQEwuypvUely1qQeWb85X8XiegboiJbxoIMXkPNNZqwwBoLL
         Dmxw==
X-Gm-Message-State: AOAM530aMQ0mkagXFqoQccziu0q36WoeQihBJK7ZeDuQKCTM9JdaJl6h
        am6qnptQB00Pb5bPpPXCBgMKpQ==
X-Google-Smtp-Source: ABdhPJw3DBeabgz+0P2+aCoMLSr6s7jvewQNsK7J6UgN96vKjZ+Cwan1UnHWQ/CHdsslICLpjIlcog==
X-Received: by 2002:adf:e0c7:: with SMTP id m7mr397292wri.530.1640133363717;
        Tue, 21 Dec 2021 16:36:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:36:03 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 16/19] media: camss: add support for SM8250 camss
Date:   Wed, 22 Dec 2021 00:37:48 +0000
Message-Id: <20211222003751.2461466-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

The Titan 480 camss found on SM8250 has 6 CSIPHY and 4 VFE/CSID.

CSID is compatible with the Titan 170 CSID, but the Titan 480 CSID are
inside the VFE region (between the "top" and "bus" registers), so a
workaround is added to avoid ioremap failure.

[bod] Fixed setting camnoc_axi_clk_src instead of camcc_camnoc_axi_clk
[jgrahsl, bod] Add slow_ahb_src clock values
[jgrahsl, bod] Add cpa_ahb clock values

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile    |   2 +-
 .../{camss-csid-170.c => camss-csid-gen2.c}   |   2 +-
 .../media/platform/qcom/camss/camss-csid.c    |  26 ++-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   9 +-
 .../media/platform/qcom/camss/camss-video.c   |   3 +-
 drivers/media/platform/qcom/camss/camss.c     | 219 +++++++++++++++++-
 8 files changed, 246 insertions(+), 25 deletions(-)
 rename drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} (99%)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 81dd56aff0f27..4e22223589739 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -6,7 +6,7 @@ qcom-camss-objs += \
 		camss-csid.o \
 		camss-csid-4-1.o \
 		camss-csid-4-7.o \
-		camss-csid-170.o \
+		camss-csid-gen2.o \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
 		camss-csiphy.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
similarity index 99%
rename from drivers/media/platform/qcom/camss/camss-csid-170.c
rename to drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 9e54d251793fc..abbfbf4488934 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -594,7 +594,7 @@ static void csid_subdev_init(struct csid_device *csid)
 	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
 }
 
-const struct csid_hw_ops csid_ops_170 = {
+const struct csid_hw_ops csid_ops_gen2 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
 	.hw_version = csid_hw_version,
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 1226913c623b0..9ef6fbbeeddf3 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -25,6 +25,10 @@
 #include "camss-csid-gen1.h"
 #include "camss.h"
 
+/* offset of CSID registers in VFE region for VFE 480 */
+#define VFE_480_CSID_OFFSET 0x1200
+#define VFE_480_LITE_CSID_OFFSET 0x200
+
 #define MSM_CSID_NAME "msm_csid"
 
 const char * const csid_testgen_modes[] = {
@@ -559,8 +563,9 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	} else if (camss->version == CAMSS_8x96 ||
 		   camss->version == CAMSS_660) {
 		csid->ops = &csid_ops_4_7;
-	} else if (camss->version == CAMSS_845) {
-		csid->ops = &csid_ops_170;
+	} else if (camss->version == CAMSS_845 ||
+		   camss->version == CAMSS_8250) {
+		csid->ops = &csid_ops_gen2;
 	} else {
 		return -EINVAL;
 	}
@@ -568,9 +573,20 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Memory */
 
-	csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
-	if (IS_ERR(csid->base))
-		return PTR_ERR(csid->base);
+	if (camss->version == CAMSS_8250) {
+		/* for titan 480, CSID registers are inside the VFE region,
+		 * between the VFE "top" and "bus" registers. this requires
+		 * VFE to be initialized before CSID
+		 */
+		if (id >= 2) /* VFE/CSID lite */
+			csid->base = camss->vfe[id].base + VFE_480_LITE_CSID_OFFSET;
+		else
+			csid->base = camss->vfe[id].base + VFE_480_CSID_OFFSET;
+	} else {
+		csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
+		if (IS_ERR(csid->base))
+			return PTR_ERR(csid->base);
+	}
 
 	/* Interrupt */
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 814ebc7c29d65..17a50fa426be1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -205,7 +205,7 @@ extern const char * const csid_testgen_modes[];
 
 extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
-extern const struct csid_hw_ops csid_ops_170;
+extern const struct csid_hw_ops csid_ops_gen2;
 
 
 #endif /* QC_MSM_CAMSS_CSID_H */
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index de1e81bb97c92..f1d8d883af8e7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -586,7 +586,8 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_8x96;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
-	} else if (camss->version == CAMSS_845) {
+	} else if (camss->version == CAMSS_845 ||
+		   camss->version == CAMSS_8250) {
 		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_sdm845;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
@@ -680,7 +681,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 
 		if (!strcmp(clock->name, "csiphy0_timer") ||
 		    !strcmp(clock->name, "csiphy1_timer") ||
-		    !strcmp(clock->name, "csiphy2_timer"))
+		    !strcmp(clock->name, "csiphy2_timer") ||
+		    !strcmp(clock->name, "csiphy3_timer") ||
+		    !strcmp(clock->name, "csiphy4_timer") ||
+		    !strcmp(clock->name, "csiphy5_timer"))
 			csiphy->rate_set[i] = true;
 
 		if (camss->version == CAMSS_660 &&
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 3d2f554a4ef71..5b5fe620914d0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -220,7 +220,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		}
 	else if (vfe->camss->version == CAMSS_8x96 ||
 		 vfe->camss->version == CAMSS_660 ||
-		 vfe->camss->version == CAMSS_845)
+		 vfe->camss->version == CAMSS_845 ||
+		 vfe->camss->version == CAMSS_8250)
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_2X8:
 		{
@@ -1297,6 +1298,9 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	case CAMSS_845:
 		vfe->ops = &vfe_ops_170;
 		break;
+	case CAMSS_8250:
+		vfe->ops = &vfe_ops_480;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1407,7 +1411,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 				l->formats = formats_rdi_8x96;
 				l->nformats = ARRAY_SIZE(formats_rdi_8x96);
 			}
-		} else if (camss->version == CAMSS_845) {
+		} else if (camss->version == CAMSS_845 ||
+			   camss->version == CAMSS_8250) {
 			l->formats = formats_rdi_845;
 			l->nformats = ARRAY_SIZE(formats_rdi_845);
 		} else {
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 54e77d30d452c..5dc1ddbe6d658 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -1011,7 +1011,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 			video->formats = formats_rdi_8x96;
 			video->nformats = ARRAY_SIZE(formats_rdi_8x96);
 		}
-	}  else if (video->camss->version == CAMSS_845) {
+	}  else if (video->camss->version == CAMSS_845 ||
+		    video->camss->version == CAMSS_8250) {
 		video->formats = formats_rdi_845;
 		video->nformats = ARRAY_SIZE(formats_rdi_845);
 	} else {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 71c6109b05260..066639db9f18b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -662,6 +662,185 @@ static const struct resources vfe_res_845[] = {
 	}
 };
 
+static const struct resources csiphy_res_8250[] = {
+	/* CSIPHY0 */
+	{
+		.regulator = { NULL },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" }
+	},
+	/* CSIPHY1 */
+	{
+		.regulator = { NULL },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" }
+	},
+	/* CSIPHY2 */
+	{
+		.regulator = { NULL },
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" }
+	},
+	/* CSIPHY3 */
+	{
+		.regulator = { NULL },
+		.clock = { "csiphy3", "csiphy3_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" }
+	},
+	/* CSIPHY4 */
+	{
+		.regulator = { NULL },
+		.clock = { "csiphy4", "csiphy4_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" }
+	},
+	/* CSIPHY5 */
+	{
+		.regulator = { NULL },
+		.clock = { "csiphy5", "csiphy5_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" }
+	}
+};
+
+static const struct resources csid_res_8250[] = {
+	/* CSID0 */
+	{
+		.regulator = { NULL },
+		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" }
+	},
+	/* CSID1 */
+	{
+		.regulator = { NULL },
+		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" }
+	},
+	/* CSID2 */
+	{
+		.regulator = { NULL },
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" }
+	},
+	/* CSID3 */
+	{
+		.regulator = { NULL },
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
+		.clock_rate = { { 400000000 },
+				{ 400000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid3" },
+		.interrupt = { "csid3" }
+	}
+};
+
+static const struct resources vfe_res_8250[] = {
+	/* VFE0 */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
+			   "vfe0_axi", "cam_hf_axi" },
+		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
+				{ 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" }
+	},
+	/* VFE1 */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
+			   "vfe1_axi", "cam_hf_axi" },
+		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
+				{ 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" }
+	},
+	/* VFE2 (lite) */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
+			   "vfe_lite", "cam_hf_axi" },
+		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
+				{ 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" }
+	},
+	/* VFE3 (lite) */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
+			   "vfe_lite", "cam_hf_axi" },
+		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
+				{ 19200000, 80000000 },
+				{ 19200000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" }
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -945,6 +1124,12 @@ static int camss_init_subdevices(struct camss *camss)
 		/* Titan VFEs don't have an ISPIF  */
 		ispif_res = NULL;
 		vfe_res = vfe_res_845;
+	} else if (camss->version == CAMSS_8250) {
+		csiphy_res = csiphy_res_8250;
+		csid_res = csid_res_8250;
+		/* Titan VFEs don't have an ISPIF  */
+		ispif_res = NULL;
+		vfe_res = vfe_res_8250;
 	} else {
 		return -EINVAL;
 	}
@@ -960,6 +1145,17 @@ static int camss_init_subdevices(struct camss *camss)
 		}
 	}
 
+	/* note: SM8250 requires VFE to be initialized before CSID */
+	for (i = 0; i < camss->vfe_num; i++) {
+		ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
+					  &vfe_res[i], i);
+		if (ret < 0) {
+			dev_err(camss->dev,
+				"Fail to init vfe%d sub-device: %d\n", i, ret);
+			return ret;
+		}
+	}
+
 	for (i = 0; i < camss->csid_num; i++) {
 		ret = msm_csid_subdev_init(camss, &camss->csid[i],
 					   &csid_res[i], i);
@@ -978,16 +1174,6 @@ static int camss_init_subdevices(struct camss *camss)
 		return ret;
 	}
 
-	for (i = 0; i < camss->vfe_num; i++) {
-		ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
-					  &vfe_res[i], i);
-		if (ret < 0) {
-			dev_err(camss->dev,
-				"Fail to init vfe%d sub-device: %d\n", i, ret);
-			return ret;
-		}
-	}
-
 	return 0;
 }
 
@@ -1250,7 +1436,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
-	else if (camss->version == CAMSS_845)
+	else if (camss->version == CAMSS_845 ||
+		 camss->version == CAMSS_8250)
 		nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
@@ -1326,6 +1513,12 @@ static int camss_probe(struct platform_device *pdev)
 		camss->csiphy_num = 4;
 		camss->csid_num = 3;
 		camss->vfe_num = 3;
+	} else if (of_device_is_compatible(dev->of_node,
+					   "qcom,sm8250-camss")) {
+		camss->version = CAMSS_8250;
+		camss->csiphy_num = 6;
+		camss->csid_num = 4;
+		camss->vfe_num = 4;
 	} else {
 		ret = -EINVAL;
 		goto err_free;
@@ -1457,7 +1650,8 @@ void camss_delete(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
-	else if (camss->version == CAMSS_845)
+	else if (camss->version == CAMSS_845 ||
+		 camss->version == CAMSS_8250)
 		nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
@@ -1493,6 +1687,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8996-camss" },
 	{ .compatible = "qcom,sdm660-camss" },
 	{ .compatible = "qcom,sdm845-camss" },
+	{ .compatible = "qcom,sm8250-camss" },
 	{ }
 };
 
-- 
2.33.0

