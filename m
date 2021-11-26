Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DCC45EB99
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 11:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377273AbhKZKdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 05:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376880AbhKZKbV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 05:31:21 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C8DC0613F9;
        Fri, 26 Nov 2021 02:18:35 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id AFAF51B00214;
        Fri, 26 Nov 2021 12:18:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1637921907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IyiXUFPSy6yxuPHI/3iKRSZbPee/YrvF0E/9JnqoT5c=;
        b=WotP1c8iWuzbJkpuTp38PeNsGf+jmgM0G1jy9PNcZ7Bes0CqH2ym0eSMJUkBfn4JGjUT51
        debjKRHalC7tmV5xc03Sj+3rrYxvSFLOc7a44fJeaaGaxeEVQKUnPTo2/zxKag/PPYligg
        nlioHALl1N2P4FWhB1Je1OWr4L2MCwS9se24Slp5QOSq00+0eAh+UgGeY61gADwIf9/lUW
        eYUT/1UlSkhr+Z9Vd4oPgK7wv34+IEGYh9l6s5wsDioHtLVWpH4/VYd2vN6c/hILgDVbFH
        8tzzAgy7nO3HOcXLHOu64HT6UD8GWR/+98Ohnd/TlwMFt1gyMYcNZpawzGBdLg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 373FF634C90;
        Fri, 26 Nov 2021 12:18:27 +0200 (EET)
Date:   Fri, 26 Nov 2021 12:18:27 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kernel@puri.sm,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        shawnx.tu@intel.com
Subject: Re: [PATCH v9 2/4] dt-bindings: media: document SK Hynix Hi-846 MIPI
 CSI-2 8M pixel sensor
Message-ID: <YaC0cxmXB8kDcDAI@valkosipuli.retiisi.eu>
References: <20210906102837.2190387-1-martin.kepplinger@puri.sm>
 <20210906102837.2190387-3-martin.kepplinger@puri.sm>
 <CAMuHMdVVNhLa2p-ywmpcEj-sw+NyRNp2z9jsVqsXEDrKphivCQ@mail.gmail.com>
 <d5e0fe8f8a5445c9c2d2b90fcf454829daf393e8.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5e0fe8f8a5445c9c2d2b90fcf454829daf393e8.camel@puri.sm>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1637921907; a=rsa-sha256;
        cv=none;
        b=IHSnHJ6qwcGci1DLoApL/20SqrSxK/ZcTRmW7fNmnwk7sGweRESSTz7FxumrvX8e+kIJiI
        Lu2DksvZAD9i+aUUuNc6GKTp7IIH5PcD1Uq0aqgCCewZIEpWNB3SS5Zeka2TcGwevXGali
        dwO3MDugoflfgVjkVh0UiIFZMaSt7/jss2NeeCgcYWGDjlUgBORJwQUIazn8pzxScOW39x
        oNs3vkrFbJF3T58lxqfgCIMb+gBzr9B2mjvkLRrG9uq+a3ZSOBwJF/tiXeIw8bH172qVqY
        pALW2cpFV3luiAFI3ap1dIp4sOGEawyWTvLyZJNU2plHHKQxV8S5DNJwQwTWYQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1637921907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IyiXUFPSy6yxuPHI/3iKRSZbPee/YrvF0E/9JnqoT5c=;
        b=sN//k+z+iexll4C72DocpAQSKC2Slg1oYLX4hDxwn39Zw70OW6lq4W9l467wBvmAYr6W81
        JhrYIU3m6vhiHMAIw0eG0crlwj1Nwxtrfa4B4Jc5RY4HnLLZJAsQsEqwjZ+UAQdVfVwTqU
        hgE6bgFBpkfNY0mzey/3onmSPTqIpLe1jgGdhVu5vM6zF4UneLJXctopjYzzF5rDkAmuPF
        h6J7D0Mk8Z9eU6Z5lBZUmzy/m16ziZLIXqL9kNU+mmsZIBbKpbBLjMHRr8xV/z27jnNKo6
        RqgnwJX1BGpzSE7oNcuq3QIzch4WwOJZaBZMomIrxIHIYV3pArskPPFegoQ5bA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Fri, Nov 26, 2021 at 11:02:31AM +0100, Martin Kepplinger wrote:
