Return-Path: <linux-media+bounces-8315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D48947CF
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 01:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8F9BB219F4
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 23:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF3656B9C;
	Mon,  1 Apr 2024 23:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GTfmoztm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573A53E01
	for <linux-media@vger.kernel.org>; Mon,  1 Apr 2024 23:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712014659; cv=none; b=KW9JtqwKM9Xq4EV03jC8L9DhD7qD9SBnEhL5Pg5hF16QDwvBPg3gI46csftncoZQbtpkUBbHBBABsGsKokydtM7ZVtjBEWRCabyBazDONx64Jtqx0OO87VJte3iFz2XFy1uA5odiiwYuUgDViYFMHzrBdJd/x9jIvorxtT0js5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712014659; c=relaxed/simple;
	bh=LMcGspfp0Rb3w9un0KZ5D5MbIwQT+J3NNNFK7t3PQzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lpLzRRMnXJIrEIVpul2CSOYedmpbhl41bLro0Dfm6bSPyszdyga+3xPBnczFz1r8becU1UShHqC53BaIvt2TjJIK+f6/yrKgn/CYcFR6TZWTX6JN1R+/34NaVYyrCZ5vWoJdB3Uf+whcL1cYgrHDLWaoOHH5qMDQEVQyauI4Ojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GTfmoztm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 607C575A;
	Tue,  2 Apr 2024 01:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712014619;
	bh=LMcGspfp0Rb3w9un0KZ5D5MbIwQT+J3NNNFK7t3PQzc=;
	h=From:To:Cc:Subject:Date:From;
	b=GTfmoztmfTS3AIHpCrFkwNMQlEfVJSb7FWjJImn/W9jsI1EN+6m4z/rpQW/jjhZTD
	 0KQAPcxjgNhC8/wH/sH9B9tSCx9GlD6UIJ4h5Wkv8oEa7kXWRzu0vHS+mHv0SJ7Itf
	 +o/e82WHBBsmxBhjEGKAFRmROj/N9likqlf3H77Y=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2-subdev: Fix stream handling for crop API
Date: Tue,  2 Apr 2024 02:37:25 +0300
Message-ID: <20240401233725.2401-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When support for streams was added to the V4L2 subdev API, the
v4l2_subdev_crop structure was extended with a stream field, but the
field was not handled in the core code that translates the
VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. Fix it.

Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4c6198c48dd6..45836f0a2b0a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -732,6 +732,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
 		sel.pad = crop->pad;
+		sel.stream = crop->stream;
 		sel.target = V4L2_SEL_TGT_CROP;
 
 		rval = v4l2_subdev_call(
@@ -756,6 +757,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		memset(&sel, 0, sizeof(sel));
 		sel.which = crop->which;
 		sel.pad = crop->pad;
+		sel.stream = crop->stream;
 		sel.target = V4L2_SEL_TGT_CROP;
 		sel.r = crop->rect;
 

base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
-- 
Regards,

Laurent Pinchart


