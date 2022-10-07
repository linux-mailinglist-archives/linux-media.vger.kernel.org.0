Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A893A5F77EF
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 14:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiJGM2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 08:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJGM2q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 08:28:46 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF32AE201
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 05:28:42 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297AmJwM023221;
        Fri, 7 Oct 2022 14:28:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=S8PQZ08FhBnECMk4czhkYKVNKkQFnSbAeEZayVIQmt0=;
 b=6zJLP6m95LUvEeEplNwFQhNepuF1HfsuXTHGRWrqr/IqciAk1G8UYn55QAqjXP4IvWD/
 9rN46endtq4JdpZVQlPVw0PUkeAAe4HkN12ZvfownJYZXlRvGM9+IBsOzSe9igJPQC1z
 AhJntnwvYg7gJw8A2/TWrWCeYqIA17SIpITIpJVax/lBsJq0/9zZWwlRwa3Rcl4HHsBX
 MUZNUfdtI8Y9zTusZS11J1iORQUPo6+K7WeZzeZZlGI3U0SLQ0aYLMpHUh9VeKqU0Fgp
 Ze+GIk/88gKitxSNZFxcUUMbsUp8rh7JhTwO8iKPJ4URIhaGjpgrXQMS0lARWuT5mRVc Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k2jp80fxx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Oct 2022 14:28:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A1E510002A;
        Fri,  7 Oct 2022 14:28:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A824229A88;
        Fri,  7 Oct 2022 14:28:23 +0200 (CEST)
Received: from [10.252.8.171] (10.75.127.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 7 Oct
 2022 14:28:22 +0200
Message-ID: <360fb05a-1e7b-0585-c43e-63d55fc7d859@foss.st.com>
Date:   Fri, 7 Oct 2022 14:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 3/4] media: dt-bindings: media: i2c: Add ST VGXY61
 camera sensor binding
Content-Language: en-US
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>, <nicolas@ndufresne.ca>,
        <hverkuil@xs4all.nl>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-4-benjamin.mugnier@foss.st.com>
 <Yz8pPJgqt9pcfSbp@paasikivi.fi.intel.com>
 <6d481061-4ee0-0df2-e86a-d86ae06600f0@foss.st.com>
In-Reply-To: <6d481061-4ee0-0df2-e86a-d86ae06600f0@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Actually please ignore my previous answer.

I just answered in the driver thread this is for gpio strobing and not sensor synchronization. Sorry, even I got confused.
I will rename it as this is, indeed, very misleading ;)

On 10/7/22 13:57, Benjamin MUGNIER wrote:
> Hi Sakari,
> 
> Thank you for your review.
> 
> On 10/6/22 21:15, Sakari Ailus wrote:
>> Hi Benjamin,
>>
>> On Tue, Sep 27, 2022 at 10:37:01AM +0200, Benjamin Mugnier wrote:
>>> Add device tree binding for the ST VGXY61 camera sensor, and update
>>> MAINTAINERS file.
>>>
>>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>> ---
>>>  .../bindings/media/i2c/st,st-vgxy61.yaml      | 112 ++++++++++++++++++
>>>  MAINTAINERS                                   |   9 ++
>>>  2 files changed, 121 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>> new file mode 100644
>>> index 000000000000..652170367675
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>> @@ -0,0 +1,112 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +# Copyright (c) 2022 STMicroelectronics SA.
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/i2c/st,st-vgxy61.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: STMicroelectronics VGxy61 HDR Global Shutter Sensor Family Device Tree Bindings
>>> +
>>> +maintainers:
>>> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
>>> +
>>> +description: |-
>>> +  STMicroelectronics VGxy61 family has a CSI-2 output port. CSI-2 output is a
>>> +  quad lanes 800Mbps per lane.
>>> +  Supported formats are RAW8, RAW10, RAW12, RAW14 and RAW16.
>>> +  Following part number are supported
>>> +  - VG5661 and VG6661 are 1.6 Mpx (1464 x 1104) monochrome and color sensors.
>>> +  Maximum frame rate is 75 fps.
>>> +  - VG5761 and VG6761 are 2.3 Mpx (1944 x 1204) monochrome and color sensors.
>>> +  Maximum frame rate is 60 fps.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: st,st-vgxy61
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  VCORE-supply:
>>> +    description:
>>> +      Sensor digital core supply. Must be 1.2 volts.
>>> +
>>> +  VDDIO-supply:
>>> +    description:
>>> +      Sensor digital IO supply. Must be 1.8 volts.
>>> +
>>> +  VANA-supply:
>>> +    description:
>>> +      Sensor analog supply. Must be 2.8 volts.
>>> +
>>> +  reset-gpios:
>>> +    description:
>>> +      Reference to the GPIO connected to the reset pin, if any.
>>> +      This is an active low signal to the vgxy61.
>>> +
>>> +  st,strobe-gpios-polarity:
>>> +    description:
>>> +      Invert polarity of strobe GPIOs.
>>> +    type: boolean
>>
>> This was probably intended to be left out of this version?
>>
> 
> Indeed, I forgot to update this file. Thanks a lot for double checking.
> 
> 
> Regards,
> 
> Benjamin
> 
>>> +
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      endpoint:
>>> +        $ref: /schemas/media/video-interfaces.yaml#
>>> +        unevaluatedProperties: false
>>> +
>>> +        properties:
>>> +          data-lanes:
>>> +            description:
>>> +              CSI lanes to use
>>> +            items:
>>> +              - const: 1
>>> +              - const: 2
>>> +              - const: 3
>>> +              - const: 4
>>> +
>>> +          remote-endpoint: true
>>> +
>>> +        required:
>>> +          - data-lanes
>>> +
>>> +required:
>>> +  - compatible
>>> +  - clocks
>>> +  - VCORE-supply
>>> +  - VDDIO-supply
>>> +  - VANA-supply
>>> +  - port
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        vgxy61: csi2tx@10 {
>>> +            compatible = "st,st-vgxy61";
>>> +            reg = <0x10>;
>>> +            clocks = <&clk_ext_camera>;
>>> +            VCORE-supply = <&v1v2>;
>>> +            VDDIO-supply = <&v1v8>;
>>> +            VANA-supply = <&v2v8>;
>>> +            reset-gpios = <&mfxgpio 18 GPIO_ACTIVE_LOW>;
>>> +            port {
>>> +                ep0: endpoint {
>>> +                    data-lanes = <1 2 3 4>;
>>> +                    remote-endpoint = <&mipi_csi2_out>;
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>> +...
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index a58f1fc6dd47..2e855bfdfeb7 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19278,6 +19278,15 @@ S:	Maintained
>>>  F:	Documentation/hwmon/stpddc60.rst
>>>  F:	drivers/hwmon/pmbus/stpddc60.c
>>>  
>>> +ST VGXY61 DRIVER
>>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>>> +L:	linux-media@vger.kernel.org
>>> +S:	Maintained
>>> +T:	git git://linuxtv.org/media_tree.git
>>> +F:	Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>>> +F:	drivers/media/i2c/st-vgxy61.c
>>> +
>>>  ST VL53L0X ToF RANGER(I2C) IIO DRIVER
>>>  M:	Song Qiang <songqiang1304521@gmail.com>
>>>  L:	linux-iio@vger.kernel.org
>>
