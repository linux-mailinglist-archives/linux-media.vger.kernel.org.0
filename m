Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D5B1F175E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 13:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbgFHLOY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 07:14:24 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:60895 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729398AbgFHLOX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 07:14:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iFjNjQWJICKzeiFjRjlq3R; Mon, 08 Jun 2020 13:14:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591614861; bh=4RqEb9A9MQBedFDcxLfcSKaqoXUkyigsI44g4n8DRag=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bQXzIFCAMcTrrnL/gP3tNeOrjhHnJweNB+2mNXesHxb+reIXLeVORQ5lgmjB55Zh+
         S4dpkoemGtEGKtGfNToiNeqx+yW40npo2I/BGIb4uJ6KepCTclzheXFSBa2afpRjT3
         2w2MSg08PkIn3MGhQv5nT81xVqIOO5anEVCqFyoJe28JTVCFzsHTPpI4gYywCc2slr
         WsqvuQgZ+WRiyD1p/N/eQ/myxl9hxuNvYMgT64snZ07VlpDX21yA+2xfrebsr3NaWA
         aQomUpmrT0wkkHZvO7dwakDnOboKZoSc3jZ/6pffm1lWfLp83BxTSXx5HtT8IBW5Rz
         IP0xI0uJO8VtA==
Subject: Re: [PATCH v2] v4l2-utils: test cache_hints for MMAP queues
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org
References: <20200604044752.107856-1-sergey.senozhatsky@gmail.com>
 <401fe6a5-542e-cc3c-8455-aa7c424122b8@xs4all.nl>
 <20200608110917.GA31444@jagdpanzerIV.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aec2fc2e-9be8-0557-c9cc-789240857bc8@xs4all.nl>
Date:   Mon, 8 Jun 2020 13:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200608110917.GA31444@jagdpanzerIV.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOQHUFU/1axGRWEj7G/cQqohP+31sTY356DDmE2AxZLoWORCQfXHdk7E93KAJmv1iiaP2e6ew6hUVSCvOq4V3s+zjjsS9jSoa/HjN3l2Mdq8yAaaXuBe
 WjekoCmniSPhNgacxzzB1fRCIvmOY18hfCzGs6lnbzO2TWg3sD2ylsqOsY+HZObMFokICXzNsRZYHSj5N6gFx/bQFVQlj9igrCHwRHghDS6bwCrctqMYXKwr
 V41Cp0PsfAk+aiOX8cW1oQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/06/2020 13:09, Sergey Senozhatsky wrote:
> On (20/06/04 13:43), Hans Verkuil wrote:
>> With this patch the compliance test passes.
>>
>> But I have some comments about this code:
> 
> Hi Hans,
> 
> [..]
>>> +
>>> +	if (cache_hints_cap) {
>>> +		crbufs.count = 2;
>>> +		crbufs.memory = q.g_memory();
>>> +		/*
>>> +		 * Different memory consistency model. Should fail for MMAP
>>> +		 * queues which support cache hints.
>>> +		 */
>>> +		crbufs.flags = 0;
>>> +		if (m == V4L2_MEMORY_MMAP)
>>> +			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs) != EINVAL);
>>> +		else
>>> +			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
>>> +	}
>>
>> The code above can be integrated into testReqBufs() in the
>> 'for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++)' loop.
> 
> OK, do you want me to stop testing ->flags = 0 case, or shall I test both?
> I wanted to test those separately yet keep the size of testReqBufs() more
> or less reasonable (I just prefer to have small functions all over the place
> and let the compiler decide what should be inlined)
> 
>> Currently it sets reqbufs.flags/crbufs.flags to 0, but you can just set it to
>> V4L2_FLAG_MEMORY_NON_CONSISTENT instead and add the relevant tests.
> 
> Ah, OK, so no test for ->flags = 0 case.

Right.

I don't think explicitly testing for flags = 0 is useful (famous last words, I
may have to eat them in the future :-) ).

> 
>>> +	q.reqbufs(node);
>>> +
>>> +	/* For the time being only MMAP is tested */
>>> +	if (m != V4L2_MEMORY_MMAP)
>>> +		return 0;
>>> +
>>> +	node->g_fmt(fmt, q.g_type());
>>> +	q.create_bufs(node, 2, &fmt, 0);
>>> +	fail_on_test(setupMmap(node, q));
>>> +
>>> +	q.reqbufs(node);
>>> +	q.create_bufs(node, 2, &fmt, V4L2_FLAG_MEMORY_NON_CONSISTENT);
>>> +	fail_on_test(setupMmap(node, q));
>>
>> This test should be part of testMmap instead.
> 
> OK. Let me take a look.

I don't think I explained why: setupMmap will queue buffers, and that is something
that should only be done if v4l2-compliance is started with the -s (streaming) option.
Without -s buffers shall not be queued during compliance testing.

Regards,

	Hans
