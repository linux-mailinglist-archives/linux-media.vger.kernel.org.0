Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21B82831D4
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 10:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgJEIWw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 04:22:52 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:57786 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgJEIWt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 04:22:49 -0400
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id E0E653B081A;
        Mon,  5 Oct 2020 08:15:29 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5F22F60016;
        Mon,  5 Oct 2020 08:15:06 +0000 (UTC)
Date:   Mon, 5 Oct 2020 10:19:06 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] rcar-csi2: Set bus type when parsing fwnode
Message-ID: <20201005081906.6usj2eydbjjbxkxe@uno.localdomain>
References: <20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914215011.339387-3-niklas.soderlund+renesas@ragnatech.se>
 <20200915112752.f2vpxnvusson65uz@uno.localdomain>
 <20201002212103.GO2024@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201002212103.GO2024@valkosipuli.retiisi.org.uk>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sat, Oct 03, 2020 at 12:21:03AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Sep 15, 2020 at 01:27:52PM +0200, Jacopo Mondi wrote:
> > Hi Niklas,
> >
> > On Mon, Sep 14, 2020 at 11:50:11PM +0200, Niklas Söderlund wrote:
> > > The only supported bus for the R-Car CSI-2 driver is CSI-2 DPHY, specify
> > > this before parsing the fwnode.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index 23e89ef2429d310a..b2e58f51b94fccd7 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -874,7 +874,9 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
> > >  	struct v4l2_async_subdev *asd;
> > >  	struct fwnode_handle *fwnode;
> > >  	struct fwnode_handle *ep;
> > > -	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
> > > +	struct v4l2_fwnode_endpoint v4l2_ep = {
> > > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > +	};
> >
> > I would also take the occasion to make bus-type mandatory in
> > bindings as v4l2_fwnode_endpoint_parse() will fail only if it detect a
> > mismatch between bus_type and "bus-type".
>
> You don't really need bus-type property if the hardware supports a single
> type. Then you can, as above, parse the endpoint with that type set by the
> caller.

Ok, that's a bit confusing as if there's no bus-type property no
bus mismatch could ever be detected, not at run-time by the v4l2-fwnode
framework, nor by DTS validation. Of course, the chances that a DTS for a
device that only supports CSI-2 specifies (in example) parallel bus
properties are quite low, so I'm fine with the way things are.

>
> --
> Sakari Ailus
