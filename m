Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA7F686BEA
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjBAQhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbjBAQhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:37:54 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA29B7A4AD
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:37:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7DA95CE2470
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F137C433EF;
        Wed,  1 Feb 2023 16:37:14 +0000 (UTC)
Message-ID: <cd679afe-765b-4da7-56bf-a1cf995f815c@xs4all.nl>
Date:   Wed, 1 Feb 2023 17:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Future of the SAA7146 drivers
Content-Language: en-US
To:     Soeren Moch <smoch@web.de>,
        Stefan Herdler <herdler@nurfuerspam.de>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <e7ee8b9f-eb4b-de7a-7cf8-fb385b2cdec2@web.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <e7ee8b9f-eb4b-de7a-7cf8-fb385b2cdec2@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/02/2023 16:20, Soeren Moch wrote:
> 
> 
> On 01.02.23 14:51, Hans Verkuil wrote:
>> Hi Sören,
>>
>> On 01/02/2023 12:35, Soeren Moch wrote:
>>
>> <snip>
>>
>>>>>> Obviously, if someone wants to do the vb2 conversion, then that would be
>>>>>> perfect. I was looking at removing analog video support, and that doesn't
>>>>>> look as easy as I thought it would be.
>>>>>>
>>> I only own full-featured (Nexus) cards, modified to also support a mode
>>> of operation like budget cards. In full-featured cards there is a
>>> possibility to re-read the decoded video output signal back, which could
>>> be similar to how analog cards work. But I never had access to
>>> analog/hybrid saa7146 cards, so I'm not sure I can test this mode. I
>>> also don't know anybody with such card who could help testing.
>>> I personally do not care much about analog card support in the driver,
>>> but will at least check which part of analog functionality is used in
>>> full-featured cards. Maybe the support for analog/hybrid cards and some
>>> test coverage comes for free with full support for full-featured cards.
>> It's the analog video streaming that uses vb2, so being able to test that
>> is critical.
>>
>> So I decided to do this differently:
>>
>> 1) I'll revert the move of saa7146 to staging, it will go back to
>>     mainline. av7110 stays in staging for now (that might change, I
>>     just don't want to make more changes than strictly necessary).
> Hm, you wrote earlier, all this staging is about vb2 conversion.
> There is no videobuf in av7110. Why this part needs to stay in staging?
> 
> How can I help here?

Right, there are two different issues here: av7110 in staging (and I wasn't
aware that these boards have no analog support) and the removal of the old videobuf.

I have not really been involved in the move of av7110 to staging, but
given the fact that it is still used, I think it would make sense to just
make the 'problematic' part of the API an av7110 driver-specific API, and
then it can be moved back.

But this is something where Mauro (CC-ed) needs to give his thoughts as well.

In any case, this is something to do after the vb2 conversion.

Regards,

	Hans

>>
>> 2) I will do the vb2 conversion. I have the analog video hardware,
>>     so I can test this.
> Great! Thanks for this!
> 
> Regards,
> Soeren
>>
>> I didn't want to spend time on that originally, but since these drivers
>> are still in use, it is probably best if I bite the bullet and just do it.
>>
>> I'm now almost done with the vb2 conversion of cx18, and it was about
>> 2 days work, which isn't that bad. I'll try to get this saa7146 vb2
>> conversion done this month.
>>
>> The PR reverting this has just been posted:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/5902a4f2-da31-816c-f3cf-020340dbaddf@xs4all.nl/
>>
>> Regards,
>>
>>     Hans
> 

