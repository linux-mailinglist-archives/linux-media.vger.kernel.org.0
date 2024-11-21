Return-Path: <linux-media+bounces-21744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 411959D4C94
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5020B26C72
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 12:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDD31D6DA9;
	Thu, 21 Nov 2024 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d2iowLUk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136971A3BC8;
	Thu, 21 Nov 2024 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732190951; cv=none; b=nE53e2MSt2NrOX+wPyf9biEH8gKdONdnfYlHGFhinwM3FCFjKfnmfrKQLlg6MaCC69nvCvQ7aGmXRsX7o2Vg6spgINSJstVP4dPvFP0MD86OJGOx5ZwPPpeguMqVUYx25WmBPWwOxsdMs0QN4Yos27Eyi3v4BvP1MA7f7LXoopg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732190951; c=relaxed/simple;
	bh=7nO4W9FHrQF7HTXU3oQaITzCXQYnWKNMt/Ie0tsFwP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T8YT8OWS5exx1NW2GY9BLzTPMLL0do0f+nY+DKIbB8jb0tk5c51oSV5BoZOnWzpfvLf6V76VGoEZZmjZxXRUumVeNcYEduqo8xr5Vd+nWlh9uOW47KEWjyGrgqY0ac2k+TOqmDlhXbemkqepdGBJNq4cBva95lh0wgPycICNAj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d2iowLUk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:10f2:5b4b:5292:ac46:e988])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 121B9219;
	Thu, 21 Nov 2024 13:08:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732190929;
	bh=7nO4W9FHrQF7HTXU3oQaITzCXQYnWKNMt/Ie0tsFwP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d2iowLUkB+9jHR9X5I7Px3Ny2Y6bjd8xl1CkbBG+583bgvGFAEX9JAQk924OWEOCz
	 zUtPQ8C03XASIX0mlsjs7rcic64eTzUD0wp3yoaj2PyMtvvK/yelH3KyP1+ahDyrMw
	 3sutLTN8zx9NQ0riI1876hkkeSG77qyrDm0xu2Lk=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 21 Nov 2024 17:38:02 +0530
Subject: [PATCH v2 1/3] media: i2c: imx219: Correct the minimum vblanking
 value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-imx219_fixes-v2-1-7b068a60ea40@ideasonboard.com>
References: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
In-Reply-To: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=FxHt38p3XhnjMDjbzpb+rHs2MXzI2leVKatnUpUMCq4=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnPyLVMmRz8m+nEx9fJIiAjPcqVRX3B6po8Un+C
 v8o50joKY2JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZz8i1QAKCRBD3pH5JJpx
 Rf+ID/wK8Ii1RBWF0Enn5szrgt35LizYvwDmewWsg+dn2/A0RCcp95Wl7PgAhrzufO6Sa+hnVKo
 gewIljvyFYfEft49IQGduxOevoztBcbwwIMnDT1goeFTwFoKiply3JN3uVX8+MZUGMQCG5a5zKQ
 CwTGT5apTnwvUyt1MJjEPBeXkFPbAjS0b8v0ddgObqafLPBWXoehX7wrPMnT6U0gpNS4gATzAhH
 8r7R7zbAGQSzogNIEHDjGcOEelE2iX1Hu87WKAo3PdJmkLoK2ZnBgG8HVFQHmmRkkFGymyEE+vc
 +LbNlcCN2kN2ZUMXYL1z3Wm29mDiWMy1HdXBZAgmGerfBe4VXljR06BwINoUlPDbqg/4gSHbfBw
 r62gyD+6TW/N8PMykLhoF5UQnCzXk6sXlj+5AK1eY2yOMf2zfBUu6w+0XV+b9e1Dq6KI4jPSg1L
 E9CqzbZc45Um786pu+lTYVwwPg/QnOBQaZ6D/7UrhYbmhdsIVp/AIT5iT9IsuAnOwL0sJDuWlWw
 dIM0X6UxWpIURTUpcF7LNAEt3TSqKujeYBoGIvD6RBvQQdcm2hIByG16Orx0u89luNAohiFV8Bc
 lk3IyUh6XUoswGsIxeFrtPBZiEEU3ue0+16A+uldZTfLdtHXHJ6xfbwLa6dQ2ByggmAKTTDPIwr
 UJQml9GjjilHyCw==
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
index e78a80b2bb2e455c857390b188c128b28c224778..f98aad74fe584a18e2fe7126f92bf294762a54e3 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -74,7 +74,7 @@
 #define IMX219_REG_VTS			CCI_REG16(0x0160)
 #define IMX219_VTS_MAX			0xffff
 
-#define IMX219_VBLANK_MIN		4
+#define IMX219_VBLANK_MIN		32
 
 /* HBLANK control - read only */
 #define IMX219_PPL_DEFAULT		3448

-- 
2.47.0


