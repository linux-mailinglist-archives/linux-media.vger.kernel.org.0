Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A37579BFB7
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 02:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbjIKUsF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237783AbjIKNOa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 09:14:30 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2484CE4D
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 06:14:23 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b974031aeaso75953351fa.0
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 06:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694438061; x=1695042861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RcC5Z13/zUqK69N/so6eHAgcugzjOcvez6QkwUNOkw=;
        b=e608DI5MeHuewZICLaYIMTA3PLHsCNdeHaBJicx5TJA2t3PBjIiURUTppjEnk8vOJk
         PuiiEo0osu6Xm98rd4UOoaki65MDVGCZeEyCzWtK9RzO/KKVzBTpTwCNC4gxFkZmERyr
         n9spqVxObhxtiTSmvSUQySliglj5ZN9SBQvPb7Cb4O3js0Myfp9br+P33Bqmklj/mQL7
         7oTG49CoXllUKf50T4oz8BcaVV5omEkDt2Quo+IlgGQH6Q/EnTyf/kRdMJvo0iLbBBXf
         +FMG7Y7XNg2YyL1ETQPTxWvUGtNsqYITPZ6qBBp1dQ5o/orqL3vIUBoA0xy59v1gmAky
         d08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438061; x=1695042861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RcC5Z13/zUqK69N/so6eHAgcugzjOcvez6QkwUNOkw=;
        b=nQPC4aRIV7++i1zP0V69fhATNomQ4grN2ZifTO/9HQgsNi0tEAGK6fZ124moyC3MV4
         8dQLPvilz2Qd3FKcyerKnodN7iXqwV8jD/BUuhUDLJJtEWcYj8plkhVA+c67bor4xiV9
         AsuFIuS0J8e95mvjM+/AoXWPBTcRfCAhmPupsEdywXa0+k+qCcekRq+wexFJ6pGUx2lL
         /qKqsPt1ATIp9DEHh5mo278MVbwVpgVfEBtocojxB7Pd7S7iNIKt6kkIdiYPKoXBfG2J
         xIi7kBFtA9T+YnZFEt/agMTeAQ7torBIxMntLi3BglECC1me5kueLlnJgbgHCkjE93ZT
         IjGg==
X-Gm-Message-State: AOJu0Yzwu2sRvrv40DfW4y3NOgbA0GNkg2cLu0hQZ5gCfbDIP8DCRWIK
        BeOFkKelqiDc/VUI2j48QinztA==
X-Google-Smtp-Source: AGHT+IEBSitRF+GReY4YEQ7PXo00HY0hbbrEP0K4D/6MFcaM/1B615RZDjmTKOPu8g1QV3IQGb968g==
X-Received: by 2002:a2e:88c6:0:b0:2b9:e317:ec4d with SMTP id a6-20020a2e88c6000000b002b9e317ec4dmr8277127ljk.39.1694438061421;
        Mon, 11 Sep 2023 06:14:21 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id kt8-20020a170906aac800b00988e953a586sm5313648ejb.61.2023.09.11.06.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:14:21 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/17] media: qcom: camss: Pass CAMSS subdev callbacks via resource ops pointer
Date:   Mon, 11 Sep 2023 14:14:01 +0100
Message-ID: <20230911131411.196033-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
References: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
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

It is possible to pass all of the CAMSS subdevice internal operations
pointers from the controlling resources structure with an additional
pointer added to the resources structure.

This allows for the removal of most of the probe-time control structures.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid.c    |  12 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  20 +--
 drivers/media/platform/qcom/camss/camss.c     | 117 ++++++++++++------
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 5 files changed, 86 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 14abb7a7ceb47..99f651e2021cb 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -575,18 +575,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	csid->camss = camss;
 	csid->id = id;
+	csid->ops = res->ops;
 
