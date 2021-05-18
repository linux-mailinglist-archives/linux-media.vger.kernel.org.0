Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B347838764B
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 12:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240902AbhERKT2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 06:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241172AbhERKT1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 06:19:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94497C061573
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 03:18:09 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 905C3102;
        Tue, 18 May 2021 12:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621333086;
        bh=Qvj1uYLnggxbSbCw500jJwNjv9KRc/iJCEkLSF+9M5k=;
        h=Reply-To:To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=tnXf9UK7E2FsFbIqvQN7KGn0GhOvBVa7ChX2nccqJkbVPupki+xQnls4BdQT+FBvF
         kIAll/hxcg7H1XBXKMRl0N2DBt4cwzzB93JAzTLVYrEbbH7/8cr1CnBVJdPFbeOvhX
         t3QDGnU9qlRDoNlldaQcWshjWx8Ykt3z3dZU9Pbc=
Reply-To: kieran.bingham@ideasonboard.com
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, rosenp@gmail.com
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
 <f2f72ec5-e352-132f-b8d1-718589360bf0@ideasonboard.com>
 <008aec9c-c1e6-7f8b-dde5-8fa53c1e9ee6@collabora.com>
 <92b5c1bf-f4cf-5d5e-7c16-57d4a3446f67@ideasonboard.com>
 <20210518092358.05c7a189@coco.lan>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Organization: Ideas on Board
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
Message-ID: <78322e18-2086-1eda-3b39-bbd71160be27@ideasonboard.com>
Date:   Tue, 18 May 2021 11:18:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518092358.05c7a189@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 18/05/2021 08:23, Mauro Carvalho Chehab wrote:
> Em Mon, 17 May 2021 23:13:45 +0100
> Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:
> 
>> Ah, yes I should have been clearer there - but they don't do 'anything'
>> except the bare minimum for both:
>>
>> ----------
>> kbingham@Q:/opt/projects/media/v4l-utils$ cat make-autoconf.sh
>> #!/bin/sh
>>
>> export CCACHE_DISABLE=true
>>
>> rm -rf build-autoconf
>> mkdir -p build-autoconf
>> cd build-autoconf
>> ../configure
> 
> This is not the bare minimum. It is just the opposite: the way we

Ok, I'm sorry - I need to be clearer about my being clearer.

My *scripts* don't do anything except the bare minimum to build.

I pulled out the simplest commands to build both versions so that the
times could be compared.

  - Autoconf
    mkdir; ../configure; make

  - Meson
    meson build; ninja

I expected no parameters to be passed

