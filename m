Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1B9310992
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 11:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhBEKxa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 05:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhBEKuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 05:50:46 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AB3C0698C5
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 02:45:13 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j11so5612929wmi.3
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 02:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bhijpy86VBLH1z/QR8DmTQnzKog7xaGemOCJvaezDFY=;
        b=I1f4P88tmjKhD9nAeTeG42QMJXc51TQL9LFq2uUaMelOVAPEmZg1mSouCIVlP4XBGd
         bpjqQxMPS42M+3n1XVnziy6u5CPN5XRsbUtWnX5A0CQ9+itw+FwHUhg+pAOhQH+zqMFT
         OCLN6gpDYIUGGiAELUsv5La50KsmOpbcLS+ClEsknpm4DAUcFumlFFtWY0EY5cfR4/jo
         h4w2ExPRW7QHKAVw5rlr+up4hcYt/7bLfhPLD1JZyWrQCQWmrtx6WcskE8AltBGuaaXb
         S6O3sNxI2LiAsbtMFT4BJtavd02m6zWJAZTVra4zI2Quz4EiXUk8Mmr8TieA5/tqq6zP
         CJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bhijpy86VBLH1z/QR8DmTQnzKog7xaGemOCJvaezDFY=;
        b=X4ebNpsVNI8I1pzV9kk0ZG8tF6XioEv4hlfN+S2f/JYXB3E6p5himsVq0I0zp6tcoP
         Yp4XMlbJi7Yfmfr7WRXaZMeK5JR9cOaDx9HrFYgL1Jq//Bqecs7IjmK2MloaRRmKrwAc
         6GMQuOZTSFp7cgdcRoXst+1gLiLMxnBe17c4WXSh9RG83zJrMS77kNs+W5Z6hi7whsuA
         Q/AsEL/HObSkZdJfmNIquJNoPQBA8NWiMuYcTkx8KNUBRVR8xSQVdAZQsRxFWCHEkRx1
         uE0KiF2OkS2AcdNwa3jCo3GCjvo6b5zqstIoU1EZ3I8lf8p1DcDF1RmiW/a94r7/CPn9
         M5Mw==
X-Gm-Message-State: AOAM531GfahXIA/2EgflZgEFMOthtBJDNXuv7L8+YT9ZyxFDR7tjNmEd
        M8OS6Z1OVx6PhKDudt0Jau0WJw==
X-Google-Smtp-Source: ABdhPJyRfo1Xd9kdbFnk9gG7FK4NwhSnrqBF3CGs3t+a+eCiGXdP6H1m+o2UJRsgFBUel+isXS+Yhg==
X-Received: by 2002:a05:600c:2ca:: with SMTP id 10mr3026622wmn.151.1612521912071;
        Fri, 05 Feb 2021 02:45:12 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:45:11 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 12/22] media: camss: Remove per VFE power domain toggling
Date:   Fri,  5 Feb 2021 11:44:04 +0100
Message-Id: <20210205104414.299732-13-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
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

