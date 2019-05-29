Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B18A02D57C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 08:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbfE2G1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 02:27:42 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:46179 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfE2G1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 02:27:42 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 53C34200009;
        Wed, 29 May 2019 06:27:35 +0000 (UTC)
Date:   Wed, 29 May 2019 08:28:44 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
Message-ID: <20190529062844.bsdg7u7rgvkcmq6k@uno.localdomain>
References: <20190520201812.7937-1-marex@denx.de>
 <20190528114758.a4oac3zgdy7dkx7k@uno.localdomain>
 <6cd36678-2a2c-2a43-e245-4263c0e0f666@denx.de>
 <20190528151036.nxsh7tjyqrbpbrhy@uno.localdomain>
 <08c1a65e-dcc5-e1ae-053a-823931b9ec15@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a2t74hpkruw7u57r"
Content-Disposition: inline
In-Reply-To: <08c1a65e-dcc5-e1ae-053a-823931b9ec15@denx.de>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--a2t74hpkruw7u57r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Marek,

On Tue, May 28, 2019 at 07:49:57PM +0200, Marek Vasut wrote:
> On 5/28/19 5:10 PM, Jacopo Mondi wrote:
> [...]
>
> >>> From my understanding of the product page, both the ISL79987 and
> >>> ILS79988 devices support up to 4 analog inputs, and provide a CSI-2
> >>> output and a BT656 output respectively.
> >>>
> >>> What am I reading wrong ?
> >>
> >> ISL79987 is analog video to mipi csi2 ; I have this chip.
> >> ISL79988 is analog video to bt656 ; I don't have this chip.
> >>
> >
> > So please change the description to "Analog to MIPI CSI-2/BT565
> > decoder"
>
> Done
>

Great!

> >>> [1] https://www.renesas.com/eu/en/products/audio-video/video-decoders-encoders/video-decoders/device/ISL79987.html
> >>>
> >>>> +Required Properties:
> >>>> +- compatible: value should be "isil,isl79987"
> >
> > And here you might want to have 2 different compatibles for 79987 and
> > 79988.
>
> The 79988 is not supported yet, do we want to have it in the binding doc?
>

I got mislead by the isl7998x naming scheme you used...

I would say that's up to you, the two chips seems very similar,
and it might make sense to provide bindings that support both. At the
same time, as long as the here defined bindings does not prevent
future expansions to include the ISL79988, its support could be safely
post-poned. In that case please s/isl7998x/isl79987/ in this document
and do not mention BT565 in the description.

> [...]
>
> >>> I see from the example you only support one output port? How do you
> >>> model the input ones.
> >>
> >> I don't . Do we model analog inputs now somehow ?
> >
> > I really think so, please see:
> > Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> >
> > And as an example of a board device tree using connectors to model
> > analog input see how the cvbs input on Salvator-X is described:
> >
> > 	cvbs-in {
> > 		compatible = "composite-video-connector";
> > 		label = "CVBS IN";
> >
> > 		port {
> > 			cvbs_con: endpoint {
> > 				remote-endpoint = <&adv7482_ain7>;
> > 			};
> > 		};
> > 	};
> >
> > I think you should provide 4 input ports, where to connect input from
> > the analog connectors, and derive the number of enabled inputs from
> > the number of endpoints connected to an active remote.
>
> Deriving the number of active physical inputs from some existing binding
> makes sense.
>
> However unlike the adv7482, the isl79987 does not support remapping the
> physical inputs to ADCs in the chip. It does support some remapping of
> physical inputs to MIPI CSI2 channels, but that's probably not very useful.
>

I understand, but I will now use against you the argument you have
correctly pointed out here below that DT should describe hardware, and
the hardware has indeed 4 input ports..

> > Also, you might want to provide 2 output ports, one CSI-2 and one
> > BT565 and parse the right one depending on the compatible string.
>
> The chip only has one physical output port (either CSI2 or parallel) and
> DT should model the hardware, so I would expect there to be one output
> port per chip ?

You are right indeed, there should be one output port only, whose
content will be different between the two chips... Sorry for the
confusion.

Thanks
  j

>
> > I would also place the input ports last (from port@2 to port@5) so
> > that we make easier to support similar chips with more inputs (if
> > any).
> >
> > That said, I'm no expert of analog video, so others might have
> > different opinions :)
> >
> > Thanks
> >    j
> >
> >>
> >> --
> >> Best regards,
> >> Marek Vasut
>
>
> --
> Best regards,
> Marek Vasut

--a2t74hpkruw7u57r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzuJpwACgkQcjQGjxah
VjzIGRAAtsw3MhWO3BwmgmflQx2QaaVMuwMaFlcBfDwXPfAz3zLn2yDVNVIU3DEs
8osyvaJvejZGhIMzkDkKCMiGZ/uJftwuxQ3xAhj7HERkdTqcxpIzD60AUz/4S4My
VqZndDlOTxW7GVmZAYeOnc/CrgYDdjcY0cO7joGC+m51mgKTcAdbxuSFnLndKs4l
YWgjtNu9Zn1o7iT5Cz59x/SO8uhzcePxcT2UiClO8t01G8nRLjPWUNmIu/cjePeu
jPfHWUCeCp6PnEOlkYZY2k6AbZZsIhqpaceTuxCpGQYTKfMN3KDapQEHEI0I1s4w
Av4/TDh/5tSm9p1wNq0U8MrR+SbUXMFE+onzbBNHV/V/e5Q9UUGLOdvKSZg88Gxs
QVyMK2TfBG/Yhv2Knd2ulv6hci7wagaiooGKDOahmBuBa5ewf64TT/7R54M6Y6wT
cs0Mh5nSu7lUP9SPc2Orhwj3oP1j2LNqrRLRe9gCAb7WELplJmINqJWb3ugokODi
oBqjtFWduPYZWVg2RBsOI9spLMid1o4pIIxCbtjFngKseZlhUEKtDRqE5FNW6/1q
rVEQnlgV0k354vmyTDnFgzyp9VikjqXINLDD1ba5RA4S8VU1+VBK38sBGYX6xE80
2+qbkee+hNiGsciMU6cwrQAgZZgBncj0wzPHtPSPSgP+DEfgGJQ=
=CnbC
-----END PGP SIGNATURE-----

--a2t74hpkruw7u57r--
