Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4398560E10
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 02:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiF3Ab4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 20:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiF3Abz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 20:31:55 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8832A27E
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 17:31:53 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 94B3183A1C;
        Thu, 30 Jun 2022 02:31:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656549111;
        bh=tVLvSda3Qj47bsCkOqwNC9U/U5+2aIfXr0bDqC5Gudo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ihHv2IBGL3T09PJeJvJWZQbs0j3KbhQ4bqHnC5oiJoJmWzhaTpXXC8VWcct88hacp
         UNCgWvFz0KZ1MBX1pd/YonrdYUjpsRKN+zqic0/XSjizx06QMmOrrtjfb1O/jpUzv9
         63KJDlS/+POpvbmpICOSk69H+9fbbTxSQ9pgHQViw5q79xgJHygB2hcqIUlKuj109Y
         1gIThpfN7e9f1ZMD4HH4S0MT4x9pvo89syLejckJCbX7usrOJPLinQ3m7vKClom1Vz
         RhUx8zLxqlhFsAfgFpLBmLMqHpgvtZREVlYb18K/xWytD0ADLYoPrjTAHm+UsJ0zBQ
         TD8AocgD4lJqA==
Message-ID: <cfebef46-0b37-f54c-ec9a-9283eaa54a87@denx.de>
Date:   Thu, 30 Jun 2022 02:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <bc25d400-abb9-0980-ef93-6af8f5a2e42c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/29/22 15:19, Tomi Valkeinen wrote:
> On 29/06/2022 15:39, Marek Vasut wrote:
>> On 6/29/22 14:26, Tomi Valkeinen wrote:
>>
>> [...]
>>
>>>>> Perhaps the best way to solve this is just to remove the underscores
>>>>> from __v4l2_subdev_state_alloc, and change all the drivers which 
>>>>> create
>>>>> temporary v4l2_subdev_states to use that (and the free) functions. And
>>>>> also create the helper macro which can be used in those cases where 
>>>>> the
>>>>> call is simple (the state is not modified or accessed by the caller).
>>>>
>>>> As long as we prevent any new driver from using that API, that's fine
>>>> with me.
>>>
>>> An alternative would be to keep the v4l2_subdev_state as a local 
>>> variable (allocated in the stack), and add a new function, 
>>> v4l2_subdev_state_local_init() or such. The function would initialize 
>>> the given state, expecting the allocatable fields to be already 
>>> allocated (state->pads, which in the above cases points to another 
>>> local variable, i.e. stack).
>>>
>>> This would prevent the need of a free call, which, while not complex 
>>> as such, might cause a bigger amount of changes in some cases to 
>>> handle the error paths correctly.
>>>
>>> Of course, if the above-mentioned macro works, then that's the 
>>> easiest solution. But that won't work for all drivers.
>>
>> Don't you think a driver fix shouldn't involve "rework the subsystem" 
>> requirement to be applicable ?
> 
> No, but we should think what's the best way to do the fix, if the fix
> is controversial. Otherwise we might just break things even worse.
> Adding the macro seems like a much better way, and far from "rework the
> subsystem". Granted, this was just a quick edit without testing so it may
> fail miserably...
> 
> Can you try this out?

It seems to work as well. How shall we proceed ?
