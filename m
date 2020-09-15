Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C559226AFE4
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 23:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgIOVsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 17:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727758AbgIOVam (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 17:30:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE66EC06178B;
        Tue, 15 Sep 2020 14:30:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51E4414DF;
        Tue, 15 Sep 2020 23:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600205437;
        bh=kA7uE9NAJIlft7fViAmLhyKvPEaTdyCyxDz+3ts2ktE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CGLOBZLq9Pkfz8NfxyNVpP5qKzA1Ka6YAKdJ8S2zHCsfsZc0wngHUzyBtlH6dBy+T
         s4p4PdUaMY/ymi4rO4uku7RtHCVqlUHYTrT9OYd7pX01kibsfF/tkXNqilvJDB64T8
         MxTP4GhL/zX0V4W03qihvP7JGT2LEk+0BFT63pxg=
Date:   Wed, 16 Sep 2020 00:30:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: Kconfig: Update help description
 VIDEO_RENESAS_FCP config
Message-ID: <20200915213008.GB28219@pendragon.ideasonboard.com>
References: <20200911101046.20200-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200915212607.GC3998@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200915212607.GC3998@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 16, 2020 at 12:26:08AM +0300, Laurent Pinchart wrote:
> Hi Prabhakar,
> 
> Thank you for the patch.
> 
> On Fri, Sep 11, 2020 at 11:10:46AM +0100, Lad Prabhakar wrote:
> > rcar-fcp driver is also used on Renesas RZ/G2 SoC's, update the same
> 
> I'm not sure what you mean by "the same" here. I'd propose
> 
> The rcar_dw_hdmi driver is also used on Renesas RZ/G2 SoCs. Update the
> Kconfig entry description to reflect this.

And this was meant to be sent as a review of the DRM_RCAR_DW_HDMI patch
:-S For this patch, you could write

"The rcar-fcp driver is also used on Renesas RZ/G2 SoCs. Update the
Kconfig entry description to reflect this."

I would also replace the subject line with

"media: rcar-fcp: Update description for VIDEO_RENESAS_FCP Kconfig entry"

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> If you're fine with that, there's no need to resubmit the patch.
> 
> > to reflect help description for VIDEO_RENESAS_FCP config.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > ---
> >  drivers/media/platform/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index bbf32086b607..a5716e9f463a 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -426,8 +426,8 @@ config VIDEO_RENESAS_FCP
> >  	help
> >  	  This is a driver for the Renesas Frame Compression Processor (FCP).
> >  	  The FCP is a companion module of video processing modules in the
> > -	  Renesas R-Car Gen3 SoCs. It handles memory access for the codec,
> > -	  VSP and FDP modules.
> > +	  Renesas R-Car Gen3 and RZ/G2 SoCs. It handles memory access for
> > +	  the codec, VSP and FDP modules.
> >  
> >  	  To compile this driver as a module, choose M here: the module
> >  	  will be called rcar-fcp.

-- 
Regards,

Laurent Pinchart
