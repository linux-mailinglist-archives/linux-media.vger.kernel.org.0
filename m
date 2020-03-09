Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0C3A17D857
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 04:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgCIDoS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Mar 2020 23:44:18 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35878 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgCIDoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Mar 2020 23:44:18 -0400
Received: by mail-pl1-f195.google.com with SMTP id g12so3419905plo.3;
        Sun, 08 Mar 2020 20:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SZYwS0wBSR9ObIxr/+MURp0MdHoz2IhLi0TZLfZyOTU=;
        b=eup1A0DeKBFVOz6T3J0URSdmZ1hQudQEv1N41R+lHlOEiLqLDRnb6LeUNBLT5K/NYW
         FE8ncknBevLDVp9K2QIXi1QQuebxCMB9EFWTaUOvve1h6LvDfmLQalY5Q3uPBcPQ4C3+
         gf2s8hqmolWy9hxaiU8ClJf2uIth8NMoihf962Pzi1Huk9bplvt3RCIZFmQgqIijzULH
         v5nNSNsyaNBcGPtZMWVDeaMg3AWSLg7C1TGxwGVLyi3iGRD4l/xjbojhAvCj7q5mOo7e
         W57RtFVOD5UMCOmA8/W09pUbU9O/Y2q0esSwg7myRM+Vi+MeLI/QA3znlkaMUJB5shi2
         VuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SZYwS0wBSR9ObIxr/+MURp0MdHoz2IhLi0TZLfZyOTU=;
        b=kPnyPtoLffOHoffNTic92uMAeFkTDP/xtBBq7AKTcO9HlPqbhH8YX2+/YiCEKvCttB
         PGf4kAUcMDJx5i2TGCM6q0Kr/UPW3Vgtc66TNe93Dm91P4QV9IznKp22h+su6WbQsYGf
         5x1Fq1anjp8IZfCF3GIypNHAUmnjhuxTIFN7DNQW9HSUI5NpRhvExt8AokqlJ1AdOrpn
         lMSPveo/pP9PznEHWM+8U4v9AXyp1pNn/oDkAi9cYU6IUItsWOcOAtY0sYHDClUdb/N+
         gpTtkpbwML4kcHs/e8nM/GmOFUujJ3Kyu6ZeXg/wzNnZkbp20mBtoGgmjLgS5Ohn86bw
         wx9Q==
X-Gm-Message-State: ANhLgQ0W6X0iV5slbLlrgt+kBE+Ra7mDOEE1fRoAxNVCmgkLRYc6yr2d
        +fvYUk/EWL8aizFlwzMKSOE=
X-Google-Smtp-Source: ADFU+vvG+YKWPdRs9C1NLT8ETuvdO7X1tBR1oGdPAbynQM0KWoPZUudW2me8RoQqL4qPrvbi/EXOBg==
X-Received: by 2002:a17:90a:bf83:: with SMTP id d3mr16756667pjs.77.1583725455161;
        Sun, 08 Mar 2020 20:44:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abc:f604:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id 13sm41391456pgo.13.2020.03.08.20.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 20:44:14 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Mon, 9 Mar 2020 12:44:11 +0900
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
Message-ID: <20200309034411.GA856@jagdpanzerIV.localdomain>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
 <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
 <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
 <20200309032707.GA9460@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309032707.GA9460@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/09 12:27), Sergey Senozhatsky wrote:
> On (20/03/07 12:47), Hans Verkuil wrote:
> > 
> > Create those tests in v4l2-compliance: that's where they belong.
> >
> > You need these tests:
> > 
> > For non-MMAP modes:
> > 
> > 1) test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is never set.
> > 
> > If V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is not set, then:
> > 
> > 1) attempting to use V4L2_FLAG_MEMORY_NON_CONSISTENT will clear the flag
> >    upon return (test with both reqbufs and create_bufs).
> > 2) attempting to use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
> >    will clear those flags upon return (do we actually do that in the patch series?).
> 
> NO_CACHE_INVALIDATE/NO_CACHE_CLEAN are cleared in vb2_fill_vb2_v4l2_buffer()
> [as was suggested], then the struct is copied back to user. But I think it
> would be better to clear those flags when we clear
> V4L2_FLAG_MEMORY_NON_CONSISTENT. We have 4 places which do something
> like
> 	"if !vb2_queue_allows_cache_hints(q) then clear flags bit".

No. I'll just move NO_CACHE_INVALIDATE/NO_CACHE_CLEAN handling to
set_buffer_cache_hints(). This is where we take care of q->memory
and q->allow_cache_hints, this is where we set/clear the
->need_cache_sync flags, this is where we also can clear v4l2_buffer
->flags. Seems like a better place than vb2_fill_vb2_v4l2_buffer().

---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index b4b379f3bf98..0a6bd4a1f58e 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -199,15 +199,6 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 	vbuf->request_fd = -1;
 	vbuf->is_held = false;
 
-	/*
-	 * Clear buffer cache flags if queue does not support user space hints.
-	 * That's to indicate to userspace that these flags won't work.
-	 */
-	if (!vb2_queue_allows_cache_hints(q)) {
-		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
-		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
-	}
-
 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
 		switch (b->memory) {
 		case VB2_MEMORY_USERPTR:
@@ -368,8 +359,16 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 	vb->need_cache_sync_on_prepare = 1;
 	vb->need_cache_sync_on_finish = 1;
 
-	if (!vb2_queue_allows_cache_hints(q))
+	if (!vb2_queue_allows_cache_hints(q)) {
+		/*
+		 * Clear buffer cache flags if queue does not support user
+		 * space hints. That's to indicate to userspace that these
+		 * flags won't work.
+		 */
+		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
+		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
 		return;
+	}
 
 	/*
 	 * ->finish() cache sync can be avoided when queue direction is
-- 
2.25.1