-	if (camss->res->version == CAMSS_8x16) {
-		csid->ops = &csid_ops_4_1;
-	} else if (camss->res->version == CAMSS_8x96 ||
-		   camss->res->version == CAMSS_660) {
-		csid->ops = &csid_ops_4_7;
-	} else if (camss->res->version == CAMSS_845 ||
-		   camss->res->version == CAMSS_8250) {
-		csid->ops = &csid_ops_gen2;
-	} else {
-		return -EINVAL;
-	}
 	csid->ops->subdev_init(csid);
 
 	/* Memory */
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 48e6a101ec9c9..4310a132dcbe2 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -556,19 +556,17 @@ int msm_csiphy_subdev_init(struct camss *camss,
 	csiphy->camss = camss;
 	csiphy->id = id;
 	csiphy->cfg.combo_mode = 0;
+	csiphy->ops = res->ops;
 
 	if (camss->res->version == CAMSS_8x16) {
-		csiphy->ops = &csiphy_ops_2ph_1_0;
 		csiphy->formats = csiphy_formats_8x16;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x16);
 	} else if (camss->res->version == CAMSS_8x96 ||
 		   camss->res->version == CAMSS_660) {
-		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_8x96;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
 	} else if (camss->res->version == CAMSS_845 ||
 		   camss->res->version == CAMSS_8250) {
-		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_sdm845;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
 	} else {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f381c82f1f877..4d5c32d3dddbf 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1286,25 +1286,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	int i, j;
 	int ret;
 
-	switch (camss->res->version) {
-	case CAMSS_8x16:
-		vfe->ops = &vfe_ops_4_1;
-		break;
-	case CAMSS_8x96:
-		vfe->ops = &vfe_ops_4_7;
-		break;
-	case CAMSS_660:
-		vfe->ops = &vfe_ops_4_8;
-		break;
-	case CAMSS_845:
-		vfe->ops = &vfe_ops_170;
-		break;
-	case CAMSS_8250:
-		vfe->ops = &vfe_ops_480;
-		break;
-	default:
-		return -EINVAL;
-	}
+	vfe->ops = res->ops;
 
 	if (!res->line_num)
 		return -EINVAL;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 54886a2a449b0..12131d9ea7ca8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -42,7 +42,8 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 				{ 0 },
 				{ 100000000, 200000000 } },
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
-		.interrupt = { "csiphy0" }
+		.interrupt = { "csiphy0" },
+		.ops = &csiphy_ops_2ph_1_0
 	},
 
 	/* CSIPHY1 */
@@ -54,7 +55,8 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 				{ 0 },
 				{ 100000000, 200000000 } },
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
-		.interrupt = { "csiphy1" }
+		.interrupt = { "csiphy1" },
+		.ops = &csiphy_ops_2ph_1_0
 	}
 };
 
@@ -73,7 +75,8 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
-		.interrupt = { "csid0" }
+		.interrupt = { "csid0" },
+		.ops = &csid_ops_4_1,
 	},
 
 	/* CSID1 */
@@ -90,7 +93,8 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
-		.interrupt = { "csid1" }
+		.interrupt = { "csid1" },
+		.ops = &csid_ops_4_1,
 	},
 };
 
@@ -125,6 +129,7 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = VFE_LINE_NUM_GEN1,
+		.ops = &vfe_ops_4_1
 	}
 };
 
@@ -138,7 +143,8 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 				{ 0 },
 				{ 100000000, 200000000, 266666667 } },
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
-		.interrupt = { "csiphy0" }
+		.interrupt = { "csiphy0" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 
 	/* CSIPHY1 */
@@ -150,7 +156,8 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 				{ 0 },
 				{ 100000000, 200000000, 266666667 } },
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
-		.interrupt = { "csiphy1" }
+		.interrupt = { "csiphy1" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 
 	/* CSIPHY2 */
@@ -162,7 +169,8 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 				{ 0 },
 				{ 100000000, 200000000, 266666667 } },
 		.reg = { "csiphy2", "csiphy2_clk_mux" },
-		.interrupt = { "csiphy2" }
+		.interrupt = { "csiphy2" },
+		.ops = &csiphy_ops_3ph_1_0
 	}
 };
 
@@ -181,7 +189,8 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
-		.interrupt = { "csid0" }
+		.interrupt = { "csid0" },
+		.ops = &csid_ops_4_7,
 	},
 
 	/* CSID1 */
@@ -198,7 +207,8 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
-		.interrupt = { "csid1" }
+		.interrupt = { "csid1" },
+		.ops = &csid_ops_4_7,
 	},
 
 	/* CSID2 */
@@ -215,7 +225,8 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
-		.interrupt = { "csid2" }
+		.interrupt = { "csid2" },
+		.ops = &csid_ops_4_7,
 	},
 
 	/* CSID3 */
