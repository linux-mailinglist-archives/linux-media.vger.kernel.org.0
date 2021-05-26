Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751893914E8
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 12:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbhEZKaG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 06:30:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59666 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233830AbhEZKaF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 06:30:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B8FF31F40B01
Message-ID: <b65236f3b8bbf35411b536df8b260d9f8a9dbd80.camel@collabora.com>
Subject: Re: [PATCH 05/10] media: hantro: add support for Rockchip RK3036
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Alex Bee <knaerzche@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Date:   Wed, 26 May 2021 07:28:23 -0300
In-Reply-To: <20210525152225.154302-6-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
         <20210525152225.154302-6-knaerzche@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

Thanks a lot for the patch.

On Tue, 2021-05-25 at 17:22 +0200, Alex Bee wrote:
> RK3036's VPU IP block is the same as RK3288 has, except that it doesn't
> have an encoder, decoding is supported up to 1920x1088 only and the axi
> clock can be set to 300 MHz max.
> 
> Add a new RK3036 variant which reflect this differences.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c    |  1 +
>  drivers/staging/media/hantro/hantro_hw.h     |  1 +
>  drivers/staging/media/hantro/rk3288_vpu_hw.c | 49 ++++++++++++++++++++
>  3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 38ea7b24036e..4f3c08e85bb8 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -490,6 +490,7 @@ static const struct of_device_id of_hantro_match[] = {
>         { .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
>         { .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
>         { .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
> +       { .compatible = "rockchip,rk3036-vpu", .data = &rk3036_vpu_variant, },
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>         { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index de2bc367a15a..d8d6b0d3c3b3 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -164,6 +164,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
>  extern const struct hantro_variant rk3328_vpu_variant;
>  extern const struct hantro_variant rk3288_vpu_variant;
>  extern const struct hantro_variant rk3066_vpu_variant;
> +extern const struct hantro_variant rk3036_vpu_variant;
>  extern const struct hantro_variant imx8mq_vpu_variant;
>  extern const struct hantro_variant sama5d4_vdec_variant;
>  
> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> index 29805c4bd92f..c4684df4e012 100644
> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> @@ -174,6 +174,13 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
>         return IRQ_HANDLED;
>  }
>  
> +static int rk3036_vpu_hw_init(struct hantro_dev *vpu)
> +{
> +       /* Bump ACLKs to max. possible freq. to improve performance. */
> +       clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
> +       return 0;
> +}
> +
>  static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
>  {
>         /* Bump ACLKs to max. possible freq. to improve performance. */
> @@ -209,6 +216,27 @@ static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
>  /*
>   * Supported codec ops.
>   */
> +static const struct hantro_codec_ops rk3036_vpu_codec_ops[] = {
> +       [HANTRO_MODE_H264_DEC] = {
> +               .run = hantro_g1_h264_dec_run,
> +               .reset = hantro_g1_reset,
> +               .init = hantro_h264_dec_init,
> +               .exit = hantro_h264_dec_exit,
> +       },
> +       [HANTRO_MODE_MPEG2_DEC] = {
> +               .run = hantro_g1_mpeg2_dec_run,
> +               .reset = hantro_g1_reset,
> +               .init = hantro_mpeg2_dec_init,
> +               .exit = hantro_mpeg2_dec_exit,
> +       },
> +       [HANTRO_MODE_VP8_DEC] = {
> +               .run = hantro_g1_vp8_dec_run,
> +               .reset = hantro_g1_reset,
> +               .init = hantro_vp8_dec_init,
> +               .exit = hantro_vp8_dec_exit,
> +       },
> +};
> +
>  static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
>         [HANTRO_MODE_JPEG_ENC] = {
>                 .run = hantro_h1_jpeg_enc_run,
> @@ -269,6 +297,10 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
>   * VPU variant.
>   */
>  
> +static const struct hantro_irq rk3036_irqs[] = {
> +       { "vdpu", hantro_g1_irq },
> +};
> +
>  static const struct hantro_irq rk3288_irqs[] = {
>         { "vepu", rk3288_vepu_irq },
>         { "vdpu", hantro_g1_irq },
> @@ -283,6 +315,23 @@ static const char * const rk3288_clk_names[] = {
>         "aclk", "hclk"
>  };
>  
> +const struct hantro_variant rk3036_vpu_variant = {
> +       .dec_offset = 0x400,

If it doesn't have an encoder, then you should just
use dec_offset = 0x0.

Thanks,
Ezequiel

