Return-Path: <linux-media+bounces-11144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A91338BFD1F
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 14:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1761F24182
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 12:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F347854FA3;
	Wed,  8 May 2024 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQi4T/AR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD23254BED
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715171436; cv=none; b=bBpGvYdpv3zYVgODv5BdTMtmz98d9KntMT4YOqr1iqx6CmJSVbVWTL1D9VQVMKGRAAAOEYP8D9xZoxJE6Ge9FeBJEFVOVo40Kiq42fmy6v/MbXbatbrDF7kuewQGRAjsGhGznTyEECc+29woLIGG8+76qpXC+zd4TceBltM3/1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715171436; c=relaxed/simple;
	bh=TqVEqH1q0bDGKE0x+2yoDuOpG9nNPgui+nNL00aF/uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cag0JzCD3NG7MuS815M2JqCh8Pv1wne9cenplb1KwGSF6hv1fLKXKzyYRXPG59pDBkfuPwatDwtWNTJg/ejS1OlqUvZcChCfMFev+9BiqLjAr/bTWr41AJY7sfKozs24QSu9Yk6ejOyEdACIFKSSWQGvp6VJk5OqTHx5EpgAqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PQi4T/AR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34e28e32ea4so3140321f8f.2
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 05:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715171433; x=1715776233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYrKVOxVHFjhu1hOKK81DsZdjrvks2E1EPLM+0mit2E=;
        b=PQi4T/AROhdnBwPvab+UgUX+n+e6okCPFBjUNFujIUafxj+NATgrOe9zZVra2wAeWy
         EEqid6O6qxf1Upil4PatFngkjXrp1QEO/lZGYjxknyxxHoKYhbmdvQA2I2cNwOPdDLsN
         EUbzC4JeUV7O/Zp3bPZp3TgA09MrJW2pXFrK7F1aCeZ4IqH97hUaWrWmldUQehEWW+sF
         GEwYHjPOLoNy1VcqbOsq+6F4r565+qUX/65VFM41yXL6ynZp3o0qZGL997AKHC+pjjTK
         8XqAIymTaEoRYpoxDnL7TPdjnaQcVMjwOAbxPQKN8gtr+W+bMHL62dW1UVr29OJYEkvQ
         bLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171433; x=1715776233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYrKVOxVHFjhu1hOKK81DsZdjrvks2E1EPLM+0mit2E=;
        b=UFlALacMZMnOBsQ22IBVZv7PkhkV3m2DIqP0/g21oOdL1+8zKH03lmSgsXFEa7OI0r
         dpun1rBr4glGEzGMfWu9HJkade4Dor12vLbS/ll37OHwDXEQHhmseFdNGHIhMNVHRlMm
         Fm19C5mhivylpc8UvMdZlVhPLPCh+v8OHKCQFLE79ZubGWVxoP0kVEFid6EyU4n/vFGQ
         r49EB7R1FhHgr25XcvQlDEUCoiWjg5BHz9FsR9NC9yhpu2RRNkamCdkcwG4qx5YLCzC6
         gckUcLvjDHBWMano2kPnQ70pWiwgzCrz5Cbg5142od114TYRJq36Y13+DMYZjYuOV/NX
         /I5A==
X-Forwarded-Encrypted: i=1; AJvYcCUHwNMJdIQmZe+U5vTXAnhdIZj79CEPs5gaSuFwXYciUbl7w+4K7oFIYE+TqBbCpzS8qqAf9PkVhiBYWZ+0ja7xaTFmaueRyN79ZMc=
X-Gm-Message-State: AOJu0Ywg0mAgNka3Vc9VrkDtd6TsU6k8SnWQxWalB3F2is2sCb36RBjc
	vJjcS2bZ0VeowKSXSztT0fg4EaiPzf+w0kFgB1KxWBiYbj+2Zr8OsqeSYF4+VP4=
X-Google-Smtp-Source: AGHT+IG8EbUGwi8/BfWn1wOtM+/v8DkGeYcRCIK9ljfep3i3RMp/IXmIHIzEQndnWf0PIELdTF3xFw==
X-Received: by 2002:a5d:69ca:0:b0:34e:182f:62ed with SMTP id ffacd0b85a97d-34fcb3abb03mr2290407f8f.61.1715171432974;
        Wed, 08 May 2024 05:30:32 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id t3-20020a05600001c300b0034df7313bf1sm15406607wrx.0.2024.05.08.05.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 05:30:32 -0700 (PDT)
