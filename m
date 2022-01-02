Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6648482D10
	for <lists+linux-media@lfdr.de>; Sun,  2 Jan 2022 23:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiABWsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jan 2022 17:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiABWsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jan 2022 17:48:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FD6C061761;
        Sun,  2 Jan 2022 14:48:17 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C63C2CC;
        Sun,  2 Jan 2022 23:48:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641163695;
        bh=jIuCawMcWmIM6EZETWQ8SJHpmYiolbDONo6JukUFaJs=;
        h=From:To:Cc:Subject:Date:From;
        b=rxyksxXbcww1Q4pHgBL7pcDpzXwvL+UoSRtXTVor9M2sukizIfJtr5T/Al40e95XB
         4ViqCa0yROvkZM1itt2KijUC7NveiB/SoNLelDRPkNgK+/MjLCIDTWKrO8MOO/oYjl
         0KTaFuD/WnFwVz1mUzbtREJji2I7sPGmWNIg43+s=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: i2c: max9271: Add header include guards to max9271.h
Date:   Mon,  3 Jan 2022 00:48:03 +0200
Message-Id: <20220102224803.27463-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Protect against multiple inclusions of the max9271.h header with include
guards.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9271.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/max9271.h b/drivers/media/i2c/max9271.h
index dc5e4e70ba6f..0bf1d40811eb 100644
--- a/drivers/media/i2c/max9271.h
+++ b/drivers/media/i2c/max9271.h
@@ -8,6 +8,9 @@
  * Copyright (C) 2015 Cogent Embedded, Inc.
  */
 
+#ifndef __MEDIA_I2C_MAX9271_H__
+#define __MEDIA_I2C_MAX9271_H__
+
 #include <linux/i2c.h>
 
 #define MAX9271_DEFAULT_ADDR	0x40
@@ -231,3 +234,5 @@ int max9271_set_deserializer_address(struct max9271_device *dev, u8 addr);
  * Return 0 on success or a negative error code on failure
  */
 int max9271_set_translation(struct max9271_device *dev, u8 source, u8 dest);
+
+#endif /* __MEDIA_I2C_MAX9271_H__ */
-- 
Regards,

Laurent Pinchart

