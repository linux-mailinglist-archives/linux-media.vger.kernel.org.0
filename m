Return-Path: <linux-media+bounces-47286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A45C69440
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1EC542B1F4
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B9E3590B1;
	Tue, 18 Nov 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tVRJbrr3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824873590B7;
	Tue, 18 Nov 2025 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467481; cv=none; b=ssKPcRVlbewG9h5o30i6E9w063GKb8+D0X3zqjEvIrZPripT2Frg2mxr0ZJzL8ciMyNxGU5/OnxgjL2v/kkqx2M02ebw8XEqX95GBRrSoVcQ8pGTcu0ZLm2oaWvVWRuXp84W9XKa8rEGHt2pe03JQ5gNwGiFOQRxyVZQ/Yf3//A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467481; c=relaxed/simple;
	bh=lvlMiOHNFbBwE/omPTqvB45A1Bm6s9ZJxvDePfFJ3Y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jTo3CjTL+2WBG7+lb032zs9/wcpUHnBAVGQajrgLlM5XmvetLeR9yZQSfIdKMcpWozEVxqygVYA4628l3VcjjJWR2/w0GHr1vN+QPKUBji3Q5Tr3j4OpyOTMqhLCMtgDOuGdjEFpFPD4O82Ue2R+9RNmpKXyJZh0WinH00hmzV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tVRJbrr3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 151D220FF;
	Tue, 18 Nov 2025 13:02:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467354;
	bh=lvlMiOHNFbBwE/omPTqvB45A1Bm6s9ZJxvDePfFJ3Y8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tVRJbrr3FCGIJq1nl9r7OhYrMOjv1ixgub77IhvQLLepsoFkdEt8fm+SqNQDdGZWx
	 /NVlAnhYNap2EHzPAJAoLXgfx1qDbPMCMHLtnLFXGgR3udC5nMfg6YTOkgKgIM8h7P
	 HH9Xbo9ep4EPE8gPtaLvQWYEYFntSXL6ePjZq64o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:33:07 +0530
Subject: [PATCH v2 14/16] media: i2c: ov5647: Use the same PLL config for
 full, 1080p, and binned modes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-14-5e78e7cb7f9b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=WADhihksI3ywjmJz+4fYQ0ub8IRvrIxD/OvaFCnAiOg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGCH1atkUAdUX00Y7Wq57b/IGMem867E5CGYp
 vRzI64kyF+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxghwAKCRBD3pH5JJpx
 Rcs5D/98DFOOLxo24kawh4HcyrZSVCxcOKEGQr0qJ9wB4TrYb/EMuVhk9DyTMlpIqJyBYhdIyK5
 /euf2Qy5M6IwLfa/9dU/Jqz9ontz8qE3JDC8GmNYCLP9sGnfsgUPgqQkcuw19XEL+Wrv7/RAxBD
 zqFWCjLFtixA9od9f+AzOlOSYTR3ZIVBIq9XnO7xEBmfzndfsMNxrZHg4TS+I5bEpryEBUGARVw
 Olx57q2Y6d5ZImgRYgcHL2HiP2dIh1ERy/KBwfo3ujhj+JRjL2m28G4WebDymQj7bEpeCsIrMPz
 8Hj9+pXG9zbDvgtlx3hr50WbnK/GlvRcBNQLV/zf0C3/VbaswRtdjyjmVeKas3Hb9hXx/tqxOaP
 wBstvnfK9UHZmr6mkkhRftiEjcwx0mfHYGELIZSL8Te1J9m7V1f0M0I6LrQ1+rb2qgcfIbmQxkY
 YZf7T7owIJ+qODRwUtPmg92xysaEFO/CaEr5n+UmOVVdySLZThfqFyZGQd6ZBda7OFryMegDW40
 Dq3g7rmeccbyTdreQH6Sv/nN3T7pPX9sOS+FAvBsLtvXwoBHXCAPOJ3YVGz09JYyhfwEgZl7xFA
 BNu5cdz9OjOsJ9VCOlK457EiOuS4G+LBNv9mALMTSyxHKmz8I+1zAUaAidC+iGw+/PDG+xLNl5f
 dLaa5R+aMFxw3zw==
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
index 1be170e1de3445d6049d44e7c034f9c2dbe3a9a0..3a2c25a6b6808bf1289a2357ac5b79bf6bf99daa 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -252,7 +252,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 };
 
 static struct regval_list ov5647_1080p30_10bpp[] = {
-	{0x3036, 0x62},
+	{0x3036, 0x69},
 	{0x3821, 0x00},
 	{0x3820, 0x00},
 	{0x3612, 0x5b},
@@ -288,7 +288,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 };
 
 static struct regval_list ov5647_2x2binned_10bpp[] = {
-	{0x3036, 0x62},
+	{0x3036, 0x69},
 	{0x3821, 0x01},
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
2.51.1


