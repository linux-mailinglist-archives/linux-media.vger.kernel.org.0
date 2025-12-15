Return-Path: <linux-media+bounces-48749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05850CBCC85
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F1963005192
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D576731354E;
	Mon, 15 Dec 2025 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ntnVRuFD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA1C2E093F;
	Mon, 15 Dec 2025 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783817; cv=none; b=AAc3sqZ70A+SpbHecYWO/pqDsTvibfbGX96nZylORcGCLzB1Qusek191sgLgTdAZvL3Lp2zNbpoDRpLItdVj6TJJqjb+YWYG8OP4TPnrkMMc392ZnZDpOcXVvbHiM5ujJLOxaEA00Te5cVws0I1qM3a3dYAIeVKcAsoIjVt+OqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783817; c=relaxed/simple;
	bh=cWMNTcDu8x9WNg3vTB3u75ylHzVA7Jm5rmsZD93vNPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4gAMg26O7Qm0gErI+LqK53XjN3fHIrBaJ/MAnej5qZedT/1XUWYSuw3NfHhwABC3tWIbUdtRyaRaq+QtSioIJ4IBWQwC5UUJi0xb+MK0vHCNdIkF8TCtbcylGTeSs3gnZNWK2QRG5+kIZVll1w5IwMN5Z2Iwa2+na56lbe2msg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ntnVRuFD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87CF7581;
	Mon, 15 Dec 2025 08:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783808;
	bh=cWMNTcDu8x9WNg3vTB3u75ylHzVA7Jm5rmsZD93vNPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ntnVRuFDM/I5/Wwqi8e9aWRyMJPwEmCkXjsppBbysiFJumztcHlp1G+VAp6L5S+XS
	 sXQKFgtt5MlFybiYmIqryO05GvW4bvPymOVoUQGe0+kbkmSK6hjSN2y+I+CXSpVYdi
	 QFSXZ1xth4msu1rhZy9pqDCrURnWe1y+xTqqh+Q4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:57:57 +0530
Subject: [PATCH v3 01/16] media: i2c: ov5647: Initialize subdev before
 controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-1-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=cWMNTcDu8x9WNg3vTB3u75ylHzVA7Jm5rmsZD93vNPI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jXfgOSODFaDUf4otzGmv2Je6hSqZSKZejNP
 IvmKVS8ogyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+41wAKCRBD3pH5JJpx
 RVHmD/4p1MXEacx4Gq4a1j8G/J7UjuZI3agNNEsrkTPW7btSMiZ3LhtIibRT5gUrHmLDcp6EjMw
 e5y/K40UJjVmdvzzXCK645RHAhSbrs6SeNrUlqrIdi/YU7P5ZkadiT1a3HchkfPXKE3B+ou9UFs
 PYWXqiTmDS3eTOBF/xft+aljfetydcdpoMEX/Ul1vbsPEFSGEPYTPtWUizj0bWJ8a8JQo3ieMj2
 hCw68upsmyvLZi3ibBURdm12xzYSn19DgLtk6wqT4WgVFOHc1qBaLExuRtiwTV18cYGmBbotq9q
 YwauPWprfjMn3rlaRzkyCMy9cnj9BhA/jlVhQZeqDzzvoImnyrfZ6TKbO8extFJ4/s3cgaJXZ6u
 5a7o21Trz/so1VWsK59yjgoyvwabWL3XsCkopfGzaKqjPLSweW4DBH9dPrJPoQ182TG18cL9w23
 zxx0Nfe0vc0QK/pnox7uOdFBkvDKItXlprf6/pCrwzIx1epgauQAFM7MDOOqxiIforqzgivf61D
 vpG/IfMM96b09bOezMe6aItVxb/IBtEAqcm4o8G3oz0Pg51G1/Fqy36XFMx4f6OhKxxAZlsRCDD
 80faDHNRBGVaXcc0bW+nAKEpOu1Cndp+oD5ZE/J0f8Q1y82CNID7OZcbeIgN3uOf04vVNTDByUy
 rEVegmN9BYiS/yw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

In ov5647_init_controls() we call v4l2_get_subdevdata, but it is
initialized by v4l2_i2c_subdev_init() in the probe, which currently
happens after init_controls(). This can result in a segfault if the
error condition is hit, and we try to access i2c_client, so fix the
order.

Fixes: 4974c2f19fd8 ("media: ov5647: Support gain, exposure and AWB controls")
Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fcedf4661564c032cd7dbd80a9fd30a6..f9fac858dc7ba754bdbebe1792f6fb0358781408 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1420,15 +1420,15 @@ static int ov5647_probe(struct i2c_client *client)
 
 	sensor->mode = OV5647_DEFAULT_MODE;
 
-	ret = ov5647_init_controls(sensor);
-	if (ret)
-		goto mutex_destroy;
-
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
 	sd->internal_ops = &ov5647_subdev_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 
+	ret = ov5647_init_controls(sensor);
+	if (ret)
+		goto mutex_destroy;
+
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);

-- 
2.52.0


