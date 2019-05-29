Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D28092DB78
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfE2LPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:15:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37867 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbfE2LPR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:15:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id h1so1478867wro.4;
        Wed, 29 May 2019 04:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c8dJjNMQIqzkPhYkiexN5X1LPngnjhkn9yQQSLO6V1U=;
        b=WeSY01XGJ55hU7iZou40dsO3y0IECQlbDjcUp/awt2FkknT4c2Jhr1qaqamRSDAtIr
         9sajzKMPwqnJNHIVX/9eY3W9ClmoaNhTmhfrT1UErosp3PP9S+a8aBDJmtXtdtZVr8jJ
         XDj11GSrxiaWNa66BOCp9IVgH/7XEeeYpabJNEvorxfm4O/LW7WfRh+43lSMl5oYTx0B
         3Z6n9gxggnsobfUkb8K13GXQhIbE2WCB41MaNpbMxt6XMFg0bJPPB6UBXkp2Mc7ocjtf
         aCiD0yO7Nb/8o0PijHqmKclKR8h2PgoRpRxdnGL2mF97MyPUmJIEPmvxazLb3yLBRiFb
         a/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c8dJjNMQIqzkPhYkiexN5X1LPngnjhkn9yQQSLO6V1U=;
        b=n3QNryW1vJcbxtHdfJzO2TYbC/K+A8uEMmBFMqRT9vaVODZUWgMyLMTPMal6B6mC8U
         k18dE7eAdbIUUIaXnUfRGJplO1GHmNL89hBc/KWSFJ3sHWze7a85kn5gcQHervdovswn
         pYFKf4fTCwJjStXD2HUp2i2CAFOyH4euh/iyMLR07qewv3kL0jM0mWYrY6BLK0teE+EP
         k0zYcIL04qsXt9nqZ1Rg3pbpmYSDQTZYylWP32+RZIWPuGzPXb+ptfU4XzInOQlANv0C
         gnTYPIA5IaQu6ABA+vHLJJPEPTc3JANORTSQ8T57EG2a1m9ttx3PHR9GpPK6hMBcfh7K
         xMiA==
X-Gm-Message-State: APjAAAVU9rh9+7SlvedgLl1/bB28yLpBIPyl2Vtv3tu6IdQP5MYFTFNq
        nlLMZFTWgMpS7TBXTQ7OluY/LR4F
X-Google-Smtp-Source: APXvYqxlhCRkMEdPlPbdLa6bmtevqdX9lPTScA9XyQQ9jQn/uSJcNPzi3ObAZFzs8UPiDZHUme021A==
X-Received: by 2002:adf:e711:: with SMTP id c17mr44223727wrm.227.1559128514615;
        Wed, 29 May 2019 04:15:14 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:1c64:3600:ef32:9810:b6a2:ebe? ([2a00:23c4:1c64:3600:ef32:9810:b6a2:ebe])
        by smtp.googlemail.com with ESMTPSA id f10sm32739528wrg.24.2019.05.29.04.15.13
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 04:15:13 -0700 (PDT)
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
To:     Marek Vasut <marex@denx.de>, Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20190520201812.7937-1-marex@denx.de>
 <20190528114758.a4oac3zgdy7dkx7k@uno.localdomain>
 <6cd36678-2a2c-2a43-e245-4263c0e0f666@denx.de>
 <20190528151036.nxsh7tjyqrbpbrhy@uno.localdomain>
 <08c1a65e-dcc5-e1ae-053a-823931b9ec15@denx.de>
 <20190529062844.bsdg7u7rgvkcmq6k@uno.localdomain>
 <e481c8a1-a0c8-f0d9-9df7-e016e5c3bc57@denx.de>
 <59881e2a-56c2-3801-2058-d939b25d6259@gmail.com>
 <acb6c57e-49da-614b-d9fd-833b5eca131c@denx.de>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <040ee008-2ae9-40d3-fa2f-729e7da4331a@gmail.com>
