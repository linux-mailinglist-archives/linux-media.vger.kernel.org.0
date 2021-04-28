Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D0236D848
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 15:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239780AbhD1N0j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 09:26:39 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:44013 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239808AbhD1N0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 09:26:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bkCIlVh38k1MGbkCNlOQ2l; Wed, 28 Apr 2021 15:25:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619616351; bh=ZhPX/2YiOfLQlY4NwXvUB7h3vdPmjqi/LUYqzOp/Vv8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=hYDP5nf1f9J3FgMLusk9jnVK7napz+lpLjC8qHZN6dVQomsRK7S0xAWRfr0b+KOjx
         yLSQ+xaE3IyvyXKuJLBYb9ytJxE5TK5aM0yCvHnHDS+fpCy9QmMjwUn8FrGuAOxQSZ
         Z388+AM3NysLMIlNxRV8DGYQwHui9a5iaMm4W2Fp0ziTbAwvgomDQu2nQOd14AHPD5
         2osUBLzre/+MeCnV/yWqLSpO7mk2JpYNxV7yjqVX1Iai/oYylMyaLMvqh1oOs30MzE
         iWtQo9I+L4ZT9HZTG8Ton9BomRHsRzwji/VAeWkN4M3fDMX0/PiivIvzkx2eRGdRpz
         VpXEGblZ1oBaA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 5/6] dra7.dtsi/omap5.dtsi: add cec clock
Date:   Wed, 28 Apr 2021 15:25:44 +0200
Message-Id: <20210428132545.1205162-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNLevcGa/vJcvtKdvEIiHy92QMBtnAfp4gJ5oaF5BD04x2mRHL2FhkBxrDLGL/QF5SPbt8HI0K+xfQ1Qw3yCultLrCTAHCKvOnCJ77XntJwkqGsYDCER
 sMdKdN4TwFN5jfiE+O8c2mWa1O//6otapFxvm1OLdj09IsuKC/QCGSA/qF6vVY53j2xCnRo5Lq7lCRu0n37yP915eacPs3eg8MNrT38veFJyliJ21OK7Uilr
 pkPFu/GVH+PNhH6/SQ7W1AzJH0UU03vmbsf6mFmLutLALKGFgVN99IXSsXqxQ5U8CnYVj+A9R4oIESz5JCzoMkwPMtcn4sLmjjBDzQ4eMwyKkFMV1ukiI9Hy
 WcCcb+I4wbzjr8EJgAu5yT4YxF0PSzgZw/+Y+rgTQalM2ShZZyK73V2cE3uw8B7MudRkCYV1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add cec clock to the dra7 and omap5 device trees.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm/boot/dts/dra7.dtsi  | 5 +++--
 arch/arm/boot/dts/omap5.dtsi | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index ce1194744f84..efe579ddb324 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -879,8 +879,9 @@ hdmi: encoder@0 {
 						interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 						status = "disabled";
 						clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
-							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
-						clock-names = "fck", "sys_clk";
+							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>,
+							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 11>;
+						clock-names = "fck", "sys_clk", "cec";
 						dmas = <&sdma_xbar 76>;
 						dma-names = "audio_tx";
 					};
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index e025b7c9a357..6726e1f1b07c 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -586,8 +586,9 @@ hdmi: encoder@0 {
 						interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 						status = "disabled";
 						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
-							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
-						clock-names = "fck", "sys_clk";
+							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>,
+							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 11>;
+						clock-names = "fck", "sys_clk", "cec";
 						dmas = <&sdma 76>;
 						dma-names = "audio_tx";
 					};
-- 
2.30.2

