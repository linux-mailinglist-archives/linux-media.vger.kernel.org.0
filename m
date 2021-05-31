Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1B12395A11
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 14:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhEaMJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 08:09:47 -0400
Received: from comms.puri.sm ([159.203.221.185]:33340 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231463AbhEaMJk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 08:09:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 80101E2132;
        Mon, 31 May 2021 05:08:00 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id McuI3xngKWps; Mon, 31 May 2021 05:07:59 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     pavel@ucw.cz, krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, robh@kernel.org, shawnx.tu@intel.com
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        martin.kepplinger@puri.sm, phone-devel@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add SK Hynix Inc.
Date:   Mon, 31 May 2021 14:07:33 +0200
Message-Id: <20210531120737.168496-2-martin.kepplinger@puri.sm>
In-Reply-To: <20210531120737.168496-1-martin.kepplinger@puri.sm>
References: <20210531120737.168496-1-martin.kepplinger@puri.sm>
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
index b868cefc7c55..a75cd3be50b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -499,6 +499,8 @@ patternProperties:
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

