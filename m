Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA9544DA26
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbhKKQQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234266AbhKKQQ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:57 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D72C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:14:07 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d27so10668271wrb.6
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KTr2hlEs3fhrfyCHJRixMjf7mHq1FwDDfsgtIrdGmoc=;
        b=n3Gj/igEPaivyJl6iN/abF3Xl9DP++DG9O978lj3VE9MypLbK+vyqW3+HNA1gAByrv
         FqQ6UAK/oTqMmkYoavKAk/W9dsxQ8bv1UczXA+0bRsDrGK48ZJ3l1KH2rcsST1QoE0Ef
         Hsn2keSc5lN/KF92dT1HGfU9wuKEBmbJp5Liwb7BHGCGXH9dv2LDvmbBfmdPLbhIvIvb
         DUI1hXwmuXSv0ahyQNwu5SvF5Df5J5DaJ8Y48OBCIGyNayPCEtaP5SQ7Ptd+MH3xLm4p
         VwlHNlQPsOvfk0TYJo8X4zJjZZYmsAX2T4uincP8AOYaZUlM7oKEqIInLGda4CBX30Rp
         aT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KTr2hlEs3fhrfyCHJRixMjf7mHq1FwDDfsgtIrdGmoc=;
        b=kRKUQ2twntLDflci/L47Yyh5GbC88pxIXpuPfA86ZrqZuEXSA3KTzfbKTebRWfqldW
         ewAIjaw5eRwRueku2tg2KGv3nbjBapiJdfPkFZ8xxqIXRjjLj8amb4mIClWKOo6l4aM5
         /C+i0dl+UcE91UkkjYWuWzzOgeTIIInY14H+8aAS4VEEpPhYJ5HunZuRPsVQHhMIcVjM
         NJApn33zjQbL4GF3uHp8Fdc9PZbJzeANbXT6dx5ee1JANUw8xSxa2wtz/Epbs1HSwgpu
         22FDmQmmzKma8PswEhdExPapA+DE7zgyMoicxXIht6W08gTXjN61BfmX/A06isYergQv
         JZCQ==
X-Gm-Message-State: AOAM532SBUX51RYC5JJicVnpw3RLxXT9ktpxV9cAAW1GhPeNrUWhFdp3
        bQBTI+AOy7F7W2aYbbOehYMNww==
X-Google-Smtp-Source: ABdhPJyD6I7LgT7lmPHJf1sOBw6+A4CQJrqyEqEh3+kt2RQoko35hJCTRiLjDU8IaGF7EjwzEA6+Zg==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr9752077wrr.314.1636647246508;
        Thu, 11 Nov 2021 08:14:06 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:14:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 18/18] media: camss: Do vfe_get/vfe_put for csid on sm8250
Date:   Thu, 11 Nov 2021 16:15:42 +0000
Message-Id: <20211111161542.3936425-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
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

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 12 +++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.c  |  4 ++--
 drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 9ef6fbbeeddf..e6835b92695b 100644
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
index 5b5fe620914d..703ea39f1262 100644
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
index 6500474a749e..0eba04eb9b77 100644
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

