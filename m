Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0417406D68
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 16:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbhIJORq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 10:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233890AbhIJORo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 10:17:44 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E66C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 07:16:32 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso1577343pjh.5
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 07:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gw+gLCH4fCh3RyF148MnGJMCmmJ7GK/O+08Kg6ZzZIU=;
        b=iGKa/dQ/+1b2SCObj5WlpAPCGiElDzjo26XEpjecBcMIOUB+ABwSNwYetiNhbPpjjP
         BtSbRcbsv8OjFrr8xovigvNf7WiTiIocIAATducN2RkKRBxpCRx2ZXDia3mZptZQTLWb
         Vl4jDx1kT4QYXTRkK4WNOpMo4w7e/YOknPwS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gw+gLCH4fCh3RyF148MnGJMCmmJ7GK/O+08Kg6ZzZIU=;
        b=z5nbFAkBp3ts/USq+s14/Y+OO1Q2Bv0Fl20HxMCVUUkIot0sxDC90zO/xJHsxVBDjC
         6+aooxGSPOGIWmSKcLF5tSIhibICMgW7sAOpNSGQeJSrxhPE1OD0Kd7AoWRdTrHh1M4M
         K3G+qa685tSFUsdgE8MdF+b24Zf4QzagYe0wPSwgkzNlOTALl5AG7CvsB9Hk5d0EVYzY
         76bQeU0erHEngLrxw6V2Y46KCf68ss8wV60v1kk82IozcmTYNo4eqAVQXq9DiuTarF93
         6aOaX48jCaFZhjkIstsaYAkTF2GNIO6BDwbbooLrhLh5aCtddvrYJN8IRFXODwRTO/tR
         fEug==
X-Gm-Message-State: AOAM5338JrzLK4YD3ErxnNCVSW+1ha/0f6ZmwQBWP0grf5CdipqAEWld
        lc62GOJOGZuaqaqwjIluMLKj9w==
X-Google-Smtp-Source: ABdhPJx/ZYE/fslknnTb9EgXTfXCY/KJOZR+QfvjM/8WANgcJTX0p3oHcALf2sE4fe/3ZRje9ASGgQ==
X-Received: by 2002:a17:902:be0f:b0:13a:95e:a51 with SMTP id r15-20020a170902be0f00b0013a095e0a51mr7888442pls.44.1631283392125;
        Fri, 10 Sep 2021 07:16:32 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:7627:5944:d90:b374])
        by smtp.gmail.com with ESMTPSA id e13sm270051pfc.137.2021.09.10.07.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:16:31 -0700 (PDT)
Date:   Fri, 10 Sep 2021 23:16:27 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] v4l-compliance: re-introduce NON_COHERENT and cache
 hints tests
Message-ID: <YTtouz4IG/UPq84K@google.com>
References: <20210709092227.1051346-1-senozhatsky@chromium.org>
 <619afe51-4cba-95e0-69bc-bb96e1f88aae@xs4all.nl>
 <YTtUOXF1qGbL+q0V@google.com>
 <YTtePjJoynZ4imCp@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTtePjJoynZ4imCp@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/09/10 22:31), Sergey Senozhatsky wrote:
> > Looking into it now. I ran v4l2-compliance, but not "contrib/test/test-media"
> 
> AFAICT the problem is in v4l2-compliance patch.
> 
> We clear request flags if queue does not support user-space cache hints:
> 
> 	 q->allow_cache_hints && q->memory == VB2_MEMORY_MMAP
> 
> But for DMABUF buffers (only) we set cache hints internally in
> set_buffer_cache_hints() and always skip cache sync/flush on
> prepare/finish regardless of what is passed from the user-space:
> 
>        if (q->memory == VB2_MEMORY_DMABUF) {
>                vb->skip_cache_sync_on_finish = 1;
>                vb->skip_cache_sync_on_prepare = 1;
>                return;
>        }
> 
> Technically we don't support user-space cache hints for DMABUF, so we
> clear passed user-space cache hint flags.
> 
> I think the fix should look like this (tested with "test-media vivid"):
> 
> ---
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 9b87c90f..baa306f1 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -1865,9 +1865,10 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
>  				fail_on_test(!buf.g_bytesused(p));
>  		}
>  		flags = buf.g_flags();
> -		/* We always skip cache sync/flush for DMABUF memory type */
> -		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
> -		fail_on_test(!(flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
> +
> +		/* Make sure that flags are cleared */
> +		fail_on_test((flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE));
> +		fail_on_test((flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN));
>  		fail_on_test(flags & V4L2_BUF_FLAG_DONE);
>  		fail_on_test(buf.querybuf(node, i));
>  		fail_on_test(buf.check(q, Queued, i));


Alternatively, we can do something like below on the kernel side instead:
do nothing in v4l2 for DMABUF and preserve b->flags (if user-space has
passed cache management flags).

// But I think it'll be better to clear b->flags cache hints for DMABUF. To
// indicate that we don't accept cache-hints for DMABUF.


---

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 6edf4508c636..fc8e31b7dced 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -345,6 +345,13 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
 				   struct vb2_buffer *vb,
 				   struct v4l2_buffer *b)
 {
+	/*
+	 * No user-space cache hints for DMABUF, but we preserve b->flags
+	 * cache hints (if user-space has passed any).
+	 */
+	if (q->memory == VB2_MEMORY_DMABUF)
+		return;
+
 	if (!vb2_queue_allows_cache_hints(q)) {
 		/*
 		 * Clear buffer cache flags if queue does not support user
