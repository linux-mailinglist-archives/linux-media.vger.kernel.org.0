Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1AE64D390
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiLNXio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLNXil (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAAE32B9B;
        Wed, 14 Dec 2022 15:38:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 483E61837;
        Thu, 15 Dec 2022 00:38:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061118;
        bh=L9qh7ejfDUfKd56La+8FYjAtcFLCLzus90fSwJhF5RA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IaOD6rTOy7/+hmbEZ7WCtQoFLRoIaDiJOEKywa06s5nTtEuTGAY1vgS9X0MFINZoL
         ZArZlKqsiGETnJQ6PxRdGekph8OdLZ5q6mLnjraz+QLqG9gem1UjP2mUJYqX1k3f0+
         ElXtbomGtuGuUmNNwt+HRGmsHozu4IsDQadnp9Iw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v3 06/12] media: i2c: max9286: Rename MAX9286_DATATYPE_RAW11 to RAW12
Date:   Thu, 15 Dec 2022 01:38:19 +0200
Message-Id: <20221214233825.13050-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9286_DATATYPE_RAW11 value is used to configure the MAX9286 for
11-bit or 12-bit input data. While 11-bit data is supported on the GMSL
side, CSI-2 doesn't have a RAW11 format. 11-bit data is transferred over
CSI-2 as RAW12. Rename the macro accordingly to avoid confusion.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index cb734a97afea..028fa3547282 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -72,7 +72,7 @@
 #define MAX9286_DATATYPE_USER_YUV_12BIT	(10 << 0)
 #define MAX9286_DATATYPE_USER_24BIT	(9 << 0)
 #define MAX9286_DATATYPE_RAW14		(8 << 0)
-#define MAX9286_DATATYPE_RAW11		(7 << 0)
+#define MAX9286_DATATYPE_RAW12		(7 << 0)
 #define MAX9286_DATATYPE_RAW10		(6 << 0)
 #define MAX9286_DATATYPE_RAW8		(5 << 0)
 #define MAX9286_DATATYPE_YUV422_10BIT	(4 << 0)
-- 
Regards,

Laurent Pinchart

