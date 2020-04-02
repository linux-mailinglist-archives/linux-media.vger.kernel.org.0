Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE2219C494
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 16:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388634AbgDBOnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 10:43:17 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39808 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388629AbgDBOnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 10:43:16 -0400
Received: by mail-qk1-f196.google.com with SMTP id b62so4140861qkf.6;
        Thu, 02 Apr 2020 07:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sf8xIW95po41MsNtorwWl8pTLbgWf5KTPswmS5tTSsU=;
        b=UOetwqE1YsTb0QB80/0e41jqYfMjdLnehYJEBfvCd3AyR29SN7tdb9iZ1q3HN0uKq/
         U+aZStQsg17w3pc7sJH4xcW0d+WXax7gyVx3h4I0bjIuxwVQyDQATkBjSf1Dru5PBwTl
         NvhMDtcwX1ywpEgCLp/N73e71lVslaq8DnDUtvnIJeygEEbUj4Den18/8iW7jYVUByTp
         7kOazrs+Q/emmpQOPOPcCVKKE9Sf5wGiUb+PKnEZr+hqiuoHbkzUmVGW2oBESQO8LQgL
         4eOhdM12Gh5DV9HSn0CfigjoQNC36KjS3p1/kSiV8ITspIhK7SYpbxHogU7QepgZN0ae
         IwSw==
X-Gm-Message-State: AGi0Pua8fCW7q2DZE/pNRMV91ybxTJMheXyFLJZ4DTTKEhFtsN9/2Sw8
        e8nquEv0wljDLt4TQA9SEyQ=
X-Google-Smtp-Source: APiQypLgY4tJeyyCC6GdSOIL8CordFKveXDU9v51XGmiU1NOSceqRS3uwwpK4nCiEdIek1LdlDKtRg==
X-Received: by 2002:a37:4648:: with SMTP id t69mr3604208qka.299.1585838595746;
        Thu, 02 Apr 2020 07:43:15 -0700 (PDT)
Received: from ?IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d? ([2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        by smtp.gmail.com with ESMTPSA id l7sm3630805qkb.47.2020.04.02.07.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 07:43:14 -0700 (PDT)
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add rx0 mipi-phy for rk3399
To:     =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Johan Jonker <jbx6244@gmail.com>
Cc:     helen.koike@collabora.com, dafna.hirschfeld@collabora.com,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        karthik.poduval@gmail.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <20200402000234.226466-4-helen.koike@collabora.com>
 <970b9e48-e38f-7e7a-3472-7dc5a4737e58@gmail.com> <105956984.FXDh2DO4ZE@diego>
From:   Helen Koike <helen@koikeco.de>
Message-ID: <2fa1b497-509a-d02f-b893-058639655133@koikeco.de>
Date:   Thu, 2 Apr 2020 11:43:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <105956984.FXDh2DO4ZE@diego>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 4/2/20 11:31 AM, Heiko Stübner wrote:
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
> 
>>
>>> +			compatible = "rockchip,rk3399-mipi-dphy-rx0";
>>> +			clocks = <&cru SCLK_MIPIDPHY_REF>,
>>
>>> +				<&cru SCLK_DPHY_RX0_CFG>,
>>> +				<&cru PCLK_VIO_GRF>;
>>
>> Align                            ^

ack.

Thanks
Helen

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
