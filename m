Return-Path: <linux-media+bounces-49301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D0CD53AE
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAD933026B0A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE12310652;
	Mon, 22 Dec 2025 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bwjkuBsU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16443101C2;
	Mon, 22 Dec 2025 08:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391438; cv=none; b=e2IfZXekRu50gmd1zerjZc8X+NZ0IRQJOK4CubOHRW+T3C0wLuXslosUJ1yAxc+VlvqaJ1HkWK9jntDnxUi62wJ3kqOwlMq6FRp4Wljln6rfiPko9e1xJJV0x/bOVDnyWb6yY/6XKw8VUHRzk9quTZBnl3mdV17fNtQflcSrjpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391438; c=relaxed/simple;
	bh=rD9jVoSWJxuD/EXu9sC+ank4jEX6P0ByyoiYiWcqATo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCoV6BegzyVXVh48862FUCdfmL8ZAp8b7qDOINCwe1OPnP+yEnrd3qlWs9ccPIP/FHOD4jt6aSj29ROxV26h8kHO0dXySb/FicJ1BXE1GGGlPz0RHwL3ZAMrUrBNUCbIBBi0fCqdaEv9ciigw4p5Fk2qqmwpfm5wlPF4rijLSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bwjkuBsU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A01D1783;
	Mon, 22 Dec 2025 09:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391425;
	bh=rD9jVoSWJxuD/EXu9sC+ank4jEX6P0ByyoiYiWcqATo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bwjkuBsUeSvfLqhOGWbiUeaOxAoQRxsmg+QuDRESm3JoXz+VBIB0GK/KWdWgeePZz
	 lCzbfTe+WLKS8iqfRqFgF7z3lWD3OVLa71OWNT+VBp4uFJ3kPFvEH9mFxWRdCB35kq
	 sA3S2/URP/hTSkMeJrBdgymhybk6WWL5MLStNtHU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:39 +0530
Subject: [PATCH v4 15/17] media: i2c: ov5647: Use the same PLL config for
 full, 1080p, and binned modes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-15-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=7Az7J2QkJ922Kjzd6iGn1ID6vIgiisG2GhX+DYVTznw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4vYtlyVmotIbqQKzRfKcyIRfyPFEn3Oo3gC
 3CtYUXz0gyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+LwAKCRBD3pH5JJpx
 RVHwD/9ue7KQZXAy2vZ/TbuLQareG+JtP9rgy53r7+L4Fv1HU5ezVWGxugKqYB7OIKeAfWRqjEe
 3+NuZiMG3kOIozdejK0YkCXs80FolbhfUtWjLLWe0fV8GwetOsBfz7Tr+8C5mKggHb1Y3V5LYlA
 WAIY7BDFUlzgEQWR/Mb/sl+RSccgQ/CIkSKDHuNkQUnlut811mplVKdSzVtiCo5bpookuFRGN36
 pg6j714cGqS3ciALoFbtduN6dtRKSy0l5Chv1O1n0Hse+q6J4USS1pC7HUFgy1ObnGwtIxjb5gs
 PDmgXex1LnPJOVVk6/Ov5F7P1mt7+UF1Pf+9fCfkZYYTThXh4F7XwyrDkU8rEP38/m9biaCMfYJ
 p+2iNuWA+rweEGoPc1Oon0z1OjfxbFCKRKM+Q+2nnLsQ2idbsjgl9RXIxhJfOYgMMpARqICL6Cu
 qj6CHYqjR8vVnJS7HxM/oZk1HMVQsKL8KbeHIfuIzv0N74QRxf6DgS2NQtily72XIdi7eK3utaA
 AIPx8sX4SrCQufYbz9zf606AFfwRE5rit42oAclr8bvYMKnRRjmfXXSXQHLfZncNfTrsI7Fq/gR
 rhZA202lDgtwSjq6gnjgHzf7OhgdrbZ70u06pP0H/ETO7VXOPTLDz7YdORXQ0boGQNrkdVLSk92
 CocSTKwWiOhOg7g==
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
index 13b703f39b106b5ac43db23612ae051e475bb734..d4a13e17692ff178e9dc257bcca0e44c92705825 100644
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


