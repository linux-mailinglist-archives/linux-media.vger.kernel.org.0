Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065A819DB93
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 18:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404531AbgDCQZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 12:25:13 -0400
Received: from gloria.sntech.de ([185.11.138.130]:57014 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403971AbgDCQZN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Apr 2020 12:25:13 -0400
Received: from p5b127fb0.dip0.t-ipconnect.de ([91.18.127.176] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1jKP7y-000641-2O; Fri, 03 Apr 2020 18:25:06 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: Document Rockchip CIF bindings
Date:   Fri, 03 Apr 2020 18:25:05 +0200
Message-ID: <1766530.2SdDkCQg1P@phil>
In-Reply-To: <20200403142122.297283-2-maxime.chevallier@bootlin.com>
References: <20200403142122.297283-1-maxime.chevallier@bootlin.com> <20200403142122.297283-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

Am Freitag, 3. April 2020, 16:21:20 CEST schrieb Maxime Chevallier:
> Add a documentation for the Rockchip Camera Interface controller
> binding.
> 
> This controller can be found on platforms such as the PX30 or the
> RK3288, the PX30 being the only platform supported so far.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../bindings/media/rockchip-cif.yaml          | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-cif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-cif.yaml b/Documentation/devicetree/bindings/media/rockchip-cif.yaml
> new file mode 100644
> index 000000000000..87fb5e136edd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-cif.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip-cif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Camera Interface (CIF)
> +
> +maintainers:
> +  - Maxime Chevallier <maxime.chevallier@bootlin.com>
> +
> +description: |-
> +Camera Interface for Rockcip platforms
> +
> +properties:
> +  compatible:
> +    const: rockchip,px30-cif
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: PCLK
> +      - description: CIF_OUT
> +
> +  clock-names:
> +    items:
> +      - const: aclk_cif
> +      - const: hclk_cif
> +      - const: pclk_cif
> +      - const: cif_out

names for clocks / reset are always local to the node/ip-block
so there is no need to have that _cif in them.

Also the pclk isn't coming from the cru but from some external source
at least on px30 and rk3288 (and I guess others as well), so maybe
that deserves a distinct name.

Maybe something like aclk, hclk, pclkin or so?

Also the cif_out clock is not actual part of the CIF block, on both
the rk3288 and px30 (and probably the others too) it is generated
in the SoC's clock controller and then just led to an output-pin on
the soc, so I'd assume a peripheral wanting to use that would take
care of setting+enabling that clock (similar to the i2s mclk)?


> +
> +  resets:
> +    items:
> +      - description: Reset CIF A
> +      - description: Reset CIF H
> +      - description: Reset CIF PCLK IN
> +
> +  reset-names:
> +    items:
> +      - const: rst_cif_a
> +      - const: rst_cif_h
> +      - const: rst_cif_pclkin

Same here, maybe just "axi", "ahb", "pclkin" like the
vop resets do?


Heiko



