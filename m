Return-Path: <linux-media+bounces-31786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF791AAAD19
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0EE53A506B
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A548D3002AE;
	Mon,  5 May 2025 23:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+MTLqcG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B32E6866;
	Mon,  5 May 2025 23:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487030; cv=none; b=KJfgIOjk6Ymhy4p2p7Jdrokell9Ps0m33emUiB1DwSZJuBW4mn1I7ZZEE1v5M/pVPhBqpp7k+Fu5Oa5teNQ/roSPrioUZwPPb/fZr/Aa3WLxb9oDAi9CcIj5KLYRqNBIhXY+h8uMY8XtHE+po3lPwi3QPYIod1u9fx7KnQBX96s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487030; c=relaxed/simple;
	bh=mtJZe148ds/7SXixYCWlYPriawhd+rrZbac0kHfAhtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uaSEokcMLTnl09KmVruEDEB7jfEDyi7onC2tyscoujBrB5C6Iv910XQ+XbEvAGhI6oXnrW150N6zEkoNTf7Yf0nIP+JWg041ISacRJppJ+HaampLR6IB06KKd9s52gJVbVsUaGgXpxu/5fLuonrr9MjZyl2QXwlGI1VRWXXieyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+MTLqcG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FF6C4CEE4;
	Mon,  5 May 2025 23:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487029;
	bh=mtJZe148ds/7SXixYCWlYPriawhd+rrZbac0kHfAhtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a+MTLqcGW5gZJqsNf8qPl+LEWJSymfu7QHCLyu+gwKGsZAkWjc6XyIpHLdi6j2JDf
	 Nj/thGG17hHmKCBKrOF7RdQRfgVxpVsrTdbcNF2xL4lyXeXwQXvlRNV5VLP+H9abq+
	 tSqRyScsl/oJE5aTcHRPPYAsanFaAQmt6gbRbjCUW0vKXco5JFpNxz2awmCbGo6ykr
	 0eDgCShdYQ6yu05NMf6DM0h7mZ6V5Fw/2uWiRaQVmAcP38hS5SJ+g3FpBwhWrT3wkY
	 3+lEXAkOGbOUH6knkgxHb393P9TMFTVmxCfmy/QdM3mjoalNNg1zBTZSwLsBmEglVR
	 B0EQ5hY2d1qhQ==
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
Subject: [PATCH AUTOSEL 5.15 117/153] media: v4l: Memset argument to 0 before calling get_mbus_config pad op
Date: Mon,  5 May 2025 19:12:44 -0400
Message-Id: <20250505231320.2695319-117-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index 5d27a27cc2f24..6f2267625c7ea 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -314,6 +314,8 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd,
 static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_config *config)
 {
+	memset(config, 0, sizeof(*config));
+
 	return check_pad(sd, pad) ? :
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 9a476f902c425..262b5e5cebc4c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -714,7 +714,9 @@ struct v4l2_subdev_state {
  *		     possible configuration from the remote end, likely calling
  *		     this operation as close as possible to stream on time. The
  *		     operation shall fail if the pad index it has been called on
- *		     is not valid or in case of unrecoverable failures.
+ *		     is not valid or in case of unrecoverable failures. The
+ *		     config argument has been memset to 0 just before calling
+ *		     the op.
  *
  * @set_mbus_config: set the media bus configuration of a remote sub-device.
  *		     This operations is intended to allow, in combination with
-- 
2.39.5


