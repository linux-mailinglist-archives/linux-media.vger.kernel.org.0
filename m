Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89A21BEE0A
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 04:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgD3CHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 22:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgD3CHC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 22:07:02 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A171C035494;
        Wed, 29 Apr 2020 19:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=djVWTxQYfvvGPGVFEwE2B90kkenXlbJGcD+PszmK/2M=; b=JJMEwpVhbqEyGZO1pKvJpLnxth
        l1dJJuerlo8k6yWXdJPNp+1kH1Oyo5kRouZLy3l789vCJ+vxL/gSEbyC4c3psSR8P804xeCogBX2M
        VAFy1RSfIdypQziZGq1UySM3FMVxZQNei7JFpfQLE1Igoi0iJ2NA5A2aYquBMVVgSziPXEBh0Nxzh
        ZQ1ZBIuytrhT8BzPQizoAO3nA+btm4GZ/nVBVBe4QpJL9PeIjnWfQTE2IJpOHKJIE1EEK4EtblaSf
        Iyo2WHE0ul+UFfvw7T7QfY++MM7AdS2K1LNEiNmv6greKpZ2EmZjAmuvmMfT7lQbcW/C/mvBL8fe3
        rZrXahig==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jTybJ-0007Az-Jf; Thu, 30 Apr 2020 02:06:57 +0000
Subject: Re: [PATCH] dma-buf: Documentation: fix: `make htmldocs` warnings
To:     Vitor Massaru Iha <vitor@massaru.org>,
        dri-devel@lists.freedesktop.org
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        brendanhiggins@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20200430015930.32224-1-vitor@massaru.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
Date:   Wed, 29 Apr 2020 19:06:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430015930.32224-1-vitor@massaru.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> Add missed ":" on kernel-doc function parameter.
> 
> This patch fixes this warnings from `make htmldocs`:
> ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
>  drivers/dma-buf/dma-buf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ccc9eda1bc28..0756d2155745 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>   * calls attach() of dma_buf_ops to allow device-specific attach functionality
>   * @dmabuf:		[in]	buffer to attach device to.
>   * @dev:		[in]	device to be attached.
> - * @importer_ops	[in]	importer operations for the attachment
> - * @importer_priv	[in]	importer private pointer for the attachment
> + * @importer_ops:	[in]	importer operations for the attachment
> + * @importer_priv:	[in]	importer private pointer for the attachment
>   *
>   * Returns struct dma_buf_attachment pointer for this attachment. Attachments
>   * must be cleaned up by calling dma_buf_detach().
> 

Sumit said that he would be applying my patch from April 7:
https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/

thanks.
-- 
~Randy

