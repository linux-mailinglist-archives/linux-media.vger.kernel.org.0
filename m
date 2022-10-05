Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7AD5F50F9
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 10:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiJEIiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 04:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiJEIiB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 04:38:01 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44D77390A
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 01:37:59 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b4so17891322wrs.1
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 01:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yu39gQJp1k9p/w40T6pLSbtngQhYyXde8HjMY4LOfK0=;
        b=qEKt61Bke3+xQbNG1E187MayG/wBQjR4qOaY9k5l4hyXa6E0Q+u4VMmOlxth7VdEH+
         PBD07mVqinGn7kJBdBIcK3PrsPkMcnK/Ef135fh/KgioWDGArbeUvt0bw9ZaZQpa8nGY
         6+fV9en+9JbqPohuRKClB5yArccZhSTw+b4PyNhw+MCHr+jQdCaw8/IEAeqWRT7ANXDK
         cTkcEazbs/3fX/xmoIrGK31prxTO/qYYxuGk82OMQT4YVteAmfl3rlxjxf8I7lra3yRz
         +0TpImK1k2MGo5+PAwji5VcBVvlec36+AmJ2z9RM7MRZs/PrzOUxWKY4CgGERhV2ApFJ
         7g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu39gQJp1k9p/w40T6pLSbtngQhYyXde8HjMY4LOfK0=;
        b=1yNr5Tp4ZJu2t9YGKrqSTWLUVhpO7kAtYIqJBD7yRmeoEM4q0fbPbTmYNXDkYQ/P+t
         sOQQr6hU5K76y2ehtlWPpt7b+PVTFyMnZgFPJ5vBEEoMjs2rg04r0hOi+9x6WmPA73Gj
         G8vkpLjE5X9krvqGy+0Ew/XDmeLxATCJ5RQG9HvjRSLoPc4Vwf28Kflpjj6S0jet6xe6
         CeR2soZBRiOG8ANXS9YYQ88wneLPOLN/ZHL1CIF1UALN618ppZOmVCtRUOsIkRNtoqD3
         Yf49sWiUKf5K55cooMRKVl5lYN48BvDGIN8Z2bKuyBmItwhsMxFKgK92U3yMSeUPZm2l
         xGwA==
X-Gm-Message-State: ACrzQf18evBk+f23/ADhNC7kNc11G/Se+rwJVkSHEb4L7EUFk44LlTgA
        VD33UaDfTWvxtT8r/4FSQAQuLaU6R0ZkEQ==
X-Google-Smtp-Source: AMsMyM7bNw76EJwbBZTKLxZ9P0hHEG9rg8kcZtgbyMG2YuuMWFvu+NAhqM0/fCThCSJczwBJ2r+YvQ==
X-Received: by 2002:a5d:4882:0:b0:22e:3c67:75ef with SMTP id g2-20020a5d4882000000b0022e3c6775efmr9327565wrq.6.1664959078181;
        Wed, 05 Oct 2022 01:37:58 -0700 (PDT)
Received: from localhost.localdomain (hst-221-6.medicom.bg. [84.238.221.6])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b003b47e75b401sm1318171wmo.37.2022.10.05.01.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 01:37:57 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/3] venus: firmware: Correct non-pix start and end addresses
Date:   Wed,  5 Oct 2022 11:37:29 +0300
Message-Id: <20221005083730.963322-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005083730.963322-1-stanimir.varbanov@linaro.org>
References: <20221005083730.963322-1-stanimir.varbanov@linaro.org>
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

The default values for those registers are zero.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3851cedc3329..71e43611d1cf 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -38,8 +38,8 @@ static void venus_reset_cpu(struct venus_core *core)
 	writel(fw_size, wrapper_base + WRAPPER_FW_END_ADDR);
 	writel(0, wrapper_base + WRAPPER_CPA_START_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_CPA_END_ADDR);
-	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
-	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
+	writel(0, wrapper_base + WRAPPER_NONPIX_START_ADDR);
+	writel(0, wrapper_base + WRAPPER_NONPIX_END_ADDR);
 
 	if (IS_V6(core)) {
 		/* Bring XTSS out of reset */
-- 
2.25.1

