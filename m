Return-Path: <linux-media+bounces-35437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA3AAE0EBA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33B051C2009A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7403A25DB07;
	Thu, 19 Jun 2025 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sJKjbqKQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6631A238C2F
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366063; cv=none; b=r7Kwk8oqI0C1yp58dXbA0KIfWvxJyxzwYxfNc/vn6YTlWAKQTOENW4cTX5YjsLZn2tRClksTxtx99dJbe/7p1G9sm5rGdWm8v5mO3abbeeoqbguzMmPQhDGfYoqKPjesMK5IxF7bTScaNBnWheZjS0aRPrHXLMVwOElmf6NR1Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366063; c=relaxed/simple;
	bh=BtLvO58bfowumf1haLS//ctAI824pZgwfBzYEBHL0N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfyZ45z88/L8iQoTnkYb8gqW49gndLH9VtBgi1+9y097R+t09UULSPtdzcIV0wVFlzarphmbZg4CSQQLmUItrMJJekaUJgHFsGzyQza24dtpVB26fjyY350oPY7ZFlIfO3McV7xzN9h667cuUQm/72wIN8j/ojLKF5pfEU8UxKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sJKjbqKQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 346FD16EB;
	Thu, 19 Jun 2025 22:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750366042;
	bh=BtLvO58bfowumf1haLS//ctAI824pZgwfBzYEBHL0N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sJKjbqKQTZha7ZbP/siY8GLswNYVFYbcHmT9IjjMOdXPQ2+xq6Mm7a8AQyPbJQdvs
	 MWBwu1OqVnunvbSIg/8QB5JlTLSrvkPkcHs8EK/Ko8TsOwzNoSgvAXerEInsT+FudC
	 0rMdSFlYkXa1p69asQuhN1Xe+mlN90dp7ImGn7D8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/5] media: i2c: ds90ub960: Drop check on number of active routes
Date: Thu, 19 Jun 2025 23:47:11 +0300
Message-ID: <20250619204712.16099-5-laurent.pinchart@ideasonboard.com>
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
V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the ds90ub960
driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5dde8452739b..967e580890ea 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2773,14 +2773,6 @@ static int _ub960_set_routing(struct v4l2_subdev *sd,
 	};
 	int ret;
 
-	/*
-	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
-	 * frame desc is made dynamically allocated.
-	 */
-
-	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
-		return -E2BIG;
-
 	ret = v4l2_subdev_routing_validate(sd, routing,
 					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
 					   V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX);
-- 
Regards,

Laurent Pinchart


