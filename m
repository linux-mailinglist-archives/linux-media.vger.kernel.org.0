Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC08755A5
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 19:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbfGYRZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 13:25:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46430 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfGYRZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 13:25:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E0DF128BC5E
Message-ID: <c913045aa4e514786d449d4c0a05c43f09918d27.camel@collabora.com>
Subject: Re: [PATCH v2 6/7] media: hantro: Move VP8 common code
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Date:   Thu, 25 Jul 2019 14:25:28 -0300
In-Reply-To: <20190725133819.16379d96@coco.lan>
References: <20190725141756.2518-1-ezequiel@collabora.com>
         <20190725141756.2518-7-ezequiel@collabora.com>
         <20190725132230.6e7f0c22@coco.lan>
         <92f197b5d45e5f250c001752b11749af2533f4c3.camel@collabora.com>
         <20190725133819.16379d96@coco.lan>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-07-25 at 13:38 -0300, Mauro Carvalho Chehab wrote:
> Em Thu, 25 Jul 2019 13:30:07 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
> > On Thu, 2019-07-25 at 13:22 -0300, Mauro Carvalho Chehab wrote:
> > > Em Thu, 25 Jul 2019 11:17:55 -0300
> > > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> > >   
> > > > In order to introduce support for RK3399 VP8 decoding,
> > > > move some common VP8 code. This will be reused by
> > > > the RK3399 implementation, reducing code duplication.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > ---
> > > >  .../staging/media/hantro/hantro_g1_vp8_dec.c    | 17 -----------------
> > > >  drivers/staging/media/hantro/hantro_hw.h        |  4 ++++
> > > >  drivers/staging/media/hantro/hantro_vp8.c       | 15 +++++++++++++++
> > > >  3 files changed, 19 insertions(+), 17 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> > > > index cd1fbd3a0d5f..181e2f76d8cb 100644
> > > > --- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> > > > +++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> > > > @@ -16,8 +16,6 @@
> > > >  #include "hantro.h"
> > > >  #include "hantro_g1_regs.h"
> > > >  
> > > > -#define DEC_8190_ALIGN_MASK	0x07U
> > > > -
> > > >  /* DCT partition base address regs */
> > > >  static const struct hantro_reg vp8_dec_dct_base[8] = {
> > > >  	{ G1_REG_ADDR_STR, 0, 0xffffffff },
> > > > @@ -131,21 +129,6 @@ static const struct hantro_reg vp8_dec_pred_bc_tap[8][4] = {
> > > >  	},
> > > >  };
> > > >  
> > > > -/*
> > > > - * filter taps taken to 7-bit precision,
> > > > - * reference RFC6386#Page-16, filters[8][6]
> > > > - */
> > > > -static const u32 vp8_dec_mc_filter[8][6] = {
> > > > -	{ 0, 0, 128, 0, 0, 0 },
> > > > -	{ 0, -6, 123, 12, -1, 0 },
> > > > -	{ 2, -11, 108, 36, -8, 1 },
> > > > -	{ 0, -9, 93, 50, -6, 0 },
> > > > -	{ 3, -16, 77, 77, -16, 3 },
> > > > -	{ 0, -6, 50, 93, -9, 0 },
> > > > -	{ 1, -8, 36, 108, -11, 2 },
> > > > -	{ 0, -1, 12, 123, -6, 0 }
> > > > -};
> > > > -
> > > >  /*
> > > >   * Set loop filters
> > > >   */
> > > > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> > > > index 34ef24e3a9ef..185e27d47e47 100644
> > > > --- a/drivers/staging/media/hantro/hantro_hw.h
> > > > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > > > @@ -15,6 +15,8 @@
> > > >  #include <media/vp8-ctrls.h>
> > > >  #include <media/videobuf2-core.h>
> > > >  
> > > > +#define DEC_8190_ALIGN_MASK	0x07U
> > > > +
> > > >  struct hantro_dev;
> > > >  struct hantro_ctx;
> > > >  struct hantro_buf;
> > > > @@ -93,6 +95,8 @@ extern const struct hantro_variant rk3399_vpu_variant;
> > > >  extern const struct hantro_variant rk3328_vpu_variant;
> > > >  extern const struct hantro_variant rk3288_vpu_variant;
> > > >  
> > > > +extern const u32 vp8_dec_mc_filter[8][6];  
> > > 
> > > Please don't do that, as a symbol like that can easily cause
> > > namespace clashes in the future. For all exported symbols,
> > > please prepend the driver name, like:
> > > 
> > > 	hantro_vp8_dec_mc_filter
> > >   
> > 
> > Right. Would you be OK, with taking Hans' PR and accept a follow-up
> > patch fixing this?
> 
> No need. I went ahead and applied a fixup. Just remember about that
> next time, as we don't want to mess with Kernel export symbol
> namespace.
> 

Yes, definitely makes sense.

Thanks for taking care of this,
Eze

