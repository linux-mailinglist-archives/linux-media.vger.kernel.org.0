Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE877978B0
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244298AbjIGQwH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244272AbjIGQwG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:52:06 -0400
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0331BFD
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:51:34 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40061928e5aso13170035e9.3
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105061; x=1694709861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEHv0MdkX93VAwCi1pNsQdwYRCrC3ZMgoibqw+TRjPw=;
        b=J58ksav4mPwF7fDql0Le6dUT7clKNxWSO/9+SXFPPutQZIXucvk87PR+2bBUUKtouY
         iy5FcVVdwcsSaudk5FfW3bdBDUKGuq+7bCO3Z6VIXeStzGXHa+OM+vFJU+hWuoJE9oA8
         LaZGl+nUhy3fiKz7GrhxkeQkd3RRr1H+B2RX68dhxgApVIeS1f6kjPwYldFK4jApMNPQ
         +APmGjzjMdufL7kxFZ0GLM9MUx+lFZkKuarbAVgVNviGzbDTMd3CAXA/uJ37qIpz6prC
         ie72sZX7seI4mo2KUz3Mm6IUA84LOlO7hWoNGm+mJv7CXt0w3u1gMGFnMHTyZY6d+6BP
         q7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105061; x=1694709861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEHv0MdkX93VAwCi1pNsQdwYRCrC3ZMgoibqw+TRjPw=;
        b=b1DFikQVWJN1fL1s7xsdZIjsZq3chkzJyeeWZFlH3S4QeJkHZcU5QXiHBrDN+PAolk
         qn+a6odoe3DNQ8X3aSVg5pWelZkomHjGhM64tgvliOFxbo0nehCbzPj0IywtsSR95MnE
         66/O370xtoTEBvY7dNVcAgrIYjBvMVrwPwlvCX6bQUoPsKAlrVINt2VyHsMe35jyrctK
         0j2Z1HYqgG9LUetj67gbwN3WHGckCKvX6qVg9Mux+cbWjrEd3JIcKRccNbYJ7NZzn0uc
         GM3UWukB3BdLhxGGd3OFi+cGcIzwPHO85W7IShewZULMb3Pf7uD5YaNM60zyJ7jjK9Wr
         uTkw==
X-Gm-Message-State: AOJu0Yxja1dTmuh/fg8ETxz7aaIXqEzrfDuB3hFPG4Jo2J09AUnYbpAB
        scHkXZEswDap0RLgvyYMTUbp8g==
X-Google-Smtp-Source: AGHT+IFkzdTbzhr5MEuwRGNQuvx0ZAuPI3EQQBj3a/RoaT81dJU4eHj0yVwXL+761H1AaYu7u0Ri6Q==
X-Received: by 2002:adf:cd0a:0:b0:317:cdc4:762e with SMTP id w10-20020adfcd0a000000b00317cdc4762emr6008892wrm.63.1694105061207;
        Thu, 07 Sep 2023 09:44:21 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:20 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/17] media: qcom: camss: Pass line_num from compat resources
Date:   Thu,  7 Sep 2023 17:43:59 +0100
Message-ID: <20230907164410.36651-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

line_num indicates the number of RDI - raw data interface channels which
are associated with a given IFE/VFE - image/video front end.

On several SoCs the RDI number is not static for each VFE - for example
on sm8250 VFE Lite has four RDIs where regular VFE has three.

Assigning line_num statically in the subdev_init() phase initialises
each VFE to the lower number, meaning in practical terms that we are
lobbing off one RDI on some VFEs.

Interrupt handling uses static for (i = RDI0; i < RDI2; i++) {} in some
of our VFE blocks but this can't work for situations where we have a
mixture of VFE @ 3 RDI and VFE-lite @ 4 RDI blocks.

First step to remediate is to pass line_num from a compat string
controlled data-structure and do so on a per-VFE basis.

Later patches will assign the correct number of RDI blocks per VFE.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/qcom/camss/camss-vfe-170.c |  2 --
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  2 --
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  2 --
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  2 --
 .../media/platform/qcom/camss/camss-vfe-480.c |  1 -
 drivers/media/platform/qcom/camss/camss-vfe.c |  5 +++
 drivers/media/platform/qcom/camss/camss.c     | 36 ++++++++++++-------
 drivers/media/platform/qcom/camss/camss.h     |  1 +
 8 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 82d2392022dd1..2ba7160b3bd1e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -753,8 +753,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
 	vfe->isr_ops = vfe_isr_ops_170;
 	vfe->video_ops = vfe_video_ops_170;
