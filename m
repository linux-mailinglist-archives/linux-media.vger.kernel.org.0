Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E29B7867F4
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 08:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240255AbjHXG6D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 02:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240261AbjHXG5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 02:57:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B61EE45
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 23:57:33 -0700 (PDT)
Received: from [IPV6:2a01:e0a:120:3210:672:c310:4c8a:3a97] (unknown [IPv6:2a01:e0a:120:3210:672:c310:4c8a:3a97])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A1116607234;
        Thu, 24 Aug 2023 07:57:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1692860251;
        bh=HPMQ1bPmoWEPB0yWrgfHNNEbAq0NAVVN+S70L/CODms=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MUQHYpRxOXuwGvWOKKGN13z4KjTLdvBVslGRO0Eq5CrLPIVG7qHw+sJR9E+S6oQ4t
         W41ckH19sDE85RB7HTntg2a3tqvQCaKt6ZPwYyDxn2QpvaXHXm5Ocn1HEA8jCvOFiW
         NznFV7dHygIL30F3v9/+Br0js8hQ7BWtgNSF8kApEOYBb6koI27c6p28dNMveO4ygT
         nbx1Aj63cULG3u1ZXLrpdKrbQoeyp6zrlH1q8vaGPAvz9Cw5CJo2IfAU2dVUf0EHXl
         unlKX6fv508DeD8rhvZwrDnWZINNzL9i2+vKDoqpq0BEa7p7bT24n1jq8Z2rCCgs4C
         PXrv2ex8dmFyQ==
Message-ID: <fe855c2f-bf91-9832-5947-c21a3573f0f3@collabora.com>
Date:   Thu, 24 Aug 2023 08:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: verisilicon: Do not enable G2 postproc downscale
 if source is narrower than destination
To:     Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-rockchip@lists.infradead.org
References: <20230824013935.303132-1-marex@denx.de>
Content-Language: en-US
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20230824013935.303132-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 24/08/2023 à 03:39, Marek Vasut a écrit :
> In case of encoded input VP9 data width that is not multiple of macroblock
> size, which is 16 (e.g. 1080x1920 frames, where 1080 is multiple of 8), the
> width is padded to be a multiple of macroblock size (for 1080x1920 frames,
> that is 1088x1920).
>
> The hantro_postproc_g2_enable() checks whether the encoded data width is
> equal to decoded frame width, and if not, enables down-scale mode. For a
> frame where input is 1080x1920 and output is 1088x1920, this is incorrect
> as no down-scale happens, the frame is only padded. Enabling the down-scale
> mode in this case results in corrupted frames.
>
> Fix this by adjusting the check to test whether encoded data width is
> greater than decoded frame width, and only in that case enable the
> down-scale mode.
>
> To generate input test data to trigger this bug, use e.g.:
> $ gst-launch-1.0 videotestsrc ! video/x-raw,width=272,height=256,format=I420 ! \
>                   vp9enc ! matroskamux ! filesink location=/tmp/test.vp9
> To trigger the bug upon decoding (note that the NV12 must be forced, as
> that assures the output data would pass the G2 postproc):
> $ gst-launch-1.0 filesrc location=/tmp/test.vp9 ! matroskademux ! vp9parse ! \
>                   v4l2slvp9dec ! video/x-raw,format=NV12 ! videoconvert ! fbdevsink

I had propose the same patch in my series in July:
https://patchwork.kernel.org/project/linux-media/patch/20230705121056.37017-8-benjamin.gaignard@collabora.com/

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

>
> Fixes: 79c987de8b35 ("media: hantro: Use post processor scaling capacities")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> ---
>   drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
> index 0224ff68ab3fc..64d6fb852ae9b 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -107,7 +107,7 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
>   
>   static int down_scale_factor(struct hantro_ctx *ctx)
>   {
> -	if (ctx->src_fmt.width == ctx->dst_fmt.width)
> +	if (ctx->src_fmt.width <= ctx->dst_fmt.width)
>   		return 0;
>   
>   	return DIV_ROUND_CLOSEST(ctx->src_fmt.width, ctx->dst_fmt.width);
