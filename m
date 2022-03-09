Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 261DE4D3139
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 15:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233609AbiCIOqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 09:46:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233599AbiCIOqf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 09:46:35 -0500
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E6313C9EA
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 06:45:33 -0800 (PST)
X-KPN-MessageId: 8d4f24e0-9fb7-11ec-8338-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 8d4f24e0-9fb7-11ec-8338-005056999439;
        Wed, 09 Mar 2022 15:45:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=La8nGDGhgJQ9wZkSTuwxqbH1o3rlSIrX/SWInpbnFPY=;
        b=Xr7TFJ9GmoF7hd/v9vBEI7GnSAn4DtAwh3XifL8ZL0ae5F8DaSFGJYM7wmD+gBszLKeG1UiAs3FRO
         z/qvRKmJavzeJymWV92+tvEnF0qmBQ2z3ejpB9ImD3RMKL0VKDO3KJu3w3qNzMw+cFSqRC9NCkBJI8
         dwdDbJ0dMo2XHx4ZbBONdoaKWXA9Hxgx02nbhAGLuP2yW4fFkbzmGnbIH+LEvRei148Cv+cx4ImQT+
         H/YrWNC5CUzOK2M2S3I6Ij5RTmKmgq2LNcPaGSoN/4q/OAgfVvFiEFauEcgY2Q3XmTo6lR6adxpW9s
         iSPTTIUjV/ph9MvyRhqoQ85QIX8OWcA==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|w+CTykaGDDQJqarV45mbCxnhKTKk1kOnEJl2jt/jq+0o+R+6GU3SYSkTBZ6hy8y
 BqJQOTZRFnOaiyzbJAQzzyw==
X-Originating-IP: 173.38.220.60
Received: from [10.47.77.219] (unknown [173.38.220.60])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 908bba10-9fb7-11ec-b2a4-005056998788;
        Wed, 09 Mar 2022 15:45:30 +0100 (CET)
Message-ID: <0504cf48-ee7f-3de8-fc3b-5e5b14aeeed1@xs4all.nl>
Date:   Wed, 9 Mar 2022 15:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220309160933.78aba02a@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/9/22 15:09, Pekka Paalanen wrote:
> On Tue, 8 Mar 2022 17:36:47 +0100
> Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> 
>> Hi Pekka,
>>
>> On 3/8/22 15:30, Pekka Paalanen wrote:
>>> On Tue, 8 Mar 2022 13:09:37 +0100
>>> Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>   
>>>> Hi Shashank,
>>>>
>>>> There is no cover letter for this series, so I'll just reply to the
>>>> first patch, but my comments are high-level and not specific to this
>>>> patch.
>>>>
>>>> To be honest, I am not at all convinced that using edid-decode as a
>>>> parser library is the right thing to do. It was never written with that
>>>> in mind.  
>>>
>>> Hi Hans,
>>>
>>> in https://www.spinics.net/lists/linux-media/msg190064.html you wrote:
> 
> ...
> 
>>>> I think edid-decode can function very well as a reference source for
>>>> a real EDID parser since edid-decode is very complete, but not as a
>>>> EDID parser library.  
>>>
>>> It would be a shame to have to fork edid-decode into something else and
>>> then play catch-up with the real edid-decode for all times to come. Or
>>> are you perhaps hoping that the fork would eventually completely
>>> supersede the original project and developers would migrate to the new
>>> one?
>>>
>>> It would be really nice to be able to involve the community around
>>> edid-decode to make sure we get the library right, but if the library
>>> is somewhere else, would that happen? Or are we left with yet another
>>> half-written ad hoc EDID parsing code base used by maybe two display
>>> servers?
>>>
>>> Maybe we could at least work on this proposal for a while to see what
>>> it will start to look like before dismissing it?  
>>
>> If you are willing to put in the effort, then I think you would have to
>> first rework the code bit by bit into different layers:
> 
> Hi Hans,
> 
> thanks! If Shashank agrees, we can see how this would start to look
> like. I suppose there would be the occasional patch series sent to this
> mailing list and publicly discussed between me and Shashank while we
> iterate. You could mostly ignore it if you want until the two of us
> need your guidance.

