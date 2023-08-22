Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6BD7846C7
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 18:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237623AbjHVQQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 12:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237614AbjHVQQl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 12:16:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189CECEF
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:16:38 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fef56f7222so15398745e9.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692720996; x=1693325796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W80DDZNGe/khXLl1P1oJD7Ws9Jxxl4GH65wXpEW+I0=;
        b=U+I3c2omMZRorK598XE13zuIDehZ8w9I22s/zu04h0wsbhre50YlhPO9rSG201wEnd
         iw2Fi0WFthYfRo+6jZdWAJ5MOboaw4xIwSY+ETSC2M6ei2FarU8yplYx59eoi8N5tMyc
         xhEemMA122O/CKqHAJrkunE4cOHoLut8I7JkRk7BlxD2ejhJJYAR2CkCvXWpPd/z6IwD
         O4yZwAhRGMOBkDaeOz080yQ2D1CSOIDBa3shH+ypNQjHA0YzQj4RjS1u9PkHg20Erqpm
         bxsfI36OYHXOCwcAO/yIS1cDzscbBUO0M1d+aIiVvV2bwN+S65SHez/1R1q/vQpDxtUQ
         A3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692720996; x=1693325796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W80DDZNGe/khXLl1P1oJD7Ws9Jxxl4GH65wXpEW+I0=;
        b=DGvP1sNZXTo/sL32l6IFNdkAK/vXElSteAL2dp54hLYscQBXY1vcleHmqwCFiRiT0r
         uaIwdtUgozTHfA1J+2n6euu4PGBBKpjyIIekjqmFzwjUX8h/CreN8UB8XMGjRYCzlsvl
         kNQmQd2oUtQrVgYiMwQJATdp4CmGkYQdS+O/mlDsF51jw3Qw65zl2J2QeYT8Dyvquzpb
         q9Wl/IQvYX/TAXpgN2rKCd9xbaZGLLMcvZJ/A0uv9COGJSFg/VcrSqO72FEqOayO88L5
         aQc90P7vpPdUfkJMfR9Ka+9KsA9Qkjt+d9lWF/4/jw4Uh4FzUIXkwNdumy+OqINKg/gr
         J+gg==
X-Gm-Message-State: AOJu0YwzpACZYLnBLknBH2aEo+De7buAIUvsO5w1h3Qf3LA26vEp5iZZ
        MVsNG1scBBP6jL1VRT/J8emDGw==
X-Google-Smtp-Source: AGHT+IEbmEdUgVc8gPoUPKvvsXPkSIASSjWR0w0R/tzbC9KKX1EtZerjUipZVmqFoATxxQ09bMenEA==
X-Received: by 2002:a7b:c3d0:0:b0:3f9:c0f2:e1a4 with SMTP id t16-20020a7bc3d0000000b003f9c0f2e1a4mr7429737wmj.34.1692720996718;
        Tue, 22 Aug 2023 09:16:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t23-20020a7bc3d7000000b003fe1fe56202sm16516130wmj.33.2023.08.22.09.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 09:16:35 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v1 6/9] media: qcom: camss: Fix missing vfe_lite clocks check
Date:   Tue, 22 Aug 2023 17:16:17 +0100
Message-ID: <20230822161620.1915110-7-bryan.odonoghue@linaro.org>
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

check_clock doesn't account for vfe_lite which means that vfe_lite will
never get validated by this routine. Add the clock name to the expected set
to remediate.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 938f373bcd1fd..b021f81cef123 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -535,7 +535,8 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (!strcmp(clock->name, "vfe0") ||
-		    !strcmp(clock->name, "vfe1")) {
+		    !strcmp(clock->name, "vfe1") ||
+		    !strcmp(clock->name, "vfe_lite")) {
 			u64 min_rate = 0;
 			unsigned long rate;
 
-- 
2.41.0

