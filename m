Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1822A2F9447
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 18:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbhAQRwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 12:52:09 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:53541 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729078AbhAQRwH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 12:52:07 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3DE8A1F498;
        Sun, 17 Jan 2021 18:51:05 +0100 (CET)
Subject: Re: [PATCH v4 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS
 sensor binding
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
References: <20210113182934.444727-1-angelogioacchino.delregno@somainline.org>
 <20210113182934.444727-3-angelogioacchino.delregno@somainline.org>
 <20210116234404.GX850@valkosipuli.retiisi.org.uk>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <b681819b-1fc9-a6ea-bb20-f234dcdb3cb7@somainline.org>
Date:   Sun, 17 Jan 2021 18:51:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210116234404.GX850@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 17/01/21 00:44, Sakari Ailus ha scritto:
> Hi AngeloGioacchino,
> 
> On Wed, Jan 13, 2021 at 07:29:34PM +0100, AngeloGioacchino Del Regno wrote:
>> Add YAML device tree binding for IMX300 CMOS image sensor, and
>> the relevant MAINTAINERS entries.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   .../bindings/media/i2c/sony,imx300.yaml       | 112 ++++++++++++++++++
>>   MAINTAINERS                                   |   7 ++
>>   2 files changed, 119 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
>> new file mode 100644
>> index 000000000000..4fa767feea80
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
>> @@ -0,0 +1,112 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/sony,imx300.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sony 1/2.3-Inch 25Mpixel Stacked CMOS Digital Image Sensor
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> +
>> +description: |-
>> +  The Sony IMX300 is a 1/2.3-inch Stacked CMOS (Exmor-RS) digital image
>> +  sensor with a pixel size of 1.08um and an active array size of
>> +  5948H x 4140V. It is programmable through I2C interface at address 0x10.
>> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
>> +  4 data lanes.
>> +
>> +properties:
>> +  compatible:
>> +    const: sony,imx300
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
> 
> Please add assigned clock related properties; see
> Documentation/driver-api/media/camera-sensor.rst .
> 
Will do!

>> +
>> +  vdig-supply:
>> +    description:
>> +      Digital I/O voltage supply, 1.15-1.20 volts
>> +
>> +  vana-supply:
>> +    description:
>> +      Analog voltage supply, 2.2 volts
>> +
>> +  vddl-supply:
>> +    description:
>> +      Digital core voltage supply, 1.8 volts
>> +
>> +  reset-gpios:
>> +    description: |-
>> +      Reference to the GPIO connected to the xclr pin, if any.
>> +      Must be released (set high) after all supplies are applied.
>> +
>> +  # See ../video-interfaces.txt for more details
>> +  port:
>> +    type: object
>> +    properties:
>> +      endpoint:
>> +        type: object
>> +
>> +        properties:
>> +          data-lanes:
>> +            description: |-
>> +              The driver only supports four-lane operation.
> 
> This can be removed as bindings describe hardware, not driver operation.
> 
Ack.

>> +            items:
>> +              - const: 0
>> +              - const: 1
>> +              - const: 2
>> +              - const: 3
> 
> Two lanes here, too?
> 

The driver only supports four-lane operation.
I am 100% sure that this sensor can also work with two lanes, but it 
needs special configuration which I'm not able to produce, nor test.

As you may imagine (and as you can read in the driver itself), all of 
this was reverse-engineering work, as Sony has never released any 
datasheet for this sensor - and I have a hunch - they never will (but 
that's another story).

>> +
>> +          clock-noncontinuous: true
>> +
>> +          link-frequencies:
>> +            $ref: /schemas/types.yaml#/definitions/uint64-array
>> +            description:
>> +              Allowed data bus frequencies. The driver currently needs
>> +              to switch between 780000000 and 480000000 Hz in order to
>> +              guarantee functionality of all modes.
> 
> You can omit this description, too.
> 

The intention here was to be clear and provide as much information as I 
could gather during the very time-consuming reverse engineering process 
that took place in the making of this driver.

But okay, I will remove this.

>> +
>> +        required:
>> +          - data-lanes
>> +          - link-frequencies
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - vana-supply
>> +  - vdig-supply
>> +  - vddl-supply
> 
> Are the regulators really required? I'm not quite sure about the
> established practices; still the common case is that one or two of these
> are hard-wired.
> 

On all the Sony phones that I have (....many), with MSM8956, MSM8996, 
SDM630, equipped with the IMX300 camera assy, none of these three are 
hard-wired: sometimes they're wired to the LDOs of the PMIC, sometimes 
they're wired to fixed LDOs, enabled through GPIOs (fixed-regulator 
binding in this case).

So.. yeah, they're really required.

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
>> +        imx300: sensor@10 {
>> +            compatible = "sony,imx300";
>> +            reg = <0x10>;
>> +            clocks = <&imx300_xclk>;
>> +            vana-supply = <&imx300_vana>;   /* 2.2v */
>> +            vdig-supply = <&imx300_vdig>;   /* 1.2v */
>> +            vddl-supply = <&imx300_vddl>;   /* 1.8v */
>> +
>> +            port {
>> +                imx300_0: endpoint {
>> +                    remote-endpoint = <&csi1_ep>;
>> +                    data-lanes = <0 1 2 3>;
>> +                    clock-noncontinuous;
>> +                    link-frequencies = /bits/ 64 <780000000 480000000>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ad9abb42f852..5e0f08f48d48 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16633,6 +16633,13 @@ T:	git git://linuxtv.org/media_tree.git
>>   F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
>>   F:	drivers/media/i2c/imx290.c
>>   
>> +SONY IMX300 SENSOR DRIVER
>> +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> +L:	linux-media@vger.kernel.org
> 
> Please also add the git tree.
> 
> Ideally also the MAINTAINERS change comes with the first patch adding the
> files, which should be the DT bindings. I.e. just reverse the order of the
> patches.
> 

I haven't added it because last time I did that I got reviews saying 
that if I'm not the owner of the git tree I shall not put it in.
Though, if that's a requirement for media, then I didn't know that...

>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
>> +F:	drivers/media/i2c/imx300.c
>> +
>>   SONY IMX319 SENSOR DRIVER
>>   M:	Bingbu Cao <bingbu.cao@intel.com>
>>   L:	linux-media@vger.kernel.org
> 

Thank you for your review!

Yours,
- Angelo
