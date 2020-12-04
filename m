Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F6F2CECC4
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 12:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbgLDLJc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 06:09:32 -0500
Received: from mga09.intel.com ([134.134.136.24]:21129 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727365AbgLDLJc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 06:09:32 -0500
IronPort-SDR: WZLq3z8TOyvwfisPSHwo8pWG64zSUvddTz0RFBvaRzUET6IR//gfxcSCeF1qU3IJxoYLr7D3rw
 O907lhuUMulA==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="173516662"
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="173516662"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 03:07:51 -0800
IronPort-SDR: lzFhlukNmmwDvtbz9Dq6o1uD2dV9zVnDIuDH8UG5MJ0p6ukADGF8buhMEVxVpQk5f8b0B2O5DR
 K0FmkASxlG1g==
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="362149921"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 03:07:49 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D928F20676; Fri,  4 Dec 2020 13:07:46 +0200 (EET)
Date:   Fri, 4 Dec 2020 13:07:46 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <20201204110746.GQ852@paasikivi.fi.intel.com>
References: <20201203001302.3407476-1-robh@kernel.org>
 <20201203001302.3407476-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203001302.3407476-2-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Wed, Dec 02, 2020 at 05:13:01PM -0700, Rob Herring wrote:
> Convert video-interfaces.txt to DT schema. As it contains a mixture of
> device level and endpoint properties, split it up into 2 schemas.
> 
> Binding schemas will need to reference both the graph.yaml and
> video-interfaces.yaml schemas. The exact schema depends on how many
> ports and endpoints for the binding. A single port with a single
> endpoint looks similar to this:
> 
>   port:
>     $ref: /schemas/graph.yaml#/$defs/port-base
> 
>     properties:
>       endpoint:
>         $ref: video-interfaces.yaml#
>         unevaluatedProperties: false
> 
>         properties:
>           bus-width:
>             enum: [ 8, 10, 12, 16 ]
> 
>           pclk-sample: true
>           hsync-active: true
>           vsync-active: true
> 
>         required:
>           - bus-width
> 
>     additionalProperties: false
> 
> Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I need acks for dual licensing from the listed maintainers.

Thanks for doing the conversion. I'm fine with the license change made by
this patch on my contributions. Therefore,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

But please also see my comments below.

...

> +  data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4

The spec, I believe, specifies maximum of four lanes, but there are
implementations that have eight lanes. So I'd use 8 as the maximum instead.

> +    items:
> +      # Assume up to 4 data and 1 clock lane
> +      maximum: 4
> +    description:
> +      An array of physical data lane indexes. Position of an entry determines
> +      the logical lane number, while the value of an entry indicates physical
> +      lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
> +      assuming the clock lane is on hardware lane 0. If the hardware does not
> +      support lane reordering, monotonically incremented values shall be used
> +      from 0 or 1 onwards, depending on whether or not there is also a clock
> +      lane. This property is valid for serial busses only (e.g. MIPI CSI-2).
> +
> +  clock-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    # Assume up to 4 data and 1 clock lane
> +    maximum: 4

There are always zero or one clock lanes, depending on the bus-type. I
think we could better document this but I think it should be separate from
this patch.

> +    description:
> +      Physical clock lane index. Position of an entry determines
> +      the logical lane number, while the value of an entry indicates physical
> +      lane, e.g. for a MIPI CSI-2 bus we could have "clock-lanes = <0>;", which
> +      places the clock lane on hardware lane 0. This property is valid for
> +      serial busses only (e.g. MIPI CSI-2).

-- 
Kind regards,

Sakari Ailus
