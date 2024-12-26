Return-Path: <linux-media+bounces-24095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C679FC97D
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 08:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACCE41630C8
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618B51D1F56;
	Thu, 26 Dec 2024 07:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JfjjWSTT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3B01CF7A1;
	Thu, 26 Dec 2024 07:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735199441; cv=none; b=uKVExTV2InOxwepOM5FU3V7DHrujJVJ7uHBm+V70gNHdiRVnkcMLk25Zw16Uym3CGvv4poBigfMl3IFf8luJG/1eriB825PCozMsis8UVT3PQPrXm3soR2g8GD02LlmzoDJOqSiNVYSi+lEK0oBdF/SgzK1VEEH56nNaZGZoj8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735199441; c=relaxed/simple;
	bh=gw6U2JG+YSx5CmmarPuDTvS/aLofbuq/YU0A8rIgCgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RjtJcrkaaUZoAiQAiWhsTu0+0vvEMinB6BA3r3rMbd9UBEoLv9zpDrjh1beyc4oaKDFdkqVKDQc91AjcxaXAGA+pu6uAkyzSOl0uJYRQv4qofG/uVToSY4PzsfU3P68K/LcgJs+B/ACOG6g+Sx/10qb22PDGdZxOJywr8nEJ8BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JfjjWSTT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:416f:6c:4037:639a:e90f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E232063F;
	Thu, 26 Dec 2024 08:49:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735199395;
	bh=gw6U2JG+YSx5CmmarPuDTvS/aLofbuq/YU0A8rIgCgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JfjjWSTTuNM+Jx4pVVRDS8/y5KHtSyQ4cMjsTzEBIaZIomKWrb3qzgM18RbSqC9+K
	 J2FFvd/xXB3frNpDUxHG9ohjWM+hkDsu4ICV2oPAqnPkjcm0N4sz89ylh/7XiQ7CZu
	 UQDyBI5hnS4Xw9YUNPw6gg1jUaZgZScS8moqr9oo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Dec 2024 13:19:33 +0530
Subject: [PATCH v4 1/5] media: i2c: imx219: Correct the minimum vblanking
 value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-imx219_fixes-v4-1-dd28383f06f7@ideasonboard.com>
References: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
In-Reply-To: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnbQrCFrvodANxB+vbAZzh8V5rjtNa1tidBIJ47
 /bXxAPMiZiJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ20KwgAKCRBD3pH5JJpx
 RderD/9H4+MkJrgYg+xmk8RjSxLSn43m0TKrfapi2fNNE31UzrEkX0QtB0Yjop0uBjl6WQmkt9w
 Y52BO/7xoUIYvwp+KaPj5NSyZI/s/bWZaCrxT3vT586hS2WRbLPRSgsX9Fmazl0CB1M0b+9syV6
 1aqAXXJtEMbA3tGNxg/z/d3csn4qx266ArOO9R5QX9Sc8bU1UEOS2pLTwGtISctIg1/0wBOS5JS
 4eMIWHrZq5OvcPw9PF3pUcvmkQeya+Auo08bP7UE5oWXP+8hWevOxsKRFAwJpW8OM37qfFYqB3d
 W+A0m9Mv3dvbwFECQlLcRS9sXPl7TtrzqvuEonCbo/cFSIHwffZ9TTM2haDGdl+EAl/mth+vRe/
 PTwNbypjDawhEQjRfiO8X4ZDmbofP6zXRVHHWzoHJb4Yi7f5tCdV8RMeHB79HtqxT837NRUtZDG
 MTlgcPr2sJj2ykIDtEKfFV0O5TOUp2pv440jJVCYHjPBhTWx92T+dDQX/2X0DKaTZbcdN6B3kUy
 8i20v4LR7yaxkdKWlC1tEQc8Gqf05/GfDRvIS/xTVQEZKepeoDS2Dg8YvySs5tP7ty3+lh8j9bR
 VSSDtD3PGpMYZXQVoZtIW0v0kwGmRxlOAx5kLmnAjkxnpQP6YuemOmIEi8VgcTpJfPRCcjujW31
 43twZ2pmycyBSCw==
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


