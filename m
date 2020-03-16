Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5BE9186AB4
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730939AbgCPMQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:16:39 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:55935 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730902AbgCPMQj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:16:39 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Dofajy2jdEE3qDofdjeACI; Mon, 16 Mar 2020 13:16:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584360998; bh=Ux4QfPTmuo45GHoEzNIoN2PkPH27Qwp1lF0MnJkglaA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mBmcTlL5+8PdQCyfWhLAjkWQfGPnZna8ec49vgyP4kjECfFhbacHdcfmI6D9GvR3Q
         LwdM+LRJbME4B5nOToa31VcolSJVBw8oACLJ0Lelqt/ZLW6eiXpO7GM1zCwy0X9/Et
         ba/Iza7GCc9x9HynbB2hpahfvoFjaK/AgTqp7HJUJ0FgXwB2aT+7az+tiIwnXt9qOd
         RapiWq7kezByxMp6sm8LvfcRZc/EaDN4OGqPWKj/+eL1GRikfXVbMA9YZNpDdr1gV5
         lwtdvLIMY7OocKK03zfj4xD7WMWB/EqP8BEWqobKcH10st1rOhE9ScI/pQMYO9JEz0
         Xtu8JJpTjHWjg==
Subject: Re: [PATCH 03/16] media: ti-vpe: cal: catch error irqs and print
 errors
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-3-tomi.valkeinen@ti.com>
 <dd31db33-c73b-cb05-ac18-90643a2a0074@xs4all.nl>
 <9af07911-54e7-fb04-1e34-26f306299e6e@xs4all.nl>
 <77ef2fbd-486e-c564-806c-48686472295f@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ddca0047-626b-8b1d-b425-74f4e961046c@xs4all.nl>
Date:   Mon, 16 Mar 2020 13:16:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <77ef2fbd-486e-c564-806c-48686472295f@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ/oC2Wc9gefDOSAU2q8n0sCOR7tAgAPnLxkN7OI+uoTC9uVE1Wex8xyxt7ZNuNTXM93T2NDsiz0+uDcupJJC2NdQW8TdZZEF6MN+PkExGHWSWtv2IEd
 JpeTUh8HdYl0lWdQvoVAYdjxaZnkqjRwrd2EDvOdQ3HMSXsruTZAecWHmsO5L8i/X/JhZ9Zibsr6xbq4lvqEaZsiCCRhYqbtDRzPiZRQI68EUsIFmeikcZl6
 ZhgYED2nwvXPC8JjLxjqx2YVHxyDSl2oqqzphasj+7tAZOtzEDglv0BjtokVOhQfHQ7W6PhRnxRbfAYGBAkMOQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/16/20 1:00 PM, Tomi Valkeinen wrote:
> On 16/03/2020 12:51, Hans Verkuil wrote:
>> On 3/16/20 11:06 AM, Hans Verkuil wrote:
>>> Hi Tomi,
>>>
>>> On 3/13/20 12:41 PM, Tomi Valkeinen wrote:
>>>> CAL reports various errors via IRQs, which are not handled at all by the
>>>> current driver. Add code to enable and catch those IRQs and print
>>>> errors. This will make it much easier to notice and debug issues with
>>>> sensors.
>>>
>>> Can you rebase your series to the media_tree master branch? Other recently
>>> merged patches from Benoit now conflict with at least this patch.
>>>
>>> I reviewed this series and it looks good otherwise (just one other small comment
>>> about a confusing log message), so once I have a rebased version I can make
>>> a PR for it.
>>
>> Just to confirm: this series has been tested with a real sensor, right? If so,
>> please add a Tested-by line as well.
> 
> Yes, I'm using OV5640.
> 
> I thought tested-by by the author is implicit, unless otherwise clearly noted. But if it's the 
> custom with linux-media, I can add those.

It's not custom, but this series has a lot of low-level changes and so it's good
to have an explicit confirmation that this has been tested.

I wouldn't have asked if a v2 wasn't needed anyway.

Regards,

	Hans

> 
>   Tomi
> 

