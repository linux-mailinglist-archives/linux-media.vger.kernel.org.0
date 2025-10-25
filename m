Return-Path: <linux-media+bounces-45561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFFFC099B6
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588FF427CB4
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434043164BC;
	Sat, 25 Oct 2025 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dj4l3Loy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9997D30F950;
	Sat, 25 Oct 2025 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409566; cv=none; b=UtjdEh4eUbsVZmOifXi2iDMOO+FUglKQrSoxXRRlCx72HmwFS8kxcauhEKTayvH8oi7c2YpfF2rTQB7GadUMibrFwzPIKRV7TMWQP1rdgADhHQZSyrsRaH/21X8RHHcbOb7aVojys8YPVxC1EeSAby2sTGiOWTWX7OXymjUTQeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409566; c=relaxed/simple;
	bh=T+P8aP/MJDLtAYuz4yzvFBJwLE3cCjZgG34WXLuja3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MdyTpoHRp6hL9pSdTNxTjDi6vY0mSK+L3UN+Rz0klvUtyEB04mrNGVM+XG8ThbfwA200OOAaJtr10KKJHphxLcnUInOWf+pyB7+C0FhsNw64+PpXsY/ejZDxoIHgoFyPIb9b+HeXRJiw8Ck4su5R7OU1xIG4bnWxj9KwxVwYF18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dj4l3Loy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4DCC113D0;
	Sat, 25 Oct 2025 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409566;
	bh=T+P8aP/MJDLtAYuz4yzvFBJwLE3cCjZgG34WXLuja3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dj4l3Loy/hRT9QEvMWJnlsDkX2nZQtEWijE/x6zlD47OEYtlVP/fDKLecwzj/vtmj
	 zwW4FfGI1jMQwexufJQDME+ugLL7JflDCDo6bKzc5gIOJpi1uH6jWgfuguw8zcD80b
	 MHMTMdRQ1WeQ15E/ADFOIaDASjVfX4KP1mazafjPqCgeWmhYijzj4gZnOB/uoRwnsU
	 UALI8cf1LDO4dFeCwth6ynJJtpMw2LqXcFoitYBqem6BUCZ0JpjdAfzVNmh9ngBhZe
	 vGQb41r/lMw6HL71DU1UOCBXmnuvLMgsfuipvS01StS3RZIkE0aSJMhb7cXsViWly4
	 A7iR4tYAn0N/Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.1] media: amphion: Delete v4l2_fh synchronously in .release()
Date: Sat, 25 Oct 2025 12:00:01 -0400
Message-ID: <20251025160905.3857885-370-sashal@kernel.org>
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

[ Upstream commit 19fb9c5b815f70eb90d5b545f65b83bc9c490ecd ]

The v4l2_fh initialized and added in vpu_v4l2_open() is delete and
cleaned up when the last reference to the vpu_inst is released. This may
happen later than at vpu_v4l2_close() time.

Not deleting and cleaning up the v4l2_fh when closing the file handle to
the video device is not ideal, as the v4l2_fh will still be present in
the video device's fh_list, and will store a copy of events queued to
the video device. There may also be other side effects of keeping alive
an object that represents an open file handle after the file handle is
closed.

The v4l2_fh instance is embedded in the vpu_inst structure, and is
accessed in two different ways:

- in vpu_notify_eos() and vpu_notify_source_change(), to queue V4L2
  events to the file handle ; and

- through the driver to access the v4l2_fh.m2m_ctx pointer.

The v4l2_fh.m2m_ctx pointer is not touched by v4l2_fh_del() and
v4l2_fh_exit(). It is set to NULL by the driver when closing the file
handle, in vpu_v4l2_close().

The vpu_notify_eos() and vpu_notify_source_change() functions are called
in vpu_set_last_buffer_dequeued() and vdec_handle_resolution_change()
respectively, only if the v4l2_fh.m2m_ctx pointer is not NULL. There is
therefore a guarantee that no new event will be queued to the v4l2_fh
after vpu_v4l2_close() destroys the m2m_ctx.

The vpu_notify_eos() function is also called from vpu_vb2_buf_finish(),
which is guaranteed to be called for all queued buffers when
vpu_v4l2_close() calls v4l2_m2m_ctx_release(), and will not be called
later.

It is therefore safe to assume that the driver will not touch the
v4l2_fh, except to check the m2m_ctx pointer, after vpu_v4l2_close()
destroys the m2m_ctx. We can safely delete and cleanup the v4l2_fh
synchronously in vpu_v4l2_close().

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Today the driver deletes the `v4l2_fh` only when the last reference
    to the instance is put, not when the file is closed. In current
    code, `v4l2_fh_del()` and `v4l2_fh_exit()` are called from the
    instance release path `vpu_v4l2_release()`
    (drivers/media/platform/amphion/vpu_v4l2.c:712-713), not from the
    file `.release()` (close) path
    (drivers/media/platform/amphion/vpu_v4l2.c:786-804).
  - That means after a user closes the device file, the `v4l2_fh` object
    still remains on the `video_device`’s `fh_list` and can accumulate
    device events until the last kref is dropped. This is undesirable
    (stale file-handle state, latent memory consumption and confusing
    semantics), and it also diverges from how most V4L2 mem2mem drivers
    behave and from the documented expectation that `v4l2_fh_del/exit`
    are called in the v4l2 file `.release()`.

