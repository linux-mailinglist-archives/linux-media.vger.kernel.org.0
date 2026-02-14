Return-Path: <linux-media+bounces-52791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ/FIwLKj2ndTgEAu9opvQ
	(envelope-from <linux-media+bounces-52791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:04:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4844713A4DA
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 028743077121
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF97C1DF751;
	Sat, 14 Feb 2026 01:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSKAxcG0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3277719004A;
	Sat, 14 Feb 2026 01:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771030984; cv=none; b=TgBgxVQjZciAnAzjZOQmxlrHs3kViSbt+nMUVzT4z1U4u/tiZBCSKwSd4HxQ9UiA8ZNdz9QRYHUkeOcY5mmLK4zXF69rWF+e4fQ85O8NYfaoxlveDCgY0pAxKDaQLUsF0CfnDN8gDyb+JpDqvW50Q+Bbz9IDv4dQqPlL6ZOj0sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771030984; c=relaxed/simple;
	bh=6b252clNGbTBiGvYimlqoZL3gDDB5lrGWWn8G9K6lTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUIOXqpXs/cZELl93te/CcVSzM8CmdEmx76Cm2JF7UIEsA4uTjkq8u+7d+3sgvqxHadlzXyNEiNwYHIkCzUWmGkRZ/6g0YGOawd2wU0Ly824nYp+JYmcEuUYHlMdy8y6HEKDXAzIpgIGt8nzvCiPJtrnaJ5jQKmboNmHjxM2UmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSKAxcG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2605BC116C6;
	Sat, 14 Feb 2026 01:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771030984;
	bh=6b252clNGbTBiGvYimlqoZL3gDDB5lrGWWn8G9K6lTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mSKAxcG0oRJ7QzUBVtbQsO8WB1CesdfKRPRqjh1NJPpZYMOZhU1pZ6+MELcFoox0b
	 RVgHpUhOK7MOU6Qsl/k7CvY2WqJgHbwoOM264ujdTWT1IDbgvZt0UsGJprHRo2ehmP
	 HxPoQB/qTvPbIZMQR7MDB0jYdrJaOFpcj8C6vFbiy4LpBBkP/516dIMFVsALf4X1WI
	 EDjpSec+ywpN9/WluGwjhFMWNNaFipVbkkiFzIFgdvKTTM1/p9koK3/H4ThFgU9F/I
	 KEqLenL7VGXwgXlMgwIA4WoXtqzONRKM/djOZ7/ikgZ2PwzTKs2blRIG8GQ7LAL/B7
	 HjI4bIOi8eIJA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ming Qian <ming.qian@oss.nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.1] media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
Date: Fri, 13 Feb 2026 19:58:10 -0500
Message-ID: <20260214010245.3671907-10-sashal@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-52791-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 4844713A4DA
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

[ Upstream commit d85f3207d75df6d7a08be6526b15ff398668206c ]

The V4L2_DEC_CMD_START command may be used to handle the dynamic source
change, which will triggers an implicit decoder drain.
The last_buffer_dequeued flag is set in the implicit decoder drain,
so driver need to clear it to continue the following decoding flow.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of commit: "media: amphion: Clear last_buffer_dequeued flag
for DEC_CMD_START"

### 1. Commit Message Analysis

The commit message clearly describes a bug fix:
- When `V4L2_DEC_CMD_START` is used to handle dynamic source changes, an
  implicit decoder drain is triggered
- The drain sets the `last_buffer_dequeued` flag
- This flag is never cleared, which **breaks the subsequent decoding
  flow**
- The fix clears the flag when `DEC_CMD_START` is issued, allowing
  decoding to continue

Keywords: "need to clear it to continue the following decoding flow" —
this indicates the decoder becomes stuck/non-functional without this
fix.

### 2. Code Change Analysis

The change is a **single line addition**:
```c
vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx));
```

This is added in the `V4L2_DEC_CMD_START` case of `vdec_decoder_cmd()`,
right after the existing `vdec_cmd_start(inst)` call.

**What the bug mechanism is:**
- `last_buffer_dequeued` is a flag in the vb2 (Video Buffer 2) queue
  framework
- When set, it signals that the last buffer has been dequeued and no
  more buffers will come
- During dynamic source change handling, an implicit drain sets this
  flag
- Without clearing it on `DEC_CMD_START`, the capture queue thinks it's
  done and won't deliver any more buffers
- This effectively **breaks video decoding** after a source change event

**The fix uses well-known V4L2 APIs:**
- `vb2_clear_last_buffer_dequeued()` — standard V4L2 helper function
- `v4l2_m2m_get_dst_vq()` — standard M2M helper to get the destination
  (capture) queue

### 3. Classification

This is a **clear bug fix**. Without this patch, the amphion video
decoder becomes non-functional after handling a dynamic source change
event. The decoder gets stuck because the capture queue won't deliver
any more buffers.

### 4. Scope and Risk Assessment

- **Lines changed:** 1 line added
- **Files touched:** 1 file (`drivers/media/platform/amphion/vdec.c`)
- **Complexity:** Extremely low — calls a standard framework function
- **Risk of regression:** Very low — this is a targeted fix in a
  specific command handler, using a well-established API
- **Subsystem:** Media/V4L2 driver for NXP amphion video decoder

### 5. User Impact

- **Who is affected:** Users of NXP i.MX8 SoCs (common in
  embedded/industrial applications) that use the amphion video decoder
- **Severity:** The bug causes the video decoder to stop working after a
  dynamic source change — this is a functional failure, not a minor
  issue
- **Real-world scenario:** Dynamic source changes happen when video
  stream parameters change mid-stream (resolution change, codec
  reconfiguration). This is a normal operational scenario in media
  playback.

### 6. Stability Indicators

- **Reviewed-by:** Nicolas Dufresne (Collabora, well-known V4L2
  contributor)
- **Signed-off-by:** Hans Verkuil (V4L2 subsystem maintainer)
- The patch is obviously correct — it follows the same pattern used by
  other V4L2 M2M drivers

### 7. Dependency Check

- The fix uses `vb2_clear_last_buffer_dequeued()` and
  `v4l2_m2m_get_dst_vq()`, which are long-standing V4L2 framework
  functions available in all stable trees that contain the amphion
  driver
- No dependency on other patches — this is a self-contained one-line fix

### Summary

This is a textbook stable backport candidate:
- **Obviously correct:** Single line calling a standard API at the right
  place
- **Fixes a real bug:** Decoder stops working after dynamic source
  change
- **Small and contained:** 1 line, 1 file
- **No new features:** Just fixes existing functionality
- **Low risk:** Uses established framework API, reviewed by subsystem
  maintainer
- **Real user impact:** Video decoding breaks without it

**YES**

 drivers/media/platform/amphion/vdec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index c0d2aabb9e0e3..f25dbcebdccf6 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -724,6 +724,7 @@ static int vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd
 	switch (cmd->cmd) {
 	case V4L2_DEC_CMD_START:
 		vdec_cmd_start(inst);
+		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx));
 		break;
 	case V4L2_DEC_CMD_STOP:
 		vdec_cmd_stop(inst);
-- 
2.51.0


