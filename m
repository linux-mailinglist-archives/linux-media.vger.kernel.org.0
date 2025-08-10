Return-Path: <linux-media+bounces-39303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E889B1F7BE
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CF4F189A8EF
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1E71E834B;
	Sun, 10 Aug 2025 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mC8oT++F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5E25B21A
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789534; cv=none; b=ejVG0yCy38ldMyEzV+sygtsEU0cAdukXxpqiyh+iXn39JeLJ+B/4lELpMc9FO6eSnzkW63pBcPooHptt+roOneh04Wn11f4A006Fa/mdZa/wEF8luoiLh8fZPXZkhr4EzfErFSuEjTuY8oRo/01uOB1hg1GRADwv3/cU8+EqIKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789534; c=relaxed/simple;
	bh=cf/bqrBRTzLDk/cgyvkA/hZ4rbt+LnHsQpeNCYvPoYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eeb/AIbTAUCNiBdjGsRUNolAaESya2mAqPYVpAukt0XsrYMvq+wbUtI2NDZzPa0K8iJl+Zy6w1iEhY8rEJo9/jSJWepkOiLneRUwIvpAB98pM8RgywND6+dJjHejxZqYM4FgBqwL++vQpW6XhefJXT2RRqPJKZlFEJVVa15kdM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mC8oT++F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F298F19C6;
	Sun, 10 Aug 2025 03:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789480;
	bh=cf/bqrBRTzLDk/cgyvkA/hZ4rbt+LnHsQpeNCYvPoYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mC8oT++FQlvCBybfsJx39cJo4eXgmQ2EqANy7IduIveERk7stJWhnS52LtJj98/M1
	 0yEsCAtnmIrR8qJu8UdXuaQlBYuk2d1u/ShCGDxgKdKTINFGWS8ism9aII3iYb9TXO
	 ycqTlGq1ZpaXEJD+nxUQeNxz18hGQvv23bmPDrlA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v3 30/76] media: v4l2-ctrls: Move v4l2_fh retrieval after V4L2_FL_USES_V4L2_FH check
Date: Sun, 10 Aug 2025 04:30:12 +0300
Message-ID: <20250810013100.29776-31-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_ctrl_log_status() function retrieves the v4l2_fh from the file
with file_to_v4l2_fh() before checking the V4L2_FL_USES_V4L2_FH to see
if the device makes use of v4l2_fh. While this doesn't cause any
practical issue given the current implementation of file_to_v4l2_fh(),
it is cleaner to retrieve the v4l2_fh after checking the flag. This
could prevent future issues if the implementation of file_to_v4l2_fh()
changes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index d46b2c8f3d23..b0bba8eec143 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1253,11 +1253,14 @@ EXPORT_SYMBOL(v4l2_querymenu);
 int v4l2_ctrl_log_status(struct file *file, void *fh)
 {
 	struct video_device *vfd = video_devdata(file);
-	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
-	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) && vfd->v4l2_dev)
+	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) && vfd->v4l2_dev) {
+		struct v4l2_fh *vfh = file_to_v4l2_fh(file);
+
 		v4l2_ctrl_handler_log_status(vfh->ctrl_handler,
 					     vfd->v4l2_dev->name);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(v4l2_ctrl_log_status);
-- 
Regards,

Laurent Pinchart


