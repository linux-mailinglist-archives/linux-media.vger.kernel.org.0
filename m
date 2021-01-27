Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978A5305ABC
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237611AbhA0MEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:04:23 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42307 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237102AbhA0MBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:01:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4jV5lXiYsI2394jV8lhCJz; Wed, 27 Jan 2021 13:00:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611748847; bh=0AzF55Jm0IIRIMqXAMk5LEUSkHNmCZO64x7XOqGXwLY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Dj/XSM8gWRVVYm9qfXtIKdHG+uGdDSmqxmLk+ZToFNBsse7DIFoCm7/txp2E/Mgg2
         +cYN9Nq1XIGBaLcuw9kG1wUG1ywQ03yWVdNds1Wmla5jA3gbm7Cax1ozmbwlp36MBE
         qOwmqm06XvaFCrq7Fwl3S9wl5Iu77s0ZNBiH8h/QeAcisto/daWbPl0GERI7Ur/Yt3
         5/h04WiAg3bGeiOrK3/TbhclnPDJzg5n1MHSpOPNAUpawAxBd1/Hf+7vsRWhrAqsk3
         EQWwt3A/MXViO4BdI/6Uo2XyD86T8fvEmx/sPahrU6tW6pnvGML3gMoBEjxwVJeDE/
         EzxY2h8bQGBDg==
Subject: Re: v4l2-ctl: Question on last_ts
To:     Max Schulze <max.schulze@posteo.de>
Cc:     linux-media@vger.kernel.org
References: <de158cf3-5825-be21-f8ed-964cb9be6ec0@posteo.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a8a31968-941b-ca44-3112-8d9f7c2215a4@xs4all.nl>
Date:   Wed, 27 Jan 2021 13:00:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <de158cf3-5825-be21-f8ed-964cb9be6ec0@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGy5Uj4x1Q0vSUyLrv5+QtTYx8bo4reZHpkK+foKKMOeRyNJGzem1ZR12CL0IcrVn2XTA6daws3hb2ifgpY07tiFf+K9NLxdaTXuo5IVtlykrhNUf3Cu
 uQKGD0vk7w/iBdzi6n88/UBsfeLZrFxb8fOF6Ij7bdBhJcstrs5ALglnRoRKWaYIY+5y2b0u/jVGLaISY5oR2jIhKgDS9i0jdES8JIjDZQmD2LvByzYlYjBB
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/01/2021 11:44, Max Schulze wrote:
> Hello Hans,
> 
> 
> I do not understand the concept on last_ts.
> 
>> cap dqbuf: 0 seq:      0 bytesused: 512000 ts: 137342.420951 delta 
>> last: 137342420.951 ms (ts-monotonic, ts-src-soe)
>> cap dqbuf: 1 seq:      2 bytesused: 512000 ts: 137342.484954 dropped: 
>> 1 (ts-monotonic, ts-src-soe)
> 
> It seems to print the timestamp on the first frame, but then never again 
> (how useful is it, to print the same timestamp twice?).
> 
> 
>> if (last_ts <= 0.0)
>>             fprintf(f, " delta last: %.03f ms", (ts - last_ts) * 1000.0);
>>         last_ts = ts;
> 
> Might it be, that commit 222e1760c7 "utils: fix implicit float 
> conversion" got the float conversion wrong and it should rather be
> 
>>         if (last_ts > 0.0)
> 
> To my understanding, this would yield a much-more useful output of 
> printing the diff to the last frame _in every frame_

Yep, you are correct. It's now fixed. I was wondering about that as well
when I looked at the code.

Thanks for reporting this!

	Hans

> 
> 
>> cap dqbuf: 0 seq:      0 bytesused: 512000 ts: 143215.916971 
>> (ts-monotonic, ts-src-soe)
>> cap dqbuf: 1 seq:      2 bytesused: 512000 ts: 143215.984995 delta 
>> last: 68.024 ms dropped: 1 (ts-monotonic, ts-src-soe)
>> cap dqbuf: 2 seq:      3 bytesused: 512000 ts: 143216.016956 delta 
>> last: 31.961 ms (ts-monotonic, ts-src-soe)
>> cap dqbuf: 3 seq:      4 bytesused: 512000 ts: 143216.052981 delta 
>> last: 36.025 ms (ts-monotonic, ts-src-soe)
>> cap dqbuf: 0 seq:      5 bytesused: 512000 ts: 143216.088920 delta 
>> last: 35.939 ms fps: 29.08 (ts-monotonic, ts-src-soe)
> 

