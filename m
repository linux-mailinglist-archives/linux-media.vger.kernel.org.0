Return-Path: <linux-media+bounces-48760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C5CBCCE6
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AACD300A294
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A7832ED2F;
	Mon, 15 Dec 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vNK0dT5A"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C8C32E756;
	Mon, 15 Dec 2025 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783978; cv=none; b=T2UHHHd6XAq3cy1H5n6IzWxPtrOlOsOmdQzFbtpLyDJXG+6fK3MI7mrBI8v/dzGVNSuEmymbHECScKG3LBdrbR4csLCA4WIlv4MWZUHyrlVwuhkjW4CdABe0LugdRYEcgkANZyTggyeQbGkVFby7DuQU1holDDjNy7LuOHSG0Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783978; c=relaxed/simple;
	bh=dBfT5rE31VW18pG/2QsOKGbcGvVz0lzgTp4a5nddwXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZ6Tt+owbktyHXjaqj3Ujdl7vomv9G6fJI7/8i8jT+PLQ5x+urZEirF/UqYfsw7ZcXFjGMU5hrcADkCOnTW5+eDmC85TUnNuIZKcnT0r269ya6u43LGSWuOAG0JmyOBiaSN3T7Czz4GSSUz80hXnNMGKTQkwoCRim7cF/b5AULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vNK0dT5A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E605F581;
	Mon, 15 Dec 2025 08:32:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783971;
	bh=dBfT5rE31VW18pG/2QsOKGbcGvVz0lzgTp4a5nddwXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vNK0dT5A1SJxNcLW32uomONzpPtIPlsRyI3X+j7eOol0nQF5mGBwvX8Jf/Ji9VjmJ
	 wRXWisAtaA9ZOJ7T2V+ZQi8rB43W/AlWFVP4+Y7uAu97D9bj8Qg7ARziDPF9ObtR/b
	 oo84eersqvq1s6ml2H22gwFfaPHJEnH+2x0WCdHE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:08 +0530
Subject: [PATCH v3 12/16] media: i2c: ov5647: Tidy up mode registers to
 make the order common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-12-4c25e3c883b2@ideasonboard.com>
References: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
In-Reply-To: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ppExTKADW3EnH1s5FM7iGMoVKQacDbYBgyxwZgPJYAU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jivB1+b2zhoA4suu/U+FkFW+5DAkd9bGhtM
 TWiEbESdu+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+44gAKCRBD3pH5JJpx
 RcVDEACVSXWsYjjGAX1enFeyKb3zHqs26R2aVDQqaP+GRM/GidxTbZWISoUiuIFkb4EImbsqqlS
 JN4ZhrN6OELxlG6UMaYVvJRkdCivRkG57dCjIp4wEe4qUsbV2yo05Zn6uPyrcrngCSHOy7M2Mub
 7yFC0oYgDz6wICIkSa2HpR6RjDgCtJT4YMe3eMzlrUaI5U1M3GWy5OMRdu+Zu07iYlLFQ6cazgZ
 675CFoGOl1v+miq+MYVsLg4sQ0ssXc+2rJ6GsJ0+cR8cifpONgLZEHPzfKmY4OzxQm45QkwZ/oP
 oH8/kKFt2Ljm2Q0w4JCB227Kms6viE3Uf81gk3PTEdDrHvR5qjmMbYdOWYkxRC+ZyWW9vcFf1nw
 boFSufUS8vIdPFrecfDYJ5G5oT161heso1rbl2RJDdocIpfiWJAhYAgvmSg2co4ViqyyxwRVkpz
 9ls5hjnfz9uzyxVXiT9g/ZvOMsQCmKD2LSyldbobvr03amq/6YF7n6xTKesvRjbh+lI/WDqldNv
 NfG1pkLedZrXbcx9ooI9ZXF4EcdNJsgdd19li7b/dxPFjIDYw0Zq1sjNbXc4aYa8eftaq6cQJ5X
 eIugYk5SqNt41s4qEguN6T0dByaUW6/emjjDYcBKa2l+9cF4/Q4meV4SYbkLOd9j806hbxiFaJV
 Ob6QXDuKKO9ASVA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

To make comparisons of the mode registers easier, put the registers
for the binned and VGA modes in the same order as the others.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 9e075fcc891862a61f0c624711f75cdbe0a3f352..37c9e8d7d1112378009dd085547aea40dffb3ebd 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -343,6 +343,8 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x3036, 0x62},
 	{0x303c, 0x11},
 	{0x3106, 0xf5},
+	{0x3821, 0x03},
+	{0x3820, 0x41},
 	{0x3827, 0xec},
 	{0x370c, 0x03},
 	{0x3612, 0x59},
@@ -415,8 +417,6 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x4837, 0x16},
 	{0x4800, 0x24},
 	{0x3503, 0x03},
-	{0x3820, 0x41},
-	{0x3821, 0x03},
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
 	{0x3821, 0x03},
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
2.52.0


