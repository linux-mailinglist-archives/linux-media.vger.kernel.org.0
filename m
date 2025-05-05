Return-Path: <linux-media+bounces-31798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22792AAB351
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B5DE3A9208
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B69222B8BC;
	Tue,  6 May 2025 00:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipddfWug"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454A6278E77;
	Mon,  5 May 2025 23:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486217; cv=none; b=jrSzmyPiorfOcQVeNOrAPi1NvkZiCxSkJlyQcgemVaQqlyXdAXKWiqEdSnl4cEuLoTv5UljECf3e3VpKsEBQCz68pJc3f3GsTJkfJnVV9rhFOr1rmfMTKE2xx/eUvRZvedcJvp9OZ82MEov0ZjFJIb5pTYxRYdXDZH47KkAIjr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486217; c=relaxed/simple;
	bh=Gb9CeThR09Tlm0/cWWncxgQvJ9atjzF0K61i9uk2xq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s3NiVS9KXZpd5EKKGcEJFgb9PHzLl7jiEfI9xedaeJj4dcPOSA42iUHg94urpVZUNwSVlZex4juL9R2vcmWUCMWFcB+kdrp4bT3BQ6Cn8I9E/BonWhkeK1gB9Jpeef3kuoqW5EFUSccTNiguNC5QdvlL32cjZXYKX9IWhqrA6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipddfWug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FBBC4CEE4;
	Mon,  5 May 2025 23:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486216;
	bh=Gb9CeThR09Tlm0/cWWncxgQvJ9atjzF0K61i9uk2xq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ipddfWugkHNToNQgUEbF7jLGLHtDl7n51/JDHAY82zQOpV6a4tEEpekZsTLHb29U1
	 /jV0qpvY2J3QaeyLgdYoFbd65q5WHxOP8ya1HudwQ02uMw0koyGY7FTMIsQ9lPKUox
	 nh9i5G2Ht/dD/+Ci4octIEOmnAPRvDYnPX1z0BhPYh07JChiyxmrjqWGQgevFW0RLS
	 fDCyf9DY2xivk7Ut8Qm3Asp5cfzq+jDKocFeCOyBnawVKMxFk4TYLdiR0SHcntZdFG
	 VY0P4127jWsIW4Y94cejVMGId4MaMkb2s6KzQ3x3XVy6xEn0xGNYcBpmIfAZ/6wcxj
	 g5RZ0tI1kmQGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	umang.jain@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	tomm.merciai@gmail.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 212/294] media: v4l: Memset argument to 0 before calling get_mbus_config pad op
Date: Mon,  5 May 2025 18:55:12 -0400
Message-Id: <20250505225634.2688578-212-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Sakari Ailus <sakari.ailus@linux.intel.com>

[ Upstream commit 91d6a99acfa5ce9f95ede775074b80f7193bd717 ]

Memset the config argument to get_mbus_config V4L2 sub-device pad
operation to zero before calling the operation. This ensures the callers
don't need to bother with it nor the implementations need to set all
fields that may not be relevant to them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
 include/media/v4l2-subdev.h           | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 5f115438d0722..cb3ad72a3e54a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -351,6 +351,8 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd,
 static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_config *config)
 {
+	memset(config, 0, sizeof(*config));
+
 	return check_pad(sd, pad) ? :
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b4fcd0164048e..0740dfc6c0488 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -822,7 +822,9 @@ struct v4l2_subdev_state {
  *		     possible configuration from the remote end, likely calling
  *		     this operation as close as possible to stream on time. The
  *		     operation shall fail if the pad index it has been called on
- *		     is not valid or in case of unrecoverable failures.
+ *		     is not valid or in case of unrecoverable failures. The
+ *		     config argument has been memset to 0 just before calling
+ *		     the op.
  *
  * @set_routing: enable or disable data connection routes described in the
  *		 subdevice routing table.
-- 
2.39.5


