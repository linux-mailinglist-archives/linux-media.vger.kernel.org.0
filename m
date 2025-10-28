Return-Path: <linux-media+bounces-45749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1926C134EA
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FFE71AA393B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E872C3248;
	Tue, 28 Oct 2025 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VOg4HzfQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1A82C21E1;
	Tue, 28 Oct 2025 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636538; cv=none; b=H3NXk6Y5bjJLFe9e0U3dBjonn0y74GmWty13cGg/sgg1nvH6PdSlYcYCqvFVjWkFi+LdQExzdQNccMxEuxPIDoxojNT0djjf0j2hvemmgPIxv7ngg+T+/XnyNl98uka7HyA+rPCEHYIv+GSnyz7UUHm2teGF93ifLYJ1A3yA7ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636538; c=relaxed/simple;
	bh=xy5XoDe+1/n1Y2Ho5FCjs/qGtxGTj8Vl2fwFoMAhzIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvNcQU97ZqlV4I0fXgs5x1ifuy4XUfQU+1ZryUcgIxfFZnujCrj/Uazlgk9T8LzrxAtVGOocyyM1FqPLypdA84XmSgeRwRSmQPt9ZUZFDg/+UWWm9uDc12iWd1/B1KmhjDb1ouSqNPt5r0BH8L4vf4a4VZvst4TYZobWTHpTGdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VOg4HzfQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AE1E16CD;
	Tue, 28 Oct 2025 08:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636426;
	bh=xy5XoDe+1/n1Y2Ho5FCjs/qGtxGTj8Vl2fwFoMAhzIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VOg4HzfQT6XlZBfoGeWKHCpBsuNC1VAstGY4E2VGuvgFMASUj0QXg5c3H+6J/4Qp6
	 XXlur6aNL/C3pTcDUzFc8xEpZtyRHz8mVgPNEeuzJGw5FTvHnE2Pj8Ya8HHXwCqAMO
	 R+AdywhQscYEIp/wr2ujMD6d2zch/EcD+ZzI2sIM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:22 +0530
Subject: [PATCH 11/13] media: i2c: ov5647: Separate out the common
 registers.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-11-098413454f5e@ideasonboard.com>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
In-Reply-To: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8412;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=uCRAq8bqHkEEmKe6CqBeCCkKdUqeGaQ11owpBWc3yIs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHB0hgDibkedo5qshZrj1f7KAE5XyBf1JUJyE
 /5L1PvB6leJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwdAAKCRBD3pH5JJpx
 ReVzD/9AAiNHZbqlXQHYX+4lvPZjgjX3wLUDqxykt0of+L0EEEj9a/gyaG/JKl4WYjr4jRJDN/r
 M6bu9chMyNYQaoO8JrDQJ+bSgODM/GpWKJ7xUzlQG/EHr4py/dfRfD9Ax32IxTOzTgJTL6RN2Y/
 c6ntHQh5TKP5/3ZYk4jcnIkmPURXhf0ZbRXzZdkzU5wFUZfc7uBerE4sOy7Knf5GjZvOtvYVEBX
 vLEU2rptUk5L7dpdqNTbOgKM+LImhB5J+QBi7e5eSM0pD2dwVV3kBJ5So8Zbln+gCsxCww1uE6S
 061nvGK8mh7lkpwaXoEXvG3iwIAEAWl379QgnpgHPkYZ1urerYjX6GZFmVTxQqeZ1z4Me5Lef1I
 ix4WU/Lf6bsj0g2Te8vYa4sj3lnBw3RTZukCSKo0OfaiWx+GN2RICB39EUCvf6L+T7pa6kasDEy
 /mc+05vhOvbyJ6BcCviPNqGGYi0uB6Zvnme8nYF8jacy/oPU0QiG1UsveQefljzOaYtwF1f+h7x
 /Y4kk8tKdSR929/WlzSAQOurNrs771l+djGH6ZajX2JFvcndcTDnWhwaz80yDOHtiNYzVSD4Gfh
 Z1u7wjQy12aHiKepUPPgMg4q92P8bv/aVmmFZm5zTjm2WeUx5OR+pnDA/DiqN09DEsckZf/Xxzl
 Yms+nGjOGUhnu2A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

