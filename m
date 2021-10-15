Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F7F42F91D
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 18:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241674AbhJOQ5x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 12:57:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58950 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237756AbhJOQ5v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 12:57:51 -0400
Received: from [192.168.1.136] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15EFE2E3;
        Fri, 15 Oct 2021 18:55:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634316943;
        bh=7/6fDGlp/6eDRVoLTc/Qp0Mgt/wjHoCXDwtk4SELc44=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=TbGxbAMpE0FkhmSpa4Jh6bPZ+MX7VVZ/FL8Z+29iGa+20KX6FsRP+5omY3Lpd6EWN
         jUgtcsKAr0dXUNby0fT9D0fxHUZFCztOuJHTxuJYF3xxVcL5tmX+RXv+NR7o6A1z8j
         NmP2h5Qs5S4awWw+QinJ1P5tpx1snQSLMa+Ac1uM=
Subject: Re: [PATCH v9 27/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
 <20211015121320.c7ctjcvyvwx4mhy4@uno.localdomain>
 <465623f3-c022-7ed3-29c3-d82a0cf8c952@ideasonboard.com>
 <20211015140527.sjgtljfymhqzzflr@uno.localdomain>
 <1bf26b9c-f468-2981-aa3e-df5bdc784849@ideasonboard.com>
 <20211015152809.dew2qyt2cnyb4dtp@uno.localdomain>
 <3c5793a4-514e-e389-043c-7966e508033a@ideasonboard.com>
 <20211015164705.tn4gymf64pzbmkc6@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <3deff08f-eb71-0a6d-46ac-390ca3090172@ideasonboard.com>
Date:   Fri, 15 Oct 2021 19:55:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015164705.tn4gymf64pzbmkc6@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/10/2021 19:47, Jacopo Mondi wrote:
> Hi Tomi,
> 
> On Fri, Oct 15, 2021 at 07:10:02PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 15/10/2021 18:28, Jacopo Mondi wrote:
>>> Hi Tomi,
>>>
>>> On Fri, Oct 15, 2021 at 06:17:45PM +0300, Tomi Valkeinen wrote:
>>>> Hi,
>>>>
>>>> On 15/10/2021 17:05, Jacopo Mondi wrote:
>>>>
>>>>> Ok, I understand this allow you to
>>>>>
>>>>>            int _set_routing(sd, state, krouting)
>>>>>            {
>>>>>                    v4l2_subdev_set_routing(krouting);
>>>>>
>>>>>            }
>>>>>
>>>>>            int set_routing(sd, state, which, krouting)
>>>>>            {
>>>>>                    _set_routing(sd, state, krouting);
>>>>>                    if (which == ACTIVE)
>>>>>                            apply_to_hw();
>>>>>            }
>>>>>
>>>>>            pad_ops ops = {
>>>>>                    .set_routing = set_routing,
>>>>>            };
>>>>>
>>>>>            int init_cfg(sd, state)
>>>>>            {
>>>>>                    routes = {
>>>>>                            ...
>>>>>                    };
>>>>>
>>>>>                    krouting routing {
>>>>>                            .routes = routes,
>>>>>                            .num_routes = 1,
>>>>>                    };
>>>>>
>>>>>                    _set_routing(sd, state, &routing);
>>>>>            }
>>>>
>>>> Yes, although I would guess that the likely use of which in set_routing is
>>>>
>>>> if (which == ACTIVE && priv->streaming)
>>>> 	return -EBUSY;
>>>
>>> Not really. In my use case in example, I need to know if a route is
>>> active as according to the routing table I have to update the value of
>>> a control (the total pixel rate of the demultiplexer) and I need to
>>> update the mask of active (routed) GMSL link upon which several other
>>> operations and HW configurations to be applied at s_stream() time
>>> depend on.
>>
>> Are you allowing changing routing while streaming is enabled? You have to be
> 
> No :) What I meant is that I need to know if a route is active or not
> for other reasons, not just for disallow route changes while
> streaming.

I'm interested to hear why =). I think set_routing should mostly just 
check if the routing is valid, and that check is the same for active and 
try cases.

In your example above you call apply_to_hw(). I think that should not be 
done. The commit to HW should be done in s_stream().

  Tomi
