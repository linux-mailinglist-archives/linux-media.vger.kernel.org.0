Return-Path: <linux-media+bounces-52802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLfVIP/Kj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:08:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF57113A83E
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 988373011134
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED922248B9;
	Sat, 14 Feb 2026 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAyRepvK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70CE2556E;
	Sat, 14 Feb 2026 01:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031200; cv=none; b=OxxGU/xRltSWpDevqPe06tkp/2lqa0AjM4A8+6cM4N4/bqnPaeHY+TzaRdGhg5qr98ZfXg9CmVDEd8t2XQBJG+vP7haJ+aJIL9RAiLYr9q+FmLiIssTstKWSydAgwsymrOgR2XvmZprW6PwQHbnKHm7e7F9f43VVMppNoqYNqbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031200; c=relaxed/simple;
	bh=62Oh1rWnodoAQG8K1KrgWZ/qT0lmnHi4eoA6J8s0BsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qqw0SrmX9Hk5dDl+LObRRTfRsIWoxNNXjVnyUJmdCRlmN52C3oKgKcYxx3Q+JWz43+DPNrz1p/W6F5sUMsTD3dEt4Q8wM5fQdrhQPlDsC0Kah41eHhoVJXklM8p8NOZhiJSvFoiFsygVSu4SgzsxfIp2aVmpckkc3oSlTmZ61mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAyRepvK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF2EC19424;
	Sat, 14 Feb 2026 01:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031200;
	bh=62Oh1rWnodoAQG8K1KrgWZ/qT0lmnHi4eoA6J8s0BsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mAyRepvKwXv+LTYc7OpRZBtudN2XRLhrAwNaXsy0rB2jnsaGZ9OLEN3SJdZBhNnN1
	 C51c3pubBt4V5n7L3mVBxU6BOxwyKRTj18DRpf+wa80KMMQ+Ccs4rkROQKtvupKs+U
	 pVUyPnljLHoC0M+wlzG4aMSB2d5D9njv8rXajgUw0xHlD0DNC/WDHY6513DclzvKKQ
	 bKPlXp3Ph59C4recBpTT+dbL4/6AQSd3nJBmsaTe4S8xD3Z1Edrt4G0V4CmnB7Zo1M
	 OqmZm4sTT7TvirlAnxOuls54DUXishJzoepeEwKCCFtN2N4GlXsSlFbjsa+Wh8ZqmP
	 uKSRZ8ATT/7YQ==
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
Subject: [PATCH AUTOSEL 6.19-6.12] media: chips-media: wave5: Process ready frames when CMD_STOP sent to Encoder
Date: Fri, 13 Feb 2026 19:59:40 -0500
Message-ID: <20260214010245.3671907-100-sashal@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52802-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,collabora.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF57113A83E
X-Rspamd-Action: no action

From: Brandon Brnich <b-brnich@ti.com>

[ Upstream commit 5da0380de41439ed64ed9a5218850db38544e315 ]

CMD_STOP being sent to encoder before last job is executed by device_run
can lead to an occasional dropped frame. Ensure that remaining ready
buffers are drained by making a call to v4l2_m2m_try_schedule.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Here is my complete analysis:

---

## Analysis of: "media: chips-media: wave5: Process ready frames when
CMD_STOP sent to Encoder"

### 1. COMMIT MESSAGE ANALYSIS

The commit message clearly describes a bug: **CMD_STOP being sent to the
encoder before the last job is executed by `device_run` can lead to an
occasional dropped frame.** The fix is to call `v4l2_m2m_try_schedule()`
to ensure remaining ready buffers are drained. This is a data integrity
issue - users lose the last frame of their encoded video.

### 2. CODE CHANGE ANALYSIS

The change is a **two-line addition** (one blank line + one function
call) in `wave5_vpu_enc_encoder_cmd()`:

```653:654:drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
                m2m_ctx->is_draining = true;

                v4l2_m2m_try_schedule(m2m_ctx);
```

**The bug mechanism:**

When userspace sends `V4L2_ENC_CMD_STOP`, the driver:
1. Sets `m2m_ctx->last_src_buf` to the last queued source buffer
2. Sets `m2m_ctx->is_draining = true`
3. Returns - **without triggering the m2m scheduler**

