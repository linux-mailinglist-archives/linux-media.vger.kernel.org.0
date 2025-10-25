Return-Path: <linux-media+bounces-45553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224EC097A9
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D89C40052B
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3F7307AEB;
	Sat, 25 Oct 2025 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGVbfM9n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77862FC893;
	Sat, 25 Oct 2025 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409186; cv=none; b=MhN+KuNK8ItlQk0WkAbzFDrP0vIFtew2yjEeCNg6ROrcVX8pjzmGhyH5N/dcuXOVVcPKLcLuMCYEoDKQHQ4k22fer5Wf88QXvJWTGxpl/litWMNJjF6KdHz8h5qW2bzUTBGjbas56FE7YpuV+xNRck9BQmhxLygON7XFMSzwGCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409186; c=relaxed/simple;
	bh=rzsxfGwSxEimW8GyMoi1WFxloCEF2YQlFpZisomNO6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iRKl6EZZ5Qc0GsvZQDOOQk9A0wQ6KTmch8BcbWCTcYnPW4zAlWQxL0kVkyit3fyghPxAwOQBRBLINyczHwZZUBJMNckDRovnK0V/dUEZo7X1w5j6/Crz+xLrlSz5jOWvYkjwF0wypcTce1jyrZywqvN8KnY9laL0uir6eI+IKzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGVbfM9n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BFFC4CEF5;
	Sat, 25 Oct 2025 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409186;
	bh=rzsxfGwSxEimW8GyMoi1WFxloCEF2YQlFpZisomNO6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CGVbfM9nTa3i9zlH7GgC4r5uoVhCg9aPO3D1AqAxyOa0OwNSAu8l934FdC0zcwKgG
	 4LiehpYA2nMglWUS87sSbjakhK/B/Zj802gJF/lg6fZba3PbuAloH3k6koZMjeC3dq
	 0JkCkqdXq0/HXrt3EXwpD80bK8rOZUKPi3gBEGEC1s7hVbAYT6KXmxCFe1SZ2KCgII
	 QY2zUdOuNFCK4EQNqffdkLwKuNJMFp7SFmD63d/9N0Gvv60XgnJzH8DqxgTonAFDCu
	 9j1+RSSVf/oBHyzE0uxQCs4nx3eC2p+Hj2H/9bnRPKLi2hO5PMDMFb9rOQgrH214dY
	 sqSJVjF3KfU3w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>,
	Sean Young <sean@mess.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] media: redrat3: use int type to store negative error codes
Date: Sat, 25 Oct 2025 11:57:45 -0400
Message-ID: <20251025160905.3857885-234-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Qianfeng Rong <rongqianfeng@vivo.com>

[ Upstream commit ecba852dc9f4993f4f894ea1f352564560e19a3e ]

Change "ret" from u8 to int type in redrat3_enable_detector() to store
negative error codes or zero returned by redrat3_send_cmd() and
usb_submit_urb() - this better aligns with the coding standards and
maintains code consistency.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Prevents truncation of negative error codes in
    `redrat3_enable_detector()`. Previously `ret` was `u8`, so failures
    from `usb_submit_urb()` (negative errno) would wrap to a positive
    byte (e.g., `-EPIPE` → `224`), causing the caller to treat failures
    as success.
  - The caller checks only for negative returns: `retval =
    redrat3_enable_detector(rr3); if (retval < 0) ...` in
    `drivers/media/rc/redrat3.c:1114-1116`. With a `u8` `ret`, errors
    would be lost, the probe would continue, and the device could end up
    non-functional (URBs not running) while the driver reports success.

- Evidence in code
  - `redrat3_send_cmd()` returns negative errno or non-negative status;
    it’s already `int`: `drivers/media/rc/redrat3.c:394-419`.
  - The patch changes `ret` to `int` in the detector enable path:
    `drivers/media/rc/redrat3.c:425`.
  - URB submissions return negative errno on error; these are assigned
    to and returned via `ret`: `drivers/media/rc/redrat3.c:439-443`,
    `drivers/media/rc/redrat3.c:445-449`. With `ret` as `u8`, a negative
    error like `-EPIPE` becomes a large positive and bypasses the `< 0`
    check at the call site (`drivers/media/rc/redrat3.c:1114-1116`).

- Scope and risk
  - Minimal, localized change (1 line, one function, single driver).
  - No API/ABI change; no behavior change on success paths; only
    corrects error propagation.
  - Aligns with kernel conventions where error codes are negative
    `int`s; the rest of this driver already uses `int ret` broadly
    (e.g., `drivers/media/rc/redrat3.c:503`,
    `drivers/media/rc/redrat3.c:657`, `drivers/media/rc/redrat3.c:691`,
    etc.), improving consistency.

- Stable backport criteria
  - Fixes a real, user-visible bug (driver may “succeed” initialization
    while URBs failed, leading to non-working IR receive).
  - Small and contained; no architectural change; regression risk is
    very low.
  - Not a feature addition; strictly a correctness fix for error
    handling.

Given the clear correctness improvement, minimal risk, and user impact
on failure paths, this commit is a good candidate for stable backport.

 drivers/media/rc/redrat3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index d89a4cfe3c895..a49173f54a4d0 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -422,7 +422,7 @@ static int redrat3_send_cmd(int cmd, struct redrat3_dev *rr3)
 static int redrat3_enable_detector(struct redrat3_dev *rr3)
 {
 	struct device *dev = rr3->dev;
-	u8 ret;
+	int ret;
 
 	ret = redrat3_send_cmd(RR3_RC_DET_ENABLE, rr3);
 	if (ret != 0)
-- 
2.51.0


