Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461E545689
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 09:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbfFNHlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 03:41:04 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47061 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725775AbfFNHlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 03:41:03 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id bgpThW9SV5qKabgpXhKlNw; Fri, 14 Jun 2019 09:41:01 +0200
Subject: Re: [PATCH v2 5/5] media: rockchip: Use vb2_get_buffer
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>
References: <20190610205526.2629-1-ezequiel@collabora.com>
 <20190610205526.2629-6-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <12f39255-bae4-0382-740e-4de4802c374d@xs4all.nl>
Date:   Fri, 14 Jun 2019 09:40:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190610205526.2629-6-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfME+TcSLSsI+h0S3fkTxarwMw74MP5XkSo0ESCbq1DqlGu2xLLKaAUkT3aPLFPQdoAPImAEDAmLNP28mhxkIxzUyHzxqOataoqzrDMc/Nq6kWKdNAgSz
 2cm2HMpcP70MqIdbie48XRx7jhNmlQZf1sInYFX1Jx8/A0awiAVmLH0Z/caY83KYoeU7193S5wmgISoLUNnUEOvcAFkjKHCjR9nyS00s85au7mDGW45cioL8
 nmkj/c9HJKGj+VtNq6jYByiulyIl9P9NXzBymgPv9ZWCFudOTzNCT7MegD3W+n3a16HRRxRl0UzcV6IJ0YQQRPhqphYIr66PnYZyaFziX3XAuzPN65wIaOj0
 +oKXMsz3VKD1Q72GOUp16JPQ0rCjO25V7M1jy2Gqybt41zGJB/h1x2UfNoacgUOpp5v7NpSp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/10/19 10:55 PM, Ezequiel Garcia wrote:
> Use the newly introduced vb2_get_buffer API and avoid
> accessing buffers in the queue directly.

Can you rebase this patch? It no longer applies after the hantro rename
was merged.

Thanks!

	Hans

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
> index b94ff97451db..ad17e04e701a 100644
> --- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
> +++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
> @@ -45,12 +45,15 @@ void *rockchip_vpu_get_ctrl(struct rockchip_vpu_ctx *ctx, u32 id)
>  
>  dma_addr_t rockchip_vpu_get_ref(struct vb2_queue *q, u64 ts)
>  {
> +	struct vb2_buffer *buf;
>  	int index;
>  
>  	index = vb2_find_timestamp(q, ts, 0);
> -	if (index >= 0)
> -		return vb2_dma_contig_plane_dma_addr(q->bufs[index], 0);
> -	return 0;
> +	if (index < 0)
> +		return 0;
> +
> +	buf = vb2_get_buffer(q, index);
> +	return vb2_dma_contig_plane_dma_addr(buf, 0);
>  }
>  
>  static int
> 

