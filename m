Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B533D2FAD93
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 23:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732477AbhARWxL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 17:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731342AbhARWxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 17:53:08 -0500
X-Greylist: delayed 643 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 18 Jan 2021 14:52:27 PST
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A913C061573;
        Mon, 18 Jan 2021 14:52:27 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dbd4xkyj7wcfw2k22jcct-3.rev.dnainternet.fi [IPv6:2001:14ba:8f1:3400:fb90:892b:22d6:3885])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 2288E1B00257;
        Tue, 19 Jan 2021 00:41:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1611009701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KRCka0377VlEadOtTVjlwLcx8FKWy9F/jF3cR941l3g=;
        b=hsxrsBz/iBluWcTLJdXvbBKobPYNr3ZDMPcspkl4r1W/9hkyAnIcO6CuFVgxOINSa1cTwD
        9hLH4F01RMsm0n3ESoZ9NHXs16tzQOCaoIymF/oWlaXXgQ/tDfUOQSz8x5Etgv2daYoSxm
        gBNQ3+yE0nerLAu0udljNrSNtWSartPakb3LcudaA/8WMTGAFGYszKZFqhvYT93ouAAVJN
        1KQFTEnjPdJYtjW+a8RrxDqfjNo8djSCY8Ck67i8dHMOKflr1TWVEWmvEIi498Qd6fko0G
        gQSwa/bO+0YN4ZGRuvZ25YuWa8DPmTqhIxxou5eBzrMch9RM6TVQauKtTL3rwg==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AFF57634C89;
        Tue, 19 Jan 2021 00:40:28 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l1dCG-000457-HM; Tue, 19 Jan 2021 00:40:28 +0200
Date:   Tue, 19 Jan 2021 00:40:28 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH v4 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS
 sensor binding
Message-ID: <20210118223636.GA3@valkosipuli.retiisi.org.uk>
References: <20210113182934.444727-1-angelogioacchino.delregno@somainline.org>
 <20210113182934.444727-3-angelogioacchino.delregno@somainline.org>
 <20210116234404.GX850@valkosipuli.retiisi.org.uk>
 <b681819b-1fc9-a6ea-bb20-f234dcdb3cb7@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b681819b-1fc9-a6ea-bb20-f234dcdb3cb7@somainline.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1611009701; a=rsa-sha256;
        cv=none;
        b=pGSA4VMAZLteT3gHGeAJjZeKGOp2N8XSo7qb0O4zsOQbPrcJLqMQfIF4Ub665mgnA5f9RI
        XlzSOgnU+1Vgk3FTX+KC6bRTjssIn/FN5PJn3NBJYHi4xknWryt3MbQa9qXEi/qNoXBuuw
        mv+u8GGVPcWFHPneBXCwT/GC3dZWpDjNh6pCkstlRdtasvP5devha+A1q2Cs3quoB8fCJG
        /gw26AP2eY3zzSV8AjSAJ3AF9AKS5dV4k4pOl2H+9jscJRao59aP+TFeqXlHGVSbvitBP4
        73vDr83UYiN19A15vfGAXjnAX6aYALwruneWYSJKpTLmlvGKm+aHPBlcFwZumg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1611009701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KRCka0377VlEadOtTVjlwLcx8FKWy9F/jF3cR941l3g=;
        b=onZEfUvFCHdJs0wFKSKN6YG1kjxv0hN+Ui+JiVq+k9s+dbTvAQq33P6HsjhfGBMsPicRol
        yb1H5Oz6CdUKWf75pQSkAHMNcD16wPNGcJ2H1tbI2povICjn0G24sLNqhKw5FrkGhjnVUq
        QQUwtPudxThnnHmuatZDNrAMFpD6y3caUALDvtYXjncbpfCBt//qTdN/XE/DZQU26qWPxr
        j2W0bIhPOmo+L1o3w2biTsBGuOLCuYxXWSoBhusIJYbH5LUg/QXaEKjxs7wOxB1dbL04wR
        srQEtsALxe0sTxTPexJGVO2kPkQC43DCYkxwUdwWbx8+uMIppA0mdEvPqoZwYA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jan 17, 2021 at 06:51:04PM +0100, AngeloGioacchino Del Regno wrote:
