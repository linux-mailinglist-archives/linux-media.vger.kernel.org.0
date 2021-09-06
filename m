Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06194019D8
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 12:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241988AbhIFKaq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 06:30:46 -0400
Received: from comms.puri.sm ([159.203.221.185]:55572 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241961AbhIFKap (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Sep 2021 06:30:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 86065DFE44;
        Mon,  6 Sep 2021 03:29:11 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id c9hrnDSOxxuQ; Mon,  6 Sep 2021 03:29:06 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     pavel@ucw.cz, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, martin.kepplinger@puri.sm,
        paul.kocialkowski@bootlin.com, phone-devel@vger.kernel.org,
        robh@kernel.org, shawnx.tu@intel.com
Subject: [PATCH v9 1/4] dt-bindings: vendor-prefixes: Add SK Hynix Inc.
Date:   Mon,  6 Sep 2021 12:28:34 +0200
Message-Id: <20210906102837.2190387-2-martin.kepplinger@puri.sm>
In-Reply-To: <20210906102837.2190387-1-martin.kepplinger@puri.sm>
References: <20210906102837.2190387-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SK Hynix built the already supported hi556 sensor (and probably much
more). For more information, see https://www.skhynix.com/

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..952553759ac4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -509,6 +509,8 @@ patternProperties:
     description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
+  "^hynix,.*":
+    description: SK Hynix Inc.
   "^hyundai,.*":
     description: Hyundai Technology
   "^i2se,.*":
-- 
2.30.2

