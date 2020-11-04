Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7D52A61CC
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbgKDKhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:37:21 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42913 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729370AbgKDKhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:37:20 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A143120005;
        Wed,  4 Nov 2020 10:37:16 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v2 16/30] media: ov5647: Rename SBGGR8 VGA mode
Date:   Wed,  4 Nov 2020 11:36:08 +0100
Message-Id: <20201104103622.595908-17-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104103622.595908-1-jacopo@jmondi.org>
References: <20201104103622.595908-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before adding new modes, rename the only existing one to report
the media bus format in the name to distinguish it from future
additions.

While at it, briefly describe the mode.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 65fcd86dcba96..9cbe3b675fb52 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -115,7 +115,7 @@ static struct regval_list sensor_oe_enable_regs[] = {
 	{0x3002, 0xe4},
 };
 
-static const struct regval_list ov5647_640x480[] = {
+static const struct regval_list ov5647_640x480_sbggr8[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x08},
@@ -205,7 +205,8 @@ static const struct regval_list ov5647_640x480[] = {
 	{0x0100, 0x01},
 };
 
-static const struct ov5647_mode ov5647_8bit_modes[] = {
+static const struct ov5647_mode ov5647_sbggr8_modes[] = {
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
+		.reg_list	= ov5647_640x480_sbggr8,
+		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr8)
 	},
 };
 
 static const struct ov5647_format_list ov5647_formats[] = {
 	{
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.modes		= ov5647_8bit_modes,
-		.num_modes	= ARRAY_SIZE(ov5647_8bit_modes),
+		.modes		= ov5647_sbggr8_modes,
+		.num_modes	= ARRAY_SIZE(ov5647_sbggr8_modes),
 	},
 };
 
-- 
2.29.1

