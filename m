Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E54054D468
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 00:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350553AbiFOWOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 18:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350178AbiFOWOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 18:14:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABDB562E7;
        Wed, 15 Jun 2022 15:14:30 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 913511354;
        Thu, 16 Jun 2022 00:14:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655331269;
        bh=WUCF7s+BlwIqIfc9hYLLfbsvWKEkAwsfGc0cNn3ceHg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FL6DP2vw4qXA7p0OZFrSzijnQdCz3TkEkvQVxT/kj27iZfAsx3MmZxThRkZ2imLGD
         Fh0KfxIg91ZfqWl3n0Je4pQn00QvEhwZCmIR9yGpH4F40vwrXaX1mjaaF3adoI4Ou6
         XooP52HJg18ne/ZE9np2IJB7FVsSXlqWXpw4vUOk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v3 3/6] ARM: dts: freescale: Use new media bus type macros
Date:   Thu, 16 Jun 2022 01:14:07 +0300
Message-Id: <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that a header exists with macros for the media interface bus-type
values, replace hardcoding numerical constants with the corresponding
macros in the DT sources.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
index 1a18c41ce385..d98111f2100f 100644
--- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
@@ -2,6 +2,8 @@
 //
 // Copyright (C) 2015 Freescale Semiconductor, Inc.
 
+#include <dt-bindings/media/video-interfaces.h>
+
 / {
 	chosen {
 		stdout-path = &uart1;
@@ -170,7 +172,7 @@ &csi {
 	port {
 		parallel_from_ov5640: endpoint {
 			remote-endpoint = <&ov5640_to_parallel>;
-			bus-type = <5>; /* Parallel bus */
+			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 		};
 	};
 };
-- 
Regards,

Laurent Pinchart

