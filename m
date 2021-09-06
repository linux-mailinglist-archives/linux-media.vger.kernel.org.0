Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DE9401D63
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 17:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbhIFPHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 11:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhIFPHP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 11:07:15 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6B9C061575;
        Mon,  6 Sep 2021 08:06:10 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id NGCDmvT9n0e6wNGCEmjmQm; Mon, 06 Sep 2021 17:06:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630940766; bh=yeHa/t0AGOYf+3WJOb6kO5tvc+5inH6bRJkSTgSvV0I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PMI6lg4+idACUqyL35yCYZ9GGGWKr8OcG6ZYfC8o9ti4eowRMBfSi2HLmkvXsYc8s
         PXa1ww5aLk25Y3iJZFCFUYm88bEIJRbUdY7JnEIuqwj691uXMtSImVgd8NPuIk+fwr
         vSJwKvapZ6+8vP7hodx8Gk4TPjND67bZlpFnIUBpsjCRZR9TZTVUCoIpFEY/KpC20i
         hmX3hw8UXiJqj73O6bOMgGrRwDggX52UQfGymVkjkeEj8R76TVAXAkSgBm9Q4dpcNy
         LgLSo1yRRcsHxpyMCNMyWH4xgFGw28B46AEEOUZ7Kz4QpT2CBLJfkc18lKCdsquwAn
         WepygwiopS1UQ==
Subject: Re: [PATCH 0/8] staging: media: zoran: fusion in one module
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <efe035cc-1839-210f-c0d4-4d58801aa65c@xs4all.nl> <YTYcf3We4dcvBx1h@Red>
 <940d5bdf-89b8-b5a4-f485-aa5b1c51286b@xs4all.nl> <YTYsL5i0B48k/V0Z@Red>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3745aef0-bab0-06ee-6073-892b80fb4c8b@xs4all.nl>
Date:   Mon, 6 Sep 2021 17:06:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTYsL5i0B48k/V0Z@Red>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPe4A5wkLGAmuzlYMzRdamij6d8UPn4nlc9TZZD7roox9yA20SQmNTRN9cmzE0US4z3HGIflLVfCJ7NLjEHYE1Z9cHTRlXpU1xGDT/qlEf+/I9iv5ljq
 R+BDC2m3dOyU7l1EsLjBP0JaBvS/G+TItpqfmIlw8ir3e97cAiL5en3g07R7nLHHcA4V0UtobPd8+EPuMiWGlakdkltPcTW+NDNT51N75dw6YQZERY6ht5Kg
 DPRKCfgNqFT3hujB5BQAQjUiT9mHaqlbVrGt8O6ZBmPmXqI9MfCzOHTTNW5vsemgFX2RvyIsXFLg9IiSKsNxIeJBZapp9Isn42+8lhOwOXlNiQclbN8ifZC4
 bpFeKzGbnroE6iCxvZBRT9dIuADg6x1CPySnwJsViot8CzNXaYcKQy4Ow1DO7bq89dj8SOepfcq+7JVRSzkiL3B9o20CpiR7dgoDbZfhBS8bFk9A/5M+oJJq
 zUquhXQtuuz/w70eeQ87VwynNDuYnX9CNy5+ScZyPAHg6Pm1/0fJwKwfLYE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/09/2021 16:56, LABBE Corentin wrote:
> Le Mon, Sep 06, 2021 at 04:11:16PM +0200, Hans Verkuil a écrit :
>> On 06/09/2021 15:49, LABBE Corentin wrote:
>>> Le Mon, Sep 06, 2021 at 01:03:56PM +0200, Hans Verkuil a écrit :
>>>> Hi Corentin,
>>>>
>>>> I finally had the opportunity to test the staging zoran driver.
>>>>
>>>> I found several issues when running v4l2-compliance -s (I posted a patch
>>>> for that), but more seriously is the fact that trying to capture MJPG
>>>> at resolutions 384x288 or less just hangs my PC. It works OK with 768x576.
>>>>
>>>> I discovered this when running 'v4l2-compliance -s -a -f'.
>>>>
>>>> BTW, why isn't the initial format equal to MJPG 768x576?
>>>> I would expect that for these boards that should be the default format.
>>>>
>>>> Another issue is that the TODO should mention that for video output there
>>>> should be a second video device node. And that's really something that
>>>> has to be done before the zoran driver can be moved out of staging.
>>>>
>>>> It shouldn't be that hard to implement, I think.
>>>>
>>>> Right now it is impossible to run the compliance test for the output, since
>>>> it doesn't even see it as an output.
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>
>>> I work on having a second device for output, (it is the reason of "staging: media: zoran: move videodev alloc" which will help).
>>>
>>> But I still have the problem of non working output.
>>>
>>> Does output is really needed for going out of staging ?
>>> Probably nobody have it working for ages. The only way to had it was to use an old mplayer output which is broken since so many time.
>>> Note that this plugin will never work again.
>>>
>>> The only way to work on output is to use ffmpeg which just recently have suport for writing non-raw video to V4L.
>>
>> Then just remove it. The code for output remains in the git history so if someone wants to
>> resurrect that, then that's always possible.
>>
>> The point is that I don't want to have half-baked output support in mainline.
>>
>> But what exactly is the problem with getting output to work? Doesn't it just decode
>> MJPEG frames? (Sorry if you explained it before, it's so long ago that I looked at this
>> that I forgot the details)
>>
> 
> The first problem is that zoran dont like comment COM/APP0 markers.
> This imply a per buffer filtering but this is already handled in my next branch.
> 
> But the remaining problem is that any output is like http://kernel.montjoie.ovh/zoran_out.png.
> 
> I hacked the driver to grab a working buffer when doing input and overrun output buffer later.
> And the result is a working static output.
> So the hw handling is good and the problem came from the data feeding/handling.
> 
> I believe that something is wrong in what ffmpeg negociate/send.
> 
> Regards
> 

Why not use v4l2-ctl to capture video and then replay it? You should be able to do this:

v4l2-ctl --stream-mmap --stream-to-hdr cap.hdr --stream-count 60

then this:

v4l2-ctl --stream-out-mmap --stream-from-hdr cap.hdr

The -hdr options write the frames prefixed with a header containing the length of the frame.
That way you can capture variable-length frames and stream them out with the same payload
length.

Regards,

	Hans
