Return-Path: <linux-media+bounces-52789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NfPMt7Jj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:03:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6743A13A459
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AB1A3045E07
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF014217704;
	Sat, 14 Feb 2026 01:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xlts5PHT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215382147E5;
	Sat, 14 Feb 2026 01:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771030976; cv=none; b=EIxPdtfCT5QFZ6PAi8JEybUu32zbyJIz5mT8YCwY9So8/vcVomPms74amE2m/gdVO2BeeHRLRQhN44JjdrFnyoS401pcpqq/1dwiF7FwCrrN/XmDVhtfGRU5RdazJiIskDWr+jdCSQt9jvAGCtrlef/m9HHR4mFGzvh1hDAzTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771030976; c=relaxed/simple;
	bh=oIIHvMzDxaruZGVQGS9JOy8hDJDQ9lNDinPSU2vCRMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uc4o5MRXxJVf/bKEj/ykgLhjPjYqTyR9EJ2HfQk5hZbgEVz5CjMT5MN+m8vizuABKWsuPedlJrozVL80XSRsdgzuSSoSKGBq1fy6IWE6ZOi/hAk6uT4h2enCrFqjhXAIiu0h9z51pHG+wcn2MeB3hdugid2jOeWnCFINhUFFDwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xlts5PHT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE55AC16AAE;
	Sat, 14 Feb 2026 01:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771030975;
	bh=oIIHvMzDxaruZGVQGS9JOy8hDJDQ9lNDinPSU2vCRMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xlts5PHTF2G5z/3daJ/NaRRR/alhSsd5vEDvrwiD4ECn1sjxUg5Bd0sNM8pvSuooe
	 sV89fel64r2YR8EANStoivpaekJPmZt4OERRJGsMFyTfJx92gtr7ZJgF+hRSwBzj3O
	 Uib5Dd2PT1VQEfSh9SFcKr93Vm1Fu9gc93R47S6luHHwaUAcZ3GsvPtnWkI5MM0t2J
	 oKlauR2V6eL6DFLWLuEVEsiXXJg0MgDUP22cMbuXrzLrBXT6DLaxLqwxEyMDoCFeef
	 7ob+e9pziFR7eDL7/mzQm4CpeRHW/j4I5445GBbC5lNW/nID4SCWvp90dRSR0G5kYJ
	 OtURRePS1199g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Brandon Brnich <b-brnich@ti.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	nas.chung@chipsnmedia.com,
	jackson.lee@chipsnmedia.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] media: chips-media: wave5: Fix conditional in start_streaming
Date: Fri, 13 Feb 2026 19:58:05 -0500
Message-ID: <20260214010245.3671907-5-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52789-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 6743A13A459
X-Rspamd-Action: no action

From: Brandon Brnich <b-brnich@ti.com>

[ Upstream commit b4e26c6fc1b3c225caf80d4a95c6f9fcbe959e17 ]

When STREAMON(CAP) is called after STREAMON(OUT), the driver was failing to
switch states from VPU_INST_STATE_OPEN to VPU_INST_STATE_INIT_SEQ and
VPU_INST_STATE_PIC_RUN because the capture queue streaming boolean had not
yet been set to true. This led to a hang in the encoder since the state
was stuck in VPU_INST_STATE_OPEN. During the second call to
start_streaming, the sequence initialization and frame buffer allocation
should occur.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

This confirms the key finding. Now I have all the information needed for
a comprehensive analysis.

## Detailed Analysis

### 1. COMMIT MESSAGE ANALYSIS

The subject "Fix conditional in start_streaming" clearly indicates a
**bug fix**. The commit message explains:
- **Trigger**: When `STREAMON(CAPTURE)` is called after
  `STREAMON(OUTPUT)`, the encoder hangs.
- **Root cause**: The capture queue's `streaming` boolean hasn't been
  set to `true` yet at the time the condition is checked.
- **Symptom**: The VPU instance state gets stuck at
  `VPU_INST_STATE_OPEN`, never advancing to `VPU_INST_STATE_INIT_SEQ` or
  `VPU_INST_STATE_PIC_RUN`, causing the encoder to **hang**.

The commit has "Reviewed-by: Nicolas Dufresne" (Collabora engineer,
active V4L2 contributor) and was merged by Hans Verkuil (the V4L2
subsystem maintainer), indicating proper review.

### 2. CODE CHANGE ANALYSIS

The fix is a **one-line conditional change** (technically a 2-line
reformatting of a single condition):

**Before:**
```c
if (inst->state == VPU_INST_STATE_OPEN &&
m2m_ctx->cap_q_ctx.q.streaming) {
```

