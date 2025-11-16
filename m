Return-Path: <linux-media+bounces-47177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C67C61646
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 14:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E36F363B99
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 13:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4874930BF78;
	Sun, 16 Nov 2025 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mseYR7aG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA8B2F6193
	for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301067; cv=none; b=P47E7eqfCEpZE6VWyaU7kpJnW3X/+nbkbEBdrlgZeEQVBdwFGWTvh6ctcVk2xM77eWcvRmzGBr+FbWDUQPCKb6oQhs4WfLqLmf9A624Rj4iNksoiSL2NgvECgWrZm/YYGwzJv9DwYN1FW7hN6XYHLaAAMt7gadKCiPGzAFNYEnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301067; c=relaxed/simple;
	bh=V1n+LJA5i1SjQR9FdvRRnV0tQP7tF8RyRxKom7ry6WY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mv+1I/GG1LpVoL5VEWlezlz+0Y/Kei9U6bVw8V1ON5iHv/ISjDEz6ye2tL4N3UtOymA2v/QUbUIK1Fx+PbiUPw82UMqn4rVRxshuQeSSqFFdFXk9XqnpfpRfnNwvscLokXx5G4Y3q621Sz80Oj7L4l1aktCgLjFf+VUaq5e7ymA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mseYR7aG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso17809085e9.2
        for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 05:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763301052; x=1763905852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0jelCySNJRjeL9abbXxUbuVJfeDHR+NPC3QXWcw8gc=;
        b=mseYR7aGsUzy8bhayd6IvaJ8gW9uiDEi8uVHhZJIji13TScnqlUDNBuIkgyHEEiKb8
         s86Pa57jVTa0rQtsveWL8TeC3+vLlJCFPjuYOqI8AjRbtD04tbfK+B58dp1efQch/F3f
         erq3i2TR2m5Ji431+2YAMbWLqSi0fjL8RX0jonJjTpU2A1Ovfz9cja3uy6z5IBWYbyo4
         pAgf0aQc8pPhXkZ6gU+biDcO54nVh+3aTBYYhBMr8+cYBPUJiWUgJg5Egnnkyk3nwz8r
         ZgVuAvEAMmGAfOMhYrZhuNFRsHat6Zj0uE5FysS20fE+BxYH91y6MMaRZi4UByypFdJx
         7Mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763301052; x=1763905852;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0jelCySNJRjeL9abbXxUbuVJfeDHR+NPC3QXWcw8gc=;
        b=Dozps7oRjSm7kdhVmtJ81OiXEKArHkUX7MUtH8pczs1RTuUAiG5HtpqEhrEaonZxNi
         bL6gRI6WmTuXEHNK1E64ayoag/t5IjbypABn7ob0GjZmVVSg9YYH4gAVAR99tdd+VdjH
         rwXV5mLoMirVP6/Yj66w2vIpw3/9q7/digi68U+KnYrSV3lf2kr6jUXec5mYw+oI+ZNb
         DiUZl/Mm+t1zj4gbuRk+WT4fOvC6XmN7BrD5d7Xxh5l/hecOwmWBwaoWZv++JDbM5Oqq
         R2fnFBKxKPgtZb1KwLuz6qRlLMJFHUi18esOcWgBka05KCNGJDdSfqAMQ2kD/oNdn8Ff
         RKZg==
X-Forwarded-Encrypted: i=1; AJvYcCXDD7VJef3OJM/piwopmFiJ57sv2pYTfj892Fbz7rUwFM+b3Bub31ByHDHFfoXP4NT58ZMQBY5zuI/Tew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRJ7Fzw7gl7sAgAJUIudDjxazDY0WwG7yCjkEm9+lDWf+bp8F
	I34vqlsKVreKuKgPKYBLpVCAzMeGN4HBoZEz5DfDQztazRF0ocFyzonYqpi9kaeSNDg=
