Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E069A74D83
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 13:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404387AbfGYLuL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 07:50:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43342 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404313AbfGYLuL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 07:50:11 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AB0A128A773;
        Thu, 25 Jul 2019 12:50:09 +0100 (BST)
Date:   Thu, 25 Jul 2019 13:50:07 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        ZhiChao Yu <zhichao.yu@rock-chips.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: hantro: Remove call to memset after
 dma_alloc_coherent
Message-ID: <20190725135007.33dc2cd3@collabora.com>
In-Reply-To: <20190725030602.GA13200@hari-Inspiron-1545>
References: <20190725030602.GA13200@hari-Inspiron-1545>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 25 Jul 2019 08:36:02 +0530
Hariprasad Kelam <hariprasad.kelam@gmail.com> wrote:

> fix below issue reported by coccicheck
> /drivers/staging/media/hantro/hantro_vp8.c:149:16-34: WARNING:
> dma_alloc_coherent use in aux_buf -> cpu already zeroes out memory,  so
> memset is not needed
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro_vp8.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_vp8.c b/drivers/staging/media/hantro/hantro_vp8.c
> index 66c4533..363ddda 100644
> --- a/drivers/staging/media/hantro/hantro_vp8.c
> +++ b/drivers/staging/media/hantro/hantro_vp8.c
> @@ -151,8 +151,6 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
>  	if (!aux_buf->cpu)
>  		return -ENOMEM;
>  
> -	memset(aux_buf->cpu, 0, aux_buf->size);
> -
>  	/*
>  	 * Allocate probability table buffer,
>  	 * total 1208 bytes, 4K page is far enough.

