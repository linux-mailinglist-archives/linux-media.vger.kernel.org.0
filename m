Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF2232D046
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 11:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238184AbhCDJ71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 04:59:27 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57705 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232627AbhCDJ7D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 04:59:03 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HkkLlZNLLOruFHkkPlF9vw; Thu, 04 Mar 2021 10:58:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614851901; bh=ES168cklwtO00N3Q1etdawmulA8zSUSkQa2nF8S85Bw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rKc2Jtt7RAZ25cUXAZ57wqeiVfHBzcZHymUjUGQs9l0IhuKjGuL+3x+eWELtJRY/5
         a0nlfTIqjCa4yPqfLlNKOL6MgytPXyAlu8UW6K1pPwhOB4mHCpkilK/FAcbJRUFKYm
         FJDfdn5PjWyCqZVySzczApBmcdf2t8sgaw+DVZXgza1NUDeUyVGeqo67qA8oUKPV1I
         80bcP4/bv90URO+4ExDp2pJuP9GAWYsKxVK4MiRbOjlLIqulYfAsIWJ0MaG6X15UZF
         +jeGu0y64d3tR2ks9XZb0DR6emB+B481FORgDnhiABFpRqPHTq1nc+FGwN8zVNWMbG
         a9uGg+M17Mtiw==
Subject: Re: v4l2loopback and v4l2-mem2mem framework
To:     Wren Turkal <wt@penguintechs.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
 <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org>
 <CAAEAJfCSfwxv5NyaH05Dfiw4wm6vGxL_ajoFup6r-GKx_VymJA@mail.gmail.com>
 <86f1dd6b-7593-adba-b5a6-abf4f8e35d8b@penguintechs.org>
 <b0c87b78-de21-07b5-6ae0-39401cf005b9@penguintechs.org>
 <2a70dbaaee14acd5652c80df2176ac9b183c6e1b.camel@ndufresne.ca>
 <4b7ddda5-47bf-8514-feb2-f66df9219850@penguintechs.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7011308c-9127-fcce-4635-c3095a540ecc@xs4all.nl>
Date:   Thu, 4 Mar 2021 10:58:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4b7ddda5-47bf-8514-feb2-f66df9219850@penguintechs.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCzN5VAiGiYeiS9LHgiiWfRoRNDIICxQxHi6CwH0uHTqTo6EE57cbTXdpg2Y2WXjBmib8QU9u7uLMQ6xQ+U7bL3Syw3OaeEeFbvUHJwOxl1J6LLT2W4K
 D2rcuCqaW2Ahpf5xYUr0gVIV9MOFLb8ki+vaessGL+VX/IRaKwzWL0F5FGUwOZn3RJRCpYnpVXtad9ojpaPRIsEgiEqakgxhQZUcyZHq8/oAJZ7+cXxJEZE2
 xzszuGhoUi0vKJaG+l25nY7vnhWxYCL4QlHqyqAHazzdr0Kq3fe0U+wSzxVuZl72Wy6U43mGlHYyUVtY72cvNw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/03/2021 00:41, Wren Turkal wrote:
> Questions below.
> 
> On 3/3/21 2:41 PM, Nicolas Dufresne wrote:
>> No, since m2m are instance base, you cannot have two process operating on the
>> same node (there is only 1 streaming state). You'd probably want to look at
>> extending the VIMC driver instead. It's a virtual media controller, it's missing
>> few bits to make loopback possible, but would be a good fit.
>>
>> Note that vivid have a loopback capability, but it does not constraint the
>> width/height/format and will produce a test pattern if you request something
>> that differ from the source.
> 
> I am not sure which you're suggesting to use: vivid or vimc. Also, are you
> suggesting to extend them or use them as a template for a new module?

I don't think either vimc nor vivid are particularly suitable for this, although
vivid comes close. You can certainly lift ideas from vivid.

> I think you are saying that vivid can already do loopback. However vivid is
> a test driver and, like vim2m, doesn't ship with distribution kernels. Should I
> try to move it out of the test-drivers?
> 
>> It is very buggy, it often return a queued buffer back, and in fact, if you try
>> to use the queue too much it fails. Though all this would probably be fine if
>> you port it to VB2.
> 
> I am assuming you are saying to port v4l2loopback to vb2. I am working on that
> right now, but I am not sure how to proceed since the vb2 needs a queue for
> capture and a queue for output (since they cannot be the same). I have created
> the queues, but I am not sure how to further integrate. Please check out the
> WIP here:
> https://github.com/wt/v4l2loopback/commit/e71b0a50427729a5e6e74443066751f7321dc404
> 
> If the m2m is the wrong approach, do you have any suggestions for how to
> proceed?

You need two video devices, one capture, one output. I see that the current
loopback driver has just one video device and advertises it as a M2M device,
but that's not what it should do. Creating two video devices (similar to what
vivid does) is the best and most compatible approach.

> 
> Also, I am currently making a change for the linux kernel moving this code
> info drivers/media/v4l2-core/v4l2-loopback.c so that I can start iterating
> with your feedback. Is that a correct place to put this code?

No, v4l2-core is for core V4L2 frameworks, not for drivers.

For now stick it in drivers/media/test-drivers. It will likely be moved again at
some point (if we keep the 'misc' device that the current driver creates, then
it might end up in drivers/media/misc).

By far the most important thing you need to do is convert it to vb2. Since the
intention is to upstream the driver I would start by doing a cleanup of the code,
ditching all compat code with older kernels, making sure it adheres to the
linux coding style (use 'scripts/checkpatch.pl --strict' for that), then split
it in two video devices and use vb2.

I actually wonder if it shouldn't be renamed to viloopback since it will be
different from v4l2loopback. Anyway, that's something that can be done later.

Regards,

	Hans

> 
> Thanks,
> wt
> 

