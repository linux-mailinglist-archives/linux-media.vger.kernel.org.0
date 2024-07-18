Return-Path: <linux-media+bounces-15120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365C934F48
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 16:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C9DAB23F84
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 14:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC89C142E78;
	Thu, 18 Jul 2024 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iPcPg/tQ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68F1428F3;
	Thu, 18 Jul 2024 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721313813; cv=none; b=qMor+tep4cnvq6Xa8bhKdkzRSBjlBCennqi8vHT0pCz9WEPw3uT01HElpjtvgkjqg3TffkRA17WOQ6KnkITHEcac6K9EaLT/oL/Bq4iwFsZgF8aj7mm3ZSv5Ez+oMZ0aCv/F0BVXsU/DUlDnWXEI0EdfOqVOMc1wPwfXcoCIoUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721313813; c=relaxed/simple;
	bh=bIz6pGrabOkWqeOOLGp/7zatmKtlgXevjscXxYUc558=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxKn2X1LUyQ96ALhm9S37pgIPSnca0q+rixNhrritROB3bMoeq/Wywo7Gfl/dWjRDBXXLYvwDhzaypjvNFVCHbq2wQYPGRKOVfRC8/s10KTy0bMv5zxfvczLqfo7luVLagaY6sEs8/0q5qCJJpNTLFpLHq5snqHf53b/QMM9IdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iPcPg/tQ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721313809;
	bh=bIz6pGrabOkWqeOOLGp/7zatmKtlgXevjscXxYUc558=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iPcPg/tQUnEWa7RbgKJmKryGWhd2xYuzpU21/acce0c88+cjY8RKrPCAuO11NlBEo
	 W1vHlpMjI9iq6pnFn8NXNwUKdNtkl/qTLgcwMPnLLeQgGUxbnyUZOvZhlDiEQuJI9F
	 IXV1YcFsCtbt7tOLg1yRpOe5x6DMbsMvj+9vv3zyJHInNnIX7mJCtld73T4IcFzF3p
	 e82XYcLNmHCCkBw6iDapviPylpMP0eEpGXkZaHkyLFE6ZvGEfn28ZDtCgVTrATksDP
	 X3ST4Cft+EXMN7qpq1ISt19JrbVWCQgdvLKGAENb66kP2WENk+AwVQZGjPh2FhskAB
	 0/2CFDIuoULWA==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6A7C83780029;
	Thu, 18 Jul 2024 14:43:29 +0000 (UTC)
Message-ID: <069a9e2b-f0bc-46a7-aaec-f30157e9be2d@collabora.com>
Date: Thu, 18 Jul 2024 16:43:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
 <2kbxr3hkjbcnaqescxmlcerziixg72icqpug6wa25eeggy2pnj@vqmxe4ojcwml>
 <dfc292f8-0014-4bf4-9429-31f729a176cd@collabora.com>
 <ok2a4ubzka6rhzyj2c5op73ij7pw35g6e75whc2jjget62fatx@zka2ewyt3kfv>
 <c8358d79bd51a9bfa5116b33ae5e7766b95d344d.camel@ndufresne.ca>
 <1faa7098-b108-480e-ae4b-ed25e0020e51@collabora.com>
 <7113029e2e192d43523a1ea5dae041fb53ae5948.camel@ndufresne.ca>
 <b454d93d607047c63663b3f003b3d3c23f07bac7.camel@ndufresne.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <b454d93d607047c63663b3f003b3d3c23f07bac7.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 18/07/2024 à 16:02, Nicolas Dufresne a écrit :
