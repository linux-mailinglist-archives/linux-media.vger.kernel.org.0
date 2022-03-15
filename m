Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3CE94D95DE
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 09:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237559AbiCOIE5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 04:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiCOIE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 04:04:56 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851DC35DF7
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 01:03:44 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3054E444D4
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647331423;
        bh=d9bnMIwj06MZkAjXIIEqTOjD8Cj3Hx30OJrDCBFZJTg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=fRPYig1QaYQ/v8+rssaeQ8Vrk67xXLEydFNk6IoEiJeAcxtXji472fsLa842WxS6z
         JqupEZPZm9euxDmJu3531DqLS/zfErXkUndtVgqEts/trh0skox1j0mWLL5lpBcLoj
         vaxjZ8w6TsIIUFxIko4W5rTibz8X8LpRciDoaH898a1v5cK9jy5CuwrbO55ymfWRHT
         4IBDYOmDgmjSG+97NbGBKZEUc2HGFUN0wues91av1PRVrG0TF6dp2GDn5VhVmTYvJt
         8RsE8w7cRxcp1P4EBskKPi1RKlHKEpbXEjGjl99x6btAlj3eQQtAOF84djpGRshf8N
         1cExUTUehlsfg==
Received: by mail-ej1-f70.google.com with SMTP id el10-20020a170907284a00b006db9df1f3bbso5814319ejc.5
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 01:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d9bnMIwj06MZkAjXIIEqTOjD8Cj3Hx30OJrDCBFZJTg=;
        b=z03C+FLv5kQEU8dUx3zBdKLWLlmtBM86Oj7stoxJ3t+M2k45pELFFWPeF2xMp6bhi0
         InMwMBiQI5K8XrCfoMklOoKFsv/D70Ba88wWtPuDM1/2L9eXNPiBr/sdy9RDd66vxNYd
         j/8pXgI+mFhxEQ8bMco12HAvTb+kikU5lDXyy/SwCSYzXO017b4chk+Gt1FRv6y+s26A
         t+++G2ptb7XynSUQsF5XvBKlRp5Fd4aFItzJ50ACMcrxpnF4ULvFC92vZ1mHtZsmhNRk
         xDEVhpRxT9d3AZV6QULK0qMlRP/Ip6y4cYh1R86tmcgYc+7GqjK/mHqZPYpaTA0V505a
         osxQ==
X-Gm-Message-State: AOAM530LHI7/bUn897/z/K5mwFEqf87CsSRcp5Te8Not7HJ8I3xfG2yf
        q70lek42lPOzumWaytjDs8bXSuTOyVw1Wo+kmD5ej3QY6LGzWp1VjcJFPSCOVq5WKV/jf5VffF3
        AGnx+mdCObBciuRrUg2q71l6qo+gQeOepgg/6dg3j
X-Received: by 2002:a17:907:1c91:b0:6d7:b83:cddb with SMTP id nb17-20020a1709071c9100b006d70b83cddbmr20781250ejc.739.1647331422819;
        Tue, 15 Mar 2022 01:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1yiVdpjZS7COdlPwtRbD6V9gb8NMYIZdHy0ALSWx8C/jdjlv7t2nRcSF890AMEPVTGTDuZw==
X-Received: by 2002:a17:907:1c91:b0:6d7:b83:cddb with SMTP id nb17-20020a1709071c9100b006d70b83cddbmr20781227ejc.739.1647331422530;
        Tue, 15 Mar 2022 01:03:42 -0700 (PDT)
Received: from [192.168.0.153] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id l2-20020aa7cac2000000b003f9b3ac68d6sm9197736edt.15.2022.03.15.01.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 01:03:41 -0700 (PDT)
Message-ID: <58745ae2-40be-65f6-bea6-f62d8935719f@canonical.com>
Date:   Tue, 15 Mar 2022 09:03:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/8] media: dt-bindings: i2c: Document ov5670
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-2-jacopo@jmondi.org>
 <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
 <YjBHVY/clnMUlNFj@valkosipuli.retiisi.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YjBHVY/clnMUlNFj@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2022 08:59, Sakari Ailus wrote:
> Hi Krzysztof, Jacopo,
> 
> On Tue, Mar 15, 2022 at 08:32:58AM +0100, Krzysztof Kozlowski wrote:
>> On 14/03/2022 17:27, Jacopo Mondi wrote:
>>> Provide the bindings documentation for Omnivision OV5670 image sensor.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>
>>> ---
>>> v1->v2 (comments from Krzysztof)
>>>
>>> - Rename to include manufacturer name
>>> - Add entry to MAINTAINERS
>>> - Add maxItems: to -gpios properties
>>> - Use common clock properties
>>> - Use enum: [1, 2] for data lanes
>>> - Fix whitespace issue in example
>>> ---
>>>
>>>  .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
>>>  MAINTAINERS                                   |  1 +
>>>  2 files changed, 100 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>>> new file mode 100644
>>> index 000000000000..73cf72203f17
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>>> @@ -0,0 +1,99 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Omnivision OV5670 5 Megapixels raw image sensor
>>> +
>>> +maintainers:
>>> +  - Jacopo Mondi <jacopo@jmondi.org>
>>> +
>>> +description: |-
>>> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
>>> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
>>> +  controlled through an I2C compatible control bus.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ovti,ov5670
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  assigned-clocks: true
>>> +  assigned-clock-parents: true
>>> +  assigned-clock-rates: true
>>
>> You should not need these. These are coming with schema. You can add
>> these to example schema below and double-check.
> 
> They should probably be required actually.

Why required? The hardware can work with different clocks, get their
rate and configure internal PLLs/clocks to new value. Having it required
might have sense for current implementation of driver but this is
independent of bindings. Bindings do not describe driver, but hardware.

>>
>>> +
>>> +  clocks:
>>> +    description: System clock. From 6 to 27 MHz.
>>> +    maxItems: 1
>>> +
>>> +  pwdn-gpios:
>>> +    description: Reference to the GPIO connected to the PWDNB pin. Active low.
>>
>> This does not look like a standard property, so you need a vendor prefix.
> 
> The similarly named property exists elsewhere. I wouldn't use a vendor
> prefix, also for the reason that the functionality is quite common. I guess
> alternative name would be possible, too --- "shutdown" seems to be more
> common.

It exists in three bindings, so it is not a standard property...
although something closer to standard is "powerdown-gpios" so maybe just
use that one?

Best regards,
Krzysztof
