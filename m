Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF154D3258
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 17:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbiCIQBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 11:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiCIQBo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 11:01:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A764163047
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 08:00:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E5F02B8221F
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 16:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7B4C340E8;
        Wed,  9 Mar 2022 16:00:38 +0000 (UTC)
Message-ID: <537898d2-3168-b4b0-abb2-81a2b184ab55@xs4all.nl>
Date:   Wed, 9 Mar 2022 17:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Content-Language: en-US
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Shashank Sharma <contactshashanksharma@gmail.com>,
        linux-media@vger.kernel.org,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
 <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
 <20220308163053.70c81c0d@eldfell>
 <ac619e70-bedf-8855-f3e5-7f2aa3dc4f17@xs4all.nl>
 <20220309160933.78aba02a@eldfell>
 <0504cf48-ee7f-3de8-fc3b-5e5b14aeeed1@xs4all.nl>
 <20220309175713.7eecddae@eldfell>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220309175713.7eecddae@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pekka,

On 3/9/22 16:57, Pekka Paalanen wrote:
> On Wed, 9 Mar 2022 15:45:29 +0100
> Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> 
>> On 3/9/22 15:09, Pekka Paalanen wrote:
>>> On Tue, 8 Mar 2022 17:36:47 +0100
>>> Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>   
>>>> Hi Pekka,
>>>>
>>>> On 3/8/22 15:30, Pekka Paalanen wrote:  
>>>>> On Tue, 8 Mar 2022 13:09:37 +0100
>>>>> Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>>     
>>>>>> Hi Shashank,
>>>>>>
>>>>>> There is no cover letter for this series, so I'll just reply to the
>>>>>> first patch, but my comments are high-level and not specific to this
>>>>>> patch.
>>>>>>
>>>>>> To be honest, I am not at all convinced that using edid-decode as a
>>>>>> parser library is the right thing to do. It was never written with that
>>>>>> in mind.    
>>>>>
>>>>> Hi Hans,
>>>>>
>>>>> in https://www.spinics.net/lists/linux-media/msg190064.html you wrote:  
>>>
>>> ...
>>>   
>>>>>> I think edid-decode can function very well as a reference source for
>>>>>> a real EDID parser since edid-decode is very complete, but not as a
>>>>>> EDID parser library.    
>>>>>
>>>>> It would be a shame to have to fork edid-decode into something else and
>>>>> then play catch-up with the real edid-decode for all times to come. Or
>>>>> are you perhaps hoping that the fork would eventually completely
>>>>> supersede the original project and developers would migrate to the new
>>>>> one?
>>>>>
>>>>> It would be really nice to be able to involve the community around
>>>>> edid-decode to make sure we get the library right, but if the library
>>>>> is somewhere else, would that happen? Or are we left with yet another
>>>>> half-written ad hoc EDID parsing code base used by maybe two display
>>>>> servers?
>>>>>
>>>>> Maybe we could at least work on this proposal for a while to see what
>>>>> it will start to look like before dismissing it?    
>>>>
>>>> If you are willing to put in the effort, then I think you would have to
>>>> first rework the code bit by bit into different layers:  
>>>
>>> Hi Hans,
>>>
>>> thanks! If Shashank agrees, we can see how this would start to look
>>> like. I suppose there would be the occasional patch series sent to this
>>> mailing list and publicly discussed between me and Shashank while we
>>> iterate. You could mostly ignore it if you want until the two of us
>>> need your guidance.  
>>
>> I am generally available on irc (channel #linux-media at irc.oftc.net)
>> during office hours (CET), so if you want to discuss this a bit more
>> interactively, then contact me there.
> 
> Cool, I'm on EET.
> 
>> Just to make expectations clear: I'm happy to give advice, and of course review
>> patches, but I don't have the time to help with the actual coding.
> 
> That is what I was hoping for, thanks!
> 
>> The main reason C++ is used for edid-decode (originally it was written in plain
>> C) are the STL containers. It's a pain to do that in C.
>>
>> Creating data structures for the parsed EDID data is definitely going to be
>> tricky. And remember that e.g. new CTA/DisplayID Data Block types appear
>> regularly, or new fields are added to existing Data Block types. So this
>> will need some careful thought.
> 
> Right.
> 
>>> Btw. how does edid-decode regression testing work? I thought I asked in
>>> the past, but I can't find my question or answer. I know what
>>> edid-decode README and test/README says about it, but how does one
>>> actually run through the tests?  
>>
>> I clone https://github.com/linuxhw/EDID.git, then I have a little create.sh script
>> located in the checked-out EDID directory:
>>
>> $ cat create.sh
>> rm -rf data test x.pl update.sh lst
>> cp -r ../edid-decode/data .
>> cp -r ../edid-decode/test .
>> rm test/README
>> find Analog Digital data test -type f >lst
>> cat <<'EOF' >x.pl
>> while (<>) {
>>         chomp;
>>         $f = $_;
>>         printf("( edid-decode --skip-sha -c -p -n \"$f\" >\"$f.new\" ; mv \"$f.new\" \"$f\" ) &\n");
>>         if (++$cnt % 5000 == 0) {
>>                 printf("sleep 5;\n");
>>         }
>> }
>> EOF
>> perl x.pl lst >update.sh
>>
>> echo >>update.sh
>> echo 'echo Test for non-ASCII characters:' >>update.sh
>> echo "git grep '[^ -~]' Analog Digital data" >>update.sh
>> chmod +x update.sh
>>
>> rm x.pl lst
>> ------------------------------------------------------
>>
>> It assumes the edid-decode directory is a sibling directory.
>>
>> Run this, and it will generate an update.sh script. Then run that in turn
>> and it will update all EDIDs using the currently installed edid-decode.
>> Then do 'git add data test' to add the data and test directories, and
>> 'git commit -an' to commit it all (you probably want to make a branch
>> first).
>>
>> Then, whenever I make changes to edid-decode I install it and run update.sh
>> again and check with 'git diff' that the changes are what I expected.
> 
> Thanks for explaining.
> 
> Shashank, I think you need to use this testing procedure routinely to
> make sure your patches do not change edid-decode behaviour, at least
> with a sub-set of the EDID files.
> 
>>>
>>> One thing I'm a little wary of is the edid-decode.js target in the
>>> Makefile. How do you test that?  
>>
>> Not :-)
>>
>> Someone else contributed that code, and it worked for him. I really should
>> try to set something up so I can check it locally.
> 
> Do you mind if we won't be testing that either?

That's fine.

> 
>>>
>>> On the other hand, if merging into edid-decode does not work, a new
>>> project could have several benefits if I get to decide:
>>>
>>> - Meson build system
>>> - automated test suite in the project
>>> - Gitlab workflow hosted by freedesktop.org
>>> - CI
>>>
>>> I must admit it is really tempting, but I'm scared of the amount of
>>> work needed to establish a new project.
>>>
>>> I assume you are not interested in any of that in the current upstream
>>> project, are you?  
>>
>> It's currently too small of a project for Meson, but if this library thing
>> becomes a reality, then that makes sense.
>>
>> Better automated testing is always welcome.
> 
> Those are great to hear!
> 
>> I don't want to move it to
>> freedesktop, mostly because as media kernel developer I do all my work
>> on linuxtv.org. So as long as I remain maintainer that's unlikely to change.
> 
> Of course.
> 
>> CI is already done: it's build every day together with the kernel media code
>> and v4l-utils in my daily build. Results of that are posted on the linux-media
>> mailinglist.
> 
> Nice, but that is after merging patches, right? I was thinking
> pre-merge.

Not sure what useful pre-merge testing can be done other than just running 'make' :-)

Regards,

	Hans

> 
> 
> Thanks,
> pq
