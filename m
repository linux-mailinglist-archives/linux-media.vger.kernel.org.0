Return-Path: <linux-media+bounces-20530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4949B4AC9
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 14:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EAB91C22945
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 13:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9476A205ACF;
	Tue, 29 Oct 2024 13:20:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A0205132;
	Tue, 29 Oct 2024 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730208008; cv=none; b=BY9mnwSGqAkCcWRWIjwaYvB4ReHYXQcx69VV2kTxwB+7GOW6pSwigeozDt38KOGsjejDdVYyQGFqaJJ8AsrOW7cC8+iUED5SJx/riOFzcleRKsiXLQir+PoZGLMJclpnCwZBcW8C1LYJzzWbYM79h9TjL+Nk5noHYNdA8T81QwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730208008; c=relaxed/simple;
	bh=jHMGelrUwx1wFq+DGODkGy7xJUI7XVIt+fO+Z3JKypo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cq2fgZ94TqwYC5XqR8u/F/726rF0PrQRa1Ao1KEpVBjDCj99zz7uLUPlmH1dfrdYf3bDuUgrjdg2E+pFfzwqdKWpUQYP62hsJcE9w/rBObIVpIVfNNkSxwX1AknHhtaYpe92+boVdwKdst1cl91JkCySw+tiBmWbUE5NlJwZSTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDD8C4CEE6;
	Tue, 29 Oct 2024 13:20:05 +0000 (UTC)
Message-ID: <95d99dfa-d054-4bea-83c9-b4f228d38431@xs4all.nl>
Date: Tue, 29 Oct 2024 14:20:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: raspberrypi: cfe: Fix min_reqbufs_allocation
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241029-rp1-cfe-fixes-v1-1-49f04cc271f5@ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20241029-rp1-cfe-fixes-v1-1-49f04cc271f5@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/24 13:47, Tomi Valkeinen wrote:
> The driver checks if "vq->max_num_buffers + *nbuffers < 3", but
> vq->max_num_buffers is (by default) 32, so the check is never true. Nor
> does the check make sense.
> 
> The original code in the BSP kernel was "vq->num_buffers + *nbuffers <
> 3", but got mangled along the way to upstream. The intention was to make
> sure that at least 3 buffers are allocated.
> 
> Fix this by removing the bad lines and setting q->min_reqbufs_allocation
> to three.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 045910de6c57..65e9c6d23416 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1025,9 +1025,6 @@ static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  	cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
>  		node->buffer_queue.type);
>  
> -	if (vq->max_num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->max_num_buffers;
> -
>  	if (*nplanes) {
>  		if (sizes[0] < size) {
>  			cfe_err(cfe, "sizes[0] %i < size %u\n", sizes[0], size);
> @@ -1999,6 +1996,7 @@ static int cfe_register_node(struct cfe_device *cfe, int id)
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	q->lock = &node->lock;
>  	q->min_queued_buffers = 1;
> +	q->min_reqbufs_allocation = 3;
>  	q->dev = &cfe->pdev->dev;
>  
>  	ret = vb2_queue_init(q);
> 
> ---
> base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
> change-id: 20241029-rp1-cfe-fixes-0270923a2f94
> 
> Best regards,


