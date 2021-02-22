Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFB8321C52
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhBVQFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbhBVQD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:58 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70643C0611C2
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:50 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id b3so19624130wrj.5
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=58IX7lQQO/xiRLO+o9gmDLJkWZs2hxFilBGny+gBS5k=;
        b=dCXV9MBKBXkYUWUJwg1xHXjAeTxsyctxvc7mtofyqO7tDNjTpafD1+tks6BoPREUis
         c+yzQsbe9NzCtES2knezsBp7FhjdhefWUOYZkTvuuAKKXVqH2HDGAw7Krlf8dQ2+DGtF
         LVRSaoe7Yc65/UyCZDRWkzb8EbSorwtKV+Q7iuP5j44EIgOz1Wkqscqr6ipREBiS3vDV
         dKmhQc555qjGwK4rS9lZ6i0lvtj+R1ZrBjn4yAvryvPvqUmL5kEH0ocDlZHn3gfu2+5F
         mIF1k3wG7K1dS2GZ4SOXHc16UMGI3nDwxNXxvb7pAS2ReznzcOeChYKDkmrS3fEb0bks
         Ee/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=58IX7lQQO/xiRLO+o9gmDLJkWZs2hxFilBGny+gBS5k=;
        b=AMT/0eO+BXGtz4h3tn2R7Rl+GjmN12sSRkmbm//8+s57p42ME7iCnojSHIuxoWXJGV
         X1ogzyRbY/3FFmlN3Pa08tr8k34TWN0gM30zS1mrnMi3eUOx2sLqrk6hMUPqtVxTDJac
         urznCMT18ANISHp7VQ6L4v383PK/y6XQcWajvoFUCL4S1TZe6OCwfaMEBc3u0e3+owzK
         T0DgH2i7Tvd16hJHePZTvADnjKT7SH+QUpQjGzloMBfdiuUAxvhH+elm4UHYJPJ0W7Qp
         kK3EE6hK9m+51OFIBIJtN0HDtIgqBSughY6TOxD2mYV3oLU89r6jECS6pgOV33FJhKYP
         gleg==
X-Gm-Message-State: AOAM531WCHZ7ZUKmicqfaSTDB7CuuzlMGlhzHs9oUBpJnTyw+mtiPowF
        UIfYvVJVroAsJZS5RiP6Q6vv3w==
X-Google-Smtp-Source: ABdhPJxPISB1L5zOwH+yZdNn03BeAM6RWxfITGmxuBSjsBOvjaC4SahfRLg3sRTEYHSMDE5GBdWYlA==
X-Received: by 2002:a5d:448c:: with SMTP id j12mr22935221wrq.63.1614009709263;
        Mon, 22 Feb 2021 08:01:49 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:48 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 12/25] media: venus: core: Hook to V6 base registers when appropriate
Date:   Mon, 22 Feb 2021 16:02:47 +0000
Message-Id: <20210222160300.1811121-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit points the IO base registers 6xx offsets when probing for 6xx
hardware.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index dad597617961..e398d3bda65b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -209,13 +209,23 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 
 static void venus_assign_register_offsets(struct venus_core *core)
 {
-	core->vbif_base = core->base + VBIF_BASE;
-	core->cpu_base = core->base + CPU_BASE;
-	core->cpu_cs_base = core->base + CPU_CS_BASE;
-	core->cpu_ic_base = core->base + CPU_IC_BASE;
-	core->wrapper_base = core->base + WRAPPER_BASE;
-	core->wrapper_tz_base = 0;
-	core->aon_base = 0;
+	if (IS_V6(core)) {
+		core->vbif_base = core->base + VBIF_BASE;
+		core->cpu_base = core->base + CPU_BASE_V6;
+		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
+		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
+		core->wrapper_base = core->base + WRAPPER_BASE_V6;
+		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
+		core->aon_base = core->base + AON_BASE_V6;
+	} else {
+		core->vbif_base = core->base + VBIF_BASE;
+		core->cpu_base = core->base + CPU_BASE;
+		core->cpu_cs_base = core->base + CPU_CS_BASE;
+		core->cpu_ic_base = core->base + CPU_IC_BASE;
+		core->wrapper_base = core->base + WRAPPER_BASE;
+		core->wrapper_tz_base = 0;
+		core->aon_base = 0;
+	}
 }
 
 static int venus_probe(struct platform_device *pdev)
-- 
2.29.2

