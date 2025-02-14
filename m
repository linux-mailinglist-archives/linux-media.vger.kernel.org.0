Return-Path: <linux-media+bounces-26160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB7CA35F65
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 14:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B193AD018
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 13:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC2A264F95;
	Fri, 14 Feb 2025 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZGUCpVMc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA3D264A78;
	Fri, 14 Feb 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739540255; cv=none; b=IvVXLeUfS0RkbFaKS5pCxUDvXKHAspi33l0uHWheBnhq9zUiXtP1v6pXxctN5UiZ5AIPLt7JVqmYAdPI8mMgZwDi5mP6rxbiwFyXHLboBuTiv2QD0T1uqliFo1j2TIa2YcwcV3YOmJHh058zQKI8bW3W83D4jPZ+rMvce9qsORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739540255; c=relaxed/simple;
	bh=UtFCl9EjM9ixUzfjjGTOmEQy3HOW2RDlRoM6DAj4ysE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TNhO3kL/enLitZt/WXFsBCZcUgkEYTILb9kUWqgsCwqYjrKM7y8MKZEDR9rqmenhC8IPY/r1Xz6NZpR050Vg5ic7CRGeLF8tHylAlHQzjU8YoaKfngCdnitOjplWLWz5A67r0uC0b34EAT8AuqgZMhz7/AhpgsmWbZHKTdnlWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZGUCpVMc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:c0c:59da:a44c:57ce])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01A4373B;
	Fri, 14 Feb 2025 14:36:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739540167;
	bh=UtFCl9EjM9ixUzfjjGTOmEQy3HOW2RDlRoM6DAj4ysE=;
	h=From:To:Cc:Subject:Date:From;
	b=ZGUCpVMcvxduX5cQNKDwpwXkGR3IKsNvhGwHIolf0O2RZs0NyfTJXV6yA5KI+w0k+
	 QBGWhANMBSY5be8t/YM78GmZ01Jd+tfwD/b2DG1K1Xlsg47qSrViaRRpXGxO/Gil/X
	 m8yrm1vQf2a16oHtCUkC92ffiepZ/bnQbE8qGqAU=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: imx335: Set vblank immediately
Date: Fri, 14 Feb 2025 22:37:09 +0900
Message-Id: <20250214133709.1290585-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the vblank v4l2 control is set, it does not get written to the
hardware immediately. It only gets updated when exposure is set. Change
the behavior such that the vblank is written immediately when the
control is set.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index fcfd1d851bd4..e73a23bbbc89 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -559,12 +559,12 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 			imx335->vblank,
 			imx335->vblank + imx335->cur_mode->height);
 
-		return __v4l2_ctrl_modify_range(imx335->exp_ctrl,
-						IMX335_EXPOSURE_MIN,
-						imx335->vblank +
-						imx335->cur_mode->height -
-						IMX335_EXPOSURE_OFFSET,
-						1, IMX335_EXPOSURE_DEFAULT);
+		 __v4l2_ctrl_modify_range(imx335->exp_ctrl,
+					  IMX335_EXPOSURE_MIN,
+					  imx335->vblank +
+					  imx335->cur_mode->height -
+					  IMX335_EXPOSURE_OFFSET,
+					  1, IMX335_EXPOSURE_DEFAULT);
 	}
 
 	/*
@@ -575,6 +575,13 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
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


