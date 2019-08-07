Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 403B1848AC
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 11:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbfHGJdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 05:33:37 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:52835 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726725AbfHGJdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 05:33:37 -0400
Received: from [IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747] ([IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vIK5hkCdzAffAvIK6h7Zwb; Wed, 07 Aug 2019 11:33:35 +0200
Subject: Re: [PATCH] media: tm6000: Spelling s/diconencted/diconnected/
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Antti Palosaari <crope@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20190731134121.18473-1-geert+renesas@glider.be>
 <95aa9f00-a01e-09ab-3cc3-5f1246052093@iki.fi>
 <CAMuHMdWZW-=8sD2KYEGY0f++++ocMjwDVut1r2z3pJk9OL2wmw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1201f416-26fe-862c-27ee-346ca50ff998@xs4all.nl>
Date:   Wed, 7 Aug 2019 11:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWZW-=8sD2KYEGY0f++++ocMjwDVut1r2z3pJk9OL2wmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDPp3gUGYQ8+BIp/OEbMAPb6+yfEI9e/nXQjY6tnV+kiDvdYTj29FNWbKKJD/Biu2DmXIKfngJsZFgGtVcJ/ELTWOHIEJfWhVWzu2gycMvAX6UxltHtF
 jZF5A3FKiUfubEdEbCsyZZsUhMtlmhA6pLDtajCTNyAqUp7L65SXnQ9r141cdLBZvrxnzyNyjEKxUcNQcBGQ6NBOAxCcqQqOMD9u1g5MyOWPMKBKhjo6BP4F
 t4x7ORxq+jlP/3XwikJ7eknuRiCsYQjM8wnmRHjejJnVzyAKCiyVQXp2j1RJf8hqEL9KSz4OYmsrFwBMEoPCEA5vP5hnwBlr8mSrg0vSlQYNlGwKwWVXGwiY
 ltvwe27Y
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/31/19 8:43 PM, Geert Uytterhoeven wrote:
> Hi Antti,
> 
> On Wed, Jul 31, 2019 at 8:36 PM Antti Palosaari <crope@iki.fi> wrote:
>> On 7/31/19 4:41 PM, Geert Uytterhoeven wrote:
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>>   drivers/media/usb/tm6000/tm6000-cards.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
>>> index 23df50aa0a4af6da..9a0ffe678524987c 100644
>>> --- a/drivers/media/usb/tm6000/tm6000-cards.c
>>> +++ b/drivers/media/usb/tm6000/tm6000-cards.c
>>> @@ -1328,7 +1328,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
>>>
>>>   /*
>>>    * tm6000_usb_disconnect()
>>> - * called when the device gets diconencted
>>> + * called when the device gets diconnected
>>
>> disconnected ?
> 
> Thanks, will fix!

Can you also add a commit message when you post v2? Currently that's
empty and Linus doesn't like empty commit messages :-)

Regards,

	Hans

> 
>> For the both patches.
> 
> How embarassing...
> /me hides in a brown paper bag...
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

