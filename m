Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA8217B21
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 15:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfEHN6L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 09:58:11 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:49785 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725910AbfEHN6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 May 2019 09:58:11 -0400
Received: from [IPv6:2001:983:e9a7:1:1542:3ab9:816d:970b] ([IPv6:2001:983:e9a7:1:1542:3ab9:816d:970b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ON5DhFvbRsDWyON5EhUufJ; Wed, 08 May 2019 15:58:09 +0200
Subject: Re: [RFC PATCH v2 3/7] media: v4l2: Add extended buffer operations
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <m.chehab@samsung.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>
Cc:     Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
References: <20190404081700.30006-1-boris.brezillon@collabora.com>
 <20190404081700.30006-4-boris.brezillon@collabora.com>
 <20190412105755.42764170@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <64dd011d-d397-b587-6027-b222dd100fc2@xs4all.nl>
Date:   Wed, 8 May 2019 15:58:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190412105755.42764170@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBHZRMFQWB4IjEgdjHWjz+cKx3c5MiAagbqTSBqtbaWSnXXp3+uvazbiOnGmdcNdayRJL07FhPddRn+z/yvaRZAQJCQ1+YIe7nJMtst1pLjHIUKZNBUR
 2Wx09SRnJcSh/zDgZjGEYX+4ytGgCo+IhGZmF7jT8so/Dr1ZDUPUc79PUP8L/rca/atDesQUbslDpePf8BeDUnWF/UW9Hkt8FQkpQz56A1vUCmhMjlVFaOZC
 60/lTF82YniSMO7WeD1LlUGYfslj2fO7ZpEelWDDWi0ryR4W0XBqKEaB9douTGn62axbBSAy+STjkMmyThZCyli8UR6x6z6n8uaeO1rdaDdyPJT4tM7H85wH
 PuxRrEZOI6Pq9B36omOE+PESh0iD6WI0o0Ds7ThbzCTMYWelm0ZMZglS/c/0QbXsg6jcZucTAwuD4EiMGewFMSst6SYTCsNzWfaSKFcvP5mFcB9DkFj1Brhz
 vHOu6DrEfl/kobjM9/VY1+Rs7nqQN7r+GZAy5fXommER9PlwLejyX+BfFScfUmpD0vR+CiHMsMhhfq31c1p04xheo16EW9qt8ghlj3TPE0LM8zcEjg00NvKE
 SVxOBjlha5r+h5wnisrXIHQ5ILd6KgXcq28TpRD94AK6PA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

On 4/12/19 10:57 AM, Boris Brezillon wrote:
> On Thu,  4 Apr 2019 10:16:56 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> 
>> +/**
>> + * struct v4l2_ext_buffer - extended video buffer info
>> + * @index: id number of the buffer
>> + * @type: enum v4l2_buf_type; buffer type. _MPLANE and _OVERLAY formats are
>> + *	  invalid
>> + * @flags: buffer informational flags
>> + * @field: enum v4l2_field; field order of the image in the buffer
>> + * @timestamp: frame timestamp
>> + * @sequence: sequence count of this frame
>> + * @memory: enum v4l2_memory; the method, in which the actual video data is
>> + *          passed
>> + * @planes: per-plane buffer information
>> + * @num_planes: number of plane buffers
>> + * @request_fd: fd of the request that this buffer should use
>> + * @reserved: some extra space reserved to add future fields (like timecode).
>> + *	      Must be set to 0
>> + *
>> + * Contains data exchanged by application and driver using one of the Streaming
>> + * I/O methods.
>> + */
>> +struct v4l2_ext_buffer {
>> +	__u32 index;
>> +	__u32 type;
>> +	__u32 flags;
>> +	__u32 field;
>> +	__u64 timestamp;
>> +	__u32 sequence;
>> +	__u32 memory;
>> +	struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
> 
> I had a discussion with Tomasz last week, and he made me realize I was
> misunderstanding the concept of V4L2 planes. I thought it was encoding
> pixel-component planes, but it's actually memory planes, and sometimes
> those one memory planes might contain all component planes placed next
> to each others (like the V4L2_PIX_FMT_NV12 format).
> 
> So, the question is, what do we want v4l2_ext_plane to encode (memory
> planes or pixel component planes)?
> If we go for the pixel component plane approach (which IMHO would be a
> good thing), that means we'll have to convert V4L2_PIX_FMT_NV12-like
> single-memory-plane buffers into v4l2_ext_buffer containing X planes,
> each pointing to the same memory object but at a different offset.

First of all my apologies for the long delay in replying.

I think v4l2_ext_plane should encode pixel component planes, that way
it becomes much easier to describe e.g. NV12 formats that use a single
memory range, but where each component plane has its own bytesperline
value and where each component plane starts at e.g. a page boundary
due to hardware restrictions.

This is currently impossible to describe without creating a new pixel
format.

But it is of course possible that different component planes use
different memory ranges.

I think that the memory information in v4l2_ext_plane should describe the
memory for that component plane and any following component planes that
are part of that memory. The memory information for those following
component planes should be 0 or some other value that makes it clear
that it is part of the same memory buffer as the preceding component plane.

Regards,

	Hans

> 
>> +	__u32 num_planes;
>> +	__u32 request_fd;
>> +	__u32 reserved[10];
>> +};
>> +
>>  /**
>>   * v4l2_timeval_to_ns - Convert timeval to nanoseconds
>>   * @ts:		pointer to the timeval variable to be converted
>> @@ -1062,6 +1139,35 @@ struct v4l2_exportbuffer {
>>  	__u32		reserved[11];
>>  };
>>  
> 

