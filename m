Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB8AE7B6670
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 12:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbjJCKbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 06:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbjJCKbP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 06:31:15 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4039B7
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 03:31:11 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5b9d:c703:a536:8d7b])
        by baptiste.telenet-ops.be with bizsmtp
        id tNX32A00N0Gl2EY01NX3wN; Tue, 03 Oct 2023 12:31:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qncfm-0057Jk-7h;
        Tue, 03 Oct 2023 12:31:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qncYR-00FiqG-Fa;
        Tue, 03 Oct 2023 12:23:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: media: renesas,vin: Fix field-even-active spelling
Date:   Tue,  3 Oct 2023 12:22:57 +0200
Message-Id: <c999eef0a14c8678f56eb698d27b2243e09afed4.1696328563.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

make dt_binding_check:

    field-active-even: missing type definition

The property is named "field-even-active", not "field-active-even".

Fixes: 3ab7801dfab998a2 ("media: dt-bindings: media: rcar-vin: Describe optional ep properties")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 324703bfb1bded3a..5539d0f8e74d2e82 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -95,7 +95,7 @@ properties:
               synchronization is selected.
             default: 1
 
-          field-active-even: true
+          field-even-active: true
 
           bus-width: true
 
@@ -144,7 +144,7 @@ properties:
                   synchronization is selected.
                 default: 1
 
-              field-active-even: true
+              field-even-active: true
 
               bus-width: true
 
-- 
2.34.1

