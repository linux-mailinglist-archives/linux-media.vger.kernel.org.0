Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6EFB67E5F5
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 14:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjA0NBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 08:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233974AbjA0NA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 08:00:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA67015C83
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 05:00:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E63261BAA
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 13:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275E4C433D2;
        Fri, 27 Jan 2023 13:00:52 +0000 (UTC)
Message-ID: <b282ed11-2de9-cf11-8e11-a1bd35397013@xs4all.nl>
Date:   Fri, 27 Jan 2023 14:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Can smatch handle this better? (was: [PATCH 15/17] media: i2c:
 adp1653: introduce 'no_child' label)
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
 <20230126150657.367921-16-hverkuil-cisco@xs4all.nl>
 <Y9KaFkDXIWjiKPzc@kekkonen.localdomain>
 <7bd53f49-c7ae-db42-35a7-51d7b27d079c@xs4all.nl> <Y9PGezJ9ww20xCup@kadam>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <Y9PGezJ9ww20xCup@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/01/2023 13:41, Dan Carpenter wrote:
> On Fri, Jan 27, 2023 at 08:43:51AM +0100, Hans Verkuil wrote:
>> Hi Dan,
>>
>> While trying to clean up smatch warnings in the media subsystem I came
>> across a number of 'warn: missing unwind goto?' warnings that all had
>> the same root cause as illustrated by this patch: the 'unwind' path
>> just has a variation on printk(), it is not actually cleaning up anything.
>>
>> As Sakari suggested, is this something that smatch can be improved for?
>> These false positives are a bit annoying.
>>
>> You can see the whole series here if you are interested:
>>
>> https://patchwork.linuxtv.org/project/linux-media/list/?series=9747
>>
>> Regards,
>>
> 
> Oh wow.  I really hate do nothing gotos.  The canonical bug for do
> nothing gotos is forgetting to set the error code.
> 
> I like that check because it finds a lot of error handling bugs.

I do too, I did find some real bugs with this as well.

> 
> It's not just about the printk().  I could and probably should make the
> check ignore printks.  There is also an of_node_put(child);

This are other examples in my patch series where there is only an
error message:

https://patchwork.linuxtv.org/project/linux-media/patch/20230126150657.367921-15-hverkuil-cisco@xs4all.nl/
https://patchwork.linuxtv.org/project/linux-media/patch/20230126150657.367921-17-hverkuil-cisco@xs4all.nl/

> 
> The check doesn't look at what the error handling does, only that there
> is a direct returns surrounded by gotos.
> 
> I could make the check so that it's only enabled when --spammy is turned
> on.
> 
> I guess another option would be to only enable the warning if there were
> more than one label in the cleanup section at the end of the function.
> I can make that a warning and if there is only one label, then make that
> disable unless --spammy is used.

That would cause us to miss a real bug like this:

https://patchwork.linuxtv.org/project/linux-media/patch/20230126150657.367921-8-hverkuil-cisco@xs4all.nl/

I think that if you were able to check that all the code after a goto label
consisted of variations on printk, then that would solve most of the
false positives I've seen in the media subsystem.

The few remaining ones we can work around ourselves.

Regards,

	Hans

> 
> regards,
> dan carpenter
> 

