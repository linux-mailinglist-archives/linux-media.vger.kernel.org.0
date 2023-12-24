Return-Path: <linux-media+bounces-2973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C1B81D8F9
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 12:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0A89282304
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 11:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6BB11CB0;
	Sun, 24 Dec 2023 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yR/SNaCv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0901F1078E
	for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55372c1338bso3351342a12.2
        for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 03:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703418571; x=1704023371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqxFJT/Vp5f9kw7muiT1rKjgk7yNDMWKW8fhqHiMN7k=;
        b=yR/SNaCvAI8rqaebDhMAsZXxYbx/oOD7oQIjPxhCz1jJBKRw9q74XoTsN0NTOCJ8uu
         c1YaNALbELql5FG3jQ4O5QaR/aOc/xMaiDB2owT2sMFglqoauK1hctv82lBi24UyXDaj
         oOSebY+o7HeiwV8XPYN7K68+ygMB6q7pLa2XiLdS090BIvRJVr0WqsD6mDV8EDPe5Q1L
         Z70B6oYV0yA/mup3QZdh1fhKkaWOxm60aSBx5SDwq4jGi/9oLBOlTXxDMUr2L4SFCVGh
         /+DVep8XfLG9Kr0OddAopHHnEi3pBJPWhqir0XSb70czFXnG7kfYfpLKwm1siTsFdBDZ
         YWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703418571; x=1704023371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqxFJT/Vp5f9kw7muiT1rKjgk7yNDMWKW8fhqHiMN7k=;
        b=k0uGdZKHY4NVzJaxDoIWn58iybm12Volrfq4/SwMtqYJ31qlDURSxkDVW8Yh6/bbqK
         lMTH+Rtbw4geJl6UNlVCFI7WTJME9rKpebV8Pr5ZrZqZDNLHMBjw/gngGxQEFoI+UVQD
         FUGlGVXs+BjVlpRsN9ePL5pLC2GJ7AR60iVAaFD/LsF86DVHA05IeiBXjkeMTt1pzcfW
         mxBf1PUWgieSYbx2t3veyhWE4niWwvtNfMZKCEBK7BTMOI0x29ZuJEbwjK2CHSVf9CPG
         5SFC7G3fBN+A37SZIVhM2yFhhnNxyncWHIjIO12zWT2ckpNsOemAbHMHh6wt0b6KxqNY
         AYiw==
X-Gm-Message-State: AOJu0Yye6rQ9n2e8Dn+krIeXMn0VL22Fw9ack/UFSizUISus9/1Fvv00
	dV9ouPVkeTYSxwNWZ5q/Qvh1nbdfOBF37A==
X-Google-Smtp-Source: AGHT+IGM42YRtVprr9pekRIX2Xfig8OCXNZ5jUD1e/9F7EsT/K1svsCB6WfvK9coNOuAmg8mWuQ68Q==
X-Received: by 2002:a50:8711:0:b0:551:9675:53c2 with SMTP id i17-20020a508711000000b00551967553c2mr2358523edb.49.1703418571430;
        Sun, 24 Dec 2023 03:49:31 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id z23-20020aa7c657000000b0054ccac03945sm4999771edr.12.2023.12.24.03.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 03:49:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] media: fimc-is: constify local pointers to fimc_dma_offset
Date: Sun, 24 Dec 2023 12:49:14 +0100
Message-Id: <20231224114916.111433-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231224114916.111433-1-krzysztof.kozlowski@linaro.org>
References: <20231224114916.111433-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Constify the local variables pointing to "struct fimc_dma_offset" to
annotate the function is not modifying pointed data.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-reg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-reg.c b/drivers/media/platform/samsung/exynos4-is/fimc-reg.c
index dbc43b703324..0ed6e22e6c47 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-reg.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-reg.c
@@ -167,7 +167,7 @@ void fimc_hw_set_out_dma(struct fimc_ctx *ctx)
 {
 	struct fimc_dev *dev = ctx->fimc_dev;
 	struct fimc_frame *frame = &ctx->d_frame;
-	struct fimc_dma_offset *offset = &frame->dma_offset;
+	const struct fimc_dma_offset *offset = &frame->dma_offset;
 	const struct fimc_fmt *fmt = frame->fmt;
 	u32 cfg;
 
@@ -421,7 +421,7 @@ void fimc_hw_set_in_dma(struct fimc_ctx *ctx)
 {
 	struct fimc_dev *dev = ctx->fimc_dev;
 	struct fimc_frame *frame = &ctx->s_frame;
-	struct fimc_dma_offset *offset = &frame->dma_offset;
+	const struct fimc_dma_offset *offset = &frame->dma_offset;
 	u32 cfg;
 
 	/* Set the pixel offsets. */
-- 
2.34.1


