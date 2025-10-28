Return-Path: <linux-media+bounces-45742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB82C134A5
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 056644FBDE9
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A982D2D0C9B;
	Tue, 28 Oct 2025 07:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c4Uad7QA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1062264D3;
	Tue, 28 Oct 2025 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636501; cv=none; b=s2sJUSa4b6sabjB/yaBYQNhoXZEOQrhWbM3V5JBhKVd/ASoeSMCUz+dM7kuJv7d36xyVH3dII6sBF1CqCmb/7xbz/75Vnwvy/6yYyKnoOL1rd/NreDfxP+WqURe3IdxBWy0eYWuUeiUUWk9V4ri/GZILnyfd7WfIZICq3Nf0GgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636501; c=relaxed/simple;
	bh=RvzVEAoJMHvm4dGEH4RiaP1tEVtynTIVShAwG9CuE6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIav/iBSB1FIa3aimlq5L+SUr22UC3relVL9ky+/ewDgbk9NrdeXxobKRwFBIREGgvwVrHFNoVw2iShmKrEuq18B8UwGh676lfmEsXMwVf6cm1OXqmRtntF3JSlqXdnsPBcvOmLRgoi4/J1gv7XBA1cAGOD461rWBXbDm/7yPO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c4Uad7QA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A3BC16CD;
	Tue, 28 Oct 2025 08:26:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636389;
	bh=RvzVEAoJMHvm4dGEH4RiaP1tEVtynTIVShAwG9CuE6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c4Uad7QAnDYe1V86WoEWqvhWRujml35IZ6g20UxWbp2uYxoRnewDJAl2Pba4zZV/J
	 Qy5DaIOebLvKLcc84Cf3q22tOsl11VFOygboy5r9MzzR210POkI8DUsyrXjBkq8Q4T
	 9iH9PmnYfLrnJ+uBpob3v8+59KyRV9zoQ93mpzwY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:15 +0530
Subject: [PATCH 04/13] media: i2c: ov5647: Fix v4l2-compliance failure
 subscribing to events
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-4-098413454f5e@ideasonboard.com>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
In-Reply-To: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=TYUKLKxqjPcJ9GcXCpkS091eTQQurQJjbZE3kfXO1f4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHBtlz4WjZitASM+pNPaItfM8DlBxOCrjiIv5
 2sZexRJeJCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwbQAKCRBD3pH5JJpx
 RaGaEAC6/7N9eMTj2UDIdUp2OYlNH2gjnneUeU+Bk0ItpNlirurwCEGGpLXsq78Cfnjp8hC2/vI
 Jk7zSwDkDiwzsc3UxsbyJibZ71xXpwfYDmAl2fStxs3e2XW3O9d9rn7N18IE2ODOrDzxd5udvPJ
 A1I+rYEU1Vi1CnzgF/R5N9YqOkAuXfh09vrdvPKTPIIiR2yo4nfoD/hPaCgcgQ+U4CGqT9dzmgK
 NNCpLajIM6brsz72cvs52/JQnthKF4ayH0v64UkwjjscdDqtrQv6Jx3POkF5P3XnxbnbuHZ4E3x
 7fuycwYwnEUEtTgOpe+SRWPUtUmllHL/oLBMxIV/iQo0pjKYXP2px99YiHFTsP8QEyABMUXnMXb
 bGlGWyoOxa1L5a6fePNVs+v/q1fczEHJqUi5gO2SRiOLHTYo1TOsl/eo2uLiHMrPnHRC6p18zEQ
 QVjXJbJ2tXQXB+8giL3fsKZi/njhjRS2QBoLV4sFw2nNUCfhP0Xt06pnH8JK2EPEH9tp/di9na+
 AAi/+BOG+obdTMF94YDBO3uqx6zxNBbMPUsZKlOxTyyV5MRD/Pkg79KOkfYJzatMf8SlcJavqE/
 5YBQdyu9KlQe/zoVRD0727TJfPjGAJMNhRBAIyKJeiwPEDrODkBr+Ba8apqMGh2HZpP+eJ1P1Ko
 RBMmzOx2eJ8F+8Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

Fixes the following v4l2-compliance failure:

fail: v4l2-test-controls.cpp(871): subscribe event for control 'User
Controls' failed test

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index dfe36116e6d3936aa0568f172c79ad4dad21f8c2..8f11b5cbdc1658019e1340e641c7e6f398bff503 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -873,6 +873,8 @@ static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
 	.g_register		= ov5647_sensor_get_register,
 	.s_register		= ov5647_sensor_set_register,
 #endif
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_rect *

-- 
2.51.0


