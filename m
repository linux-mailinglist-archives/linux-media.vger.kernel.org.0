Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF93C370531
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 05:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhEADtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 23:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhEADtk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 23:49:40 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B359CC06174A
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 20:48:50 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id md17so133616pjb.0
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 20:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9EWfN6Q5Rv8gB+tk1vfjKKN0pi0KFEkhCoeOlOL3DLI=;
        b=eaXGRoegD96gpKzZ+stodTichO/TnEvy4ynwE9EyvYqvGdRcrX7/MLAKgJciZsSTl/
         7AkVKrLVyWBJrTy3FRnFjJUOINEDvjzgTRs6F0+IJ1HmbAVy79Ch4uDXJCfSzc5+u2vz
         gyt2R60GJPXWOCOQ8gQmmv3bKGUDy/Y7xzCTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9EWfN6Q5Rv8gB+tk1vfjKKN0pi0KFEkhCoeOlOL3DLI=;
        b=kEQLhHChecxBl8G1hnasT6hcMFoQrVwVLUr0pFU8L0v8plwMMJal7Lw/nypfC1jFZA
         4kh/ad/UyJLVoJMF7+jHEhWxJsWMEnYnoYhCtdqcJ72GRmlGnLcs7FMDZcXESNFOEpGF
         uWa06AMnuGUYc8DnwFKZV15ImUFbQ9WJAmfBcKVQdGcFrTBHZH0y6dSBhB3HZnLwaRRb
         SWtL0iZI5STzKSNYUlKK3pDUZu0Ln7Wi4oR6B9CCN7imNcMOa5NQ4OfPeMwwwhtFyN0J
         xlN6u/1ljx05JAmI1XoiIJHqcnSng0gSt96516IWpF1Q0pCixTy1F8saH9qIMAAr2cxq
         gu7A==
X-Gm-Message-State: AOAM530M+DUS1DkAYLgRfmaQUkHRKPv9We8YpdjnvyTZK5uxlJhXmhP8
        TatXVMknMxgTOXJrCCQZzBYmDQ==
X-Google-Smtp-Source: ABdhPJzRDnIs2ut8Ov9lVDN2IqIw72/20etRh06lkR9yB6a2TNCzJSUJzLRxoFpPSSjZFheG3xrIAg==
X-Received: by 2002:a17:90a:f303:: with SMTP id ca3mr18382259pjb.145.1619840930197;
        Fri, 30 Apr 2021 20:48:50 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8be7:e987:d00a:1442])
        by smtp.gmail.com with ESMTPSA id a129sm3762621pfa.36.2021.04.30.20.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 20:48:49 -0700 (PDT)
Date:   Sat, 1 May 2021 12:48:45 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 7/8] videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT
 flag
Message-ID: <YIzPnbQr/lGMdqBV@google.com>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-8-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427131344.139443-8-senozhatsky@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/04/27 22:13), Sergey Senozhatsky wrote:
[..]
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index e59306aba2b0..5a047c0ec3e8 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -104,10 +104,14 @@ aborting or finishing any DMA in progress, an implicit
>  	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
>  	free any previously allocated buffers, so this is typically something
>  	that will be done at the start of the application.
> -    * - __u32
> -      - ``reserved``\ [1]
> -      - A place holder for future extensions. Drivers and applications
> -	must set the array to zero.
> +    * - __u8
> +      - ``flags``
> +      - Specifies additional buffer management attributes.
> +	See :ref:`memory-flags`.
> +    * - __u8
> +      - ``reserved``\ [3]
> +      - Reserved for future extensions.
> +      -

A fix (one liner). Sorry.

---
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index 5a047c0ec3e8..099fa6695167 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -111,7 +111,6 @@ aborting or finishing any DMA in progress, an implicit
     * - __u8
       - ``reserved``\ [3]
       - Reserved for future extensions.
-      -
 
 .. _v4l2-buf-capabilities:
 .. _V4L2-BUF-CAP-SUPPORTS-MMAP:
-- 
2.31.1.527.g47e6f16901-goog
