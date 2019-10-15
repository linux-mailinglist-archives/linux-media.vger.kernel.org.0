Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47280D83EA
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 00:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390025AbfJOWp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 18:45:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46978 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732531AbfJOWp5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 18:45:57 -0400
Received: by mail-ot1-f65.google.com with SMTP id 89so18418678oth.13;
        Tue, 15 Oct 2019 15:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MaWp6Jn60uj0bT6sKCogPI4dguf5DlDQ3ZrBSjZQ+hQ=;
        b=BnGN+2Y/7C4yic9FHhR6n/xkvlokZdM5f+PCeegSm/85ytr0Y3z2e5GpzBm9zWvG0m
         n/RmFIHNbFK7byMaua9U+1C3eQdeBueXJ0yhoYSZ8vzQAO5wvXL+MIhHZ/T2OigtF0l7
         +Y3SlVXTPAueryS1hBCFqYQvaY+vMTyLTabqv+kaPv71agkipgXfb4p+NY1QafBR+MlD
         r2haiwHrMNsK8S1a9zsJcSTcdtaQsue32MI4RZSPedrW/PXfzLRLHq/RyB3fHtZjfIuy
         JjGzR3prpUA2u+IOPosWjBMbwlqRBtni/G2ywXtDbdK+DB5LLUCsl746OoDPLK7YfPce
         a8sQ==
X-Gm-Message-State: APjAAAVTLv4sEZ8J5orX8zKMLKhh9jDoDt/UqegNvyTfxlwtNu2tuKwh
        lpT+KPE4GR4bnS6pPFo6WFURgtE=
X-Google-Smtp-Source: APXvYqx++w9zqh0aKrrTNQxwptQw2IBBKd30UczgzL9fYL5LBBi4ThJTdAd91a3CRCBWp8KOLN+6ww==
X-Received: by 2002:a9d:6b82:: with SMTP id b2mr7915218otq.56.1571179555334;
        Tue, 15 Oct 2019 15:45:55 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c19sm6786305oib.21.2019.10.15.15.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 15:45:54 -0700 (PDT)
Date:   Tue, 15 Oct 2019 17:45:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191015224554.GA5634@bogus>
References: <20191011035613.13598-1-manivannan.sadhasivam@linaro.org>
 <20191011035613.13598-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011035613.13598-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 11, 2019 at 09:26:12AM +0530, Manivannan Sadhasivam wrote:
> Add devicetree binding for IMX296 CMOS image sensor.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/imx296.txt  | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.txt

You should know by now, use DT schema format please.

> diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.txt b/Documentation/devicetree/bindings/media/i2c/imx296.txt
> new file mode 100644
> index 000000000000..25d3b15162c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx296.txt
> @@ -0,0 +1,55 @@
> +* Sony IMX296 1/2.8-Inch CMOS Image Sensor
> +
> +The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> +sensor with square pixel array and 1.58 M effective pixels. This chip features
> +a global shutter with variable charge-integration time. It is programmable
> +through I2C and 4-wire interfaces. The sensor output is available via CSI-2
> +serial data output (1 Lane).
> +
> +Required Properties:
> +- compatible: Should be "sony,imx296"
> +- reg: I2C bus address of the device
> +- clocks: Reference to the mclk clock.
> +- clock-names: Should be "mclk".
> +- clock-frequency: Frequency of the mclk clock in Hz.
> +- vddo-supply: Interface power supply.
> +- vdda-supply: Analog power supply.
> +- vddd-supply: Digital power supply.
> +
> +Optional Properties:
> +- reset-gpios: Sensor reset GPIO
> +
> +The imx296 device node should contain one 'port' child node with
> +an 'endpoint' subnode. For further reading on port node refer to
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Required Properties on endpoint:
> +- data-lanes: check ../video-interfaces.txt

This should only be required when not using all the lanes on the device.

> +- remote-endpoint: check ../video-interfaces.txt

Don't really need to document this.

> +
> +Example:
> +	&i2c1 {
> +		...
> +		imx296: camera-sensor@1a {
> +			compatible = "sony,imx296";
> +			reg = <0x1a>;
> +
> +			reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&camera_rear_default>;
> +
> +			clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
> +			clock-names = "mclk";
> +			clock-frequency = <37125000>;
> +
> +			vddo-supply = <&camera_vddo_1v8>;
> +			vdda-supply = <&camera_vdda_3v3>;
> +			vddd-supply = <&camera_vddd_1v2>;
> +
> +			port {
> +				imx296_ep: endpoint {
> +					data-lanes = <1>;
> +					remote-endpoint = <&csiphy0_ep>;
> +				};
> +			};
> +		};
> -- 
> 2.17.1
> 
