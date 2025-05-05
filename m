Return-Path: <linux-media+bounces-31769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D2AAAE56
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 482491898F30
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC5936E08E;
	Mon,  5 May 2025 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2rR+MmQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBEA2D2CDE;
	Mon,  5 May 2025 22:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485208; cv=none; b=rWFSQnhU0ATFWvIy7zDusdIxdQK9H/F/RJgwj6hI8bTbe5C0NetS8CdeliJl6+kDaM3akUuiIrer98EGWpxLISfzDidalZeSiup/RbdkG/NpHTRxUMonKGGj8SOGks+np5KOckZK8EkMBnehwEPraF4MySsddYPPi6INHZB0xW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485208; c=relaxed/simple;
	bh=UqQQ8ENBbU5xPf3Z6v1IrmngkKFljdoHuXmaVJ3pGik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R84JDSQtHsqNpMhZYTWR/Yhrba44/JD0mMF6ZtUh0kQ2NIWz7dJPB7u99ieH86kzulfnIPSfF2lltModxgrRoHj+tUuIItpoD4AhqPhUvPfkFC4c9EH/2KQczyGQq8U2wD9flx5COs4BAuaIzJKTCSbawJl4FQk48+M3ORgdwwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2rR+MmQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD9DC4CEEE;
	Mon,  5 May 2025 22:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485207;
	bh=UqQQ8ENBbU5xPf3Z6v1IrmngkKFljdoHuXmaVJ3pGik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E2rR+MmQs3tcepvfFdMGLdL6nbthY9oTeGQC/Nj91t86Y+HM53vtYb9P7IWIxWZzi
	 l5Yor1Gfv4EqjuHDx4SGfl+sYwq9x2BvukimIjjT1YZaf1DHoK/nniqO/idx1h/mAJ
	 auJ10ZBAl0aqa6R6/xQy/hTsbYkrpVxxLOMjYz8ws2Kof7mo9SIVVNL7BuSuZ++TUA
	 z1UKyeu1D7Y1jrKLLJkAJsXxZJVLlBGjYGtnElhe6T7wOF4rZeLUkKkjxcZF3gGzvf
	 NWh19VatbYcq2oEEPULvtxlWYyUDRSvns5dl4TTvNOwufrCpCRRlGX+odTnHbT/GXJ
	 iUVrqfYQ3J1Bg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 211/486] media: imx335: Set vblank immediately
Date: Mon,  5 May 2025 18:34:47 -0400
Message-Id: <20250505223922.2682012-211-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

[ Upstream commit c0aa40f45fef80b4182704d1bc089cbf8ae8bed0 ]

When the vblank v4l2 control is set, it does not get written to the
hardware unless exposure is also changed. Change the behavior such that
the vblank is written immediately when the control is set, as setting
the vblank without changing the exposure is a valid use case (such as
for changing the frame rate).

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/imx335.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index fcfd1d851bd4a..0beb80b8c4581 100644
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
2.39.5


