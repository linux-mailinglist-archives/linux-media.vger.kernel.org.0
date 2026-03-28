Return-Path: <linux-media+bounces-57438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP6LOUjDx2nPbwUAu9opvQ
	(envelope-from <linux-media+bounces-57438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 13:02:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D66834E4DF
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 13:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 474F7302A691
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5271A350D4F;
	Sat, 28 Mar 2026 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LtYV0j5G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DB92472AF
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699329; cv=none; b=U+XZJu5OnoROQXL2JQyI4nuJbio6EIwWOf514s1ycQ3Zmtar0bA5WLidlzanoweXUgW01MnNmAWGJs6ohf/aXu5GVQbx7x4cOz44oHmrMGSrz6vDkHBI3l21sDLNKY0imSQ96wFDnrprKmampb+F7836Pf7N7qx/ZkbKnmOM5QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699329; c=relaxed/simple;
	bh=uvVVub+gmQlPjulx8qodfzDWFFTVrM/t5QvQMJsmEao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECi+5NYFOoQ2vAHo3XcF6yd0F2NNlNi200UYeMZq1ELiYXaw3F4XoZFH3uEioYD2e/Jk4ILhUXYHEHCnXU9h49//GIflEgtW7USrqYqWUGffH5pzJLYITMcEA7Qtw7i/ZbooIowSUO74q2Uhz+SYm7Jvxx+qNzhj8E7qFUeDbf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LtYV0j5G; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b7481f9d3so1669194f8f.3
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774699327; x=1775304127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=si+LqWUeUzQbWuRX0yXTIaRmzGoM4iuF22tOkmbkOQQ=;
        b=LtYV0j5GahKTzqeGxujV4swdvlfL7UoMh21tzAIhYPkkQ7Vb23EHPQjEM36D+uO+yj
         Vm4uPXSWjaQewMZJKfBCPlH0BpQLnjjfKqu7x+VeUoEFA0jlVT81i3NYzuxBMEzYoI2+
         ifPb6PBjABj8gDghHK2sVoUS6iZx3Bnp0N8z4svpeyLM5YEyoWU2J1HalADSMtQeCY4l
         HASc9rugyZdPyX9CflgJ1wIHAi0R/KccBUHNHt3XQGTJHl94l+lT03MaOtTRnJbJQOts
         d2QSm4Uh37P8JrYTo4ltx8OkflPnMbAYw8gwuH76aIY2jDkvIc/q4BcLN6Xi2Ul+wZ0o
         Kqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774699327; x=1775304127;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=si+LqWUeUzQbWuRX0yXTIaRmzGoM4iuF22tOkmbkOQQ=;
        b=DfxR5kz4Zs8L0a9NJ/Db1AE1MtfoaPcH5bS3M+3htvFwtqMJUPXc5xc1IM2l8Xx5Sj
         KwxdSJYy9tk+UOOFYv/2if0oTmogmHGPkKsLh/C2GvzHftXgGRhuXq77DQXOVVLe7l8D
         xuLeAjpEbvADcPn6VtbrTzcFmNffdA285LrmVmikWCvoGt38A7jmBh4sTzz9I5Pc+pyi
         oJLMk6SwqF+XOhrn4wiEbqiLTsMO/VBZuy1ft82RVd0o/owz/OIzThQXsLvDgCz6tHzP
         TClvQayK8IsYTLduOD2Yn5dZaKHbIBuN47ajvUM8BqEeSV8IVszAvoqEu+tK70LOk7Ig
         7jXQ==
X-Gm-Message-State: AOJu0Yx5I1Ht6s14DRB6XR7i/Um5Gtepq5fCAD1Q6CsUGq1eRO4gLINP
	56kifQi2mJVDZqHGpM+8xbP+q8gRM9VGGyTsxIPWku6QwCUKFVJjSoJTNrDtfmcIyEY=
X-Gm-Gg: ATEYQzyUBiusPrX3d6g+iVQsKIGbTgRGUmGsRbGFTV5Fggjuk0qCG9pBFPKoxnp271z
	8AmX0DtJ9snOKoEw3+zG8JwpE4HZgPjPLLwJD+M2OUUZsppVh6HxRuyAP+nAOi5LY9WkL9VgLVp
	7zBP0Ek4FNHa3y+LAkEDFIR1G0vLVWMHE1p9t+N4/JS6RHipiGzn1GPwHv9+tbegMwgo7sj1Q6d
	DM+3TEab5gjCyWqNb81wgWeyMwba+bViIy9YHGZXGRtHfwBiyZLe1aF6eTJGOV8/MbQW0Aw912J
	i3b9nPVJMmt4z3EcZ33F3R0HcTbtt/uG4UGghF/Aqxp7PqfN55HGUgFbZ+grcvZyRIxRcFY9Gkx
	Y7m/o1i7J54oZN0XOyV87Y30Lz/YhSr8QRSB+44haHkoIpcRFODUUujM7uC3DMNv4wX920bkkLr
	zFLmKVf1SYSYWKtcTQ81lBKUJ5X4FQz09RO8s=
X-Received: by 2002:a05:6000:144d:b0:43b:94d0:4d8 with SMTP id ffacd0b85a97d-43b9ea4af78mr10369975f8f.34.1774699326323;
        Sat, 28 Mar 2026 05:02:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.108.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2580194sm3855810f8f.37.2026.03.28.05.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 05:02:05 -0700 (PDT)
Message-ID: <417a34c5-6c51-4c5d-8796-7212e566c23e@linaro.org>
Date: Sat, 28 Mar 2026 12:02:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Fix csid clock configuration
 for sa8775p
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
 <20260313-vfelite_fix-v2-2-7014429c8345@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260313-vfelite_fix-v2-2-7014429c8345@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57438-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D66834E4DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 10:13, Wenmeng Liu wrote:
> Fix the mismatch between clock list and clock rate table for CSID lite
> instances. The current implementation has 5 clocks defined but only 2
> are actually needed (vfe_lite_csid and vfe_lite_cphy_rx), while the
> clock rate table doesn't match this configuration.
> 
> Update both clock list and rate table to maintain consistency:
> - Remove unused clocks: cpas_vfe_lite, vfe_lite_ahb, vfe_lite
> - Update clock rate table to match the remaining two clocks
> 
> Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 40 ++++++++++++-------------------
>   1 file changed, 15 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd89871ffaee9cb2b2db6538e1d70d..cb013471898506f483e5b2779cfd4f679dc083e8 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3598,12 +3598,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID2 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite0" },
>   		.interrupt = { "csid_lite0" },
> @@ -3617,12 +3615,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID3 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite1" },
>   		.interrupt = { "csid_lite1" },
> @@ -3636,12 +3632,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID4 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite2" },
>   		.interrupt = { "csid_lite2" },
> @@ -3655,12 +3649,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID5 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite3" },
>   		.interrupt = { "csid_lite3" },
> @@ -3674,12 +3666,10 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	/* CSID6 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> -			   "vfe_lite"},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>   		.clock_rate = {
> -			{ 0, 0, 400000000, 400000000, 0},
> -			{ 0, 0, 400000000, 480000000, 0}
> +			{ 400000000, 480000000 },
> +			{ 400000000, 480000000 }
>   		},
>   		.reg = { "csid_lite4" },
>   		.interrupt = { "csid_lite4" },
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

