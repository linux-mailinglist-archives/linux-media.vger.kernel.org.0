Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A28C1666EF
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 20:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbgBTTOM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 14:14:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49852 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbgBTTOM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 14:14:12 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id F0C9F2950AF
Subject: Re: [PATCH] media: staging: rkisp1: capture: remove support to
 userptr memory
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200220185603.26968-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <54b8a35e-b0d4-3aba-a6ab-c44981db21a1@collabora.com>
Date:   Thu, 20 Feb 2020 16:14:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200220185603.26968-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/20/20 3:56 PM, Dafna Hirschfeld wrote:
> The dma_contig memory operations which is used by the capture
> should not support userptr. Therefore remove it.

I would just re-word this a bit, something like:

VB2_USERPTR support doesn't make sense for drivers based on
vb2_dma_contig, so just drop it.

Otherwise, queues using vb2_dma_contig_memops causes v4l2-compliance
to fail for VB2_USERPTR mode, due to buffer misalignment.

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 5f97af5cd95f..a006cd03228d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -1349,7 +1349,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  
>  	q = &node->buf_queue;
>  	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
>  	q->drv_priv = cap;
>  	q->ops = &rkisp1_vb2_ops;
>  	q->mem_ops = &vb2_dma_contig_memops;
> 
