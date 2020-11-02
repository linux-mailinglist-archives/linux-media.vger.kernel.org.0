Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A0E2A2D9C
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 16:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgKBPFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 10:05:54 -0500
Received: from mga11.intel.com ([192.55.52.93]:40040 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726242AbgKBPFx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 10:05:53 -0500
IronPort-SDR: rXY5eGxnrlp2FWas2lfgnJf3m6PPLCYMO3brzDgPHQyUpN4ekTxblLOUz531Uz69VymUdMTf7F
 Qxt4OsCMYInw==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="165391995"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="165391995"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 07:05:52 -0800
IronPort-SDR: Rk8KtKoJ0WVtwG02bBKp1DCA0eUAmt8IjohOY2uUVmJxltiamIaBUqjCxBJtRh0gJOGywbmexx
 B7HKWx+fVHeA==
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="426011235"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 07:05:49 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8F638208F7; Mon,  2 Nov 2020 17:05:47 +0200 (EET)
Date:   Mon, 2 Nov 2020 17:05:47 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
Message-ID: <20201102150547.GY26150@paasikivi.fi.intel.com>
References: <20201019170247.92002-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019170247.92002-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krysztof,

On Mon, Oct 19, 2020 at 07:02:44PM +0200, Krzysztof Kozlowski wrote:
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

I discussed the matter of using assigned clocks with Rob some time ago and
the conclusion of that was that the sensor driver could use the default
frequency (set using assigned-clock-rates) instead of the explicit
frequency in DT. There are use cases (sharing the clock signal between two
sensors, but different frequencies) that would be affected by this but I
don't think we have any in mainline so I guess this approach works for now
without additional changes. If someone needs those use cases, it's likely
DT clock binding semantings and clock framework changes will be needed.
That'll be another discussion if it ever happens.

-- 
Regards,

Sakari Ailus
