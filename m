Return-Path: <linux-media+bounces-33798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F8ACA461
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0A761884EF3
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2330B294A14;
	Sun,  1 Jun 2025 23:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sjm+2fNg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743932949FF;
	Sun,  1 Jun 2025 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820782; cv=none; b=db+9Gx4bRZVot41ZjTqyixN1wmyhWh8Ii1tFMoqpqBlaQFpB9BTCh5WwT65vDwehMaZFRyghsMwUPkSSWWsVid4D5trPK/mYy5c9KIVK4qGvqoFWU5sbkSuFYd4c5GYtkWouztH5ARA+jLMkLpGwKcHzPZ/DiX2OvEB0SJ0YoYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820782; c=relaxed/simple;
	bh=yf7en2mIQnu6hy59e0wXMpo5+D7zigwRK3HjVtholac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H0pukSsvuAXdOs0vTJxhRumzMAYQt1UzQ34XQ2wMvRnrlYYQV24f5uqj0OJmaqJiTNu2lPwjCvo3/FvJUTG1LsC4Lqpt3xfVJJ7XrYddSZwADxTBv0I82F2h0kMQI1sYqkwu4vIAygYdu8Gl3zB5VbniVF5hYAZRW9u3q9a+biU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sjm+2fNg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1B6C4CEF2;
	Sun,  1 Jun 2025 23:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820782;
	bh=yf7en2mIQnu6hy59e0wXMpo5+D7zigwRK3HjVtholac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sjm+2fNgLEplT4EjMJyxru+jeXgy1SGrfzfq8FxuOECL0MmkUf263LqxL0LjmXkXD
	 j2VGMlVSfNw95MrMyGBFRKJlv8M2dia07DqurxO4ITEqH3Y9bzKa24WiREF1zZUg4C
	 QOmQM5GAr49JCtFCloqaY44bj9l7ypHdiWLaS78G18SyoOJyCYSAli6nRoLMs4IOeb
	 fCNEiGPWFdXlHwydK13VIB4ktRWhNGxyXti/G5k/ltvuzAJ/bjaM2UVCgX95A6P51J
	 WCWZOFx12FOEYrqlFfVzV4n4Zs6iBntCVzpm8EmGIr4yT71PXms1A6iMMohFiPwacl
	 qj+VdJ+VwZgeg==
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
Subject: [PATCH AUTOSEL 6.14 072/102] media: qcom: venus: Fix uninitialized variable warning
Date: Sun,  1 Jun 2025 19:29:04 -0400
Message-Id: <20250601232937.3510379-72-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
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


