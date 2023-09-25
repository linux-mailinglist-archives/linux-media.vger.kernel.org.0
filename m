Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5D567ADC17
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 17:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbjIYPrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 11:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbjIYPrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 11:47:33 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACEF1AD
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:47:21 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3226cc3e324so5756660f8f.3
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695656839; x=1696261639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhSKtn1WWoetbFcEPefpk8WL/CMtB2nONd2TgD1HTnc=;
        b=a+qYhljL1C/V066XBe5dZ7FqjupeM+qrarX+trLPW9j+kyO1yoRxCMQfHK1vn8USlR
         d2Hq/16C3cJ1KmEym1zi8vgJbVRQwsWIJC4PTP/+WZAaPRyYTkq0iP3hAiZm8fJ90+kZ
         qxZTpcrevIV3WUnakufumRaGJnBBNRLRnGECHb+cn2DClVBt++88c67zabJ4Ly3QNnzx
         lYiyw1dplBHSyC1DAnMK8oBTxhe16BeKSbsezaDL47s1zkgxODiu3TLvCOytVoXcusop
         ss+7n+5+uktxBNDVANe1h04qz+3grk91vaztPwaWl2NDyxiD/wEtmrgHUsYJPCKKB/u1
         kWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656840; x=1696261640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhSKtn1WWoetbFcEPefpk8WL/CMtB2nONd2TgD1HTnc=;
        b=T8G4Fbk51rPddBMO1y70blf+YP5laCw+wLJuT+f0CXspyPAkZ39aPZ9qrXI9JP6w76
         Pi7BN9708hXRR31JDmlQFxRxeHBWNkaMjIWBtLmDmbCiGAkvLMpKkRs99ePY6cK++brh
         X8QPA0APUPESnKgCYFpakMVsOt1ps0y7Tc3PCl4r69a/e3Cdt/JPMFRsYGa5hnPSLAY0
         wWHHexEVtiCun/rl5IJG4KVp3HTTIUFgG7XhXWWAlQ1ao0l1W/0HGru3dQ1m9g1uAwB/
         vIJs9A21h+ALLUdCgPJLlm0HOrWsMYa/pS42vS0jb5QnbaziGLjYJnpF7UFabOxMQY2f
         XKuA==
X-Gm-Message-State: AOJu0YwQdxnQg0/3olOVz167CH4ktaDONr8FGUTNmzO4n1THUYGsefX8
        JTxKCS1XpGyTsVS76Nhbq86SJQ==
X-Google-Smtp-Source: AGHT+IF3/kX/IsfEDqGbANuV/GKw0nYXoU2maXmedXQCLdb4WJ8/qOgQ3XPyAznzEKF/1EpXttn29A==
X-Received: by 2002:a5d:6382:0:b0:319:8c35:378 with SMTP id p2-20020a5d6382000000b003198c350378mr6188318wru.44.1695656839745;
        Mon, 25 Sep 2023 08:47:19 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d4-20020adffd84000000b0031f34a395e7sm12077536wrr.45.2023.09.25.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:47:19 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [RESEND PATCH v6 08/17] media: qcom: camss: Assign the correct number of RDIs per VFE
Date:   Mon, 25 Sep 2023 16:46:58 +0100
Message-ID: <20230925154707.837542-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925154707.837542-1-bryan.odonoghue@linaro.org>
References: <20230925154707.837542-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each Video Front End - VFE - has a variable number of Raw Data Interfaces -
RDIs associated with it.

The CAMSS code started from a naive implementation where a fixed define was
used as a control in a for(){} loop iterating through RDIs.

That model scales badly. An attempt was made with  VFE_LINE_NUM_GEN2 and
VFE_LINE_NUM_GEN1 to differentiate between SoCs but, the problem with that
is "gen1" and "gen2" have no meaning in the silicon. There is no fixed
constraint in the silicon between VFE and RDI, it is entirely up to the SoC
designers how many VFEs are populated and how many RDIs to associate with
each VFE.