Date:   Wed, 29 May 2019 12:15:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <acb6c57e-49da-614b-d9fd-833b5eca131c@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On 29/05/2019 12:09, Marek Vasut wrote:
> On 5/29/19 1:04 PM, Ian Arkver wrote:
>> Hi,
>>
>> On 29/05/2019 11:41, Marek Vasut wrote:
>>> On 5/29/19 8:28 AM, Jacopo Mondi wrote:
>>>
>>> [...]
>>>
>>>>>>>> [1]
>>>>>>>> https://www.renesas.com/eu/en/products/audio-video/video-decoders-encoders/video-decoders/device/ISL79987.html
>>>>>>>>
>>>>>>>>
>>>>>>>>> +Required Properties:
>>>>>>>>> +- compatible: value should be "isil,isl79987"
>>>>>>
>>>>>> And here you might want to have 2 different compatibles for 79987 and
>>>>>> 79988.
>>>>>
>>>>> The 79988 is not supported yet, do we want to have it in the binding
>>>>> doc?
>>>>>
>>>>
>>>> I got mislead by the isl7998x naming scheme you used...
>>>>
>>>> I would say that's up to you, the two chips seems very similar,
>>>> and it might make sense to provide bindings that support both. At the
>>>> same time, as long as the here defined bindings does not prevent
>>>> future expansions to include the ISL79988, its support could be safely
>>>> post-poned. In that case please s/isl7998x/isl79987/ in this document
>>>> and do not mention BT565 in the description.
>>>
>>> Right
>>>
>>>>> [...]
>>>>>
>>>>>>>> I see from the example you only support one output port? How do you
>>>>>>>> model the input ones.
>>>>>>>
>>>>>>> I don't . Do we model analog inputs now somehow ?
>>>>>>
>>>>>> I really think so, please see:
>>>>>> Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>>>>>>
>>>>>>
>>>>>> And as an example of a board device tree using connectors to model
>>>>>> analog input see how the cvbs input on Salvator-X is described:
>>>>>>
>>>>>>      cvbs-in {
>>>>>>          compatible = "composite-video-connector";
>>>>>>          label = "CVBS IN";
>>>>>>
>>>>>>          port {
>>>>>>              cvbs_con: endpoint {
>>>>>>                  remote-endpoint = <&adv7482_ain7>;
>>>>>>              };
>>>>>>          };
>>>>>>      };
>>>>>>
>>>>>> I think you should provide 4 input ports, where to connect input from
>>>>>> the analog connectors, and derive the number of enabled inputs from
>>>>>> the number of endpoints connected to an active remote.
>>>>>
>>>>> Deriving the number of active physical inputs from some existing
>>>>> binding
>>>>> makes sense.
>>>>>
>>>>> However unlike the adv7482, the isl79987 does not support remapping the
>>>>> physical inputs to ADCs in the chip. It does support some remapping of
>>>>> physical inputs to MIPI CSI2 channels, but that's probably not very
>>>>> useful.
>>>>>
>>>>
>>>> I understand, but I will now use against you the argument you have
>>>> correctly pointed out here below that DT should describe hardware, and
>>>> the hardware has indeed 4 input ports..
>>>
>>> My question here is whether it makes sense to describe the ports even if
>>> they cannot be muxed to different ADC. Does it ?
>>
>> Each input port can be either differential CVBS or single ended with a
>> 2:1 input select mux. It would be nice to be able to describe this.
> 
> Where do you see that ?

Bits 0 and 1 of each channel page's Differential Clamping Control 4 
(0x39, ISL7998x_REG_Px_DEC_DIFF_CLMP_CTL_4).

I don't think you change it from the default (single ended on the first 
input).

Regards,
Ian

> 
>> You cannot remap the inputs to different ADCs, but you can remap the
>> ADCs to different VC IDs using the
>> ISL7998x_REG_P5_LI_ENGINE_VC_ASSIGNMENT register. Describing each input
>> would proivde somewhere to specify the vc-id.
> 
> I think Jacopo mentioned above the input muxing and the MIPI CSI2 VC
> muxing are two separate things. But I have to wonder, do we have a way
> of muxing the VCs in the DT or via the media controller yet ?
> 