The problem is a race: if CMD_STOP arrives between when the last buffer
is queued and when `device_run` picks it up, the m2m framework has no
trigger to schedule the remaining work. The `wave5_vpu_enc_job_ready()`
callback (line 1542) checks `is_draining` and returns `true` to indicate
the encoder is ready for a drain job - but nobody calls the scheduler to
check this.

`v4l2_m2m_try_schedule()` simply calls `__v4l2_m2m_try_queue()` +
`v4l2_m2m_try_run()` - it checks if there's work ready and runs it. It's
completely safe - if there's nothing to do, it returns without side
effects.

### 3. COMPARISON WITH OTHER DRIVERS

This is an **inconsistency bug** that's obvious when comparing with
other m2m codec drivers:

- **wave5 decoder** (`wave5_vpu_dec_decoder_cmd`, line 888): Already
  calls `v4l2_m2m_try_schedule(m2m_ctx)` after DEC_CMD_STOP, with the
  comment "Just in case we don't have anything to decode anymore"
- **MediaTek encoder** (`vidioc_encoder_cmd` in `mtk_vcodec_enc.c`, line
  734): Calls `v4l2_m2m_try_schedule(ctx->m2m_ctx)` after ENC_CMD_STOP
- **MediaTek decoder** (`stateful_decoder_cmd`, line 116): Same pattern
- **CODA decoder** (`coda_decoder_cmd`, line 1268): Same pattern

The wave5 encoder was the **only** m2m encoder/decoder driver that set
`is_draining = true` without calling `v4l2_m2m_try_schedule()`. This is
clearly a bug present since the driver's initial submission.

### 4. CLASSIFICATION

**Bug fix** - fixes dropped frames (data loss) during video encoding
drain. Not a feature, not cleanup.

### 5. SCOPE AND RISK ASSESSMENT

- **Lines changed**: 2 (1 blank + 1 function call)
- **Files touched**: 1
- **Risk**: Extremely low. `v4l2_m2m_try_schedule()` is the standard
  V4L2 m2m API for triggering job scheduling. It's called in every other
  similar driver. It's safe to call at any time - if conditions aren't
  met for scheduling a job, it simply returns.
- **Subsystem**: media/chips-media/wave5 - a hardware video encoder
  driver for Chips&Media Wave5 IP used on TI platforms

### 6. USER IMPACT

Users encoding video with the Wave5 hardware encoder (e.g., on TI
AM62x/AM62Ax platforms) can **lose the last frame** when stopping
encoding. This is a real data integrity issue for anyone doing video
encoding with this hardware. The symptom is intermittent, making it
harder to diagnose.

### 7. STABILITY INDICATORS

- **Reviewed-by**: Nicolas Dufresne (Collabora - well-known
  V4L2/GStreamer developer)
- **Signed-off-by**: Hans Verkuil (media subsystem co-maintainer)
- **Author**: Brandon Brnich from TI (the SoC vendor that ships this IP)
- The fix follows established patterns from other drivers

### 8. DEPENDENCY CHECK

**No dependencies.** This is a self-contained one-line fix that adds a
call to an existing exported V4L2 m2m API function. The
`v4l2_m2m_try_schedule()` function has been available since long before
the wave5 driver was added.

### 9. STABLE TREE APPLICABILITY

The wave5 driver was added in v6.8-rc1 (commit `9707a6254a8a6`). It
exists in stable trees 6.8.y and later. The fix should apply cleanly
since the `wave5_vpu_enc_encoder_cmd` function hasn't changed
significantly since it was added.

### Summary

This is a textbook stable-worthy fix:
- **Small**: 2 lines added
- **Obviously correct**: Matches the pattern used by every other V4L2
  m2m encoder/decoder driver
- **Fixes a real bug**: Dropped frames during encoding drain (data loss)
- **Low risk**: Uses standard API, no side effects if conditions aren't
  met
- **Well-reviewed**: By V4L2 experts and the media subsystem maintainer
- **Self-contained**: No dependencies on other patches

**YES**

 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index bca881a0a1617..8e3dd9e34abc3 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -649,6 +649,8 @@ static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_en
 
 		m2m_ctx->last_src_buf = v4l2_m2m_last_src_buf(m2m_ctx);
 		m2m_ctx->is_draining = true;
+
+		v4l2_m2m_try_schedule(m2m_ctx);
 		break;
 	case V4L2_ENC_CMD_START:
 		break;
-- 
2.51.0


