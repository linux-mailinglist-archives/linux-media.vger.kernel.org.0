Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3ECD333B2
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 17:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfFCPhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 11:37:22 -0400
Received: from mailoutvs38.siol.net ([185.57.226.229]:51660 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727150AbfFCPhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 11:37:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 41407520580;
        Mon,  3 Jun 2019 17:37:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id y2fQPCRP4Vjv; Mon,  3 Jun 2019 17:37:17 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id DA31B520F55;
        Mon,  3 Jun 2019 17:37:17 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 89BE3520580;
        Mon,  3 Jun 2019 17:37:17 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     paul.kocialkowski@bootlin.com, wens@csie.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: cedrus: Fix decoding for some H264 videos
Date:   Mon, 03 Jun 2019 17:37:17 +0200
Message-ID: <2536664.ljALn0aKaT@jernej-laptop>
In-Reply-To: <20190603115536.j5lan6wtmbxpoe2k@flea>
References: <20190530211516.1891-1-jernej.skrabec@siol.net> <20190530211516.1891-4-jernej.skrabec@siol.net> <20190603115536.j5lan6wtmbxpoe2k@flea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 03. junij 2019 ob 13:55:36 CEST je Maxime Ripard napisal(a):
> Hi,
> 
> On Thu, May 30, 2019 at 11:15:12PM +0200, Jernej Skrabec wrote:
> > It seems that for some H264 videos at least one bitstream parsing
> > trigger must be called in order to be decoded correctly. There is no
> > explanation why this helps, but it was observed that two sample videos
> > with this fix are now decoded correctly and there is no regression with
> > others.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > I have two samples which are fixed by this:
> > http://jernej.libreelec.tv/videos/h264/test.mkv
> > http://jernej.libreelec.tv/videos/h264/Dredd%20%E2%80%93%20DTS%20Sound%20C
> > heck%20DTS-HD%20MA%207.1.m2ts
> > 
> > Although second one also needs support for multi-slice frames, which is
> > not yet implemented here.> 
> >  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 22 ++++++++++++++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c index
> > cc8d17f211a1..d0ee3f90ff46 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -6,6 +6,7 @@
> > 
> >   * Copyright (c) 2018 Bootlin
> >   */
> > 
> > +#include <linux/delay.h>
> > 
> >  #include <linux/types.h>
> >  
> >  #include <media/videobuf2-dma-contig.h>
> > 
> > @@ -289,6 +290,20 @@ static void cedrus_write_pred_weight_table(struct
> > cedrus_ctx *ctx,> 
> >  	}
> >  
> >  }
> 
> We should have a comment here explaining why that is needed

ok.

> 
> > +static void cedrus_skip_bits(struct cedrus_dev *dev, int num)
> > +{
> > +	for (; num > 32; num -= 32) {
> > +		cedrus_write(dev, VE_H264_TRIGGER_TYPE, 0x3 | (32 << 
8));
> 
> Using defines here would be great

Yes, sorry about that.

> 
> > +		while (cedrus_read(dev, VE_H264_STATUS) & (1 << 8))
> > +			udelay(1);
> > +	}
> 
> A new line here would be great
> 
> > +	if (num > 0) {
> > +		cedrus_write(dev, VE_H264_TRIGGER_TYPE, 0x3 | (num << 
8));
> > +		while (cedrus_read(dev, VE_H264_STATUS) & (1 << 8))
> > +			udelay(1);
> > +	}
> 
> Can't we make that a bit simpler by not duplicating the loop?
> 
> Something like:
> 
> int current = 0;
> 
> while (current < num) {
>     int tmp = min(num - current, 32);
> 
>     cedrus_write(dev, VE_H264_TRIGGER_TYPE, 0x3 | (current << 8))
>     while (...)
>        ...
> 
>     current += tmp;
> }

Yes, that looks better, I'll change it in next version.

Best regards,
Jernej



