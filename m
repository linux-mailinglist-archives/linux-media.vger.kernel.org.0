Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D20EE14950A
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 12:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbgAYLEM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jan 2020 06:04:12 -0500
Received: from mailoutvs44.siol.net ([185.57.226.235]:55250 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729100AbgAYLEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jan 2020 06:04:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 9038B520F7D;
        Sat, 25 Jan 2020 12:04:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id XfkHWhFhmaxZ; Sat, 25 Jan 2020 12:04:09 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 4E2CB520EEE;
        Sat, 25 Jan 2020 12:04:09 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 05D7B520F7D;
        Sat, 25 Jan 2020 12:04:07 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 4/5] media: dt-bindings: media: Add Allwinner A64 deinterlace compatible
Date:   Sat, 25 Jan 2020 12:03:52 +0100
Message-Id: <20200125110353.591658-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200125110353.591658-1-jernej.skrabec@siol.net>
References: <20200125110353.591658-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner A64 SoC also contains deinterlace core, compatible to H3.

Add compatible string for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../bindings/media/allwinner,sun8i-h3-deinterlace.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-d=
einterlace.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8i=
-h3-deinterlace.yaml
index 2e40f700e84f..8707df613f6c 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterl=
ace.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterl=
ace.yaml
@@ -17,7 +17,11 @@ description: |-
=20
 properties:
   compatible:
-    const: allwinner,sun8i-h3-deinterlace
+    oneOf:
+      - const: allwinner,sun8i-h3-deinterlace
+      - items:
+        - const: allwinner,sun50i-a64-deinterlace
+        - const: allwinner,sun8i-h3-deinterlace
=20
   reg:
     maxItems: 1
--=20
2.25.0