I am generally available on irc (channel #linux-media at irc.oftc.net)
during office hours (CET), so if you want to discuss this a bit more
interactively, then contact me there.

> Even if it turns out that this cannot go into edid-decode upstream, I
> don't think the exercise is going to go to waste. It would be the
> beginnings of a new project.
> 
>> E.g. parse_base_block() would be split into two functions: a parse_base_block()
>> that parses the base block into C structures, and it also does the conformity
>> checks, where the output of that is just written to an internal buffer, as
>> happens today. The --check-inline option functionality would be hard to support,
>> I suspect, but I think it is OK to drop that. I at least rarely use it.
> 
> For --check-inline, maybe, maybe not. open_memstream() is a thing,
> giving us a FILE*. Depending on --check-inline, the FILE* to complain
> to could be either stderr or an internal buffer from open_memstream().
> Or the C++ equivalent.
> 
>> And on top of that there is a print_base_block that produces the human
>> readable output based on the result of the parse_base_block.
>>
>> Later the parse functions can be put in a library which edid-decode uses.
>>
>> It should be possible to do this conversion bit by bit, so it's easier to merge
>> and maintain.
>>
>> But it is a *lot* of work since you will also have to make C headers for all
>> the EDID structures.
> 
> Thank you for the suggestions and warnings. I suspect we shouldn't aim
> to land the first part until we have a good idea of the later parts, so
> that edid-decode does not end up with half a conversion if the later
> parts turn out too messy.

Definitely.

Just to make expectations clear: I'm happy to give advice, and of course review
patches, but I don't have the time to help with the actual coding.

> 
>> Can the library be C++ or do you need C structs only? If C++ is OK, then that
>> will simplify matters.
> 
> The only thing that absolutely must be C is the library public API.
> What I've been imagining so far is that we would have a low-level and a
> high-level API, as I alluded to in my previous email. Other than that,
> I don't know yet.
> 
> Internals are totally fine to keep as C++.

The main reason C++ is used for edid-decode (originally it was written in plain
C) are the STL containers. It's a pain to do that in C.

Creating data structures for the parsed EDID data is definitely going to be
tricky. And remember that e.g. new CTA/DisplayID Data Block types appear
regularly, or new fields are added to existing Data Block types. So this
will need some careful thought.

> 
>> In any case, I think I would like to see a proof-of-concept where the base
>> block parsing is modified in such a way as I described above. If that makes
>> sense, then this can be extended to the other extension blocks. And for the
>> CTA and DisplayID extension blocks you can probably do the conversion one
>> Data Block type at a time.
>>
>> In any case, this series is just not useful as proof-of-concept.
> 
> I agree. A cover letter to set up your expectations would have been in order.
> 
> Btw. how does edid-decode regression testing work? I thought I asked in
> the past, but I can't find my question or answer. I know what
> edid-decode README and test/README says about it, but how does one
> actually run through the tests?

I clone https://github.com/linuxhw/EDID.git, then I have a little create.sh script
located in the checked-out EDID directory:

$ cat create.sh
rm -rf data test x.pl update.sh lst
cp -r ../edid-decode/data .
cp -r ../edid-decode/test .
rm test/README
find Analog Digital data test -type f >lst
cat <<'EOF' >x.pl
while (<>) {
        chomp;
        $f = $_;
        printf("( edid-decode --skip-sha -c -p -n \"$f\" >\"$f.new\" ; mv \"$f.new\" \"$f\" ) &\n");
        if (++$cnt % 5000 == 0) {
                printf("sleep 5;\n");
        }
}
EOF
perl x.pl lst >update.sh

echo >>update.sh
echo 'echo Test for non-ASCII characters:' >>update.sh
echo "git grep '[^ -~]' Analog Digital data" >>update.sh
chmod +x update.sh

rm x.pl lst
------------------------------------------------------

It assumes the edid-decode directory is a sibling directory.

Run this, and it will generate an update.sh script. Then run that in turn
and it will update all EDIDs using the currently installed edid-decode.
Then do 'git add data test' to add the data and test directories, and
'git commit -an' to commit it all (you probably want to make a branch
first).

Then, whenever I make changes to edid-decode I install it and run update.sh
again and check with 'git diff' that the changes are what I expected.

> 
> One thing I'm a little wary of is the edid-decode.js target in the
> Makefile. How do you test that?

Not :-)

Someone else contributed that code, and it worked for him. I really should
try to set something up so I can check it locally.

> 
> On the other hand, if merging into edid-decode does not work, a new
> project could have several benefits if I get to decide:
> 
> - Meson build system
> - automated test suite in the project
> - Gitlab workflow hosted by freedesktop.org
> - CI
> 
> I must admit it is really tempting, but I'm scared of the amount of
> work needed to establish a new project.
> 
> I assume you are not interested in any of that in the current upstream
> project, are you?

It's currently too small of a project for Meson, but if this library thing
becomes a reality, then that makes sense.

Better automated testing is always welcome. I don't want to move it to
freedesktop, mostly because as media kernel developer I do all my work
on linuxtv.org. So as long as I remain maintainer that's unlikely to change.

CI is already done: it's build every day together with the kernel media code
and v4l-utils in my daily build. Results of that are posted on the linux-media
mailinglist.

Regards,

	Hans
