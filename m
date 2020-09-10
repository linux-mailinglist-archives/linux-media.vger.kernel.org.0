Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2372642CD
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 11:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730257AbgIJJts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 05:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730212AbgIJJtY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 05:49:24 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BD1C061573;
        Thu, 10 Sep 2020 02:49:24 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l191so3962083pgd.5;
        Thu, 10 Sep 2020 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0NQ+a9KQEbzMM5sdoMMRb5gXhwNV9GMKx6J1Y6SP+Gw=;
        b=u8DEnU6pW1TMzldKTa3l0quR+RG3X0/tl5bmWZI2ZK3U6O97hRTDdQuxbJHViTr5fD
         pe97hLFffwUU6ygySd/kGPTpE3xsVqOWm+AweNf/Ovz/ua/rQe3/qZxkUMw345Qzbo9L
         ELhWVlKjGrqaoEgNHYjq+jIDsnxzFDW8Xzlk2KxXWZjU1XRS67XMDJPyfujvsAlETD6Z
         nUM1a6+W+NlA4f2ZJKqTzKcqaC3jMQT3kDptLYKYipvIRy5Lo8gfGDtW3tguMSUdSjzw
         g3srjyMtwlWAzuZLm58dD7IDb8i3t0IXD7UMzHTqN/i94E0X71uhibruOH8Wg89QLmGL
         qgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0NQ+a9KQEbzMM5sdoMMRb5gXhwNV9GMKx6J1Y6SP+Gw=;
        b=Ry6CcEhi741DQAMxeaErC/CB9pniHV9p7apH39/ZsYzbZHyGKXgxuaV5otIHF1sqOm
         ofhtuJpAouXFMHY3NN2LCmPz9qKQ373Tx/4i+jp4Xm8mqBvnE4JL6wQ22tgQBBRzDVIZ
         LAKMhhX+7tl2DnlQm7XD+1ZCGX1A2j1cofD7khWlnC0BEeH3HB6rYpmD053bFj6b8PH2
         QvmW2Ya8J7boG2hbocAbByfScjiMtnZDb1hM8E2q3Acbj8mFRnsGzjpo8IP/2P3tI9vG
         qnD+Evd9Br2rdI+BcKAA8wgIN9CTQBlMrhb/ij+y6d5zaLdkF+n21M8Vh30t2q5fvl6y
         yK5g==
X-Gm-Message-State: AOAM532jO08ZUBXwkqcdpx/V0e9bdL1V3+hKDl7x8xQZX+9kVIepQehb
        oHHEl+pgACeZhdwtnG1qcIw=
X-Google-Smtp-Source: ABdhPJzrTY6CsfC7FjDtfHA9mZgjKmywAlg84YDwyRcm+jYhVS0KtWmtdyaA3rJT7yo7gLY3SRKK9Q==
X-Received: by 2002:aa7:9edb:0:b029:13e:d13d:a059 with SMTP id r27-20020aa79edb0000b029013ed13da059mr4786303pfq.31.1599731363604;
        Thu, 10 Sep 2020 02:49:23 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id j14sm4555941pgf.76.2020.09.10.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 02:49:22 -0700 (PDT)
Date:   Thu, 10 Sep 2020 18:49:21 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
Message-ID: <20200910094921.GB97481@google.com>
References: <20200819135454.GA17098@lst.de>
 <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de>
 <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
 <20200820165407.GD12693@lst.de>
 <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
 <20200901110617.GA13232@lst.de>
 <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
 <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On (20/09/08 23:58), Tomasz Figa wrote:
> 
> Given the above, we would like to make changes that affect the UAPI.
> Would you still be able to revert this series?
>

If we want to apply only "media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT"
patch and keep the rest of the buffer cache hints series in the kernel, then
I'd add one or two more patches. We don't need ->flags argument in
create_bufs() and reqbufs() functions, that argument was introduced in order
to pass in the requested coherency flag.


Now.

Then we have a question - do we need flags member in struct
v4l2_requestbuffers and v4l2_create_buffers or shall we just
return back those 4 bytes to reserved[]? We pass BUF_FLAG_NO_CACHE_INVALIDATE
and V4L2_BUF_FLAG_NO_CACHE_SYNC in struct v4l2_buffer.flags.

