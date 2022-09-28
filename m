Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA285ED71E
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 10:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbiI1IIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 04:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbiI1IIe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 04:08:34 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0BAE5FAA;
        Wed, 28 Sep 2022 01:08:32 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S7uYfm005840;
        Wed, 28 Sep 2022 10:08:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=810+0FE9DNFXHQHWMAgaBjT8j/31fvRA+j6/O3FTPQo=;
 b=JFEN1l62NQpWgKDSKorwFlI1srFrpngQ4n1oFmWdMsL0T5QJ6olJSGz6CHCPQMwjX6Eu
 p1M6F7DsxpRFYq7BXwX2dCkS/DcODwVmSrYHUk57mTwKzYEa8KZXTPgNGOgTi6Ovr67h
 FFAOyDUw2C6I0h52d4spMuWgjDcve4WpYNwtSP94CBxP+ST0R9VhPQAmr3D9/vz5xoSf
 Ni2k2XXjXqiIaeAwDOpYV5R+mvRKAe6LJwGRSEu+7m9VZIW/QIjYdUCR5uuHqIg55PO1
 Epbvy2S2bMNPLU2UJo8dhIPwFwMqZvSBwYl6ih8nIljoMdM4jphvr6YuLFBZ4QKtoUFf Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjqjrw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 10:08:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E6EB10002A;
        Wed, 28 Sep 2022 10:08:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31BB5214D19;
        Wed, 28 Sep 2022 10:08:07 +0200 (CEST)
Received: from [10.252.26.214] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 28 Sep
 2022 10:08:06 +0200
Message-ID: <04cd498e-608d-e1dd-377a-18e27dee23be@foss.st.com>
Date:   Wed, 28 Sep 2022 10:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: media: st,stmipid02: Convert the text
 bindings to YAML
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20220927005538.690997-1-marex@denx.de>
 <7420b97c-1421-03a5-dd47-044b5e1739f1@foss.st.com>
 <162ea4dd-ded9-2905-0e4b-71809c95fd78@denx.de>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <162ea4dd-ded9-2905-0e4b-71809c95fd78@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On 9/27/22 20:45, Marek Vasut wrote:
> On 9/27/22 13:06, Benjamin MUGNIER wrote:
>> Hi Marek,
> 
> Hi,
> 
>> Thank you for your patch.
> 
> Thank you for the review.
> 
> [...]
> 
>>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>>> @@ -0,0 +1,175 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/i2c/st,st-mipid02.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge
>>> +
>>> +maintainers:
>>> +  - Mickael Guene <mickael.guene@foss.st.com>
>>
>> As Mickael is not the maintainer of the driver anymore, there should be both current maintainers instead, as listed in the MAINTAINER file:
>>   - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>   - Sylvain Petinot <sylvain.petinot@foss.st.com>
>> Can you change it while at it ? Thank you.
> 
> Done and done, I also dropped myself from the list, which I hope is OK.
> 

No problem for dropping yourself, out of curiosity why so ?

>> By the way you will also need to update the MAINTAINERS file to change the st,st-mipid02.txt file to st,st-mipid02.yaml here:
>>    F:      Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
> 
> [...]
> 
>>> +      port@2:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description: Output port
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              bus-width:
>>> +                enum: [8, 10, 12, 14]
>>
>> Shouldn't this be [6, 8, 10, 12] as in the original file ?
> 
> They are both wrong, per:
> 
> https://www.st.com/resource/en/datasheet/stmipid02.pdf
> page 5
> Table 1. Image format vs. number of bits on output interface
> row 2
> RAW7 RAW7 7 bits
> 
> So this should be
> [6, 7, 8, 10, 12]
> 

Good catch. Thank you.

>>> +                default: 8
>>
>> As far as I understand there is no 'default' as this property is required anyway.
> 
> Dropped.
> 
>>> +              hsync-active: true
>>> +              vsync-active: true
>>> +
>>> +            required:
>>> +              - bus-width
>>> +
>>> +    required:
>>> +      - port@0
>>
>> Actually it could either be port0 or port1, but not both at the same time, see the 'description' part.
>> I'm not sure how to describe it in device tree binding though.
> 
> I think the requirement here is to have at least one of port@0 or port@1 described in DT. Both port@0 and port@1 can also be described, i.e. you can have FRONT and BACK sensor like on a contemporary smartphone, you just cannot start streaming from both sensors at the same time, which is a software policy and should be handled by the driver.

Definitely, the device tree should describe connected ports. This is the software's responsibility to not stream from both.
Rob's suggestion is perfect.


Regards,

Benjamin

> 
> See:
> https://www.st.com/resource/en/datasheet/stmipid02.pdf
> page 3
> 2 Application diagrams
> Figure 2. MIPI CSI-2 application diagram
> 
> Per suggestion from Rob, I think this should be
> 
> allOf:
>   - require:
>       - port@0
>   - require:
>       - port@1
> require:
>   - port@2
> 
>>> +      - port@2
>>> +
>>> +additionalProperties: false
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>
>> I noticed this was missing in the original txt file. Thanks for taking care of it.
> 
> Sure. I'm glad to see dtbs_check passing on the stm32mp15xx boards, largely thanks to ST doing good job keeping the upstream support in good shape.
