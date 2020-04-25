Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11111B851E
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 11:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgDYJQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 05:16:30 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:58483 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725837AbgDYJQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 05:16:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SGv9jMxedlKa1SGvCjTM8w; Sat, 25 Apr 2020 11:16:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587806186; bh=bPXVNps72IWu/as3fHBk9yJ/PdnzczbB13/PPS/gBH0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rw8OLlk+c7B4WE2IdOz8MYx8r/zMzAf/YIVEE8lyxdRmGWdggeTBUd/beUefqfzi5
         4if9pTZ4KCvo8cR1fMTam2p0PejZcT3Jui11xq7i+s5G8M36Nql/3LIDwLIZKnlq5/
         IiwcLA4HFVcTamytVRnpJJQ3SjDKou6c7SqOE7XWJeGsiBCb/G1Hmriu88shZY4nkp
         CWIOIuINyZHgiz7lZqpP4GLEHbMMqx9emlG1J+lZ9Ac9YTweg3444sTCR11PNnzK6A
         SboMy4MUDa+/Bq+0DhmaGEfl4609lBzliBHeRkSlnx+K0fZ6+Q8esvIWBPRCzlkQLG
         uZIeiuP/yt59A==
Subject: Re: [PATCH 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller
 driver
To:     Jeff Chase <jnchase@google.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200424053819.220276-1-jnchase@google.com>
 <20200424053819.220276-2-jnchase@google.com>
 <74c08463-7052-2ac4-3662-7301ecb8150d@xs4all.nl>
 <CALTkaQ2dnWdkAsqYXF+msN+Jnz_1RuvbQtJd4PFwVT_Q7FTc5Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <290277ee-f1a1-db02-9885-d4193a40e8f8@xs4all.nl>
Date:   Sat, 25 Apr 2020 11:16:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CALTkaQ2dnWdkAsqYXF+msN+Jnz_1RuvbQtJd4PFwVT_Q7FTc5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFGLuT3HLzH7lHY2Ii2kZu5jWah5wTXTnD5F7ZssR8HU/qkUJqjBAFR5bNeRwnvqueVZXTHL8Me/qxKuWiIs5K6CLp+LlS0gXoQepylXOk3X5ZV5H9JY
 Mi0ry/DcDnljKaiv2za0lcHm4MAIuD7J03rNqTukbcB6/Ie8SGNaszC20EdBzN0M8mHn2Lh90oGt7u8QMsBttHHBdpqsnUhznaqGoMkt0KGncsatDaX977vK
 wJ3kA6ofud53MZ5ywYfDDa3zlDL6HrYihQBQOEdR9AfjKsJ/ePLtusixJIK6NgeFwaDg2s5yxJomKts6ZF5qJA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/04/2020 21:33, Jeff Chase wrote:
> Hi Hans,
> 
> Thank you for the quick review.
> 
>> Is the register documentation available somewhere? I only found the product brief.
> 
> No, it's not publicly available.
> 
>> The chip can only detect OK vs NACK? There are no error states for Arbitration Lost
>> or Low Drive conditions? Just checking, not all hardware has support for that.
> 
> Correct, message transmit completion just has a one-bit status.
> 
>>> +static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
>>> +{
>>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
>>> +
>>> +     dev_dbg(&ch7322->i2c->dev, "cec log addr: %x\n", log_addr);
>>> +
>>> +     return 0;
>>
>> This can't be right. I expect that logical addresses are set/cleared here,
>> because the device needs to know that so that it can ignore messages not
>> intended for it.
> 
> As far as I can tell the device doesn't filter based on logical
> address. I'll have to save
> the logical address to the driver and filter manually.

That can't be right. If this CEC adapter is assigned logical address 4, and
it has to Ack any received messages from other CEC devices with destination 4,
and ignore (i.e. not explicitly Ack) messages with other destinations.

If the CEC adapter wouldn't know what LA to use, then it would have to Ack
all messages, regardless of the destination, which would make this a complete
mess.

There must be a register that tells the CEC adapter which logical address(es)
should be Acked. It's usually a bitmask (one bit for each possible LA) or the
LA itself is stored.

It might be that you still receive all messages (in which case monitor_all
is effectively always enabled), but it really needs to be told which LAs should
be Acked.

Regards,

	Hans

> 
>>> +}
>>> +
>>> +static int ch7322_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
>>> +                                  u32 signal_free_time, struct cec_msg *msg)
>>> +{
>>
>> Does the hardware correctly handle Signal Free Time? If this isn't handled right
>> then one CEC device can flood the CEC bus, preventing anyone else from using it.
>>
>> In some devices it has to be programmed, in others it is hardwired.
> 
> It must be hardwired -- I don't see a way to program it.
> 
>>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
>>> +     int ret;
>>> +
>>> +     dev_dbg(&ch7322->i2c->dev, "cec transmit: %x->%x: %x\n",
>>> +             cec_msg_initiator(msg), cec_msg_destination(msg),
>>> +             cec_msg_opcode(msg));
>>> +
>>> +     mutex_lock(&ch7322->mutex);
>>> +     ret = ch7322_send_message(ch7322, msg);
>>> +     mutex_unlock(&ch7322->mutex);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static const struct cec_adap_ops ch7322_cec_adap_ops = {
>>> +     .adap_enable = ch7322_cec_adap_enable,
>>> +     .adap_log_addr = ch7322_cec_adap_log_addr,
>>> +     .adap_transmit = ch7322_cec_adap_transmit,
>>
>> If the HW supports CEC monitoring (aka snooping), then I recommend that
>> adap_monitor_all_enable is also implemented. It's very useful for debugging
>> CEC in userspace. Not all HW supports it, though.
> 
> Okay, I'll add this along with the logical address filtering I mentioned above.
> 
> Thanks,
> Jeff
> 

