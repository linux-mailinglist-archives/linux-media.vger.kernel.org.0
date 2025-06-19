Return-Path: <linux-media+bounces-35434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A85BAE0EB7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED1113B2225
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F0725B2E8;
	Thu, 19 Jun 2025 20:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WrXkg9lS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3642505AA
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366056; cv=none; b=X96qEM3efrbjIEe2gUBl8fHwY0YYoHAxLxIumGCH31URKMYkhPn/bbRtoQiU6xH6LjudpppDWQkgS9qeLWf6qq2WdTqW15eAr8WuKC3aVoGpAsBWmXugTskGFsw9y/M++4QOt+roFFiPV/cp1B6bbML009v0ZM9x4ayAagwFlkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366056; c=relaxed/simple;
	bh=M/HSK6e5sgyOAXMpTqiVlKzm0zCpeXwqC76Y2qKShpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=knVE65wnWxD8d0qmWpS716qPqmY9KvS7PhreuWGjLZ0qiVbcssSedFmYguHKD7PaVPPn6bJ9kw/c/b63uO3SRnDnkLrdS4e6633NV5J6gv3FnEFC2CSevvaAwWhDhD5aipLcB7NRuxojYXUthkP5ToD+lffnDrl7JsbCOFUdLKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WrXkg9lS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D253899F;
	Thu, 19 Jun 2025 22:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750366038;
	bh=M/HSK6e5sgyOAXMpTqiVlKzm0zCpeXwqC76Y2qKShpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WrXkg9lSk6B9SK8B0ntSMo3Suqo7ANoLUwaTIOPsgHTuWlmxzcEhzKy70FwOa27jn
	 HTMNO03RHHhSZm+NlvSfVqOUmPH/dwzIzYfhqBIzDyecfY+0whtJv0Wd75xmQRG+l+
	 YVQzfpHZ0os8mna3+wqH+rvMP7ZKB9AC5f7/LaoY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/5] media: v4l2-subdev: Limit the number of active routes to V4L2_FRAME_DESC_ENTRY_MAX
Date: Thu, 19 Jun 2025 23:47:08 +0300
Message-ID: <20250619204712.16099-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers that implement routing need to report a frame descriptor
accordingly, with up to one entry per route. The number of frame
descriptor entries is fixed to V4L2_FRAME_DESC_ENTRY_MAX, currently
equal to 8. Multiple drivers therefore limit the number of routes to
V4L2_FRAME_DESC_ENTRY_MAX, with a note indicating that the limit should
be lifted when frame descriptor entries will be allocated dynamically.

Duplicating the check in multiple drivers isn't ideal. Move it to the
VIDIOC_SUBDEV_S_ROUTING handling code in the v4l2-subdev core.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e99647200e49..013ebb14b37b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -985,6 +985,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_route *routes =
 			(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
 		struct v4l2_subdev_krouting krouting = {};
+		unsigned int num_active_routes = 0;
 		unsigned int i;
 
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
@@ -1019,8 +1020,21 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			if (!(pads[route->source_pad].flags &
 			      MEDIA_PAD_FL_SOURCE))
 				return -EINVAL;
+
+			if (route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE)
+				num_active_routes++;
 		}
 
+		/*
+		 * Drivers that implement routing need to report a frame
+		 * descriptor accordingly, with up to one entry per route. Until
+		 * the frame descriptors entries get allocated dynamically,
+		 * limit the number of active routes to
+		 * V4L2_FRAME_DESC_ENTRY_MAX.
+		 */
+		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+			return -E2BIG;
+
 		/*
 		 * If the driver doesn't support setting routing, just return
 		 * the routing table.
-- 
Regards,

Laurent Pinchart


