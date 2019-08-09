Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 320C487AB8
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 14:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406516AbfHIM7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 08:59:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52420 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIM7u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 08:59:50 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40433CC;
        Fri,  9 Aug 2019 14:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565355587;
        bh=xYIYCEXqQgQbfA403o2BisebXGc5Ze3hTGPSe9VhoQU=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eCRIG6zD5MXaugdHwgnyDwC0HjVY6himQfbTTndCbwWHiw0v36IZYVrieEJG2RWs0
         CIKOvefji08LtWAXxFszS7O3J8BIkI6mJYctYIbQDzLz0CIRPd9QWs7CqWnnokRm6t
         UmsKEiGFBqYpXOigXsm8wt4Cdzj9gATSl+MBbZJE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/2] max9286: Add MAX9286 driver
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190809040558.10698-1-niklas.soderlund+renesas@ragnatech.se>
 <20190809040558.10698-3-niklas.soderlund+renesas@ragnatech.se>
 <5a640d94-799a-71ed-9f02-014adaabd595@ideasonboard.com>
 <20190809120429.GE24385@bigcity.dyn.berto.se>
 <8f5ce55a-666a-2350-b557-c275a69218c0@ideasonboard.com>
 <20190809122311.GF24385@bigcity.dyn.berto.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <74c0e6c0-b44e-993d-c436-42468b2376a6@ideasonboard.com>
Date:   Fri, 9 Aug 2019 13:59:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809122311.GF24385@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 09/08/2019 13:23, Niklas Söderlund wrote:
> Hi Kieran,
> 
> On 2019-08-09 13:12:49 +0100, Kieran Bingham wrote:
>> On 09/08/2019 13:04, Niklas Söderlund wrote:
>>> Hi Kieran,
>>>
>>> Thanks for your feedback.
>>>
>>> On 2019-08-09 09:09:43 +0100, Kieran Bingham wrote:
>>>> Hi Niklas,
>>>>
>>>> This should be at least v5.
>>>
>>> I don't agree ;-) This is a "new" series where multiple streams are not 
>>> supported and there are no external dependencies. To indicate this I 
>>
>> I'm afraid there's nothing new about a version of this series with
>> support for only a single stream.
>>
>> See version 2 of my series:
>>
>> https://lore.kernel.org/linux-media/20180808165559.29957-4-kieran.bingham@ideasonboard.com/
> 
> Was not aware of this posting, then yes I do agree with you this should 
> have been v5. Sorry about that.
> 
>>
>>
>>> reset the version. I don't feel strongly about this next submission can 
>>> remedy this if you do feel strongly about it.
>>
>> I find it very confusing to have reset the version but kept exactly the
>> same patch title.
>>
>> It's a fork of the series :D
> 
> :-)
> 
> I think this proves we need to get this driver upstream so we can start 
> submitting patches towards something and not brew our our brand of stuff 
> we have laying around and find all over the place.

I agree, It's unfortunate that the direction has rotated too many times
for this driver.

Originally it was posted with VC support as that was our development,
then I removed the VC support (v2, v3) to aim to get it upstreamed.

I can't recall now why V4 occurred with VC brought back in - but perhaps
it was because the VC work was in active development at the time - and I
thought it was making progress, but it soon became a blocker - and was
not worked on until Jacopo started looking at it again recently - and
became a complete block to reposting any V5 of MAX9286 - as the VC work
was out of date and not being rebased.

Anyway, I agree - that getting a non-multi-stream capable version of
this integrated is very beneficial, so please do continue and post a v5
(or v6 if you deem more appropriate).

Please make sure all pending review comments are explored (especially
the one from Rob Herring about using an i2c-mux node) before posting
your next version though.

--
Kieran



>>>> Did you take the last v4 and work from there?
>>>> I have made changes since the last posting. Did you get an update from
>>>> my branches?
>>>>
>>>> What changes have you made to this posting compared to whichever
>>>> patch-base you have taken to start from?
>>>
>>> I took my latest known good state and diffed it with all gmsl branches i 
>>> could find picked what seamed most recent. Then I removed multiplexed 
>>> stream support, fixed a few todos in error paths to clean up notifiers 
>>> and unified naming of the private data structure.
>>
>>
>> I'll diff your version with my latest.
>>
>> There were other review comments worked on from Sakari too., and there
>> is an outstanding comment from Rob to complete on the bindings from v4.
>>
>> --
>> Kieran
>>
>>
>>
> 

