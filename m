Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED4E31147B
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 23:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhBEWGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 17:06:51 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35553 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232711AbhBEOxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 09:53:05 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 81jIlTQ8CFFpm81jLlH5Aq; Fri, 05 Feb 2021 15:05:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612533906; bh=x2AMkz27DNqKPKgNetJuCV2sz++CZ3rwFvIw3ofbltE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OR6eQ7zch7SkKCZGvArSCh6WCPwdJlX5CBVs9RvPp9bjDWGGaTafqyFDzdODJiVQc
         egJ2xxtylMGuoOWQCIKzg0hS4ZitEUnqvLIvasqFr3b8LjBZIeaKA7GziJykM69kov
         gkmBJe0ZbjtAisdE7NwUBGR0VqMPv7zzdSQ9nBEgbOcaSDDlA21fPXbMqV2y06aIUp
         twZVbcqFaUXf2VKqsXyx9qLHPSLAO62IAsCw88268i8UyHKdKcCBj3V+j+tuJVO2ES
         6/G1eZWChKhyVcM7QJ1gslMcuSU/+Eq3aBo+Q5Oqd3WMMEnv5zW2BDcO8zsqzrf7na
         WsYlK6Bo+uFhw==
Subject: Re: [PATCH] media: pwc: Fix the URB buffer allocation
To:     Andrew Lunn <andrew@lunn.ch>, Takashi Iwai <tiwai@suse.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        Robert Foss <robert.foss@linaro.org>
References: <20210121202855.17400-1-tiwai@suse.de>
 <7afd0612-de36-60b1-6650-6f8de24a7145@xs4all.nl> <YB0/wTjYqE9IgtXZ@lunn.ch>
 <s5h1rdu4qgo.wl-tiwai@suse.de> <YB1EXirrstMlg/vA@lunn.ch>
 <s5hy2g23a2o.wl-tiwai@suse.de> <YB1NyX9QdBdV89bu@lunn.ch>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <88c960d2-40b1-ab6c-c17b-863c803a54b0@xs4all.nl>
Date:   Fri, 5 Feb 2021 15:05:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YB1NyX9QdBdV89bu@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIQH2UNmB76N2qI9X7HFErel3ASF6ZSyAgrt2zva6/GcXmS3domASqz3v7bYtUz4LDT9j4TUeLl8L8s4F4KlYC6uyEyPcFEjdtfX6O6Ld5TdwUEM7ikq
 cR6OJAtIBpUyE9HuFUgdwA835tIkG2LPbZu/g4gYchva1WfXdYs5ywLXPlR8PGBMjtfQbbcK2gNn+pI4NlWGOiIUotnKrBOtD1uDvFxGYN3wFMAqdDDShtyu
 Ub8i4CpJwG9/L+6bEAEDXDdoZ5Tvq+UlnBiVOIhgscqpSAMGql7McalEMGECIV7BgOo4l/pWX91kW7FTxzTlw26kfB2POpq/X4fOjphtbWnsNqsykS13ssNl
 QGMkAIWU0Bse9T1kCki8Wgo8cebfxw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/02/2021 14:53, Andrew Lunn wrote:
> On Fri, Feb 05, 2021 at 02:42:23PM +0100, Takashi Iwai wrote:
>> On Fri, 05 Feb 2021 14:13:02 +0100,
>> Andrew Lunn wrote:
>>>
>>> Hi Takashi
>>>
>>>> Indeed, looks so.  In most cases, this doesn't matter since both point
>>>> to the same device object.  In some cases like xhci-plat HCD, they
>>>> differ.  And sysdev  might be a better choice from the consistency
>>>> POV.
>>>>
>>>> But this brought an interesting question, too.  eg. USB chipidea
>>>> HCD uses platform devices for both controller and sysdev, and I
>>>> couldn't find any DMA mask setup.  So, no matter what to use, the uwc
>>>> driver would be broken on this...  Maybe it's just not covered.
>>>
>>> Did you do a git bisect to see what actually broke it?  "1161db6776bd:
>>> media: usb: pwc: Don't use coherent DMA buffers for ISO transfer"
>>> introduced the code, not the regression. If we understand the
>>> regression, that might give us the answer about chipidea.
>>
>> It's the recent DMA core change, the commit f959dcd6ddfd ("dma-direct:
>> Fix potential NULL pointer dereference").  But basically it's a right
>> fix, and the driver hitting this "regression" has been already broken
>> but casually worked without setting a proper DMA mask.
> 
> So for the chipidea, it also just 'casually worked'. But now it
> probably does not. But that is a separate chipidea issue.  None of my
> ARM systems use the chipidea IP core, so i cannot test anything.

Since few people use the pwc driver anymore, and certainly not on non-intel
devices, I am happy with Matwey's patch as is merged in our media tree for
5.12.

I'll mark Takashi's patch as Obsolete in patchwork as well.

I might have an SBC with a chipidea, if so, I'll give it a quick spin.

Regards,

	Hans
