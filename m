Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1002C4A0E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 10:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfJBI4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 04:56:52 -0400
Received: from retiisi.org.uk ([95.216.213.190]:59028 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726250AbfJBI4w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 04:56:52 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3BA00634C87;
        Wed,  2 Oct 2019 11:56:24 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iFaQo-00028Q-LB; Wed, 02 Oct 2019 11:56:22 +0300
Date:   Wed, 2 Oct 2019 11:56:22 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Pass default bus type when parsing
 fwnode endpoint
Message-ID: <20191002085622.GN896@valkosipuli.retiisi.org.uk>
References: <20191001145503.5170-1-manivannan.sadhasivam@linaro.org>
 <20191002075432.bkee4fl6cfcr25iv@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002075432.bkee4fl6cfcr25iv@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo, Manivannan,

On Wed, Oct 02, 2019 at 09:54:32AM +0200, Jacopo Mondi wrote:
> Hello Manivannan,
> 
> On Tue, Oct 01, 2019 at 08:25:03PM +0530, Manivannan Sadhasivam wrote:
> > The caller of v4l2_fwnode_endpoint_alloc_parse() is expected to pass a
> > valid bus_type parameter for proper working of this API. Hence, pass
> > V4L2_MBUS_CSI2_DPHY as the bus_type parameter as this driver only supports
> > MIPI CSI2 for now. Without this commit, the API fails on 96Boards
> > Dragonboard410c connected to MAX9286 deserializer.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >
> > This patch depends on the latest "MAX9286 GMSL Support" series posted
> > by Kieran Bingham.
> >
> >  drivers/media/i2c/max9286.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 9390edf5ad9c..6e1299f15493 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -976,7 +976,9 @@ static int max9286_parse_dt(struct max9286_device *max9286)
> >
> >  		/* For the source endpoint just parse the bus configuration. */
> >  		if (ep.port == MAX9286_SRC_PAD) {
> > -			struct v4l2_fwnode_endpoint vep;
> > +			struct v4l2_fwnode_endpoint vep = {
> > +				.bus_type = V4L2_MBUS_CSI2_DPHY
> > +			};
> 
> Isn't the bus_type just an hint ? __v4l2_fwnode_endpoint_parse()
> should try to parse CSI2 first, and should be able to to deduct the bus
> type from the properties specified in DT...

It's basically telling the V4L2 fwnode parser to parse that bus only, and
not guess what the caller wanted.

This is what drivers should actually be doing. It also allows setting the
defaults that many drivers declare in their DT bindings but very few
actually implement.

> 
> Anyway, I'm not against this change, the contrary actually, I'm just
> afraid it might hide some more subtile bug, as we don't need this on
> our platforms...

I'd expect it to be safer this way, as there's no guessing involved.

-- 
Regards,

Sakari Ailus
