Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26E189CE9A
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 13:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727371AbfHZLwa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 07:52:30 -0400
Received: from retiisi.org.uk ([95.216.213.190]:46594 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726497AbfHZLwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 07:52:30 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 9D982634C87;
        Mon, 26 Aug 2019 14:52:19 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i2DXn-0000Nt-H1; Mon, 26 Aug 2019 14:52:19 +0300
Date:   Mon, 26 Aug 2019 14:52:19 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, keiichiw@chromium.org, matthias.bgg@gmail.com,
        mchehab@kernel.org, yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V3 3/4] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20190826115219.GB826@valkosipuli.retiisi.org.uk>
References: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
 <1559815233-24796-4-git-send-email-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559815233-24796-4-git-send-email-louis.kuo@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Louis,

On Thu, Jun 06, 2019 at 06:00:32PM +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek-seninf.txt  | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.txt b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> new file mode 100644
> index 0000000..979063a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> @@ -0,0 +1,31 @@
> +* Mediatek seninf MIPI-CSI2 host driver

Note that DT bindings document the hardware, not the driver implementation.

> +
> +Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support a widely adopted,

Same here; driver apparently refers to software.

Please wrap before or at 80 characters per line.

> +simple, high-speed protocol primarily intended for point-to-point image and video
> +transmission between cameras and host devices.

Could you elaborate the properties of the hardware in a bit more detail,
such as how many ports there are and how many lanes they can support? See
e.g. Documentation/devicetree/bindings/media/ti,omap3isp.txt .

Please also refer to video-interfaces.txt and document the port nodes and
the relevant properties in the endpoint nodes, as in the binding example I
referred to.

> +
> +Required properties:
> +  - compatible: "mediatek,mt8183-seninf"
> +  - reg: Must contain an entry for each entry in reg-names.
> +  - reg-names: Must include the following entries:
> +    "base_reg": seninf registers base
> +    "rx_reg": Rx analog registers base
> +  - interrupts: interrupt number to the cpu.
> +  - clocks : clock name from clock manager
> +  - clock-names: must be CLK_CAM_SENINF and CLK_TOP_MUX_SENINF.
> +    It is the clocks of seninf
> +
> +Example:
> +	seninf: seninf@1a040000 {
> +		compatible = "mediatek,mt8183-seninf";
> +		reg = <0 0x1a040000 0 0x8000>,
> +		      <0 0x11C80000 0 0x6000>;
> +		reg-names = "base_reg", "rx_reg";
> +		interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
> +		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +		clocks =
> +				<&camsys CLK_CAM_SENINF>, <&topckgen CLK_TOP_MUX_SENINF>;

Please wrap before 80 and align the above two lines.

> +		clock-names =
> +			"CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF";

No need to wrap here.

> +	}
> +
> -- 
> 1.9.1

This must be old.

-- 
Regards,

Sakari Ailus
