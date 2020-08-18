Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037DB247E99
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 08:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgHRGnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 02:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgHRGnu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 02:43:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521DEC061343
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 23:43:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h19so20184741ljg.13
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 23:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ClXX7uJ60td5LnvfRgmPKtfx8z8dTsIv+iRBmNZyVoA=;
        b=kSt4tcocrgt42fP9k7nigyYuEtJmqu/nqhLVX93E6GYGGP2Jpe8ePzae1W9m3auUDs
         cG6SWMeqQE+bBKWbVXy7mGFD7eDplEwGDiMpr6Xi6mgcPq/Pb73h2KfhGM/kdgx4XENj
         wEVDtGPO8aFZeRWWuOgCxOmdI51GTNwm1pjBCbQoH9ep6DVGpQkZMXL6BocCj+eL0kev
         Jdfo4u2aleuHijhdSw6y8i7EAVmzJf2LvjgH3qZHCcf22Dkn/a0QqMn/qRacSKd91z0X
         C56fJPtVYf6DcehfSqwGF/MsiPXowGvXjNOg68AYeCPTKRwRcWizDKPPjZ/UZurNfgQ4
         0ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ClXX7uJ60td5LnvfRgmPKtfx8z8dTsIv+iRBmNZyVoA=;
        b=BSQuzHkgm9MjuKc/7j8VdbdZFrlMCR7Nbe9HkLIYZWTThNu552ivKXpxZFihbqX8Ow
         Lba87I9uk0MRT2kJ8gzG3veGdZbbyBnKa4r6VsikSfdxBkpuFYskmg7s9xIlIE0L9wR3
         mxT6XetIucpShDiGCZQeMF9tT7Hv7OEQoh1FaLh0goOwsDqa05G5V45O7zqXb7wzXode
         Y5FItOJVKpkQO+reG/fLZ7uu/2x/en2DjnkpjuByQ5KLA0/vWTUVixR8lW9d8oWqPuQn
         Fd21YCm0M0rqcklMwTosDIv3WwglkMi4+WuOl2ecSEtwM+Ddyq6cvdOPE7kh1x1dvH89
         yjPQ==
X-Gm-Message-State: AOAM5305MSgtdiT4nr7LNlsqLNlix0u23gxKxyL54pZ/MY/BSgTlQN/R
        mWOOndBa11fBr+a6peJX4Z75kw==
X-Google-Smtp-Source: ABdhPJzq4ZGEEmdILhrjYOQbVBu/H10UwBlGsgZjGCCOkKbx52gLSJfnFuD9oslfdMsAdHDuZDOOiQ==
X-Received: by 2002:a2e:912:: with SMTP id 18mr9494717ljj.429.1597733028570;
        Mon, 17 Aug 2020 23:43:48 -0700 (PDT)
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id z22sm6149757lfb.93.2020.08.17.23.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 23:43:47 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: media: imx274: Convert to json-schema
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Leon Luo <leonl@leopardimaging.com>,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
References: <20200817160037.255972-1-jacopo+renesas@jmondi.org>
 <20200817191855.u55o75iby6ib7hhe@uno.localdomain>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <3592105f-584f-eeeb-4ece-89f3f6bb5352@linaro.org>
Date:   Tue, 18 Aug 2020 09:43:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817191855.u55o75iby6ib7hhe@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Misprint in the subject (imx274 vs imx214)?

Thanks,
Andrey

