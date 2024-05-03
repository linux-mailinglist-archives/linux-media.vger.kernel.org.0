Return-Path: <linux-media+bounces-10695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D78BB057
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 17:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D9D71C226EC
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 15:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AE5155720;
	Fri,  3 May 2024 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sTgXi5hM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C161552FE;
	Fri,  3 May 2024 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751517; cv=none; b=l9eI727HmHStZOXwanGLjgI3h7S/3r3oCpUZZsjv3hv60f0UIKwrohSKioiJMLMxt1pu1UqRayyDySFhlr8R08i4jTSpaYTmkGtbprk6i0zKco4TAywcgSfxzBOF05W7IISSZJtHoPWJvziipJ6EMSHRN21w45xNL1UM/h18NRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751517; c=relaxed/simple;
	bh=VNrSEU545G/j+FFqmKEQoDeNoFO4pmkIyGtskHTtHlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzJNQlIcqfEkUZ8t9xpVf0H/RCfdStWUGPRD+QYTTywO/uCMWBGoQ54E+kjyEDKCurjdSOV0tlD4R6pmUqOZ8EvuwRsRY0Mc7ffrSu2/UWdiI5fZx5meXc01beluW+BL17Ken6FzdtbsoCbfjUH7Fb0OmGLIlcT7wJJhEX8o1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sTgXi5hM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19D682A75;
	Fri,  3 May 2024 17:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714751451;
	bh=VNrSEU545G/j+FFqmKEQoDeNoFO4pmkIyGtskHTtHlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sTgXi5hMwAaAKcyp/EhEfU/o+uJ7K+N+hAZB3xJaRsUhmmeclwoOQGEVThpirioOA
	 0n25M4EfvmYepnk3aYG2ou6KTDpjHPWlIXOb746eouCSqIFVJXKq4NCdnYkP/MQ2ig
	 vmNw47Mk67wKJ+IBNK42wdusLsWBgeNYHK6szQcE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 05/11] media: adv748x-csi2: Initialize subdev format
Date: Fri,  3 May 2024 17:51:20 +0200
Message-ID: <20240503155127.105235-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize the subdevice format to the default 1280x720 YUV 4:2:2.

The subdevice format is propagated from the frontend (HDMI or AFE) to
the CSI-2 tx, but it was not initialized during the CSI-2 tx
registration.

Use YUYV8 1280x720 as default format as it's supported by both TXes in
all supported configurations (1, 2 or 4 CSI-2 lanes).

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 5b265b722394..9da7f6742a2b 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -14,6 +14,13 @@
 
 #include "adv748x.h"
 
+static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
+	.width = 1280,
+	.height = 720,
+	.code = MEDIA_BUS_FMT_YUYV8_1X16,
+	.field = V4L2_FIELD_NONE,
+};
+
 int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
 {
 	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
@@ -311,6 +318,8 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	if (ret)
 		return ret;
 
+	tx->format = adv748x_csi2_default_fmt;
+
 	ret = v4l2_async_subdev_endpoint_add(&tx->sd,
 					     of_fwnode_handle(state->endpoints[tx->port]));
 	if (ret)
-- 
2.44.0


