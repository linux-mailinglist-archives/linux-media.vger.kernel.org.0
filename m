Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37FE2634AD
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 13:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfGILBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 07:01:16 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49169 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfGILBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 07:01:15 -0400
X-Originating-IP: 126.163.157.105
Received: from uno.localdomain (softbank126163157105.bbtec.net [126.163.157.105])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9E57460007;
        Tue,  9 Jul 2019 11:01:09 +0000 (UTC)
Date:   Tue, 9 Jul 2019 13:02:24 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     sakari.ailus@linux.intel.com, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        graphics@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: add bindings for Toshiba
 TC358746
Message-ID: <20190709110224.5t5u3cjo32hdxamj@uno.localdomain>
References: <20190619152838.25079-1-m.felsch@pengutronix.de>
 <20190619152838.25079-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n2wq3z4hrph3varn"
Content-Disposition: inline
In-Reply-To: <20190619152838.25079-2-m.felsch@pengutronix.de>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--n2wq3z4hrph3varn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Marco,

On Wed, Jun 19, 2019 at 05:28:37PM +0200, Marco Felsch wrote:
> Add corresponding dt-bindings for the Toshiba tc358746 device and update
> the MAINTAINERS file too.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

With Rob's blessing, I'm glad I didn't take you off-road with my
comments on v1 :)

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
> Hi Rob,
>
> I droped your reviewed-by tag since there where several changes.
>
> Changes
> v2:
>  - use the Documentation/devicetree/bindings/media/ti,omap3isp.txt
>    formatting scheme
>  - Adapt introducing paragraph according Jacopo's comments
>  - drop the clock-names property
>  - drop the clock-lanes (csi-2) property
>  - adapt the property descriptions accroding Jacopo's comments
>  - use port@0 as input and port@1 as output port instead of mapping
>    port@0 to parallel and port@1 to csi-2 interface
>  - Adapt port/endpoint description according Jacopo's and Sakari's
>    comments
>  - Adapt the example
>  - squash v1 patch-3 and patch-1
>  - set status to Maintained
>
>  .../bindings/media/i2c/toshiba,tc358746.txt   | 95 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> new file mode 100644
> index 000000000000..e79b45ee050e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> @@ -0,0 +1,95 @@
> +Toshiba TC358746 Parallel to MIPI CSI2-TX or MIPI CSI2-RX to Parallel Bridge
> +============================================================================
> +
> +The Toshiba TC358746 converts a parallel into a MIPI CSI-2 stream. The direction
> +can be either parallel-in -> csi-out e.g. to connect a parallel camera to a
> +MIPI CSI-2 host or csi-in -> parallel-out e.g. to connect a parallel display to
> +a MIPI CSI-2 host. It's programmable trough I2C and SPI. The SPI interface is
> +only supported in parallel-in -> csi-out mode.
> +
> +Required properties
> +-------------------
> +
> +- compatible		: Shall be "toshiba,tc358746"
> +- reg			: Shall be <0x0e>
> +- clocks		: Phandle to the reference clock source
> +
> +Optional properties
> +-------------------
> +
> +- reset-gpios		: Phandle to the GPIO connected to the reset input pin
> +
> +Port nodes (required)
> +=====================
> +
> +The device node must contain two ports children nodes which should be grouped
> +within a 'ports' node. The first port describes the input connection, the second
> +one describes the output one. Each port shall contain one endpoint subnode that
> +connects to a remote device and specifies the bus type of the input and output
> +ports. Only one endpoint per port shall be present.
> +
> +More documentation on these bindings is available in [1].
> +
> +reg			: The interface:
> +			  0 - Input, either parallel or MIPI CSI-2
> +			  1 - Output, either parallel or MIPI CSI-2
> +
> +Endpoint nodes (required)
> +=========================
> +
> +Required properties
> +-------------------
> +
> +- bus-width		: Look at [1] for more information (Parallel endpoint)
> +- data-lanes		: Look at [1] for more information (CSI-2 endpoint)
> +- link-frequencies	: Array of frequencies the driver can choose to
> +			  full-fill the parallel timings calculation. Look at
> +			  [1] for more information (CSI-2 endpoint)
> +
> +Optional properties
> +-------------------
> +
> +- bus-type		: Look at [1] for more information
> +- clock-noncontinuous	: Look at [1] for more information (CSI-2 endpoint)
> +
> +[1] Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example
> +=======
> +
> +&i2c {
> +	csi-bridge@0e {
> +		reg = <0x0e>;
> +		compatible = "toshiba,tc358746";
> +		pinctrl-names = "default";
> +		clocks = <&clk_cam_ref>;
> +		reset-gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* Input */
> +			port@0 {
> +				reg = <0>;
> +
> +				tc358746_parallel_in: endpoint {
> +					bus-width = <8>;
> +					remote-endpoint = <&micron_parallel_out>;
> +				};
> +			};
> +
> +			/* Output */
> +			port@1 {
> +				reg = <1>;
> +
> +				tc358746_mipi2_out: endpoint {
> +					remote-endpoint = <&mipi_csi2_in>;
> +					data-lanes = <1 2>;
> +					clock-noncontinuous;
> +					link-frequencies = /bits/ 64 <216000000>;
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 57f496cff999..833b3c8fb301 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15955,6 +15955,13 @@ S:	Maintained
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>
> +TOSHIBA TC358746 DRIVER
> +M:	Marco Felsch <kernel@pengutronix.de>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/i2c/tc358746*
> +F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> +
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> --
> 2.20.1
>

--n2wq3z4hrph3varn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0kdEAACgkQcjQGjxah
VjyYpw/+L+jKiXBjvFnXk6yr37nxzWzDrk4dfkGl2uNSJUE9hxxFGOo7f4xmvzMM
sI9NZ/M5xK34Ul7QYW0tGWm/qoBuGxFDLG98yvqJ+Uf1VLUWn9IpcwceW4eKR3op
fXJiYR9IJZA3A87ZyCQHIEnzAGmdTi0laTVfeCGm+VqrV9/tk5dCudvaKUWX8j3g
yUO4kM0gVpuLwu+vw4nuXOX13qwayh4vt7EZ1okr9NNc1M6o4WNo5nuD91srzzeY
CFJ7llSnH/+i5UIr6tErTGYqmDTCxup29cBb7RJze328NDVRRPUbL+XSEIvDMPJ7
qwXMBOCyVcvS8M3xQmsc29LWFFfg70w9cpKH391cerZK5RYvgDjz//1mFYLpL1UE
jS87CSuG8Gd39txIc9scj/4JorlDKBjFKlznErXObSFKzSRFdtMBuDEF91CjOPfK
WX4hW5bALvi81OOjqgA8/HayKhKYn31VRkymh9rQWcJt8pdV6vfeG0AHdA8wo9ki
h51Y90i4FhqnIbaOZeAsBcSh/atgQU4/twyaF9WfXXxIXz55jfpJHy+3K1NkD3Um
egHk+b05JtrLMtPz/JgWrcVLvH4+4DJPjhTNHDx+Gbeq7Tf/oN/JrlnKPkNCqNiO
E9qrpbMhXcvEFLirxx7I9oVtOiwEyS8FjZFql003IN8ohoBznEA=
=/9pu
-----END PGP SIGNATURE-----

--n2wq3z4hrph3varn--
