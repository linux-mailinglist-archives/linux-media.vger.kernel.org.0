Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E9C4666C2
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241891AbhLBPjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359093AbhLBPjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:25 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2824FC06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:36:02 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a9so60499397wrr.8
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LBwfTtSyYCU0xqsJ/IyzroSY8TR9asGjJxvjOL1AdpE=;
        b=zqd1tsMBqDik5tqAnfwbDhdIjX6nPpfvupHfDmkReFgIDzD2HDF2z6V5CFE9StkYJU
         Fi/ytbn22xMN8HTDQwYcxLJAZdDKrgXqsQRoKwBCU3R/7+Q2hRLUJ20RqXuCgorcvOqZ
         nc15t+U84UJZ7L4ieDLY7NbHBILmvLGm6J2pMYgQh08TWplhxEwZ6275iJzrypx6q+E0
         ztjkT4OSqJ1XFgoZmERKrCsVYQtBzzCfSJfVmfqaESnCI03qzIssxYPuCkxGcyotCoMU
         7nBIwGP5pFdgAHP34cssIZ2mXkxnrHL0XNBhmieibCWLFxBwMtxoFJa0A8E4lWFzwOVV
         R+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LBwfTtSyYCU0xqsJ/IyzroSY8TR9asGjJxvjOL1AdpE=;
        b=jadgcijmZBtDL4DGpcxwmWArfsG/LDFsjVbCQ5SXaqfzuttK4RTQ9TYe/7pgPKqxbv
         yteSATi+qOwmK5YiJJRax3My9HXQ8ULPIPUi3LZM14dGr2c6ucO9Hv9U3KpIXzI96EwL
         ERdAwwna9GnHYhOuWeSMmwD5cR2Yvv13fM2Jsho1nl5Cukp7/ph0ZWEHZug4S/GRMqaD
         VbwskrHz1IX9d89aspIhtArrzHqeXYN+4ly65ZPAhMqoNXMq+519Uaxzfl7GUgERkdg7
         B1OxdKIwmeHDXUJa9l3OJChkuaS+l5n9ynnzFqOqIWgfBqdy9T6+cNfet6TQ+Jg9BYJ1
         b1GQ==
X-Gm-Message-State: AOAM533alC986+EgDe5EpUFph28X8uxeQFqzVqiLZ8TmsbnxHpll2G88
        fOumRO2xbwe9zSUmVZjpDgKhig==
X-Google-Smtp-Source: ABdhPJwobUuat9LgOM7QKLdaYOgZ7SbFUfPhCxDS/xf20zI4jwGPn+cGnaNnkiJ2jsf/v1eLm+Qtkw==
X-Received: by 2002:a05:6000:2a3:: with SMTP id l3mr15025418wry.415.1638459360802;
        Thu, 02 Dec 2021 07:36:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:36:00 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 18/19] media: camss: Do vfe_get/vfe_put for csid on sm8250
Date:   Thu,  2 Dec 2021 15:37:28 +0000
Message-Id: <20211202153729.3362372-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
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

