Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4CC28B472
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 11:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfHMJpg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 05:45:36 -0400
Received: from retiisi.org.uk ([95.216.213.190]:51732 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726650AbfHMJpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 05:45:36 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A0346634C88;
        Tue, 13 Aug 2019 12:45:27 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hxTMt-0000eI-0b; Tue, 13 Aug 2019 12:45:27 +0300
Date:   Tue, 13 Aug 2019 12:45:26 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Message-ID: <20190813094526.GG835@valkosipuli.retiisi.org.uk>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> Add devicetree binding for IMX290 CMOS image sensor.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/i2c/imx290.txt  | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> new file mode 100644
> index 000000000000..7535b5b5b24b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> @@ -0,0 +1,51 @@
> +* Sony IMX290 1/2.8-Inch CMOS Image Sensor
> +
> +The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
> +Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
> +interfaces. The sensor output is available via CMOS logic parallel SDR output,
> +Low voltage LVDS DDR output and CSI-2 serial data output.

If there are three to choose from, then you should specify which one is in
use. Given that I think chances remain slim we'd add support for the other
two (it's certainly not ruled out though), CSI-2 could be the default. But
this needs to be documented.

> +
> +Required Properties:
> +- compatible: Should be "sony,imx290"
> +- reg: I2C bus address of the device
> +- clocks: Reference to the xclk clock.
> +- clock-names: Should be "xclk".
> +- clock-frequency: Frequency of the xclk clock.

...in Hz.

> +- vdddo-supply: Sensor digital IO regulator.
> +- vdda-supply: Sensor analog regulator.
> +- vddd-supply: Sensor digital core regulator.
> +
> +Optional Properties:
> +- reset-gpios: Sensor reset GPIO
> +
> +The imx290 device node should contain one 'port' child node with
> +an 'endpoint' subnode. For further reading on port node refer to
> +Documentation/devicetree/bindings/media/video-interfaces.txt.

Which other properties are relevant for the device? I suppose you can't
change the lane order, so clock-lanes is redundant (don't use it in the
example) and data-lanes should be monotonically incrementing series from 1
to 4.

> +
> +Example:
> +	&i2c1 {
> +		...
> +		imx290: imx290@1a {

imx290: camera-sensor@1a {

> +			compatible = "sony,imx290";
> +			reg = <0x1a>;
> +
> +			reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&camera_rear_default>;
> +
> +			clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
> +			clock-names = "xclk";
> +			clock-frequency = <37125000>;
> +
> +			vdddo-supply = <&camera_vdddo_1v8>;
> +			vdda-supply = <&camera_vdda_2v8>;
> +			vddd-supply = <&camera_vddd_1v5>;
> +
> +			port {
> +				imx290_ep: endpoint {
> +					clock-lanes = <1>;
> +					data-lanes = <0 2 3 4>;
> +					remote-endpoint = <&csiphy0_ep>;
> +				};
> +			};
> +		};

-- 
Regards,

Sakari Ailus
