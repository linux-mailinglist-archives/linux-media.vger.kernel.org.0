Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 442556A1E2
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 07:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbfGPFip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 01:38:45 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35646 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfGPFip (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 01:38:45 -0400
Received: by mail-pf1-f194.google.com with SMTP id u14so8538640pfn.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2019 22:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dkDvJESbfgarF5psH5TI9KfGPlZBY5Pvyob+Ly4gKF8=;
        b=o1wZbqSpkuQBVBsXUFfptyzSKhzuaZmxcFFIoWCXB/xynZ5BVwDkmj6etKX8HHtnLk
         OhR8Nuory5f3D0SCk7V9A/rb3VpoF49qI0OHhkSQ1z+yVXVEEVJT2PJ1Q7VVznXaQBbO
         qgCwerr5jIeXOxISQoJlT2muWTKVXzXYXWL44sMQG1T4zXEU9bBnBlY1ULHT5DNtdZFT
         KQ6qp6lO6+70Z08oJm+ipg5ry/kI0ukjiRHiA9WAKhu1PlohST8mvYzUhYcpSA6WlmqX
         EA6w7LUyY6o7dCCF8KwrrvldyH4c3d/uJDZteKBYrO0ahiQwkDhNrkxCBG5mvMcfmPTf
         nmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dkDvJESbfgarF5psH5TI9KfGPlZBY5Pvyob+Ly4gKF8=;
        b=H8ERIXyMHdnvv+ssEprTit5rbtI47MxsMbJ1V1Jl2dLUbOKY69OWoEuiIC7ur/rkLb
         ouFpwnzWKKKob1Nl9jPFrug8eRlOMe6cDUWBAsynh3AjHvMYDpvUKzFqQFXuoSl1nTDY
         NT1qdWZqi/bCFc6pjtZSEzMynKphPonElbC9HT3NO3xJr2yFUMIUtSgwzsLoiOivqoLY
         vAfXLYYQFUzoxjCYk8vdVqnK5uLXw6Vv01o9PZf37ogpEZ7FKYUZfr9X73HM0Dl+pzyo
         c+O3TmE3Ws7zwO1ImALVoPCLRybyMkhWzlDbDh4tHPHerU51vFUN+w06n3W73Y5RghiX
         fXPg==
X-Gm-Message-State: APjAAAWmfdhffb/mGy0ZaJeDZDAGSH3EAToiCqHogRIt5qrgwJ7Z9sYc
        kQEpR87RgST8jqDrJK+K0I0=
X-Google-Smtp-Source: APXvYqz29Kt/DIaEzG6cZYr8hZNUNgfuMYgQvzVP23DdS0M9Uhhi4hD3xTJFEKv4Lg9FdY/yuZI/PQ==
X-Received: by 2002:a65:4509:: with SMTP id n9mr15786941pgq.133.1563255524645;
        Mon, 15 Jul 2019 22:38:44 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id v27sm22866779pgn.76.2019.07.15.22.38.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 22:38:44 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     patrice.chotard@st.com, mchehab@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] media: platform: sti: c8sectpfe: core: Add of_node_put() at goto
Date:   Tue, 16 Jul 2019 11:08:31 +0530
Message-Id: <20190716053831.2613-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a goto from the middle of the loop, there is no put, thus
causing a memory leak. Hence add a new label that puts the last used
node, and edit the goto statements in the middle of the loop to first go
to the new label.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 .../platform/sti/c8sectpfe/c8sectpfe-core.c    | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index 3c05b3dc49ec..85ab20492c2d 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -771,7 +771,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 
 		if (!fei->channel_data[index]) {
 			ret = -ENOMEM;
-			goto err_clk_disable;
+			goto err_node_put;
 		}
 
 		tsin = fei->channel_data[index];
@@ -781,7 +781,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		ret = of_property_read_u32(child, "tsin-num", &tsin->tsin_id);
 		if (ret) {
 			dev_err(&pdev->dev, "No tsin_num found\n");
-			goto err_clk_disable;
+			goto err_node_put;
 		}
 
 		/* sanity check value */
@@ -790,7 +790,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 				"tsin-num %d specified greater than number\n\tof input block hw in SoC! (%d)",
 				tsin->tsin_id, fei->hw_stats.num_ib);
 			ret = -EINVAL;
-			goto err_clk_disable;
+			goto err_node_put;
 		}
 
 		tsin->invert_ts_clk = of_property_read_bool(child,
@@ -806,14 +806,14 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 					&tsin->dvb_card);
 		if (ret) {
 			dev_err(&pdev->dev, "No dvb-card found\n");
-			goto err_clk_disable;
+			goto err_node_put;
 		}
 
 		i2c_bus = of_parse_phandle(child, "i2c-bus", 0);
 		if (!i2c_bus) {
 			dev_err(&pdev->dev, "No i2c-bus found\n");
 			ret = -ENODEV;
-			goto err_clk_disable;
+			goto err_node_put;
 		}
 		tsin->i2c_adapter =
 			of_find_i2c_adapter_by_node(i2c_bus);
@@ -821,7 +821,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "No i2c adapter found\n");
 			of_node_put(i2c_bus);
 			ret = -ENODEV;
-			goto err_clk_disable;
+			goto err_node_put;
 		}
 		of_node_put(i2c_bus);
 
@@ -832,7 +832,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 			dev_err(dev,
 				"reset gpio for tsin%d not valid (gpio=%d)\n",
 				tsin->tsin_id, tsin->rst_gpio);
-			goto err_clk_disable;
+			goto err_node_put;
 		}
 
 		ret = devm_gpio_request_one(dev, tsin->rst_gpio,
@@ -840,7 +840,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		if (ret && ret != -EBUSY) {
 			dev_err(dev, "Can't request tsin%d reset gpio\n"
 				, fei->channel_data[index]->tsin_id);
-			goto err_clk_disable;
+			goto err_node_put;
 		}
 
 		if (!ret) {
@@ -883,6 +883,8 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_node_put:
+	of_node_put(child);
 err_clk_disable:
 	clk_disable_unprepare(fei->c8sectpfeclk);
 	return ret;
-- 
2.19.1

