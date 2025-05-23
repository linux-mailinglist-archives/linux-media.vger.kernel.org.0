Return-Path: <linux-media+bounces-33269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB54AC2517
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 16:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 820E83A5B02
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 14:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB222951BA;
	Fri, 23 May 2025 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AxkCZOip"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50848202995
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010907; cv=none; b=MXabZWSIxQCy0+35I27U1YUmmuGaascNJuqgDR+D8BJg5fvfIeOeu4H2MHch/nekoTyCjWkNIkD3CeHCpn9GwKyEtKmojG2fHLC/+72WeWh8Fqt9sFE3MaemplXLLi14yQX8E768CYkGf+bi3ArCaOi6Kla9aUsFKvzZ9XhEUZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010907; c=relaxed/simple;
	bh=7ahIPwLlIZgRB9P45+gukHzvCNulX6S1U8rMklHinXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGz1LrS67qYCxjlpk4AM3ey7tLp0Y0+yzeBF286GEgIS+VLSa85Va7XbSR8jafejjW2qt+GNeqmddrdIRr+LAy56ZNR73pajM7AaG4om1/cwbwpVijU2kv6ZK15Y1kBDowVTOSP4c8keWfaJTIBD6fhcaEo3GsmOCwqBL2SDIbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AxkCZOip; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F1B7346;
	Fri, 23 May 2025 16:34:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748010873;
	bh=7ahIPwLlIZgRB9P45+gukHzvCNulX6S1U8rMklHinXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AxkCZOipWio4LgIo4t1fo+99EFqI5aVjYGgALTH4dubBcmKLupqXokM6KBxFpj0bS
	 B1LzBCBkDui986WbMAcgdsSJFtLXpQmog3yvJkUCzZfvLbNLkKEzB7yJiLwEQkDFl+
	 tOzQv7V5WuaiomhF5Eb8C/NxRwf1CZc6iLrULJRc=
Message-ID: <4a54204a-3284-4341-8faa-9c5264ad1129@ideasonboard.com>
Date: Fri, 23 May 2025 15:34:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: nxp: imx8-isi: Cleanup video device in error path
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
 <20250522152645.GS12514@pendragon.ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250522152645.GS12514@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laurent

On 22/05/2025 16:26, Laurent Pinchart wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On Thu, May 22, 2025 at 03:30:08PM +0100, Daniel Scally wrote:
>> mxc_isi_v4l2_init() registers video devices and v4l2 subdevices but
>> the video devices are not cleaned up in that function's error path
>> which means they're left hanging if it fails. Update the function
>> to clean them up properly.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>> index 1e79b1211b603a71f0427e82a997787110f7e4ac..4a74b988217f504a03dfe330a7bac76cdecc933c 100644
>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>> @@ -154,7 +154,7 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>>   		if (ret < 0) {
>>   			dev_err(isi->dev, "Failed to register pipe%u: %d\n", i,
>>   				ret);
>> -			goto err_v4l2;
>> +			goto err_cleanup_pipe;
>>   		}
>>   
>>   		ret = media_create_pad_link(&isi->crossbar.sd.entity,
>> @@ -164,14 +164,14 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>>   					    MEDIA_LNK_FL_IMMUTABLE |
>>   					    MEDIA_LNK_FL_ENABLED);
>>   		if (ret < 0)
>> -			goto err_v4l2;
>> +			goto err_cleanup_pipe;
>>   	}
>>   
>>   	/* Register the M2M device. */
>>   	ret = mxc_isi_m2m_register(isi, v4l2_dev);
>>   	if (ret < 0) {
>>   		dev_err(isi->dev, "Failed to register M2M device: %d\n", ret);
>> -		goto err_v4l2;
>> +		goto err_cleanup_pipe;
>>   	}
>>   
>>   	/* Initialize, fill and register the async notifier. */
>> @@ -212,6 +212,9 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>>   err_m2m:
>>   	mxc_isi_m2m_unregister(isi);
>>   	v4l2_async_nf_cleanup(&isi->notifier);
>> +err_cleanup_pipe:
>> +	for (i = 0; i < isi->pdata->num_channels; ++i)
>> +		mxc_isi_pipe_unregister(&isi->pipes[i]);
> mxc_isi_pipe_unregister() calls mxc_isi_video_unregister(), which locks
> the video->lock mutex. The mutex is initialized in
> mxc_isi_video_register(), so you will have an issue here when reaching
> this label from within the pipe registration loop for any non-registered
> pipe.
>
> One option to address this would be to return from
> mxc_isi_video_unregister() if video->pipe is NULL.


Ah - good spot, thanks

>>   err_v4l2:
>>   	v4l2_device_unregister(v4l2_dev);
>>   err_media:
>>
>> ---
>> base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
>> change-id: 20250522-djrscally-imx8-isi-fixes-fed2d7cffb1c

