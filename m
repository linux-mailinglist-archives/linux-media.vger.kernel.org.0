Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE15201161
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 17:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391995AbgFSPlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 11:41:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34036 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403778AbgFSPkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 11:40:46 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C23A552;
        Fri, 19 Jun 2020 17:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592581244;
        bh=few0hraihlucTKv2CI/X4H0rEq6CRIhANUxhWCu1DOg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gK78Od7D1xoYwifXtShc6ju95r2MQtBGtEfp9wQcElB7lJiX1ibnx8gbTrAdGngWz
         RAKGuBkqMxhvs3sO/tF2Js9/2vh0DWzO1yT+NxgRsJYrWWZx55hAjHkQwHe9AnRTQ2
         biQDJxEiukacdbMesUISYECC4Boax3k7kpswTYLc=
Date:   Fri, 19 Jun 2020 18:40:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v1 082/107] media: ti-vpe: cal: Move CAL I/O accessors to
 cal.h
Message-ID: <20200619154020.GH5823@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-83-laurent.pinchart@ideasonboard.com>
 <CAAEAJfDLv-hx=4JL2=+AgU1c8bcLhNu8_ZGu8cNtkXDVLx8H3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAEAJfDLv-hx=4JL2=+AgU1c8bcLhNu8_ZGu8cNtkXDVLx8H3A@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Fri, Jun 19, 2020 at 01:18:28AM -0300, Ezequiel Garcia wrote:
> On Sun, 14 Jun 2020 at 21:01, Laurent Pinchart wrote:
> >
> > To prepare for the split of the camerarx code to a separate file, move
> > the CAL I/O accessors to cal.h. This requires renaming the accessors
> > with a cal_prefix, as the current names are too generic and prone to
> > namespace clashes.
> >
> > The reg_read() and read_write() macros, that cover both CAL and CAMERARX
> > register access, are split in two groups of inline functions, one for
> > CAL access and one for CAMERARX access.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal-video.c |   1 -
> >  drivers/media/platform/ti-vpe/cal.c       | 280 ++++++++++------------
> >  drivers/media/platform/ti-vpe/cal.h       |  36 +++
> >  3 files changed, 168 insertions(+), 149 deletions(-)
> >
> > diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> > index 82b32a2f9db5..df472a175e83 100644
> > --- a/drivers/media/platform/ti-vpe/cal-video.c
> > +++ b/drivers/media/platform/ti-vpe/cal-video.c
> > @@ -9,7 +9,6 @@
> >   *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >   */
> >
> > -#include <linux/bitfield.h>
> >  #include <linux/delay.h>
> >  #include <linux/ioctl.h>
> >  #include <linux/pm_runtime.h>
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index 0bc02ba52b59..abeded3b5e6c 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -9,11 +9,9 @@
> >   *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >   */
> >
> > -#include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/interrupt.h>
> > -#include <linux/io.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > @@ -133,33 +131,6 @@ static const struct cal_data am654_cal_data = {
> >   * ------------------------------------------------------------------
> >   */
> >
> > -#define reg_read(dev, offset) ioread32(dev->base + offset)
> > -#define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
> > -
> > -static inline u32 reg_read_field(struct cal_dev *cal, u32 offset, u32 mask)
> > -{
> > -       return FIELD_GET(mask, reg_read(cal, offset));
> > -}
> > -
> > -static inline void reg_write_field(struct cal_dev *cal, u32 offset, u32 value,
> > -                                  u32 mask)
> > -{
> > -       u32 val = reg_read(cal, offset);
> > -
> > -       val &= ~mask;
> > -       val |= FIELD_PREP(mask, value);
> > -       reg_write(cal, offset, val);
> > -}
> > -
> > -static inline void set_field(u32 *valp, u32 field, u32 mask)
> > -{
> > -       u32 val = *valp;
> > -
> > -       val &= ~mask;
> > -       val |= (field << __ffs(mask)) & mask;
> > -       *valp = val;
> > -}
> > -
> 
> Slightly unrelated, have you considered moving all of these to regmap?
> 
> Perhaps it will make the code more maintainable.

I'm considering it now :-) Benoit, Tomi, any objection ? Otherwise I'll
try to switch to regmap on top of this series.

-- 
Regards,

Laurent Pinchart
