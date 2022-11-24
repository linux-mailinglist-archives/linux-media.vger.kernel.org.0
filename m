Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1335963758D
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 10:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiKXJut (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 04:50:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiKXJus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 04:50:48 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95561129C2B
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 01:50:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B94F0CE2985
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 09:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2049C433C1;
        Thu, 24 Nov 2022 09:50:41 +0000 (UTC)
Message-ID: <7b88db0d-98c0-a34b-a4e5-77bd78fb4df4@xs4all.nl>
Date:   Thu, 24 Nov 2022 10:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     David Hildenbrand <david@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <71bdd3cf-b044-3f12-df58-7c16d5749587@xs4all.nl>
 <b437cabc-bf3f-135f-2100-13f45c16e3a3@redhat.com>
 <951827b8-22cd-2a7b-274f-25aa5dcd15cf@xs4all.nl>
 <e79ea6b6-f4a5-51e2-5d1d-e93a1cb314f4@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: videobuf2: revert "get_userptr: buffers are always
 writable"
In-Reply-To: <e79ea6b6-f4a5-51e2-5d1d-e93a1cb314f4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/11/2022 10:35, David Hildenbrand wrote:
> On 24.11.22 10:13, Hans Verkuil wrote:
>> On 24/11/2022 09:45, David Hildenbrand wrote:
>>> On 24.11.22 09:29, Hans Verkuil wrote:
>>>> Commit 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are
>>>> always writable") caused problems in a corner case (passing read-only
>>>> shmem memory as a userptr). So revert this patch.
>>>>
>>>> The original problem for which that commit was originally made is
>>>> something that I could not reproduce after reverting it. So just go
>>>> back to the way it was for many years, and if problems arise in
>>>> the future, then another approach should be taken to resolve it.
>>>>
>>>> This patch is based on a patch from Hirokazu.
>>>>
>>>> Fixes: 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always writable")
>>>> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> ---
>>>
>>> Regarding possible merge conflicts with the FOLL_FORCE patch [1] that's already in -next, would it make sense to base this patch on the FOLL_FORCE patch and routing it through the -mm tree? Or what's
>>> the best way to move forward?
>>>
>>> CCing Andrew
>>>
>>> [1] https://lkml.kernel.org/r/20221116102659.70287-17-david@redhat.com
>>>
>>
>> My preference would be to apply the removal of FOLL_FORCE *after* this
>> patch has been merged. This patch will likely be something that will be
>> backported to older kernels as well, and that's easier to do if it is
>> applied before your patch.
>>
>> I think it is best to apply your patch for this after v6.2-rc1 is released.
>> If you post a patch removing FOLL_FORCE to linux-media once v6.2-rc1 is released,
>> then I can ensure it will be merged in a later v6.2-rcX.
> 
> Such dependencies with the -MM tree usually imply trouble. :/
> 
> There are two ways:
> 
> 1) Andrew picks up your patch and we rebase my patch based on yours. All goes in via the -mm tree in -rc1.

That also works. Perhaps it's a better approach. If Andrew agrees, then I'll repost
my patch with a CC to linux-mm and Andrew.

Regards,

	Hans

> 
> 2) Andrew drops my patch and you apply the rebased patch later.
> 
> 
> Applying patches after v6.2-rc1 doesn't really give them the chance to lurk in -next for a longer time, and it kind-of feels wrong for something that doesn't have a fixed tag attached. But I don't
> care as long as we don't unnecessarily delay the FOLL_FORCE cleanup from getting merged.
> 
> @Andrew?
> 

