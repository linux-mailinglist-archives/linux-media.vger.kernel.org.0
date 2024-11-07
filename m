Return-Path: <linux-media+bounces-21041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 719229C00F4
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 10:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C185EB216E6
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 09:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8061DFDB4;
	Thu,  7 Nov 2024 09:17:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C63192B73;
	Thu,  7 Nov 2024 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730971041; cv=none; b=FC4IKH4sREazhcStCxiOFxZ7RU+eWQWeiFzPbXgtxx5SGYcCFnCX9CBbzwOFXypIXuGXj4JylRC/95sJct7IzusdW+1sD7n0DhgqrBVYOX6FrwkySAL17hCv8z4MT76MIFS2nyYlVbdrbGJ5s5cw2O1copqgkLdH/J0RnFqTxKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730971041; c=relaxed/simple;
	bh=SkfFvecVs2l+s2XYosQTMeR4oTOSQgmyAuYa8UD0azU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pp9zutdRka1BGMtmWUYpxOpqUbpNU02Oz851T0HsQU7pFzww7QoJMzurxUAJkUorekLCfMAPWw0vZTypoEYCENjF9/Wx0slDUuD/ZLo2ZHznTBOVdUMUZkgmZm+AH3+ZJDsrHJrCP4+Wa46LLebS8OTJYGBkzNeGJYh8XU/6BG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28FBC4CECC;
	Thu,  7 Nov 2024 09:17:18 +0000 (UTC)
Message-ID: <94f7c775-10bd-46d5-bc89-a18533dcab68@xs4all.nl>
Date: Thu, 7 Nov 2024 10:17:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2-core: copy vb planes unconditionally
To: Tomasz Figa <tfiga@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: m.szyprowski@samsung.com, mchehab@kernel.org, yunkec@chromium.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com, stable@vger.kernel.org
References: <20241106121802.2939237-1-tudor.ambarus@linaro.org>
 <CAAFQd5B51wa1dD3FzHKxsg4VaA_bHzUrFGmA19q8jUybsMuS0Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAAFQd5B51wa1dD3FzHKxsg4VaA_bHzUrFGmA19q8jUybsMuS0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/11/2024 00:41, Tomasz Figa wrote:
> On Wed, Nov 6, 2024 at 9:18 PM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Copy the relevant data from userspace to the vb->planes unconditionally
>> as it's possible some of the fields may have changed after the buffer
>> has been validated.
>>
>> Keep the dma_buf_put(planes[plane].dbuf) calls in the first
>> `if (!reacquired)` case, in order to be close to the plane validation code
>> where the buffers were got in the first place.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 95af7c00f35b ("media: videobuf2-core: release all planes first in __prepare_dmabuf()")
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../media/common/videobuf2/videobuf2-core.c   | 28 ++++++++++---------
>>  1 file changed, 15 insertions(+), 13 deletions(-)
>>
> 
> Thanks for the fix.
> 
> Acked-by: Tomasz Figa <tfiga@chromium.org>
> 
> (We probably need some tests to verify this behavior... It seems like
> the way v4l2-compliance is implemented [1] would only trigger the
> !reacquired case on most drivers.)
> 
> [1] https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-buffers.cpp#n2071
> (just queuing all imported buffers in order and re-queuing them
> exactly as they are dequeued [2])
> [2] https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-buffers.cpp#n1299

I'll see if I can improve that test.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index f07dc53a9d06..c0cc441b5164 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -1482,18 +1482,23 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>>                         }
>>                         vb->planes[plane].dbuf_mapped = 1;
>>                 }
>> +       } else {
>> +               for (plane = 0; plane < vb->num_planes; ++plane)
>> +                       dma_buf_put(planes[plane].dbuf);
>> +       }
>>
>> -               /*
>> -                * Now that everything is in order, copy relevant information
>> -                * provided by userspace.
>> -                */
>> -               for (plane = 0; plane < vb->num_planes; ++plane) {
>> -                       vb->planes[plane].bytesused = planes[plane].bytesused;
>> -                       vb->planes[plane].length = planes[plane].length;
>> -                       vb->planes[plane].m.fd = planes[plane].m.fd;
>> -                       vb->planes[plane].data_offset = planes[plane].data_offset;
>> -               }
>> +       /*
>> +        * Now that everything is in order, copy relevant information
>> +        * provided by userspace.
>> +        */
>> +       for (plane = 0; plane < vb->num_planes; ++plane) {
>> +               vb->planes[plane].bytesused = planes[plane].bytesused;
>> +               vb->planes[plane].length = planes[plane].length;
>> +               vb->planes[plane].m.fd = planes[plane].m.fd;
>> +               vb->planes[plane].data_offset = planes[plane].data_offset;
>> +       }
>>
>> +       if (reacquired) {
>>                 /*
>>                  * Call driver-specific initialization on the newly acquired buffer,
>>                  * if provided.
>> @@ -1503,9 +1508,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>>                         dprintk(q, 1, "buffer initialization failed\n");
>>                         goto err_put_vb2_buf;
>>                 }
>> -       } else {
>> -               for (plane = 0; plane < vb->num_planes; ++plane)
>> -                       dma_buf_put(planes[plane].dbuf);
>>         }
>>
>>         ret = call_vb_qop(vb, buf_prepare, vb);
>> --
>> 2.47.0.199.ga7371fff76-goog
>>