-
-	vfe->line_num = VFE_LINE_NUM_GEN2;
 }
 
 const struct vfe_hw_ops vfe_ops_170 = {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index bc309f326f519..2911e4126e7ad 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -992,8 +992,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 	vfe->isr_ops = vfe_isr_ops_gen1;
 	vfe->ops_gen1 = &vfe_ops_gen1_4_1;
 	vfe->video_ops = vfe_video_ops_gen1;
-
-	vfe->line_num = VFE_LINE_NUM_GEN1;
 }
 
 const struct vfe_hw_ops vfe_ops_4_1 = {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 8acd76c9746ba..b65ed0fef595e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1188,8 +1188,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 	vfe->isr_ops = vfe_isr_ops_gen1;
 	vfe->ops_gen1 = &vfe_ops_gen1_4_7;
 	vfe->video_ops = vfe_video_ops_gen1;
-
-	vfe->line_num = VFE_LINE_NUM_GEN1;
 }
 
 const struct vfe_hw_ops vfe_ops_4_7 = {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 3a0167ecf873a..7b3805177f037 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -1173,8 +1173,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 	vfe->isr_ops = vfe_isr_ops_gen1;
 	vfe->ops_gen1 = &vfe_ops_gen1_4_8;
 	vfe->video_ops = vfe_video_ops_gen1;
-
-	vfe->line_num = VFE_LINE_NUM_GEN1;
 }
 
 const struct vfe_hw_ops vfe_ops_4_8 = {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 074fa4e38163e..43a2964121f22 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -569,7 +569,6 @@ static const struct camss_video_ops vfe_video_ops_480 = {
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
 	vfe->video_ops = vfe_video_ops_480;
-	vfe->line_num = MAX_VFE_OUTPUT_LINES;
 }
 
 const struct vfe_hw_ops vfe_ops_480 = {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 94ee7c7039eb3..f381c82f1f877 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1305,6 +1305,11 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	default:
 		return -EINVAL;
 	}
+
+	if (!res->line_num)
+		return -EINVAL;
+
+	vfe->line_num = res->line_num;
 	vfe->ops->subdev_init(dev, vfe);
 
 	/* Memory */
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d1152a7db9cd2..54886a2a449b0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -123,7 +123,8 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "vfe0" },
-		.interrupt = { "vfe0" }
+		.interrupt = { "vfe0" },
+		.line_num = VFE_LINE_NUM_GEN1,
 	}
 };
 
@@ -263,7 +264,8 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "vfe0" },
-		.interrupt = { "vfe0" }
+		.interrupt = { "vfe0" },
+		.line_num = VFE_LINE_NUM_GEN1,
 	},
 
 	/* VFE1 */
@@ -281,7 +283,8 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "vfe1" },
-		.interrupt = { "vfe1" }
+		.interrupt = { "vfe1" },
+		.line_num = VFE_LINE_NUM_GEN1,
 	}
 };
 
@@ -442,7 +445,8 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "vfe0" },
-		.interrupt = { "vfe0" }
+		.interrupt = { "vfe0" },
+		.line_num = VFE_LINE_NUM_GEN1,
 	},
 
 	/* VFE1 */
@@ -463,7 +467,8 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "vfe1" },
-		.interrupt = { "vfe1" }
+		.interrupt = { "vfe1" },
+		.line_num = VFE_LINE_NUM_GEN1,
 	}
 };
 
@@ -621,7 +626,8 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 				{ 19200000, 75000000, 384000000, 538666667 },
 				{ 384000000 } },
 		.reg = { "vfe0" },
-		.interrupt = { "vfe0" }
+		.interrupt = { "vfe0" },
+		.line_num = VFE_LINE_NUM_GEN2,
 	},
 
 	/* VFE1 */
@@ -641,7 +647,8 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 				{ 19200000, 75000000, 384000000, 538666667 },
 				{ 384000000 } },
 		.reg = { "vfe1" },
-		.interrupt = { "vfe1" }
+		.interrupt = { "vfe1" },
+		.line_num = VFE_LINE_NUM_GEN2,
 	},
 
 	/* VFE-lite */
@@ -660,7 +667,8 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 				{ 19200000, 75000000, 384000000, 538666667 },
 				{ 384000000 } },
 		.reg = { "vfe_lite" },
-		.interrupt = { "vfe_lite" }
+		.interrupt = { "vfe_lite" },
+		.line_num = VFE_LINE_NUM_GEN2,
 	}
 };
 
@@ -787,7 +795,8 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "vfe0" },
-		.interrupt = { "vfe0" }
+		.interrupt = { "vfe0" },
+		.line_num = 4,
 	},
 	/* VFE1 */
 	{
@@ -805,7 +814,8 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "vfe1" },
-		.interrupt = { "vfe1" }
+		.interrupt = { "vfe1" },
+		.line_num = 4,
 	},
 	/* VFE2 (lite) */
 	{
@@ -822,7 +832,8 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 400000000, 480000000 },
 				{ 0 } },
 		.reg = { "vfe_lite0" },
-		.interrupt = { "vfe_lite0" }
+		.interrupt = { "vfe_lite0" },
+		.line_num = 4,
 	},
 	/* VFE3 (lite) */
 	{
@@ -839,7 +850,8 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 400000000, 480000000 },
 				{ 0 } },
 		.reg = { "vfe_lite1" },
-		.interrupt = { "vfe_lite1" }
+		.interrupt = { "vfe_lite1" },
+		.line_num = 4,
 	},
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 3b6562b515d46..fc02aa84a5dd7 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -48,6 +48,7 @@ struct camss_subdev_resources {
 	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
 	char *reg[CAMSS_RES_MAX];
 	char *interrupt[CAMSS_RES_MAX];
+	u8 line_num;
 };
 
 struct icc_bw_tbl {
-- 
2.41.0

