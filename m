Return-Path: <linux-media+bounces-35661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1796AE472D
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B55B189CDC6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C237D2676F4;
	Mon, 23 Jun 2025 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fm0Egm6p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886D6267AEC
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689816; cv=none; b=GKsPrAzCMt9lwmnHvqaEnhVXV1IzTAFVk1dasZWIBREkAjb1TaAmuLv1cZv52458t7NUjq/xlOz5xFmQa550C3jFOEphBOkJhk8j2SfGa6pjI6+bFfP91j99cmbLNEZz1XkP9wVBYfIQfJoOwJ07q9C1+c35Dw1B18Nd8H8x5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689816; c=relaxed/simple;
	bh=SjAa8mNSANkR/noEWHP4Y1s50su9xYeJqBnhzB1DB3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STxvZ2StBY5b/BxeAj/IP3kX9AhiMqYRMWQMyRbB4/nhGcCH0mN7dZvnQSSWZH9wW2d6kG/1EezX2R87x8To7I+btyJgQeGZz9M4AVVzPHgzOWJPc7PBWeK4lLJN6vTX2+irBq9oJ14tyyrueoJ5kRoFQuKtIRB9fL1ZCaM1XTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fm0Egm6p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E901198D;
	Mon, 23 Jun 2025 16:43:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750689793;
	bh=SjAa8mNSANkR/noEWHP4Y1s50su9xYeJqBnhzB1DB3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fm0Egm6ptAHph5O9afSPbJaxgFTr0qZl8ekHGBHE4POs4nYDXG5lZXnAXJmq09vog
	 aTa2ob8uuaP871wLWM1z3tqKPjNekZ795FmQzNkccQ695prDBDxAuho+jnj8vvuWaQ
	 tzmxSskEldYdWRsTzl3ENP5dAL/0d/ZleI8/Sp5w=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 23 Jun 2025 15:43:20 +0100
Subject: [PATCH v5 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-rzg2l-cru-v5-3-1663a8c6719a@ideasonboard.com>
References: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
In-Reply-To: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWWgOb1Pqny3K/VJBj5SeeUgTpKxYsUmgAlIsu
 n0CBkZ3XsCJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFloDgAKCRDISVd6bEV1
 MnI3EACsRWadwDRBIBKSgMBmHXjTQ7Q9XZLT+gnMLl8GkpDSTHTSfggQ6HTBokFvnLbSxUPiH0U
 CFnBEI76StiPC4uClZ1JbaSKUT3CAVJvmUqrRKLNCmdcXtlqzyNwjbFSDTT8xX64rjYh2EqeTAa
 AR769tLjKxh3WCfmXfx3VAdyDcDC902AtVlovPQIwZLoNoBpfkir7Pfzjk0Ererrzf0r2r4pj84
 3ZQlPOpg5JAtbKm+ePf2nDzscyldiCUIL5bQBb+WI2H7jfjEo39WnY8Q4YNxZbkt6XhfTSTFEpF
 mdYgTngVmyZTFosCgOghYJxEUsd8+PuouB0qOS3OMWdUlWscT5sDNmf+ffkqmKFKIHOILbXlHTI
 dx0J9C+vzB0cflWIBWw39wTU0aNfGC4yl7PeEeNY3Aak39RMfNFQiwqTbid+WArbepr9gnV6eNA
 XpwWxniHnYEKizSsO5E9ZRK4AycQ2W4Szq+sndFJBlWsOyqEBZyHVVlrpzgLNiUJbQsj/zABP8R
 nWYfA94ItPT2koxLYMFnBofXUFgTE+Y4LLkdvKFInG8HIp24/AF0AtZXP/xRuq3mqGNmgKiinAr
 5ycOaLUOxd51YGVIvHhRz7aECsfvYvhFkcbddiYGmxI0fvq4lyZhv3qNQQz0nyZG231V7q7t0s/
 SNej6rTDWEVIwyg==
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


