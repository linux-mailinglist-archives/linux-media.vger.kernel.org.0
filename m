Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4F228E7DD
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 22:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbgJNU1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 16:27:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51926 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbgJNU1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 16:27:52 -0400
Received: from [IPv6:2804:14c:483:7f66::1004] (unknown [IPv6:2804:14c:483:7f66::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8BE331F4582E;
        Wed, 14 Oct 2020 21:27:47 +0100 (BST)
Subject: Re: [PATCH 2/6] media: staging: rkisp1: params: in stop_streaming,
 use list_splice_init to move the buffers
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
 <20201002184222.7094-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <e32bfefb-7b0c-669c-32da-8b407216d936@collabora.com>
Date:   Wed, 14 Oct 2020 17:27:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201002184222.7094-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/2/20 3:42 PM, Dafna Hirschfeld wrote:
> Currently the code uses 'list_cut_position' to move the
> buffers to a temporary list. Replace it with
> 'list_splice_init'. This is nicer since we don't need
> to access params.prev. Also, replace INIT_LIST_HEAD
> with the simpler LIST_HEAD.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 986d293201e6..cb9f3332a9a0 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1462,9 +1462,7 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>  {
>  	struct rkisp1_params *params = vq->drv_priv;
>  	struct rkisp1_buffer *buf;
> -	struct list_head tmp_list;
> -
> -	INIT_LIST_HEAD(&tmp_list);
> +	LIST_HEAD(tmp_list);
>  
>  	/*
>  	 * we first move the buffers into a local list 'tmp_list'
> @@ -1473,7 +1471,7 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>  	 */
>  	spin_lock_irq(&params->config_lock);
>  	params->is_streaming = false;
> -	list_cut_position(&tmp_list, &params->params, params->params.prev);
> +	list_splice_init(&params->params, &tmp_list);
>  	spin_unlock_irq(&params->config_lock);
>  
>  	list_for_each_entry(buf, &tmp_list, queue)
> 
