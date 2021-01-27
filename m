Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E58A305C13
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237976AbhA0Mv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:51:27 -0500
Received: from mga12.intel.com ([192.55.52.136]:38290 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237427AbhA0MuI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:50:08 -0500
IronPort-SDR: vw0RIOsHqg6JcUHkXdi0baCTrpnmU59G3ZZCMnfdALd08DpwKfSgHgZ+2gfuA42RkDKs3rKLJ5
 NjrYkq6qkbdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="159233443"
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="159233443"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2021 04:45:58 -0800
IronPort-SDR: 3RTm0iVFoqt3t45cPTzsoQg6veo9tSAFLaRJ69aMN/XC/h1CbnKmPYYR6baItQQ1laD7O8S4JR
 sN+KUxDGJGfQ==
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="353797488"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2021 04:45:55 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 600452067A; Wed, 27 Jan 2021 14:45:53 +0200 (EET)
Date:   Wed, 27 Jan 2021 14:45:53 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20210127124553.GB32460@paasikivi.fi.intel.com>
References: <20201118202715.6692-1-krzk@kernel.org>
 <20210122091822.GB27155@paasikivi.fi.intel.com>
 <20210127122612.evk5sooijid3dmzd@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127122612.evk5sooijid3dmzd@kozik-lap>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 27, 2021 at 01:26:12PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 22, 2021 at 11:18:22AM +0200, Sakari Ailus wrote:
> > Hi Krysztof,
> > 
> > On Wed, Nov 18, 2020 at 09:27:12PM +0100, Krzysztof Kozlowski wrote:
> > > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > > driver, are quite limited, e.g. do not support regulator supplies.
> > > 
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > 
> > > ---
> > > 
> > > Changes since v4:
> > > 1. Add clock-lanes,
> > > 2. Add Rob's review,
> > > 3. Add one more example and extend existing one,
> > > 4. Add common clock properties (assigned-*).
> > > 
> > > Changes since v3:
> > > 1. Document also two lane setup.
> > > 
> > > Changes since v2:
> > > 1. Remove clock-frequency, add reset GPIOs, add supplies.
> > > 2. Use additionalProperties.
> > > 
> > > Changes since v1:
> > > 1. None
> > > ---
> > >  .../devicetree/bindings/media/i2c/imx258.yaml | 140 ++++++++++++++++++
> > >  MAINTAINERS                                   |   1 +
> > >  2 files changed, 141 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > > new file mode 100644
> > > index 000000000000..4a3471fb88a1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> > > @@ -0,0 +1,140 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
> > > +
> > > +maintainers:
> > > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > > +
> > > +description: |-
> > > +  IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
> > > +  type stacked image sensor with a square pixel array of size 4208 x 3120. It
> > > +  is programmable through I2C interface.  Image data is sent through MIPI
> > > +  CSI-2.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sony,imx258
> > > +
> > > +  assigned-clocks: true
> > > +  assigned-clock-parents: true
> > > +  assigned-clock-rates: true
> > > +
> > > +  clocks:
> > > +    description:
> > > +      Clock frequency from 6 to 27 MHz.
> > > +    maxItems: 1
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    description: |-
> > > +      Reference to the GPIO connected to the XCLR pin, if any.
> > > +
> > > +  vana-supply:
> > > +    description:
> > > +      Analog voltage (VANA) supply, 2.7 V
> > > +
> > > +  vdig-supply:
> > > +    description:
> > > +      Digital I/O voltage (VDIG) supply, 1.2 V
> > > +
> > > +  vif-supply:
> > > +    description:
> > > +      Interface voltage (VIF) supply, 1.8 V
> > > +
> > > +  # See ../video-interfaces.txt for more details
> > > +  port:
> > > +    type: object
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +        properties:
> > > +          clock-lanes:
> > > +            const: 0
> > 
> > This is redundant. Please remove, same for the examples. Can be a separate
> > patch, too.
> 
> Before I remove too much - you mean "clock-lanes" is redundant or entire
> set of properties in "port" node?

Just clock-lanes. The rest are just as they should be IMO.

-- 
Sakari Ailus
