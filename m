Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80B02F7672
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 11:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbhAOKRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 05:17:22 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:34569 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728794AbhAOKRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 05:17:21 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A241720010;
        Fri, 15 Jan 2021 10:16:38 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: media: ov5647: Fix filename
Date:   Fri, 15 Jan 2021 11:16:52 +0100
Message-Id: <20210115101652.9275-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 1b5071af8240 ("media: dt-bindings: media: i2c: Rename
ov5647.yaml") renamed the bindings file but did not update the
Id: field there.

Fix it by using the new filename.

Fixes: 1b5071af8240 ("media: dt-bindings: media: i2c: Rename ov5647.yaml")
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
index 280c62afae13..429566c9ee1d 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/ov5647.yaml#
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov5647.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#

 title: Omnivision OV5647 raw image sensor
--
2.29.2

