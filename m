Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BB41C692B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 08:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgEFGm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 02:42:29 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37527 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727778AbgEFGm2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 02:42:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WDl7jnA4c8hmdWDlAjBdPg; Wed, 06 May 2020 08:42:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588747345; bh=5Vj4NSkhf4FkaeXoFmiWpIo7oy4K3v1jcd/yUaDKCmQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=udTuDSXZLfhx+KayMX4dGlyKouUUmgvMTTjYUCyneAO2ld0WHTnqjbtVeMfcz45Ny
         NRIbJtKQfYkskcLaWLBmVtjM9gxx6igQVy/3pMSzBgyeDZ8TgcRYWiLHq48B+CqQOr
         TeGrommCj2tmtBk73zfB/nLESjNkHD8e/z2W/4gq56s27II7bNVGK62XaPwNsS1W9c
         f6sy+B9WFcPThGIBvN7zhOfZ4gSAl3MTmFfTp/ZCofEMwQChvRswq/Rsr5Q2oDVnMt
         FPJkUMUMAgLyj3X2IW6/h/uuFkO3UeUHL4fefGjrT/wL3j5HZo2zigLDSjBb3zhlzx
         HaXl3qOtzV+jw==
Subject: Re: [PATCH 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller
 driver
To:     Jeff Chase <jnchase@google.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200424053819.220276-1-jnchase@google.com>
 <20200424053819.220276-2-jnchase@google.com>
 <74c08463-7052-2ac4-3662-7301ecb8150d@xs4all.nl>
 <CALTkaQ2dnWdkAsqYXF+msN+Jnz_1RuvbQtJd4PFwVT_Q7FTc5Q@mail.gmail.com>
 <290277ee-f1a1-db02-9885-d4193a40e8f8@xs4all.nl>
 <CALTkaQ0tp91FJJbrzj3=+qP5z4myuUyOA9fO0L-V4CMG6Qc=nA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <839f8bf0-67d5-fd08-08dd-64b959d8e074@xs4all.nl>
Date:   Wed, 6 May 2020 08:42:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CALTkaQ0tp91FJJbrzj3=+qP5z4myuUyOA9fO0L-V4CMG6Qc=nA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLuTLHGnGudnoaqLQaQt/WolOSvoNxNSW8fnGMuH0y81SBDSR8wxnuM/tOxP2SOWAzyCuLM+bBP8wufNb04YzMoU7YDBlp+9mnkFEkI6wdQuG9EogpH3
 G1G5N9PfOH5SDXvKWujbFmQC8aNPcFeyIPKjTv4QtOfthT4gexZIIzVSxVHAwgPpYGiaXSMX1xI0r/lU1jofCR6ZiF/HG7JF1JUIsrVBvIz8HjNEN4c7y2j/
 BEBeNDabxenhn/eS7HsY1+dvqNz33jiIlNy85wWSLHLuXmad7tPvB3yxu/n7NfEZ3FCbrpFTD4/M4EX8ZYXSPw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/05/2020 01:26, Jeff Chase wrote:
> On Sat, Apr 25, 2020 at 5:16 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 24/04/2020 21:33, Jeff Chase wrote:
>>> Hi Hans,
>>>
>>> Thank you for the quick review.
>>>
>>>> Is the register documentation available somewhere? I only found the product brief.
>>>
>>> No, it's not publicly available.
>>>
>>>> The chip can only detect OK vs NACK? There are no error states for Arbitration Lost
>>>> or Low Drive conditions? Just checking, not all hardware has support for that.
>>>
>>> Correct, message transmit completion just has a one-bit status.
>>>
>>>>> +static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
>>>>> +{
>>>>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
>>>>> +
>>>>> +     dev_dbg(&ch7322->i2c->dev, "cec log addr: %x\n", log_addr);
>>>>> +
>>>>> +     return 0;
>>>>
>>>> This can't be right. I expect that logical addresses are set/cleared here,
>>>> because the device needs to know that so that it can ignore messages not
>>>> intended for it.
>>>
>>> As far as I can tell the device doesn't filter based on logical
>>> address. I'll have to save
>>> the logical address to the driver and filter manually.
>>
>> That can't be right. If this CEC adapter is assigned logical address 4, and
>> it has to Ack any received messages from other CEC devices with destination 4,
>> and ignore (i.e. not explicitly Ack) messages with other destinations.
>>
>> If the CEC adapter wouldn't know what LA to use, then it would have to Ack
>> all messages, regardless of the destination, which would make this a complete
>> mess.
>>
>> There must be a register that tells the CEC adapter which logical address(es)
>> should be Acked. It's usually a bitmask (one bit for each possible LA) or the
>> LA itself is stored.
> 
> Sorry, you're right, of course. The register isn't in the
> documentation I have but I found it referenced in some sample code. By
> default it seems the device automatically stores the logical address
> if it recognizes a polling message (with src == dst) that was not
> ack'd. The behavior can be configured to allow explicit logical
> address assignment instead. I assume that would be preferred?

Yes, that's preferred (and also the only thing the CEC framework supports).

Very odd that that register is undocumented.

Regards,

	Hans

> 
> Thanks,
> Jeff
> 
> 
>>
>> It might be that you still receive all messages (in which case monitor_all
>> is effectively always enabled), but it really needs to be told which LAs should
>> be Acked.
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>>>> +}
>>>>> +
>>>>> +static int ch7322_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
>>>>> +                                  u32 signal_free_time, struct cec_msg *msg)
>>>>> +{
>>>>
>>>> Does the hardware correctly handle Signal Free Time? If this isn't handled right
>>>> then one CEC device can flood the CEC bus, preventing anyone else from using it.
>>>>
>>>> In some devices it has to be programmed, in others it is hardwired.
>>>
>>> It must be hardwired -- I don't see a way to program it.
>>>
>>>>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
>>>>> +     int ret;
>>>>> +
>>>>> +     dev_dbg(&ch7322->i2c->dev, "cec transmit: %x->%x: %x\n",
>>>>> +             cec_msg_initiator(msg), cec_msg_destination(msg),
>>>>> +             cec_msg_opcode(msg));
>>>>> +
>>>>> +     mutex_lock(&ch7322->mutex);
>>>>> +     ret = ch7322_send_message(ch7322, msg);
>>>>> +     mutex_unlock(&ch7322->mutex);
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static const struct cec_adap_ops ch7322_cec_adap_ops = {
>>>>> +     .adap_enable = ch7322_cec_adap_enable,
>>>>> +     .adap_log_addr = ch7322_cec_adap_log_addr,
>>>>> +     .adap_transmit = ch7322_cec_adap_transmit,
>>>>
>>>> If the HW supports CEC monitoring (aka snooping), then I recommend that
>>>> adap_monitor_all_enable is also implemented. It's very useful for debugging
>>>> CEC in userspace. Not all HW supports it, though.
>>>
>>> Okay, I'll add this along with the logical address filtering I mentioned above.
>>>
>>> Thanks,
>>> Jeff
>>>
>>

