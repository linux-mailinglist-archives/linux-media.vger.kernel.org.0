Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B77E281D8D
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 23:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgJBVV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 17:21:27 -0400
Received: from retiisi.org.uk ([95.216.213.190]:52470 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJBVV1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 17:21:27 -0400
X-Greylist: delayed 90857 seconds by postgrey-1.27 at vger.kernel.org; Fri, 02 Oct 2020 17:21:27 EDT
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 68B47634C87;
        Sat,  3 Oct 2020 00:21:03 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kOSUB-00014D-8c; Sat, 03 Oct 2020 00:21:03 +0300
Date:   Sat, 3 Oct 2020 00:21:03 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] rcar-csi2: Set bus type when parsing fwnode
Message-ID: <20201002212103.GO2024@valkosipuli.retiisi.org.uk>
References: <20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914215011.339387-3-niklas.soderlund+renesas@ragnatech.se>
 <20200915112752.f2vpxnvusson65uz@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200915112752.f2vpxnvusson65uz@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Sep 15, 2020 at 01:27:52PM +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Mon, Sep 14, 2020 at 11:50:11PM +0200, Niklas Söderlund wrote:
> > The only supported bus for the R-Car CSI-2 driver is CSI-2 DPHY, specify
> > this before parsing the fwnode.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index 23e89ef2429d310a..b2e58f51b94fccd7 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -874,7 +874,9 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
> >  	struct v4l2_async_subdev *asd;
> >  	struct fwnode_handle *fwnode;
> >  	struct fwnode_handle *ep;
> > -	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
> > +	struct v4l2_fwnode_endpoint v4l2_ep = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > +	};
> 
> I would also take the occasion to make bus-type mandatory in
> bindings as v4l2_fwnode_endpoint_parse() will fail only if it detect a
> mismatch between bus_type and "bus-type".

You don't really need bus-type property if the hardware supports a single
type. Then you can, as above, parse the endpoint with that type set by the
caller.

-- 
Sakari Ailus
