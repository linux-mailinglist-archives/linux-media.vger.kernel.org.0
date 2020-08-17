Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E1724791D
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 23:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgHQVtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 17:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbgHQVtA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 17:49:00 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9319EC061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 14:49:00 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 05D60298623
Subject: Re: [PATCH v2 14/14] media: staging: rkisp1: params: no need to lock
 default config
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-15-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <db5d1b73-34fc-e417-1ab0-d37210346943@collabora.com>
Date:   Mon, 17 Aug 2020 18:48:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815103734.31153-15-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
> In the function 'rkisp1_params_config_parameter' the lock
> is taken while applying the default config. But the lock
> only needs to protect the buffers list and the 'is_streaming'
> field, so move the locking to lock only what is needed.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 7d5c21fa630e..6c71da311294 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1283,8 +1283,6 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
>  {
>  	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
>  
> -	spin_lock(&params->config_lock);
> -
>  	rkisp1_awb_meas_config(params, &rkisp1_awb_params_default_config);
>  	rkisp1_awb_meas_enable(params, &rkisp1_awb_params_default_config,
>  			       true);
> @@ -1309,6 +1307,8 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
>  	else
>  		rkisp1_csm_config(params, false);
>  
> +	spin_lock(&params->config_lock);
> +
>  	/* apply the first buffer if there is one already */
>  	if (params->is_streaming)
>  		rkisp1_params_apply_params_cfg(params, 0);
> 
