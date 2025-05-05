Return-Path: <linux-media+bounces-31806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23AAAB5DD
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 07:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3EAA3B2FB1
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 05:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC5E34B1EA;
	Tue,  6 May 2025 00:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOU9EKSB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40BA2F924A;
	Mon,  5 May 2025 23:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487266; cv=none; b=dCkrC6XIWpkrwJ0TsRL3nIAEUIlZjITeggYr3PZ09ddY6rl5Tr8km0XyPWCixoIYKBvrttsk0oTOilBS9rxTt3ycXxt85bPoYl6h5jJJ/dRkQC66CMOMjpsxvRJ9LQxjjP6nB7p3InTJjwmlk4UwKx60dQtPYIGLwlyvbMdlIXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487266; c=relaxed/simple;
	bh=ZEX27ppZRdcYi8EQSB2vV+HfefZ8MVVX4Xf7WMb1rTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dakzjB2oijfDJ04NLnx8f+3bCnoTEHi+6Bn/qfhsFlDEUR+GQ0e2q3KRqhP6jDqilSXgs83qsXcv6nI8BBdntQ2PrZQgfYkSievxWs4vD3Razaxk/BccFfffSYwQ5jio7bEQqJTk9GCCZZFi7Y3AE/ImCxn+htXVYgf+w7Bg9yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOU9EKSB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBC5C4CEED;
	Mon,  5 May 2025 23:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487265;
	bh=ZEX27ppZRdcYi8EQSB2vV+HfefZ8MVVX4Xf7WMb1rTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sOU9EKSBDo60JQNgXD8T/CLTAX8GDpsArVKj+jy5FMCXPj76EUmOEA0SFU7L4sdEt
	 doKLwikP8lJRK2/BDZ7RwuEjcUPt5+2PnOLNKSit1oXggCPZIdz7RH+iSGI3bQtIXd
	 w/o9lhDNUuazG7wTt8yOsnF70STixqSEEqp4VDSxdahZ3SUy8XF5jY33C+CIl1q9OQ
	 9iYvNF7p+h3gdowB+7uBr8nhEHCvUFKjdZCRes6VaEOxjgxHPN+9clspA3UPcNcU6F
	 NoYQ0aod5aNz6n4W8IXZhMm78ni0K6e7EQ59tw22gbd4qrz5QKw5Z7GZEW+hbw0AYW
	 QL4tdAB9Kqm8Q==
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
Subject: [PATCH AUTOSEL 5.10 089/114] media: v4l: Memset argument to 0 before calling get_mbus_config pad op
Date: Mon,  5 May 2025 19:17:52 -0400
Message-Id: <20250505231817.2697367-89-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
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
index fbf0dcb313c82..67d3e6511a146 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -312,6 +312,8 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd,
 static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_config *config)
 {
+	memset(config, 0, sizeof(*config));
+
 	return check_pad(sd, pad) ? :
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 73150520c02d4..ffc6d122f91e5 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -676,7 +676,9 @@ struct v4l2_subdev_pad_config {
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


