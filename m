Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6230783407
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 16:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732997AbfHFOfT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 10:35:19 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:50762 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731984AbfHFOfS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 10:35:18 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 462xxb158kz1rVvp;
        Tue,  6 Aug 2019 16:35:15 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 462xxb0HTfz1qqkR;
        Tue,  6 Aug 2019 16:35:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id GrJifkBdOOAK; Tue,  6 Aug 2019 16:35:12 +0200 (CEST)
X-Auth-Info: 7fXuCd2jklhR15Q3R0u3m4rnPhcSgxOxpRKj5ABhWOM=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue,  6 Aug 2019 16:35:12 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Ian Arkver <ian.arkver.dev@gmail.com>, linux-media@vger.kernel.org,
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
 <20190529134321.3naykdw4jx5xu3jl@uno.localdomain>
Openpgp: preference=signencrypt
Autocrypt: addr=marex@denx.de; prefer-encrypt=mutual; keydata=
 mQINBFHmnxgBEACuQOC6Kaw/32MTeUJdFuDZ1FrbG76a0Ys/I02Kj9jXDmCCLvqq18Z4A1b0
 xbuMKGDy5WR77fqGV8zADUo6i1ATgCZeg+SRmQROF8r9K6n6digTznBySSLANhN3kXUMNRE1
 WEIBGCZJ5FF+Qq59AkAUTB8CiIzfEW98o7lUjeEume/78wR18+QW+2z6eYli2qNECceRINXT
 zS3oxRMr+ivqEUGKvMBC/WNLuvJoCGsfSQc2I+uGEU7MOdOCC6SsKdnPBGKYth5Ieb16bRS1
 b9M5BoEKTEzDCOWn92OxeHX6M2gLEMQobfM0RdIowMfWaUHdci2cLUTyL0T/P/gIpHMR2LhL
 8sdbNZufgv73s9PDgxTWMzypXimMJ7VZmVh9I2nQd2xm8+uE1rghqb90aEMFCTwUlrz4Qhjh
 vmczd2ScuuOMLzHEaaoOrMGbaWIEFcJvQgyHzJgMPgnG64eDq6uGyBEXRc3bBzv7B765Hcg8
 SSNqoUstjuQQlGp3y3Yj16l+PyZ3Ucy2swFYLVPTc35xFBk/uGEIhGncoFpOX29rxt9M8r5G
 hm7395m0GmDy50H/HN61/S8EPvM3HUjqBvX1EqU+vJXfwozxkKpIwcjx7h3W+PPS9TUb7r5v
 vHCqnrWRd/m6KWbCJsv0rsIU66o2qKYX5cIHV6u6Y7Zm7BtHfwARAQABtBtNYXJlayBWYXN1
 dCA8bWFyZXhAZGVueC5kZT6JAjgEEwECACIFAlHmnxgCGwMGCwkIBwMCBhUIAgkKCwQWAgMB
 Ah4BAheAAAoJEOtsLUEh5B0XLk0QAINOYFYB3v4KjXSFHYBQLlDblqhXvVtjyQHMiJsY1BMO
 mMrANUJQtpY3UkYquFspe2GBiFQbfW+mDlwFlSNpzaJ68qGEK+57I/MufsZKV6Ze9j7QeClu
 orYH+zfIBI7sn0HkY/MWN/Z270gRv2xSxDBP/8SPdB53EkImLZUFOo4/5eyuQ4t8HLgol02u
 2ncwXrnT036QC3SiNJDCJhwkpjvamPHghxr8hbIwkdOLZlYWfl0yzYzQohl8zBEwtBxl5cS4
 1TcrgBXsanQUMVNBpl0s8nQLKuHJNPOAhBnKstAe54yY3iWswYayHqqgqIQldcDqttHhdTJW
 mb9hTSf5p6fnZqcsfi3PUFwj5PJSN3aAbF8w42FwRvIOWbksFIWXpxYI3mq2TmX4GtlKdlF8
 xT+Q+Cbk538IBV4OQ5BapuYHs1C1ff9gVC0rfrCEloyteHafHwOv3ZuEGPlH89Rl4EjRvJxX
 8nE0sCiq6yUbpom8xRA5nFwA0bbTDwhH5RD/952bZraLpWcdJ6cWA2gefd2+2fy0268xyHmD
 m87B49BIaAsZ2kvEb/scCZ/CvPHjHLAjr+/GsdzOxwB68P41ZajujMDmbka00CyeAl88pgLX
 tTkPvAzuEDpRoJmg8zrQqrsmEKSdhFJhZ7d2MMKpCcVnInByXjM+1GEfSisTgWnluQINBFHm
 nxgBEAC8MpoO1s1AB0uRQGXlhYzkYvxkDGAe50/18ct2K6ORSv7HjCmZBjJX+2xTPSmML9ju
 3P0KrlnRdT8qCh+ozijffLjm5X9Fk+6mGQ56UQzivuPNlgyC3epF3Z58VPVQcIfE2/pdAxtZ
 zKc4P5t2yo5qk635huo0NvNg5mRhvfZ7mZpZuBahkHguR0Heh/tnGCa2v5P6uFbGX8+6rAA8
 EKxl5Tclf27PFZwbIWL1buS9RwgzsHj2TFnnEFIcWdMHyGy2GT8JMgY0VwxKebzGJg2RqfOL
 PaPjnvnXHAIYEknQp0TUtUiNxm0PBa4IQ30XhrB9D5QYdcw/DVvCzb9qyIlaQKEqHZm1fGU4
 iCsH3jV+5D4Lrn5JfXc/+A1NsLUq/NFIYhphbX4fGjR2QdZJrDnGVcxSlwP7CeRuxGELrASz
 m4G4Q0mYz7HdAlzBJHi8Ej4yC9l7PPlnxdUcAwheLxGwzMCf5vxw1C6Zi8PvKu/sY7Bha9XJ
 plvuLBi7QrkD8mZEzt+xC9nWRt7hL47+UvyduFe4qDMTPrW20ROxCykC36gj53YhqqLblioX
 2//vGLKj8x+LiLSTwjkLkrwOremhdTqr457511vOXyaZyOlWhFjN+4j9xwbbg1IWwMenRAb7
 Qwuipck6fN2o+PK9i6t6pWXrUDNI/VCMbimnuqPwAQARAQABiQIfBBgBAgAJBQJR5p8YAhsM
 AAoJEOtsLUEh5B0XMqAP/1HbrClefDZ/Lvvo89mgC56vWzEstmFo8EihqxVZvpkiCjJoCH53
 VCYeGl41p0y6K5gaLT28s9waVHBw+dhpwABba3neV/vyXv0wUtvkS3T0e4zruYFWw0lQoZi+
 8rtXTsuWN5t3u8avXsrdqD0CteTJdgZ7yBV8bBvK2ekqFMS/cLC+MoYlmUFn6Tcxmv0x8QZY
 ux6ts9YpUvx8QxMJt9vfwt1WIUEFKR3JQdrZmbPGqWJ3s+u/C+v9stC5qf2eYafRjzy05lEn
 B06W5D5Uc+FGEhuzq4G0eRLgivMoC0Eqz7HuwGcRAJYQILQ3Vzd4oHKPoUAtvlKqUwDmHodT
 HPmN73JMsvO3jLrSdl4k6o3CdlS/DI0Eto4fD0Wqh6d5q11u1TOM7+/LehWrOOoGVqRc6FFT
 ofck6h6rN/Urwkr1nWQ3kgO1cd/gevqy8Tevo/qkPYIf71BlypcXhKqn6IPjkq4QLiDPRjHM
 tgPc2T/X/ETe5eCuhxMytIYbt1fK2pDXPoIKbbDK4uEmg9USXZ+pYrac4PFo1d+6D6vmTjRZ
 GRRITOVpKgBndfPyqofxeKNKGdNf9FS/x89RlnDWXsQHm+0pXguSRG9XdB16ZFNgeo8SeZVr
 qc9uLfhyQp/zB6qEnuX1TToug7PuDgcNZdjN3vgTXyno2TFMxp/LKHqg
