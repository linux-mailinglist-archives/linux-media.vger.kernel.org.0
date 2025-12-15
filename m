Return-Path: <linux-media+bounces-48752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA594CBCEA9
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E1433027DA3
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B1A32AAB3;
	Mon, 15 Dec 2025 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eeFtJdSF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31119313525;
	Mon, 15 Dec 2025 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783860; cv=none; b=Rv5Jb+oPpBjj/KL+gxe6+hjXPIU8QsxOf+nV3gUXU9w2sProkukrophKPwnNUdHq8qmYwyZ0uzwo6jLLe6PECq93F5L9FPqYNJeO3lGRia+RTKS7lEw+cbGJFismneXR3IbS8HX9LDGb7EMK+ijtiR/ISbEXmbreLpH33xK3C0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783860; c=relaxed/simple;
	bh=HyXySvq8mUoqwEdtkbO7xbtYwTxCRwrMNp4b93B18JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEkRpSGZUh8PV2joHaOQqy+gB2zey+IxLbAxAF6h/7Jh0cjKRTBoMtzWn4wN5uRVhYEYT1FTU++8/oxfoNCuDP0x5z+etETi5uPTjDlvzWOvQCXL+C8tp1rGW/HT2I1QbcV6XJXXLg362jErl+x5VZ9E63xOUysEkKH9hDdv/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eeFtJdSF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4561F581;
	Mon, 15 Dec 2025 08:30:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783852;
	bh=HyXySvq8mUoqwEdtkbO7xbtYwTxCRwrMNp4b93B18JM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eeFtJdSFfcT8J81wJ13QJ8Et6fqdayphAwy1iLpBMjCet8QX3pmTPa5V+3ZtRa2J/
	 jYzhumxwYJrx3ErIvoDekC3T4jSgA01nf/XrRScXYCqml2J+KxEe1zjUUbg5NIQE4S
	 reF4Xqm+CUOr1VTBcUo0aUUVFifCpdI5N4b4EOrI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:00 +0530
Subject: [PATCH v3 04/16] media: i2c: ov5647: Sensor should report RAW
 color space
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-4-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=cRtEaBGj87Hmp8mA7OL908N5mREpt4LN0Ry6e4CQEUc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jaRtvsTiEFE/Vf/FBqBLuUhAzyGJLrvkUrt
 R9SSyqrP5yJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+42gAKCRBD3pH5JJpx
 RZSeEAC71uqXfkIy/6kpXB8HRjofI8RF2+yfCuO2k+guM10vA3cmj4+NrLQjzlz0CwjXyhQOZj3
 mDd26cAYuzIT+WmplnCSQpQO0OiB6hunCj1hjXPdRoX/jNI+B0MTxqZamS/RG+uGdz5EKmTJDID
 2sPzsIlnV9OhqljjLHgb1IL2R+0l8nTabb8jdwk+l94ZY/TPo/6Ujmeh/sFfX3OpVFKGTEJVIo8
 WavcAEzqo/aBcFp8gles4njFO4N8iJ6nsJT5oFrO+ZNylu+RttXqHHlSv1ckBioYPKmUgHKZ70r
 uh+mZ4jme2v2DFNQrcyKNMuC3BELoQj6Sr5nLIgvP1AVRE7UR0j1hlJpQZk07rxOQDJpskBWqqX
 VXNSz8qd1DXeHzqjYdSD5Fy+sIks+qsy+waGOrN4SHV6+RpYhPYhI8aMreeBvgv+cHP2edTtaZ4
 /Jj+x1rFlpHPJX7NrugaeeaCfIhxUnfOEazEi9vmqNCeAGYAV66mLN+qv1vNHUx5rMwPi5ZHL+f
 40/ocES8Asp+HGelMZdFjjnuwgE7BDDcAivwSL/hdAOl3nSi3URBh67I1IntzX1kELmoOBRUSMv
 Jn2AX+b1PYw8N0rEPOvMCalBMukcUVCbuJegAYHKr9/jGVg4L9TttssRDVaf842wJh2Zh6HgT27
 2YP3nOaYg5MrA5Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

As this sensor captures RAW bayer frames, the colorspace should be
V4L2_COLORSPACE_RAW instead of SRGB.

Fixes: a8df5af695a1 ("media: ov5647: Add SGGBR10_1X10 modes")
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 191954497e3dba4b1de4094b2ea1328a6e287003..c0f1121b025e5592d6fd4d5fd23e4262dde2d84c 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -508,7 +508,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 2592,
 			.height		= 1944
@@ -529,7 +529,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1920,
 			.height		= 1080
@@ -550,7 +550,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1296,
 			.height		= 972
@@ -571,7 +571,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 640,
 			.height		= 480

-- 
2.52.0


