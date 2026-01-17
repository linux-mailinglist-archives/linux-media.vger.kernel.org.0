Return-Path: <linux-media+bounces-50961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9A8D3912B
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 22:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABE0930161B0
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 21:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506212ED869;
	Sat, 17 Jan 2026 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anMYnoCD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417FF2E0412
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685960; cv=none; b=o4ItlJiCMBbWNZdGEkyMxSMj09d6lsCvDDZnHS33cDLSDKUxKuCeNIVXyzfXlcwZBsSJqC+k6ygAX0QHk0oueqaVJWvMymgBLy2hN9zqPw4tGaaeRTH0VVj6YASVHZoOrGWaMnsiKq0MRZjohOBGJLKqM0NNqls50cJ2O3GyZhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685960; c=relaxed/simple;
	bh=bQQpwrCGrpO5QyLkGXEZAd9BSGvrhb7OYadOB8Pl6dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTMAB640x+l3aT7UBxzRuLDOEYEHVyVgHQaNb+AVK9yJMf8TpZcKcLgKXAPeimPYw79kRtgvEiexBxf02Ecbw9IaC765XUKKypeerVr9xn8BM5xj0AM4NSWMdiHUZfPQ/JJ5UFe39XkLJ/sGM474+X6srxLubEAwNTQic1I34Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anMYnoCD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43277900fb4so1903551f8f.1
        for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 13:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768685957; x=1769290757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bD2NimiMGHu9BwaTt8RzFFLJsSh/fccLMhaDQFOrDmk=;
        b=anMYnoCDyVylagM7GI5k8NsI7/jGscbHon/60P3i7udwmcKFfDMDVEPA+HnRibA8NV
         aKytr/eIX9V9QxwfuJXFyG2SJ8iULMJHDy5WJMSY7vFlYAFQTNrkc1wZ+/lnWsCDYiSw
         m7qwYl9XnGH6LCyqTPXgcFxUA4BARr//fdCIFSN3w/xsPFKwJsME4c+9X21fBBM9xDvy
         TK0dE1nwraOCCnoDvw19QAQsZ8coMs/ANswegx0HC+hgMeVAcaH1PG+TMqpPXDxAwK9F
         aaLm9+bbBrx820+ANFW0ue65uyLLNqB99fFVxzeFri/RSchAF3GvOPn+KeIWjLzQ8B7g
         3QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768685957; x=1769290757;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bD2NimiMGHu9BwaTt8RzFFLJsSh/fccLMhaDQFOrDmk=;
        b=BT6jiZADJarGkljIO07F0eZf5rp5/SU8PmqZni0On7AM5x3pZkAq0C+/+RzbF8eGbi
         KF9eX2es9WF73eorfEoBM0zuGa3EMp4jMZNVlHWWTT7xMQ5fxGwqRtrUqoPcyURL5fRG
         F+wKZAc8TNSV7+f5L1wSJhBy4ce0BQGzSqdqyT3l+0P7VyXo1gySbg2v/tf06rylGGgE
         gDFIR3Yf+yfxmoUufssROFZF27rEYkKunUhh63f1fwM1SCfch7CEKwmjjnBlYbsQT+Ik
         SJTg834x8+1tAU6WpLgM2sMznGJYPKyu2dx5fFLbmAPnB9UR3NTQFf7WS+fVs/F1NUmf
         pHbg==
X-Forwarded-Encrypted: i=1; AJvYcCV8NAwGSeAhK9PrVK5aD/kGNEsnVREfoGVy2i4yxir5kHsoRBUSDB34JhB0IsDrWKCxWnj8Bv+rxDQFPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfPjcpSpSnecJ7kiGqVRET3RsIDq5LvEDSpXj5k0V/y7/EhTX
	gDw8DauIXnnP1v2d64En5GQTyHNRG3sRAIn3hg5lyVx8kYHOmDxfuaSifFJQ+pb84AQ=
X-Gm-Gg: AY/fxX4Utn5PaBlPc+q1oWDK0jpfe0vVxpJQePPCNFCwKPasPkxLXFh0w7wGzkummpy
	2xwDPmiZy4a7oqI9YOsnfxM1qJUn43jI3xXKeLbhNzxcGLEDuOLwMd8Scmg/b9rlgofAl8q/R4k
	lrP7FfOB9QbjJYTitcnk2aUHWt3xK4v9hodQ5cCwUpb0OKBJGNQt5kTJTTRYUlp1hWsbYc7Juys
	VHcQcAoJVWx1HTaaKJNE2M5KHqZlGNMB3sThSwmoPcYc2sda2zRVmxvbo2QfbM535ea69jXn4A8
	hHRWS7h3J6Wk02XLK7s6dCk1zTdpRT7WbdZsHWzFdnYztD3aKNbuByYYB6Ue7XrtyJIiiQzHpbB
	75jGHHxftTMG2ZI9g7UUi+f7uRKwfnGyG0HC6TtGAaRcaGIbr+yJEzghhNYiq2XGMyht1gFSSg1
	RvGv7A6udKaGI21Osa1t26kFQAoiy0GYx5dR18t/RV1g0B3mo7j9sV
X-Received: by 2002:a05:6000:18a8:b0:431:cf0:2e8b with SMTP id ffacd0b85a97d-4356957840cmr9582526f8f.29.1768685957500;
        Sat, 17 Jan 2026 13:39:17 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435696fbea8sm13316568f8f.0.2026.01.17.13.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:39:16 -0800 (PST)
Message-ID: <7c561993-ab7b-4ddb-a36a-47a000d5d435@linaro.org>
Date: Sat, 17 Jan 2026 21:39:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] media: qcom: camss: Prepare CSID for C-PHY support
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-3-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-3-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Inherit C-PHY information from CSIPHY, so we can configure CSID
> properly.
> 
> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>   drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>   drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 2a1746dcc1c5b..033036ae28a4f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
>   	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>   	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
>   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
>   
>   	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index ed1820488c987..b50b0cfe280c1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1275,6 +1275,7 @@ static int csid_link_setup(struct media_entity *entity,
>   		csid->phy.csiphy_id = csiphy->id;
>   
>   		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
> +		csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
>   		csid->phy.lane_cnt = lane_cfg->num_data;
>   		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index aedc96ed84b2f..a82db31bd2335 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -70,6 +70,7 @@ struct csid_phy_config {
>   	u32 lane_assign;
>   	u32 en_vc;
>   	u8 need_vc_update;
> +	bool cphy;
>   };
>   
>   struct csid_device;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

