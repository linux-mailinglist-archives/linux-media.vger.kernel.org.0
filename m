Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0038247911
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 23:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728722AbgHQVrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 17:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728715AbgHQVrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 17:47:14 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37FCC061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 14:47:13 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 77FDC2945A0
Subject: Re: [PATCH v2 04/14] media: staging: rkisp1: params: don't release
 lock in isr before buffer is done
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-5-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <e6e7a3d0-eeb8-851a-af9e-3596caff02ec@collabora.com>
Date:   Mon, 17 Aug 2020 18:47:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815103734.31153-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
> In the irq handler 'rkisp1_params_isr', the lock 'config_lock'
> should be held as long as the current buffer is used. Otherwise the
> stop_streaming calback might remove it from the list and
> pass it to userspace while it is referenced in the irq handler.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index eb77b4ed8655..0c2bb2eefb22 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1210,10 +1210,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  	if (!list_empty(&params->params))
>  		cur_buf = list_first_entry(&params->params,
>  					   struct rkisp1_buffer, queue);
> -	spin_unlock(&params->config_lock);
>  
> -	if (!cur_buf)
> +	if (!cur_buf) {
> +		spin_unlock(&params->config_lock);
>  		return;
> +	}
>  
>  	new_params = (struct rkisp1_params_cfg *)(cur_buf->vaddr[0]);
>  
> @@ -1223,12 +1224,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  	/* update shadow register immediately */
>  	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL, RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
>  
> -	spin_lock(&params->config_lock);
>  	list_del(&cur_buf->queue);
> -	spin_unlock(&params->config_lock);
>  
>  	cur_buf->vb.sequence = frame_sequence;
>  	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +	spin_unlock(&params->config_lock);
>  }
>  
>  static const struct rkisp1_cif_isp_awb_meas_config rkisp1_awb_params_default_config = {
> 
