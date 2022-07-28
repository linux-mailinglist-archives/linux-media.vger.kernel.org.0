Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E12E583F80
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238854AbiG1NCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238516AbiG1NCv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:02:51 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE33402DD;
        Thu, 28 Jul 2022 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013370; x=1690549370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZEpBns6FBLrwGth9N0WA8nJfnM4oXu/eo0E3+I9z84=;
  b=G/2mPJJMGUqf/aMpvnAXMDeJ1dOU81mnhkH0/F3XYyBur169MrOZCJrg
   mTNIUDzxr7KZMQUSxFqOWyysU/5AcItVEq4tN5I2/SG+g9Ba+eve0OhX1
   b9fse2uAuC6FJo7ihqBBdehYvpIciWiwsqzfp7MzQisUMdOh2wjZ8Azf2
   Bmuf4xTKuCnOEXD6j92Nv/wmhfDHv7fRmMcfuvl/AuvaU0ls4dPrpc1rk
   jHy8uazfsBDPlekSjfthdg76dPWpMPb5CJu7VVS7gZqcYPDuolVTdrXfu
   86Tb1VGoZeoRMRGNdQlAVRYAuNtLwI9v15T19KG+pcyuIdcsbb1iPoqUv
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321371"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 15:02:44 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 15:02:44 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 15:02:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013364; x=1690549364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZEpBns6FBLrwGth9N0WA8nJfnM4oXu/eo0E3+I9z84=;
  b=iUubRkMrhHF5+nUgCtuNwnMYmEf5HYrNKrkwfATbYGPWs9eRzK9rotJk
   XrDWP+iU8Q0wnfhTaY6PVzA/x6/7eWCr8x/Q00q4SWIOTF3P1ABUc9zN9
   GQT43Y3ETCQBrKCKnOMLCWuc0IeyFgrEFRyTTsGdeRZMG9jDf5Q+L1RFX
   Z+McO42spPX4OWL2gSqFZZlT5/L/PmPpV5Z6I7GdZSKSNviLTvs9EUPuu
   c4E2MS+OYW/yhPyy3o+NtNQEIvZpyxvq9lYWrnoJmLq8ERAXyfwSXYK90
   4JJAOlvmqlyyemsZMOSOvM1pyvDE4sZAgSKbKeuacckRRMJokjFEnra55
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321370"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 15:02:44 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DD4D3280073;
        Thu, 28 Jul 2022 15:02:43 +0200 (CEST)
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
Subject: [PATCH v4 4/7] media: dt-bindings: media: ov9282: Add power supply properties
Date:   Thu, 28 Jul 2022 15:02:34 +0200
Message-Id: <20220728130237.3396663-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
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

