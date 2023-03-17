Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D46C6BE50E
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 10:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbjCQJLq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 05:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCQJLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 05:11:25 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E7E3A81;
        Fri, 17 Mar 2023 02:10:56 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4PdJJS0wgpz9sTs;
        Fri, 17 Mar 2023 10:10:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1679044248;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tn5PncTOyWtxRza5q2TsQE5fEAu3fMK2xK+AqAvZbho=;
        b=Y+VziNywRfRo0p0YxCt9vAJJJkXWTB2oYFB6IXyyxVPUkQuatIDv/40S0p0S9A+Q/lhVgT
        lTxCKmh9gCbe75OH5I4nJUCRqn77pF4gV6FN92wQfUOWOqsVXKsje+5oxU1c1/zgnCOMq0
        H0/SEULmLieHoXsdA7AiXQw5TIVjIloXie9iKgzbO3DWKiHRZAW2zFC7/k/0cf5SDBIaxd
        nZzNF9GokuFZdw3km6HgWQ/y173AXrLXCZH21M0OtSHKfM89JRn2d8JFeoJSSBFObO2uFa
        YNsQn9WXl9Yn94hgddXN/Duaf6YdhQ6xYPVDouaLK+AMdLBvBmi0XMg7ZXgF9Q==
Message-ID: <12626002-98db-7702-598e-28ea4a3e5061@mailbox.org>
Date:   Fri, 17 Mar 2023 10:10:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
Content-Language: de-CH-frami, en-CA
To:     Sebastian Wick <sebastian.wick@redhat.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        intel-gfx@lists.freedesktop.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Matt Turner <mattst88@gmail.com>,
        freedreno@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com> <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
 <ZBLg0t0tTVvuPuiJ@gmail.com>
 <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
 <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8afd7b6bd4c7689e5ec
X-MBO-RS-META: 7n4co8ucek6ryf9zcbhkmobgbkmu6uzh
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/16/23 23:22, Sebastian Wick wrote:
> On Thu, Mar 16, 2023 at 5:29 PM Rob Clark <robdclark@gmail.com> wrote:
>> On Thu, Mar 16, 2023 at 2:26 AM Jonas Ådahl <jadahl@gmail.com> wrote:
>>> On Wed, Mar 15, 2023 at 09:19:49AM -0700, Rob Clark wrote:
>>>> On Wed, Mar 15, 2023 at 6:53 AM Jonas Ådahl <jadahl@gmail.com> wrote:
>>>>> On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
>>>>>> On Fri, Mar 10, 2023 at 7:45 AM Jonas Ådahl <jadahl@gmail.com> wrote:
>>>>>>>
>>>>>>>> + *
>>>>>>>> + * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fence_set_deadline.
>>>>>>>> + * The deadline hint provides a way for the waiting driver, or userspace, to
>>>>>>>> + * convey an appropriate sense of urgency to the signaling driver.
>>>>>>>> + *
>>>>>>>> + * A deadline hint is given in absolute ktime (CLOCK_MONOTONIC for userspace
>>>>>>>> + * facing APIs).  The time could either be some point in the future (such as
>>>>>>>> + * the vblank based deadline for page-flipping, or the start of a compositor's
>>>>>>>> + * composition cycle), or the current time to indicate an immediate deadline
>>>>>>>> + * hint (Ie. forward progress cannot be made until this fence is signaled).
>>>>>>>
>>>>>>> Is it guaranteed that a GPU driver will use the actual start of the
>>>>>>> vblank as the effective deadline? I have some memories of seing
>>>>>>> something about vblank evasion browsing driver code, which I might have
>>>>>>> misunderstood, but I have yet to find whether this is something
>>>>>>> userspace can actually expect to be something it can rely on.
>>>>>>
>>>>>> I guess you mean s/GPU driver/display driver/ ?  It makes things more
>>>>>> clear if we talk about them separately even if they happen to be the
>>>>>> same device.
>>>>>
>>>>> Sure, sorry about being unclear about that.
>>>>>
>>>>>>
>>>>>> Assuming that is what you mean, nothing strongly defines what the
>>>>>> deadline is.  In practice there is probably some buffering in the
>>>>>> display controller.  For ex, block based (including bandwidth
>>>>>> compressed) formats, you need to buffer up a row of blocks to
>>>>>> efficiently linearize for scanout.  So you probably need to latch some
>>>>>> time before you start sending pixel data to the display.  But details
>>>>>> like this are heavily implementation dependent.  I think the most
>>>>>> reasonable thing to target is start of vblank.
>>>>>
>>>>> The driver exposing those details would be quite useful for userspace
>>>>> though, so that it can delay committing updates to late, but not too
>>>>> late. Setting a deadline to be the vblank seems easy enough, but it
>>>>> isn't enough for scheduling the actual commit.
>>>>
>>>> I'm not entirely sure how that would even work.. but OTOH I think you
>>>> are talking about something on the order of 100us?  But that is a bit
>>>> of another topic.
>>>
>>> Yes, something like that. But yea, it's not really related. Scheduling
>>> commits closer to the deadline has more complex behavior than that too,
>>> e.g. the need for real time scheduling, and knowing how long it usually
>>> takes to create and commit and for the kernel to process.
> 
> Vblank can be really long, especially with VRR where the additional
> time you get to finish the frame comes from making vblank longer.
> Using the start of vblank as a deadline makes VRR useless.

Not really. We normally still want to aim for start of vblank with VRR, which would result in the maximum refresh rate. Missing that target just incurs less of a penalty than with fixed refresh rate.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

