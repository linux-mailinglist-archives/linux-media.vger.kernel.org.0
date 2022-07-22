Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027D057E23B
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 15:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbiGVNUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 09:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234583AbiGVNUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 09:20:00 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C64A0B84;
        Fri, 22 Jul 2022 06:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495999; x=1690031999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZEpBns6FBLrwGth9N0WA8nJfnM4oXu/eo0E3+I9z84=;
  b=dH/IBolaeR/8zZ274+TsW5bw84lbH4JWJFGRF9V46BC8hj7FL6tkKUi+
   vi4bPNrqD4+aEPYG/EGcvE3OchIhqH/j1kWu+OQSPx/doeLkbHiMUgfT5
   dJXYvdSntjtDZ54Lt3MdWgT+osmZKH1gqjpnsQ/EWdQqZzJaIIn9cYT9O
   m9gtPM0TL/hiNxM5mXhNdkqupGCoQcb5FvMQ+4DgdtOeccK2ETTR+PDpb
   t6iTAcMqK0PytTmKHpD/P15fuiV9aAwYBpr4KhN3QiZMOj0+JgIBPCLkU
   zkQnh6N/D/U4qWNxFRucGBHscyaMb4r3YMq7F3F4xkj58hnr3Xb8KKqie
   g==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212306"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jul 2022 15:19:53 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 22 Jul 2022 15:19:53 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 22 Jul 2022 15:19:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495993; x=1690031993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZEpBns6FBLrwGth9N0WA8nJfnM4oXu/eo0E3+I9z84=;
  b=QWkRifcYxQF7WPfqLo4WVGAvByMFJXSqO4qdigMcoV8BUtV0lOkhtb5K
   MO9AkG850NC35E3fjfFFUIRHBFNXvIfCB0b8nBPoa4CwAn5cidU+uewRp
   ES6JkFBZPZPGx/hgfhZWjQMrqRKydIHjfYh91aR6VnNuuvfjeIPCzH5EL
   DHP0DcIoysQUtaucbqTqbiIHBtYPAzwA4zcU8E3yzddOPhndpi2H0uT79
   PzxxAehFuA1A0OOLSCGeNK6Iq6c2SLPJfiEuXlgoD4kwevD466jgWw2AJ
   vzOneqgkQXgFb9xI/RXCi5V7+OiW/VmG2a6W0PtGjjbKwecqx84BQ7hJS
   A==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212305"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 15:19:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BFD78280056;
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
Subject: [PATCH v3 4/7] media: dt-bindings: media: ov9282: Add power supply properties
Date:   Fri, 22 Jul 2022 15:19:44 +0200
Message-Id: <20220722131947.2456988-5-alexander.stein@ew.tq-group.com>
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

