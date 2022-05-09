Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6BE51F9FF
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 12:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiEIKe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 06:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiEIKeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 06:34:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C487F24EA2C
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 03:29:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 449BE55A;
        Mon,  9 May 2022 12:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652092194;
        bh=nm8ZfDBH9GeQL9RxwlQxtxtYI2Dv0JIWWH6rAl7iAfw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wjf3N1HjsATYwaies1nYg3+1ZyUUmSYb6RQOzjMN/FG0ZJ9wycgZ8tXh3OYwUWY8E
         V9F2rMOy2Ga9Uf6p9VBelniVaYYbr0sVvTROndxPkApZrbz0R/oZcDygP7PsOkWY56
         zkFAitqd/8gPnvLltUL9cCF9EGNqV+L4AnfbCUZI=
Date:   Mon, 9 May 2022 13:29:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 3/7] videobuf2-dma-sg.c: kvmalloc_array -> kvcalloc
Message-ID: <YnjtHipdmqf2fXwu@pendragon.ideasonboard.com>
References: <20220509091553.2637089-1-hverkuil-cisco@xs4all.nl>
 <20220509091553.2637089-4-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220509091553.2637089-4-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, May 09, 2022 at 11:15:49AM +0200, Hans Verkuil wrote:
> Fixes smatch warning:
> 
> drivers/media/common/videobuf2/videobuf2-dma-sg.c:129 vb2_dma_sg_alloc() warn: Please consider using kvcalloc instead
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index f8a21c560ad2..fa69158a65b1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -126,8 +126,7 @@ static void *vb2_dma_sg_alloc(struct vb2_buffer *vb, struct device *dev,
>  	 * there is no memory consistency guarantee, hence dma-sg ignores DMA
>  	 * attributes passed from the upper layer.
>  	 */
> -	buf->pages = kvmalloc_array(buf->num_pages, sizeof(struct page *),
> -				    GFP_KERNEL | __GFP_ZERO);
> +	buf->pages = kvcalloc(buf->num_pages, sizeof(struct page *), GFP_KERNEL);
>  	if (!buf->pages)
>  		goto fail_pages_array_alloc;
>  

-- 
Regards,

Laurent Pinchart
