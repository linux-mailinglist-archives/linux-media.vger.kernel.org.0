Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575A1267AE4
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 16:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgILOcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 10:32:03 -0400
Received: from gw.c-home.cz ([89.24.150.100]:33041 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgILObe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 10:31:34 -0400
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 08CEUtN4007223;
        Sat, 12 Sep 2020 16:31:02 +0200 (CEST)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 5/6] dt-bindings: media: cedrus: Add V3s compatible
Date:   Sat, 12 Sep 2020 16:30:51 +0200
Message-Id: <20200912143052.30952-6-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200912143052.30952-1-m.cerveny@computer.org>
References: <20200912143052.30952-1-m.cerveny@computer.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner V3s SoC contains video engine. Add compatible for it.

Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
---
 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 4cc1a670c986..08515c18cbb7 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -18,6 +18,7 @@ properties:
       - allwinner,sun7i-a20-video-engine
       - allwinner,sun8i-a33-video-engine
       - allwinner,sun8i-h3-video-engine
+      - allwinner,sun8i-v3s-video-engine
       - allwinner,sun50i-a64-video-engine
       - allwinner,sun50i-h5-video-engine
       - allwinner,sun50i-h6-video-engine
-- 
2.17.1

