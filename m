Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61162491C2
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 02:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHSAXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 20:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgHSAXP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 20:23:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815C6C061389
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 17:23:15 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAEBE29E;
        Wed, 19 Aug 2020 02:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597796594;
        bh=de+XRU/Cb5qzNAz0ogrX4jr0rn8LTu7RKZFwaawUaQg=;
        h=From:To:Cc:Subject:Date:From;
        b=wNQFoAZQJyBYzoecyFfj1+4FQU0AKBvPKVt5nvvThSNEPen222VBEPS+BtgNbvf+H
         JY5a9sUKumMMdr5SWuK9PlyRfXAGN95/Ps6iPbota1NldWXrGnyXtUYhTXHZuKjsI8
         byBgeVeoBEPGC6HSJz9wSweePbl3Ka1SWsGf3FaA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: max9286: Depend on GPIOLIB
Date:   Wed, 19 Aug 2020 03:22:52 +0300
Message-Id: <20200819002252.16361-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The max9286 driver depends on the GPIO library, list the dependency in
Kconfig.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 48ae60a2c603..70ba6ca1b912 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -466,6 +466,7 @@ config VIDEO_VPX3220
 
 config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
+	depends on GPIOLIB
 	depends on I2C && I2C_MUX
 	depends on OF
 	select V4L2_FWNODE
-- 
Regards,

Laurent Pinchart

