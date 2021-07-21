Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA443D0D59
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 13:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237734AbhGUKk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 06:40:27 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:60687 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238575AbhGUJ05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 05:26:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 695Wm0wvJhqx9695XmyZfw; Wed, 21 Jul 2021 12:04:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626861867; bh=cgcEhCAjE00nZtbq0nX2QC7407e9zYa5j31u1zfddl8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=trXRXAwSrkq9vZzkf/sRTpostu2ppufQUcwhw27zCy7sXvIHDIzDItA5rDDAngUYN
         dAnfdvSK3+NZZ1CQ2Ka2fm21uzHMc1XD8Yu+Yr1iel0JjcXZH0CSwYzL9CNh0iuRYV
         +Lk1k9uF0+rbLOhMAlQfp0ih0F1t4r93BV17IdXS0bw4/Y3PbkW0PuT2ZMpwCOVz+m
         zxqi16csKaHHUIaRebzX/zaXB/x0aS29QrUKd1oeZWoFQbb5jiKidjmFKpwcV4QkkB
         Cyr5y6FwN0eLdV9x9f3jOfmw5AO76nR9rC/tt5Akvrx+xcIyY9Ai7rMcjwgm8zrI40
         cg6gqWqR1buow==
Subject: Re: [PATCH REPOST] TDA1997x: replace video detection routine
To:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
References: <m3k0lmejlw.fsf@t19.piap.pl>
 <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl> <m3a6mgdrsa.fsf@t19.piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <99ca51b7-804e-1a53-765c-013093d38598@xs4all.nl>
Date:   Wed, 21 Jul 2021 12:04:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <m3a6mgdrsa.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNBusYnDP7cnZxsLH0s+/xhSc9LlzxKu8cBWfd/JBo2N5PllXF0Oe6WJObD//OjjMk7sLRZJhCnXool61ekCnBJsEEt3EwLeeI75Sjx2uhoo8l7EFtK4
 U43JdaZFIbC75bF9Rw0VluWp3UmSIgV+1I58To7K33uVoZgM7fe13ISIo7AMJMorne5Ko6tGGgg5qfqKGcvNZUd1ApFQ4nPhJKX1yL0usneZH1Nf4BiHhq2m
 UNar3Yzp88mCeMJxoP5JEvWR9ZYmxJsUxfVlQphWAD8gRIH2Iyfqt2jR94WkO7zC+8rOhwEzCge8UheJfQeNvt46P4KasOwD+2d396bTaG4JXxYKNAictewm
 o2nrxu3res6nk90+XaqR6bHfPiYQnFt+AbHd8oukYatc35eOroY5950yfvgmJPVTPllws4i1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/07/2021 09:56, Krzysztof Hałasa wrote:
> Hi Hans,
> 
> Hans Verkuil <hverkuil@xs4all.nl> writes:
> 
>>> --- a/drivers/media/i2c/tda1997x.c
>>> +++ b/drivers/media/i2c/tda1997x.c
>>> @@ -1092,66 +1094,71 @@ tda1997x_detect_std(struct tda1997x_state *state,
>>>  		    struct v4l2_dv_timings *timings)
> 
> ...
> 
>>> +	if (!timings)
>>> +		return 0;
>>
>> This check isn't necessary, timings is never NULL.
> 
> Well, the tda1997x_irq_sus() does this:
> 
> 	if (debug)
> 		tda1997x_detect_std(state, NULL);

Ah, I missed that. Then you can keep that check.

Regards,

	Hans

> 
> Perhaps there is a better way, but I think I will leave it for now.
> Also there is the issue of ignoring tda1997x_detect_std() return value,
> but I can now see it's only a case in tda1997x_query_dv_timings(), easy
> to fix.
> 
> Will post an update shortly.
> 
> Thanks for your comments,
> 

