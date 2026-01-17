Return-Path: <linux-media+bounces-50965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9DD39141
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 22:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32F8A3019BE7
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 21:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B072DA75B;
	Sat, 17 Jan 2026 21:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXlNgR3b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4C82DC331
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686867; cv=none; b=S1ilF9PTWRo6pEaZyc4TNDdoF5Ky6PAvqgZdqTH+hZ2EV2vhSgG9ffCHZkqK3Ncp4PDGbCqXFGhv3+Cl0vu+nb1oILclxpgrkFPLyGbBqfXsXfnrfHmFKrH4mc8lvlt6lxorq5kCGIpxmxalHfghYHOsc7jyB3nxOcaFoJ9cFzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686867; c=relaxed/simple;
	bh=61farPWAS3rdz5Y29Ms/plzBMDmfaogO+QU+97XcWXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwpjiZYXlSPZ768Za3g4tj6GpIe5br7B/oAKK/xNC4wq7eTLlXIqLdolzCfMXCTs8oB77NPYPzCn2O4YyyOER1MBg9mw9SnhEhYWkAcP4QSn6ESrWajcKCRsGESe5E4+woNnusyaQfrbJW0iGrCRLfH9AAH2GqUUpIONM/jd3tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hXlNgR3b; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801c314c84so17488745e9.0
        for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 13:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768686864; x=1769291664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwPNYfeXiQuitQb++/nMJ12hS+N4b8LejrqLKmJ1Kx8=;
        b=hXlNgR3barPPKa/aL5zVbt7XW8e/0iu5L6x7pnN9dGm7rinFAK0FBwMbD5K8+hWm+0
         FC/iUTkndob1IZDmLNln/UeDyr3r5bBgVv4/iT0xRhdiUFrXyTwLLReSt9KpOm36mSLc
         /GBD9oYMlVvg8MhS6qfGWb6KjcrHIEtbIwBXApmH0gzdeiV7zifF2I/VTXe92WUB6ch+
         hLIiee6yOpNBcDflBG5rHejvF+rL9g98u2NcOSLCXw0dE8yaB8k+ycuz2y8hBvxB1VjQ
         BEabnDHwCsWfFLRHs7WzIr9z7XkD3dFLQoQeENNUT2zsiuRvPtUHhvfw7IGOAaEKw9rn
         3jxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686864; x=1769291664;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwPNYfeXiQuitQb++/nMJ12hS+N4b8LejrqLKmJ1Kx8=;
        b=TkwwAVQYlQHqEnWVAskFXeHByQVAc3k8T9TG+B+P/WzxG3YpkqcHmR8Pp9BzW74aw8
         mXSMarUt2zwqMr6oDbMB3pmr5sBSjUcVs4/Zx/RTPxKZCmzsZm8yilzpNuduyQgZFeL7
         j7bJ5Fdo0Bt/RVodsaEhSCzOs6tkhOy1cbK21cT0wY7j6Oooh8SPTBNfLj6ygcdGG+eT
         Bi2nuYdqQkkIwmGGARvfvKDkdB66sSi0XGljbRGXRyz5XKVn8Rr6uzee2Ybsk3ia83MQ
         4Ew/EKPnISIE7HljxZ/PYmi9MvhiuC5z5+VG9hgKVF4krkXWfuA9Kaln2Hp1sPbUGVeL
         04Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVrzn7MlXlO0G/wFobaUjxhGFXd+sniSrp7wlt2ik0+xRWjV6daXloKsEqO9eH7/+64KQhTro8bbVtpPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu2Rz6lZGCMb1Z38l4URvXrl1/uFrqwQ0Yg/04fF1HIpeKufCh
	ULhWxVA6WebLWUvFVnLXvhh4Nn5QfhW8t1GzLDIWRkdtaMdEeWa8PBzY37xmQKllDfs=
X-Gm-Gg: AY/fxX644QIm/L5U3m/B/pKZCLlQZVLkhbjyTFkxAlY5+qfzygNbvHZ/3vJRaBE8hyS
	1c+Qfkp9kQI2VKOG7qwym/E0v2xLvCEcE5683HaaYoj2lm02IlbtLgOp5aG6Tlfq3hZEm36yVgc
	YsRxnXj2sN5gMnwZhgOmrotVjz/CvuTizAt46V61NMH5/12GxhQ8Sbtoyxoax5SNcDhpEMcWiUP
	Ae+MWw72Ha0ugYaEWqzzvMT89wV96S09fKc/W/IiCjoEU6h1QO6ryJKphby+xCHU79qJivsMZuQ
	+TBQBK3USrU9CMfOf+xnTxalrCOTpqAGF4ia/YnvDqTh5msdCehbhrDv7JbY8AmU1W0tm3GTdGN
	c73oXBnUNgJ3DEIf5IPSlrWLdO8AloRweGi12fIAdB/NjnPbEealy3h4AeqgSrZwbQaxyskmfcp
	jqU8XkthDEhNtp9yrYv/Oh/n0f7xsgmBiiKz4Hb3+K3PR6hSYrLape
X-Received: by 2002:a05:600d:6413:10b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-4801e400518mr65526585e9.29.1768686864184;
        Sat, 17 Jan 2026 13:54:24 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm14234007f8f.31.2026.01.17.13.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:54:23 -0800 (PST)
Message-ID: <25313d70-2d7b-483a-b1cf-493f0697c6cd@linaro.org>
Date: Sat, 17 Jan 2026 21:54:19 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs own
 lane configuration
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
 <20260117-qcom-cphy-v3-7-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-7-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Catch when C-PHY configuration gets used on SoC with CAMSS missing C-PHY
> configuration lane registers.
> 
> Hopefully this check will disappear as these lane regs gets populated.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index d82a88dad74b5..89bfe3710fc3a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1217,6 +1217,22 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	u8 val;
>   	int i;
>   
> +	if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +		switch (csiphy->camss->res->version) {
> +		case CAMSS_2290:
> +		case CAMSS_8280XP:
> +		case CAMSS_X1E80100:
> +		case CAMSS_8550:
> +		case CAMSS_8650:
> +		case CAMSS_8300:
> +		case CAMSS_8775P:
> +			dev_err(dev, "Missing lane_regs definition for C-PHY\n");
> +			return -EINVAL;
> +		default:
> +			break;
> +		}
> +	}
> +
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
>   		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> 

Proliferating special cases in switch statements on a per-SoC basis is 
verboten.

Please find another way to do this, you already have a bool to indicate 
cphy in struct csid_phy_config {} so at some level CAMSS already has a 
bool to indicate what to do.

Please make that logic accessible to logical consumers throughout, in 
this case the CPHY code.

---
bod

