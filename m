Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAD45ECC57
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 20:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbiI0SpW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 14:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiI0SpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 14:45:08 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073211198C6;
        Tue, 27 Sep 2022 11:45:04 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1565084CD8;
        Tue, 27 Sep 2022 20:45:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664304302;
        bh=ka3NsRltkkHta8t7Kq5OpOzzXbX77BDgOPR64qFF8do=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=V5RHxNpPERIxlsCaqL4z1/+94HXn7MzrEGNNKDqqlyPl8h0MJxZTmH4CHmZNJVQMP
         WripzQaHvwwdRH8fYkG8316AQHIFas6RuyAYx4Y88DPtRWuMDXrNztai/GPmn5HvQG
         IiOuRbizxHtf9dX32qzPzU8e0ovDot1wf0JDc8+EPv/CusloAqhTmTdOmOHtqVNL1X
         ytfnAKfvtjjDhpn6OQXkp5N4+4TQi6AaA3eib2ple4bLTJ1BKBnn6/lxwlWaspNmqs
         u7vk+/PQEnAH5/eao7s3mqeK2EvwiT61zeLj+mCPYcUXOgtwzv3VRfzvys3OeMnyxs
         8YzGWYYXtAyCg==
Message-ID: <162ea4dd-ded9-2905-0e4b-71809c95fd78@denx.de>
Date:   Tue, 27 Sep 2022 20:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: media: st,stmipid02: Convert the text
 bindings to YAML
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20220927005538.690997-1-marex@denx.de>
 <7420b97c-1421-03a5-dd47-044b5e1739f1@foss.st.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <7420b97c-1421-03a5-dd47-044b5e1739f1@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/27/22 13:06, Benjamin MUGNIER wrote:
> Hi Marek,

Hi,

> Thank you for your patch.

Thank you for the review.

[...]

>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>> @@ -0,0 +1,175 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/st,st-mipid02.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge
>> +
>> +maintainers:
>> +  - Mickael Guene <mickael.guene@foss.st.com>
> 
> As Mickael is not the maintainer of the driver anymore, there should be both current maintainers instead, as listed in the MAINTAINER file:
>   - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>   - Sylvain Petinot <sylvain.petinot@foss.st.com>
> Can you change it while at it ? Thank you.

Done and done, I also dropped myself from the list, which I hope is OK.

> By the way you will also need to update the MAINTAINERS file to change the st,st-mipid02.txt file to st,st-mipid02.yaml here:
>    F:      Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt

[...]

>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: Output port
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              bus-width:
>> +                enum: [8, 10, 12, 14]
> 
> Shouldn't this be [6, 8, 10, 12] as in the original file ?

They are both wrong, per:

https://www.st.com/resource/en/datasheet/stmipid02.pdf
page 5
Table 1. Image format vs. number of bits on output interface
row 2
RAW7 RAW7 7 bits

So this should be
[6, 7, 8, 10, 12]

>> +                default: 8
> 
> As far as I understand there is no 'default' as this property is required anyway.

Dropped.

>> +              hsync-active: true
>> +              vsync-active: true
>> +
>> +            required:
>> +              - bus-width
>> +
>> +    required:
>> +      - port@0
> 
> Actually it could either be port0 or port1, but not both at the same time, see the 'description' part.
> I'm not sure how to describe it in device tree binding though.

I think the requirement here is to have at least one of port@0 or port@1 
described in DT. Both port@0 and port@1 can also be described, i.e. you 
can have FRONT and BACK sensor like on a contemporary smartphone, you 
just cannot start streaming from both sensors at the same time, which is 
a software policy and should be handled by the driver.

See:
https://www.st.com/resource/en/datasheet/stmipid02.pdf
page 3
2 Application diagrams
Figure 2. MIPI CSI-2 application diagram

Per suggestion from Rob, I think this should be

allOf:
   - require:
       - port@0
   - require:
       - port@1
require:
   - port@2

>> +      - port@2
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> I noticed this was missing in the original txt file. Thanks for taking care of it.

Sure. I'm glad to see dtbs_check passing on the stm32mp15xx boards, 
largely thanks to ST doing good job keeping the upstream support in good 
shape.
