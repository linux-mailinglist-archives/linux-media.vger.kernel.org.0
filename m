Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEDE4666A5
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 16:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359045AbhLBPjL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 10:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359049AbhLBPjK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 10:39:10 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7AE8C061757
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 07:35:47 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so55054wms.3
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9LOd5vHs/ORxT5LhEKnfe+7vy+TLpsio9syefLLL+g4=;
        b=J4zQi1x1Y47FBZWpIbN7Om42al1VIxCHxhKQPp05FUy5bzm3ad0IMt+SSzIqInV5u+
         vaNSkb2+nXlsroWt/8a+5/TxdX6ik1ypqX8Y3vlH4f3qj9/DGAT+bC5XZq9Kz4xQVD5c
         w6zCXghr7QlCTuvGgvB8ef14GZIEDmRBJhZEAdC/n9SynXLnEzPrHpz/5iryO5CRjp+K
         ArEkcBbshBKk8j/8U8496I2FiSEfs+Xqf39Ks2Fj3LR+XxpNmk5TASoMMsCq4uXi4kGf
         vrMpy2VzlJQZP7XxVZf0AloGAEobJsKPu2AYJjImFQRB0QK8VAulnaueO0VgOHRWT9+X
         bBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9LOd5vHs/ORxT5LhEKnfe+7vy+TLpsio9syefLLL+g4=;
        b=L6pzVMp1OfOJZSahXlDk2Jj6PP+R9kikzmuoENIEv3gc3yb4D8ojh78uHtg3yxtW/j
         5waVQFkMjn3lsFCb98Z+R8dco/5mq3565XYHL886yViazvV65ixbGzOoFvGkMTftZhlY
         hiaB+b9enlSyb+TiTvhg+8B0hTLqNNUWR/FgdmU+/NRaTbPOji0za2RQUJjw8JuKRcZ6
         pjPlSgPud3vaf0METDbeiGCp/TXnTUvT7/2Fzge6sF2ve3kRrrcJjnqlP4NV8Cr9vZoM
         ssT5ZWn/WSCvXzdLG0X4mf9kn3aAx0NjmLLTga399k5c/yCLYSW/8r50V+ECIZJby+ir
         qW7g==
X-Gm-Message-State: AOAM530gC/1Zi+bNyBjr1xa7EvPzdCR3AdH/CTCTbCmad2gzRaOheWP7
        smX6rbdJrdCo/orh9HIaGUaTfp+PSGLBswHi
X-Google-Smtp-Source: ABdhPJya6F7j+q6zbusfXvajhjY35E3NDToCM1erWyO9xMEUyxENHuUwUo5jZ5TLa4mt9AL3VI9+3A==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr7196388wmk.141.1638459346320;
        Thu, 02 Dec 2021 07:35:46 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:45 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 05/19] media: camss: csid-170: fix non-10bit formats
Date:   Thu,  2 Dec 2021 15:37:15 +0000
Message-Id: <20211202153729.3362372-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Use the decode_format/data_type from the "format" struct instead of a
hardcoded 10-bit format.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index ac22ff29d2a9..aa65043c3303 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
 
-			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
+			val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
 
 			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
@@ -382,8 +382,9 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
 		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
 		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
+		/* note: for non-RDI path, this should be format->decode_format */
 		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
+		val |= format->data_type << RDI_CFG0_DATA_TYPE;
 		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 		val |= dt_id << RDI_CFG0_DT_ID;
 		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
-- 
2.33.0

