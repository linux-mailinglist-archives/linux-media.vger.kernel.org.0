Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2ECA2FDB93
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732852AbhATU4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:56:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387537AbhATNsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:48:12 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BFAC061384
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:48 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id 6so15887888wri.3
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bhijpy86VBLH1z/QR8DmTQnzKog7xaGemOCJvaezDFY=;
        b=iaxU15HN5uRASfSuD4HHLKOoZ1USu35g+/6yYnpV4ajCYQ6jTPHEi11EDl+F87SSxp
         nmWmkwQJQ3L/4Wdkxk+jVI3ofdXZ6L/6yzQHkGkAcWL1lPledkQYQQpHspEUX89d9FiT
         ym/PMykJvpq3mp/3i2k2+wuGI1/XGZ7q8pNjurC605hhaDZNElNJrNSfJFmA1EXV9CgU
         KZCvp0rtLLGJlX8KcXaxv8nWvzxrgUxxFBd0HuV72cG1OeY8VU+UXZLC4Ghw9subXAsR
         hdTodOIiiu9dObiY/0d4WAFHc7Sxg2NTr4f8ylD4aYG3rfLHM3p3feYHnnUM3ngE1Jfk
         UN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bhijpy86VBLH1z/QR8DmTQnzKog7xaGemOCJvaezDFY=;
        b=H9R9MMR5F1LVQiLOqKRfkZrJZmcZqAPLIYZvgx6ogo4b7taOIXYGaRtgQCNKUI71b3
         i9+FfK29ZaWDUvfaPIZ/v5+qAI+X0mlscmm1R3dbYVE7xI9CptWBXC54PQ+fjmboeH5/
         zc2UWg52qYTFvYP87nWQX4a/SmgWwzgKNIvHVGMCyZjPlLVn4YMLbmiVn1JZIcyXjz5j
         N6x6GLwohz7CBsNVtZRALIXuT0IC6HnvET+ZTa2oCVKtW4b4T3ry/3hmF8UBQ2FSpks/
         5pC6k3EeeMIX+AQ7GqnwAGos68sx9RtrSlcV+9Umofmwz3sldvY2Q0SLI96p5V8n2Wzt
         3z+g==
X-Gm-Message-State: AOAM530NNT+VD+8k9EZptaDQuS9lctaGCWMCF1rC1u/wANjLrgA3Ni1b
        HhlqzEwPqaFVxf9Gky1FEeBw3A==
X-Google-Smtp-Source: ABdhPJx0AwkrLBpCpVDslWZq3MjFXWgsfVVT6bEQfsUAlsDQn51W/yEzkhdCWQbTH9GEdutcGsCdsA==
X-Received: by 2002:a5d:504b:: with SMTP id h11mr9355240wrt.337.1611150287522;
        Wed, 20 Jan 2021 05:44:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:44:46 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 11/22] media: camss: Remove per VFE power domain toggling
Date:   Wed, 20 Jan 2021 14:43:46 +0100
Message-Id: <20210120134357.1522254-11-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For Titan ISPs clocks fail to re-enable during vfe_get()
after any vfe has been halted and its corresponding power
domain power has been detached.

Since all of the clocks depend on all of the PDs, per
VFE PD detaching is no option for this generation of HW.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../media/platform/qcom/camss/camss-ispif.c   | 11 ---
 drivers/media/platform/qcom/camss/camss-vfe.c |  7 --
 drivers/media/platform/qcom/camss/camss.c     | 94 +++++++++++--------
 drivers/media/platform/qcom/camss/camss.h     | 12 +--
 4 files changed, 60 insertions(+), 64 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index c36570042082..e41925850ba2 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -323,14 +323,6 @@ static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
 	struct camss *camss = ispif->camss;
 	int ret;
 
-	ret = camss_pm_domain_on(camss, PM_DOMAIN_VFE0);
-	if (ret < 0)
-		return ret;
-
-	ret = camss_pm_domain_on(camss, PM_DOMAIN_VFE1);
-	if (ret < 0)
-		return ret;
-
 	ret = camss_enable_clocks(ispif->nclocks_for_reset,
 				  ispif->clock_for_reset,
 				  camss->dev);
@@ -343,9 +335,6 @@ static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
 
 	camss_disable_clocks(ispif->nclocks_for_reset, ispif->clock_for_reset);
 
-	camss_pm_domain_off(camss, PM_DOMAIN_VFE0);
-	camss_pm_domain_off(camss, PM_DOMAIN_VFE1);
-
 	return ret;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fa9629835e98..e41c22da4b9b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -587,10 +587,6 @@ static int vfe_get(struct vfe_device *vfe)
 	mutex_lock(&vfe->power_lock);
 
 	if (vfe->power_count == 0) {
-		ret = camss_pm_domain_on(vfe->camss, vfe->id);
-		if (ret < 0)
-			goto error_pm_domain;
-
 		ret = pm_runtime_get_sync(vfe->camss->dev);
 		if (ret < 0)
 			goto error_pm_runtime_get;
@@ -627,9 +623,7 @@ static int vfe_get(struct vfe_device *vfe)
 
 error_pm_runtime_get:
 	pm_runtime_put_sync(vfe->camss->dev);
-	camss_pm_domain_off(vfe->camss, vfe->id);
 
-error_pm_domain:
 	mutex_unlock(&vfe->power_lock);
 
 	return ret;
@@ -653,7 +647,6 @@ static void vfe_put(struct vfe_device *vfe)
 		}
 		camss_disable_clocks(vfe->nclocks, vfe->clock);
 		pm_runtime_put_sync(vfe->camss->dev);
