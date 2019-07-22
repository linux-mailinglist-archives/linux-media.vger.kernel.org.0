Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB7970D9D
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 01:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731790AbfGVXt1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 19:49:27 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:47018 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729728AbfGVXt0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 19:49:26 -0400
Received: by mail-io1-f68.google.com with SMTP id i10so77834170iol.13;
        Mon, 22 Jul 2019 16:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OJLmbuthXALsnhPZhxE7MeJBMmONjl7w8T5HPyeenvc=;
        b=W8E3iQVyRjdXFw0N3rKrjpPdQHtOwqWRxL/RsRe7X4P7IMLpvvR5LVVPCRxh6w13iK
         vamc4AhwKvUEBNf8yPTL+HjKYym4CZFBDIgIwgQwIr9kNTvpdjRbKAgIX2rb6UB2LXLM
         /iP1HfOtlBpqZMJzM5NhcaYfHnzxDHegsnACej0LjTzKcBAc+5I66qNqo+8pYlD5z3Yx
         zfgKmUvdYKU4jcr+EYCE6mgyMP91+hIESH4ETpLi79n57ip4VZWs7elWUQLJVp4CrIDL
         eF6X7B9pFP9JVheFesU15yOAah5pMzM8mTmbqocJ3BpOU3MgNfqrZYMxA7KZz9mn8Flc
         c66w==
X-Gm-Message-State: APjAAAXEFUwggL+jdjoqgqbP8U9sDeGZjdCAo8eXgvLcZrv5ZJ6QHhWO
        R2klkZAGiZDLn9jWY8F2Iw==
X-Google-Smtp-Source: APXvYqzkH8Tnp7m9jxTvF2W3kkBnlZgivGKMGBtOnCdqqnMHosHOQ0blCrKEmssR6DnsieQ9XjyLqw==
X-Received: by 2002:a5d:8ccc:: with SMTP id k12mr67931100iot.141.1563839365957;
        Mon, 22 Jul 2019 16:49:25 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id m4sm36990247iok.68.2019.07.22.16.49.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 16:49:25 -0700 (PDT)
Date:   Mon, 22 Jul 2019 17:49:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, --to=drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [RFC,V2,1/2] media: dt-bindings: media: i2c: Add bindings for
 OV02A10
Message-ID: <20190722234924.GA22604@bogus>
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
 <20190704084651.3105-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704084651.3105-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 04, 2019 at 04:46:50PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> Add device tree binding documentation for the OV02A10 camera sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../devicetree/bindings/media/i2c/ov02a10.txt      | 43 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> new file mode 100644
> index 0000000..d40aa87
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> @@ -0,0 +1,43 @@
> +* Omnivision OV02A10 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: shall be "ovti,ov02a10"
> +- clocks: reference to the xvclk input clock
> +- clock-names: shall be "xvclk"
> +- avdd-supply: Analog voltage supply, 2.8 volts
> +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> +- dvdd-supply: Digital core voltage supply, 1.8 volts
> +- reset-gpios: Low active reset gpio
> +
> +The device node shall contain one 'port' child node with an
> +'endpoint' subnode for its digital output video port,
> +in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +The endpoint optional property 'data-lanes' shall be "<1>".
> +
> +Example:
> +&i2c4 {
> +	ov02a10: camera-sensor@3d {
> +		compatible = "ovti,ov02a10";
> +		reg = <0x3d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> +
> +		clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> +			<&topckgen CLK_TOP_UNIVP_192M_D8>;
> +		clock-names = "xvclk", "freq_mux";
> +
> +		avdd-supply = <&mt6358_vcama1_reg>;
> +		dvdd-supply = <&mt6358_vcn18_reg>;
> +		dovdd-supply = <&mt6358_vcamio_reg>;
> +		pwdn-gpios = <&pio 107 1>;

Not documented. If you need this, use 'powerdown-gpios' instead.

> +		reset-gpios = <&pio 109 1>;
> +
> +		port {
> +		   ov02a10_core: endpoint {
> +		       remote-endpoint = <&ov02a10_0>;
> +			   data-lanes = <1>;
> +			};
> +		};
> +	};
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5cfbea4..62b81ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11571,6 +11571,13 @@ T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
>  F:	drivers/media/i2c/ov13858.c
>  
> +OMNIVISION OV02A10 SENSOR DRIVER
> +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> +L:	linux-media@vger.kernel.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> +
>  OMNIVISION OV2680 SENSOR DRIVER
>  M:	Rui Miguel Silva <rmfrfs@gmail.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.9.2
> 
