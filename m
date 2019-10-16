Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C1CD9A12
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 21:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436800AbfJPT2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 15:28:49 -0400
Received: from mailoutvs30.siol.net ([185.57.226.221]:46303 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732213AbfJPT2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 15:28:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id E6A7C52394A;
        Wed, 16 Oct 2019 21:28:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Shc-hf2GseIB; Wed, 16 Oct 2019 21:28:19 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 93F47522B23;
        Wed, 16 Oct 2019 21:28:19 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 314AD52394A;
        Wed, 16 Oct 2019 21:28:17 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: bus: sunxi: Add H3 MBUS compatible
Date:   Wed, 16 Oct 2019 21:28:02 +0200
Message-Id: <20191016192807.1278987-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016192807.1278987-1-jernej.skrabec@siol.net>
References: <20191016192807.1278987-1-jernej.skrabec@siol.net>
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

