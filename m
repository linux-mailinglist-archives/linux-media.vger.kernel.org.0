Return-Path: <linux-media+bounces-45985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A882DC1F093
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E11864E8523
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D41333757;
	Thu, 30 Oct 2025 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oFQqK4Vp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4003339710;
	Thu, 30 Oct 2025 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813798; cv=none; b=mH+oWB9XhSDsWfLXIrU8RB7c+kV1NBEJ/ZDgIlBw8s4IHLEMDLMJEY5H3NbdtxlryUjLSC2F3lRih9crbg9HuRFYiUc8VmbvxuUrcGnoyqWnB5uLvCQuQpQyQqLZxkRj9+v6k2t4GPDdr174PR7jkD9t9x/gDRkzTV7C60KLtwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813798; c=relaxed/simple;
	bh=f554b4UEqiVHHa37Elp5PwAy1JMUtZkiY0I7rFW4grc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HP9/2Mi0s8w1+WQZ/EjIXJ5Vm5CiCM7069y5Q9AkvfBSj03+qIZ+0CcxfIG5c5IEV1Kr+t/Hp5UEJJYzKdYnX846Lh+ZC3NVTL1/2IPlkbdNp9LDmIlWI5ZjeLf20Ngpk4VryLoZzz1svzBlRHhFWC/Th5+QmXMymJoZvwHAm4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oFQqK4Vp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1258EAE;
	Thu, 30 Oct 2025 09:41:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761813684;
	bh=f554b4UEqiVHHa37Elp5PwAy1JMUtZkiY0I7rFW4grc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oFQqK4VpPOVJvFfNodFiRl4n8cX4Ew8UkX8Mmo95fDPTDnQbwqKcw/1Sn4Y6oFKW9
	 wK+ROQ2BFzf0nyOLCarVUsGh8fh/NAYvXqnyY8NB+b06V8Talcx1sZ+SrL3nzQH5eB
	 farA24Kgd1CIpniO9z36tzeidBIVWORebiSDOp2o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Jain <uajain@igalia.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 1/8] media: imx335: Rectify name of mode struct
Date: Thu, 30 Oct 2025 14:12:54 +0530
Message-ID: <20251030-imx335_binning-v4-1-534f82415aa7@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
References: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

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

