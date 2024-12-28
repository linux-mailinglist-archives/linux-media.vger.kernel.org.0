Return-Path: <linux-media+bounces-24141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC19FDA34
	for <lists+linux-media@lfdr.de>; Sat, 28 Dec 2024 12:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF48518836B9
	for <lists+linux-media@lfdr.de>; Sat, 28 Dec 2024 11:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241FE156F44;
	Sat, 28 Dec 2024 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="m9KnveyC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470C14AD2B;
	Sat, 28 Dec 2024 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735386128; cv=none; b=UJQoDbSKC29BHEG/bxuhKbcGo6XPKo013oNp423ORADae1KD9rL1nTe6R92iHaJ5a+jZ4XPaj1sb8IB0Pxs8EjfAd22utbM/XwcMLOOlbYQ/bvREVpU61ccWMZ2zY1TELT2unvhIjKDdSb236hci+mqng38XlzGFCY0ENy2uYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735386128; c=relaxed/simple;
	bh=ynVOVb374DguH8zYFxXvjwn57gCX2dHvXIpcRkG4w0E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uhpyLU/J4oHzLHKVy7d1lwJONxjxYulUHJzutcFVtDHCUhMesuNG2BruYp4snNk+tvdsDVj5bpU1MUo7VUFPJSQuVnaZh8yWG3+Pc9TQGugcERvgfrW/TXGEDCRH/B4HoMzYcCBCFI8CHfYDWHpmR9atK6QPeu0UqJv11Lk1dSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=m9KnveyC; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 316FD518E788;
	Sat, 28 Dec 2024 11:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 316FD518E788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1735386121;
	bh=hw1L5qkl3vLwYSsXmUEI6M4vzDu5ePLShg7Ci/9/bT0=;
	h=From:To:Cc:Subject:Date:From;
	b=m9KnveyCeKAl95TIZu8IuOO165XWkwR6k5qxZpvNejVkaeWSyHeiNMR+T/NcoR2Sd
	 zu+zFrCcCYg6LI8pb20Cf4RvYXh00vxf2rvnn0mEYAHzq6rm9n/9qp3/DLPmsxC7w8
	 YRsBxNNG9U5v8fJZIGCvJrlvfV4+XZhS19inFEjI=
From: Vitalii Mordan <mordan@ispras.ru>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>
Subject: [PATCH] media: ov772x: fix call balance for priv->clk handling routines
Date: Sat, 28 Dec 2024 14:41:47 +0300
Message-Id: <20241228114147.2576079-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the clock priv->clk was not enabled in ov772x_power_on, it should not
be disabled in any path.

Conversely, if it was enabled in ov772x_power_on, it must be disabled in
all error paths to ensure proper cleanup.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: 762c28121d7c ("media: i2c: ov772x: Remove soc_camera dependencies")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/media/i2c/ov772x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 062e1023a411..8a0556e21659 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1280,10 +1280,10 @@ static int ov772x_video_probe(struct ov772x_priv *priv)
 	/* Check and show product ID and manufacturer ID. */
 	ret = regmap_read(priv->regmap, PID, &pid);
 	if (ret < 0)
-		return ret;
+		goto done;
 	ret = regmap_read(priv->regmap, VER, &ver);
 	if (ret < 0)
-		return ret;
+		goto done;
 
 	switch (VERSION(pid, ver)) {
 	case OV7720:
@@ -1301,10 +1301,10 @@ static int ov772x_video_probe(struct ov772x_priv *priv)
 
 	ret = regmap_read(priv->regmap, MIDH, &midh);
 	if (ret < 0)
-		return ret;
+		goto done;
 	ret = regmap_read(priv->regmap, MIDL, &midl);
 	if (ret < 0)
-		return ret;
+		goto done;
 
 	dev_info(&client->dev,
 		 "%s Product ID %0x:%0x Manufacturer ID %x:%x\n",
-- 
2.25.1


