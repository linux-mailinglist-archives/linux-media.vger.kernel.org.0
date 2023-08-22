Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF5917846D0
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 18:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237655AbjHVQQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 12:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbjHVQQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 12:16:50 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53A0E42
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:16:39 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fed963273cso23279125e9.1
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692720998; x=1693325798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OyWEn0a7ANAIyfQKneFB5+mcuDJYIdBx8m3ndVKkig=;
        b=zvnyprHX+iigGVq3/eNCiRAwhuXOvuF8IV8loHm5dQpoXsYYQ8HQu20OvVYnggeDCh
         PvSGd6IPHqRIP1iGAqUki/jHAlHdsEqJQjZjQfha7cvRaq4h8TPFMVMm4azEVxpDSD61
         Zf11OH8niLWOP8hNx/lwdVljeX+I0Vx6RF5W7ZkO4FmNKuwbVrkm/ssROhmJF1txBR7a
         0LmhemfY1gx6yxcYTwY+jQHLk+fJN1D99AS1EdhsrL1LEQb4NaGlax3wdOg8MfSfN8Fs
         8YvQnOQbCdNazhGz+CC1PlvdGhnXfkyUYwXAzpz+Jx6/eNpKN52sBveGZ9XkuyXXl8AE
         5czA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692720998; x=1693325798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OyWEn0a7ANAIyfQKneFB5+mcuDJYIdBx8m3ndVKkig=;
        b=JXKbbV7Ldb7U4jjhWT+9Qisg2zQzQFGH8Jp3xuhivTpw1FeiHYfTjC72/8F4bkzIpX
         ExFYeBvTBFgg5mHN9Bpx+eXc0id/Nt0msyhyJ+EA8/Zzgwe4BWgINh61UAXb7J8Oyvuc
         lDHlpM5mXG0NYptDPbwMjN32eouEx4ag1vV8X3iapKPq8kXveTRyreHlKNx8MnEa9dJL
         ehzE7FDouX5Hj+B6GxrvS7970WJDOThfkcIdUsU//SoDA78Rn7ojx4YjgoQxZfpbc0ro
         X0gR/PBvEtPTiuwzbFoopDwGPe8vBKwKBnRrYjSdox8/5T5QpsuaJtq0G9I+f2ntJHUZ
         ndRQ==
X-Gm-Message-State: AOJu0Yy/o201yGXv32W2iB/iWqsh0vTVWhE/+E0e2HK8ksR/ifWoWVcF
        MNNNZaiCeB2QYqyJZpFwmtPFsA==
X-Google-Smtp-Source: AGHT+IFcul/BNcu7Pbe7zk/hcv5jWmRt4f/BlNdEHr7V80X9cc5nuQXKfoq5DTX9+16SDQJsaWjwmA==
X-Received: by 2002:a7b:cd06:0:b0:3fe:df0:c10f with SMTP id f6-20020a7bcd06000000b003fe0df0c10fmr7659667wmj.17.1692720998168;
        Tue, 22 Aug 2023 09:16:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t23-20020a7bc3d7000000b003fe1fe56202sm16516130wmj.33.2023.08.22.09.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 09:16:37 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v1 7/9] media: qcom: camss: Fix invalid clock enable bit disjunction
Date:   Tue, 22 Aug 2023 17:16:18 +0100
Message-ID: <20230822161620.1915110-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822161620.1915110-1-bryan.odonoghue@linaro.org>
References: <20230822161620.1915110-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

