Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4188A78BE9B
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 08:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbjH2Gjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 02:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233375AbjH2Gjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 02:39:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CEF185
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 23:39:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B06F861927
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 06:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5607DC433C7;
        Tue, 29 Aug 2023 06:39:32 +0000 (UTC)
Message-ID: <e8d497e2-74a7-0690-6c42-d09aecaad188@xs4all.nl>
Date:   Tue, 29 Aug 2023 08:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ANN] Introducing build scripts to test
Content-Language: en-US, nl
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linuxtv-ci@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
 <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4>
 <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl>
 <20230828194658.53c3d75c@sal.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230828194658.53c3d75c@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 28/08/2023 19:46, Mauro Carvalho Chehab wrote:
> Em Mon, 28 Aug 2023 16:14:56 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> Hi Jacopo,
>>
>> On 28/08/2023 16:05, Jacopo Mondi wrote:
>>> Hi Hans
>>>
>>> On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrote:  
>>>> Hi all,
>>>>
>>>> We have been working on simplifying the media maintenance, and one part of that is
>>>> standardizing on build tools, in particular to make it easier for patch submitters
>>>> to run their patches through the same set of tests that the daily build does.
>>>>
>>>> This helps detect issues before you submit your patches.
>>>>
>>>> I have been working since July on transforming my hackish scripts to something
>>>> that is easier to use and of better quality. While there are still a few rough
>>>> edges, I consider it good enough to have others start to use it.
>>>>
>>>> To get the build scripts run:
>>>>
>>>> git clone git://linuxtv.org/hverkuil/build-scripts.git
>>>>
>>>> All the test builds will happen within this directory. It is completely separate
>>>> from where you do you normal development, instead you point it to where your
>>>> git repository is.
>>>>
>>>> See the README contained in the build-scripts git repo for all the details on
>>>> how to set it up.
>>>>  
>>>
>>> I've been using your scripts since after ELC-E and I can tell they're
>>> useful!
>>>   
>>>> Currently the scripts expect a debian 12-based distro (likely debian 11 will work
>>>> as well). I have no idea if it works well on Red Hat or Suse. If you use one of
>>>> those distros, and you get it to work, then a patch updating the README file with
>>>> the correct list of packages to install would be welcome.
>>>>  
>>>
>>> Speaking about distros, I was wondering if you still consider a
>>> requirement to build all compiler or we should instead try to use the
>>> distro provided ones when possible to test the distro-shipped version
>>> ?  
>>
>> I strongly believe we should build the cross compilers. The reason is that
>> otherwise you get a wide variety of compiler versions, each with typically
>> different compiler warnings. It's a pain for a developer to see different
>> warnings than the person that merges those patches.
> 
> I disagree. We don't want to break build for any supported compiler version. 
> With Werror enabled, this can be tough. So, having people using different
> versions is actually a good thing.

Of course, but if you want to get your code into the kernel it is good if you
can reproduce whatever system the subsystem maintainers use to avoid wasting
time. That's the reason for using the same toolchain. The other reason is that
it allows us to switch to a new compiler quickly. Especially a new gcc major
release will often introduce a bunch of new warnings, and it is nice not having
to wait for distros to pick up a new version.

For day to day development you use whatever compiler version you want, it
is not intended that you use these cross compilers for your normal development
process. It is purely to ensure you have the same environment as the CI
environment.

> 
>> It's a a regular problem that the daily build sees different warnings than
>> you do locally with the distro's compiler.
> 
> Sparse (or smatch) will produce different warnings anyway, even with the
> same version, depending on how many times you run it, and if you create
> a database or not.
> 
>>
>> Doing it this way also makes it easier to upgrade to the latest compiler
>> version, certainly quicker than a distro would do.
> 
> Usually, Fedora is very quick upgrading to the latest compiler. Yet,
> I don't think this should be the main goal. I bet people will be a lot
> pickier if we break compilation against a gcc version on Ubuntu,
> Suse, Fedora and variants than if you break compilation about an upcoming
> gcc version that are used by just a bunch of early testers.

I only use released gcc versions, I never use pre-release versions. I leave
that to those early testers.

And this is not about breaking compilation: it is very, very rare that
a source compiles for a newer version but not for an older version.

It is primarily about compiler warnings as there is much more variation
there between compiler versions. We want to keep the number of warnings
at 0, both for -Werrors and for making it easy to detect new warnings.

By and large, newer compilers will have more warnings than older compilers,
so using the latest released compiler has been my preference over the years
that I ran the daily build.

Regards,

	Hans

> 
> Btw, there are early testers for both gcc and clang that periodically
> test them during compilers -rc stages. They'll likely identify issues
> before us (as it already happened in the past).
> 
>>
>> It's about reproducibility, really.
>>
>> Regards,
>>
>> 	Hans
>>
>>>   
>>>> Please note that running the regression tests using virtme-ng is currently only
>>>> supported on Debian 12, not on e.g. Ubuntu. Someone is looking into that, and
>>>> hopefully we can support that in the future. Running regressions tests are
>>>> primarily useful when making changes to core frameworks and public APIs, and
>>>> it is possible to run them manually (see the README).
>>>>
>>>> Since running this locally can take a fair amount of time, we hope to have
>>>> build servers available in the future so this can be offloaded.
>>>>
>>>> To give an idea of the expected build times:
>>>>
>>>> On an AMD Ryzen 9 6900HX (8 cores) a standard build of the staging tree
>>>> (build.sh -test all) takes 39 minutes.
>>>>
>>>> On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bit over 13 minutes.
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>> _______________________________________________
>>>> linuxtv-ci mailing list
>>>> linuxtv-ci@linuxtv.org
>>>> https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-ci  
>>
>>
>> _______________________________________________
>> linuxtv-ci mailing list
>> linuxtv-ci@linuxtv.org
>> https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-ci

