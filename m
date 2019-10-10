Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7CAD2A81
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 15:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388062AbfJJNL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 09:11:58 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53711 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388012AbfJJNL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 09:11:57 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:bc04:8998:8ec1:1871])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IYESijV5zop0AIYEViU37H; Thu, 10 Oct 2019 15:11:55 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 4/8] media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
Date:   Thu, 10 Oct 2019 15:11:48 +0200
Message-Id: <20191010131152.68984-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNehpzSLnwlvZCmgg+1Ed3QLNwLhTgLyDEARzq26bl01ROW8oYfQHHZ8iaPuJ+C4VvD8UsQDPTP2OcGQcAjep1uSm2rhnnnyWj7aCfT41PisMe6yi5zC
 jFpxptS8fR0CFoPZ752VdOautT6W1W6gW5bwyjrecdsx7WAoJs0JFx8GHQMJOgE36du63az8K4GLmowr0/tPp3YW+O1TaJAsyvKpt7Cn8o9JS0Q3lOTj8VK4
 hqBn6LE51yvKPcDe0aXTkwU512mAtM8u5hnIS7X5+Wp9H1SE8spYhqmcjYp1J2v75kw5nWM3w0Q57JKq+sNaO6O3D0PxiNKJK11380XoGPDlGN6sVidhpaeV
 biFASR6JUdRJnsFaP8eXo0AS2bhQiXamfkDsHiM9Kg19fMnPVKeqr1CrdrE6yiEdM4Rax9Rr9m6xz9ccjsot0k25uQxeT2PmNgN1yDST68yCXZe9myZvysxN
 Wdm3BtkEK2M7RygO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

These helpers are used by stateless codecs when they support multiple
slices per frame and hold capture buffer flag is set. It's expected that
all such codecs will use this code.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 53 ++++++++++++++++++++++++++
 include/media/v4l2-mem2mem.h           |  4 ++
 2 files changed, 57 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 3a8a2ebaf5e3..5cad205eed08 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1218,6 +1218,59 @@ int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
 
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
+					     struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
+		return -EINVAL;
+
+	dc->flags = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_try_decoder_cmd);
+
+int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
+					 struct v4l2_decoder_cmd *dc)
+{
+	struct v4l2_fh *fh = file->private_data;
+	struct vb2_v4l2_buffer *out_vb, *cap_vb;
+	struct v4l2_m2m_dev *m2m_dev = fh->m2m_ctx->m2m_dev;
+	unsigned long flags;
+	int ret;
+
+	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, dc);
+	if (ret < 0)
+		return ret;
+
+	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	out_vb = v4l2_m2m_last_src_buf(fh->m2m_ctx);
+	cap_vb = v4l2_m2m_last_dst_buf(fh->m2m_ctx);
+
+	/*
+	 * If there is an out buffer pending, then clear any HOLD flag.
+	 *
+	 * By clearing this flag we ensure that when this output
+	 * buffer is processed any held capture buffer will be released.
+	 */
+	if (out_vb) {
+		out_vb->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
+	} else if (cap_vb && cap_vb->is_held) {
+		/*
+		 * If there were no output buffers, but there is a
+		 * capture buffer that is held, then release that
+		 * buffer.
+		 */
+		cap_vb->is_held = false;
+		v4l2_m2m_dst_buf_remove(fh->m2m_ctx);
+		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
+	}
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_decoder_cmd);
+
 /*
  * v4l2_file_operations helpers. It is assumed here same lock is used
  * for the output and the capture buffer queue.
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 229d9f5d4370..3d9e48ed8817 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -701,6 +701,10 @@ int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
 				   struct v4l2_encoder_cmd *ec);
 int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
 				   struct v4l2_decoder_cmd *dc);
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
+					     struct v4l2_decoder_cmd *dc);
+int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
+					 struct v4l2_decoder_cmd *dc);
 int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
 __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);
 
-- 
2.23.0

