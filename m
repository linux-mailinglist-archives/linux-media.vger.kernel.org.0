Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9F75011F7
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 17:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345299AbiDNOZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 10:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349516AbiDNOUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 10:20:38 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED9BAD122
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 07:11:17 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso3273934wmz.4
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NKRjPFX70UM8TZNpn8iZS1kfwp9XLb9AeM/cK2mUY9U=;
        b=I7WikvWAw3oS5rES5M1dNhKfx75twkTmikhEd0gM2KcQp5ebbO9Y2krr/Gi2OvsStt
         CVodcggyN9IqR7i8aE/oU16aCSYp0BIxIZ22TrnyaDCpOg4oGQMdkz1aVf5IZ8rZHNq6
         Z2t4zLd1EC2LPRMn2B1khEmuTVDxig0AFOGDdXW4xrL6ttMRov4BJ3260T6yk3+7aw4T
         IhfQGAKHpgXlB0x9ZBF2n4/bG+vi2I4CmkuCCbmBol84JElNtL98K8+eELNrhuEswkWY
         9Kv0PTNZww8UmC14hAtcRGHWowzWJuUMuGIuQpjaJAwuilZwrC8IPrjK+0LJmsj0uB9n
         MtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NKRjPFX70UM8TZNpn8iZS1kfwp9XLb9AeM/cK2mUY9U=;
        b=QNwixtwWBlmEVzfhz081FqiYqBXn4XBO8yyAIDkxrSqkEIzJ4QYYYrAfxPr+t62WJY
         1zidZymz5OqP8ggGlqw152jaELDobnSMmgdBBvEidhOf+1wGRbA6bb1If3QnAKdcfDl0
         8G8jh3lSxmKTacwxIq9Pn7k6teUpPcb8lLX1M8oHq7byN0mksKygKYzGVpWRAcDZ5o15
         nEa7SlR0a/tUNKsY+h+q7c23sWlKraucKYGWcItKqY0fsCk4uzKg7AbclJ+457PQAG/0
         6I2jJF/BXcbxmHcXL6ESVU3JGL5DkKt9gBoBZ6i3am0PrJCax+ml+43gYkjwzf0EvieQ
         IPkQ==
X-Gm-Message-State: AOAM533GcDjCG9lOkMN2QOURnWG2EIHFJb/LdVyZEtyOJvYVj0l8Dvrj
        7dIjsOkzkW65Wc303B5qrETQ3g==
X-Google-Smtp-Source: ABdhPJyh1MZ4EnUx3AErvjNR/jzfyg97hPOp+Q427BVcbV355sTO/1PGUqELxA+DtPe7X52gCunsMQ==
X-Received: by 2002:a05:600c:3ac7:b0:38b:f9c6:27b8 with SMTP id d7-20020a05600c3ac700b0038bf9c627b8mr3320031wms.75.1649945475719;
        Thu, 14 Apr 2022 07:11:15 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 61-20020adf8043000000b00205e1d92a41sm1934551wrk.74.2022.04.14.07.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 07:11:15 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v4 3/3] media: i2c: imx412: Fix power_off ordering
Date:   Thu, 14 Apr 2022 15:11:08 +0100
Message-Id: <20220414141108.1365476-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414141108.1365476-1-bryan.odonoghue@linaro.org>
References: <20220414141108.1365476-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The enable path does
- regulator
- gpio
- clock

The disable path does
- gpio
- clock
- regulator

Fix the order on the power-off path so that power-off and power-on have the
same ordering for regulator, clock and gpio.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 6d0746d6c634..a9cdf4694d58 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1066,10 +1066,10 @@ static int imx412_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx412 *imx412 = to_imx412(sd);
 
-	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
-
 	clk_disable_unprepare(imx412->inclk);
 
+	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
+
 	regulator_bulk_disable(imx412->num_supplies, imx412->supplies);
 
 	return 0;
-- 
2.35.1

