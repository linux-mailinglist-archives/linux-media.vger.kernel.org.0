Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81B27BB7ED
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 14:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbjJFMlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 08:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbjJFMle (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 08:41:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E93D6;
        Fri,  6 Oct 2023 05:41:32 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F5942D5F;
        Fri,  6 Oct 2023 14:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696595982;
        bh=xMgsdB8DjiLJT7DlVPj0fGQno1Ep0QfuKUTRw6WAVXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UunxYFlGAidrMiYj32vg6hbBszOoUa+IXIwCjlb0us7BYKucsRi7qXPA6wi7nFCdX
         HRQJymfyflpEuBR1bq/X7s6671ffNwRHCZTgweca/XlFvzJA+JXzrMkPCX1ciKY4YA
         vYGtSXAkqiu6Q5i2ofpuMuWDRYTf1PyS66+ams+A=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 4/6] media: dt-bindings: ovti,ov5640: Allow props from video-interface-devices
Date:   Fri,  6 Oct 2023 14:40:59 +0200
Message-ID: <20231006124101.181555-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006124101.181555-1-jacopo.mondi@ideasonboard.com>
References: <20231006124101.181555-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no reason to restrict the allowed rotation degrees to 0 and 180,
as the sensor can be mounted with any rotation.

Also, as all the properties described by video-interface-devices.yaml are
allowed for the image sensor, make them accepted by changing
"additionalProperties: false" to "unevaluatedProperties: false" at the
schema top-level.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/ovti,ov5640.yaml         | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
index a621032f9bd0..2c5e69356658 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
@@ -44,11 +44,6 @@ properties:
     description: >
       Reference to the GPIO connected to the reset pin, if any.

-  rotation:
-    enum:
-      - 0
-      - 180
-
   port:
     description: Digital Output Port
     $ref: /schemas/graph.yaml#/$defs/port-base
@@ -85,7 +80,7 @@ required:
   - DOVDD-supply
   - port

-additionalProperties: false
+unevaluatedProperties: false

 examples:
   - |
--
2.42.0

