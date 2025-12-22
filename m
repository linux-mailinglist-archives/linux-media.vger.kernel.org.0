Return-Path: <linux-media+bounces-49290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7452CD4F54
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8A4F302E07F
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504EC2FFDFA;
	Mon, 22 Dec 2025 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pT0Dy+B5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C8F221F1C;
	Mon, 22 Dec 2025 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391382; cv=none; b=U18vjjCZgHRv4Qj59g5h+L0Z20Z8X393JK9pRkvt8XDmSt95aELZuaiSzPxvIZZceUWTaXEud22zk3JJAww60hZdrZldinuhZ6ENw4fZGsBdlMD7jTbskz0hFXq/PeoJoXMztyDN8oP/gcqwOBSlZNEiLUOYg8t4mux4ZuDYrMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391382; c=relaxed/simple;
	bh=HyXySvq8mUoqwEdtkbO7xbtYwTxCRwrMNp4b93B18JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NT18RjiKb/i/4rUt7ve6IrRlkFI5/NFoppys3GcgaRJpM3591/rsSFTyrNmqde+qwSRMDF5Hw3t6obGP+lnhDRdJQKFfIia3FaLfkinI4OgRQUT81X+15CqEIhXlLlT/mrxFt0tXzHyoKuvgsEM4DVsSbEGyput2xoo36lmma0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pT0Dy+B5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CDA6593;
	Mon, 22 Dec 2025 09:16:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391369;
	bh=HyXySvq8mUoqwEdtkbO7xbtYwTxCRwrMNp4b93B18JM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pT0Dy+B5s/mDuKxtFHQQQKVtcXS5XrXoe9JW3lL5rXsubBjYok+7txAmNgfdduCTc
	 Apq9rz7YlTjtXMrpPGmGWzIV3VYPdJclTfSIEYLP5cHDyWi3GA23qUKJCJUj7n2X3z
	 nRL/LOPHGphG5GLzJOJGjmjhQnN9JRR0qP0Xdvv0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:28 +0530
Subject: [PATCH v4 04/17] media: i2c: ov5647: Sensor should report RAW
 color space
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-4-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=cRtEaBGj87Hmp8mA7OL908N5mREpt4LN0Ry6e4CQEUc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4kEJIF6KI3fscc21CIrW0NDhMIRQrcgAxjP
 Vzrv4gVBGmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+JAAKCRBD3pH5JJpx
 RcvXD/9Ayky2mWf0tKvu+GIclJOfuEpeYiR1djSdTzk2Eb6YFKT55xYIArXu9NluTJeoadf/vGS
 kEqUYhnM7eKOtTDhujIH55Oxn/fEpcQeZcLuA5E+xgUglVkwW8J07qaOUjhC7qSCoxbrrWkTEpU
 1Dx/s4CvJIO1Q+qohhxdHe2nWpyJVww1OWvK0e7t8d3WkXI0UIIl1ofWXd/T+rYXNDBdjH9DG6m
 jNYErZUKCYjEOJ61t1e5EiZxu30d5glS67M3Bs2E7hf+CH5/R5bMqiExmWbqeoMPem2UufyflH4
 bNk5s0QT2jbcbrx+/u3rwt5o8FURrR2K3ay3ElposSCCDuKlHJLgRE2gfbF15YqeT25WXwz1VMz
 kdkirhIom8CStRuzA1O5F1ih2XPJaAvuUwx002LHd3WwNHKT4vB6j8iD8ZiGB6/y32AtIZ3o1vL
 NJcw59ZvGF3TMOWM1Wv+6Z4DMRB6KJ8xPkf0FOag91LdubSPs4ZQXbhzqMMSo5f0GVvcFf/bKNy
 vFKYgFMUsAn5jCEAdtAA9BkyyniAwPSrRwFnXYg5XduPqyEmpv8nili+QaPu+owodgif4iLV5/u
 SqjVz2nf4VwcZy0m6YZFopkX8h9HI2HVal2BMO0RscKAsEkZ2wkNLwZuIU/tFTFVNSqY1HBbmHM
 /tTUUeZXU/gOpvg==
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


