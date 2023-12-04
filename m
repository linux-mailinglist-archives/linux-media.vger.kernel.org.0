Return-Path: <linux-media+bounces-1525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B39C802D85
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 09:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 686A61C20A28
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 08:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21418FBE5;
	Mon,  4 Dec 2023 08:48:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992CEC8F9
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 08:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F84C433C8;
	Mon,  4 Dec 2023 08:48:33 +0000 (UTC)
Message-ID: <ce56b148-62a6-45bb-af87-bbf8feb96f45@xs4all.nl>
Date: Mon, 4 Dec 2023 09:48:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: videobuf2: request more buffers for vb2_read
Content-Language: en-US, nl
To: "Dr. David Alan Gilbert" <dave@treblig.org>, a.j.buxton@gmail.com
Cc: linux-media@vger.kernel.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>
References: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
 <86ad4808718ff07ab8ac64b62170b789c16b2581.1701349092.git.hverkuil-cisco@xs4all.nl>
 <ZWyw9us9hvj9X4gF@gallifrey>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ZWyw9us9hvj9X4gF@gallifrey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2023 17:46, Dr. David Alan Gilbert wrote:
> * Hans Verkuil (hverkuil-cisco@xs4all.nl) wrote:
>> The vb2 read support requests 1 buffer, leaving it to the driver
>> to increase this number to something that works.
>>
>> Unfortunately, drivers do not deal with this reliably, and in fact
>> this caused problems for the bttv driver and reading from /dev/vbiX,
>> causing every other VBI frame to be all 0.
>>
>> Instead, request as the number of buffers whatever is the maximum of
>> 2 and q->min_buffers_needed+1.
>>
>> In order to start streaming you need at least q->min_buffers_needed
>> queued buffers, so add 1 buffer for processing. And if that field
>> is 0, then choose 2 (again, one buffer is being filled while the
>> other one is being processed).
>>
>> This certainly makes more sense than requesting just 1 buffer, and
>> the VBI bttv support is now working again.
>>
>> It turns out that the old videobuf1 behavior of bttv was to allocate
>> 8 (video) and 4 (vbi) buffers when used with read(). After the vb2
>> conversion that changed to 2 for both. With this patch it is 3, which
>> is really all you need.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Fixes: b7ec3212a73a ("media: bttv: convert to vb2")
> 
> This looks like it's working nicely;  I've tested it with both
> Alistair's test stream and a real signal, and I'm getting
> a consistent 25fps out of the VBI with or without xawtv
> grabbing, and the test stream looks good to me.
> 
> So,
> 
> Tested-by: Dr. David Alan Gilbert <dave@treblig.org>
> 
> Thanks for fixing this!

Thank you for testing this!

Much appreciated.

Regards,

	Hans

> 
> Dave
> 
>> ---
>>  drivers/media/common/videobuf2/videobuf2-core.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 8c1df829745b..40d89f29fa33 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -2735,9 +2735,14 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>>  		return -EBUSY;
>>  
>>  	/*
>> -	 * Start with count 1, driver can increase it in queue_setup()
>> +	 * Start with q->min_buffers_needed + 1, driver can increase it in
>> +	 * queue_setup()
>> +	 *
>> +	 * 'min_buffers_needed' buffers need to be queued up before you
>> +	 * can start streaming, plus 1 for userspace (or in this case,
>> +	 * kernelspace) processing.
>>  	 */
>> -	count = 1;
>> +	count = max(2, q->min_buffers_needed + 1);
>>  
>>  	dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
>>  		(read) ? "read" : "write", count, q->fileio_read_once,
>> -- 
>> 2.42.0
>>


