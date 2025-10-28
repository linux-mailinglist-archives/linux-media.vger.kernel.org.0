Return-Path: <linux-media+bounces-45748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F69C134C3
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 257654FDF48
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60772C15A5;
	Tue, 28 Oct 2025 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZSwZTDyT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974572D876F;
	Tue, 28 Oct 2025 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636531; cv=none; b=jEnVC6yoEgQHvXVinTFk9GyFAzINdsPcy/eTvIrSIhX3clK7uBBf00AZv2z0lFN6DYvB82uOXwGRoHtrQ6IxH79fstZ/wXZpxi/IExfHLU7ROdiQhGoRaByrMaa/bVsTdtwQQN3+Ek6TgTeBs7NCmg4Cd4tSA2mvKjmA2Kmu3Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636531; c=relaxed/simple;
	bh=Y1/26dzEd77XyetzZ/0mO9uHh2DhkztIYFSx+0MbeZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZdKzFB30Z+wilNdEcEM9E5CZHS+awQnCI16X3YMy3ufFQG3w91dxx4GsOA1slkI3wldLGCcYl06v066Iy8TU/g+jv0R/Tkl6Pp+rMxA3IbfzYBVicezFPyXOkrm3lnulBmF5OP3XZYGqRhpsb1oFJvfvOJS4fkR1vn5nHelDHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZSwZTDyT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D967D16CD;
	Tue, 28 Oct 2025 08:26:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636420;
	bh=Y1/26dzEd77XyetzZ/0mO9uHh2DhkztIYFSx+0MbeZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZSwZTDyTSILl+RjSJe38RxfMGzifaSldLfW0zs/ZSkhQ/vODQfAE7WrRtajYTR8pI
	 oDrJ227mUhYrRnuHRaaMiNvTBu8GJ/I0+fUOuSvqaCDZe2ohXiRM6MoeA5f4iwkHXD
	 sPaV+kolIoBG8+3oKen4QGesHyHtaE6Elwc4bACo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:21 +0530
Subject: [PATCH 10/13] media: i2c: ov5647: Tidy up mode registers to make
 the order common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-10-098413454f5e@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2434;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=TxtetA0j6SEqZTPCyiZhG7ILf0Ne1xu8jY6nz+JSsHI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHBzegDGnAEEKz/IiCQNw8inwXWstF+tLn3Ry
 umjqDYPilSJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwcwAKCRBD3pH5JJpx
 Re5tEADL/ljvYD1O2v1i2jzFMiZvQNbRCTZ6WLaUQoEYRtjP133bPs0J99iU7QenAGnnOB/j9aL
 s4vO7BLic0F1S3c4cZHRmTOEbDGAe8S+KZV57lGIFjoEuqAuXwN95KQJ3uciZvjt75bZ/lKSQQi
 yaqmFthAwjjalu3WLTP6Eje1ePAI2zlcswUMKZatXqBwvNbQMn6n3wAjIqlWQXA0W4MMVF8SQC0
 NacugRWBidmnkr99M6KSrZK3VXHuSHzj0wZVSuTwgqLagnHvJX+udOHMxS++vPb1fbmmLqOYvzX
 6XhPcTyypKwjP3qLX58wqOSzvpYBD6NmDgTL5DGKCKAuIrausJH9MFZtw3F2PJdIhsIXfVDIsN1
 QvU+GMhJEHMvYw3ik9oUph6x+rG0g/6wo62MFaXlVHeOTDKdtA6ZspoDY/KeuwHXuJySCPLBerI
 tQa0tohk1d83Oug37M+oirWwOKMfJPPGdpLs2SGpyjA3BV1XZ+thb7RSBI2h+6DP1a9lztllXON
 npM8sH1HFcT8Fodg5qEA2lGFk6/NqFo3Nv6Sz5OkK/DkOmAFmOMDaKTDxb9I5g+rdweHmzOvSgK
 u5dNih/8rDH8b99AAe0yyPh6mpk2AHw/14Akl9bKJcCP9hfhrm3Nx+KP/nSkspQP70XKEIRQksQ
 XrkWDxtLyPHYO0w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

To make comparisons of the mode registers easier, put the registers
for the binned and VGA modes in the same order as the others.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 59c21b91d09d79f073a54871221f197a0bcf3aa2..2c9f50fd20d99f2adce2a1fbe4289cf7aeea2ba4 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -343,6 +343,8 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x3036, 0x62},
 	{0x303c, 0x11},
 	{0x3106, 0xf5},
+	{0x3821, 0x01},
+	{0x3820, 0x41},
 	{0x3827, 0xec},
 	{0x370c, 0x03},
 	{0x3612, 0x59},
@@ -415,8 +417,6 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x4837, 0x16},
 	{0x4800, 0x24},
 	{0x3503, 0x03},
-	{0x3820, 0x41},
-	{0x3821, 0x01},
 	{0x350a, 0x00},
 	{0x350b, 0x10},
 	{0x3500, 0x00},
@@ -429,20 +429,27 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
-	{0x3035, 0x11},
+	{0x3034, 0x1a},
+	{0x3035, 0x21},
 	{0x3036, 0x46},
 	{0x303c, 0x11},
+	{0x3106, 0xf5},
 	{0x3821, 0x01},
 	{0x3820, 0x41},
+	{0x3827, 0xec},
 	{0x370c, 0x03},
 	{0x3612, 0x59},
 	{0x3618, 0x00},
 	{0x5000, 0x06},
 	{0x5003, 0x08},
 	{0x5a00, 0x08},
-	{0x3000, 0xff},
-	{0x3001, 0xff},
-	{0x3002, 0xff},
+	{0x3000, 0x00},
+	{0x3001, 0x00},
+	{0x3002, 0x00},
+	{0x3016, 0x08},
+	{0x3017, 0xe0},
+	{0x3018, 0x44},
+	{0x301c, 0xf8},
 	{0x301d, 0xf0},
 	{0x3a18, 0x00},
 	{0x3a19, 0xf8},
@@ -468,6 +475,7 @@ static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x3632, 0xe2},
 	{0x3633, 0x23},
 	{0x3634, 0x44},
+	{0x3636, 0x06},
 	{0x3620, 0x64},
 	{0x3621, 0xe0},
 	{0x3600, 0x37},
@@ -496,19 +504,6 @@ static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x4001, 0x02},
 	{0x4004, 0x02},
 	{0x4000, 0x09},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3017, 0xe0},
-	{0x301c, 0xfc},
-	{0x3636, 0x06},
-	{0x3016, 0x08},
-	{0x3827, 0xec},
-	{0x3018, 0x44},
-	{0x3035, 0x21},
-	{0x3106, 0xf5},
-	{0x3034, 0x1a},
-	{0x301c, 0xf8},
 	{0x4800, 0x34},
 	{0x3503, 0x03},
 	{0x0100, 0x01},

-- 
2.51.0


