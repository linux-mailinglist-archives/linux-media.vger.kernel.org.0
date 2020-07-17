Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93632223C8A
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgGQN0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:26:01 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44149 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgGQN0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:26:00 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8AE041C0017;
        Fri, 17 Jul 2020 13:25:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 10/13] dt-bindings: media: ov5640: Demote DVP required properties
Date:   Fri, 17 Jul 2020 15:28:56 +0200
Message-Id: <20200717132859.237120-11-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that properties have a default value assigned, do not mark them
as required anymore in the bindings documentation.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index 3c20cdd02f76..514f8150b52e 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -131,9 +131,6 @@ properties:
                 - remote-endpoint
                 - bus-type
                 - bus-width
-                - hsync-active
-                - vsync-active
-                - pclk-sample
 
     additionalProperties: false
 
-- 
2.27.0

