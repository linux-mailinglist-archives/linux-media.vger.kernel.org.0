Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4CA119C46E
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 16:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388405AbgDBOh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 10:37:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42485 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730837AbgDBOh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 10:37:57 -0400
Received: by mail-wr1-f65.google.com with SMTP id h15so4481451wrx.9;
        Thu, 02 Apr 2020 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=38AkG1J/VasVYvyO8FLPKGFVB9/daSIsdACwJ1jmT6w=;
        b=mV6zDSYqDp5UdxncOWm+lXHPzCxZTPcsxD7Y4qZG6GxtIOI7n2Tt1tjtqODXe1XonP
         OAXcNYyYlMJac/TvM+KVXpF303u1R9YTzAxas6XSeg4X8oEOkNwAVSdGtUffdrDiJtFp
         flyV4X09h+4tTRXQOf0Myw+NBmc3NsNXpSdZAbDjVkQ9BKab39lNcHZswSQYu1Fpp7qj
         CwD3rw5ZWHrB8RwDUhhLS+QuwfTVRKShQNQbrrhdOk14h5wFDHxeHqplJt0dE3v/jO2k
         LMujXX5d5kt24SkX9dQ7Su173WskYyvHna90o4QbwOv3b0cwBqchVgNL2pDMZPI5zpHr
         cHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=38AkG1J/VasVYvyO8FLPKGFVB9/daSIsdACwJ1jmT6w=;
        b=djPyvefGQryXVpMUUn40drG9vcRMWlWSA2E/dGW/m09eWwzL1NL7a2PH0z2VXzcnBL
         zLurvCwP2z+5XZNV+A68CK8nJ0BIZDG2S5X7+6Amzv01nstxwdktrxsSp9kD92UfL+rr
         ejH9yIwWU/YiyAS12fFe4gevHX8m3fxD3NS0Itzb87KVrPd03heEDcCxuimpdLCGCjpq
         BHOXT190egi2yS/ZGdGEJy74QW4nYPo4/lU5g87QXB3gACGL9hwPbNcIl+rUFdvbxinr
         Ydxa3fCUY6Cgz0fduTmfGYyi0tnHjf28kOn19cmz/bFySzdxkO/uv9SQtmB4vXYkG7Pa
         5/gA==
X-Gm-Message-State: AGi0PubpzI8EW7LXJPI2T3y6ACKnqXyqjrsh6U71ez5HpAqOf2Y7fi1N
        MxjudoSqAgis18H/K1//cd4=
X-Google-Smtp-Source: APiQypKP/NzZE8Bp6zRGZQB5jMxxV5ROKksg/0lNUpk/3V8+Un9IDmxt1EQ5jKflYscGyO2USHOJHQ==
X-Received: by 2002:adf:97d0:: with SMTP id t16mr3865783wrb.343.1585838275269;
        Thu, 02 Apr 2020 07:37:55 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id e5sm7848520wru.92.2020.04.02.07.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 07:37:54 -0700 (PDT)
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add rx0 mipi-phy for rk3399
To:     =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc:     helen.koike@collabora.com, dafna.hirschfeld@collabora.com,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        karthik.poduval@gmail.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <20200402000234.226466-4-helen.koike@collabora.com>
 <970b9e48-e38f-7e7a-3472-7dc5a4737e58@gmail.com> <105956984.FXDh2DO4ZE@diego>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <76211530-73ff-5f36-8915-8bdc036d4369@gmail.com>
Date:   Thu, 2 Apr 2020 16:37:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <105956984.FXDh2DO4ZE@diego>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/2/20 4:31 PM, Heiko Stübner wrote:
> Am Donnerstag, 2. April 2020, 15:48:02 CEST schrieb Johan Jonker:
>> Hi Helen,
>>
>>> From: Helen Koike <helen.koike@collabora.com>
>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> index 33cc21fcf4c10..fc0295d2a65a1 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> @@ -1394,6 +1394,17 @@ io_domains: io-domains {
>>>  			status = "disabled";
>>>  		};
>>>  
>>
>>> +		mipi_dphy_rx0: mipi-dphy-rx0 {
>>
>> For Heiko sort syscon@ff770000 subnodes alphabetical or reg value first?
> 
> Similar to main nodes ... so things without reg alphabetical,
> the rest by reg address
> 
alphabetical first:

io-domains
mipi-dphy-rx0
usb2-phy@e450
.@..

or

with reg values first:

.@..
emmc_phy: phy@f780
mipi-dphy-rx0
pcie-phy

> 
>>
>>> +			compatible = "rockchip,rk3399-mipi-dphy-rx0";
>>> +			clocks = <&cru SCLK_MIPIDPHY_REF>,
>>
>>> +				<&cru SCLK_DPHY_RX0_CFG>,
>>> +				<&cru PCLK_VIO_GRF>;
>>
>> Align                            ^
>>
>>> +			clock-names = "dphy-ref", "dphy-cfg", "grf";
>>> +			power-domains = <&power RK3399_PD_VIO>;
>>> +			#phy-cells = <0>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>>  		u2phy0: usb2-phy@e450 {
>>>  			compatible = "rockchip,rk3399-usb2phy";
>>>  			reg = <0xe450 0x10>;
>>
>>
> 
> 
> 
> 

