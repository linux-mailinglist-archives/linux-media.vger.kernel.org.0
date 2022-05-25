Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB220533DE9
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 15:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241480AbiEYNeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 09:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238854AbiEYNeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 09:34:09 -0400
X-Greylist: delayed 319 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 May 2022 06:34:08 PDT
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F79D5044C
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 06:34:07 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4L7X2j0JCbz9ssr;
        Wed, 25 May 2022 15:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1653485325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aRQWRPkRkCsk8MA5HurITXUbflKlQ4WCJAgVg/vNYHk=;
        b=HO/tvAbhDOGVkDR3da/Ya/vEZi1mu2iAdJcq08PmEAlrtSsP9U/m4LQVZM+fk5M3j4n7TO
        QghFjVElgpTLVRc6mgQt9M3Jos4R4Z+CSDyz1MP25QCyGHcxjYZrmXUiqNxwgmGIleGeif
        JdbZd8vDyLntbeceJYQ+NuCdI7cIV61d5aiMbrcEixkOkN42TMNHepRybX/JbYBZxPQNGU
        sIGhpuHPPidUcXvJBh0HOYnyozabG2S70Vh6dqTWnNvOW7opWVUlMNohy1fxFfz9sq6F4G
        qzbkYfq7JRk1iIgSSCzHWWc9wmpHfAqCdZn0Bcmy24nDwKKeIOkzWK3A79KiGw==
Message-ID: <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org>
Date:   Wed, 25 May 2022 15:28:41 +0200
MIME-Version: 1.0
Subject: Re: Tackling the indefinite/user DMA fence problem
Content-Language: en-CA
To:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     tvrtko.ursulin@linux.intel.com, sergemetral@google.com,
        tzimmermann@suse.de, gustavo@padovan.org, Felix.Kuehling@amd.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, jason@jlekstrand.net,
        alexander.deucher@amd.com, daniels@collabora.com,
        skhawaja@google.com, sumit.semwal@linaro.org, maad.aldabagh@amd.com
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
 <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
 <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8fobohk8h85i8nfr1u7m7beikuii4hc6
X-MBO-RS-ID: acba8404cc4e0ad8a77
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2022-05-25 15:05, Daniel Vetter wrote:
> On Tue, May 17, 2022 at 12:28:17PM +0200, Christian König wrote:
>> Am 09.05.22 um 16:10 schrieb Daniel Vetter:
>>> On Mon, May 09, 2022 at 08:56:41AM +0200, Christian König wrote:
>>>> Am 04.05.22 um 12:08 schrieb Daniel Vetter:
>>>>>
>>>>> If the goal is specifically atomic kms, then there's an entire can of
>>>>> worms there that I really don't want to think about, but it exists: We
>>>>> have dma_fence as out-fences from atomic commit, and that's already
>>>>> massively broken since most drivers allocate some memory or at least take
>>>>> locks which can allocate memory in their commit path. Like i2c. Putting a
>>>>> userspace memory fence as in-fence in there makes that problem
>>>>> substantially worse, since at least in theory you're just not allowed to
>>>>> might_faul in atomic_commit_tail.
>>>> Yes, that's unfortunately one of the goals as well and yes I completely
>>>> agree on the can of worms. But I think I've solved that.
>>>>
>>>> What I do in the patch set is to enforce that the out fence is an user fence
>>>> when the driver supports user in fences as well.
>>>>
>>>> Since user fences doesn't have the memory management dependency drivers can
>>>> actually allocate memory or call I2C functions which takes locks which have
>>>> memory allocation dependencies.
>>>>
>>>> Or do I miss some other reason why you can't fault or allocate memory in
>>>> atomic_commit_tail? At least lockdep seems to be happy about that now.
>>> The problem is a bit that this breaks the uapi already. At least if the
>>> goal is to have this all be perfectly transparent for userspace - as you
>>> as you have multi-gpu setups going on at least.
>>
>> Question here is why do you think there is an UAPI break? We currently wait
>> in a work item already, so where exactly is the problem?
> 
> It's a bit washy, but dma_fence and hence implicit sync is supposed to
> finish in finite time. umf just doesn't.
> 
> Ofc in reality you can still flood your compositor and they're not very
> robust, but with umf it's trivial to just hang your compositor forever and
> nothing happens.

You can add that to the list of reasons why compositors need to stop using buffers with unsignaled fences. There's plenty of other reasons there already (the big one being that otherwise slow clients can slow down the compositor, even if the compositor uses a high priority context and the HW supports preemption).


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
