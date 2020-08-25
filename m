Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F12F251D9B
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 18:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgHYQyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 12:54:13 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:60803 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgHYQyM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 12:54:12 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BC1C924000C;
        Tue, 25 Aug 2020 16:54:08 +0000 (UTC)
Date:   Tue, 25 Aug 2020 18:57:53 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        phil@raspberrypi.com
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH v2 26/34] staging: vchiq_arm: Set up dma ranges on child
 devices
Message-ID: <20200825165753.rfaisv7mvxf4glg5@uno.localdomain>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-27-laurent.pinchart@ideasonboard.com>
 <078d57964f47ea29af3b8ab0af65c244a158e9b1.camel@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zsplbynvjr6ai5yr"
Content-Disposition: inline
In-Reply-To: <078d57964f47ea29af3b8ab0af65c244a158e9b1.camel@suse.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zsplbynvjr6ai5yr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Nicolas, Phil,
    I'm in the process of sending a v2 of this series, trying to
reduce the patch count by only picking what's required to support
the ISP.

This patch and [30/34] puzzles me a bit, so I'll ask a few questions.

On Mon, May 04, 2020 at 06:54:32PM +0200, Nicolas Saenz Julienne wrote:
> On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> >
> > The VCHIQ driver now loads the audio, camera, codec, and vc-sm
> > drivers as platform drivers. However they were not being given
> > the correct DMA configuration.
> >
> > Call of_dma_configure with the parent (VCHIQ) parameters to be
> > inherited by the child.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index c5c7af28c1c8..15ccd624aaab 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -2733,6 +2733,12 @@ vchiq_register_child(struct platform_device *pdev,
> > const char *name)
> >  		child = NULL;
> >  	}
> >
> > +	/*
> > +	 * We want the dma-ranges etc to be copied from the parent VCHIQ device
> > +	 * to be passed on to the children too.
> > +	 */
> > +	of_dma_configure(&new_dev->dev, pdev->dev.of_node, true);
>
> I think you could use struct platform_device_info's of_node_reused. See patch
> 908f6fc3a1405 ('usb: musb: sunxi: propagate devicetree node to glue pdev') for
> an example. AFAIK of_dma_configure() is only to be used in bus code, and there
> has been a huge effort in the past to make sure it says as such. With a proper
> fwnode set of_dma_configure() will be called during the device's probe.

I just tried giving to the children devices the parent's fwnode and set
of_node_reused as done in 908f6fc3a1405 to avoid usage of
of_dma_configure, and now I have the parent being probed 4 times, one per
each children :) I guess that was not the expected result...

What is in your opinions the best course of actions for this and patch
[30/34] ? Can we live with 'of_dma_configure()' ? [1]

I am assuming currently the vchiq children are manually registered as
there are no entries in the DTS for them, so I'm kind of missing the
point of having [30/34] in. What am I missing ?

Thanks
  j

[1] There are a few things that are not clear to me though, possible due
to my rather poor understanding of this core parts. In particular, as
the dma-ranges are assigned to the parent 'soc' node, and I assume
propagated to the children such as the 'vchiq' node, isnt' setting the
'parent' field of each newly created platform device enough to have
the property propagated ?

>
> Regards,
> Nicolas
>



--zsplbynvjr6ai5yr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl9FQxEACgkQcjQGjxah
VjyajA/+JL5AMEQ/9HKZ8Wv9Pp4ATt6yoZJ0LxvloobJUc84VPTvYCsb6auVKDoM
Ery9SfWT9Vmsh0SrKFuiLp0nTffKLMeiYKU+EOa4hJ7laCQI+5om7S3JI+FMpddJ
IusM+bUsvSYHkMNpPrtZUBr8TCc3In0nHClsqdYSXt69Pe+WZfNlJoS2kBIlF3Ir
a5VI4AeJVXpo6elxDwKAgbVGG+Oc7D+LiSB4u/eUzQzLDEGJjNobfFF0keggIfJV
NrJIWzzZfXUiuJBod/3CGsUsmjYZnKGnhSqP1u/gIjOA2hVnK4gnJflA8ozhTL1n
vHrlsffGOp91MF/U0ne3ijKKXN18/EhGYtjvXjZqfXvyDUO3eqVv2yvA2djdII60
71/v1Aw3eA8y8Ut4yDmwVwc72lYyyGuh1WqlLhZTXl987iE3XvO/PKJLXJRlvTNn
tvtsRoVv0QQrr+PQv0M/oy02Z/xNisERCI2IqpNtUE9txX8AM+JctOcOFrZc28hM
ARvNQ8jFdja/H1cy3GdYQUODZEYTqZVoAgXmnnfsc8oS5pIpptAel/jSeM73OJfr
/fwrup/5ahB2uSZ8p1DQz+r6qHRkpQwnIaKRRI+CTFSBaqTm+f/Ug6PWuQnTu5HW
EnwXBUxQTsyLDJzcpseKbtBNtB0X3cFP5oES6xkY1lZE1sLLmHk=
=c4TU
-----END PGP SIGNATURE-----

--zsplbynvjr6ai5yr--
