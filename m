Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C367862ADA
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 23:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732205AbfGHVRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 17:17:15 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34267 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729474AbfGHVRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 17:17:15 -0400
Received: by mail-io1-f66.google.com with SMTP id k8so38638654iot.1;
        Mon, 08 Jul 2019 14:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CrxCsRHW+GIa4a/qMPu434CBnFGIQNcK2yz/nDJd4+U=;
        b=m/00KUwAsWFQ8Z32zIozWireGAISt9T6heoNn0uEW6itq1A1Hnj4bxwNS8kCtG4Y7c
         dPITcJKCKmtT8SLpyeNjdnjyBhCqEYAn+wpDFTM7K5Ql+cF+ZhTKePPPSbITMaLRDv2w
         mAFAH5PQP6HlYLAizrowKCh+4soiUP5Mbvwo4fAb+LcgQCcPc0XLiIFnnAaAb05nVgz7
         nfpfOUC2rbAflJ6HAjx9bv09bBJxcxVQGFqqbcKSoiQUXY2Zz8Xq1fnRVXWzvxQ3lu++
         HH8B7BsUXS4jmaQAeKz58J1sOdI8vKGlCsgbZVXk8hB297bL3RDt9ztfgqdN7Jc9+/QB
         5QGA==
X-Gm-Message-State: APjAAAUglBL/ukl+5YRB6envuyP1AbvkdYt2Rfs8ij9OH4jLm2/cRU9u
        fxKl3a4+01VLp3opW3snRxBJ8E4=
X-Google-Smtp-Source: APXvYqzfCkBKehRz5H2VsplhOhGuqqegSyHxiVyLUG97WGex46iHZuVsiAM3DdxEW9/WQJHQR/guJw==
X-Received: by 2002:a02:ccdc:: with SMTP id k28mr22092576jaq.41.1562620633926;
        Mon, 08 Jul 2019 14:17:13 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q22sm14805968ioj.56.2019.07.08.14.17.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:17:13 -0700 (PDT)
Date:   Mon, 8 Jul 2019 15:17:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     sakari.ailus@linux.intel.com, mchehab@kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>, devicetree@vger.kernel.org,
        graphics@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: add bindings for Toshiba
 TC358746
Message-ID: <20190708211711.GA20542@bogus>
References: <20190619152838.25079-1-m.felsch@pengutronix.de>
 <20190619152838.25079-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619152838.25079-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 19, 2019 at 05:28:37PM +0200, Marco Felsch wrote:
> Add corresponding dt-bindings for the Toshiba tc358746 device and update
> the MAINTAINERS file too.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi Rob,
> 
> I droped your reviewed-by tag since there where several changes.
> 
> Changes
> v2:
>  - use the Documentation/devicetree/bindings/media/ti,omap3isp.txt
>    formatting scheme
>  - Adapt introducing paragraph according Jacopo's comments
>  - drop the clock-names property
>  - drop the clock-lanes (csi-2) property
>  - adapt the property descriptions accroding Jacopo's comments
>  - use port@0 as input and port@1 as output port instead of mapping
>    port@0 to parallel and port@1 to csi-2 interface
>  - Adapt port/endpoint description according Jacopo's and Sakari's
>    comments
>  - Adapt the example
>  - squash v1 patch-3 and patch-1
>  - set status to Maintained
> 
>  .../bindings/media/i2c/toshiba,tc358746.txt   | 95 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt

One nit below, otherwise:

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> new file mode 100644
> index 000000000000..e79b45ee050e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> @@ -0,0 +1,95 @@
> +Toshiba TC358746 Parallel to MIPI CSI2-TX or MIPI CSI2-RX to Parallel Bridge
> +============================================================================
> +
> +The Toshiba TC358746 converts a parallel into a MIPI CSI-2 stream. The direction
> +can be either parallel-in -> csi-out e.g. to connect a parallel camera to a
> +MIPI CSI-2 host or csi-in -> parallel-out e.g. to connect a parallel display to
> +a MIPI CSI-2 host. It's programmable trough I2C and SPI. The SPI interface is
> +only supported in parallel-in -> csi-out mode.
> +
> +Required properties
> +-------------------
> +
> +- compatible		: Shall be "toshiba,tc358746"
> +- reg			: Shall be <0x0e>
> +- clocks		: Phandle to the reference clock source
> +
> +Optional properties
> +-------------------
> +
> +- reset-gpios		: Phandle to the GPIO connected to the reset input pin
> +
> +Port nodes (required)
> +=====================
> +
> +The device node must contain two ports children nodes which should be grouped
> +within a 'ports' node. The first port describes the input connection, the second
> +one describes the output one. Each port shall contain one endpoint subnode that
> +connects to a remote device and specifies the bus type of the input and output
> +ports. Only one endpoint per port shall be present.
> +
> +More documentation on these bindings is available in [1].
> +
> +reg			: The interface:
> +			  0 - Input, either parallel or MIPI CSI-2
> +			  1 - Output, either parallel or MIPI CSI-2
> +
> +Endpoint nodes (required)
> +=========================
> +
> +Required properties
> +-------------------
> +
> +- bus-width		: Look at [1] for more information (Parallel endpoint)
> +- data-lanes		: Look at [1] for more information (CSI-2 endpoint)
> +- link-frequencies	: Array of frequencies the driver can choose to
> +			  full-fill the parallel timings calculation. Look at
> +			  [1] for more information (CSI-2 endpoint)
> +
> +Optional properties
> +-------------------
> +
> +- bus-type		: Look at [1] for more information
> +- clock-noncontinuous	: Look at [1] for more information (CSI-2 endpoint)
> +
> +[1] Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example
> +=======
> +
> +&i2c {
> +	csi-bridge@0e {

csi-bridge@e

> +		reg = <0x0e>;
> +		compatible = "toshiba,tc358746";
> +		pinctrl-names = "default";
> +		clocks = <&clk_cam_ref>;
> +		reset-gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* Input */
> +			port@0 {
> +				reg = <0>;
> +
> +				tc358746_parallel_in: endpoint {
> +					bus-width = <8>;
> +					remote-endpoint = <&micron_parallel_out>;
> +				};
> +			};
> +
> +			/* Output */
> +			port@1 {
> +				reg = <1>;
> +
> +				tc358746_mipi2_out: endpoint {
> +					remote-endpoint = <&mipi_csi2_in>;
> +					data-lanes = <1 2>;
> +					clock-noncontinuous;
> +					link-frequencies = /bits/ 64 <216000000>;
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 57f496cff999..833b3c8fb301 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15955,6 +15955,13 @@ S:	Maintained
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>  
> +TOSHIBA TC358746 DRIVER
> +M:	Marco Felsch <kernel@pengutronix.de>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/i2c/tc358746*
> +F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> +
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> -- 
> 2.20.1
> 
