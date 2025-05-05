Return-Path: <linux-media+bounces-31758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A764EAAA5E8
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 694527A0622
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC63316634;
	Mon,  5 May 2025 22:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3NndAz/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90215318E39;
	Mon,  5 May 2025 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484276; cv=none; b=qSIsUKdlaxEtSNBLM7UU8G9wbysguPon7/9ofx0x/GzOONszUaWNmK5MWkyPgEcJmFnwF0PyU/jbdHbGMQQGf5s8RvTNl4hI0BmYh9BoY4o9yp1Uro5si1FloalkoGw6jligfnE0dL9YRgYTMIg4/Zjzi15Zv+RJVlT9ldPK7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484276; c=relaxed/simple;
	bh=D/IAG6bdcGYnJ7ACkHib5x/V+X8XCCk2XhDtgcK0fOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a0ES3/qOt+ZtJTiDJE/7fynpRpDoIqW3Z6qYDUP8tOcPJmAYJGqzrF1qgWa9HbNRLxX5XyAFRRMBdxfCPpEjCTddM8A+GTGRK6kMUj9x4gEagG/SsHt0HS18MJqp1XRmRbb/+pAJ0asg1AcFTM9x6vc95Zzj/4Af9RW5AFUjr2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3NndAz/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3245AC4CEE4;
	Mon,  5 May 2025 22:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484276;
	bh=D/IAG6bdcGYnJ7ACkHib5x/V+X8XCCk2XhDtgcK0fOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E3NndAz/9LbOA/lP35DapI5MQHBv60y3TkUF6tnZoynQBPY5BpLlXs8NviAC6Wm89
	 jxoZHTBZfcgbCd0vIAvwoSqvEV3u2zrwwvtdnglm2e9Kp6o1f4FqaP1FTCczv7hIIN
	 50yMPuZDJvkAYG6GdMc9PiGIzcUYKXOBOoMbiHA9esK8nWUBmvqR59yJi8cnz48iWS
	 vB9nV2N/91hWRo+/YkB7lQJYzXotyX2d41+jAa+/97cl9bpOrWumWmQTcONN8lCHVB
	 rX+WNnEu0ddwuBVwCySc+BIWIgj9ANHplLbavNXIaqnRm2ODnIS7DUZ1gRK8eYLo/k
	 kQvAwADgPMslg==
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
	tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 429/642] media: v4l: Memset argument to 0 before calling get_mbus_config pad op
Date: Mon,  5 May 2025 18:10:45 -0400
Message-Id: <20250505221419.2672473-429-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
index cde1774c9098d..a3074f469b150 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -444,6 +444,8 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd,
 static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 				struct v4l2_mbus_config *config)
 {
+	memset(config, 0, sizeof(*config));
+
 	return check_pad(sd, pad) ? :
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2f2200875b038..57f2bcb4eb16c 100644
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
  * @set_routing: Enable or disable data connection routes described in the
  *		 subdevice routing table. Subdevs that implement this operation
-- 
2.39.5


