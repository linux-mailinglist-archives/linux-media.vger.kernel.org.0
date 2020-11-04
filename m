Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD522A61BC
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgKDKgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:36:44 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:46035 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgKDKgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:36:44 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7B0D72000C;
        Wed,  4 Nov 2020 10:36:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v2 01/30] dt-bindings: media: i2c: Rename ov5647.yaml
Date:   Wed,  4 Nov 2020 11:35:53 +0100
Message-Id: <20201104103622.595908-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104103622.595908-1-jacopo@jmondi.org>
References: <20201104103622.595908-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename 'ov5647.yaml' as 'ovti,ov5647.yaml' and update the
MAINTAINERS file entry accordingly.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml}        | 0
 MAINTAINERS                                                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml} (100%)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov5647.yaml
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
diff --git a/MAINTAINERS b/MAINTAINERS
index 98e70d7bb4638..8019e3252c1f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12927,7 +12927,7 @@ M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
 F:	drivers/media/i2c/ov5647.c
 
 OMNIVISION OV5670 SENSOR DRIVER
-- 
2.29.1

