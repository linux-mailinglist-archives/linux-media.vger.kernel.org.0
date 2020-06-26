Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D238420B6C2
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 19:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgFZRUc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 13:20:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52102 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgFZRUc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 13:20:32 -0400
Received: from [IPv6:2804:214:8597:e748:dd8b:b0cb:755:58ad] (unknown [IPv6:2804:214:8597:e748:dd8b:b0cb:755:58ad])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C06A92A5E3C;
        Fri, 26 Jun 2020 18:20:24 +0100 (BST)
Subject: Re: [PATCH 2/3] media: staging: rkisp1: params: don't release lock in
 isr before buffer is done
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
 <20200625174257.22216-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <fe4a4419-66fc-c974-06a9-9765e49003e8@collabora.com>
Date:   Fri, 26 Jun 2020 14:20:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200625174257.22216-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patch

On 6/25/20 2:42 PM, Dafna Hirschfeld wrote:
> In the irq handler 'rkisp1_params_isr', the lock 'config_lock'
> should be held as long as the current buffer is used. Otherwise the
> stop_streaming calback might remove it from the list and
> pass it to userspace while it is referenced in the irq handler.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

I think we need to clarify what 'config_lock' protects, it seems it protects
the is_streaming variable and the buffer list.
I see it being used by rkisp1_params_config_parameter(), which doesn't look right to me.

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 762c2259b807..bf006dbeee2d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1210,10 +1210,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis)
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
> @@ -1228,13 +1229,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis)
>  		isp_ctrl |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD;
>  		rkisp1_write(params->rkisp1, isp_ctrl, RKISP1_CIF_ISP_CTRL);
>  
> -		spin_lock(&params->config_lock);
>  		list_del(&cur_buf->queue);
> -		spin_unlock(&params->config_lock);
> -
>  		cur_buf->vb.sequence = frame_sequence;
>  		vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>  	}

Maybe we could refactor this whole function, as mentioned by Robin in patch 3/3, we could remove
this identation with:

if (!(isp_mis & RKISP1_CIF_ISP_FRAME))
    return;

Keep in mind that params and stats were barely touched from the original driver, so don't be afraid to refactor things :)

Thanks
Helen


> +	spin_unlock(&params->config_lock);
>  }
>  
>  static const struct rkisp1_cif_isp_awb_meas_config rkisp1_awb_params_default_config = {
> 
