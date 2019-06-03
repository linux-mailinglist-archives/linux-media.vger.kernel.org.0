Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B537632EB4
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 13:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbfFCLc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 07:32:57 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:32843 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbfFCLc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 07:32:57 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 87EB220007;
        Mon,  3 Jun 2019 11:32:52 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH] media: dt-bindings: Fix vendor-prefixes YAML
Date:   Mon,  3 Jun 2019 13:32:50 +0200
Message-Id: <20190603113250.4115-1-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 8df39e16877f ("media: dt-bindings: media: Add vendor prefix for
allegro") introduced a new devicetree binding vendors, however with an
improper syntax making the resulting YAML impossible to parse. Let's fix
this.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Michael Tretter <m.tretter@pengutronix.de>
Fixes: 8df39e16877f ("media: dt-bindings: media: Add vendor prefix for allegro")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index cb983eee4576..432bababc9bf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -49,7 +49,7 @@ patternProperties:
     description: Aeroflex Gaisler AB
   "^al,.*":
     description: Annapurna Labs
-  "^allegro,.*"
+  "^allegro,.*":
     description: Allegro DVT
   "^allo,.*":
     description: Allo.com
-- 
2.21.0

