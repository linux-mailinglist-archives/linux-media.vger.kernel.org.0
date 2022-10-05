Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CB35F50F8
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 10:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbiJEIiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 04:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiJEIh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 04:37:59 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B070673902
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 01:37:58 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u10so24721776wrq.2
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 01:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=q9iQElDOirbdVJ/B2wLi7+yO3Wyao1noVf51AiDgJFo=;
        b=OlZtr53AiAqaCEsScp6R2DjaV8/Fb58pybt1lgbnH1EgriiP6LztWPIzooExFSAD76
         Z8j6s0Ka7MEt0NlNVNhmVGUxKgK386YUGGF8uTLnV4/TU6kklTCpZakSoMJ6xZGc7Jvl
         DiDAsgfgSZcKMovt4bsYV/+0fIPNy0UJjhFZ1kJFz+IhxB8mGC0iI97bCC7qZZ+Vodx8
         3+TCboQO0Cty3kxXJA4GkLspQVRi8+fw/Gw1xWf42w/W92nYWuTVvvJ50BPwKl/0dxXD
         BIr6W8R2U1z0BXDEllV+CUVSoBPXzBBcxb1VJfV1Zr9r9OYjEm9InX5qKdpNZId3ncRo
         GP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=q9iQElDOirbdVJ/B2wLi7+yO3Wyao1noVf51AiDgJFo=;
        b=xrLBErViYVvjVFo1EGgvoG+Nab78gWfU3w74AY0iuaqw5WnQhi90zDzuKr8y6lcZO0
         VG2IO+fIVK5IVu2mlpaM+HmXClZAns8yhFIlHWwjPrZ3DLQxj9Fmw1BxeOUMC/lrVfua
         LkgdrwYNY6EHKGOK0EWTYYrudEv3z4ZX8QOJPcp0/8wTEFInZq32ZZx+5h6+JO2ZaG6k
         0QAkZV4XUbRoFMreRhEnDCVDroA4LaXIy96jfsQ0gPV3i//X7w2QlHezNDugwWFTB6ny
         kFBLiEiiaeZoPfybQim3hrWFPQwub58Cn5ktBPQwBPf95a3Dk314IQCQO9X2TnXCXinC
         D0iw==
X-Gm-Message-State: ACrzQf2OPPXU2phdwf2VYw+u3N87dSVK6fglO5ZnFYue+OSj8bJAwdXZ
        PNN+pyGNrwCARTYYxjeUKMj+RWSp62K7GA==
X-Google-Smtp-Source: AMsMyM67V0zhQ5v9XoNEOaJtjEfK70k66EnzjM1HriUB1ZeCiVO06hT9kkF9RIZKg2KyVjhY5zxbMw==
X-Received: by 2002:a05:6000:1acf:b0:22b:36ad:28e with SMTP id i15-20020a0560001acf00b0022b36ad028emr18582345wry.314.1664959077080;
        Wed, 05 Oct 2022 01:37:57 -0700 (PDT)
Received: from localhost.localdomain (hst-221-6.medicom.bg. [84.238.221.6])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b003b47e75b401sm1318171wmo.37.2022.10.05.01.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 01:37:56 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/3] venus: firmware: Correct reset bit
Date:   Wed,  5 Oct 2022 11:37:28 +0300
Message-Id: <20221005083730.963322-2-stanimir.varbanov@linaro.org>
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

The reset bit for A9SS reset register is BIT(4) and for XTSS_SW_RESET
it is BIT(0). Use the defines for those reset bits.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 14b6f1d05991..3851cedc3329 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -68,9 +68,11 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 		venus_reset_cpu(core);
 	} else {
 		if (IS_V6(core))
-			writel(1, core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+			writel(WRAPPER_XTSS_SW_RESET_BIT,
+			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
 		else
-			writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
+			writel(WRAPPER_A9SS_SW_RESET_BIT,
+			       core->wrapper_base + WRAPPER_A9SS_SW_RESET);
 	}
 
 	return 0;
-- 
2.25.1

