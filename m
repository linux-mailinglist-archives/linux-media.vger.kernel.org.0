Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 350D12DC9B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 14:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfE2MYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 08:24:48 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42221 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfE2MYs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 08:24:48 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hVxdO-0004Tg-Or; Wed, 29 May 2019 14:24:46 +0200
Message-ID: <1559132686.3651.8.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/9] media: hantro: make irq names configurable
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Date:   Wed, 29 May 2019 14:24:46 +0200
In-Reply-To: <20190529133456.0096a6a4@collabora.com>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
         <20190529095424.23614-5-p.zabel@pengutronix.de>
         <20190529133456.0096a6a4@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

On Wed, 2019-05-29 at 13:34 +0200, Boris Brezillon wrote:
> On Wed, 29 May 2019 11:54:19 +0200
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > The i.MX8MQ bindings will use different IRQ names ("g1" instead of
> > "vdpu", and "g2"), so make them configurable. This also allows to
> > register more than two IRQs, which will be required for i.MX8MM support
> > later (it will add "h1" instead of "vepu").
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > Changes since v1 [1]:
> >  - Rebased onto "[PATCH v6] Add MPEG-2 decoding to Rockchip VPU" series.
> > 
> > [1] https://patchwork.linuxtv.org/patch/56285/
> > ---
> >  drivers/staging/media/hantro/hantro.h        | 11 ++++---
> >  drivers/staging/media/hantro/hantro_drv.c    | 31 +++++++-------------
> >  drivers/staging/media/hantro/rk3288_vpu_hw.c |  5 ++--
> >  drivers/staging/media/hantro/rk3399_vpu_hw.c |  9 ++++--
> >  4 files changed, 26 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> > index 296b9ffad547..6b90fe48bcdf 100644
> > --- a/drivers/staging/media/hantro/hantro.h
> > +++ b/drivers/staging/media/hantro/hantro.h
> > @@ -26,6 +26,7 @@
> >  #include "hantro_hw.h"
> >  
> >  #define HANTRO_MAX_CLOCKS		4
> > +#define HANTRO_MAX_IRQS			3
> >  
> >  #define MPEG2_MB_DIM			16
> >  #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
> > @@ -57,8 +58,9 @@ struct hantro_codec_ops;
> >   * @codec_ops:			Codec ops.
> >   * @init:			Initialize hardware.
> >   * @runtime_resume:		reenable hardware after power gating
> > - * @vepu_irq:			encoder interrupt handler
> > - * @vdpu_irq:			decoder interrupt handler
> > + * @irq_handlers:		interrupt handlers, same order as irq names
> > + * @irq_names:			array of irq names
> > + * @num_irqs:			number of irqs in the arrays
> >   * @clk_names:			array of clock names
> >   * @num_clocks:			number of clocks in the array
> >   */
> > @@ -73,8 +75,9 @@ struct hantro_variant {
> >  	const struct hantro_codec_ops *codec_ops;
> >  	int (*init)(struct hantro_dev *vpu);
> >  	int (*runtime_resume)(struct hantro_dev *vpu);
> > -	irqreturn_t (*vepu_irq)(int irq, void *priv);
> > -	irqreturn_t (*vdpu_irq)(int irq, void *priv);
> > +	irqreturn_t (*irq_handlers[HANTRO_MAX_IRQS])(int irq, void *priv);
> > +	const char *irq_names[HANTRO_MAX_IRQS];
> 
> Can we have a struct instead of an array for all handlers and another
> array for irq names:
> 
> 	struct {
> 		const char *name;
> 		irqreturn_t (*handler)(int irq, void *priv);
> 	} irqs[HANTRO_MAX_IRQS];
> 
> > +	int num_irqs;
> 
> Or we could have the struct defined outside of hantro_variant and get
> rid of HANTRO_MAX_IRQS (I find it annoying to have to update the MAX
> value every time a new variant needs more than what was previously
> defined as MAX):
> 
> struct hantro_irq {
> 	const char *name;
> 	irqreturn_t (*handler)(int irq, void *priv);
> };
> 
> struct hantro_variant {
> 	...
> 	unsigned int num_irqs;
> 	const struct hantro_irq *irqs;
> };
> 
> static const struct hantro_irq xxxx_irqs[] = {
> 	{ ... },
> 	{ ... },
> 
> };
> 
> static const struct hantro_variant xxxx_variant = {
> 	.num_irqs = ARRAY_SIZE(xxxx_irqs),
> 	.irqs = xxxx_irqs,
> };

Thank you, that looks better. I'll change this for v3.

regards
Philipp
