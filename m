Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8D647855B4
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 12:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234020AbjHWKpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 06:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbjHWKpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 06:45:02 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B339DCDA
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 03:44:59 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so2072416f8f.3
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 03:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692787498; x=1693392298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Fdh/fEq9xl23muJMDNyxcP6ElZOdNEZWpFYYwHgssM=;
        b=Rh+nBjG2m0uJ2Jp0JTsRdGbj3c9L7TM69DXAqpGBNSV6lJ4AYB4GhWXmhZnmMSUlL/
         zC0vFYNZPEvpRr9btJM9zOUoUnUgX3RKJ9x6r8GOYmYnCcVSzHZdhsQSn7XlapIoEgyx
         eVfQXJCx5ZlFlWb/bTNgBQS/HBMuqSegQ3ngyQpwpiZ0hCiPEAYZTSFHVroNayuBaoDs
         ifnRj5QlScxAFPxRjOcaAPeByeUaW3o+XHlGkjikG1sukfG9oJswtFLewSRwx/5Uax84
         xR5ZTs+mIfYD2zUi7CARVyUSPxNZPXactGsUrrsDa3x9SPOcVbC9vkoYSKX8Y9xI+S4X
         kRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692787498; x=1693392298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Fdh/fEq9xl23muJMDNyxcP6ElZOdNEZWpFYYwHgssM=;
        b=mB1LELwxAYUrYDJu2F2TrEx9zc9fFmFBMRTB31aF6LVD5BoNRCKueBJSUTwg1HDBeh
         64oHtwkhjFu+cPj7wIleGDjBsvYrrTnihg9E/+rpNKLNNLibSKkVpwJ+s7QE+zgtAmOf
         gS5jx9pCAkJm1cuv9t26X9NB0qLgUAUEwk6JopmXi1bwlzcVbIjzz1ND1o2aEMIluCtO
         ltTS2rc33jjOPbav3SoF/mhWB7K1n2XgonnYD45FM/HXjjw8ZVwR4GZDCfW8jOppdzTH
         j8V9Pt1xG9Uyqc44XIEnPM6hF7Fo6dpmncJLnfHjOqsEoGZr8E2cy9B2wxcAqIp86ZPt
         6/DQ==
X-Gm-Message-State: AOJu0YyfP/6oElVyGM6KLdY5Brnooyupdqh8kqb6eQZNR7uhEsBMhDIn
        E0BghJF5BG/CcUKVC/YCK48wiw==
X-Google-Smtp-Source: AGHT+IHnA0qSAUGqoGlPmAKj2P3G2fV1/TheB1TXkaqI8lTcgxDgY6R1/RRh7dVpjJKtDbVVSJaZNw==
X-Received: by 2002:adf:f48e:0:b0:30e:3da5:46e5 with SMTP id l14-20020adff48e000000b0030e3da546e5mr9441003wro.59.1692787498303;
        Wed, 23 Aug 2023 03:44:58 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4204000000b0031c5dda3aedsm6281213wrq.95.2023.08.23.03.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 03:44:57 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/15] media: qcom: camss: Capture VFE CSID dependency in a helper function
Date:   Wed, 23 Aug 2023 11:44:36 +0100
Message-ID: <20230823104444.1954663-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From sdm845 onwards we need to ensure the VFE is powered on prior to
switching on the CSID.

Alternatively we could model up the GDSCs and clocks the CSID needs
without the VFE but, there's a real question of the legitimacy of such a
use-case.

For now drawing a line at sdm845 and switching on the associated VFEs is
a perfectly valid thing to do.

Rather than continually extend out this clause for at least two new SoCs
with this same model - making the vfe_get/vfe_put path start to look
like spaghetti we can encoded the dependency in a helper function.

Use csid_depends_vfe() for this purpose.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid.c    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 08991b070bd61..fd04ed112b564 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -146,6 +146,22 @@ static int csid_set_clock_rates(struct csid_device *csid)
 	return 0;
 }
 
+static bool csid_depends_vfe(u32 version)
+{
+	bool ret = false;
+
+	switch (version) {
+	case CAMSS_845:
+	case CAMSS_8250:
+		ret = true;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 /*
  * csid_set_power - Power on/off CSID module
  * @sd: CSID V4L2 subdevice
@@ -163,7 +179,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	int ret = 0;
 
 	if (on) {
-		if (version == CAMSS_8250 || version == CAMSS_845) {
+		if (csid_depends_vfe(version)) {
 			ret = vfe_get(vfe);
 			if (ret < 0)
 				return ret;
@@ -217,7 +233,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		regulator_bulk_disable(csid->num_supplies,
 				       csid->supplies);
 		pm_runtime_put_sync(dev);
-		if (version == CAMSS_8250 || version == CAMSS_845)
+		if (csid_depends_vfe(version))
 			vfe_put(vfe);
 	}
 
-- 
2.41.0

