Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 070BC1006EC
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 14:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfKRN7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 08:59:54 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35499 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726627AbfKRN7x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 08:59:53 -0500
Received: from [IPv6:2001:983:e9a7:1:51d2:6e2e:1293:dc69]
 ([IPv6:2001:983:e9a7:1:51d2:6e2e:1293:dc69])
        by smtp-cloud8.xs4all.net with ESMTPA
        id WhZGijbfuecrtWhZHiy7aO; Mon, 18 Nov 2019 14:59:51 +0100
Subject: Re: [RFC] Add VIDIOC_DESTROY_BUFS
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <27184315-c71b-2dc2-aa95-9489c46d3fb9@xs4all.nl>
 <20191118145237.27c5eea2@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2e7ba1ce-3df6-88d2-6396-6b5c58970d7a@xs4all.nl>
Date:   Mon, 18 Nov 2019 14:59:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118145237.27c5eea2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMxhUWtvtLEMFFVT9RP2uG0KHBgTFzWBPx2pal9thDGGcBxX2ZLTTYKSUJnilLAKlzMsr+dwvZXBmrJ3YHQ/T7oL0Bj5UFoFILEKRXXHdtrFc21i9mdf
 6mQuGtZ5mbCm3V+YgbXmlIz4FdeSrEVIsvpx9KgfvrAiW+XaoZcw8qiCm+B/GA/azPHKRITSOv7+GAhTXvvReP6CC2mdvMsy0kVxeaFfNA//lKOBna9flAX1
 ceP27/OfPyXHBorKsfYXAAYXehj46dFfeX6WEwIJOpdWtzefmxhIcT2qSY/aXVBL++sHa3MaH28wMcr+nBLbH/YEiEEZJvC0AXuvVdQWRQp4sM2CO17Aztrf
 glCiZaTDJgyCxkDMZXuE1h8qDBLVtahMzXubMHXe9UwgL/pC1Ot0ksO0m/qv+Nu30JdteWTv5Y78ujaoSOGzy8sH8/BUF8Srbp6UDl6IYkpV+VZOj+RSJ8hW
 YpR+p2LCDYEEuENw
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/18/19 2:52 PM, Boris Brezillon wrote:
> Hello Hans,
> 
> On Mon, 18 Nov 2019 14:06:40 +0100
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>> Here is a proposal for a new VIDIOC_DESTROY_BUFS ioctl:
> 
> Thanks for sending this RFC.
> 
>>
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index c7c1179eea65..1a80d1119768 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -2423,6 +2423,19 @@ struct v4l2_create_buffers {
>>  	__u32			reserved[7];
>>  };
>>
>> +/**
>> + * struct v4l2_destroy_buffers - VIDIOC_DESTROY_BUFS argument
>> + * @type:	stream type
>> + * @index:	index of the first buffer to destroy
>> + * @count:	number of consecutive buffers starting from @index to destroy
>> + */
>> +struct v4l2_destroy_buffers {
>> +	__u32			type;
>> +	__u32			index;
>> +	__u32			count;
>> +};
>> +
>> +
>>  /*
>>   *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>>   *
>> @@ -2522,6 +2535,7 @@ struct v4l2_create_buffers {
>>  #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
>>
>>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
>> +#define VIDIOC_DESTROY_BUFS	_IOW ('V', 104, struct v4l2_destroy_buffers)
>>
>>  /* Reminder: when adding new ioctls please add support for them to
>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>>
>>
>>
>> So this basically just destroys buffers [index..index+count-1]. Does nothing if
>> count == 0. All buffers in the sequence must be dequeued or it will return
>> -EBUSY and do nothing.
>>
>> If some of the buffers in that range are already destroyed, or in fact were
>> never created, then they will be ignored. I.e., DESTROY_BUFS won't return
>> an error in that case.
> 
> Sounds good to me.
> 
>>
>>
>> VIDIOC_CREATE_BUFS will need a few changes:
>>
>> CREATE_BUFS will try to find a range of <count> free consecutive buffers.
>> If that's not available, then it will reduce <count> to the count of the
>> maximum freely available consecutive buffers. If <count> is 0, then it
>> will set <index> to the maximum index of an existing buffer + 1.
>>
>> As long as DESTROY_BUFS isn't used, then CREATE_BUFS acts exactly the same
>> as it does today.
> 
> Sounds good too.
> 
>>
>> I would also like to extend struct v4l2_create_buffers with a new field:
>> __u32 max_index. This is a maximum index possible, typically VIDEO_MAX_FRAME-1.
> 
> Shouldn't max_buffers be a property of the queue, set through a separate
> ioctl()? BTW, how would you decrease the queue depth?
> CREATE_BUFS.{count=0,max_index=<new-depth>}?

I think the name might be confusing: cap_max_index might be better: this is just
a read-only capability: i.e. how many buffers can userspace create? Currently
this is 32, but in the future drivers should be able to allow for more buffers.
It should be something they tell vb2.

Regards,

	Hans
