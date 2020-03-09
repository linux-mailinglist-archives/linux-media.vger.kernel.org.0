Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66DC317D9D8
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 08:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgCIH2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 03:28:14 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47853 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725942AbgCIH2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 03:28:14 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id BCpdjfOzEhVf8BCpgjEmUe; Mon, 09 Mar 2020 08:28:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583738892; bh=vDgrSfKy17DeRZlfSbScsLt2QBnRSTNPoc1/+YK8aFQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dSozotFppU+x/s+4/E4MjYEi6ZsT6edqTMiYqXapw+BQJgkMEOIVpwyfs2tkSkU+G
         aRI657MEL2fvX7OEr6OTGIdhuyELXi+y/SG3s2Ogy92atgfZtMXW0yLVknujUedCgT
         LjYoggbYO2ueWXxuxxD4dvq39Wpnb5I8JliWxqR3sORhmVNEPA21YJ9MNkDMDcLXHk
         wB92ucil27GGZJx6OdUqSkAT/c+3GRfzXgswcEIuMO4EDYB9RyuJLoAueXPGXZbe9a
         eZJx7RujZxlDk6rs1dzSB4XL0UKDRRe+IgK4ApgupkCH+fXcn0hqXu9xtgHwboCtmK
         vZzHXv4Gv8qQQ==
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
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
 <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
 <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
 <20200309032707.GA9460@google.com>
 <40cd09d9-49a6-2159-3c50-825732151221@xs4all.nl>
 <20200309072526.GC46830@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e31197b6-5d22-0c3a-cc77-e9506136ada5@xs4all.nl>
Date:   Mon, 9 Mar 2020 08:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309072526.GC46830@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEJoMJcWNRWk5xxvW5DJmhWRRqVha25Hha3P0P7P5aJpJqbT4pUk3UqAE5RCugnCQO0j2PShYzmp7v0ua+nbbACU0tyP9cabGhuofpi9oUwy8zxcsXMF
 7cI+8rVs+7nBW2GHsHUh9yGgDwAIXW0mzzuWe+lVpfSzBwPV2s/MOAtuA6cgu+T2eOIqNlgf1c/pqplsr7jOf++2vCGz1X8bqLTsg8bAlNiifNoltCsTlxN7
 S7/evqwSg8N8JFVznQTgj9d2Wjt3VEvFR+twh0U4HDrWZSlK8e082yGbuI+IuXyA2w0RyNSnskEJ67wgmrrESUE4dyiY03H5XUWCe8xVU2hw8nv+JGpT0ebx
 yZJayUDN6Nqfu1Jt/6TAl9vmuMdjLQUaQ02l7bi3TV+Vy1bYrCwKOOD6YbXfSLY+qSK9g5szZJlPGSEqOuQend0/6wLV0A21uKP1YaQLXSZov1A4hBTlGnVA
 2KmiUFJFheRFHHji+c8W3JfuR0OOok1Cbvt/Gz2XHNpVUnjsMbZsmqkb4gRk94RShVicxAf6ZVEeM0d82GsHXU+MxEELiGdGRgaSmimKAKVZtqL8E0WOWHIn
 fOo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/9/20 8:25 AM, Sergey Senozhatsky wrote:
> On (20/03/09 08:21), Hans Verkuil wrote:
>> On 3/9/20 4:27 AM, Sergey Senozhatsky wrote:
>>> On (20/03/07 12:47), Hans Verkuil wrote:
>>>>
>>>> Create those tests in v4l2-compliance: that's where they belong.
>>>>
>>>> You need these tests:
>>>>
>>>> For non-MMAP modes:
>>>>
>>>> 1) test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is never set.
>>>>
>>>> If V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is not set, then:
>>>>
>>>> 1) attempting to use V4L2_FLAG_MEMORY_NON_CONSISTENT will clear the flag
>>>>    upon return (test with both reqbufs and create_bufs).
>>>> 2) attempting to use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
>>>>    will clear those flags upon return (do we actually do that in the patch series?).
> 
> [..]
> 
>>> I'm looking into it. Will it work if I patch the vivid test driver to
>>> enable/disable ->allow_cache_hints bit per-node and include the patch
>>> into the series. So then v4l2 tests can create some nodes with
>>> ->allow_cache_hints.  Something like this:
>>
>> I would add a 'cache_hints' module parameter (array of bool) to tell vivid
>> whether cache hints should be set or not for each instance. It would be useful
>> to have this in vivid. Don't forget to update Documentation/media/v4l-drivers/vivid.rst
>> as well.
> 
> I see. Hmm, how do I do "test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS
> is never set" then?

Not sure I understand your question. When requesting buffers for non-MMAP memory,
this capability must never be returned. That has nothing to do with a cache_hints
module option.

Regards,

	Hans

> 
> 	-ss
> 

