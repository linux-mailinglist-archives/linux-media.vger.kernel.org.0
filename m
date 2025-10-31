Return-Path: <linux-media+bounces-46033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794FC22CC1
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 01:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B3EB4F3074
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 00:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD251E834F;
	Fri, 31 Oct 2025 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ftCtbTX2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A117819D087
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 00:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761870771; cv=none; b=meekbIdLg8qW+dFx+ZFtuL2X7SAk+eaNlJxJ1s5jzxilq7hv54FyjwGtf3Y6rVjlBCUHhdzUmotrsniUdmitknjyYHr2zTl2tLdWOeoo1xhEagRhKStDM/OgwtlpC533+0un2uFMBTNCoWnp3kskcVkuUKou1YqwSSmSOS+q6B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761870771; c=relaxed/simple;
	bh=h1TLH+nEjFU2KXBp2iIuzuSAxG5eFA8Sa6aoePIEORk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1RH7vO3cVHLySLMKHFU6fCYzL6LmHWPjGlBY8ZiWySRL/8GcZH79c79ajxK/fRQUdG0mYMn8JADLOinNWxkECEMvUr5/FAuRAZvzZ/tdg1Eb7GhsFboO+K4xwKiXKrC5aDTaFwgkuid+0OL339cgXRy689sxxG5THMnbaTJ3FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ftCtbTX2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47721743fd0so8912255e9.2
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 17:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761870767; x=1762475567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4WS+57LRAe2z3W3iH5ZoI+GUsCAS2zPS5JkdO3F1cjY=;
        b=ftCtbTX2hjWDOlZjUkKp/iQfqDg0UJ+QC5uAjzU6PCOwbjXRiYYxENCmDA6akQ1QW6
         /oCL1U4hIZJRmHmuyRIIuCy/1WhV/tKzPLHrvrJQyRAGeVhhwsyIldQHcH6HmMToh2Mk
         fZ4yHJV6GAnSgvGWJjYxUeQJJbc04nuMqmfDOthgHP2AmjnltSE7leBh/l6d5DwaRCYA
         Me8l22AmNyaMOk6tsAeiVmDJiYglFmC4RTerIALbUFsF5S7oiw6fOYeRz54jKjyPxCqh
         LpfvGxPq6K/u0AawEscsxbVohKlcdKiHvzcO3KH8bN2wUZZjiBploUJm8uYrfUqR5DW2
         mUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761870767; x=1762475567;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WS+57LRAe2z3W3iH5ZoI+GUsCAS2zPS5JkdO3F1cjY=;
        b=h3VUWA/QOZ9dnQOsiO+1SQriQSC7CCJrwi9w95K3UFvWL5pgUlhzGc7XAPcBimTMQC
         uTZpGgUFSg2J0eInEK2dzTRrXUP6rpp3WhM98PTGxNVJxyPjXEym2s19u3BGExiG3yaF
         Fu15aWptR24PAt/3YC2M9slKv1LHA58A5+u9sfDr8C3xWekFdUzm573DohLhW/VT894l
         LU5iEFtgI0kJ97K9SwjW8XHzpp5Ks9SduWX4v35zH+UgO709WMoOwLxqZepSc0OpXSuL
         6tRImtHKKN/BoAdCjiOvb/i3ga5QgcJEb/PAZzm2ztViNy32geFBWADq4zj8N9/uri7D
         PTYA==
X-Gm-Message-State: AOJu0Yzp/p5HdiMGRMQ9+PPQZtU/5LrQnrXHKJxdgpAsoMpQZ+Cv0Prn
	SOMs+ByplW8AZ5aLuiFwBX1pdURlNWDpUqdhDHgkGWUkjbVOs7KQZbJhFDsVHjw8u64=
X-Gm-Gg: ASbGncuWU9oDB+V6j+MISb0OBcIfMqZzg3zWwvzpAkWqP9RnsdCSq1xS+XcekcpIQFa
	j/cimebL46BNt7MkafeLmLiWWbyWqh1VEmjzRieqKx1r9Uchq+otlA/gNgetpH0qBKkG+D1mgUE
	T0ufJS5yrj7HDDAkYmr65KtOTnlrhJ/EtbkTeJQrp0nWymAP9qHUcHBFqKgVeb1x+RV5MeGCuJa
	Wl7Gz5mk6HJZp2WXcV437WRtDSHtx9gBtmwB/SG/7zwuTi3gqF1na1ONeNcUhtoD/SOU2VrjKEH
	gp1c8Xz2Ba1cp+ycbYkJiGX0ZQIT4iC7/0eHBrftWOg93qOA7HYExLTb7eIRy7OBpzrO2tG9mgI
	WyCf+mkv35CGVFA2ctGFZnQ/UR5AqmsJ5Xtt08zfQSnTNiexqSJi4RPsHIvoL07CDZDu57lMIZo
	wsf0Y20C8SvPF2FLJSkjwpxPFZ+OFidqDyLwbksO7rE4T4PkCVj34o
X-Google-Smtp-Source: AGHT+IH6S0BGPSLesVEJyyjn1HKh+/PSEyTQZTdOC1ozQ38rp8QkhnHJnaRNW4UulaFZCitT1zs0IA==
X-Received: by 2002:a05:600c:1d9b:b0:46d:996b:826a with SMTP id 5b1f17b1804b1-477308c8b64mr14997905e9.36.1761870766940;
        Thu, 30 Oct 2025 17:32:46 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728ab375asm65700185e9.17.2025.10.30.17.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 17:32:45 -0700 (PDT)
Message-ID: <536dd549-739d-4c79-a46a-e373b233aa4c@linaro.org>
Date: Fri, 31 Oct 2025 00:32:44 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
 <2RL0oNzhGU62slpUlEImZNc7UKB19dBLEtchBiwHw8taKSKcKabsuC9iZIV3dWKfXF4UyIdNmspnQ3YpX4pk8g==@protonmail.internalid>
 <20251030-av1d_stateful_v3-v3-2-a1184de52fc4@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251030-av1d_stateful_v3-v3-2-a1184de52fc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2025 07:00, Deepa Guthyappa Madivalara wrote:
> Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
> enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bdfdf45c5de2f2ce885f219007718a54b5c86251 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>   		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
>   		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>   		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
> +		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;
>   		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
>   		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
>   		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
> 
> --
> 2.34.1
> 

You've missed accumulating Nicholas' RB btw.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

