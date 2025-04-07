Return-Path: <linux-media+bounces-29470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C3A7D8FB
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1EC13B1C66
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB5622FAD4;
	Mon,  7 Apr 2025 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7MRokof"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5421722AE7F
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016660; cv=none; b=dDYf9+V6ksAZ85hiPlYT1aiN1UCsn1MGvTJZRXTwxHQbIG8ykELh9hIFftHiR4VzWYFH9ZE6ikb2DkpGaFGsNuK685PW8q+gtBEzKiZwn0Zt+4eS56dzFFhOABW9eckKqtxAItTWz8G51VMVVvBUKaG1x4AkyTbmIO8t8tH3iE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016660; c=relaxed/simple;
	bh=iqoN+wUuUnOuLAL2yag/p3e39+tGVOKR9kF12dHb6lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkKl+3GhoqA+NBY8oiyyHTkZRkzRyAS72gQ+E0fIgowdKZf8E+0NbCyxFzXzguub8pdNPcC9LbLikY4lLO7DMFQKq8l2IgU2FIl2YumOYj1a8HehNy9ZRUPxXpate5UBQ1RtWhL8YiZwFF3B6ePyd13+ZtrkHEQfBri8/zdoLHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7MRokof; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c14016868so3621851f8f.1
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744016656; x=1744621456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mjc1Y+yTBBrDmieRT6oEJnnJtw+qsXJp/dvlQ9n6z4A=;
        b=F7MRokofS7GOHOlEa2Y/IcRMQaLHA/mcZOzKjZZz9COPVbSo8MexKdCZT/Cb8rla0Z
         St66w17w+UU3O3py69hv6fYCDLUV2MBq9CDCsQKopVMWxi5pwzHOTWiaMG64ptXUSQjC
         2lCBLs4aCdLTy058gXTuylZPJ1fJ0sYvSLt+k3L8nxdOb2y7e9j53ffSTHvzgyef+Z0R
         tMfyoBE8i+cOKBw7xa0nOxPrTNeAN4jasfILZX7UxpptjSt5WKmGcOLhAXrP0SOqd8R+
         dcQKf6zEubqpDjXygknq5z0afp3SWyIyyzGTFEDXd5GYUgm6pcpNsFdc/jF1J/ZdJtpG
         lkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016656; x=1744621456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mjc1Y+yTBBrDmieRT6oEJnnJtw+qsXJp/dvlQ9n6z4A=;
        b=siO0DjMa92Km0zwlWv5X7YG7M1+r0gSGEyx+GyRmjU5EmqfPMKwDkf6oivaJOfCKWD
         TghGjeubViuAAjelynouzi6EBmEejXvEsKSfo8Xqxdgue4O2ukOV08JpHCthKui68tx6
         bvvlRC1/HCdRK6+bxEEpxmmNR/9Ay7aiGeO9YxiKRJAZyyQxTAzqvbw+ADis+5i9FPDI
         LclsAE//6rbX0CaIiLBsQaxaDEaZGNOC2AfEweu+ufTp/LOyHLYMN+BZV4yxSMTs5Hbz
         vOArzdqJ4srvlrvZ8CuAnQfJ6SHrff9C8gsIC6ARen9cwuZwhqNCumIC4mZ9AQsNFMix
         W/pg==
X-Forwarded-Encrypted: i=1; AJvYcCU6sIEJ/nT4bwIscTfMi/art+8xQ3ZCB/TKULv/iAUkv+4aUgVaOvKQ1bdYmIBjXypHGWXTlMrNR3hTmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMfFM567pNHO13UtXu5KZLXpmXLutedDh/UNpiNZNmL6mDL3QG
	tj+bnIMi3zx4h1Qo4zC2Vy8i/qn6GZnONBC3j4FZOki9Jjjci55rFTcjESIpVkUp7zpNtmCzimj
	5Xb8=
X-Gm-Gg: ASbGncvEnm+U6DCD8g3oHUY0zu6NIqaH35X/pUVfeOciDRKPmqsTIPQue7oT7Wp0nt9
	60Zkrio+dfJDFDk8SGHP2fFS7Mtm4/MrvU0H9LrZQmYxqZu3gMdeIvPWs8IeePui2VdYmzDJwZu
	M+dbh9G8yGeSNUOhN+qPm7H+xOuBA6k7E2sV+NQ1uclm/Hgz+lkFu6Qea8bKVLE0K4NR2h8kM3t
	TfBl84aJ3gXpghmuhSwsWCHF1VrEvnsZf5PELhuHW8F7CarnIflNNkjqBmnbYsaWc9pOB93IEZK
	1VpsfTb382rceaoxyyP6/GHvglXxKRYWCrtOAanV7DYXxkfT9qB4Jxys5RJ3cYOV4bT1q0N8IWk
	QriQ7+nOV0g==
X-Google-Smtp-Source: AGHT+IHqiLtGTmRqnpWpvYCAC7ffTJvnLRZkBR4aIwuAQ3CmyK5RdU7aVIzfT+V2SRxkUVqIof16+Q==
X-Received: by 2002:a5d:6da7:0:b0:39c:141a:6c67 with SMTP id ffacd0b85a97d-39d0de66aacmr9192901f8f.45.1744016656623;
        Mon, 07 Apr 2025 02:04:16 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ed7sm11148889f8f.8.2025.04.07.02.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:04:16 -0700 (PDT)
Message-ID: <22b1c835-b0d2-47d1-97ee-1976d31beaf9@linaro.org>
Date: Mon, 7 Apr 2025 10:04:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csid: suppress CSID log spam
To: Johan Hovold <johan+linaro@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Depeng Shao <quic_depengs@quicinc.com>
References: <20250407085125.21325-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250407085125.21325-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 09:51, Johan Hovold wrote:
> A recent commit refactored the printing of the CSID hardware version, but
> (without it being mentioned) also changed the log level from debug to
> info.
> 
> This results in repeated log spam during use, for example, on the Lenovo
> ThinkPad X13s:
> 
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 
> Suppress the version logging by demoting to debug level again.
> 
> Fixes: f759b8fd3086 ("media: qcom: camss: csid: Move common code into csid core")
> Cc: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index d08117f46f3b..5284b5857368 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -613,8 +613,8 @@ u32 csid_hw_version(struct csid_device *csid)
>   	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
>   	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
>   	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
> -	dev_info(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
> -		 csid->id, hw_gen, hw_rev, hw_step);
> +	dev_dbg(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
> +		csid->id, hw_gen, hw_rev, hw_step);
>   
>   	return hw_version;
>   }
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

