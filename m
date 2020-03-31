Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50744198D83
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 09:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730149AbgCaHxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 03:53:41 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33771 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbgCaHxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 03:53:40 -0400
Received: by mail-ua1-f68.google.com with SMTP id v24so7361489uak.0
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2020 00:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=RpJLTIbn/mYG38Y6oAIWwRqzx2pjox8Ab74rqdaS5Z8=;
        b=pjDXE55YaX1RyrPE1WylNgiDhf37tUUoyf4CPV0jEgf7ECkAlq8nIMCZtUkehxukpx
         MzdH68XHwukMUOnq0TMdtQuzKJuhCfqVqDPube4joUnR5zGvDluVkmdPQhQWeeK5DFTm
         UUmjxfYb2ImH/4V4gDTvuLcv05ohsvCrDv8QAvdrpCqQBO9aEtZFxMzov71PmIngc/vJ
         EuNy5U+urmByJSDwoip/5KX6Lw64+8aVt4XnEXEHRX9wA/ZstXwzy+zYhYtMV8lX8SoZ
         Zlds5Lqk7N8eZuUcE8wYBMLGnRo+W9/eCocxyQ0qijadjebhESCAkwrXtEU8WBXd9yVY
         1bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=RpJLTIbn/mYG38Y6oAIWwRqzx2pjox8Ab74rqdaS5Z8=;
        b=RfJVYpNXG0ceaieJp1ssUNmBZR2t4+OFTUgSJDJKD6o8knGX0Vi7KFrXmPTJj7HAvW
         kIFKSgyuzVhucWfIbh4ZKDebPH9RviDCDuFh9ab0F4UNFtuKhGHr9o4VcdgaRxgZE+Bf
         jMoZqXf/+22qEkKc8i9Io5/nPRuE/hY0MnTrsn88qJYUobedonRWgxiUbJbF2ciPAWil
         J4mSiB3E/9EWmxoaAFUZAcSiQq443wZK/1vtW4OwD9mNJvPzcZFnhSwr+0Q0vt2965eu
         hQlsuL3Ko8lP2SB5RUsNX+vkBZcz9Fg1vPjkwvBNA8S7R9YI3cslkIkBuBOcTn47u8MU
         ns1Q==
X-Gm-Message-State: AGi0PuZYU1r4WA/CbomFYNvtCHo7G9YaS6yy4VQgv1TVSVXnvMmteMvg
        rzWS7VnN1VyYVH1xQiaH6BtOClzB5EM8sJQIfhj9tiXR
X-Google-Smtp-Source: APiQypJEp3xQIgTnMRjCN0DiABPWo0DqQvmKxIBf5I06kToON0W6SOrszw3hsz19KvMBOe4PuadnkNrkfTQiKXFMEgU=
X-Received: by 2002:ab0:477:: with SMTP id 110mr10908873uav.56.1585641219275;
 Tue, 31 Mar 2020 00:53:39 -0700 (PDT)
MIME-Version: 1.0
From:   karthik poduval <karthik.poduval@gmail.com>
Date:   Tue, 31 Mar 2020 00:53:28 -0700
Message-ID: <CAFP0Ok_b0rCws15=Jojj0xFOZjvfT75HRi1PMEO6w5JP+qXbXQ@mail.gmail.com>
Subject: [PATCH 2/4] media: staging: rkisp1: add rk3288 support
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add rk3288 support to the rkisp1 driver.
ported over from (https://github.com/TinkerBoard/debian_kernel.git)

Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
---
 .../bindings/media/rockchip-isp1.yaml          |  1 +
 drivers/staging/media/rkisp1/rkisp1-dev.c      | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
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
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c
b/drivers/staging/media/rkisp1/rkisp1-dev.c
index b1b3c058e957..1df4f5906fd0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -403,6 +403,20 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
     return IRQ_HANDLED;
 }

+
+static const char * const rk3288_isp_clks[] = {
+    "clk_isp",
+    "aclk_isp",
+    "hclk_isp",
+    "pclk_isp_in",
+    "sclk_isp_jpe",
+};
+
+static const struct rkisp1_match_data rk3288_isp_clk_data = {
+    .clks = rk3288_isp_clks,
+    .size = ARRAY_SIZE(rk3288_isp_clks),
+};
+
 static const char * const rk3399_isp_clks[] = {
     "clk_isp",
     "aclk_isp",
@@ -417,6 +431,10 @@ static const struct rkisp1_match_data
rk3399_isp_clk_data = {
 };

 static const struct of_device_id rkisp1_of_match[] = {
+    {
+        .compatible = "rockchip,rk3288-rkisp1",
+        .data = &rk3288_isp_clk_data,
+    },
     {
         .compatible = "rockchip,rk3399-cif-isp",
         .data = &rk3399_isp_clk_data,
-- 
2.17.1
