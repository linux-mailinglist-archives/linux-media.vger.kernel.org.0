Return-Path: <linux-media+bounces-406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8337ED52B
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 22:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC5101F24F54
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 21:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9B739FE5;
	Wed, 15 Nov 2023 21:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB32BD;
	Wed, 15 Nov 2023 13:01:20 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6d30d9f4549so53100a34.0;
        Wed, 15 Nov 2023 13:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700082079; x=1700686879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCg6f5/T02V1q5il/uuEVJCsez595XWmMuk/ZZxOjtI=;
        b=XioGdLP+Dsiied9KwmIlx12WIlEqlY1YTtqBZratTC8/tOClbBbsXHJvJ78SYWiuL1
         RqkbBWN74zcSxkaC6v8wZo5n0AeN+UYGoGntf63IJOgGpBqwitPge51uZ90IFiB2Y9mO
         T2FnMmZH/BAmx/fxlTvM84ETXuMRZVbDn9BmYwKk3fdI0vSPtiLs5cSLva8OAUrfIJk+
         evQzllrsb+PKg0DHce2QdvqzCx9rfRxvyYXxzegEfbmG3TffoSIefVybZT2+b13auPIX
         J7zrlYMd1dnxr5vwLzYw/wr4omq9rMtPanSOcOBhmUKhnKy+BO3rfLDUl5W60NGlm2Ub
         NahA==
X-Gm-Message-State: AOJu0Yw/jNdZsAk5NPmXK1kTttGOBMRJPvdpcM1OUkb+RQb8x/afhdrW
	DsZGmENcwQFkuLSfSvSy+A==
X-Google-Smtp-Source: AGHT+IHEarBzCTJVSMjCJKEP0XCaIp/Pvxrcdn3rQUfQ4FIMqA49jZ5b0pLbkM6cNJnOhp4Mj/2sDQ==
X-Received: by 2002:a05:6830:614:b0:6d2:e1fd:9f5e with SMTP id w20-20020a056830061400b006d2e1fd9f5emr7098733oti.6.1700082079446;
        Wed, 15 Nov 2023 13:01:19 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s30-20020a056830439e00b006ce2e464a45sm692655otv.29.2023.11.15.13.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 13:01:18 -0800 (PST)
Received: (nullmailer pid 3738432 invoked by uid 1000);
	Wed, 15 Nov 2023 21:01:17 -0000
From: Rob Herring <robh@kernel.org>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] media: ir-hix5hd2: Use device_get_match_data()
Date: Wed, 15 Nov 2023 15:01:13 -0600
Message-ID: <20231115210113.3738233-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/media/rc/ir-hix5hd2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 0034f615b466..de5bb9a08ea4 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -9,7 +9,9 @@
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <media/rc-core.h>
 
@@ -251,7 +253,6 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct hix5hd2_ir_priv *priv;
 	struct device_node *node = pdev->dev.of_node;
-	const struct of_device_id *of_id;
 	const char *map_name;
 	int ret;
 
@@ -259,12 +260,11 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	of_id = of_match_device(hix5hd2_ir_table, dev);
-	if (!of_id) {
+	priv->socdata = device_get_match_data(dev);
+	if (!priv->socdata) {
 		dev_err(dev, "Unable to initialize IR data\n");
 		return -ENODEV;
 	}
-	priv->socdata = of_id->data;
 
 	priv->regmap = syscon_regmap_lookup_by_phandle(node,
 						       "hisilicon,power-syscon");
-- 
2.42.0


