Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64A724790A
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 23:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgHQVqx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 17:46:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48852 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgHQVqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 17:46:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id BD8AF298610
Subject: Re: [PATCH v2 02/14] media: staging: rkisp1: params: use
 rkisp1_param_set_bits to set reg in isr
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <0e303e12-02f8-51ac-5967-c3da675cf942@collabora.com>
Date:   Mon, 17 Aug 2020 18:46:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815103734.31153-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
> replace a read and write of RKISP1_CIF_ISP_CTRL register
> in the isr with the 'rkisp1_param_set_bits' function
> that does that.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 6d69df36c495..8d881f1df1e6 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1199,7 +1199,6 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  	struct rkisp1_params *params = &rkisp1->params;
>  	struct rkisp1_params_cfg *new_params;
>  	struct rkisp1_buffer *cur_buf = NULL;
> -	u32 isp_ctrl;
>  
>  	spin_lock(&params->config_lock);
>  	if (!params->is_streaming) {
> @@ -1222,9 +1221,7 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  	rkisp1_isp_isr_meas_config(params, new_params);
>  
>  	/* update shadow register immediately */
> -	isp_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_CTRL);
> -	isp_ctrl |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD;
> -	rkisp1_write(params->rkisp1, isp_ctrl, RKISP1_CIF_ISP_CTRL);
> +	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL, RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
>  
>  	spin_lock(&params->config_lock);
>  	list_del(&cur_buf->queue);
> 
