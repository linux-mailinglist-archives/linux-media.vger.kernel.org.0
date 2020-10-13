Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F61128D05B
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388408AbgJMOjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:39:32 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:52386 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729832AbgJMOjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:39:25 -0400
Message-Id: <20201013143731.563049429@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602599963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=Kt7syLlkwliIK4Vw2o2WQSVVoFIsSjJ4Z19KFu4kzkY=;
        b=EGkAmJQIMjH8XEWyTcEPAbG6aoAfIAwTXpvd5xmhzfh00kwI7+yYrNqumjQrgoSafxJ2Xn
        lZAU5lPizhgU63I4kr+C2QhdZx4Rqo+ztrG6xbmGgNQl7gAvZ7o0B3CxaoRPx9o3eZZmqS
        /+mJ23UQYYqYRZp1Yz+8AafcxV/GKCXTDBY8g0MSvJpem+TyKTKZuP5r8jgzPBWmXNfaCi
        sZDddc75xhJGv6IkLuxNbOVSVIJQ1xUMff2DY/BdfrNzW8OoS2aDX1W32n+vRT0IcKjt5H
        brMjUm3awCanQZd7XPn51wDFoZKUcUIlt8dH4WrlZU8E6yCeaeMT/IMth1vw7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602599963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=Kt7syLlkwliIK4Vw2o2WQSVVoFIsSjJ4Z19KFu4kzkY=;
        b=SBBf6DeIAvBVI1JTWw3BsxbVXtBYgteaT4Fxdz36fh4VCqjiNSXAUeXO+efsnGpbD4nzh3
        bi6OYsY4XC0YV6AQ==
Date:   Tue, 13 Oct 2020 16:26:17 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [patch 1/4] media: Bulk remove BUG_ON(in_interrupt())
References: <20201013142616.118697527@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

None of these BUG_ON()'s is justified. BUG_ON() should only be used when
there is really no way to survive.

If at all these could be replaced by lockdep_assert_preemption_enabled() to
cover all invalid caller context and not just those covered by
in_interrupt().

But all functions which are invoked from those places contain already debug
mechanisms to catch wrong context, so having these extra checks is not
having any advantage.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-usb@vger.kernel.org

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index d6531874faa6..e936c56b0378 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -55,8 +55,6 @@ void saa7146_dma_free(struct saa7146_dev *dev,struct videobuf_queue *q,
 	struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
 	DEB_EE("dev:%p, buf:%p\n", dev, buf);
 
-	BUG_ON(in_interrupt());
-
 	videobuf_waiton(q, &buf->vb, 0, 0);
 	videobuf_dma_unmap(q->dev, dma);
 	videobuf_dma_free(dma);
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 4af72826b006..32fa4a7fe76f 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -572,7 +572,6 @@ bttv_dma_free(struct videobuf_queue *q,struct bttv *btv, struct bttv_buffer *buf
 {
 	struct videobuf_dmabuf *dma=videobuf_to_dma(&buf->vb);
 
-	BUG_ON(in_interrupt());
 	videobuf_waiton(q, &buf->vb, 0, 0);
 	videobuf_dma_unmap(q->dev, dma);
 	videobuf_dma_free(dma);
diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 4b0c53f61fb7..16eb4ab0e73e 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -1322,7 +1322,6 @@ void cx23885_free_buffer(struct cx23885_dev *dev, struct cx23885_buffer *buf)
 {
 	struct cx23885_riscmem *risc = &buf->risc;
 
-	BUG_ON(in_interrupt());
 	pci_free_consistent(dev->pci, risc->size, risc->cpu, risc->dma);
 }
 
diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 55018d9e439f..6f8ffab8840f 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -1198,7 +1198,6 @@ EXPORT_SYMBOL(cx25821_risc_databuffer_audio);
 
 void cx25821_free_buffer(struct cx25821_dev *dev, struct cx25821_buffer *buf)
 {
-	BUG_ON(in_interrupt());
 	if (WARN_ON(buf->risc.size == 0))
 		return;
 	pci_free_consistent(dev->pci,
diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 84633a3b8475..e0c51cd779b8 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -381,8 +381,6 @@ static void free_buffer(struct videobuf_queue *vq, struct viu_buf *buf)
 	struct videobuf_buffer *vb = &buf->vb;
 	void *vaddr = NULL;
 
-	BUG_ON(in_interrupt());
-
 	videobuf_waiton(vq, &buf->vb, 0, 0);
 
 	if (vq->int_ops && vq->int_ops->vaddr)
diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm6000/tm6000-video.c
index bfba06ea60e9..9b44462c5332 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -692,8 +692,6 @@ static void free_buffer(struct videobuf_queue *vq, struct tm6000_buffer *buf)
 	struct tm6000_core   *dev = fh->dev;
 	unsigned long flags;
 
-	BUG_ON(in_interrupt());
-
 	/* We used to wait for the buffer to finish here, but this didn't work
 	   because, as we were keeping the state as VIDEOBUF_QUEUED,
 	   videobuf_queue_cancel marked it as finished for us.
diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index 8c670934d920..83221c0b6e6d 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -357,8 +357,6 @@ static void free_buffer(struct videobuf_queue *vq, struct zr364xx_buffer *buf)
 {
 	_DBG("%s\n", __func__);
 
-	BUG_ON(in_interrupt());
-
 	videobuf_vmalloc_free(&buf->vb);
 	buf->vb.state = VIDEOBUF_NEEDS_INIT;
 }

