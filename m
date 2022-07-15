Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F36F575CB7
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 09:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiGOHtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 03:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbiGOHtJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 03:49:09 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DD62559B;
        Fri, 15 Jul 2022 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871349; x=1689407349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZEpBns6FBLrwGth9N0WA8nJfnM4oXu/eo0E3+I9z84=;
  b=kvL9V2KUGtbgBN+LYP+CxGadQF35I2yBi1lsrBFXiyIhS+6B905h+69k
   ScdwdzcV6pTSCqGY9Yj6hXZ8jrjo8S7mtquRwGadfZaY/ZlRaUJKH8kvU
   Q0r3MUp7UdqqKc8qQV4yHT6JfvC+WQttj0oFTTA90IjEXgpxzhhBhECny
   7wZKK9JGRGW7cLmpBYVtPJ7BFdni/eV7pK+lrZeieg5nJn4OCCbS4IIap
   Y1/tEN4PfbZPaUAoqE6Ya5abfHOzFy9bgMMWdTUubZMmMtpbKtZeJ+UP8
   7pKsdsmZdjcTFvip50Isgto8rV/SRycj6Crgq0PrvvDkiHlCIJFWh214B
   g==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069088"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Jul 2022 09:49:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 15 Jul 2022 09:49:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 15 Jul 2022 09:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871344; x=1689407344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZEpBns6FBLrwGth9N0WA8nJfnM4oXu/eo0E3+I9z84=;
  b=N4+lY7Nawe0joOSFwvNgdtn4aRs2phgLKFamqn0wxWYQsoWghra1Z4Ps
   YK35Vq+n+uZNyPv46cjmAEtU6SwD8x3b9z8REoxl2kkAFhf07Qr3zMHyK
   EU14xeLBHB5s7P3l0dlWQCTaBLf3f45qkRdaRw4cW+w/JoDnvJDHDLpgZ
   AzE9cnYQe9kQtJn7iSTDI0stl+f9agS38KnpbuAfr/4fUMWvm2f9cBhXk
   gXFLvKHdWn1poUoGtfD09AVpmKqp8N+VProlpSNNUwa6rJP1xVvOn3xgi
   fma5N7WhW5XZyp8vfiKhYdeqU9yQ4Raarl2Tnju2dSRwRAMRKDNNbctWx
   g==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069087"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:49:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 999EE280056;
        Fri, 15 Jul 2022 09:49:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/6] media: dt-bindings: media: ov9282: Add power supply properties
Date:   Fri, 15 Jul 2022 09:48:56 +0200
Message-Id: <20220715074858.875808-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add regulators for each power domain.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index 285f8c85f253..9abfaabd373a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -39,6 +39,15 @@ properties:
     description: Reference to the GPIO connected to the XCLR pin, if any.
     maxItems: 1
 
+  avdd-supply:
+    description: Analog power supply
+
+  dovdd-supply:
+    description: Digital I/O power supply
+
+  dvdd-supply:
+    description: Digital core supply
+
   port:
     additionalProperties: false
     $ref: /schemas/graph.yaml#/$defs/port-base
-- 
2.25.1

