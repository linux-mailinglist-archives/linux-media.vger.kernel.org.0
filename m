Return-Path: <linux-media+bounces-33826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CE5ACA5D3
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 02:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF3F717A43D
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 00:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFA730FB06;
	Sun,  1 Jun 2025 23:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzqBpGwv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEC030FB16;
	Sun,  1 Jun 2025 23:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748821137; cv=none; b=QBgHc5WeCxINpzVLUq7+mskfDlhgXfjJK5aGOW0/6DMIS8I6qHHC3Voi2HNMzs930GaMN8fFFMNP6A+AjdSP9rdXY/qXVHwQ1F8fFjwjvjAzIClnK59hl+5L/u/WdocAjtZY66cBQJQxrnIEsc3VgGL0JG2k1u9e7w950C4j2ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748821137; c=relaxed/simple;
	bh=IZ+z1lIb/H3UILfOjOUl48oOH9Bj8Y4IUC32rGWTLyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQQscyoZo1a28nxy6eL7+utqPDOUdDFzmRQ4ORWmpCjFlrl+ScHM6bDAvbqVOGuvuu/DZm8XVz9boNu5gc/TruNNXRoiEbhpoXuK6NO1gC/r9586Hy0y3OEreiybZU82cEKVdd5v8s8si2eARC6VWMJQUx+myUubMHT2YdiGL3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzqBpGwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4F3C4CEE7;
	Sun,  1 Jun 2025 23:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748821137;
	bh=IZ+z1lIb/H3UILfOjOUl48oOH9Bj8Y4IUC32rGWTLyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jzqBpGwvyWGhV2LHGmVaL9slAnMY6Jc/vZMHpqoUSmROFTIv9749/1NmAnEbsAX7u
	 4SKJURrHN1sRRYEgeMbFootSveUbb43YVIKBBV5etKEruWTk8Tvrc7QJKQXj7QudnF
	 irc5Q+o7XJXO92zFA1pQEN6ZITM3NjeI0w+znAAtWJutpczzCh+QNNAfmudoLOuCKa
	 CLK00BSs6gx83Q0ZC1WQYjfndhHnn2Xcy3zEq0DV/kqHoyZoHRe+IWO/Lp0R5wCvL4
	 +fKfVhUDWbxgEcO+/eyqIgTJQ+HVm4TpHJVNlXgLGAZssVHIT5jVaRE1Izx26jO3BC
	 pZO0pu1g3NmwA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 30/66] media: rkvdec: Initialize the m2m context before the controls
Date: Sun,  1 Jun 2025 19:37:07 -0400
Message-Id: <20250601233744.3514795-30-sashal@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nicolas Dufresne <nicolas.dufresne@collabora.com>

[ Upstream commit d43d7db3c8a1868dcbc6cb8de90a3cdf309d6cbb ]

Setting up the control handler calls into .s_ctrl ops. While validating
the controls the ops may need to access some of the context state, which
could lead to a crash if not properly initialized.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Now let me analyze the specific changes proposed in the commit: ##
Analysis **YES** This commit should be backported to stable kernel
trees. Here's my extensive analysis: ### Core Issue Analysis The commit
addresses a critical initialization order bug that can lead to crashes.
The problem occurs in the `rkvdec_open()` function at lines 822-830 in
the current code: 1. **Current problematic order:** - Line 822:
`rkvdec_init_ctrls(ctx)` is called first - Line 826-830:
`v4l2_m2m_ctx_init()` is called second 2. **The problem:** According to
the commit message and my analysis of the kernel documentation,
`v4l2_ctrl_handler_setup()` (called inside `rkvdec_init_ctrls()`) calls
`.s_ctrl` for all controls unconditionally to initialize hardware to
default values. The `.s_ctrl` handlers may need to access the m2m
context state, but if the m2m context (`ctx->fh.m2m_ctx`) isn't
initialized yet, this can cause a crash or undefined behavior. ### Code
Changes Analysis The fix is minimal and surgical: - **Lines moved:** The
initialization order is swapped - m2m context initialization moves
before control handler setup - **Error handling updated:** The error
handling paths are correctly updated to match the new initialization
order - **No functional changes:** The fix doesn't change driver
functionality, only initialization sequence ### Why This Should Be
Backported 1. **Fixes a real crash bug:** This addresses a potential
crash scenario that affects users 2. **Small and contained:** The change
is minimal - just reordering initialization and updating error paths 3.
**Low regression risk:** Moving m2m init before control init is safer
since m2m context doesn't depend on controls, but controls may depend on
m2m context 4. **Follows established patterns:** Similar commit #2 in
the historical examples shows a "YES" backport for proper initialization
order in V4L2 drivers 5. **Critical subsystem:** Media drivers crashing
can affect user applications ### Comparison with Historical Commits -
**Similar to commit #2 (YES):** Also fixes initialization order in V4L2
media driver to prevent crashes - **Similar to commit #4 (YES):** Media
driver fix that's low-risk and contained - **Unlike commits #1, #3, #5
(NO):** This actually fixes a bug rather than just cleanup/code style
improvements ### Stable Tree Criteria Met ✅ **Important bugfix:**
Prevents crashes ✅ **Minimal risk:** Simple reordering with no side
effects ✅ **Small change:** Only affects initialization sequence ✅ **No
architectural changes:** Pure bug fix ✅ **Confined to subsystem:** Only
affects rkvdec driver The fix follows the stable tree rules perfectly -
it's an important crash prevention fix with minimal regression risk,
making it an ideal backport candidate.

 drivers/staging/media/rkvdec/rkvdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index ac398b5a97360..838ff0ee0bbb4 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -821,24 +821,24 @@ static int rkvdec_open(struct file *filp)
 	rkvdec_reset_decoded_fmt(ctx);
 	v4l2_fh_init(&ctx->fh, video_devdata(filp));
 
-	ret = rkvdec_init_ctrls(ctx);
-	if (ret)
-		goto err_free_ctx;
-
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(rkvdec->m2m_dev, ctx,
 					    rkvdec_queue_init);
 	if (IS_ERR(ctx->fh.m2m_ctx)) {
 		ret = PTR_ERR(ctx->fh.m2m_ctx);
-		goto err_cleanup_ctrls;
+		goto err_free_ctx;
 	}
 
+	ret = rkvdec_init_ctrls(ctx);
+	if (ret)
+		goto err_cleanup_m2m_ctx;
+
 	filp->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
 
 	return 0;
 
-err_cleanup_ctrls:
-	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+err_cleanup_m2m_ctx:
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 
 err_free_ctx:
 	kfree(ctx);
-- 
2.39.5


