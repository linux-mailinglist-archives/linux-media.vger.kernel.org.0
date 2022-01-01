Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7AC648280D
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 18:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbiAARf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 12:35:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41138 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiAARf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 12:35:56 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3F65EE;
        Sat,  1 Jan 2022 18:35:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641058555;
        bh=h0juhx0gLIdTN1uuE9Yw8bvkQEPYYYGb7lvGIqawSJ8=;
        h=From:To:Cc:Subject:Date:From;
        b=oC02ApZlTXzJUC9G+jT0kn84BNLAiE6cHRvqgWHmAIMjLTp2VluV8noiGM8WPXp2A
         bL0nMvkJkXTnQ0I/cVdfsTL1zFlCvb2iibRtjZzmocVC1SJlTN9P/WUnpFEo+aHzTj
         1//F2es1EnybzpsVkxw0jKAmul5NBurqjRgv11AY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] media: i2c: rdacm20: Fix indentation in comment
Date:   Sat,  1 Jan 2022 19:35:40 +0200
Message-Id: <20220101173540.9090-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Fix a small indentation issue in a comment block.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/rdacm20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 025a610de893..e1eff4678ab3 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -463,8 +463,8 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 		return ret;
 
 	/*
-	 *  Ensure that we have a good link configuration before attempting to
-	 *  identify the device.
+	 * Ensure that we have a good link configuration before attempting to
+	 * identify the device.
 	 */
 	ret = max9271_configure_i2c(&dev->serializer,
 				    MAX9271_I2CSLVSH_469NS_234NS |

base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
-- 
Regards,

Laurent Pinchart

