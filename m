Return-Path: <linux-media+bounces-35005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 919FFADBB7F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 22:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D990A18927B8
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 20:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D667E211A3C;
	Mon, 16 Jun 2025 20:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0ZSAZeX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC912BF01B;
	Mon, 16 Jun 2025 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107058; cv=none; b=iTZMRSG0bOKtiv+4BWc3nNLSsZTspBFJi3l6iSO2FOi4XwWTF/0Ev2tkgGx+GLSyFKDWBTQ3IBB6m19UsxJNR06fjJce3IPR3Zm7A2WjdNiGN+Zu5ABuharwTG2BydjfPLpzoTnBCPyJFh1UaJPt5xktUSaXlB9oh+TVNDoGMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107058; c=relaxed/simple;
	bh=ZwQBR3w6FYeENNK2A1rIxbwJvVKlbVENEpSzmjdyoL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKAOlE+D+pmHv9hVNC5lkX7hMw7rVfS2SiwP8zF3osi5Cqnpa02YKEyPm18OxTmx9tMzkQ7Pucgr3XNWm1ccQBEf7ZvqcGPZ1qGQgveJjQ1dZ561Yvfy2BKipwn9YW4kzxN0r3M4fvDyCKKeDMCRCpu73nqZgddUyKOiVjuYs9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0ZSAZeX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E3AC4CEEA;
	Mon, 16 Jun 2025 20:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750107057;
	bh=ZwQBR3w6FYeENNK2A1rIxbwJvVKlbVENEpSzmjdyoL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E0ZSAZeXtEnI8R+5VVkK7FUknkYUVsTcXPlKs1sum/2uw/deaKdrqoBIb1lVDDMpM
	 SXwSe58yy9H7RfcQUPhbCWpYF9haI6gLlfXVMJqRLkCNf9uwThjsSROxa71JWUk3MC
	 u+BdsE8vs3ylrXY9jLgfwtHCUd2JdRdL9aU4cgH+kqiTqLah/A6R+LH4U4cH1LUb59
	 P+tj1ljW5yjJSw4xpsqAKFFGiOyF+DvJe6ahnpnbYjEoZW0IXe42pcSebpH3DYCeNs
	 PstjLTaF+p7LSeodyPha9MCZHa/2mEoUTGd7RdG5+p9et2Md3kilsIdsOAKhIBo1as
	 Cx52/T2T2rniA==
Message-ID: <843b32df-64d5-4711-8415-4044174e575f@kernel.org>
Date: Mon, 16 Jun 2025 22:50:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: uvcvideo: Use prio state from v4l2_device
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-5-250286570ee7@chromium.org>
 <CANiDSCur8zys_CSZC9+-QdD0U556A7HLLdSN8mJuOpXm+Ls8Wg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCur8zys_CSZC9+-QdD0U556A7HLLdSN8mJuOpXm+Ls8Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 16-Jun-25 8:30 PM, Ricardo Ribalda wrote:
> Hello All
> 
> On Mon, 16 Jun 2025 at 17:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
>>
>> Currently, a UVC device can have multiple chains, and each chain maintains
>> its own priority state. While this behavior is technically correct for UVC,
>> uvcvideo is the *only* V4L2 driver that does not utilize the priority state
>> defined within `v4l2_device`.
>>
>> This patch modifies uvcvideo to use the `v4l2_device` priority state. While
>> this might not be strictly "correct" for uvcvideo's multi-chain design, it
>> aligns uvcvideo with the rest of the V4L2 drivers, providing "correct enough"
>> behavior and enabling code cleanup in v4l2-core. Also, multi-chain
>> devices are extremely rare, they are typically implemented as two
>> independent usb devices.
> 
> As the cover letter says, this last patch 5/5 is a RFC. We can decide
> if it is worth to keep it or not.
> 
> The pros is that we can do some cleanup in the core, the cons is that
> it might break kAPI.

I've no objections against this change, but lets wait and see what
Laurent has to say.

Regards,

Hans




>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/uvc/uvc_driver.c | 2 --
>>  drivers/media/usb/uvc/uvcvideo.h   | 1 -
>>  2 files changed, 3 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index accfb4ca3c72cb899185ddc8ecf4e29143d58fc6..e3795e40f14dc325e5bd120f5f45b60937841641 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -1728,7 +1728,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
>>         INIT_LIST_HEAD(&chain->entities);
>>         mutex_init(&chain->ctrl_mutex);
>>         chain->dev = dev;
>> -       v4l2_prio_init(&chain->prio);
>>
>>         return chain;
>>  }
>> @@ -2008,7 +2007,6 @@ int uvc_register_video_device(struct uvc_device *dev,
>>         vdev->fops = fops;
>>         vdev->ioctl_ops = ioctl_ops;
>>         vdev->release = uvc_release;
>> -       vdev->prio = &stream->chain->prio;
>>         vdev->queue = &queue->queue;
>>         vdev->lock = &queue->mutex;
>>         if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>> index 3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db..5ed9785d59c698cc7e0ac69955b892f932961617 100644
>> --- a/drivers/media/usb/uvc/uvcvideo.h
>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>> @@ -354,7 +354,6 @@ struct uvc_video_chain {
>>                                                  * uvc_fh.pending_async_ctrls
>>                                                  */
>>
>> -       struct v4l2_prio_state prio;            /* V4L2 priority state */
>>         u32 caps;                               /* V4L2 chain-wide caps */
>>         u8 ctrl_class_bitmap;                   /* Bitmap of valid classes */
>>  };
>>
>> --
>> 2.50.0.rc1.591.g9c95f17f64-goog
>>
> 
> 


