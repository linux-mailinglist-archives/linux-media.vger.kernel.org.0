Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03F0C151453
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 03:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbgBDC46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 21:56:58 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42663 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727160AbgBDC44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 21:56:56 -0500
Received: by mail-pl1-f194.google.com with SMTP id e8so4034161plt.9
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 18:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Dke3it4jAnnj8WZ58EOkoMCd5ygI2w9KJwtDCLTtPs=;
        b=WBTkzktPfQdyYJ/1Dp7tR7niJ57O1QuyCseggC0VAGq6KLGfx8m5m0cbGFUWSOl9oS
         1b2VUGd1r6Vfy3ZaYWNwj7GS3vAKBbrDy6MCWr5GteDpDpOYRuYabQKVfXh9M2wJfAgV
         1ENDVx0kml5b/I1+xEeFL9HJ8vL0yLWw/1UC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Dke3it4jAnnj8WZ58EOkoMCd5ygI2w9KJwtDCLTtPs=;
        b=OzZRRQ//GyzOGyhWFIcIcLANUkAFepo7sQtzOlesRVvt+pPJsK5WsFZCsokMzmd0D3
         P96fjYQ1v8Fzc/vsxMMcsETyv47quzOEe1/AJE3/hr93rlH+cff8MqaASnJImSxlbNXS
         lmMyjsEmr3269x2fQnV815sSozCpuZgsRIT+JDlMwUGWAaPYkBvKOgSclCA/eFYwFsO8
         VKnV0cZLnj2KWhWvxQCi9GaoBPoOHpMpX54xyZSvyhuA5J4P3QEn8HBY+dXlkxin2dmj
         HFUEDImRcSXMD6E0VjijjjwLDPfpna/oXjAF4R8wxaJX8f7YJnprQC1M4QbOQFLyJ19u
         yAww==
X-Gm-Message-State: APjAAAV2fvOQnwZCovq8XRq/kn2BVp79auk/oC7kxASi2XWLFSo5Ma0u
        mFIJdf9edt69HqtjMP5hGzF1gw==
X-Google-Smtp-Source: APXvYqwFXZwVlWO8JJd9nP2tmu7pAXbLJCOTiydwVfbrp3yoOhZx3asfPWnN3Ku98Czzg/Yns7mIXg==
X-Received: by 2002:a17:90a:fb41:: with SMTP id iq1mr3133875pjb.89.1580785016239;
        Mon, 03 Feb 2020 18:56:56 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e1sm22491971pfl.98.2020.02.03.18.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 18:56:55 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCHv2 02/12] videobuf2: handle V4L2 buffer cache flags
Date:   Tue,  4 Feb 2020 11:56:31 +0900
Message-Id: <20200204025641.218376-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204025641.218376-1-senozhatsky@chromium.org>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set video buffer cache management flags corresponding to V4L2 cache
flags.

Both ->prepare() and ->finish() cache management hints should be
passed during this stage (buffer preparation), because there is no
other way for user-space to skip ->finish() cache flush.

There are two possible alternative approaches:
- The first one is to move cache sync from ->finish() to dqbuf().
  But this breaks some drivers, that need to fix-up buffers before
  dequeueing them.

- The second one is to move ->finish() call from ->done() to dqbuf.

Change-Id: I3bef1d1fb93a5fba290ce760eaeecdc8e7d6885a
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index eb5d5db96552..2da06a2ad6c4 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -337,6 +337,41 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 	return 0;
 }
 
+static void set_buffer_cache_hints(struct vb2_queue *q,
+				   struct vb2_buffer *vb,
+				   struct v4l2_buffer *b)
+{
+	/*
+	 * DMA exporter should take care of cache syncs, so we can avoid
+	 * explicit ->prepare()/->finish() syncs. For other ->memory types
+	 * we always need ->prepare() or/and ->finish() cache sync.
+	 */
+	if (q->memory == VB2_MEMORY_DMABUF) {
+		vb->need_cache_sync_on_finish = 0;
+		vb->need_cache_sync_on_prepare = 0;
+		return;
+	}
+
+	if (!q->allow_cache_hints)
+		return;
+
+	vb->need_cache_sync_on_prepare = 1;
+	/*
+	 * ->finish() cache sync can be avoided when queue direction is
+	 * TO_DEVICE.
+	 */
+	if (q->dma_dir != DMA_TO_DEVICE)
+		vb->need_cache_sync_on_finish = 1;
+	else
+		vb->need_cache_sync_on_finish = 0;
+
+	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
+		vb->need_cache_sync_on_finish = 0;
+
+	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
+		vb->need_cache_sync_on_prepare = 0;
+}
+
 static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
 				    struct v4l2_buffer *b, bool is_prepare,
 				    struct media_request **p_req)
@@ -381,6 +416,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 	}
 
 	if (!vb->prepared) {
+		set_buffer_cache_hints(q, vb, b);
 		/* Copy relevant information provided by the userspace */
 		memset(vbuf->planes, 0,
 		       sizeof(vbuf->planes[0]) * vb->num_planes);
-- 
2.25.0.341.g760bfbb309-goog

