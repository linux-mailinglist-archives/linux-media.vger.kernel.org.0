Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F794D1D5B
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 17:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348283AbiCHQiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 11:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348245AbiCHQht (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 11:37:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170A151324
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 08:36:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A76E161774
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 16:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E90C340EF;
        Tue,  8 Mar 2022 16:36:48 +0000 (UTC)
Message-ID: <ac619e70-bedf-8855-f3e5-7f2aa3dc4f17@xs4all.nl>
Date:   Tue, 8 Mar 2022 17:36:47 +0100
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220308163053.70c81c0d@eldfell>
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

On 3/8/22 15:30, Pekka Paalanen wrote:
> On Tue, 8 Mar 2022 13:09:37 +0100
> Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> 
>> Hi Shashank,
>>
>> There is no cover letter for this series, so I'll just reply to the
>> first patch, but my comments are high-level and not specific to this
>> patch.
>>
>> To be honest, I am not at all convinced that using edid-decode as a
>> parser library is the right thing to do. It was never written with that
>> in mind.
> 
> Hi Hans,
> 
> in https://www.spinics.net/lists/linux-media/msg190064.html you wrote:
> 
> 	"I would be open to that. The best way would be to create a C
> 	library that turns the EDID blocks into C structures, while
> 	edid-decode itself remains C++ and uses the C library to do the
> 	parsing. While edid-decode supports a large range of Extension
> 	Blocks, a C library could probably limit itself to the base
> 	block, CTA-861 blocks and DisplayID blocks."
> 
> and
> 
> 	"I think it would make sense if it is grown as a library used
> 	by edid-decode. The edid-decode utility is under active
> 	maintenance and follows the latest EDID standards, so that will
> 	probably help the quality of the library. My main requirement
> 	would be that the edid-decode functionality is not affected,
> 	especially the conformity checks are still performed. And that
> 	support for new/updated EDID standards can easily be
> 	implemented, but that's exactly what you would want in an edid
> 	library."

Yeah, that's written a year ago. I think I was a bit too optimistic.

> 
> EDID blocks as C structures is not the API we are looking for from a
> library, but more like what edid-decode already prints out yet in
> native C types rather than strings or bit patterns. The former could
> still be the low-level library API while the latter is the high-level
> API. So perhaps edid-decode would be using the low-level API directly.
> Then the high-level C API is implemented on top of the low-level C API.
> Time would tell how much of edid-decode will move behind the low-level
> C API.
> 
> On the down-side, the high-level API implementation would need to
> duplicate the logic that already(?) exists in edid-decode to find the
> most accurate source for a piece of information in case one block
> overrides another or information from multiple blocks have to be
> combined.
> 
> In my opinion this draft does not yet have enough structure to tell
> what the interfacing between edid-decode tool and library will look
> like.

I agree. If this can be done in a reasonable way, then I have no objection.
But I will have to see some proof-of-concept code that isn't as trivial as
this.

You also need to think about which information you want to extract from the
EDID. Some things like DI-EXT, LS-EXT and VTB-EXT make no sense today as
it is rarely if ever used.

> 
>> The two purposes of edid-decode are to:
>>
>> 1) Convert the EDID to a human readable text, and
>> 2) Verify if the EDID conforms to the various standards and is internally
>>    consistent.
>>
>> As a result the state information that edid-decode stores is just the
>> state that it needs to check conformity across Extension Blocks and/or
>> Data Blocks. Most of the parsed data is just printed to stdout and checked
>> and then forgotten.
> 
> Sounds like it should be easy to store the data everywhere where
> anything is printed. Is something wrong with that? (This would be a
> different approach than what you drafted a year ago.)

I suspect that the code will become *very* messy.

> 
>> I have considered if it would make sense to make a library to parse and
>> store the EDID data and have edid-decode sit on top of that, but that will
>> make the conformity tests much harder. It's kind of interwoven with the
>> parsing and a parser library is really not interested in that anyway.
> 
> Why would conformity testing be contradictory to a parsing library?

Because some of the things that are tested are e.g. checks if padding
bytes are valid. You don't care about that when you just want to parse
an EDID into a form usable by code.

> 
> Does edid-decode just stop when it finds a problem without looking at
> the rest of the data, and would doing the latter be somehow difficult?

It continues parsing.

> 
> I would naively think that conformity testing would be easy to make
> conditional, or leave it unconditional but redirect the reports when
> the user needs to use the information even when it is broken.
> 
> The more I think of it, the more I think that display servers should do
> EDID conformance testing as part of their normal operations and log the
> results. A desktop environment could even have an UI for that: "We
> found something strange with your monitor, it might not work as
> expected. Details here..." in the more serious cases.

That's a good point.

> 
> In the long run, maybe it would make people return more monitors to
> sellers, which might cause manufacturers to pay more attention to
> getting EDID/DisplayID right. I can dream, right? :-)
> 
>> I think edid-decode can function very well as a reference source for
>> a real EDID parser since edid-decode is very complete, but not as a
>> EDID parser library.
> 
> It would be a shame to have to fork edid-decode into something else and
> then play catch-up with the real edid-decode for all times to come. Or
> are you perhaps hoping that the fork would eventually completely
> supersede the original project and developers would migrate to the new
> one?
> 
> It would be really nice to be able to involve the community around
> edid-decode to make sure we get the library right, but if the library
> is somewhere else, would that happen? Or are we left with yet another
> half-written ad hoc EDID parsing code base used by maybe two display
> servers?
> 
> Maybe we could at least work on this proposal for a while to see what
> it will start to look like before dismissing it?

If you are willing to put in the effort, then I think you would have to
first rework the code bit by bit into different layers:

E.g. parse_base_block() would be split into two functions: a parse_base_block()
that parses the base block into C structures, and it also does the conformity
checks, where the output of that is just written to an internal buffer, as
happens today. The --check-inline option functionality would be hard to support,
I suspect, but I think it is OK to drop that. I at least rarely use it.

And on top of that there is a print_base_block that produces the human
readable output based on the result of the parse_base_block.

Later the parse functions can be put in a library which edid-decode uses.

It should be possible to do this conversion bit by bit, so it's easier to merge
and maintain.

But it is a *lot* of work since you will also have to make C headers for all
the EDID structures.

Can the library be C++ or do you need C structs only? If C++ is OK, then that
will simplify matters.

In any case, I think I would like to see a proof-of-concept where the base
block parsing is modified in such a way as I described above. If that makes
sense, then this can be extended to the other extension blocks. And for the
CTA and DisplayID extension blocks you can probably do the conversion one
Data Block type at a time.

In any case, this series is just not useful as proof-of-concept.

Regards,

	Hans

> If all that fails and there is still someone left to do some work, it's
> not unthinkable to set up a completely new project with the goal to
> replicate exactly the output of edid-decode with the full EDID sample
> database you have gathered. That just feels like a lot of work without
> any help until it's perfect.
> 
> 
> Thanks,
> pq
> 
>> On 3/4/22 13:49, Shashank Sharma wrote:
>>> From: Shashank Sharma <shashank.sharma@amd.com>
>>>
>>> This patch does some small changes to make the core logic of
>>> edid-decode tool available to a shared library wrapper. With
>>> these changes, the EDID's 'state' variable will be avialble
>>> to another process via some library API calls.
>>>
>>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>
>>> Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>
>>> ---
>>>  Makefile        | 22 +++++++++++++++++++++-
>>>  edid-decode.cpp | 15 ++++++++++++++-
>>>  2 files changed, 35 insertions(+), 2 deletions(-)
