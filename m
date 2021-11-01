Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0466441F1B
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 18:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhKARWd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 13:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhKARWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 13:22:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22EDC061714;
        Mon,  1 Nov 2021 10:19:58 -0700 (PDT)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38EEA929;
        Mon,  1 Nov 2021 18:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635787196;
        bh=YNBXOydcEAyHVg6KTwGrfS5JR6aziicEOl7EllAfkUA=;
        h=From:To:Cc:Subject:Date:From;
        b=t9n1I0/PQVAvZrbCFJR9A/tq7VrU8N7WuQYm0YxrThL3j5FoNdv4VkWijlGB7wDZt
         E9U7AU6c6pFNM6bJqIF0Y12dA0C0TZQ/mpZoiqPLV/sH/1wsUf8HX1xRjakom3Gh49
         KF4wuSipnyAEDmZy1sBsA0TIgeQ57tM5onzlYyFA=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     sakari.ailus@iki.fi,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] media: i2c: max9286: Depend on VIDEO_V4L2
Date:   Mon,  1 Nov 2021 17:19:49 +0000
Message-Id: <20211101171949.1059566-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9286 has not explicitly declared a dependency upon VIDEO_V4L2.
While this dependency has likely always been met by configurations
including it, the device does use V4L2 core, and should depend upon it.

Add VIDEO_V4L2 as a dependency to match other drivers and prevent
failures when compile testing.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
A bit of an RFC almost, as I haven't seen any failure on this, however
this does stand out as different to other drivers, and the recent
"max96712: Select VIDEO_V4L2" posting has shown that these deserialiser
drivers could find themselves being compile tested in a manner which
would other wise break.
---
 drivers/media/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index d6a5d4ca439a..9eac5e96c6aa 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -468,7 +468,7 @@ config VIDEO_VPX3220
 
 config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
-	depends on I2C && I2C_MUX
+	depends on VIDEO_V4L2 && I2C && I2C_MUX
 	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.30.2

