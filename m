Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7C8462F2AC
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 11:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241372AbiKRKeY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 05:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241281AbiKRKeK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 05:34:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05902922C5;
        Fri, 18 Nov 2022 02:34:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 95DAF6240E;
        Fri, 18 Nov 2022 10:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1979EC433C1;
        Fri, 18 Nov 2022 10:34:06 +0000 (UTC)
Message-ID: <3d7ab1ba-bc9e-4385-8ca8-73d062b383a3@xs4all.nl>
Date:   Fri, 18 Nov 2022 11:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v4 3/5] dt-bindings: media: add cat24c208 bindings
To:     Rob Herring <robh@kernel.org>,
        Erling Ljunggren <hljunggr@cisco.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20221111132906.2212662-1-hljunggr@cisco.com>
 <20221111132906.2212662-4-hljunggr@cisco.com>
 <20221116200729.GA761467-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20221116200729.GA761467-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/16/22 21:07, Rob Herring wrote:
> On Fri, Nov 11, 2022 at 02:29:04PM +0100, Erling Ljunggren wrote:
>> Add devicetree bindings for new cat24c208 EDID EEPROM driver.
>>
>> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
>> ---
>>  .../bindings/media/i2c/onnn,cat24c208.yaml    | 46 +++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
>> new file mode 100644
>> index 000000000000..492eecb3ab7c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/onnn,cat24c208.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ON Semiconductor CAT24C208 EDID EEPROM driver
>> +
>> +maintainers:
>> +  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> +
>> +description: |
>> +  CAT24C208 is a dual port i2c EEPROM designed for EDID storage.
>> +
>> +properties:
>> +  compatible:
>> +    const: onnn,cat24c208
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  input-connector:
>> +    description: |
>> +      Phandle to the video input connector, used to find
>> +      the HPD gpio and the connector label, both optional.
>> +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> The binding and driver feel the wrong way around to me. It seems 
> like you should have a driver for the connector and it needs HPD GPIO, 
> label, and EEPROM. The driver instead looks mostly like an EEPROM driver 
> that hooks into a few connector properties.

A device like this is typically used next to an HDMI receiver: the DDC
lines and the HPD line are connected to the EDID EEPROM, and the video
is handled by the HDMI receiver.

Most HDMI receivers will have the EDID part integrated into the chip itself
(see e.g. the adv7604 driver), but that doesn't have to be the case. The EDID
can be completely separate, it doesn't matter for the receiver part.

In our specific use-case there isn't even an HDMI receiver since the HDMI
video is passed through and this EDID EEPROM is used to help debug HDMI
issues by presenting custom EDIDs, similar to something like this:

https://www.amazon.com/dp/B0722NVQHX

The HPD line is controlled by the EDID part since it has to be low if there
is no EDID or pulled low for at least 100ms if the EDID is being modified.

> 
> Reading the datasheet, I don't see anything special about accessing the 
> EEPROM from the host (DSP) side. Wouldn't the default at24 driver work? 
> It exposes regmap and nvmem.

No. It is not a regular EEPROM, it is dedicated to store EDIDs. It has to
correctly toggle the HPD line and inform other drivers (specifically HDMI CEC)
of EDID updates.

I don't see how the at24 could work: besides the eeprom i2c address it has to
deal with two additional i2c devices: the segment address and the config
address of the device itself. Writing to the eeprom from the host side requires
a write to the segment address followed by a write to the eeprom part itself,
and that's not something the at24 can do. And it is also something very specific
to the VESA E-DDC standard (freely downloadable from vesa.org).

Note that historically the first EDID EEPROMs most likely did work like the
at24, but as EDID sizes grew beyond 256 bytes the E-DDC standard was created
and that departed from the normal EEPROMs.

Regards,

	Hans

> 
> Rob

