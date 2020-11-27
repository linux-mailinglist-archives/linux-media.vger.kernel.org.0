Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE19F2C673F
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 14:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbgK0Nw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 08:52:26 -0500
Received: from mga01.intel.com ([192.55.52.88]:2745 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730560AbgK0Nw0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 08:52:26 -0500
IronPort-SDR: f4d2SPy+RT8IH0cp+BNYkTQUjyG4FyPq2yGcCNRnqpuT9796qlPQ2pbuol5QzF7p2VkRgGdAN8
 43qMPclX6mEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="190556420"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; 
   d="scan'208";a="190556420"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 05:52:25 -0800
IronPort-SDR: RUTD8HamWdwJCTJ9M1u6oAIaUbmrpBP3TCmWqbwcg/vcX3YHLWRq3zCFBh5rbkhsREKE7oM0Nr
 gTKRnh1BMC2g==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; 
   d="scan'208";a="536056915"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 05:52:22 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 67DB7205FC; Fri, 27 Nov 2020 15:52:20 +0200 (EET)
Date:   Fri, 27 Nov 2020 15:52:20 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add OV8865 bindings
 documentation
Message-ID: <20201127135220.GR3940@paasikivi.fi.intel.com>
References: <20201113170344.2252234-1-paul.kocialkowski@bootlin.com>
 <20201113170344.2252234-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113170344.2252234-2-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Nov 13, 2020 at 06:03:42PM +0100, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the OV8865
> image sensor.
> 
> Co-developed-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/media/i2c/ovti,ov8865.yaml       | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> new file mode 100644
> index 000000000000..47af90d6ebea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8865.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV8865 Image Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: ovti,ov8865
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: EXTCLK Clock
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply (internal AVDD is used if missing)
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Power Down Pin GPIO Control (active low)
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active low)
> +
> +  port:
> +    type: object
> +    description: MIPI CSI-2 transmitter port
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          remote-endpoint: true
> +
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +
> +        required:
> +          - bus-type
> +          - data-lanes
> +          - remote-endpoint

link-frequencies seems to be still missing here (same with the example).

-- 
Sakari Ailus
