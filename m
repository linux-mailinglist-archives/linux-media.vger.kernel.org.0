Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C1F296400
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 19:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369353AbgJVRr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 13:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369261AbgJVRrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 13:47:20 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12AC7C0613CE;
        Thu, 22 Oct 2020 10:47:18 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id c77so3139518wmd.4;
        Thu, 22 Oct 2020 10:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MGfqldUJzSfMGgcYbxeKaFcx2pTUAb1obYq5CsibN9o=;
        b=Sf7Q6g28Q5bH5IW0xzNK18l/4W0k+D8F1qkgpzduRNz2TC/AmSbZc42oSIiPvYyc2f
         +eERucrvzWqoBx+mAQ6mHUMs+v48k9xFauEzPrBwVjqmRIm3AQmMlQJ6fGd49GmX4Qyj
         Kk1ljuqmqHCZVsxZ0tHNibwh85RpLwT/dKpHJA5Nb7mu4Ry8lE7iRJQ+ei2c3Np5B4jp
         IDWWZCbM/pUyEAT7SGFoMRILEmlK+bMD7vXLDeGbEyIpIHp9ZpzUqXoQnWXmI1EnZBmz
         DCY8xlqynh0+IJ3hobomq9qZ6n6UHS0Lc0qXjUFpt3vdP3TpFr/jKLGXeL7a0d9834rp
         DNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MGfqldUJzSfMGgcYbxeKaFcx2pTUAb1obYq5CsibN9o=;
        b=Yy0YnXv859vTzUwKRotaTiUnF9u60I0W+fOTPzD+pVGLWNCHEKL5Ig90cCZKolC6jv
         wpUKutBe21vFtfK5sdas0Lo7oM4ksV7bDJ9S3yAaFees11wGkWPe2zgf+gkpdmSynSaz
         fxIPBduVYebS9FieQ+BzpWvZfsieo+/Gj7dsN2Y60RxzySKB1P87hgodaW5kxtikjSQ7
         4lUbc4ceM3iZWcmEFJtFqk4Zjkn4vvGFVhgsqE3a5xWKGy9HxRbqLFJS72gRSmGtz2kA
         AC2FqU6yBpQsj9vza/ZgqMlv45xMd0rK0YUwE65/wO75gEyZT0UJ5wlFCvkLS8/u0IJV
         kOKg==
X-Gm-Message-State: AOAM530FsPI0aOeU6EEejt1BKt7Hv8nIA72KwIVSpgZZ8etv1h/MSa+b
        vZasx9km5gJ5VhqQHEsJSeA=
X-Google-Smtp-Source: ABdhPJx5jFxopg9SyklxGWK1q8MoGL44r3O1euO9yRC470KxGlaVZHUpAC6is0/4U2YYtqe4TwhRQg==
X-Received: by 2002:a1c:5406:: with SMTP id i6mr3819983wmb.5.1603388836547;
        Thu, 22 Oct 2020 10:47:16 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u202sm5368355wmu.23.2020.10.22.10.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 10:47:16 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robert.foss@linaro.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 1/7] media: camss: ispif: Correctly reset based on the VFE ID
Date:   Thu, 22 Oct 2020 19:47:00 +0200
Message-Id: <20201022174706.8813-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022174706.8813-1-kholk11@gmail.com>
References: <20201022174706.8813-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Resetting the ISPIF VFE0 context is wrong if we are using the VFE1
for dual-camera or simply because a secondary camera is connected
to it: in this case the reset will always happen on the VFE0 ctx
of the ISPIF, which is .. useless.

Fix this usecase by adding the ISPIF_RST_CMD_1 address and choose
where to do the (or what to) reset based on the VFE line id.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 .../media/platform/qcom/camss/camss-ispif.c   | 85 ++++++++++++-------
 .../media/platform/qcom/camss/camss-ispif.h   |  2 +-
 2 files changed, 56 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index db94cfd6c508..754f0d044c38 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -26,6 +26,7 @@
 #define MSM_ISPIF_NAME "msm_ispif"
 
 #define ISPIF_RST_CMD_0			0x008
+#define ISPIF_RST_CMD_1			0x00c
 #define ISPIF_RST_CMD_0_STROBED_RST_EN		(1 << 0)
 #define ISPIF_RST_CMD_0_MISC_LOGIC_RST		(1 << 1)
 #define ISPIF_RST_CMD_0_SW_REG_RST		(1 << 2)
@@ -179,7 +180,10 @@ static irqreturn_t ispif_isr_8x96(int irq, void *dev)
 	writel(0x1, ispif->base + ISPIF_IRQ_GLOBAL_CLEAR_CMD);
 
 	if ((value0 >> 27) & 0x1)
-		complete(&ispif->reset_complete);
+		complete(&ispif->reset_complete[0]);
+
+	if ((value3 >> 27) & 0x1)
+		complete(&ispif->reset_complete[1]);
 
 	if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
 		dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow\n");
