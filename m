Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DA32FA853
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 19:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406012AbhARSG0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 13:06:26 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46520 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407465AbhARSEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 13:04:47 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 696F01F44834
Subject: Re: [PATCH v6 1/4] media: rockchip: rkisp1: fix comment about number
 of histogram sub-windows
To:     Heiko Stuebner <heiko@sntech.de>, dafna.hirschfeld@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210118110448.275389-1-heiko@sntech.de>
 <20210118110448.275389-2-heiko@sntech.de>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <ce91ca03-211c-0c27-1204-4bafc815ffca@collabora.com>
Date:   Mon, 18 Jan 2021 15:03:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118110448.275389-2-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/18/21 8:04 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The histogram data is divided into 16 sub-windows, not 25.
> See RKISP1_CIF_ISP_HIST_BIN_N_MAX being defined as 16 for reference
> and this also matches the datasheet.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  include/uapi/linux/rkisp1-config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 6e449e784260..ba443771cc0b 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -846,7 +846,7 @@ struct rkisp1_cif_isp_af_stat {
>   *
>   * @hist_bins: measured bin counters
>   *
> - * Measurement window divided into 25 sub-windows, set
> + * Measurement window divided into 16 sub-windows, set
>   * with ISP_HIST_XXX
>   */
>  struct rkisp1_cif_isp_hist_stat {
> 
