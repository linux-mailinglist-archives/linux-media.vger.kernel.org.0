Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F6311F95A
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfLORAE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 12:00:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:55254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbfLOQ7c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 11:59:32 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94BFE24683;
        Sun, 15 Dec 2019 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576429171;
        bh=8CLQxknPeOFqXl41pV/zS4RQXl281ma26CPeXsgnCkg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sh/yRkOaLi7Hl99lWQWsLX+sVerx9QiKoDpuTqPft6SXGg0dwfU1RFkzpWP4KPuM0
         AtlsLE75cQSx0FxaqPQ9mmLWbrMTLftYtacDqN2hP2I5BxPnG3ssgHirxnLa7gIMMT
         vqJAg6m5IljnasaSLQLXUGzrM9vSadZz+EFxb/2U=
Received: by wens.tw (Postfix, from userid 1000)
        id 7BEFF5FEF8; Mon, 16 Dec 2019 00:59:26 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 10/14] dt-bindings: bus: sunxi: Add R40 MBUS compatible
Date:   Mon, 16 Dec 2019 00:59:20 +0800
Message-Id: <20191215165924.28314-11-wens@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215165924.28314-1-wens@kernel.org>
References: <20191215165924.28314-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Allwinner R40 SoC also contains MBUS controller.

Add compatible for it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt b/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt
index 2005bb486705..1d725fa03706 100644
--- a/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt
+++ b/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt
@@ -9,6 +9,7 @@ Required properties:
  - compatible: Must be one of:
 	- allwinner,sun5i-a13-mbus
 	- allwinner,sun8i-h3-mbus
+	- allwinner,sun8i-r40-mbus
  - reg: Offset and length of the register set for the controller
  - clocks: phandle to the clock driving the controller
  - dma-ranges: See section 2.3.9 of the DeviceTree Specification
-- 
2.24.0