-		camss_pm_domain_off(vfe->camss, vfe->id);
 	}
 
 	vfe->power_count--;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7e7763f04b58..22f9d7d7085a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -774,28 +774,6 @@ int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
 	return 0;
 }
 
-int camss_pm_domain_on(struct camss *camss, int id)
-{
-	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660) {
-		camss->genpd_link[id] = device_link_add(camss->dev,
-				camss->genpd[id], DL_FLAG_STATELESS |
-				DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
-
-		if (!camss->genpd_link[id])
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
-void camss_pm_domain_off(struct camss *camss, int id)
-{
-	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660)
-		device_link_del(camss->genpd_link[id]);
-}
-
 /*
  * camss_of_parse_endpoint_node - Parse port endpoint node
  * @dev: Device
@@ -1214,6 +1192,48 @@ static const struct media_device_ops camss_media_ops = {
 	.link_notify = v4l2_pipeline_link_notify,
 };
 
+
+static int camss_configure_pd(struct camss *camss)
+{
+	int nbr_pm_domains = 0;
+	int last_pm_domain = 0;
+	int i;
+	int ret;
+
+	if (camss->version == CAMSS_8x96 ||
+	    camss->version == CAMSS_660)
+		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+
+	for (i = 0; i < nbr_pm_domains; i++) {
+		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
+		if (IS_ERR(camss->genpd[i])) {
+			ret = PTR_ERR(camss->genpd[i]);
+			goto fail_pm;
+		}
+
+		camss->genpd_link[i] = device_link_add(camss->dev, camss->genpd[i],
+			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
+
+		if (!camss->genpd_link[i]) {
+			dev_pm_domain_detach(camss->genpd[i], true);
+			ret = -EINVAL;
+			goto fail_pm;
+		}
+
+		last_pm_domain = i;
+	}
+
+	return 0;
+
+fail_pm:
+	for (i = 0; i < last_pm_domain; i++) {
+		device_link_del(camss->genpd_link[i]);
+		dev_pm_domain_detach(camss->genpd[i], true);
+	}
+
+	return ret;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -1346,20 +1366,10 @@ static int camss_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660) {
-		camss->genpd[PM_DOMAIN_VFE0] = dev_pm_domain_attach_by_id(
-						camss->dev, PM_DOMAIN_VFE0);
-		if (IS_ERR(camss->genpd[PM_DOMAIN_VFE0]))
-			return PTR_ERR(camss->genpd[PM_DOMAIN_VFE0]);
-
-		camss->genpd[PM_DOMAIN_VFE1] = dev_pm_domain_attach_by_id(
-						camss->dev, PM_DOMAIN_VFE1);
-		if (IS_ERR(camss->genpd[PM_DOMAIN_VFE1])) {
-			dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0],
-					     true);
-			return PTR_ERR(camss->genpd[PM_DOMAIN_VFE1]);
-		}
+	ret = camss_configure_pd(camss);
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure power domains: %d\n", ret);
+		return ret;
 	}
 
 	pm_runtime_enable(dev);
@@ -1380,6 +1390,9 @@ static int camss_probe(struct platform_device *pdev)
 
 void camss_delete(struct camss *camss)
 {
+	int nbr_pm_domains = 0;
+	int i;
+
 	v4l2_device_unregister(&camss->v4l2_dev);
 	media_device_unregister(&camss->media_dev);
 	media_device_cleanup(&camss->media_dev);
@@ -1387,9 +1400,12 @@ void camss_delete(struct camss *camss)
 	pm_runtime_disable(camss->dev);
 
 	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660) {
-		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0], true);
-		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE1], true);
+	    camss->version == CAMSS_660)
+		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+
+	for (i = 0; i < nbr_pm_domains; i++) {
+		device_link_del(camss->genpd_link[i]);
+		dev_pm_domain_detach(camss->genpd[i], true);
 	}
 
 	kfree(camss);
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index b7ad8e9f68a8..7560d85b3352 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -57,9 +57,9 @@ struct resources_ispif {
 };
 
 enum pm_domain {
-	PM_DOMAIN_VFE0,
-	PM_DOMAIN_VFE1,
-	PM_DOMAIN_COUNT
+	PM_DOMAIN_VFE0 = 0,
+	PM_DOMAIN_VFE1 = 1,
+	PM_DOMAIN_CAMSS_COUNT = 2,	/* CAMSS series of ISPs */
 };
 
 enum camss_version {
@@ -83,8 +83,8 @@ struct camss {
 	int vfe_num;
 	struct vfe_device *vfe;
 	atomic_t ref_count;
-	struct device *genpd[PM_DOMAIN_COUNT];
-	struct device_link *genpd_link[PM_DOMAIN_COUNT];
+	struct device *genpd[PM_DOMAIN_CAMSS_COUNT];
+	struct device_link *genpd_link[PM_DOMAIN_CAMSS_COUNT];
 };
 
 struct camss_camera_interface {
@@ -110,8 +110,6 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
 struct media_entity *camss_find_sensor(struct media_entity *entity);
 int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock);
-int camss_pm_domain_on(struct camss *camss, int id);
-void camss_pm_domain_off(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
 
 #endif /* QC_MSM_CAMSS_H */
-- 
2.27.0

