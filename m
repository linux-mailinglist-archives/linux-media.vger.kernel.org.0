Return-Path: <linux-media+bounces-404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3DF7ED526
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 22:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9DA51F24D4A
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 21:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80168381A5;
	Wed, 15 Nov 2023 21:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320841BE;
	Wed, 15 Nov 2023 13:01:11 -0800 (PST)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1f0f160e293so32769fac.0;
        Wed, 15 Nov 2023 13:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700082070; x=1700686870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeu2Yqk+1W7JwaGj7n+VfzHpUfLi9VX9pa9cQ1fxjWY=;
        b=RhMvEzt5IUz2v91D8lzduKZ7XBmVYgUAQtUDFUJqci8WwCkfY0eapyiCJxw/Ve1S9B
         7kfQSGA82DWQ8sp+zVgR/RgpkptUhjjtyn4FOMsKkRX6EMFndKlG5AZTNYpfDdZ6JPQ3
         Po5Po48rK+wSH9q/Ea5mKXb+PPPyGy8WqspvDvwiL0fJuTQEuffnALziWBVbHwpLPR+X
         rN+kBcWFNs0MSZktyokhLSHSncuVwv9HjYNU/wUFAiSOsF+GZnErI9HsCW0bqlbyBu14
         fxx+xFU8T0qE9Gi6+13BLQVaCWjRAqFVmlf3TUjTk/32CmiiF7cjKjIKBtAKgvZfbJOh
         rUQw==
X-Gm-Message-State: AOJu0YyoQPqqsdXDJ49ARN0us7C0wtVYLBgA+l7iYnZuddfTDELcljoP
	ZcY5ElGBzGFwZaeXUj8dig==
X-Google-Smtp-Source: AGHT+IEVvxd3MCaCvVBahCTroW9oJyYWp33cFwoR5qhRxQiQVxo5B8PsmQhF/yPdTGut1NK8vIwcew==
X-Received: by 2002:a05:6870:c1d1:b0:1e9:c18b:b2da with SMTP id i17-20020a056870c1d100b001e9c18bb2damr18542152oad.18.1700082070487;
        Wed, 15 Nov 2023 13:01:10 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bs14-20020a056830398e00b006ce1f9c62a1sm692803otb.39.2023.11.15.13.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 13:01:09 -0800 (PST)
Received: (nullmailer pid 3738084 invoked by uid 1000);
	Wed, 15 Nov 2023 21:01:08 -0000
From: Rob Herring <robh@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] media: stm32-dcmi: Drop unnecessary of_match_device() call
Date: Wed, 15 Nov 2023 14:59:04 -0600
Message-ID: <20231115205904.3732985-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If probe is reached, we've already matched the device and in the case of
DT matching, the struct device_node pointer will be set. Therefore, there
is no need to call of_match_device() in probe.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 8cb4fdcae137..48140fdf40bb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -20,7 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
@@ -1890,7 +1889,6 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 static int dcmi_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *match = NULL;
 	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
 	struct stm32_dcmi *dcmi;
 	struct vb2_queue *q;
@@ -1899,12 +1897,6 @@ static int dcmi_probe(struct platform_device *pdev)
 	struct clk *mclk;
 	int ret = 0;
 
-	match = of_match_device(of_match_ptr(stm32_dcmi_of_match), &pdev->dev);
-	if (!match) {
-		dev_err(&pdev->dev, "Could not find a match in devicetree\n");
-		return -ENODEV;
-	}
-
 	dcmi = devm_kzalloc(&pdev->dev, sizeof(struct stm32_dcmi), GFP_KERNEL);
 	if (!dcmi)
 		return -ENOMEM;
-- 
2.42.0


