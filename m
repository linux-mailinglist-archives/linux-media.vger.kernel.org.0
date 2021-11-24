Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E4245CBA5
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350119AbhKXSAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 13:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350059AbhKXSAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:49 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B982C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:39 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso6210312wml.1
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LBwfTtSyYCU0xqsJ/IyzroSY8TR9asGjJxvjOL1AdpE=;
        b=RXO8VHf1B5HKGzWyQ0JrhK16tqkAZ3XnR03tW0cWqbZ56063Pjk58dtl92ji2ElWRq
         /dwGLMzv4Qk71hOiAAhaPnHKTOo+EUtL0IsfeotOi7kzbQOfPCtMU6DCb85UvSs+r3kl
         ITbhSdEbrhY/y3J71Erlh5UeQFICNLLaV/LwFYbdnROKDCqDsSwSSFKYZZkOJ8WyZ3bB
         pOKEELxWZ2cSCX4ehF66SiQYJwZ8hw3NZGxOeck3o56XDI3IQJXxsGgM2QclStf0NmKm
         5DKXau2iXSyzWEL/tyFqzM27mEsd5TCGdmFeiBpJymUHS8SVgM+gFOkUzbGuHJmVpnf+
         2spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LBwfTtSyYCU0xqsJ/IyzroSY8TR9asGjJxvjOL1AdpE=;
        b=OyFHk97hdUDV2w56X/qIqUYOB575LQIN68sld026/3qNuZvNqCqLCgGQ7tDa6H7kV9
         SicWngqqnnzhZWInAC1GinT2p+ZapM+E7O3vO0Wllyi6i5GJE+/4mL1U5WcAhCK5puKd
         x4c72E+O1YlbSv/OAQOdhHcuc2aBzzoPbXExETRAveWKOiXL277MpjaiU5MlyOGeFBFo
         uQPuvvsZSLwH1YOYhBgPNTxKadGgsshtohZpJHzDhMCeG7OhVsTLz4CCoshIL+xz8BHL
         1Zjn2WN0YkyPHhUqUqFC0jAUvM+GbvS0P04zHOpyvGdkhpsD2GnlAjgUERPns+Gk04Yr
         7L2A==
X-Gm-Message-State: AOAM532MNeBVm+d0vazEhq7dBoKAGC9LLLhDLWDnl6FLwCqMRshtWvua
        ++2FCBUCE6OvGwDQeRrjblozhA==
X-Google-Smtp-Source: ABdhPJzp2J5tbRzrQJ6cGgFDYa1M6nTCym79SqGQAhKmw0MfG9/FVXSpfj6y4DyqpVsqbFwnMKmfog==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr17440385wmh.18.1637776657957;
        Wed, 24 Nov 2021 09:57:37 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:37 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 18/19] media: camss: Do vfe_get/vfe_put for csid on sm8250
Date:   Wed, 24 Nov 2021 17:59:20 +0000
Message-Id: <20211124175921.1048375-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
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

