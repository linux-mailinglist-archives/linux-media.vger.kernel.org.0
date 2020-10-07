Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76095285AC5
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgJGIpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbgJGIpM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:45:12 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C1AC0613D4;
        Wed,  7 Oct 2020 01:45:11 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1E103634C92;
        Wed,  7 Oct 2020 11:44:25 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 053/106] dt-bindings: mipi,ccs: Don't mention vana voltage
Date:   Wed,  7 Oct 2020 11:45:04 +0300
Message-Id: <20201007084505.25761-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It was mentioned vana voltage is typically 2,8 volts. This is truly sensor
dependent, and nowadays 2,8 volts is a lot.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index b641debcd6a2..c52b603d946c 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -37,8 +37,7 @@ properties:
     maxItems: 1
 
   vana-supply:
-    description: Analogue voltage supply (VANA), typically 2,8 volts (sensor
-      dependent).
+    description: Analogue voltage supply (VANA), sensor dependent.
     maxItems: 1
 
   clocks:
-- 
2.27.0

