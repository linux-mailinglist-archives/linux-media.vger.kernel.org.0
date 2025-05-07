Return-Path: <linux-media+bounces-31986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBCAAE3E4
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 17:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF4A69A41B1
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 15:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826FA289E3E;
	Wed,  7 May 2025 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhPIAGv+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A1E1DBB0C
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630437; cv=none; b=EQBLNdIdFth8nEGoVDD+qsjke6xsy9yO3TrXuLHnf+ja356/pIaVEy5QaSh0pffd5qRCASfLvc9ILw5MKpmRWGnmzUMqSa4KDVc1la3CLqgt8qlqqAnNKeYI+0uBSJmyayAW6g2lvD7kzdr8vLUC/dFLQZDSkqR5IAYBgoEDotY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630437; c=relaxed/simple;
	bh=pz8ye5e7M9XObP3UChOTHfnACy3PA0Ye6tCjNjm3k0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmnZXsdYV3NQ2RtoVIP1RtEvdGmm9JRIVqZfc6ybFFnTXnr+aQopQ3Z4QTgNopOOl2p7SQfPv75CEcL7kUsT9fKTZsyF4lR5unBa9yUaWdIfV/aeOfgOBYvbmXlQNQ2yU3t79u04rYzWa9smt068LgF7kOI2SUT3jNI6mtN3gZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IhPIAGv+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so2843455e9.3
        for <linux-media@vger.kernel.org>; Wed, 07 May 2025 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746630434; x=1747235234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0SsKd1Kg0MlyI8m8KzDXP/8dIexMnrpuvni7IgTwUM=;
        b=IhPIAGv+BadjeIGmE9UfOxWFUkWWVew1DM+20lDkEAPyw3bPsgAJfHPxdVoWUSxdrZ
         1+JvoTl+WdxMeZtbjCcWLAgldPnfORMZRGmk9VVPzfRI4+HM5+o8uopsh1QptYe0EXYH
         URwlTiNVsWkZmQ+jeA/VeM8bMWBt6RmwOy0o/LGslUGEDOJnhbsrsh+w1JHiB/NfAmiO
         cb1KKERXfe2WOxvU8sIF3BknVc/F6V/+Ui76l2yfmZCdOusXC1fEO0fhrvoRZJQOvamC
         qlLOCbkTNsms/P19BVxtFCfkNqttMzy3iPoXyukpTDW4cH70OQeESqe5mI9NbjnCBGJZ
         6r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630434; x=1747235234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0SsKd1Kg0MlyI8m8KzDXP/8dIexMnrpuvni7IgTwUM=;
        b=b866mZL7ueeuldKjlpKyO6bRHU9kb1Obqoa1YvqkGp0oMQ5X38R8sjp3//ZQNX9Lj0
         aMqBj1RZt5srk/Yy/yytBcaiYNAHk3esC70ZaMKPR438TMSCqdmv9ncVu+IK2udO2hsD
         wrHHrMZ383+/35TwAkw1B3wxN/cjYhPBHosjyurF4kuLAVqQ9InEocG+Y6dZu4WobX9l
         JODtN3wgDqwFIQ7qVoURohKWCSkRogeGvSvA0CdRae7dLrTDRAV8aGvqApAXPFYQfU4d
         tYx6xhtSMX9J7uTCo/KtSPne5poDtXk6BW/cyffm3HEuti9q7f5rGZKpd3m0IRkbA7Rq
         y/SA==
X-Gm-Message-State: AOJu0YxSKVdS/C5AlVTt/ffYXj73vwX6ramwGzIuah5IMyPi7aClq1Hp
	jKMkkQs/bf1KpCPfoHHjqFRdrmLWH/TRf9BvKvvsDny6aAgENuhtq0xmAsNeOf8=
X-Gm-Gg: ASbGncsOMoUtvKEzQITVZYgz14WzpsUA8MDuAqUJammHaHXCMhJF+9IS69rRQ7F/hAZ
	VItxB0hTRIZl0DEC+OYpdwdKOVtv6ube0UI/EeqfZ0qXEslLxzlo9ys6ZygREiEfzUy73Wlhy5s
	dfbRimvix84ZO8h8I2swOKcK0BBOXw9lGBgtzCv5UGyG6w8fH+c6dFxkaKCy1PXpU6te/WBJgE3
	/IpuxcLuhs7F1Twp1ymMvI4jwIXNsjIYzWX3RnC4Fb4pBQwKESMrKPUVNLXrbrsSUxiVTpPLcIU
	FfAhNAqTNUKT7GvgoHcJRS+zKFe0q6alWAIAN8EW3ZzzQhPLZiC+otuRJyxPZnKJufxKF+ktyam
	KBYouSg==
X-Google-Smtp-Source: AGHT+IFe/RN371zSOT3geyllQKE/3rmj0Va8MGOVysneZBCiRZTbhKgyS/SuJAtLvsGkoEeFtxE4JQ==
X-Received: by 2002:a05:600c:1384:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-441d44bc67dmr36585625e9.3.1746630434334;
        Wed, 07 May 2025 08:07:14 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7caasm17416290f8f.54.2025.05.07.08.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:07:13 -0700 (PDT)
Message-ID: <dae06ff6-afd9-46a4-bd37-25bb367ba545@linaro.org>
Date: Wed, 7 May 2025 16:07:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/25] media: iris: Skip destroying internal buffer if
 not dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
 <20250507-video-iris-hevc-vp9-v4-1-58db3660ac61@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-1-58db3660ac61@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2025 08:39, Dikshita Agarwal wrote:
> Firmware might hold the DPB buffers for reference in case of sequence
> change, so skip destroying buffers for which QUEUED flag is not removed.
> Also, make sure that all buffers are released during streamoff.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

I'll take your word for it on firmware respecting the software contract 
on close() wrt to DMA - however I think you should split this patch into 
two separate patches along the lines of the "also" in your commit log.

1. Skip destroying buffers for QUEUED flag
2. Make sure all buffers are released during stream off

These are two separate fixes IMO.

---
bod

