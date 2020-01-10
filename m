Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706CC1377D3
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 21:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgAJUSH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 15:18:07 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39393 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgAJUSH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 15:18:07 -0500
Received: by mail-lj1-f194.google.com with SMTP id l2so3396794lja.6
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2020 12:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p7X3KlANjpxdNl9a1sZU+uCS/p7SKrv18Rt0/HVppPM=;
        b=F6c17n0i2XrG4FGLw3qtnI9ct7tMYvoXK8pZoMIyVUW7TZwbhqW6iBVxNLqA9SeHBi
         IHAem+NEvgo9s9JUyOxEy9I9ciOJL9waTPRMOzIBsO7bCBF/aB6N4EOg5s3JOkOHH5VL
         0ec4vVyMFbhSpa3nTcxxWc3n16debPbWTkjvCiyeG4I8R0dFDSVr3dOSSBnVtwPBoR4Q
         Uc5a95WtgMUQ0iA/afPmRhKoKbxuZNevC2m/j3Yk7vCA6nasgHYJBqE7X4mN3Jj7K8TZ
         uFLLj+LvNtiDlPhNpQ9EORYzm1uIODuWMuPOB0A2cIyR7W3LflZkZeHvnCIMgypogzgf
         b11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p7X3KlANjpxdNl9a1sZU+uCS/p7SKrv18Rt0/HVppPM=;
        b=tFSS17bzEyQanDrmTTCQODsRQiwAIXoi3CAW0fwGy68RiIJ/zqRrr09wu6oMP8TxQV
         6KN8/89rVN44unlM3v6Di/mTiMC9isRi73GHFqV9ydyOtnUVV0d4ohzkERFQAdwHbFhU
         plzRVje3AhjAek0S/qcv7keQJelSkjRn3iZJjnkemILyOamB13Unrqh1kpOJk8dTdk9D
         YWymjPZjG8IGA/XxOotoRs0ld0+tVNDX0jxmPQ98Of9fT8/3pKsigebJYrDh3NHOsw3c
         GtKdqILonp8egjlYvu4/Q+NxuRDUbLTwU/oizmp4g0oTXPjREEP940agPBhbO+Wq0got
         l4zw==
X-Gm-Message-State: APjAAAXKd2uKnYVuIUi2EruBHKtke8YyTUg8j6O3XyH+ixkftkxGwhBU
        wH2HVjI75hePQJsIrLLQuMdDVg==
X-Google-Smtp-Source: APXvYqwLvvtmEum+o+V0t6yp4yiJgfq6T5NoV+OgRLFQOO6MpO+yzH64/Ki5IIt6LwCU6OmHJswRFw==
X-Received: by 2002:a2e:8745:: with SMTP id q5mr3692895ljj.208.1578687485271;
        Fri, 10 Jan 2020 12:18:05 -0800 (PST)
Received: from [192.168.119.5] (office.dev.rtsoft.ru. [62.117.114.130])
        by smtp.gmail.com with ESMTPSA id h24sm1471900ljl.80.2020.01.10.12.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2020 12:18:04 -0800 (PST)
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor
 binding
To:     Rob Herring <robh@kernel.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, peter.griffin@linaro.org,
        ezequiel@collabora.com
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
 <20191227122114.23075-2-andrey.konovalov@linaro.org>
 <20200104215322.GA548@bogus>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <530e69f9-cfda-5a4a-e5d5-42401ea74d32@linaro.org>
Date:   Fri, 10 Jan 2020 23:18:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200104215322.GA548@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thanks for the review!

On 05.01.2020 00:53, Rob Herring wrote:
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
>> +
>> +  camera-clk:
>> +    type: object
>> +
>> +    description: Clock source for imx219
> 
> This clock is external to the sensor, so a node for a fixed clock should
> be too.

Done in v3.

>> +
>> +    properties:
>> +      clock-frequency: true
>> +
>> +    required:
>> +      - clock-frequency
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
>> +
>> +          data-lanes:
>> +            description: |-
>> +              Should be <1 2> for two-lane operation, or <1 2 3 4> for
>> +              four-lane operation.
>> +            oneOf:
>> +              - const: [[ 1, 2 ]]
>> +              - const: [[ 1, 2, 3, 4 ]]
> 
> Not sure if this actually works. If it does, it exposes how we encode
> the DT yaml format which we don't want to do here.

It does work - I am still not quite comfortable with json schema, and got
to the above by looking at the files produced by 'make dt_binding_check'.


> It should be:
> 
> oneOf:
>    - items:
>        - const: 1
>        - const: 2
>    - items:
>        - const: 1
>        - const: 2
>        - const: 3
>        - const: 4

Thanks, got it.

> Really, I think you shouldn't need the 2nd case as that should be the
> default.

I've tried to implement that in v3 of the patch set.

Thanks,
Andrey

>> +
>> +          clock-noncontinuous:
>> +            type: boolean
>> +            description: |-
>> +              Presence of this boolean property decides whether the MIPI CSI-2
>> +              clock is continuous or non-continuous.
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
>> +L:	linux-media@vger.kernel.org
>> +T:	git git://linuxtv.org/media_tree.git
>> +S:	Maintained
>> +F:	drivers/media/i2c/imx219.c
>> +F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
>> +
>>   SONY IMX258 SENSOR DRIVER
>>   M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>>   L:	linux-media@vger.kernel.org
>> -- 
>> 2.17.1
>>
