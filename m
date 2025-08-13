Return-Path: <linux-media+bounces-39741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C821B2427D
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70CF7202CD
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D902D541B;
	Wed, 13 Aug 2025 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pml5g5LR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B182D8376;
	Wed, 13 Aug 2025 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069674; cv=none; b=QUDzGjoA3XOOyPocDTnWKQe6P8Xhfwc0QRQbqV4sPWMia6bntTi2VQfKbXN47FNhcHQelwHsc8R3EAVr2wbDrbLM9oHHuAUMip7Y0q1d1zKwU1Q64Pr54xOvhLDe+qtlER2Wx3YKlHvAklLbxxVNagsxvVkcnNcOLw2jkZycxdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069674; c=relaxed/simple;
	bh=tCbtHP0l24CdZOmNuW2EwX1W3haahawiSHSblfoGjP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1MPTK7gNvfLaGScewPA9SEFS/y550VB8sgJCbmXlDXFEz8HhccZuSXq17HRV99pnD0Qi7MnlAatJcCvPuM3UmBmM9IGKBXJ4UeygLBMs5ghCKgVUKKVFkVSzvEs81gU+uQGC4djzLBO7sB2/eIVJ6yX2caO6m3Uz4uMYa1JU24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pml5g5LR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:bd1a:669e:3dcb:5a6b:a905])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 152123A4;
	Wed, 13 Aug 2025 09:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755069617;
	bh=tCbtHP0l24CdZOmNuW2EwX1W3haahawiSHSblfoGjP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pml5g5LRsTB1+9iZGFeax8cxer27Z3VGI3rz6jXn8rAnNmGjnYQh6okWm8M0MLkK7
	 Sb5+kWCgyEBiCesBBdcpn6qHDUjjMFr9lS7fW+hZN57pASeXuWWijMhfIgdb6yi10r
	 VdmaHBf/ziL7/cRS8sbSvHEM1Yuy3tJluacWdQZ8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 13 Aug 2025 12:50:32 +0530
Subject: [PATCH 1/6] media: imx335: Rectify name of mode struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-imx335_binning-v1-1-a42b687d8541@ideasonboard.com>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
In-Reply-To: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=dvqqAX7Bxitse8vWjXeACNLn21gxhCs2yMl5pE/naOw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBonDzVvlwaDGun4c/DdflZCC8Ju6YQ9Iqs2qhCN
 Bx3kHa/k+eJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJw81QAKCRBD3pH5JJpx
 RdmkD/9pSi94I8BDh17WAskTbs2EL92Wv0TQBl7G5msuvlRrztFs2iATFT/NGdcTwFeLlX2+eEh
 chdxpPvlH7G3FxNhR+tIbqSD72QtYlg9YRGRi5/tFDuqufb95onzp4/A9TQyUZ0SmT4+f0D5Hhv
 cR841Z0T1bxheq23AGGqVmjJvXOP0v4XtTMSPHVhj/Zggbb+tuQLsp1hjQckB39vmjfNkRASUON
 MX9P+8b96otdVXXhVVz38loXFnzBRSwagLJGe/AWsqldxdASOh5pO5IqfVfFhc/ZBYoP6IivcXy
 6f6Uw3cOkABHWEWWieK+v9w/HRb/T1+ihRrcYt1qwFQKGVaezqrUKaJN6Ew2tlRnaGnUyqjaSKJ
 CwRSfQG+NO9ffWaBeEWeGRtGiJsR1YRxxDv4+peY3KH9qQSorFwggHTrYidxus7KUTTIDF2kclW
 8Fv340YmYdzqgUnvXigrBR6oQDVy08I7e0PnJq9v4ng/PQBwSDw0SJQyr8u7AzryjTqqViLuqoU
 yiJORhiX4oaQQAXla4GnLhgR5+FDdorNxZb/blwjwEOw4+GzgwQCqz8FVEtOaLY1Y84JhHpYr4C
 l3P+EqbNFXOvaoft/tFir7Iz7o1QU3dtJdHojmiYGP/tBFlsF+aUhcHJU+KNBiWaxjQ5AhNQMiF
 ZNrP434aYfc6qhg==
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
index 9b4db4cd4929caf83596e93d2ac3de2f54e892b0..33f92a3062c14251498cc65f14cc34cff6179f78 100644
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
2.50.1


