Return-Path: <linux-media+bounces-22014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9569D89A2
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97B34B61C63
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D051B3940;
	Mon, 25 Nov 2024 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hcKT6oZf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0213D18F2F8;
	Mon, 25 Nov 2024 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547236; cv=none; b=mqO38ay4CoXn6E5VD8aogzVDjU+IE63WSAldXpnq62Ku4SL9F9ktD4orVuMkbDuQDxANsnjrjKD6BTVb8r2mAGOSg8TmkyrtnXGQj8QIvUJjjgsI2YGNVTj2h3hexy0dZeWq9nDtz8cfHQgIvvnzs2Z1OIlBplih3DdBWZze3wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547236; c=relaxed/simple;
	bh=7nO4W9FHrQF7HTXU3oQaITzCXQYnWKNMt/Ie0tsFwP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9pdSZovj3ybgiWdAFmU8eEC11b41yVWEIGWV2zHq4R1uVdxCwsMShlI3xWjjvVfKfdk2qfHp/Z0YDAtMDENaymJq9gj25EcSYSuX3rY4r2uB8Y9trtum9dmZKi7jedAFF1N4QVSKCS3qhSgdUx/6HPfvOGZxsg8U/fuTiSlw7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hcKT6oZf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:fbdb:56c3:2e5a:271e:2a92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C654E1F;
	Mon, 25 Nov 2024 16:06:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732547211;
	bh=7nO4W9FHrQF7HTXU3oQaITzCXQYnWKNMt/Ie0tsFwP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hcKT6oZfDBwuxW55fjNY/lM4j1PgNj/CUlptfgHOsT7LQZ6inBxTeABhFlGS6T01C
	 VDRsliJ7sOHjmUgqd9YwGr9jZUFpF83B2MWGCxsBGTu/XGk/RBVXp/4e1jaDdIKT97
	 TEtn3ZZ6Z6QYpfB/taSz/mWCmnMSxr3rzHzXII6o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 25 Nov 2024 20:36:25 +0530
Subject: [PATCH v3 1/3] media: i2c: imx219: Correct the minimum vblanking
 value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-imx219_fixes-v3-1-434fc0b541c8@ideasonboard.com>
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
In-Reply-To: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
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
 bh=FxHt38p3XhnjMDjbzpb+rHs2MXzI2leVKatnUpUMCq4=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnRJKTik5TREvNL3BTMU1y5labtDJuY8z5ftlfw
 j5Aq8BkFROJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ0SSkwAKCRBD3pH5JJpx
 RccTEACrff5uak9YbKOEjml5zv8dlxarMsYTENXSBhbs7Ec/l7pYIiHKElYR7v8wvP3yxVWUCZC
 G+VBMIyQ+vYq/yHI/8t19sFsAHDm5NP8NJ5hmWbZOSwGWEhxG6phBF9Rs41n3rxmQSlZ7koG00t
 IcnL6S3PabLpQu9/IT3FSS+hdWzkTEq5RCJw+5eJ/DcQtVCGKeJ5HjZwccBF3726PQhPlBWso/S
 M0hZB7qwgMvdKelVPBj7UOOYzDLLDBxHJxPeAiJzITDcHe0e011DXIfg2HDXT25TqdPtXtHcP2b
 BGC2aEzkBFFR5WpAs5cBWnzxpbkxn6bi07PNWShUfESM3VP/cRSBu/bt5+06idaoGrwmOqSA5oc
 KHeXMnGw9lQiBp8wvABdb9XLYvWtIjlSkdUGt84P9m19WT453r7REAzJmHDEjawqHe0ZMgh6F9K
 zF4pwntjJKG8MiWaZWf+rkmIwcu+TP7PPd3yLYTytXzjhF3bEbeal7HC4kaIZl81q5Vy9+CBDe3
 iXjPjzjkZRwjgb3xGfrSVUZQLQeZAlpNHUURQZ1xlGwhKtBuoZquK1PBSCOwcesCi/KP9tcR34y
 apjputShGNjXspLW6xte3Ym11KS/8WOSWiyq3Dg1KhLg5o+LO/1yj9s/CMZsZbjAy3gN0nT14G8
 oz7KNyJ7zVEtIJw==
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


