Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0463557E232
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 15:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234826AbiGVNUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 09:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234583AbiGVNT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 09:19:58 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6F7A0B89;
        Fri, 22 Jul 2022 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495998; x=1690031998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KaEDJVU3uZqRPoVDhl+O6jtIVNEtEGZ+mLxj2kIA+XQ=;
  b=CgE1nCZVHTnnpLLgCaA2uwkp+Txs+yYWrVM5pgToI9u4hEsapwAQCtRX
   G+jdlG+qCxYk0PAPMhJhAzfQmX2oAMDJLvwPY2vJdk1UqftLSBjaILt9V
   U41GgEYCP2aG1Cdz6JuMKf2VmsIi6q/PpQes385KPL0/axWuHArdqXIrP
   Dkk4QtGi5ZpTy8zILR9pNnrGvQ+fktUbFPEvfv7mRuwNrWYAXcCt4JMY6
   bWvZcwV7QUgvP0xtod/sdXz4yfS6AE+3FMNgEv+jsnUJlds5WomKDGI2X
   rka0iQRQ1DTCs3FUIVsjbXjkw2vW/gSI+4+YslU3VMJFBlKyt4G9HGKXk
   A==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212302"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jul 2022 15:19:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 22 Jul 2022 15:19:52 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 22 Jul 2022 15:19:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495992; x=1690031992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KaEDJVU3uZqRPoVDhl+O6jtIVNEtEGZ+mLxj2kIA+XQ=;
  b=JDZbJsvu1GE+LMN2MZRtqlYNS7A8XO18er8K41Jrj30O/S83sgIgZx8F
   gpXtHmIF6/+HNH67R7ctn8cHNCW8aa36cbL6hAbzBhPSImX+AtwCfvY9j
   wdKbaOAFO1ikKutUnInqjOYqRF/bBbrD1zYIr7ROz+zTjylXsRHNPIr+W
   DUZNyuWM5rD6EPiwZytGljvRcMYKytdvXOoNLhoYBolbNPToePg1XVP5v
   XBNQrDEpM1s37TbaYp6kr647pY20awMMlsBhd3xVRaBDir/HqFUpHMZBy
   mjdJonE1Qh6rADsdw+Kjjd6hYXCcVXnH5RCcyy63lc0RKyHt0QQ1n/ke1
   g==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212301"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 15:19:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 59C1E280056;
        Fri, 22 Jul 2022 15:19:52 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/7] media: dt-bindings: media: Add compatible for ov9281
Date:   Fri, 22 Jul 2022 15:19:42 +0200
Message-Id: <20220722131947.2456988-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722131947.2456988-1-alexander.stein@ew.tq-group.com>
References: <20220722131947.2456988-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a slightly different hardware with identical software interface.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index bf115ab9d926..285f8c85f253 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -16,10 +16,13 @@ description:
   sensor with an active array size of 1296H x 816V. It is programmable through
   I2C interface. The I2C client address is fixed to 0x60/0x70 as per sensor data
   sheet. Image data is sent through MIPI CSI-2.
+  OV9281 has a different lens chief ray angle.
 
 properties:
   compatible:
-    const: ovti,ov9282
+    enum:
+      - ovti,ov9281
+      - ovti,ov9282
   reg:
     description: I2C address
     maxItems: 1
-- 
2.25.1

