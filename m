Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3A26333A9
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 17:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfFCPfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 11:35:21 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:58182 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfFCPfV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 11:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559576118; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=auqQoAWu6HJcQ9dAYh3x5JeoeNLaZ4+0Q+ur1G1yukU=;
        b=Xtv5XN9Vkv9B9Pb+eYYLPZ+956M049bKb78736GBz+ijiKqW29jCgbXNJbzjySfl9Yjnmg
        kcoFkjzSGBtA4f2qqagR4TAczQq9gJYzv77J/TYUcIdSqZmQ1yWexvSIMQ1vQtfzA9MDTB
        pFJgCyGSeOMR14zWntENnYodNq7z3UA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hansverk@cisco.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: display: Add GiantPlus GPM940B0 panel documentation
Date:   Mon,  3 Jun 2019 17:35:09 +0200
Message-Id: <20190603153511.24384-1-paul@crapouillou.net>
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
    
    v4: No change

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

