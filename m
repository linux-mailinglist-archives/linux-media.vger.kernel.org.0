Return-Path: <linux-media+bounces-52804-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF33GiHLj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52804-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:08:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 913AD13A88F
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4929B302F269
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AD92236F2;
	Sat, 14 Feb 2026 01:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxVspJaD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6711F1EF0B0;
	Sat, 14 Feb 2026 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031222; cv=none; b=LaIVv4HxNh7/b2MZpysJuWrEQP1AI/rxnXrjKKZ+kvZNLR59cWGH0p2F+Yh3lZSOJg8vbtvphKbrBRY9Q2TwasphrLK/USZ9YCC2ZOnMGOhIP9r9U6S7xTxX5rdPtTb480lYKkI8Q5EdZrorphIIPGf5WV7kpgbYK0/m3qjGOH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031222; c=relaxed/simple;
	bh=0WVbNSl7QGeHWPtDRFYhwzfswcdEmBqRi9bwTCyOnJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrSY1BW1LmGQqZunKf0ffR04N4pyjLgRS0Nfxsf7GHQQ2xaGmjHFNwvwyDLcH00T/mMlXBr7M80z4Mzm6lE73qMZyQgHUKe0phz+g3rXgFZj2i5WLY1KS8PJ3oqCWbCarEAU7v44WgPDDs26vfIdMFDCCVmrVXCQ9dPtKzhgp2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxVspJaD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BC7C116C6;
	Sat, 14 Feb 2026 01:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031222;
	bh=0WVbNSl7QGeHWPtDRFYhwzfswcdEmBqRi9bwTCyOnJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GxVspJaDV+XX8srMFHPxXFNKJmvjGKrEHhdBoadJ7EM0aKBzp5i7MDFm89wvKzJi1
	 hUh8vzGt5Tguo6eCyD4lLKLPUQXoyeTrra8qq/XHAZ0UqcI/y4ASYkEHYTnoUHkCHa
	 Kaleq0U15XyY9QZl6FKX9uqzEG+g10L7kgMZhZI2L0f6chp4vmbA5fBVXOj9c4J4TB
	 ciCuX5KUsJ9CjZSQX8JlVfOTGDq9O+Wvg8XM1XmOB7eqRoUXGFV9A1gq7GbIxhezmm
	 T/cUKzkelZcmVIvJLiwGs7Vl36vew2q31th9RQExi/11oxjEPf+cxnVNV6Zvy02AAi
	 xCZTpfJQxT+9g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	neil.armstrong@linaro.org,
	mingo@kernel.org,
	tglx@kernel.org,
	yelangyan@huaqin.corp-partner.google.com,
	rongqianfeng@vivo.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-5.10] media: dvb-core: dmxdevfilter must always flush bufs
