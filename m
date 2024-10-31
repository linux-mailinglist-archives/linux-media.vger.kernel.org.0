Return-Path: <linux-media+bounces-20637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 904439B78A0
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 11:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54951281F42
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4CD199236;
	Thu, 31 Oct 2024 10:26:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB110198E83
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730370410; cv=none; b=mBFHmokA7BSYTBJ7zC29KdqxCvuKNupMGgIrgSLg1SxBP+Qhsqb0h8AeCMKcCcin4DuG16Jm2nMIp0zUi+xX3XREsp3tpKjI/v9soZliNofMxmEMWwl5Gs1riOshct8pAgu50ycmUXyIDimAzsNCRBEECla2291xpUxnWWZpJp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730370410; c=relaxed/simple;
	bh=ZAba+5mU6i2oeOr8zkjuGPOdhWzIyvle2G9kIRlsg5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlvA+O6g3v9kWy5msJaPbvQXU3f5GnXUjRZUnEM6msvkSNBNhXJZQJNBLQjmNG3rszpui35SnXZMDACM8mCEBS2y11xuCDcFvq32Xx9Q9KYejh+9/Awgm+xj8T9TWmT9HupATwhtCDPy3g5xJly7iyikHsf+hRl07HnSvNOPBdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9103AC4CEC3;
	Thu, 31 Oct 2024 10:26:49 +0000 (UTC)
Message-ID: <2a61ded3-4cea-4a1a-9d16-aa74dbb22f74@xs4all.nl>
Date: Thu, 31 Oct 2024 11:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: media: improve V4L2_CID_MIN_BUFFERS_FOR_*,
 doc
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <93d078e5-deba-4060-a32e-94bce677453c@xs4all.nl>
 <20241031101141.GD2473@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20241031101141.GD2473@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/24 11:11, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Thu, Oct 31, 2024 at 08:50:04AM +0100, Hans Verkuil wrote:
>> Clearly state that the V4L2_CID_MIN_BUFFERS_FOR_OUTPUT and
>> V4L2_CID_MIN_BUFFERS_FOR_CAPTURE controls are required for
>> stateful codecs.
> 
> Wouldn't it be better for this kind of information to be centralized in
> a stateful decoder document ? That would make it easier for developers
> to see all they need to implement. Otherwise they would need to read
> through the whole documentation to pick the parts of the API they need
> to support in their drivers.

It's also already mentioned in the documentation for the stateful de/encoders here:

https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-mem2mem.html

Also, once this vicodec patch is merged:

https://patchwork.linuxtv.org/project/linux-media/patch/1dd09050-40ca-4c5b-b985-819731140388@xs4all.nl/

I plan to push v4l2-compliance patches that explicitly test for the presence of
these controls and fail if they are missing (like they are now in vicodec).

Regards,

	Hans

> 
>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>> ---
>>  Documentation/userspace-api/media/v4l/control.rst | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
>> index 57893814a1e5..9253cc946f02 100644
>> --- a/Documentation/userspace-api/media/v4l/control.rst
>> +++ b/Documentation/userspace-api/media/v4l/control.rst
>> @@ -290,13 +290,15 @@ Control IDs
>>      This is a read-only control that can be read by the application and
>>      used as a hint to determine the number of CAPTURE buffers to pass to
>>      REQBUFS. The value is the minimum number of CAPTURE buffers that is
>> -    necessary for hardware to work.
>> +    necessary for hardware to work. This control is required for stateful
>> +    decoders.
>>
>>  ``V4L2_CID_MIN_BUFFERS_FOR_OUTPUT`` ``(integer)``
>>      This is a read-only control that can be read by the application and
>>      used as a hint to determine the number of OUTPUT buffers to pass to
>>      REQBUFS. The value is the minimum number of OUTPUT buffers that is
>> -    necessary for hardware to work.
>> +    necessary for hardware to work. This control is required for stateful
>> +    encoders.
>>
>>  .. _v4l2-alpha-component:
>>
> 


