Return-Path: <linux-media+bounces-17444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC8969658
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 09:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD25D1C234B5
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 07:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0335200121;
	Tue,  3 Sep 2024 07:59:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A85B1DAC77
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725350351; cv=none; b=tvZQeQkxM7TNbshrxeQB9iWcRBahcRKgDYlnUZwDfETJbajYhQTxJ2mvq6ZSw9YvS9r0AdGXB9HmlHnAOqCEHbp1XyNpwn46fpQ5i/7VUYZ+bCxTUy6rRoVnVZIgVJF6Z/CCcfuAzSMHcGAboAztx+QQSSs+kk2Q1uOhP5SOyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725350351; c=relaxed/simple;
	bh=/s0Z1nMrzl1yPyby7Q9J69tjRrQRJX41pWKFOiojhFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SrjjnEj0GWOxvUU3A363oFdxbIxLi5gIuSilVFmiCrvfSytBTjpyhACU1Zhfgdnkv+ku87eJDGCK5QB+tcC637R+415pwLSSedd6GriS7UpFNzMXO5scBleC9NrmQhcIzuxaFTkaMbEIKg4gDNwURAWNnc27wgPX4jNMCkePfcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61284C4CEC5;
	Tue,  3 Sep 2024 07:59:10 +0000 (UTC)
Message-ID: <bea65459-5c71-4ab8-bdfe-9e5c4fda4d6a@xs4all.nl>
Date: Tue, 3 Sep 2024 09:59:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: atomisp: add missing wait_prepare/finish ops
To: Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org
References: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
 <9f401f3732dd728e3d2ca508002c97b80a2eae30.1725265884.git.hverkuil-cisco@xs4all.nl>
 <5e8e08e9-d807-4626-8e9b-b34fe6cef447@redhat.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <5e8e08e9-d807-4626-8e9b-b34fe6cef447@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hans,

On 02/09/2024 12:39, Hans de Goede wrote:
> Hi Hans,
> 
> On 9/2/24 10:31 AM, Hans Verkuil wrote:
>> Without these ops the v4l2-compliance blocking wait test will fail.
>> These ops are required to ensure that when VIDIOC_DQBUF has to
>> wait for buffers to arrive, the queue lock is correctly released
>> and retaken. Otherwise the wait for a buffer would block all other
>> queue ioctls.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Hans de Goede <hdegoede@redhat.com>
> 
> Thank you for this patch.
> 
> I have merged this in my media-atomisp branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
> 
> I'll run some tests when I'm back home tonight (with access to
> atomisp2 hw) before included this in my upcoming atomisp pull-request
> for 6.12.

Would you be able to post a PR today? We want to switch over to our new gitlab
tree (https://gitlab.freedesktop.org/linux-media/media-staging), but we'd like
to get all PRs for 6.12 merged first.

Regards,

	Hans

> 
> Regards,
> 
> Hans
> 
> 
>> ---
>>  drivers/staging/media/atomisp/pci/atomisp_fops.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
>> index 50c4123ba006..b180fcbea9b1 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
>> @@ -441,6 +441,8 @@ const struct vb2_ops atomisp_vb2_ops = {
>>  	.buf_queue		= atomisp_buf_queue,
>>  	.start_streaming	= atomisp_start_streaming,
>>  	.stop_streaming		= atomisp_stop_streaming,
>> +	.wait_prepare		= vb2_ops_wait_prepare,
>> +	.wait_finish		= vb2_ops_wait_finish,
>>  };
>>  
>>  static void atomisp_dev_init_struct(struct atomisp_device *isp)
> 
> 


