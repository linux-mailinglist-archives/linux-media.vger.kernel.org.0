Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFE33FBE86
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 23:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238674AbhH3VvT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 17:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237167AbhH3VvS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 17:51:18 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C92C061575;
        Mon, 30 Aug 2021 14:50:24 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id s25so23854334edw.0;
        Mon, 30 Aug 2021 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S8anJ0NPPB4P0Ut+ZHX8utJDYvZhnlZjZsXzn1rS+3E=;
        b=hPz+rupDI0UhCDh5P+uZg41eWTjlnSVCvPPsZKNU7dDveXrnz4EBdWdxZfhAYeJxB2
         hYfHV1ER5wiH8POAOZd7yZ2vUGOrSQWtOeeZW6NhZNna1LD+CQOK4tEZ+QTaHynzlLZm
         jSm9/+ZNhLUdMvsX+TD8pD1djLH6Qy7rRUSxuqBlwWjC1xu+bgEBaBnwuSr4K/m8Pouc
         SZMi3NQaUjj2ZAgFvIzvTN9kVUnoOyvDjuWj8OugcKYttn64wS0GNHMWALYAdZG92ZSe
         aJZ/vlT7auVKYFWH9Lp9D8zl7acl188pnhsnLSZGnZuuR70OiL5NsN+JVUHYhA5ET5un
         McHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S8anJ0NPPB4P0Ut+ZHX8utJDYvZhnlZjZsXzn1rS+3E=;
        b=Loq9oHEV3lQyxxerjmwmjqFS5cuDG9GJ3VSC8QIHAIDscbOvlr9MYsdOi1drpYXAdG
         uNIwsdx0Q4nX9hthV1viEvVV77wBk2Ur4ABhnTjS48yo32IkgPCQ37urUrErAq7ZHcOH
         8vmmzQLiAxYosrLZJJQ4qrkqn73BsOH4Q446mwkiNVnoMRis8J4pFrVdTUht1zzRSt8m
         pywC2R2dYrbD82PTwLaaURRTjYARR+AnEd17yPeBh/XUQN4WXYunyyWahwnY/5zOxK1s
         s2fZg1fBTUq7o60Lu0ZzUYFWy4oHRzPgTpbraO7JuUmSTVoXBH5BsqQb/yH0RZHn4XZe
         2SHw==
X-Gm-Message-State: AOAM532Ykw0+ZMfKgV4x/0mQ9PZz2acvczazidOqY1D7XZxNVLJ4QOTB
        3LQRFwxL8vy3CT7MsVhr5/s2N1Jolfo65q6g
X-Google-Smtp-Source: ABdhPJz9YU4vyFs0t9RrfhZb9jXHLop4ynGMWZhZKNyeg1BHemIWXywK4XjaDQ00ea0hqArcVaHWBQ==
X-Received: by 2002:a50:fd02:: with SMTP id i2mr22536429eds.22.1630360222786;
        Mon, 30 Aug 2021 14:50:22 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id s3sm7340097ejm.49.2021.08.30.14.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 14:50:22 -0700 (PDT)
Subject: Re: [PATCH v1 5/5] arm64: dts: rockchip: add mipi-dphy-tx1rx1 for
 rk3399
From:   Johan Jonker <jbx6244@gmail.com>
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Marc Zyngier <maz@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
 <20210830180758.251390-6-mike.rudenko@gmail.com>
 <ac38a6ce-19f6-8d30-6070-55b78cc082e2@gmail.com>
Message-ID: <909ebc5f-3a9b-c793-a4fa-07429effd8c3@gmail.com>
Date:   Mon, 30 Aug 2021 23:50:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ac38a6ce-19f6-8d30-6070-55b78cc082e2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/30/21 11:12 PM, Johan Jonker wrote:
> Hi Mikhail,
> 
> On 8/30/21 8:07 PM, Mikhail Rudenko wrote:
>> Add DT node for RX mode of RK3399 TX1RX1 D-PHY.
>>
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index 3871c7fd83b0..2e4513275a87 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -1902,6 +1902,21 @@ mipi1_in_vopl: endpoint@1 {
>>  		};
>>  	};
>>  


>> +	mipi_dphy_tx1rx1: mipi-dphy-tx1rx1@ff968000 {
>> +		compatible = "rockchip,rk3399-mipi-dphy-tx1rx1";



	mipi_dsi1: mipi@ff968000 {
		compatible = "rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi";
		reg = <0x0 0xff968000 0x0 0x8000>;

Sorry, there's already a node in mainline. Excuse...
See Heiko's comment.


>> +		reg = <0x0 0xff968000 0x0 0x8000>;
> 
>> +		clocks = <&cru SCLK_MIPIDPHY_REF>,
>> +			<&cru SCLK_DPHY_TX1RX1_CFG>,
>> +			<&cru PCLK_VIO_GRF>,
>> +			<&cru PCLK_MIPI_DSI1>;
>> +		clock-names = "dphy-ref", "dphy-cfg",
>> +			"grf", "dsi";
> 
> Could you fix the alignment a bit with extra spaces?
> 
>> +		rockchip,grf = <&grf>;
>> +		power-domains = <&power RK3399_PD_VIO>;
> 
> Sort in alphabetical order.
> 
>> +		#phy-cells = <0>;
>> +		status = "disabled";
>> +	};
>> +
>>  	edp: edp@ff970000 {
>>  		compatible = "rockchip,rk3399-edp";
>>  		reg = <0x0 0xff970000 0x0 0x8000>;
>>
