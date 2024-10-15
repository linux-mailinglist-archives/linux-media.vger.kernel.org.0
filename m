Return-Path: <linux-media+bounces-19702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1699F8FA
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 23:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6437BB21FFD
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 21:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162AC1FBF66;
	Tue, 15 Oct 2024 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TNhW2w4Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72961F80BC;
	Tue, 15 Oct 2024 21:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027222; cv=none; b=Htnd4srYVvZnDtVEtSluzkJTuRSg8LG2eIRb+pPUzFtM8ZElIX7nZCyb8a36W5yJZmcA0lKyONFLNqjyPx3wSouLck6DLuIz6rw1oAXm7btu4SCts7N/jMkPKOyNDo3KAqPxvdThiHFFY8yPU1TYnTppb8pGz6iy52fctGxt2RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027222; c=relaxed/simple;
	bh=VFWar1AVdl1MMxxxmu6s0gKcT0q68DyKEIw9U0yHbHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=crMnZoO4HA91hDsTJq2ioNQggPBU9erHxVXbkctnzxMdYFrQDHe6bnG6BXSEMFtANFJFwerFpUe3OTyFItYaqikdxLKe77vPQ/Ek1J6kwHIUvEyJMxk7nBiGkyyRH/u/YmHlg3WH0O0zE806pzBeTv98TL69cJUxjIfEO2g0Kt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TNhW2w4Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BC7EA27;
	Tue, 15 Oct 2024 23:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729027113;
	bh=VFWar1AVdl1MMxxxmu6s0gKcT0q68DyKEIw9U0yHbHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TNhW2w4ZiB9pdmWdk1Phn6de50s4jpd3rKLyWAUp6LjGqLQif+BVz/02lpUqGMOjQ
	 hhZf2dH1Js7i+tWSnRGS7blPOipZ17LC/rfV+pJSQSoaiAEFZYK3+iz+y2nl0OU6E9
	 +2vxIxY+/cMq4SVR+wV7Eng8Zh2PUbpX89EnPu1U=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: anders.ruke@gmail.com,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 1/3] media: i2c: Defer ov5670_probe() if endpoint not found
Date: Tue, 15 Oct 2024 22:19:56 +0100
Message-Id: <20241015211958.1465909-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015211958.1465909-1-dan.scally@ideasonboard.com>
References: <20241015211958.1465909-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 2aee85965cf7..c02d42998fcb 100644
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


