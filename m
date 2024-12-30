Return-Path: <linux-media+bounces-24150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C199FE2D6
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 07:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9BA8160C95
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 06:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B2919CC28;
	Mon, 30 Dec 2024 06:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hJDtJrj5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FD319882F;
	Mon, 30 Dec 2024 06:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735539115; cv=none; b=UiM/x+FIw20FBLjYL5DoN1WTVC9FtWHmdehmAI/IzkI40d5jRUj53Qtrm3W/WzrKQd6C48X8v/bo9t9xu5WWB+Y7fpbdijSpXLXeRN7sYyZg13TRVaxwRKFLinsmRgPbzo/dXr375TZm2XhiblWtmhD86TzQyG1Qh0LBbDBhkCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735539115; c=relaxed/simple;
	bh=gw6U2JG+YSx5CmmarPuDTvS/aLofbuq/YU0A8rIgCgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPeAulxvv1tBEKp2BXCRuRKL+gNWLA37zfYD8cnQeo3NopYDsYKiCgppqujY2yAgfFG6HZzSizWozFtAjOB3UEOE3MHuf956oYLnUKGgUG5OvBMq+gON9wsgaPs6OtBqWp/QjAHNt6xpsj1W2CSvl1vFfB8Mjey9CNFRvaxRYZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hJDtJrj5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1AEE3DC;
	Mon, 30 Dec 2024 07:11:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735539066;
	bh=gw6U2JG+YSx5CmmarPuDTvS/aLofbuq/YU0A8rIgCgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hJDtJrj5Wz+DD/bqap7iKYO6NaVDR8Rizh4IyEVB1DDqjidCz3bd2BYGj1eWZsrBL
	 aQPOPmlUmzH1aPcdn7jmc5axFBNOnQJW/KAf37zu9gWjv4hYFDa0OI/ZYAAj/4Nb6L
	 eHyS170fyMnVXvS0fuVFM6elVfwC2KzMm6M569Ec=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 30 Dec 2024 11:41:18 +0530
Subject: [PATCH v5 1/5] media: i2c: imx219: Correct the minimum vblanking
 value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-imx219_fixes-v5-1-98446d816489@ideasonboard.com>
References: <20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com>
In-Reply-To: <20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=iw258IJ7itA4hKvQDhU7RsL6SbTVrRcFIMh4c4XZiEs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBncjmKR9L+iU4Q++jezKImstToHcifsQHjMEEQX
 zyRpWmGtP2JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ3I5igAKCRBD3pH5JJpx
 RWNGEACo0bxH8xODh/mIU1CsHsJTJtw8V4feva5C582D8ta52ql1xnbrcrGFC7nuZ65cUW+d6il
 lAaHN7OYg+PY10GSIZJ6NUElcjyuBV54zZUaE04SsCpoA2aZZol7PwWRuaFCvNIpPnopWMrFH81
 PASp2aV2etm4PlQDgH9c/z3cODHZG21vNbcRzJH5rEU4E2VqMJn+b7+4t++c/3ecUkLns27J6J7
 6r4Iu6wNpp2omnY3K4QPh2maCa0GLIFH+3TwxnDEjG55ZtH/2c0y3W2DgC14ORGTSpCciond/nt
 8M7hnIq2T9/pGD0/ctDexzIhnwxuUMEWQDt4PLvTtQafPDCM3mOXZHoALXZIHjinp2dy0TUpRnN
 MKTSIhGs2T74quVC991prqeFgTkLsIxtgpFgTWt+1enZgikNbpDCRgH7qPXM9LqcHX/fW3Gt9Sp
 1BmPS1m1+d8AIlBGqyZrzFOuUHXOYkM7rUtrAVH2D6WFVvA8JXpW0K7CNbplzSe1IqVtFqJy9NZ
 eVKzqr5J+ik7I2+hnY4+zi188GIXe7d+IrBGml7ledM6s4IIM134ewK1IXfyCw0Pj2cn/9cu+li
 nKZEJVE50G8krp0ORelJo70R10Q5EPLktvTvxKdp/4F8ev9Qi+wNaZsu1QHKiZpJs0FLNCj0HPA
 peEoSX2nbpHjFZA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

The datasheet for this sensor documents the minimum vblanking as being
32 lines. It does fix some problems with occasional black lines at the
bottom of images (tested on Raspberry Pi).

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 2d54cea113e19f68e1553ffb2e4c78491dc80acf..0486bbc046cb9c36afd911eb799c1b010a01d496 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -73,7 +73,7 @@
 #define IMX219_REG_VTS			CCI_REG16(0x0160)
 #define IMX219_VTS_MAX			0xffff
 
-#define IMX219_VBLANK_MIN		4
+#define IMX219_VBLANK_MIN		32
 
 /* HBLANK control - read only */
 #define IMX219_PPL_DEFAULT		3448

-- 
2.47.1


