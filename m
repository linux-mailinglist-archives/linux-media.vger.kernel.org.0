Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB7D3309E
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 15:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbfFCNIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 09:08:17 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:33087 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726343AbfFCNIQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 09:08:16 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Xmh9hLfvDsDWyXmhChtE4r; Mon, 03 Jun 2019 15:08:15 +0200
Subject: Re: [PATCH] media: stm32-dcmi: fix irq = 0 case
To:     Fabien DESSENNE <fabien.dessenne@st.com>,
        Hugues FRUCHET <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Pavel Machek <pavel@denx.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
References: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
 <46944972-1f88-ef3b-fef9-8e37753c0ffe@xs4all.nl>
 <dd4ca76b-9f93-5ddc-e878-25b9905e0cd2@st.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <aa40a88d-9995-8cfc-682a-3c33445199e9@xs4all.nl>
Date:   Mon, 3 Jun 2019 15:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <dd4ca76b-9f93-5ddc-e878-25b9905e0cd2@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHHih37cLk8I5B7UWMg29h9+t3yjqMdqAeL1cmDBDScWB9AhtcP4c+T5U0qPVbKT00KNHg2pVihXau+13MBWQo78rkablFd9Va3TEOo3lq/b7D8ShVTF
 1dk4Y9ghkLFLuzutb6p9jfN9EHM64jfRmG2XDMxMoR0sERAPgWcj2QJPAwcYV1fumSqr2UC31Vq4upPPihDg+OqFHyln4/equHH8gk3y/Ujgi0qK7loUwmEF
 7asWsoHB8XPXfs6gm4n3EHg183Q59pXsQS+QUtZnschVSFFBaKXZz/ckdMk2s816Ue1bmf8tO88FyypzoXOnmb8ikzZXWbHSxEP0dEYoKvTBrqoK91jFyYUA
 w9FYP35FitxsSSem7++x3S1uZT9HudDm6CP3T8KhEQ4rt1JSiWwe6X0Z3FdItW1VjYaEWJE+9PRORGpuPElzXCj5jgTkgit1dZENMV+fPrgi4bxrg+7mDUjv
 Y/x1bkC2MF2lT4Vs9vgiFP45BgKgv/boSIWysJfkOzTTc4tuZuXebciu/EP7Nay9quMrDHLVMdCQVaVqykwwNBqJy4lumr8x9l3mUwE1ROoI0XSoPBCPuGKO
 SAbecdcZ05HgiEQau1DOk57w
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/3/19 3:03 PM, Fabien DESSENNE wrote:
> Hi Hans
> 
> 
> "platform_get_irq() = 0" shall be considered as an error. See these 
> discussions:
> https://patchwork.kernel.org/patch/10006651/
> https://yarchive.net/comp/linux/zero.html

Hmm, then many media drivers are wrong since most check for < 0.

In any case, I'll pick up this patch whenever I make a next pull request
for fixes like this.

Regards,

	Hans

> 
> BR
> 
> Fabien
> 
> On 03/06/2019 1:45 PM, Hans Verkuil wrote:
>> On 5/31/19 11:18 AM, Fabien Dessenne wrote:
>>> Manage the irq = 0 case, where we shall return an error.
>>>
>>> Fixes: b5b5a27bee58 ("media: stm32-dcmi: return appropriate error codes during probe")
>>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>>> ---
>>>   drivers/media/platform/stm32/stm32-dcmi.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
>>> index b9dad0a..d855e9c 100644
>>> --- a/drivers/media/platform/stm32/stm32-dcmi.c
>>> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
>>> @@ -1702,7 +1702,7 @@ static int dcmi_probe(struct platform_device *pdev)
>>>   	if (irq <= 0) {
>> Shouldn't this be 'irq < 0' instead of '<=' ?
>>
>> AFAICT irq == 0 can be a valid irq and isn't an error.
>>
>> Regards,
>>
>> 	Hans
>>
>>>   		if (irq != -EPROBE_DEFER)
>>>   			dev_err(&pdev->dev, "Could not get irq\n");
>>> -		return irq;
>>> +		return irq ? irq : -ENXIO;
>>>   	}
>>>   
>>>   	dcmi->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> >

