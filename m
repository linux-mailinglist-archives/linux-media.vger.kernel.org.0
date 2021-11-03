Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9075C4445E5
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 17:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhKCQc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 12:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbhKCQc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 12:32:26 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85BDC061714;
        Wed,  3 Nov 2021 09:29:49 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id iJ90mznJMFZvciJ91maBfP; Wed, 03 Nov 2021 17:29:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635956987; bh=q06/a6NhPPbSu2bM9BmCNRxXQvZOuI61JEGUeXJUBmk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j/kIIE5G6Foqc83nOSk9Sh0Lg1YlXEsAlPBK9A0zJ1ZADDVtyGLzOLvxnYOwZL7Ny
         zq4JC8OhYKbtfvfjSOfTN/jqD3QbAUQF57ueUlwGuCPMw3ZmdTA/1PhGBDNkyVEBNS
         OThhJVaPRbeL4Q2Sbvcxdw+V6i+t5iMF6J/qoJfL84WKC5ZyAysxcjWuIwn76+Efct
         zPpVf/+rBrsUQcKir0t7KVz2Q4Pt8q9NI40foLj0uOeVjCyStIQ5PgKX1jzUVuCRl9
         4615UuzmEnSPwYeHvMI8hszR+tqI29K6/EX7BhLgTKyhLpBfxdCQesPOk3bmSXz7IY
         AsrVrzgutv06Q==
Subject: Re: [PATCH v3 00/14] staging: media: zoran: fusion in one module
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20211026193416.1176797-1-clabbe@baylibre.com>
 <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl> <YYKxTrWI299pvqo7@Red>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2bbce7ef-acf8-3c0f-2705-09d34b2d92be@xs4all.nl>
Date:   Wed, 3 Nov 2021 17:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYKxTrWI299pvqo7@Red>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKrptr7PwToxoeIwYq/ugkCAdgOjfHO4zoLTeUBEDSS/u2innE/hGUZ66Te3fyxbTkVjBMlRxerT3S8vy6mKT8e5hyfuOIm4ZhZb193v1+PhlqRDShU5
 3Fcd+ERqqWANpALMP3bJvxke6askZfGEdVCJMJ3pD0WhsQmOv+8Q64aT5c9T0lEfqLMS7N1/CHKi4F4cZpDgkwUqss9R+h1x0Fs+NCj62m8+Dfhb5BJHRLP4
 Lc3MtciN5t3KEQtzwIyw88PWxgHhX40mT35qSDwx27L5WyH0khNv+cRr0eQgle18szH8IUKMhPfSPowK1oIQU/dS8okPCv1kKwgLl/b63zc5/TXicx3TUV5Z
 LTAUfEqIbmwQJItBhdL5029ynzl6tOQgtBctN/CqTyMYRRpABwMNxiBG5wHf7bmCIapWuWKmUWh7PRtToTcgR7RftBSPpV4MU5C1hhazh7zhHYKFV7HylSJ6
 GRGcRDChddSg4Wqs/llAZJr6dCbxmis9FmknTZSBI7wN1Xo0m8wQO+4QnAg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/11/2021 16:57, LABBE Corentin wrote:
> Le Wed, Nov 03, 2021 at 04:21:02PM +0100, Hans Verkuil a écrit :
>> Hi Corentin,
>>
>> On 26/10/2021 21:34, Corentin Labbe wrote:
>>> Hello
>>>
>>> The main change of this serie is to fusion all zoran related modules in
>>> one.
>>> This fixes the load order problem when everything is built-in.
>>
>> I've been testing this series, and while the module load/unload is now working,
>> I'm running into a lot of other v4l2 compliance issues.
>>
>> I've fixed various issues in some follow-up patches available in my tree:
>>
>> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran
>>
>> At least some of the worst offenders are now resolved. Note that the patch
>> dropping read/write support relies on this patch:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/4f89b139-13b7-eee6-9662-996626b778b0@xs4all.nl/
> 
> Hello
> 
> My test branch already included your "zoran: fix various V4L2 compliance errors"
> I have quickly checked other patch and I am ok with them.
> I will add and test with them.
> 
>>
>> But there is one really major bug that makes me hesitant to merge this:
>>
>> This works:
>>
>> v4l2-ctl -v pixelformat=MJPG,width=768,height=576
>> v4l2-ctl --stream-mmap
>>
>> This fails:
>>
>> v4l2-ctl -v pixelformat=MJPG,width=768,height=288
>> v4l2-ctl --stream-mmap
>>
>> It's an immediate lock up with nothing to indicate what is wrong.
>> As soon as the height is 288 or less, this happens.
>>
>> Both with my DC30 and DC30D.
> 
> Just for curiosity, what is the difference between thoses two ?

It's the DC30 variant without an adv7175.

> 
>>
>> Do you see the same? Any idea what is going on? I would feel much happier
>> if this is fixed.
>>
>> Note that the same problem is present without this patch series, so it's
>> been there for some time.
>>
> 
> I will start on digging this problem and add thoses commands to my CI.
> And I know there are a huge quantity of problem since origins.
> A simple example is that just setting MJPEG as default input format does not work.
> 
> But since it is not related to my serie, can you please merge it.

Before I do that, I would really like to know a bit more about this issue:
can you reproduce it? Is it DC30 specific or a general problem with zoran?

The problem with this hard hang is that it is hard to do regression testing
with v4l2-compliance, since it will hang as soon as MJPG pixelformat is
tested.

I would feel much happier if the hang can be avoided, even if it is just
with a temporary hack. It will make it much easier going forward.

Regards,

	Hans
