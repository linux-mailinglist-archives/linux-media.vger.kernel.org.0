Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95AC0136B1B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 11:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgAJKcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 05:32:48 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:57803 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726697AbgAJKcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 05:32:48 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pratilzq7pLtbprawiPzAM; Fri, 10 Jan 2020 11:32:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578652366; bh=gjJVby9uVquUwr750rfbXHaGifI2jr0RhPUkWoJN5rI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=u+wL2c4vbqWi5AWOgN5v7opLIfDSy6K+t9Ks+U9dfmqJvKfx8Goi2WrdWA9yCiICt
         AgBPalUNujx9TC3rWES3ceJa8HuYTEfW5ePKzpTux1kKj7tn/sfq4frVC8NatiaJEP
         SwwP8fiEeyS3zhL6sowCSk8kQBxVbUBZLaiBL3JdAROAdMSWeYbTJ2y6Ix1+cn6fv3
         jKLhPmMJ1we8PcDXDXeO/nrmUSIyqBXaPgehvWwfJzeUsB2BvcSnUTflqamg8HCJk+
         0n5/Yw2z4k0sTeJHOQzEYecDGCERAqnBa1QYzQKB3Sp247xvp14mO3wEpNKlmiIaxx
         2PFdFUBomYeQA==
Subject: Re: [RFC][PATCH 14/15] videobuf2: don't test db_attach in dma-contig
 prepare and finish
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-15-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8d79287c-d868-37cc-85f1-89cf5d8b92a9@xs4all.nl>
Date:   Fri, 10 Jan 2020 11:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217032034.54897-15-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfML14yM9Vzax8I0cQcPmUXvKvshoBz8Gw1Qr7AxI7CtZHh1vmU53s4jSWcc/BddjGM6DrKO9JngNMat9pCW8W7uql/YZpVjrSr46gTMSbTICyZFkY2W8
 PEmS+nwickgcfpGYZU1ij2A+EkBvQPlRhZOIV4T+zxsynR7ra5Hdz8PLXhB7YLy9xw53xX3G7IxYEM55AkfM1N+WBJ2fJzuvN6ixgbDzDAJSPqrKcblWh7NK
 XDpGdgjvQWdBojQeFDCGN5K0Mi6hVlvM4c3T5hUoMIwR7DvyE5KWLWOpOzvrNl7pBowSGlOZhwH0ZzX/BSpQQXaVNOr6vsE/vY1ObnzTwW6q/GyhPmTA0J90
 SW68nfMKmioxRG+wJ60Wj2fuX8nbxBsGlogkT7d4oSeUF55jLsO/YdCD4+ieZthlIX8vNf4kxm6swLiGPgn6n4ToIPYmozOtcUvK5jhL/Un3ouGO85h6CZi1
 VStaWnlLZW3VkOeBxk8Fvu93D1daoee8d0YU67X9sBsz2JSxpfw6TfhNzonLVF72QBK09XFUsY5Baa9fhr1YCd5XJ6QTm728R4nqGifKt+ZP4zl0Kkuv4PHS
 IcLl3Ins2LnGamUfL70LxpKI1tMm4RyYg3gag7k0/YimLV3C76octX+ziwqMKic5jjg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> We moved cache management decision making to the upper layer and
> rely on buffer's need_cache_sync flags and videobuf2 core. If the
> upper layer (core) has decided to invoke ->prepare() or ->finish()
> then we must sync.
> 
> For DMABUF ->need_cache_sync_on_prepare and ->need_cache_sync_on_flush
> are always false so videobuf core does not call ->prepare() and
> ->finish() on such buffers.
> 
> Additionally, scratch the DMABUF comment.

Just combine this and the next patch into a single patch. No need to
split this up.

Regards,

	Hans

> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index a387260fb321..6ea0961149d7 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -100,8 +100,7 @@ static void vb2_dc_prepare(void *buf_priv)
>  	struct vb2_dc_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> -	/* DMABUF exporter will flush the cache for us */
> -	if (!sgt || buf->db_attach)
> +	if (!sgt)
>  		return;
>  
>  	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> @@ -113,8 +112,7 @@ static void vb2_dc_finish(void *buf_priv)
>  	struct vb2_dc_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> -	/* DMABUF exporter will flush the cache for us */
> -	if (!sgt || buf->db_attach)
> +	if (!sgt)
>  		return;
>  
>  	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> 

