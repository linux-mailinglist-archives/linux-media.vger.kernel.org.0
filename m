Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B74A3E493B
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 17:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235931AbhHIPvH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 11:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235893AbhHIPvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 11:51:03 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C41C0617A1;
        Mon,  9 Aug 2021 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=DZUnWySGeUahJi5WC6HpQoyS/LjeB2Nf/wPJVD05awU=; b=dS4JB/VHV7AOUvXo3n3AmTbWMi
        frNw7ESZbqMf2lzFA8r2/8zeHQjcHq7dOK4PXu00WROKva7SmQquk9UigeKw+aCsOTHxf1McqRjxm
        yDD+6zvdnOQdKBM6Zldm4AwqaHciriLZcglV13+AMc+XCCNevcfuZnFQmGa9Cae/M6tOaJ/q6Uz2c
        +kLwvLWjNu++fZHYw36p6/ww8dIieI6VsIBApNx0plDXSdamfnA2fgg2N7yk/iVYGnJDl025aWqNu
        7CThxcg/CJsa4ttAZm6yStWe5EswTWKOOgKji1F8mQClqRjBUBdY/140kbamC7ruUQ0r5Nju2FYyt
        9D2LGkDg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mD7Wj-00B8zg-F5; Mon, 09 Aug 2021 15:49:43 +0000
Subject: Re: [PATCH] dma-buf: Fix a few typos in dma-buf documentation
To:     Gal Pressman <galpress@amazon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        christian.koenig@amd.com
Cc:     linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20210809122247.15869-1-galpress@amazon.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b8c08a61-63bc-aa34-6045-ccfdc3983e6a@infradead.org>
Date:   Mon, 9 Aug 2021 08:49:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809122247.15869-1-galpress@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/9/21 5:22 AM, Gal Pressman wrote:
> Fix a few typos in the documentation:
> - Remove an extraneous 'or'
> - 'unpins' -> 'unpin'
> - 'braket' -> 'bracket'
> - 'mappinsg' -> 'mappings'
> - 'fullfills' -> 'fulfills'
> 
> Signed-off-by: Gal Pressman <galpress@amazon.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>   include/linux/dma-buf.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..772403352767 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -54,7 +54,7 @@ struct dma_buf_ops {
>   	 * device), and otherwise need to fail the attach operation.
>   	 *
>   	 * The exporter should also in general check whether the current
> -	 * allocation fullfills the DMA constraints of the new device. If this
> +	 * allocation fulfills the DMA constraints of the new device. If this
>   	 * is not the case, and the allocation cannot be moved, it should also
>   	 * fail the attach operation.
>   	 *
> @@ -146,7 +146,7 @@ struct dma_buf_ops {
>   	 *
>   	 * Returns:
>   	 *
> -	 * A &sg_table scatter list of or the backing storage of the DMA buffer,
> +	 * A &sg_table scatter list of the backing storage of the DMA buffer,
>   	 * already mapped into the device address space of the &device attached
>   	 * with the provided &dma_buf_attachment. The addresses and lengths in
>   	 * the scatter list are PAGE_SIZE aligned.
> @@ -168,7 +168,7 @@ struct dma_buf_ops {
>   	 *
>   	 * This is called by dma_buf_unmap_attachment() and should unmap and
>   	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
> -	 * For static dma_buf handling this might also unpins the backing
> +	 * For static dma_buf handling this might also unpin the backing
>   	 * storage if this is the last mapping of the DMA buffer.
>   	 */
>   	void (*unmap_dma_buf)(struct dma_buf_attachment *,
> @@ -237,7 +237,7 @@ struct dma_buf_ops {
>   	 * This callback is used by the dma_buf_mmap() function
>   	 *
>   	 * Note that the mapping needs to be incoherent, userspace is expected
> -	 * to braket CPU access using the DMA_BUF_IOCTL_SYNC interface.
> +	 * to bracket CPU access using the DMA_BUF_IOCTL_SYNC interface.
>   	 *
>   	 * Because dma-buf buffers have invariant size over their lifetime, the
>   	 * dma-buf core checks whether a vma is too large and rejects such
> @@ -464,7 +464,7 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>   
>   /**
>    * dma_buf_attachment_is_dynamic - check if a DMA-buf attachment uses dynamic
> - * mappinsg
> + * mappings
>    * @attach: the DMA-buf attachment to check
>    *
>    * Returns true if a DMA-buf importer wants to call the map/unmap functions with
> 


-- 
~Randy

