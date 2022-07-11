Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E4456D7A2
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 10:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbiGKIRA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 04:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiGKIQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 04:16:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5251E3E4;
        Mon, 11 Jul 2022 01:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527409; x=1689063409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YDQE92GOuvRF1sa7iDiI0MVkyNA4McNXNdcJVdHctLQ=;
  b=jP0iLgf71ZH/+8AC1Tvofjmhnes8OzU90ukJJ6GWKZGu8RDPP+MCFP8J
   oo7dQ6arUTejBzSYDu4w/AF6GM+g9pZ25hhUu/KDb4d/abfzL8GoZan7M
   JVnAa3cp5vLM70rxnepBvo+i7svonbw3stt1ZI4y1vGFt4BLa5i6ptQZ1
   mARreKghboJ4o5G475S03SrbeqWidqJqxA13GcNLFbTyrrypIehUs8yJm
   ST6IbSrFGDEL/v9dOdwx9zu0/lCjKFB92Amp2TVQeXXSPFw2fAfuDAFfy
   OH+e+IGtR5NCCWR61H3y3xvaYFQA9hkW40zEMZy8eRg+nQyRXwXQGw1ED
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967072"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Jul 2022 10:16:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Jul 2022 10:16:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 11 Jul 2022 10:16:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527403; x=1689063403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YDQE92GOuvRF1sa7iDiI0MVkyNA4McNXNdcJVdHctLQ=;
  b=pvz1VeEQQQFuKrnSMiwOTcY+a7HyI1EBeT30rPtf9BiBVTh8PGWgjdsx
   fin23zlvEwN/vZXmI2IfzNyp0w5DKCNpd//Ei4n8es3k0/qGW/3EPkIjB
   Rk2WrXFN8Fy2yQ3yP6W9kp76EfuTxSHGmZ7Imczm3QLWRHwZMcI7okdDe
   mEfwec3/Vjg+SpgUj6W2hy2YQJ8lsBMhenvW8g6YvPi8SsG0ZrU+9NDj1
   vNIs9oWp5GCLiv8S3vsiM6wZdDtfYnmhsXhrvkDsPJSg8xO1fmD8j6xrK
   FXurmS5ZmmTTuuhbPRRyrW6K7DYA2Glzr/AWmsuOQdvwQucv/9CcZoeYn
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967071"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Jul 2022 10:16:42 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D888728007C;
        Mon, 11 Jul 2022 10:16:42 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/6] media: dt-bindings: media: Add compatible for ov9281
Date:   Mon, 11 Jul 2022 10:16:35 +0200
Message-Id: <20220711081639.150153-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
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

