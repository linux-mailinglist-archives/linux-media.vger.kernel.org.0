Return-Path: <linux-media+bounces-7154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF487D0FC
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 17:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B6FC1C22D30
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FCF4502F;
	Fri, 15 Mar 2024 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oMlUF3Q1"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6A51773D
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710519220; cv=none; b=a6oGUZTrCZag1BGpaLOrWSZDw5LeDUugxsdv1OdOOlAgCU5WY2vbo9AsJrKrGXoocaWULYmBDKAFeF3GSrpjl/syfTOpuW8ScBSZcMXMaTDmIL4Hz2jeTptJlnLAWv6nz8iOUXziaDfROTMEPw4JV9JUQ5+z6VPfRuHOOB41Pag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710519220; c=relaxed/simple;
	bh=7ae5//zADIBfk5KVzY12Lk0boisPC58eDnDCBDaPE+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwNYXSjob6fjxb7V1i0k+fCnnE9Jm874xBOzTS+x3dTILwl4IGLquA3fQBphBd1uHz7uGtUhaRno4SvJrnCizDbOutaup8QSH5clcay0uGWXKHD2SpwpBijDCAF+d5f4qqkc294oo0TmVChhPYmyeqclQmVwsG4Dqlxh8r2ASOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oMlUF3Q1; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710519215;
	bh=7ae5//zADIBfk5KVzY12Lk0boisPC58eDnDCBDaPE+8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oMlUF3Q1tt9tAG/Phz0JT7Zmi4x6m250bgy9zTU04dK90zobs09sQfyGm32O5uz0f
	 ++7yGjhJGg3CJ7TPHSkWo4+38qrL96ZLBdfSZ3UGdVYk/VPXG6z6YiChs1y8Qozmjg
	 hrbul1236w8pFMbLF3PStnM0LzREROJbs47S62bJKMTXZCyziKwhScs2poX4xQ0ays
	 deCSdSaf5vqJyXhetENCRgFeZiOCbZxBA/1R/Lj2PzftcwMAgGnbnkqWJEvqrehLT+
	 GPG9aNqoNTxLBRoDxUVnGqJU2TXG+2ic1/A0lHrDcnPEi55BQ9DOQ2wIzWGFeUCkXd
	 d8J+/H3ByLLTA==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AA0D63782110;
	Fri, 15 Mar 2024 16:13:34 +0000 (UTC)
Message-ID: <41daffcb-3a1a-4d27-a41a-1bc45b65fd65@collabora.com>
Date: Fri, 15 Mar 2024 17:13:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 34/38] media: ov2740: Track streaming state
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
 <20240313072516.241106-35-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-35-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:25, Sakari Ailus wrote:
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
>   drivers/media/i2c/ov2740.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 44c6724a102c..df57f0096e98 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -539,6 +539,9 @@ struct ov2740 {
>   
>   	/* True if the device has been identified */
>   	bool identified;
> +
> +	/* Track streaming state */
> +	u8 streaming;
>   };
>   
>   static inline struct ov2740 *to_ov2740(struct v4l2_subdev *subdev)
> @@ -929,6 +932,11 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
>   	int link_freq_index;
>   	int ret;
>   
> +	if (ov2740->streaming) {
> +		ov2740->streaming |= streams_mask;
> +		return 0;
> +	}
> +
>   	ret = pm_runtime_resume_and_get(&client->dev);
>   	if (ret < 0)
>   		return ret;
> @@ -975,6 +983,8 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
>   		goto out_pm_put;
>   	}
>   
> +	ov2740->streaming |= streams_mask;
> +
>   	return 0;
>   
>   out_pm_put:
> @@ -991,6 +1001,10 @@ static int ov2740_disable_streams(struct v4l2_subdev *sd,
>   	struct ov2740 *ov2740 = to_ov2740(sd);
>   	int ret;
>   
> +	ov2740->streaming &= ~streams_mask;
> +	if (ov2740->streaming)
> +		return 0;
> +
>   	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>   			       OV2740_MODE_STANDBY);
>   

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

