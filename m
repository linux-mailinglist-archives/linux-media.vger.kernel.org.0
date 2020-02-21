Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2119F167824
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732565AbgBUIqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:46:49 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54399 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728761AbgBUIql (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:46:41 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53xEjunXDPKvK53xHjhWWE; Fri, 21 Feb 2020 09:46:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274799; bh=ra+c3Ufy0VWHCHsRdQ0qpxgmqP9MAJxEIIWCMzUQw1k=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=kXHB7C4JJOnYFsFOZsw46a+TNFj/FVodNYP+wRsJGkd3jIawtPEzsPjyJ5vvfVhki
         Qr+QiSbwoOucoEDXrWWkvmECAS8nGJv0uoJBBegYpV10DfF2Vq2W7fN3VEndFW8LDi
         lJHqJu9vSm1IjiTk3WN6utmt2s0caSiwzS5sTwUPXptdLyuJ6aEqlGzLtdgcAvzu7w
         7IGpZ/9Oby/iGAO+3y7REetOPAlJWrJigRjas3aqinqwsy0rjUR85rtEzuG50MioJb
         graw3wgTZ5bHfZhGu25Rwwu2qx80bw3kgB7t6lOx1o/R3YzzfGy9Y4gCUX2dHhzMkp
         zq7q2I9XT1EiQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 5/9] sh_veu: drop VB2_USERPTR
Date:   Fri, 21 Feb 2020 09:45:27 +0100
Message-Id: <20200221084531.576156-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGQ+Mz8+eZr5l5sM+8r0tyCOWMT7xuPVNkC5DPZcqNik9UQFVALGO13aRtxJP1vlp0W18Sf2BT+113CCmru7kQedIHxgLQIl6z2pnfjqhJrsVEFPX6ji
 vJ+XY9ceKuByj8ko38YD3GZeP/kgusdXcR/vLXOCMXnWq7ImMaFq7OqC00JDEY99ap6HroSo334ca/CHjKv5GdhMnlB+XUdWqtvH5DtEzB9E6dNIJu7jk4vR
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The combination of VB2_USERPTR and dma-contig makes no sense for
this device, drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/sh_veu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sh_veu.c b/drivers/media/platform/sh_veu.c
index b95a7e2ede55..fc5b31da6f83 100644
--- a/drivers/media/platform/sh_veu.c
+++ b/drivers/media/platform/sh_veu.c
@@ -924,7 +924,7 @@ static int sh_veu_queue_init(void *priv, struct vb2_queue *src_vq,
 
 	memset(src_vq, 0, sizeof(*src_vq));
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-	src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = veu;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	src_vq->ops = &sh_veu_qops;
@@ -939,7 +939,7 @@ static int sh_veu_queue_init(void *priv, struct vb2_queue *src_vq,
 
 	memset(dst_vq, 0, sizeof(*dst_vq));
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = veu;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->ops = &sh_veu_qops;
-- 
2.25.0

