Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB7422C9AB
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 17:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfE1PJc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 11:09:32 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:40231 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfE1PJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 11:09:32 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0B1C6240019;
        Tue, 28 May 2019 15:09:27 +0000 (UTC)
Date:   Tue, 28 May 2019 17:10:36 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
Message-ID: <20190528151036.nxsh7tjyqrbpbrhy@uno.localdomain>
References: <20190520201812.7937-1-marex@denx.de>
 <20190528114758.a4oac3zgdy7dkx7k@uno.localdomain>
 <6cd36678-2a2c-2a43-e245-4263c0e0f666@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t4ytnne475xsmu64"
Content-Disposition: inline
In-Reply-To: <6cd36678-2a2c-2a43-e245-4263c0e0f666@denx.de>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--t4ytnne475xsmu64
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Marek,

On Tue, May 28, 2019 at 04:36:27PM +0200, Marek Vasut wrote:
> On 5/28/19 1:47 PM, Jacopo Mondi wrote:
> > Hi Marek,
> >    thanks for the patch
>
> Hi,
>
> > On Mon, May 20, 2019 at 10:18:11PM +0200, Marek Vasut wrote:
> >> Add bindings for the Intersil ISL7998x BT656-to-MIPI-CSI2 decoder.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: devicetree@vger.kernel.org
> >> To: linux-media@vger.kernel.org
> >> ---
> >>  .../bindings/media/i2c/isl7998x.txt           | 37 +++++++++++++++++++
> >>  1 file changed, 37 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/media/i2c/isl7998x.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/isl7998x.txt b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
> >> new file mode 100644
> >> index 000000000000..c21703983360
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
> >> @@ -0,0 +1,37 @@
> >> +Intersil ISL7998x BT656-to-MIPI-CSI2 decoder
> >> +
> >> +The Intersil ISL7998x is a BT656-to-MIPI-CSI decoder which, capable of
> >> +receiving up to four analog stream and multiplexing them into up to four
> >> +MIPI CSI2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
> >> +
> >
> > The documentation is not public, so I can only read what's reported on
> > the website and the short public datasheet at [1]
>
> Right
>
> > From my understanding of the product page, both the ISL79987 and
> > ILS79988 devices support up to 4 analog inputs, and provide a CSI-2
> > output and a BT656 output respectively.
> >
> > What am I reading wrong ?
>
> ISL79987 is analog video to mipi csi2 ; I have this chip.
> ISL79988 is analog video to bt656 ; I don't have this chip.
>

So please change the description to "Analog to MIPI CSI-2/BT565
decoder"

> > [1] https://www.renesas.com/eu/en/products/audio-video/video-decoders-encoders/video-decoders/device/ISL79987.html
> >
> >> +Required Properties:
> >> +- compatible: value should be "isil,isl79987"

And here you might want to have 2 different compatibles for 79987 and
79988.


> >> +- pd-gpios: a GPIO spec for the Power Down pin (active high)
> >> +
> >> +Option Properties:
> >> +- isil,num-inputs: Number of connected inputs (1, 2 or 4)
> >
> > Can't you derive this from the number of connected input endpoints
> > instead of providing a custom property?
>
> Input endpoints from where ?
>

See below :)

> >> +
> >> +For further reading on port node refer to
> >> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> >> +
> >
> > I think a description of the supported ports and their intended
> > usages is required here. You have up to 4 inputs and 1 output port,
> > how do you expect them to be numbered? is port@4 the last input or the
> > output one?
>
> The only port is the MIPI CSI2 , see the example below.
>
> >> +Example:
> >> +
> >> +	i2c_master {
> >> +		isl7998x_mipi@44 {
> >> +			compatible = "isil,isl79987";
> >> +			reg = <0x44>;
> >> +			isil,num-inputs = <4>;
> >> +			pinctrl-names = "default";
> >> +			pinctrl-0 = <&pinctrl_videoadc>;
> >> +			pd-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> >> +			status = "okay";
> >> +
> >> +			port {
> >> +				isl79987_to_mipi_csi2: endpoint {
> >> +					remote-endpoint = <&mipi_csi2_in>;
> >> +					clock-lanes = <0>;
> >> +					data-lanes = <1 2>;
> >> +				};
> >
> > I see from the example you only support one output port? How do you
> > model the input ones.
>
> I don't . Do we model analog inputs now somehow ?

I really think so, please see:
Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt

And as an example of a board device tree using connectors to model
analog input see how the cvbs input on Salvator-X is described:

	cvbs-in {
		compatible = "composite-video-connector";
		label = "CVBS IN";

		port {
			cvbs_con: endpoint {
				remote-endpoint = <&adv7482_ain7>;
			};
		};
	};

I think you should provide 4 input ports, where to connect input from
the analog connectors, and derive the number of enabled inputs from
the number of endpoints connected to an active remote.

Also, you might want to provide 2 output ports, one CSI-2 and one
BT565 and parse the right one depending on the compatible string.

I would also place the input ports last (from port@2 to port@5) so
that we make easier to support similar chips with more inputs (if
any).

That said, I'm no expert of analog video, so others might have
different opinions :)

Thanks
   j

>
> --
> Best regards,
> Marek Vasut

--t4ytnne475xsmu64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlztT2wACgkQcjQGjxah
VjyO6xAAv2Hfw2FS7gsQfKbf4Mpbw3BJpVmqLIS5X+UwgSeC3Pta09Igdf7bIQJz
LqMZNN7amttZZ3mrmogOyEyd+ZFb1aPnN7Hd739fjcUimr/uSfG8AzTaXB9hNm1V
2IESinF2oBLmjte2MbenSdbgxU8pYoCY7VHYBYVEiwleZO8C4Qn7t3Jm04NEXzRi
kgHEqWk3FdxmqbGimwN6DCZF2+LYKPqJUv3aNwmfN95ctYWJgLW+nFV4sCur0qL0
vCi6XEsDa6FsagHSuj7v9QLLS7FMe2G9uq+IE3vnVcFO7iXDz4VwfEBJPzPXM4HM
mPBtTKH5kLDNJAjWekvVv5S1RyWUWeth4YiPDkRzUP8p2lIF4wipdVovW+GKUaV8
jSUU/B9C8S8D/d1CuOahdIdgOvjhQprWP9SZdRJ/pP3ZvS0Ym+B3yhoMK9bx6nBO
zn4VZ65hjzE7WUxysRAhsQCwZlQ9UaCBpQcy90AYc1Swei60uqZtlw22Z3De44GR
SVm2kAvfgnBiBaP03FjjNvgUS0U+1hZ8UYmzXWVWMSQDLVTaapCvKvvl10zZThWi
xI+qdlWtWB+FDn8hvQ17oNK66u877j3uD9g1WkohJ4FpDOKr/9X00X/+96eqExer
KAhvnaRF3CkhLBCcDlG3JUztSFP4ZiWDBK2nzCA8s3chdhPXQAk=
=AP/a
-----END PGP SIGNATURE-----

--t4ytnne475xsmu64--
