Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2B9401CCD
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 16:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243042AbhIFOM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 10:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbhIFOM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 10:12:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C59C061575;
        Mon,  6 Sep 2021 07:11:19 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id NFLAmv8PJ0e6wNFLBmjYlP; Mon, 06 Sep 2021 16:11:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630937477; bh=JOLzZ7VqRiUX50FvIiVUIPyGghClF0+xkw331cYUrqo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Y1aeMPJ5mxvYANUEvGy1NKDZRyMin52EK9fTg046OigPHj1YeEPHSMKOeR7D4HT2F
         ye0Pa8Dktao1ZtaPs8KngC2IP3GVcEDohyNzdYRqtXCJElcvQsdjjGhF22QaPJ33oP
         UAS74jcllU7ZlC0hRn5gWqP7rCoQCcjrUKfS9gOoOxs6cmyGSyK9hDAxX9kF1QZweN
         OPRTveCdYVs4u1ZB5mQTqDaKFFkiZnMCglk0kggU8OE8vJPFpntKQh4AhGLysi1M7q
         qwOATwCMTmTj0tj/e4skD7C5V/7WApkUvSwiiPtjY+3bJVVGxQYvNiybQQ1UpR6dkB
         +cmWa0DCZ5NSA==
Subject: Re: [PATCH 0/8] staging: media: zoran: fusion in one module
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <efe035cc-1839-210f-c0d4-4d58801aa65c@xs4all.nl> <YTYcf3We4dcvBx1h@Red>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <940d5bdf-89b8-b5a4-f485-aa5b1c51286b@xs4all.nl>
Date:   Mon, 6 Sep 2021 16:11:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTYcf3We4dcvBx1h@Red>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKevPp5h25g9kbcNoNwuDq7cIO1nAHg8u8+yuBLhSFy1pHef+MYEqWsmLSEATIWmPqDAcotBwtjqt7GhoH1kUi5KX+D/gc2epyPZVByAOvn6ubpQXsI4
 LVeiFvMAq0l3EhAXrx1B80b8FlrZmIl99e86iQmc+q5ZSMmh9G90XCd3L0lK7/s42itoNPEBKPvu6p4J+JIYqIP6o9bqD+T9dFydbqHNm/y1Wy7vAtTOr8ry
 1YOcMJzGWxelPmY8XWwiSLVTGY/bDutz4yIghdWwo3LarhzxzKnN6borwSyvmA1cYBmsPwGT5jridissXk4KJ1bDYGhFSqrvLqiriVvyl51F7VIPLiYQiExL
 BbMTwSdCG4Rn3N7VS5BSXYyMuQ95FIwJM+GvW2D1qvm2zVgowogeEGhkYT6Ke2ASJFbUizhM4qvXciG4WY3hYorF6KuVBRAuNLvrXfzsZ0Vtr04aWV1CSGc7
 eqDUhAW0dkUq1B64r9DpCBIMAfO/sGDm+Qj7fF+0PqiravuYY8DoucAg7XE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/09/2021 15:49, LABBE Corentin wrote:
> Le Mon, Sep 06, 2021 at 01:03:56PM +0200, Hans Verkuil a écrit :
>> Hi Corentin,
>>
>> I finally had the opportunity to test the staging zoran driver.
>>
>> I found several issues when running v4l2-compliance -s (I posted a patch
>> for that), but more seriously is the fact that trying to capture MJPG
>> at resolutions 384x288 or less just hangs my PC. It works OK with 768x576.
>>
>> I discovered this when running 'v4l2-compliance -s -a -f'.
>>
>> BTW, why isn't the initial format equal to MJPG 768x576?
>> I would expect that for these boards that should be the default format.
>>
>> Another issue is that the TODO should mention that for video output there
>> should be a second video device node. And that's really something that
>> has to be done before the zoran driver can be moved out of staging.
>>
>> It shouldn't be that hard to implement, I think.
>>
>> Right now it is impossible to run the compliance test for the output, since
>> it doesn't even see it as an output.
>>
>> Regards,
>>
>> 	Hans
> 
> I work on having a second device for output, (it is the reason of "staging: media: zoran: move videodev alloc" which will help).
> 
> But I still have the problem of non working output.
> 
> Does output is really needed for going out of staging ?
> Probably nobody have it working for ages. The only way to had it was to use an old mplayer output which is broken since so many time.
> Note that this plugin will never work again.
> 
> The only way to work on output is to use ffmpeg which just recently have suport for writing non-raw video to V4L.

Then just remove it. The code for output remains in the git history so if someone wants to
resurrect that, then that's always possible.

The point is that I don't want to have half-baked output support in mainline.

But what exactly is the problem with getting output to work? Doesn't it just decode
MJPEG frames? (Sorry if you explained it before, it's so long ago that I looked at this
that I forgot the details)

In any case, before the driver can be moved out of staging video output should either
be working or removed. Either is fine, but not the halfway state it is in today.

Regards,

	Hans
