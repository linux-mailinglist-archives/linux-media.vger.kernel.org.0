Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC0415276A
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 09:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgBEINy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 03:13:54 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42027 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgBEINy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 03:13:54 -0500
Received: by mail-pf1-f196.google.com with SMTP id 4so789348pfz.9
        for <linux-media@vger.kernel.org>; Wed, 05 Feb 2020 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9Kv2PfNZ/Q0TVvrr7RyiEmUt8JdC7LWiVIGz2BsjNHQ=;
        b=B/+U52J+m+NF1gTrJMaYYLbomtsbHRdQwfD9R2WT9UzF9JAwj8hL7iTffUJBnZw583
         nVEEhcTy/e7i+hr5oXqyl6TRCAnn1ks7LTIfnqPngvbvi/cv+dyJY2gf236C8iHzPF0P
         ZomPzoRAZ86kr3ZsKjUpMM+sUJPM7TCvVqs04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9Kv2PfNZ/Q0TVvrr7RyiEmUt8JdC7LWiVIGz2BsjNHQ=;
        b=OZjQqYNzfKhAWbHfwckXAbcMuPdew/XQzVUJVhUjUWa80/dmp+Rv8zuWqMZsVULSUC
         rQSy6ErCbiXudgcJr2LrvdjkTnXp5WO8M9rv1YiYA1YF3zUwl2Eot704vH3e//skOIVb
         4XQbaqZBGCtbhTS4Qt0/x4vtQBf3ZLcuxDdww7ilF3wKy1NZVkhuhgzuwsGvmlNgDtGH
         quSDswc8HeCB90GNbNsgaQAzp5DxCblKgAvw06tGqcaQYsxttDjaBDMEjfH85RUx1LOV
         dKqEY9d73k+rnJxFF/iiPXus0VewtywgXjWZhE+aL25ceURk44gc8wmtNJGF3H5yJxCr
         xEOQ==
X-Gm-Message-State: APjAAAWLQLzcCNSCxUvKS1zZ/rorIdDdAMMRhovIUfNJ1qCtHBLnQ28n
        9FJmBHR1ZbzoMyGmCdUdftAiuQ==
X-Google-Smtp-Source: APXvYqzNRlPWEekWO58tJEj8cBqvumvLPsg7qd6gYn8RHFbeCQwZHJLqQMEMKYBhZDm9nE1HE87fIA==
X-Received: by 2002:a63:36c2:: with SMTP id d185mr15733815pga.59.1580890433605;
        Wed, 05 Feb 2020 00:13:53 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id az9sm6415208pjb.3.2020.02.05.00.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 00:13:52 -0800 (PST)
Date:   Wed, 5 Feb 2020 17:13:50 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCHv2 02/12] videobuf2: handle V4L2 buffer cache flags
Message-ID: <20200205081350.GK41358@google.com>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-3-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204025641.218376-3-senozhatsky@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/04 11:56), Sergey Senozhatsky wrote:
> +static void set_buffer_cache_hints(struct vb2_queue *q,
> +				   struct vb2_buffer *vb,
> +				   struct v4l2_buffer *b)
> +{
> +	/*
> +	 * DMA exporter should take care of cache syncs, so we can avoid
> +	 * explicit ->prepare()/->finish() syncs. For other ->memory types
> +	 * we always need ->prepare() or/and ->finish() cache sync.
> +	 */
> +	if (q->memory == VB2_MEMORY_DMABUF) {
> +		vb->need_cache_sync_on_finish = 0;
> +		vb->need_cache_sync_on_prepare = 0;
> +		return;
> +	}
> +
> +	if (!q->allow_cache_hints)
> +		return;
> +
> +	vb->need_cache_sync_on_prepare = 1;
> +	/*
> +	 * ->finish() cache sync can be avoided when queue direction is
> +	 * TO_DEVICE.
> +	 */
> +	if (q->dma_dir != DMA_TO_DEVICE)
> +		vb->need_cache_sync_on_finish = 1;
> +	else
> +		vb->need_cache_sync_on_finish = 0;
> +
> +	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
> +		vb->need_cache_sync_on_finish = 0;
> +
> +	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
> +		vb->need_cache_sync_on_prepare = 0;
> +}

Last minute changes (tm), sorry. This is not right.


====8<====8<====

From: Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] videobuf2: handle V4L2 buffer cache flags

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

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index eb5d5db96552..8ef57496b34a 100644
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
+	vb->need_cache_sync_on_prepare = 1;
+	vb->need_cache_sync_on_finish = 1;
+
+	if (!q->allow_cache_hints)
+		return;
+
+	/*
+	 * ->finish() cache sync can be avoided when queue direction is
+	 * TO_DEVICE.
+	 */
+	if (q->dma_dir == DMA_TO_DEVICE)
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

