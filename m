Return-Path: <linux-media+bounces-3038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118D81F2EF
	for <lists+linux-media@lfdr.de>; Thu, 28 Dec 2023 00:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF4742823F0
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 23:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A8D4989D;
	Wed, 27 Dec 2023 23:09:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFD51DFF3
	for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 23:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875a56.versanet.de ([83.135.90.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rId1A-0000uL-L2; Thu, 28 Dec 2023 00:08:52 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: liujianfeng1994@gmail.com, Jianfeng Liu <liujianfeng1994@gmail.com>
Subject:
 Re: [PATCH 1/3] media: verisilicon: Add support for Hantro G1 on RK3588
Date: Thu, 28 Dec 2023 00:08:51 +0100
Message-ID: <2608913.C4sosBPzcN@diego>
In-Reply-To: <20231227173911.3295410-2-liujianfeng1994@gmail.com>
References:
 <20231227173911.3295410-1-liujianfeng1994@gmail.com>
 <20231227173911.3295410-2-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Mittwoch, 27. Dezember 2023, 18:39:09 CET schrieb Jianfeng Liu:
> This patch adds support for RK3588 in existing Hantro
> video decoder kernel driver.
> 
> Tested with FFmpeg v4l2_request code taken from [1]
> with MPEG2, H.264 and VP8 samples.
> 
> [1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
> 

thanks so much for looking into this :-) .

But please use scripts/get_maintainers.pl when submitting patches, because
not everyone reads mailing lists all the time.

Most of the time people enjoy being able to read the whole series, so also
please don't do per-patch recipients.

Especially when adding devicetree bindings you need to add the devicetree
maintainers and lists.

So running for example
# scripts/get_maintainer.pl -f Documentation/devicetree/bindings/media/rockchip-vpu.yaml
will get you this pretty correct list of recipients for your series:

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Philipp Zabel <p.zabel@pengutronix.de>
Mauro Carvalho Chehab <mchehab@kernel.org>
Rob Herring <robh+dt@kernel.org>
Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Conor Dooley <conor+dt@kernel.org>
Heiko Stuebner <heiko@sntech.de>
linux-media@vger.kernel.org
linux-rockchip@lists.infradead.org
devicetree@vger.kernel.org
linux-arm-kernel@lists.infradead.org
linux-kernel@vger.kernel.org





> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c    |  1 +
>  drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
>  .../media/platform/verisilicon/rockchip_vpu_hw.c   | 14 ++++++++++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index db3df6cc4..4c988f272 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -722,6 +722,7 @@ static const struct of_device_id of_hantro_match[] = {
>  	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
>  	{ .compatible = "rockchip,rk3568-vepu", .data = &rk3568_vepu_variant, },
>  	{ .compatible = "rockchip,rk3568-vpu", .data = &rk3568_vpu_variant, },
> +	{ .compatible = "rockchip,rk3588-vpu", .data = &rk3588_vpu_variant, },
>  	{ .compatible = "rockchip,rk3588-av1-vpu", .data = &rk3588_vpu981_variant, },

I do think this list is sorted alphabetically, so rk3588-vpu would be _after_ rk3588-a...


Thanks
Heiko

>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
> index 9aec8a79a..276f09a7a 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -405,6 +405,7 @@ extern const struct hantro_variant rk3328_vpu_variant;
>  extern const struct hantro_variant rk3399_vpu_variant;
>  extern const struct hantro_variant rk3568_vepu_variant;
>  extern const struct hantro_variant rk3568_vpu_variant;
> +extern const struct hantro_variant rk3588_vpu_variant;
>  extern const struct hantro_variant rk3588_vpu981_variant;
>  extern const struct hantro_variant sama5d4_vdec_variant;
>  extern const struct hantro_variant sunxi_vpu_variant;
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> index f97527670..4ee8d64eb 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -797,6 +797,20 @@ const struct hantro_variant px30_vpu_variant = {
>  	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
>  };
> 
> +const struct hantro_variant rk3588_vpu_variant = {
> +	.dec_offset = 0x400,
> +	.dec_fmts = rockchip_vdpu2_dec_fmts,
> +	.num_dec_fmts = ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
> +	.codec = HANTRO_MPEG2_DECODER |
> +		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
> +	.codec_ops = rk3399_vpu_codec_ops,
> +	.irqs = rockchip_vdpu2_irqs,
> +	.num_irqs = ARRAY_SIZE(rockchip_vdpu2_irqs),
> +	.init = rockchip_vpu_hw_init,
> +	.clk_names = rockchip_vpu_clk_names,
> +	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
> +};
> +
>  const struct hantro_variant rk3588_vpu981_variant = {
>  	.dec_offset = 0x0,
>  	.dec_fmts = rockchip_vpu981_dec_fmts,
> --
> 2.34.1
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 