There are many registers in common between all the modes.
Pull those out into one common table.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 243 ++++++++++-----------------------------------
 1 file changed, 50 insertions(+), 193 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 2c9f50fd20d99f2adce2a1fbe4289cf7aeea2ba4..a0aaf83759e089aea727c44b614c6a9f3237586c 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -161,22 +161,16 @@ static const struct regval_list sensor_oe_enable_regs[] = {
 	{0x3002, 0xe4},
 };
 
-static struct regval_list ov5647_2592x1944_10bpp[] = {
+static struct regval_list ov5647_common_regs[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x1a},
 	{0x3035, 0x21},
-	{0x3036, 0x69},
 	{0x303c, 0x11},
 	{0x3106, 0xf5},
-	{0x3821, 0x00},
-	{0x3820, 0x00},
 	{0x3827, 0xec},
 	{0x370c, 0x03},
-	{0x3612, 0x5b},
-	{0x3618, 0x04},
 	{0x5000, 0x06},
-	{0x5002, 0x41},
 	{0x5003, 0x08},
 	{0x5a00, 0x08},
 	{0x3000, 0x00},
@@ -191,24 +185,6 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x3a19, 0xf8},
 	{0x3c01, 0x80},
 	{0x3b07, 0x0c},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x3708, 0x64},
-	{0x3709, 0x12},
-	{0x3808, 0x0a},
-	{0x3809, 0x20},
-	{0x380a, 0x07},
-	{0x380b, 0x98},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x0a},
-	{0x3805, 0x3f},
-	{0x3806, 0x07},
-	{0x3807, 0xa3},
-	{0x3811, 0x10},
-	{0x3813, 0x06},
 	{0x3630, 0x2e},
 	{0x3632, 0xe2},
 	{0x3633, 0x23},
@@ -228,11 +204,6 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x3f06, 0x10},
 	{0x3f01, 0x0a},
 	{0x3a08, 0x01},
-	{0x3a09, 0x28},
-	{0x3a0a, 0x00},
-	{0x3a0b, 0xf6},
-	{0x3a0d, 0x08},
-	{0x3a0e, 0x06},
 	{0x3a0f, 0x58},
 	{0x3a10, 0x50},
 	{0x3a1b, 0x58},
@@ -240,52 +211,57 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x3a11, 0x60},
 	{0x3a1f, 0x28},
 	{0x4001, 0x02},
-	{0x4004, 0x04},
 	{0x4000, 0x09},
+	{0x3503, 0x03},
+};
+
+static struct regval_list ov5647_2592x1944_10bpp[] = {
+	{0x3036, 0x69},
+	{0x3821, 0x00},
+	{0x3820, 0x00},
+	{0x3612, 0x5b},
+	{0x3618, 0x04},
+	{0x5002, 0x41},
+	{0x3814, 0x11},
+	{0x3815, 0x11},
+	{0x3708, 0x64},
+	{0x3709, 0x12},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x00},
+	{0x3804, 0x0a},
+	{0x3805, 0x3f},
+	{0x3806, 0x07},
+	{0x3807, 0xa3},
+	{0x3808, 0x0a},
+	{0x3809, 0x20},
+	{0x380a, 0x07},
+	{0x380b, 0x98},
+	{0x3811, 0x10},
+	{0x3813, 0x06},
+	{0x3a09, 0x28},
+	{0x3a0a, 0x00},
+	{0x3a0b, 0xf6},
+	{0x3a0d, 0x08},
+	{0x3a0e, 0x06},
+	{0x4004, 0x04},
 	{0x4837, 0x19},
 	{0x4800, 0x24},
-	{0x3503, 0x03},
 	{0x0100, 0x01},
 };
 
 static struct regval_list ov5647_1080p30_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x1a},
-	{0x3035, 0x21},
 	{0x3036, 0x62},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
 	{0x3821, 0x00},
 	{0x3820, 0x00},
-	{0x3827, 0xec},
-	{0x370c, 0x03},
 	{0x3612, 0x5b},
 	{0x3618, 0x04},
