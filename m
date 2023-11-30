Return-Path: <linux-media+bounces-1405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A897FEFB4
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 14:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03873B20E34
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 13:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531313DB9B;
	Thu, 30 Nov 2023 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A823638DE0
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 13:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20638C433C8;
	Thu, 30 Nov 2023 13:03:48 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: "Dr . David Alan Gilbert" <dave@treblig.org>,
	Deborah Brouwer <deborah.brouwer@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] media: bttv: add back vbi hack
Date: Thu, 30 Nov 2023 13:58:11 +0100
Message-ID: <16f3b2a896e2a3788e8e33ab7a0e55cbad4bbd81.1701349092.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
References: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old (now removed) videobuf framework had an optional vbi hack where
the sequence number of the frame counter was copied in the last 4 bytes
of the buffer. This hack was active only for the read() interface
(so not for streaming I/O), and it was enabled by bttv. This allowed
applications that used read() for the VBI data to match it with the
corresponding video frame.

When bttv was converted to vb2 this hack was forgotten, but some old
applications rely on this.

So add this back, but this time in the bttv driver rather than in the
vb2 framework.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: b7ec3212a73a ("media: bttv: convert to vb2")
---
 drivers/media/pci/bt8xx/bttv-driver.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 8e8c9dada67a..49a3dd70ec0f 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2772,6 +2772,27 @@ bttv_irq_wakeup_vbi(struct bttv *btv, struct bttv_buffer *wakeup,
 		return;
 	wakeup->vbuf.vb2_buf.timestamp = ktime_get_ns();
 	wakeup->vbuf.sequence = btv->field_count >> 1;
+
+	/*
+	 * Ugly hack for backwards compatibility.
+	 * Some applications expect that the last 4 bytes of
+	 * the VBI data contains the sequence number.
+	 *
+	 * This makes it possible to associate the VBI data
+	 * with the video frame if you use read() to get the
+	 * VBI data.
+	 */
+	if (vb2_fileio_is_active(wakeup->vbuf.vb2_buf.vb2_queue)) {
+		u32 *vaddr = vb2_plane_vaddr(&wakeup->vbuf.vb2_buf, 0);
+		unsigned long size =
+			vb2_get_plane_payload(&wakeup->vbuf.vb2_buf, 0) / 4;
+
+		if (vaddr && size) {
+			vaddr += size - 1;
+			*vaddr = wakeup->vbuf.sequence;
+		}
+	}
+
 	vb2_buffer_done(&wakeup->vbuf.vb2_buf, state);
 	if (btv->field_count == 0)
 		btor(BT848_INT_VSYNC, BT848_INT_MASK);
-- 
2.42.0


