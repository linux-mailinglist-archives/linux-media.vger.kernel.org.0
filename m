Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29DE47E5229
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 09:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbjKHIuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 03:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234954AbjKHIuX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 03:50:23 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AF7D4A
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 00:50:21 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6c32a20d5dbso5374360b3a.1
        for <linux-media@vger.kernel.org>; Wed, 08 Nov 2023 00:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699433421; x=1700038221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zK82/6BqvKNKQgaDqfy7Pto0Ojlpc/8oMTwUMvbxWs=;
        b=nlFIObWs3bGnCj6sd6cH+9wiWNOEFjU0yJwUAvErcNrxxSGB7lLMWgUYEylDDxfLeA
         YtKfchj0z3WfuIPN7Tl1AHjPCdBNovlzNV8wy471Qw0ozuYGrIehb96noDYjgikmdOOc
         3aimqfXW6G4GEu3fj4TVhLDxBcPWwmOplQVsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699433421; x=1700038221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zK82/6BqvKNKQgaDqfy7Pto0Ojlpc/8oMTwUMvbxWs=;
        b=iSn0blaFitraYfgUqLjpWulKzZj2FW1BVC/rXC/89SNGFBeUvmgijb5+wOylxTVgdz
         DdDYi5PV5LjVKum2zPDeUkZOxLRg0aGdzNzBKxyHaBI5nUjaLQJhbjmKwLpLYbFTVpYa
         aFhRLb/AgVzZmlyeP2RvwsSJmoispmQ9EfOCrX/g55KCxeFpqgcP0ltRxf3dAQ8pfNXY
         QZszm1L+sTtTGQmpT66iiCpWf2T36Ic1vexgplai3Lb3hlxZMzrH7YxJX30dbekTdYR4
         uvf5Vd1YZVdk0flXJXkq+AygTqvpi+1WoOEpvgKKSzg43m1khghoJu6XkWW4Y5wTaxbx
         K5/g==
X-Gm-Message-State: AOJu0Yw0GChxf8q5rDNsFZMhuoAmxomY9wA0IaKzp2Er8Y4u9ZPU0M0Q
        GvsMT6dEou27TtpgZqZ7yz3Caw==
X-Google-Smtp-Source: AGHT+IEHQkQi7fFj1XBDdA1qkqIbF8LsDwsuYzZpYRjILqB0R+pLZlNNyUqPLPXG7J8Xz/MdT6Nc7g==
X-Received: by 2002:a05:6a00:cc8:b0:6be:2e07:5c5c with SMTP id b8-20020a056a000cc800b006be2e075c5cmr1240783pfv.20.1699433421074;
        Wed, 08 Nov 2023 00:50:21 -0800 (PST)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id n28-20020a056a00213c00b006c34a04c782sm8482914pfj.61.2023.11.08.00.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 00:50:20 -0800 (PST)
Date:   Wed, 8 Nov 2023 08:50:16 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com
Subject: Re: [PATCH v14 05/56] media: videobuf2: Access vb2_queue bufs array
 through helper functions
Message-ID: <20231108085016.3kmhmdroh4qs53f5@chromium.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-6-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031163104.112469-6-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 31, 2023 at 05:30:13PM +0100, Benjamin Gaignard wrote:
> This patch adds 2 helpers functions to add and remove vb2 buffers
> from a queue. With these 2 and vb2_get_buffer(), bufs field of
> struct vb2_queue becomes like a private member of the structure.
> 
> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer in preparation for when buffers can be deleted.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++-----
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  50 ++++--
>  2 files changed, 149 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 968b7c0e7934..b406a30a9b35 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -408,6 +408,31 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
>  		vb->skip_cache_sync_on_finish = 1;
>  }
>  
> +/**
> + * vb2_queue_add_buffer() - add a buffer to a queue
> + * @q:	pointer to &struct vb2_queue with videobuf2 queue.
> + * @vb:	pointer to &struct vb2_buffer to be added to the queue.
> + * @index: index where add vb2_buffer in the queue
> + */
> +static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
> +{
> +	WARN_ON(index >= VB2_MAX_FRAME || q->bufs[index]);

nit: Would it make sense to also ensure that vb->vb2_queue is NULL?

> +
> +	q->bufs[index] = vb;
> +	vb->index = index;
> +	vb->vb2_queue = q;
> +}
[snip]
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index d19d82a75ac6..2ffb097bf00a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -377,6 +377,12 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  		return -EINVAL;
>  	}
>  
> +	vb = vb2_get_buffer(q, b->index);
> +	if (!vb) {
> +		dprintk(q, 1, "%s: buffer %u is NULL\n", opname,  b->index);
> +		return -EINVAL;
> +	}
> +

Is this a leftover from earlier revisions? I think it shouldn't be
needed anymore after the previous patch which changed the function to
get vb as an argument.

Best regards,
Tomasz
