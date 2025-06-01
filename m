Return-Path: <linux-media+bounces-33764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE07BACA1A9
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32AB41892DE9
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 23:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C553E259CA3;
	Sun,  1 Jun 2025 23:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMiz7VGK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2554225E836;
	Sun,  1 Jun 2025 23:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820336; cv=none; b=r1JpZV2uegRjBlQOJtZJS48b1MhcMSObiPZSoWjAb3pwUSnQEE4ZOyguPs28zMESX8jGvFVB5u+lwnDWR8KDL0dW4uA0NEiRePGAQ6Ey9Z/EtEedyeG1twckbwv+LLWeNbEHfzX2ClmNz1p07xYBwghR8RM0bykGs9JJsaAUWek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820336; c=relaxed/simple;
	bh=DIIbz0lEb7dnY47PJIaYKLyq8zk6dH2bQFA62F8ojNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ULfprdcW+UpjSDIN7NYMcJ/YEmpJXJTuNewlanT6CBH1AzbAdUfO5k3DrL6L97NZlt7BuOqQGJjSMhHL96OrscFmljVP8nZovJSJdrkkkf8RZp/F650xReDSNIRdpsL1qYhDg9Qm5sik9z11lAHXYGXDE+pkilGXYQaoj3vnzOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMiz7VGK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7E5C4CEF3;
	Sun,  1 Jun 2025 23:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820336;
	bh=DIIbz0lEb7dnY47PJIaYKLyq8zk6dH2bQFA62F8ojNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rMiz7VGKjBrTT6kvw8YwmTZfkVvoJz2kbI9sf7pLGuMbsI7IIadYCXeueg5lZZoAH
	 JdSyFlteMMPVVTouK4Z1yk406op1yyosk2K1ZR+ldR6lHN/UpGmPW5mNS6CX3x1STK
	 Jc+AfJ9341aNezrgk9xPOdGOxOa6BrLkVfh8vxVWxoO/tAmkIOxD7T9eeBMVsUGm6D
	 Vt4DfkatGSnwKtgKtbbvwvv9xuw7Wfo75Q+1mZs85YrKZ6uPUMGgIAlTCqiUa3QQpj
	 /pxumKnDbWMy9cW+xCjv5a5s8uBFfIK6j5JPDqWAS4cS/CERGMn7cKGiIjhoBFzD4i
	 +8f7iGwf/HtoQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Michael Chang <zhang971090220@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 022/110] media: nuvoton: npcm-video: Fix stuck due to no video signal error
Date: Sun,  1 Jun 2025 19:23:04 -0400
Message-Id: <20250601232435.3507697-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit

From: Michael Chang <zhang971090220@gmail.com>

[ Upstream commit 497f1fb94759fa0c638f15c12b1ab3e586bccfcb ]

Fix the issue when start_frame and detect_resolution
functions are executed at the same time, which may cause driver
stops capturing due to status of no video signal error.

Signed-off-by: Michael Chang <zhang971090220@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Now let me analyze this commit based on the provided information:
**YES** This commit should be backported to stable kernel trees based on
the following analysis: 1. **Bug Fix Nature**: The commit specifically
addresses a driver stuck issue caused by a race condition between the
`start_frame` and `detect_resolution` functions. This is a clear bugfix
that affects the operational functionality of the driver. 2. **User
Impact**: When this race condition occurs, the driver stops capturing
completely due to a "no video signal error" - this directly impacts
users who rely on the video capture functionality. 3. **Minimal and
Contained Changes**: The fix makes only a small, targeted change to the
`npcm_video_detect_resolution()` function in
`drivers/media/platform/nuvoton/npcm-video.c`. Specifically: - Removes
the premature setting of `video->v4l2_input_status =
V4L2_IN_ST_NO_SIGNAL` at the beginning - Only sets this status flag when
the resolution is actually invalid (width/height are 0) - Adds proper
debugging messages for both valid and invalid resolution cases 4. **Low
Risk**: The change is logical and safe - instead of immediately assuming
"no signal" and then potentially overriding it later, the code now only
sets the "no signal" status when there's actually an invalid resolution
detected. This eliminates the race condition without introducing new
complexity. 5. **Similar Pattern to Backported Commits**: Looking at the
reference commits, this follows the same pattern as "Similar Commit #1"
(marked YES) which also fixed reference handling issues in the same
driver. Both commits: - Fix driver-specific bugs - Make small, contained
changes - Address operational issues that affect users - Don't introduce
new features or architectural changes 6. **Race Condition Fix**: Race
condition fixes are typically good candidates for stable backporting as
they address timing-dependent bugs that can be difficult to diagnose and
significantly impact system reliability. The fix addresses a specific
functional bug where the driver could get stuck due to improper status
flag handling during concurrent operations, making it an appropriate
candidate for stable tree inclusion.

 drivers/media/platform/nuvoton/npcm-video.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 7a9d8928ae401..3022fdcf66ec7 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -863,7 +863,6 @@ static void npcm_video_detect_resolution(struct npcm_video *video)
 	struct regmap *gfxi = video->gfx_regmap;
 	unsigned int dispst;
 
-	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	det->width = npcm_video_hres(video);
 	det->height = npcm_video_vres(video);
 
@@ -892,12 +891,16 @@ static void npcm_video_detect_resolution(struct npcm_video *video)
 		clear_bit(VIDEO_RES_CHANGING, &video->flags);
 	}
 
-	if (det->width && det->height)
+	if (det->width && det->height) {
 		video->v4l2_input_status = 0;
-
-	dev_dbg(video->dev, "Got resolution[%dx%d] -> [%dx%d], status %d\n",
-		act->width, act->height, det->width, det->height,
-		video->v4l2_input_status);
+		dev_dbg(video->dev, "Got resolution[%dx%d] -> [%dx%d], status %d\n",
+			act->width, act->height, det->width, det->height,
+			video->v4l2_input_status);
+	} else {
+		video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
+		dev_err(video->dev, "Got invalid resolution[%dx%d]\n", det->width,
+			det->height);
+	}
 }
 
 static int npcm_video_set_resolution(struct npcm_video *video,
-- 
2.39.5


