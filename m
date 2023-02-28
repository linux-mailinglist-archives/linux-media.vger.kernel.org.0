Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112246A5BBD
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 16:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjB1PZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 10:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjB1PZW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 10:25:22 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BAC30E98
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:55 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g17so13713425lfv.4
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677597895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv+5dN06QajiFNtKq3cylP0qYElk+b0EFltGbtCWW5s=;
        b=KLqV2kBPxpqQedLLP2jyVH3dv78B+IiH2UApRHAUkV6hehtDudrXUtxm8t7KBLwV/S
         JrT4Ua/HFFKaXd4XObOSCVdRFZTO1uRpw9yHezvZomea882YUXrYb6FytSllzRIVCGRH
         2ieI6yRUz/4xVuD9yyQ65jQ1yTO40+KBj7mQsh0MMWEI8zWW7fPy1Ec+MbZ3HpGY1Jmu
         n67+NSUzlPoRvkyozoDJSPfA3mxTIdxDB2RCxT5y9NkIEhgP4CHI0NGRRzYe/wer8wgV
         Qv8xFXApmHJ1BUARK91jPZJnmnAkJa9OCOEiAOKZJUR8UWYK6Pax2/HQrzvkleBYiU1g
         KTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677597895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mv+5dN06QajiFNtKq3cylP0qYElk+b0EFltGbtCWW5s=;
        b=fbb4R9hTZ0+5x3fbYOmRkYp5PaXnEYklqA4e2o221emPY+BZs9adj5SvWaGjxLEMvD
         xKabRuYgbGftGdObCgLbwGEwCCrqQDbswrxu6IQOtus8HUIOA7xdEBY5iqa0s1HeEKpY
         1G1Xjr8V5u991aznDW3yVIfSRSboqGz+zZTACEHmfBDtiW5oer1YcO1f9hdOL2GcK1Zt
         LhgsaQzqVIS5SYj9bL0DVGKar9bbrWmNnuahXx/9lrEUyeJ700qxkG6kBaR38Or12p4E
         5UNzjaM2xTiZGGTRn/4adJpC9rFTO0XfcFxvSYKULcttetu9+IVcp6wfNGMivoHsHXDc
         O/Nw==
X-Gm-Message-State: AO0yUKUIhLJIZLqzrdx5rZJSfqOF4V/DzGdvfIvTWMVoU7cDsLLOIzXN
        Bk1kjL+YSjqs0Goyty6W/JAYpA==
X-Google-Smtp-Source: AK7set8V7zZSECX4B4EzCidKb2bc4mpAjprKUNmvbZsREWvIVZfvcp54SeRwDyRFYNl1B7n7ElgSnQ==
X-Received: by 2002:ac2:59c5:0:b0:4b5:6042:d136 with SMTP id x5-20020ac259c5000000b004b56042d136mr918294lfn.22.1677597894820;
        Tue, 28 Feb 2023 07:24:54 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id h17-20020ac250d1000000b004db3aa3c542sm1363688lfm.47.2023.02.28.07.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:24:54 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 28 Feb 2023 16:24:37 +0100
Subject: [PATCH 13/18] media: venus: hfi_platform: Check vpu_version
 instead of device compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v1-13-58c2c88384e9@linaro.org>
References: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
In-Reply-To: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677597872; l=890;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3bmF96yM+QeLlPRbGOz/QxxJqjmwlG7of1Yk2fGr9GA=;
 b=jpgQaZLqM13yEMK+h/OFBgzPaEzZbooIJVn7HfPIUyzKP41ZQlz6Xd2WOp+5KcfwsiUhV7XhBk+H
 1O/uvXECBU7gwqicK5TcpgMawKJblW3ZeTIB+4G7OajEe+qtLvM+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is not a matter of the host SoC, but the VPU chip in Venus. Fix it.

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
2.39.2

