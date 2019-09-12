Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 142B1B1558
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfILUWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:22:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbfILUWP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:22:15 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCA6020830;
        Thu, 12 Sep 2019 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568319735;
        bh=BwW5ZiZNxIZ35K8u4ts+t57OyUjjLd6ycUYf3HCyazE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fqF+mzmlGe0LaAtKLvp8xByYqBHhnlrXlUa6J6tfTKSXIBBL/OYhRIE30QRCMXkei
         HHEhMe8wHovnA88dVr/DyCFw/lrqdMYvyXU17NKO9iSEmyDV/FAJMNP+FTm1KkY4t9
         gm3SyZY1xqKW6g/dmkijJJn7/GGHdfERpHvp1vOY=
Date:   Thu, 12 Sep 2019 22:22:12 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 4/6] dt-bindings: media: Add Allwinner H3 Deinterlace
 binding
Message-ID: <20190912202212.wkdipjx2bspfupem@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <20190912175132.411-5-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190912175132.411-5-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Sep 12, 2019 at 07:51:30PM +0200, Jernej Skrabec wrote:
> Allwinner H3 Deinterlace core is used for deinterlacing interlaced video
> content. Core can also be found on some later SoCs, like H5 and R40.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../media/allwinner,sun8i-h3-deinterlace.yaml | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun=
8i-h3-deinterlace.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-d=
einterlace.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8i-h=
3-deinterlace.yaml
> new file mode 100644
> index 000000000000..31c0ac427442
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterl=
ace.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/allwinner,sun8i-h3-deinterlace.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner H3 Deinterlace Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>

mripard@kernel.org please

> +
> +description: |-
> +  The Allwinner H3 and later has a deinterlace core used for
> +  deinterlacing interlaced video content.
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun8i-h3-deinterlace
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Deinterlace interface clock
> +      - description: Deinterlace module clock
> +      - description: Deinterlace DRAM clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: ram
> +
> +  resets:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem

You can define it as:

interconnect-names:
    const: dma-mem

There's no need for the items here.

Maxime
