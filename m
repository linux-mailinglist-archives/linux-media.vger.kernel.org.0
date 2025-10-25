Return-Path: <linux-media+bounces-45554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 206FAC0970D
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 417A334E6C6
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700643064AE;
	Sat, 25 Oct 2025 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6/joj23"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC9630B528;
	Sat, 25 Oct 2025 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409310; cv=none; b=OhkOlbmBWj72vfoBsnQbOLPGh4OgcUkFipj0btmIoo4TSU7hyPGDm2m2/1QRhS415mMMS3tEZguJ8SHSHsronObmxZN0cqSG2aTlKnJgw44iEYqq0vmEfQlP4tzcfdg3QjtbqKmnx3Yk7A5GZZ9HX/BBLOEvfo67gkwnPlwdD/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409310; c=relaxed/simple;
	bh=q2fq+mYozaXNTRsK8CMvFPDO9/5mWPWxJu5FpQgEXMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wfmf1Q74Ji/RxA4mviy6Uh5FMYBmHgpDHsDFbVvcow8mmG4W3b2NeJ8RVut6o35nH5P2e+WXz5oQJs1e9TXKHEa65eY+b7Kgq6eXweuhLiKD+9fiHTBRkl6jFIGPjrARFUZSPDN/vHHHQJJdKtQwQS/HjpN1lQDFkzPTn/AFJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6/joj23; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30597C2BCB5;
	Sat, 25 Oct 2025 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409310;
	bh=q2fq+mYozaXNTRsK8CMvFPDO9/5mWPWxJu5FpQgEXMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6/joj23equ8n95INHks2A5+xH5P3cJN4SYpdhgVV531RLQwFy0hz7FRix1zgHxIg
	 63iCHwzn6gsBassK/no8pjD08HwjGS6E+6F0uyc9kEkztIbKzJRUxkQadzBoJ4hcew
	 wMsl5gFaLNBg2sgTUhoTMWu7tP9uRbXRIqN2P7T0R6KlS/efM32mX4jF5FxOPq7Xe8
	 BI7oZjXxhzadb1j/66kos/lWIJifhjnYS/HEdzynsMlgrgAAN2BbhluMWXfs0BBf+O
	 E4rWnNhSPztTGOzS4cj40Si666Btsowo98AdzPINvbyYEomCimB+NRSiH/mR8lhKj4
	 Pk0orl281k6WQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	awalls@md.metrocast.net,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] media: pci: ivtv: Don't create fake v4l2_fh
Date: Sat, 25 Oct 2025 11:58:26 -0400
Message-ID: <20251025160905.3857885-275-sashal@kernel.org>
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[ Upstream commit cc6e8d1ccea792d8550428e0831e3a35b0ccfddc ]

The ivtv driver has a structure named ivtv_open_id that models an open
file handle for the device. It embeds a v4l2_fh instance for file
handles that correspond to a V4L2 video device, and stores a pointer to
that v4l2_fh in struct ivtv_stream to identify which open file handle
owns a particular stream.

In addition to video devices, streams can be owned by ALSA PCM devices.
Those devices do not make use of the v4l2_fh instance for obvious
reasons, but the snd_ivtv_pcm_capture_open() function still initializes
a "fake" v4l2_fh for the sole purpose of using it as an open file handle
identifier. The v4l2_fh is not properly destroyed when the ALSA PCM
device is closed, leading to possible resource leaks.

Fortunately, the v4l2_fh instance pointed to by ivtv_stream is not
accessed, only the pointer value is used for comparison. Replace it with
a pointer to the ivtv_open_id structure that embeds the v4l2_fh, and
don't initialize the v4l2_fh for ALSA PCM devices.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Why this is a good stable backport
- Fixes a real bug: ALSA PCM open in ivtv initialized a fake v4l2_fh
  that was never properly destroyed on success or on “already streaming”
  early return, causing a kernel memory leak across repeated open/close
  cycles.
- Small, contained change: confines to ivtv driver internals (media:
  pci: ivtv), with no API/ABI changes to V4L2/ALSA frameworks.
