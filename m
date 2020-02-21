Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5A9167825
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729567AbgBUIqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:46:49 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:36575 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732150AbgBUIql (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:46:41 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53xEjunXDPKvK53xIjhWWI; Fri, 21 Feb 2020 09:46:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274800; bh=Ir3SG54ewrC24zHJSgOPKuEy0d1rLMRdT4ArhF90fZU=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=StlfeQMigvin3O+d2KJM73F0rbaYlnR/NwE0SuPT14o6NLPSXTNIioTGyAiNyKi/N
         nPfVoNTI2Pg0xmidtXMVuEz5160+TjILlaETqpG1cbZwiqbC8ieqbmoZ9s1DH4crN7
         Amtvfbe3pYLPU820Wt3Rcsvdutab/DhaiSFlpo11Gf7toNtYIZjkW4VSvjzv3lpFt1
         SGIHErBPxwjeaBdHrm1dEVlX3mHk9ncWM5X8EAz9wycmONbw/BcqDpGnpME7io6dbi
         uH21enwQPgJckR2PUbgEZD8GccHeh0TM4CcU4RuKWelGiIux/ztXgejynm8PvTE5Eg
         bUlyDNxN4vzMA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [RFC PATCH 7/9] davinci: drop VB2_USERPTR
Date:   Fri, 21 Feb 2020 09:45:29 +0100
Message-Id: <20200221084531.576156-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfO7GlvQYMSL3MXpQ22kDKPL4eYxS2tdiyqRWr9VUDSTGtnwKTjpOhmLvBLlcbeerwSN2n1GCZrlmlbL3+a4Ixldw95R+RKBpfWqU4M/v0L1PJh1nCqA7
 BeCkt2g+WHPiGOo2HO6ci9ASSwtzXRytOZdhNj2xdvRf6oXpDhHKBy43CJ2AU99eR8c2PYoFaLZHjC+zm20yrHkOhMFJU86pcu48OIUNSmYJrnKkU9xDmele
 0hAIwSuBpWQcvc8eZf3OBkvZN/37/NFCjOt4EcHtsiQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The combination of VB2_USERPTR and dma-contig makes no sense for
these devices, drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>
---
 drivers/media/platform/davinci/vpbe_display.c | 2 +-
 drivers/media/platform/davinci/vpif_capture.c | 2 +-
 drivers/media/platform/davinci/vpif_display.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
index ae419958e420..2641973998fe 100644
--- a/drivers/media/platform/davinci/vpbe_display.c
+++ b/drivers/media/platform/davinci/vpbe_display.c
@@ -1426,7 +1426,7 @@ static int vpbe_display_probe(struct platform_device *pdev)
 		q = &disp_dev->dev[i]->buffer_queue;
 		memset(q, 0, sizeof(*q));
 		q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+		q->io_modes = VB2_MMAP | VB2_DMABUF;
 		q->drv_priv = disp_dev->dev[i];
 		q->ops = &video_qops;
 		q->mem_ops = &vb2_dma_contig_memops;
diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index 71f4fe882d13..9c8b05f7fc29 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1435,7 +1435,7 @@ static int vpif_probe_complete(void)
 		/* Initialize vb2 queue */
 		q = &common->buffer_queue;
 		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+		q->io_modes = VB2_MMAP | VB2_DMABUF;
 		q->drv_priv = ch;
 		q->ops = &video_qops;
 		q->mem_ops = &vb2_dma_contig_memops;
diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
index abbdbac08e6f..ee6f1fd2baac 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -1181,7 +1181,7 @@ static int vpif_probe_complete(void)
 		/* Initialize vb2 queue */
 		q = &common->buffer_queue;
 		q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+		q->io_modes = VB2_MMAP | VB2_DMABUF;
 		q->drv_priv = ch;
 		q->ops = &video_qops;
 		q->mem_ops = &vb2_dma_contig_memops;
-- 
2.25.0