Message-ID: <3a8dc708-a504-714f-8799-7e4622f42d02@denx.de>
Date:   Tue, 6 Aug 2019 15:35:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529134321.3naykdw4jx5xu3jl@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/29/19 3:43 PM, Jacopo Mondi wrote:
> HI Marek,

Hi,

> On Wed, May 29, 2019 at 01:09:47PM +0200, Marek Vasut wrote:
>> On 5/29/19 1:04 PM, Ian Arkver wrote:
>>> Hi,
>>>
>>> On 29/05/2019 11:41, Marek Vasut wrote:
>>>> On 5/29/19 8:28 AM, Jacopo Mondi wrote:
>>>>
>>>> [...]
>>>>
>>>>>>>>> [1]
>>>>>>>>> https://www.renesas.com/eu/en/products/audio-video/video-decoders-encoders/video-decoders/device/ISL79987.html
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> +Required Properties:
>>>>>>>>>> +- compatible: value should be "isil,isl79987"
>>>>>>>
>>>>>>> And here you might want to have 2 different compatibles for 79987 and
>>>>>>> 79988.
>>>>>>
>>>>>> The 79988 is not supported yet, do we want to have it in the binding
>>>>>> doc?
>>>>>>
>>>>>
>>>>> I got mislead by the isl7998x naming scheme you used...
>>>>>
>>>>> I would say that's up to you, the two chips seems very similar,
>>>>> and it might make sense to provide bindings that support both. At the
>>>>> same time, as long as the here defined bindings does not prevent
>>>>> future expansions to include the ISL79988, its support could be safely
>>>>> post-poned. In that case please s/isl7998x/isl79987/ in this document
>>>>> and do not mention BT565 in the description.
>>>>
>>>> Right
>>>>
>>>>>> [...]
>>>>>>
>>>>>>>>> I see from the example you only support one output port? How do you
>>>>>>>>> model the input ones.
>>>>>>>>
>>>>>>>> I don't . Do we model analog inputs now somehow ?
>>>>>>>
>>>>>>> I really think so, please see:
>>>>>>> Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>>>>>>>
>>>>>>>
>>>>>>> And as an example of a board device tree using connectors to model
>>>>>>> analog input see how the cvbs input on Salvator-X is described:
>>>>>>>
>>>>>>>     cvbs-in {
>>>>>>>         compatible = "composite-video-connector";
>>>>>>>         label = "CVBS IN";
>>>>>>>
>>>>>>>         port {
>>>>>>>             cvbs_con: endpoint {
>>>>>>>                 remote-endpoint = <&adv7482_ain7>;
>>>>>>>             };
>>>>>>>         };
>>>>>>>     };
>>>>>>>
>>>>>>> I think you should provide 4 input ports, where to connect input from
>>>>>>> the analog connectors, and derive the number of enabled inputs from
>>>>>>> the number of endpoints connected to an active remote.
>>>>>>
>>>>>> Deriving the number of active physical inputs from some existing
>>>>>> binding
>>>>>> makes sense.
>>>>>>
>>>>>> However unlike the adv7482, the isl79987 does not support remapping the
>>>>>> physical inputs to ADCs in the chip. It does support some remapping of
>>>>>> physical inputs to MIPI CSI2 channels, but that's probably not very
>>>>>> useful.
>>>>>>
>>>>>
>>>>> I understand, but I will now use against you the argument you have
>>>>> correctly pointed out here below that DT should describe hardware, and
>>>>> the hardware has indeed 4 input ports..
>>>>
>>>> My question here is whether it makes sense to describe the ports even if
>>>> they cannot be muxed to different ADC. Does it ?
>>>
>>> Each input port can be either differential CVBS or single ended with a
>>> 2:1 input select mux. It would be nice to be able to describe this.
>>
>> Where do you see that ?
>>
>>> You cannot remap the inputs to different ADCs, but you can remap the
>>> ADCs to different VC IDs using the
>>> ISL7998x_REG_P5_LI_ENGINE_VC_ASSIGNMENT register. Describing each input
>>> would proivde somewhere to specify the vc-id.
>>
>> I think Jacopo mentioned above the input muxing and the MIPI CSI2 VC
>> muxing are two separate things. But I have to wonder, do we have a way
>> of muxing the VCs in the DT or via the media controller yet ?
> 
> I'm not sure I get what you mean with "input muxing", do you mean
> controlling which input is directed to which ADC ?

