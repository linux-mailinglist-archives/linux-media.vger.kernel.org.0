Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773273B4BB3
	for <lists+linux-media@lfdr.de>; Sat, 26 Jun 2021 02:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFZAwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 20:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhFZAwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 20:52:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E938C061574
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 17:49:40 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1E3A21F40F21
Message-ID: <45487f17ccb8f430f4db5b197ec23e3c4bf5d280.camel@collabora.com>
Subject: Re: [PATCH 12/12] media: hantro: Add support for the Rockchip PX30
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Alex Bee <knaerzche@gmail.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, kernel@collabora.com
Date:   Fri, 25 Jun 2021 21:49:28 -0300
In-Reply-To: <0f129376-1377-8288-7768-91a57790014d@gmail.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
         <20210624182612.177969-13-ezequiel@collabora.com>
         <0f129376-1377-8288-7768-91a57790014d@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On Fri, 2021-06-25 at 00:39 +0200, Alex Bee wrote:
> Hi Ezequiel,
> 
> Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
> > From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > 
> > The PX30 SoC includes both the VDPU2 and VEPU2 blocks which are similar
> > to the RK3399 (Hantro G1/H1 with shuffled registers).
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >   drivers/staging/media/hantro/hantro_drv.c     |  1 +
> >   drivers/staging/media/hantro/hantro_hw.h      |  1 +
> >   .../staging/media/hantro/rockchip_vpu_hw.c    | 28 +++++++++++++++++++
> >   3 files changed, 30 insertions(+)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index 9b5415176bfe..8a2edd67f2c6 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -582,6 +582,7 @@ static const struct v4l2_file_operations hantro_fops = {
> >   
> >   static const struct of_device_id of_hantro_match[] = {
> >   #ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
> > +       { .compatible = "rockchip,px30-vpu",   .data = &px30_vpu_variant, },
> >         { .compatible = "rockchip,rk3036-vpu", .data = &rk3036_vpu_variant, },
> >         { .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
> >         { .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
> > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> > index 9296624654a6..df7b5e3a57b9 100644
> > --- a/drivers/staging/media/hantro/hantro_hw.h
> > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > @@ -209,6 +209,7 @@ enum hantro_enc_fmt {
> >   
> >   extern const struct hantro_variant imx8mq_vpu_g2_variant;
> >   extern const struct hantro_variant imx8mq_vpu_variant;
> > +extern const struct hantro_variant px30_vpu_variant;
> >   extern const struct hantro_variant rk3036_vpu_variant;
> >   extern const struct hantro_variant rk3066_vpu_variant;
> >   extern const struct hantro_variant rk3288_vpu_variant;
> > diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> > index e4e3b5e7689b..e7f56e30b4a8 100644
> > --- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
> > +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> > @@ -16,6 +16,7 @@
> >   
> >   #define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
> >   #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
> > +#define PX30_ACLK_MAX_FREQ (300 * 1000 * 1000)
> >   
> 
> Not sure it is required (besides semantics) to introduce a new 
> *ACLK_MAX_FREQ here. rk3036_vpu_hw_init could be used to entirely 
> replace px30_vpu_hw_init in px30_vpu_variant.
> 
> (Maybe we can find some more common names, after we know which variant 
> combinations exist)
> 

TBH, I considered getting rid of all the macros and just use something
like 300 * MHZ.

Another alternative is to encode the clock rate in struct hantro_variant
itself.

In any case, I don't see this adding any value, so maybe I'll
just reuse rk3036_vpu_hw_init as you suggest.

> >   /*
> >    * Supported formats.
> > @@ -279,6 +280,12 @@ static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
> >         return 0;
> >   }
> >   
> > +static int px30_vpu_hw_init(struct hantro_dev *vpu)
> > +{
> > +       clk_set_rate(vpu->clocks[0].clk, PX30_ACLK_MAX_FREQ);
> > +       return 0;
> > +}
> > +
> >   static void rk3066_vpu_dec_reset(struct hantro_ctx *ctx)
> >   {
> >         struct hantro_dev *vpu = ctx->dev;
> > @@ -452,6 +459,10 @@ static const char * const rockchip_vpu_clk_names[] = {
> >         "aclk", "hclk"
> >   };
> >   
> > +static const char * const px30_clk_names[] = {
> > +       "aclk", "hclk"
> > +};
> > +
> >   /* VDPU1/VEPU1 */
> >   
> >   const struct hantro_variant rk3036_vpu_variant = {
> > @@ -548,3 +559,20 @@ const struct hantro_variant rk3399_vpu_variant = {
> >         .clk_names = rockchip_vpu_clk_names,
> >         .num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
> >   };
> > +
> > +const struct hantro_variant px30_vpu_variant = {
> > +       .enc_offset = 0x0,
> > +       .enc_fmts = rockchip_vpu_enc_fmts,
> > +       .num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
> > +       .dec_offset = 0x400,
> > +       .dec_fmts = rk3399_vpu_dec_fmts,
> > +       .num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
> > +       .codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
> > +                HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
> > +       .codec_ops = rk3399_vpu_codec_ops,
> > +       .irqs = rockchip_vpu2_irqs,
> > +       .num_irqs = ARRAY_SIZE(rockchip_vpu2_irqs),
> > +       .init = px30_vpu_hw_init,
> > +       .clk_names = px30_clk_names,
> > +       .num_clocks = ARRAY_SIZE(px30_clk_names)
> Better re-use rockchip_vpu_clk_names for these two.

Ah, this slipped through. You are right of course.

-- 
Kindly,
Ezequiel

