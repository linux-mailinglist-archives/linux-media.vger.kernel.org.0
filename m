Return-Path: <linux-media+bounces-48127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A75EC9E36E
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 09:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 970434E12B3
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 08:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F042C326D;
	Wed,  3 Dec 2025 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYLGFAav"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B128C5AA;
	Wed,  3 Dec 2025 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750517; cv=none; b=oRsUxiTieVA5uf3+PzkPg/gkivLrXa5WEqEtr8zGONhZPexoEzUXbwyjeWGKQ6HFlA7295ugqU9DM2Fv0mxKbxN/6rpsLJIYu3uPFa1Vamdet7ZLDbRoFhLJrmTvmbME9UEQvwIQ1aVJQ8DHyvNXlzsxL2l9NBdo++V3Rvliljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750517; c=relaxed/simple;
	bh=85o+cf9gxbwDb9z+YC7P6wa+7B4GhGRhOT8SXJ0Xs7k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SbcMiOjOOuhPfQkOmVX1xIrtxRz1sleKFsKv5z1auCiWu9ewEXfKECvom2rJtswrzGauM6qEKQYx54Q4bvtK/3Ez8/tUZMat9Sg9xFjBkQbAvmfwawbT329cLSsGifFQWK2hwopwsatz3CXQtZ6WX8DMSmUWHI4p/ojQ4hDUYWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYLGFAav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEC3C4CEFB;
	Wed,  3 Dec 2025 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764750517;
	bh=85o+cf9gxbwDb9z+YC7P6wa+7B4GhGRhOT8SXJ0Xs7k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=gYLGFAavjjJCQsmkF4R6CvqNPOF0x2ZIamxZ98I0zbJDwGWkYVwzfa+HUQoCfww2M
	 +5lnSqmEFUq7wq9YPRHqjrZowueZKBHHSBufhFex57RVWcPOp4Z8cYU8vmMd0gklqy
	 7YRIaA/e+tWgAf1MOcqet94nmCUl+qWGvCL64O0PsizzYgqRbZn4fxwdSGLLMW+KFz
	 +h2LlFTBZaZXKXbOYMFZs/MC7BZSH2IX2jHv5lI5tmkC3hAM7GBDWqFyMumlDUzB4l
	 ll+yqs02U0mNq6WWlu6ZYa1W4c2FsvaG/BD6Ks85g8zvwpGWe5VE6yhW+HmO4Rzhoi
	 9F3+lppcEIFdQ==
Message-ID: <5d367bbb-551f-4164-8473-a6c4b68793c0@kernel.org>
Date: Wed, 3 Dec 2025 09:28:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
To: Hirokazu Honda <hiroh@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Boris Brezillon <bbrezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Laura Nao <laura.nao@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
 <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org>
Content-Language: en-US, nl
In-Reply-To: <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Hiro,

For those who are interested, the original thread is here:

https://lore.kernel.org/linux-media/20220322132329.6527-1-dmitry.osipenko@collabora.com/

On 02/12/2025 21:07, Hirokazu Honda wrote:
> Hi all,
> 
> How does the community think about this change these days?
> This unblocks using a frame whose planes are actually in the
> same dma buffer with multi-planar format in CAPTURE queue whose
> memory type is DMABUF in decoding.
> I agree that the v4l2_buffer_ext API is a right way to support it,
> but we haven't achieved the new API support for about 5 years, and
> not sure if we will do in the near future.
> 
> Could the community elaborate merging this change?

As I mentioned back in 2022, I am very hesitant to fiddle with data_offset.
It was a bad idea that should never have been implemented in hindsight.

The reason that the v4l2_buffer_ext API was never pursued is that nobody
was sufficiently motivated to keep working on it and keep pushing for it.
It is not because it was a bad idea.

I keep hoping that someone will revisit it and start working on it again.
The current API is old and awkward to use for multiplanar buffers. And it
is missing features that would be nice to add.

