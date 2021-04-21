Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419553667A8
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 11:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237784AbhDUJJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 05:09:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58876 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237589AbhDUJJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 05:09:39 -0400
Received: from [IPv6:2a02:810a:880:f54:c90f:3911:b88f:e044] (unknown [IPv6:2a02:810a:880:f54:c90f:3911:b88f:e044])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7FDFC1F42A1A;
        Wed, 21 Apr 2021 10:09:04 +0100 (BST)
Subject: Re: [PATCH v2] media: rkisp1: rkisp1-params.c: Fix typos
To:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210420174522.9618-1-sebastian.fricke@posteo.net>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <a0c52c66-6930-7ace-e1ac-9608a7e72bfa@collabora.com>
Date:   Wed, 21 Apr 2021 11:09:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210420174522.9618-1-sebastian.fricke@posteo.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
Thanks for the fix,

On 20.04.21 19:45, Sebastian Fricke wrote:
> s/when the camera active/when the camera is active/
> s/thus not isr protection/therefore there is no need to acquire a lock/
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b6beddd988d0..529c6e21815f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1258,7 +1258,10 @@ void rkisp1_params_configure(struct rkisp1_params *params,
>   	rkisp1_params_config_parameter(params);
>   }
>   
> -/* Not called when the camera active, thus not isr protection. */
> +/*
> + * Not called when the camera is active, therefore there is no need to acquire
> + * a lock.
> + */
>   void rkisp1_params_disable(struct rkisp1_params *params)
>   {
>   	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
> 
