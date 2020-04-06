Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBB619F0C6
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 09:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgDFHai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 03:30:38 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36895 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgDFHai (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 03:30:38 -0400
Received: by mail-pj1-f66.google.com with SMTP id k3so6087143pjj.2
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 00:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pG/RazX9Sl3A3pCDkZw0apl899O9yG3jRB1KPgFB0T4=;
        b=ruz5H+afm8ZmWj28zZzEW6ZicA4AcWTHwW2wYMWiCxzQ6w6IOQ/h9AbgOWVzZx1yZQ
         ikRIavLY1bMu7LDvI8xuk6SKvimQjCQ8qv2GB1EP32YUZAXWFNpzBjMZ2k3SKjqZDbSK
         GJ4sZobxTK/Y3qSJrzeTgTx/6nC7ab4yVMQAnzd0rUBorANJ7NSP95JSPvj5i2BpCKCd
         JwjkzKABK0ecm2hJ87d7/WL6Oc3xSJZUNPoihF9vMt0Hjpsg/SbWmFMPGkU+RwxBYufx
         b1ZQDKHfNclgy3CmCq4YQCCDbhS84ghJcFOftOg6Qw86R0dsPMHSeyewnRQ4x19BWs2K
         vftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pG/RazX9Sl3A3pCDkZw0apl899O9yG3jRB1KPgFB0T4=;
        b=TzpFvGunIdnnQsipIkx6j+T8TdRV5Y78HURyg61nCwPTwEHWCGe/G3Fiv5EEzDcnTZ
         /MAAeEvevbgMl8aY4vRJ/+EWVDla8kyGWnQrYh/6pPsrp8MVEIFVfPLg+8XBqwrGR+e7
         KMrEgQSdK+h1KFZqnVJFxsM+o8CK/7Tw1TukyFqqr1rVejrBj/n1nBQ4sTjOykMWknhB
         h2qZeYJN+bmK4/i7d4BTcvpkp0JW18AVQ6H+46mj9ltCCcXGM2dccIiJhzP9Jlrc8bh6
         dhlWN7oS6uv+nnGmidSzKnXsPZr/E2r7yto06WmWToTO2l/Mm+tv+s5+dfNsTDVFBbge
         N9hg==
X-Gm-Message-State: AGi0PuZTrVVqqyydddP9eB8AHDNtPs6iDZAElBiZkKwpwSrDO2SIoZrZ
        RIO6soyToniLfLBoShqOINn0NbyU
X-Google-Smtp-Source: APiQypJb0rBTogkwmlQLRYglLBp5zKJCM27uYYuFoqCaFY/qIljDYVqcVnYaHRrKDSDtWKPdRo14EA==
X-Received: by 2002:a17:902:107:: with SMTP id 7mr18639285plb.302.1586158236696;
        Mon, 06 Apr 2020 00:30:36 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-174-82.hsd1.ca.comcast.net. [24.4.174.82])
        by smtp.googlemail.com with ESMTPSA id z6sm10170179pgg.39.2020.04.06.00.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 00:30:36 -0700 (PDT)
From:   Karthik Poduval <karthik.poduval@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Karthik Poduval <karthik.poduval@gmail.com>
Subject: [PATCH v2 2/3] media: staging: rkisp1: add rk3288 support
Date:   Mon,  6 Apr 2020 00:30:16 -0700
Message-Id: <20200406073017.19462-3-karthik.poduval@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406073017.19462-1-karthik.poduval@gmail.com>
References: <karthik.poduval@gmail.com>
 <20200406073017.19462-1-karthik.poduval@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add rk3288 support to the rkisp1 driver.

tested on tinkerbaord with ov5647 using command
cam -c 1 -C -F cap

Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
---
 .../bindings/media/rockchip-isp1.yaml          |  1 +
 drivers/staging/media/rkisp1/rkisp1-dev.c      | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index af246b71eac6..4c31294cf14b 100644
--- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     const: rockchip,rk3399-cif-isp
+    const: rockchip,rk3288-rkisp1
 
   reg:
     maxItems: 1
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index b1b3c058e957..1df4f5906fd0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -403,6 +403,20 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
 	return IRQ_HANDLED;
 }
 
+
+static const char * const rk3288_isp_clks[] = {
+	"clk_isp",
+	"aclk_isp",
+	"hclk_isp",
+	"pclk_isp_in",
+	"sclk_isp_jpe",
+};
+
+static const struct rkisp1_match_data rk3288_isp_clk_data = {
+	.clks = rk3288_isp_clks,
+	.size = ARRAY_SIZE(rk3288_isp_clks),
+};
+
 static const char * const rk3399_isp_clks[] = {
 	"clk_isp",
 	"aclk_isp",
@@ -417,6 +431,10 @@ static const struct rkisp1_match_data rk3399_isp_clk_data = {
 };
 
 static const struct of_device_id rkisp1_of_match[] = {
+	{
+		.compatible = "rockchip,rk3288-rkisp1",
+		.data = &rk3288_isp_clk_data,
+	},
 	{
 		.compatible = "rockchip,rk3399-cif-isp",
 		.data = &rk3399_isp_clk_data,
-- 
2.17.1

