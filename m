Return-Path: <linux-media+bounces-45558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994CC09A19
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF6A1424AC3
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B33B314D37;
	Sat, 25 Oct 2025 16:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/hzdYLp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8D3090CB;
	Sat, 25 Oct 2025 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409448; cv=none; b=jNnTqJ80LHepGENkLzCMjkB1nSNq64epUmo8Rlh1vuMYj+qQVcGK8EMW7+Qc4t752nZ3G+Cdcv+ZuLqi0T5fz9TfLwv2PhOkjPPRxcjBsZ/Ax+j77DtP82ZeGRe9M04+XCkUCcxgSlpNtPHxx4IzBMyJkVtFZjlB63rRqUw43jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409448; c=relaxed/simple;
	bh=ugSdH9QCXo2bv2Sl3q38DrYXhlgFdvbAmgjiA0Qmc7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GlJrpzCztOWcaAPL1g0Bp++PL0OLKVA03zlT8XE5WwCSEzCiKDu9Ia5WgQjKhYKCl+AJBYcHimvpznEnH/5cGxvYeDRulelHp5Ccnhv+WnCO43ifecfDOywGMMZytjL/K7GovWzzToCTElZxVFydZBMvbqqrwoogsYYALLuoG7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/hzdYLp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01FEC4CEF5;
	Sat, 25 Oct 2025 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409448;
	bh=ugSdH9QCXo2bv2Sl3q38DrYXhlgFdvbAmgjiA0Qmc7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F/hzdYLpKN9Din/oVnpLlYns6sykx5AZx8uk+FcLmzntPOjXbAL9be60tP1aqS0dd
	 SJdG0Zub4oi2sOKPRqBPNMkB490/QWe0+xVgJ+GkYbNXE4cqlBG9gOPXCkcuuwp845
	 +Ovpc3zE8BKay2h7HMlDnb4mVav9OOIQPyPY21dNBYRnVT02bkugGkRLdbpYJzU5DE
	 MWMb2Slzj+tiL8zL54OIIUG9BKdepK7ES4njQoKFfqPFVAYLFadG5VQIsp8qhoJKam
	 Wtts7Mg8yy6yZBA2nmjJwVBhD3O788Dhj9rS83X+dItVcp/mwTykR5uASnAZTHV/RO
	 YHR9Mo0/jDgnw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.12] media: pci: mgb4: Fix timings comparison in VIDIOC_S_DV_TIMINGS
Date: Sat, 25 Oct 2025 11:59:21 -0400
Message-ID: <20251025160905.3857885-330-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

[ Upstream commit 0750649b528ff18d1d68aecb45b34ec22d5ab778 ]

Compare the whole v4l2_bt_timings struct, not just the width/height when
setting new timings. Timings with the same resolution and different
pixelclock can now be properly set.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes: Prevents a real functional bug where setting DV timings
  with the same width/height but different pixelclock (or other BT
  fields) was treated as “no change” and ignored. This blocked valid
  timing changes (e.g., framerate changes at the same resolution).
- Code change: Replaces a narrow equality check on resolution with a
  full DV timings comparison:
  - New check: `v4l2_match_dv_timings(timings, &vindev->timings, 0,
    false)` in `drivers/media/pci/mgb4/mgb4_vin.c:613`.
  - Old behavior (implicit from the diff): only compared `width` and
    `height`, causing false “match” for differing
    pixelclock/porches/polarities/etc.
- Correct behavior when busy: With the fix, if the queue is streaming
  and the requested timings differ in any BT field,
  `vidioc_s_dv_timings` returns `-EBUSY` instead of silently returning 0
  while not applying the change (see `vb2_is_busy` branch right after
  the match check in `drivers/media/pci/mgb4/mgb4_vin.c:615`).
- Scope and risk: Minimal and contained (one-line logic change in a
  single driver). No API/ABI change, no architectural impact, only
  affects `VIDIOC_S_DV_TIMINGS` behavior in the MGB4 capture driver.
- Uses a proven helper: `v4l2_match_dv_timings` is the standard V4L2
  helper that compares the full `v4l2_bt_timings` including
  width/height, interlaced, polarities, pixelclock (with tolerance),
  porches, vsync, flags, and interlaced-specific fields; see
  implementation at `drivers/media/v4l2-core/v4l2-dv-timings.c:267`.
  This pattern is used across other drivers.
- User impact: Enables setting legitimate timings that share resolution
  but differ in pixelclock (and other BT parameters). Previously such
  requests were incorrectly treated as no-ops.
- Stable criteria fit:
  - Important bugfix affecting real use (DV timings changes ignored).
  - Small, localized change with low regression risk.
  - No new features or interface changes.
  - Touches only a non-core driver
    (`drivers/media/pci/mgb4/mgb4_vin.c`).
- Backport note: Apply to stable kernels that include the MGB4 driver;
  the helper `v4l2_match_dv_timings` is long-standing in V4L2 and does
  not introduce dependencies.

Overall, this is a low-risk, clear bug fix that improves correctness and
user experience when changing DV timings; it should be backported.

 drivers/media/pci/mgb4/mgb4_vin.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 989e93f67f75b..42c327bc50e10 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -610,8 +610,7 @@ static int vidioc_s_dv_timings(struct file *file, void *fh,
 	    timings->bt.height < video_timings_cap.bt.min_height ||
 	    timings->bt.height > video_timings_cap.bt.max_height)
 		return -EINVAL;
-	if (timings->bt.width == vindev->timings.bt.width &&
-	    timings->bt.height == vindev->timings.bt.height)
+	if (v4l2_match_dv_timings(timings, &vindev->timings, 0, false))
 		return 0;
 	if (vb2_is_busy(&vindev->queue))
 		return -EBUSY;
-- 
2.51.0


