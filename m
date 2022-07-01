Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8535856343E
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 15:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbiGANSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 09:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiGANSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 09:18:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE86CDF21
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 06:18:14 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0559325C;
        Fri,  1 Jul 2022 15:18:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656681493;
        bh=c1wV0qsybfqq4tQiPpltSZ5XU6g0E5VTYrw+dXiMMrU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=a8WQ0wO8BpugIuy/R8MHx9iZ0FYkkGucbKYM7ubuUlMPWY6TLgbJzeybiWSWBeJPK
         Ex1qXlxS6ZYBPedlrvmYCRc42TWIU5Ysup9zEp95ceX9DLlW5/ESMsqMYpMocZbF7y
         1dk2d2wS249NwPnDzqWiEhmT17SrXGzxhTs10QHg=
Message-ID: <a4491f8e-f8f0-6333-03bb-152f7f396129@ideasonboard.com>
Date:   Fri, 1 Jul 2022 16:18:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220627174156.66919-1-marex@denx.de>
 <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
 <32f04271-4a9a-3291-cf36-ead0383db9ca@ideasonboard.com>
 <YrxDq5I3ZsEf8ruO@pendragon.ideasonboard.com>
 <df7060aa-b201-3d39-72e9-fcb575e7b43e@ideasonboard.com>
 <a2e45188-54d2-1ef2-1d21-cf60d47aeb43@denx.de>
 <bc25d400-abb9-0980-ef93-6af8f5a2e42c@ideasonboard.com>
 <cfebef46-0b37-f54c-ec9a-9283eaa54a87@denx.de>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <cfebef46-0b37-f54c-ec9a-9283eaa54a87@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/06/2022 03:31, Marek Vasut wrote:
> On 6/29/22 15:19, Tomi Valkeinen wrote:
>> On 29/06/2022 15:39, Marek Vasut wrote:
>>> On 6/29/22 14:26, Tomi Valkeinen wrote:
>>>
>>> [...]
>>>
>>>>>> Perhaps the best way to solve this is just to remove the underscores
>>>>>> from __v4l2_subdev_state_alloc, and change all the drivers which 
>>>>>> create
>>>>>> temporary v4l2_subdev_states to use that (and the free) functions. 
>>>>>> And
>>>>>> also create the helper macro which can be used in those cases 
>>>>>> where the
>>>>>> call is simple (the state is not modified or accessed by the caller).
>>>>>
>>>>> As long as we prevent any new driver from using that API, that's fine
>>>>> with me.
>>>>
>>>> An alternative would be to keep the v4l2_subdev_state as a local 
>>>> variable (allocated in the stack), and add a new function, 
>>>> v4l2_subdev_state_local_init() or such. The function would 
>>>> initialize the given state, expecting the allocatable fields to be 
>>>> already allocated (state->pads, which in the above cases points to 
>>>> another local variable, i.e. stack).
>>>>
>>>> This would prevent the need of a free call, which, while not complex 
>>>> as such, might cause a bigger amount of changes in some cases to 
>>>> handle the error paths correctly.
>>>>
>>>> Of course, if the above-mentioned macro works, then that's the 
>>>> easiest solution. But that won't work for all drivers.
>>>
>>> Don't you think a driver fix shouldn't involve "rework the subsystem" 
>>> requirement to be applicable ?
>>
>> No, but we should think what's the best way to do the fix, if the fix
>> is controversial. Otherwise we might just break things even worse.
>> Adding the macro seems like a much better way, and far from "rework the
>> subsystem". Granted, this was just a quick edit without testing so it may
>> fail miserably...
>>
>> Can you try this out?
> 
> It seems to work as well. How shall we proceed ?

I haven't had to look at this more closely, but I made proper patches of 
this and sent them for review. Note that they're not exactly the same as 
the diff here: the macro was missing lock and unlock for the subdev 
state, which I've added. Again, only compile tested.

  Tomi
