Return-Path: <linux-media+bounces-33812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6167ACA550
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEB8D3A32BE
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073F2269AE0;
	Sun,  1 Jun 2025 23:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUbJ+SvR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3282580DD;
	Sun,  1 Jun 2025 23:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820999; cv=none; b=mJIEkwUXTv7k7E0MLIFu/eZ5LOJRAQmVwMDVzfWHRoGK7HMCkIl+oxPpRNEu8eSrp19EPll9QeeHs7hLAV8azaRgEM6w2/rcXoRu+0I8HFMV9xFq3tm0c7sYD9D4nWLP+1l3CliFWPLjBnCrrAuIWjpVtcsA0A5T71c79N7A6SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820999; c=relaxed/simple;
	bh=eVjtfyqcxKBkojl8G8DZey7/ZyDTqmiTETZWz4b5508=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKVghhCCQ4L7a8tiTJgzefCfT1Mmq9/qlHNwjFtyKJE1sYHqc+ZRDdW4+C4C3nTZaCyz+MSnVb/a95cGTZlD67t3/Dab3BuCfxCmAXN5MivR0RHBY2QPWff9Jdqj8+lTLHXqL/9DYOVvjOI/dzrfxjid6y8WGwmHwRsm7YA67eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUbJ+SvR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5724C4CEEE;
	Sun,  1 Jun 2025 23:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820998;
	bh=eVjtfyqcxKBkojl8G8DZey7/ZyDTqmiTETZWz4b5508=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cUbJ+SvRlU9qD9Bjk0+JwSKBBZmc95rCFJInZOIPYcBnUmaA9FBIPaMkP2skwC9IZ
	 E1UGFW0KZu9oLP1qFA1utebQuUMUvYF1zeVlt0RjF8P/G4H7UA/mrqAmnYV/GQ1GhX
	 VfeF17cE4hva45Vghfcpd8nHgsrP8X3PnN2R5v6VYArVudfpuzFngxH7OGpE14Sdri
	 Lbb7o4dwHHYH2dsa+pwhQ56dzL/7eusBK6oa3Ts3uLQeH82jkS7WphAI4ubebRxsqm
	 X29/Xio1tcSmxVRK0xySszs74ijK8ZX/qYVTXJou32bb5luR5RQCGH8mNYFMbl7aRG
	 9ZlkJgpTL/OpQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 59/93] media: tc358743: ignore video while HPD is low
Date: Sun,  1 Jun 2025 19:33:26 -0400
Message-Id: <20250601233402.3512823-59-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233402.3512823-1-sashal@kernel.org>
References: <20250601233402.3512823-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

[ Upstream commit 6829c5b5d26b1be31880d74ec24cb32d2d75f1ae ]

If the HPD is low (happens if there is no EDID or the
EDID is being updated), then return -ENOLINK in
tc358743_get_detected_timings() instead of detecting video.

This avoids userspace thinking that it can start streaming when
the HPD is low.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Tested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/linux-media/20240628-stoic-bettong-of-fortitude-e25611@houat/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Analysis of Code Changes The commit adds a
simple but important HPD (Hot Plug Detect) check to the
`tc358743_get_detected_timings()` function: ```c /bin /bin.usr-is-merged
/boot /dev /etc /home /init /lib /lib.usr-is-merged /lib64 /lost+found
/media /mnt /opt /proc /root /run /sbin /sbin.usr-is-merged /snap /srv
/sys /tmp /usr /var if HPD is low, ignore any video */ if (!(i2c_rd8(sd,
HPD_CTL) & MASK_HPD_OUT0)) return -ENOLINK; ``` This 4-line addition is
strategically placed **before** any video detection logic, creating an
early exit when HPD is low. ## Why This Qualifies for Backporting ### 1.
**Fixes Real User-Facing Bug** The commit addresses a genuine functional
issue where the driver would incorrectly report video timings when no
valid HDMI source was connected. This leads to: - Userspace applications
attempting to stream when HPD is low - Resource waste and potential
system instability - Poor user experience during cable
connect/disconnect cycles ### 2. **Minimal and Contained Fix** - **Small
scope**: Only 4 lines of code added - **Single function**: Only affects
`tc358743_get_detected_timings()` - **Standard error handling**: Uses
existing `-ENOLINK` return code - **No architectural changes**: Follows
established driver patterns ### 3. **Low Regression Risk** - **Early
return pattern**: Adds validation before existing logic - **Established
error code**: `-ENOLINK` is already used elsewhere in the function -
**No side effects**: Doesn't modify hardware state or driver data
structures - **Conservative approach**: Only prevents false positives,
doesn't change valid detection ### 4. **Quality Indicators** - **Expert
authorship**: Hans Verkuil is a well-known V4L2 maintainer - **Proper
testing**: Tested by Maxime Ripard, a significant kernel contributor -
**Standard pattern**: Similar HPD checks exist in related HDMI bridge
drivers - **Clear commit message**: Explains both the problem and
solution ### 5. **Production Impact** - **Critical hardware**: tc358743
is used in production embedded systems (Raspberry Pi, industrial vision)
- **Core functionality**: HDMI input capture is essential for these
systems - **Embedded stability**: Stable kernels are crucial for
embedded deployments ## Comparison to Reference Commits This commit
aligns well with **Similar Commit #1** (backport status: YES), which
also: - Fixed HPD-related detection logic - Made a small, contained
change - Addressed user-facing functionality issues - Had minimal
regression risk ## Technical Correctness The HPD check is technically
sound: - **Hardware reality**: HPD low means no valid HDMI source is
connected - **Logical placement**: Check occurs before expensive video
detection - **Proper signaling**: `-ENOLINK` correctly indicates no link
is available - **Resource efficiency**: Prevents unnecessary processing
when no valid signal exists ## Stable Tree Criteria Met ✅ **Important
bugfix**: Fixes streaming issues affecting end users ✅ **Small and
contained**: 4-line addition with clear scope ✅ **Minimal risk**: Early
return with existing error handling ✅ **No new features**: Pure bugfix
without functional additions ✅ **Production relevance**: Affects systems
in active deployment The commit represents exactly the type of targeted,
low-risk fix that stable trees are designed to include - addressing real
user issues without introducing architectural changes or significant
regression risk.

 drivers/media/i2c/tc358743.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 344a670e732fa..9b60ad3ce2590 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -309,6 +309,10 @@ static int tc358743_get_detected_timings(struct v4l2_subdev *sd,
 
 	memset(timings, 0, sizeof(struct v4l2_dv_timings));
 
+	/* if HPD is low, ignore any video */
+	if (!(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0))
+		return -ENOLINK;
+
 	if (no_signal(sd)) {
 		v4l2_dbg(1, debug, sd, "%s: no valid signal\n", __func__);
 		return -ENOLINK;
-- 
2.39.5


