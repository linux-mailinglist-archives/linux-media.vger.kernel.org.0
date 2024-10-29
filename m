Return-Path: <linux-media+bounces-20520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD63A9B48A0
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF2F01C2252A
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 11:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF1D20513B;
	Tue, 29 Oct 2024 11:50:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9C1EE014
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730202612; cv=none; b=aG+KBYlO2ZiiORDskdzo5VigeXhbTc8zGyfRgIDaEpkWfrUbSzMrZf/iOCNNQf4ZPJPZFJLTNE/upsKwbirrEteSs9RHC0lD9Jh+nb/3tmyUxi3sSVlKC6ZR0tb1Y2khDQXkL+Te0WR/od+6vA5rSatic0bUyjXONDlJdiLoRhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730202612; c=relaxed/simple;
	bh=ePvvfvKIALLIfNMGA6/T8aXDGjVCDUyCSJRiGS6U6dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qD5ZbFp6QD1rqsfMr9qD1cqGMfCMRkmpaSUYaP1K81kycBxpt/B8OnpQSEje9IP+dqSCi96XiwJhl+322HKfIa989Hfv5N+PEX59vO5Ars6poKd1CsH+gWOs5fRgNQinAJUWEDAwmNcHgrfRhf9rBhK8ZKR7maqDPB1qQJv8R8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A595C4CECD;
	Tue, 29 Oct 2024 11:50:09 +0000 (UTC)
Message-ID: <216332ec-313c-481b-ac32-5aff2c0e4b9b@xs4all.nl>
Date: Tue, 29 Oct 2024 12:50:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: rkisp1: Remove min_queued_buffers
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 "open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>,
 "open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
 Adam Pigg <adam@piggz.co.uk>
References: <20241029082117.55385-1-jacopo.mondi@ideasonboard.com>
 <20241029112938.GK22600@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20241029112938.GK22600@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/24 12:29, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Tue, Oct 29, 2024 at 09:21:16AM +0100, Jacopo Mondi wrote:
>> There apparently is no reason to require 3 queued buffers for RkISP1,
>> as the driver operates with a scratch buffer where data can be
>> directed to if there's no available buffer provided by userspace.
>>
>> Reduce the number of required buffers to 0 by removing the
>> initialization of min_queued_buffers, to allow applications to operate
>> by queueing capture buffers on-demand.
>>
>> Tested with libcamera, by operating with a single capture request. The
>> same request (and the associated capture buffer) gets recycled once
>> completed. This of course causes a frame rate drop but doesn't hinder
>> operations.
>>
>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> 
>> ---
>> v2->v3:
>> - Remove min_queued_buffers initialization
>>
>> v1->v2:
>> The first version of this patch set min_queued_buffers to 1, but setting it
>> to 0 doesn't compromise operations and it's even better as it allows application
>> to queue buffers to the capture devices on-demand. If a buffer is not provided
>> to the DMA engines, image data gets directed to the driver's internal scratch
>> buffer.
>> ---
>>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> index 2bddb4fa8a5c..2f0c610e74b9 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> @@ -35,8 +35,6 @@
>>  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
>>  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
>>
>> -#define RKISP1_MIN_BUFFERS_NEEDED 3
>> -
>>  enum rkisp1_plane {
>>  	RKISP1_PLANE_Y	= 0,
>>  	RKISP1_PLANE_CB	= 1,
>> @@ -1563,7 +1561,6 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>>  	q->ops = &rkisp1_vb2_ops;
>>  	q->mem_ops = &vb2_dma_contig_memops;
>>  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
>> -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
>>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>  	q->lock = &node->vlock;
>>  	q->dev = cap->rkisp1->dev;
> 


