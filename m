Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF71B406CE8
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 15:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbhIJNdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 09:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbhIJNc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 09:32:59 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470C6C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 06:31:48 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id k17so1181545pls.0
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rP/dGPeMLakxogwYWFLc1h1LrzToapsX/63ErCegPcY=;
        b=Jp5vIFD7pIbZUjbE+KgnxwUHxG5QFT6HC7X1ZaozRwSkqo7MPPlrx2+b3/bOYio8Hr
         Wzz/8A7dS6ssEBnX/B8eTD6pDQ6i6GzTEe/YeleJJCOzrDRwWNc03cIakmLOS1c9oTqU
         /q4CjpkqryRjqJThY+cmcpfue8o6508fn8U84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rP/dGPeMLakxogwYWFLc1h1LrzToapsX/63ErCegPcY=;
        b=MyDuxZC13+UR+s/g/Ov1E5gWPEGlVVTXBZye2ez0BJSQsDmMSER8fS7PhbyuBhLBnm
         H5p6c5x8xFWRmweYHd6P9gLGUv7/05SlUrhEMfEz4qE+KT7U3APi4NhnSGTKnvqnLrcv
         AF7cjiH33KMnqieaoSNxa2rz+PszHF/0RvCJFIy+niOrOV71Llvq8QNUtXGP/qgTO2nV
         OtoVoi6DYj3026gZNvTFMs/B0XKJ1Fu05zFbhu52e6wGjst/BN0FuPgTUthWrOkRa/C+
         osDuFEZUBSSiidkxnQkXtch3sA6/wWCkXHc6MhtW1SusRdzcLtRTHBaQM9iFbkhlqtTj
         /kGQ==
X-Gm-Message-State: AOAM5316quS0KlFoEU4inKZkTLmODKuWZwdI+ALpZPVmSr3jv+dlbHD7
        gudrOfYzRdQlfITTehsMPpD06A==
X-Google-Smtp-Source: ABdhPJxWp5B/x2VkNJG/BRfhkO/CGbPE64ffF+QTHlfkZjwoiQd9ZCQG+1art5YPjhym+yQh/z2aLA==
X-Received: by 2002:a17:902:6546:b0:13a:339a:6616 with SMTP id d6-20020a170902654600b0013a339a6616mr7832326pln.34.1631280707662;
        Fri, 10 Sep 2021 06:31:47 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:7627:5944:d90:b374])
        by smtp.gmail.com with ESMTPSA id n3sm4999019pfo.101.2021.09.10.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 06:31:47 -0700 (PDT)
Date:   Fri, 10 Sep 2021 22:31:42 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] v4l-compliance: re-introduce NON_COHERENT and cache
 hints tests
Message-ID: <YTtePjJoynZ4imCp@google.com>
References: <20210709092227.1051346-1-senozhatsky@chromium.org>
 <619afe51-4cba-95e0-69bc-bb96e1f88aae@xs4all.nl>
 <YTtUOXF1qGbL+q0V@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTtUOXF1qGbL+q0V@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/09/10 21:48), Sergey Senozhatsky wrote:
> > Streaming ioctls:
> >         test read/write: OK (Not Supported)
> >         test blocking wait: OK
> >         Video Capture: Captured 8 buffers
> >         test MMAP (no poll): OK
> >         Video Capture: Captured 8 buffers
> >         test MMAP (select): OK
> >         Video Capture: Captured 8 buffers
> >         test MMAP (epoll): OK
> >         Video Capture: Captured 8 buffers
> >         test USERPTR (no poll): OK
> >         Video Capture: Captured 8 buffers
> >         test USERPTR (select): OK
> >                 fail: v4l2-test-buffers.cpp(1869): !(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
> >                 fail: v4l2-test-buffers.cpp(1932): setupDmaBuf(expbuf_node, node, q, exp_q)
> >         test DMABUF (no poll): FAIL
> >                 fail: v4l2-test-buffers.cpp(1869): !(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
> >                 fail: v4l2-test-buffers.cpp(1932): setupDmaBuf(expbuf_node, node, q, exp_q)
> >         test DMABUF (select): FAIL
> > 
> > The same happens with e.g. vivid, but vim2m is quicker to test.
> > 
> > I'm not sure whether this is a bug in this v4l2-compliance patch or whether it is
> > a bug in the v6 series, but it should be checked.
> 
> Looking into it now. I ran v4l2-compliance, but not "contrib/test/test-media"

AFAICT the problem is in v4l2-compliance patch.

We clear request flags if queue does not support user-space cache hints:

	 q->allow_cache_hints && q->memory == VB2_MEMORY_MMAP

But for DMABUF buffers (only) we set cache hints internally in
set_buffer_cache_hints() and always skip cache sync/flush on
prepare/finish regardless of what is passed from the user-space:

       if (q->memory == VB2_MEMORY_DMABUF) {
               vb->skip_cache_sync_on_finish = 1;
               vb->skip_cache_sync_on_prepare = 1;
               return;
       }

Technically we don't support user-space cache hints for DMABUF, so we
clear passed user-space cache hint flags.

I think the fix should look like this (tested with "test-media vivid"):

---

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 9b87c90f..baa306f1 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -1865,9 +1865,10 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
 				fail_on_test(!buf.g_bytesused(p));
 		}
 		flags = buf.g_flags();
-		/* We always skip cache sync/flush for DMABUF memory type */
-		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
-		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
+
+		/* Make sure that flags are cleared */
+		fail_on_test((flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
+		fail_on_test((flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
 		fail_on_test(flags & V4L2_BUF_FLAG_DONE);
 		fail_on_test(buf.querybuf(node, i));
 		fail_on_test(buf.check(q, Queued, i));
