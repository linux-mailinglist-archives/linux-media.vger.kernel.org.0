Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F905223C72
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgGQNZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:25:43 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:48595 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgGQNZm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:25:42 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9E6AF1C0011;
        Fri, 17 Jul 2020 13:25:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 03/13] dt-bindings: media: ov5640: Do not limit rotation
Date:   Fri, 17 Jul 2020 15:28:49 +0200
Message-Id: <20200717132859.237120-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 'rotation' property should not be limited to only support 0 and
180 degrees, as that limitation comes from the driver implementation
and not from any device specific constraint.

Remove the enumeration of supported values from 'rotation'.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index ceeacc91c801..503f8b78615c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -55,7 +55,7 @@ properties:
   rotation:
     description: |
       As defined in Documentation/devicetree/bindings/media/video-interfaces.txt
-    enum: [0, 180]
+    maxItems: 1
 
   port:
     type: object
-- 
2.27.0

