Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7F712BA9F
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2019 19:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfL0S0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Dec 2019 13:26:30 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38272 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfL0S0a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Dec 2019 13:26:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id w1so5765159ljh.5
        for <linux-media@vger.kernel.org>; Fri, 27 Dec 2019 10:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lNP4sjt0XGHW1tW75qU+ERy0n0xK7DZ2dAFjglxzBts=;
        b=GNNZpErtvyrGI8AyO2o+z5Rw5hPdUYlrjx2pIFfgf3pq6bhquOEh6E8cyrWpqh91jw
         CC06KOgaKErjznAA4By4uEpxbxF4NjAmB/hgQLNvwLYw4NLy5qL/i0drRiMtTdBK4vMU
         dUG+a0k14GxEOuXQMHQxZaezkxJyJaNABcfpGRMyASB7It9D2CGcKFdlB/7h21ZbQV+y
         ZQOPvLz6PsM9bJsZtQnGvuV6Tnd9oKhzipcCCb2tCqeF4APrH39qHupkDsQyeqtPudgP
         7uE9Gmg6tQMQIud+l3t3HJ6RHe61h/Mw/AXMdpWL5CRDWLKUK41Sfq54CvwhWexc/waW
         O0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lNP4sjt0XGHW1tW75qU+ERy0n0xK7DZ2dAFjglxzBts=;
        b=KGBHd54wj0vySAade3ttNBznbW0Zi9YJzU8Fe8BpQT6bh4aOluTm0fs2rX5PPB77X6
         T5uW9W/mtMy7/CSUxeEhM7hIWI0dqyWeWpUDwn9RqKjOWhy6jEeU0jqVt5SgFYt/3EbT
         4lLuCFoBpiMvcCaOFQZyITwrZjBl09AH1yW8Tdd9aHS307KFod6gJQcR5QBwJQ47gIQ9
         uRy9YVkj90Ng898I/KEQC7O0xFwTAjFCgEOUoyXHAmMXvgdJnq8LrVr8YhqICrAh4ZeC
         92xidEQocxR3mHD1Jhvrr31pmq4bOas1+tSCTqtySVXJoTloZe356cagFnO1iQ4Pvu2k
         WCcA==
X-Gm-Message-State: APjAAAXhbsSbd5NuOW/25dja6+BWarhjev5vdtK5hWBfeQR7q8EIbxS2
        RSuQov9cjx9QHu3e8vjLGtmMqg==
X-Google-Smtp-Source: APXvYqytPSpKME42DErgjRyyntYM6YBMk6p9pzIlwPBRvAY7yEJHtiTPxcoSHcStMHcbSFFuR/81GA==
X-Received: by 2002:a2e:9708:: with SMTP id r8mr29214892lji.92.1577471186829;
        Fri, 27 Dec 2019 10:26:26 -0800 (PST)
Received: from [192.168.119.5] (office.dev.rtsoft.ru. [62.117.114.130])
        by smtp.gmail.com with ESMTPSA id c189sm15096409lfg.75.2019.12.27.10.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2019 10:26:26 -0800 (PST)
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor
 binding
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, ezequiel@collabora.com
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
 <20191227122114.23075-2-andrey.konovalov@linaro.org>
 <20191227141739.GD861@valkosipuli.retiisi.org.uk>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <e3a9161a-feaf-f4a4-5122-871e68409698@linaro.org>
Date:   Fri, 27 Dec 2019 21:26:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191227141739.GD861@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for reviewing the patchset, and for the pointers on improving the driver (nokia,smia.txt etc)!
I'll write a separate email later, or just fix what you suggested in v3 (I agree with the proposed changes
I didn't comment on in this email).

Just few quick answers below.

Thanks,
Andrey

On 27.12.2019 17:17, Sakari Ailus wrote:
> Hi Andrey,
> 
> Thanks for the patchset.
> 
> On Fri, Dec 27, 2019 at 03:21:13PM +0300, Andrey Konovalov wrote:
>> Add YAML device tree binding for IMX219 CMOS image sensor, and
>> the relevant MAINTAINERS entries.
>>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   .../devicetree/bindings/media/i2c/imx219.yaml | 134 ++++++++++++++++++
>>   MAINTAINERS                                   |   8 ++
>>   2 files changed, 142 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
>> new file mode 100644
>> index 000000000000..b58aa49a7c03
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
>> @@ -0,0 +1,134 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
>> +
>> +maintainers:
>> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
>> +
>> +description: |-
>> +  The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
>> +  with an active array size of 3280H x 2464V. It is programmable through
>> +  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
>> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
>> +  4 data lanes.
>> +
>> +properties:
>> +  compatible:
>> +    const: sony,imx219
>> +
>> +  reg:
>> +    description: I2C device address
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xclk
> 
> There's a single clock. Does it need a name? I'd just omit it.
> 
>> +
>> +  VDIG-supply:
>> +    description:
>> +      Digital I/O voltage supply, 1.8 volts
>> +
>> +  VANA-supply:
>> +    description:
>> +      Analog voltage supply, 2.8 volts
>> +
>> +  VDDL-supply:
>> +    description:
>> +      Digital core voltage supply, 1.2 volts
>> +
>> +  xclr-gpios:
>> +    description: |-
>> +      Reference to the GPIO connected to the xclr pin, if any.
>> +      Must be released (set high) after all supplies are applied.
> 
> A common name for this in camera sensors is xshutdown. I'd suggest to use
> that.

