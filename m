Return-Path: <linux-media+bounces-42512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E1B57077
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1F217B7D6
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 06:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E222877CB;
	Mon, 15 Sep 2025 06:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QGTlfqcM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B127E045;
	Mon, 15 Sep 2025 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918377; cv=none; b=BYWiv7iSCLe0SDjBOOY7YHNtSZcZgCGjp3NEsoxMNDaTeld+r6VbgefcqUK8FlaqtvCN3ArzIHiRMGkWm+gYuR37hxhBgF0Joj5SdJ621pKXsjQ0Q+GIN7B9PMu3XG3FDBtMZrEV514vvVjeU04iwas31cc5AQtyR4IdPIu4MpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918377; c=relaxed/simple;
	bh=f554b4UEqiVHHa37Elp5PwAy1JMUtZkiY0I7rFW4grc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuMpo5KGmoas9pd56JEeirhZYazrTeGYO+PNkv7G0UCnREtIJZjUI3LY+RDOWSHOR7b/OtQbtsdThngeRxF2vvEq9tCQtX98O05ChVXiLG9hyTwK63vKy7T6hw+4HRbPCHn6LjnYPSoRE+YASl3/h6c2ANKbCPJwpntkezDq518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QGTlfqcM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2dbc:e233:e1b4:15e7:45cd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5372AC71;
	Mon, 15 Sep 2025 08:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757918296;
	bh=f554b4UEqiVHHa37Elp5PwAy1JMUtZkiY0I7rFW4grc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QGTlfqcMYIcDLi50odSJCN27k2PldmzG5VM6Bxb5n4sYetT765NB5NBBuXW9sEaS8
	 VnEJy4Scpi74l8eVc1NqMCbPOuCeULnQKly37rPeaq4hwiD/sQyHmMPlaExLJduw1I
	 EITxZKaewnPtqWRugo+lbe4A4WeAGj/OJTcLAjUo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Sep 2025 12:09:07 +0530
Subject: [PATCH v3 1/8] media: imx335: Rectify name of mode struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-imx335_binning-v3-1-16ecabf2090d@ideasonboard.com>
References: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
In-Reply-To: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=m9o+E8P8Et1zh2okIxdKsiF7R7Zf9sUf+PhNJ2zoZjw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBox7SQVyXae5hIWSZRXAtKungGIr1lOo1TSY10Y
 6VYlIcMI3mJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMe0kAAKCRBD3pH5JJpx
 RXGMEADPXyYq4acXRtKvQ5LWHJunpFXIam1dXCCt/KU8rntdSx9YO3ZseHFBdteFbznxUPVs+LF
 CitjGLUnFpfetD2gogUxcTHTEYvASNSJT/x5fSZFcqr00MnoMiruNA04wq8EmkXDgJQoBVaNC/K
 BRrffz3SnItt4ipVX4NZh1JOcNwbCpWSGYFN+87B1V4BepOZ5g/mV5iEqOX0iqWwcO4E/JZVRel
 rxpQbfqv/xEO+bINGVk8FXoxPldopurhZPfOs1RxSBJFhm626cjvvUIwDGBUSteKquqrvYieo6B
 MayBrOe9Sm3pxaHwtSHoJMO1PgxWjwKaclWwyhvqBI3PTlzxZh9CKhmPFt7YT85It56hJIL9O/w
 EPXcOBXfafTN8lO+UDhlHyA+wJcHNnEFt9LKKLZawuHlT4yuCLpIU7otCfPChDYuhoYZyF8EnL8
 gNEJidLIMGWcyprzUrzYoTRAYQ8YgrwUX69+KyekkwMt/y1AFwgglMEtWsit1g7m4Q9QSYS4pjb
 JyxHisde0rYF6K2g6okvP56Z7+F3OlVWq/xo9P/WA2A4BW8JPPEoi6ju+T8Ri5QYNl7LcvPjIqd
 GZxad+ZwKAWFUGdel+SsDRibjrxEmPxp0CBO/K+2MChhLf5pqD8zWWcKUxKggZ7+Vp5YvriEbcA
 c0+RCtzKiBsFzxw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Umang Jain <umang.jain@ideasonboard.com>

In commit 81495a59baeb ("media: imx335: Fix active area height
discrepency") the height for the mode struct was rectified to '1944'.
However, the name of mode struct is still reflecting to '1940'. Update
it.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c043df2f15fb25b3a56422092f99a1fd9a508fa9..213cfb7276611f522db0643186f25a8fef3c39db 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -252,7 +252,7 @@ static const int imx335_tpg_val[] = {
 };
 
 /* Sensor mode registers */
-static const struct cci_reg_sequence mode_2592x1940_regs[] = {
+static const struct cci_reg_sequence mode_2592x1944_regs[] = {
 	{ IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
 	{ IMX335_REG_MASTER_MODE, 0x00 },
 	{ IMX335_REG_WINMODE, 0x04 },
@@ -416,8 +416,8 @@ static const struct imx335_mode supported_mode = {
 	.vblank_max = 133060,
 	.pclk = 396000000,
 	.reg_list = {
-		.num_of_regs = ARRAY_SIZE(mode_2592x1940_regs),
-		.regs = mode_2592x1940_regs,
+		.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
+		.regs = mode_2592x1944_regs,
 	},
 };
 

-- 
2.51.0


