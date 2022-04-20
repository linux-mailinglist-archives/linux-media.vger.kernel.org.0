Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CFC5088B5
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 15:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378730AbiDTNEV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 09:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378733AbiDTNEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 09:04:13 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CC113E1E
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 06:01:27 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23KAouwU015687;
        Wed, 20 Apr 2022 15:01:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CciNi1bjQP2QAY+vmwPre4BLDlihJ6Cw7uAID6HTymQ=;
 b=6tZFgL9ta6e1w3qWaaQGV6GHxIL8mN8xN/Jlsoy9F3Uu2uat5c6wLVqwqBdrqTm6Gu67
 FS2EdE2RQN8UXXVBs6RO7FFHjnwgSj77G7PtEmTsoz4V2hmIakIrdTP9nQ0xATwgxyt7
 2U6SOhHYp9JYJ704zdfnyyiCKp+8thG3nPi8zyF3Q1UOvxNzfJH8uAi5W1i8eqqLAA+L
 48X7RXvD0jt73uxJv5Zxif9adBMDz1nPqer0BNLaAKhA3jr/s7W+i0rBrhLCISzgyvlF
 IG/6qEA681gLHh2kixvV9+GDmoqD80KpAUuOwgUBT5N0szKzTPlevQz7RLjuvgmBdSBN Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqdw9ft-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Apr 2022 15:01:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0AA1E10002A;
        Wed, 20 Apr 2022 15:01:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02BFB20FC96;
        Wed, 20 Apr 2022 15:01:22 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.50) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 20 Apr 2022 15:01:21
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v2 4/5] media: dt-bindings: media: i2c: Add ST VGXY61
 camera sensor binding
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>, <sakari.ailus@linux.intel.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-5-benjamin.mugnier@foss.st.com>
 <YlmIZgabGuSjrBfR@pendragon.ideasonboard.com>
Message-ID: <f3933776-70c1-8185-6b27-f3feb17bfe57@foss.st.com>
Date:   Wed, 20 Apr 2022 15:01:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YlmIZgabGuSjrBfR@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_03,2022-04-20_01,2022-02-23_01
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for your review.

On 15/04/2022 16:59, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> Thank you for the patch.
> 
> On Fri, Apr 15, 2022 at 01:18:44PM +0200, Benjamin Mugnier wrote:
>> Add device tree binding for the ST VGXY61 camera sensor, and update
>> MAINTAINERS file.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  .../bindings/media/i2c/st,st-vgxy61.yaml      | 125 ++++++++++++++++++
>>  MAINTAINERS                                   |   9 ++
>>  2 files changed, 134 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>> new file mode 100644
>> index 000000000000..24bff161a661
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>> @@ -0,0 +1,125 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright (c) 2022 STMicroelectronics SA.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/st,st-vgxy61.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics VGxy61 HDR Global Shutter Sensor Family Device Tree Bindings
>> +
>> +maintainers:
>> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
>> +
>> +description: |-
>> +  STMicroelectronics VGxy61 family has a CSI-2 output port. CSI-2 output is a
>> +  quad lanes 800Mbps per lane.
>> +  Supported formats are RAW8, RAW10, RAW12, RAW14 and RAW16.
>> +  Following part number are supported
>> +  - VG5661 and VG6661 are 1.6 Mpx (1464 x 1104) monochrome and color sensors.
>> +  Maximum frame rate is 75 fps.
>> +  - VG5761 and VG6761 are 2.3 Mpx (1944 x 1204) monochrome and color sensors.
>> +  Maximum frame rate is 60 fps.
>> +
>> +properties:
>> +  compatible:
>> +    const: st,st-vgxy61
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    description:
>> +      Input clock for the sensor.
>> +    items:
>> +      - const: xclk
> 
> If there's a single clock you can drop the clock name.
> 

Indeed, I forgot to remove it while refactoring. Thanks.

>> +
>> +  VCORE-supply:
>> +    description:
>> +      Sensor digital core supply. Must be 1.2 volts.
>> +
>> +  VDDIO-supply:
>> +    description:
>> +      Sensor digital IO supply. Must be 1.8 volts.
>> +
>> +  VANA-supply:
>> +    description:
>> +      Sensor analog supply. Must be 2.8 volts.
>> +
>> +  reset-gpios:
>> +    description:
>> +      Reference to the GPIO connected to the reset pin, if any.
>> +      This is an active low signal to the vgxy61.
>> +
>> +  invert-gpios-polarity:
> 
> Vendor-specific properties should have a vendor prefix (e.g.
> st,inver-gpios-polarity).
> 
>> +    description:
>> +      If gpios polarity should be inversed
> 
> What is this though, what GPIOs does it invert ?
> 

This inverts every strobe GPIO polarity.
I will rename it to st,strobe-gpios-polarity, so that it better reflects what it truly is, and add a better comment than the current one.
I also renamed slave-mode to st,slave-mode as afaik this is specific to this sensor.

>> +    type: boolean
>> +
>> +  slave-mode:
>> +    description:
>> +      If the sensor operates in slave mode
>> +    type: boolean
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            description:
>> +              CSI lanes to use
>> +            items:
>> +              - const: 1
>> +              - const: 2
>> +              - const: 3
>> +              - const: 4
>> +
>> +          remote-endpoint: true
>> +
>> +        required:
>> +          - clock-lane
>> +          - data-lanes
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +  - VCORE-supply
>> +  - VDDIO-supply
>> +  - VANA-supply
> 
> The port property should be required too.
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        vgxy61: csi2tx@10 {
>> +            compatible = "st,st-vgxy61";
>> +            reg = <0x10>;
>> +            status = "okay";
> 
> That's the default, it's not needed in DT examples.
> 
>> +            clocks = <&clk_ext_camera>;
> 
> There's no clock-names. Have you run DT bindings validation ? It should
> have reported an error.
> 

I ran again the dt binding validation and it does pop an error. I must have missed it. Sorry about that.

>> +            VCORE-supply = <&v1v2>;
>> +            VDDIO-supply = <&v1v8>;
>> +            VANA-supply = <&v2v8>;
>> +            reset-gpios = <&mfxgpio 18 GPIO_ACTIVE_LOW>;
>> +            port {
>> +                ep0: endpoint {
>> +                    data-lanes = <1 2 3 4>;
>> +                    remote-endpoint = <&mipi_csi2_out>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fd768d43e048..6233e073da30 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18664,6 +18664,15 @@ S:	Maintained
>>  F:	Documentation/hwmon/stpddc60.rst
>>  F:	drivers/hwmon/pmbus/stpddc60.c
>>  
>> +ST VGXY61 DRIVER
>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +T:	git git://linuxtv.org/media_tree.git
>> +F:	Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.txt
>> +F:	drivers/media/i2c/st-vgxy61.c
>> +
>>  ST VL53L0X ToF RANGER(I2C) IIO DRIVER
>>  M:	Song Qiang <songqiang1304521@gmail.com>
>>  L:	linux-iio@vger.kernel.org
> 
