Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267A12AC15C
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730860AbgKIQuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:50:21 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:33555 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730130AbgKIQuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:50:20 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2150F1BF209;
        Mon,  9 Nov 2020 16:50:15 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v3 15/29] media: ov5647: Rename SBGGR8 VGA mode
Date:   Mon,  9 Nov 2020 17:49:20 +0100
Message-Id: <20201109164934.134919-16-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
References: <20201109164934.134919-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before adding new modes, rename the only existing one to report
the bit depth to distinguish it from future additions.

While at it, briefly describe the mode.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 624f3cf9a79c9..6cb45c1ac9d44 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -115,7 +115,7 @@ static struct regval_list sensor_oe_enable_regs[] = {
 	{0x3002, 0xe4},
 };
 
-static const struct regval_list ov5647_640x480[] = {
+static const struct regval_list ov5647_640x480_8bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x08},
@@ -205,7 +205,8 @@ static const struct regval_list ov5647_640x480[] = {
 	{0x0100, 0x01},
 };
 
-static const struct ov5647_mode ov5647_8bit_modes[] = {
+static const struct ov5647_mode ov5647_8bpp_modes[] = {
+	/* 8-bit VGA mode: Uncentred crop 2x2 binned 1296x972 image. */
 	{
 		.format	= {
 			.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
@@ -220,16 +221,16 @@ static const struct ov5647_mode ov5647_8bit_modes[] = {
 			.width		= 1280,
 			.height		= 960,
 		},
-		.reg_list	= ov5647_640x480,
-		.num_regs	= ARRAY_SIZE(ov5647_640x480)
+		.reg_list	= ov5647_640x480_8bpp,
+		.num_regs	= ARRAY_SIZE(ov5647_640x480_8bpp)
 	},
 };
 
 static const struct ov5647_format_list ov5647_formats[] = {
 	{
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.modes		= ov5647_8bit_modes,
-		.num_modes	= ARRAY_SIZE(ov5647_8bit_modes),
+		.modes		= ov5647_8bpp_modes,
+		.num_modes	= ARRAY_SIZE(ov5647_8bpp_modes),
 	},
 };
 
-- 
2.29.1

