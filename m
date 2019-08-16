Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D13D901E3
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 14:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfHPMo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 08:44:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38648 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfHPMo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 08:44:27 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0F0C2AF;
        Fri, 16 Aug 2019 14:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565959465;
        bh=13TS07WjEU8T1vNw89rJNneidSGr9WeYO9OEoonJdE4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tdrDIrqcnJhgs6D7g2Qp9s8Hl8aAMvllrZLEltP9gbTo9Pz8iG4TPZ6GIG+Gi4XNj
         /mSQX1p7Vthh2ZM6bmlE5maDy+dcOPSzumeSAV40Xn9Q+DWqjbaIaM7tiGcFwfrIrZ
         VEER0nH/7roTfFqElknjTMijQ32IYX76FOfivDio=
Date:   Fri, 16 Aug 2019 15:44:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] v4l: rcar-fcp: Read IP version register at probe time
Message-ID: <20190816124412.GG5020@pendragon.ideasonboard.com>
References: <20190814145417.30670-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWnnWTgnrjbSSxkg1rUadosijZyrfB8LQk5zWhzmg3WtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWnnWTgnrjbSSxkg1rUadosijZyrfB8LQk5zWhzmg3WtQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Fri, Aug 16, 2019 at 10:21:42AM +0200, Geert Uytterhoeven wrote:
> On Wed, Aug 14, 2019 at 4:55 PM Laurent Pinchart wrote:
> > This helps identifying the IP core version, for debugging purpose only
> > for now.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > --- a/drivers/media/platform/rcar-fcp.c
> > +++ b/drivers/media/platform/rcar-fcp.c
> 
> > @@ -138,6 +167,18 @@ static int rcar_fcp_probe(struct platform_device *pdev)
> >
> >         pm_runtime_enable(&pdev->dev);
> >
> > +       fcp->iomem = devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(fcp->iomem))
> > +               return PTR_ERR(fcp->iomem);
> > +
> > +       pm_runtime_get_sync(&pdev->dev);
> > +       version = rcar_fcp_read(fcp, FCP_VCR);
> > +       pm_runtime_put(&pdev->dev);
> 
> Unless (dynamic) debugging is enabled, all of the above is done for obtaining
> a version number that is not used.
> Can this be improved?

With FCNL support we'll need that anyway.

This patch comes from a larger FCNL series that rejects devices with an
unknown version, and I thought it could be fast-tracked in a stripped
form already. I don't mind either way, I can wait until it's time to
merge FCNL support.

> > +
> > +       dev_dbg(&pdev->dev, "FCP category %u revision %u\n",
> > +               (version & FCP_VCR_CATEGORY_MASK) >> FCP_VCR_CATEGORY_SHIFT,
> > +               (version & FCP_VCR_REVISION_MASK) >> FCP_VCR_REVISION_SHIFT);
> > +
> >         mutex_lock(&fcp_lock);
> >         list_add_tail(&fcp->list, &fcp_devices);
> >         mutex_unlock(&fcp_lock);

-- 
Regards,

Laurent Pinchart
