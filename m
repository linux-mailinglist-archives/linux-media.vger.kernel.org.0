Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9EB478D852
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbjH3SaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245462AbjH3PQc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 11:16:32 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9C41A6
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 08:16:29 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31c73c21113so5069645f8f.1
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693408588; x=1694013388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zt4EZs7eZDJHyWyeQeAf0MtBSdiw6c6eDKc6JR9WTg=;
        b=TAHJwBfWd4+GN1O9kilABrT9lwqWGFe7VpkTBqBQF99CtcyXcZNHA0KMfJ7FBAB3wv
         ZmbTXR8eYuugW2JBiJ4Gs8o3Xxdc3iZBkvq2oYPdC4VQRAV8NxeJs7JH4gyAYZ2KlqHi
         CE6vPJhItehhPwrl1p8UbenzSmVi6lWl8v8l1Za4Y7TuI0o/kEDKND1we1MxntBp8Z/Y
         2k6slRPA3SVxWv7lTYPGGmVEdGJ4gZ9z7hqdkX7Ur7iVAEhDAmVYCS7RwKh0dRGmJ0/X
         NnN9sh9lFJjQ+x1yHgo+zVjzEbW10x9aJDZn70lom0Nr21y1195+jPfWOg12GJD/tLso
         KRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408588; x=1694013388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zt4EZs7eZDJHyWyeQeAf0MtBSdiw6c6eDKc6JR9WTg=;
        b=ZRVJ+TE1ywhhurVO/lzkbnklDyaFVjFNebtkupYR/b+4llEV+VGybT/T007BojGFWq
         qhLcTso0Mx8ACaB6MoYFFiorbgq0snvPeaK0uK1nvQPV6r+/ARZS99LtLg5yxOQH1Nbk
         4G32uhjaZwJpH4V550bXO1k3k/PKuqWlP9tNkePZPtI5teOcjXDVXKfRAiNK4hCWL6c0
         uELeap5XcidG98GhQG5VXqUMS47Wp8JzC3hLzfiZ+fdwm4blBl7tk9Go2KemaV6QEaIm
         ETefG0w+R+ZQTgEGZGIguSmHHX6JPROxzKM7msdqRUKSH1P6f3+P/NONIGJ/hctYa47S
         vQNg==
X-Gm-Message-State: AOJu0YzI0EoxGgEE0qkYXLXdrRH0vBU7iMY9xZCEobvI/wYO0B1HlNdE
        uVMV5XdyKNAEvh6y46K70rbq3BkGQSD5OCG4TZU=
X-Google-Smtp-Source: AGHT+IGU+2wE9af9RhhGkjwitXKlTqt4fa5DMpISe4UaxwVC14k1Bi5rske0B9oO1Rfduvv8kMzeJw==
X-Received: by 2002:a5d:6a4a:0:b0:31a:d8be:d6f4 with SMTP id t10-20020a5d6a4a000000b0031ad8bed6f4mr1823941wrw.10.1693408587975;
        Wed, 30 Aug 2023 08:16:27 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4d90000000b0030fd03e3d25sm16989961wru.75.2023.08.30.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:16:27 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 08/10] media: qcom: camss: Fix invalid clock enable bit disjunction
Date:   Wed, 30 Aug 2023 16:16:13 +0100
Message-ID: <20230830151615.3012325-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
References: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
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

define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE BIT(7)

disjunction for gen2 ? BIT(7) : is a nop we are setting the same bit
either way.

Fixes: 4abb21309fda ("media: camss: csiphy: Move to hardcode CSI Clock Lane number")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

