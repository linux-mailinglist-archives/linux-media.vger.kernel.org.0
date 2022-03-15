Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC7FF4D9BAD
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 13:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348514AbiCOM6s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 08:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234583AbiCOM6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 08:58:47 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F954E3AD
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 05:57:35 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1C4733F312
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647349048;
        bh=ZmEsikfdsWRUTDBBo8iNgPk0jqSvQopIldifeg/PRlw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=FNPiVyh3O+XQCpRTIjA6ayv4mYce/3GvByYRfs8uGIPCVJomJeGyEB5h0FrshrsI2
         pFENmLyzDYh56Z/eOey4/LLFdL7DyDIfGCEyEVMz16MZ1EGRoqVljKR0ZLbQCOXr8c
         8xtqlwzf2Se8+LCGulmqlZalcaZSFA3imMvedNwIWC+HGJbSV+f73sR1/HmiSjELGD
         1T0kutxC/jLWdOXbmgVdAeGkj3xGguCFpx75yUgX2bFPBvHbI4tPOw+32XP41rE5FL
         19g9NGfEAkMhiwi5O8Pplt0aroNfcHJvAFmUqBREnQGblLAoEFGZsHlQyj6WNQkHMd
         RV+TPqKclSIxg==
Received: by mail-ej1-f72.google.com with SMTP id l24-20020a170906a41800b006da873d66b6so9565500ejz.3
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 05:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZmEsikfdsWRUTDBBo8iNgPk0jqSvQopIldifeg/PRlw=;
        b=MPv8lKOJeaRamS32YTbQZinGEf5lkEcGSkZ1ey3eidV1T0O4GYc+WF9EA/SYpUH8hK
         ZbxWlcgAM3fJWhsJPTTj/tqx22w2blg0Ei4oAmzdXouj/CE6J0ytblApC9x0ozT4aKYE
         myAT6w8o9wkgoWWTZ4Mt+0096C3RhN6Tep9263uEXYo+5NE+zk5Q3vekdFaK9i5BPaKh
         EkNUra7tHnNIOnMJyazNBJqg50YNyWVWBTkU+pRoWUO4sJ3inWGN6ZoNs1x8btwq0/Dr
         0a3sSCH0vgHPiOlXumZtf9Zl9Lw1GHXX9+Pq+0H8Up1SDXv/WAR3WBEPTESj+KcORm16
         M6FQ==
X-Gm-Message-State: AOAM533LJwDOdj+yGuab4t6MY6GHIXWdeaJNdSNl5J7feCdddyddXSiB
        hIJ3rp2BJW9FvzZSw5XatzevjNGwKh8YO5JJKUZaf/l4iZICjI8cBaLgUYaCZETlfn24L3QGwW0
        yrJ8UWNeSC10MWqh+1ydFzJr64JC9zzvQhnXd7bdx
X-Received: by 2002:a05:6402:79a:b0:415:fb66:fb5e with SMTP id d26-20020a056402079a00b00415fb66fb5emr25425635edy.386.1647349047642;
        Tue, 15 Mar 2022 05:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO0jHkkkaAiXWHQCZ8sizpidbwLoREsrwbrGvP6LqJqmoGHYgqLzgBGVK8s6H5TPlv3UeAVA==
X-Received: by 2002:a05:6402:79a:b0:415:fb66:fb5e with SMTP id d26-20020a056402079a00b00415fb66fb5emr25425616edy.386.1647349047426;
        Tue, 15 Mar 2022 05:57:27 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id d4-20020a056402000400b00412d60fee38sm9616483edu.11.2022.03.15.05.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 05:57:26 -0700 (PDT)
Message-ID: <57bdd2d9-27ea-22f4-3650-503fb0cf920c@canonical.com>
Date:   Tue, 15 Mar 2022 13:57:26 +0100
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
 <58745ae2-40be-65f6-bea6-f62d8935719f@canonical.com>
 <YjCK75F7Xmiy8nGF@valkosipuli.retiisi.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YjCK75F7Xmiy8nGF@valkosipuli.retiisi.eu>
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

On 15/03/2022 13:47, Sakari Ailus wrote:
> On Tue, Mar 15, 2022 at 09:03:41AM +0100, Krzysztof Kozlowski wrote:
>> On 15/03/2022 08:59, Sakari Ailus wrote:
>>> Hi Krzysztof, Jacopo,
>>>
>>> On Tue, Mar 15, 2022 at 08:32:58AM +0100, Krzysztof Kozlowski wrote:
>>>> On 14/03/2022 17:27, Jacopo Mondi wrote:
>>>>> Provide the bindings documentation for Omnivision OV5670 image sensor.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>>>
>>>>> ---
>>>>> v1->v2 (comments from Krzysztof)
>>>>>
>>>>> - Rename to include manufacturer name
>>>>> - Add entry to MAINTAINERS
>>>>> - Add maxItems: to -gpios properties
>>>>> - Use common clock properties
>>>>> - Use enum: [1, 2] for data lanes
>>>>> - Fix whitespace issue in example
>>>>> ---
>>>>>
>>>>>  .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
>>>>>  MAINTAINERS                                   |  1 +
>>>>>  2 files changed, 100 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..73cf72203f17
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>>>>> @@ -0,0 +1,99 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Omnivision OV5670 5 Megapixels raw image sensor
>>>>> +
>>>>> +maintainers:
>>>>> +  - Jacopo Mondi <jacopo@jmondi.org>
>>>>> +
>>>>> +description: |-
>>>>> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
>>>>> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
>>>>> +  controlled through an I2C compatible control bus.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: ovti,ov5670
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  assigned-clocks: true
>>>>> +  assigned-clock-parents: true
>>>>> +  assigned-clock-rates: true
>>>>
>>>> You should not need these. These are coming with schema. You can add
>>>> these to example schema below and double-check.
>>>
>>> They should probably be required actually.
>>
>> Why required? The hardware can work with different clocks, get their
>> rate and configure internal PLLs/clocks to new value. Having it required
>> might have sense for current implementation of driver but this is
>> independent of bindings. Bindings do not describe driver, but hardware.
> 
> We've had this discussion before and the result of that was this (see
> "Handling clocks"):
> 
> Documentation/driver-api/media/camera-sensor.rst

... and the "Devicetree" chapter explains usage of assigned-clock-xxx.
None of these explain why it should be in the bindings. The chapter you
referred explicitly mentions that "clock tree is generally configured by
the driver", so it has nothing to do with the bindings.

Bindings describe hardware, not Linux driver implementation. The
hardware can work with multiple frequencies and can support changing
these frequencies, probably combined with some reset sequence. Therefore
hardware does not require the clock frequency to be always fixed and
defined.

Driver requires assigned-clock-xxx, not bindings. Do not put Linux
implementation specifics into the bindings.

Best regards,
Krzysztof
