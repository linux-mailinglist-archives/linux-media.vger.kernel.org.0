Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD3136FA25
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 14:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhD3Ma3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 08:30:29 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:40135 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229864AbhD3Ma3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 08:30:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id cSH0lhkiPk1MGcSH3lSka0; Fri, 30 Apr 2021 14:29:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619785779; bh=eBuGDvP6jpprI9FvAwTsQdzOtYN2UUA2sHz6ab5qJNA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Il3ErgOfd9uzygMgnhXCOtz8E/sK/5y7Pj2R2whHUbgcLJu7XjRUWP3UlozzIPNcy
         qpBOInO/kJ8ERCDvzHZOR+uHi/0IO206zXhFDIR0RM+xqlygEr7BhCcISqLEpWnYXq
         2+e/d8O7+QAGKw3RlFijJq9Wo5qiOslOZSi/KZ8ndAjEKMxZbia5AApeLXlaAqrzej
         Wug0s7T3KyVQurG7OGRq9S+bnfvfmdICKZXewwOOO7htCJL1YhdrarVM7q5ZEXYm8R
         td1lz6ZMs8wriMyeoqyPUB/yshd7yg9H5cshTP6Wwu6bTpp3Y8tQ8cH8dD3bEAt2Sh
         zu1kIUmV2yWFw==
Subject: Re: [PATCH v4 5/9] staging: media: atomisp: reformat code comment
 blocks
To:     Deepak R Varma <drv@mailo.com>
Cc:     Fabio Aiuto <fabioaiuto83@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <cover.1619630709.git.drv@mailo.com>
 <034c3cc993191feb8fda719dd1b2adc9e2074e78.1619630709.git.drv@mailo.com>
 <20210429070611.GA1409@agape.jhs> <YIqdT6wsrlNP/cEo@192.168.1.8>
 <693e054f-6a7b-d9e7-a72a-07d7fa295487@xs4all.nl> <YIvm4M0Gru+RpV5O@dU2104>
 <YIv3lEAC8d8LsCb+@dU2104>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <40bd5f58-9561-89bb-ada5-1cdf56d62ef8@xs4all.nl>
Date:   Fri, 30 Apr 2021 14:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YIv3lEAC8d8LsCb+@dU2104>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCkufyEQC7jnUiXS982vLsX1k+5Kg/nzRnpDkoYysb3JC3f9DlrsvjRoPNJ64qbNckX0AQ2z4fNWbRNbVx+ToE/ZKfGCsZQdTccc+GzJp5M4FI32mPR/
 lhfFM8arSlu1b4V3BrYHio+moWDryIVAlV+g0nSTOSW5so+c0L4c06iJCJPi2IrZJSRpmnXU96C2BjzSyUBCRZz0jDxms31G7hb2ip6k54tFCpN1Tk7eE9k+
 K5MbsSA058yolQ1RNrmLC/knotAXWwwfs9tg7OeTbMjAaMYt9EYlGPilpNmNBjm/vDvPcHUwnxDuEmS1gBzQFZ1TSyW7jO4PNljhs5BVUq1Om6VEiCETG9ph
 1mgbcZw6n6Pu/Acv+RSPfZRPS1ajGF9sZkgjbyiDBKtBlfSn/UXuq/1G73y85C1LYjBPBrUxyebiSTXW0MnKo9+jBiPJkfFzQQGaCq1DVWd0G+grHrs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/04/2021 14:27, Deepak R Varma wrote:
> On Fri, Apr 30, 2021 at 04:45:56PM +0530, Deepak R Varma wrote:
>> On Fri, Apr 30, 2021 at 12:04:33PM +0200, Hans Verkuil wrote:
>>> On 29/04/2021 13:49, Deepak R Varma wrote:
>>>> On Thu, Apr 29, 2021 at 09:06:12AM +0200, Fabio Aiuto wrote:
>>>>> Hi Deepak,
>>>>>>  	{MISENSOR_16BIT, 0xC868, 0x0280}, /* cam_output_width = 952 */
>>>>>>  	{MISENSOR_16BIT, 0xC86A, 0x01E0}, /* cam_output_height = 538 */
>>>>>>  	/* LOAD = Step3-Recommended
>>>>>> -	 * Patch,Errata and Sensor optimization Setting */
>>>>>> +	 * Patch,Errata and Sensor optimization Setting
>>>>>> +	 */
>>>>>
>>>>> 	/*
>>>>> 	 * LOAD = Step3-Recommended
>>>>>
>>>>> :(
>>>>
>>>> oops... sorry for the oversight. Not sure how I missed it.
>>>> I will wait for any other feedback on other patches and send
>>>> in a corrected version shortly.
>>>
>>> I've fixed this up myself.
>>>
>>> I'm taking this series and make a PR for this, wrapping up these
>>> atomisp cleanups.
>>>
>>> If you plan any more cleanups, then please do this on top of this
>>> branch: https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v5.14-out1
>>>
>>> That contains all pending cleanups for staging/media.
>>
>> Thank you Hans and everyone. Appreciate your time, comments and patience. I
>> understand this entire patch series is acceptable for your consideration and
>> that I can now move on to other changes.
>>
>> I will be sending additional clean up patches and I will base those on top of the
>> mentioned branch.
> 
> Hello Hans,
> I have cloned media_tree repository and checked out branch for-v5.14-out1
> 
> Is it okay for me to start my next patch in this branch? I do not need for
> you the last patch set to be applied to the git tree, correct?
> 

Correct.

	Hans

> Thank you,
> deepak.
> 
>>
>> Have a good one.
>> deepak.
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
> 
> 