@@ -232,7 +243,8 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
-		.interrupt = { "csid3" }
+		.interrupt = { "csid3" },
+		.ops = &csid_ops_4_7,
 	}
 };
 
@@ -266,6 +278,7 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = VFE_LINE_NUM_GEN1,
+		.ops = &vfe_ops_4_7
 	},
 
 	/* VFE1 */
@@ -285,6 +298,7 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = VFE_LINE_NUM_GEN1,
+		.ops = &vfe_ops_4_7
 	}
 };
 
@@ -300,7 +314,8 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 				{ 100000000, 200000000, 269333333 },
 				{ 0 } },
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
-		.interrupt = { "csiphy0" }
+		.interrupt = { "csiphy0" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 
 	/* CSIPHY1 */
@@ -314,7 +329,8 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 				{ 100000000, 200000000, 269333333 },
 				{ 0 } },
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
-		.interrupt = { "csiphy1" }
+		.interrupt = { "csiphy1" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 
 	/* CSIPHY2 */
@@ -328,7 +344,8 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 				{ 100000000, 200000000, 269333333 },
 				{ 0 } },
 		.reg = { "csiphy2", "csiphy2_clk_mux" },
-		.interrupt = { "csiphy2" }
+		.interrupt = { "csiphy2" },
+		.ops = &csiphy_ops_3ph_1_0
 	}
 };
 
@@ -350,7 +367,8 @@ static const struct camss_subdev_resources csid_res_660[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
-		.interrupt = { "csid0" }
+		.interrupt = { "csid0" },
+		.ops = &csid_ops_4_7,
 	},
 
 	/* CSID1 */
@@ -370,7 +388,8 @@ static const struct camss_subdev_resources csid_res_660[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
-		.interrupt = { "csid1" }
+		.interrupt = { "csid1" },
+		.ops = &csid_ops_4_7,
 	},
 
 	/* CSID2 */
@@ -390,7 +409,8 @@ static const struct camss_subdev_resources csid_res_660[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
-		.interrupt = { "csid2" }
+		.interrupt = { "csid2" },
+		.ops = &csid_ops_4_7,
 	},
 
 	/* CSID3 */
@@ -410,7 +430,8 @@ static const struct camss_subdev_resources csid_res_660[] = {
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
-		.interrupt = { "csid3" }
+		.interrupt = { "csid3" },
+		.ops = &csid_ops_4_7,
 	}
 };
 
@@ -447,6 +468,7 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = VFE_LINE_NUM_GEN1,
+		.ops = &vfe_ops_4_8
 	},
 
 	/* VFE1 */
@@ -469,6 +491,7 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = VFE_LINE_NUM_GEN1,
+		.ops = &vfe_ops_4_8
 	}
 };
 
@@ -488,7 +511,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 				{ 0 },
 				{ 19200000, 240000000, 269333333 } },
 		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" }
+		.interrupt = { "csiphy0" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 
 	/* CSIPHY1 */
@@ -506,7 +530,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 				{ 0 },
 				{ 19200000, 240000000, 269333333 } },
 		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" }
+		.interrupt = { "csiphy1" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 
 	/* CSIPHY2 */
@@ -524,7 +549,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 				{ 0 },
 				{ 19200000, 240000000, 269333333 } },
 		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" }
+		.interrupt = { "csiphy2" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 
 	/* CSIPHY3 */
@@ -542,7 +568,8 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 				{ 0 },
 				{ 19200000, 240000000, 269333333 } },
 		.reg = { "csiphy3" },
-		.interrupt = { "csiphy3" }
+		.interrupt = { "csiphy3" },
+		.ops = &csiphy_ops_3ph_1_0
 	}
 };
 
@@ -564,7 +591,8 @@ static const struct camss_subdev_resources csid_res_845[] = {
 				{ 19200000, 75000000, 384000000, 538666667 },
 				{ 384000000 } },
 		.reg = { "csid0" },
-		.interrupt = { "csid0" }
+		.interrupt = { "csid0" },
+		.ops = &csid_ops_gen2
 	},
 
 	/* CSID1 */
@@ -584,7 +612,8 @@ static const struct camss_subdev_resources csid_res_845[] = {
 				{ 19200000, 75000000, 384000000, 538666667 },
 				{ 384000000 } },
 		.reg = { "csid1" },
