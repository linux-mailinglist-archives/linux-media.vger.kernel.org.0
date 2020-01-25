Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 483E6149505
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 12:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbgAYLEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jan 2020 06:04:05 -0500
Received: from mailoutvs35.siol.net ([185.57.226.226]:55176 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725996AbgAYLEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jan 2020 06:04:04 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 9ABF5520F58;
        Sat, 25 Jan 2020 12:04:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id eslvSnbMlTF3; Sat, 25 Jan 2020 12:04:02 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 571D3520F74;
        Sat, 25 Jan 2020 12:04:02 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 0B436520F58;
        Sat, 25 Jan 2020 12:04:00 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 1/5] dt-bindings: interconnect: sunxi: Add A64 MBUS compatible
Date:   Sat, 25 Jan 2020 12:03:49 +0100
Message-Id: <20200125110353.591658-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200125110353.591658-1-jernej.skrabec@siol.net>
References: <20200125110353.591658-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A64 contains MBUS controller. Add a compatible for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-=
a10-mbus.yaml b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun=
4i-a10-mbus.yaml
index 9370e64992dd..aa0738b4d534 100644
--- a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbu=
s.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbu=
s.yaml
@@ -30,6 +30,7 @@ properties:
     enum:
       - allwinner,sun5i-a13-mbus
       - allwinner,sun8i-h3-mbus
+      - allwinner,sun50i-a64-mbus
=20
   reg:
     maxItems: 1
--=20
2.25.0

