Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30BA72CA8C7
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390709AbgLAQuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:50:37 -0500
Received: from retiisi.eu ([95.216.213.190]:50074 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387673AbgLAQuh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 11:50:37 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id AEBBF634CCD;
        Tue,  1 Dec 2020 18:45:14 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 29/30] dt-bindings: mipi,ccs: Add vcore and vio supplies
Date:   Tue,  1 Dec 2020 18:42:45 +0200
Message-Id: <20201201164246.18003-30-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Vcore and vio supplies are also part of the spec and used by many sensors.
Do not specify the voltages as they are generally sensor dependent.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index 51426a950414..d94bd67ccea1 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -40,6 +40,14 @@ properties:
     description: Analogue voltage supply (VANA), sensor dependent.
     maxItems: 1
 
+  vcore-supply:
+    description: Core voltage supply (VCore), sensor dependent.
+    maxItems: 1
+
+  vio-supply:
+    description: I/O voltage supply (VIO), sensor dependent.
+    maxItems: 1
+
   clocks:
     description: External clock to the sensor.
     maxItems: 1
-- 
2.27.0

