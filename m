Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A94842D5AC
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 08:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfE2GqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 02:46:02 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46455 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725882AbfE2GqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 02:46:02 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VsLXh2DLj3qlsVsLYhrcYb; Wed, 29 May 2019 08:46:00 +0200
Subject: [PATCHv2 1/2] v4l2-mem2mem: add try_en/decoder_cmd ioctl helpers
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <20190528083437.103215-1-hverkuil-cisco@xs4all.nl>
 <20190528083437.103215-2-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b59b8836-489e-c027-63d1-338524ba7427@xs4all.nl>
Date:   Wed, 29 May 2019 08:45:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528083437.103215-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPJ5tTMpkA606Ju2kiKsqbchVeMOfF68pe/xuFkCiLLK1IdzRuhLjS37/ccqZ3W0c7jQiquKFA5xffjuXAZdRBg3TexWyR5McZrwZRYRfU+v4fbVHRTa
 8bbrlL/a0yMJWLUlk6fxavdTcsXjxm8CGPx1OlW7MU2dPygRmmfFmdH2KIEeMNg8/sQbVe6VhGP6N6NqdxROup6mIRLNcYTDeXAxNXKHc04rja23pNEwzcyY
 2lef33CN1RNATSB3+GLDLgxOz70zxjv2Dk5S/Ftsd+V7vUxqtvheDdSqY2gxPGuo25Q7MXMlBLFVExog5gs1s4graUa765L3TfoeEYmhrZoXGGW0uyypb+Pq
 A3ZqEpmueKvtmzQHKtyRWAw5AuqpAAEbVJ4nglWXrkZbQDKXNBTXhztosC6zqp4kQn1mpJsB9pYSngd9bo9lsE4jZTFvig==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most if not all codecs will need to implement these ioctls and
it is expected to be the same for all codecs. So add this to
the core v4l2-mem2mem framework so that this code can easily be
reused.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes in v2:

Don't check, just clear flags and stop.pts fields. TRY_* shouldn't check
the passed values, but just return what it actually supported by the driver.
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 29 ++++++++++++++++++++++++++
 include/media/v4l2-mem2mem.h           |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 3392833d9541..498044a0cb4e 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1122,6 +1122,35 @@ int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_streamoff);

+int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
+				   struct v4l2_encoder_cmd *ec)
+{
+	if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
+		return -EINVAL;
+
+	ec->flags = 0;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_encoder_cmd);
+
+int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
+				   struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
+		return -EINVAL;
+
+	dc->flags = 0;
+
+	if (dc->cmd == V4L2_DEC_CMD_STOP) {
+		dc->stop.pts = 0;
+	} else if (dc->cmd == V4L2_DEC_CMD_START) {
+		dc->start.speed = 0;
+		dc->start.format = V4L2_DEC_START_FMT_NONE;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
+
 /*
  * v4l2_file_operations helpers. It is assumed here same lock is used
  * for the output and the capture buffer queue.
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index bb3e63d6bd1a..2e0c989266a7 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -672,6 +672,10 @@ int v4l2_m2m_ioctl_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type);
 int v4l2_m2m_ioctl_streamoff(struct file *file, void *fh,
 				enum v4l2_buf_type type);
+int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
+				   struct v4l2_encoder_cmd *ec);
+int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
+				   struct v4l2_decoder_cmd *dc);
 int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
 __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);

-- 
2.20.1


