Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF07416CB7
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 09:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244368AbhIXHTi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 03:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244324AbhIXHTh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 03:19:37 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442A1C061574;
        Fri, 24 Sep 2021 00:18:04 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u15so24330489wru.6;
        Fri, 24 Sep 2021 00:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2PlrT9rqD3g2RKXKoyVvQWRQ3kbYLZy4tSH1wo/aiKQ=;
        b=SaurTfbrOAd1J73wEzqbrLFpDyn2RrO6QVmlzVe7sKR0/jOw8/NPFHu4wTePTSY9mP
         42rkkc3M61pzMmreOtQ6XbS5O9OR77p2ChkYTqGDWpVYcL2qRTet4raiLMWNuiNRS0G0
         bl4tOYIPzQAGpWYPAPFTAZvL22CoLuIg3dzMucKHOGybZdohP0G+8PBzBczTrbbsvZO2
         LqalR9ZQ53ZqyplvI3d9jrkGLlk0FUaAE1NADzVL2dTAVR+9vrL9Ga/PBJ9R3p3yNtYb
         NqRZoWMjaNZ0UxDOh2oWSNvqlHKYEqwNW6AJMqCQLNMzJhOLFr10rTyTaaL1ObgnqXNk
         BZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2PlrT9rqD3g2RKXKoyVvQWRQ3kbYLZy4tSH1wo/aiKQ=;
        b=GhM94FTpN9yhPPjKrBdMFy9AupRQysjyu1IH9hnsnjl3YjnZkXCfItiiDfhuPvoIsz
         U++GoU02iampZzCPJUUWFxU63eMAliWVP0ZBPWSWEeAn9pMeqEF/sGtjedzmriCrk4Fi
         wUyb8tqvmTc75WcGxAAZCTRtXJdQTo1TWpSEI7Vq0PxZ6OgBN2SKCZz5hTNfqHA4jHv7
         cVWPo+w28worHCGRJvBoDHmCmjg2a0/LEjNXKbhJ9KxWANqivd07XPleaA9qPznsrRwH
         Mg7WByIZARblfQcQOS99hUJswqsIzQKW4F6JIDlWJwzK7S12UD9EDm+aNOzamIne1DYS
         GqLw==
X-Gm-Message-State: AOAM530tHG1BJZyD0tPmatWlwDBXenAPXzpAMsP4jEQ5ICCcUBlRbgG7
        JPfmR9D6bnyaMpGpW7Vc/80=
X-Google-Smtp-Source: ABdhPJzvIL8GC2I1KfdrZn6W+rA/52hCsdX2n9uHkXWGyod5dX4v5NWGRmuVcxlMOunU1chC77sVZg==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr9287302wrp.437.1632467882926;
        Fri, 24 Sep 2021 00:18:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id b7sm9200070wrm.9.2021.09.24.00.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 00:18:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, etnaviv@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc:     l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        linux+etnaviv@armlinux.org.uk, robdclark@gmail.com, sean@poorly.run
Subject: [PATCH 2/4] drm/msm: allow compile_test on !ARM
Date:   Fri, 24 Sep 2021 09:17:57 +0200
Message-Id: <20210924071759.22659-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924071759.22659-1-christian.koenig@amd.com>
References: <20210924071759.22659-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MSM is one of the few drivers which won't even compile
test on !ARM platforms.

Looking into this a bit more it turned out that there is
actually not that much missing to at least let the driver
compile on x86 as well.

So this patch replaces the use of phys_to_page() with the
open coded version and provides a dummy for of_drm_find_bridge().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/Kconfig   |  4 ++--
 drivers/gpu/drm/msm/msm_gem.c |  2 +-
 include/drm/drm_bridge.h      | 10 +++++++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e9c6af78b1d7..5879f67bc88c 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -3,9 +3,9 @@
 config DRM_MSM
 	tristate "MSM DRM"
 	depends on DRM
-	depends on ARCH_QCOM || SOC_IMX5 || (ARM && COMPILE_TEST)
+	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
 	depends on IOMMU_SUPPORT
-	depends on OF && COMMON_CLK
+	depends on (OF && COMMON_CLK) || COMPILE_TEST
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 14907622769f..5bd511f07c07 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -85,7 +85,7 @@ static struct page **get_pages_vram(struct drm_gem_object *obj, int npages)
 
 	paddr = physaddr(obj);
 	for (i = 0; i < npages; i++) {
-		p[i] = phys_to_page(paddr);
+		p[i] = pfn_to_page(__phys_to_pfn(paddr));
 		paddr += PAGE_SIZE;
 	}
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 9cdbd209388e..a445298e1c25 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -790,11 +790,19 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 
 void drm_bridge_add(struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
-struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous,
 		      enum drm_bridge_attach_flags flags);
 
+#ifdef CONFIG_OF
+struct drm_bridge *of_drm_find_bridge(struct device_node *np);
+#else
+static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
+{
+	return NULL;
+}
+#endif
+
 /**
  * drm_bridge_get_next_bridge() - Get the next bridge in the chain
  * @bridge: bridge object
-- 
2.25.1

