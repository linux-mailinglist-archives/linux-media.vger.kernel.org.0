Return-Path: <linux-media+bounces-15407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E49C93EB2C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 04:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF0F5B213AA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 02:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D407BAF7;
	Mon, 29 Jul 2024 02:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="gkxjxXav"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9415779DC7;
	Mon, 29 Jul 2024 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722219750; cv=none; b=d9z957JsH2krz5Jks38SatpXs9mWQjha3T3hQr0M7kbKkgZwPjPT9LWAfeBPMBKoOv0n3WWq5iic8f+J88mugAlnaKjKm8QtkW3ZQEk5H5R1MnHs4AldL0eWYtsClHvobemstdWGR+EQrhA7AxETwlKhIVaA/a8ngxIDA7W0WIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722219750; c=relaxed/simple;
	bh=BgplJy2egXU2bkIhmYD9X9T05CozoXUeP2I/qvh+KI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZV/VlXCSPiHHUBDgcE0eXM285ZT4jjwfFqwm58rJfvvM3akZlqP7P1wnH2BJRrr/ZIUDQpExY+HV7WpMZK5N0YF/9O+3LsEmH9XM7bdzChmAzEMe05z7VSIseFitAx4gEIgCL2wgAwww21dln7XHO7mrqZFwO4/EYoR0gBEDJkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=gkxjxXav; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C067788744;
	Mon, 29 Jul 2024 04:22:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1722219740;
	bh=TiQXSHuhj77xOGQ6ofFRBUYmbcD+EjOgZW1sHSpkrIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gkxjxXavxdoYpkyNvEFFZ+povkb70OqqE/bpH3SiZxFvDBvuSjlM6oB2hIhCcyZdJ
	 Pn1T20ijUouhAqxIpI3fFRDTlUCVNyfmebQc3i5WYfO1CaLjguMBHJ0y4A5ZxGyGxp
	 QDK5mhp45IrxKgxVobLUK4Ofvt1+OWA8ECbO4ubROTBYXyTs1YSr/p9X7HKNkFB6R0
	 G6QlVw5OVSsvi70OPwNWuGSePBeTWaofJQA9YdxVfmb3uvw3zXKG5uRu5T6uJ6XF7y
	 YeiNVtPNcBeJvgKW0+MJqzNCMLHCKRkegK2MlP7Gl2RK+GeAyYCR+yzAhDnuCychHk
	 enMmmKrIPFsaQ==
Message-ID: <640db08d-0904-4451-8369-9f99e029777e@denx.de>
Date: Mon, 29 Jul 2024 04:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <5aab2235-76cd-4fa6-8957-aed35e83a95e@suswa.mountain>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5aab2235-76cd-4fa6-8957-aed35e83a95e@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/24/24 6:16 PM, Dan Carpenter wrote:
> On Wed, Jul 24, 2024 at 02:19:38AM +0200, Marek Vasut wrote:
>> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
>> index be54dca11465d..a841fdb4c2394 100644
>> --- a/drivers/staging/media/imx/imx-media-dev.c
>> +++ b/drivers/staging/media/imx/imx-media-dev.c
>> @@ -57,7 +57,52 @@ static int imx6_media_probe_complete(struct v4l2_async_notifier *notifier)
>>   		goto unlock;
>>   	}
>>   
>> +	imxmd->m2m_vdic[0] = imx_media_mem2mem_vdic_init(imxmd, 0);
>> +	if (IS_ERR(imxmd->m2m_vdic[0])) {
>> +		ret = PTR_ERR(imxmd->m2m_vdic[0]);
>> +		imxmd->m2m_vdic[0] = NULL;
>> +		goto unlock;
>> +	}
>> +
>> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
>> +	if (imxmd->ipu[1]) {
>> +		imxmd->m2m_vdic[1] = imx_media_mem2mem_vdic_init(imxmd, 1);
>> +		if (IS_ERR(imxmd->m2m_vdic[1])) {
>> +			ret = PTR_ERR(imxmd->m2m_vdic[1]);
>> +			imxmd->m2m_vdic[1] = NULL;
>> +			goto uninit_vdi0;
>> +		}
>> +	}
>> +
>>   	ret = imx_media_csc_scaler_device_register(imxmd->m2m_vdev);
>> +	if (ret)
>> +		goto uninit_vdi1;
>> +
>> +	ret = imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[0]);
>> +	if (ret)
>> +		goto unreg_csc;
>> +
>> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
>> +	if (imxmd->ipu[1]) {
>> +		ret = imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[1]);
>> +		if (ret)
>> +			goto unreg_vdic;
>> +	}
>> +
>> +	mutex_unlock(&imxmd->mutex);
>> +	return ret;
> 
> Since it looks like you're going to do another version of this, could
> you change this to return 0;

Fixed up both for V3, thanks .

