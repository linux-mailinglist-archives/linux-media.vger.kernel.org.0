Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531F37073B9
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 23:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjEQVOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 17:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjEQVOk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 17:14:40 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D7D6A7D
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:38 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af16426065so1120881fa.0
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358076; x=1686950076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oPfJC6OBBAeuCH43x8eLqOMDvJk8T9kLQJRwnypwQw=;
        b=rPUwRZMsSj5d0jPUa5gYgmj4IUPRtKqIotpR1rwhyUTjExssuBItA+Lx3vcE1hysrq
         TcHYHHJU7PqblrLczMm5cJNtq1/9sTuiLdJb2ddcmw3fAGinQHx5X1WAcqZpxgOAgu7j
         VTTLJggCk5Me+L/ADAdFmkkDx3JzVhuXGGqm6jOK0VogupyUCuZA8t5uWcVXZ+UykJGp
         eWLaTC1jnMN2GBMKuTig9Z1CKXj87/lXxf3Tzg3oQWu3TD7P01f3ooiHEfexJFjtgda3
         78ZGHEJzPe8ZjA6WLjkDVejVTd9VSzVz93thoXYcnj8xeAfABLEIWqRKhIR7w8+yk6H7
         ajgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358076; x=1686950076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oPfJC6OBBAeuCH43x8eLqOMDvJk8T9kLQJRwnypwQw=;
        b=BRN7mzYVPiD1IWwE3KcoCvdScSvLL74bA48XbKv0jGRZTt7P7z/PioKgfnrhboe4jm
         orf2swaXyn2ua5eyR+GfHmy9c7ANfSY37uCCPB1td4+RarKSTIFjZiqmOQQ1/jW2N6iz
         6UjB5qatdsqjxDJuKzsvdQXqu4SeY00epY3avU7D8JpZwqjRQSdBgd749Hn1FFaBejST
         QyeIT4u7wqk5+JjezRQp1sYHSAA3y7PIz0+8bEANoL/yt/oOHpGammoPN6Wc82m6Vb82
         Aoyijjqib8nLTSO7caXexOOh3DluI0pfukgmlGIaTc5eQ11FPdjLGQBkBFqYeKUsIwhm
         c4OQ==
X-Gm-Message-State: AC+VfDxsGqrh3zZ5XCHj8P7v26HY2fSc2h8EW/xC4Z0UzqEvjLUVY08R
        Yf39fwbhEhAm6TMOb6vrDweizQ==
X-Google-Smtp-Source: ACHHUZ4u9EpfFiAx7OgNp+FzqCCGluMj/aGtSvhonn7dgME7pfs46oEJ7OQ9BhkzHC1TBLpNsY4mqg==
X-Received: by 2002:a2e:3001:0:b0:2a7:73a2:d915 with SMTP id w1-20020a2e3001000000b002a773a2d915mr10026221ljw.5.1684358076759;
        Wed, 17 May 2023 14:14:36 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8345000000b002ac88e29049sm4781142ljh.43.2023.05.17.14.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:14:36 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 23:14:20 +0200
Subject: [PATCH v3 07/17] media: venus: core: Assign registers based on VPU
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v3-7-6092ae43b58f@linaro.org>
References: <20230228-topic-venus-v3-0-6092ae43b58f@linaro.org>
In-Reply-To: <20230228-topic-venus-v3-0-6092ae43b58f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684358064; l=963;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9/pa6GP77zIAoaGrc5qIKA7KqFqqqTvo3gmVZwuXVQU=;
 b=yOkDY26HewJXTHuaB8SaqNGGAUn0dTTCsW2wQIU73tObHSEFJ/w4Eqq1yTEvgw9sMD3HNomcn
 JqBqmLhR0Z6BzsH/cktKAyHCxyE6qd0yCKFvN4R16ZrDl8dCctuxs5z
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IRIS2(_1) has a different register map compared to other HFI6XX-
using VPUs. AR50L uses the same offsets, but doesn't feature vbif_base
and aon_base. Take care of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 01671dd23888..69c77b2137cc 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -246,7 +246,7 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 
 static void venus_assign_register_offsets(struct venus_core *core)
 {
-	if (IS_V6(core)) {
+	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
 		core->vbif_base = core->base + VBIF_BASE;
 		core->cpu_base = core->base + CPU_BASE_V6;
 		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;

-- 
2.40.1

