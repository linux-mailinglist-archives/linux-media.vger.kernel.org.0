Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46FD879791A
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 19:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbjIGRCQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 13:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241501AbjIGRCB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 13:02:01 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF37126B2
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 10:01:36 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so1138906f8f.2
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106000; x=1694710800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2eMRVYZa9yK+ZkgTl4p3lLwil9RZtGAozJNRxapQmc=;
        b=EN/6vh+ElJYUFAVagbrxjpTnwtDH9GEC6eDYqEeyPW7CTB1gW8s8Fwp6omXEC9XpNl
         zsoZDuZNLhxddR2wzeZiEPBs01MEZP0r+x3EbrCno8DnnhzRcvII4ACml/LhqkgV6aHk
         LuH+mPKyIVwd/Z/kAmNY46GstFIpfCqwRr+88dNegDExgZS/gRCIoXN2RhrOg8rPqHdG
         eK2yvyP8cCgDIlO597D2POqYMBY0lNR1ljWcpX5F/8txW21llyOfI/Ie79Lm2TqGoEon
         Dbwcn5HIWuf+M2gwWCjtVwIvn/W9wp9XP0yjQikZeQJE9yS0KtLwmBOvSLkAwZ0u4BDH
         O7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694106000; x=1694710800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2eMRVYZa9yK+ZkgTl4p3lLwil9RZtGAozJNRxapQmc=;
        b=dqcA9LIVpXEJxf8AyNis07ePaBO2wZ/nc2BEjYcJVdpjPSTgf/jUPh9YaG0ylU2zMV
         tauVs2QYuUqdtYQG0QQhKRqIob7MdRvt+2ge7vEv0Sw9tJPwn6QXkz3pkwKD8/fynKfq
         ACM+9Ffs588Tza+LXl1PCxqQgySMP/hD/r0EaAUdVXRSiv6FjhHRytGlnIJPmTGRj9Hp
         n5CbIe9Xpke2ZArF02wvyfYwHZAXOHZXUu+9rkBzAbIZ/tGutvkxVAKfvCV8eFJR4jfb
         8/DbOp5db/cn6LZ9eswtMyfpwSQspnlOoIeLr5BZ0yCazatTdHWlN0n3Z9XKgOPcVSFr
         LKcg==
X-Gm-Message-State: AOJu0YwiQCj1np1prH2XIkal0HvqL15QAB190Lsu6jNF/oBDDbI7mazm
        nuYWGovN/tjHDZGj7kHBmjLKTb2QkPbtnun6oQU=
X-Google-Smtp-Source: AGHT+IFfEQjrdgJzj3lbHrT1DzWXt/XdNKHsEr/Du0B2dJDVUyYYVus4VSj11Y5jeqf+eAK0YDVMvg==
X-Received: by 2002:adf:f68c:0:b0:317:6cc7:6b21 with SMTP id v12-20020adff68c000000b003176cc76b21mr5206350wrp.69.1694105065339;
        Thu, 07 Sep 2023 09:44:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/17] media: qcom: camss: Assign the correct number of RDIs per VFE
Date:   Thu,  7 Sep 2023 17:44:01 +0100
Message-ID: <20230907164410.36651-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
2.41.0

