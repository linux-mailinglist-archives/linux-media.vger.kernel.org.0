Return-Path: <linux-media+bounces-18748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 581849895BF
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 15:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FB571C20E7F
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2024 13:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A0117D341;
	Sun, 29 Sep 2024 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DUbrEfjU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DE817BEC6;
	Sun, 29 Sep 2024 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727617443; cv=none; b=QrT5o7Zs7v6PvWJt6LnyAbHr3EhH9GtNF09AaIBMOCRcvVnCjWo1p7qVLNYJT5pogkz6+flnnVpOboD3KHS9kG6Q2FMntmTHNfb3c/Pef/0lAL0GDO8nKPthWqp6GV3s3SI377Ycd3CkNJXIi/P8d6+3t7xThAJo27gjVcxjGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727617443; c=relaxed/simple;
	bh=oMfSYlB7P9eLwoLyD1PZzgkE2aC3vO/4RvgIGutTDEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0LHmie8KbnrbCn2AkFKxw45S0bNZVNgA0WeA8ln0etrUw8U+tfh8w/1zmwT/KKP2dmQOBB6UNeoEprFT5lb2LIg4bUPFRAGJ3Zv65bpeqOStLd/Jq4yeMZmK0JhLHaCoI5y2k6L61ZkH3peYZMwWJNO5QZlI44jE2073V2aA1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DUbrEfjU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 805556DE;
	Sun, 29 Sep 2024 15:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727617349;
	bh=oMfSYlB7P9eLwoLyD1PZzgkE2aC3vO/4RvgIGutTDEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUbrEfjU5GOgNz54YsMVhBoPA5Ag4Lc8j4f07vmRdQ20/4uokamIH8Kz085KY02Xv
	 vN3zHeUBLZKOcbnH2T5A9QBBwCASp7Nlmxi9woCiJbnqEjFqdkcdJ3AuBMd/CoEuLa
	 EKgX4jdPMf11BeQWLU/QFZM3h/Muw6dDq+t/1KFE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: guoniu.zhou@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: imx8mq-mipi-csi2: Drop ST_SUSPENDED guard
Date: Sun, 29 Sep 2024 16:43:53 +0300
Message-ID: <20240929134354.20735-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
References: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ST_SUSPENDED flag is set at system suspend and cleared at either
system resume or runtime resume. It is then used in two locations:

- In .s_stream(), when starting the stream to return -EBUSY if the
  device is suspended. This can't happen, As the function calls
  pm_runtime_resume_and_get() just before the check, which clears the
  ST_SUSPENDED flag.

- In imx8mq_mipi_csi_resume() to skip resuming if the device isn't
  suspended. As imx8mq_mipi_csi_resume() is the system resume handler,
  the device is by definition suspended.

The ST_SUSPENDED flag is therefore not needed. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 8eb9c7049425..0f56a40abf33 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -64,7 +64,6 @@
 
 enum {
 	ST_POWERED	= 1,
-	ST_SUSPENDED	= 4,
 };
 
 enum imx8mq_mipi_csi_clk {
@@ -404,11 +403,6 @@ static int imx8mq_mipi_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	mutex_lock(&state->lock);
 
 	if (enable) {
-		if (state->state & ST_SUSPENDED) {
-			ret = -EBUSY;
-			goto unlock;
-		}
-
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 		ret = imx8mq_mipi_csi_start_stream(state, sd_state);
 		v4l2_subdev_unlock_state(sd_state);
@@ -673,8 +667,6 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 		ret = imx8mq_mipi_csi_clk_enable(state);
 	}
 
-	state->state &= ~ST_SUSPENDED;
-
 	mutex_unlock(&state->lock);
 
 	return ret ? -EAGAIN : 0;
@@ -682,24 +674,13 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 static int imx8mq_mipi_csi_suspend(struct device *dev)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csi2_state(sd);
-
 	imx8mq_mipi_csi_pm_suspend(dev);
 
-	state->state |= ST_SUSPENDED;
-
 	return 0;
 }
 
 static int imx8mq_mipi_csi_resume(struct device *dev)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csi2_state(sd);
-
-	if (!(state->state & ST_SUSPENDED))
-		return 0;
-
 	return imx8mq_mipi_csi_pm_resume(dev);
 }
 
-- 
Regards,

Laurent Pinchart


