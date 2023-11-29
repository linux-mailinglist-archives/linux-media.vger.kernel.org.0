Return-Path: <linux-media+bounces-1366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F3E7FD8E2
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B20B2832FE
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6312CCB8;
	Wed, 29 Nov 2023 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bu8LQ5GM"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EC6CE;
	Wed, 29 Nov 2023 06:03:25 -0800 (PST)
Received: from [100.122.216.38] (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 97DA56602F24;
	Wed, 29 Nov 2023 14:03:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701266603;
	bh=b6+ijhuLS88ltAwu7BXjh1rAJvOdjCKQaRzxoejPv4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bu8LQ5GMgFuLSvVASEwXe4Q5ZReofSektOwVrjhLicV/nbfkoOnfdHR/M3EswcMW7
	 s1dsjIA+9VOfS0GqbQotfBRMxj6Darr13HwKvZ75gw3T9YjPg4T1xC6/p5Mvkd/UnW
	 pLEmNvoDTrNXeTegisVMJ2+Etjg7ZalJjYhXbrZInb0o9jok1EHgWrNh/sXyc4m4pk
	 NilB+X55GcW+iL6aj1skRM11qNQvktH+Fnpm2g2tlF8zPkAIF9YuVHAYmJkg495R3w
	 6Z3BgFtnRuHXZHVFbgd7TWcFsKyRamG0BTbcXrtj8FYwMRMqx7fsmDeXZOBsq2xBWD
	 OIn9WxkVfy+Gg==
Message-ID: <54881dbe-e722-4a2d-840d-972d1a58331a@collabora.com>
Date: Wed, 29 Nov 2023 15:03:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/55] media: sun6i-isp: Stop abusing of
 min_buffers_needed field
Content-Language: en-US
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, tfiga@chromium.org,
 m.szyprowski@samsung.com, matt.ranostay@konsulko.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-28-benjamin.gaignard@collabora.com>
 <ZWc_S8CuPyc9zRXz@aptenodytes>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <ZWc_S8CuPyc9zRXz@aptenodytes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 29/11/2023 à 14:40, Paul Kocialkowski a écrit :
> Hi Benjamin,
>
> On Mon 27 Nov 23, 17:54, Benjamin Gaignard wrote:
>> 'min_buffers_needed' is suppose to be used to indicate the number
>> of buffers needed by DMA engine to start streaming.
>> sun6i-isp driver doesn't use DMA engine and just want to specify
>> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
>> That 'min_reqbufs_allocation' field purpose so use it.
> The hardware actually has its own DMA engine. It can work with just one buffer
> though (which will never be returned to userspace). But I think we should still
> require at least two buffers allocated, otherwise the driver will be of no use
> at all.
>
> So I don't think the commit message here is correct.

That is exactly the info I hope to get for this first series since I don't know
each hardware block details.
I will remove this commit and make the driver use min_queued_buffers field instead
so that will fit with it needs.

Thanks,
Benjamin

>
> Cheers,
>
> Paul
>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> CC: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>> CC: Chen-Yu Tsai <wens@csie.org>
>> CC: Jernej Skrabec <jernej.skrabec@gmail.com>
>> CC: Samuel Holland <samuel@sholland.org>
>> CC: linux-sunxi@lists.linux.dev
>> ---
>>   drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c | 2 +-
>>   drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c  | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
>> index 1595a9607775..f47f9946c19f 100644
>> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
>> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
>> @@ -660,7 +660,7 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *isp_dev)
>>   	queue->buf_struct_size = sizeof(struct sun6i_isp_buffer);
>>   	queue->ops = &sun6i_isp_capture_queue_ops;
>>   	queue->mem_ops = &vb2_dma_contig_memops;
>> -	queue->min_buffers_needed = 2;
>> +	queue->min_reqbufs_allocation = 2;
>>   	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>   	queue->lock = &capture->lock;
>>   	queue->dev = isp_dev->dev;
>> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
>> index e28be895b486..259f6bfcb620 100644
>> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
>> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
>> @@ -489,7 +489,7 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
>>   	queue->buf_struct_size = sizeof(struct sun6i_isp_buffer);
>>   	queue->ops = &sun6i_isp_params_queue_ops;
>>   	queue->mem_ops = &vb2_vmalloc_memops;
>> -	queue->min_buffers_needed = 1;
>> +	queue->min_reqbufs_allocation = 1;
>>   	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>   	queue->lock = &params->lock;
>>   	queue->dev = isp_dev->dev;
>> -- 
>> 2.39.2
>>

