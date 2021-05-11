Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B7137AE07
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhEKSJ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhEKSJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:40 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D62C06138C
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:33 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id x8so19687267qkl.2
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i91cFizsPBV8MA2Uj5kzLNOrJC1HJtpUPeOYIYdJAhc=;
        b=i4svDAzBDECAELCp91LocYn4ZympIUR1SLa4ZU2Gz9A9AJPBKI47wkDppOrjYzJ4K8
         +o8/hw78+cZ8rBLYNltRFqUsX+FLsaZZdHQL2UDi8atQzoJmxUl6kFPvrw67x7C4Su3v
         NA738EIYAGbdLFuK1ASTTi435GQofdnLcvBV7nn+6jUIDhXXmJvUYCQMckZtf8H3vFuG
         4EhWeJGJhbTR5VM/TGbBonoCq2pgAa+yTQQferNvscTQY6iuF635GTQb2hcRHzj/U9Y7
         qyObhHl+4z1zzeJLRhkNiQktbrxRrfb7VD/opyOO/yPjtRozucfzXwCwkmVmCU7P7SIk
         /FXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i91cFizsPBV8MA2Uj5kzLNOrJC1HJtpUPeOYIYdJAhc=;
        b=sueuJtgvgv0GKRWr84bC5/5W++S4wb+mCk8xOTlgQlZjX3K259x08VSlk0CGydHdry
         bxwoTXK3uSmBnQkaF+wJcIqf4rlPiuW8LdGZv1G0SUrdI+Oe/9n1Mop7ck4nGwEMD1eJ
         sZVAHBeKdGFM21uljjjUws9pQMw5KH04qNIASC3OSk7XxJIJj7LGthni2o+Ah406LAUQ
         ZExZetMDy2DyPlMtPpC0R9+xZGESN9iNCCdMQgEoCJk805uKw8RR/8dnaRS4b/2TAqlU
         +8lg+rbsyRc2KYkb3e5hq/1fO5z5xE4InjL61vewNKqwnRprlRkHZMWqO043/hZfAuK+
         Msxw==
X-Gm-Message-State: AOAM531aU2lGq2x5MjaHYF5PZGhHWsurSOZEwlziPM/86R31EOYvf1kS
        +b5XqURLjGDnE5s1UME5C0Gpqw==
X-Google-Smtp-Source: ABdhPJzAHFYcBe2YTHcwjlVHPIDEo570ZEeLhza9curMRmy5CHihXeTmo4M4P1KLpmHj1K8kx01jpQ==
X-Received: by 2002:a37:aa0b:: with SMTP id t11mr29114139qke.70.1620756512752;
        Tue, 11 May 2021 11:08:32 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:32 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 16/17] media: camss: add support for SM8250 camss
Date:   Tue, 11 May 2021 14:07:23 -0400
Message-Id: <20210511180728.23781-17-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Titan 480 camss found on SM8250 has 6 CSIPHY and 4 VFE/CSID.

CSID is compatible with the Titan 170 CSID, but the Titan 480 CSID are
inside the VFE region (between the "top" and "bus" registers), so a
workaround is added to avoid ioremap failure.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../media/platform/qcom/camss/camss-csid.c    |  22 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   9 +-
 .../media/platform/qcom/camss/camss-video.c   |   3 +-
 drivers/media/platform/qcom/camss/camss.c     | 196 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 6 files changed, 217 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 528674dea06c..5ba603549a4f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -560,7 +560,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	} else if (camss->version == CAMSS_8x96 ||
 		   camss->version == CAMSS_660) {
 		csid->ops = &csid_ops_4_7;
-	} else if (camss->version == CAMSS_845) {
+	} else if (camss->version == CAMSS_845 ||
+		   camss->version == CAMSS_8250) {
 		csid->ops = &csid_ops_170;
 	} else {
 		return -EINVAL;
@@ -569,10 +570,21 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Memory */
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
-	csid->base = devm_ioremap_resource(dev, r);
-	if (IS_ERR(csid->base))
-		return PTR_ERR(csid->base);
+	if (camss->version == CAMSS_8250) {
+		/* for titan 480, CSID registers are inside the VFE region,
+		 * between the VFE "top" and "bus" registers. this requires
+		 * VFE to be initialized before CSID
+		 */
+		if (id >= 2) /* VFE/CSID lite */
+			csid->base = camss->vfe[id].base + 0x200;
+		else
+			csid->base = camss->vfe[id].base + 0x1200;
+	} else {
+		r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
+		csid->base = devm_ioremap_resource(dev, r);
+		if (IS_ERR(csid->base))
+			return PTR_ERR(csid->base);
+	}
 
 	/* Interrupt */
 
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f82f1e2aa688..1d10c816acf5 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -582,7 +582,8 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_8x96;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
-	} else if (camss->version == CAMSS_845) {
+	} else if (camss->version == CAMSS_845 ||
+		   camss->version == CAMSS_8250) {
 		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_sdm845;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
@@ -679,7 +680,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 
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
index e7ab2c175ac9..d543048c10a8 100644
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
@@ -1294,6 +1295,9 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	case CAMSS_845:
 		vfe->ops = &vfe_ops_170;
 		break;
+	case CAMSS_8250:
+		vfe->ops = &vfe_ops_480;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1405,7 +1409,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
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
index 54e77d30d452..5dc1ddbe6d65 100644
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
index c08d6d6f6f90..463850725f37 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -662,6 +662,162 @@ static const struct resources vfe_res_845[] = {
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
+		.clock = { "vfe0_ahb", "vfe0_areg", "vfe0", "vfe0_axi", "cam_hf_axi" },
+		.clock_rate = { { 0 },
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
+		.clock = { "vfe1_ahb", "vfe1_areg", "vfe1", "vfe1_axi", "cam_hf_axi" },
+		.clock_rate = { { 0 },
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
+		.clock = { "vfe_lite_ahb", "vfe_lite_axi", "vfe_lite", "cam_hf_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" }
+	},
+
+	/* VFE3 (lite) */
+	{
+		.regulator = { NULL },
+		.clock = { "vfe_lite_ahb", "vfe_lite_axi", "vfe_lite", "cam_hf_axi" },
+		.clock_rate = { { 0 },
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
@@ -945,6 +1101,12 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -960,6 +1122,17 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -978,16 +1151,6 @@ static int camss_init_subdevices(struct camss *camss)
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
 
@@ -1250,7 +1413,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
-	else if (camss->version == CAMSS_845)
+	else if (camss->version == CAMSS_845 ||
+		 camss->version == CAMSS_8250)
 		nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
@@ -1326,6 +1490,12 @@ static int camss_probe(struct platform_device *pdev)
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
@@ -1457,7 +1627,8 @@ void camss_delete(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
-	else if (camss->version == CAMSS_845)
+	else if (camss->version == CAMSS_845 ||
+		 camss->version == CAMSS_8250)
 		nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
@@ -1493,6 +1664,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8996-camss" },
 	{ .compatible = "qcom,sdm660-camss" },
 	{ .compatible = "qcom,sdm845-camss" },
+	{ .compatible = "qcom,sm8250-camss" },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index dc8b4154f92b..377e2474a485 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -69,6 +69,7 @@ enum camss_version {
 	CAMSS_8x96,
 	CAMSS_660,
 	CAMSS_845,
+	CAMSS_8250,
 };
 
 struct camss {
-- 
2.26.1