-	{0x5000, 0x06},
 	{0x5002, 0x41},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
 	{0x3814, 0x11},
 	{0x3815, 0x11},
 	{0x3708, 0x64},
 	{0x3709, 0x12},
-	{0x3808, 0x07},
-	{0x3809, 0x80},
-	{0x380a, 0x04},
-	{0x380b, 0x38},
 	{0x3800, 0x01},
 	{0x3801, 0x5c},
 	{0x3802, 0x01},
@@ -294,77 +270,30 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 	{0x3805, 0xe3},
 	{0x3806, 0x05},
 	{0x3807, 0xf1},
+	{0x3808, 0x07},
+	{0x3809, 0x80},
+	{0x380a, 0x04},
+	{0x380b, 0x38},
 	{0x3811, 0x04},
 	{0x3813, 0x02},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
 	{0x3a09, 0x4b},
 	{0x3a0a, 0x01},
 	{0x3a0b, 0x13},
 	{0x3a0d, 0x04},
 	{0x3a0e, 0x03},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
 	{0x4004, 0x04},
-	{0x4000, 0x09},
 	{0x4837, 0x19},
 	{0x4800, 0x34},
-	{0x3503, 0x03},
 	{0x0100, 0x01},
 };
 
 static struct regval_list ov5647_2x2binned_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x1a},
-	{0x3035, 0x21},
 	{0x3036, 0x62},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
 	{0x3821, 0x01},
 	{0x3820, 0x41},
-	{0x3827, 0xec},
-	{0x370c, 0x03},
 	{0x3612, 0x59},
 	{0x3618, 0x00},
-	{0x5000, 0x06},
 	{0x5002, 0x41},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -381,42 +310,14 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x3813, 0x06},
 	{0x3814, 0x31},
 	{0x3815, 0x31},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
 	{0x3a09, 0x28},
 	{0x3a0a, 0x00},
 	{0x3a0b, 0xf6},
 	{0x3a0d, 0x08},
 	{0x3a0e, 0x06},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
 	{0x4004, 0x04},
-	{0x4000, 0x09},
 	{0x4837, 0x16},
 	{0x4800, 0x24},
-	{0x3503, 0x03},
 	{0x350a, 0x00},
 	{0x350b, 0x10},
 	{0x3500, 0x00},
@@ -427,42 +328,15 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 };
 
 static struct regval_list ov5647_640x480_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x1a},
-	{0x3035, 0x21},
 	{0x3036, 0x46},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
 	{0x3821, 0x01},
 	{0x3820, 0x41},
-	{0x3827, 0xec},
-	{0x370c, 0x03},
 	{0x3612, 0x59},
 	{0x3618, 0x00},
-	{0x5000, 0x06},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
 	{0x3814, 0x35},
 	{0x3815, 0x35},
 	{0x3708, 0x64},
 	{0x3709, 0x52},
-	{0x3808, 0x02},
-	{0x3809, 0x80},
-	{0x380a, 0x01},
-	{0x380b, 0xe0},
 	{0x3800, 0x00},
 	{0x3801, 0x10},
 	{0x3802, 0x00},
@@ -471,41 +345,17 @@ static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x3805, 0x2f},
 	{0x3806, 0x07},
 	{0x3807, 0x9f},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
+	{0x3808, 0x02},
+	{0x3809, 0x80},
+	{0x380a, 0x01},
+	{0x380b, 0xe0},
 	{0x3a09, 0x2e},
 	{0x3a0a, 0x00},
 	{0x3a0b, 0xfb},
 	{0x3a0d, 0x02},
 	{0x3a0e, 0x01},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
 	{0x4004, 0x02},
-	{0x4000, 0x09},
 	{0x4800, 0x34},
-	{0x3503, 0x03},
 	{0x0100, 0x01},
 };
 
@@ -701,6 +551,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
+	ret = ov5647_write_array(sd, ov5647_common_regs,
+				 ARRAY_SIZE(ov5647_common_regs));
+	if (ret < 0) {
+		dev_err(&client->dev, "write sensor common regs error\n");
+		return ret;
+	}
+
 	ret = ov5647_write_array(sd, sensor->mode->reg_list,
 				 sensor->mode->num_regs);
 	if (ret < 0) {

-- 
2.51.0


