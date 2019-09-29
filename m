Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2FCC194A
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2019 22:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729182AbfI2UBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Sep 2019 16:01:02 -0400
Received: from mailoutvs49.siol.net ([185.57.226.240]:54096 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729124AbfI2UBC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Sep 2019 16:01:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 113EC5226F2;
        Sun, 29 Sep 2019 22:01:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id fCy5jAs5IWsj; Sun, 29 Sep 2019 22:00:59 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 8A3685226EA;
        Sun, 29 Sep 2019 22:00:59 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 27537522639;
        Sun, 29 Sep 2019 22:00:57 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org
Cc:     gregkh@linuxfoundation.org, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se, jernej.skrabec@siol.net
Subject: [PATCH v2 3/6] media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
Date:   Sun, 29 Sep 2019 22:00:20 +0200
Message-Id: <20190929200023.215831-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929200023.215831-1-jernej.skrabec@siol.net>
References: <20190929200023.215831-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These helpers are used by stateless codecs when they support multiple
slices per frame and hold capture buffer flag is set. It's expected that
all such codecs will use this code.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 35 ++++++++++++++++++++++++++
 include/media/v4l2-mem2mem.h           |  4 +++
 2 files changed, 39 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
index 19937dd3c6f6..2677a07e4c9b 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1154,6 +1154,41 @@ int v4l2_m2m_ioctl_try_decoder_cmd(struct file *fi=
le, void *fh,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
=20
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh=
,
+					     struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd !=3D V4L2_DEC_CMD_FLUSH)
+		return -EINVAL;
+
+	dc->flags =3D 0;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_try_decoder_cmd);
+
+int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
+					 struct v4l2_decoder_cmd *dc)
+{
+	struct v4l2_fh *fh =3D file->private_data;
+	struct vb2_v4l2_buffer *out_vb, *cap_vb;
+	int ret;
+
+	ret =3D v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, dc);
+	if (ret < 0)
+		return ret;
+
+	out_vb =3D v4l2_m2m_last_src_buf(fh->m2m_ctx);
+	cap_vb =3D v4l2_m2m_last_dst_buf(fh->m2m_ctx);
+
+	if (out_vb)
+		out_vb->flags &=3D ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
+	else if (cap_vb && cap_vb->is_held)
+		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_decoder_cmd);
+
 /*
  * v4l2_file_operations helpers. It is assumed here same lock is used
  * for the output and the capture buffer queue.
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index c9fa96c8eed1..8ae2f56c7fa3 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -714,6 +714,10 @@ int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file=
, void *fh,
 				   struct v4l2_encoder_cmd *ec);
 int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
 				   struct v4l2_decoder_cmd *dc);
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh=
,
+					     struct v4l2_decoder_cmd *dc);
+int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
+					 struct v4l2_decoder_cmd *dc);
 int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
 __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);
=20
--=20
2.23.0

