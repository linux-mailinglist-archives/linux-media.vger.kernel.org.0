Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 085EB19B930
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 02:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733089AbgDBAAB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 20:00:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35616 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732560AbgDBAAB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 20:00:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 9044C283B9C
Subject: Re: [PATCH 4/4] ARM: dts: rockchip: add ov5647 camera module support
 to tinkerboard
To:     karthik poduval <karthik.poduval@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <CAFP0Ok_3yTv9QWAykvBk3yLgbThycVPdx0taU9F1Wo_WTnVjyA@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <c892675e-79c0-5476-52c6-cd364adef4d7@collabora.com>
Date:   Wed, 1 Apr 2020 20:59:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAFP0Ok_3yTv9QWAykvBk3yLgbThycVPdx0taU9F1Wo_WTnVjyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik,

It is nice to see this driver being used and tested elsewhere.

How did you tested the series? It would be nice to add it in the commit message.

On 3/31/20 4:57 AM, karthik poduval wrote:
> ov5647 is one of the two camera modules as described in
> https://tinkerboarding.co.uk/wiki/index.php/CSI-camera
> 
> changes ported over from https://github.com/TinkerBoard/debian_kernel.git
> 
> Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
> Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>

please, see my comments from previous commit.

> ---
>  arch/arm/boot/dts/rk3288-tinker.dtsi | 37 ++++++++++++++++++++++++++++

I wondering if changing thinkerboard dts make sense. Is the camera really hardwired
on the tinker board, or is it an add-on?

Regards,
Helen

>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi
> b/arch/arm/boot/dts/rk3288-tinker.dtsi
> index 312582c1bd37..720dd80ea3aa 100644
> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
> @@ -107,6 +107,13 @@
>          startup-delay-us = <100000>;
>          vin-supply = <&vcc_io>;
>      };
> +
> +    ext_cam_clk: external-camera-clock {
> +        compatible = "fixed-clock";
> +        clock-frequency = <25000000>;
> +        clock-output-names = "CLK_CAMERA_25MHZ";
> +        #clock-cells = <0>;
> +    };
>  };
> 
>  &cpu0 {
> @@ -345,12 +352,42 @@
> 
>  &i2c2 {
>      status = "okay";
> +    camera0: ov5647@36 {
> +        compatible = "ovti,ov5647";
> +        reg = <0x36>;
> +        clocks = <&ext_cam_clk>;
> +        status = "okay";
> +        enable-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
> +        port {
> +            ov5647_out: endpoint {
> +                remote-endpoint = <&isp_mipi_in>;
> +                data-lanes = <1 2>;
> +            };
> +        };
> +    };
>  };
> 
>  &i2c5 {
>      status = "okay";
>  };
> 
> +&isp {
> +    status = "okay";
> +    phys = <&mipi_phy_rx0>;
> +    phy-names = "dphy";
> +
> +    port {
> +        isp_mipi_in: endpoint {
> +            remote-endpoint = <&ov5647_out>;
> +            data-lanes = <1 2>;
> +        };
> +    };
> +};
> +
> +&mipi_phy_rx0 {
> +    status = "okay";
> +};
> +
>  &i2s {
>      #sound-dai-cells = <0>;
>      status = "okay";
> 