**After:**
```c
if (inst->state == VPU_INST_STATE_OPEN &&
    (m2m_ctx->cap_q_ctx.q.streaming || q->type ==
V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)) {
```

The logic bug is clear and verified by examining `vb2_core_streamon()`:

```2347:2353:drivers/media/common/videobuf2/videobuf2-core.c
        if (q->queued_count >= q->min_queued_buffers) {
                ret = vb2_start_streaming(q);
                if (ret)
                        goto unprepare;
        }

        q->streaming = 1;
```

The `q->streaming = 1` is set **AFTER** the driver's `start_streaming()`
callback returns. So inside `wave5_vpu_enc_start_streaming()`, when
called for the capture queue, `m2m_ctx->cap_q_ctx.q.streaming` is still
`0` because vb2 hasn't set it yet. This means the second `if` block (the
state transition from OPEN -> INIT_SEQ -> PIC_RUN) is **never entered**
when streaming is started in the normal OUT-then-CAP order.

The fix adds `q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE` as an
alternative condition: if we're currently inside `start_streaming` for
the capture queue, we know that capture streaming is about to become
active, so proceed with the state transition.

This is **identical** to how the decoder handles it — the decoder uses
`q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE` directly (line 1346 of
wave5-vpu-dec.c) rather than checking the streaming flag.

### 3. CLASSIFICATION

This is a clear **bug fix** that resolves a **system hang**. The encoder
gets stuck because its state machine never advances past
`VPU_INST_STATE_OPEN`. This is not a feature addition, refactoring, or
optimization.

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed**: 2 lines (one condition modified)
- **Files touched**: 1 file (`wave5-vpu-enc.c`)
- **Complexity**: Extremely low — a simple boolean condition expansion
- **Risk**: Very low. The added condition (`q->type ==
  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE`) only evaluates to true when
  `start_streaming` is called for the capture queue, which is precisely
  when the streaming flag would be about to be set. This is logically
  sound and matches the decoder's approach.
- **Regression potential**: Near zero. The fix only adds a case that was
  previously unreachable (the dead path that caused the hang).

### 5. USER IMPACT

- **Who is affected**: Any user of the Wave5 VPU encoder (Chips&Media IP
  used in TI processors and other SoCs)
- **Severity**: **HIGH** — the encoder **hangs completely**. This isn't
  a minor issue; the hardware cannot encode video at all when STREAMON
  is called in the standard OUT-then-CAP order.
- **Real-world impact**: This affects all V4L2 applications using the
  standard video encoding flow (which is the normal way to use a V4L2
  M2M encoder).

### 6. STABILITY INDICATORS

- Reviewed by Nicolas Dufresne (Collabora V4L2 expert)
- Merged by Hans Verkuil (V4L2 subsystem maintainer)
- The fix follows the same pattern already used by the decoder
  (wave5-vpu-dec.c), so it's a well-understood pattern

### 7. DEPENDENCY CHECK

- **Self-contained**: Yes. The fix modifies a single condition with no
  dependencies on other commits.
- **Exists in stable**: The driver was added in v6.8 via commit
  `9707a6254a8a6`. It exists in stable trees 6.8.y through 6.18.y (plus
  the active LTS tree 6.12.y).
- **The bug has existed since the driver was added** (commit
  `9707a6254a8a6`), meaning all stable trees with this driver have the
  bug.
- **Clean apply**: The surrounding code is essentially identical in
  6.12.y, 6.15.y, and 6.16.y (minor differences in pm_runtime calls that
  don't affect the patch context).

### 8. SUMMARY

This is a textbook stable backport candidate:
- **Fixes a real, user-visible bug**: encoder hangs completely
- **Small, surgical fix**: 2-line conditional change in one file
- **Obviously correct**: matches the decoder's existing pattern,
  reviewed by V4L2 experts
- **No new features**: just fixes the broken state machine transition
- **Low regression risk**: only enables a previously dead code path that
  was always supposed to be reachable
- **Affects real users**: anyone using the Wave5 encoder for video
  encoding on TI SoCs
- **Self-contained**: no dependencies on other commits

**YES**

 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 9bfaa9fb3ceb3..bca881a0a1617 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1367,7 +1367,8 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 		if (ret)
 			goto return_buffers;
 	}
-	if (inst->state == VPU_INST_STATE_OPEN && m2m_ctx->cap_q_ctx.q.streaming) {
+	if (inst->state == VPU_INST_STATE_OPEN &&
+	    (m2m_ctx->cap_q_ctx.q.streaming || q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)) {
 		ret = initialize_sequence(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Sequence not found: %d\n", ret);
-- 
2.51.0


