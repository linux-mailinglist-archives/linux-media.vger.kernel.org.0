Return-Path: <linux-media+bounces-21312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6569C5834
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F200D28434D
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 12:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C79D154BFB;
	Tue, 12 Nov 2024 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gy7dRIDM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009011531E6
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415603; cv=none; b=G/tTMSjlyMJkvjcYGlFnaf/RyVwkHZF3gJB82tq0aReqX4bd55Auu0sip7GWY3LlUlICd6vjia358isIC5S1M+NPP9+JmH0WPlZZRkFATSgXmZYLz7dgkpQYE+ZfLa2q7PB0DG1e61bu3SThQJVtAFNMm54A+ptJoV5OWteO3ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415603; c=relaxed/simple;
	bh=3G2hgOJyoaxEsYZ1atcV8A9DXY9eb3ee9iAM/cUFZWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TOJOSRFECSzstD79vXcpns6pr3LUnKIdyXHy0EcC2DuBjaXBoVDdUZTGqUZP6XJUBSE04Y9SWWRV4EFD7SRJBvo8r9POcTa+Z6bPMSSKRecm4+pOSdU03J6V+JlxjST0qpYGskvyrLF2JSNZE41dRA+zQwt+Z92WqnkoBmD38Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gy7dRIDM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBEF0F02;
	Tue, 12 Nov 2024 13:46:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731415583;
	bh=3G2hgOJyoaxEsYZ1atcV8A9DXY9eb3ee9iAM/cUFZWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gy7dRIDMn7jwptvYaIzXFA4GYrSK7tSUi9OVhmpldYs6mfcYeDs0AmXy770VGDsLC
	 WYwi/xD0WD1gvUHM1IegsLcsy08z/J88aKPrLHYeS6yMeOk4Vcn5FBd6vXO6RP9kb4
	 07ueR8mGqItbIA30frIDwKPJjitkgsRavRCVOaXI=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 2/4] media: platform: rzg2l-cru: Use v4l2_get_link_freq()
Date: Tue, 12 Nov 2024 12:46:12 +0000
Message-Id: <20241112124614.646281-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112124614.646281-1-dan.scally@ideasonboard.com>
References: <20241112124614.646281-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

The rzg2l_csi2_calc_mbps() function currently tries to calculate the
link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
of the remote subdevice. Switch the function to v4l2_get_link_freq()
which correctly targets V4L2_CID_LINK_FREQ before falling back on
V4L2_CID_PIXEL_RATE if the former is unavailable.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
Changes in v2:

	- None

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 881e910dce02..cbefd43de09b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -242,28 +242,23 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 	const struct rzg2l_csi2_format *format;
 	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
-	struct v4l2_ctrl *ctrl;
 	u64 mbps;
 
-	/* Read the pixel rate control from remote. */
-	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
-			source->name);
-		return -EINVAL;
-	}
-
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


