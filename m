Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F8C44D9E8
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234136AbhKKQLn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbhKKQLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:42 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACBBC06127A
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:52 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id u18so10646032wrg.5
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5FPmsbooZ69p+mFnHgRZEE//JmnzCll9kSWteXKrkLY=;
        b=KZ/GCjxk5PL+kTbQMGiYqYl/07e+zofBbPrnVcQzDZRR5usvYNNWnr11Pi1pt1qsBb
         DA84vcVpG3S1c937S9F+na8KsgmnfOzX4wiY+zjNUMTRU+TnxUM+Aj8NXLxwmAsp/Df3
         W2RRbgFWXYuEPl0v0Bb5vaRwr2seq7qShgaOw37edaxecn4C6J1hJ+Ga+drgE0MLaWoY
         ghPgy05zKNWXMO8JSHVv+rTxrwbl1lY9RBAUZapDpvZcmJHoW2RShTU2k42YyyS+f1kT
         Qy8kwgSpjZn5giEFxvS/CODqTlRBAppaWaNJ3lGhtSgc7Gl3Xec6gourBDSVEoNmJZsN
         966Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FPmsbooZ69p+mFnHgRZEE//JmnzCll9kSWteXKrkLY=;
        b=yK5mV3CFYqsZazYH18gUHPphoZ/f+Tju4pM0HsOHiu2XQqdbxydrHj0jlCtzd7gh2t
         vuSNBrRK+lENAkYClo3g3Unea4SR8rvuGLOlIuE5tp9BQIp7TJCddgHF2dTkEDVEHRQ+
         1LEUuYg8qZ2QGpnVPRJWKQcFke97D5Uchd1B+KkF+AoYUrGAAo9qiBevaB3Ejwqp8dKI
         j2zGe36L0iNsXgszRWqXHcBLOn6F32/GU2yzc6kN5yZ575BdAHKyA5XPiJgRCwjalnlP
         58h+U+/2TT7EOtGdAhl9bIhR4IfhoXMOPDnvyHShxTdeA16Yzy8nreJCiwDfbxn3BHNk
         UXCw==
X-Gm-Message-State: AOAM532MRvv2cFdeMP+XikbzLwaQsM+ayZAn6ngy9xGuhptkS/bXUDyC
        A4hUCNkptzakq1OpJbxk30Ma4Q==
X-Google-Smtp-Source: ABdhPJxm8J6qJ3a+vPyEB+hJTJMlTVURr/uNjehWYHTQGTKYztORqFh4HTIHKplKa+oOrrNBriIbJA==
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr9865557wrs.81.1636646931555;
        Thu, 11 Nov 2021 08:08:51 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:51 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 10/18] media: camss: csid: allow csid to work without a regulator
Date:   Thu, 11 Nov 2021 16:10:30 +0000
Message-Id: <20211111161038.3936217-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

At least for titan HW, CSID don't have an associated regulator. This change
is necessary to be able to model this in the CSID resources.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a1637b78568b..1226913c623b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -160,7 +160,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0)
 			return ret;
 
-		ret = regulator_enable(csid->vdda);
+		ret = csid->vdda ? regulator_enable(csid->vdda) : 0;
 		if (ret < 0) {
 			pm_runtime_put_sync(dev);
 			return ret;
@@ -168,14 +168,16 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = csid_set_clock_rates(csid);
 		if (ret < 0) {
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
 
 		ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
 		if (ret < 0) {
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -186,7 +188,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
-			regulator_disable(csid->vdda);
+			if (csid->vdda)
+				regulator_disable(csid->vdda);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -195,7 +198,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
-		ret = regulator_disable(csid->vdda);
+		ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
 		pm_runtime_put_sync(dev);
 	}
 
@@ -631,7 +634,9 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	/* Regulator */
 
-	csid->vdda = devm_regulator_get(dev, res->regulator[0]);
+	csid->vdda = NULL;
+	if (res->regulator[0])
+		csid->vdda = devm_regulator_get(dev, res->regulator[0]);
 	if (IS_ERR(csid->vdda)) {
 		dev_err(dev, "could not get regulator\n");
 		return PTR_ERR(csid->vdda);
-- 
2.33.0

