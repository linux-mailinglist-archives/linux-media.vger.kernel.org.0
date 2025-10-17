Return-Path: <linux-media+bounces-44837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF05BE712E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 10:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9696A1AA00D9
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C56227A47F;
	Fri, 17 Oct 2025 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Isezijib"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99A4272E71;
	Fri, 17 Oct 2025 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688869; cv=none; b=OZT2EfLULVl/afTnEhSPDoWo9qk85zgTDRwoQS/9dXKhxr+UF1TeLH1QLFpm6N/29+vdaQy/fBQ5aYrgyCGHGnB+CNJTfo///Zp9K1JGqq6Yw0Ycrdoj8L/NeocB+W0eNl03hfVrK0J2CPyPyBPGcjyaA9Y89Zno25MgKDcFyl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688869; c=relaxed/simple;
	bh=bLLF7pXnroAzoxCACwBuR51ZVSysgYA8p6ZxfKRG/c0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RU4pGQ7yl1wyHTxhVnM5Ys2K18rkbu12f42KgWr4IGk8QAt3Vy9XNcZXevXAEjLn97fWtEmlgkpfjidKhyNp67VW/1rUW7YhjgRvR3SLGIwzTAef50EABGwq2HLmOgWtnrstDw7kDx1jZDdE0NUg+3JZSf9b1KjIHvGi2LwYJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Isezijib; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:2112:eb18:6ce9:5a39:76a2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7C6B1E33;
	Fri, 17 Oct 2025 10:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760688765;
	bh=bLLF7pXnroAzoxCACwBuR51ZVSysgYA8p6ZxfKRG/c0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Isezijib5jCA15pS9llY+/Jjx/HQSX3bp9jQvBydKLBKBYzYn3b6vhoWl32edbRS/
	 7lmihndSwnuZbQV+c2UMSGUn+HsxLGMGIRGLwxqn7QHOV14CxhQPSAywXzau0Tqi4p
	 Oh0Yb3jO7uUlz4RNRBombIwMQRMvPVnkYs9JZpDc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Oct 2025 13:43:50 +0530
Subject: [PATCH 2/2] media: i2c: imx219: Simplify imx219_get_binning()
 function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-imx219-1080p-v1-2-9173d5a47a0c@ideasonboard.com>
References: <20251017-imx219-1080p-v1-0-9173d5a47a0c@ideasonboard.com>
In-Reply-To: <20251017-imx219-1080p-v1-0-9173d5a47a0c@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=bLLF7pXnroAzoxCACwBuR51ZVSysgYA8p6ZxfKRG/c0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBo8frPWqQaztPUJfPqg51uYx8mzvFjGkEpByfBF
 ZNK6Wq6BGKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaPH6zwAKCRBD3pH5JJpx
 RbAYD/9SrUJjZaryC15JIFZUaHeCH/uYMD3KPWjDC9vl9fzW3xXIeTpHd+GPUMQNFWMcr3YsI7n
 o39pKsR6K2luImh3TtNfN4xv/++Xp8DvxuZiwnwg6EK2LsFoZz1ktMSTY+AlZ7OH+qLiCVvf1Qk
 x/ZmpYO74uVeUSbGPPM/8zwa5r3CZMQYdirxFk8xCbTGJP2mw7j7NSBc0POAhpOqGgbQKjp94A9
 1PDKEKv3tAPtCd+VheTB8nMslhk1ps1dEFoJB0HTrpqJpwYq/PTQSwGuLws+LGwys6z9DrEljtg
 PX2FJEufXJ/hWj3SCmG6e3Dhqy2zLjNn5dON950rl4eDV5TmNfvdnbgajHKbToOJcf8HZPou142
 SWY1S03oXq408s6ChsipdVanYei6yX8iTSGLOVtNR/QQRXTpIZrw/g80XwYqUDZKZvOzVSlglJE
 6Zq8vr+swhAazr+JS+yfh5r+cr63ru/JEAWa23TOtPsTbWkMfhnTZyxilAUTThDokYk4G1UrvE/
 ED7YeLyaYfAoL08KaSBV4TB81nQwH33Ua1eLOUUkOy96YIx/qfWMW6VlSbDxBCqhuEl2z1eAA5W
 uzQYG2U+Oox9LgSSnoZyBz1fCpUwksxY3w9YhpN3uDe0/9NbjGEkyk6rHM7VUQpnCK6lJW//Utw
 7j19DBtszu4pI+A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

In imx219_set_pad_format() there is now a constraint to enforce hbin ==
vbin. So, simplify the logic in imx219_get_binning() function by
removing dead code that handles the case where hbin != vbin.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 300935b1ef2497050fe2808e4ceedda389a75b50..48efdcd2a8f96b678f9819223e0f9895fb4025ea 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -409,24 +409,14 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 	u32 hbin = crop->width / format->width;
 	u32 vbin = crop->height / format->height;
 
-	*bin_h = IMX219_BINNING_NONE;
-	*bin_v = IMX219_BINNING_NONE;
-
-	/*
-	 * Use analog binning only if both dimensions are binned, as it crops
-	 * the other dimension.
-	 */
 	if (hbin == 2 && vbin == 2) {
 		*bin_h = IMX219_BINNING_X2_ANALOG;
 		*bin_v = IMX219_BINNING_X2_ANALOG;
-
-		return;
+	} else {
+		*bin_h = IMX219_BINNING_NONE;
+		*bin_v = IMX219_BINNING_NONE;
 	}
 
-	if (hbin == 2)
-		*bin_h = IMX219_BINNING_X2;
-	if (vbin == 2)
-		*bin_v = IMX219_BINNING_X2;
 }
 
 static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)

-- 
2.51.0


