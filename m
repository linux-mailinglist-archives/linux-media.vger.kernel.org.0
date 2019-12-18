Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACCC3124E08
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 17:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbfLRQkb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 11:40:31 -0500
Received: from mailoutvs56.siol.net ([185.57.226.247]:50590 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726931AbfLRQkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 11:40:31 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 161B1521E9F;
        Wed, 18 Dec 2019 17:40:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id xfVEE8OS8Kem; Wed, 18 Dec 2019 17:40:27 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 9BF6A523FB0;
        Wed, 18 Dec 2019 17:40:27 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 799165236CB;
        Wed, 18 Dec 2019 17:40:26 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     mchehab@kernel.org, mripard@kernel.org, hverkuil@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] media: cedrus: Fix decoding for some HEVC videos
Date:   Wed, 18 Dec 2019 17:40:25 +0100
Message-ID: <2234008.mhVpxdDc1K@jernej-laptop>
In-Reply-To: <20191218084047.GA2900@aptenodytes>
References: <20191213161516.54688-1-jernej.skrabec@siol.net> <20191213161516.54688-2-jernej.skrabec@siol.net> <20191218084047.GA2900@aptenodytes>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne sreda, 18. december 2019 ob 09:40:47 CET je Paul Kocialkowski napisal(a):
> Hi,
> 
> On Fri 13 Dec 19, 17:15, Jernej Skrabec wrote:
> > It seems that for some HEVC videos at least one bitstream parsing
> > trigger must be called in order to be decoded correctly. There is no
> > explanation why this helps, but it was observed that several videos
> > with this fix are now decoded correctly and there is no regression with
> > others.
> > 
> > Without this fix, those same videos totally crash HEVC decoder (other
> > decoder engines are unaffected). After decoding those problematic
> > videos, HEVC decoder always returns only green image (all zeros).
> > Only complete HW reset helps.
> > 
> > This fix is similar to that for H264.
> 
> Thanks for the fix, interesting that the same issue shows up on HEVC!
> I suspect that Allwinner folks never really tested the engine without
> using it for bitstream parsing.

That thought also crossed my mind. It's even worse with VP8. There you can't 
have proper decoding at all without calling one specific bitstream parsing 
function.

> 
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks!

Best regards,
Jernej

> 
> Cheers,
> 
> Paul
> 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 25 ++++++++++++++++---
> >  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  1 +
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c index
> > 109d3289418c..5a207f1e137c 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > @@ -7,6 +7,7 @@
> > 
> >   * Copyright (C) 2018 Bootlin
> >   */
> > 
> > +#include <linux/delay.h>
> > 
> >  #include <linux/types.h>
> >  
> >  #include <media/videobuf2-dma-contig.h>
> > 
> > @@ -283,6 +284,23 @@ static void cedrus_h265_write_scaling_list(struct
> > cedrus_ctx *ctx,> 
> >  		}
> >  
> >  }
> > 
> > +static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
> > +{
> > +	int count = 0;
> > +
> > +	while (count < num) {
> > +		int tmp = min(num - count, 32);
> > +
> > +		cedrus_write(dev, VE_DEC_H265_TRIGGER,
> > +			     VE_DEC_H265_TRIGGER_FLUSH_BITS |
> > +			     VE_DEC_H265_TRIGGER_TYPE_N_BITS(tmp));
> > +		while (cedrus_read(dev, VE_DEC_H265_STATUS) &
> > VE_DEC_H265_STATUS_VLD_BUSY) +			udelay(1);
> > +
> > +		count += tmp;
> > +	}
> > +}
> > +
> > 
> >  static void cedrus_h265_setup(struct cedrus_ctx *ctx,
> >  
> >  			      struct cedrus_run *run)
> >  
> >  {
> > 
> > @@ -347,10 +365,9 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
> > 
> >  	/* Source offset and length in bits. */
> > 
> > -	reg = slice_params->data_bit_offset;
> > -	cedrus_write(dev, VE_DEC_H265_BITS_OFFSET, reg);
> > +	cedrus_write(dev, VE_DEC_H265_BITS_OFFSET, 0);
> > 
> > -	reg = slice_params->bit_size - slice_params->data_bit_offset;
> > +	reg = slice_params->bit_size;
> > 
> >  	cedrus_write(dev, VE_DEC_H265_BITS_LEN, reg);
> >  	
> >  	/* Source beginning and end addresses. */
> > 
> > @@ -385,6 +402,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
> > 
> >  	/* Initialize bitstream access. */
> >  	cedrus_write(dev, VE_DEC_H265_TRIGGER, 
VE_DEC_H265_TRIGGER_INIT_SWDEC);
> > 
> > +	cedrus_h265_skip_bits(dev, slice_params->data_bit_offset);
> > +
> > 
> >  	/* Bitstream parameters. */
> >  	
> >  	reg = VE_DEC_H265_DEC_NAL_HDR_NAL_UNIT_TYPE(slice_params-
>nal_unit_type)
> >  	|
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h index
> > 0d9449fe2b28..df1cceef8d93 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > @@ -424,6 +424,7 @@
> > 
> >  #define VE_DEC_H265_TRIGGER			(VE_ENGINE_DEC_H265 + 
0x34)
> > 
> > +#define VE_DEC_H265_TRIGGER_TYPE_N_BITS(x)	(((x) & 0x3f) << 8)
> > 
> >  #define VE_DEC_H265_TRIGGER_STCD_VC1		(0x02 << 4)
> >  #define VE_DEC_H265_TRIGGER_STCD_AVS		(0x01 << 4)
> >  #define VE_DEC_H265_TRIGGER_STCD_HEVC		(0x00 << 4)




