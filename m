Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8EA442C13
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 12:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbhKBLFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 07:05:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50510 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbhKBLF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 07:05:28 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59C873E5;
        Tue,  2 Nov 2021 12:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635850970;
        bh=aZ25sg5iv6vdaqSOdvpg9NgIciEIfq8wgOgSKkkfmF0=;
        h=From:To:Cc:Subject:Date:From;
        b=ZYU92KUcNE1gulb0LC72+SsEccXa+aVlivjy7ITZ3DG2GiatH0Qwhar3d1kEI8SYO
         1lBg9gfUGC4uNDzXHha1Genbwa+Awq6s94aMCZS53+hBACJIIHHDIyg39gg168KZ/f
         Yj6cwpJ6lFuSbWv2QfzgZctzBw7vDjZYRgSoUxBQ=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     sakari.ailus@iki.fi,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2] media: i2c: max9286: Depend on VIDEO_V4L2
Date:   Tue,  2 Nov 2021 11:02:43 +0000
Message-Id: <20211102110243.1510895-1-kieran.bingham+renesas@ideasonboard.com>
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
v2:
 - Split VIDEO_V4L2 to it's own line

A bit of an RFC almost, as I haven't seen any failure on this, however
this does stand out as different to other drivers, and the recent
"max96712: Select VIDEO_V4L2" posting has shown that these deserialiser
drivers could find themselves being compile tested in a manner which
would other wise break.

 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index d6a5d4ca439a..e9cfedf561d3 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -469,6 +469,7 @@ config VIDEO_VPX3220
 config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
+	depends on VIDEO_V4L2
 	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.30.2

