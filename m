Return-Path: <linux-media+bounces-31773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299ECAAAE92
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 068B13AD92A
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC683867EF;
	Mon,  5 May 2025 23:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uotgNDcR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F43635C3;
	Mon,  5 May 2025 22:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485485; cv=none; b=G0/glTMmG+Ce82ZbacbPpbegKD5LLIATngdMcE/xiO7k2JWh8T9Rwgg/FnZ22cA9XuV2im1eYl1rveINxYAcH3oKd83hySCZ6DkVeWQHtG4kCjmpgrEr8rfOU1wR/mEiO2pLiEJZt92MOB8AXfrvyMX1eQ88RVUep6iKKzBeoZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485485; c=relaxed/simple;
	bh=s5+lPVUZwpxT2ePVnDlqmcp5VvHY02XF7D6xyAsl+go=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gD+RHkQ8S/BQ9zqfgSVC6+xVdpkf+B84v9rch8Rjrt2DIdeh/h1HAQn9RvXSR8l39Yg5mmQeaFVv9L2BQIENGZfxWmRjsgmWcZVjCRZcgKu87MlF91WMayMojCZvGzOrttweo6+STj1q+z8hOlzEk5qHrjHd6HrUgFHZlWLcklY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uotgNDcR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E569C4CEEE;
	Mon,  5 May 2025 22:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485485;
	bh=s5+lPVUZwpxT2ePVnDlqmcp5VvHY02XF7D6xyAsl+go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uotgNDcRAUhjK3Otvxw2+7H4HXBDGm3jnfFOMFOH5mBwoAK/rslwqjmwbfqUiUlE/
	 NogV/BpIICTSWIrBgtG6maPjSlRB6xAPcazopcCAyWMIGazEgpt3Um/iAd23EU+kDm
	 s/ZoGVw4QWkYNWY51T+NWLLHNq5fIyOMxx7ow9U4CH0aAoKMPFKiFHYiSHth267DHB
	 uArGTETMLafCddicFjQeXdJ49/kX9/nmuvzu4PHQgwwiThVKPlOGIw/CmhWA3EvI1o
	 n3BATbVqjmjTVewXT69qDWBFTwlYgxZL0RK2F9v8YNfbn3kxSMcKOk2RtCSKCjy+wF
	 SvoPalgnVQl/Q==
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
Subject: [PATCH AUTOSEL 6.12 340/486] media: v4l: Memset argument to 0 before calling get_mbus_config pad op
Date: Mon,  5 May 2025 18:36:56 -0400
Message-Id: <20250505223922.2682012-340-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 3a4ba08810d24..1193852bad599 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -439,6 +439,8 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd,
 static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_config *config)
 {
+	memset(config, 0, sizeof(*config));
+
 	return check_pad(sd, pad) ? :
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 8daa0929865cf..43343f1586d13 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -821,7 +821,9 @@ struct v4l2_subdev_state {
  *		     possible configuration from the remote end, likely calling
  *		     this operation as close as possible to stream on time. The
  *		     operation shall fail if the pad index it has been called on
- *		     is not valid or in case of unrecoverable failures.
+ *		     is not valid or in case of unrecoverable failures. The
+ *		     config argument has been memset to 0 just before calling
+ *		     the op.
  *
  * @set_routing: Enable or disable data connection routes described in the
  *		 subdevice routing table. Subdevs that implement this operation
-- 
2.39.5


