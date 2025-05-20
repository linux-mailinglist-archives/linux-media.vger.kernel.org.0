Return-Path: <linux-media+bounces-32922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4188ABD922
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01CFF189154C
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 13:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5942417F2;
	Tue, 20 May 2025 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f7gSSfbI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A326241693;
	Tue, 20 May 2025 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747087; cv=none; b=UXNTQ0INR2xnHeFtEDIq/jf/uyHkiBJA+nPzjR9yQO822hnT8V40aNpkCT8Pik2IEHXSBa56uptk36TITXCieEqFCkuuiawP981gizKJPBb3aqCUOJyX+bSUe8yN1YbCXkhgudjkyoDIDyr76yfeJHHniUGEy9wbyNg3WEliDCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747087; c=relaxed/simple;
	bh=F1+J6anLcMG0WZ9tkJRA2Ga/BATXCw/6TpxKSU60tEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hs198PqDQTkYdaum01/KVSX9bk//+YpkoNJ7eDlW7XPs8XchASBaSrPjbrqjtZpJmtQmp8WSTNWVruFKRyMB5M2UbWqUDZZzBLlZOujaaZlPco9VB4xpkRZxXZHoCakcUTkzHufDTHRG9Iw/4cW8L7+o/Pv+47dbPkU4z2UVTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f7gSSfbI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 609C89E5;
	Tue, 20 May 2025 15:17:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747747057;
	bh=F1+J6anLcMG0WZ9tkJRA2Ga/BATXCw/6TpxKSU60tEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f7gSSfbIrj74PVtU+fqQLGWRa4vjDvvY8yl6KW9mogr/8uqLoCwCMvC4R3JezyUVb
	 x8kubqqyGUv/VdwaLKmnplHs+C7yUaZ561+iP3Ws0G2UiLJ773Qoh13LoBECx6+2Dg
	 rEhS5ePqF+/sA/oJ8TZIjrf1CpDIdyvrt8TQo1EE=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 20 May 2025 14:17:44 +0100
Subject: [PATCH v2 1/3] media: i2c: Defer ov5670_probe() if endpoint not
 found
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-djrscally-ov5670-v2-1-104ae895aecf@ideasonboard.com>
References: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
In-Reply-To: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=F1+J6anLcMG0WZ9tkJRA2Ga/BATXCw/6TpxKSU60tEE=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoLIEE2h39tAosX9pNPhClkV4V5H1Z+M0vPCCCA
 VbcqAJFwk6JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaCyBBAAKCRDISVd6bEV1
 MmdaD/91JE/Q8EaI1dp71L0LPYcBPyx0mWbkGi2kKh3cbwDS633q55EVfK0PZFTQxJ3QF7CpCrL
 p/BZrxsMMYat51/eOmusit+4ZHP0YVaXuwuLBFZsdIxkNo9+ZfWXeH6FN/N0QnL5JtCGCC2O4ip
 ZX4U7nifEbhbR3TnfPZcGuEiz5Pa8O5czA7quMZDAdprIjQWlkBe+z6e+JPnzJwQ17aGlfD2jEJ
 szfT+Deh/e/WnW4Tld2X06/uuaVQ+zuNB2YwNKWz8phJRYZiD4+xnW1OwWB+CuRjyz7TDCIY8s0
 vXLkGUpiDucXya6udwjyALfp+Vo+ZqoocCUKBvoeXKc8vr0gTfaJMIUAhJZEv1eVpFLKtqgVRzL
 ofM47+Ic6GvJRHi8S5UVP1M2UhUrojrV7p/Hv+U/Kv5e3kayEbTWXl9paZj/jxgr1uqJSh9ch9t
 4vYnP/gz/tOUWFpWJrc2pcyA6G8r1I9xmudreaJccyB5Thjg74XayRQJV8w5GC9uxNTd4Y3NAU3
 IHwcnAslptAxQ8yXXy+5MqlcfrGoUXH4eNYA+0xmkJfrLewt8iWUUYZQIflVKdVsMj5PKJVA79F
 UwICLZAEUT6DDeM1zLAXlJTy73y4HO86WvQKn3MMqjh2qegMGpsqFb+T8OWUGLYpvsnhBYcKU/J
 82WrLnFRWCXlu7w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The OV5670 is found on a Dell 7212, coupled to Intel's CIO2 CSI-2
receiver. The ACPI tables don't describe the connection properly and
so this is one of the sensors that needs to wait for the ipu-bridge
to set up the graph with software nodes. Defer probe if an endpoint
isn't found to allow time for that.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index c54bbc2071899d30fa6b097c44a40148d9f4209b..b9efb2d2276a8593a9003e9bd23934a8d25f2d54 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2688,10 +2688,15 @@ static int ov5670_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(&client->dev, ret, "GPIO probe failed\n");
 
-	/* Graph Endpoint */
+	/*
+	 * Graph Endpoint. If it's missing we defer rather than fail, as this
+	 * sensor is known to co-exist on systems with the IPU3 and so it might
+	 * be created by the ipu-bridge.
+	 */
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
 	if (!handle)
-		return dev_err_probe(&client->dev, -ENXIO, "Endpoint for node get failed\n");
+		return dev_err_probe(&client->dev, -EPROBE_DEFER,
+				     "Endpoint for node get failed\n");
 
 	ov5670->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
 	ov5670->endpoint.bus.mipi_csi2.num_data_lanes = 2;

-- 
2.34.1


