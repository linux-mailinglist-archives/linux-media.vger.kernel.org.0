Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB127247913
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 23:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgHQVrd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 17:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728689AbgHQVrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 17:47:33 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27ABDC061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 14:47:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 1D4312945A0
Subject: Re: [PATCH v2 06/14] media: staging: rkisp1: params: in the isr,
 return if buffer list is empty
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-7-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <99efbc23-b9bc-b86b-07bb-db9229e7948e@collabora.com>
Date:   Mon, 17 Aug 2020 18:47:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815103734.31153-7-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
> Currently the code in the isr checks if the buffer list is not
> empty before referencing a buffer and then check again if the
> buffer is not NULL. Instead we can save one 'if' statement by
> returning if the buffers list is empty.
> Also remove non-helpful inline doc 'get one empty buffer'
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 6a76c586e916..86bbd01e18c7 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1206,16 +1206,14 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  		return;
>  	}
>  
> -	/* get one empty buffer */
> -	if (!list_empty(&params->params))
> -		cur_buf = list_first_entry(&params->params,
> -					   struct rkisp1_buffer, queue);
> -
> -	if (!cur_buf) {
> +	if (list_empty(&params->params)) {
>  		spin_unlock(&params->config_lock);
>  		return;
>  	}
>  
> +	cur_buf = list_first_entry(&params->params,
> +				   struct rkisp1_buffer, queue);
> +
>  	new_params = (struct rkisp1_params_cfg *)(cur_buf->vaddr[0]);
>  
>  	rkisp1_isp_isr_other_config(params, new_params);
> 
