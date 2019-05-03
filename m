Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 816AC12DC8
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 14:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbfECMiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 08:38:52 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:59755 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726897AbfECMiw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 May 2019 08:38:52 -0400
Received: from [IPv6:2001:420:44c1:2579:95f7:4630:1fd:459b] ([IPv6:2001:420:44c1:2579:95f7:4630:1fd:459b])
        by smtp-cloud8.xs4all.net with ESMTPA
        id MXSfhFMpqb8gSMXSihagVU; Fri, 03 May 2019 14:38:49 +0200
Subject: Re: [PATCH] media: vb2-dc: skip CPU sync in map/unmap dma_buf
To:     Lucas Stach <l.stach@pengutronix.de>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
References: <20190228071943.13072-1-l.stach@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e0f69333-76e2-f336-a557-b591bb786605@xs4all.nl>
Date:   Fri, 3 May 2019 14:38:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190228071943.13072-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEAmHBzuF/tj4rDAZKmOmbT4zP3MV03mj561TePhHA3gdApQgqfFxVNnqcU5x9A1AM2EFprbX9G223e/BeFn2Rn3E+Rpo63L14xZsCi6ZgZdjB+BP1c6
 tQDwdXQMI7xnVgtIG/WmtRRlN6h9ieUlbC4j9DAwBBQW1NfewrlDD/7mScMbAbGY8JQClrYwLDxYsJYwOGgD+h2RlWY9cYfChbGnHGSI6S65YNIM3IBL5wPm
 Ww3KCzlD/Jk1LDXBqrJndJjNXAGrKcUhBIK8JDEwHpNHHCczm/ZLlEMZAFpw4e+RBWvxPkjFh1HSx4XowxWByBrNwfTDqo7gtIwiS3YOcIHlJnoniuuCczqP
 J8Vkf8e6LYLvwFFDY1dQ0Y3rF0+RYsKNpfJY3JJ3PhfD3F4SBJtf2vj3fwMv2lXHYwUA4jj71aFAJ94mDBGjPJnmLa5jyh/+hbQusAOsyg1T8h5hNbz2LRHV
 6WFIuQa5H0V6E2cR9W8ZtIyvHwu8ok6mQoPg3mBSW81eiWZlEl36avwVgYA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lucas,

As you mentioned there hasn't been any further review comments, so
it is fair not to postpone this.

However, I have one new review comment myself that I would like to
see addressed in a v2 before I merge this for 5.3:

On 2/28/19 8:19 AM, Lucas Stach wrote:
> This is rougly equivalent to ca0e68e21aae (drm/prime: skip CPU sync
> in map/unmap dma_buf). The contig memory allocated is already device
> coherent memory, so there is no point in doing a CPU sync when
> mapping it to another device. Also most importers currently cache
> the mapping so the CPU sync would only happen on the first import.
> With that in mind we are better off with not pretending to do a
> cache synchronization at all.
> 
> This gets rid of a lot of CPU overhead in uses where those dma-bufs
> are regularily imported and detached again, like Weston is currently
> doing in the DRM compositor.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index aff0ab7bf83d..d38f097c14ae 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -273,8 +273,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
>  
>  	/* release the scatterlist cache */
>  	if (attach->dma_dir != DMA_NONE)
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> +			attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);

Please add comments here...

>  	sg_free_table(sgt);
>  	kfree(attach);
>  	db_attach->priv = NULL;
> @@ -305,8 +305,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>  	}
>  
>  	/* mapping to the client with new direction */
> -	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				dma_dir);
> +	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> +				dma_dir, DMA_ATTR_SKIP_CPU_SYNC);

... and here to explain why you can skip the cpu sync. The comment in ops_detach
can refer to the comment in ops_map, so there is no need to give the full
explanation in two places.

It is not obvious that you can skip the CPU sync, so an explanation is helpful.

Regards,

	Hans

>  	if (!sgt->nents) {
>  		pr_err("failed to map scatterlist\n");
>  		mutex_unlock(lock);
> 

