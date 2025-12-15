Return-Path: <linux-media+bounces-48751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B5CBCD0C
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82578301833F
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F13329E68;
	Mon, 15 Dec 2025 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MgKiMNVB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FE8329E54;
	Mon, 15 Dec 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783844; cv=none; b=BnSmeIaqSF6llXvhzA9+WqQ2DMWrSxRu/506+FoRpqqz2iFVIrfpasnkFQKBwZ+yqo9tFMGBpywVpnUTI0nVaLoJjwpEGsDPB/jz9ceycmrdB1DNWPnY0PK0GKhDK/zXFJmg0+p3MyY9qmeMWsj8EeLinLiYg5w7ENGUS/Vw5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783844; c=relaxed/simple;
	bh=ECDfT216IS7XDAHxl6JD3dcTZsCiJMFAKz8PveO6GBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7UMTz+0W9chxTFRUPUwYGExskpR5yy7ciYL4f5VpDfbaxmTvJY+3YzGeDV5VAtw4zF06M5bJBhJK8YbYy8kTG/KayQfgZe8x+B3j2PrkDg34PGA563uOBrDjPxWjhP6Cm5WqwPQy7aDChMlrUJJ0fq5DGSTXcKnGwTiVnB5XvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MgKiMNVB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E695581;
	Mon, 15 Dec 2025 08:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783836;
	bh=ECDfT216IS7XDAHxl6JD3dcTZsCiJMFAKz8PveO6GBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MgKiMNVBU0+E4tbrBJ3mF2WqHz7HKRH3Wj0g7GuVj8SXrXwKB2PIYwEXfX+Y8u2pH
	 RxxOfoqaWfACnAh2qUWXbPqx9I9aN65iQHWDZtmTq2UW0Hs068ayBj4wBG0mJZlfF4
	 HLhDa/C6kwCx5t/MpJ55B2S54BQjE63f4rBKEB10=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:57:59 +0530
Subject: [PATCH v3 03/16] media: i2c: ov5647: Correct minimum VBLANK value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-3-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=EeooS5E8RZpQuz7+4w+98i6AERrcR8y8PJ4LbLlm9Qk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jZqR+XkIa38lWseOa957PfKwDR4MEUZvEJZ
 oEKwXC2gPGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+42QAKCRBD3pH5JJpx
 Rb87D/9UbRsQDn3A2djYrU1TIDVkAyxtURGdAw3BSZOu4+vnX+6NMPj5cCrIC0u4QBb4xPqb3QS
 g2UiISclCHfJy4mdhhQWayeB6bJOTgacncCq58FWpdxCx3Eu/3XUmo4xwgB07cXdw0ap5vVeM/f
 yRclQWcGw07aSnhOqwR4Cucwqgj0PT+F87WRvJ0FGtz3FuQaELDZORLwnJqf+tgCkXp+/ZZaVEB
 DdI81kiwN44JED3iN8HYXgHHXd9XQ7qSRM0mjJ541Lc7HqFcxx32RViAuAKYd0LkpBbNIoTgIWb
 tx6QxjUT82byQMZsqIrMx/eZoTV7TxiD8nM+Npma324wsqybSADNl8XxC1fGfSxKoFms3cpHjhP
 rz2y+QOiglKM2bHLoUo2rC8dR3hQe3VhPP+SqDF831dYuaoNqElkoER0FieFEVy5PRdKVZLEail
 9IsHkJY1SLrHISpmYTH/t4DbhJUlpwrqGXFafPI7cSRgGX5S9zhUfLU0s00Mv94Vsu6Bbc0WUnY
 NUxVAz5RQWVcWhb0HG9OI9fhsK/Kt0KMTOxDQwOO2iDAUJGmOP2HJXeqg/3IvYz6RC18930Mc5o
 rrvXxwv5Jxzzb9QmtYYxmtvYvAutidFLrhsZYsO742KLTHP9Oz5OBDA0dzxnK5AFZVSGNhOfSdE
 ng3iA1eQbm8215g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

Trial and error reveals that the minimum vblank value appears to be 24
(the OV5647 data sheet does not give any clues). This fixes streaming
lock-ups in full resolution mode.

Fixes: 2512c06441e3 ("media: ov5647: Support V4L2_CID_VBLANK control")
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index d9e300406f58e554de12d9062840353bdf7a226c..191954497e3dba4b1de4094b2ea1328a6e287003 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -73,7 +73,7 @@
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
-#define OV5647_VBLANK_MIN		4
+#define OV5647_VBLANK_MIN		24
 #define OV5647_VTS_MAX			32767
 
 #define OV5647_EXPOSURE_MIN		4

-- 
2.52.0


