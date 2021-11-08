Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B4D447BAF
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 09:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237871AbhKHIYP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 03:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbhKHIYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 03:24:15 -0500
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DAFC061570;
        Mon,  8 Nov 2021 00:21:30 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id jzu6meHPuFZvcjzuAmu9fn; Mon, 08 Nov 2021 09:21:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636359686; bh=RFoi1u36o6iwyIcIT7Vfr6GvFlphxvGIuYKIC0G16z8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FmWXh+KlD4fw8k9Mlz5sCVoP0jXPQBTB8oCx95xYkaJvXSO5FmPjGFtJbHclZ8PD4
         WUYd9L/ElX/yy2gVTTosgeZ2WkLIoFWacijEcjqs0KOlwTdEM/HNrD/lOEQtgZWX4x
         vLXT5e4Fl7GwR2Qa1uaYcoAhSY0eugicZj0mFaaC0bl0NMmXx6pbiQRfy5rELTxWM5
         OZEs5I+GOYYxAwO8xLwgnTDg9qj40dtDhkuj1HNiFV8WGGceb1fHKa4BwCpMqDeWvb
         mQNJXxr2lF5PEbBZgFbUfX7x5z3cE/jQHZyIX6tnVG2QNqjvQkCbbHxtYq/FysBsyr
         XWGXfWR5cbImQ==
Subject: Re: [PATCH v3 00/14] staging: media: zoran: fusion in one module
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20211026193416.1176797-1-clabbe@baylibre.com>
 <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl> <YYKxTrWI299pvqo7@Red>
 <2bbce7ef-acf8-3c0f-2705-09d34b2d92be@xs4all.nl> <YYgAb76mrMb1ERMW@Red>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <87357802-1723-0471-d963-252ec54ececd@xs4all.nl>
Date:   Mon, 8 Nov 2021 09:21:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYgAb76mrMb1ERMW@Red>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfP5ngz4eur2Syuo88BiDaT7tMabv/5gsQciFAKhEtNKRlsnKewfCSyIo2j0Hy2m4b3rLR1r+pHYti5VaKPUjrSJyajsNGIID2kaCprZ+6u6X/XKB0wrP
 y8l/xqa0S5O7vH2VUYXdgqaqxJgXaecwh6FydjolW02dGuztf8tN6ycHeH7APdnipuj11+qrGH6M4k4CCTt6XqPaSYW93bRnmoCOggcbNjyVwKNih0eGI3Yj
 yy86dTtudyxW8yNp0SuIkD10RFBzIg/7/4Jhim/VUSDm/TsaQL4uYUSdam6RAJRRr8W7JN1Y4NU8Nffj+6FabtaIS9NhYJu+dPN9aLslU7cJpiithmwKXdt3
 P1g4yWaiXsORa2l6mrGDsL3bGry4dzISfsXlUk3GJnbJgxoVUgqao9Xw363uI/HZ+hpwKB018xAnnlZbrTDNI8StNs711Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/11/2021 17:35, LABBE Corentin wrote:
> Le Wed, Nov 03, 2021 at 05:29:46PM +0100, Hans Verkuil a écrit :
>> On 03/11/2021 16:57, LABBE Corentin wrote:
>>> Le Wed, Nov 03, 2021 at 04:21:02PM +0100, Hans Verkuil a écrit :
>>>> Hi Corentin,
>>>>
>>>> On 26/10/2021 21:34, Corentin Labbe wrote:
>>>>> Hello
>>>>>
>>>>> The main change of this serie is to fusion all zoran related modules in
>>>>> one.
>>>>> This fixes the load order problem when everything is built-in.
>>>>
>>>> I've been testing this series, and while the module load/unload is now working,
>>>> I'm running into a lot of other v4l2 compliance issues.
>>>>
>>>> I've fixed various issues in some follow-up patches available in my tree:
>>>>
>>>> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran
>>>>
>>>> At least some of the worst offenders are now resolved. Note that the patch
>>>> dropping read/write support relies on this patch:
>>>>
>>>> https://patchwork.linuxtv.org/project/linux-media/patch/4f89b139-13b7-eee6-9662-996626b778b0@xs4all.nl/
>>>
>>> Hello
>>>
>>> My test branch already included your "zoran: fix various V4L2 compliance errors"
>>> I have quickly checked other patch and I am ok with them.
>>> I will add and test with them.
>>>
>>>>
>>>> But there is one really major bug that makes me hesitant to merge this:
>>>>
>>>> This works:
>>>>
>>>> v4l2-ctl -v pixelformat=MJPG,width=768,height=576
>>>> v4l2-ctl --stream-mmap
>>>>
>>>> This fails:
>>>>
>>>> v4l2-ctl -v pixelformat=MJPG,width=768,height=288
>>>> v4l2-ctl --stream-mmap
>>>>
>>>> It's an immediate lock up with nothing to indicate what is wrong.
>>>> As soon as the height is 288 or less, this happens.
>>>>
>>>> Both with my DC30 and DC30D.
>>>
>>> Just for curiosity, what is the difference between thoses two ?
>>
>> It's the DC30 variant without an adv7175.
>>
>>>
>>>>
>>>> Do you see the same? Any idea what is going on? I would feel much happier
>>>> if this is fixed.
>>>>
>>>> Note that the same problem is present without this patch series, so it's
>>>> been there for some time.
>>>>
>>>
>>> I will start on digging this problem and add thoses commands to my CI.
>>> And I know there are a huge quantity of problem since origins.
>>> A simple example is that just setting MJPEG as default input format does not work.
>>>
>>> But since it is not related to my serie, can you please merge it.
>>
>> Before I do that, I would really like to know a bit more about this issue:
>> can you reproduce it? Is it DC30 specific or a general problem with zoran?
>>
>> The problem with this hard hang is that it is hard to do regression testing
>> with v4l2-compliance, since it will hang as soon as MJPG pixelformat is
>> tested.
>>
>> I would feel much happier if the hang can be avoided, even if it is just
>> with a temporary hack. It will make it much easier going forward.
>>
> 
> I found the bug
> 
> The null pointer deref was in zoran_reap_stat_com() due to 
> buf = zr->inuse[i];
> ...
> buf->vbuf.vb2_buf.timestamp = ktime_get_ns();
> with buf = NULL;
> 
> It is due to miscalculation of "i".
> 
> I will resend my serie with the fix for that.

Excellent news! Thank you for tracking this one down.

When you post your series, can you include my patches from
https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran as well?

Regards,

	Hans