Message-ID: <20a0300a-ac16-456c-840a-e272f49050a8@linaro.org>
Date: Wed, 8 May 2024 13:30:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Fix imx412 exposure control
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Martina Krasteva <quic_mkrastev@quicinc.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v2-1-2e665f072f8f@linaro.org>
 <dvyed4grpazqk7a3tz6dqwpkd76ghtrt4euinxt3kycdeh63ez@ljgfjsfhypix>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <dvyed4grpazqk7a3tz6dqwpkd76ghtrt4euinxt3kycdeh63ez@ljgfjsfhypix>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2024 09:02, Jacopo Mondi wrote:
> Hi Bryan
> 
> On Mon, May 06, 2024 at 11:38:26PM GMT, Bryan O'Donoghue wrote:
>> Currently we have the following algorithm to calculate what value should be
>> written to the exposure control of imx412.
>>
>> lpfr = imx412->vblank + imx412->cur_mode->height;
>> shutter = lpfr - exposure;
>>
>> The 'shutter' value is given to IMX412_REG_EXPOSURE_CIT however, the above
>> algorithm will result in the value given to IMX412_REG_EXPOSURE_CIT
>> decreasing as the requested exposure value from user-space goes up.
>>
>> e.g.
>> [ 2255.713989] imx412 20-001a: Received exp 1608, analog gain 0
>> [ 2255.714002] imx412 20-001a: Set exp 1608, analog gain 0, shutter 1938, lpfr 3546
>> [ 2256.302770] imx412 20-001a: Received exp 2586, analog gain 100
>> [ 2256.302800] imx412 20-001a: Set exp 2586, analog gain 100, shutter 960, lpfr 3546
>> [ 2256.753755] imx412 20-001a: Received exp 3524, analog gain 110
>> [ 2256.753772] imx412 20-001a: Set exp 3524, analog gain 110, shutter 22, lpfr 3546
>>
>> This behaviour results in the image having less exposure as the requested
>> exposure value from user-space increases.
>>
>> Other sensor drivers such as ov5675, imx218, hid556 and others take the
>> requested exposure value and directly.
> 
> has the phrase been truncated or is it me reading it wrong ?

Sod's law says no matter how many times you send yourself a patch before 
sending it to LKML you'll find a typo ~ 2 seconds after reading your 
patch on LKML.


>> Looking at the range of imx sensors, it appears this particular error has
>> been replicated a number of times but, I haven't so far really drilled into
>> each sensor.
> 
> Ouch, what other driver have the same issue ?

So without data sheet or sensor its hard to say if these are correct or 
incorrect, it's the same basic calculation though.

drivers/media/i2c/imx334.c::imx334_update_exp_gain()

         lpfr = imx334->vblank + imx334->cur_mode->height;
         shutter = lpfr - exposure;

         ret = imx334_write_reg(imx334, IMX334_REG_SHUTTER, 3, shutter);


drivers/media/i2c/imx335.c::imx335_update_exp_gain()

         lpfr = imx335->vblank + imx335->cur_mode->height;
         shutter = lpfr - exposure;

         ret = imx335_write_reg(imx335, IMX334_REG_SHUTTER, 3, shutter);


Looking again I'm inclined to believe the imx334/imx335 stuff is 
probably correct for those sensors, got copied to imx412/imx577 and 
misapplied to the EXPOSURE control in imx412.


>> -	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, shutter);
>> +	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
> 
> No datasheet here, can you confirm the IMX412_REG_EXPOSURE_CIT
> register is actually in lines ?


Looks like.

 From downstream "coarseIntgTimeAddr"

imx577_sensor.xml
     <coarseIntgTimeAddr>0x0202</coarseIntgTimeAddr>

imx586/imx586_sensor.cpp
pRegSettingsInfo->regSetting[regCount].registerAddr  = 
pExposureData->pRegInfo->coarseIntgTimeAddr + 1;

pRegSettingsInfo->regSetting[regCount].registerData  = (lineCount & 0xFF);

> Apart from that, as the CID_EXPOSURE control limit are correctly
> updated when a new VBLANK is set by taking into account the exposure
> margins, I think writing the control value to the register is the
> right thing to do (if the register is in lines of course)
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>    j
> 

If that's good enough I'll fix the typo and apply your RB.

---
bod


