Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98042012E2
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 18:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390431AbgFSPTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 11:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390501AbgFSPPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 11:15:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EC0C06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 08:15:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E861D556;
        Fri, 19 Jun 2020 17:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592579748;
        bh=Qwezk4bEE2IKslEthYt/G5Hnlz1LMp+4b44WrfSV+1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OhFzbnKxE12QAfKvv0hDNtO/Mh9g+GNSMYAq/Dzpr3CUb2uHuST31TSnUFk0wC3lN
         ZmU9IHBAlvuOUeMsiwAmIE3dVZdjaojsHOyFy1LxQzlB4bnNOVJldk+6UYhSXf2RfZ
         25p1IIey2QkOUBvBy4YKEHoKzN3Q34oRJgFC1HEg=
Date:   Fri, 19 Jun 2020 18:15:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     linux-media@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 008/107] media: ti-vpe: cal: Turn
 reg_(read|write)_field() into inline functions
Message-ID: <20200619151524.GE5823@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-9-laurent.pinchart@ideasonboard.com>
 <20200618132955.ozbx3heo6a5tas3m@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200618132955.ozbx3heo6a5tas3m@ti.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Thu, Jun 18, 2020 at 08:29:55AM -0500, Benoit Parrot wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote on Mon [2020-Jun-15 02:58:05 +0300]:
> > Turn the reg_(read|write)_field() macros into inline functions for
> > additional type safety. Use the FIELD_GET() and FIELD_PREP() macros
> > internally instead of reinventing the wheel.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal.c | 28 ++++++++++++++++------------
> >  1 file changed, 16 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index fa86a53882cc..8c068af936f0 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -6,6 +6,7 @@
> >   * Benoit Parrot, <bparrot@ti.com>
> >   */
> >  
> > +#include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/interrupt.h>
> > @@ -76,13 +77,6 @@ static const struct v4l2_fract
> >  #define reg_read(dev, offset) ioread32(dev->base + offset)
> >  #define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
> >  
> > -#define reg_read_field(dev, offset, mask) get_field(reg_read(dev, offset), \
> > -						    mask)
> > -#define reg_write_field(dev, offset, field, mask) { \
> > -	u32 val = reg_read(dev, offset); \
> > -	set_field(&val, field, mask); \
> > -	reg_write(dev, offset, val); }
> > -
> >  /* ------------------------------------------------------------------
> >   *	Basic structures
> >   * ------------------------------------------------------------------
> > @@ -418,6 +412,21 @@ struct cal_ctx {
> >  	bool dma_act;
> >  };
> >  
> > +static inline u32 reg_read_field(struct cal_dev *dev, u32 offset, u32 mask)
> > +{
> > +	return FIELD_GET(mask, reg_read(dev, offset));
> > +}
> > +
> > +static inline void reg_write_field(struct cal_dev *dev, u32 offset, u32 value,
> > +				   u32 mask)
> > +{
> > +	u32 val = reg_read(dev, offset);
> > +
> > +	val &= ~mask;
> > +	val |= FIELD_PREP(mask, value);
> > +	reg_write(dev, offset, val);
> > +}
> > +
> >  static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
> >  						u32 pixelformat)
> >  {
> > @@ -453,11 +462,6 @@ static inline struct cal_ctx *notifier_to_ctx(struct v4l2_async_notifier *n)
> >  	return container_of(n, struct cal_ctx, notifier);
> >  }
> >  
> > -static inline int get_field(u32 value, u32 mask)
> > -{
> > -	return (value & mask) >> __ffs(mask);
> > -}
> > -
> >  static inline void set_field(u32 *valp, u32 field, u32 mask)
> >  {
> >  	u32 val = *valp;
> 
> Is set_field still in use then after this patch?
> Any reason to keep it around?

Yes, it's still used in a quite few functions. I'm considering
addressing that on top, several (but not all) use caes are in functions
that perform read-modify-write updates when they could just write the
whole register.

-- 
Regards,

Laurent Pinchart