- Behavior-preserving: the driver used the v4l2_fh pointer solely as an
  opaque owner identifier (pointer equality/non-NULL), never
  dereferencing it. Switching to an ivtv_open_id pointer preserves
  semantics without allocating any v4l2_fh resources.
- Low regression risk: only owner-tracking logic and ALSA open path are
  touched; no architectural changes; no critical core subsystems
  affected.
- User impact: prevents kernel memory leakage reachable by regular users
  via the ALSA PCM device node.

What the patch changes (with code evidence)
- Stop creating a fake v4l2_fh for ALSA PCM open:
  - Removes `v4l2_fh_init(&item.fh, &s->vdev)` in ALSA open, avoiding
    allocation that was never exited in the success/streaming path.
  - Evidence: drivers/media/pci/ivtv/ivtv-alsa-pcm.c:151
- Switch stream owner tracking from v4l2_fh* to ivtv_open_id*:
  - Struct change: `struct ivtv_stream` replaces `struct v4l2_fh *fh;`
    with `struct ivtv_open_id *id;`
  - Evidence: drivers/media/pci/ivtv/ivtv-driver.h:334
  - Adds forward decl for `struct ivtv_open_id;` so the pointer type can
    be used earlier in the header (part of the change).
- Update owner comparisons and checks accordingly:
  - ivtv_claim_stream now compares `s->id == id` instead of `s->fh ==
    &id->fh`, assigns `s->id = id`, and handles VBI special-case the
    same way.
  - Evidence: drivers/media/pci/ivtv/ivtv-fileops.c:42, 46–51, 59
  - ivtv_release_stream clears `s->id = NULL` (was `s->fh = NULL`) and
    uses `s_vbi->id` for “still claimed” checks.
  - Evidence: drivers/media/pci/ivtv/ivtv-fileops.c:97, 129
  - ivtv_read initialization check uses `s->id == NULL` instead of
    `s->fh == NULL`.
  - Evidence: drivers/media/pci/ivtv/ivtv-fileops.c:362
  - ivtv_stop_capture VBI-internal use case sets `s->id = NULL` instead
    of `s->fh = NULL`.
  - Evidence: drivers/media/pci/ivtv/ivtv-fileops.c:834
  - ivtv_v4l2_close compares `s->id != id` instead of `s->fh != &id->fh`
    to detect ownership.
  - Evidence: drivers/media/pci/ivtv/ivtv-fileops.c:918
  - ivtv-irq VBI data handling checks `s->id == NULL` (was `s->fh ==
    NULL`) to decide whether to free buffers if no owner, and uses
    `s->id` for wakeups.
  - Evidence: drivers/media/pci/ivtv/ivtv-irq.c:301–312 (check), 333–334
    (wake_up)
- Remove the now-unneeded v4l2_fh exit on the ALSA open fail path:
  - Since we no longer init a fake fh, there’s nothing to exit on
    -EBUSY.
  - Evidence: drivers/media/pci/ivtv/ivtv-alsa-pcm.c:151 (removal
    implies corresponding exit removal)

Why this fixes the leak
- Before: `snd_ivtv_pcm_capture_open()` created `item.fh` via
  `v4l2_fh_init` and then:
  - On successful claim and subsequent returns (including the “already
    streaming” fast path), there was no matching `v4l2_fh_exit`, leaking
    internal resources of `v4l2_fh`. See initialization at
    drivers/media/pci/ivtv/ivtv-alsa-pcm.c:151 and early return in the
    streaming case just after claim.
- After: There is no `v4l2_fh_init` for ALSA opens; the driver tracks
  ownership with a raw `ivtv_open_id *` pointer whose address is used
  only as a token (never dereferenced), eliminating the need for any
  initialization or teardown on the ALSA path.

Risk and side effects
- Preserved semantics: s->fh was never dereferenced; it was used only
  for pointer equality and non-NULL checks. Replacing with s->id keeps
  those semantics while removing the artificial fh lifecycle.
- Internal-only: Changes are contained within ivtv; no external APIs
  affected. Struct layout changed only internally to the driver.
- Concurrency/logic continuity: The VBI special-case claim/release and
  wakeup conditions are updated consistently to use s->id; read path and
  IRQ paths keep identical logic, just different pointer type.

