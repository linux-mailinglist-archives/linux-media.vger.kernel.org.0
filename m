Return-Path: <linux-media+bounces-27203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CCBA4949D
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1401E3AF088
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 09:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBA32566E9;
	Fri, 28 Feb 2025 09:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CSQE5MaW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033C1C2324;
	Fri, 28 Feb 2025 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734277; cv=none; b=rTdsRV5V8tToNQiu/NU4/uKdUvfCgYLtW6V7OYBBzt/qB3li+WbhmwAXrVCuM5ysVGN67+D6ishS0RJRTls1fBQ/21ggvYwKuyhiKUPbbShOVniGaol/mygjcWtCsFl0Z0prdq3eHPmHzXQZvI2AONkbsI+qCsSuR1jeBkJbfio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734277; c=relaxed/simple;
	bh=Z8agXOvfl+b8eIlKBVhxUrvRWqQjZd5gHAju5GqfGp4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rg1xzyiBiIjlvoSNafMHoolOLTR8xSi6B/1XgmkUlsp3EQXwRMllB+tjUtJH2m0rIuZpvMNNv9HxfLvB1AcN+WcX1DXuUc5Tm5aXgGY3jV/F+vlmx+bkpHgxPwwG2or+DFl3wLgUdsIJFhejDs1YNg4hm5OvmEouIZOG4l3XbjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CSQE5MaW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:7597:2d2d:d3f:6ef1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5C91606;
	Fri, 28 Feb 2025 10:16:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740734177;
	bh=Z8agXOvfl+b8eIlKBVhxUrvRWqQjZd5gHAju5GqfGp4=;
	h=From:To:Cc:Subject:Date:From;
	b=CSQE5MaWFATU6H2Hx9yBqIob8CgnfL+SIeMD1JZaRYkV5HOMnY4ZwxxVdwxwj1d/S
	 6FtQJwJ2Pay3a5S/Z8VuQeKWYSUrSYGy4nTdXd8UKokTArwPey501MN8/ZYZBS6lVn
	 kxhZnrT4l/JZYZDxvNLBUgdfJgRSr2FhZmKpuBUw=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] media: imx335: Set vblank immediately
Date: Fri, 28 Feb 2025 18:17:31 +0900
Message-Id: <20250228091731.236162-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the vblank v4l2 control is set, it does not get written to the
hardware unless exposure is also changed. Change the behavior such that
the vblank is written immediately when the control is set, as setting
the vblank without changing the exposure is a valid use case (such as
for changing the frame rate).

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
Changes in v2:
- error check the modify range
- improve commit message
---
 drivers/media/i2c/imx335.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index fcfd1d851bd4..0beb80b8c458 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -559,12 +559,14 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 			imx335->vblank,
 			imx335->vblank + imx335->cur_mode->height);
 
-		return __v4l2_ctrl_modify_range(imx335->exp_ctrl,
-						IMX335_EXPOSURE_MIN,
-						imx335->vblank +
-						imx335->cur_mode->height -
-						IMX335_EXPOSURE_OFFSET,
-						1, IMX335_EXPOSURE_DEFAULT);
+		ret = __v4l2_ctrl_modify_range(imx335->exp_ctrl,
+					       IMX335_EXPOSURE_MIN,
+					       imx335->vblank +
+					       imx335->cur_mode->height -
+					       IMX335_EXPOSURE_OFFSET,
+					       1, IMX335_EXPOSURE_DEFAULT);
+		if (ret)
+			return ret;
 	}
 
 	/*
@@ -575,6 +577,13 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		exposure = imx335->exp_ctrl->val;
+		analog_gain = imx335->again_ctrl->val;
+
+		ret = imx335_update_exp_gain(imx335, exposure, analog_gain);
+
+		break;
 	case V4L2_CID_EXPOSURE:
 		exposure = ctrl->val;
 		analog_gain = imx335->again_ctrl->val;
-- 
2.39.2


