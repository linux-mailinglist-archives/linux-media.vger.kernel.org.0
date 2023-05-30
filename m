Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F051D715F9B
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 14:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjE3Mbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 08:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbjE3Mb0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 08:31:26 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E79FE
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:31:01 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af2e1725bdso53875061fa.0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 05:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449843; x=1688041843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0orgZ9VaZSXEKcYTGkUfYKaUqJC4FA3Wr38X+NX2Cs=;
        b=AHOELlFVnO1Holu06NLsIHbrTMEL1w8W+AUPz5+nw73lW50Utv4V75QyHMOKD/sSKP
         +Y1txM0AzF3gJzOWfXTXuEdfEQlM56vv25wABKQcdbFZCmPf8Bb+fuBWJTXH+XvJGGGH
         CAATTnW8dKPPNLCEDqSftnmqrontzfp/LsyMct6aToqByCB+nCtxxc95/TmTu+Vj5XjH
         49bE+om8uzmeAIS5b0dbyO0HodGkCg3nw0cAGuO5D+SRB02utJA99OBpp+rxpQPD0R7w
         dXWwCNp4ZK+Frd0Auq311tsWLXRkpkoq687q0iaLHqrC+dEhRYcLFqSEsT//vxdpSs0N
         uVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449843; x=1688041843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0orgZ9VaZSXEKcYTGkUfYKaUqJC4FA3Wr38X+NX2Cs=;
        b=ABume4KNTgvq1AqcuRQsCbjxRNB5EHTvZzuOv++8K6xwLtCqIAbCT/1uFAQb5zH4IY
         RSZtdYit5MWFTqOEa8wh/yyLW5OPjkscz/jH0Lyw/BQH+udZopydd/Li6dHXUBw2NTZp
         G3gu4B9GacCK53onDbI+5Es8ppzMVY6a8S1bCaVo3uPIiVaY6oNWgZSkcHm17iZ7LIwP
         KQjsMImzF9hnModceMFcbjNq4StSB896EFGGyMfkF4W5+7ezErORWe78oN33oKG35XIb
         S7Jq+Ftvo+sQ9gIGItx+UOabWWg8p/BXuYih34KskURpNZ96GxKBHgG9FsuZou+M0Jpe
         OPFA==
X-Gm-Message-State: AC+VfDwRFulLS+xeXVXSTkbooOa5VMI8KQNFbXI1hW74aLOignlE6tVl
        ln3i6RLzyo1s6xvdFilRqvWepQ==
X-Google-Smtp-Source: ACHHUZ6x0CcjsEwSio0P8rfzkYCU6CxHPb2yrikb/oGtCx4feVujsL2ho8keJKiS164BN6UXf7sKjQ==
X-Received: by 2002:a2e:b626:0:b0:2ad:9edd:4e2 with SMTP id s6-20020a2eb626000000b002ad9edd04e2mr4094386ljn.20.1685449843259;
        Tue, 30 May 2023 05:30:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id u18-20020a2e91d2000000b002a8b8baf542sm2854814ljg.126.2023.05.30.05.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:30:42 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 14:30:37 +0200
Subject: [PATCH v4 03/17] media: venus: Introduce VPU version distinction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v4-3-feebb2f6e9b8@linaro.org>
References: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
In-Reply-To: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685449837; l=2053;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=a99fLFp1dm6W8vgH/KZB1/Be/9Fqdmq9iT5sHLbqduQ=;
 b=ZvS+29xPEpjcnTQognpm1gsvkygKOy1e0BEzruqFSraEGtaUtPzdLH7ez8NrL5h0w1PUJJZkc
 zsoYTh+LFCNDxrfjFc4o3ccV0gLVufhoncJxwkJuZNQ1ueCiN/HNs2q
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Video Processing Unit hardware version is the differentiator, based
on which the video driver should decide which code paths to take.

Up until now, we've relied on HFI versions instead, but that was just
a happy accident between recent SoCs. Add a field in the res struct
and add correlated definitions that will be used to account for the
aforementioned differences.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 250342d27a6f..4f8ad9659907 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -48,6 +48,14 @@ struct bw_tbl {
 	u32 peak_10bit;
 };
 
+enum vpu_version {
+	VPU_VERSION_AR50,
+	VPU_VERSION_AR50_LITE,
+	VPU_VERSION_IRIS1,
+	VPU_VERSION_IRIS2,
+	VPU_VERSION_IRIS2_1,
+};
+
 struct venus_resources {
 	u64 dma_mask;
 	const struct freq_tbl *freq_tbl;
@@ -71,6 +79,7 @@ struct venus_resources {
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
+	enum vpu_version vpu_version;
 	u8 num_vpp_pipes;
 	u32 max_load;
 	unsigned int vmem_id;
@@ -503,6 +512,12 @@ struct venus_inst {
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
 #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
 
+#define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
+#define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
+#define IS_IRIS1(core)		((core)->res->vpu_version == VPU_VERSION_IRIS1)
+#define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
+#define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
+
 #define ctrl_to_inst(ctrl)	\
 	container_of((ctrl)->handler, struct venus_inst, ctrl_handler)
 

-- 
2.40.1

