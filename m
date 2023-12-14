Return-Path: <linux-media+bounces-2425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F8F813509
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 16:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6714C1C20B25
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 15:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3315D8F3;
	Thu, 14 Dec 2023 15:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DATtQ2jW"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C758D111;
	Thu, 14 Dec 2023 07:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702568512;
	bh=AwBqTH3jxYY2SxYvwm4RiTxswXu1qwwNdGeqdtO0ynw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DATtQ2jW6I9h/uNNbShGq4bU04cLoI87NzvIJUU4Lx04d5wDrvFigL3GNhYuLk4NL
	 e/ikmviXtmHaS2xBzjYCYW29jx5altAcA4X1P98I89Z0KWMgu73Rt9A6f2Lx87Z/h+
	 PTy2M0tU+i4flGj0s2sJwO9FkfO6yJTbnRy5i2daXtMRdwJnS3uwc1DGkcgL7paKzp
	 6gRJ+kSDA6TjK3shglv4+NlqBz1tRshV0xj9YaGCVgJ26X66eKgWN73cgLk42bT5K+
	 9k+XZ2sT9YeMoGyeCdD8La9D9E8yjuiXqh4Lzp/h9BF9aOY+8QMHuSB4uasVTk+DLO
	 5iB9QttJB4f2Q==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2C1A13781485;
	Thu, 14 Dec 2023 15:41:52 +0000 (UTC)
Message-ID: <0e64b778-e4ff-4b2f-9864-b5d58f642e0e@collabora.com>
Date: Thu, 14 Dec 2023 16:41:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] videobuf2: core: Rename min_buffers_needed field
 to vb2_queue
To: Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org, tfiga@chromium.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231211133251.150999-1-benjamin.gaignard@collabora.com>
 <20231211133251.150999-2-benjamin.gaignard@collabora.com>
 <839535af-acba-4240-b9c6-d592d898dc4c@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <839535af-acba-4240-b9c6-d592d898dc4c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 13/12/2023 à 17:39, Hans Verkuil a écrit :
> Hi Benjamin,
>
> On 11/12/2023 14:32, Benjamin Gaignard wrote:
>> Rename min_buffers_needed into min_queued_buffers and update
>> the documentation about it.
> I merged this patch, but not the others. I also dropped one functional
> change:
>
> <snip>
>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 40d89f29fa33..8912dff5bde3 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -865,7 +865,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>>   	/*
>>   	 * Make sure the requested values and current defaults are sane.
>>   	 */
>> -	num_buffers = max_t(unsigned int, *count, q->min_buffers_needed);
>> +	num_buffers = max_t(unsigned int, *count, q->min_queued_buffers + 1);
>>   	num_buffers = min_t(unsigned int, num_buffers, q->max_num_buffers);
>>   	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>>   	/*
> That "+ 1" didn't really belong here, since everything else was just renaming a
> field. Such a patch shouldn't make any other changes.
>
> There were also three more occurrences of min_buffers_needed (one in a comment,
> two in a vivid function argument), and I renamed those as well.
>
> 'git grep min_buffers_needed' now no longer shows any hits.
>
> I decided not to take the other patches, I think it is best if you rebase
> and repost the series on top of staging and in the new year we'll continue with
> it. I did not feel that I had enough time to really review the remaining patches.

Do you want me to re-post only the two missing patches or should I add the patches for
delete buffers feature since it is the ultimate goal of this ?

Regards,
Benjamin

>
> However, it is nice to have this large rename patch merged. It touches on a lot
> of files, so it is annoying to have to carry that around. And now was a good
> moment to merge it.
>
> Regards,
>
> 	Hans
>