-		.interrupt = { "csid1" }
+		.interrupt = { "csid1" },
+		.ops = &csid_ops_gen2
 	},
 
 	/* CSID2 */
@@ -604,7 +633,8 @@ static const struct camss_subdev_resources csid_res_845[] = {
 				{ 19200000, 75000000, 384000000, 538666667 },
 				{ 384000000 } },
 		.reg = { "csid2" },
-		.interrupt = { "csid2" }
+		.interrupt = { "csid2" },
+		.ops = &csid_ops_gen2
 	}
 };
 
@@ -628,6 +658,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = VFE_LINE_NUM_GEN2,
+		.ops = &vfe_ops_170
 	},
 
 	/* VFE1 */
@@ -649,6 +680,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = VFE_LINE_NUM_GEN2,
+		.ops = &vfe_ops_170
 	},
 
 	/* VFE-lite */
@@ -669,6 +701,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.reg = { "vfe_lite" },
 		.interrupt = { "vfe_lite" },
 		.line_num = VFE_LINE_NUM_GEN2,
+		.ops = &vfe_ops_170
 	}
 };
 
@@ -680,7 +713,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
 		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" }
+		.interrupt = { "csiphy0" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 	/* CSIPHY1 */
 	{
@@ -689,7 +723,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
 		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" }
+		.interrupt = { "csiphy1" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 	/* CSIPHY2 */
 	{
@@ -698,7 +733,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
 		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" }
+		.interrupt = { "csiphy2" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 	/* CSIPHY3 */
 	{
@@ -707,7 +743,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
 		.reg = { "csiphy3" },
-		.interrupt = { "csiphy3" }
+		.interrupt = { "csiphy3" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 	/* CSIPHY4 */
 	{
@@ -716,7 +753,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
 		.reg = { "csiphy4" },
-		.interrupt = { "csiphy4" }
+		.interrupt = { "csiphy4" },
+		.ops = &csiphy_ops_3ph_1_0
 	},
 	/* CSIPHY5 */
 	{
@@ -725,7 +763,8 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
 		.reg = { "csiphy5" },
-		.interrupt = { "csiphy5" }
+		.interrupt = { "csiphy5" },
+		.ops = &csiphy_ops_3ph_1_0
 	}
 };
 
@@ -740,7 +779,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid0" },
-		.interrupt = { "csid0" }
+		.interrupt = { "csid0" },
+		.ops = &csid_ops_gen2
 	},
 	/* CSID1 */
 	{
@@ -752,7 +792,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid1" },
-		.interrupt = { "csid1" }
+		.interrupt = { "csid1" },
+		.ops = &csid_ops_gen2
 	},
 	/* CSID2 */
 	{
@@ -763,7 +804,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 				{ 400000000, 480000000 },
 				{ 0 } },
 		.reg = { "csid2" },
-		.interrupt = { "csid2" }
+		.interrupt = { "csid2" },
+		.ops = &csid_ops_gen2
 	},
 	/* CSID3 */
 	{
@@ -774,7 +816,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 				{ 400000000, 480000000 },
 				{ 0 } },
 		.reg = { "csid3" },
-		.interrupt = { "csid3" }
+		.interrupt = { "csid3" },
+		.ops = &csid_ops_gen2
 	}
 };
 
@@ -797,6 +840,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = 4,
+		.ops = &vfe_ops_480
 	},
 	/* VFE1 */
 	{
@@ -816,6 +860,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = 4,
+		.ops = &vfe_ops_480
 	},
 	/* VFE2 (lite) */
 	{
@@ -834,6 +879,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
 		.line_num = 4,
+		.ops = &vfe_ops_480
 	},
 	/* VFE3 (lite) */
 	{
@@ -852,6 +898,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
 		.line_num = 4,
+		.ops = &vfe_ops_480
 	},
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index fc02aa84a5dd7..8acad7321c09d 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -49,6 +49,7 @@ struct camss_subdev_resources {
 	char *reg[CAMSS_RES_MAX];
 	char *interrupt[CAMSS_RES_MAX];
 	u8 line_num;
+	const void *ops;
 };
 
 struct icc_bw_tbl {
-- 
2.42.0

