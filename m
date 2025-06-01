Return-Path: <linux-media+bounces-33831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D7BACA629
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4F251884FC3
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E45299B4B;
	Sun,  1 Jun 2025 23:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klkgVwaL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159BF299B2D;
	Sun,  1 Jun 2025 23:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821170; cv=none; b=n9UD3ea7qKTJmhcsaebBdYFLf/WpRP7HlEULcz+6icyHrlbEMO9FijMHxNmUXGKoo0e48O3VlQGiwJk6u4f8rGMu3NuZOWNKGvlWgGUYQugHj0FsOAf0BxekUvzCEunanLM2yYS6i2C9WHY8fE5ChaV5WDFGEl87HH1HwXAcypA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821170; c=relaxed/simple;
	bh=yY2QiiKQ0YNTBP+D1ov4NyY2s6Q7aaOk1qqCp6J7Whk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EoXKkaLs4vrVzllo9IhptzJnujRj/XeWaO/P09yyN2cBbHFQFG1+Gs39Im9aHtAwcvI4n2p1PeyYsGWR1RwWM7tqu/cog4ID5q0R1FZr8AgchbzSxC+yRHnz4gsI2mDXLzFINAtcT6yVZmkOUvM2E0uKcIV2BposOw5gT5F8c9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klkgVwaL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E05C4CEF2;
	Sun,  1 Jun 2025 23:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821170;
	bh=yY2QiiKQ0YNTBP+D1ov4NyY2s6Q7aaOk1qqCp6J7Whk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=klkgVwaLwEi8BCncuCtR19DvIs7qj9VKgmEmhIDw0fn3OLbylN44PFX2ppbzxzuLD
	 RrfjrIPWEGPqDIsnqPj6hD+hEQKsilejZZ7IKbMIB+7EEgJoNzLC2Wg/i/MVjVzPns
	 Ow63ht3D33+Z0UkDGQFGghn0+I9QPXQtN8g/0acv4iJoLIaUCMt8MFv8IOCmb8y2Qs
	 AGApOFXUak1ShBUVChQFqi49cAXGpk0EtMnxd5tJH0ksMfbrWcfmA57KgUFPFO1p+q
	 rUgmNlT1VwfRTdT9R6AvVVBS8bOrPYV9OMeRqXs+9TKBngfGWLMeL4ewZu3KbDD5tp
	 hUYo9vTyyYOKw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nas Chung <nas.chung@chipsnmedia.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	quic_vgarodia@quicinc.com,
	quic_dikshita@quicinc.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 44/66] media: qcom: venus: Fix uninitialized variable warning
Date: Sun,  1 Jun 2025 19:37:21 -0400
Message-Id: <20250601233744.3514795-44-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233744.3514795-1-sashal@kernel.org>
References: <20250601233744.3514795-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Transfer-Encoding: 8bit

From: Nas Chung <nas.chung@chipsnmedia.com>

[ Upstream commit 8e172e38a623ce284baf2514f963b29e4d47c62e ]

Avoid uninitialized variable when both V4L2_TYPE_IS_OUTPUT() and
V4L2_TYPE_IS_CAPTURE() return false.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees.
**Analysis:** This commit fixes a legitimate uninitialized variable bug
in the `find_format_by_index()` function in
`drivers/media/platform/qcom/venus/vdec.c`. Here's why it meets the
criteria for stable backporting: 1. **Bug Fix Nature**: The commit
addresses a clear code defect where the `valid` variable could be used
uninitialized. In the original code at line 157, `bool valid;` is
declared but not initialized. The logic then uses an `if-else if`
construct: - `if (V4L2_TYPE_IS_OUTPUT(type))` - sets `valid` - `else if
(V4L2_TYPE_IS_CAPTURE(type))` - sets `valid` - But if neither condition
is true, `valid` remains uninitialized 2. **Potential Impact**: Based on
the V4L2 macro definitions, `V4L2_TYPE_IS_CAPTURE(type)` is defined as
`(!V4L2_TYPE_IS_OUTPUT(type))`, which means these should be mutually
exclusive and cover all cases. However, the bug exists because the
original code used `else if` instead of just `else`, creating a
theoretical path where neither executes. 3. **Minimal Risk Fix**: The
fix is extremely simple and safe - changing `bool valid;` to `bool valid
= false;` and replacing `else if` with `else`. This ensures the variable
is always initialized and the logic covers all possible cases. 4.
**Consistency with Similar Commits**: This fix is very similar to
"Similar Commit #1" which was marked as "Backport Status: YES". That
commit also fixed an uninitialized variable in the venus driver with a
simple initialization. The pattern and impact are nearly identical. 5.
**No Side Effects**: The change is purely defensive programming - it
doesn't alter the intended behavior but prevents undefined behavior in
edge cases. 6. **Compiler/Static Analysis Issue**: This type of
uninitialized variable warning is commonly flagged by static analysis
tools and newer compiler versions, indicating it's a legitimate code
quality issue that should be fixed. The commit follows stable tree rules
perfectly: it's a small, contained bugfix with minimal regression risk
that addresses a potential runtime issue in the venus media driver.

 drivers/media/platform/qcom/venus/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 884ee6e9d4bd1..0cf95bfff86ac 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -154,14 +154,14 @@ find_format_by_index(struct venus_inst *inst, unsigned int index, u32 type)
 		return NULL;
 
 	for (i = 0; i < size; i++) {
-		bool valid;
+		bool valid = false;
 
 		if (fmt[i].type != type)
 			continue;
 
 		if (V4L2_TYPE_IS_OUTPUT(type)) {
 			valid = venus_helper_check_codec(inst, fmt[i].pixfmt);
-		} else if (V4L2_TYPE_IS_CAPTURE(type)) {
+		} else {
 			valid = venus_helper_check_format(inst, fmt[i].pixfmt);
 
 			if (fmt[i].pixfmt == V4L2_PIX_FMT_QC10C &&
-- 
2.39.5