Stable criteria check
- Important bugfix: addresses a user-visible kernel memory leak.
- Minimal, localized change: touches only ivtv, no cross-subsystem
  churn.
- No new features or architectural changes.
- Low regression risk, with clear correctness rationale.
- No explicit “Cc: stable” tag in the message, but it meets the stable
  rules for critical bug fixes with minimal risk.

Backport notes
- Ensure all s->fh uses in ivtv are converted to s->id. In the current
  tree, these occur at:
  - drivers/media/pci/ivtv/ivtv-fileops.c:42, 46–51, 59, 97, 129, 362,
    834, 918
  - drivers/media/pci/ivtv/ivtv-irq.c:308, 333
  - drivers/media/pci/ivtv/ivtv-driver.h:334 (field)
- No other ivtv files refer to s->fh; remaining fh usage is via id->fh
  for V4L2 event/poll mechanisms and is unchanged.
- The forward declaration `struct ivtv_open_id;` must be added before
  `struct ivtv_stream` in ivtv-driver.h to avoid compile errors.

Conclusion
- This commit fixes a resource leak in a safe, contained way without
  changing behavior, and is suitable for backporting to stable kernel
  trees.

 drivers/media/pci/ivtv/ivtv-alsa-pcm.c |  2 --
 drivers/media/pci/ivtv/ivtv-driver.h   |  3 ++-
 drivers/media/pci/ivtv/ivtv-fileops.c  | 18 +++++++++---------
 drivers/media/pci/ivtv/ivtv-irq.c      |  4 ++--
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-alsa-pcm.c b/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
index 8f346d7da9c8d..269a799ec046c 100644
--- a/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
+++ b/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
@@ -148,14 +148,12 @@ static int snd_ivtv_pcm_capture_open(struct snd_pcm_substream *substream)
 
 	s = &itv->streams[IVTV_ENC_STREAM_TYPE_PCM];
 
-	v4l2_fh_init(&item.fh, &s->vdev);
 	item.itv = itv;
 	item.type = s->type;
 
 	/* See if the stream is available */
 	if (ivtv_claim_stream(&item, item.type)) {
 		/* No, it's already in use */
-		v4l2_fh_exit(&item.fh);
 		snd_ivtv_unlock(itvsc);
 		return -EBUSY;
 	}
diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index a6ffa99e16bc6..83818048f7fe4 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -322,6 +322,7 @@ struct ivtv_queue {
 };
 
 struct ivtv;				/* forward reference */
