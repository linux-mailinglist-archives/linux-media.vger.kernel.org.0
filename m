Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8456A17D9B3
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 08:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgCIHRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 03:17:11 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47135 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726427AbgCIHRL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 03:17:11 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id BCesjfMUyhVf8BCewjElMT; Mon, 09 Mar 2020 08:17:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583738229; bh=32KlxDk90Be6PEioTy1TcN8IjnKPfRs1x3JsVTLCOg4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DqgJY8mV8S7o7gcfn+cQs6L1gHKlNIrGFUr41UrJYLw+Eoh9sVsFnNtO0mxC+WbKR
         NqaKpCpP9LLVS/VxWvm03MTSYd9UQWaZqROZMtweTKrgZ7kZFUIt7gUvZZKwnpVzVo
         wHT4mNfps8Nt82Z+cWVwabvletmOS7zoyMzENNr8q11iY542mZeYeoEb5sbMKIxYlo
         Xp4x3Ed85Si7tYsV++85hXutSHGx+CM6F1Qo2xM7fgbjQMUubblmhZERH73y/FKvIb
         nt51Y1NRzQIgDWhgyTJ+iKGwbjEYoHojKUT7zMu3NNENP9ZNVp8DuUU+FozzR3BQvB
         Tnp492gRqyQOw==
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
 <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
 <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
 <20200309040305.GB9460@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4cd4f794-1d84-9fff-746c-e516bc411549@xs4all.nl>
Date:   Mon, 9 Mar 2020 08:17:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309040305.GB9460@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP0Ii/2CEImmUL0aGzJj48bCfBaJoRpOw8bibhnHKFGwuJYS5Vp2a23+WcZ08klJHUnOr4LO61wYTWnM8ba1VJtu5XzDweqrsjC8CcXmq9JbVAd2h1c8
 E9UCE7Q63zDdjzOBXZJneC8Q3CBEdPGm9K9MqycB4YHBOk93l30ZhsxDr5jeOi4l8WHT0EieGqub/JN00iYNDb6M6+dt1R177Ds85MW/bs0DdAo2LE5bOMKZ
 0r70rBdm0OH6SRS31Iqw2d0MoHicsjVMp0RDfuk6OI4gmHZruS7IZTeJ8z3wbu6ZzjuF9AALrKgIKFPgyHwjqBTTZ1Wr1Jgk5C1eSrRPeOD9kC2Sp+6gp2gm
 zk27KaEvTN/RHzjBMs7ZaqSYyMTILijYKgCKVuUNbt3lLp0bGCfpinLqXtj1Tti0K0HXG7me8+4+tViRzr5cwxxJsPFrZW+8OouAd7ndtA3p4aIJ9wT9PpRH
 hef7lz+vsGTU/kI/YaRqlDFJ5gPYbzC2etqtLqD7rge2a0X4Di25ezR5qP0SbQJVllmhYB6xECuvvTxT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/9/20 5:03 AM, Sergey Senozhatsky wrote:
> On (20/03/07 12:47), Hans Verkuil wrote:
>>
>> 1) attempting to use V4L2_FLAG_MEMORY_NON_CONSISTENT will clear the flag
>>    upon return (test with both reqbufs and create_bufs).
>> 2) attempting to use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
>>
> [..]
>>
>> All these tests can be done in testReqBufs().
> 
> MEMORY_NON_CONSISTENT is a queue property, we set it during queue setup.
> NO_CACHE_INVALIDATE/FLAG_NO_CACHE_CLEAN is a buffer property, we set it
> when we qbuf. I'm not sure if all of these can be done in testReqBufts().

testReqBufs can call qbuf, but not streamon. Since you don't need streaming
for this, testReqBufs should be fine.

Regards,

	Hans

> 
> 	-ss
> 

