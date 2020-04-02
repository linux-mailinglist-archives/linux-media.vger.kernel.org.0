Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38DD619C2FA
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 15:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732026AbgDBNsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 09:48:07 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51074 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727734AbgDBNsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 09:48:07 -0400
Received: by mail-wm1-f66.google.com with SMTP id t128so3484235wma.0;
        Thu, 02 Apr 2020 06:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JdEZdR8yjtlVoMZNQrbxmUtK0B2+Djm4LLppLoO//ag=;
        b=UTJlCycdxWzo8SkwC++itw0GwatKMfwLvoM8hEz5hz0itKOrDAtfARRjd08KAo/YlH
         iYT7miwWVvjXGIMOVY3OjO3n0Mn8Ksa9rY5az4HK5BUJ68HWuftxPfKhAEhGYA4Yn2Dx
         La5wev2ZBzXN90dpwna9UbVHyMHP4wB2LvKgVYRbqg7U00y7LfYpOp1n+6KQfV2sld/l
         yav91x+sISP54xu2tPy0MbVaptxe9HBydeIqtNP10Zc2zcyTUnXn/ANeO5KMYsdqlk66
         bfclrPNbmCjER1axdhz0RvwvbhQm2h+TcIw1ChSyayEzTqXtXCokTwUd8+MfFtI9EATW
         Qkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JdEZdR8yjtlVoMZNQrbxmUtK0B2+Djm4LLppLoO//ag=;
        b=qbU8MErQGg7p0elz7YaLOXeBJaekOAWnz7+xxxqOJYosDfy01izaX9YO3imxHCGSFs
         EdxY0q037hg49anIgxtO9jwTXduxzCFfZiUvTwPfGYJye2f4uBZ+xLm2qmM3Kl2oxgK5
         ctRNBuimmNXhiQhY4bfeANTbw3xQJV0LNp899N3c6TogV/JJFBl9eLEX3h0yj+T2i5Ka
         jgm4ZZGte5eAQr14UksCiYXtXYQI1yDOunioln9653eVTY0KF1X+SwZ+/v+vSQH6c+jC
         H9PGcY1sZDvWRSqDndkEkGdxydq+jGCemwipFENh5F7XRs9uXj4paIYsnreUtpkr1TzV
         5O0w==
X-Gm-Message-State: AGi0PuYzgwO66EV33rwi1qy81FUPR8yhTCQ6XE1jM24EHVlecr+YmtpZ
        3tTg0spqOPUssdl9V6Irwj8=
X-Google-Smtp-Source: APiQypKpdlsAkbdIzYdLmLeSVwA00to9hBXvBdZjAZl5uSzVZ+jldunwGUNL5wE1hbN9a3RTQzrH8g==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr3723403wmi.90.1585835285227;
        Thu, 02 Apr 2020 06:48:05 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id u13sm7008313wmm.32.2020.04.02.06.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 06:48:04 -0700 (PDT)
To:     helen.koike@collabora.com
Cc:     dafna.hirschfeld@collabora.com, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        karthik.poduval@gmail.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <20200402000234.226466-4-helen.koike@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add rx0 mipi-phy for rk3399
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <970b9e48-e38f-7e7a-3472-7dc5a4737e58@gmail.com>
Date:   Thu, 2 Apr 2020 15:48:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402000234.226466-4-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

> From: Helen Koike <helen.koike@collabora.com>

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 33cc21fcf4c10..fc0295d2a65a1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1394,6 +1394,17 @@ io_domains: io-domains {
>  			status = "disabled";
>  		};
>  

> +		mipi_dphy_rx0: mipi-dphy-rx0 {

For Heiko sort syscon@ff770000 subnodes alphabetical or reg value first?

> +			compatible = "rockchip,rk3399-mipi-dphy-rx0";
> +			clocks = <&cru SCLK_MIPIDPHY_REF>,

> +				<&cru SCLK_DPHY_RX0_CFG>,
> +				<&cru PCLK_VIO_GRF>;

Align                            ^

> +			clock-names = "dphy-ref", "dphy-cfg", "grf";
> +			power-domains = <&power RK3399_PD_VIO>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		u2phy0: usb2-phy@e450 {
>  			compatible = "rockchip,rk3399-usb2phy";
>  			reg = <0xe450 0x10>;
> -- 
> 2.26.0

