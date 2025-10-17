Return-Path: <linux-media+bounces-44901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54886BE8F67
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A87681AA683D
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99502350D58;
	Fri, 17 Oct 2025 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtKaE5AS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB42F6913
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708328; cv=none; b=MiNhcD1P1VxFUDX1z9vk+20VL39a2E6znXjyLjdtxi3r7UI6Lm6TahyqKW8Rz5NekzAgFWBLAajX02ZaZMbuETszqRwHIOKfjYt+Zq0wlV8x7IJ3AzzRqpUmKuH3vWhCS/rIv/QdOpmohQ0bnsSfbdyGWOyBbH1AN9ZQIPYOQeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708328; c=relaxed/simple;
	bh=AKiGQS3XuZRUswEoQGNRJvdiebnl4hck8fvyF6yKs+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCkCTxv1AvdRS9pT3rLocHgykIlk8ocwiMOYt4K+6tMMDlxtDnZOzddf2cOGZUlGuzRvyewI9Mheys4ogYTv1knhYDYjlXneoeDpvuH3IG51JqPAf/xTneDA+dKxe3qilC3NUI3enD0c5yhU4O/GdJIKSMQt7/wsqbq90LXH32U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtKaE5AS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95955C4CEE7;
	Fri, 17 Oct 2025 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708327;
	bh=AKiGQS3XuZRUswEoQGNRJvdiebnl4hck8fvyF6yKs+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VtKaE5ASc9oN6CQg6AJwN1r9CeiHkyRndlMQ8WwiNDKzhso3hdqtl9urOpy/5otig
	 F4LrVD6YuZQamEDmk8z0f2O0rHv4iJAIwOyBB6XSqardEGE09/mclZfYD5SqkdhqiJ
	 mqdkw4kekLU1MGuO/Lu6EqleAxj8ZItywzQcq/7SO4XYWXcWpxgHRM9GZJMlo1yw4a
	 o8aGBsfWxfuOIEa1wcKjB7TAzmXlstqDLPx4CaIZTrNMu9+o+8L62b6EAzMbuIPube
	 4nHLIOpbxrhrH65qtyValZrAbo1ttgGj/qdl4VHTIHG97KWZsCpZhLNFZT+XrGugen
	 EXTOzu1qagowQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 10/14] media: omap3isp: support ctrl events for isppreview
Date: Fri, 17 Oct 2025 15:26:47 +0200
Message-ID: <d17efbc93d2516d93f9b3909e758606e2fa87e0c.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The preview subdev device was missing V4L2_SUBDEV_FL_HAS_EVENTS,
and that prevented VIDIOC_SUBSCRIBE_EVENT from working.

Fixes a v4l2-compliance error:

	fail: v4l2-test-controls.cpp(1128): subscribe event for control 'User Controls' failed
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/isppreview.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index 9992db782870..3e9e213c6d8a 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -2277,7 +2277,7 @@ static int preview_init_entities(struct isp_prev_device *prev)
 	strscpy(sd->name, "OMAP3 ISP preview", sizeof(sd->name));
 	sd->grp_id = 1 << 16;	/* group ID for isp subdevs */
 	v4l2_set_subdevdata(sd, prev);
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	v4l2_ctrl_handler_init(&prev->ctrls, 2);
 	v4l2_ctrl_new_std(&prev->ctrls, &preview_ctrl_ops, V4L2_CID_BRIGHTNESS,
-- 
2.51.0


