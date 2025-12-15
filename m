Return-Path: <linux-media+bounces-48762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A02E8CBCDF8
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F184530341C9
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E34D32FA33;
	Mon, 15 Dec 2025 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O9bBDjy5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1032FA20;
	Mon, 15 Dec 2025 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784006; cv=none; b=Ya2kfPcAOcJjzr1pHqKOybxwXj2vi1/oBo8eyeOmPjtIGEHbuxXpWcTXykNcH0Y2eVVqpvGxcgClNaDH3yWEVtOzOdow9GI//BSa0dEMIMVmwPF6+7jWRAcg3uYsfbwar1ZaNQuzOEg6taJ+M74DCT8tZnMWBaeadHZ1TguXU0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784006; c=relaxed/simple;
	bh=r0IED0kW3GNDxEBl8W4IJPaAkiS+yxjLybppDwqM6tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDoyKSpG0PnDpFWzE6dJD+QYPVTAjeQOD/P0C1hmQ3A+KuscYp5IKnpK33mT6YGeB7R5riVv+uQaarH17J32D5WDnDeW1fGFubyar9ECmKj7LdFBsb6dwq7JYbxckyfWh2TpzaqYZapFk3McyBKT9FO6h8JRQfKcMzPaFSUgJiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O9bBDjy5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3DDEC6F;
	Mon, 15 Dec 2025 08:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783999;
	bh=r0IED0kW3GNDxEBl8W4IJPaAkiS+yxjLybppDwqM6tw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O9bBDjy5pcUWd8YZegzs5FSL5xsxgM0Gbuk0O/gQb0hWrhF7GV6zFIISia8U8zBnY
	 DpseYvxICq6vzVIZ3CYtC27rq7GSU7ix9qj2wY4U8kRB3O5vCXbx6Hm8HG9aViw/VB
	 CJd+t4IlyUQrXlViPaUT+KBfgUXIci8UVAYdLb6g=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:10 +0530
Subject: [PATCH v3 14/16] media: i2c: ov5647: Use the same PLL config for
 full, 1080p, and binned modes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-14-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=cxIQX+T89C6sGn1DZ198hoGUG3KWm8Kzeony9qcPzus=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jkMhv/H6U1cPkHuFVf4oOhVM5B9kUn0QxZQ
 IKS8GS9QceJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+45AAKCRBD3pH5JJpx
 RTIqD/44lUWYNfbPXY3lh4NNeVTq1sNuUM0Fbkjhmfu8YMSHt5ZuMRP/9Oh5NB6LpVhQHhC2uIh
 Ld92A6BtEYT3IFsbcn3qSWHdJStuAO/fQ4qWffCXfRzuNlG5dp2xTjEax2+Ad8PXJ4GsV9r5o7q
 qdFnsNu/8eJLfZIkXbHcKyggsBjngiRqXt5Ib1DKO2/smkvBM2bhcy/t+AVhUySOZnwNVOHkGuU
 Kk9ZaL0rR/25Xhyu600teJ6ntsZaOm1T3gEsJqVtGEG6+Tlq/gI7r6Uq5vwyYjSTy1vJX0/rI3T
 5Cu9sUhEwKn3LCGWBrfVc7q9siiRWJqOWk7bE9mpch0fyXUIX2cBLj+qW1dZX+ZHXmq2/8BZOHL
 Qg2nGG1aVjwlVbrfx1z5iKWFZ4aS63kiVELhgBnt9wWLPv8EUW6n9So3Ga0ovjKy9cwYg8MC/im
 3pJU/Iug9+Gnuq2haekdp+kEPm6/FTjYz0nHBuaa74wdC82vOknylBR4aWVtwd4sv13X291tQyI
 Z7eAycn0+tGCAEwPN1/na2uz1zYXDVZpDA11fDN5yoHoVhOSFN5kic/SGgqmpV4iCsrGgyyd6d/
 z5mYeAgbVsVn6hm7R4A6kQnH5eYwt3EZ3sDVgeTwez1jNVHvkfErYGUnZmFxF6wEw4/YA78jtoj
 WPTTWotzcCw/BBw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

In order to simplify the driver slightly, use the same PLL
configuration, and hence pixel rate and link frequency (to be
added) for the full, 1080p, and binned modes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 0df18b388f6859222167994147ba6b923f36ee49..cbdd0f8fc8de9c0f4251aa4c8af62ca1ad8fb168 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -252,7 +252,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 };
 
 static struct regval_list ov5647_1080p30_10bpp[] = {
-	{0x3036, 0x62},
+	{0x3036, 0x69},
 	{0x3821, 0x02},
 	{0x3820, 0x00},
 	{0x3612, 0x5b},
@@ -288,7 +288,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 };
 
 static struct regval_list ov5647_2x2binned_10bpp[] = {
-	{0x3036, 0x62},
+	{0x3036, 0x69},
 	{0x3821, 0x03},
 	{0x3820, 0x41},
 	{0x3612, 0x59},
@@ -396,7 +396,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.width		= 1928,
 			.height		= 1080,
 		},
-		.pixel_rate	= 81666700,
+		.pixel_rate	= 87500000,
 		.hts		= 2416,
 		.vts		= 0x450,
 		.reg_list	= ov5647_1080p30_10bpp,
@@ -417,7 +417,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.width		= 2592,
 			.height		= 1944,
 		},
-		.pixel_rate	= 81666700,
+		.pixel_rate	= 87500000,
 		.hts		= 1896,
 		.vts		= 0x59b,
 		.reg_list	= ov5647_2x2binned_10bpp,

-- 
2.52.0


