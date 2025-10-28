Return-Path: <linux-media+bounces-45750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079BC134DE
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FEE05E049B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA152D97AA;
	Tue, 28 Oct 2025 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dkF4qZ70"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1963F2C3768;
	Tue, 28 Oct 2025 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636542; cv=none; b=m5BBq6bHBIaqFLPk/YANt7XH2EAqvSWtUb9M/7tiOudnokcjan4RZDMh6649YiwoqnCt+kA5czFNHyr1aKj3ployMLbV9ZogJwBFs0ZzP9WOcwryVW1XUaAnz9C8yraSR6pnSD5+kKXxPuQVfhlV71+cyUQYNt7/uVyWeT2shsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636542; c=relaxed/simple;
	bh=qHR/xmbUa+4DKnxIvNk+ihQdaa79OzKFIbf3A5YyeCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EYBiZvBYWBIguBhkhO1KDQqumxHDNKcVbdF4yhoHtJzF7OQthfR7DWdTVE4bRX2dyu0qSuUR2dUyAHDl++HSkfJJzYHSe1gptuh5kM1Uvh/acRnhIE8StaVZReOAikFMmkjhbCpaOT9yqkLWyzJkQUV8RS4QtBxeC/QVsHzM3Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dkF4qZ70; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41D8816CD;
	Tue, 28 Oct 2025 08:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636431;
	bh=qHR/xmbUa+4DKnxIvNk+ihQdaa79OzKFIbf3A5YyeCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dkF4qZ70rCaErhKPQNYdYvowptXAgJTFEawzSgeeyCT555SQMJlDVbtUs9MvCTKBi
	 kYPP79SLjyz9Z6e4W93rW+WIAfzrBTGfkoZBx4p5N+C9qdfuD+UrrZzvv9mxIhFXbg
	 UXMTKUX98epY/yJ5M2I64feHxAQzWVJLO3GIXV4o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:23 +0530
Subject: [PATCH 12/13] media: i2c: ov5647: Use the same PLL config for
 full, 1080p, and binned modes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-12-098413454f5e@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Qf7Yqxt4zOy5GHKzlAXyeUZIkGJ9i63am4o+DzG62vw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHB1FnkJX+fwmSeeu77kSksuur+a/SNSfxfYr
 QuVYiThg4WJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwdQAKCRBD3pH5JJpx
 RdhdD/sGtnJS3Wq4+lIC7KR5H4N51vkR0W8W4dFKANZ4jKgER5bAK76PeoXq/E/0Dp5TomDzaA/
 oi0xmfyvSr6yCVIIvCrCLeRy/SG5FIc+9ZRFOqqfF+zr03jQb8zrvFFSUdU0gAXyF4BiY6zEeVc
 MKfjlrBJtDPFIfoIYxL7ygNKe79cnsgmM5QZe+d9ey3uZSPEdkrd43THjhI7yUt1kAedFktRaCK
 8uF8Q6a9slsfA+WdSF38e9UqBxaY7THCu3wOHw+i05foQKWk0GdN+dExFAOawraJrYhQPMIp4Jk
 MX+Mo2LGKNxi/95DMjaiFGoh/v+x6HyxVvpFgQKajdEncI2r9aSNzAneVtYZJG91YSqZY1cgOCo
 w0f8IUEzOis9R1ut2hzn378UfUUXq3dGYB6UNn1Fg5/t3KFz1SXmREYtmT9imOF5pyKkTzskSlS
 Bn8ZYXCVlO/ok9X+LFmvSnuNyaEdhZGK2bR//IdsxNyg6sNFCBGsAHQrJUih+nyY+RX+fyu4bNm
 GKWm77iLhWWeWg1ABaUNPXWkNRWmj+ASZeiOsoi/y4XL83Og0RmxtxHd4s1Ccd7Oic7cpIS7Stb
 fs9NLCACuW8EsDyu1/SdWTaH6OWBCWOMMs5cILvIZgOfBJFfkjGIB2x8Gq1wcdYOGL04cuLH8xW
 3+MerC/8CCQYSTQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

In order to simplify the driver slightly, use the same PLL
configuration, and hence pixel rate and link frequency (to be
added) for the full, 1080p, and binned modes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index a0aaf83759e089aea727c44b614c6a9f3237586c..be0b96c4372ae0c6d8fc57280b195d6069dd7019 100644
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
2.51.0


