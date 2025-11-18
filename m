Return-Path: <linux-media+bounces-47284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 150D4C6942E
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 0AB6D2B1DF
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307F1355805;
	Tue, 18 Nov 2025 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hADgZku6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0254F358D0A;
	Tue, 18 Nov 2025 12:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467470; cv=none; b=rSl7s1IEDc4APMBL0pCQcbDqHkkkKtuVNI3ofNvIFXHv++GQU6KpEUw/8OaGTwGQzW0ePqtm/Hg7pMxJs2X1bJYAYfyqA8+GY01WFoPni4AfTGZwuxULpQlT0ZwBMw3u2JxqnIPsy/KvMWfGU3Itg23aegvpk9MK6q21jaIsjYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467470; c=relaxed/simple;
	bh=kZaKOzvwpyChOfT/lMLxG9AQzTHFkzeWiJxq0V5sP+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FfACa3wPBnZirqCP5+2T4LBhM6ozS5OFiA+4HSzwPV+Vclhd0bBZhABJXv283j1mJ1PxdIxmz87blZSOcXAxwlZTayYQVo3wJ/p3MBeuxHyJWtrMYYrQZLr1JrsGjTe0+yYntA75WSG+El5VPImBr++VkcFXc2D2CsnyIYM2w8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hADgZku6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A81A20E3;
	Tue, 18 Nov 2025 13:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467344;
	bh=kZaKOzvwpyChOfT/lMLxG9AQzTHFkzeWiJxq0V5sP+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hADgZku6kqcvIXycBSsQYQFKHlxiJN/iHwRz3f8oI34RBMnvQoHBTd+RmotdaVSok
	 FQV+rpvkd0q5mu63wcG3vcyHpiRE36vYcFeT2vhg3+LDk6kVY1433sgQqulqqSxyu2
	 Ls9oEYDj+Jb7etIiXXMomdxwxf11I/whqDahEA9Y=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:33:05 +0530
Subject: [PATCH v2 12/16] media: i2c: ov5647: Tidy up mode registers to
 make the order common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-12-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
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
 bh=MdwSTLoMX+IlELYXo3stkVr1LSzQidt87P7CDuW6ax0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGCFHZRKqPFSh2D0nKW8FH3HPo4ljNBLxZMyi
 o4Vtf9iwp2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxghQAKCRBD3pH5JJpx
 RU6ED/9tTENVP76/aCZrbkm/ESaoPyTIkyBzmH5OIAqCqabvLOIxrrD6e6fB+rB8WOQpGmATwPX
 oBD2CD0e17Pvc8plUZL4QePrHoFAj92yj8RZkFfJwFNfgjUbg6slJ9N6s5gN6E9Md/6clt7bQnI
 oYdipQ+OApkTH5Lde6+aItDSX6G5VO4eVzYl3/LqJM9z7j65z+FlJ4svhy+yUUxAQQc0yrdXwCB
 z2qX0Be/suczBhDU8NKsxtLJ4Qo1H5jDk3jxXVVBQgG8JtQUF+8NWvwIb8FAd69yRW2moseqwpL
 XUh5b7WeIYcZ5QdSEuN8Wj4z5zR1lchAsQCgSsIJs+aPqX+YdtBmIkMvYQo55rbvm95qnDoOe90
 Q9ukeh/uFh1VN5j1uWPF9qeWPHGYSJ8ZmJWkaZYJ+oy5MgEMrVZsI2FqpP7Ye9QNvWK/df0KqWN
 cSqxyVexcbH9NdB/AmdRVWOuVQXm28GNGoD1BGcxDn3vLLLXUQmpwy3yoNu7Q+NJwoKzqxCVTI4
 1DWlX5AftzetJxdSF4c3SIU+0QmuRfS+lzmMyHI63r8z6NAQmZnPFaMHTUhDDZdmBmlCsohs4da
 DKhR6kS+7T9lpwzhtHLmyVnWAKw+s4naMtwHBcucOE7+n5oWla5kWa3a847H7YxSFjROtTKDo7X
 LPZwx+2ojz3VB6A==
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
index 48c0e302319d724a20aa7885a62e517d515c6191..5cfc35e79562a6017719710935a72c2dd84405b6 100644
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
2.51.1


