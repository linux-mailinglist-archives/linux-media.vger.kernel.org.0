Return-Path: <linux-media+bounces-15878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63490949BCD
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 01:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 954AB1C220AF
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 23:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79102175D36;
	Tue,  6 Aug 2024 23:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J3zwoikl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F1171E5F
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 23:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985625; cv=none; b=G16dXfz3YBo8gf5I5UbFOXv8xrfTrL3LxN0JD71q5vbvaKVsppgbPbrjznMUAHwneqvl25/qaMuQR7BJ0ctohvsZ+S4UtPknA6hk4KXV6oCSa85L41wDKSKy+NtE9JfVyenWL0Res+G5FY5suXuLKcvmdSulJsYAXKxaF4vTfzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985625; c=relaxed/simple;
	bh=0J/AdXiVvWShheGvPmUlMjBN3kfV+t5JnxiCk1W3uBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NmZLoOz3Begjaa8Sx2HrVEvHUZW/YAt7Iya3AG5+aTpYKVIj50xXeqsUC6dWsQMVJuXuz4WCAh0rys+383cb3RkCKNEq1V9zW5LSI7p04m1fPem87i9HBeRzGmKw/U8bpdgy6wYgO5NeOJ1MYf8aXvMMrqHAonwvKMYW1RHOUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J3zwoikl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so1799515e9.1
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2024 16:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985622; x=1723590422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lRTZ4GySlfkCXEPTYyeONrIuCjnP06hZmIkMCl/2KwE=;
        b=J3zwoiklg4reVR1bfIj4orhh1W919oFjAVgDDuAVxZgkfYIHHMNK2dRBqNAsVReTcq
         MlAGB+FHdyzZsAF+bABxA3ABN4542ICLbk2fhnwiyLJ6CoVravJd7O4CQF7KuHagOr+L
         otKPfQun2i44LtumLA4nB4YKPhgUHsslEHs58HAVJuA9GoM5fECSAO23B/5AinOh6rNp
         uZpbrwTc6WGnYciqjbJmm8dF7P5H5OjHrqJ07DfnE7oDwY3gL+WgU0tdaxPxJLwoZEZJ
         04XQvUE3Dgx4q0YXTjp3t8qRMAXbQebrWNGQ4vmYfPaVkReKqzoh6gHK7MlPnOUIC0c0
         oDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985622; x=1723590422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRTZ4GySlfkCXEPTYyeONrIuCjnP06hZmIkMCl/2KwE=;
        b=o9S3HZcCsv3QT91CG6QipRMz3mhLylvoeo2DeujumzJTshCcBZH68wk1NlPbD3JTai
         4gUKKxrvedliy+v0qB+4zj93Bgv+hPFEDzSxs/yKwsmq17vnCI25BVfk7K9Dg+fspjMg
         VQH2J2NAkPZt2mpAMFje7TadeMgnMXGdp8glrao3wrlIURW/1Ii2Lwl/niDRerwX5dRk
         JK1Y9XHRcKeLNmJPhyfSzICnhKEb07Ig5YpP/7IkgdpzvDhCkPPorFzlc8pbV6pLJU7q
         g/YryYfsL7sUg5lzbvRt10cBKN1JjcBI+vaZRWah+UCmlKFXWERaKVKFHmjqb+LVo0tT
         /Ajw==
X-Forwarded-Encrypted: i=1; AJvYcCXiU6lQ/pIBGJVhYm3njMhZ8qo/lXCaKWAOgk1u6lXef9xsrL3o48KrGEBOB0+4tPzo85hLOo+9J1CeA+t85k26pTBQxMLf2ebyDpE=
X-Gm-Message-State: AOJu0YzT3mtSeirhf1AsZb8VM620kH/6ulPPAXqwbtvlDYCqAxzNRtSv
	sOfreiBQoLZ/UcErFe5NtY+eTTa/ZO4R/7QMPiwuXJ6MSVhWmzzmUZWcdu9ArBvs11Rnzuxi7Bc
	NbEY=
X-Google-Smtp-Source: AGHT+IHVkAyWkxha6j6qpZF3mUMmg3Wku7DOp4M2iAUcjBVgKEazfg96PdMW9g2QjN+9IAXzecctXg==
X-Received: by 2002:a05:600c:5129:b0:426:5cc7:82f with SMTP id 5b1f17b1804b1-429052cfb3dmr1682185e9.13.1722985621679;
        Tue, 06 Aug 2024 16:07:01 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059713adsm1284205e9.11.2024.08.06.16.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:07:01 -0700 (PDT)
Message-ID: <f5a9796c-36a8-421d-92e4-535997e9d3ed@linaro.org>
Date: Wed, 7 Aug 2024 00:07:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: camss: add support for SDM670 camss
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-10-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806224219.71623-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:42, Richard Acayan wrote:
> The camera subsystem for the Snapdragon 670 is like on SDM845, but with
> 3 CSIPHY ports instead of 4. Add support for the SDM670 camera
> subsystem.

"The camera subsystem for the SDM670 is the same as on SDM845 but, "

The naming should be consistent and the comma if you're using it should 
come after not before the but.

> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 51b1d3550421..05a47b82c012 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2403,6 +2403,17 @@ static const struct camss_resources sdm660_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources sdm670_resources = {
> +	.version = CAMSS_845,
> +	.csiphy_res = csiphy_res_845,
> +	.csid_res = csid_res_845,
> +	.vfe_res = vfe_res_845,
> +	.csiphy_num = 3,
> +	.csid_num = ARRAY_SIZE(csid_res_845),
> +	.vfe_num = ARRAY_SIZE(vfe_res_845),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct camss_resources sdm845_resources = {
>   	.version = CAMSS_845,
>   	.csiphy_res = csiphy_res_845,
> @@ -2447,6 +2458,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
> +	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },

Nice work, please fixup the commit long and add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

