Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C9D1FF33C
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 15:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbgFRNhm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 09:37:42 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:47489 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgFRNhl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 09:37:41 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4F89624000E;
        Thu, 18 Jun 2020 13:37:38 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: [PATCH 2/2] dt-bindings: media: i2c: Document 'remote-endpoint'
Date:   Thu, 18 Jun 2020 15:40:45 +0200
Message-Id: <20200618134045.151532-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618134045.151532-1-jacopo@jmondi.org>
References: <20200618134045.151532-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the 'remote-endpoint' property and add it to the list of required
endpoint properties in imx219 and ov8856 dt-schema binding files.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 5 +++++
 Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index dfc4d29a4f04c..0251e15fe0a72 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -71,8 +71,13 @@ properties:
             description:
               Allowed data bus frequencies.
 
+          remote-endpoint:
+            description: |-
+              phandle to the video receiver input port
+
         required:
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
index 1956b2a32bf43..c1f363bb5aee9 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -84,9 +84,14 @@ properties:
               Allowed data bus frequencies. 360000000, 180000000 Hz or both
               are supported by the driver.
 
+          remote-endpoint:
+            description: |-
+              phandle to the video receiver input port
+
 
         required:
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
-- 
2.27.0

