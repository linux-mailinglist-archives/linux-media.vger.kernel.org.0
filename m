Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86770583F7B
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238596AbiG1NCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238516AbiG1NCt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:02:49 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E763CBF2;
        Thu, 28 Jul 2022 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013368; x=1690549368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KaEDJVU3uZqRPoVDhl+O6jtIVNEtEGZ+mLxj2kIA+XQ=;
  b=dY9HFuIVzJWbwzFe3hRbunEy3ec3NAu6iNL5gyGp2HEmETH+YZOgfSFG
   dy5MrGtlSL8xjBjV7G8ScHSx3KojusK+8XT17UnUfUaKVsH3GitisUHRx
   pXPViAoZGi/46oaQb/JYd2TGYZFa8D5D6COYmKA1/4FZ53U4QFthPp/j6
   DG3BPBAIJ2tlVuhPREo8aHHdAWVVZPrvYWY/mlM8DtNt1AqiLjD4bRDUg
   oUDy7TCzxsj7cGlEDwHrUblU31/2i5BvWqD+6pvY5E369pb4rP4Onhivx
   Hls2qlJHwF6LPEjIiGjqVGCOg8nsZy1p720rGQLALq7nUc77A7nPa7KGk
   w==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321367"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 15:02:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 15:02:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 15:02:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013363; x=1690549363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KaEDJVU3uZqRPoVDhl+O6jtIVNEtEGZ+mLxj2kIA+XQ=;
  b=G9vZUAme1fd/v6Wlu+BrZr0/uPMbGhGoavwo2o4ka9S0gR5bM4nxsrFA
   AXO203YZGCffYKh4B/T7Y9WVr94PA7tb1xogNkXqnhCYrbUBe/rTmsHxK
   Gaci34gl19QvQnGJWiwDwNPSNpOpENqHpgBC/QlKJClOGbrF8m8Brofqt
   zbglVxkpNDfod4YOxfmKR7gRsHSX+wl6L5pORgA19pfHZofBB3NHfXlBl
   MACKrkJMG1UbWxCl3tvc/2gr/PsmqfPDgBaKn2B1C7I+/kJ86dOjZP9nD
   EH6NQ4wB+UHcJHOqOByU4i8Q9yRsUxRV/zv2Rt/KcgvSjk0USYw8t6mfP
   w==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321366"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 15:02:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 80635280056;
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
Subject: [PATCH v4 2/7] media: dt-bindings: media: Add compatible for ov9281
Date:   Thu, 28 Jul 2022 15:02:32 +0200
Message-Id: <20220728130237.3396663-3-alexander.stein@ew.tq-group.com>
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

