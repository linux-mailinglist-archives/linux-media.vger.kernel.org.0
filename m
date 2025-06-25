Return-Path: <linux-media+bounces-35856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 005D2AE7CD4
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 922325A6E0A
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 09:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FE729AB0F;
	Wed, 25 Jun 2025 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lLec3p1e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB87E29AAF9
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843253; cv=none; b=LEK2Cz9zQQiKY0Mi7r5bfWO1tTNmX81Wa9VV5UNYy9w/tiNmaol4Dyu3mbIRVrx2Qm4EGBsJuldqODMmEcihtuB+EB99nNhdiMqc5euJXVy9IIlrQShjW6I01zJD+xyO038Y0p0NswLR8DwecESpLiafBeDgz8+1kli3c9l9lEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843253; c=relaxed/simple;
	bh=SjAa8mNSANkR/noEWHP4Y1s50su9xYeJqBnhzB1DB3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KcaQD0nhXJFdBXkAbrAFdxrqptPoXkTdCcGCv3r6qhud14YjoKITB00B9UQh+0Nc0HjMODoM7Z+92uZ0wVgh77jQ/QEvJiBmcQXcqZ6I+fLork7rUKXuER2jXH+atvXqXGRan6iOAnwO8l0aMxbaUwoAtkhTGiyEWz7JDUY7LR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lLec3p1e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC8DCD80;
	Wed, 25 Jun 2025 11:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750843222;
	bh=SjAa8mNSANkR/noEWHP4Y1s50su9xYeJqBnhzB1DB3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lLec3p1eLXHokWdKP5trFzYCSFg3N7wZFINeiW3wTXWUX0agJhGQsQ5UadaXsvPOH
	 Sp1AtNV6hsPpXvCul70cD9rS+P9A2+FkbFy59d9cIWBYeUjVwU/ZEyDDuM7PqEA1+N
	 TYsNmdhCvGjgQmEybdh9FTtRivsRJw67oAlzvwTY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 25 Jun 2025 10:20:29 +0100
Subject: [PATCH v6 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-rzg2l-cru-v6-3-a9099ed26c14@ideasonboard.com>
References: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
In-Reply-To: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com, 
 dan.scally@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3156;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=uS3rdeeM6U3FG9sGfJSslESr78//nYLjB9Qtrpuji6I=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoW79lEXdelQxmoC8JXCIqLdD7yGrugJCyl8uH/
 JQPNa5tqcCJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFu/ZQAKCRDISVd6bEV1
 MnWfD/9yVoGmfZvZjbQCTMgm8WWbx5BwyAOyfmANb8HGuwDE4mm8SKwFnoTbbk+ibG1IsK/GEmr
 xCRXkzNspftDcLwSIlSdYSv+mVjyHIOgSuCtjJC2ZBhGp8kB4QIIkqwb9gH//MIXutiDWJ3tF3s
 rOEKYVhdWNi6DurtsekJeK07xUh7jbL5yLRlvX0w29XOPERKTIn5Aj2QdpAYdE40qSSgjQFS454
 Hi/43VjV4eYPSc9MfeASzlCa73DtlMbiKVdxg0qLSvUzqmCpfhNlstXRbPdXThLbJd97kaiSBlC
 nf2kKKV9oRhgflgsM6ZaAg+3sZVDOt07CdhBMbDhGoHm+myzsTCnwRwMt3H0smcoERlrkSEcKDL
 Tp+r+mjzRY5i/E4H5aiy2eo+hiPvR2MOLDkrbas3qGQy8RKrvwxZR+eziG8D4GbTqMdB8kG8rLB
 tgiQ7ObLEG1xXI6tg5B0AGzJEIJ9alF+g/U6Xn9BsZRvmKTGXdvFb8llCFNptrddp0Y0jUIDxpb
 Rf1ySRhnJiYwvNT+LO+aiyK2ESQFMG6toUuoGr9RPr+q3VUlcNdYiefhmnNiHGM+QIuWLb/NFOi
 qo9QrZQnoDJjf0iXPFN9km5VYvrm28nh2whr45yzutFcXp7VLZCDmSWLQs+otMrD6u5OuOSIfHf
 w/GRY0wrm5ClMQw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

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
Changes in v5:

	- Switched to passing the pad to v4l2_get_link_freq() instead of the
	  V4L2 control handler
	- Corrected the frequency returned

Changes in v4:

	- Used separate s64 variable as return value for v4l2_get_link_freq()
	  and as the mbps variable for do_div() to avoid compilation warnings.

Changes in v3:

	- Fixed mbps sign

Changes in v2:

	- None
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 33 +++++++++++++---------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 9243306e2aa98587ed8aa70bc91f9ca4758362c8..cec165551183afb71ae019b277c46a17a0f8096d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -282,15 +282,18 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 	const struct rzg2l_csi2_format *format;
 	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
-	struct v4l2_ctrl *ctrl;
+	struct media_pad *remote_pad;
 	u64 mbps;
+	s64 ret;
 
-	/* Read the pixel rate control from remote. */
-	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
-			source->name);
-		return -EINVAL;
+	if (!csi2->remote_source)
+		return -ENODEV;
+
+	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
+	if (IS_ERR(remote_pad)) {
+		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
+			csi2->remote_source->name, PTR_ERR(remote_pad));
+		return PTR_ERR(remote_pad);
 	}
 
 	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
@@ -298,12 +301,16 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 	format = rzg2l_csi2_code_to_fmt(fmt->code);
 	v4l2_subdev_unlock_state(state);
 
-	/*
-	 * Calculate hsfreq in Mbps
-	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
-	 */
-	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
-	do_div(mbps, csi2->lanes * 1000000);
+	/* Read the link frequency from remote subdevice. */
+	ret = v4l2_get_link_freq(remote_pad, format->bpp, csi2->lanes * 2);
+	if (ret < 0) {
+		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
+			source->name);
+		return -EINVAL;
+	}
+
+	mbps = ret * 2;
+	do_div(mbps, 1000000);
 
 	return mbps;
 }

-- 
2.34.1


