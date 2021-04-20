Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2DD365538
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 11:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhDTJYn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 05:24:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42412 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhDTJYm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 05:24:42 -0400
Received: from [IPv6:2a02:810a:880:f54:f1d0:e988:975e:70e9] (unknown [IPv6:2a02:810a:880:f54:f1d0:e988:975e:70e9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 984801F42746;
        Tue, 20 Apr 2021 10:24:10 +0100 (BST)
Subject: Re: [PATCH] media: rkisp1: rksip1-capture.c: Improve comments and fix
 typos
To:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210418103425.45525-1-sebastian.fricke@posteo.net>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <0b5feeb7-44e6-f25d-cc03-37aba628be14@collabora.com>
Date:   Tue, 20 Apr 2021 11:24:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210418103425.45525-1-sebastian.fricke@posteo.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
Thanks for the fixes

On 18.04.21 12:34, Sebastian Fricke wrote:
> Improve the wording of the function description to increase readability.
> 
> Fix three typos:
> s/during processing a frame/while processing a frame/
> s/it also update/it also updates/
> s/there's not buf in shadow/there's no buffer in a shadow register/
> 
> Replace the abbreviation 'buf' with the full word buffer, the
> abbreviation 'config' with the verb configure, and 'regs' with registers.
> The goal of this change is to ease the reading flow of the comment.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
> ---
> Side-note:
> I also believe there should be a description for the abbreviation FE, as
> it is not described anywhere. I think it means frame end, right?.

yes, this is Frame End. You can send a patch replacing "FE" with frame end if you like.

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   .../platform/rockchip/rkisp1/rkisp1-capture.c    | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 5f6c9d1623e4..9643bdd05b7b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -830,8 +830,8 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
>   }
>   
>   /*
> - * Most of registers inside rockchip ISP1 have shadow register since
> - * they must be not be changed during processing a frame.
> + * Most registers inside the rockchip ISP1 have shadow register since
> + * they must not be changed while processing a frame.
>    * Usually, each sub-module updates its shadow register after
>    * processing the last pixel of a frame.
>    */
> @@ -847,14 +847,14 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
>   	spin_lock_irq(&cap->buf.lock);
>   	rkisp1_set_next_buf(cap);
>   	cap->ops->enable(cap);
> -	/* It's safe to config ACTIVE and SHADOW regs for the
> +	/* It's safe to configure ACTIVE and SHADOW registers for the
>   	 * first stream. While when the second is starting, do NOT
> -	 * force update because it also update the first one.
> +	 * force update because it also updates the first one.
>   	 *
> -	 * The latter case would drop one more buf(that is 2) since
> -	 * there's not buf in shadow when the second FE received. This's
> -	 * also required because the second FE maybe corrupt especially
> -	 * when run at 120fps.
> +	 * The latter case would drop one more buffer(that is 2) since
> +	 * there's no buffer in a shadow register when the second FE received.
> +	 * This's also required because the second FE maybe corrupt
> +	 * especially when run at 120fps.
>   	 */
>   	if (!other->is_streaming) {
>   		/* force cfg update */
> 