Indeed, "xshutdown" is the pin name commonly used by OmniVision for their sensors.
(In older sensors they used "pwdn" which is similar, but the polarity is reversed.)

In their sensor datasheets Sony consistently use "xclr" for the pin and signal otherwise
very similar to OmniVision's "xshutdown".

Wouldn't using the signal name from the sensor by the different vendor just add more confusion
instead?

>> +
>> +  camera-clk:
>> +    type: object
>> +
>> +    description: Clock source for imx219
>> +
>> +    properties:
>> +      clock-frequency: true
>> +
>> +    required:
>> +      - clock-frequency
> 
> Hmm. The driver doesn't seem to use this for anything.
> 
> There are two approaches to this; either you can get and check the
> frequency, or specify it in DT bindings, set and then check it.
> 
> See e.g. Documentation/devicetree/bindings/media/i2c/nokia,smia.txt (not in
> YAML though).
> 
>> +
>> +  # See ../video-interfaces.txt for more details
>> +  port:
>> +    type: object
>> +    properties:
>> +      endpoint:
>> +        type: object
>> +        properties:
>> +          clock-lanes:
>> +            const: 0
> 
> If the hardware does not support lane reordering, you can omit the
> clock-lanes property as it provides no information.
> 
>> +
>> +          data-lanes:
>> +            description: |-
>> +              Should be <1 2> for two-lane operation, or <1 2 3 4> for
>> +              four-lane operation.
>> +            oneOf:
>> +              - const: [[ 1, 2 ]]
>> +              - const: [[ 1, 2, 3, 4 ]]
>> +
>> +          clock-noncontinuous:
>> +            type: boolean
>> +            description: |-
>> +              Presence of this boolean property decides whether the MIPI CSI-2
>> +              clock is continuous or non-continuous.
> 
> How about: MIPI CSI-2 clock will be non-continuous if this property is
> present, otherwise it's continuous.

This statement is more clear than the original. Thanks!

>> +
>> +        required:
>> +          - clock-lanes
>> +          - data-lanes
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - VANA-supply
>> +  - VDIG-supply
>> +  - VDDL-supply
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        imx219: sensor@10 {
>> +            compatible = "sony,imx219";
>> +            reg = <0x10>;
>> +            clocks = <&imx219_clk>;
>> +            clock-names = "xclk";
>> +            VANA-supply = <&imx219_vana>;   /* 2.8v */
>> +            VDIG-supply = <&imx219_vdig>;   /* 1.8v */
>> +            VDDL-supply = <&imx219_vddl>;   /* 1.2v */
>> +
>> +            imx219_clk: camera-clk {
>> +                compatible = "fixed-clock";
>> +                #clock-cells = <0>;
>> +                clock-frequency = <24000000>;
>> +            };
>> +
>> +            port {
>> +                imx219_0: endpoint {
>> +                    remote-endpoint = <&csi1_ep>;
>> +                    clock-lanes = <0>;
>> +                    data-lanes = <1 2>;
>> +                    clock-noncontinuous;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ffa3371bc750..f7b6c24ec081 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15350,6 +15350,14 @@ S:	Maintained
>>   F:	drivers/media/i2c/imx214.c
>>   F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>>   
>> +SONY IMX219 SENSOR DRIVER
>> +M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Is Dave aware of this? :-)

Yes, he is :)

But I forgot to add him to Cc this time. My bad..

Thanks,
Andrey

>> +L:	linux-media@vger.kernel.org
>> +T:	git git://linuxtv.org/media_tree.git
>> +S:	Maintained
>> +F:	drivers/media/i2c/imx219.c
>> +F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
>> +
>>   SONY IMX258 SENSOR DRIVER
>>   M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>>   L:	linux-media@vger.kernel.org
> 
