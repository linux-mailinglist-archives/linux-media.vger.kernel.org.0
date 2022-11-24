Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB0D637684
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 11:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiKXKas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 05:30:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiKXKaY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 05:30:24 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513A2C6611;
        Thu, 24 Nov 2022 02:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669285815; x=1700821815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M/6ilgjP3/m/hMevg24REaxRyOPhlR2Q86fjvdSB8bI=;
  b=Fb3V+tx3LWlNjxKjHWqf5EvcNxKLlV2qs1H1E/gykUisBmpOh1mzfHjx
   2yxvFu1cNk3F1MVQJ3NLr5PkRNKIhnUFoEaPlMwcx3pEPUXQUqbyTnm4I
   kBdqQ89reRZA08rb2XiFppxnZq6Adn9EJIGwS+cQSLUjBRacwTfPdfAc1
   XA4e2roSCKiyt0NQdHW+J3/GUmNJVX19bdhYBr/u6aOmqGuHdn5MXTvRy
   Udsrm2FO6WK3OKk7W8TzQzMAZXCN4GPNQtY5uCYYGc2+y/HZ42dgHzAwL
   9LGh9mmHFXsUr4RlYMt2xr5q43uFuDMrJr8nIcQHcQXl5ypXo5eTZdErn
   w==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27558278"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Nov 2022 11:30:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 24 Nov 2022 11:30:04 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 24 Nov 2022 11:30:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669285804; x=1700821804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M/6ilgjP3/m/hMevg24REaxRyOPhlR2Q86fjvdSB8bI=;
  b=jYdOBeg6KZa1exiCnJ5vL0cIdekRK236uYc816YG70neo5bCAIR8FKxm
   pq4yw72UuXtLTg5Js/aPYPaNz1SqTfwNY2v9EFupZfCAdwj6bcUNrvtl9
   fOeK0R//vHE9fzz2qvzZN29ujxhtsZWlJbxUADfZRqqrXSfu17B+Ny37i
   K5A3U8Y3LM1wGqQayahvo9HVOCWLPiTR/ptciBvE/y4HPGRYwmoCx4cvq
   qK1AzixHDFAftpRSd8GDIX2C0bR7Zs26qhMkBAIFQA+6S5EJWZFbJGMAg
   QGcSr8f0WPVgh4DYbD2WHjgMM1PckwpkuXwi8ZaxaquVJ++Pf2popgY0w
   A==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27558277"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Nov 2022 11:30:04 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1C3C8280072;
        Thu, 24 Nov 2022 11:30:04 +0100 (CET)
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
Subject: [PATCH v5 1/2] media: dt-bindings: media: Add compatible for ov9281
Date:   Thu, 24 Nov 2022 11:29:58 +0100
Message-Id: <20221124102959.1605202-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124102959.1605202-1-alexander.stein@ew.tq-group.com>
References: <20221124102959.1605202-1-alexander.stein@ew.tq-group.com>
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
index 652b4cfeded7..0c4654e70d46 100644
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
2.34.1

