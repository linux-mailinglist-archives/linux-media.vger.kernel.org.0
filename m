Return-Path: <linux-media+bounces-7147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A23E87D0C8
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E32DB1F243D3
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 15:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C773FB9B;
	Fri, 15 Mar 2024 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="0qg27pRY"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2183E45020
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710518196; cv=none; b=lEOJoTnPeeBZxt8KTqzNiU3mrX+bEfLxDVJE2qLfKD5LfoooR8EMhV1/qpRZ4+PxVerDl0DivyoC2Ft/K//rjt1o5ahnP2MSHTHMbQjMEn22x24O3McdWncX04L+bhSbd2vmdzZRtK3yZ+s8xX3FOZkkRN6IovaAgaDsQC4d/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710518196; c=relaxed/simple;
	bh=wbWeMmy7LJLDEx39IghtZPk7aZuUHsQgjtEH51XdEoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cxb9G6M1VRqNQoC+NQCt0c/SCRAxwwyF45ckKtAb3hOBbCpmdTb8reUEY9Wo11KZqF73ZqUdgUCFi/qgQX8KutpQ0s7wskyn3kyA53VbSUkV6xFqZFkVPAh5Sx46/Ay87GW9jyoKgtGd+tZjyye9SqliamvyrA33wVHKkw1kR6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=0qg27pRY; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710518193;
	bh=wbWeMmy7LJLDEx39IghtZPk7aZuUHsQgjtEH51XdEoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0qg27pRYZjavhss2buUgm3MV8wxSgDRv5+/dXTNllibgfpXH646qr62IUA7mQk+/Q
	 uszdpWsujCp6Q5O71CfDZ818SnYEVmvnba5AxWC82S0pvKTGTYnb407QaV3fNqBbbB
	 FUXBBmsZuP2sMZ3C/M2PfWrWvD+xPdUURQSMmIzI/28QQOT/w5purp/IERb+S62vBA
	 RxNvmMAPYNvAzR87SppbuRnPnbOouU8m3f76dbkBelaYLMnqMFh6kmpOohPGcThmXL
	 hXIXlHyhZanVQjlFkOtsy+cBB9aiRCCxgtPjb23zZ29u/HzVyO8MF+espglXnwHdj1
	 XIMbEvc8uOjEA==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C5CEB3782110;
	Fri, 15 Mar 2024 15:56:32 +0000 (UTC)
Message-ID: <10e6c636-0be2-402e-a459-7f5235f5eddd@collabora.com>
Date: Fri, 15 Mar 2024 16:56:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/38] media: ccs: Track streaming state
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-21-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-21-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:24, Sakari Ailus wrote:
> With enable_streams and disable_streams, the driver for a device where
> streams are not independently started and stopped needs to maintain state
> information on streams that have been requested to be started. Do that
> now.
> 
> In the future, a helper function in the framework is a desirable way to do
> this instead.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/i2c/ccs/ccs-core.c | 13 ++++++++++---
>   drivers/media/i2c/ccs/ccs.h      |  2 +-
>   2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 9e70946653e9..0cd8ee957655 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1766,6 +1766,11 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>   	if (pad != CCS_PAD_SRC)
>   		return -EINVAL;
>   
> +	if (sensor->streaming) {
> +		sensor->streaming |= streams_mask;
> +		return 0;
> +	}
> +
>   	rval = ccs_pm_get_init(sensor);
>   	if (rval)
>   		return rval;
> @@ -1887,7 +1892,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
>   
>   	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
>   
> -	sensor->streaming = true;
> +	sensor->streaming |= streams_mask;
>   
>   	return 0;
>   
> @@ -1909,6 +1914,10 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
>   	if (pad != CCS_PAD_SRC)
>   		return -EINVAL;
>   
> +	sensor->streaming &= ~streams_mask;
> +	if (sensor->streaming)
> +		return 0;
> +
>   	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
>   	if (rval)
>   		return rval;
> @@ -1917,7 +1926,6 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
>   	if (rval)
>   		dev_err(&client->dev, "post_streamoff quirks failed\n");
>   
> -	sensor->streaming = false;
>   	pm_runtime_mark_last_busy(&client->dev);
>   	pm_runtime_put_autosuspend(&client->dev);
>   
> @@ -3525,7 +3533,6 @@ static int ccs_probe(struct i2c_client *client)
>   		goto out_cleanup;
>   	}
>   
> -	sensor->streaming = false;
>   	sensor->dev_init_done = true;
>   	sensor->handler_setup_needed = true;
>   
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 096573845a10..4725e6eca8d0 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -236,7 +236,7 @@ struct ccs_sensor {
>   	u16 image_start; /* image data start line */
>   	u16 visible_pixel_start; /* start pixel of the visible image */
>   
> -	bool streaming;
> +	u8 streaming;
>   	bool dev_init_done;
>   	bool handler_setup_needed;
>   	u8 compressed_min_bpp;

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