Dmitry's last post [1] in the thread back in 2022 was interesting, both his
comments on whether the new ioctls would actually be needed, and his proposal
for adding a new buf_offset field to struct v4l2_plane.

That said, I still think a new v4l2_buffer_ext struct would be really nice.
The old v4l2_buffer is inefficient (complex compat32 and Y2038 handling,
almost out of reserved fields, useless timecode struct, awkward to work
with multiple planes), so even without adding new fields there is a lot
that can be improved here.

The problem with adding a field to v4l2_plane only is that it limits
support to multiplanar drivers. It's probably possible to hack it in
struct v4l2_buffer as well, but that's just piling more crap into an
already crappy struct.

So that's were I am: I'm not opposed to supporting this feature, but I
feel that struct v4l2_buffer has reached end-of-life, and that it is
time for a modern replacement.

Other may disagree, I'm happy to hear arguments for that.

Regards,

	Hans

[1] https://lore.kernel.org/linux-media/f66a02b6-5e2d-5e28-8c92-0a76d53269f7@collabora.com/

> 
> Best Regards,
> -Hiro
> 
> On 2022/03/22 午前6:23, Dmitry Osipenko wrote:
>> Use data offsets provided by applications for multi-planar capture
>> buffers. This allows V4L to import and use dma-bufs exported by other
>> subsystems in cases where application wants to customize data offsets
>> of capture buffers in order to meet hardware alignment requirements of
>> both dma-buf exporter and importer.
>>
>> This feature is wanted for providing a better support of media hardware
>> found on Chromebooks. In particular display and camera ISP hardware of
>> Rockchip and MediaTek SoCs require special handling by userspace because
>> display h/w has specific alignment requirements that don't match default
>> alignments expected by V4L and there is a need to customize the data
>> offsets in case of multi-planar formats.
>>
>> Some drivers already have preliminary support for data offsets
>> customization of capture buffers, like NVIDIA Tegra video decoder driver
>> for example, and V4L allows applications to provide data offsets for
>> multi-planar output buffers, let's support such customization for the
>> capture buffers as well.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>   Documentation/userspace-api/media/v4l/buffer.rst | 9 ++++++++-
>>   drivers/media/common/videobuf2/videobuf2-v4l2.c  | 7 +++++++
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
>> index 4638ec64db00..75b1929e2acb 100644
>> --- a/Documentation/userspace-api/media/v4l/buffer.rst
>> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
>> @@ -369,13 +369,20 @@ struct v4l2_plane
>>         - ``data_offset``
>>         - Offset in bytes to video data in the plane. Drivers must set this
>>   	field when ``type`` refers to a capture stream, applications when
>> -	it refers to an output stream.
>> +	it refers to an output or capture stream.
>>   
>>   	.. note::
>>   
>>   	   That data_offset is included  in ``bytesused``. So the
>>   	   size of the image in the plane is ``bytesused``-``data_offset``
>>   	   at offset ``data_offset`` from the start of the plane.
>> +
>> +	   For capture planes data_offset may be specified by applications
>> +	   and by drivers. Driver may override application's offset or error
>> +	   out buffer if offset can't be satisfied by hardware. This allows
>> +	   applications to customize data offsets of imported dma-bufs.
>> +	   Handling of application's offsets is driver-dependent, application
>> +	   must use the resulting buffer offset.
>>       * - __u32
>>         - ``reserved[11]``
>>         - Reserved for future use. Should be zeroed by drivers and
>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> index 6edf4508c636..929107a431cc 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> @@ -263,6 +263,13 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>>   						psrc->bytesused : pdst->length;
>>   				pdst->data_offset = psrc->data_offset;
>>   			}
>> +		} else {
>> +			for (plane = 0; plane < vb->num_planes; ++plane) {
>> +				struct vb2_plane *pdst = &planes[plane];
>> +				struct v4l2_plane *psrc = &b->m.planes[plane];
>> +
>> +				pdst->data_offset = psrc->data_offset;
>> +			}
>>   		}
>>   	} else {
>>   		/*