+struct ivtv_open_id;
 
 struct ivtv_stream {
 	/* These first four fields are always set, even if the stream
@@ -331,7 +332,7 @@ struct ivtv_stream {
 	const char *name;		/* name of the stream */
 	int type;			/* stream type */
 
-	struct v4l2_fh *fh;		/* pointer to the streaming filehandle */
+	struct ivtv_open_id *id;	/* pointer to the streaming ivtv_open_id */
 	spinlock_t qlock;		/* locks access to the queues */
 	unsigned long s_flags;		/* status flags, see above */
 	int dma;			/* can be PCI_DMA_TODEVICE, PCI_DMA_FROMDEVICE or PCI_DMA_NONE */
diff --git a/drivers/media/pci/ivtv/ivtv-fileops.c b/drivers/media/pci/ivtv/ivtv-fileops.c
index cfa28d0355863..1ac8d691df5cd 100644
--- a/drivers/media/pci/ivtv/ivtv-fileops.c
+++ b/drivers/media/pci/ivtv/ivtv-fileops.c
@@ -39,16 +39,16 @@ int ivtv_claim_stream(struct ivtv_open_id *id, int type)
 
 	if (test_and_set_bit(IVTV_F_S_CLAIMED, &s->s_flags)) {
 		/* someone already claimed this stream */
-		if (s->fh == &id->fh) {
+		if (s->id == id) {
 			/* yes, this file descriptor did. So that's OK. */
 			return 0;
 		}
-		if (s->fh == NULL && (type == IVTV_DEC_STREAM_TYPE_VBI ||
+		if (s->id == NULL && (type == IVTV_DEC_STREAM_TYPE_VBI ||
 					 type == IVTV_ENC_STREAM_TYPE_VBI)) {
 			/* VBI is handled already internally, now also assign
 			   the file descriptor to this stream for external
 			   reading of the stream. */
-			s->fh = &id->fh;
+			s->id = id;
 			IVTV_DEBUG_INFO("Start Read VBI\n");
 			return 0;
 		}
@@ -56,7 +56,7 @@ int ivtv_claim_stream(struct ivtv_open_id *id, int type)
 		IVTV_DEBUG_INFO("Stream %d is busy\n", type);
 		return -EBUSY;
 	}
-	s->fh = &id->fh;
+	s->id = id;
 	if (type == IVTV_DEC_STREAM_TYPE_VBI) {
 		/* Enable reinsertion interrupt */
 		ivtv_clear_irq_mask(itv, IVTV_IRQ_DEC_VBI_RE_INSERT);
@@ -94,7 +94,7 @@ void ivtv_release_stream(struct ivtv_stream *s)
 	struct ivtv *itv = s->itv;
 	struct ivtv_stream *s_vbi;
 
-	s->fh = NULL;
+	s->id = NULL;
 	if ((s->type == IVTV_DEC_STREAM_TYPE_VBI || s->type == IVTV_ENC_STREAM_TYPE_VBI) &&
 		test_bit(IVTV_F_S_INTERNAL_USE, &s->s_flags)) {
 		/* this stream is still in use internally */
@@ -126,7 +126,7 @@ void ivtv_release_stream(struct ivtv_stream *s)
 		/* was already cleared */
 		return;
 	}
-	if (s_vbi->fh) {
+	if (s_vbi->id) {
 		/* VBI stream still claimed by a file descriptor */
 		return;
 	}
@@ -359,7 +359,7 @@ static ssize_t ivtv_read(struct ivtv_stream *s, char __user *ubuf, size_t tot_co
 	size_t tot_written = 0;
 	int single_frame = 0;
 
-	if (atomic_read(&itv->capturing) == 0 && s->fh == NULL) {
+	if (atomic_read(&itv->capturing) == 0 && s->id == NULL) {
 		/* shouldn't happen */
 		IVTV_DEBUG_WARN("Stream %s not initialized before read\n", s->name);
 		return -EIO;
@@ -831,7 +831,7 @@ void ivtv_stop_capture(struct ivtv_open_id *id, int gop_end)
 		     id->type == IVTV_ENC_STREAM_TYPE_VBI) &&
 		    test_bit(IVTV_F_S_INTERNAL_USE, &s->s_flags)) {
 			/* Also used internally, don't stop capturing */
-			s->fh = NULL;
+			s->id = NULL;
 		}
 		else {
 			ivtv_stop_v4l2_encode_stream(s, gop_end);
@@ -915,7 +915,7 @@ int ivtv_v4l2_close(struct file *filp)
 	v4l2_fh_exit(fh);
 
 	/* Easy case first: this stream was never claimed by us */
-	if (s->fh != &id->fh)
+	if (s->id != id)
 		goto close_done;
 
 	/* 'Unclaim' this stream */
diff --git a/drivers/media/pci/ivtv/ivtv-irq.c b/drivers/media/pci/ivtv/ivtv-irq.c
index 4d63daa01eed2..078d9cd77c710 100644
--- a/drivers/media/pci/ivtv/ivtv-irq.c
+++ b/drivers/media/pci/ivtv/ivtv-irq.c
@@ -305,7 +305,7 @@ static void dma_post(struct ivtv_stream *s)
 			ivtv_process_vbi_data(itv, buf, 0, s->type);
 			s->q_dma.bytesused += buf->bytesused;
 		}
-		if (s->fh == NULL) {
+		if (s->id == NULL) {
 			ivtv_queue_move(s, &s->q_dma, NULL, &s->q_free, 0);
 			return;
 		}
@@ -330,7 +330,7 @@ static void dma_post(struct ivtv_stream *s)
 		set_bit(IVTV_F_I_HAVE_WORK, &itv->i_flags);
 	}
 
-	if (s->fh)
+	if (s->id)
 		wake_up(&s->waitq);
 }
 
-- 
2.51.0


