Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7274759D91
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 16:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfF1ONp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 10:13:45 -0400
Received: from retiisi.org.uk ([95.216.213.190]:34370 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726616AbfF1ONp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 10:13:45 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 5FF8B634C7F;
        Fri, 28 Jun 2019 17:13:27 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hgrd0-0000lV-Ns; Fri, 28 Jun 2019 17:13:26 +0300
Date:   Fri, 28 Jun 2019 17:13:26 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        robh@kernel.org, nicolas.ferre@microchip.com,
        paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Joao.Pinto@synopsys.com
Subject: Re: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Message-ID: <20190628141326.swgl3kg4fj5pmlqx@valkosipuli.retiisi.org.uk>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luis,

Thank you for the patchset.

On Tue, Jun 11, 2019 at 09:20:50PM +0200, Luis Oliveira wrote:
> From: Luis Oliveira <lolivei@synopsys.com>
> 
> Add bindings for Synopsys DesignWare MIPI CSI-2 host.
> 
> Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> ---
> Changelog
> v3-v4
> - remove "plat" from the block name @rob @laurent
> - remove "phy-names" when single-entry @rob
> - remove "snps,output-type" -> went to the driver config @laurent
> 
>  .../devicetree/bindings/media/snps,dw-csi.txt      | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-csi.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-csi.txt b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> new file mode 100644
> index 0000000..613b7f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
> @@ -0,0 +1,41 @@
> +Synopsys DesignWare CSI-2 Host controller
> +
> +Description
> +-----------
> +
> +This HW block is used to receive image coming from an MIPI CSI-2 compatible
> +camera.
> +
> +Required properties:
> +- compatible		: shall be "snps,dw-csi"
> +- reg			: physical base address and size of the device memory
> +			  mapped registers;
> +- interrupts		: DW CSI-2 Host interrupts
> +- phys			: List of one PHY specifier (as defined in
> +			  Documentation/devicetree/bindings/phy/phy-bindings.txt).
> +			  This PHY is a MIPI DPHY working in RX mode.
> +- resets		: Reference to a reset controller (optional)
> +
> +The per-board settings:
> + - port sub-node describing a single endpoint connected to the camera as
> +   described in video-interfaces.txt[1].

Which endpoint properties in video-interfaces.txt are relevant for the
hardware? Which values may they have?

> +
> +Example:
> +
> +	csi2: csi2@3000 {
> +		compatible = "snps,dw-csi";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = < 0x03000 0x7FF>;

reg = <0x03000 0x7FF>;

> +		phys = <&mipi_dphy_rx>;
> +		resets = <&dw_rst 1>;
> +		interrupts = <2>;
> +
> +		port@0 {
> +			reg = <0>;

You can drop "@0" and the reg property.

> +			csi_ep1: endpoint {
> +				remote-endpoint = <&camera_1>;
> +				data-lanes = <1 2>;
> +			};
> +		};
> +	};

-- 
Kind regards,

Sakari Ailus
