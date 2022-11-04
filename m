Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102556194B1
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 11:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbiKDKme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 06:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbiKDKmb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 06:42:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4FA2633
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 03:42:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA1EDB82C7B
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 10:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17ED7C433C1;
        Fri,  4 Nov 2022 10:42:24 +0000 (UTC)
Message-ID: <bd50df70-1a8b-08c4-1ad1-f9b23a77c1df@xs4all.nl>
Date:   Fri, 4 Nov 2022 11:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/3] media: videobuf2: set dma_coherent flag for DMA-buf
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <20221020121316.3946-4-christian.koenig@amd.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221020121316.3946-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

On 20/10/2022 14:13, Christian König wrote:
> When a device is snooping the CPU cache we assume that all importers
> must snoop the CPU cache as well.
> 
> Execpt for vmalloc allocations since those implement mmap() imports must
> always snoop the cache or we will run into coherency problems.

Looks reasonable.

For this series:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 2 ++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 2 ++
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 555bd40fa472..57433310c55c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <linux/dma-buf.h>
> +#include <linux/dma-map-ops.h>
>  #include <linux/module.h>
>  #include <linux/refcount.h>
>  #include <linux/scatterlist.h>
> @@ -507,6 +508,7 @@ static struct dma_buf *vb2_dc_get_dmabuf(struct vb2_buffer *vb,
>  	exp_info.size = buf->size;
>  	exp_info.flags = flags;
>  	exp_info.priv = buf;
> +	exp_info.coherent = dev_is_dma_coherent(vb->vb2_queue->dev);
>  
>  	if (!buf->sgt_base)
>  		buf->sgt_base = vb2_dc_get_base_sgt(buf);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 36981a5b5c53..dbdd753e4a39 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -10,6 +10,7 @@
>   * the Free Software Foundation.
>   */
>  
> +#include <linux/dma-map-ops.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/refcount.h>
> @@ -522,6 +523,7 @@ static struct dma_buf *vb2_dma_sg_get_dmabuf(struct vb2_buffer *vb,
>  	exp_info.size = buf->size;
>  	exp_info.flags = flags;
>  	exp_info.priv = buf;
> +	exp_info.coherent = dev_is_dma_coherent(vb->vb2_queue->dev);
>  
>  	if (WARN_ON(!buf->dma_sgt))
>  		return NULL;
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 41db707e43a4..0b6874733e86 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -341,6 +341,7 @@ static struct dma_buf *vb2_vmalloc_get_dmabuf(struct vb2_buffer *vb,
>  	exp_info.size = buf->size;
>  	exp_info.flags = flags;
>  	exp_info.priv = buf;
> +	exp_info.coherent = true;
>  
>  	if (WARN_ON(!buf->vaddr))
>  		return NULL;

