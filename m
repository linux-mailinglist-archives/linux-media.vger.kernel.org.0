Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD577321AD2
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 16:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhBVPJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 10:09:16 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:55015 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhBVPJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 10:09:01 -0500
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 37DD320000E;
        Mon, 22 Feb 2021 15:07:58 +0000 (UTC)
Date:   Mon, 22 Feb 2021 16:08:25 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/16] media: i2c: rdacm20: Check return values
Message-ID: <20210222150825.xbmikkm7qyjihfr4@uno.localdomain>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-6-jacopo+renesas@jmondi.org>
 <YDMERvqtWulct59d@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YDMERvqtWulct59d@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Mon, Feb 22, 2021 at 03:09:26AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Feb 16, 2021 at 06:41:35PM +0100, Jacopo Mondi wrote:
> > The camera module initialization routine does not check the return
> > value of a few functions. Fix that.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/rdacm20.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > index 56406d82b5ac..e982373908f2 100644
> > --- a/drivers/media/i2c/rdacm20.c
> > +++ b/drivers/media/i2c/rdacm20.c
> > @@ -470,11 +470,16 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> >  	 *  Ensure that we have a good link configuration before attempting to
> >  	 *  identify the device.
> >  	 */
> > -	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> > -						MAX9271_I2CSLVTO_1024US |
> > -						MAX9271_I2CMSTBT_105KBPS);
> > +	ret = max9271_configure_i2c(&dev->serializer,
> > +				    MAX9271_I2CSLVSH_469NS_234NS |
> > +				    MAX9271_I2CSLVTO_1024US |
> > +				    MAX9271_I2CMSTBT_105KBPS);
> > +	if (ret)
> > +		return ret;
> >
> > -	max9271_configure_gmsl_link(&dev->serializer);
> > +	ret = max9271_configure_gmsl_link(&dev->serializer);
> > +	if (ret)
> > +		return ret;
>
> This looks good, so
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> But it would be more useful if max9271_configure_gmsl_link() returned
> errors when I2C writes fail :-)
>

Indeed, I'll add a patch to report back errors on failed i2c writes.

Thanks
  j

> >
> >  	ret = max9271_verify_id(&dev->serializer);
> >  	if (ret < 0)
>
> --
> Regards,
>
> Laurent Pinchart
