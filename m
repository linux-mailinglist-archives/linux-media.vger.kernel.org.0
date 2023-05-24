Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839BB70F5AE
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjEXLw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjEXLwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:52:24 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D514189
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:52:23 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1q1n2N-0007Ut-8v; Wed, 24 May 2023 13:52:15 +0200
Message-ID: <6b55ed5a-e02d-93c9-e57f-97cd9acba376@leemhuis.info>
Date:   Wed, 24 May 2023 13:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, de-DE
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, niklas.soderlund@ragnatech.se
References: <8360125.31r3eYUQgx@steina-w> <5676976.irdbgypaU6@steina-w>
 <ob373sf6lmg6qfkdqy5ovxescw5gp7yedb2flk4ax762abo7b3@w33eqx3erdg7>
 <6415252.e9J7NaK4W3@steina-w>
 <3u5xed27to5bnwo3dksviydw6z2lga3udjkgvvzor4tlobjlxv@hsnam3wurgxc>
 <ZEtytxcB2+DA8Xs/@kekkonen.localdomain>
 <f30d063b-e131-a659-9a1f-8f47e5736b44@leemhuis.info>
 <ZGtZGzZ3wiwiJBkp@kekkonen.localdomain>
 <618ab198-836e-16ba-4c02-476feac2ffaa@leemhuis.info>
 <ZGtlRnPE5k/W4vGY@kekkonen.localdomain>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: v4l2-async: regression due to endpoint matching
In-Reply-To: <ZGtlRnPE5k/W4vGY@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1684929143;b1460044;
X-HE-SMSGID: 1q1n2N-0007Ut-8v
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22.05.23 14:51, Sakari Ailus wrote:
> On Mon, May 22, 2023 at 02:11:29PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 22.05.23 13:59, Sakari Ailus wrote:
>>> On Mon, May 22, 2023 at 12:53:52PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> On 28.04.23 09:16, Sakari Ailus wrote:
>>>>> On Fri, Apr 28, 2023 at 08:43:21AM +0200, Jacopo Mondi wrote:
>>>>>> On Fri, Apr 28, 2023 at 08:33:30AM +0200, Alexander Stein wrote:
>>>>>>> Am Freitag, 28. April 2023, 08:31:54 CEST schrieb Jacopo Mondi:
>>>>>>>> On Fri, Apr 28, 2023 at 08:24:22AM +0200, Alexander Stein wrote:
>>>>>>>>> Am Donnerstag, 27. April 2023, 18:01:38 CEST schrieb Jacopo Mondi:
>>>>>>>>>> On Thu, Apr 27, 2023 at 04:40:46PM +0200, Alexander Stein wrote:
>>>>>>>>>>> I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attached
>>>>>>>>>>> to
>>>>>>>>>>> the MIPI CSI input.
>>>>>>>>>>> I noticed that since commit 1f391df44607 ("media: v4l2-async: Use
>>>>>>>>>>> endpoints in __v4l2_async_nf_add_fwnode_remote()") the async subdevice
>>>>>>>>>>> probing does not work anymore. If I revert that, it is working again,
>>>>>>>>>>> even on next-20230425.
>>>>>>>>>>
>>>>>>>>>> A similar issue has been discussed at
>>>>>>>>>> https://www.spinics.net/lists/linux-media/msg223351.html
>>>>>>>>>>
>>>>>>>>>> Unfortunately there was no conclusion as far as I can tell if not that
>>>>>>>>>> imx6 is now broken
>>>>>>>>>
>>>>>>>>> Thanks for the link, seems like a non-trivial thing :(
>>>>>>>>>
>>>>>>>>> From a glimpse, this series seems to deal with multiple async subdevs:
>>>>>>>>> https://lore.kernel.org/all/20230330115853.1628216-1-sakari.ailus@linux.in
>>>>>>>>> tel.com/
>>>>>>>>>
>>>>>>>>> So imx-media-csi should be adjusted as well, no?
>>>>>>>>
>>>>>>>> It would really be helpful if you can give that series a spin on imx6
>>>>>>>> if you already have a test setup.
>>>>>>>
>>>>>>> I tried, but it failed to apply on my current development tree. What base does
>>>>>>> this series apply to? Is there also a repository available I can fetch from?
>>>>>>
>>>>>> Sakari could tell, for me it applied on v6.3-rc2 but I recall I had to
>>>>>> manually fix a few things.
>>>>>
>>>>> Don't try v1, it won't work. I missed some object relation changes in the
>>>>> linked lists. I'll post v2, hopefully some time next week, to address these
>>>>> issues.
>>>>
>>>> Hi, Thorsten here, the Linux kernel's regression tracker.
>>>>
>>>> I see that v2[1] got a lot of ACKs, but is not even yet in next. And
>>>> it's a lot of patches, so maybe too much for backporting to stable
>>>> kernels. Which leads to the question: Will the regression this thread is
>>>> about (introduced in 5.19 afaics) ever be fixed in v6.1?
>>>> Normally/Ideally it should be.
>>>
>>> We'll need v3 (at least), a problem that's not trivial to fix was
>>> identified with v2. There patches aren't really fixes either: it's new
>>> functionality that wasn't there previously. I.MX6 just happened to work due
>>> to missing checks in the V4L2 async framework, what it needs was never
>>> supported (without this set).
>>>
>>> Dropping endpoint matching will break adv748x driver that relies on it.
>>>
>>> So I'd expect i.MX6 to work again once we have this set in, but I wouldn't
>>> try to backport the set.
>>
>> Thx for the update. Makes me wonder if reverting the culprit[1] is an
>> option. Assuming the problem still happens. Alexander, is that the case?
>>
>> Ciao, Thorsten
>>
>> [1] 1f391df4460 ("media: v4l2-async: Use endpoints in
>> __v4l2_async_nf_add_fwnode_remote()") (v5.19-rc1; authored by Laurent,
>> commited by Mauro (both now CCed))
> 
> I prioritise an in-kernel driver over a staging driver.

Sorry, can't follow. I track regressions all over the kernel and try to
follow the best I can, but here I failed, as I have no idea which
staging driver I mean.

I see a regression that is not really addressed and I wonder if there is
a way to fix this until a proper solution is ready. Usually in this
cases the culprit is reverted, unless that itself would cause another
regression. Is that the case here? It sounds a bit like it, but would be
great if somebody could confirm that.

Ciao, Thorsten
