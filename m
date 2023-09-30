Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17B97B3E7E
	for <lists+linux-media@lfdr.de>; Sat, 30 Sep 2023 07:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234016AbjI3Fvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Sep 2023 01:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233996AbjI3Fvo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Sep 2023 01:51:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCA9B3;
        Fri, 29 Sep 2023 22:51:42 -0700 (PDT)
Received: from uno.lan (unknown [IPv6:2001:861:388f:1650:2f32:b6ff:a885:7d5e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5614D31B9;
        Sat, 30 Sep 2023 07:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696052991;
        bh=4FstZY4S0coCaEuRcKUIBoOeqLiCYYbNTRc+U969h84=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fJPavgWw4/HZSxJAmxXKJA5zfuwA+r3+4T4womLRDtP79OVGHUYbSNsMPay+KnQCJ
         hUpYdgJtw65J5de64mmAN9+apI7HgV2ES8Jr5S2qnkBAgStPeZH/1JRSKfY+fdiF/N
         t1ykiq23rdZ49FV4Qx+L34yOU538lwrARLfARvCk=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de,
        Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH v2 6/7] media: bindings: sony,imx214: Fix handling of video-interface-device
Date:   Sat, 30 Sep 2023 07:51:08 +0200
Message-ID: <20230930055110.1986-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230930055110.1986-1-jacopo.mondi@ideasonboard.com>
References: <20230930055110.1986-1-jacopo.mondi@ideasonboard.com>
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

Fix handling of properties from video-interface-device.yaml for
Sony IMX214.

All the properties described by video-interface-device.yaml are
allowed for the image sensor, make them accepted by changing
"additionalProperties: false" to "unevaluatedProperties: false" at the
schema top-level.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index e2470dd5920c..60903da84e1f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -91,7 +91,7 @@ required:
   - vddd-supply
   - port

-additionalProperties: false
+unevaluatedProperties: false

 examples:
   - |
--
2.42.0

