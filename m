Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9E2330BC1
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 11:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhCHKwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 05:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhCHKw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 05:52:26 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E506C061760
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 02:52:26 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id lr13so19388652ejb.8
        for <linux-media@vger.kernel.org>; Mon, 08 Mar 2021 02:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a1XuaInoR0tuPlY8Xeovw7fyTewNoHYbnAtL2fQF1jw=;
        b=B6EOG3eEDx+Oq57f8XKABz8GGzN0l2eN6WPn8VX6m4aDlgPmjORd1DkwyCup85xFv9
         md/fvXE7/rZ/ZdyT+mHt4QU7hohPSHIQ4PSd5RVHkBwZg3Mg76shM8kQizn/2IJNQaTi
         4DHbm2JTmTy/uQqdiT0IO8iv2s7BZLf90C0HEZkWInFBREhFnQlhZkaaoj/51mVu3jVB
         hycNuaCsudNIvFqSITsfzDXS4mmVXbyJDTAJOSqG9SNtfjXosX0VWtQslSH3cn2Kwc6i
         ObkYDgZd6oJKcQjbQ4PnAKIR7Ul8GBJk6PLXa0B60m1DKWyylB76nCigzyzvfbY/kAUg
         fdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a1XuaInoR0tuPlY8Xeovw7fyTewNoHYbnAtL2fQF1jw=;
        b=KJzQpS3lKTNmiBWLhQtfkgkHgBbcxMaolC2l+2WNW3/6vUu5AilLf0cHNP7nNorZ/F
         gnaYmkbMuLJrMIM1heUD7R50bekQAVO/B4nuo3D95j8MpDxCCprSaGOm0rdufTh5C03T
         HRvdQMqQ4ocrkSRYBH37QzTz6/9VM6uHg+VZifeRLBBapTO34g4GFEk7Hr7weqCU+jte
         CmD8Au6CjFZwGZS7S0ip8E7Q0bpBUokhuxRWBGFWyl87IXYN0v8LGoC6AiNZ7AUH+CcU
         Hic2sv6xtTucsMdS/35ywboTxslZtTYAd218pZl9oSE2Q6Rz37lCaqLqBV5J+4f/xVDp
         Y7QA==
X-Gm-Message-State: AOAM5300czm0tz1iuvFEG9WKUtJaW7thTNZ5FVUlH4hImjch6YrhcWSK
        DnpBI1TYRFsP4e8ShGMk0JRHiGEmVgyz7w==
X-Google-Smtp-Source: ABdhPJwAT03k6S7nPPPaEoZ+Fs2kpfuYEdKNlGrqGsE7fYDSqIWjGpZBmRsVOPoduIbqSbkoI4QahA==
X-Received: by 2002:a17:906:e84:: with SMTP id p4mr14252657ejf.30.1615200743927;
        Mon, 08 Mar 2021 02:52:23 -0800 (PST)
Received: from localhost.localdomain (95-43-196-84.ip.btc-net.bg. [95.43.196.84])
        by smtp.gmail.com with ESMTPSA id y9sm6386297ejd.110.2021.03.08.02.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:52:23 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 1/5] venus: hfi_parser: Don't initialize parser on v1
Date:   Mon,  8 Mar 2021 12:52:01 +0200
Message-Id: <20210308105205.445148-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
References: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Venus v1 behaves differently comparing with the other Venus
version in respect to capability parsing and when they are send
to the driver. So we don't need to initialize hfi parser for
multiple invocations like what we do for > v1 Venus versions.

Fixes: 10865c98986b ("media: venus: parser: Prepare parser for multiple invocations")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 7263c0c32695..ce230974761d 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -277,8 +277,10 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 
 	parser_init(inst, &codecs, &domain);
 
-	core->codecs_count = 0;
-	memset(core->caps, 0, sizeof(core->caps));
+	if (core->res->hfi_version > HFI_VERSION_1XX) {
+		core->codecs_count = 0;
+		memset(core->caps, 0, sizeof(core->caps));
+	}
 
 	while (words_count) {
 		data = word + 1;
-- 
2.25.1

