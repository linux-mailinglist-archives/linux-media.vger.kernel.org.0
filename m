Return-Path: <linux-media+bounces-48758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F0ACBCD1B
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDAF3300C506
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED07532E149;
	Mon, 15 Dec 2025 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ayLELz4/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F052B32E132;
	Mon, 15 Dec 2025 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783951; cv=none; b=az9CknI3m6f6+o0KhaDm5010Oop8ZJY9KAKBWEic2AKuxh+x3qEaAYShapiXma95XsbHliqtxMlLGntoBzO2q8j0u00mT6V87He2zoCuko6xHwkfU1KSjFy6iEv6iz9RnHVte+TpUsMiv8NyaKtlCMGieC72AdUesaTNBg31v+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783951; c=relaxed/simple;
	bh=9/6Kjg7yNpKl6KPGvD6QdVx/4zbqWbKaYAAGlKz2L7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+Guxk0bWxFJ3fZcm5G823ZxnNaL3WsXCabWESbh5dlteluqAVfUUaU5I+Uqaqvxu9+R2okTVvafG6KIhi7Qyro9HXI97gA52BHooEUGWN7Vd+JGoU7KH96KBQUBJTgVKtnpJ+Ujm2eulwEUWxrujWuX4xLs2Ih/e3LtkaaYXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ayLELz4/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70FA9EB4;
	Mon, 15 Dec 2025 08:32:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783943;
	bh=9/6Kjg7yNpKl6KPGvD6QdVx/4zbqWbKaYAAGlKz2L7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ayLELz4/X2jZeGRhclPcp9woSnz271dytmcUoFhzlKybluwfBct0jcz7xa2kxg4Ao
	 XSy01KFQs1vsL5BafY89Trj/0ibYEJ8UFDtoCPqOuxiDDaJIpne6cmaV/qyNGKspAc
	 3wHqMvHfLlOC9GDeb6y/rgS6gWQBqt+DTSootJVs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:06 +0530
Subject: [PATCH v3 10/16] media: i2c: ov5647: Use
 v4l2_async_register_subdev_sensor for lens binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-10-4c25e3c883b2@ideasonboard.com>
References: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
In-Reply-To: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=JQFJnQQUjjGSi8Ih4eUMXZveJ2XvZZqxZu/NmOzJT14=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jgNnfOi0f4ngBHSUYrzYvLtDLT35kebfUss
 EOWPV7+9vCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+44AAKCRBD3pH5JJpx
 RUejEACjgSxifgZCjcS3mawiwCwXrkFZGbu9IDinBO46GjqIWQqdbZZFe0WDWAIsLpevfBdF9yJ
 f6lTqDXABwtsrkr+JJIMO39OmDWe2Y9bXd5WPLE5v+8JI7A0Q+vDLmJzQPu4BzdgT13xAScBPQ9
 dmeTR73TnoRsTZnN2xFt5XcGpWaM/j/qJf+AmW6Ycio2Q1fgM/RSO7K1Zk1YLW88rJsmwmWYOgd
 dlc3Iq6yaFjPnLrPodYgMjPeilTSPBrExjekVVc6lDEyEKy2W5qXJqK9D7FBlNP2KmPoiid2lMV
 87pgU2ogZUvDWXeAzosxtaQnpjUIJ0uG+C4TjPKRYG/VBacXksGXJABQgDlMUcGoNtfdRb+MUSu
 lI2jVWLDXTv9xU/l2BAzFl9gGov3TUXuxWGQ3+nthKNsyGPJeE7CRFtSnBV58H+GRIkhK+vMxDn
 U0/WisEJU0+o0NYRO/t4+hdtWTSwj0tZ6+2sEVxW0QoFXX2srXRQmFy2ADqn+ccuMkq4XMsxsPc
 nUWu3t33cjjlXixuybRU6j7xHAlhzr57ZhNt+VsZjOUJG0WssnOIAdRbpwbsEhmFLeu1r86P36R
 Wsy5nikGOrKzlEJ/beDq29bdRGmp3OdiP48FejgzKOnq4aCvmVdycg0jtUWqikx0yaqyVjjzQwA
 tUUu5btD5AArw/g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

v4l2_async_register_subdev doesn't bind in lens or flash drivers,
but v4l2_async_register_subdev_sensor does.
Switch to using v4l2_async_register_subdev_sensor.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 07411494e32446d921b80adda52d66926fc07645..052fdf0d33a593f9795641ec607528f3d6a54723 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1554,7 +1554,7 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto power_off;
 
-	ret = v4l2_async_register_subdev(sd);
+	ret = v4l2_async_register_subdev_sensor(sd);
 	if (ret < 0)
 		goto power_off;
 

-- 
2.52.0


