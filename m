Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229EE49EB4F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jan 2022 20:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245679AbiA0Ttu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jan 2022 14:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbiA0Ttt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jan 2022 14:49:49 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCE2C061714
        for <linux-media@vger.kernel.org>; Thu, 27 Jan 2022 11:49:49 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C32E11F45B31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1643312987;
        bh=i4WqDFQpnOvVY8L4ENRTKrTT0b+qCdZ0ln0EeP4SJUk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JwIS7Xll8UxRrCqnlIgxMlBELlos999AQhNlkfMvg6i3EPwei+tB2k/diZ5MrMeiU
         SXLU71CCKe7C7pGdZbCWUIBa3I2UMAR0jjIHfjCNLSo4YCx9AOegyaqJo8WwLEzxeZ
         ZKQDtVVjKR4PLwIrgwGHEDdFP1yO18LMcpQbdjp3jxOTm1vb+xSxiCETB5mIE6oTeS
         S4NGfCo0yFNAbigqmB+c7jGt3Z/SEn/NIZUPNw+MoxE0E42Lpb16iwV6QCbNElB7+6
         9OO+ppO3S7XTPEo+G1+KjwjXdKAVAhExRKZ1p8cSgTYSw4m7p0bIcVx/+57qg/HOh4
         zNxRCFFqi//xg==
Subject: Re: [PATCH v4 1/6] staging: media: wave5: Add vpuapi layer
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     Bob Beckett <bob.beckett@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
References: <20211201175613.13710-1-dafna.hirschfeld@collabora.com>
 <20211201175613.13710-2-dafna.hirschfeld@collabora.com>
 <CAFr9PX=6Pd1Rg=wJvpuX6WX63L=iAnwPA24e59An3Kac5f_vzA@mail.gmail.com>
 <cdd9b485-364f-c6bd-776f-a0ca2d260762@collabora.com>
 <e9905774-a994-6311-7b53-b40588d4f6ec@collabora.com>
 <CAFr9PXnnGc1TUQBeW8JW9qGewhU99gmRbvzZEsZaDmr12jMg0A@mail.gmail.com>
 <25e7d6db-1cff-6fd5-1071-1f21c5ff7a8a@collabora.com>
 <CAFr9PXkppeU-M2Sm7EQv3pO-1PzaD-UEckFWX=B_U8CKbzP7RA@mail.gmail.com>
 <b06402c9-e27e-f6e0-abd5-688106a36ba6@collabora.com>
 <CAFr9PXnn5EnApGk7vYcFEF0+J6kojhNTMspNnM8asN512fkTew@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <1bda0f7f-94ee-e598-4b92-d46512cba491@collabora.com>
Date:   Thu, 27 Jan 2022 21:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFr9PXnn5EnApGk7vYcFEF0+J6kojhNTMspNnM8asN512fkTew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 22.01.22 15:45, Daniel Palmer wrote:
> Hi Dafna,
> 
> On Sat, 22 Jan 2022 at 22:06, Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>> Hi, I compared the flow of the probe between the ido-sbc2d70 and the beaglev on which I tested the driver.
>> I noticed that only on the ido-sbc2d70 the field p_attr->support_vcore_backbone is true which then cause accessing the reg W5_BACKBONE_BUS_CTRL_VCORE0
>> which is not mentioned in the Programmer's Guide I have. Not sure what's that mean.
> 
> Interesting. It's possible they've moved things around.
> That gives me a good hint. I can compare what the code in the binary
> module seems to be doing.
> 
>> On the beaglev I have the flow for the case:
>>
>> p_attr->support_backbone = true;
>>
>> p_attr->support_vcore_backbone = false;
>> p_attr->support_vcpu_backbone = false;
>> p_attr->support_dual_core = false;
> 
> It's possible this is a slightly different version of this IP or they
> moved things around.
> They got rid of the product id register for example so it's possible
> they removed other bits they thought they didn't need and there is
> hardcoding in their version of the driver.
> 
>> I wanted to ask, How did you set the dt-binding for the codec of the .dts file? Was it from a datasheet you have or was it from a reference source code? or both?
> 
> The vendor DTS is here:
> https://github.com/linux-chenxing/linux-ssc325/blob/979122be45d470e959c2245c996fa93dea10069b/arch/arm/boot/dts/infinity2m.dtsi#L160
> 
> You'll notice the weird bank thing instead of reg. The bank has to be
> multiplied by 0x200 to get the address.. but that result doesn't
> actually line up with the real address. So I looked at the binary
> module in ghidra and they have it hard coded there. It's a total mess.

Hi,
which binary was that? the kernel module?
So in your code the reg is 'reg = <0x344800 0x800>;' , is that what was hard coded?

> 
> For the IRQ and clocks it's a bit easier as there are headers:
> https://github.com/linux-chenxing/linux-ssc325/blob/89341c7012404c72e192f198b2ea6405ec80d15d/drivers/sstar/include/infinity2m/irqs.h
> https://github.com/linux-chenxing/linux-ssc325/blob/89341c7012404c72e192f198b2ea6405ec80d15d/drivers/sstar/include/infinity2m/reg_clks.h
> 
>> Could you send me the resources you have for that?
>> Also, maybe you have the schematic for the board? could you also send that if you do?
> 
> I don't have a schematic for the board as they wouldn't send it to me.
> I had to probe it with a multimeter.
> I'm not sure the schematic helps too much though as everything is
> internal to the SoC.
> 
> I have some messy notes here of what I found out so far, some dumps of
> the vendor driver running etc:
> https://github.com/linux-chenxing/linux-chenxing.org/blob/master/ip/vdec.md

I see that you test the content of 0x1f344000 with 'devmem', what make you test this specific address?

Thanks,
Dafna

> 
> Cheers,
> 
> Daniel
> 