X-Gm-Gg: ASbGncuq+8AO+51X/oF2zxNDuzkDAfCM9/faRwdqsU/ZBWJPURUwp/cXrN+Egdm2saA
	pL79sdTUgnL4zQoA5VsitDI0b+iXC0jBWGknHV7pgH1e95vP2IyPb7BMWlXyYGCv0EY5Jxw3N8Q
	rl9phPYAXbUs88basYFWPXdc7jZozyOQ85Bj8lPy14qRPv1rZcNHD2jbNoaC5SDW2kC7PiSJF7O
	ZBMm2YGDQBymtiMVCyXHFoGW2RTDsrs27pBeYJ1gw2Muhm/Q4tVTLjnjBWYeOekOdnAB+0NH4S5
	V59mzwmIqJ8mB+KLIf6BcA43YvkEOwiyIeCSBeICy6clkNd5E/UjHDFCQdVUTj84givEMhhQTf6
	+A6IGCwdHgxh+AIyX7mnlJB9QsHQ37/JQTNk5ADhZq2rW9YtOF+Pbbq5/sRSRR13IKNcJ3Yfw8O
	B3LjO7XTjzsvUke0asN4FH4VkQ19uKn3nK3YY3bZW9sQ==
X-Google-Smtp-Source: AGHT+IEBK8bgeBGf5PObF2NIDJiaCvB/1jjccd33foRcuYt4fXtP1chRlWZw7plpAdkjaCYjw77Rzw==
X-Received: by 2002:a05:600c:3587:b0:471:672:3486 with SMTP id 5b1f17b1804b1-4778fe583fbmr86574485e9.15.1763301051970;
        Sun, 16 Nov 2025 05:50:51 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm256771775e9.3.2025.11.16.05.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 05:50:51 -0800 (PST)
Message-ID: <dfb0d172-44ab-4172-9768-792aab24ddf0@linaro.org>
Date: Sun, 16 Nov 2025 13:50:49 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] media: qcom: camss: csiphy: Add support for v2.4.0
 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-3-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-3-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.c          | 107 ++++++++++++++++++
>   2 files changed, 231 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 9b6a0535cdf8..5499f4141294 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -588,6 +588,123 @@ csiphy_lane_regs lane_regs_sm8550[] = {
>   	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
> +static const struct
> +csiphy_lane_regs lane_regs_kaanapali[] = {
> +	/* LN 0 */
> +	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0090, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x005C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0060, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN 2 */
> +	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0490, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x045C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0460, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN 4 */
> +	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0890, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0808, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x085C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0860, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN 6 */
> +	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C00, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C5C, 0x54, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C60, 0xFD, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
> +
> +	/* LN CLK */
> +	{0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0E08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
>   static const struct
>   csiphy_lane_regs lane_regs_x1e80100[] = {
> @@ -921,6 +1038,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> +	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
>   		ret = true;
>   		break;
> @@ -1030,6 +1148,12 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_regs = &lane_regs_sa8775p[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
>   		break;
> +	case CAMSS_KAANAPALI:
> +		regs->lane_regs = &lane_regs_kaanapali[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_kaanapali);
> +		regs->offset = 0x1000;
> +		regs->common_status_offset = 0x138;
> +		break;
>   	default:
>   		break;
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 658d9c9183d4..b12e79e40e97 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,111 @@
>   
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy0-0p8", "vdd-csiphy0-1p2" },
> +		.clock = { "csiphy0", "csiphy0_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdd-csiphy1-0p8", "vdd-csiphy1-1p2" },
> +		.clock = { "csiphy1", "csiphy1_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdd-csiphy2-0p8", "vdd-csiphy2-1p2" },
> +		.clock = { "csiphy2", "csiphy2_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = { "vdd-csiphy3-0p8", "vdd-csiphy3-1p2" },
> +		.clock = { "csiphy3", "csiphy3_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.id = 3,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = { "vdd-csiphy4-0p8", "vdd-csiphy4-1p2" },
> +		.clock = { "csiphy4", "csiphy4_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.id = 4,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY5 */
> +	{
> +		.regulators = { "vdd-csiphy5-0p8", "vdd-csiphy5-1p2" },
> +		.clock = { "csiphy5", "csiphy5_timer",
> +			   "cam_top_ahb", "cam_top_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy5" },
> +		.interrupt = { "csiphy5" },
> +		.csiphy = {
> +			.id = 5,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_kaanapali[] = {
>   	{
>   		.name = "ahb",
> @@ -4308,8 +4413,10 @@ static void camss_remove(struct platform_device *pdev)
>   static const struct camss_resources kaanapali_resources = {
>   	.version = CAMSS_KAANAPALI,
>   	.pd_name = "top",
> +	.csiphy_res = csiphy_res_kaanapali,
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>   };
>   
>   static const struct camss_resources msm8916_resources = {
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

