Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67176DB65F
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 20:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438921AbfJQSht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 14:37:49 -0400
Received: from mailoutvs51.siol.net ([185.57.226.242]:37955 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2392671AbfJQSht (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 14:37:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 41C7D52524F;
        Thu, 17 Oct 2019 20:37:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 1ggt20MXl-1j; Thu, 17 Oct 2019 20:37:47 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id F074352544A;
        Thu, 17 Oct 2019 20:37:46 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id A496F52531B;
        Thu, 17 Oct 2019 20:37:44 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/6] dt-bindings: bus: sunxi: Add H3 MBUS compatible
Date:   Thu, 17 Oct 2019 20:37:33 +0200
Message-Id: <20191017183738.68069-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017183738.68069-1-jernej.skrabec@siol.net>
References: <20191017183738.68069-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner H3 SoC also contains MBUS controller.

Add compatible for it.

Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt b=
/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt
index 1464a4713553..2005bb486705 100644
--- a/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt
+++ b/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt
@@ -8,6 +8,7 @@ bus.
 Required properties:
  - compatible: Must be one of:
 	- allwinner,sun5i-a13-mbus
+	- allwinner,sun8i-h3-mbus
  - reg: Offset and length of the register set for the controller
  - clocks: phandle to the clock driving the controller
  - dma-ranges: See section 2.3.9 of the DeviceTree Specification
--=20
2.23.0

