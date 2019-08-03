Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A209480623
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2019 14:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390291AbfHCMZR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Aug 2019 08:25:17 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38763 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389812AbfHCMZR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Aug 2019 08:25:17 -0400
Received: from [10.0.20.195] ([201.48.35.65])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tt5ohodKHqTdhtt5th5KbI; Sat, 03 Aug 2019 14:25:15 +0200
Subject: Re: [PATCH] media input infrastructure:tw686x...
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.1907291256080.16959@mbalantz-desktop>
 <40d14e23-636e-ed8a-6608-99427f5b8169@xs4all.nl>
 <alpine.OSX.2.21.1907311431410.3567@exun.local>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cdc0c943-f5be-f970-ff51-1cd14f605b01@xs4all.nl>
Date:   Sat, 3 Aug 2019 09:24:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.OSX.2.21.1907311431410.3567@exun.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMEjDcdQWAgUcUcbaKJnV6E7pCJvjqI2ps6Y52yOZWf0nXUtlGX4ctch/sN5CsEw4OjRTeDGBBkJ3qUPffIHqhX2ghi0Fx9s55LWdYJ8tCgNFIejUC/A
 Jn9AFSJbGb7zWo2mScCK6yHBiwoDQR7ARk16Ayvqy4iJw9HhSxHB7pnW0qBR5bfdfuBx68Qod5ucIIN+OSfvg6eRx7S9cG9yY6FWWQ5r3orJA0aEV17/6kMc
 iLSs02QnALJOh+kt9+nhAIy/jskrlAHnNEa4AFhWL8vnm2iu6c0v3PZ6KkM1Lb5W
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mark,

On 7/31/19 6:32 PM, Mark Balantzyan wrote:
> Hi Hans, all,
> 
> Sorry for the poor patching, I am a student and as you may tell still 
> new to this system. At the time of the patching, I wasn't fully informed 
> of all the requirements that go into such things, and am still learning.
> 
> Would it be alright if I submit a report instead? In order to, I am 
> (still, sorry) trying to understand the issue at hand. How in fact may 
> the release() callback be overridden (by a tw686x-specific function) to 
> free the dma memory and call video_device_release()? To my understanding 
> at the time, this was merely a re-implementation of video_device_release 
> with said requirements and subtraction of extra features from 
> tw686x_video_free()..

Sorry, you'll need to discuss this with your mentor. I really don't have 
time to look at reports or anything like that. I'm a media subsystem 
maintainer, not your mentor. And I expect that you spend time trying to 
understand the code by looking at how other drivers do this and look at 
kernel documentation like this:

https://linuxtv.org/downloads/v4l-dvb-apis-new/media_kapi.html

Regards,

	Hans

> 
>      This release() callback is called by the V4L2 framework when the 
> last user
>      of the device closes its filehandle, so that's a good point to free 
> all
>      the memory. Doing it earlier (as the current code does) runs the 
> risk that someone might
>      still access that memory, and you don't want that.
> 
> Yes, I definitely don't want that. :)
> 
> Thank you,
> Mark
> 

