Return-Path: <linux-media+bounces-15003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F557930C11
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 00:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910631C20C12
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 22:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A2213D635;
	Sun, 14 Jul 2024 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMoU1fAT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CE5140E3C
	for <linux-media@vger.kernel.org>; Sun, 14 Jul 2024 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720997985; cv=none; b=RsRk7/iO3r761F+dHSSg2F2nUi69O4q9GkRXlOhto0ZSSIj1dsMwYd5Opg1h8ibJ/cxN4GqlrIk39AtfhYgNZdx9biuyNP6FPUrTXx6Q/nY8swEbo26FFG5xPigr5iVKuhwNT8S8onWx9svWFtZ7t7aaEsnI0ytmFLJZEpO1Zew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720997985; c=relaxed/simple;
	bh=iZaP93pqsL/e4ZO1V2MFXka+cpqy07kfC00KnNYtiu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcPDUnBFRbH8SVyPb/NC5xKDZdTt9NgbCzYSPtDCpfngNgDn0ICIM9BZ4t9+hELCbXzNWBBo635Xho/gZXSCIt38oBRNgDVN5knwqBAKbNeMNOk8QgDwmYzavAw0c8idH31WeK2x1ScYI4ieWZgi9h+ApRadhy8vVRTWArSq5pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMoU1fAT; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso49081301fa.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jul 2024 15:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720997982; x=1721602782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lxkrc6+6TVPqzcihhgsA9iKZjrsTDfg27sQkkNiyYqg=;
        b=OMoU1fATr6W++5l13+cYfccRSoskB8H/333Pkbjcj0C3lN7HjIJE+lwFtRBjdDK3d/
         WQW2O79zmrsFfCrL/xK1D9glVkERZ+1yjfSYEFCqmN3Ppy+b4v6/Se2g7bdxywQEM/GQ
         Vu9ysDeMIHifeLrcG08rfZz2nfDXRe7WtB/ODW6dydoSz/335o8mfJWUteAgO1HjSInr
         fQImo+OWCeHuor1xG1WkKkzXgxuu3U9kcHRGK6hFWapaMfoYkyo5TJkKYXLfyhw4IqgH
         tW8qwnHafTjGwW7LULXoymy7pqK15SYD/sTfAjFB2G/Pzy0qTplAii1x7jrSHwEvp6qM
         Zh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720997982; x=1721602782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lxkrc6+6TVPqzcihhgsA9iKZjrsTDfg27sQkkNiyYqg=;
        b=aGYe7eqw+4GVGTtZ6iiVoLOl4cgD9GAv70ehnbykIfeGwDqI7xfHOIbTlJ71M3o32j
         MpPUSXWW9UIFScGuKFedk6/NwrD84FbV2Ll6H1Wk9ew3+1ExVNb3A7UHPC15CoLGufGz
         TVSRyTvqtBAsvMWU1JkeUO+PPOojnIoqyxHvA25SV5t5l0OQi1aVqwzF780Hq0PCvhCs
         vMcMpVLxz+yg6Rgauf0Ga3BXPVx2aYdRbQKX0YpPgwqszi3M2RaES7XvvN1t7oGdE8wy
         JE6+0ZFiy4J4USHk7msNsnrQxdsfM/K3kX6isbRVuWNUUUsEKC18kNA7UV3CxR4Ir5Q/
         cXNw==
X-Forwarded-Encrypted: i=1; AJvYcCWpG2t59lvYbMzfCoQ3X9fzd6nfnw/iaZroqiAmed5OxlKcPoiZGCzXv2ck84HYZMhh3e08l/P/CmzMpO6aZgaoHl+yWUaH+XiPoys=
X-Gm-Message-State: AOJu0Yw38u8skay70DDdDew31rcW0Kakb4ec5cebxmd5Uxzq1pskYsaS
	lY5TtvQpLDzmuGRdpqgMuAl9vcNMrs2HmhcKL9KJHE5QyDqkhdTS5OWFgszlUuA=
X-Google-Smtp-Source: AGHT+IFHDYk3nenxFNFWwLzmbKl9yj0hlT4FTQZqgKoJtWT6ZiQedTzwq/9ogD3RdaFnu3Ud30XhTw==
X-Received: by 2002:a2e:8544:0:b0:2ec:5061:d7d2 with SMTP id 38308e7fff4ca-2eeb30e5c4bmr107343131fa.18.1720997982016;
        Sun, 14 Jul 2024 15:59:42 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef44a9sm64488965e9.40.2024.07.14.15.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 15:59:41 -0700 (PDT)
Message-ID: <5bbe82b4-9784-4c62-84cd-7ce9550fc5a5@linaro.org>
Date: Sun, 14 Jul 2024 23:59:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: use device managed APIs for power
 domains
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <1720763312-13018-1-git-send-email-quic_dikshita@quicinc.com>
 <1720763312-13018-3-git-send-email-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1720763312-13018-3-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2024 06:48, Dikshita Agarwal wrote:
> Use devres-enabled version of power domain attach APIs.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 5028220..86221e0 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -869,7 +869,7 @@ static int vcodec_domains_get(struct venus_core *core)
>   	if (!res->vcodec_pmdomains_num)
>   		goto skip_pmdomains;
>   
> -	ret = dev_pm_domain_attach_list(dev, &vcodec_data, &core->pmdomains);
> +	ret = devm_pm_domain_attach_list(dev, &vcodec_data, &core->pmdomains);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -895,14 +895,11 @@ static int vcodec_domains_get(struct venus_core *core)
>   	return 0;
>   
>   opp_attach_err:
> -	dev_pm_domain_detach_list(core->pmdomains);
>   	return ret;
>   }
>   
>   static void vcodec_domains_put(struct venus_core *core)
>   {
> -	dev_pm_domain_detach_list(core->pmdomains);
> -
>   	if (!core->has_opp_table)
>   		return;
>   

Less is more.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

