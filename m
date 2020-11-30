Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42482C8758
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 16:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgK3PBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 10:01:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgK3PBl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 10:01:41 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FB5C0613D2;
        Mon, 30 Nov 2020 07:01:01 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id r9so1494187pjl.5;
        Mon, 30 Nov 2020 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fnosl3bdoEpn6KZdMia0NkyW51N5t/HDyZii5SlByRo=;
        b=sTKdupZ7LQ2c7vdCI3T62xVeLTMZs1zjI66FTrsZD5Kx3fQYlENu/yrxp7kl8x4fL2
         anGx5SnYbNzc/3qoBEfoc6Mqd7KPWN1jLFRxHEGNbkSL6NLDMFo6TbRJ+NaAP836mmxD
         oJCmFDNVkkwFnUpNyuGPJkm0xJ7jQajt1Z0YP9/Bki3P1z7oPqrxBvRSul88ECzKwC9r
         tuEg+1t/A8ElYhahjCDU9Iz3nxMgHf6cnn9GPkbBEpyixLd7tlnQ57DPzjEVhGmqz55w
         VvwChVyyPpy2NzBXle39e4ixUN3iUoB+gh7CmTnONWPHu5U0/Akm1Fav3wqdt1ShrLnQ
         skBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fnosl3bdoEpn6KZdMia0NkyW51N5t/HDyZii5SlByRo=;
        b=iqeW2hD/F6sW0K6JLR4TkrGVIJmMgmPO1dd2ZyGfnKYZdHMcQadSrf8llfGaGMDwcD
         PvfVjjsMULMOuhXmKdluWucSjHlYfMuvCvNW0jA02besa5FOnZn6MOwjFCW4tFLFGriL
         myEXLm24Pdcpfk9DusJgYkCp7/KuBKmhThLyAz7Xwpw4dUZyLcvsejekkEZvS4eXEKvl
         hdgyp3RlH4xdh1JUJAXoDM3RohPlX21Es7ylvi1ev62v3owAuzx18XO+5NpkYSSOT38c
         X+hgvK0tCNh+fdBJezDSAzV3ZhgDwTd9VgRRph5ZeIMfy6w7QLSimu70QzpwRubpKeQt
         fV4A==
X-Gm-Message-State: AOAM530i50+TvNEpB//549qFfvaiW4iXF3Gg98EBS1RTfksDLLLurVHL
        myPED+FbjdBlGvf0Dl/JTgg=
X-Google-Smtp-Source: ABdhPJzPjgP6w9OXYy++kPS2cEagt1D72A4JkKBgBgnQ8Mqf1j/IoW6H1JfT5OFVf3oy5Ts8BGbAIA==
X-Received: by 2002:a17:90a:d307:: with SMTP id p7mr3665258pju.214.1606748461103;
        Mon, 30 Nov 2020 07:01:01 -0800 (PST)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id i13sm16765339pfo.139.2020.11.30.07.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 07:00:59 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4] media: vb2: set cache sync hints when init buffers
Date:   Tue,  1 Dec 2020 00:00:54 +0900
Message-Id: <20201130150054.688003-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to set ->need_cache_sync_on_prepare and
->need_cache_sync_on_finish when we initialize vb2 buffer.

Currently these flags are set/adjusted only in V4L2's
vb2_queue_or_prepare_buf(), which means that for the code
paths that don't use V4L2 vb2 will always tell videobuf2
core to skip ->prepare() and ->finish() cache syncs/flushes.
Fix this by setting cache sync hints for new buffers; except
VB2_MEMORY_DMABUF buffers, for which DMA exporter syncs
caches.

Fixes: f5f5fa73fbfb ("media: videobuf2: handle V4L2 buffer cache flags")
Reported-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4eab6d81cce1..89e38392509c 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -414,6 +414,17 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 		vb->index = q->num_buffers + buffer;
 		vb->type = q->type;
 		vb->memory = memory;
+		/*
+		 * We need to set these flags here so that the videobuf2 core
+		 * will call ->prepare()/->finish() cache sync/flush on vb2
+		 * buffers when appropriate. However, we can avoid explicit
+		 * ->prepare() and ->finish() cache sync for DMABUF buffers,
+		 * because DMA exporter takes care of it.
+		 */
+		if (q->memory != VB2_MEMORY_DMABUF) {
+			vb->need_cache_sync_on_prepare = 1;
+			vb->need_cache_sync_on_finish = 1;
+		}
 		for (plane = 0; plane < num_planes; ++plane) {
 			vb->planes[plane].length = plane_sizes[plane];
 			vb->planes[plane].min_length = plane_sizes[plane];
-- 
2.29.2

