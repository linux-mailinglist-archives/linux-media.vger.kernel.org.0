Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03D241A8AC
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 08:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239662AbhI1GLI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 02:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239613AbhI1GLE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 02:11:04 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC46C0610DC
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 23:05:40 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id n2so13393622plk.12
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 23:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BhMrU55lN8tHDVLP6L+4nS25hbBJHkn4rqkbx7oYk2k=;
        b=IKw0WEqPcL//vY1E9es5ClunAmQ3FwjVN/b6Pw9GwXZUgH9h7hyaZ3AdOpVPeIHGNu
         sSJbc0pcFjX52VBIt/R1NKuJHYQFQyfrlV7rLSfhgkWp0/RJPqjAGd7VOcDkU5DkjW3U
         gCcmnTCknh0HspqLoH+t64EXmMiW917r9QruU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BhMrU55lN8tHDVLP6L+4nS25hbBJHkn4rqkbx7oYk2k=;
        b=hpHbi+3alBs4+KEU0eJb9WqgOLuITJtwY0osaMSLhgGBhfjBaibAuXLaiTN9umicpZ
         nf5jkwIHXGjOGcB5k+W0qo9R0HnZNdxZ//WpAMOB2a52qCSnZQdA3v/imiMJvwNTf6SV
         HGTo73SQvulwzEWR2puiL6J5D/+fiVARG3+FjtAeFhU8k+FHlc9TguvRjGO/ADOWE7GH
         WPO33maSY8CF1h5xsMbtybV1CPn2ile4uCxrz1ATkVHDS5H/zpjzia5q26Wycm2lLN3j
         Gcs0vLspJb9hVSTvZ+KgFCkrP25WqrYO1kHYy/6LmyGtdMILp7NEs5LRpLoopAiqp05j
         QyOA==
X-Gm-Message-State: AOAM530ymQIoGyQgVkIQSYRmHPeH/P1frC0GoywdMDuGa3r4EnfiJV5l
        4EHdll2yo1KGz4w7YilY43+5/g==
X-Google-Smtp-Source: ABdhPJx2U8eD0ZSPt51jAKmJ5tNZ0Js511+SLu0K+K76c3ZVUrLT4yhAcywreDNeAxLgcGj4+yizgQ==
X-Received: by 2002:a17:90a:b706:: with SMTP id l6mr3555139pjr.200.1632809140199;
        Mon, 27 Sep 2021 23:05:40 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:f0ec:9bde:f74c:2825])
        by smtp.gmail.com with ESMTPSA id e11sm15376274pfm.28.2021.09.27.23.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 23:05:39 -0700 (PDT)
Date:   Tue, 28 Sep 2021 14:05:36 +0800
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv6 2/8] videobuf2: inverse buffer cache_hints flags
Message-ID: <YVKwsMDU6eNO1X0u@google.com>
References: <20210909112430.61243-1-senozhatsky@chromium.org>
 <20210909112430.61243-3-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909112430.61243-3-senozhatsky@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Sep 09, 2021 at 08:24:24PM +0900, Sergey Senozhatsky wrote:
> It would be less error prone if the default cache hints value
> (we kzalloc() structs, so it's zeroed out by default) would be
> to "always sync/flush" caches. Inverse and rename cache hints
> flags.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 31 ++++++-------------
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 17 +++-------
>  include/media/videobuf2-core.h                | 12 +++----
>  3 files changed, 21 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index c4ff356da600..9d57df348b5f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c

[...]

> @@ -415,17 +415,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  		vb->index = q->num_buffers + buffer;
>  		vb->type = q->type;
>  		vb->memory = memory;
> -		/*
> -		 * We need to set these flags here so that the videobuf2 core
> -		 * will call ->prepare()/->finish() cache sync/flush on vb2
> -		 * buffers when appropriate. However, we can avoid explicit
> -		 * ->prepare() and ->finish() cache sync for DMABUF buffers,
> -		 * because DMA exporter takes care of it.
> -		 */
> -		if (q->memory != VB2_MEMORY_DMABUF) {
> -			vb->need_cache_sync_on_prepare = 1;
> -			vb->need_cache_sync_on_finish = 1;
> -		}

This hunk seems odd. It's not inverting the logic but just removing
the block wholesale. The end result is different. This seems to be fixed
in a following patch, but the change here doesn't match what the commit
log says.

ChenYu
