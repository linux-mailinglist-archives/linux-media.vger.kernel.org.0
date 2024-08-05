Return-Path: <linux-media+bounces-15764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC6A9475AC
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 09:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCC072812E5
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 07:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2C0143C65;
	Mon,  5 Aug 2024 07:03:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3F91109
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 07:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841396; cv=none; b=RaYCLccdsa+GTgmpzRWy3HxGdf2BYBr0pG3M9Q29cPULCsGBscBaE3p+V3ndmNb6c6FkoG1YMS2B/xsaj+FGUh4VaDgHRw8OLfHnCIvADUS9cQRXyjXF+eBvdWZi54ob8rBL1e66kDeVQzN43B+ykI1h3vIXxK3gfV1B/AnDvhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841396; c=relaxed/simple;
	bh=EboIHs2Scl41UhArowiV/OO5d+i4we25zYtuvjLe5XM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/tslIDSluDoVVQVC8fXJnpwnogm1sOrp14W4gBIWZz3OB6GKyF/119j3y3YpChCNyO/F99GUFIyv9IIpKUmz+WwBfM8Xzd1c29db1gXEbvAg1fwqDa/yQM/jy1sSS7sd0m9dUjNIsHj2QetERHpEJz0BeOPthGGVtQNyIUF5tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD34C32782;
	Mon,  5 Aug 2024 07:03:15 +0000 (UTC)
Message-ID: <99bd75a0-a6f3-4c47-bc89-70ffd87da756@xs4all.nl>
Date: Mon, 5 Aug 2024 09:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: siano: add loadfirmware_handler NULL check
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <8eee4415-9082-488a-99ca-e016f9d80bb6@xs4all.nl>
 <CANiDSCsQj0+DpbMMnf_PqZ-TYrYriSCbTH0LCUv7P7XigRuFxA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CANiDSCsQj0+DpbMMnf_PqZ-TYrYriSCbTH0LCUv7P7XigRuFxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2024 08:59, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Sat, 3 Aug 2024 at 11:35, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Add check for a NULL value of the loadfirmware_handler to fix the
>> following smatch error:
>>
>> drivers/media/common/siano/smscoreapi.c:1172 smscore_load_firmware_from_file() error: we previously assumed 'loadfirmware_handler' could be null (see line 1150)
>>
>> Note that it is a false positive, but frankly, this change makes the
>> code more robust.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/common/siano/smscoreapi.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
>> index b6f1eb5dbbdf..329aee411562 100644
>> --- a/drivers/media/common/siano/smscoreapi.c
>> +++ b/drivers/media/common/siano/smscoreapi.c
>> @@ -1166,10 +1166,15 @@ static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
> 
> I cannot find any place where loadfirmware_handler is != than NULL.
> Maybe it is better to clean the dead code instead?

Good point, I didn't check that.

Can you post this as a proper patch? Then I can commit it.

Regards,

	Hans

> 
> diff --git a/drivers/media/common/siano/smscoreapi.c
> b/drivers/media/common/siano/smscoreapi.c
> index b6f1eb5dbbdf..3732367e0c62 100644
> --- a/drivers/media/common/siano/smscoreapi.c
> +++ b/drivers/media/common/siano/smscoreapi.c
> @@ -1132,8 +1132,7 @@ static char *smscore_get_fw_filename(struct
> smscore_device_t *coredev,
>   * return: 0 on success, <0 on error.
>   */
>  static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
> -                                          int mode,
> -                                          loadfirmware_t loadfirmware_handler)
> +                                          int mode)
>  {
>         int rc = -ENOENT;
>         u8 *fw_buf;
> @@ -1147,8 +1146,7 @@ static int
> smscore_load_firmware_from_file(struct smscore_device_t *coredev,
>         }
>         pr_debug("Firmware name: %s\n", fw_filename);
> 
> -       if (!loadfirmware_handler &&
> -           !(coredev->device_flags & SMS_DEVICE_FAMILY2))
> +       if (!(coredev->device_flags & SMS_DEVICE_FAMILY2))
>                 return -EINVAL;
> 
>         rc = request_firmware(&fw, fw_filename, coredev->device);
> @@ -1166,10 +1164,8 @@ static int
> smscore_load_firmware_from_file(struct smscore_device_t *coredev,
>                 memcpy(fw_buf, fw->data, fw->size);
>                 fw_buf_size = fw->size;
> 
> -               rc = (coredev->device_flags & SMS_DEVICE_FAMILY2) ?
> -                       smscore_load_firmware_family2(coredev, fw_buf,
> fw_buf_size)
> -                       : loadfirmware_handler(coredev->context, fw_buf,
> -                       fw_buf_size);
> +               rc = smscore_load_firmware_family2(coredev, fw_buf,
> +                                                  fw_buf_size);
>         }
> 
>         kfree(fw_buf);
> @@ -1353,8 +1349,7 @@ int smscore_set_device_mode(struct
> smscore_device_t *coredev, int mode)
>                 }
> 
>                 if (!(coredev->modes_supported & (1 << mode))) {
> -                       rc = smscore_load_firmware_from_file(coredev,
> -                                                            mode, NULL);
> +                       rc = smscore_load_firmware_from_file(coredev, mode);
>                         if (rc >= 0)
>                                 pr_debug("firmware download success\n");
>                 } else {
> diff --git a/drivers/media/common/siano/smscoreapi.h
> b/drivers/media/common/siano/smscoreapi.h
> index 82d9f8a64d99..3c15082ce0e3 100644
> --- a/drivers/media/common/siano/smscoreapi.h
> +++ b/drivers/media/common/siano/smscoreapi.h
> @@ -97,7 +97,6 @@ typedef int (*hotplug_t)(struct smscore_device_t *coredev,
>  typedef int (*setmode_t)(void *context, int mode);
>  typedef void (*detectmode_t)(void *context, int *mode);
>  typedef int (*sendrequest_t)(void *context, void *buffer, size_t size);
> -typedef int (*loadfirmware_t)(void *context, void *buffer, size_t size);
>  typedef int (*preload_t)(void *context);
>  typedef int (*postload_t)(void *context);
> 
> @@ -1102,9 +1101,6 @@ extern int smscore_register_device(struct
> smsdevice_params_t *params,
>  extern void smscore_unregister_device(struct smscore_device_t *coredev);
> 
>  extern int smscore_start_device(struct smscore_device_t *coredev);
> -extern int smscore_load_firmware(struct smscore_device_t *coredev,
> -                                char *filename,
> -                                loadfirmware_t loadfirmware_handler);
> 
>  extern int smscore_set_device_mode(struct smscore_device_t *coredev, int mode);
>  extern int smscore_get_device_mode(struct smscore_device_t *coredev);
> 
>>                 memcpy(fw_buf, fw->data, fw->size);
>>                 fw_buf_size = fw->size;
>>
>> +               /*
>> +                * Note that loadfirmware_handler can't be NULL due to the
>> +                * check above, but it is confusing smatch.
>> +                */
>>                 rc = (coredev->device_flags & SMS_DEVICE_FAMILY2) ?
>> -                       smscore_load_firmware_family2(coredev, fw_buf, fw_buf_size)
>> -                       : loadfirmware_handler(coredev->context, fw_buf,
>> -                       fw_buf_size);
>> +                     smscore_load_firmware_family2(coredev, fw_buf, fw_buf_size) :
>> +                     (loadfirmware_handler ?
>> +                      loadfirmware_handler(coredev->context, fw_buf, fw_buf_size) :
>> +                      -EINVAL);
>>         }
>>
>>         kfree(fw_buf);
>> --
>> 2.43.0
>>
> 
> 