On 17.08.2020 22:18, Jacopo Mondi wrote:
> Slightly better with a subject  =)
> 
> I made a formatting error, empty line between receivers list and Subject:
> 
> Sorry about this :)
> 
> On Mon, Aug 17, 2020 at 06:00:37PM +0200, Jacopo Mondi wrote:
>> Subject: [PATCH] dt-bindings: media: imx274: Convert to json-schema
>>
>> Convert the imx274 bindings document to json-schema and update
>> the MAINTAINERS file accordingly.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> ---
>>   .../bindings/media/i2c/sony,imx214.txt        |  53 --------
>>   .../bindings/media/i2c/sony,imx214.yaml       | 124 ++++++++++++++++++
>>   MAINTAINERS                                   |   2 +-
>>   3 files changed, 125 insertions(+), 54 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt b/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>> deleted file mode 100644
>> index f11f28a5fda4..000000000000
>> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>> +++ /dev/null
>> @@ -1,53 +0,0 @@
>> -* Sony 1/3.06-Inch 13.13Mp CMOS Digital Image Sensor
>> -
>> -The Sony imx214 is a 1/3.06-inch CMOS active pixel digital image sensor with
>> -an active array size of 4224H x 3200V. It is programmable through an I2C
>> -interface.
>> -Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a maximum
>> -throughput of 1.2Gbps/lane.
>> -
>> -
>> -Required Properties:
>> -- compatible: Shall be "sony,imx214".
>> -- reg: I2C bus address of the device. Depending on how the sensor is wired,
>> -       it shall be <0x10> or <0x1a>;
>> -- enable-gpios: GPIO descriptor for the enable pin.
>> -- vdddo-supply: Chip digital IO regulator (1.8V).
>> -- vdda-supply: Chip analog regulator (2.7V).
>> -- vddd-supply: Chip digital core regulator (1.12V).
>> -- clocks: Reference to the xclk clock.
>> -- clock-frequency: Frequency of the xclk clock.
>> -
>> -Optional Properties:
>> -- flash-leds: See ../video-interfaces.txt
>> -- lens-focus: See ../video-interfaces.txt
>> -
>> -The imx214 device node shall contain one 'port' child node with
>> -an 'endpoint' subnode. For further reading on port node refer to
>> -Documentation/devicetree/bindings/media/video-interfaces.txt.
>> -
>> -Required Properties on endpoint:
>> -- data-lanes: check ../video-interfaces.txt
>> -- link-frequencies: check ../video-interfaces.txt
>> -- remote-endpoint: check ../video-interfaces.txt
>> -
>> -Example:
>> -
>> -	camera-sensor@1a {
>> -		compatible = "sony,imx214";
>> -		reg = <0x1a>;
>> -		vdddo-supply = <&pm8994_lvs1>;
>> -		vddd-supply = <&camera_vddd_1v12>;
>> -		vdda-supply = <&pm8994_l17>;
>> -		lens-focus = <&ad5820>;
>> -		enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
>> -		clocks = <&mmcc CAMSS_MCLK0_CLK>;
>> -		clock-frequency = <24000000>;
>> -		port {
>> -			imx214_ep: endpoint {
>> -				data-lanes = <1 2 3 4>;
>> -				link-frequencies = /bits/ 64 <480000000>;
>> -				remote-endpoint = <&csiphy0_ep>;
>> -			};
>> -		};
>> -	};
>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
>> new file mode 100644
>> index 000000000000..ddd4627214b1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
>> @@ -0,0 +1,124 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/sony,imx214.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sony 1/3.06-Inch 13.13Mp CMOS Digital Image Sensor
>> +
>> +maintainers:
>> +  - Ricardo Ribalda <ribalda@kernel.org>
>> +
>> +description: -|
>> +  The Sony imx214 is a 1/3.06-inch CMOS active pixel digital image sensor with
>> +  an active array size of 4224H x 3200V. It is programmable through an I2C
>> +  interface.  Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a
>> +  maximum throughput of 1.2Gbps/lane.
>> +
>> +properties:
>> +  compatible:
>> +    const: sony,imx214
>> +
>> +  reg:
>> +    description: -|
>> +      I2C device address. Depends on how the sensor is wired, it shall be
>> +    enum:
>> +      - 0x10
>> +      - 0x1a
>> +
>> +  clocks:
>> +    description: Reference to the xclk clock.
>> +    maxItems: 1
>> +
>> +  clock-frequency:
>> +    description: Frequency of the xclk clock in Hz.
>> +
>> +  enable-gpios:
>> +    description: GPIO descriptor for the enable pin.
>> +    maxItems: 1
>> +
>> +  vdddo-supply:
>> +    description: Chip digital IO regulator (1.8V).
>> +    maxItems: 1
>> +
>> +  vdda-supply:
>> +    description: Chip analog regulator (2.7V).
>> +    maxItems: 1
>> +
>> +  vddd-supply:
>> +    description: Chip digital core regulator (1.12V).
>> +    maxItems: 1
>> +
>> +  flash-leds:
>> +    description: See ../video-interfaces.txt
>> +
>> +  lens-focus:
>> +    description: See ../video-interfaces.txt
>> +
>> +  port:
>> +    type: object
>> +    description: |
>> +      The device node must contain one 'port' child node for its digital output
>> +      video port, in accordance with the video interface bindings defined in
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
>> +    properties:
>> +      endpoint:
>> +        type: object
>> +        properties:
>> +          remote-endpoint:
>> +            description: See ../video-interfaces.txt
>> +
>> +          data-lanes:
>> +            description: See ../video-interfaces.txt
>> +
>> +          link-frequencies:
>> +            description: See ../video-interfaces.txt
>> +
>> +        required:
>> +          - data-lanes
>> +          - link-frequencies
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-frequency
>> +  - enable-gpios
>> +  - vdddo-supply
>> +  - vdda-supply
>> +  - vddd-supply
>> +  - port
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        camera-sensor@1a {
>> +            compatible = "sony,imx214";
>> +            reg = <0x1a>;
>> +            vdddo-supply = <&pm8994_lvs1>;
>> +            vddd-supply = <&camera_vddd_1v12>;
>> +            vdda-supply = <&pm8994_l17>;
>> +            lens-focus = <&ad5820>;
>> +            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
>> +            clocks = <&camera_clk>;
>> +            clock-frequency = <24000000>;
>> +
>> +            port {
>> +                imx214_ep: endpoint {
>> +                    data-lanes = <1 2 3 4>;
>> +                    link-frequencies = /bits/ 64 <480000000>;
>> +                    remote-endpoint = <&csiphy0_ep>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6c8e98238a7b..d1a6173d3b64 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15918,7 +15918,7 @@ M:	Ricardo Ribalda <ribalda@kernel.org>
>>   L:	linux-media@vger.kernel.org
>>   S:	Maintained
>>   T:	git git://linuxtv.org/media_tree.git
>> -F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
>>   F:	drivers/media/i2c/imx214.c
>>
>>   SONY IMX219 SENSOR DRIVER
>> --
>> 2.27.0
>>
