Return-Path: <linux-media+bounces-52795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKAaHDrKj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:04:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEA913A5B5
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 327AB300D4DC
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D0B21A453;
	Sat, 14 Feb 2026 01:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2zdPFmS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46BA3EBF2C;
	Sat, 14 Feb 2026 01:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031074; cv=none; b=Rk5n0pH+yyrl0i+ItB2YsG491ldtSaIvPRO9y+oVxNAtA5dVzBwZwy+k9Se+pbs7g+l0eUk0AY9JKPgnQkfHPUl9Ju3T50N/zw58aXlcus0B9uZ3W3BiknsyfpYJIHZKXTPD3DbpACz4s3gYcly7js9AJqwGrKkSh/Fm9t1go8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031074; c=relaxed/simple;
	bh=xLeqN4gDEBl1k1PAAkY5M3ePyEXyeR2Wgm9sP3eQKTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6nVl9lWDDIL1FkwikPP2EEYNX2tgvrA1paPdaiLGMQj+dSDgxh7l6evb8/ogeBvdLxj5wUHWwxspX6g2vtlIetcgSv2cs1hNNwcwoTO//+cJ0fLhoK5jj4LT4DM7uukvSFaHRiVgMG+MoYY//8DDP7SfxdosHKVSlkKERPl3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2zdPFmS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C0BC16AAE;
	Sat, 14 Feb 2026 01:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031074;
	bh=xLeqN4gDEBl1k1PAAkY5M3ePyEXyeR2Wgm9sP3eQKTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V2zdPFmSH07clp+3JG9ONbxUEuIoXsx6L27Hk/aUyzfq+ygzeoU4hch/s8GVbYqh9
	 cnbCP1tnFXBgLCCtT2ShGs6AC9Q+bW0AtVwl8Ejc5vDwBEtqoETBWgErTMwWHonamR
	 0bh7nYExtMSN6ZLGdD6mdHus7wqF31vi11VK/BeDXPqIa2y/utcanL8dZ7G/ur1mQk
	 rdiu62y1Zgi5Rip2FFZrsl4EdSmjdWz3SWFytUEQY+AKGxlNxFnz+ZAGXkZG0BOQQJ
	 kMBJDuSUvT7DHmDyKOkMgcy22GPGD5mUcIbVz+DRz7cs/XQ3e0Z3MtFtC6qFoE7iB5
	 dzRWzF4xDFGSw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	bingbu.cao@intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] media: ipu6: Ensure stream_mutex is acquired when dealing with node list
Date: Fri, 13 Feb 2026 19:58:50 -0500
Message-ID: <20260214010245.3671907-50-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52795-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 5BEA913A5B5
X-Rspamd-Action: no action

From: Sakari Ailus <sakari.ailus@linux.intel.com>

[ Upstream commit 779bdaad2abf718fb8116839e818e58852874b4d ]

The ipu6 isys driver maintains the list of video buffer queues related to
a stream (in ipu6 context streams on the same CSI-2 virtual channel) and
this list is modified through VIDIOC_STREAMON and VIDIOC_STREAMOFF IOCTLs.
Ensure the common mutex is acquired when accessing the linked list, i.e.
the isys device context's stream_mutex.

Add a lockdep assert to ipu6_isys_get_buffer_list() and switch to guard()
while at it as the error handling becomes more simple this way.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of commit: "media: ipu6: Ensure stream_mutex is acquired
when dealing with node list"

### 1. COMMIT MESSAGE ANALYSIS

The commit message clearly describes a **synchronization fix**: the ipu6
ISYS driver maintains a linked list of video buffer queues related to a
stream, and this list is modified through `STREAMON`/`STREAMOFF` ioctls.
The list was being accessed without proper mutex protection, creating a
race condition. The fix ensures `stream_mutex` is held when accessing
the linked list.

Key phrases: "Ensure the common mutex is acquired when accessing the
linked list" — this is a classic race condition fix.

### 2. CODE CHANGE ANALYSIS

The commit makes three distinct changes:

**Change 1: lockdep_assert_held() in buffer_list_get()**
```c
+       lockdep_assert_held(&stream->mutex);
```
This adds a runtime assertion that `stream->mutex` is held when
`buffer_list_get()` is called. This is a debugging aid that documents
the locking requirement. The function iterates over `stream->queues` (a
linked list) via `list_for_each_entry(aq, &stream->queues, node)`, which
needs protection.

**Change 2: guard(mutex) in ipu6_isys_stream_start()**
```c
- mutex_lock(&stream->isys->stream_mutex);
+       guard(mutex)(&stream->isys->stream_mutex);
        ret = ipu6_isys_video_set_streaming(av, 1, bl);
- mutex_unlock(&stream->isys->stream_mutex);
```
This converts a manual lock/unlock pair to a `guard(mutex)` (scoped
lock), which extends the lock's lifetime through the entire function
scope. This is a **critical fix**: previously, `stream_mutex` was
released immediately after `ipu6_isys_video_set_streaming()`, but then
`buffer_list_get()` was called in the `do...while` loop below without
holding `stream_mutex`. Since `buffer_list_get()` iterates over
`stream->queues` (a linked list that can be modified by
`stop_streaming`), this was a real race condition.

The `buffer_list_get()` now has `lockdep_assert_held(&stream->mutex)` —
but wait, it asserts `stream->mutex`, not `stream->isys->stream_mutex`.
Let me look more carefully...

Actually, looking at the `buffer_list_get` function, it asserts
`stream->mutex`, while the `ipu6_isys_stream_start` acquires
`stream->isys->stream_mutex`. These are different mutexes. The
`stream->mutex` would need to be held by the caller of
`ipu6_isys_stream_start()`. The `stream_mutex` change in
`ipu6_isys_stream_start` is about protecting the `list_del` in
`stop_streaming`.

