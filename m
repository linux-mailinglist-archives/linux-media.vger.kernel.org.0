Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503DC32806E
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 15:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236233AbhCAONZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 09:13:25 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37555 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236318AbhCAONN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 09:13:13 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id GjHalOxr1xeWOGjHeljYVt; Mon, 01 Mar 2021 15:12:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614607950; bh=L0dAuQgQKLdEa5YPYaLracpPCikZID+736gr3OzkBo0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JZGWbR2tS3LDfKIuD3vKjbe1M+dLC6Jz/j0HzqTCVpk9OFDz65HKgr0CllbQTrBCf
         aeX9dnEZBX0SsCLXl0yJ6DqV1tQEk5HdgGK9gR6vYcp+HYRgl5kO65RPWqNRmMJOhS
         McwxlPFUEoUltEcE0NAcJtosX9+FQELuNvnwkpnZJxNtlvwQ2OSwTfY/JYuMNhlcm0
         hhfeykhouaETfmODeMESp43XghSgNg4H6D5FwUmbeEq8t7HVp1RoGasRcjrGbD0Ofx
         1qG9+vWg1eNDfKQi368vICdsnhmufFpVGO/DMGCSa8epp/dWBtQn8VF0ZKVAsaJfYh
         WULxjCM/SuPAw==
Subject: Re: [PATCH v4] media: add a subsystem profile documentation
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <7ac41052a64ae3cfceaa9d08a82afc9dcf2392c5.1614599129.git.mchehab+huawei@kernel.org>
 <e757851a-91a1-225b-fa6e-3c7d44a6cc5c@xs4all.nl>
 <20210301144741.11a5751b@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <885ddd09-deb5-bc8a-fd93-6a3f4ecdc5ac@xs4all.nl>
Date:   Mon, 1 Mar 2021 15:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301144741.11a5751b@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEfvgxOn1KQv4tL+mbyYWC6jPjzqXSsPnCSaioN/kGeUjUKb1t7h4WbqQvxkjgZKQD5ZGdXONaUJ4EZsl3dhQlxZpCsmF0GW68uso1UF1vTHDLprc6OP
 uxfYaJTC/SWBE2p6PMaCqgd//dYbojAzHzxFfiaLRO8iq8IN8oJMykyJMCTxOWnj8nBkFB2hMgrOQla3gNolDgfmZ+1zcp5rc6+/C+FH4/+LteUgluR4k+Yn
 eH8R09DHiHobDmjwugaJHrLtjjQR1ys74QWac26CyLXYkWfH6Y6VSfesm+MMyInoD73+cs+RBYdJZfyr3JfoKp1RnWenRzZ9fms4Myge2ke0EVjBr1z3t51Y
 xz2wRSd5aunAZygd0hKjL3ThC3amMknNETilW3rjMpC2bRh8qPreel5Dt5CWypWc4WExiDzo7vBWk7424+e6COkjcouLLFprTSRGRhl0Fbu5L5ztCcpM3KvX
 2Ib7aC6NS/A6Y+jorLcC9iiQtHJvO53G4fup1g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/03/2021 14:47, Mauro Carvalho Chehab wrote:
> Em Mon, 1 Mar 2021 13:27:39 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> Hi Mauro,
>>
> 
> Thanks for your review. I'm addressing the points on a v5.
> 
> Yet, there's one that, IMHO, we should elaborate more, if we add it to the
> doc:
> 
>>> +Provided that your patch is at https://patchwork.linuxtv.org, it should
>>> +be sooner or later handled, so you don't need to re-submit a patch.
>>> +
>>> +Except for bug fixes, we don't usually add new patches to the development
>>> +tree between -rc6 and the next -rc1.
>>> +
>>> +Please notice that the media subsystem is a high traffic one, so it
>>> +could take a while for us to be able to review your patches. Feel free
>>> +to ping if you don't get a feedback in a couple of weeks or to ask
>>> +other developers to publicly add Reviewed-by and, more importantly,
>>> +Tested-by tags.  
>>
>> What I have noticed is that sometimes important bug fixes are missed due
>> to the high traffic volume. I would like to see something along the lines of:
>>
>> "If important bug fixes are not reviewed or picked up within a week of posting,
>> then do not hesitate to ping."
> 
> I see your point, but "important" is relative ;-) I mean, a bug
> is almost always important for the one reporting it. It doesn't
> necessarily means that such bug is visible by others or if the
> subsystem's core has a serious bug.
> 
> IMO, if we add a paragraph like that, we should better explain what
> "important" means.

Hmm, I consider a fix important if without it the driver can break or
cause wrong results during normal operation. So not cleanup patches or
error handling patches.

In any case, I'd rather get some extra 'ping' reminders, than that I
forget an important patch. In general I'm fine with 'pings' after a
week.

Regards,

	Hans

> 
> Thanks,
> Mauro
> 

