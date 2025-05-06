Return-Path: <linux-media+bounces-31852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2A2AAC48F
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31241508368
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915BD27FD7B;
	Tue,  6 May 2025 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FZ/w4R5f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B5B27FB28
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535833; cv=none; b=ohyGy+FvoStkRYtTY0U5/IKB9wWC/TdoQ1IDTmwoyqWxYaloxrc3s/fvlTIJylA0M3kldZSLOWCXNivOrV2Qbw3OYdb5JE2q2LPB+fwzZNA4os+3JL9SKoJDSc+dUCC094Lg0bAIe+2N5yDSdLE0KlVenSOcjwNWVIzRLgdAZ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535833; c=relaxed/simple;
	bh=ma0akBHRcrTSBj6u7BlD5nmRLyIGmCgelewurfuoJvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pqNifiHqWbMd/dJWiPWc6t+WDOpEENdWSvYLBHLtZJR31kq9JzV6W7WBVBRecXnuds1IcMC/DGV71Jv3sjuTHQpfi+UPOF5XlyC0s1QKQ+DdFv5gHRMvSdJIn42NXdSAxjmjG1kpcxfSjuzJSc/+5uiEVdk8rpmg8DZaBDB31SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FZ/w4R5f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAEFAE45;
	Tue,  6 May 2025 14:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746535816;
	bh=ma0akBHRcrTSBj6u7BlD5nmRLyIGmCgelewurfuoJvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FZ/w4R5fiWUCfVR47AAFQT4LPnG2UnTcQ7DGJFF7017lIMBrOaxNI2FoUHrszv0AO
	 fOWj6iuFRi9j0o201CfjlNfyjzDflKB8aHRpR6jfbZcKx/8duulu/r9bd1iiaRit3o
	 +qQHD+9dhGRnxI8kmDzZASHd/tIImWNutmKFXqPA=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 3/6] media: platform: rzg2l-cru: Use v4l2_get_link_freq()
Date: Tue,  6 May 2025 13:50:12 +0100
Message-Id: <20250506125015.567746-4-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506125015.567746-1-dan.scally@ideasonboard.com>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
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
Changes in v4:

	- Used separate s64 variable as return value for v4l2_get_link_freq()
	  and as the mbps variable for do_div() to avoid compilation warnings.

Changes in v3:

	- Fixed mbps sign

Changes in v2:

	- None

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 9243306e2aa9..8870c2cb8104 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 	const struct rzg2l_csi2_format *format;
 	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
-	struct v4l2_ctrl *ctrl;
 	u64 mbps;
-
-	/* Read the pixel rate control from remote. */
-	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
-			source->name);
-		return -EINVAL;
-	}
+	s64 ret;
 
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
+	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
+				 csi2->lanes);
+	if (ret < 0) {
+		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
+			source->name);
+		return -EINVAL;
+	}
+
+	mbps = ret;
+	do_div(mbps, 1000000);
 
 	return mbps;
 }
-- 
2.34.1


