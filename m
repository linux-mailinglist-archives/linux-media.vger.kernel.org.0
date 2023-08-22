Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B3D784B1D
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 22:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjHVUGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 16:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjHVUGp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 16:06:45 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95165E5B
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 13:06:39 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fef4b063a7so18263765e9.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 13:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692734798; x=1693339598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OyWEn0a7ANAIyfQKneFB5+mcuDJYIdBx8m3ndVKkig=;
        b=Nxd1tGpMaJQvp9Vbo+2Hi982pI8s7QcHPtA/btj0fUXMJ43lwOwEinYulFCvSpjdMX
         JsioBB8n19YJRxZpWXp6TVRhCHd3mWm22cXxYald/4aS+4LsKIHRNw0yYE31VQ/jR+BE
         y+qh6uVI7s9Eum09LhN3nahpxIqOHvrHOlZ6XgMjjRGiSuSt6gu/h7NTxzxGy8IDWlT7
         9v35HYFscDDwrTghaIXOTfW8AGgER9ysM0DWzfPjKz+lAZUWelnNc2siaUifC8z4CbdU
         t8NorL+xu7Asnq2YEWsUJ6+9AI406vey7PZQd6yMqP18e49NaC599ljlmC0ecu6gZyMt
         +oNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692734798; x=1693339598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OyWEn0a7ANAIyfQKneFB5+mcuDJYIdBx8m3ndVKkig=;
        b=d06P/EqwJICkYpuq+L2uIrSLyDx3eqg++B7Iv1jeHuuAPZi43iiD/4Q0eLbhQWrLsB
         jRASh3l35b5oaV8C1FHQy9bSWOi0tMSZgk/fhXNrDiyO60vWq+7FbsEj6fMxIvnIcuE0
         Xg0CDU5ZTJ8Ilymfpf+kxVfwU0hP/PIg77NwyFa0mWoXYxW8/76nKUoV2E5lsaLjrITH
         vDb2nUsTEk9ojwNPg/bYaxVTXft/y+JD6iBLsgUGWvBmWAQSLIAMIfvlZFNhzJpWRl0L
         rtXYn6cWD7B/82EXL2U665aZfF7XuDS0N6/kKcVj8V8hzHiQKGPeKEAvlaF5AMiiptDl
         QamA==
X-Gm-Message-State: AOJu0YwQ5ZGW9NkTKEnlZ5/BYO/MOXE8L9lyCrDOxY0So3JLtckVKkO0
        KR3EMnN7oj65QXj1ws/uC+ZoMg==
X-Google-Smtp-Source: AGHT+IFXvRLtSWd/YwdeCe+5rkQF6hn27apKnbKzhlN3OK4ZC5co71pZkRpvbPquDKUZBPcY6wSmNA==
X-Received: by 2002:a5d:6a84:0:b0:317:ec04:ee0c with SMTP id s4-20020a5d6a84000000b00317ec04ee0cmr7778465wru.47.1692734798142;
        Tue, 22 Aug 2023 13:06:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y12-20020adfee0c000000b0031aeca90e1fsm12873690wrn.70.2023.08.22.13.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 13:06:37 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 7/9] media: qcom: camss: Fix invalid clock enable bit disjunction
Date:   Tue, 22 Aug 2023 21:06:24 +0100
Message-ID: <20230822200626.1931129-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
References: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
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

define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE BIT(7)

disjunction for gen2 ? BIT(7) : is a nop we are setting the same bit
either way.

Fixes: 4abb21309fda ("media: camss: csiphy: Move to hardcode CSI Clock Lane number")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 04baa80494c66..4dba61b8d3f2a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -476,7 +476,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
-	val = is_gen2 ? BIT(7) : CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
 	for (i = 0; i < c->num_data; i++)
 		val |= BIT(c->data[i].pos * 2);
 
-- 
2.41.0

