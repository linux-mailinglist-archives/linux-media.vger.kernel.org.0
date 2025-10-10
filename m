Return-Path: <linux-media+bounces-44164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD1BCC731
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B51E4EC0E8
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BCD2EDD40;
	Fri, 10 Oct 2025 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpCnZGLh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37820A5EA
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760090262; cv=none; b=c97lyn1ZbzQuPm7JEkTjYOs9+l4e3R2PXH+HDpGlkGvP+HlYdbBb0aq4Bwqvkes+eWgDpsw76ln2/R1liYUUz8YKEjezuCMpioUuz0llQsRMNTG+S5Fo0ayyOQWuuZ6pkk16nvj3aQoehEStQWYjmBbwh5zvXP8mOkm2OFTW1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760090262; c=relaxed/simple;
	bh=NvYnKY/jvw4YCD+xlaSbJiU7QNkoSU2GW2g/7jS26ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHbUMjQjxfQImep17KEPI3Zl8oLRvf3H+3w0GPnYkYTIIWG+Ewb0Vum1PaaUfWPCXLCzNBC+tzgrzx7d4T42pTvXOKYb0W+msdfAYSICjRvHRKi6HRt6UIsDewXb4Ox4wbmZ8auML/YrWTdjy5sEssIgmoYoQ9kMwACHlrhQXLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpCnZGLh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A2AC4CEF5;
	Fri, 10 Oct 2025 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760090262;
	bh=NvYnKY/jvw4YCD+xlaSbJiU7QNkoSU2GW2g/7jS26ng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bpCnZGLhKhwY5MTxMi9Pzqtqd5eYrBJWg7/4QqqvPikA14VDZDsz0fQcDasPvrUR9
	 GIpJyJURK/XzG8AWQn14ZrnIqQj7kHbE7/KUc7rk87c9zlUkHc4MEO2PX1O7nqwtlP
	 1/0a6nDSSoK+Phd3zKA3RiDB5chILdZZv4LITS2i61ueNIJDhWHyzcE9ylBoqSjlzm
	 vofo3DRXh8jfUenHuhLs4t8Ge0MatWvXHzmUEkqXgK4lZbziilxpUtE2q5hnqzkXLg
	 lUJbaJRLhO0W4HKoJsMfynkaG2BgIQtNiXw1ouOP37yBe1Wb+J1nbZLBdx/bbwqj7K
	 npyu++j6CKXYw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [RFC PATCH 4/5] media: v4l2-ctrls: set the new V4L2_EVENT_FL_INITIAL flag
Date: Fri, 10 Oct 2025 11:54:09 +0200
Message-ID: <595f29628beadfb67bf7624331f99a09ebc29505.1760090050.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760090050.git.hverkuil+cisco@kernel.org>
References: <cover.1760090050.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If V4L2_EVENT_SUB_FL_SEND_INITIAL was set when subscribing to the
control event, set V4L2_EVENT_FL_INITIAL in the flags field of
the initial event that is sent out.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 85d07ef44f62..6ff9b2f7e668 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -47,6 +47,7 @@ void send_initial_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl)
 	if (!(ctrl->flags & V4L2_CTRL_FLAG_WRITE_ONLY))
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
 	fill_event(&ev, ctrl, changes);
+	ev.flags |= V4L2_EVENT_FL_INITIAL;
 	v4l2_event_queue_fh(fh, &ev);
 }
 
-- 
2.51.0


