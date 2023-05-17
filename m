Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541457073CB
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 23:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbjEQVPQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 17:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjEQVO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 17:14:58 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDA97AA0
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:46 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2af1551b2a3so4222991fa.1
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358086; x=1686950086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCbmXotl4JHp6511qJyB6cem0LHm1+AqjQQ+gB6Kt5k=;
        b=UQjG0/WuV5etiyDEFOP94o2jTjOe5xRhvCKVl73vhfDmGmrmoPKZM9TbL7d2MMqSYm
         wESmm+0FW+v1QpAlutjXMT99Eves69zCtLY7SdsXo5dvFZbkhBuFIOjHDRS5ba6sHGV9
         QJw7yG6oT1jZqx0xZmQSMC0t5j8Muy//u36CzJAAHS+APAwxpKHzmwmoGQS94hRi4XUK
         kLmwRzv3wVB9vlGSmQlRQ1bBQ6w486spfmfYe82it95DiK5rwdv5xx0aYx0+IY5fR5ZS
         7sCchTViFV/BCsoIDiTb0tXxxtNBW4J8qxdnpMnAvqnUwGWSUqKzog1izUwYeLLRJSfv
         j+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358086; x=1686950086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCbmXotl4JHp6511qJyB6cem0LHm1+AqjQQ+gB6Kt5k=;
        b=gUWyNmkeOgu+9ai2qj7YfcXb1A2ieNZcZovj3ErMU21xAYbhjP2yFsOt6KWlYzBpZB
         6ik1VSYASsmX2Tqi0NqQImWfKgBm5x/e0wt2WZDK0/iVAwqauL48xHg2PAg8CF4TAgML
         ySASeSOOyzqgypEU+9He/atrKW0OrwsTjhPiyWt2ZNvK74G/7MkDIUwe4I6l94F3DwFd
         mTRCqPOpN7iOSz8P4fEgwCQ4m7/UCt5g7DI4lfMnoLL0fwa1MzfUKcUYb4wi1Ekk0dqk
         2epiAOQXJSMiVpf+tND/wRQenWRomQGaX4vC7ZdOP+Xc6beGt1/6zpYZEmN/MGHeiEhF
         p0lg==
X-Gm-Message-State: AC+VfDzoqKF37pYXCZv+R6FI8aNjJPgSi9LlVqMFVt9rKTqd7iGPj/B5
        TCZ7yELyBusv7RZe+WwwCFlhVA==
X-Google-Smtp-Source: ACHHUZ5rOHGPLn5W5f5+X+lyCQPlcGHnJtwKPUMcFBMVTZmagTmp4w3JjhMcYlHN/hzdlNE5TsvQrw==
X-Received: by 2002:a2e:aa94:0:b0:2ad:90bf:a5a9 with SMTP id bj20-20020a2eaa94000000b002ad90bfa5a9mr1298857ljb.1.1684358085936;
        Wed, 17 May 2023 14:14:45 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8345000000b002ac88e29049sm4781142ljh.43.2023.05.17.14.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:14:45 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 23:14:26 +0200
Subject: [PATCH v3 13/17] media: venus: hfi_platform: Check vpu_version
 instead of device compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v3-13-6092ae43b58f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684358064; l=1007;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EUWf2T+I6vhFizSQGtxC124WvawcGCVn6gQZEf/m3uU=;
 b=UpdjgwgmzcU1sXtNPOGiLxsGyZkEb7Yb3IUpfGrtlJyrVgA12baH+lL/rASjTNvM2lvrLsbPS
 gxBq5TpxWgaAioFlLIcq6de3Jo54QZn9Zh1W3oWvMKGdDIkEhzA1UV8
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

This is not a matter of the host SoC, but the VPU chip in Venus. Fix it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index f07f554bc5fe..d163d5b0e6b7 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -80,7 +80,7 @@ hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codec
 	if (plat->codecs)
 		plat->codecs(enc_codecs, dec_codecs, count);
 
-	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
+	if (IS_IRIS2_1(core)) {
 		*enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
 		*dec_codecs &= ~HFI_VIDEO_CODEC_VP8;
 	}

-- 
2.40.1

