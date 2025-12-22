Return-Path: <linux-media+bounces-49299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84147CD5183
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 510FE3035A6E
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EDE30F951;
	Mon, 22 Dec 2025 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mnCT36TE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB7C2367B3;
	Mon, 22 Dec 2025 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391430; cv=none; b=LBXmP5REpVc7ZwUqsVOJFdzJVzVdXXRos8qo27KMoFAEB60YsMOvbcDBHZZPmH4JGDTxQGNM+JTMv81IhzHIZjd3UunupE3QQpM2EKOqC2V5AtekNh2lV+33gg9aO6LBuykF7OjR33TVOzd9lFuSYKuEqPogBM/XYTgA2KgvHVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391430; c=relaxed/simple;
	bh=sLwppaM3UidnqHSY+zt4ykVRqMOPAKrpSGM71AptNZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHK+D1B26UO0GJcvmogEv7tHmvUh16r5kqal+QwPC9R6GicVurxdYm8hHaQiYAzJR88X4w3zi8R1eguIef84zG9Q5Tj2bvvqeSvKoeb7LuY4MHbm7d/fOdDPBj/3uygpZBoILCSktDfatOz48j4ak8fDcTS6AIs6QdO6mPrrW28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mnCT36TE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A305593;
	Mon, 22 Dec 2025 09:16:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391417;
	bh=sLwppaM3UidnqHSY+zt4ykVRqMOPAKrpSGM71AptNZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mnCT36TEsX2K1407nvWp4rzNG6IuxGB2J3X9LVug7yx8ih4JdGitKHUEjnaGOvxaw
	 mTgC6+XT32/22GdYAISmeoeKwMq8JrvY4xkWP82VXTZAZlLQQdxVwO0bkO0s/7i7SV
	 hoIbugs78t7JY4MemKQ06/AWougwwyCGnSglD23k=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:37 +0530
Subject: [PATCH v4 13/17] media: i2c: ov5647: Tidy up mode registers to
 make the order common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-13-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=3hwnFw5i8utHuyPZHb0dYc8OrbjufzHTvFE55/5oYpY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4tOdWVxgEFCsmANYZLqZD+dRerwY+4DP/TO
 Jn+6baTneWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+LQAKCRBD3pH5JJpx
 RWMnD/4pW9GIjsF7P1IBo7/V/d5/an9Pkh/LU57EESOVE9LzyIlxsW1N6NNWsH2t6DTEy++Lp21
 5fg9AnQm6GCplMVUYjlVH1lwRBwQeCvdmrwx2PQCbBvcdGWEwxBnY4WcDWb+TvOo8TYOYJvafzL
 s6mIoGfDCBXQzm59wbYLNnpz9M9y4/Qo4xzGkKdbmgLp/BacHYAOvoqfnuPmumQf4v7GwHYG1s4
 7slfh0BcR+sIJrD2OOMQWUfFp2BiTlUW6zjzg9Tb7LcdtK55PNxQWzKWo7K/hZD58rayXmpVobG
 1fjlBOgA4hFrrH5dFjvWBxnz4XTn5yv7dsRCADcIlmfu3s4DyuCh/MhIejyz25iXqkUsIRtlb+e
 TzJ8/TxPfTB2UoyB5UhM9cfdTChzsJoOGAsaY5J3FjcUywYNtnt3bHHlpcMh0olYeNmDzpHj6CE
 T2npxot9eFaeUO5l0BgQcapgoBKxaCCKsNQEMmWufAIJYzt/o9smZXxhiRzmFgzfOwCq3tsoRVC
 AnzkyazS5XxWcyeoTPPKenoTePoCrrcnDrWDgp1WVsVVsh/kk4/iYMQ0x/nldS0IAVrd38cTQjx
 5daNJ1Ab9T/7rqAAs45cNpu3SHpXauv4jXIrzAv42KFLufvw7ovSrfCLjBE8kFijCjejgUzwT57
 X8FlSiB5AWv0ZOw==
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
index c89e13442e29796e0971faa204cf7132283c51b1..8142496ed959805b1ef1d1460c993448bd2beb3d 100644
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