(Yes, I played with these in the last reply to see the effects suggested
by Ariel, but I shouldn't have to)



> intentionally implemented configure.ac is to auto-detect as much as possible
> what tools are supported and to build the maximum number of features as
> possible.

Agreed, I expect both sides to auto-detect the most features that are
possible to build on a given configuration by default, *and* I expect
both versions to detect the same.



> See, when one calls:
> 
> 	$ ./configure
> 
> It will display at the end the optional features that were enabled
> that we found important enough to report:
> 
> compile time options summary
> ============================
> 
>     Host OS                    : linux-gnu
>     X11                        : yes
>     GL                         : yes
>     glu                        : yes
>     libelf		       : yes
>     libjpeg                    : yes
>     libudev                    : yes
>     pthread                    : yes
>     QT version                 : v5.4 with QtGL
>     ALSA support               : yes
>     SDL support		       : yes
> 
>     build dynamic libs         : yes
>     build static libs          : yes
> 
>     gconv                      : no
> 
>     dynamic libv4l             : yes
>     v4l_plugins                : yes
>     v4l_wrappers               : yes
>     libdvbv5                   : yes
>     dvbv5-daemon               : yes
>     v4lutils                   : yes
>     qv4l2                      : yes
>     qvidcap                    : yes
>     v4l2-ctl uses libv4l       : yes
>     v4l2-ctl-32                : no
>     v4l2-compliance            : yes
>     v4l2-compliance uses libv4l: yes
>     v4l2-compliance-32         : no
>     BPF IR Decoders:           : no
> 
> a bare minimum setting would print most (if not all) above features
> as "no".


This is a mis-communication. I said (or intended to say?) my scripts do
the bare minimum.

I agree, if we want to compare both build systems; building the bare
minimum - then that list would be full of no's - but why would we want
to compare two build systems doing nothing.

ok, so that might be one data point, but not one I'm interested in
comparing. I want to see what differences occur between both build
systems building everything, and ensure that both produce the same result.


It would likely be useful to get a summary() of what is and isn't built
from the meson to produce a comparable output summary.


> See, we never treated internationalization or documentation as
> features. So, it won't display anything about that. It will just
> build docs and .po files by default, if the needed tools and
> libraries are present at the building system.

I think that's fine (building when possible).

I think the meson build (in my system configuration) didn't do this,
lets call that a bug in the current meson version. I've tried to
highlight that in the previous e-mail.

We need to do testing of different cases to make sure that the features
are comparable across both systems.

That's what I was trying to do.




> Yet, autotools have some options that could disable building them.
> ./configure --help is your friend[1], if you want a bare minimum
> build.

Yes, I'm aware of these options. A 'bare minimum build' was not my goal.



> [1] You can see most of the options that can be enabled/disabled with:
> 
> 	./configure --help|grep -E '(enable|disable|with)'
> 
>     The command would be similar to: 
> 
> 	./configure --disable-nls --disable-libdvbv5 --disable-dyn-libv4l --disable-v4l-utils --disable-v4l2-compliance-libv4l --disable-v4l2-ctl-libv4l --disable-qv4l2 --disable-qvidcap --disable-bpf --without-jpeg --without-libudev --disable-gconv --disable-doxygen-doc --disable-doxygen-dot --disable-doxygen-html --disable-doxygen-ps --disable-doxygen-pdf
> 
> 	here, after running the above, building with autoconf was very fast.
> 
> 		$ make clean
> 		$ time CCACHE_DISABLE=true make -j8
> 		real	0m4,594s
> 		user	0m14,050s
> 		sys	0m1,613s


This isn't what I've been comparing.

I have been trying to (or I want to) compare the performance differences
of two *full* builds on the same system. I'm sorry that my language on
the previous e-mail caused confusion there.

To clarify, I expect a
   minimal build script (*no parameters passed*)

to provide a
   maximal build configuration (everything that could be built).


And I would expect both sides to produce the same feature set.
If they don't - then it should be fixed.


>> meson build-meson
>> ninja -C build-meson
> 
> I would be expecting that the above would do the same, but
> it sounds it is lacking a lot of things...

meson build-meson; ninja -C build-meson should be building a maximal
configuration. (if it isn't, that's something to look at)

As identified, I think there are things missing, or not yet the same
which is why I've been highlighting the size of the build directories.

In particular I'm highlighting the fact that I have observed
internationalisation files are missing.


>>>> du -sh build-autoconf build-meson/
>>>> 129M	build-autoconf
>>>> 69M	build-meson/  


However I do not think that difference alone can account for a 60MB
difference.



> as otherwise the difference won't be so huge.
> 

Agreed.


> See, you're comparing very different things, as autotools is clearly
> doing a lot more than meson. If they were building the same thing, I 
> would expect a difference at the order of tens of KB at most, due to
> temporary/cache files, build logs and, in the case of autotools, m4
> files. Neither of those are huge.

Agreed.

Something is missing, that's to be investigated. That's why I've been
highlighting the difference in build output size specifically. But I do
not know what the difference is. I just built them together.


Re-reading my mail from last night - it looks like I was being overly
enthusiastic on the speed differences. I'm sorry - it was late, and I
was giddy watching it fly by. (The things people do for fun hey)

I was reporting that they are not building the same output, so I
shouldn't have made any comment on comparing speeds until they are
producing identical outputs.



> Assuming that both builds used the same compilers, a difference at 
> the order of (tens of) MB can only be explained if Meson build
> was very incomplete, and/or the output files don't carry the same
> debug info.

Indeed - compiler debug info level changes could be another thing to
check. That could account for a larger build output difference, but
there's certainly a large discrepancy to solve.


-- 
Regards
--
Kieran
