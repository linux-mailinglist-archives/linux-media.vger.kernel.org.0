Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFDE2C57B1
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 15:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391174AbgKZO5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 09:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389878AbgKZO5S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 09:57:18 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA9DC0613D4;
        Thu, 26 Nov 2020 06:57:18 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 052381F4490B
Subject: Re: [PATCH] media: rockchip: rkisp1: Fix typos in comments and macro
 definitions
To:     Peilin Ye <yepeilin.cs@gmail.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201126122148.9162-1-yepeilin.cs@gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <19ef2031-1e09-6418-1bce-7c5713d296d7@collabora.com>
Date:   Thu, 26 Nov 2020 11:57:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126122148.9162-1-yepeilin.cs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peilin,

On 11/26/20 9:21 AM, Peilin Ye wrote:
> Fix 4 typos under drivers/media/platform/rockchip/rkisp1/ found by
> checkpatch, including the RKISP1_CIF_MI_{M,S}P_PINGPONG_ENABLE macro
> definitions.
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Thanks

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> Hi Helen, Dafna,
> 
> I noticed that the RKISP1_CIF_MI_{M,S}P_PINGPONG_ENABLE macros are not
> being used yet, but according to page 12 of this developer guide [1] I
> think they are for *enabling* the ping-pong ("double buffers") mode?

Looks like. The documentation I have doesn't explain much about this
mode, it just mention that bit is used to enable it, and that
MI_{MP,SP}_{CR,CB}_BASE_AD_INIT2 are used to configure base address 2.


Regards,
Helen

> 
> Based on linux-next 9d3e48f20e11 ("Add linux-next specific files for
> 20201125").
> 
> Thanks,
> Peilin Ye
> 
> [1] https://dl.vamrs.com/products/rock960/docs/sw/Rockchip%C2%A0Linux%20Camera%C2%A0Developer%20Guide%20V1.1.pdf#page=12
> 
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 ++--
>  drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index b81235afd053..94b65680c4c1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -46,7 +46,7 @@ enum rkisp1_plane {
>  /*
>   * @fourcc: pixel format
>   * @fmt_type: helper filed for pixel format
> - * @uv_swap: if cb cr swaped, for yuv
> + * @uv_swap: if cb cr swapped, for yuv
>   * @write_format: defines how YCbCr self picture data is written to memory
>   * @output_format: defines sp output format
>   * @mbus: the mbus code on the src resizer pad that matches the pixel format
> @@ -870,7 +870,7 @@ static void rkisp1_cap_stream_disable(struct rkisp1_capture *cap)
>  {
>  	int ret;
>  
> -	/* Stream should stop in interrupt. If it dosn't, stop it by force. */
> +	/* Stream should stop in interrupt. If it doesn't, stop it by force. */
>  	cap->is_stopping = true;
>  	ret = wait_event_timeout(cap->done,
>  				 !cap->is_streaming,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index 049f6c3a11df..8a8d960a679c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -106,8 +106,8 @@
>  #define RKISP1_CIF_MI_SP_Y_FULL_YUV2RGB			BIT(8)
>  #define RKISP1_CIF_MI_SP_CBCR_FULL_YUV2RGB		BIT(9)
>  #define RKISP1_CIF_MI_SP_422NONCOSITEED			BIT(10)
> -#define RKISP1_CIF_MI_MP_PINGPONG_ENABEL		BIT(11)
> -#define RKISP1_CIF_MI_SP_PINGPONG_ENABEL		BIT(12)
> +#define RKISP1_CIF_MI_MP_PINGPONG_ENABLE		BIT(11)
> +#define RKISP1_CIF_MI_SP_PINGPONG_ENABLE		BIT(12)
>  #define RKISP1_CIF_MI_MP_AUTOUPDATE_ENABLE		BIT(13)
>  #define RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE		BIT(14)
>  #define RKISP1_CIF_MI_LAST_PIXEL_SIG_ENABLE		BIT(15)
> 
