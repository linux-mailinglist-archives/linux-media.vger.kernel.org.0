Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD96375054
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 09:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbhEFHog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 03:44:36 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40531 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233340AbhEFHoe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 03:44:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eYfUlTIqRWztCeYfXlNV8B; Thu, 06 May 2021 09:43:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620287015; bh=unHdzur1Mkh9esYlD770TAZ6YmoFAcm5mK7Os/coVIw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sMFoYJbXILvJnVOJ4VXd3xsSNTTYBc7Ccl/qKglRHZfzJCqFGC3mcPSmP3II+QZtc
         GTQfvXC9WTxr8tCFanOQxw92kqL0WQMDsitdOzvdDkYxMWhYmAg63e7/4HagXvkyt/
         kDrYNpEQi5XLkMgb/6OdUdcLIACABExbcqsE9BrbZ94R+Jt91F6r2GpSyCDBaV+6TO
         pmvRj6jy5JksIzFHzjwSwSRc3CjiAvL6QdyFu21IPZaJNVwIgvwXrhksGzkBRaIoOq
         4AZnbCYthXhzwJojLt4YFlrEwjDBeiMClaeo7nA8B316ITuObXOFffS0itTJw3EOxR
         TQ9LxEzmKrhGg==
Subject: Re: [PATCH v2] media: em28xx: Fix possible memory leak of em28xx
 struct
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210504183249.6307-1-igormtorrente@gmail.com>
 <21f59c86-f1ae-5913-cde9-078fe4f6f752@linuxfoundation.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cc3a655a-e29d-34f1-a1bb-faab01a1f756@xs4all.nl>
Date:   Thu, 6 May 2021 09:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <21f59c86-f1ae-5913-cde9-078fe4f6f752@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLpAPFWbzxG1n5DD1kdMHLqnUyirtt8Hneq0LxPZ1+BryYPj/aDOYGkwJ8xNP9D7/TkB4QXqWNJbUffbjK9PwUhd4z+INi+SsBrD4kWcNWY39R15ShSE
 bjLMOY9igusoWvTFQic+dPBsKii6b00QVF1yxGbNV83Dl5Otuf+w+UPkAlTKLamUN3Dm7RTqXBuMgcj2j9M0iIQ0eqqdFb4k0Tew/A3qzdlD93zvAEV6aj4E
 fz8uCkqBAeVjAC73HBCPnqMNlurYQXVXrswn7QO3I3L7uoFrQUKz3aSLmRQsb03apMVB3gxgF6xyKXBxJNeQfMoNE5uQ5CWLtrRksGORkjgUeleDcSKnrI2C
 qANBB3Kv
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2021 17:54, Shuah Khan wrote:
> On 5/4/21 2:32 PM, Igor Matheus Andrade Torrente wrote:
>> The em28xx struct kref isn't being decreased after an error in the
>> em28xx_ir_init, leading to a possible memory leak.
>>
>> A kref_put and em28xx_shutdown_buttons is added to the error handler code.
>>
>> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
>> ---
> 
> Hi Igor,
> 
> Please look at Hans's response and comments to your v1 patch. v4l core
> addresses the lifetime issues now and this driver could be updated to
> use them instead if fixing the problems in this driver's resource
> lifetime mgmt code.

Actually, this patch is fine (I think, still need to review it). This is
related to the input part, not v4l2.

Regards,

	Hans

> 
> Please follow his review comments to address the issue based on his 
> suggestions.
> 
> thanks,
> -- Shuah
> 

