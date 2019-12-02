Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4702310F1B2
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 21:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfLBUsO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 15:48:14 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:53788 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbfLBUsM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Dec 2019 15:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ftxaSa1kZj6gyR+dJGAOeMuiPcXYl1sXEdyUm55wgHI=; b=YLXdUbXFVi70PLxky5vX7HfYP/
        x7AJQFlUs0aO9NhsfbnwAncow5XdoFKVoNv1XL92So5uz1Xop8kJjch4Vkb26dN7djdg7Q6S930TD
        Ht47YMMCdmUVxA7qxqaF11DMT2g+TOeTSa4psnDsfHniGoW1Id2F2mvkBUbVc25SCc74=;
Received: from p200300ccff066f001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff06:6f00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ibsc4-0007qB-CD; Mon, 02 Dec 2019 21:48:08 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1ibsc4-0001lE-1z; Mon, 02 Dec 2019 21:48:08 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 2/2] ARM: dts: imx6sll: add PXP module
Date:   Mon,  2 Dec 2019 21:47:48 +0100
Message-Id: <20191202204748.6718-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202204748.6718-1-andreas@kemnade.info>
References: <20191202204748.6718-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the EPDC is optional, both consumer and industrial editions
have the PXP module, so adding it to the corresponding .dtsi
Information taken from freescale kernel, compared with the
reference manual and tested by a separate program.

Since it does not depend on external wiring, the
status = "disabled" is left out here.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/imx6sll.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
index 13c7ba7fa6bc..10cf5f3b4865 100644
--- a/arch/arm/boot/dts/imx6sll.dtsi
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -632,6 +632,15 @@
 				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx6q.bin";
 			};
 
+			pxp: pxp@20f0000 {
+				compatible = "fsl,imx6sll-pxp", "fsl,imx6ull-pxp";
+				reg = <0x20f0000 0x4000>;
+				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_PXP>;
+				clock-names = "axi";
+			};
+
 			lcdif: lcd-controller@20f8000 {
 				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
-- 
2.20.1

