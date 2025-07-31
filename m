Return-Path: <linux-media+bounces-38705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6351CB17639
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 20:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E48FE7B0F21
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 18:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A326246BD7;
	Thu, 31 Jul 2025 18:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nTn3tDOy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ECB1D799D
	for <linux-media@vger.kernel.org>; Thu, 31 Jul 2025 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753987775; cv=none; b=i903mdG3ulhZHdMsh/g0tZPycpXSXkZ2+gWc/GB7EP9pbM6dbDra+jm127cMLtcL3Aw5R3pVA7gyUIIyprMBO20/F2u4bqJpqD1sjOUQu/z07sHlD0qpnzR6geg/+QQUJh2NDUMihWvVSF8BkUsSPRskHx8zCqISyyCP3BcQKzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753987775; c=relaxed/simple;
	bh=q3hIIScM/piLAMulmiC7/vvC2GwI1fwavRpuvmq/yRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryfmGk3uV1otBU02+cw6xBGrf1IarKtJQRcqlhNQsgENrgGbYLhB/p6WuuEp+XYJPPgGgFK2Cmm/FR54w7zu8xSWSXvGTbzvschb9INvAGU2astDrtwPKBg6WUfu/EUEXbxFTgk7sSWk8fZFaOzKd+5SMnEhkACOKKGgXEiVhY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nTn3tDOy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DB52B1741;
	Thu, 31 Jul 2025 20:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753987720;
	bh=q3hIIScM/piLAMulmiC7/vvC2GwI1fwavRpuvmq/yRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTn3tDOyPfbDSNTJQKkBA34+9a2vlNpk/mldJhgt6nQcnIrsm76yC7U6kzko2bsWp
	 76DcWW7tqkp83sQPGDmvyXJmndZYJW/SiY0pEnYIHlTB4ggv7fLpH7G77R4z8a0AUI
	 V2nVNszLdjhbTTAROSYVUWdukMHHISE91rAUsRdQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: [PATCH 2/2] media: amphion: Delete v4l2_fh synchronously in .release()
Date: Thu, 31 Jul 2025 21:49:11 +0300
Message-ID: <20250731184911.4323-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250731184911.4323-1-laurent.pinchart@ideasonboard.com>
References: <20250731184911.4323-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 306d94e0f8e7..57ca6262bb04 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -724,8 +724,6 @@ static int vpu_v4l2_release(struct vpu_inst *inst)
 
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	mutex_destroy(&inst->lock);
-	v4l2_fh_del(&inst->fh);
-	v4l2_fh_exit(&inst->fh);
 
 	call_void_vop(inst, cleanup);
 
@@ -794,6 +792,8 @@ int vpu_v4l2_open(struct file *file, struct vpu_inst *inst)
 
 	return 0;
 error:
+	v4l2_fh_del(&inst->fh);
+	v4l2_fh_exit(&inst->fh);
 	vpu_inst_put(inst);
 	return ret;
 }
@@ -813,6 +813,9 @@ int vpu_v4l2_close(struct file *file)
 	call_void_vop(inst, release);
 	vpu_inst_unlock(inst);
 
+	v4l2_fh_del(&inst->fh);
+	v4l2_fh_exit(&inst->fh);
+
 	vpu_inst_unregister(inst);
 	vpu_inst_put(inst);
 
-- 
Regards,

Laurent Pinchart


