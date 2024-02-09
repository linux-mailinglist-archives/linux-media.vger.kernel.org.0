Return-Path: <linux-media+bounces-4869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC82F84F1CC
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 09:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42A18B29E04
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 08:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD36664D8;
	Fri,  9 Feb 2024 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ySWrNYmt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F765BDD
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707468955; cv=none; b=ibF26WCwDgHJH+tH7BFqBSMvefA4C9OeBjWHy6G8vhCH1DVfcQeCsQSVrZ5/sSJEV9C5qLYWktc8YLU7Na+A2mxmwnOH/vzraeM/1o9gQkrgY9bvoXf/Fq6yln6ThsDoa/hQanpjboWx82LZEB20i/XZWN/Kod//4es33k/ioWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707468955; c=relaxed/simple;
	bh=TGCSg4yjgwbpj7gqRgs9DGoKRPq4rEpzNn0buwbNpB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ROgJJjmrKceI+FH3ftXWZduGc4PJABPU+UIxB14A4KZMrLUfGRRM5DmLfJLkfZZfW8R+9uBGjvTVgWJ4+woyz1dG4JbJvE9oPg8OFJdG0TxVF/BxSV4KO8XjxviqqL/zPqePYC6A6+grFUk7Ztu2LExnYVXexLa9rTy+w3hp67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ySWrNYmt; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4193vWbe014970;
	Fri, 9 Feb 2024 09:55:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=pBI+jzbWzhGd9VlU7k3/cYVntEOo5vcTfea9/bh2iVM=; b=yS
	WrNYmt4IJ6w//0Rx0IegAwUGXzej9mEyait4y4wr4iSdGo21gTx+GnURtn8wzBF9
	uUk3QzZxqMshdVyuD1jX04OIlYkMaQWhgb+GwU+sgIyTscv4F6ZsHAob8rXykRAr
	PfQJNZRSd9RgwTiuPJEhRpaugDedq/2qC8/GlSgNqifsIT/+0QIonW/D9TMADgnk
	otlp4LDMRQT2PB/lV9LppjQypmyWFVWcVO2+UcbcsH6FA7h3yCINV+Dm2QlQIoMh
	eKL+2lXpT81IjbuYdclEFdKGhyH2KoJaaB4tSM2j7ueADEKsHpJn3/RI95Jfhqnr
	32xHPgJ2+R1ZY35HwZjA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w1yx4ee5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 09:55:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BEF9310004F;
	Fri,  9 Feb 2024 09:55:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B04FB2105B7;
	Fri,  9 Feb 2024 09:55:35 +0100 (CET)
Received: from [10.252.23.147] (10.252.23.147) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 9 Feb
 2024 09:55:35 +0100
Message-ID: <79a5af9b-b1b8-43d0-9afb-6c6ebf9537d3@foss.st.com>
Date: Fri, 9 Feb 2024 09:55:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: st-vgxy61: Convert to CCI register access
 helpers
To: Julien Massot <julien.massot@collabora.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <sylvain.petinot@foss.st.com>
CC: <linux-media@vger.kernel.org>, <kernel@collabora.com>
References: <20240112095228.2842812-1-julien.massot@collabora.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20240112095228.2842812-1-julien.massot@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_06,2024-02-08_01,2023-05-22_02

Hi Julien

Thank you for your patch, and sorry for the late reply.
I tested it, and it works great.

On 1/12/24 10:52, Julien Massot wrote:
[...]
> @@ -1623,37 +1536,33 @@ static int vgxy61_configure(struct vgxy61_dev *sensor)
>  static int vgxy61_patch(struct vgxy61_dev *sensor)
>  {
>  	struct i2c_client *client = sensor->i2c_client;
> -	int patch, ret;
> +	u64 patch;
> +	int ret;
>  
>  	ret = vgxy61_write_array(sensor, VGXY61_REG_FWPATCH_START_ADDR,
>  				 sizeof(patch_array), patch_array);
> -	if (ret)
> -		return ret;
> -
> -	ret = vgxy61_write_reg(sensor, VGXY61_REG_STBY, 0x10, NULL);
> +	cci_write(sensor->regmap, VGXY61_REG_STBY, 0x10, &ret);
>  	if (ret)
>  		return ret;
>  
>  	ret = vgxy61_poll_reg(sensor, VGXY61_REG_STBY, 0, VGXY61_TIMEOUT_MS);
> -	if (ret)
> +	cci_read(sensor->regmap, VGXY61_REG_FWPATCH_REVISION, &patch, &ret);
> +	if (ret < 0)
>  		return ret;
>  
> -	patch = vgxy61_read_reg(sensor, VGXY61_REG_FWPATCH_REVISION);
> -	if (patch < 0)
> -		return patch;
> -
>  	if (patch != (VGXY61_FWPATCH_REVISION_MAJOR << 12) +
>  		     (VGXY61_FWPATCH_REVISION_MINOR << 8) +
>  		     VGXY61_FWPATCH_REVISION_MICRO) {
> -		dev_err(&client->dev, "bad patch version expected %d.%d.%d got %d.%d.%d\n",
> +		dev_err(&client->dev,
> +			"bad patch version expected %d.%d.%d got %u.%u.%u\n",
>  			VGXY61_FWPATCH_REVISION_MAJOR,
>  			VGXY61_FWPATCH_REVISION_MINOR,
>  			VGXY61_FWPATCH_REVISION_MICRO,
> -			patch >> 12, (patch >> 8) & 0x0f, patch & 0xff);
> +			(u16)patch >> 12, ((u16)patch >> 8) & 0x0f, (u16)patch & 0xff);

Checkpatch is complaining about this line being 87 characters long
instead of 80.
Could a maintainer apply with correct line wrap ? Thank you.

With that fixed :
Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

>  		return -ENODEV;
>  	}
> -	dev_dbg(&client->dev, "patch %d.%d.%d applied\n",
> -		patch >> 12, (patch >> 8) & 0x0f, patch & 0xff);
> +	dev_dbg(&client->dev, "patch %u.%u.%u applied\n",
> +		(u16)patch >> 12, ((u16)patch >> 8) & 0x0f, (u16)patch & 0xff);
>  
>  	return 0;
>  }
[...]

-- 
Regards,

Benjamin

