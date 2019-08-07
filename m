Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 905CC84A50
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 13:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387488AbfHGLFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 07:05:34 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43775 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387476AbfHGLFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 07:05:33 -0400
Received: from [IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747] ([IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vJl4hkmqNAffAvJl5h7wci; Wed, 07 Aug 2019 13:05:31 +0200
Subject: Re: [PATCH] media: tm6000: Spelling s/diconencted/diconnected/
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20190731134121.18473-1-geert+renesas@glider.be>
 <95aa9f00-a01e-09ab-3cc3-5f1246052093@iki.fi>
 <CAMuHMdWZW-=8sD2KYEGY0f++++ocMjwDVut1r2z3pJk9OL2wmw@mail.gmail.com>
 <1201f416-26fe-862c-27ee-346ca50ff998@xs4all.nl>
 <CAMuHMdUfm1p+91xBcjWO9Tm4BcmTr9R5p530ChMQC=0RKLuaDA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <040b2c92-516b-58c6-940e-54fb58f7ddee@xs4all.nl>
Date:   Wed, 7 Aug 2019 13:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUfm1p+91xBcjWO9Tm4BcmTr9R5p530ChMQC=0RKLuaDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL4h/kn3LWfh42V1QlxtZ7SyYzLZHLelFCBpVYS2cfOL2/z3qOPaSSF2zMKRZFpKTqRCKSPaqXG5LAry4qgqmJSNowcRWCYrtXXXiarYmfOkNXqSY5v+
 mV2/b0gNv+aKbrPGddZheR50fYjl7s+yZslJKNZEf23c7OMjSkSCbiWfnfuQWEJb82BgvevysmYyKx7nbMpo2NTSoOor+slisZhmv2wlMT3Uotml2StQMKuJ
 1+JW9UCWsTN1rZvj6L2N4mBeJCbw2bfwnXtzg98iKyp45WN8llSpAfkVwO5HdebaZkGIRMEtLDMgxAKDvGbbHr7bfDRsQLhAXl5J1a//jdMxOsyIJt+kggdO
 +an70KER
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/7/19 12:53 PM, Geert Uytterhoeven wrote:
> Hi Hans,
> 
> On Wed, Aug 7, 2019 at 11:33 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>> On 7/31/19 8:43 PM, Geert Uytterhoeven wrote:
>>> On Wed, Jul 31, 2019 at 8:36 PM Antti Palosaari <crope@iki.fi> wrote:
>>>> On 7/31/19 4:41 PM, Geert Uytterhoeven wrote:
>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> ---
>>>>>   drivers/media/usb/tm6000/tm6000-cards.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
>>>>> index 23df50aa0a4af6da..9a0ffe678524987c 100644
>>>>> --- a/drivers/media/usb/tm6000/tm6000-cards.c
>>>>> +++ b/drivers/media/usb/tm6000/tm6000-cards.c
>>>>> @@ -1328,7 +1328,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
>>>>>
>>>>>   /*
>>>>>    * tm6000_usb_disconnect()
>>>>> - * called when the device gets diconencted
>>>>> + * called when the device gets diconnected
>>>>
>>>> disconnected ?
>>>
>>> Thanks, will fix!
>>
>> Can you also add a commit message when you post v2? Currently that's
>> empty and Linus doesn't like empty commit messages :-)
> 
> Even if everything to be said is in the one-line summary?

Yes. In fact, checkpatch warns if the commit description is empty.

In this case, just say 'Fix typo.', that's sufficient.

Regards,

	Hans

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

