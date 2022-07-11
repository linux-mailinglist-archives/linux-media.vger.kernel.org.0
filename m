Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A7956D79D
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 10:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbiGKIQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 04:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiGKIQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 04:16:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5181E3CA;
        Mon, 11 Jul 2022 01:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527410; x=1689063410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HSaIiK0leOoEhihrSLT6bFw0oUUcvujOX0lUO0UHAro=;
  b=D74x2mTp6Sz2Y9v5jxD+pkUHqUPGyGdkq3SqtuomTUSgVYLrkXykjCOY
   CiVKKs39XEpVRp/sxT/7n2HOgCn9UHA9tmj6MIBU4BAeQ7p66ul9iurJD
   3fYyBVFep2YHNmOuLwgEMo+h31BY+Ehj+jMiO4TJYbL7plzyhlLyo3509
   3l8zTqzBShNkRkt/zNwOY3yaLIkjfovdHTYKy+bqdm17W4/vE26G0kcmO
   6cFzE0j7ZgjyS4cgUv/morSNq3VECqHOE0lgPX6dt8RUwIIUOA/Qb/PGf
   c7nbqN5eHOudtxtSgoAacD1rKO04mfS6kGKmaoyah02wUJ3ICbo3nWaZ+
   A==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967077"
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
  bh=HSaIiK0leOoEhihrSLT6bFw0oUUcvujOX0lUO0UHAro=;
  b=hTAFaTPW4qoft3NmCPBbsfwfkDQJn90wqOX74E0wMIUxEH1mN+v3Mb9r
   1wcJ2QrkPdVWUr004ulaKe9kwtoQgW+LVWSYyZj9MO0j8O3YbTpnBTLz9
   yo/DhbOi3YyfLq7UntmpLsu29P5oG3WL9RwrofFXp1pA4rlxHcNgLvw2N
   BoVmeHDPkg7Bm7xrCYp2K9F7cz+lh23vvBMDNzyby6lP7dQg7sit6kek3
   NskMjTHqsXHPAD6C3Y/HTxT5Wc4McNzF7gScBUHZEgoBtzdmECE+K2ZaT
   BKH6PqP758JguykPO+MCwfFiozoBlSb2qeo0gVJ6tFGT9M+WCACcTHLaF
   w==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967076"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Jul 2022 10:16:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 41537280075;
        Mon, 11 Jul 2022 10:16:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/6] media: dt-bindings: media: ov9282: Add power supply properties
Date:   Mon, 11 Jul 2022 10:16:37 +0200
Message-Id: <20220711081639.150153-5-alexander.stein@ew.tq-group.com>
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

Add regulators for each power domain.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
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