- What changes and why it’s safe
  - The patch moves `v4l2_fh_del()`/`v4l2_fh_exit()` out of the instance
    release path and into the file `.release()` (`vpu_v4l2_close()`),
    and also adds them to the open error path:
    - Remove from instance release: currently called in
      `vpu_v4l2_release()` at
      drivers/media/platform/amphion/vpu_v4l2.c:712-713.
    - Add to close path: after the driver releases the mem2mem context
      in `vpu_v4l2_close()`
      (drivers/media/platform/amphion/vpu_v4l2.c:793-799), it will now
      call `v4l2_fh_del()`/`v4l2_fh_exit()` and only then proceed to
      unregister and put the instance.
    - Add to the open error label: currently the `error:` path lacks
      `v4l2_fh_del/exit`
      (drivers/media/platform/amphion/vpu_v4l2.c:781-783); the patch
      adds them there to avoid leaving an fh briefly on the device list
      after a failed open.
  - Safety argument (from code):
    - After close, `vpu_v4l2_close()` already destroys the mem2mem
      context (`v4l2_m2m_ctx_release`) before anything else of interest
      (drivers/media/platform/amphion/vpu_v4l2.c:793-799). This is
      critical: it ensures the driver no longer queues new events to the
      `v4l2_fh`.
    - Calls that queue events check `m2m_ctx` first:
      - `vpu_set_last_buffer_dequeued()` returns if `inst->fh.m2m_ctx ==
        NULL` (drivers/media/platform/amphion/vpu_v4l2.c:110).
      - The decoder’s resolution-change path
        (`vdec_handle_resolution_change()`) also returns early if
        `inst->fh.m2m_ctx == NULL`
        (drivers/media/platform/amphion/vdec.c:357-366) before calling
        `vpu_notify_source_change()`.
      - `vpu_vb2_buf_finish()` may call `vpu_notify_eos(inst)`, but
        buffer-finish callbacks are guaranteed to flush during
        `v4l2_m2m_ctx_release()` and not after it returns, so there are
        no post-close event queues to an already exited `fh`.
    - With `m2m_ctx` destroyed first, no code path will call
      `v4l2_event_queue_fh()` after `v4l2_fh_exit()` sets `fh->vdev =
      NULL`. This avoids the risk of dereferencing a NULL `fh->vdev` in
      the core event code (see
      drivers/media/v4l2-core/v4l2-event.c:173-179 and
      drivers/media/v4l2-core/v4l2-fh.c:87-114).

- Why this is a good stable backport
  - Bug fix that affects users: prevents stale `fh` objects from staying
    on the device’s `fh_list` after close, which can accumulate events
    and resources and misrepresent the state of “open” file handles.
  - Small and contained: only changes
    `drivers/media/platform/amphion/vpu_v4l2.c`, moving two calls and
    adding them to an error path. No API or architectural changes.
  - Aligns with V4L2 expectations and common driver practice: many V4L2
    mem2mem drivers delete and exit the `v4l2_fh` in their file
    `.release()`; the V4L2 API documentation for `v4l2_fh_del/exit`
    indicates they should be called in the `.release()` handler (see
    include/media/v4l2-fh.h).
  - Low regression risk: the mem2mem context is released at close time
    already (drivers/media/platform/amphion/vpu_v4l2.c:793-799), and all
    event-queuing paths are guarded by `m2m_ctx != NULL`, ensuring no
    events are queued after `fh` is deleted/exited.
  - Extra robustness: adding `v4l2_fh_del/exit` to the open error path
    ensures no transient fhs linger on the device list if open fails
    after `v4l2_fh_add`.

- Preconditions for backporting
  - Ensure the target stable branch matches the current behavior where
    `vpu_v4l2_close()` releases `inst->fh.m2m_ctx`
    (drivers/media/platform/amphion/vpu_v4l2.c:793-799). Earlier
    versions temporarily released `m2m_ctx` in the instance release
    path; this patch’s safety relies on doing it in `.close()`. If the
    branch still releases `m2m_ctx` in the instance release routine,
    this patch should be combined with or preceded by the change that
    moves `m2m_ctx` release into `.close()`.

Given the above, this change is a clear, minimal correctness fix with
low risk and should be backported.

 drivers/media/platform/amphion/vpu_v4l2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 74668fa362e24..1c3740baf6942 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -718,8 +718,6 @@ static int vpu_v4l2_release(struct vpu_inst *inst)
 
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	mutex_destroy(&inst->lock);
-	v4l2_fh_del(&inst->fh);
-	v4l2_fh_exit(&inst->fh);
 
 	call_void_vop(inst, cleanup);
 
@@ -788,6 +786,8 @@ int vpu_v4l2_open(struct file *file, struct vpu_inst *inst)
 
 	return 0;
 error:
+	v4l2_fh_del(&inst->fh);
+	v4l2_fh_exit(&inst->fh);
 	vpu_inst_put(inst);
 	return ret;
 }
@@ -807,6 +807,9 @@ int vpu_v4l2_close(struct file *file)
 	call_void_vop(inst, release);
 	vpu_inst_unlock(inst);
 
+	v4l2_fh_del(&inst->fh);
+	v4l2_fh_exit(&inst->fh);
+
 	vpu_inst_unregister(inst);
 	vpu_inst_put(inst);
 
-- 
2.51.0