As an example sdm845 has VFE version 175 and sm8250 VFE version 480.
sdm845 has 2 VFEs with 4 RDIs and 1 VFE Lite with 4 RDIs.
sm8250 has 2 VFEs with 3 RDIs and 2 VFE Lite with 4 RDIs.

Clearly then we need a more granular model to capture the necessary data.

The defines have gone away to be replaced with per-SoC data but, we haven't
populated the parameter data with the real values.

Let's call those values out now

msm8916:
1 x VFE
3 x RDI per VFE (not 4)

msm8996:
2 x VFE
3 x RDI per VFE (not 4)

sdm660:
2 x VFE
3 x RDI per VFE (not 4)

sdm845:
2 x VFE
4 x RDI per VFE (not 3)
1 x VFE Lite
4 x RDI per VFE Lite (not 3)

sm8250:
2 x VFE
3 x RDI per VFE (not 4)
2 x VFE Lite
4 x RDI per VFE Lite

This more complex and correct mapping was not possible prior to passing
values via driver data. Now that we have that change in place we can
correctly map VFEs to RDIs for each VFE.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.h |  2 --
 drivers/media/platform/qcom/camss/camss.c     | 20 +++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index b4bae9f65c68f..4783afa73a365 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -52,9 +52,7 @@ enum vfe_line_id {
 	VFE_LINE_RDI0 = 0,
 	VFE_LINE_RDI1 = 1,
 	VFE_LINE_RDI2 = 2,
-	VFE_LINE_NUM_GEN2 = 3,
 	VFE_LINE_PIX = 3,
-	VFE_LINE_NUM_GEN1 = 4,
 	VFE_LINE_NUM_MAX = 4
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 12131d9ea7ca8..8e78dd8d5961e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -128,7 +128,7 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
 				{ 0 } },
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
-		.line_num = VFE_LINE_NUM_GEN1,
+		.line_num = 3,
 		.ops = &vfe_ops_4_1
 	}
 };
@@ -277,7 +277,7 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 				{ 0 } },
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
-		.line_num = VFE_LINE_NUM_GEN1,
+		.line_num = 3,
 		.ops = &vfe_ops_4_7
 	},
 
@@ -297,7 +297,7 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 				{ 0 } },
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
-		.line_num = VFE_LINE_NUM_GEN1,
+		.line_num = 3,
 		.ops = &vfe_ops_4_7
 	}
 };
@@ -467,7 +467,7 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 				{ 0 } },
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
-		.line_num = VFE_LINE_NUM_GEN1,
+		.line_num = 3,
 		.ops = &vfe_ops_4_8
 	},
 
@@ -490,7 +490,7 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 				{ 0 } },
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
-		.line_num = VFE_LINE_NUM_GEN1,
+		.line_num = 3,
 		.ops = &vfe_ops_4_8
 	}
 };
@@ -657,7 +657,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 				{ 384000000 } },
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
-		.line_num = VFE_LINE_NUM_GEN2,
+		.line_num = 4,
 		.ops = &vfe_ops_170
 	},
 
@@ -679,7 +679,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 				{ 384000000 } },
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
-		.line_num = VFE_LINE_NUM_GEN2,
+		.line_num = 4,
 		.ops = &vfe_ops_170
 	},
 
@@ -700,7 +700,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 				{ 384000000 } },
 		.reg = { "vfe_lite" },
 		.interrupt = { "vfe_lite" },
-		.line_num = VFE_LINE_NUM_GEN2,
+		.line_num = 4,
 		.ops = &vfe_ops_170
 	}
 };
@@ -839,7 +839,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 } },
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
-		.line_num = 4,
+		.line_num = 3,
 		.ops = &vfe_ops_480
 	},
 	/* VFE1 */
@@ -859,7 +859,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 } },
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
-		.line_num = 4,
+		.line_num = 3,
 		.ops = &vfe_ops_480
 	},
 	/* VFE2 (lite) */
-- 
2.42.0

