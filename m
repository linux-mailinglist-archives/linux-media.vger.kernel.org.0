Return-Path: <linux-media+bounces-35438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D089EAE0EBB
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6F313BF20B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A99238C2F;
	Thu, 19 Jun 2025 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aarqepzp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B1325B1EF
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366064; cv=none; b=iOm6E5+mDK0ZeF5W89+fyrqnpUJa9o2pSKYCbROVZr4cH0XtHNSl7j07Ym7IeZXgutblff+xB3MMMTDK2toL+idP/C5N9AzbHN5yy4rIoQpBiANo2l7hZgUAD9cHhj6Yc6eM9MNv4/tMwdP8O8YQ8j7Par0gZtG56Un6GnC7yNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366064; c=relaxed/simple;
	bh=moXH5oI/w/PW86RbYAYNP40jaDQeWRUfYo58RtavNCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5xHCC0fUoWyvoi6m6VVLjkPG8QY9E4rDgGnOnOPemPvM4ZdOTWIYgODO+GXCpJXNcQHXULLWj0+sWjiHJglGh245bzcu/HwLHhW0TeD3Bed7F5G3yb7yIT9w2M3W4DMLOSo7BVEu8nBsD8YfWKGBpHCpp4cYAmB292KbG1Dxaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aarqepzp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99FB32EC;
	Thu, 19 Jun 2025 22:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750366043;
	bh=moXH5oI/w/PW86RbYAYNP40jaDQeWRUfYo58RtavNCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aarqepzphm281lngObuburf3zyo4vKqv9ROEZpBzTWZQSKKta3H36iaFV33tPu05x
	 zh+TZZsCnlklGqZSA8wqSHvobuUf+65uM/QWAHI0dZZ0tNReG/sNkg+ghodo6u3Lz7
	 f6Qo3hNaJV2fB4zM96mWbphhA3GQyZ8UvdMu5g/s=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] media: i2c: max96714: Drop check on number of active routes
Date: Thu, 19 Jun 2025 23:47:12 +0300
Message-ID: <20250619204712.16099-6-laurent.pinchart@ideasonboard.com>
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

The subdev core now limits the number of active routes to
V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the max96714
driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/max96714.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index 159753b13777..5d14cefe0eae 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -370,13 +370,6 @@ static int _max96714_set_routing(struct v4l2_subdev *sd,
 	};
 	int ret;
 
-	/*
-	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
-	 * frame desc is made dynamically allocated.
-	 */
-	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
-		return -EINVAL;
-
 	ret = v4l2_subdev_routing_validate(sd, routing,
 					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
 	if (ret)
-- 
Regards,

Laurent Pinchart


