Return-Path: <linux-media+bounces-49300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF7CD51F2
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C4C0300B6B1
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFD03101A9;
	Mon, 22 Dec 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nr4Tuajw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A864930FF13;
	Mon, 22 Dec 2025 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391434; cv=none; b=dO0afq2SmZZQhDJiXb50WZyTOUgondj/XtG0339EjSLbX5DFbg+8Bpe+UTwhow0HR8HYj8ZaFyUbglsMVSvTyn8af9KIeZXoTpKb5MDtkvQh177WrYFDdn1RawCCAT5JxyjX42wQL1KXjErt5YBAPAAb9R0pHoUhz2TPfdGTVIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391434; c=relaxed/simple;
	bh=yj6WkbtA9AkS9h7XhmaU3os8G7FauNjNIKK790QvDEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWRnO0ouKHI6W+97KsFQrfDAMnmSIJmrAA4WK9A96QFBTpK6j2OXX4uXX/UBDdgcMDR3oSqT6Nj2gDewmrSIXeemghKNae9XTPC6LsnBcEPV9hJOChrA+DmFS2MzjxFIgywyAxt2oPkLWv4zg/vRPQfCWAy2VkonFqJRpDdAvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nr4Tuajw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE8E23C8;
	Mon, 22 Dec 2025 09:17:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391421;
	bh=yj6WkbtA9AkS9h7XhmaU3os8G7FauNjNIKK790QvDEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nr4TuajwL9EAquV/w21BCjTR4QGD3WJgR/boMHQsLn9yPBza0VQSb9M/Ul4duPdaq
	 O+RoRkPg0H9sgE9MYDpQ3IJ737RP8RsUhXAepVP5KSKIB2CwRYFn/nh/Cz3XbmPmg/
	 HYWzB0jfj3niGDDb7wZaqtM9f3O+M+V0A3Spba3o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:38 +0530
Subject: [PATCH v4 14/17] media: i2c: ov5647: Separate out the common
 registers.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-14-b949c7309280@ideasonboard.com>
References: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
In-Reply-To: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8412;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=O0OpUZCL7z+XAZW7mDPlqoeZrCD9kkh3VxzFLQ1ZCHk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4uslKoToRnFgWX7hnVbuhyBJKGPCqtb2YRa
 51ZsF1kAUeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+LgAKCRBD3pH5JJpx
 RTVDD/wNfJdVdUs2vyYAThlLokXT2O6Y3256cDJfhdtYaosXFiELvnQVA+vtriVHzfnhHkBCiCj
 i0OTT2cg0+OA3dtGXRD7RCI7C4W0V3Kdi4ZmIygcg/Q0xVA392WA9t28FLPecBq9+53oRe5OhiC
 yUDLKgFYb9oGXbGPoZo8SPgZk16HnEb11iJEgOPDYfxh+7l+N7Hy2iNVJny8uQsjK42WJ+p9eYx
 1iG9lXaeY4Be3P1CProCd2HKjhQvQ8UkIGMi0QEX62JSIb5vUJ8w8iYZqFJ1r6iXWFquqikps53
 gH8l8Fyto4jIvSzxLrokD9CgDtJSbfx04vJt17o/uu8DnebbVrF7J841xCEnoEVu2m34iSXqatr
 qbqVh62Nc4UWuz2MzManTGr7hnF+/vZ4GJevO2v5aCa7LXAr0o9V2EXPEAy0lj0+Gsguux4tBIC
 BJxr3mSmKU9a4GUy0R/v3iBfE747qjkiPzXCr3h0Wf4HUhj+Yh2eK/r0QXI7KcQqh/vYFPME52K
 h36/E3bkBPOZ6OzQwc99y5tKsi0HVtX+b1U+WtmATIV5gT7bhZSwRvFbvt6jnxBkpObALUvypSD
 fVfKTM7MCJ8cJ3H6IL5mNQ7un/N42RhtXaZoeBWHCjWYU30RvudLehihO6wdzADORpQTX+vpPoi
 TgUPH9DnYtGHd6w==
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
index 8142496ed959805b1ef1d1460c993448bd2beb3d..13b703f39b106b5ac43db23612ae051e475bb734 100644
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
-	{0x3821, 0x02},
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
+	{0x3821, 0x02},
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
 	{0x3821, 0x02},
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
 	{0x3821, 0x03},
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
 	{0x3821, 0x03},
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
2.52.0


