Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B1C636A2B
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 20:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239426AbiKWTwu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 14:52:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239447AbiKWTwX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 14:52:23 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC3FCC168;
        Wed, 23 Nov 2022 11:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=gWgahCN0LwC89E2KB43w5T+Gp5ZpXQ1ebFse858HZYA=; b=aC79aj24enbYgV2hpmBvp9wsnL
        qwbwTJ6xtdijYnoXSkhsfv5lPt0Ow5+QQoWPLd9bYd9HdqLiaI1/VyZV31f8oqiYtE+/UrcKue6go
        eOzLw3/yB/1AGr62slNCOGam+g2JI59kRBPKOd9MVz+NJx3OJu/KHubE0N9HZPmsCVULPxCPaRkpn
        OV8K2fw8im0qOJq5OiTixKz2y7LQarby7iXHQHNRmNKnNAYJSSptVXuZKbu7SDZov2WQ3DhQN+1+s
        /r2rfAx6v2sN7ePVFd4iSYNZ5CqT7xD8Uo0LEa9DT0dMEqgpuH88VdZR4XgVi6MPQ+gctuUGhkcdB
        /b/chChQ==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oxvm0-0023uQ-QK; Wed, 23 Nov 2022 19:51:08 +0000
Message-ID: <a689b96c-166a-c42d-79fd-c83f841ff078@infradead.org>
Date:   Wed, 23 Nov 2022 11:51:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] dma-buf: A collection of typo and documentation fixes
Content-Language: en-US
To:     "T.J. Mercier" <tjmercier@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20221123193519.3948105-1-tjmercier@google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20221123193519.3948105-1-tjmercier@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/23/22 11:35, T.J. Mercier wrote:
> I've been collecting these typo fixes for a while and it feels like
> time to send them in.
> 
> Signed-off-by: T.J. Mercier <tjmercier@google.com>


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

(although I would prefer to see CPU instead of cpu, but that's no
reason to hold up this patch)

> ---
>  drivers/dma-buf/dma-buf.c | 14 +++++++-------
>  include/linux/dma-buf.h   |  6 +++---
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index dd0f83ee505b..614ccd208af4 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1141,7 +1141,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
>   *
>   * @dmabuf:	[in]	buffer which is moving
>   *
> - * Informs all attachmenst that they need to destroy and recreated all their
> + * Informs all attachments that they need to destroy and recreate all their
>   * mappings.
>   */
>  void dma_buf_move_notify(struct dma_buf *dmabuf)
> @@ -1159,11 +1159,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
>  /**
>   * DOC: cpu access
>   *
> - * There are mutliple reasons for supporting CPU access to a dma buffer object:
> + * There are multiple reasons for supporting CPU access to a dma buffer object:
>   *
>   * - Fallback operations in the kernel, for example when a device is connected
>   *   over USB and the kernel needs to shuffle the data around first before
> - *   sending it away. Cache coherency is handled by braketing any transactions
> + *   sending it away. Cache coherency is handled by bracketing any transactions
>   *   with calls to dma_buf_begin_cpu_access() and dma_buf_end_cpu_access()
>   *   access.
>   *
> @@ -1190,7 +1190,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
>   *   replace ION buffers mmap support was needed.
>   *
>   *   There is no special interfaces, userspace simply calls mmap on the dma-buf
> - *   fd. But like for CPU access there's a need to braket the actual access,
> + *   fd. But like for CPU access there's a need to bracket the actual access,
>   *   which is handled by the ioctl (DMA_BUF_IOCTL_SYNC). Note that
>   *   DMA_BUF_IOCTL_SYNC can fail with -EAGAIN or -EINTR, in which case it must
>   *   be restarted.
> @@ -1264,10 +1264,10 @@ static int __dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>   * preparations. Coherency is only guaranteed in the specified range for the
>   * specified access direction.
>   * @dmabuf:	[in]	buffer to prepare cpu access for.
> - * @direction:	[in]	length of range for cpu access.
> + * @direction:	[in]	direction of access.
>   *
>   * After the cpu access is complete the caller should call
> - * dma_buf_end_cpu_access(). Only when cpu access is braketed by both calls is
> + * dma_buf_end_cpu_access(). Only when cpu access is bracketed by both calls is
>   * it guaranteed to be coherent with other DMA access.
>   *
>   * This function will also wait for any DMA transactions tracked through
> @@ -1307,7 +1307,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, DMA_BUF);
>   * actions. Coherency is only guaranteed in the specified range for the
>   * specified access direction.
>   * @dmabuf:	[in]	buffer to complete cpu access for.
> - * @direction:	[in]	length of range for cpu access.
> + * @direction:	[in]	direction of access.
>   *
>   * This terminates CPU access started with dma_buf_begin_cpu_access().
>   *
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 71731796c8c3..1d61a4f6db35 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -330,7 +330,7 @@ struct dma_buf {
>  	 * @lock:
>  	 *
>  	 * Used internally to serialize list manipulation, attach/detach and
> -	 * vmap/unmap. Note that in many cases this is superseeded by
> +	 * vmap/unmap. Note that in many cases this is superseded by
>  	 * dma_resv_lock() on @resv.
>  	 */
>  	struct mutex lock;
> @@ -365,7 +365,7 @@ struct dma_buf {
>  	 */
>  	const char *name;
>  
> -	/** @name_lock: Spinlock to protect name acces for read access. */
> +	/** @name_lock: Spinlock to protect name access for read access. */
>  	spinlock_t name_lock;
>  
>  	/**
> @@ -402,7 +402,7 @@ struct dma_buf {
>  	 *   anything the userspace API considers write access.
>  	 *
>  	 * - Drivers may just always add a write fence, since that only
> -	 *   causes unecessarily synchronization, but no correctness issues.
> +	 *   causes unnecessary synchronization, but no correctness issues.
>  	 *
>  	 * - Some drivers only expose a synchronous userspace API with no
>  	 *   pipelining across drivers. These do not set any fences for their

-- 
~Randy
