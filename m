Return-Path: <linux-media+bounces-49295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD269CD4F66
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58DED3012976
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E2330DED0;
	Mon, 22 Dec 2025 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="piQ+8I8o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD430DD39;
	Mon, 22 Dec 2025 08:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391408; cv=none; b=u8v0IrOLiy7TnYT60c9Ap5vgWcSctcUVOm4d/WwLGkUi796DFOMMg4AHUs4goPiq12YulqQVm05jvf6gL0lbBDsvkDUz1qHg9EXGLoT9HQ1OliCo+i87/QT10v+j5Lzgrwbnt8wn/yhrnULw2S3kZ6f5IUo+V6O0zqUHsCQychA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391408; c=relaxed/simple;
	bh=aBef/jYI7+QaRlUmY0tFbBKGQybZ3pXAMfF1iRMR7NY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iNP/pFqDQz+H3pz6Lyx3P9cc6OJSjyxOKBoF1ccwN1qpmPDBBFwQWyuDoGxnpSK4gsjHka9TvcbrdvhcWHNVYY2CY7OnigVFstHYyZyf32gggDSDmFEFyBn11LCX50RXKm4lAp5SybWntw2togoyguoMAeAYCNvfiNgyH70epEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=piQ+8I8o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22F8E1784;
	Mon, 22 Dec 2025 09:16:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391395;
	bh=aBef/jYI7+QaRlUmY0tFbBKGQybZ3pXAMfF1iRMR7NY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=piQ+8I8oGB+0tjkkgbVEY5ZEtColeAge8b/Pb+4HOYcq5jnOPbFyu0dzbNnFf6wWi
	 mn8YymDoUxg7bO7XjhU9YeBChRq286soN5klaZlBKhkqjBP3xJS2+nozUA/KrHcZcC
	 5Mtfmd2RCLkEsNAwlyO+jKKRsKGIiVt2am1frC4I=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:33 +0530
Subject: [PATCH v4 09/17] media: i2c: ov5647: Parse and register properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-9-b949c7309280@ideasonboard.com>
References: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
In-Reply-To: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=+dWj9gvZAT5/YIrYwdI4I4Rm0IP1iBPg9NF/CD8ZgLc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4pqi/XEaF/yaLQYhl2jg1gXTPCr9Tp164Di
 e7WNZNUxwqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+KQAKCRBD3pH5JJpx
 RT4wEACnkKthkjTrSfhm/QBDMAqdh/z4DhZFJ2tuDVi9bhEbDSJQPSgwuaZqzyyjyjAi/V95y9d
 lekL6OgQg1MyIm8PiESu6GdpARGO7fG3esEqgqFXdZpGEJ+ca7dtcxm36uX01ycfgPv3wHq/XzA
 lI5hZX8p9tHNrB/+z+jgVEtvnWZmWXq9X5rCuWjMBb/CD+jtMjH0TfEIIBtfdRTMyfZ6EFE/1yi
 /PxA26s96E5iJO/FjmmFH6Ic86mM0dOQ/PZNkWyEFBu/KBIFQPk2UOi6asofDitCwpBtfotXCu0
 VI3YWp+t/yACHFF+dw0AWRD2CmegrmEcWzEapbExqHzW1RtVPfXGtc0ABnUXieybIlklWQ9/b9U
 PMJwH6xTJXwbokqX55y1AbWJwQPgik3W4hULt3NnIJv1MSRsk/wBZSeh+N0UaMMb5Krlr5ZK9am
 WyksYLHwQDaMeVpOclFnYcrojWHMJCzHGJG6WvLrk9dild/Qj7ukSbp1CLQ1THDj3zx+kKFQQRK
 AfD6w6RH6Q19V1zgk9cuT1OUYLiVP5FA8qN5L6bKKsVomfJ9PTTY9zPRaNteFRSw137HxAj3s4Y
 YrBiQ8a+Pry1OqBia0SBH/Df/5ULhhiXadOAh4p9iUgW1TqYwOD9segbMhPb4po2SItZdyyyrf2
 kANH0CDJlf1sEow==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Parse device properties and register controls for them using the V4L2
fwnode properties helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 774d16335ebf4bdd0076cd4fdd2d8ef4a7c34906..6f07cac12c6c157e1b20abe000f95de82abd877a 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1320,9 +1320,11 @@ static int ov5647_configure_regulators(struct device *dev,
 static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	struct v4l2_fwnode_device_properties props;
 	int hblank, exposure_max, exposure_def;
+	struct device *dev = &client->dev;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 11);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1371,6 +1373,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
 				     0, 0, ov5647_test_pattern_menu);
 
+	v4l2_fwnode_device_parse(dev, &props);
+
+	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
+					&props);
+
 	if (sensor->ctrls.error)
 		goto handler_free;
 

-- 
2.52.0


