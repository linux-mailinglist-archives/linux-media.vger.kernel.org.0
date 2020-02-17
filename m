Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 124311615CC
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgBQPNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:13:02 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39755 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728543AbgBQPNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:13:02 -0500
Received: from [IPv6:2001:420:44c1:2577:3074:af58:17a5:9c72]
 ([IPv6:2001:420:44c1:2577:3074:af58:17a5:9c72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3i4ujazUx8i433i4yjXUl5; Mon, 17 Feb 2020 16:13:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581952380; bh=IDFDBwaSOx6zC7xFsYHlhYJPAeOopNKERQQaajHc00E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uTYPdXGzHNuOn3IWnui+wkFBiJfuUBh7O6WzE+Q5tdVrWgnwydxYWQXKgSKNID0NW
         Jgeqhv6EA5BuhvNvf0HGTvoGNd+p5rh/Y00HpWlzxV1fJeoRoj2BEPs0S83SQRb4OA
         pZespO/Qyw8q8rsfPWkqQgO0TbIICd3RZ9GLNq/Ei7QQsg4mILK58uRy8OvYVQaQN3
         uxM81uZpd4McMj9pb9rHLZ2TSdOePdfAYoOdcy6lzR/NROdCcTdUO92gMszcM2fwx6
         qagAa9tSNXziHfuq4zsJP2Z9wKbApaRqEfK1+Qsrdt70f74fwCKTlrqse/812BfZIm
         FmTl9sf3gdADg==
Subject: Re: Multiple activve jobs with the V4L2 request i/f?
To:     John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org
References: <2p0l4fhbn1mvfcm8h5kubi44kujkmgm0sg@4ax.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e2c86cba-5800-927b-c0fe-f8f9d009d742@xs4all.nl>
Date:   Mon, 17 Feb 2020 16:12:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2p0l4fhbn1mvfcm8h5kubi44kujkmgm0sg@4ax.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMCcJTE51MtdA0NiWQHjovYuHBSDObh41gfjhRFAKt2UrD1LbMLi7BX26HZIyLPxOrUey/U9BiK0k3YxRdJ/cHR+xKuFrS9ZuvZ6srQGFAtQNGf09To+
 O26A3c237zakjaZPVEYuFwu3nW09u3uNmSH8K3wzhiLbwbmB43wItssC1YR/GwssWpb8mFs8PIBTmp/SmbzdITgYuQz0lmowa3bF4wIf0N9RG9P0ZTxItVTq
 0SvIRlV4NY9i1QBJ2D8UV+yHHBc0wNCk+GDljlOoNZ4VjPnOYsqHN4TukvmngWYdXjt7d6x87VBIY7Q88mPdyw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On 2/17/20 1:16 PM, John Cox wrote:
> Hi
> 
> I have built a H265 V4L2 request decoder and I based it on the staged
> sunxi cedrus decoder.  As it stands it appears to me that in the request
> environment one request comes in which is processed and then is acked
> with v4l2_m2m_buf_done_and_job_finish which returns the output & capture
> (if not held) buffers and then the next request can start.  Our decode
> process has two passes and so is most efficient if two frames are being
> processed at the same time.  Is it possible in the stateless request
> world to separate the return of the output & capture buffers and/or to
> allow multiple requests to be active at the same time?  If so is there
> any example code I can look at?

If I understand it correctly, you want to start two buffers in
flight at the same time: one doing phase 1, and the other in phase 2.
And when both phases finish processing you return the buffer in phase 2,
move the buffer in phase 1 to phase 2, and dequeue a new buffer to start
processing in phase 1.

Right?

This means that there are two jobs running, and I don't think the
framework likes that.

On the other hand, I think it should be possible to add support for this
in v4l2-mem2mem.c, although I am not entirely sure what the right approach
would be.

One idea would be to model a pipeline as part of a job: so you can have
multiple jobs running, but each would run at a different phase of the
pipeline.

Erm, for the record, I have no plans to implement this, but patches are
welcome! :-)

Regards,

	Hans
