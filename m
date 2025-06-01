Return-Path: <linux-media+bounces-33780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F21ACA2E4
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 01:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD8057A8C8C
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 23:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0443325DD1C;
	Sun,  1 Jun 2025 23:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+TApWYw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52363270EBF;
	Sun,  1 Jun 2025 23:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820513; cv=none; b=mQG12Jj6e80YKyoAUHrQFyOQLbG7NtC3IZvjH09HCQpa+kguiqmxDt9DBz+LhJs4bOL18PifndXiy/FEmu4syNFrErSMs0aeo/4XdFu+XhqJ8jQ6LKnk53qGQsf62gicGZCUWEECMLYNFEzWH9iZdMuc24kZ6f/7CtNaNAVK9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820513; c=relaxed/simple;
	bh=yf7en2mIQnu6hy59e0wXMpo5+D7zigwRK3HjVtholac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C/XvIEp4VC2t3a0jxXa4B46bwcTHKd0dxhHeQDKOIFq4sixexEVXwkodFfuo35Y+Ydjh3AsSuNCJRh2HpqJe8PHsmH3+reTMMOY/6hZeTygbg8KUxFSacH8hqh3UTQ9iNFkKEViSArJ2ZlGhKcD+snyP/llU51h4ImqFjJrBa9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+TApWYw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C83DC4CEE7;
	Sun,  1 Jun 2025 23:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820511;
	bh=yf7en2mIQnu6hy59e0wXMpo5+D7zigwRK3HjVtholac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X+TApWYwiTzgZw7j86olNcrKjj0LCqdwRbRRNLVsFC0IAvV9Pa/EfnPhWs4IMIgyR
	 920TG21m68RM2BN8bWz06ahAY6xoJ8rIwL2Z0Mo8AXQmrG8KKYtSDkdWvyDpDj6P23
	 tAVOBqtYeYEqv9PYin5YfOwRpoVP3QElARwOjFopyD3OlHrvvDqwmOedssJ/xYZAqG
	 ielKRErQYyrf43STXFhuF03kO3AR1dw8+DSlKsUYZUiz4GgeA0JRjUsE4FrV6F8HNq
	 yJ/ck0PAhf0M8Lf8Qr69nBDeL6VJjYrQY6DSsdFWHf9CqMMI19UjTALclKa88T+yvX
	 ZCeqyw+YcruFA==
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
Subject: [PATCH AUTOSEL 6.15 078/110] media: qcom: venus: Fix uninitialized variable warning
Date: Sun,  1 Jun 2025 19:24:00 -0400
Message-Id: <20250601232435.3507697-78-sashal@kernel.org>
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
index 9f82882b77bcc..39d0556d7237d 100644
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


