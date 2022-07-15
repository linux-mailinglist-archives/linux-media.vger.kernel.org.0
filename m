Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A071C575CBF
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 09:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbiGOHtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 03:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiGOHtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 03:49:08 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720C4248F1;
        Fri, 15 Jul 2022 00:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871347; x=1689407347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KaEDJVU3uZqRPoVDhl+O6jtIVNEtEGZ+mLxj2kIA+XQ=;
  b=ZtOcCrX7VqgClptEcrxh1px1NNJpttA+DBvLJsPuE8d/fIZtxbcRiqgJ
   DruRwF+W6QfBHeoOrL+uwjc+sHiVfv39ZzhYGCuwTtmzByMfLoLgZKgn6
   hnFkqqFnqhVOM2xcx6CMh1+HeH9+9dxS1qedVZcOb6X6m33b3H70WoVjq
   AVWskCq0WK/xDZOrKYfCx6UZ8+kaXRbN2JtJAkq44f8GLGgTYiCbUs4Qd
   8EgEgVb99k5sUNYPmeknxdZBRBROko4St6TsObKpe7oFrtBbTFFxxowsM
   rwis1noLvCNG8AWWxojcN+kVZtUONJkpoqY99ocEJ7HxqCo5hg6RkTSWB
   g==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069084"
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
  bh=KaEDJVU3uZqRPoVDhl+O6jtIVNEtEGZ+mLxj2kIA+XQ=;
  b=fiO1FdwRtBAzRZSqCAZsncbTKZPD3qFG/YgOMISpOo0VSB0bbQr5XPbG
   4p8+lw7K04/A+yODwxo085TA+unKD31L/zra/fkr4R8qKfxD4fyRHF54m
   CaktlUpX9VhhmSRdrIRpLRrLvO3wO0p7RPw2Dnli/MiuG9Jghw0/tHgFP
   npWDCMLAielWaUXallP7NN2bpvk354+CGfYdYBX7mn/xZTs6IjdLXUPW8
   xo8m9wW/dy/6af05DvubM82mFHOCgva0OBX16Pdhb+h4wVdncPyEumPmw
   y29g6cs157W+6vyQ3irRR3AAMBm7phmltoVnLRgHVAQrkzC07M3BO6CtG
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069083"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:49:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3902F280056;
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
Subject: [PATCH v2 2/6] media: dt-bindings: media: Add compatible for ov9281
Date:   Fri, 15 Jul 2022 09:48:54 +0200
Message-Id: <20220715074858.875808-3-alexander.stein@ew.tq-group.com>
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

