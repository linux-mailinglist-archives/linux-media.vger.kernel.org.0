Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608A630A48D
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 10:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhBAJma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 04:42:30 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:40119 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232850AbhBAJm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 04:42:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6ViJludMeefbk6ViMlfwZu; Mon, 01 Feb 2021 10:41:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612172507; bh=tPosW/k/pWCj/QgMFMzdRDXjw+W9gGArNvQheHav0FA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MiIpMN2QPD1dayOkyR9DNxLwXMzmG/H9fHIdhQp4xXshMqMy+mx6sOj04VB731Wqp
         txTP6tsXO8w8i6o368foIKcCpXlmLPHhWQSiO7l9Y6lmEZvwrXEcZsXFOGc5supp5Z
         eaqAD1AH0uVKX9DAp4OKV8LpdOjPymqErxNpEHeY5tOqVOXA+0MXV3lRDdQHiOyX1t
         F/C5bQntyqGKTKdiNn66OJJhJ3zMY/aGuIq9OOHGdW6VhJcMUNkDwygAMco45mXg/3
         5yZQSYAEiiHrsQaN/Cm40+gdsLPAxzVvOP71VJ+Cx7TLGcJUTQHhISzIxEkBtFS3ju
         ZlTBw4h8A0tqQ==
Subject: Re: Failing V4l2-compliance test with a sensor driver
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
References: <1821bd61-818f-5e1b-156a-3c72b2bca800@xs4all.nl>
 <20210115183449.xrkl6u2sk2su7zgp@basti-TUXEDO-Book-XA1510>
 <b4a9a516-88bb-c278-0088-d652ec588556@collabora.com>
 <20210118071500.x7e2pdszql44ncba@basti-TUXEDO-Book-XA1510>
 <bea28ee9-0cb4-4849-5e73-96e6ef1f945a@xs4all.nl>
 <20210118180306.aai3zfo5xpcr3y32@basti-TUXEDO-Book-XA1510>
 <cb50dc5e-33c6-d002-a31a-af91bbec6d6e@collabora.com>
 <7b77875c-5339-1c90-a6d8-304d56097861@xs4all.nl>
 <20210119191634.nolxxbisfdgm4gj7@basti-TUXEDO-Book-XA1510>
 <06878d92-70c2-ca24-b6c7-032becb0a0f6@xs4all.nl>
 <20210120183054.5ltnjdtrmumplevt@basti-TUXEDO-Book-XA1510>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <57a70cb9-c3b6-7de1-2109-f017284196a2@xs4all.nl>
Date:   Mon, 1 Feb 2021 10:41:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120183054.5ltnjdtrmumplevt@basti-TUXEDO-Book-XA1510>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPLJvjPvavhxHM8/WcqHc+bGNqjw2wcoe6sPpWwqpFEPhRmSuCPFwjaVl3KZ0Bcc/2sGgQEO+phEkuG6vWtm08xRh3/6UAI82mPSSiybzH0nAgLxmBBJ
 n5S8vm2PR+IGS8tfh1dqoW4YgiWUeKTYhUNNWc7X6jehfpq1hFHzMT2Vzl5dysTmDixviqc7VAQ5k3IWHx1emcINDO7RqkAGG7KQwJfSVwwkG12UNO3/3pGl
 kRIT/XQowq+3rpGaQ2Jyax9rAa61KVRwhDgEMPtYclcqjF/TLdkhEHARKIhdZkCmbvTfxyh5I98c/YMe+xKjig==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

On 20/01/2021 19:30, Sebastian Fricke wrote:
> Hello Hans,
> 
> On 20.01.2021 11:16, Hans Verkuil wrote:
>> On 19/01/2021 20:16, Sebastian Fricke wrote:
>>
>> <snip>
>>
>>> I gathered all the information you require within this paste-bin:
>>> https://paste.debian.net/1181807/
>>
>> Hmm, the problem is that v4l2-compliance can't find the media controller
>> that the subdev is part of.
>>
>> What is the output of:
>>
>> ls -l /sys/class/video4linux/v4l-subdev3
>>
>> There should be a 'device' link listed.
>>
>> Please also show the output of:
>>
>> ls -l /sys/class/video4linux/v4l-subdev3/device/
>>
>> If I compare this with the vimc test driver (using v4l-subdev0) there is a
>> media0 directory in /sys/class/video4linux/v4l-subdev0/device/ which is
>> the media controller that the subdev is associated with.
> 
> There is no `media0` folder for the ov13850 subdevice :/ I have captured
> the output for all of the subdevices as comparision.
> 
> https://paste.debian.net/1181951/

I figured out why this no longer works and I proposed a better mechanism:

https://patchwork.linuxtv.org/project/linux-media/cover/20210201093659.2945449-1-hverkuil-cisco@xs4all.nl/

Regards,

	Hans
