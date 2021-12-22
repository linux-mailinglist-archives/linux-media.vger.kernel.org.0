Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9835947CA6D
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240047AbhLVAgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:36:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240032AbhLVAgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:36:07 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39ABCC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:07 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a9so1301593wrr.8
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jxsZJW0Dax3tkJBhDNpWDlh0EqpL+j0Vj65hBEhTL2A=;
        b=FqH41Gw0a/eYZjcDPzAoGnW0Mu+lYclKlISVWkCUx/tEj3Ja5K5hsX2OuPl8686s0Y
         5MnrPSfrmYfMcL7LgFtiGaF9B2X1v1D/tq4OX+eFIz/uCbGTfyh0SViEt4FC7s5NrBV5
         heNr/YyiLNIDIsm4N98RvojUnOYH5M5Z9Fdxq5tbFvYyM5NbbQfa+tesE5PubBmgqkdr
         B2zLKEflxuNKy2Uv6t7aZl8Hqx9ndggumFTbmJGTQxHo9aDECFUy2PESqAThDvm/9aea
         aTaGbD/2Mq+iXe1Mnr6gbLQvd+JV3qtce5eGgKAiTp1r0Lwljgl4xppgW3BrFY2vvtXI
         Zswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jxsZJW0Dax3tkJBhDNpWDlh0EqpL+j0Vj65hBEhTL2A=;
        b=tKpDcjhqXanWOg/16MrUjA6L9YjN7rnUJrqIjcBp0Ji+3/hr4KDaVxwrZ6I/E/Xtrk
         m1xMWp/4OMjWxP4+dqfQNosetwO2EgxwWwoSZeFxJSt+CqMFV+gQpmTi8XXFiRuv4PnG
         bFIHBDsTlcxSnfcizM7cIkOnQq3fXRLxbIJCwn+5Zp9xjS7zWKWznuYWMdxdgM//Oq8b
         6B7sLO3spM8fpazWD9Jsl6oA3h4kkJb02zQvZPswUPzfzY/TtwV4tU88mCX2yJ+87JWO
         cFpRGErJHOaj8UNxXrW1Hcf3oNL+KqJAV4XMm1XKF/iZ80xl44Fubv3qFDD9dEr1Hl5k
         g+Ig==
X-Gm-Message-State: AOAM532B9Xq8bmpU2arJPihcJgGACA5RopPLsHoC/X47tG5jEssuL9py
        Qomr6ewMWaub5dj6eP+wfdJd0OvNlBbYEQ==
X-Google-Smtp-Source: ABdhPJzVSFKMNrLaznuJQTczUmnmr45dCq9NvsADWVfMDSXqjY0YV9/hwvAKqoJBrDV2HoCl5UCEZA==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr398809wrn.288.1640133365880;
        Tue, 21 Dec 2021 16:36:05 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:36:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 18/19] media: camss: Do vfe_get/vfe_put for csid on sm8250
Date:   Wed, 22 Dec 2021 00:37:50 +0000
Message-Id: <20211222003751.2461466-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sm8250 CAMSS CSID depends on the VFE it is attached to being powered on
and clocked prior to taking the CSID out of reset.

It is possible to open just the CSID subdev from libcamera and attempt to
bring the CSID block up.

If we do not first bring up the VFE the CSID will fail to come out of
reset.

Tested-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 12 +++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.c  |  4 ++--
 drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 9ef6fbbeeddf3..e6835b92695b6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -156,10 +156,18 @@ static int csid_set_clock_rates(struct csid_device *csid)
 static int csid_set_power(struct v4l2_subdev *sd, int on)
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
-	struct device *dev = csid->camss->dev;
+	struct camss *camss = csid->camss;
+	struct device *dev = camss->dev;
+	struct vfe_device *vfe = &camss->vfe[csid->id];
 	int ret;
 
 	if (on) {
+		if (camss->version == CAMSS_8250) {
+			ret = vfe_get(vfe);
+			if (ret < 0)
+				return ret;
+		}
+
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0)
 			return ret;
@@ -204,6 +212,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		camss_disable_clocks(csid->nclocks, csid->clock);
 		ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
 		pm_runtime_put_sync(dev);
+		if (camss->version == CAMSS_8250)
+			vfe_put(vfe);
 	}
 
 	return ret;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5b5fe620914d0..703ea39f12628 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -575,7 +575,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int vfe_get(struct vfe_device *vfe)
+int vfe_get(struct vfe_device *vfe)
 {
 	int ret;
 
@@ -637,7 +637,7 @@ static int vfe_get(struct vfe_device *vfe)
  * vfe_put - Power down VFE module
  * @vfe: VFE Device
  */
-static void vfe_put(struct vfe_device *vfe)
+void vfe_put(struct vfe_device *vfe)
 {
 	mutex_lock(&vfe->power_lock);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 6500474a749e7..0eba04eb9b77c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -203,4 +203,7 @@ extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_480;
 
+int vfe_get(struct vfe_device *vfe);
+void vfe_put(struct vfe_device *vfe);
+
 #endif /* QC_MSM_CAMSS_VFE_H */
-- 
2.33.0