**Change 3: Moving list_del() inside stream_mutex in stop_streaming()**
```c
        mutex_lock(&av->isys->stream_mutex);
        if (stream->nr_streaming == stream->nr_queues &&
stream->streaming)
                ipu6_isys_video_set_streaming(av, 0, NULL);
+       list_del(&aq->node);
        mutex_unlock(&av->isys->stream_mutex);

        stream->nr_streaming--;
- list_del(&aq->node);
```
This is **the most important change**. Previously, `list_del(&aq->node)`
was called **outside** the `stream_mutex` protection. This means if one
thread is in `stop_streaming` doing `list_del()` while another thread is
in `ipu6_isys_stream_start` iterating over the list (in
`buffer_list_get`), there's a **use-after-free or list corruption race
condition**.

By moving `list_del()` inside the `stream_mutex` lock, and extending
`stream_mutex` in `ipu6_isys_stream_start` to cover the
`buffer_list_get` calls, the list is now properly protected.

### 3. BUG CLASSIFICATION

This is a **race condition fix** on a linked list that is concurrently
modified (via `list_del`) and read (via `list_for_each_entry`). This
class of bug can cause:
- **List corruption** (corrupted forward/backward pointers)
- **Use-after-free** (iterating over a node that was just removed and
  potentially freed)
- **Kernel crash/oops** (dereferencing corrupted pointers)

The race window is between `STREAMON` and `STREAMOFF` ioctls, which can
be triggered from userspace on different file descriptors of the same
stream.

### 4. SCOPE AND RISK ASSESSMENT

- **Files changed**: 1 file (`ipu6-isys-queue.c`)
- **Lines changed**: Very small — adding a lockdep assert, converting
  lock/unlock to guard, moving one `list_del` inside an existing lock
  scope
- **Risk**: LOW — the changes are straightforward synchronization fixes:
  - The lockdep assert is purely a debugging check
  - The guard(mutex) extends lock scope (safe — just holds lock longer)
  - Moving list_del inside existing lock scope is a well-understood
    pattern
- **Subsystem**: Intel IPU6 camera driver (media/pci/intel/ipu6) —
  relatively contained

### 5. DEPENDENCY CHECK

The `guard(mutex)` macro requires `linux/cleanup.h` which was added in
Linux 6.5. The IPU6 driver was added relatively recently. Need to check
if the affected code exists in stable trees.

The IPU6 driver (`drivers/media/pci/intel/ipu6/`) was merged in the 6.10
timeframe. So this would only apply to 6.12.y and possibly 6.11.y stable
trees (if they exist).

The `guard()` macro dependency (`linux/cleanup.h`) is available in these
kernels, so no backport adjustment needed.

### 6. STABILITY AND TRUST INDICATORS

- **Author**: Sakari Ailus — well-known Linux media subsystem maintainer
  at Intel
- **Reviewer**: Hans Verkuil — another prominent media maintainer
- **The fix is obviously correct**: Moving `list_del` inside an existing
  lock that protects the same list is a textbook race condition fix

### 7. USER IMPACT

Intel IPU6 is the camera subsystem used in modern Intel laptops (Alder
Lake, Raptor Lake, etc.). Users doing camera streaming could hit this
race condition when starting/stopping video capture, leading to kernel
crashes. This affects laptops using the IPU6 camera with the mainline
driver.

### CONCLUSION

This commit fixes a real race condition (concurrent list modification
and traversal) that can lead to list corruption, use-after-free, or
kernel crashes. The fix is:
- **Small and surgical**: One lockdep assert, one lock scope change, one
  line moved inside existing lock
- **Obviously correct**: Classic pattern of protecting shared data
  structures with proper locking
- **Low risk**: Only extends lock scope and moves an operation inside an
  existing lock
- **Authored by subsystem maintainer**: High confidence in correctness
- **Fixes a real bug**: Race between STREAMON/STREAMOFF ioctls on shared
  stream list

The fix meets all stable kernel criteria.

**YES**

 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index aa2cf7287477c..8f05987cdb4e7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2013--2024 Intel Corporation
  */
 #include <linux/atomic.h>
+#include <linux/cleanup.h>
 #include <linux/bug.h>
 #include <linux/device.h>
 #include <linux/list.h>
@@ -201,6 +202,8 @@ static int buffer_list_get(struct ipu6_isys_stream *stream,
 	unsigned long flags;
 	unsigned long buf_flag = IPU6_ISYS_BUFFER_LIST_FL_INCOMING;
 
+	lockdep_assert_held(&stream->mutex);
+
 	bl->nbufs = 0;
 	INIT_LIST_HEAD(&bl->head);
 
@@ -294,9 +297,8 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 	struct ipu6_isys_buffer_list __bl;
 	int ret;
 
-	mutex_lock(&stream->isys->stream_mutex);
+	guard(mutex)(&stream->isys->stream_mutex);
 	ret = ipu6_isys_video_set_streaming(av, 1, bl);
-	mutex_unlock(&stream->isys->stream_mutex);
 	if (ret)
 		goto out_requeue;
 
@@ -637,10 +639,10 @@ static void stop_streaming(struct vb2_queue *q)
 	mutex_lock(&av->isys->stream_mutex);
 	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
 		ipu6_isys_video_set_streaming(av, 0, NULL);
+	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
 	stream->nr_streaming--;
-	list_del(&aq->node);
 	stream->streaming = 0;
 	mutex_unlock(&stream->mutex);
 
-- 
2.51.0


