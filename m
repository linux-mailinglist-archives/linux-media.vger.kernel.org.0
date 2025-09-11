Return-Path: <linux-media+bounces-42260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E16B52B59
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A7847B6A2D
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFBF2E1758;
	Thu, 11 Sep 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eVG6lYEV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8C2DF12E;
	Thu, 11 Sep 2025 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578521; cv=none; b=JsBfvx+uq+3XKb4S/a97jraKw5DGYdsS8qsCQZzLRL/32g+B+ioX4ZCAvjm1CVXlUm3oFm+F1bFk2CX1XVZCf/gJ4TIQDkdtzdl9JXUFaUzvdWTZExVbHFDLBx2bPnKM8XxIFoQImgLdOIqu1uX39Ba5FnJ6ZWLQ4eWYtwT1T5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578521; c=relaxed/simple;
	bh=aZlKkf1i1h0XvF+Ov2evMQQ/nZrBsd8Vt1HWgTXZ0yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Exdv2/rBkphCFf2espivxoQRcYJSiIvPT619ve8HI1wuCikBnOiyDjwGtzupPtTkj801yMKxUa8a64tU2DJKyP2uTYGrJKxOxW44nYIG9KL2baR8SKoKCJCCTMkOaN4atiUlcUGKtjl3ddyHzAPyqps9sPvzToTnTMH5aic3wrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eVG6lYEV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1799D4A4;
	Thu, 11 Sep 2025 10:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757578444;
	bh=aZlKkf1i1h0XvF+Ov2evMQQ/nZrBsd8Vt1HWgTXZ0yg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eVG6lYEVTf3CYQNvacSJWT06i1X3AZ82K1fCo/1lqppWjglc9/jqvpnp/pXmKs7qo
	 p78Lum/o/7XIwFBqG2qOFdUXPfcpGN6e+ljLyHmC5XPbH6QbknamOaN35/c9IlysPS
	 v3MOL6olVpoYpex/4hn3sJe4Kp6n+dnyTfRlHOXA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 11 Sep 2025 13:44:20 +0530
Subject: [PATCH v2 4/8] media: imx335: Update HBLANK range on mode change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-imx335_binning-v2-4-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
In-Reply-To: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=aZlKkf1i1h0XvF+Ov2evMQQ/nZrBsd8Vt1HWgTXZ0yg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBowoTvmPsigYGYpX0OsrT6QBfkfkOxVRcmZddeO
 xUKkb2TdROJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMKE7wAKCRBD3pH5JJpx
 RVRRD/9h6/GTmiPiMPrw9GBVM4Jk7LVJufG7l6q95Ng89wEitADtM5Iqil7ypVp5JxDVrBUEBvO
 4v3uRsGVd1tGT603v6POmBAQKoUEfwF3GZ8CYOgWVo2cgcdic/xnJgoZmWOPGEyE61LsREeWvi3
 FiK+XrOVcf35WTXXA9rkhh/klDtm+A3LOLMjGPi63VFubN1/dJhPNRtV2mXtswKYcVGofMkATxf
 IDGXYn9Mi0HIntgoRebxHWIpchzd8oC8bZRbo7B49JqDWmLd8ypm/+PJxglEOBCB4ajZ40F1B0i
 lvn+gjI8AUiC/P3Lfk4J51tSBVcUZsNCp48+fu/PscXVsiSEZ06ASOUQPcyr5GpATcLjPOO+2gK
 Gfd0XT3UQ1XME8EgU2oK4Skdc6rmPKQdGVkuj6WYs35kwP34or9Uy8bFoVu9taBJwCTecymyfMN
 yN/IWGKNf5p4PMk2RQixPDuhK+85vjHn4yzNv9RGZRqXSIxgnfLbY8ZIc7nDR3Tpp6gizTj8ppV
 hOTxkBxhlw1b8C5NhjlTD6IYfcIRkQgdnzC+ziPGvoAtbTcOsQ0xOweyh4mY8maYoVuHibbzpY8
 VyULsenXUGm7XeEUWPksooTKfa/eih8gkRNd2h04IP8UxPyg6ZXD3S+rg3Ms/A1Ux8BQSaZPLR7
 iosvMisgc91t56A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

While switching modes, updating to a different value of HBLANK isn't
sufficient, as this is a read-only control with a single allowed value,
and thus hblank_min == hblank_max == hblank of the default mode.

So to correctly update the user-facing value of the HBLANK parameter,
which is necessary for correct framerate calculation, update the whole
range when switching modes.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 3522a6b1ca14e27c46a55e18e5bf51240ea5a6ee..62a76517ecb263a4fd7e7a593c02a3cdaf3da190 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -493,7 +493,8 @@ static int imx335_update_controls(struct imx335 *imx335,
 	if (ret)
 		return ret;
 
-	ret = __v4l2_ctrl_s_ctrl(imx335->hblank_ctrl, mode->hblank);
+	ret = __v4l2_ctrl_modify_range(imx335->hblank_ctrl, mode->hblank,
+				       mode->hblank, 1, mode->hblank);
 	if (ret)
 		return ret;
 

-- 
2.51.0


