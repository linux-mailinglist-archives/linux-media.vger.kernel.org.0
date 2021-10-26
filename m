Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF1743B28F
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 14:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbhJZMnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 08:43:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48106 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhJZMnA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 08:43:00 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0130292;
        Tue, 26 Oct 2021 14:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635252035;
        bh=XE/r5bG9KKjT3e4v5xXdECWNT4tmJHjSb1Xd6uf9ENo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=uc8mzViGyKSujtuktffEr0LVrSTApJybdV4iH/GaB0KrO5QeekUXdEUYcJ5JtJI0o
         E/suR+9qzUN3s5QHJKtuHkRNsbfqti9bDdea8uN0byjDx5FSwFo4ZnujH18HXsdluP
         Vry27oJvav45obyqgPzYqmUP8DKFZotc1hbVezVU=
Subject: Re: [PATCH v9 00/36] v4l: subdev internal routing and streams
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <6c1dfc4d-ec8a-6643-b768-5fe507da495d@xs4all.nl>
 <60c9509b-6f39-8492-065d-72918670d49f@ideasonboard.com>
 <20211026123246.3rv7yiavf7vycx2s@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e52daa96-79a9-e80a-affb-66ee8b02919e@ideasonboard.com>
Date:   Tue, 26 Oct 2021 15:40:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026123246.3rv7yiavf7vycx2s@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/10/2021 15:32, Jacopo Mondi wrote:
> Hi Tomi,
> 
> On Tue, Oct 26, 2021 at 02:54:45PM +0300, Tomi Valkeinen wrote:
>> Hi Hans,
>>
>> On 11/10/2021 18:29, Hans Verkuil wrote:
>>> Hi Tomi,
>>>
>>> On 05/10/2021 10:57, Tomi Valkeinen wrote:
>>>> Hi,
>>>>
>>>> This is v9 of the multiplexed streams series. v8 can be found from:
>>>>
>>>> https://lore.kernel.org/all/20210830110116.488338-1-tomi.valkeinen@ideasonboard.com/
>>>>
>>>> I have pushed my work branch to:
>>>>
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git multistream/work-v9
>>>>
>>>> which contains the patches in this series, along with subdev drivers
>>>> using multiplexed streams.
>>>>
>>>> As can be guessed from the work branch, I have been testing this series
>>>> with TI's FPDLink setup. I have also done a "backwards compatibility"
>>>> test by dropping all multiplexed streams patches from the CAL driver
>>>> (the CSI-2 RX on the TI SoC), and using the FPDLink drivers with
>>>> single-stream configuration.
>>>
>>> I hope to look at this series this week (fingers crossed), but I was asked to
>>> give some input w.r.t. testing of this series:
>>
>> Thanks for the reviews! I'll start updating the series accordingly.
>>
>>> I think before this can be merged we need:
>>>
>>> 1) libcamera tests. Since libcamera would probably be the most active user of this
>>> API, and you have HW for it, it makes a lot of sense that there are decent tests
>>> for the supported HW in libcamera. That takes care of the real-world tests.
>>
>> I agree, libcamera would be a good userspace test. Laurent has been working
>> on that.
>>
>>> 2) obviously the existing utils in v4l-utils need to be adapted to understand any
>>> new API elements.
>>
>> Yes. I think it's "just" two things that are needed: ability to set a
>> routing table (that might be quite messy via the cmdline for larger routing
>> tables) and ability to set format and other parameters with a (pad,stream)
>> tuple, instead of just pad.
>>
> 
> For testing my series I have sketeched out
> https://git.sr.ht/~jmondi_/v4l2-utils
> 
> I can work to make the patches there upstreamable

Thanks, that would be great! I haven't tested your patches yet, but with 
a quick glance, looks good. The other options also need the stream 
parameter.

There's also media-ctl. It's not quite clear to me what we should have 
in media-ctl and what in v4l2-ctl.

  Tomi
