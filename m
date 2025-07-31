Return-Path: <linux-media+bounces-38702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74FB174B5
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 18:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97EB7188AFF3
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 16:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283141FFC64;
	Thu, 31 Jul 2025 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tgB4ySYb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51431208CA
	for <linux-media@vger.kernel.org>; Thu, 31 Jul 2025 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753978016; cv=none; b=caoglHong0FwLIpfgi9MVVYEqcGYrABkDAWFZyBBpgHtPUevKHSoSnEVrpR5eRy1bYpJP6zX7MAfQDCWEVHpR1Yi8EOKkYc7spXfb6nGTesLRMjoxQIMGUKKRnJzCO1ThD6zUgpMYP1boC1lGFsYN9DdeyFowR3vHQhq4+EGKlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753978016; c=relaxed/simple;
	bh=IogoD8X0G9Vyu2MqvxgxuW0LvgPySkeunk3LN/yqHf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SvXVlcgrv/PEnCSMW7plxwbVn08MN9J6407FJLmy+M2xWMM1ChmjbmXBRmSgBKyuSUNrm5H78Wdklu3tA8YDdKdabo2888j/0aUtgf4fsW4yus075l5G0DgNCaGOZT7q32KoMwqC2Ab4v2yxhMHr24gnsPYv2GloBRgZsoHzwAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tgB4ySYb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 905781809;
	Thu, 31 Jul 2025 18:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753977965;
	bh=IogoD8X0G9Vyu2MqvxgxuW0LvgPySkeunk3LN/yqHf0=;
	h=From:To:Cc:Subject:Date:From;
	b=tgB4ySYbT2FCKDFPuZqlOT0pSkl0wLf4Pefyt46aApKg25XtbL/32hb2pEZ6kqeNH
	 u2RHD0thOsyPCykWZ8ed0q8mGqDyGdCv04aTv8zWeglzBRzBO7AsARpLzSEVUe7enZ
	 JFRH3my1itWotBKqkujExibkuZgDI5e7hfebPGRY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Andy Walls <awalls@md.metrocast.net>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: [PATCH] media: pci: ivtv: Don't create fake v4l2_fh
Date: Thu, 31 Jul 2025 19:06:40 +0300
Message-ID: <20250731160640.4652-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This patch is compile-tested only.
---
 drivers/media/pci/ivtv/ivtv-alsa-pcm.c |  2 --
 drivers/media/pci/ivtv/ivtv-driver.h   |  3 ++-
 drivers/media/pci/ivtv/ivtv-fileops.c  | 18 +++++++++---------
 drivers/media/pci/ivtv/ivtv-irq.c      |  4 ++--
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-alsa-pcm.c b/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
index 8f346d7da9c8..269a799ec046 100644
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
index a6ffa99e16bc..83818048f7fe 100644
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
index cfa28d035586..1ac8d691df5c 100644
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
index 748c14e87963..20ba5ae9c6d1 100644
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
 

base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
-- 
Regards,

Laurent Pinchart


