Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C922057AF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733124AbgFWQqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:46:20 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:39725 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733240AbgFWQqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:46:18 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1867C100007;
        Tue, 23 Jun 2020 16:46:13 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     mrodin@de.adit-jv.com, hugues.fruchet@st.com, mripard@kernel.org,
        aford173@gmail.com, sudipi@jp.adit-jv.com,
        andrew_gabbasov@mentor.com, erosca@de.adit-jv.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 17/25] media: ov5647: Rename SBGGR8 VGA mode
Date:   Tue, 23 Jun 2020 18:49:09 +0200
Message-Id: <20200623164911.45147-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
index 3757f0b10fe93..c36d6b92b97a0 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -115,7 +115,7 @@ static struct regval_list sensor_oe_enable_regs[] = {
 	{0x3002, 0xe4},
 };
 
-static struct regval_list ov5647_640x480[] = {
+static struct regval_list ov5647_640x480_sbggr8[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x08},
@@ -205,7 +205,8 @@ static struct regval_list ov5647_640x480[] = {
 	{0x0100, 0x01},
 };
 
-static struct ov5647_mode ov5647_8bit_modes[] = {
+static struct ov5647_mode ov5647_sbggr8_modes[] = {
+	/* 8-bit VGA mode: Uncentred crop 2x2 binned 1296x972 image. */
 	{
 		.format	= {
 			.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
@@ -220,16 +221,16 @@ static struct ov5647_mode ov5647_8bit_modes[] = {
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
2.27.0