> Am Donnerstag, dem 25.11.2021 um 12:15 +0100 schrieb Geert
> Uytterhoeven:
> > On Mon, Sep 6, 2021 at 12:30 PM Martin Kepplinger
> > <martin.kepplinger@puri.sm> wrote:
> > > Document the bindings used for the SK Hynix Hi-846 CMOS camera
> > > driver.
> > > 
> > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../bindings/media/i2c/hynix,hi846.yaml       | 120
> > > ++++++++++++++++++
> > >  1 file changed, 120 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > new file mode 100644
> > > index 000000000000..85a8877c2f38
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > > @@ -0,0 +1,120 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
> > > +
> > > +maintainers:
> > > +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> > > +
> > > +description: |-
> > > +  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
> > > +  interface and CCI (I2C compatible) control bus. The output
> > > format
> > > +  is raw Bayer.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: hynix,hi846
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Reference to the mclk clock.
> > > +
> > > +  assigned-clocks:
> > > +    maxItems: 1
> > > +
> > > +  assigned-clock-rates:
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    description: Reference to the GPIO connected to the RESETB
> > > pin. Active low.
> > > +    maxItems: 1
> > > +
> > > +  shutdown-gpios:
> > > +    description: Reference to the GPIO connected to the XSHUTDOWN
> > > pin. Active low.
> > > +    maxItems: 1
> > > +
> > > +  vddio-supply:
> > > +    description: Definition of the regulator used for the VDDIO
> > > power supply.
> > > +
> > > +  vdda-supply:
> > > +    description: Definition of the regulator used for the VDDA
> > > power supply.
> > > +
> > > +  vddd-supply:
> > > +    description: Definition of the regulator used for the VDDD
> > > power supply.
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/properties/port
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          data-lanes:
> > > +            oneOf:
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +                  - const: 3
> > > +                  - const: 4
> > > +              - items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +
> > > +        required:
> > > +          - data-lanes
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - assigned-clocks
> > > +  - assigned-clock-rates
> > > +  - vddio-supply
> > > +  - vdda-supply
> > > +  - vddd-supply
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        hi846: camera@20 {
> > > +            compatible = "hynix,hi846";
> > > +            reg = <0x20>;
> > > +            pinctrl-names = "default";
> > > +            pinctrl-0 = <&pinctrl_csi1>;
> > > +            clocks = <&clk 0>;
> > > +            assigned-clocks = <&clk 0>;
> > > +            assigned-clock-rates = <25000000>;
> > > +            vdda-supply = <&reg_camera_vdda>;
> > > +            vddd-supply = <&reg_camera_vddd>;
> > > +            vddio-supply = <&reg_camera_vddio>;
> > > +            reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
> > > +            shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> > > +
> > > +            port {
> > > +                camera_out: endpoint {
> > > +                    remote-endpoint = <&csi1_ep1>;
> > > +                    link-frequencies = /bits/ 64
> > > +                        <80000000 200000000>;
> > > +                    data-lanes = <1 2>;
> > 
> > "make dt_binding_check":
> > 
> >    
> > Documentation/devicetree/bindings/media/i2c/hynix,hi846.example.dt.ya
> > ml:
> > camera@20: port:endpoint: Unevaluated properties are not allowed
> > ('link-frequencies', 'data-lanes' were unexpected)
> >     From schema:
> > Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > 
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > 
> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> 
> 
> thanks a lot Geert, but I can't reproduce this on linux-next. Which
> tree did you run it against?
> 
> What I *do* see is the following during dtbs_check, so I guess I could
> remove "orientation" and "rotation" from the example, which would be
> kind of sad because these useful properties are not yet too wide know
> anyway in the media device driver world...
> 
> /home/martin/dev/purism-forks/linux-
> next/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml:
> camera-front@20: 'orientation', 'rotation' do not match any of the
> regexes: 'pinctrl-[0-9]+'
> 	From schema: /home/martin/dev/purism-forks/linux-
> next/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> 
> 
> if you can be more speicific I'll definitely try to reproduce again
> though.

link-frequencies is present in the example (as it needs to be) but missing
from required properties. I don't know why there's a complaint about
data-lanes though.

-- 
Regards,

Sakari Ailus
