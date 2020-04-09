Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 239D81A2D45
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 03:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgDIBTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 21:19:10 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40160 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgDIBTK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 21:19:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id s8so9877044wrt.7
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 18:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=E2/NBcIc+EOOv5CPXsarlEbniqcGGi3XbnMq/s2bRBA=;
        b=ZBwfUKd8Vsbe+JNFT3JuKjRP+irlUu6DZOLBGzPsvElz6xYBEKd1efbnBA1CGX3Qj4
         rgumpPX3ojbLH78otplwhR990Q7aaOYDSprDQzyHHH/7SSLu9Y2DSfuRSigJLQRjo2Cd
         1I9QVUdqJHBDcKrHQUQopV+I2BDP4LBdHT4AXXKVNtMJ/Ko+hgdBtzxMvmFZwUvSgR/M
         SjbyyZpygbGnbDBFSafpkpCX+10q8m5ZFKJogPx7KnaGOHkh02PiVqfxFAuOQS4PqqXP
         GUErFYADSFxEY83DIqtjZtLSc7WInisbpmEq5Yo/ulcCJjs1PEhNXuMJeNHW9S5qEOLA
         XTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E2/NBcIc+EOOv5CPXsarlEbniqcGGi3XbnMq/s2bRBA=;
        b=AScROQ+RAJr/SX3km+ubq26GyRE7bNWUF4R5jdI/w6Pe2JnZM6dhbGdp37zcVnHZli
         cZYgvVbJInD1lyXz6qxvKfuGXSTw4yOyX/qEvCpTeo14F9cGqN9AiMwXWXoFl8es8i3h
         4yEA68qGeezi2FA3+OkBs0GTO6MZsGByALvFojcc0FOWSPafFVacPOs3+zRtBZNQOKjl
         Og462xCTyYPiQavxogUiMCp4eMfIWRdXGugGwr+4+nKxJo9tze7lB5B2VS3074lrUaeR
         9WO/OBcvwHSr+40cQzsZdkaZBuNtHS68tjIoK34GOnSA5b/1qV0zaj9aqLLHtQl9cIYX
         oWTg==
X-Gm-Message-State: AGi0PuZKtbAeCrkowh9yqRYQrxwTa77T0FYplUYO623M373xLx6+FEAt
        b1Qo7uYX25YDLaw8Ql4X13s=
X-Google-Smtp-Source: APiQypJyeBKgmAxjXeK+fYWfh30Exoa3l6jR+QiQqbiMR//bgSGIRIu5PfUM3KxjZr2JmvLE1+fVVw==
X-Received: by 2002:adf:e811:: with SMTP id o17mr2770751wrm.390.1586395147857;
        Wed, 08 Apr 2020 18:19:07 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id y22sm1897570wma.0.2020.04.08.18.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 18:19:07 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     Karthik Poduval <karthik.poduval@gmail.com>,
        linux-media@vger.kernel.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org, helen.koike@collabora.com,
        ezequiel@collabora.com
References: <karthik.poduval@gmail.com>
 <20200406073017.19462-1-karthik.poduval@gmail.com>
 <20200406073017.19462-4-karthik.poduval@gmail.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <2fc95890-f938-30a5-a163-bf3fa2e223df@gmail.com>
Date:   Thu, 9 Apr 2020 03:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406073017.19462-4-karthik.poduval@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik and others,

Include all mail lists found with:
./scripts/get_maintainer.pl --nogit-fallback --nogit

Helen is moving isp1 bindings out of staging.
Clocks and other things don't fit with her patch serie.
Maybe fix this while still in staging?

arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
'phys' is a required property
arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
'phy-names' is a required property
arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
'ports' is a required property

arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
'assigned-clock-rates', 'assigned-clocks'
do not match any of the regexes: 'pinctrl-[0-9]+'
arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
clock-names:2: 'aclk_isp_wrap' was expected
arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
clock-names:3: 'hclk_isp' was expected
arch/arm/boot/dts/rk3288-tinker.dt.yaml: isp@ff910000:
clock-names:4: 'hclk_isp_wrap' was expected

arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: 'power-domains'
is a required property

arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: clock-names:1:
'dphy-cfg' was expected
arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: clock-names:
['dphy-ref', 'pclk'] is too short
arch/arm/boot/dts/rk3288-tinker.dt.yaml: mipi-phy-rx0: clocks: [[7,
126], [7, 358]] is too short


Inside yaml:
Use enum and sort.
>>  properties:
>>    compatible:

>>      const: rockchip,rk3399-cif-isp
>> +    const: rockchip,rk3288-rkisp1

    enum:
      - rockchip,rk3288-rkisp1
      - rockchip,rk3399-cif-isp

>>  properties:
>>    compatible:
>>      const: rockchip,rk3399-mipi-dphy-rx0
>> +    const: rockchip,rk3288-mipi-dphy-rx0

    enum:
      - rockchip,rk3288-mipi-dphy-rx0
      - rockchip,rk3399-mipi-dphy-rx0

> 
> Please, keep consistency, or rk3288-cif-isp, or we change rk3399-cif-isp to be rk3399-rkisp1.


On 4/6/20 9:30 AM, Karthik Poduval wrote:
> ISP and DPHY device entries missing so add them.
> 

> tested on tinkerbaord with ov5647 using command
> cam -c 1 -C -F cap

Disclose dts node for ov5647 in cover letter, so people can reproduce
this experiment.

Caution!
Without dts node this command doesn't work correct.

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml

Needed to detect missing: phys, phy-names and ports ,etc.

&isp {
	status = "okay";
};

Needed to detect missing: power-domains, etc.

&mipi_phy_rx0 {
	status = "okay";
};

> 
> Reported-by: Karthik Poduval <karthik.poduval@gmail.com>
> Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 9beb662166aa..adea8189abd9 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -247,6 +247,23 @@
>  		ports = <&vopl_out>, <&vopb_out>;
>  	};
> 

> +	isp: isp@ff910000 {

For nodes:
Sort things without reg alphabetical first,
then sort the rest by reg address.

> +		compatible = "rockchip,rk3288-rkisp1";
> +		reg = <0x0 0xff910000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_ISP>, <&cru ACLK_ISP>,
> +			 <&cru HCLK_ISP>, <&cru PCLK_ISP_IN>,
> +			 <&cru SCLK_ISP_JPE>;
> +		clock-names = "clk_isp", "aclk_isp",
> +			      "hclk_isp", "pclk_isp_in",
> +			      "sclk_isp_jpe";
> +		assigned-clocks = <&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>;
> +		assigned-clock-rates = <400000000>, <400000000>;

> +		power-domains = <&power RK3288_PD_VIO>;
> +		iommus = <&isp_mmu>;

sort

Something missing?
Where are the ports and port nodes?

> +		status = "disabled";
> +	};
> +
>  	sdmmc: mmc@ff0c0000 {
>  		compatible = "rockchip,rk3288-dw-mshc";
>  		max-frequency = <150000000>;
> @@ -891,6 +908,14 @@
>  			status = "disabled";
>  		};
> 

> +		mipi_phy_rx0: mipi-phy-rx0 {

Use separate patch.

For nodes:
Sort things without reg alphabetical first,
then sort the rest by reg address.

> +			compatible = "rockchip,rk3288-mipi-dphy-rx0";
> +			clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_CSI>;
> +			clock-names = "dphy-ref", "pclk";
Something missing?
Does this phy have a power domain?

> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		io_domains: io-domains {
>  			compatible = "rockchip,rk3288-io-voltage-domain";
>  			status = "disabled";
> 

