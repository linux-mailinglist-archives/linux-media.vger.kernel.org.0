Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152B1689638
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 11:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbjBCKZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 05:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbjBCKZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 05:25:31 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8792323663;
        Fri,  3 Feb 2023 02:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675419921; x=1706955921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RcX8nr8Jf1i6ZoTAaWtpCdDyztB7gah4TOKWRyO8zwo=;
  b=Y1NaTpAxnUP4abkyIiQSlitluHQvXpxWjHhcK9xJzyr2yj2b7Ous73xd
   Ea7PlMPAVDpU6F3CU4pxrxhkdbVU8QPJykZiUOcsVpDkMMKxnNGBwNFLr
   k2KemszIPL44NjOp2idqy+tkkp19PhEp+XFXkzD59sqWa+CxYjCnrBZTD
   asxfJsa6C5+OILf6eD8ly46EAW4PniXnmKTKczDcxVDYVLq2Kr8poFR+j
   qMte9dlWB+UW3Tgchngq8P0imqZsgAFS038uWvrPf0rXRp9LOs7kVc8SC
   1f9Xtoxxtq1CcptNKR/C2HzzATvDrUkVRC7VNqZnt5x5c8+kZhhrElk0c
   w==;
X-IronPort-AV: E=Sophos;i="5.97,270,1669071600"; 
   d="scan'208";a="28851851"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 11:24:46 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 11:24:46 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 11:24:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675419886; x=1706955886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RcX8nr8Jf1i6ZoTAaWtpCdDyztB7gah4TOKWRyO8zwo=;
  b=nOSWuOJLibRIbzdgs+BjLEmRB/8jvfmvdSjooqo7H+K2GXA36+QNGX2R
   NXPsnriYiHf5DDHzBJBOfCdbJsgyzV2edMK1HP2UFGh7MYWT+lNBRxzS3
   +i82nIVV5b9BViaQe+qOuySo/baBxEWqC6Aig5rDKZVkFFA5J684dj147
   IW9UZySAT2UhNe2Rgwcxgkmt/ar0/iWdVvCdTPx/U3PkNRYqM6YwnCm4J
   Tj+sryIJi6k5fPa84Z6sa1hYk2LEd3wCSFmmcexU51STCc8zbbiPHX5HV
   CC4OCScfsC5rAm5knYK20OUli6keaZbkvjw8cGz82JT2IM27cy5kOH/Iu
   w==;
X-IronPort-AV: E=Sophos;i="5.97,270,1669071600"; 
   d="scan'208";a="28851850"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 11:24:46 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 28ADE280072;
        Fri,  3 Feb 2023 11:24:46 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] media: dt-bindings: media: i2c: Add imx327 version to IMX327 bindings
Date:   Fri,  3 Feb 2023 11:24:38 +0100
Message-Id: <20230203102439.237527-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203102439.237527-1-alexander.stein@ew.tq-group.com>
References: <20230203102439.237527-1-alexander.stein@ew.tq-group.com>
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

The imx290 driver can be used for both imx290 and imx327 as they have a
similar register set and configuration. imx327 lacks 8 lanes LVDS and
120 FPS support.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index 29ca4052591f..13de5b061343 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - sony,imx290
       - sony,imx290-mono
+      - sony,imx327
 
   reg:
     maxItems: 1
-- 
2.34.1