Yes

> I don't have the
> chip manual, but according to what you and Ian said this is not
> possible.

Correct. You can only remap ADC output(s) to different MIPI CSI2 VC(s).

> Selecting which input video stream is directed to which CSI-2 virtual
> channel in the output CSI-2 stream is not possible in mainline. There
> are patches in development that would allow you to do so, but their
> design is not fully finalized yet. They would, in any case, require
> you to have one sink pad for each input port

Right, and the iMX6 CSI2 driver which I use for development doesn't
support that yet either.

>, and while you could
> register as many pads as it is specified in your custom property,
> you would loose the notion of which input is connected to which port
> ie. when a single input (isil,num-inputs=1) is connected to an input
> port which is not the first one (anyway, quickly looking at 2/2 it
> seems to me you only register a single source pad for this device).
> 
> The DT bindings layout is an orthogonal problem though. My opinion is
> that as the chip has 4 available input connections it should have 4
> input ports in the bindings definition, and for each one you would
> register a sink pad.

Who would be the source for such an input "sink" pad though ? I looked
at
Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt,
as you suggested above, but this is for video _OUTPUT_ devices, not
input devices, so that's likely not what I want.

> Only the actually connected ones should be present
> in the DTS, so that the driver knows which input port is active and,
> once something that allows you to control VC will land in mainline,
> it will let you tell something like "I want the video stream
> received on the input port@2 sent in virtual channel x in the output
> CSI-2 stream", but again this is quite an orthogonal issue. Sure thing
> is that with the current design and implementation, which afaict does
> not provides any sink pad, this is frowned upon (but you can then say
> 'who cares, since it's not here yet' :)

Fine, so let's ignore this for now.

> Or what Ian said, if you can model a connector that provides 2 single
> ended inputs, each connected to an input port and muxed internally by
> the chip, you could only do that if you have numbered input ports I
> guess. Nobody requires you support any of these, but at least bindings
> should be defined in a future proof way, to avoid later changes to the
> ABI.

Well, if endpoint 0 is the MIPI CSI2 output, then you can always add
more endpoints (1..4) for the analog inputs . In this way , the bindings
are already future-proof.

Or shall the input ports come first (as endpoints 0..3) and be followed
by the MIPI CSI2 output (4) ? If so, that would make counting the
(varying number of) inputs a bit cumbersome in the driver.

> Anyway, you had my opinion, multiple times already, and as I'm not in
> any position to judge if something is acceptable for merge or not,
> I'll now get quiet hoping that this prolonged email exchange drags in
> opinion from more experienced people to tell you which direction you
> should take and if what you have here is fine already or not :)
> 
> Cheers
>    j
> 
>>
>> --
>> Best regards,
>> Marek Vasut

-- 
Best regards,
Marek Vasut
