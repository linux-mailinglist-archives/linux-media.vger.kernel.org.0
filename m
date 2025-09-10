Return-Path: <linux-media+bounces-42185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341AB514BB
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79FD31C242E2
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5D727876A;
	Wed, 10 Sep 2025 11:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIfZ8ai6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DD318FC97
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502227; cv=none; b=qVNGOYxm0Kn/i0es1ID8aDIeDdJ3krzdqtLmkEuKFJes7WdJK5IECY6Gw1EAbLoojLBaqef0CVddjIWyZHEe1O2l3gGK/PrLX5bGdzOTrWquob0rNkWUov9jUqUmCPg66G032ROsGD78UkzTTbtxrQ1l+wwMwzWL+x59E8ixdpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502227; c=relaxed/simple;
	bh=MfAeM0+0+NqP6YlpR00RfgrfzwhHRE8FnwOIXHbqs0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBzo3zsvfHDMtZxVCQ5SbeWi7Smb43Vw/xvcd8UJ9TluYq4C2NXOAB1cmtEqSxP94zFI0EjPJXuvES8bZsvTZg1Z7+GiOU3cKA70RUtfTgp96Udx/rllZVI+NaCEfg4lUGozWHu42Mi6jN4UPVT9/APHBuI2qoqfteQ8dfpreR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIfZ8ai6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45df7cb7f6bso3861315e9.3
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 04:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757502224; x=1758107024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r08hJahlcSXpf9x/oPCPGF0O7nA9xLQykiFQq47vLr4=;
        b=tIfZ8ai6lkOeQzEbCfQL3MSu8S2WbIvPue2SElYnmYTWVC0aNILMgmjEMZ+vY6ccHX
         LTRzpE/Jf8N8McAJfITqeJgy7dS8bkGMccufEhuM3GPAbBD/Qe6yAMFYoZjih/xMAfFt
         u7C/ksonyUcGI3iVLXW85vEwxWpmxriUsAM8xDtmoN5RnCzdhF+SBILkRX5zMHbqOmxP
         jWFF7XG7Jt+/QoQlQ/dJXNUgTsEbaTsoRS3k1UXWTGwu067tAJkfzVufUGDCL3H+dsN4
         awETZ7iIFrPOO55bl+jbVoelqQKdvSBH6T+ckseVlUlpNYA1VVDjpZd3i/SqNmjs4lN+
         YejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757502224; x=1758107024;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r08hJahlcSXpf9x/oPCPGF0O7nA9xLQykiFQq47vLr4=;
        b=bHmGozBxqA8oiWf/RswMBM1tYZM9kzghIxy63vFDcGN6fxhR1OvubwaIYHSMGzBBjU
         FPEITo9+wju0BQdsnM/uWTxdgEgNiShT8OGyIROXF7pCGPTypH1qHrQR2JGui4hTqVuI
         Xv0WW1znqoAnZjrVI6AnSjvT30oQsMVv988RvxYwpprQrPrGLqXp4WoD1JTIli66rBPV
         6EAMoc71L7JkoNqTb77CjYfh2xVrxnEp+yxIPkLqKxZN011HDk3b/d7wGLTZkLxbx5LI
         hBBbTcB5Pc8yTh6oA4WyDlf0IwSaB81vyfw/H/MfQsyIqwU/hy3Ukmy3zDcvVrzovZzG
         aYPA==
X-Gm-Message-State: AOJu0YxbFJn7CG56V+KYBpCMgnKkh1Wp3+rdLkLH97KQxYzdBurdsHB2
	tpjKjL/NgAcq+zCr+2E4RY9syceby9MMM1gC1OWN6GXtj4d4yxRn/6J3RnbuX7jh7r4=
X-Gm-Gg: ASbGncuw7pGMjqi5jVCGAq59Ekbzyo9PSbFtmaSpJgSMM5kiM0cCkLpTTPCVk7ZaF0c
	atKK9B4PhEdkhhyr0msmdbmK4Z8CVCbcqtNs8Q8bSJAMyhMmJiRQoR32xVmpCuG9RYwIXxkRA1A
	/p3F6GGx6KhxEV2HeyjkFJnXGvZsHAJvWXCfnIIFdwiP8pvPLp1moUPGo3LryycAmrKD4FMRptC
	f5hdMpNKMqYrKsqhfd4afXGd7lMQwYov392/ZO27vayAVWCbq8xpE6ysCSiyzfPKVQU4T2tXmwB
	Et6nx7do/JkzbrG4w7OsBRKj9PHt2T36EidgViyz024NTtJcbyWvCNXH2W/UYaSOuFkWm6mYq0q
	0rtWH4LaSHAO6ERkNUk3tRnnK1sUbQIoQPw7sbUOGkJHUmqYt8gO245Am+drm3X+HwxXy03mRyJ
	UZaL8+C//8GFxGPiZgRs0=
X-Google-Smtp-Source: AGHT+IGSSsTUb8kO2rPV79368muMuGos8vtiUCTfNP+AFDQ9kg7kknopl6w9E+whw5uTL/w+rEfQ7A==
X-Received: by 2002:a05:600c:8b34:b0:45d:e110:e673 with SMTP id 5b1f17b1804b1-45de110e71emr135337115e9.4.1757502224302;
        Wed, 10 Sep 2025 04:03:44 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df16070bdsm28197275e9.3.2025.09.10.04.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 04:03:43 -0700 (PDT)
Message-ID: <1d9287ac-1c6d-4f83-b95c-b69bbeb63147@linaro.org>
Date: Wed, 10 Sep 2025 12:03:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Add missing header bitfield.h
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hans@jjverkuil.nl, kernel test robot <lkp@intel.com>
References: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2025 20:46, Loic Poulain wrote:
> Add the <linux/bitfield.h> header to prevent erros:
>>> drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       186 |                         if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:36:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_RUP_DONE'
>        36 | #define         TFE_BUS_IRQ_MASK_RUP_DONE(sc)   FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
>           |                                                 ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:191:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       191 |                         if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:38:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_BUF_DONE'
>        38 | #define         TFE_BUS_IRQ_MASK_BUF_DONE(sg)   FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
>           |                                                 ^
>     2 errors generated.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509100228.xLeeYzpG-lkp@intel.com/
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-340.c | 1 +
>   drivers/media/platform/qcom/camss/camss-vfe-340.c  | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index 7a8fbae3009b..22a30510fb79 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/completion.h>
> +#include <linux/bitfield.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> index 55f24eb06758..30d7630b3e8b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/bitfield.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/iopoll.h>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

