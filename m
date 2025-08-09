Return-Path: <linux-media+bounces-39222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 936E3B1F681
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD87D189BD1F
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D58B2C08B1;
	Sat,  9 Aug 2025 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G6XikRYh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4202C08A0
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774288; cv=none; b=pLHac64wHr0sW7ht1wq8nddpv7loWlm+JQcLGNxsmSfdSo9q8Srne6jVoXwUb5NpIHlFblnAqUHpRUdGsPLm5Qj4Mm62WaKYhjBufgVnwBxvBs0d0FnasDcv4xZOGAGZaEcbzsr6MfpGNX5VKCKTc1Wiwi343/FJWOn0KtSEAhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774288; c=relaxed/simple;
	bh=XWLYnqWLsfhA0/zo2B0wTYZL9my/2dFXGOdS4qNCiM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0Tyx2odr2Ix3Z5AEeHCJ3+woxZusdb6LY19MeEIKAujU9gPuP0IauJxigERT7oWIp1K0UZLAtPRwewEQyIXMpFeCwrs4c64ad2ZtmW3yMVoiFvsjXhBqExLn2mYqCIOc8K2pO7NwhZbT1Ztp9TGjxLlHxW3Tu3IXft4u6y0V9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G6XikRYh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7540A1440;
	Sat,  9 Aug 2025 23:17:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774230;
	bh=XWLYnqWLsfhA0/zo2B0wTYZL9my/2dFXGOdS4qNCiM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G6XikRYhBSbkZlPTUoWyLRRm0kAtyvZaf8OcWcqXJsqCxKG9p1pIymtfdZq60fPkL
	 RG31yywNE64fUBZUZdPaJ1obJemUeMhcLuOja0qbaY1tNpY4NM3NssL4I8WGQWDEUj
	 yvTtBnTBH5nwZ3eLGKnmMb8QVDzPtEt0NUldbydE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 30/76] media: v4l2-ctrls: Move v4l2_fh retrieval after V4L2_FL_USES_V4L2_FH check
Date: Sun, 10 Aug 2025 00:16:07 +0300
Message-ID: <20250809211654.28887-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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


