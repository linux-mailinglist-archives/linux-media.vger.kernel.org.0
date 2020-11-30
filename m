Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648642C827D
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgK3KpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgK3KpW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:45:22 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7645C0613CF;
        Mon, 30 Nov 2020 02:44:42 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id hk16so1115487pjb.4;
        Mon, 30 Nov 2020 02:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GrM70gkp9e4fwI5HQ6WdFTrPmrFyIWmRIyF76LjdktE=;
        b=uPgNlyPALK1R7u3+hjkx0V8MZBIeF8aIaXzTTL+50oM928MI8S4cllx9FccPO3Bn4x
         zqFcJx8BLRj4SJP0a+WS/ZBuYhivJWAooJS1lg5VKI4Uq3CKLucdtzcbvujEMiNJlNDG
         q048Xi4w5J4bBz/i4T3dPz2WhySju/sBJ/H1xjkdHDLNTZ2zfGsyK5p0QXvQO0SAjr32
         qJ06T3L+ybHtp/nlRg6PqflWsTVyW8cPBkdTbKnM/wnbplOOy/CWp7Cf3WvB/fTlp+8D
         Zd3I2SQyiJ0BuKGqZ0NckdZjuTsMJniE/EJWmAeIhSFv6ibYk/oK1KgXDBlUslnQz7Vl
         FwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GrM70gkp9e4fwI5HQ6WdFTrPmrFyIWmRIyF76LjdktE=;
        b=VNpdVVTGbEubml1DaxHldTMiCQ0JDyNQyGRTK4GaYWAhFHtFeyqlABxmZPIGLnuKAm
         godTvsL4YxH8SrLxlXIsOmlSOGyuuLroS2P7+JnKymy5omkoCat4sz0wi4WL0I/xkAL3
         m6u9tp6m7X966ZziVYSkAwk9VmGaq6jvFjNVCL0KnhHNWkCP5JWfVzFAA+U2+iJ8poH5
         Tv1aPeV37DL1qgO94WqRe+lyTEX5zoHp0EfMi08oKT8Zrre/ZLzNfSqqlYkzy7XCkh2u
         No4Oemm4IjLBvcOo9pog08ckeVp6BdIvI9p4zwMns9U4aisng3Hg0Smu0oEjPSuSKfaW
         1lrg==
X-Gm-Message-State: AOAM533idNur5ZAi/A83fSg0mGlaY9ViVwg6TZ1L4y5w7PXPaSAk+UyG
        mL45R7Jug6YQeEBRb1SbDOk=
X-Google-Smtp-Source: ABdhPJzieyL19+RD/XDOgUBwEMEjeOuPoQakYO6urym2MP0tf5UorfepPVyJsT3OxLBRnovwQLmwNg==
X-Received: by 2002:a17:90a:cce:: with SMTP id 14mr15322280pjt.163.1606733082212;
        Mon, 30 Nov 2020 02:44:42 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id h13sm10176158pfq.175.2020.11.30.02.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 02:44:41 -0800 (PST)
Date:   Mon, 30 Nov 2020 19:44:39 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv3] media: vb2: always set buffer cache sync hints
Message-ID: <X8TNFwqthPkph/+p@jagdpanzerIV.localdomain>
References: <20201129031545.557586-1-sergey.senozhatsky@gmail.com>
 <6cf9bf76-3875-5c89-cebe-a4e44ee1f326@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cf9bf76-3875-5c89-cebe-a4e44ee1f326@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/11/30 11:02), Hans Verkuil wrote:
> > @@ -414,6 +414,20 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
> >  		vb->index = q->num_buffers + buffer;
> >  		vb->type = q->type;
> >  		vb->memory = memory;
> > +		/*
> > +		 * A workaround fix. We need to set these flags here so that
> > +		 * videobuf2 core will call ->prepare()/->finish() cache
> > +		 * sync/flush on vb2 buffers when appropriate. Otherwise, for
> > +		 * backends that don't rely on V4L2 (perhaps dvb) these flags
> > +		 * will always be false and, hence, videobuf2 core will skip
> > +		 * cache sync/flush operations. However, we can avoid explicit
> > +		 * ->prepare() and ->finish() cache sync for DMABUF buffers,
> > +		 * because DMA exporter takes care of it.
> > +		 */
> > +		if (q->memory != VB2_MEMORY_DMABUF) {
> > +			vb->need_cache_sync_on_prepare = 1;
> > +			vb->need_cache_sync_on_finish = 1;
> > +		}
> 
> Is this a work-around fix? Isn't this just a bug fix? It seems reasonable
> to always set this when allocating buffers for a queue. And for v4l2 these
> values can be changed if supported by the driver (allow_cache_hints is set).

Yes, it's a bug fix. It's a workaround bug fix in a sense that a proper
bug fix is to rename these flags and invert them (and patch all the
functions that set and test them). A sneak preview of what's in my tree:

---

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index bd78f6c7f342..3b79042d9d5c 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -264,10 +264,10 @@ struct vb2_buffer {
         *                      after the 'buf_finish' op is called.
         * copied_timestamp:    the timestamp of this capture buffer was copied
         *                      from an output buffer.
-        * need_cache_sync_on_prepare: when set buffer's ->prepare() function
-        *                      performs cache sync/invalidation.
-        * need_cache_sync_on_finish: when set buffer's ->finish() function
-        *                      performs cache sync/invalidation.
+        * no_cache_sync_on_prepare: when set buffer's ->prepare() function
+        *                      skips cache sync/invalidation.
+        * no_cache_sync_on_finish: when set buffer's ->finish() function
+        *                      skips cache sync/invalidation.
         * queued_entry:        entry on the queued buffers list, which holds
         *                      all buffers queued from userspace
         * done_entry:          entry on the list that stores all buffers ready
@@ -278,8 +278,8 @@ struct vb2_buffer {
        unsigned int            synced:1;
        unsigned int            prepared:1;
        unsigned int            copied_timestamp:1;
-       unsigned int            need_cache_sync_on_prepare:1;
-       unsigned int            need_cache_sync_on_finish:1;
+       unsigned int            no_cache_sync_on_prepare:1;
+       unsigned int            no_cache_sync_on_finish:1;
 
        struct vb2_plane        planes[VB2_MAX_PLANES];
        struct list_head        queued_entry;

---

and it's much bigger than a 3-liner ("workaround") fix.

> So the comment would be:
> 
> 	/*
> 	 * We need to set these flags here so that the videobuf2 core
> 	 * will call ->prepare()/->finish() cache sync/flush on vb2
> 	 * buffers when appropriate. However, we can avoid explicit
> 	 * ->prepare() and ->finish() cache sync for DMABUF buffers,
> 	 * because DMA exporter takes care of it.
> 	 */
> 
> The commit message would need to be modified as well.

OK.

	-ss
