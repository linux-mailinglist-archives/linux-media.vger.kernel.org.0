Return-Path: <linux-media+bounces-4957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF7850EF9
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 09:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 319761C20B83
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 08:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B901BF50D;
	Mon, 12 Feb 2024 08:38:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C4EF4E3
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707727083; cv=none; b=tawnAhHK9EYhjKFXCEVyAOjkC2R0J4HReYgj8xhyFrwEFRzIYXObPiiyU+nWiTwwr2k3svjKe4Gr0/74a8FXdYf3SY4JQc6Kf2uXtDyageaQFRl2ENfYsJ6waF8AMQSmz7EwsFbSXYaZQv6n0mtQgBlC95C1BUyvtyjSSMqFeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707727083; c=relaxed/simple;
	bh=/OLp+TyJRYWWsW7h6u8zJw+zr2+nYoqN0xF3Qz7gp8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXoKsHUoGo1Dl8d5dZxJvBtt55y+A2eWlbQhM1dle0k70/8FvIG1RPmkMQQGqEKmSyIKTYy+WbzHPKU5A9OZ7fd4xnEBA771x6J95NLmLIonjIoTEq5BeaMd+loTKlDcgtijCLhszPsg33MjGI619wbHnbYPyzNNUceBXGwQtEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44309C433C7;
	Mon, 12 Feb 2024 08:38:02 +0000 (UTC)
Message-ID: <33dc55fd-a8b6-49ac-a5e3-47af5c75065c@xs4all.nl>
Date: Mon, 12 Feb 2024 09:38:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: VIDIOC_ADD_BUFS, a VIDIOC_CREATE_BUFS replacement
Content-Language: en-US, nl
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <243a66ad-6dff-4a43-ab03-e01d1038fe8a@xs4all.nl>
 <644a9bfa5f2d3bba8e5c590a8c6fce302279a94b.camel@ndufresne.ca>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <644a9bfa5f2d3bba8e5c590a8c6fce302279a94b.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/02/2024 19:03, Nicolas Dufresne wrote:
> Hi,
> 
> Le jeudi 08 février 2024 à 09:31 +0100, Hans Verkuil a écrit :
>> Hi all,
>>
>> Benjamin Gaignard's 'DELETE_BUFS' series [1] is almost ready, but there is
>> one outstanding issue: it works closely together with VIDIOC_CREATE_BUFS,
>> but that ioctl has long since been a thorn in my eye due to the use of
>> struct v4l2_format embedded in the struct v4l2_create_buffers. This makes
>> it hard to use in applications.
>>
>> The only fields of that struct v4l2_format that are actually used are:
>>
>> type
>>
>> and, depending on 'type':
>>
>> pix.sizeimage
>> pix_mp.num_planes, pix_mp.plane_fmt.sizeimage
>> sdr.buffersize
>> meta.buffersize
>> vbi.samples_per_line, vbi.count
>> sliced.io_size
> 
> Sorry to disrupt, but that is only true since no driver support allocating for a
> different target input. In stateless CODEC drivers, when these are used as
> reference frame, extra space is needed to store reference data like motion
> vectors and more.
> 
> The size of the data will vary depending on the width/height and pixelformat
> (from which we can deduce the depth). Of course, some driver will only operate
> with secondary buffer (post processed display buffer), which is the case for the
> driver this feature is being demonstrated, but won't be true for other drivers.
> 
> I sincerely think this RFC does not work for the use case we are adding delete
> bufs for.

I don't understand your reply. I'm not sure if you are talking about the fields
that VIDIOC_CREATE_BUFS uses, or about the proposed new ioctl.

If you are talking about CREATE_BUFS, then it really is ignoring all other
fields from the struct v4l2_format. See vb2_create_bufs() in videobuf2-v4l2.c.

If you are talking about my proposed ADD_BUFS ioctl: what is missing there
that you need?

Regards,

	Hans

