Return-Path: <linux-media+bounces-62785-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI9kEZKQFWovWgcAu9opvQ
	(envelope-from <linux-media+bounces-62785-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:22:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5FB5D5784
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2FAD30297BE
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B043F9289;
	Tue, 26 May 2026 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mju-ac-kr.20251104.gappssmtp.com header.i=@mju-ac-kr.20251104.gappssmtp.com header.b="pc85n44F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734873A963B
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798141; cv=none; b=PW1g1l41luKLf0GtLbSpECYIcwjEimCQ0cmT1d532Do0o9Xw76pU+NxI29DwP11GKBMRj/9JPV0l/tEsVTXa+wgm4lmVIocFjZ5PojpT6UsAs6FHm5Kvghm3xz9D/0KFLfpEK+uPHklanDcM2vL/5KIsIk2Py+TPYMu/9EqbCts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798141; c=relaxed/simple;
	bh=AXtwezzLoCGxwF0CydKIJ/MZv+sX+BtL3/6cQf3SnXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7RkF6aIpgHW5wP/AScm9j5X5x3Z6AVAxkFcG/4X9AEU2F2Tmn2pNBzapMBQbbhxSZ1zW4YT6rcLppwIxVBw5Z3p4+cR0K8bWmo8LAkzLRSfI+gobWzB672FQfvc1j8L6WBnn/Lficxqyg94dZ2oeFSO1MvENQtLEb5E+ZJeaJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mju.ac.kr; spf=pass smtp.mailfrom=mju.ac.kr; dkim=pass (2048-bit key) header.d=mju-ac-kr.20251104.gappssmtp.com header.i=@mju-ac-kr.20251104.gappssmtp.com header.b=pc85n44F; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mju.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mju.ac.kr
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36a35e4eefeso3638336a91.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mju-ac-kr.20251104.gappssmtp.com; s=20251104; t=1779798137; x=1780402937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5pp2GVwoUtQ80LYt6zY3fggW5ulozvNln+1jo2wsGI=;
        b=pc85n44F52vGdFc722ar6sIIgpoJbpfycBaf8TCfqSlkVbjjp3WXa2RsVC096HlHvn
         znqFhPnf3UqQljcZX3r2iHtHi9jzSLvSI3Xu4B1B1oAs4xC1CrwW4jFNthorw6xiwvSr
         c7/Lvv/EmtKAraUn6xD5ZdQ8/gp7K8QbRkx6jQdmS26orOghVu0pwYwZaojBLI9X6Rvq
         QMNmFTnDvspxnLBOxi/9w15txJ5QaeAmcORIMu5JwnVpDEPvwkpffe7MBZ7Vy46U4T7P
         M6Mv6Qg88DnQKy8JBwJKggQ004mEBwg8gmrIVUwiU1z3fllP4g/bTXqcRuyAisrq7IVR
         eZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798137; x=1780402937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5pp2GVwoUtQ80LYt6zY3fggW5ulozvNln+1jo2wsGI=;
        b=Df6BeBccWp2wO6FkVpWA7zmNXgYsFWs3tGZCk4a9DQcWnlK04+w4+LMrGsjfwSKOZs
         fwM5EV2FO5sEJpMTNax//pm3VDpH6Xf2gk3KrRdiogY/AHF91Rslzo51nF9mo8FowS7s
         R7LU0ddUOfHKf7HxG6b29ovDTDYFnwreA+3x6wbbnaNANxKzSDiJtAmhnyTEb+PqsI5C
         dTrs/+J94t1cRn5xYA6aOHu5yzj01k2RKHW/Kkm6V+3jE5DYVYVYC3+KqfyztOW7FtnH
         C2fwjkaidoujcErBD0CwBjC3M/GMirr0Odhrc1lu1Ebg0WrTlc2u+nYvUA900s+BiWR1
         /n0w==
X-Gm-Message-State: AOJu0YwQasmwu5VstULRFCco0dbVVx1qeeQfBexKrSk+DoTdqxJQsBpJ
	LZdFhqpnv+QzH6kmdxLff/b7cZfRCbyHlquoiJzTEW9o73/7Xcr6YTBilGpX2bjieF+BvqB/5n/
	AQMOtQ4ENmA==
X-Gm-Gg: Acq92OG331mUbJAR4Eun7FsLhGREJui9ofxDYioZXMZjflh47CLmdBsTX6H/frJpYJp
	fngypPs6oIw5WS8GDDxDq6mgrMu3hh/Z5nG0RURbJswdEZAHGDXiored3JgGZAx4vInroUtesg+
	/+oZgSFPFoQdWEYbpxyw+pVvgVEvjX6YzFKYrJZ7VpwUBAWyAUfjf86+c/JoVdvSBuoIS2Y2hQP
	oAXCITti8hPD6q6ebWv86YmynnrSgfbUJxuicpPE3lQBB5OrBgtB6g0zgmvelaOuYn1PhhGysTi
	M4KcQC0iEpKmH3r6GZQU7gCYkpcIJRJq6C3JXE5151WgEoLivp1g8HS7+YR094fOVOB9t4rDGib
	wB1bjV2q3F/t5k0ltbbJzg3OWIEtIYZrQU5xjWyE6bB9OeTU0ZqRcMEjDRhH9lD1VFZ6Si5Ajl0
	JrXtK8XrFY8mOn9FNa0CHGJG5rCJbgVLHwtoEKCxdv0a0=
X-Received: by 2002:a17:90b:2f84:b0:35f:b714:e516 with SMTP id 98e67ed59e1d1-36a674f4399mr18640295a91.16.1779798137481;
        Tue, 26 May 2026 05:22:17 -0700 (PDT)
Received: from younhochoi-MS-7C82.. ([117.17.158.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a723cee01sm12089470a91.14.2026.05.26.05.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:22:17 -0700 (PDT)
From: Younho Choi <gdool88@mju.ac.kr>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	benjamin.gaignard@collabora.com,
	ysk@kzalloc.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Younho Choi <gdool88@mju.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] media: vim2m: keep transaction buffer count stable while streaming
Date: Tue, 26 May 2026 21:22:05 +0900
Message-ID: <20260526122205.1019913-1-gdool88@mju.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mju-ac-kr.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62785-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[mju.ac.kr];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[gdool88@mju.ac.kr,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.995];
	DKIM_TRACE(0.00)[mju-ac-kr.20251104.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mju.ac.kr:mid,mju.ac.kr:email,mju-ac-kr.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: AD5FB5D5784
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

V4L2_CID_TRANS_NUM_BUFS controls how many buffer pairs a vim2m
mem2mem job processes before the job is completed. The driver stores
the value in ctx->translen and device_work() uses it later to decide
whether the current transaction should continue.

Letting userspace change this control while streaming is active can
make a queued job observe a different transaction length than the one
it started with. That leaves the transaction state inconsistent with
the buffers currently queued for the job.

Grab the transaction buffer count control while either queue is
streaming, and release it only after both queues have stopped
streaming. The V4L2 control framework then rejects changes with
-EBUSY while the value is in use, while still allowing userspace to
configure the value before streaming starts.

Keep the control handler alive until after v4l2_m2m_ctx_release(),
since releasing the mem2mem context can call stop_streaming(), which
now ungrabs the control.

Fixes: 96d8eab5d0a1 ("V4L/DVB: [v5,2/2] v4l: Add a mem-to-mem videobuf framework test device")
Cc: stable@vger.kernel.org
Signed-off-by: Younho Choi <gdool88@mju.ac.kr>
---
 drivers/media/test-drivers/vim2m.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index bb2dd11eef0e..f4a2c4083829 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -205,6 +205,7 @@ struct vim2m_ctx {
 	struct vim2m_dev	*dev;
 
 	struct v4l2_ctrl_handler hdl;
+	struct v4l2_ctrl	*trans_num_bufs_ctrl;
 
 	/* Processed buffers in this transaction */
 	u8			num_processed;
@@ -1258,9 +1259,27 @@ static int vim2m_start_streaming(struct vb2_queue *q, unsigned int count)
 		ctx->aborting = 0;
 
 	q_data->sequence = 0;
+	v4l2_ctrl_grab(ctx->trans_num_bufs_ctrl, true);
+
 	return 0;
 }
 
+static bool vim2m_other_queue_is_streaming(struct vim2m_ctx *ctx,
+					   struct vb2_queue *q)
+{
+	struct vb2_queue *other_vq;
+
+	if (!ctx->fh.m2m_ctx)
+		return false;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		other_vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+	else
+		other_vq = v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
+
+	return vb2_is_streaming(other_vq);
+}
+
 static void vim2m_stop_streaming(struct vb2_queue *q)
 {
 	struct vim2m_ctx *ctx = vb2_get_drv_priv(q);
@@ -1274,11 +1293,14 @@ static void vim2m_stop_streaming(struct vb2_queue *q)
 		else
 			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 		if (!vbuf)
-			return;
+			break;
 		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
 					   &ctx->hdl);
 		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 	}
+
+	if (!vim2m_other_queue_is_streaming(ctx, q))
+		v4l2_ctrl_grab(ctx->trans_num_bufs_ctrl, false);
 }
 
 static void vim2m_buf_request_complete(struct vb2_buffer *vb)
@@ -1380,7 +1402,8 @@ static int vim2m_open(struct file *file)
 
 	vim2m_ctrl_trans_time_msec.def = default_transtime;
 	v4l2_ctrl_new_custom(hdl, &vim2m_ctrl_trans_time_msec, NULL);
-	v4l2_ctrl_new_custom(hdl, &vim2m_ctrl_trans_num_bufs, NULL);
+	ctx->trans_num_bufs_ctrl =
+		v4l2_ctrl_new_custom(hdl, &vim2m_ctrl_trans_num_bufs, NULL);
 	if (hdl->error) {
 		rc = hdl->error;
 		v4l2_ctrl_handler_free(hdl);
@@ -1435,10 +1458,10 @@ static int vim2m_release(struct file *file)
 
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
-	v4l2_ctrl_handler_free(&ctx->hdl);
 	mutex_lock(&dev->dev_mutex);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mutex_unlock(&dev->dev_mutex);
+	v4l2_ctrl_handler_free(&ctx->hdl);
 	kfree(ctx);
 
 	atomic_dec(&dev->num_inst);

base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.43.0


