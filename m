Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C5436553B
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 11:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhDTJ1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 05:27:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42468 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhDTJ07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 05:26:59 -0400
Received: from [IPv6:2a02:810a:880:f54:f1d0:e988:975e:70e9] (unknown [IPv6:2a02:810a:880:f54:f1d0:e988:975e:70e9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9A3271F41F0F;
        Tue, 20 Apr 2021 10:26:27 +0100 (BST)
Subject: Re: [PATCH] media: rkisp1: rkisp1-params.c: Fix typos
To:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210419060224.44353-1-sebastian.fricke@posteo.net>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <02425403-5b44-62f8-4cab-a677fe317dbe@collabora.com>
Date:   Tue, 20 Apr 2021 11:26:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210419060224.44353-1-sebastian.fricke@posteo.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,


On 19.04.21 08:02, Sebastian Fricke wrote:
> s/when the camera active/when the camera is active/
> s/thus not isr protection/thus no ISR protection/
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
> ---
>   drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b6beddd988d0..ead948a2d01e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1258,7 +1258,7 @@ void rkisp1_params_configure(struct rkisp1_params *params,
>   	rkisp1_params_config_parameter(params);
>   }
>   
> -/* Not called when the camera active, thus not isr protection. */
> +/* Not called when the camera is active, thus no ISR protection. */

I think it would better to write

/* Not called when the camera is active, therefore there is no need to acquire a lock */

Thanks,
Dafna

>   void rkisp1_params_disable(struct rkisp1_params *params)
>   {
>   	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> 
