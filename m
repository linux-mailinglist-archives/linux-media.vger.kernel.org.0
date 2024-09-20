Return-Path: <linux-media+bounces-18419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE597D589
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 14:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E66F1C213B3
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 12:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E316152E12;
	Fri, 20 Sep 2024 12:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kwck5Hp4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0425E14E2DF
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836097; cv=none; b=tXZRXDWWWY/CBGEjUiZ8e1U2QgYnZCN8F1n0NtC7norSKgf7tJttJfNHnkWhxsSj5pNVvy0NIgmbGBws7v4XPj18KYczaodd6s6q6fyb5z0b2kcLfC2sqjnJ/U/pMgurOZSkm2Re2AklVNmn5cTY1HovAu1NPhAV7eaDPt/aIbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836097; c=relaxed/simple;
	bh=jZ9eXKa++Pd98AdWWN3cAh/9H4/43Yg1cjymf4NCClU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MQpYlzZC+KaKiuXB9nzpVyDb18QvOOKC5Rjmg1ZYZtSg6D4GxqgNbd0SsWj7Gxv7n8XX6fPwVRbEZ7qw05Qcf5o6r9tVRnTAJ8OgiixUWBgkMXhXvp0dOQYbRPGjgA4W20Ns/vEibxVbIh33/rp58V9nPZuUO3b7/wCpkX6E8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kwck5Hp4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A4CFC62;
	Fri, 20 Sep 2024 14:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726836007;
	bh=jZ9eXKa++Pd98AdWWN3cAh/9H4/43Yg1cjymf4NCClU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kwck5Hp4N/Rpe3qGBT5WOyGPC4Q5hQs5mP+HMHVqv0bIAKcm73en+4S9KwhJICezF
	 vErZCYsL/Q14fukFM3SdczFXHT3vPJmX1zz5AGMwVKRnLe0R3AVsJl5W10/afZg6fg
	 0CS3Jk/JbhPppvkcWa7xO79pwLU7xHcTQ0B1E2Qg=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH 2/4] media: platform: rzg2l-cru: Use v4l2_get_link_freq()
Date: Fri, 20 Sep 2024 13:41:13 +0100
Message-Id: <20240920124115.375748-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920124115.375748-1-dan.scally@ideasonboard.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
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

Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index d46f0bd10cec..9609ca2a2f67 100644
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


