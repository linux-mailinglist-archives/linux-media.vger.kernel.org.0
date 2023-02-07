Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC29768E26B
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 21:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjBGU6s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Feb 2023 15:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjBGU6q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Feb 2023 15:58:46 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B188413DF5
        for <linux-media@vger.kernel.org>; Tue,  7 Feb 2023 12:58:44 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id n13so11932829wmr.4
        for <linux-media@vger.kernel.org>; Tue, 07 Feb 2023 12:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig92pyMbU2zuSYAVil0uen1pAtlV0COrB7Gvugo1C0s=;
        b=MUpe8RWh84Giqhg4fNSII6pvgNJL95YzWbpB90rqFpF18Il8U42VPn4Dx5x0kgyUPc
         wRAuaVnM2hQol1S6jcQOVtJK39CV0S+mXCutMqL1BctyduPwifErwRNpngNmU0PnXziD
         jH4Z1+fruERiY/Cj4x7wVUJH2+rFCF7ITCyRmB0ZuZSNlaHzd6Hp82O5tZ/O7Ck9/7Ax
         rY+f96I3tng5z1waAUgjaqY4HzR/VJTqp0vubPfIkko6chBuPqF0RCnmqepdvazBC9u6
         DHD5IoQ9i9sSTMZ4wrLQIxLBGMdVOKQt1UWMv5/av8D7LR+QZS4ApqUy4oxsZKGQdGiU
         u78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ig92pyMbU2zuSYAVil0uen1pAtlV0COrB7Gvugo1C0s=;
        b=msTrlihprEeU1OlV7tkul/8tvGMZ5kc2ptaaX8diHXBeOQ2RqaEhMJHxalS8Bu7ElE
         vVxQKWpjCcgZRnZfs6vex74RNlCOzp2/r22x8oyPAY83pTVFXTG+KwOxYgzht/LOkhF4
         WxwvQLPdqLXbsUAhuc+kuZW+uowZiEVLFh/Pc9ux7YGCRZWDIrtVWD8E0sCZAiA5wy4Z
         q4Ix7QAVtBfq1KFpXpaD3MYub4ZPvsSe8VxT3FsANhdRBzxkTEArChiDDxH8UP2I+TGg
         BvXQnVqb0nx3PCZrTsWBOIrM1hZIF2QoVZouF99u/AicC22whNozV7cBp3AkfAK8nC17
         qQ7g==
X-Gm-Message-State: AO0yUKX4KdgSznOjZF9ZpIVn5tsGQF4F70Lh7pBqLhqwGyeJ1d7NzuFp
        uvhFpQGpgAvNLSVHeEJxZ/Mi1FhmUCHPOHWa
X-Google-Smtp-Source: AK7set+IQt2wJhcPIudLzOOHNQqXw0jcwOEm0J8mi1ZdCP0P500dXLXECHPj3fQHqtj7LnfzKFlh5Q==
X-Received: by 2002:a05:600c:1708:b0:3de:e8c5:d826 with SMTP id c8-20020a05600c170800b003dee8c5d826mr4444405wmn.28.1675803523206;
        Tue, 07 Feb 2023 12:58:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm16555649wmc.4.2023.02.07.12.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 12:58:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/4] media: samsung: exynos4-is: drop unused pinctrl bits
Date:   Tue,  7 Feb 2023 21:58:32 +0100
Message-Id: <20230207205834.673163-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207205834.673163-1-krzysztof.kozlowski@linaro.org>
References: <20230207205834.673163-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop unused pinctrl header and pctrl member of struct fimc_is.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.h   | 3 ---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.h b/drivers/media/platform/samsung/exynos4-is/fimc-is.h
index 06586e455b1d..c126b779aafc 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.h
@@ -14,7 +14,6 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/spinlock.h>
@@ -231,7 +230,6 @@ struct chain_config {
 /**
  * struct fimc_is - fimc-is data structure
  * @pdev: pointer to FIMC-IS platform device
- * @pctrl: pointer to pinctrl structure for this device
  * @v4l2_dev: pointer to the top level v4l2_device
  * @fw: data structure describing the FIMC-IS firmware binary
  * @memory: memory region assigned for the FIMC-IS (firmware)
@@ -262,7 +260,6 @@ struct chain_config {
  */
 struct fimc_is {
 	struct platform_device		*pdev;
-	struct pinctrl			*pctrl;
 	struct v4l2_device		*v4l2_dev;
 
 	struct fimc_is_firmware		fw;
diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index 62ad5d7e035a..079105d88bab 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -11,7 +11,6 @@
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/pinctrl/consumer.h>
 #include <media/media-device.h>
 #include <media/media-entity.h>
 #include <media/v4l2-device.h>
-- 
2.34.1

