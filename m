Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E4441C88A
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 17:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345306AbhI2PhQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Sep 2021 11:37:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37798 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345157AbhI2PhP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Sep 2021 11:37:15 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAF113F0;
        Wed, 29 Sep 2021 17:35:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632929733;
        bh=zR7SkwDgwr56ozIQFIOzraEEMf4a4VLh5OTB2p2wvxY=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=ut+wuRrUg+pfDt5elG9NdZ3CzjWmNfvzM2KWCsUWbDhxdKkj6XpvsonpPWDhjq+My
         plgHHx/M6+qw1mwyDWFL5dUSS2WA49vSb9LnVsJGFWMy/+5gbfNKze/wOGuIyfxQjV
         nJ8TxTomhSQwMX+k1A2RqL0AEBTYhcxwlzi2fUYs=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-7-tomi.valkeinen@ideasonboard.com>
 <YVEiM5MHXvWK9dr/@pendragon.ideasonboard.com>
 <fdb7faf3-337c-28aa-081d-75d317c418d5@ideasonboard.com>
 <YVLJ1cWBhK8CRJoB@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 06/36] media: subdev: Add
 v4l2_subdev_validate(_and_lock)_state()
Message-ID: <926cd05b-3f1a-e964-a939-b2be5ec492c7@ideasonboard.com>
Date:   Wed, 29 Sep 2021 18:35:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVLJ1cWBhK8CRJoB@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 28/09/2021 10:52, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Tue, Sep 28, 2021 at 08:02:18AM +0300, Tomi Valkeinen wrote:
>> On 27/09/2021 04:45, Laurent Pinchart wrote:
>>> On Mon, Aug 30, 2021 at 02:00:46PM +0300, Tomi Valkeinen wrote:
>>>> All suitable subdev ops are now passed either the TRY or the ACTIVE
>>>> state by the v4l2 core. However, other subdrivers can still call the ops
>>>> passing NULL as the state, implying the active case.
>>>>
>>>> Thus all subdev drivers supporting active state need to handle the NULL
>>>> state case.
>>>
>>> Do they ? Can't we mandate that the callers pass the correct state ? Do
>>> you think that would make the transition too difficult ?
>>
>> That would limit the use of the new drivers. E.g. the sensor driver I'm
>> using works fine with CAL & co. without handling the NULL, but then the
>> sensor driver couldn't be used with "old" drivers.
> 
> I'm tempted to say that would be a good thing as it would accelerate the
> transition :-)

I tested this, and as expected the drivers I'm using work fine without 
the "validate" version. From that perspective I'm fine with dropping the 
whole "validate" concept, and just require state to be valid for the new 
multiplexed-streams-enabled drivers.

But the thing is, all the drivers I use are new, and not used in other 
hardware platforms or configurations. However, if someone ports an 
existing driver to multiplexed streams, either he has to be sure no 
other setup is using that driver, or add some kind of "validate" system.

Maybe that's still ok. I don't expect people to be rushing to port the 
drivers to multiplexed streams =).

So if there are no complaints, I'll drop the validate functions. And we 
can always add them back later for the few drivers that need them, if 
the plan goes bad...

  Tomi
