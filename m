Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEB936762
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 00:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfFEWW7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 18:22:59 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:37802 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFEWW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 18:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559773376; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=vYXmQr/7cLomc7L2vWT2Hwyls4I65jEhBN+6anSml8Y=;
        b=HCuTRIjJLOASltCPPWDDUfBs6u5KN0r6LpRVIpDZrmpc7y67UFCZdJMfm/g/txjZ/wEJmD
        T+we2elfGngzcsIuXNrr6ZPv2wCu0cObxse9WOrVFGLe5fRKHl4YEzQY4Bkh9Who3GA+q7
        fbnSSdD6qk9kS59V0xeRVdLScn175Nw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/3] dt-bindings: display: Add GiantPlus GPM940B0 panel documentation
Date:   Thu,  6 Jun 2019 00:22:45 +0200
Message-Id: <20190605222247.25657-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GPM940B0 is a 3.0" 320x240 24-bit TFT LCD panel.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    v2: New patch
    
    v3: Add Rob's ack
    
    v4-v5: No change

 .../bindings/display/panel/giantplus,gpm940b0.txt    | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt

diff --git a/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt b/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt
new file mode 100644
index 000000000000..3dab52f92c26
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/giantplus,gpm940b0.txt
@@ -0,0 +1,12 @@
+GiantPlus 3.0" (320x240 pixels) 24-bit TFT LCD panel
+
+Required properties:
+- compatible: should be "giantplus,gpm940b0"
+- power-supply: as specified in the base binding
+
+Optional properties:
+- backlight: as specified in the base binding
+- enable-gpios: as specified in the base binding
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.21.0.593.g511ec345e18

