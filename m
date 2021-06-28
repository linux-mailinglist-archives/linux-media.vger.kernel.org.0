Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1404A3B5C37
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 12:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbhF1KOU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 06:14:20 -0400
Received: from comms.puri.sm ([159.203.221.185]:37572 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232790AbhF1KON (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 06:14:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 32480E015D;
        Mon, 28 Jun 2021 03:11:18 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id NtcHRdBv2Sss; Mon, 28 Jun 2021 03:11:17 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: [PATCH v6 1/5] dt-bindings: vendor-prefixes: Add SK Hynix Inc.
Date:   Mon, 28 Jun 2021 12:10:50 +0200
Message-Id: <20210628101054.828579-2-martin.kepplinger@puri.sm>
In-Reply-To: <20210628101054.828579-1-martin.kepplinger@puri.sm>
References: <20210628101054.828579-1-martin.kepplinger@puri.sm>
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
index 07fb0d25fc15..b108e8f8f223 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -505,6 +505,8 @@ patternProperties:
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

