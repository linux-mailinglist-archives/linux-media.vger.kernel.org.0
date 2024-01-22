Return-Path: <linux-media+bounces-4019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5067836A10
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 17:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AC7CB2CE46
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 16:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4445B1292C6;
	Mon, 22 Jan 2024 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+DJmKVQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2870128396;
	Mon, 22 Jan 2024 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705936275; cv=none; b=SPMVqcVhfkSyAZ7CX3gBwZQgluNiQ1vjgSr11BrJ3eYnAm65zBPlEQIlzrMRrYMIOqrhrxR6RuzhSmj3sLWRLD6YLBhaoD1DbHQPUPBFqdY/rndGVeZkTop8exFNWBmvfVb/DGSal3qELL+HJeFmgPILMK07zFdlXIl8yPKXmqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705936275; c=relaxed/simple;
	bh=8R9CfscOYZqU/Pq+/7dTeQBP065zYeoRUfBac1WudYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vli9nFe7PD/C8hPRrdP278ALF0mTHRBac4N6m39cz7Sm8NSLccOPhvaCSJsISYsJ2AK/VSJJUpNOU8vbvVZw3W6LP6zq9wKK+FYm8zWhRhFZxGqceGgKYRmGJcaCxTLglExBk2Bz5Y2PeNpqK9/dPPuYCc597SH8MuOTAGw7WNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+DJmKVQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC85C4166B;
	Mon, 22 Jan 2024 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705936275;
	bh=8R9CfscOYZqU/Pq+/7dTeQBP065zYeoRUfBac1WudYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y+DJmKVQ/gWJ1VsLS744lHuk7XyfDrZTIIkdJLyvMgCs0etwkluKegYR3rfNgQqdV
	 8FeWYhcZBH0uzyeIWsxyGWqzWTxyCAJ0O5zWkLEfKeuHYIqMvMEnQfIbg23QNesQrT
	 XZhS1+ctYy5elwRW5xkWS59cMEng7wYepgxy+ZYmva7p0lgRDzTKzdNyM2P2CadJPY
	 DnZ3DYcqzpmdeCGE1X9A3kUEWTl6EzFqX+bFuQdxz1rm/xjEROgDbUgHS1nqJDQOV3
	 k7IW/DiaKRADMXNkgrmcof32+tgYDDMko82atFXcMbJjAx8LMXMEGlivA/Fwtd9lXC
	 ijRch2lWtqDqA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 34/53] media: i2c: imx335: Fix hblank min/max values
Date: Mon, 22 Jan 2024 10:08:35 -0500
Message-ID: <20240122150949.994249-34-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150949.994249-1-sashal@kernel.org>
References: <20240122150949.994249-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.74
Content-Transfer-Encoding: 8bit

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

[ Upstream commit d7b95ad7a8d56248dfc34f861e445fad7a4004f4 ]

The V4L2_CID_HBLANK control is marked as readonly and can only be a
single value.

Set the minimum and maximum value to match the mode value.

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/imx335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 078ede2b7a00..8e91767d6130 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -971,8 +971,8 @@ static int imx335_init_controls(struct imx335 *imx335)
 	imx335->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
 						&imx335_ctrl_ops,
 						V4L2_CID_HBLANK,
-						IMX335_REG_MIN,
-						IMX335_REG_MAX,
+						mode->hblank,
+						mode->hblank,
 						1, mode->hblank);
 	if (imx335->hblank_ctrl)
 		imx335->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-- 
2.43.0


