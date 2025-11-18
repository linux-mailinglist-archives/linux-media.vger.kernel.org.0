Return-Path: <linux-media+bounces-47274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3384C69449
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D05AB35F260
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A74355038;
	Tue, 18 Nov 2025 12:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GF0vRHQW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71281354AE6;
	Tue, 18 Nov 2025 12:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467421; cv=none; b=cIVleO3Cfx9RWfIzqzgVtdWQZtO9DuZ24zqlLlTTMfYa9NX3dTy++S2WgLzh0Entt/y9PSNAR4Bhu58TkzH327h/adEfrxDIJlRMGDJ51ojcdxqajNRu8CRA8QP2alVSzKoZm+UvtFA0WBj/UHerUVxCRyPeLLAm9aBpQ86XHCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467421; c=relaxed/simple;
	bh=3TEw2MgrK9PYE+8xT1OVM6CDm/NwIxoO4vP7Eh4NBFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvKabaWqXq2IvDDcAyL3TFfI8PHZhPrtYzMKrA7rJsk786RXbn/f0QbtJ+0sNXWyuP4BHK4dMjVpoGnvcFdRLI6s3Uryi0hGDxBkyQNH9rFSGGkGk0Zr+AFcc1RYskDAdBZ4GBrYw2fF2Yvb4Q80VmxO8hse1H/AWGEJncjf0pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GF0vRHQW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BA8F20E3;
	Tue, 18 Nov 2025 13:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467294;
	bh=3TEw2MgrK9PYE+8xT1OVM6CDm/NwIxoO4vP7Eh4NBFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GF0vRHQWU8bicsa5deYNP3fSlVyABYYlRdhaVH88FraV38N47IvxPPpOpE2TeFMZh
	 P2Qe76htk4tfA6o7GmO8LPfYTmlWtyntPM4epCedcJWCVhIm/3MzNcdwEP+ndyv0gd
	 YHMVdVTaaBu7nhAsTFUvF7mJ/fBx8T6HN5eepWaI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:32:55 +0530
Subject: [PATCH v2 02/16] media: i2c: ov5647: Correct pixel array offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-2-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ULQo+9p6YyR3lXYv9g1T1q5YDcFoqIw2txBi3/3pObQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGB7RJ3GHRt0J2Og2ZUZVMCZ8lQUdhwsjhts8
 h3tjL2DY4uJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxgewAKCRBD3pH5JJpx
 RWxDEACVOIwRgqO5cHn1SzslfHX5gAeHdX6tMqBGvwA3cSVyh/l+XLtr2Nn2D0KtuD+D6KMWgao
 yZ4vtBp7Om8c8tR8GbBSvdh4Rs8PlY5YJnv2Gip52g1GNCnV214B2mXQQSgzK8moktlGEqYvVD0
 tbkLz4ofihRksQtmKeeSZ86bgnHPqm3F4I6IzQHsW6bN6Lvh8xxreHS97IMgpn4mSVMzMSZSTk9
 lLND+JCMydpnwRj7dOVxdITJJDO7FKbPYkMCNreJPCelrYixEtvEmP346WeBfRojZootMODpR0v
 KXM3vZ3GY3Mvmn/E3KzZEwm2IPIVUPZ+22C4jacRQ8CouvQkRLfveH3zp+z+ruw0k6aYQtKa0RA
 bEsa8aLyuAC5nN13BMKAjj4hKcBrySG2Jeyg03xxRVVnZ8fr8dBc8KNUJxj9TKAk/psyepEs186
 /omd5mVaX406CJY+cT+0crP2DK6LkTf7tgI+VgTqDwo6t8OrtcKDwpFZTtlA3uDr3lMMKuRcBPd
 cfnIpPCdHpZrCtBrxXyazM7TYbDZaKGU2eJmu6goEWiyaEyJwDIFUbFwvk9WmCcrD0Glb2/llGA
 2qvMxIf5RUZSjoCPgXpSUR0S6Jk0gTNH3F68Hk7brI6dVt19zmBPjrtT+74gKxCpKpPuqeF2pOT
 yjZwCRi/SHSubYw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

The top offset in the pixel array is actually 6 (see page 3-1 of the
OV5647 data sheet).

Fixes: 14f70a3232aa ("media: ov5647: Add support for get_selection()")
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index f9fac858dc7ba754bdbebe1792f6fb0358781408..d9e300406f58e554de12d9062840353bdf7a226c 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -69,7 +69,7 @@
 #define OV5647_NATIVE_HEIGHT		1956U
 
 #define OV5647_PIXEL_ARRAY_LEFT		16U
-#define OV5647_PIXEL_ARRAY_TOP		16U
+#define OV5647_PIXEL_ARRAY_TOP		6U
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 

-- 
2.51.1


