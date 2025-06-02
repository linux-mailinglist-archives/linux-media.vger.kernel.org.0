Return-Path: <linux-media+bounces-33894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2CACACF8
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFCAF1960445
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAD4204C2F;
	Mon,  2 Jun 2025 11:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIh7dO7G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B71CDFD5;
	Mon,  2 Jun 2025 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862437; cv=none; b=ma6Gun4w+M5kl4z4XvkS5Al5nwNISyP/dlRZ1A8SmcLG6+g4HtSlloyphBSoI1Y7NlYNHNx2TxGoo16wAbCmVPn2epdeQ0fjOQ9XNSF7ir/aTG2Zg85JDwnXyCdul/4hi/Afjb1jySUt3VSoSJjq45iacwm1O4k4amEVXafc+Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862437; c=relaxed/simple;
	bh=E6maFw8RNbm/mBTXc6Y92pxX5WbQ29KDi1UudDHNda4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9ipJVGhhknjPxBDbONmR9yqBgpGp+upVnMIpEjMZQX9XNaMvdY15KhRxmJ9IYw6WGf3Q/FNxetYEvedpluxY6+Zsk/ry/l7bwYYITAqNLZN3QTJi0ZzHwD1vYstE6YshnxBI276m/25i8qK9Hj3JOvYRuix3Kj4K7D8fv8Wkps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIh7dO7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B50C4CEEB;
	Mon,  2 Jun 2025 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748862434;
	bh=E6maFw8RNbm/mBTXc6Y92pxX5WbQ29KDi1UudDHNda4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FIh7dO7GuVcBBvgnPPqfkg/Ld9WJDFY9eJWbo2tiXYeoVtsU4O8CM20zE13tc48OU
	 zbD9hA8VJCCZ4G45cy5TX4xy4jQt8/8p/0NoEJ5X/dfBtCfXTNTFJ73Wr/oLihZ5Yj
	 +WFN93N/DDdmI/uaDiWAx8Ez8agqaXIpSLCV/B4/xk2dhRARqw3xagxnHjZmjNW7Ph
	 c0TD5TVQANyW749f/X9MsYP524CjsGDxXsCkmCJ7HIAsYEZ3th02FP4qbG7l7XPOcl
	 UizBIsUITcp86nHzjlLsqTC/kC99WY4uWu8fPYJ8nVYK4B5pGIke7qDUR0wihyUTA3
	 +PRAYhMNGKDXQ==
Message-ID: <b88a8847-6e19-4d5e-a847-5deee69ab7b4@kernel.org>
Date: Mon, 2 Jun 2025 13:07:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org>
 <34d9f779-987f-4e2c-b046-5dc15641547c@kernel.org>
 <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCtrG59QX-R0YcS+G9HmG5oE8LwiXdm_NKuCbNmHp8aeTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 2-Jun-25 12:27, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 2 Jun 2025 at 12:11, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi Ricardo,
>>
>> On 28-May-25 19:58, Ricardo Ribalda wrote:
>>> Right now we cannot support granular power saving on compat syscalls
>>> because the VIDIOC_*32 NRs defines are not accessible to drivers.
>>>
>>> Use the video_translate_cmd() helper to convert the compat syscall NRs
>>> into syscall NRs.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
>>>  include/media/v4l2-ioctl.h           | 1 +
>>>  3 files changed, 5 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
>>>  static long uvc_v4l2_unlocked_ioctl(struct file *file,
>>>                                   unsigned int cmd, unsigned long arg)
>>>  {
>>> -     /*
>>> -      * For now, we do not support granular power saving for compat
>>> -      * syscalls.
>>> -      */
>>> -     if (in_compat_syscall())
>>> -             return uvc_v4l2_pm_ioctl(file, cmd, arg);
>>> +     unsigned int converted_cmd = video_translate_cmd(cmd);
>>
>> It looks like something went wrong here and you did not test-compile this?
>> video_translate_cmd() is private to drivers/media/v4l2-core/v4l2-ioctl.c
>> so this should not compile.
> 
> Hmm... Actually I am pretty sure that I tested it on real hardware.
> 
> Did you miss the EXPORT_SYMBOL() on the patch?

Ah yes I did miss that, sorry.

For the next time please split core changes out into their own
separate patches.

In this case I think the core changes are not necessary instead
you can just do:

	unsigned int converted_cmd = cmd;

#ifdef CONFIG_COMPAT
	converted_cmd = v4l2_compat_translate_cmd(cmd);
#endif

Regards,

Hans




> 
>>
>> You can use v4l2_compat_translate_cmd() but only when CONFIG_COMPAT is set
>> otherwise that symbol is not available.
> 
> I tried now without CONFIG_COMPAT and it built fine.
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>
>>>       /* The following IOCTLs do need to turn on the camera. */
>>> -     switch (cmd) {
>>> +     switch (converted_cmd) {
>>>       case UVCIOC_CTRL_QUERY:
>>>       case VIDIOC_G_CTRL:
>>>       case VIDIOC_G_EXT_CTRLS:
>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> index 650dc1956f73d2f1943b56c42140c7b8d757259f..6fbd28f911cf23eec43ef1adcf64bd46ef067c81 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> @@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>>>       return ret;
>>>  }
>>>
>>> -static unsigned int video_translate_cmd(unsigned int cmd)
>>> +unsigned int video_translate_cmd(unsigned int cmd)
>>>  {
>>>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>>>       switch (cmd) {
>>> @@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
>>>
>>>       return cmd;
>>>  }
>>> +EXPORT_SYMBOL(video_translate_cmd);
>>>
>>>  static int video_get_user(void __user *arg, void *parg,
>>>                         unsigned int real_cmd, unsigned int cmd,
>>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
>>> index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..437b9f90714c62e0ba434ce47391ef64d88110aa 100644
>>> --- a/include/media/v4l2-ioctl.h
>>> +++ b/include/media/v4l2-ioctl.h
>>> @@ -687,6 +687,7 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
>>>  int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
>>>                              void *mbuf, size_t array_size,
>>>                              unsigned int cmd, void *arg);
>>> +unsigned int video_translate_cmd(unsigned int cmd);
>>>
>>>  /**
>>>   * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.
>>>
>>
> 
> 


