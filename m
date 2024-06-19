Return-Path: <linux-media+bounces-13645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54C90E141
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 03:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 584731C21023
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 01:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7176FC7;
	Wed, 19 Jun 2024 01:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g7btRBOP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAD6AB6;
	Wed, 19 Jun 2024 01:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760267; cv=none; b=OHN4WQnB59Cd/rUnS29mxcyg6Xt5Iu3q22Lv5J60i/yrN4UY/TH16g0THyKZulcfLzxlMvQzxNd/Uh7/TcKLRZYwWx6hNXnUfYGplbtOJnJUaUu0muzvNTr76e36/bfXe7PYmyw0g3cRPwLUdM/cINNkSv1ekiRSItS0TyEQHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760267; c=relaxed/simple;
	bh=JM3em1hFUj4zI1/nP0bY2hrcwLa2X9MF1PvvcpPLXcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4tAoBnli51jRe0rBqWK/RoROyyZr9EUdKfYbNs6d5ml04OyuePs3z0JFc3II6jerNxxV0cbYZZUlb6kgmrDIJPiPmP1BpHJqEjFlIvSr7NMfemKfs3xNuFrXxhuOjFAqc6e3OF5m5+qUMFZkE8sbU2ITEZQFwGarkcwZjbXLvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g7btRBOP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28FFA11CF;
	Wed, 19 Jun 2024 03:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718760245;
	bh=JM3em1hFUj4zI1/nP0bY2hrcwLa2X9MF1PvvcpPLXcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g7btRBOP7Qo7KDi5kNpeXqCceRk2C0MaN5onY5kWVkWf2P3I4Bi7wt46XPIkpLJgY
	 O4Blty4LGdogdUMc8Co1Lh1/8YbrC5cqBQakvkr9JmKLcLMdD57i6L08cgIZeKgBo0
	 P11I7xMEK75zMBC0vB9sgD4XQjxWyQHjRAGBf22M=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/8] media: sun4i_csi: Don't use v4l2_subdev_link_validate() for video device
Date: Wed, 19 Jun 2024 04:23:51 +0300
Message-ID: <20240619012356.22685-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate() function is a helper designed to
validate links whose sink is a subdev. When called on a link whose sink
is a video device, it only prints a warning and returns. Its usage in
the sun4i_csi driver is wrong, leaving the link from the sub4i_csi
subdev to the capture video device unvalidated.

Planned improvements to the v4l2_subdev_link_validate() function will
turn the warning into an error, breaking the sun4i_csi driver. As an
interim measure, move the warning to the sun4i_csi driver in a custom
validation handler, and drop the call to the helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index dbb26c7b2f8d..d07e980aba61 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -35,8 +35,15 @@ struct sun4i_csi_traits {
 	bool has_isp;
 };
 
+static int sun4i_csi_video_link_validate(struct media_link *link)
+{
+	dev_warn_once(link->graph_obj.mdev->dev,
+		      "Driver bug: link validation not implemented\n");
+	return 0;
+}
+
 static const struct media_entity_operations sun4i_csi_video_entity_ops = {
-	.link_validate = v4l2_subdev_link_validate,
+	.link_validate = sun4i_csi_video_link_validate,
 };
 
 static const struct media_entity_operations sun4i_csi_subdev_entity_ops = {
-- 
Regards,

Laurent Pinchart


