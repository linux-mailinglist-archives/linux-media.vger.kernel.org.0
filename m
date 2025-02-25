Return-Path: <linux-media+bounces-26985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9FA44ECB
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 22:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF2A01772BB
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 21:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A885C20E70C;
	Tue, 25 Feb 2025 21:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACelFAqO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C93B1A9B46;
	Tue, 25 Feb 2025 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518760; cv=none; b=YuxO/58RNTYseoR4Vvx3/fN1YHEokMDN+zxsNFnR/xyriUkXEqGcf+wjztqrm1cSay/Arkjk6H8HiB7ul1fT4RWDLuXRqLxHoGYKjh/S38QQfdLq1IeZYy519Wo/rPuo3vc2lgzSnDqP0Oe6euuGbWlsZO4dw6Cj4x4/28HhumQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518760; c=relaxed/simple;
	bh=YsMMbWlgUx+4O3lXMAWFkJ/wtPjt3U9uGLHFDYZgw7U=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4hozh1HzC7X5gqKCIp927B7hA6vhmGQMxNjYhw4S/SZtu5b+PyJhcrKFTaZ7PtQV6IoyausoViunTK8lec6XRb961i9xN/i1N7TkV9pItCCMAD6SsOtCd5YIqSHPfEtSVVvVIzsklHQ7hFfuXZRkvuuX2/IEDF/kTyCkO0GYTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACelFAqO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f70170005so3744634f8f.3;
        Tue, 25 Feb 2025 13:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740518757; x=1741123557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOVYg7z7CFz6OzK6aoZCvfA4lRKGWxPBEQ2vsHHrQGA=;
        b=ACelFAqO/bogKi0ygC9g8bnuMpYWBYhLRQlaPQdZID/au5i9xmDJooXJ2EhLEula3U
         jJtvSNBhxEQM6tGJTpEaXE4NlqHFEJyd9hGBZrr7Xyqf2CECPHPUDj8EATuL+iLVrSDj
         6zeJZt+f4w4huFgxbmSMKArJRt5hHEYEV0ugrSJaytj1oHxUnyQvo1O7w+ROAt0q6E8W
         g3agt6yeFimy2BaAVSGJOZGHg+o/n5ycs6BFyyspKpCETNAmQtHgP/vLs24g5+3gaSdc
         rLFzjsxIEs4jVM/Zwclt1gpFb/YZ8/9v8Qm58S1KcnNCQib8TJ7MEzM/6KvuZmOqfd0M
         v0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518757; x=1741123557;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOVYg7z7CFz6OzK6aoZCvfA4lRKGWxPBEQ2vsHHrQGA=;
        b=cWPftusy708rE9oEi2pvU9DwaX66yW1JwXuknpaaHemqkTj7HlgtXeb5VoeICyFyrz
         CfQdK9yxtKXs4pGVWa4pzf94lb92dnQ44vCuuLbBvq/TXjKw/GRbXIZ8aZkL1GlNNbdN
         FEln4UlCNxdbzOFpRcP3XYBtGKXqpqIqNiWo31uWTMYyUnMYVce/H7dS6jumdh8irfjP
         5cYn2zbmPl0gWsHSEWvXUFgpZSZKPA1PfKiQTOiYIBp8oNurwZcmqZP445+KNvgSWZfG
         nsZ8O7Y+y8KhSnh8sPJdLASBiXMK0KNd6BsWte5Y1qdWcr/ubRkMptcZhnuplHaCYWp2
         B/cw==
X-Forwarded-Encrypted: i=1; AJvYcCU+lGlQ2OT3soGO0Korf06YEIIEi8VEjUjgnTOgkSm16Y+erwnCul0ILFlmGNank2LVrRI24BaHj6+SqEI=@vger.kernel.org, AJvYcCVHvCv2CWz2jLDntSCOu/samkWcp5KdNuL3eAuLt/tZ3OZ6EZYKpVBZoGQFWJROmvpFMfBwiGy98TTc6uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKsmlgpGER79POikrD/KUDOpMplWDrEavBpAj03m2clYrVYyaF
	dhCPgQs/ZIGe3buSFYU0vhtMV7adyoeAcmI8ijlaXBprO0gjkRDJ
X-Gm-Gg: ASbGnctEj+tOonIkJFDrlvm9vGloJI1QX/jU/iJlCueeKBiCdHfhIKUcaFMbim15NfB
	pfxh5Ds16q3KUnD6zNs8i3/77GTrhHDbGl5foFOR9BYH8TuNxODCVcW2BkXkgSBS87GlBbEqgg6
	oCek+TO+G8ld0bXib0f3m6LaNxA+HKpOoaHi6rTua30OMGywHHMlDI2qo1UF26nt/Sish85dGW0
	yDf4skdkCgwYoRdFxxSu+I0tKLWMUkWIxac0xwchfqnJ+VfPHrah51JpZIqh+fYTrSc0UNFSWq7
	AiccPuoxxHYnobFCdcce478lHEqUm1TI
X-Google-Smtp-Source: AGHT+IFfqGmg8jaTYe3aHYa+NHD4Q/7RkKXcFvEdnIfsyLNJdQHUHBv+JCKoX8hHOdin+Y9uJL5Lww==
X-Received: by 2002:a05:6000:400f:b0:38d:dc57:855d with SMTP id ffacd0b85a97d-390d4f8d921mr716558f8f.35.1740518756474;
        Tue, 25 Feb 2025 13:25:56 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd867144sm3521950f8f.7.2025.02.25.13.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 13:25:55 -0800 (PST)
Message-ID: <04572f32-4203-4a9d-96dd-7974708f4088@gmail.com>
Date: Tue, 25 Feb 2025 23:25:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: rpi1-cfe: fix pad in call to
 get_mbus_config()
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250225212031.188987-1-demonsingur@gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20250225212031.188987-1-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/25/25 11:20 PM, Cosmin Tanislav wrote:
> The source subdevice might be using a source pad not equal to 0.
> 
> Use the already existing source_pad field of cfe.
> 
> Fixes: e7bad98c205d ("media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad")

I used the wrong Fixes tag, this is the correct one:
Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")

> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>   drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 69a5f23e7954..7db4fe5e0fd4 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1206,8 +1206,8 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
>   	cfg_reg_write(cfe, MIPICFG_INTE,
>   		      MIPICFG_INT_CSI_DMA | MIPICFG_INT_PISP_FE);
>   
> -	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config, 0,
> -			       &mbus_config);
> +	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config,
> +			       cfe->source_pad, &mbus_config);
>   	if (ret < 0 && ret != -ENOIOCTLCMD) {
>   		cfe_err(cfe, "g_mbus_config failed\n");
>   		goto err_clear_inte;


