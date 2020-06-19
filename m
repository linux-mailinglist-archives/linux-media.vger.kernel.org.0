Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C53201285
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 17:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393084AbgFSPWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 11:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393078AbgFSPWw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 11:22:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAA0C06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 08:22:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8965C552;
        Fri, 19 Jun 2020 17:22:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592580170;
        bh=CP4llM9MfdiadH25cs8m8az/rOpCnPSQ2QZhiRHEX9I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FNTLaFjMXCPOVi3BpqI0XYMvgD38pNznJBpoiI8Elp7i05v1BsZ+gNef3KmImLw76
         7N+kd0xiCcgwSDErdeO6ZBvFVzqj7MZm/eNJEbcrM1KEg9mZ7xX8LZZx9QMWgUE3Vu
         EAbONx2h08bSxqkwKKJ89eww06oczEAwUcbujRvk=
Date:   Fri, 19 Jun 2020 18:22:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     linux-media@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 030/107] media: ti-vpe: cal: Use dev_* print macros
Message-ID: <20200619152227.GF5823@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-31-laurent.pinchart@ideasonboard.com>
 <20200618182855.xdx64prbc54ifn5k@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200618182855.xdx64prbc54ifn5k@ti.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Thu, Jun 18, 2020 at 01:28:55PM -0500, Benoit Parrot wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote on Mon [2020-Jun-15 02:58:27 +0300]:
> > Use the dev_* print macros instead of the v4l2_* print macros. This
> > prepares for a common print infrastructure that will also support the
> > cal_camerarx instances.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index e40967751aa4..e62089832713 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -53,19 +53,22 @@ static unsigned debug;
> >  module_param(debug, uint, 0644);
> >  MODULE_PARM_DESC(debug, "activates debug info");
> >  
> > -#define cal_dbg(level, cal, fmt, arg...)	\
> > -		v4l2_dbg(level, debug, &cal->v4l2_dev, fmt, ##arg)
> > +#define cal_dbg(level, cal, fmt, arg...)				\
> > +	do {								\
> > +		if (debug >= (level))					\
> > +			dev_dbg(&(cal)->pdev->dev, fmt, ##arg);		\
> > +	} while (0)
> 
> The problem here with using dev_dbg is that you loose the ability to enable
> or disable debug log at runtime. Which I find highly convenient.
> 
> With dev_dbg you have to compile with DEBUG defined or at the very least
> DYNAMIC_DEBUG.

That's actually one of the things I like about dev_dbg(), it shrinks the
kernel when DEBUG (or DYNAMIC_DEBUG) isn't defined. In which case we
could possibly even remove the debug module parameter, as DYNAMIC_DEBUG
already gives us control over which messages are printed.

I however hear your concern, and I don't dispute that a module parameter
can also make debugging easier, at in some cases. It's partly a matter
of getting use to DYNAMIC_DEBUG, but not just that. I'll thus replace
dev_dbg() with dev_printk(KERN_DEBUG, ...) here.

> >  #define cal_info(cal, fmt, arg...)	\
> > -		v4l2_info(&cal->v4l2_dev, fmt, ##arg)
> > +	dev_info(&(cal)->pdev->dev, fmt, ##arg)
> >  #define cal_err(cal, fmt, arg...)	\
> > -		v4l2_err(&cal->v4l2_dev, fmt, ##arg)
> > +	dev_err(&(cal)->pdev->dev, fmt, ##arg)
> >  
> >  #define ctx_dbg(level, ctx, fmt, arg...)	\
> > -		v4l2_dbg(level, debug, &ctx->v4l2_dev, fmt, ##arg)
> > +	cal_dbg(level, (ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
> >  #define ctx_info(ctx, fmt, arg...)	\
> > -		v4l2_info(&ctx->v4l2_dev, fmt, ##arg)
> > +	cal_info((ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
> >  #define ctx_err(ctx, fmt, arg...)	\
> > -		v4l2_err(&ctx->v4l2_dev, fmt, ##arg)
> > +	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
> >  
> >  #define CAL_NUM_CONTEXT 2
> >  

-- 
Regards,

Laurent Pinchart
