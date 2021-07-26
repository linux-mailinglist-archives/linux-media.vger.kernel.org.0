Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A43D3D5252
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 06:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbhGZDjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 23:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhGZDjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 23:39:42 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26874C061757
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:20:12 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso9446414pjq.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jul 2021 21:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xh5D3dZbhcoviOqSnj3v4bLJEEdVuYNzgNkqPhedr0I=;
        b=eWcuHF6pCIybLXqkbFu136Y5onDUnzNtUc3zlccXqi9FE6XV2pRIQDBhiQtJRaq35B
         k90fQsqUzCwELlpTUM6bd62YE1kZlMispVAQuJTR1ywEp6Ip0FjkvkJJD6sjyunfqKza
         9FqAZgZOHPz0tnlvDSjxhtmoNhdqbP/ybmExM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xh5D3dZbhcoviOqSnj3v4bLJEEdVuYNzgNkqPhedr0I=;
        b=pBKt3j6GkTiyBl4dNATbbn/pPsIK3PaXN+b2+/F4X3r9zvbjFT5fiXjLTbWxbZnSVs
         aFnYSaLF6DbrFIFOryC321SPrc5KG9dqfdfjurDuU7ztqFE/ArkEQQi9BhUwSZ036dh3
         kasRtNvyof6FN3b2l0ATRMTZf0iKkjdo7ebNoRdcadfT9xcjpr++R/HDVXeRpRB2KEns
         qCNdgW/efbCbwtDSzOMGdmEpGAIhKZyhK/SjTSJ6jezQR2GHumHLC49N0/r8ZtfAcnah
         D6Dzzy8F3FUHty7OK61OVjsHkV9nxFlxcDX1+jrSfqIwSSda5bI2iYsE+lOIOAD8BNX3
         mdQA==
X-Gm-Message-State: AOAM531sVFMJlgiJeYIoG/1na4SDm3qjoUI+oBGSABj3PDvSFaE2kgmb
        xsBj+ay+Bc8NgH6Q+QNaIHm3jQ==
X-Google-Smtp-Source: ABdhPJwwuAa/igdIiV1qXIYBm/z8OAHhUntR9m6H1tZsQKV35ltRSMQU/GcWUbJ8TAMk4rnGUwqXsQ==
X-Received: by 2002:a63:4b20:: with SMTP id y32mr16314386pga.382.1627273211652;
        Sun, 25 Jul 2021 21:20:11 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:d699:4331:827:4150])
        by smtp.gmail.com with ESMTPSA id y7sm12443199pjb.52.2021.07.25.21.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 21:20:11 -0700 (PDT)
Date:   Mon, 26 Jul 2021 13:20:05 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv3 7/8] videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT
 flag
Message-ID: <YP439RUKhVeAm945@google.com>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
 <20210709092027.1050834-8-senozhatsky@chromium.org>
 <0c89ef1e-8abb-8749-bbce-c7e5a2e2f304@collabora.com>
 <YP4Sfo0PjLokYi3B@google.com>
 <YP40paMcGjlfofi8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YP40paMcGjlfofi8@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/07/26 13:05), Sergey Senozhatsky wrote:
> On (21/07/26 10:40), Sergey Senozhatsky wrote:
> > On (21/07/22 19:33), Dafna Hirschfeld wrote:
> > [..]
> > > >   int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
> > > >   {
> > > >   	int ret = vb2_verify_memory_type(q, req->memory, req->type);
> > > > +	u32 flags = req->flags;
> > > >   	fill_buf_caps(q, &req->capabilities);
> > > > -	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
> > > > +	validate_memory_flags(q, req->memory, &flags);
> > > > +	req->flags = flags;
> > > 
> > > you can do instead
> > > 
> > > validate_memory_flags(q, req->memory, &req->flags);
> > 
> > ->flags are u32 for create-bufs and u8 for reqi-bufs. So `*flags = <value>`
> > can write to ->reserved[] for req-bufs (if the value is huge enough).
> 
> I guess ->flags can become u8 for both create-bufs and req-bufs.
> We had ->flags in both structs as u32, but then decided to leave
> some reserved[] space in req-bufs and switched to u8 there.

Something like this

---

diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index a048a9f6b7b6..cf633b5a4919 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
@@ -112,13 +112,13 @@ than the number requested.
 	other changes, then set ``count`` to 0, ``memory`` to
 	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
 
-    * - __u32
+    * - __u8
       - ``flags``
       - Specifies additional buffer management attributes.
 	See :ref:`memory-flags`.
 
-    * - __u32
-      - ``reserved``\ [6]
+    * - __u8
+      - ``reserved``\ [27]
       - A place holder for future extensions. Drivers and applications
 	must set the array to zero.
 
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 6edf4508c636..2ae949ec0afa 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -694,7 +694,7 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 
 static void validate_memory_flags(struct vb2_queue *q,
 				  int memory,
-				  u32 *flags)
+				  u8 *flags)
 {
 	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
 		/*
@@ -711,11 +711,9 @@ static void validate_memory_flags(struct vb2_queue *q,
 int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 {
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
-	u32 flags = req->flags;
 
 	fill_buf_caps(q, &req->capabilities);
-	validate_memory_flags(q, req->memory, &flags);
-	req->flags = flags;
+	validate_memory_flags(q, req->memory, &req->flags);
 	return ret ? ret : vb2_core_reqbufs(q, req->memory,
 					    req->flags, &req->count);
 }
@@ -990,11 +988,9 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 {
 	struct video_device *vdev = video_devdata(file);
 	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
-	u32 flags = p->flags;
 
 	fill_buf_caps(vdev->queue, &p->capabilities);
-	validate_memory_flags(vdev->queue, p->memory, &flags);
-	p->flags = flags;
+	validate_memory_flags(vdev->queue, p->memory, &p->flags);
 	if (res)
 		return res;
 	if (vb2_queue_is_busy(vdev, file))
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 7973aa0465d2..ad4f7cee53f2 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2513,8 +2513,8 @@ struct v4l2_create_buffers {
 	__u32			memory;
 	struct v4l2_format	format;
 	__u32			capabilities;
-	__u32			flags;
-	__u32			reserved[6];
+	__u8			flags;
+	__u8			reserved[27];
 };
 
 /*
