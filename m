Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBAF290644
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 15:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407657AbgJPN1c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 09:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407253AbgJPN1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 09:27:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC3FC0613D3;
        Fri, 16 Oct 2020 06:27:31 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30A74528;
        Fri, 16 Oct 2020 15:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602854849;
        bh=HxEc82FtEItR3ZGOUen8zEBFZpr6AfpnCCwNtqxTMiI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=f8apDp9MfctycBMrK19+YzBXEe15Vgd3jAvCWQPVpt/yG+iK01VQCrax8r8MGbUQO
         YvFZGZaz0S9VSKPGjWPI7OsGpRPTUDRMMDWmH+0uraiod2eTVuHpxflkOvNt6ksbaQ
         QIikFq+O+NDd7Cz7TmnmEGBZGDb6Cm4SI5ldjFeQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 2/7] dt-bindings: media: max9286: Document
 'maxim,high-threshold'
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
 <20201016120625.64337-3-jacopo+renesas@jmondi.org>
 <CAMuHMdUof5Yb=5notGDYycJtZyLzGp2RPjJ=m6GVodBRDxw9ow@mail.gmail.com>
 <20201016145603.bapqjxsvezn6flyv@uno.localdomain>
 <CAMuHMdWwK=3yOQ8b5suN-U8YtGVomjOZ+gZrTHpUaix2xDP8hw@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <cb3d0334-29c0-a79e-b716-6ab49480619d@ideasonboard.com>
Date:   Fri, 16 Oct 2020 14:27:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWwK=3yOQ8b5suN-U8YtGVomjOZ+gZrTHpUaix2xDP8hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/10/2020 14:04, Geert Uytterhoeven wrote:
> Hi Jacopo,
> 
> On Fri, Oct 16, 2020 at 2:56 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>> On Fri, Oct 16, 2020 at 01:50:34PM +0200, Geert Uytterhoeven wrote:
>>> On Fri, Oct 16, 2020 at 12:09 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>>>> Document the 'maxim,high-threshold' vendor property in the bindings
>>>> document of the max9286 driver.
>>>>
>>>> The newly introduced boolean property allows controlling the initial
>>>> configuration of the GMSL reverse control channel to accommodate
>>>> remote serializers pre-programmed with the high threshold power
>>>> supply noise immunity enabled.
>>>>
>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>>>> @@ -51,6 +51,19 @@ properties:
>>>>    '#gpio-cells':
>>>>      const: 2
>>>>
>>>> +  maxim,high-threshold:
>>>> +    description: |
>>>> +      A boolean property to increase the initial amplitude of the reverse
>>>> +      control channel to compensate for remote serializers pre-programmed with
>>>> +      high threshold noise-immunity.
>>>> +
>>>> +      Some camera modules (in example the RDACM20 one) include an on-board MCU
>>>> +      that pre-programs the embedded serializer with reverse channel power
>>>> +      supply noise immunity enabled. The deserializer shall increase its
>>>> +      reverse channel amplitude to compensate that and be able to communicate
>>>> +      with the remote end.
>>>> +    type: boolean
>>>
>>> Does this "high" threshold correspond to some numerical value?
>>> I.e. could we run into a future need to support more values than just
>>> true/false?
>>> If yes, we may want to use a numerical value from the start.
>>
>> So, this boolean property controls the initial setting of the reverse
>> channel amplitude, which has to be opportunely adjusted to be able to
>> probe the remote devices as i2c messages are bridged on the reverse
>> channel from the deserializer to the remote serializers.
>>
>> It also implies that if the initial setting is not "high" it has to be
>> increased after the remotes have probed, as it is assumed at the end
>> the remotes' probe() routine they have enabled their high threshold
>> noise immunity feature.
>>
>> The register that controls the de-serializer reverse channel amplitude
>> is not fully documented in the chip manual version I have, but the
>> application developer guide shows that it can range from 30mV to
>> 200mV. The same developer guide shows 100mV and 170mV as "initial" and
>> "high threshold" values to be used.
>>
>> On the serializer's side (MAX9271 at least) high threshold is a
>> boolean control, it is either enabled or disabled.
>>
>> Hence I suspect that for the max9286-max9271 combo, using fixed 100mV
>> and 170mV values is enough. Other serializers might allow a more fine
>> grained control of the noise cancelling threshold, and might require a
>> more precise adjustment of the deserializer side. I'm honestly not
>> sure at this point not having seen any other one.
>>
>> So yes, this is a deserializer setting that depends on the serializer
>> in use, and I'm not 100% comfortable expressing it as a deserializer
>> property. That said, having an initial numerical value might serve the
>> same purpose allowing more flexibility, if other serializers require a
>> more precise control of the initial amplitude.

And one of the benefits of your series, is that you've codified the
conversion from the input value to the register value, which is really
helpful.

I think the fact that you've implemented the required feature, means
exposing the value here makes more sense.

However, once exposed outside of the driver, I'd add some clamping on
the allowed min/max values in the max9286_reverse_channel_setup() function.

>>
>> After the remotes have probed, we could also re-explore the
>> possibility of getting the bus configuration using get_mbus_config, as
>> detailed in the v1 cover letter [1] as at that time their sub-devices
>> have been registered and we can call operations on them. But again,
>> this might be not required at all.
> 
> Sounds like "maxim,<foo>-threshold-mV" is the way to go?
> If you don't know the exact register configuration, and need to
> convert to a boolean in the driver, you can still use something like
> "threshold < 150 ? ... : ...".

This sounds like a reasonable path to me - I'm still really weary that
it's defining it on the deser, rather than the serialiser - but perhaps
there's no current option to do that.


I presume we can't wait until we can obtain a value through
get_mbus_config() ?

That's going to be chicken and egg, as the camera can't probe until we
have the i2c channels set up ... yet the information we want, doesn't
need the bus to be configured... so there's indeed some missing pieces
to the puzzle for that to happen ;-(

also - I guess the other key issue that would make me believe we keep
this as a deserialiser property, is that it affects the whole
configuration right? It's not just one of the four links - it's all of
them collectively.

(well, unless we called max9286_reverse_channel_setup() separately for
each link bring up ...)

--
Kieran


> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

