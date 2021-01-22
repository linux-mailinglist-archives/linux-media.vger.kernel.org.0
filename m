Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF6C3001EA
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 12:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbhAVLsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 06:48:25 -0500
Received: from mga17.intel.com ([192.55.52.151]:27190 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727136AbhAVLqy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 06:46:54 -0500
IronPort-SDR: cJErxF5/EMC2vnGfC5Phsn00QGJZvXHz5cqQ9cGbt2d2/o78KjfC/lV7umt3hwt2c58MUDQmc2
 dXgwzs2Gkl6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="159210871"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="159210871"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 03:44:56 -0800
IronPort-SDR: J3y7zTLgpFbaDviXa8dk3nMWsL+Fn8NPNjxh2QW0TPOPXZ4ARTv73fqatRp2vnSiQpIUr7GN+Q
 J6df8arTpqmA==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="356996021"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 03:44:54 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id EEFFE209EB; Fri, 22 Jan 2021 11:18:22 +0200 (EET)
Date:   Fri, 22 Jan 2021 11:18:22 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20210122091822.GB27155@paasikivi.fi.intel.com>
References: <20201118202715.6692-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118202715.6692-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krysztof,

On Wed, Nov 18, 2020 at 09:27:12PM +0100, Krzysztof Kozlowski wrote:
> Add bindings for the IMX258 camera sensor.  The bindings, just like the
> driver, are quite limited, e.g. do not support regulator supplies.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes since v4:
> 1. Add clock-lanes,
> 2. Add Rob's review,
> 3. Add one more example and extend existing one,
> 4. Add common clock properties (assigned-*).
> 
> Changes since v3:
> 1. Document also two lane setup.
> 
> Changes since v2:
> 1. Remove clock-frequency, add reset GPIOs, add supplies.
> 2. Use additionalProperties.
> 
> Changes since v1:
> 1. None
> ---
>  .../devicetree/bindings/media/i2c/imx258.yaml | 140 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> new file mode 100644
> index 000000000000..4a3471fb88a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +description: |-
> +  IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
> +  type stacked image sensor with a square pixel array of size 4208 x 3120. It
> +  is programmable through I2C interface.  Image data is sent through MIPI
> +  CSI-2.
> +
> +properties:
> +  compatible:
> +    const: sony,imx258
> +
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true
> +
> +  clocks:
> +    description:
> +      Clock frequency from 6 to 27 MHz.
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the XCLR pin, if any.
> +
> +  vana-supply:
> +    description:
> +      Analog voltage (VANA) supply, 2.7 V
> +
> +  vdig-supply:
> +    description:
> +      Digital I/O voltage (VDIG) supply, 1.2 V
> +
> +  vif-supply:
> +    description:
> +      Interface voltage (VIF) supply, 1.8 V
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          clock-lanes:
> +            const: 0

This is redundant. Please remove, same for the examples. Can be a separate
patch, too.

With this change the set seems good to me.

-- 
Sakari Ailus