Date: Fri, 13 Feb 2026 19:59:49 -0500
Message-ID: <20260214010245.3671907-109-sashal@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52804-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[xs4all.nl,kernel.org,linaro.org,huaqin.corp-partner.google.com,vivo.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 913AD13A88F
X-Rspamd-Action: no action

From: Hans Verkuil <hverkuil@xs4all.nl>

[ Upstream commit c4e620eccbef76aa5564ebb295e23d6540e27215 ]

Currently the buffers are being filled until full, which works fine
for the transport stream, but not when reading sections, those have
to be returned to userspace immediately, otherwise dvbv5-scan will
just wait forever.

Add a 'flush' argument to dvb_vb2_fill_buffer to indicate whether
the buffer must be flushed or wait until it is full.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### 1. Commit Message Analysis

The commit clearly describes a functional bug: DVB section data is
buffered until the VB2 buffer is completely full, but sections are
discrete units that must be delivered immediately. The result is that
`dvbv5-scan` (a standard DVB channel scanning utility from v4l-utils)
**hangs forever** when using the VB2 mmap path.

### 2. Code Change Analysis

The bug is in `dvb_vb2_fill_buffer()` at line 309 of `dvb_vb2.c`:

```309:309:drivers/media/dvb-core/dvb_vb2.c
        if (ctx->nonblocking && ctx->buf) {
```

This condition flushes partially-filled buffers only when the file
descriptor was opened with `O_NONBLOCK`. The `nonblocking` field is set
during `dvb_vb2_init()` from `file->f_flags & O_NONBLOCK`:

```819:820:drivers/media/dvb-core/dmxdev.c
        dvb_vb2_init(&dmxdevfilter->vb2_ctx, "demux_filter",
                     file->f_flags & O_NONBLOCK);
```

**The fundamental problem**: The decision to flush a partially-filled
buffer should depend on the **type of data** (section vs. transport
stream), not on the **blocking mode** of the file descriptor. DVB
sections are discrete protocol data units that must be returned to
userspace immediately. Transport streams are continuous, so waiting
until the buffer is full is correct.

**Bug mechanism**:
1. Application opens demux device in blocking mode (normal, no
   `O_NONBLOCK`)
2. `ctx->nonblocking` is set to 0
3. Section callback delivers a complete section to
   `dvb_vb2_fill_buffer()`
4. Section data is smaller than the full VB2 buffer, so `ctx->remain >
   0`
5. The `if (ctx->nonblocking && ctx->buf)` check fails (nonblocking=0)
6. Buffer is NOT flushed to userspace
7. Application blocks forever waiting for data that's already been
   received

**The fix** adds a `bool flush` parameter to `dvb_vb2_fill_buffer()`:
- `dvb_dmxdev_section_callback()` passes `flush=true` (sections: flush
  immediately)
- `dvb_dmxdev_ts_callback()` passes `flush=false` (transport stream:
  wait until full)
- The condition becomes `if (flush && ctx->buf)` - semantically correct

The `nonblocking` field is NOT removed - it's still used in
`dvb_vb2_dqbuf()` (line 415) for its legitimate purpose of controlling
blocking dequeue behavior.

### 3. Classification

This is a **clear bug fix** - it fixes a condition where a standard
userspace application (`dvbv5-scan`) hangs indefinitely. The existing
behavior was simply wrong: flushing decisions were tied to an unrelated
flag.

### 4. Scope and Risk Assessment

- **Files changed**: 3 (dmxdev.c, dvb_vb2.c, dvb_vb2.h)
- **Lines changed**: ~15 (very small)
- **Only 2 callers** of `dvb_vb2_fill_buffer()`, both updated
- **Internal API only** - no userspace-visible changes
- **TS path unchanged** - `flush=false` preserves existing behavior for
  transport streams
- **Section path fixed** - `flush=true` ensures proper delivery
- **CONFIG_DVB_MMAP only** - behind experimental Kconfig (default N),
  limiting blast radius
- **Risk**: Very low - the change cannot regress TS behavior, and
  section behavior goes from "broken" to "working"

### 5. User Impact

For users who have `CONFIG_DVB_MMAP` enabled and use `dvbv5-scan` or
similar section-reading applications via the VB2 path in blocking mode,
this is a **complete showstopper** - the application hangs forever.
Without this fix, the VB2 mmap path is fundamentally broken for section
data.

### 6. Stability Indicators

- **Author**: Hans Verkuil - V4L2/DVB subsystem maintainer, extremely
  well-known and trusted
- **Sign-off**: Mauro Carvalho Chehab - overall media subsystem
  maintainer
- **Self-contained**: No dependencies on other patches
- **Bug exists since**: The DVB VB2 feature was introduced in kernel
  4.20 (commit 57868acc369a), and this bug has existed since then

### 7. Dependency Check

The patch applies cleanly to the current tree. There are no dependencies
on other uncommitted patches. All callers are updated within the same
patch.

### Conclusion

This commit fixes a real, user-impacting bug where DVB section data is
never delivered to userspace through the VB2 mmap path when the file
descriptor is opened in blocking mode. The fix is small, self-contained,
obviously correct, and authored by the subsystem maintainer. The risk of
regression is minimal since the TS path behavior is preserved unchanged
and the section path goes from "broken" to "correct." While it only
affects `CONFIG_DVB_MMAP` (experimental), for users who enable it, the
bug is a complete showstopper.

**YES**

 drivers/media/dvb-core/dmxdev.c  | 8 ++++----
 drivers/media/dvb-core/dvb_vb2.c | 5 +++--
 include/media/dvb_vb2.h          | 6 ++++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 8c6f5aafda1d6..17184b3674904 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -397,11 +397,11 @@ static int dvb_dmxdev_section_callback(const u8 *buffer1, size_t buffer1_len,
 	if (dvb_vb2_is_streaming(&dmxdevfilter->vb2_ctx)) {
 		ret = dvb_vb2_fill_buffer(&dmxdevfilter->vb2_ctx,
 					  buffer1, buffer1_len,
-					  buffer_flags);
+					  buffer_flags, true);
 		if (ret == buffer1_len)
 			ret = dvb_vb2_fill_buffer(&dmxdevfilter->vb2_ctx,
 						  buffer2, buffer2_len,
-						  buffer_flags);
+						  buffer_flags, true);
 	} else {
 		ret = dvb_dmxdev_buffer_write(&dmxdevfilter->buffer,
 					      buffer1, buffer1_len);
@@ -452,10 +452,10 @@ static int dvb_dmxdev_ts_callback(const u8 *buffer1, size_t buffer1_len,
 
 	if (dvb_vb2_is_streaming(ctx)) {
 		ret = dvb_vb2_fill_buffer(ctx, buffer1, buffer1_len,
-					  buffer_flags);
+					  buffer_flags, false);
 		if (ret == buffer1_len)
 			ret = dvb_vb2_fill_buffer(ctx, buffer2, buffer2_len,
-						  buffer_flags);
+						  buffer_flags, false);
 	} else {
 		if (buffer->error) {
 			spin_unlock(&dmxdevfilter->dev->lock);
diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 29edaaff7a5c9..7444bbc2f24d9 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -249,7 +249,8 @@ int dvb_vb2_is_streaming(struct dvb_vb2_ctx *ctx)
 
 int dvb_vb2_fill_buffer(struct dvb_vb2_ctx *ctx,
 			const unsigned char *src, int len,
-			enum dmx_buffer_flags *buffer_flags)
+			enum dmx_buffer_flags *buffer_flags,
+			bool flush)
 {
 	unsigned long flags = 0;
 	void *vbuf = NULL;
@@ -306,7 +307,7 @@ int dvb_vb2_fill_buffer(struct dvb_vb2_ctx *ctx,
 		}
 	}
 
-	if (ctx->nonblocking && ctx->buf) {
+	if (flush && ctx->buf) {
 		vb2_set_plane_payload(&ctx->buf->vb, 0, ll);
 		vb2_buffer_done(&ctx->buf->vb, VB2_BUF_STATE_DONE);
 		list_del(&ctx->buf->list);
diff --git a/include/media/dvb_vb2.h b/include/media/dvb_vb2.h
index 8cb88452cd6c2..0fbbfc65157e6 100644
--- a/include/media/dvb_vb2.h
+++ b/include/media/dvb_vb2.h
@@ -124,7 +124,7 @@ static inline int dvb_vb2_release(struct dvb_vb2_ctx *ctx)
 	return 0;
 };
 #define dvb_vb2_is_streaming(ctx) (0)
-#define dvb_vb2_fill_buffer(ctx, file, wait, flags) (0)
+#define dvb_vb2_fill_buffer(ctx, file, wait, flags, flush) (0)
 
 static inline __poll_t dvb_vb2_poll(struct dvb_vb2_ctx *ctx,
 				    struct file *file,
@@ -166,10 +166,12 @@ int dvb_vb2_is_streaming(struct dvb_vb2_ctx *ctx);
  * @buffer_flags:
  *		pointer to buffer flags as defined by &enum dmx_buffer_flags.
  *		can be NULL.
+ * @flush:	flush the buffer, even if it isn't full.
  */
 int dvb_vb2_fill_buffer(struct dvb_vb2_ctx *ctx,
 			const unsigned char *src, int len,
-			enum dmx_buffer_flags *buffer_flags);
+			enum dmx_buffer_flags *buffer_flags,
+			bool flush);
 
 /**
  * dvb_vb2_poll - Wrapper to vb2_core_streamon() for Digital TV
-- 
2.51.0


