Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD095204CB
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 13:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfEPLew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 07:34:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34372 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfEPLev (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 07:34:51 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D16F2FD;
        Thu, 16 May 2019 13:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558006489;
        bh=tD6pYcvyI1ppPO9NRGcc+yvujI/ioWR4xT1ttbnpils=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZHYxJrJrY6rhdctIDEsnmjHlabRm6si1l8zIAeSlZOV+yYVnkf6HVAvPz7t2mWg2k
         546y2KUpPhEwyMB8mJ+56qJty2Y6/FpDFHUHYux+WGZGRLcAIZPLomKpMXA5mQF8gC
         VJKcW5vrUyp/rL07VoAgM49CXgDUI8JTxnlvn0XQ=
Date:   Thu, 16 May 2019 14:34:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli@fpond.eu>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2 2/8] rcar-vin: Remove unneeded calls to
 pm_runtime_{enable,disable}
Message-ID: <20190516113433.GC14820@pendragon.ideasonboard.com>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUv_dVvQP1+zkPMJ--=zOWovbrnUTjZsGez9BFg2zOQ=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUv_dVvQP1+zkPMJ--=zOWovbrnUTjZsGez9BFg2zOQ=Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 16, 2019 at 09:27:03AM +0200, Geert Uytterhoeven wrote:
> On Thu, May 16, 2019 at 3:49 AM Niklas Söderlund wrote:
> > Runtime PM is already enabled unconditionally when the driver is probed
> > and disabled when it's removed. There is no point in doing it again for
> > Gen2 when opening and closing the video device.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index b821ea01786eb1ff..0841f1a0bfd7ba3a 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -797,8 +797,6 @@ static int rvin_initialize_device(struct file *file)
> >         if (ret < 0)
> >                 return ret;
> >
> > -       pm_runtime_enable(&vin->vdev.dev);
> 
> Ah, this already (partly) answers my question on patch 1/8.

Note that those are two different devices, here we enable runtime PM in
the V4L2 video node class device, while at probe time we enable it on
the platform device. I agree that this call should go, but that's only
because all runtime PM calls on the class device should go :-)

> 
> > -
> >         /*
> >          * Try to configure with default parameters. Notice: this is the
> >          * very first open, so, we cannot race against other calls,

-- 
Regards,

Laurent Pinchart
