Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07A52FA844
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 19:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407396AbhARSE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 13:04:56 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46544 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407467AbhARSEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 13:04:48 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id EA5C11F44836
Subject: Re: [PATCH v6 2/4] media: rockchip: rkisp1: reduce number of
 histogram grid elements in uapi
To:     Heiko Stuebner <heiko@sntech.de>, dafna.hirschfeld@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210118110448.275389-1-heiko@sntech.de>
 <20210118110448.275389-3-heiko@sntech.de>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <31c655ca-ec76-6135-5e05-5d2f62a48ff5@collabora.com>
Date:   Mon, 18 Jan 2021 15:04:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118110448.275389-3-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/18/21 8:04 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The uapi right now specifies an array size of 28 but the actual number
> of elements is only 25 with the last 3 being unused.
> 
> Reduce the array size to the correct number of elements.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  include/uapi/linux/rkisp1-config.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index ba443771cc0b..ecfb8f7a6c70 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -102,8 +102,7 @@
>  /*
>   * Histogram calculation
>   */
> -/* Last 3 values unused. */
> -#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28
> +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 25
>  
>  /*
>   * Defect Pixel Cluster Correction
> 
