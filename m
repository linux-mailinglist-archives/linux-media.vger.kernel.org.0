Return-Path: <linux-media+bounces-39102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C52BAB1E534
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E27D189664A
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE1D26D4C9;
	Fri,  8 Aug 2025 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlr+tHg1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE1525CC4D
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643691; cv=none; b=XIzP6srWd3vA8FLoZiyv/JEEn2XFQKkMgjcEFiTUFhlqwwOW/W3FC2YKGFWe52YZJv1wK+j24O602Z5L5uBcYQpya+a/jpsHuOdF5Y4qVt9rSfhSwVNkVQWIipqrlMs79mdfych8x7tjse/+WdwzhK2YSAXVHau0NSxEnjVOeX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643691; c=relaxed/simple;
	bh=+5mmSXXgQfg4o9txh+YZiXCmcXSiP1ZTVMOYqvAj0qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMJPHG+oO3sBGu8+kx4R24te1c0vK0UeeynDmsNxilwfIbNANFPcnIC2EafWZAljmLM6/4vx0Ysqb5TdLLsaIA/Oxf9yGzW3WgTg98L3atcuoz07COponUJeelyPjEE0BHhdUmDIXizZM+QmFwoS4in2G7/Oy5cD/S3iS/pUhuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlr+tHg1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b7834f2e72so931114f8f.2
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 02:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754643687; x=1755248487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PH1sc0HOWazPmGzwk0Iil9DpgiFfEiqxA8M31CQZlCk=;
        b=xlr+tHg1005RrOat2Wwb4pM+isp+i1hNprkpHOCqV/YiBYEmYz+HfzZRfbWuikWDX0
         HgWHGnl9irdoXbqzPXbjojhlrRUfpANAYEb0ThAbTf6MQKTpPqlAzx+j3lGJzKPLG7t+
         5DM5OiMGgufRQoM4AS41k9xH9mzwJYRLCfJaOQhq03UWwDF2q5ylPpjQNt8xf1/u+qOt
         iTN46ZUr9DLebsxI9O4skLnBur2ho3uzr8wmqE1wE4i4RYD+s1RyY/NU9DceJWnfAvhx
         4fOnU2J5doFo4A7/xUIoJKUiHU9nPTEzFw36oS565yjJMbaJPujzsaug4iyzDzklhJxm
         3r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643687; x=1755248487;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PH1sc0HOWazPmGzwk0Iil9DpgiFfEiqxA8M31CQZlCk=;
        b=pQt/hLdENNKI81Ur6CXc3/wciyaxxkvg0w2G1sxUIeMa9AO0eF8e+nfcIxqJuVLpoX
         OvBnnwGS1XUBY9GGNZ770nrFzHY5H5QjB0Qfr+w/V/uqCJbHpeKnr1Hq4BQmVoOvLVX1
         onQpVc71BUg1RPtzlksiJnP5jrhJKvwOLaFhM6JCsqJSFolTEoTKQ4KkDfgm5YvJ0ooZ
         h7+echs5ac376rTkDg70e2xhGkpCoxMk+yymhEclwyQSnDQObAFzBXEMDXvglgoofp7h
         qh/64bPvVqKfu0c/QuBAz9hl2/HX1dS8teZN44g+gNk8pvHSOC5sFZo++0y4IMYTJMEU
         ZaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqUxd371JwWyq3i9X0sypacXPVH0KKDVuAGJdE+RQ1nTUgYxNsG254aQKSSDsAgeUvX1Qagf0mB6BU+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWPdtP0ofYK7Grjky1APJPeaCoLdgCQl7zg4pWCo2nniWcVZTm
	VIzCkQg2F4zOt2oHHklSYA3RAGckE4TnHpCRpUn7oh58aDYouewzynliEcod/jEJLeI=
X-Gm-Gg: ASbGncsmXu2rnv/dzTbZIPmFMPud1ct4mmyoVD99/jLW1MipQmxfSen89Wf1EhOQF1p
	WjOeroa8GBDbPn5gK8hzujmElYNRLHCtl2Q3GqRMZ9ok8wSoO1Qk5nh6nu92OyJPrA9gZYHc+ks
	gzkQg2HUY5Z8DobEKFDVRwqZy2IQsRh5QfyUxnHhJjvacBv497N4BYkMv57/xVwGNUXOf+2WDrq
	rdejsK83CJsMe4APiAQaeDklY31j+kew0kw1S6SdHonHZpPVGt6t0JxxISL3yPSSXTGO3Rnuy8A
	4ClG4ZwMZEOAFeut0GIV5DloTVy3mIxcz+Oq98ZzNOdQuDOzaaLkBs2EU53VcsAlS4VrLoAEccN
	pu9WivPnTTqrcysoBsCyY3RH+cOE7oQjCUeKpAlVMKgOOdPUhciFe61uRAiaFC38=
X-Google-Smtp-Source: AGHT+IHQSMBQxLb0BZuEhqNGRQomUFmT/lydrrM1kku7nF06fGNwjgx661NlU4HIkiIGSw1p8Q5DVw==
X-Received: by 2002:a05:6000:2410:b0:3b8:ffd2:6745 with SMTP id ffacd0b85a97d-3b900b51264mr2127347f8f.44.1754643687141;
        Fri, 08 Aug 2025 02:01:27 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm29605740f8f.39.2025.08.08.02.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:01:26 -0700 (PDT)