If we decide to remove v4l2_requestbuffers and v4l2_create_buffers ->flags,
then we also need to rollback documentation changes.

Then we need to change CLEAR_AFTER_FIELD(foo, capabilities) in
v4l2-ioctl to zero out reserved[] areas in v4l2_requestbuffers
and v4l2_create_buffers. I think v4l2_create_buffers is fine,
but requstbuffers has flags and reversed[1] in the union so for
requestbuffers we simply removed the CLEAR_AFTER_FIELD() and
hence dropped the corresponding check from v4l-compliance.

So, do we plan on using .flags in v4l2_requestbuffers and
v4l2_create_buffers?


- create_bufs()/reqbufs() flags argument removal patch
(no struct-s/documentation cleanup yet).

====8<====
Subject: [PATCH] remove redundant flags argument

---
 drivers/media/common/videobuf2/videobuf2-core.c | 10 +++++-----
 drivers/media/common/videobuf2/videobuf2-v4l2.c |  6 ++----
 include/media/videobuf2-core.h                  |  6 ++----
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 66a41cef33c1..4eab6d81cce1 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -722,7 +722,7 @@ int vb2_verify_memory_type(struct vb2_queue *q,
 EXPORT_SYMBOL(vb2_verify_memory_type);
 
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
-		     unsigned int flags, unsigned int *count)
+		     unsigned int *count)
 {
 	unsigned int num_buffers, allocated_buffers, num_planes = 0;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
@@ -861,7 +861,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
 
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-			 unsigned int flags, unsigned int *count,
+			 unsigned int *count,
 			 unsigned int requested_planes,
 			 const unsigned int requested_sizes[])
 {
@@ -2547,7 +2547,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 	fileio->memory = VB2_MEMORY_MMAP;
 	fileio->type = q->type;
 	q->fileio = fileio;
-	ret = vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
+	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
 	if (ret)
 		goto err_kfree;
 
@@ -2604,7 +2604,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 
 err_reqbufs:
 	fileio->count = 0;
-	vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
+	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
 
 err_kfree:
 	q->fileio = NULL;
@@ -2624,7 +2624,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
 		vb2_core_streamoff(q, q->type);
 		q->fileio = NULL;
 		fileio->count = 0;
-		vb2_core_reqbufs(q, fileio->memory, 0, &fileio->count);
+		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
 		kfree(fileio);
 		dprintk(q, 3, "file io emulator closed\n");
 	}
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index d2879f53455b..96d3b2b2aa31 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -728,8 +728,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory,
-					    req->flags, &req->count);
+	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -804,7 +803,6 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
 	return ret ? ret : vb2_core_create_bufs(q, create->memory,
-						create->flags,
 						&create->count,
 						requested_planes,
 						requested_sizes);
@@ -993,7 +991,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 		return res;
 	if (vb2_queue_is_busy(vdev, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
+	res = vb2_core_reqbufs(vdev->queue, p->memory, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4c7f25b07e93..bbb3f26fbde9 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -744,7 +744,6 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * vb2_core_reqbufs() - Initiate streaming.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @memory:	memory type, as defined by &enum vb2_memory.
- * @flags:	auxiliary queue/buffer management flags.
  * @count:	requested buffer count.
  *
  * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
@@ -769,13 +768,12 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
-		    unsigned int flags, unsigned int *count);
+		    unsigned int *count);
 
 /**
  * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
  * @q: pointer to &struct vb2_queue with videobuf2 queue.
  * @memory: memory type, as defined by &enum vb2_memory.
- * @flags: auxiliary queue/buffer management flags.
  * @count: requested buffer count.
  * @requested_planes: number of planes requested.
  * @requested_sizes: array with the size of the planes.
@@ -793,7 +791,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
  * Return: returns zero on success; an error code otherwise.
  */
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
-			 unsigned int flags, unsigned int *count,
+			 unsigned int *count,
 			 unsigned int requested_planes,
 			 const unsigned int requested_sizes[]);
 
-- 
2.28.0.526.ge36021eeef-goog