@@ -237,7 +241,7 @@ static irqreturn_t ispif_isr_8x16(int irq, void *dev)
 	writel(0x1, ispif->base + ISPIF_IRQ_GLOBAL_CLEAR_CMD);
 
 	if ((value0 >> 27) & 0x1)
-		complete(&ispif->reset_complete);
+		complete(&ispif->reset_complete[0]);
 
 	if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
 		dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow\n");
@@ -257,33 +261,18 @@ static irqreturn_t ispif_isr_8x16(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-/*
- * ispif_reset - Trigger reset on ISPIF module and wait to complete
- * @ispif: ISPIF device
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int ispif_reset(struct ispif_device *ispif)
+static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
 {
 	unsigned long time;
 	u32 val;
-	int ret;
-
-	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE0);
-	if (ret < 0)
-		return ret;
 
-	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE1);
-	if (ret < 0)
-		return ret;
-
-	ret = camss_enable_clocks(ispif->nclocks_for_reset,
-				  ispif->clock_for_reset,
-				  to_device(ispif));
-	if (ret < 0)
-		return ret;
+	if (vfe_id > (to_camss(ispif)->vfe_num - 1)) {
+		dev_err(to_device(ispif),
+			"Error: asked reset for invalid VFE%d\n", vfe_id);
+		return -ENOENT;
+	}
 
-	reinit_completion(&ispif->reset_complete);
+	reinit_completion(&ispif->reset_complete[vfe_id]);
 
 	val = ISPIF_RST_CMD_0_STROBED_RST_EN |
 		ISPIF_RST_CMD_0_MISC_LOGIC_RST |
@@ -303,15 +292,50 @@ static int ispif_reset(struct ispif_device *ispif)
 		ISPIF_RST_CMD_0_RDI_OUTPUT_1_MISR_RST |
 		ISPIF_RST_CMD_0_RDI_OUTPUT_2_MISR_RST;
 
-	writel_relaxed(val, ispif->base + ISPIF_RST_CMD_0);
+	if (vfe_id == 1)
+		writel_relaxed(val, ispif->base + ISPIF_RST_CMD_1);
+	else
+		writel_relaxed(val, ispif->base + ISPIF_RST_CMD_0);
 
-	time = wait_for_completion_timeout(&ispif->reset_complete,
+	time = wait_for_completion_timeout(&ispif->reset_complete[vfe_id],
 		msecs_to_jiffies(ISPIF_RESET_TIMEOUT_MS));
 	if (!time) {
-		dev_err(to_device(ispif), "ISPIF reset timeout\n");
-		ret = -EIO;
+		dev_err(to_device(ispif),
+			"ISPIF for VFE%d reset timeout\n", vfe_id);
+		return -EIO;
 	}
 
+	return 0;
+}
+
+/*
+ * ispif_reset - Trigger reset on ISPIF module and wait to complete
+ * @ispif: ISPIF device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
+{
+	int ret;
+
+	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE0);
+	if (ret < 0)
+		return ret;
+
+	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE1);
+	if (ret < 0)
+		return ret;
+
+	ret = camss_enable_clocks(ispif->nclocks_for_reset,
+				  ispif->clock_for_reset,
+				  to_device(ispif));
+	if (ret < 0)
+		return ret;
+
+	ret = ispif_vfe_reset(ispif, vfe_id);
+	if (ret)
+		dev_dbg(to_device(ispif), "ISPIF Reset failed\n");
+
 	camss_disable_clocks(ispif->nclocks_for_reset, ispif->clock_for_reset);
 
 	camss_pm_domain_off(to_camss(ispif), PM_DOMAIN_VFE0);
@@ -355,7 +379,7 @@ static int ispif_set_power(struct v4l2_subdev *sd, int on)
 			goto exit;
 		}
 
-		ret = ispif_reset(ispif);
+		ret = ispif_reset(ispif, line->vfe_id);
 		if (ret < 0) {
 			pm_runtime_put_sync(dev);
 			camss_disable_clocks(ispif->nclocks, ispif->clock);
@@ -1192,7 +1216,8 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
 
 	mutex_init(&ispif->config_lock);
 
-	init_completion(&ispif->reset_complete);
+	for (i = 0; i < MSM_ISPIF_VFE_NUM; i++)
+		init_completion(&ispif->reset_complete[i]);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.h b/drivers/media/platform/qcom/camss/camss-ispif.h
index 1a5ba2425a42..4132174f7ea1 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.h
+++ b/drivers/media/platform/qcom/camss/camss-ispif.h
@@ -56,7 +56,7 @@ struct ispif_device {
 	int nclocks;
 	struct camss_clock  *clock_for_reset;
 	int nclocks_for_reset;
-	struct completion reset_complete;
+	struct completion reset_complete[MSM_ISPIF_VFE_NUM];
 	int power_count;
 	struct mutex power_lock;
 	struct ispif_intf_cmd_reg intf_cmd[MSM_ISPIF_VFE_NUM];
-- 
2.28.0