Message-ID: <2c63a133-eedb-4b8c-82a7-6b183317f6f7@linaro.org>
Date: Fri, 8 Aug 2025 10:01:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] media: venus: Define minimum valid firmware
 version
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <20250808085300.1403570-3-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250808085300.1403570-3-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2025 09:52, Jorge Ramirez-Ortiz wrote:
> Add support for specifying the minimum firmware version required for
> correct operation.
> 
> When set, the driver compares this value against the version reported by
> the firmware: if the firmware is older than required, driver
> initialization will fail.
> 
> The version check is performed before creating dynamic device tree
> nodes, to avoid the need for reverting nodes on failure.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c     | 40 +++++++++++---------
>   drivers/media/platform/qcom/venus/core.h     | 13 ++++---
>   drivers/media/platform/qcom/venus/firmware.c | 20 ++++++++++
>   drivers/media/platform/qcom/venus/firmware.h |  1 +
>   4 files changed, 51 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 4c049c694d9c..f45715c9b222 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -448,19 +448,9 @@ static int venus_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_runtime_disable;
>   
> -	if (core->res->dec_nodename || core->res->enc_nodename) {
> -		ret = venus_add_dynamic_nodes(core);
> -		if (ret)
> -			goto err_runtime_disable;
> -	}
> -
> -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> -	if (ret)
> -		goto err_remove_dynamic_nodes;
> -
>   	ret = venus_firmware_init(core);
>   	if (ret)
> -		goto err_of_depopulate;
> +		goto err_runtime_disable;
>   
>   	ret = venus_boot(core);
>   	if (ret)
> @@ -474,34 +464,48 @@ static int venus_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_venus_shutdown;
>   
> -	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
> +	ret = venus_firmware_check(core);
>   	if (ret)
>   		goto err_core_deinit;
>   
> +	if (core->res->dec_nodename || core->res->enc_nodename) {
> +		ret = venus_add_dynamic_nodes(core);
> +		if (ret)
> +			goto err_core_deinit;
> +	}
> +
> +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (ret)
> +		goto err_remove_dynamic_nodes;
> +
> +	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
> +	if (ret)
> +		goto err_of_depopulate;
> +
>   	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
>   	if (ret)
> -		goto err_core_deinit;
> +		goto err_of_depopulate;
>   
>   	ret = pm_runtime_put_sync(dev);
>   	if (ret) {
>   		pm_runtime_get_noresume(dev);
> -		goto err_core_deinit;
> +		goto err_of_depopulate;
>   	}
>   
>   	venus_dbgfs_init(core);
>   
>   	return 0;
>   
> +err_of_depopulate:
> +	of_platform_depopulate(dev);
> +err_remove_dynamic_nodes:
> +	venus_remove_dynamic_nodes(core);
>   err_core_deinit:
>   	hfi_core_deinit(core, false);
>   err_venus_shutdown:
>   	venus_shutdown(core);
>   err_firmware_deinit:
>   	venus_firmware_deinit(core);
> -err_of_depopulate:
> -	of_platform_depopulate(dev);
> -err_remove_dynamic_nodes:
> -	venus_remove_dynamic_nodes(core);
>   err_runtime_disable:
>   	pm_runtime_put_noidle(dev);
>   	pm_runtime_disable(dev);
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 5b1ba1c69adb..d1f0e9979ba4 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -58,6 +58,12 @@ enum vpu_version {
>   	VPU_VERSION_IRIS2_1,
>   };
>   
> +struct firmware_version {
> +	u32 major;
> +	u32 minor;
> +	u32 rev;
> +};
> +
>   struct venus_resources {
>   	u64 dma_mask;
>   	const struct freq_tbl *freq_tbl;
> @@ -94,6 +100,7 @@ struct venus_resources {
>   	const char *fwname;
>   	const char *enc_nodename;
>   	const char *dec_nodename;
> +	const struct firmware_version *min_fw;
>   };
>   
>   enum venus_fmt {
> @@ -231,11 +238,7 @@ struct venus_core {
>   	unsigned int core0_usage_count;
>   	unsigned int core1_usage_count;
>   	struct dentry *root;
> -	struct venus_img_version {
> -		u32 major;
> -		u32 minor;
> -		u32 rev;
> -	} venus_ver;
> +	struct firmware_version venus_ver;
>   	unsigned long dump_core;
>   	struct of_changeset *ocs;
>   	bool hwmode_dev;
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66d..3666675ae298 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -280,6 +280,26 @@ int venus_shutdown(struct venus_core *core)
>   	return ret;
>   }
>   
> +int venus_firmware_check(struct venus_core *core)
> +{
> +	const struct firmware_version *req = core->res->min_fw;
> +	const struct firmware_version *run = &core->venus_ver;
> +
> +	if (!req)
> +		return 0;
> +
> +	if (!is_fw_rev_or_newer(core, req->major, req->minor, req->rev))
> +		goto error;
> +
> +	return 0;
> +error:
> +	dev_err(core->dev, "Firmware v%d.%d.%d < v%d.%d.%d\n",
> +		run->major, run->minor, run->rev,
> +		req->major, req->minor, req->rev);
> +
> +	return -EINVAL;
> +}
> +
>   int venus_firmware_init(struct venus_core *core)
>   {
>   	struct platform_device_info info;
> diff --git a/drivers/media/platform/qcom/venus/firmware.h b/drivers/media/platform/qcom/venus/firmware.h
> index aaccd847fa30..ead39e3797f0 100644
> --- a/drivers/media/platform/qcom/venus/firmware.h
> +++ b/drivers/media/platform/qcom/venus/firmware.h
> @@ -9,6 +9,7 @@ struct device;
>   
>   int venus_firmware_init(struct venus_core *core);
>   void venus_firmware_deinit(struct venus_core *core);
> +int venus_firmware_check(struct venus_core *core);
>   int venus_boot(struct venus_core *core);
>   int venus_shutdown(struct venus_core *core);
>   int venus_set_hw_state(struct venus_core *core, bool suspend);

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

