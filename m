Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED7F312EA9
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 11:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhBHKOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 05:14:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbhBHKJ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 05:09:29 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9379BC061788
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 02:08:48 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q7so16281523wre.13
        for <linux-media@vger.kernel.org>; Mon, 08 Feb 2021 02:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0pOHlp3YfmPQ6aHp/8FB8TarZqCW4k9p2xOGz6n9MDg=;
        b=d0kQAFm7tei2XxZSgVD38fMf+wEOst/QXqkIwC7c7+FGD9nWzqN0bib59r4MF5dh5a
         28Bqrogt48urasAsA0+opmN5trx4wdmhECFI5EC4xeMnqyDj3zSZp64O+RP0wjO4TWZv
         3RdQuFtbld1C1h8PdndhUeNBuGZ5FRIEC/2zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=0pOHlp3YfmPQ6aHp/8FB8TarZqCW4k9p2xOGz6n9MDg=;
        b=Bl0KuGhGFyg8jDKe81DMxii2LFamAWhrIlP75rXZbis4j3grq5VoEWmCX/SWxvrxvP
         Z/Mermp72GCHq3vxgruFrNt1FQQpPgNTSrr3q5S56wgbh+tnT3pCfCZkm7ZzSQAJUFE8
         TnSslFZJ/kXHgH4R899BxST/Q7mNYzsNQFpaW3nC6M6AdPS+1LwYvgiDExSNYmaOHwEN
         TRiLIxut6GVy717VTrqQ4VJvxfn3JZq7OSmconJh1u8vdsR5QCIc8Z53XL54msn0KXN8
         0wRcIF6m2mSw6YqMLzbLgqTZFJM6IMMcOoMlbRB29OeYTfzWtSk2u2odGVyaWve0u1cx
         pghg==
X-Gm-Message-State: AOAM533xwjZDv/H5JVsBiqYxar5w4YUNNP7HEgtMnGC9DH06PzpKR/rI
        eCUsj0naulclEX4mVoJVmNRzAw==
X-Google-Smtp-Source: ABdhPJzJ1HgP5N/LeOlDB3NYZUOuI03t3dodjSugSJHVqish8RwUT2TL18EPp5qcKUwbVn1nAmPTYA==
X-Received: by 2002:a05:6000:18ac:: with SMTP id b12mr19274155wri.77.1612778927278;
        Mon, 08 Feb 2021 02:08:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b138sm19614011wmb.35.2021.02.08.02.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:08:46 -0800 (PST)
Date:   Mon, 8 Feb 2021 11:08:44 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when
 exporting dmabufs to be the actual heap name
Message-ID: <YCENrGofdwVg2LMe@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210206054748.378300-1-john.stultz@linaro.org>
 <20210206054748.378300-2-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210206054748.378300-2-john.stultz@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Feb 06, 2021 at 05:47:48AM +0000, John Stultz wrote:
> By default dma_buf_export() sets the exporter name to be
> KBUILD_MODNAME. Unfortunately this may not be identical to the
> string used as the heap name (ie: "system" vs "system_heap").
> 
> This can cause some minor confusion with tooling, and there is
> the future potential where multiple heap types may be exported
> by the same module (but would all have the same name).
> 
> So to avoid all this, set the exporter exp_name to the heap name.
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Ørjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Looks reasonable to me.

I guess the main worry is "does this mean heap names become uapi", in
which case I'm maybe not so sure anymore how this will tie into the
overall gpu memory accounting story.

Since for dma-buf heaps one name per buffer is perfectly fine, since
dma-buf heaps aren't very dynamic. But on discrete gpu drivers buffers
move, so baking in the assumption that "exporter name = resource usage for
this buffer" is broken.

So I'm not sure we shouldn't instead name all the dma-buf heaps as
"dma-buf heaps" to stop this :-)
-Daniel

> ---
>  drivers/dma-buf/heaps/cma_heap.c    | 1 +
>  drivers/dma-buf/heaps/system_heap.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 364fc2f3e499..62465d61ccc7 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -339,6 +339,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
>  	buffer->pagecount = pagecount;
>  
>  	/* create the dmabuf */
> +	exp_info.exp_name = dma_heap_get_name(heap);
>  	exp_info.ops = &cma_heap_buf_ops;
>  	exp_info.size = buffer->len;
>  	exp_info.flags = fd_flags;
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 17e0e9a68baf..2d4afc79c700 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -388,6 +388,7 @@ static int system_heap_allocate(struct dma_heap *heap,
>  	}
>  
>  	/* create the dmabuf */
> +	exp_info.exp_name = dma_heap_get_name(heap);
>  	exp_info.ops = &system_heap_buf_ops;
>  	exp_info.size = buffer->len;
>  	exp_info.flags = fd_flags;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
