Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4103C69E014
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 13:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbjBUMRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 07:17:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234336AbjBUMRA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 07:17:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0862279C
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 04:16:16 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADACA519;
        Tue, 21 Feb 2023 13:10:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676981435;
        bh=DblJKjyKZ3R4XDYuUgHYruNyMI5ZXDRnmNEKA/L0lmE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=f6vP9bt270KFrWmC3I3yUBPsUs/GxHPRiAhJwgGTO8uynUyEy1JMNgZ1TqO908XRL
         nK0XJwp0Vk1Mrqh94WkR9fwMGNRsu58Ato7b6YcO+Sc8LHMDNkc/oU/UfWIn3BQur/
         PSJOl74uAweJMpz7GIQI07u3VUvrgP9T0fR1kKyI=
Message-ID: <4401ced5-e289-c371-cfcc-a7dd9df02407@ideasonboard.com>
Date:   Tue, 21 Feb 2023 14:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [v4l-utils] [PATCH v8 0/6] Switch build system to meson
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com
References: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
 <2fedb527-6faf-7d9b-592c-32862c18bcfa@ideasonboard.com>
 <Y/PfKEYpZwMMi0wt@pendragon.ideasonboard.com>
 <f0e27b25-dfd8-8e3d-0d27-8c9d8d30bc16@ideasonboard.com>
 <Y/Sy4Wf214M46TtX@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y/Sy4Wf214M46TtX@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/02/2023 14:02, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Tue, Feb 21, 2023 at 11:55:42AM +0200, Tomi Valkeinen wrote:
>> On 20/02/2023 22:59, Laurent Pinchart wrote:
>>> On Mon, Feb 20, 2023 at 01:13:09PM +0200, Tomi Valkeinen wrote:
>>>> On 12/02/2023 02:51, Laurent Pinchart wrote:
>>>>> Hello everybody,
>>>>>
>>>>> This series is the latest (and greatest) attempt to switch v4l-utils
>>>>> from autotools to meson.
>>>>>
>>>>> Compared to v7, the series has been rebased on top of the latest master
>>>>> branch, and lots of fixes have been added. All review comments should
>>>>> have been addressed. Detailed changelogs are included in individual
>>>>> patches, in particular in patch 3/6.
>>>>>
>>>>> The rebase was a bit painful due to the new v4l2-tracer tool and its
>>>>> code generation script. While meson handles code generation fine, it
>>>>> required fixes to the script to be able to specify the output directory
>>>>> and to generate the trace and retrace sources separately. Many thanks to
>>>>> Sakari for his help with this, which I've included in this series as
>>>>> patch 1/6.
>>>>>
>>>>> Gregor, I haven't included the Tested-by tag you gave on v7 as v8
>>>>> contains many small changes. Sorry about that.
>>>>>
>>>>> The patches are based on 3 pending patches for v4l-utils that have been
>>>>> posted to the list in the last couple of days:
>>>>>
>>>>> - libv4lconvert: Don't ignore return value of ftruncate()
>>>>> - keytable: Add -fno-stack-protector compilation option
>>>>> - configure.ac: Add option to disable compilation of v4l2-tracer
>>>>>
>>>>> None are strictly required, but I've included the equivalent of the
>>>>> second and third patches in the meson support, so I wanted to base the
>>>>> patches on top of the autotools' equivalent. I expect those three
>>>>> patches to be merged soon.
>>>>>
>>>>> As far as I can tell, meson support is now ready. I can address review
>>>>> comments in a v9 if there are any, but I'd like to merge it soon to
>>>>> avoid another painful rebase. I'll be available to fix issues on top if
>>>>> any problem is encountered later.
>>>>>
>>>>> A tag that includes this series can be found at
>>>>>
>>>>>            git://linuxtv.org/pinchartl/v4l-utils.git tags/meson-v8
>>>>
>>>> If I build this for x86 or arm64 with default options, it builds fine. If I build for arm32 (against my buildroot rootfs), the build fails:
>>>>
>>>> [197/254] Compiling C object contrib/test/v4l2gl.p/v4l2gl.c.o
>>>> FAILED: contrib/test/v4l2gl.p/v4l2gl.c.o
>>>> ccache /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc -Icontrib/test/v4l2gl.p -Icontrib/test -I../contrib/test -I../lib/include -I../include -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libdrm -I/home/tomba/work/buildroot/output32/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/valgrind -I. -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=gnu99 -O2 -g -Wpointer-arith -D_GNU_SOURCE -DPROMOTED_MODE_T=int -DENABLE_NLS -MD -MQ contrib/test/v4l2gl.p/v4l2gl.c.o -MF contrib/test/v4l2gl.p/v4l2gl.c.o.d -o contrib/test/v4l2gl.p/v4l2gl.c.o -c ../contrib/test/v4l2gl.c
>>>> ../contrib/test/v4l2gl.c:268:60: error: expected ‘,’ or ‘;’ before ‘V4L_UTILS_VERSION’
>>>>      268 | const char *argp_program_version = "V4L2 grabber version " V4L_UTILS_VERSION;
>>>>          |                                                            ^~~~~~~~~~~~~~~~~
>>>
>>> Thank you for the report. I've test-compiled for arm32, but my build
>>> environment may not have the features needed by v4l2gl.c, so it may have
>>> been skipped. Would you be able to check what goes wrong ? v4l2gl.c
>>> includes config.h, so V4L_UTILS_VERSION should be defined. Does your
>>> config.h (generated in the build directory) define V4L_UTILS_VERSION ?
>>> Does your buildroot environment provide a config.h that is being picked
>>> instead ?
>>
>> Here's my attempt fixing this. Works for me for x86, arm32 and arm64 builds:
>>
>>   From 1c6df0f68e46ad56e527d4696d3c40a173b9f505 Mon Sep 17 00:00:00 2001
>> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Date: Tue, 21 Feb 2023 11:43:11 +0200
>> Subject: [PATCH] meson: use -include to include config.h instead of -I.
>>
>> Use -include to get config.h included, instead of -I. and having the
>> source files include the config.h. The issue with the latter is that -I.
>> is rather late in the command line, and there may be config.h lurking in
>> some other project include dir (e.g. valgrind's).
>>
>> Note that this doesn't handle including the android-config.h (I think
>> the meson build files break that anyway, as they don't have the project
>> root in include path). I believe this would be best handled by somehow
>> detecting android in the main meson.build file, and adding
>> android-config.h with -include instead of the config.h
> 
> This looks good. I'll try to rebase it though, to switch to -include
> before adding meson support.

Sure, go ahead. But just note the comment about Android above =). To be 
honest, the Android support looked a bit hacky even before meson.

  Tomi

