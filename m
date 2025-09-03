Return-Path: <linux-media+bounces-41713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D1CB42458
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D32C2052A6
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67ECD3126B3;
	Wed,  3 Sep 2025 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fpzIAgek"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D323002BF
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911793; cv=none; b=S+t+GYh8SOoS0zeM5AVbKtusgTabHo6iG0mxd0JfnaKEjbQqXUymmlPV8JXzLheoDHLupdenz1d5mldbmHhn1hT10TVnfp2OQ6mrz0vQR7hlOkAWe10y43xoCYNq/Z+OHYGavGjP9dMvLcIounjXgXWDFOUBrBgv94dioiu4ixo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911793; c=relaxed/simple;
	bh=LekdRFzFZGbphNAI7RPhmxPwnfPr7M4Uz0MSWilmzVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1Fwb3UlJpubHmyutTPaO0blp5miqDxwEl4Pw0cVg5y8J5X7EZFNudCfGMB1tLItV/c5Gav4WLMwB4i/0DVWUxFj/xZXiT5YgZjHqVO3rU85korLng2UrFuizb6lKGNhyEEaSc1IP0KhvcKPORwef0OH3y8ocRhq3tZDJj6FJxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fpzIAgek; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b883aa3c9so215695e9.2
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756911790; x=1757516590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vb9H2OtYCm0pJa79dfHcS+lvaJaqfNpw4BGLzTlGfN4=;
        b=fpzIAgekbJMFuAfGlyDtbM8qv24ttuPeykmCLbD++EHmwTNJ2OFtb6Cm4Ll8Ukgjcx
         rzMGSMS/8i/cAq49BFA8eKEB1H3Q2aWZGFUy3Zvsoa2Cp7f+mkHpOJXlxGTaBRutzYn8
         fwExekkwwZJryHpGtVyRE+MtAAEm57wocU8AwP+ZcifzaPXr5cgA3MgP4Hi/fyDZXQnt
         O/nImKi6zqbrFmQO4malDZqwfuITEUqxV5les70sW+8boNX+rQfNoO8TfHkJ2SZTTTFD
         WDjx5yzceJaUNjmJl2xPM8zK4eWf0Cbact2U2wiYXe0/ZMdTubdCsH2D7DqCVluweoT/
         e/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911790; x=1757516590;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vb9H2OtYCm0pJa79dfHcS+lvaJaqfNpw4BGLzTlGfN4=;
        b=WvaICHduIHlbn7y5479hfLpBaOArlidai74TquMTRe8p7GQFnw/d6ovnhAn3TkHF4s
         j+tzH7oPFP7o/fY6lcD2J9urqoy8ZCcDqOvNV39God8q5vDmJQyOd/B2sdsOP2KqE0Bw
         iQdtMLaoP/WGOk5wL6SIsCW85tLC2hWPebS5YdgW5ne2Ix10cqqhIFyG9aiQU9WrJhaa
         MLUTCb1zLPVpHTBtEJmBC4JMkiMhgoFIILkWDiqghbc1PHDYoYXmkzFSGCFqxj7jCEHh
         G6O1ASFSANVCrEtfGvN8BF6XIBe9J0IMOJ9G+N0mNBRY44hji9Y20z6Fvf1Nq4aijmwi
         lJfw==
X-Forwarded-Encrypted: i=1; AJvYcCWmUoG5l35cNa5t4NZ1fcggCApUXJexo5OVuqE0ewt25q4pG4Z+Hj8HKpVRJCIQjpAG90lAuke7LxWPDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvWMl2CiYvI1pt3eFLiwv4A4ZCkJ3Jq2abDz2/HJZug9oNF604
	yx8GTvQj341ic25yEJjQest3xCpOssiHNhobGuSjFdU9qBREA5/vAAS+9NxsSpX11Zk=
X-Gm-Gg: ASbGnctqsZ98JHJAwwYGmQ3YiFEi/ccBpI6WgJDU0LQg4iArqMz8MtOBJU93BPcilAV
	+BIDfHvndPDyVgaMGnshLNxBMD8UJe2yUVgidnrP4QZHK+p9V/inYRKhdR3V2uDAJDTGHnBqdYB
	75g/C+F/sYWTu4nRxcwbfPnmCFzWjQ9ydm4irMkaRtjHr06oeAgNbsV021sSG4PIWBzmGhp4mBy
	bIlaIhKpKbBMAzJzLV8T1sIUFlhcpDNhX+U2+MPeKPRFENitaucuFUwmPUoQJS7pecWlinN0iFK
	XsIY0QYWGRkaHXS+7kvs51bHFkq83UuhSxue7j8uRdqj5WN2RYAAlrivw/ORgSm7Ea9F86/P6kF
	d8YxTkzgE4vwcrT2JqG/ZyHrdHjRrLa5AnKhgcm6MJRfDKQN4gdg6QXrOJYMc+jIzrX8HOX+2+T
	GZMmn/9OgqP0yabKjh3+06og9586edrQ==
X-Google-Smtp-Source: AGHT+IHgxGzSBKO2RRcMFfLj2ZBw0StjQrIND6sOj2Qk5dHscpmAOqzGzyVkeDc8krrGAjKPU2Waxw==
X-Received: by 2002:a05:600c:310b:b0:459:e3f8:92ec with SMTP id 5b1f17b1804b1-45b85532b05mr140779095e9.10.1756911789005;
        Wed, 03 Sep 2025 08:03:09 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b73c52735sm306287285e9.22.2025.09.03.08.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:03:08 -0700 (PDT)
Message-ID: <0b4472cb-0c73-4eb8-a360-22b40aae44f5@linaro.org>
Date: Wed, 3 Sep 2025 16:03:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain this context until
> authentication and reset, while non-remoteproc subsystems (e.g., video,
> graphics) do not require it.
> 
> Add context aware qcom_mdt_pas_load() function which uses context
> returned from qcom_scm_pas_ctx_init() and use it till subsystems
> is out of set. This will also help in unifying the API used by
> remoteproc and non-remoteproc subsystems drivers.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

I'm struggling with the logic here a little bit.

You take this function which calls qcom_mtd_load_no_init();

>   
> -		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					pas->dtb_pas_id, pas->dtb_mem_phys,
> -					&pas->dtb_pas_metadata);
> -		if (ret)
> -			goto release_dtb_firmware;
> -
> -		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					    pas->dtb_mem_region, pas->dtb_mem_phys,
> -					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware, pas->dtb_firmware_name,
> +					pas->dtb_mem_region, &pas->dtb_mem_reloc);

and then turn it into

> +int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
> +{
> +	int ret;
> +
> +	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->peripheral,
> +				  ctx->mem_phys, ctx->metadata);
> +	if (ret)
> +		return ret;
> +
> +	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
> +			       ctx->mem_size, reloc_base);

Surely you want to qcom_mdt_load_no_init ?

On current kernel
return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx,
		       mem_phys, ctx->mem_size,
		       reloc_base, true);

but that's a functional change

> +}
> +EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
the no_init version of this looks like this:

int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
                           const char *firmware, int pas_id,
                           void *mem_region, phys_addr_t mem_phys,
                           size_t mem_size, phys_addr_t *reloc_base)
{
         return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region,
			       mem_phys, mem_size, reloc_base, false);
}
EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);

So is it really the intention of this patch to change the callsites 
where qcom_mdt_pas_load() away from the init version to the no_init 
version ?

Maybe its a symptom of patch collision but hmm, having a hard time 
cherry-picking this to test.

---
bod


