Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500D1E085
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 12:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfD2K2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 06:28:16 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60248 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727621AbfD2K2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 06:28:16 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 1A27A634C7B;
        Mon, 29 Apr 2019 13:28:10 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hL3W5-0000Wy-MQ; Mon, 29 Apr 2019 13:28:09 +0300
Date:   Mon, 29 Apr 2019 13:28:09 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v4 01/10] media: dt-bindings: marvell,mmp2-ccic: Add
 Marvell MMP2 camera
Message-ID: <20190429102809.qlwwgzgwzh4raz2q@valkosipuli.retiisi.org.uk>
References: <20190429091632.2462285-1-lkundrak@v3.sk>
 <20190429091632.2462285-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429091632.2462285-2-lkundrak@v3.sk>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lubomir,

On Mon, Apr 29, 2019 at 11:16:23AM +0200, Lubomir Rintel wrote:
> Add Marvell MMP2 camera host interface.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v3:
> - Dropped the video-interfaces.txt reference
> - Clarify "clocks", "clock-names" and "clock-output-names" descriptions
> - Refer to other documentation by full path
> 
> Changes since v2:
> - Added #clock-cells, clock-names, port
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>  
> .../bindings/media/marvell,mmp2-ccic.txt      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> new file mode 100644
> index 000000000000..cf7767268c52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> @@ -0,0 +1,38 @@
> +Marvell MMP2 camera host interface
> +
> +Required properties:
> + - compatible: Should be "marvell,mmp2-ccic".
> + - reg: Register base and size.
> + - interrupts: The interrupt number.
> + - #clock-cells: Nust be 0.

"Must".

> +
> +Optional properties:
> + - clocks: Reference to the input clock as specified by
> +           Documentation/devicetree/bindings/clock/clock-bindings.txt.
> + - clock-names: Names of the clocks used; "axi" for the AXI bus interface,
> +                "func" for the peripheral clock and "phy" for the parallel
> +                video bus interface.
> + - clock-output-names: Optional clock source for sensors. Shall be "mclk".
> +
> +Required subnodes:
> + - port: The parallel bus interface port with a single endpoint linked to
> +         the sensor's endpoint as described in
> +         Documentation/devicetree/bindings/media/video-interfaces.txt.

Both parallel and Bt.656 are supported. So you'll need the bus-type
property. Looking further the datasheet, you'll also need pclk-sample,
hsync-active and vsync-active properties. I'd make them mandatory for the
endpoint (the two latter are for parallel mode only).

> +
> +Example:
> +
> +	camera0: camera@d420a000 {
> +		compatible = "marvell,mmp2-ccic";
> +		reg = <0xd420a000 0x800>;
> +		interrupts = <42>;
> +		clocks = <&soc_clocks MMP2_CLK_CCIC0>;
> +		clock-names = "axi";
> +		#clock-cells = <0>;
> +		clock-output-names = "mclk";
> +
> +		port {
> +			camera0_0: endpoint {
> +				remote-endpoint = <&ov7670_0>;

Please also add the above properties here.

> +			};
> +		};
> +	};

-- 
Kind regards,

Sakari Ailus
