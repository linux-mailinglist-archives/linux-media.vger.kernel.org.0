Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB31392A53
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 11:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbhE0JPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 05:15:02 -0400
Received: from comms.puri.sm ([159.203.221.185]:58016 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235687AbhE0JOz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 05:14:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 98FD3E2054;
        Thu, 27 May 2021 02:12:52 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fcEdb5SdBQhx; Thu, 27 May 2021 02:12:47 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com
Cc:     kernel@puri.sm, paul.kocialkowski@bootlin.com, shawnx.tu@intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 1/4] dt-bindings: vendor-prefixes: Add SK Hynix Inc.
Date:   Thu, 27 May 2021 11:12:18 +0200
Message-Id: <20210527091221.3335998-2-martin.kepplinger@puri.sm>
In-Reply-To: <20210527091221.3335998-1-martin.kepplinger@puri.sm>
References: <20210527091221.3335998-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SK Hynix built the already supported hi556 sensor (and probably much
more). For more information, see https://www.skhynix.com/

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7043eaaba7d2..2844000c3edf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -503,6 +503,8 @@ patternProperties:
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

