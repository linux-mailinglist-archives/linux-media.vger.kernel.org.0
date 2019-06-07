Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61F8338997
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 14:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbfFGMBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 08:01:48 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56565 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727388AbfFGMBs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 08:01:48 -0400
Received: from [IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a] ([IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZDZ0hDDAj3qlsZDZ3hsZSq; Fri, 07 Jun 2019 14:01:46 +0200
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
 <20190607111634.GA7593@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
Date:   Fri, 7 Jun 2019 14:01:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190607111634.GA7593@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLfeeMP+rCNkbWTiWrIeJ3Iy4B5QuUKo5iVF0sUsNe2q2jC2hY/BMjYY4LYCxW4safUxXMvWj+yUO5+9DvlUpsFHrgUIUb9vtR+fqQhsu7FUOEcAMc/A
 RjzRTSLe1e6RU87p9zA5iF7g8I/BaD+rK1ZZ7HoMfyODT0Whd7L6FRtkGg5WvapShOoCcg9HQgPw7P9VHUvgk04StK32j+xjcKYs8zMT9nwovBZtpEttIjUG
 Hb+xy8O4dQQf6Tnne+y9sTeM9rG/gJO0PT6RRTNtRtCIVtuOFsIA6N9RBe2WES3ru08yV7kZab9k+kGgcKkYD1z/+9t5TXJfg80ZGbqrLsLXM8nHTDN6Su/6
 5tdi92Lu8x64cBJUUQZRrGgn+oXfdQ6vQ2QJPZAIq5kUxc5iHvENRCJ1Hku+elyFB7XcrnFnhtzvDldMFp0MX4p2UA88Qw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/7/19 1:16 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
>> The __prepare_userptr() function made the incorrect assumption that if the
>> same user pointer was used as the last one for which memory was acquired, then
>> there was no need to re-acquire the memory. This assumption was never properly
>> tested, and after doing that it became clear that this was in fact wrong.
> 
> Could you explain in the commit message why the assumption is not
> correct ?

You can free the memory, then allocate it again and you can get the same pointer,
even though it is not necessarily using the same physical pages for the memory
that the kernel is still using for it.

Worse, you can free the memory, then allocate only half the memory you need and
get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
the original mapping still remains), but this can corrupt userspace memory
causing the application to crash. It's not quite clear to me how the memory can
get corrupted. I don't know enough of those low-level mm internals to understand
the sequence of events.

I have test code for v4l2-compliance available if someone wants to test this.

> 
>> Change the behavior to always reacquire memory.
> 
> One more reason to not use USERPTR :-)

I agree.

Regards,

	Hans

> 
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Reported-by: Tomasz Figa <tfiga@chromium.org>
>> Cc: <stable@vger.kernel.org>      # for v5.1 and up
>> ---
>> This should be backported to all stable kernels, unfortunately this patch only
>> applies cleanly to 5.1, so this has to be backported manually.
>> ---
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 4489744fbbd9..a6400391117f 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -1013,7 +1013,7 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>>  	void *mem_priv;
>>  	unsigned int plane;
>>  	int ret = 0;
>> -	bool reacquired = vb->planes[0].mem_priv == NULL;
>> +	bool called_cleanup = false;
>>
>>  	memset(planes, 0, sizeof(planes[0]) * vb->num_planes);
>>  	/* Copy relevant information provided by the userspace */
>> @@ -1023,15 +1023,6 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>>  		return ret;
>>
>>  	for (plane = 0; plane < vb->num_planes; ++plane) {
>> -		/* Skip the plane if already verified */
>> -		if (vb->planes[plane].m.userptr &&
>> -			vb->planes[plane].m.userptr == planes[plane].m.userptr
>> -			&& vb->planes[plane].length == planes[plane].length)
>> -			continue;
>> -
>> -		dprintk(3, "userspace address for plane %d changed, reacquiring memory\n",
>> -			plane);
>> -
>>  		/* Check if the provided plane buffer is large enough */
>>  		if (planes[plane].length < vb->planes[plane].min_length) {
>>  			dprintk(1, "provided buffer size %u is less than setup size %u for plane %d\n",
>> @@ -1044,8 +1035,8 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>>
>>  		/* Release previously acquired memory if present */
>>  		if (vb->planes[plane].mem_priv) {
>> -			if (!reacquired) {
>> -				reacquired = true;
>> +			if (!called_cleanup) {
>> +				called_cleanup = true;
>>  				vb->copied_timestamp = 0;
>>  				call_void_vb_qop(vb, buf_cleanup, vb);
>>  			}
> 
> Could we do this unconditionally before the loop ?
> 
>> @@ -1083,17 +1074,14 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>>  		vb->planes[plane].data_offset = planes[plane].data_offset;
>>  	}
>>
>> -	if (reacquired) {
>> -		/*
>> -		 * One or more planes changed, so we must call buf_init to do
>> -		 * the driver-specific initialization on the newly acquired
>> -		 * buffer, if provided.
>> -		 */
>> -		ret = call_vb_qop(vb, buf_init, vb);
>> -		if (ret) {
>> -			dprintk(1, "buffer initialization failed\n");
>> -			goto err;
>> -		}
>> +	/*
>> +	 * Call buf_init to do the driver-specific initialization on
>> +	 * the newly acquired buffer.
>> +	 */
>> +	ret = call_vb_qop(vb, buf_init, vb);
>> +	if (ret) {
>> +		dprintk(1, "buffer initialization failed\n");
>> +		goto err;
>>  	}
>>
>>  	ret = call_vb_qop(vb, buf_prepare, vb);
> 

