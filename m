Return-Path: <linux-media+bounces-22463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F397F9E06A7
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3372B2F43F
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237C7208976;
	Mon,  2 Dec 2024 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YmfWpSN2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC5204093
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151527; cv=none; b=RbT+B/lVsHKylLF9XxFY5isTeFPdULbJPylXa+es4Sdc0h3t8mKBX4uKqcCOs3YLF4mrH1OAZpkkC1X7CnwiD9gQ8j7MHu0bK3P/gp03DikNp5jnabeCo0nIQ7eD+wOQcUQOY5oMUgfJwQx67LaddgJwyPVP7QOYxaYUX8+gpz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151527; c=relaxed/simple;
	bh=vfCa/UxvbYkL0/aU7gH9QfEmUDDCMZhuA60e3HKrhTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cZyS8guYATVbN3hkg2tA9AAVjs1ZbpTIo0Iv/mSL7M8Mn1ekmxNC5a3WCMxaqSY+MwqbmcrZnPE6SNwqv0DsISfLWpT1YJ1Ws6fPBJA7OpwPuH8oex7I7OwRRdFMGFHIcl9MY6lXHBG/xELUXzHMfbZ6lyJGGdeV1Jh5IWioPsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YmfWpSN2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2615582A;
	Mon,  2 Dec 2024 15:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733151494;
	bh=vfCa/UxvbYkL0/aU7gH9QfEmUDDCMZhuA60e3HKrhTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YmfWpSN2oZSDd76+nQNR74VmNJ0g8ndJJ+4/NA2u+3qxhdEHOl6do+yFZGJfB9cAq
	 L9/JnauqIP7ytcEr6Ebe00io8LxbaRwtc7ZMZ24e4e2/QISiJLno10dIgaahuiMXhP
	 rl4NiDtAII2fyM3OZWnlUU+i90KgqjPd0zBual8E=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	isaac.scott@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 2/5] media: platform: rzg2l-cru: Use v4l2_get_link_freq()
Date: Mon,  2 Dec 2024 14:58:28 +0000
Message-Id: <20241202145831.127297-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202145831.127297-1-dan.scally@ideasonboard.com>
References: <20241202145831.127297-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rzg2l_csi2_calc_mbps() function currently tries to calculate the
link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
of the remote subdevice. Switch the function to v4l2_get_link_freq()
which correctly targets V4L2_CID_LINK_FREQ before falling back on
V4L2_CID_PIXEL_RATE if the former is unavailable.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Fixed mbps sign

Changes in v2:

	- None

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 ++++++++-----------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 881e910dce023..243a36b952cb3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -242,28 +242,23 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 	const struct rzg2l_csi2_format *format;
 	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
-	struct v4l2_ctrl *ctrl;
-	u64 mbps;
-
-	/* Read the pixel rate control from remote. */
-	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
-			source->name);
-		return -EINVAL;
-	}
+	s64 mbps;
 
 	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
 	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
 	format = rzg2l_csi2_code_to_fmt(fmt->code);
 	v4l2_subdev_unlock_state(state);
 
-	/*
-	 * Calculate hsfreq in Mbps
-	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
-	 */
-	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
-	do_div(mbps, csi2->lanes * 1000000);
+	/* Read the link frequency from remote subdevice. */
+	mbps = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
+				  csi2->lanes);
+	if (mbps < 0) {
+		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
+			source->name);
+		return -EINVAL;
+	}
+
+	do_div(mbps, 1000000);
 
 	return mbps;
 }
-- 
2.34.1


