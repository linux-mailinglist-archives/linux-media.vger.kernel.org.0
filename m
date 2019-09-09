Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13349AD56B
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 11:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfIIJL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 05:11:56 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43129 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIIJLz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 05:11:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id d15so8740538pfo.10
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tfJc9yAW3Hbo7QDxwGGt2Lyjl6yozG1o/Kvou1fLzxQ=;
        b=TgQ4fBKW00xGhSiBWxu6haqjkf45owzHUnmsTSTEubxIS+kkM4Pqr4NbTRCzw2+HsQ
         X/sa+/HcPrO+otv9QvRBuebixvsLM7IN8cKKLzR86tPiITgrL7IXyUPl/O5RenDqBw2N
         BABEIjh23Qc0rKwfy5InMpyNCAvUL0myXzsi4EqUsXQX8jFhiPRINb2Hpo3PD0U5pATg
         jCt6xLgsmFPDL2/cEGEZsFU51ols+tWyjEsjZuMFlCe/UwYlPht21RFOpVwpGTvEfnNt
         iS2lfk5corN/d/XbSDrTzriGzB0uOZYT2ToSa4Gcjv2RS8MxAdCw2s2pp7UHNnxaruGB
         of3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tfJc9yAW3Hbo7QDxwGGt2Lyjl6yozG1o/Kvou1fLzxQ=;
        b=NmMrxRcyZPfPeNaDDx1szrXyvsLClShqJwHaW7Sje+XM0rPSP7JLO+o9UdEsn6EKQP
         P8imzSA78hqpsIc0iu/Plll0AUWMetjrYSJjGZyycxeafsijX09mflbm6MIEEImBcH2j
         WDOEnOpgu9jBuiVnY6/xT3UcVWPgFWcMXVMydfTRUDshaFqJyoByRao1NxprbF5cGje4
         QzQx954W7yuFgGnyb7uDyuPjoOEwX1UQhUZQvFJGQLFQMioWEtqHZxihB8p/NA8NwhXS
         lxBOEOyGOTOrJ7pFqStvpFbScFyaf80WGJ7Yz9RDjm2VAxIHjxux8ZDvBk5LU/td9Cov
         0w5Q==
X-Gm-Message-State: APjAAAXIkkoj6bO318Opx8/R4iRwDLGuQzbZ+xpJyDWi+iBnMqTnGMsp
        D35LlwvYJTZftXKDz+EwqX930UBtv/s=
X-Google-Smtp-Source: APXvYqxLqWzxGCg6mU5+z5pH7aeMOeQVeZ9A2CQ2B94TywFEM1HhtV0AkVWe2aZlEBUmL1CoJWu2xg==
X-Received: by 2002:a62:8204:: with SMTP id w4mr26499068pfd.30.1568020314680;
        Mon, 09 Sep 2019 02:11:54 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.248.67.24])
        by smtp.gmail.com with ESMTPSA id n9sm13282588pjq.30.2019.09.09.02.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2019 02:11:54 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] vivid: Set vid_cap_streaming and vid_out_streaming to true
Date:   Mon,  9 Sep 2019 14:41:47 +0530
Message-Id: <20190909091147.6596-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

when vbi/meta stream is started, followed by video streaming,
the vid_cap_streaming and vid_out_streaming were not being set to true,
which would cause the video stream to stop when vbi/meta stream is stopped.
This patch allows to set vid_cap_streaming and vid_out_streaming to true.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/platform/vivid/vivid-vid-cap.c | 3 ---
 drivers/media/platform/vivid/vivid-vid-out.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
index 8cbaa0c998ed..2d030732feac 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -223,9 +223,6 @@ static int vid_cap_start_streaming(struct vb2_queue *vq, unsigned count)
 	if (vb2_is_streaming(&dev->vb_vid_out_q))
 		dev->can_loop_video = vivid_vid_can_loop(dev);
 
-	if (dev->kthread_vid_cap)
-		return 0;
-
 	dev->vid_cap_seq_count = 0;
 	dprintk(dev, 1, "%s\n", __func__);
 	for (i = 0; i < VIDEO_MAX_FRAME; i++)
diff --git a/drivers/media/platform/vivid/vivid-vid-out.c b/drivers/media/platform/vivid/vivid-vid-out.c
index 148b663a6075..a0364ac497f9 100644
--- a/drivers/media/platform/vivid/vivid-vid-out.c
+++ b/drivers/media/platform/vivid/vivid-vid-out.c
@@ -161,9 +161,6 @@ static int vid_out_start_streaming(struct vb2_queue *vq, unsigned count)
 	if (vb2_is_streaming(&dev->vb_vid_cap_q))
 		dev->can_loop_video = vivid_vid_can_loop(dev);
 
-	if (dev->kthread_vid_out)
-		return 0;
-
 	dev->vid_out_seq_count = 0;
 	dprintk(dev, 1, "%s\n", __func__);
 	if (dev->start_streaming_error) {
-- 
2.17.1