> Le jeudi 18 juillet 2024 à 09:56 -0400, Nicolas Dufresne a écrit :
>> Hi,
>>
>> Le jeudi 18 juillet 2024 à 09:04 +0200, Benjamin Gaignard a écrit :
>>> Le 17/07/2024 à 19:50, Nicolas Dufresne a écrit :
>> [...]
>>
>>>>>>>> @@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>>>>>>>     	int ret = check_fmt(file, p->type);
>>>>>>>>     	u32 mbus_code;
>>>>>>>>     	u32 cap_mask;
>>>>>>>> +	u32 flags;
>>>>>>>>
>>>>>>>>     	if (ret)
>>>>>>>>     		return ret;
>>>>>>>> @@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>>>>>>>     		p->mbus_code = 0;
>>>>>>>>
>>>>>>>>     	mbus_code = p->mbus_code;
>>>>>>>> +	flags = p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;
>>>>>>>>     	memset_after(p, 0, type);
>>>>>>>>     	p->mbus_code = mbus_code;
>>>>>>>> +	p->flags = flags;
>>>>>>> Won't this set V4L2_FMT_FLAG_ENUM_ALL_FORMATS (if present) in the
>>>>>>> flags returned to userspace ? Shouldn't be drivers to set
>>>>>>> V4L2_FMT_FLAG_ALL_FORMATS instead ?
>>>>>> memset_after zeroed flags field so we need this to send V4L2_FMT_FLAG_ENUM_ALL_FORMATS
>>>>>> flag to drivers. Return it to userspace is a side effect but I don't that is problem
>>>>>> since it set it anyway.
>>>>>>
>>>>> Ok, if the expectation is that the flag is preserved through the ioctl
>>>>> call, this is fine with me
>>>> I might be missing something other similar features are explicitly advertised by
>>>> drivers. This way, the generic layer can keep or clear the flag based of if its
>>>> supported. The fact the flag persist the ioctl() or not endup having a useful
>>>> semantic.
>>>>
>>>> Could we do the same?
>>> It is the only flag set by userspace when calling the ioctl(), all others
>>> are set by the drivers.
>>> I can clean it from the ioctl() structure after driver call but that won't change anything.
>> This does not answer my question. In other similar feature, we have an
>> **internal** flag set by drivers to tell the framework that such feature is
>> abled. Using that, the framework can keep or remove that flag based on if its
>> supported or not. This way, userspace have a clue if the driver do have this
>> support or if the returned result (in that case) is just a subset matching the
>> configuration. We don't seem to have done the same level of effort here.
> For the reference, you actually use that semantic in GStreamer implementation,
> but the kernel code seems broken.
>
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7078/diffs#eb90d5495df2f085f163996014c748a36f143f76_516_527

device_caps u32 field is already almost fully used, only one 1 bit is free.
I could use it but, for me, the capability to enumerate all the formats
doesn't fit well in the existing list.

Benjamin

>
>> Nicolas
>>
>>>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>
>>>>>>>>     	switch (p->type) {
>>>>>>>>     	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>>>>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>>>>> index fe6b67e83751..b6a5da79ba21 100644
>>>>>>>> --- a/include/uapi/linux/videodev2.h
>>>>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>>>>> @@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
>>>>>>>>     #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
>>>>>>>>     #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>>>>>>>>     #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>>>>>>>> +#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
>>>>>>>> +#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
>>>>>>>>
>>>>>>>>     	/* Frame Size and frame rate enumeration */
>>>>>>>>     /*
>>>>>>>> --
>>>>>>>> 2.43.0
>>>>>>>>
>>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> Kernel mailing list -- kernel@mailman.collabora.com
>>>>>>> To unsubscribe send an email to kernel-leave@mailman.collabora.com
>>>>>>> This list is managed by https://mailman.collabora.com
>>> _______________________________________________
>>> Kernel mailing list -- kernel@mailman.collabora.com
>>> To unsubscribe send an email to kernel-leave@mailman.collabora.com
>>> This list is managed by https://mailman.collabora.com
>> _______________________________________________
>> Kernel mailing list -- kernel@mailman.collabora.com
>> To unsubscribe send an email to kernel-leave@mailman.collabora.com
>> This list is managed by https://mailman.collabora.com

