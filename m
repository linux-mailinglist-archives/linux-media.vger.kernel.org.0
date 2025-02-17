Return-Path: <linux-media+bounces-26214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D4CA384C2
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1326B3B4C01
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 13:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7711521CA07;
	Mon, 17 Feb 2025 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iZViFvxE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BF521A953;
	Mon, 17 Feb 2025 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798892; cv=none; b=UJmnKoGIXykLPqAaVrW0bnjHgPE50eTCjK0sXlNpU7fJG10Ol3UAX5S2ur4pTS/4+T45y41KLHMMdOeXDGAsPed2K82BlSt81AJJi1zvuTOtZ6L56bvSVGeWacfTxRicHEJ8D6O+ZmEAjdOE7hZoLtZ4NVpvHGhW1XEzLhz2QSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798892; c=relaxed/simple;
	bh=zs/zpjxPU+0QUaPa1Vt1KUU/FtlGY4Upb4yOBtUYaPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnVXlghRHquMwC6sR5iLfbnl1KITw+77G7cEkP8ybvI1k1Vq6vpdjv2JqsCc/p8rIlGAlhyR6yaGOwx5va3P52wDUpMkJMqnvBQhk/qXIjKBa/0W0zehwOplwkCuRx1aqmVUZwuU/+3loek4CKpZlLajY74He1MHzhHq12fHhxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iZViFvxE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.185])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BD1D22F;
	Mon, 17 Feb 2025 14:26:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739798808;
	bh=zs/zpjxPU+0QUaPa1Vt1KUU/FtlGY4Upb4yOBtUYaPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iZViFvxElQb5ZRYxzs4Grlp2FQ2oZOVhXMR2/hb6v3+1kTQE46uaYow92w9lZSU6/
	 cVv5wx4OQH5No7AZK7XinGnwV/yMeRU6PuTJrxUPhTkWD3PkXHDyB/vcT1960OqzqT
	 A9lpGyq8ZaxbYBR03iM+wUKC1kbTfmOWXl2dD4yc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 17 Feb 2025 18:57:31 +0530
Subject: [PATCH v7 1/5] media: i2c: imx219: Correct the minimum vblanking
 value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-imx219_fixes-v7-1-83c3c63b737e@ideasonboard.com>
References: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
In-Reply-To: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
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
 bh=zbiKBhScbJyq8ATOozaLCyaAJ+K4hRoEedI8DOVPUSs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnszlKm+6KM8d7Vzt4JlUzU2meQ+P6AQrlGbEvu
 FL6ECN0r2OJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7M5SgAKCRBD3pH5JJpx
 RRWzD/9l9I3CHx03ZWcy3G0qDJuYEDzOAsRdfqNE/agwtSe3hSZcuyDIiFs0QvZ1EWqmVMAWDDr
 KlgD7R64b4veT05l5dQlc+adgzn0zLJI7NxSAySV3mTYk+E51cItgP+4+hdOzxRKXoYkGk9wqgT
 ESvV+yRFZwDUDdu3iyxSS9T+FzDO50+0gPnugJ5Hs8/tpz/5A+LIZP0ihvY80d+ln+ZOZrpdpzp
 H+qq+FiuQHT37TVtqN+iU1MtIYxVTLDhTT0euqXlo5VkH0I79SGZhiBVFNHCzPzJ3SBd0R2stRy
 doFFFIebT5EFV7hpIOcWValj6Hc5fKYEq0HU655v5iG/VFR5JFNiZxfTSyQTdeqWo/xa657POAa
 Qq+aCnonf/sg8EKKv7mOrmEOrJfah2Q+gdlEqM9pTJnd1mZr3YRFrcFTqRWjEpQaB/P54Sn2z4I
 8vtXr1iuvhgot40Z0PUuMLRnzif27eO1afGUj5JuoFWIzORrfefBeCIL5OWW5suCEw4gPJ2WZK/
 5YaMtQIUPAdsTQ6pfRi2cOhC/1l6VmpXnP+FJvgxr+sLdzZBAKEdi7BzgDFBdHiJtzA0PUX50TL
 MiOChiuojGdfAg1tWNNl8wx4YiISBaA/4jFxy/nVX51OHMlhImYstW8r3BERImiufQXSkwMY8Kl
 fGlsRYHkcx2cMJg==
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
2.48.1


