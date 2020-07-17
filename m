Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24ADD223C92
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgGQN0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:26:04 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42619 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgGQN0E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:26:04 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AB49C1C0019;
        Fri, 17 Jul 2020 13:26:01 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 13/13] dt-bindings: media: ov5640: Add myself as co-maintainer
Date:   Fri, 17 Jul 2020 15:28:59 +0200
Message-Id: <20200717132859.237120-14-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add myself as co-maintainer of the driver and the bindings
file.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 1 +
 MAINTAINERS                                             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index 514f8150b52e..e28ea471bc00 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -8,6 +8,7 @@ title: Omnivision OV5640 MIPI CSI-2 / parallel sensor
 
 maintainers:
   - Steve Longerbeam <slongerbeam@gmail.com>
+  - Jacopo Mondi <jacopo@jmondi.org>
 
 description: -|
   The OV5640 is a 5 megapixels image sensor capable of producing images in RGB,
diff --git a/MAINTAINERS b/MAINTAINERS
index fc2a2129d18e..b5dd706d072b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12601,6 +12601,7 @@ F:	drivers/media/i2c/ov2740.c
 
 OMNIVISION OV5640 SENSOR DRIVER
 M:	Steve Longerbeam <slongerbeam@gmail.com>
+M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.27.0

