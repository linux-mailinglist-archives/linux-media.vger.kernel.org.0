Return-Path: <linux-media+bounces-10428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438ED8B6FCF
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 038402850C6
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0A612C49C;
	Tue, 30 Apr 2024 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YdR8+l4E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F0B12C461;
	Tue, 30 Apr 2024 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473622; cv=none; b=CdmX5sFttwIQo6CIIR4SFbYWVtR8UIzMZUsWKYzPTk9ZZ/RRHiYVQnRIix5m7DtnpH72Im1xkQxIXANwFuABkASHUVyT6LAt2F+qENlPB12kikS4bqZmIA+LbcZppd04KJ9oO61Jngco5/Ht+Qsfqyfb9EGHsN+NFrZ1Jhl40iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473622; c=relaxed/simple;
	bh=m8p7bPodONrrEfy/2FHHQfNYlRq4HKkl3b2tm2B29Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B677CC5da+pKxF03lUzOANyl0cakxEDVVhGHxixQ94PN7EnSgG3H76UUS9ces2XPP+ctmI5GjmRgAbE4dsp/QBileDdaSoHyIqSYVu+HNIBXyZQjVhM/y5bQFyRp3qsCb1Poc/f5MReZAbbFoe/URKSx3/lwuwfmAztRkCMnjTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YdR8+l4E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89B4FFD6;
	Tue, 30 Apr 2024 12:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473558;
	bh=m8p7bPodONrrEfy/2FHHQfNYlRq4HKkl3b2tm2B29Ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YdR8+l4EUMVQHyJidFZZZiUB978nD3lWP/iD+5Q89gFQzPnUh36hgGLVEMpOkNQHb
	 7pyfxceuWVAYka6fmu5OBm1Y4PzpPXt1X+PYjQ7K+x3hL4qufjf9m4fwg1QexzzbaO
	 xLWCsfmS7cBbFm+n5sMaZPlpzwsfxZ3m85rT3dDc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 04/19] media: adv748x: Propagate format to opposite stream
Date: Tue, 30 Apr 2024 12:39:40 +0200
Message-ID: <20240430103956.60190-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the adv748x-csi2 driver supports streams and routing, when a
format is set on the sink pad, it gets propagated to the connected stream
on the source pad.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index d929db7e8ef2..ace4e1d904d9 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -167,20 +167,21 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
-	struct v4l2_mbus_framefmt *mbusformat;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
-
-	/* Format on the source pad is always copied from the sink one. */
-	if (sdformat->pad == ADV748X_CSI2_SOURCE) {
-		const struct v4l2_mbus_framefmt *sink_fmt;
+	/*
+	 * The format set on the sink pad is propagated to the other end
+	 * of the active route.
+	 */
+	if (sdformat->pad == ADV748X_CSI2_SOURCE)
+		return -EINVAL;
 
-		sink_fmt = v4l2_subdev_state_get_format(sd_state,
-							ADV748X_CSI2_SINK);
-		sdformat->format = *sink_fmt;
-	}
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
+	*fmt = sdformat->format;
 
-	*mbusformat = sdformat->format;
+	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state,
+							   sdformat->pad, 0);
+	*fmt = sdformat->format;
 
 	return 0;
 }
-- 
2.44.0


