Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BE744D9F3
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234197AbhKKQL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbhKKQLx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:53 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FF7C061767
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:09:03 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so4779774wmd.1
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KTr2hlEs3fhrfyCHJRixMjf7mHq1FwDDfsgtIrdGmoc=;
        b=ITXWaszsNaOGXDHdI/IulyHYKkar7xN65aXRn/81pxKpvVZ3z/ZfnVm32P5d22hUT+
         Dt3hSzGXJbA8YvcuEQE0K1O1geqwAOEDz7EGYrboGpD3r2eUYATAla7CpF8y4bBJHS18
         wHGGoQTk7/KXf2AeOirRthYdjvdNfX1gnWvTbtHeots1k4LLCcPj0ArNLEwZb6ppPOya
         U+LXsngL+folCA+DSd6zi9MUuFlGKYtp2tnZ/bYrqAQMhbAQJ/ERMEgDIeo1q0rX5tN0
         eZmS8B8ToDO87AZFGvYIP32pJbXVSk9HvMf2qhurR9vvlJSqBN7t8ql1Fi79O3sWw/V5
         3dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KTr2hlEs3fhrfyCHJRixMjf7mHq1FwDDfsgtIrdGmoc=;
        b=XiWDEGPkg7NXGTX4AAzUIDVfF2SvwwID0yMvCpkAfIaw0WA1MYdBNatCmPfN1+Rwua
         niY/u+CxC1h6vO+upyI2vov5+Z6MB4DAWRThew1FskuwxC6yZUMjZ3Y1dRSesVR/xf/z
         DCODtWouSy0AoTTk/tnmWBHBvsYk533uu7Cy8YOOycfbXOCktET1HkouDXnVUSZUkSQl
         Z62WpQl/fsmwgPgtsQK5X72nufV/BTc+NRM+qhIQY80cX+FjdttS+UJA6PwuuAQE36eZ
         FYB8yLxrie5RICjB/rmfuQswjO8uqZQbF0rYj6L28IsadATBA0rr4mhDD7tKY0gQ0mOP
         DSGQ==
X-Gm-Message-State: AOAM530uD8aTHAR4OcW5ykTnmJd4hdO9ZsYpM1NUYetPgje5pl1+yfg7
        txR0NLlBp+dY+R3NssJHTbroQw==
X-Google-Smtp-Source: ABdhPJzVCx0kzZgQI6mfiqiPahjmKUAtmPdLfLLOHJszASu7wvy0GunOgEzS/Deu32hslBRoBltdzw==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr27126364wmj.13.1636646942455;
        Thu, 11 Nov 2021 08:09:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:09:01 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 18/18] media: camss: Do vfe_get/vfe_put for csid on sm8250
Date:   Thu, 11 Nov 2021 16:10:38 +0000
Message-Id: <20211111161038.3936217-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
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

