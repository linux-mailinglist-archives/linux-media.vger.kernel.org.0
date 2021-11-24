Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC33845CBA8
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350126AbhKXSAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 13:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350059AbhKXSAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:50 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD39C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:40 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id y196so3233921wmc.3
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/vVxuU7a+LUiAWFx1LiXN7IDyUv3UsbR6TDuxkNCB/w=;
        b=pElfa4N+mVHIERjaDJUGd+rNgcDFDOycBoe6SRgoO1jnmv4EFwR0s+nfDkoXIb9rOn
         wut3M9nbBW5QmyRT8g4cBkNs8QQ2vUBbk707ov7rfGLFx3m6079cdDeMvXI6j3vsdoE7
         PO0+et9igKf3wDppggUUyMc5VZA+s8+Lwp+ov4z+9M+fcqhuxZlosJf/LTChx4VSYe1l
         /5evz5sd8wY5qSf9WtQdqVM0K4FPUs/sQqg1AF415vlGOHaWc+3s8d3umGcftsHxgbYu
         Fl5vFVxeiZaCjKeaSG5DO28bc0ilZXYx1Gt//1MTXUJho/fdaVmaq2PdTXvXBmaNiv9o
         SxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/vVxuU7a+LUiAWFx1LiXN7IDyUv3UsbR6TDuxkNCB/w=;
        b=zlJWYp/ryS9H5ngksJl0V22cbQnlKaJ4FHajP40baJUDABaggP88fDyixN6eg3xMcU
         Fgw5Pk9IUFdZVSyfoCtNQI8RTX7a8PCJLmv5xsIpSLxxhHR7ow3MgvGiscLq+KNT8RHu
         ettupBuaRkw9+o/iasnjiHtI0s7RL+TFgiGK/AZJSLhur9bSXyveylr40LvQXPFynTvU
         RqzDEVlvnf9r15Zaxtt3wL7JYHRj+aiNfpyVu0QO9QDejxi/6oFVHFSNOXDhBHgcf8ky
         +Pw79ZoBNepEOFiwKQoJGm4GqI4JYW24puZYrirGZ2hBkmjtmz3T1TM6OyZdCyrZ/BVb
         EcYA==
X-Gm-Message-State: AOAM530LCFR2Zf517pkW66hsxGyNajIq5e/JzwdldAKTm+CVzwV/O1br
        I3n/J1964jVZnVdzxSjRny2QaQ==
X-Google-Smtp-Source: ABdhPJzJwPMuFWpEfRFeLQsfUJM8vyZi54CcxvX6xCs8tOmEL8Rz7aMg8SBJ5l0+Ywkfjh6wVnGC/Q==
X-Received: by 2002:a05:600c:19d1:: with SMTP id u17mr17864488wmq.148.1637776659211;
        Wed, 24 Nov 2021 09:57:39 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:38 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 19/19] media: camss: Apply vfe_get/vfe_put fix to SDM845
Date:   Wed, 24 Nov 2021 17:59:21 +0000
Message-Id: <20211124175921.1048375-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Similar to the SM8250 the CSID relies on the VFE to be clocked prior to
taking the CSID out of reset.

Apply the same fixup to SDM845 as SM8250.

Suggested-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index e6835b92695b..32f82e471bae 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -159,10 +159,11 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	struct camss *camss = csid->camss;
 	struct device *dev = camss->dev;
 	struct vfe_device *vfe = &camss->vfe[csid->id];
+	u32 version = camss->version;
 	int ret;
 
 	if (on) {
-		if (camss->version == CAMSS_8250) {
+		if (version == CAMSS_8250 || version == CAMSS_845) {
 			ret = vfe_get(vfe);
 			if (ret < 0)
 				return ret;
@@ -212,7 +213,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		camss_disable_clocks(csid->nclocks, csid->clock);
 		ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
 		pm_runtime_put_sync(dev);
-		if (camss->version == CAMSS_8250)
+		if (version == CAMSS_8250 || version == CAMSS_845)
 			vfe_put(vfe);
 	}
 
-- 
2.33.0