> 
> Nicolas
> 
>>
>> See vb2_create_bufs() in videobuf2-v4l2.c.
>>
>> It's a pain to use since you need to fill in different fields
>> depending on the type in order to allocate the new buffer memory,
>> but all you want is just to give new buffer sizes.
>>
>> I propose to add a new ioctl:
>>
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 03443833aaaa..a7398e4c85e7 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -2624,6 +2624,39 @@ struct v4l2_create_buffers {
>>  	__u32			reserved[5];
>>  };
>>
>> +/**
>> + * struct v4l2_add_buffers - VIDIOC_ADD_BUFS argument
>> + * @type:	enum v4l2_buf_type
>> + * @memory:	enum v4l2_memory; buffer memory type
>> + * @count:	entry: number of requested buffers,
>> + *		return: number of created buffers
>> + * @num_planes:	requested number of planes for each buffer
>> + * @sizes:	requested plane sizes for each buffer
>> + * @start_index:on return, index of the first created buffer
>> + * @total_count:on return, the total number of allocated buffers
>> + * @capabilities: capabilities of this buffer type.
>> + * @flags:	additional buffer management attributes (ignored unless the
>> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
>> + *		and configured for MMAP streaming I/O).
>> + * @max_num_buffers: if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capability flag is set
>> + *		this field indicate the maximum possible number of buffers
>> + *		for this queue.
>> + * @reserved:	future extensions
>> + */
>> +struct v4l2_add_buffers {
>> +	__u32			type;
>> +	__u32			memory;
>> +	__u32			count;
>> +	__u32			num_planes;
>> +	__u32			size[VIDEO_MAX_PLANES];
>> +	__u32			start_index;
>> +	__u32			total_count;
>> +	__u32			capabilities;
>> +	__u32			flags;
>> +	__u32			max_num_buffers;
>> +	__u32			reserved[7];
>> +};
>> +
>>  /**
>>   * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
>>   * @index:	the first buffer to be deleted
>> @@ -2738,6 +2771,7 @@ struct v4l2_delete_buffers {
>>
>>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
>>  #define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
>> +#define VIDIOC_ADD_BUFS	_IOWR('V', 105, struct v4l2_add_buffers)
>>
>>
>>  /* Reminder: when adding new ioctls please add support for them to
>>
>> Note that this patch sits on top of [1].
>>
>> The new struct is mostly the same as v4l2_create_buffers, but replacing the
>> embedded v4l2_format with just the data it actually needs.  I also renamed
>> 'index' to 'start_index' and added a new 'total_count' field to report the
>> total number of buffers. VIDIOC_CREATE_BUFS used the 'index' field for that
>> when called with count == 0, but that is awkward once you allow for deleting
>> buffers.
>>
>> Implementing VIDIOC_ADD_BUFS would be very easy, it is almost all done in
>> vb2. Drivers would just need to point .vidioc_add_bufs to vb2_ioctl_add_bufs.
>>
>> The vb2_queue ops do not change since those are already based on just an
>> array of requested sizes.
>>
>> One reason I am bringing this up is that this has a potential impact on the
>> name of the new ioctl in [1]. Do we call it 'VIDIOC_DELETE_BUFS' or
>> 'VIDIOC_REMOVE_BUFS'?
>>
>> I like the ADD/REMOVE pair better than ADD/DELETE. I never quite liked
>> 'CREATE/DELETE' since buffer memory is only created/deleted in the MMAP
>> streaming case, not with DMABUF/USERPTR. I think add/remove are better names.
>>
>> I think CREATE/REMOVE is also acceptable, so I am leaning towards calling
>> the new ioctl in [1] VIDIOC_REMOVE_BUFS instead of VIDIOC_DELETE_BUFS.
>>
>> So, please comment on this RFC, both whether adding a CREATE_BUFS replacement
>> makes sense, and whether using REMOVE_BUFS instead of DELETE_BUFS makes sense.
>>
>> Ideally it would be nice to introduce both ADD_BUFS and REMOVE_BUFS at the
>> same time, so any userspace application that needs to use REMOVE_BUFS to
>> remove buffers can rely on the new ADD_BUFS ioctl being available as well.
>>
>> Regards,
>>
>> 	Hans
>>
>> [1]: https://patchwork.linuxtv.org/project/linux-media/list/?series=12195
> 