> Il 17/01/21 00:44, Sakari Ailus ha scritto:
> > Hi AngeloGioacchino,
> > 
> > On Wed, Jan 13, 2021 at 07:29:34PM +0100, AngeloGioacchino Del Regno wrote:
> > > Add YAML device tree binding for IMX300 CMOS image sensor, and
> > > the relevant MAINTAINERS entries.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > ---
> > >   .../bindings/media/i2c/sony,imx300.yaml       | 112 ++++++++++++++++++
> > >   MAINTAINERS                                   |   7 ++
> > >   2 files changed, 119 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > > new file mode 100644
> > > index 000000000000..4fa767feea80
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > > @@ -0,0 +1,112 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/sony,imx300.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony 1/2.3-Inch 25Mpixel Stacked CMOS Digital Image Sensor
> > > +
> > > +maintainers:
> > > +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > +
> > > +description: |-
> > > +  The Sony IMX300 is a 1/2.3-inch Stacked CMOS (Exmor-RS) digital image
> > > +  sensor with a pixel size of 1.08um and an active array size of
> > > +  5948H x 4140V. It is programmable through I2C interface at address 0x10.
> > > +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> > > +  4 data lanes.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sony,imx300
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > 
> > Please add assigned clock related properties; see
> > Documentation/driver-api/media/camera-sensor.rst .
> > 
> Will do!
> 
> > > +
> > > +  vdig-supply:
> > > +    description:
> > > +      Digital I/O voltage supply, 1.15-1.20 volts
> > > +
> > > +  vana-supply:
> > > +    description:
> > > +      Analog voltage supply, 2.2 volts
> > > +
> > > +  vddl-supply:
> > > +    description:
> > > +      Digital core voltage supply, 1.8 volts
> > > +
> > > +  reset-gpios:
> > > +    description: |-
> > > +      Reference to the GPIO connected to the xclr pin, if any.
> > > +      Must be released (set high) after all supplies are applied.
> > > +
> > > +  # See ../video-interfaces.txt for more details
> > > +  port:
> > > +    type: object
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +
> > > +        properties:
> > > +          data-lanes:
> > > +            description: |-
> > > +              The driver only supports four-lane operation.
> > 
> > This can be removed as bindings describe hardware, not driver operation.
> > 
> Ack.
> 
> > > +            items:
> > > +              - const: 0
> > > +              - const: 1
> > > +              - const: 2
> > > +              - const: 3
> > 
> > Two lanes here, too?
> > 
> 
> The driver only supports four-lane operation.
> I am 100% sure that this sensor can also work with two lanes, but it needs
> special configuration which I'm not able to produce, nor test.
> 
> As you may imagine (and as you can read in the driver itself), all of this
> was reverse-engineering work, as Sony has never released any datasheet for
> this sensor - and I have a hunch - they never will (but that's another
> story).

That's all fine. The bindings describe the hardware, not the driver's
capabilities.

> 
> > > +
> > > +          clock-noncontinuous: true
> > > +
> > > +          link-frequencies:
> > > +            $ref: /schemas/types.yaml#/definitions/uint64-array
> > > +            description:
> > > +              Allowed data bus frequencies. The driver currently needs
> > > +              to switch between 780000000 and 480000000 Hz in order to
> > > +              guarantee functionality of all modes.
> > 
> > You can omit this description, too.
> > 
> 
> The intention here was to be clear and provide as much information as I
> could gather during the very time-consuming reverse engineering process that
> took place in the making of this driver.
> 
> But okay, I will remove this.

Again, this is about the hardware, not the driver. That information is also
part of the driver.

> 
> > > +
> > > +        required:
> > > +          - data-lanes
> > > +          - link-frequencies
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - vana-supply
> > > +  - vdig-supply
> > > +  - vddl-supply
> > 
> > Are the regulators really required? I'm not quite sure about the
> > established practices; still the common case is that one or two of these
> > are hard-wired.
> > 
> 
> On all the Sony phones that I have (....many), with MSM8956, MSM8996,
> SDM630, equipped with the IMX300 camera assy, none of these three are
> hard-wired: sometimes they're wired to the LDOs of the PMIC, sometimes
> they're wired to fixed LDOs, enabled through GPIOs (fixed-regulator binding
> in this case).
> 
> So.. yeah, they're really required.

As noted, that depends on the board. You just happen to have some where
they are not hard-wired.

> 
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c0 {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        imx300: sensor@10 {
> > > +            compatible = "sony,imx300";
> > > +            reg = <0x10>;
> > > +            clocks = <&imx300_xclk>;
> > > +            vana-supply = <&imx300_vana>;   /* 2.2v */
> > > +            vdig-supply = <&imx300_vdig>;   /* 1.2v */
> > > +            vddl-supply = <&imx300_vddl>;   /* 1.8v */
> > > +
> > > +            port {
> > > +                imx300_0: endpoint {
> > > +                    remote-endpoint = <&csi1_ep>;
> > > +                    data-lanes = <0 1 2 3>;
> > > +                    clock-noncontinuous;
> > > +                    link-frequencies = /bits/ 64 <780000000 480000000>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index ad9abb42f852..5e0f08f48d48 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16633,6 +16633,13 @@ T:	git git://linuxtv.org/media_tree.git
> > >   F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
> > >   F:	drivers/media/i2c/imx290.c
> > > +SONY IMX300 SENSOR DRIVER
> > > +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > +L:	linux-media@vger.kernel.org
> > 
> > Please also add the git tree.
> > 
> > Ideally also the MAINTAINERS change comes with the first patch adding the
> > files, which should be the DT bindings. I.e. just reverse the order of the
> > patches.
> > 
> 
> I haven't added it because last time I did that I got reviews saying that if
> I'm not the owner of the git tree I shall not put it in.
> Though, if that's a requirement for media, then I didn't know that...

The documentation in MAINTAINERS doesn't say that at least.

I think it'd be useful to have it.

> 
> > > +S:	Maintained
> > > +F:	Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> > > +F:	drivers/media/i2c/imx300.c
> > > +
> > >   SONY IMX319 SENSOR DRIVER
> > >   M:	Bingbu Cao <bingbu.cao@intel.com>
> > >   L:	linux-media@vger.kernel.org
> > 
> 
> Thank you for your review!

You're welcome!

-- 
Sakari Ailus
