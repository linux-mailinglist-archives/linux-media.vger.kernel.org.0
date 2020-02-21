Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19A9B16780A
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730033AbgBUIpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:45:38 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58991 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729996AbgBUIpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:45:38 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53wBjunHFPKvK53wFjhWPP; Fri, 21 Feb 2020 09:45:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274736; bh=ojgQQaEIwncKVTy3TuQA9MeN5hIWMTyIWhX1eyfTFMg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=pEWEegUKdCSSOSNdi8rQmGTy+FA8G6ZZMpSyT+khpSJko2Ej1Ij4cgig3ty3oMC4w
         9Fx7tEbpu/A2aNpNFGHM2T/PxERll4fu+4aT497Ylgbv+EelBD1or9SrNFihauQAj1
         wv1zyuMndUTEB9aZ6tFzPl4MFL3S71AOKA719BMW+cXyZFieDP9bxFkAfHEfNZYFuU
         h9WPcfy6XuxzksyDNqByWPNO3C9Wh+XDLOPgPR+345/C1DPjnDIZZSMk4XuohHw7Dp
         ojW06VC2xYvll1TFLe8DCII1bYTs6gytL9U1oqtV8fLEvhxw5I6E1RD5Ca7KUpiNg/
         sFlFp3IG9SaOg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 3/9] m2m-deinterlace: drop VB2_USERPTR
Date:   Fri, 21 Feb 2020 09:45:25 +0100
Message-Id: <20200221084531.576156-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGcgdw4u9Rg0DAWnSUTC0QvuVZRsy30RtBoXNufPK0a4jLMYJ/tgTtT8XLz8u0/37Ughovra1jev9eIJPG2MfC/phhjbuUY5B9uNBd2N+FfHCbYmRpPD
 N8RGlmMLvOuWatgRKA+lrvnCjmpBhSBNfmUlcaxT+Lt7iaQKNKWNQEZqKZbwGYfaboAp27fr8+yAQwLlYX0A/dmJ6dIVFFAJ+1DZNoAEHlpg1VOmLvtDOfTf
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The combination of VB2_USERPTR and dma-contig makes no sense for
this device, drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/m2m-deinterlace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 9ad24c86c5ab..ed2b36bb47e4 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -799,7 +799,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	int ret;
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	src_vq->ops = &deinterlace_qops;
@@ -818,7 +818,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 		return ret;
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->ops = &deinterlace_qops;
-- 
2.25.0

