Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B29D39EF28
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 09:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhFHHC3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 03:02:29 -0400
Received: from comms.puri.sm ([159.203.221.185]:46090 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229923AbhFHHC3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Jun 2021 03:02:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 7B7C4DFE00;
        Tue,  8 Jun 2021 00:00:35 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fZ9T855StqfQ; Tue,  8 Jun 2021 00:00:34 -0700 (PDT)
Message-ID: <e9bfbc6421d2092b652dd2bb466aed54d72809b3.camel@puri.sm>
Subject: Re: [PATCH v4 2/5] dt-bindings: media: document SK Hynix Hi-846
 MIPI CSI-2 8M pixel sensor
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     krzysztof.kozlowski@canonical.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Date:   Tue, 08 Jun 2021 09:00:28 +0200
In-Reply-To: <YL6MaFAt2PaJq+2E@pendragon.ideasonboard.com>
References: <20210607105213.1211722-1-martin.kepplinger@puri.sm>
         <20210607105213.1211722-3-martin.kepplinger@puri.sm>
         <YL6MaFAt2PaJq+2E@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, dem 08.06.2021 um 00:15 +0300 schrieb Laurent Pinchart:
> Hi Martin
> 
> Thank you for the patch.
> 
> On Mon, Jun 07, 2021 at 12:52:10PM +0200, Martin Kepplinger wrote:
> > Document the bindings used for the SK Hynix Hi-846 CMOS camera
> > driver.
> > 
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > ---
> >  .../bindings/media/i2c/hynix,hi846.yaml       | 105
> > ++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > new file mode 100644
> > index 000000000000..19825392fb1f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/hynix,hi846.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SK Hynix Hi-846 1/4" 8M Pixel MIPI CSI-2 sensor
> > +
> > +maintainers:
> > +  - Martin Kepplinger <martin.kepplinger@puri.sm>
> > +
> > +description: |-
> > +  The Hi-846 is a raw image sensor with an MIPI CSI-2 image data
> > +  interface and CCI (I2C compatible) control bus. The output
> > format
> > +  is raw Bayer.
> > +
> > +properties:
> > +  compatible:
> > +    const: hynix,hi846
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Reference to the mclk clock.
> > +
> > +  reset-gpios:
> > +    description: Reference to the GPIO connected to the RESETB
> > pin. Active low.
> > +    maxItems: 1
> > +
> > +  shutdown-gpios:
> > +    description: Reference to the GPIO connected to the XSHUTDOWN
> > pin. Active low.
> > +    maxItems: 1
> > +
> > +  vddi-supply:
> 
> I think it's called vddio (seems to be a typo on page 8).
> 
> > +    description: Definition of the regulator used for the 1.8V or
> > 2.8V I/O power supply.
> 
> You could just say "... for the VDDIO supply". Same below. Up to you.
> 
> With the name fixed and the description optionally updated,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Please add my tag if you post a new version.

I'll rename the binding and add the tag. I haven't added your previous
tag because you found improvements based on the DS afterwards.

thanks again!
                              martin

