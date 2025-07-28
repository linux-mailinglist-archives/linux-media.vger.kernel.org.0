Return-Path: <linux-media+bounces-38582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C517B13E26
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 17:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D974B7A30DA
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF5E27147C;
	Mon, 28 Jul 2025 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VaCNnd8B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B651813D51E
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753716005; cv=none; b=TC9lDZ9DJYfNKYjRpPzB3aVvWOJP2QjcpCSfOLJzMvd9wPQXjpVQoxDcvBHnJ8Nte3EJ/toisLe5iiFxhG/auko6KbmdVO6fDgHvmhtaZAcE//P37H6pr//FtewVwCrO8t5GA7PWlfI6Wbj6TCBQs/oxe0m5syqJvaANg/rcppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753716005; c=relaxed/simple;
	bh=LNQzmDVPXFAc/zMEWuShx2jfF/wSMyxK4QbpQtkKNT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8BPOE1AL1ZqZz0IgseqP6AWyTTX+NV792oeSvpoIOKiVY4hG2l/AaczcES3vW2y+jAUxh+YRvpF10bBQZZlg5ZtrN2eIo1GgMuxsy6iQ7lw31OWZxNIHJIicIvo9LftR6klVElBR8dxYzJOdl+fNCLdK/CG7acY0v/nqSSSsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VaCNnd8B; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso3641182f8f.1
        for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753716002; x=1754320802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3M6HADrcbiuvKh0/Kz/xLBlEH+H9X+k3yVRG8+8/+Q=;
        b=VaCNnd8B13QkdvW4H1B7XUKe7Y+5foeI89AyRUEBoGCNA1XvZrQX5hUN+CQ1S+oipw
         MAUVC6a8fwMRTk//OUP2+o0K1ZmgiWCERe+kkQA7HzhVXpy2Vgxt1NJW1l46Zkw9+vGz
         n7rtycULtrZuD8m8DjIvrEHuX3Y1wjZzmTDS8//AxanVbiAzB6YyhuDVWxYQtS6acU58
         6LIoE131Y5rsnbXohQyRRNGghQfUxjECyvEQ6sFENwUnzqY//ZA/s0TxN2/1I9KsCfiy
         sOTm5YHtkijGf3M/KCV3MCXGyea7fab3fNvpA7+zQ6ZKZJTWvUxZ+BCsQXqDOKhd4FRD
         ttAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753716002; x=1754320802;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3M6HADrcbiuvKh0/Kz/xLBlEH+H9X+k3yVRG8+8/+Q=;
        b=rr/H3G54iUE9lnwYsFxwszsJoVo6uvVYMTou5yMppnkzd5tT5z9myBPFz/VkAv4A4O
         shqlGu66Ag8yVhTZ6MsymbfocA7QUh9A5tAs/GbTMVIAQknXt5DzfUfhHH0910FePgjl
         AxrIn9rl4olwpAcfBFFIdUSQjpSG3hmPY0WSYOhgqxIXXTLt4KxqGfoFRZD/grijXhZ5
         nOehT9thl/LmTxmZ6w0CBIVvYMKKA2J0J9aQzWH5htRrU2oG3VchTRgUgMqhALxC7uXD
         OKs5V68MFOomjkJPK8f38W6s0LpZNMKTSIp4Rw03twkYFMekaxMb4RiBNj02U3srZo4J
         gy4Q==
X-Gm-Message-State: AOJu0YznRCV3KggVQ907JSR6DedfOwZqXP6O2WEqzeLUA1SuDDKvvEOH
	XzsumJoCddhEUXDXVliaZC83le7GEHCs6zKRZGZcG3wkDgdjJ9K2HjK6Kp6Wloe1duc=
X-Gm-Gg: ASbGncsctKCZkdIBDMUcfqGypfVKl0VIVL+GknvcObRsp5NlYOFetaMCvKT3kJNQgaT
	f+2b1NmouoMJfy9TDmvTmiqGeZMfgqFar7LG7ISVQxYjBM+G1GiOtadXMMroA/8XgxF/32LdFg4
	Ecref0iIdbHI/O3sx48YUkGRqSRmmmZVZXHTK5edbGu3OdGhPVH/Dig81dMTDv2SOAmuY2psp9d
	sHbnn2Y23/xvEMZrfRcrB6GyHpJruxEpNYS7eqGr5zIoJ80djqPnDo/26JtU8GF17fO8+0BHbej
	ejd3gjSl1/2iUgCW/DN7oZtpsdjXYjZTmWOFfIEAS7LWqfCLGnws5RITGqHadWyU3WtLfHGIC+1
	s0vy194zBM2Uv27fQKbb+wBR/i0814b1mvMd5Oz1+7ATxkKEm0HPEatiWe18Sp5M=
X-Google-Smtp-Source: AGHT+IHuFxUfNvgAlegftl8WivsnpjLThvsD/neUVLJFPFSoDoKmpaGfm37Dy5WdZFowr4b1ZggyxQ==
X-Received: by 2002:a05:6000:4211:b0:3b7:73b5:e96d with SMTP id ffacd0b85a97d-3b776725608mr8244540f8f.15.1753716001775;
        Mon, 28 Jul 2025 08:20:01 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778ec36bcsm8929728f8f.37.2025.07.28.08.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 08:20:01 -0700 (PDT)
Message-ID: <6dc33f02-6691-4ad8-b04f-423e4e5caea8@linaro.org>
Date: Mon, 28 Jul 2025 16:20:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: pm_helpers: add fallback for the
 opp-table
To: Renjiang Han <quic_renjiang@quicinc.com>, quic_qiweil@quicinc.com,
 quic_wangaow@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250724-fallback_of_opp_table-v2-1-2fc61f2407dc@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250724-fallback_of_opp_table-v2-1-2fc61f2407dc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/07/2025 08:53, Renjiang Han wrote:
> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
> do not include an opp-table and have not configured opp-pmdomain, they
> still need to use the frequencies defined in the driver's freq_tbl.
> 
> Both core_power_v1 and core_power_v4 functions require core_clks_enable
> function during POWER_ON. Therefore, in the core_clks_enable function,
> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
> it needs to fall back to the freq_tbl to retrieve the frequency.
> 
> Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for the frequency")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
> contain an opp-table and have not configured opp-pmdomain, they still
> need to use the frequencies defined in the driver's freq_tbl.
> 
> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
> retrieve the frequency.
> 
> Validated this series on QCS615 and msm8916.
> ---
> Changes in v2:
> - 1. Update the returned error value as per the feedback.
> - Link to v1: https://lore.kernel.org/r/20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390..77c12273dbb9505244e260fc8fa635e4fe045236 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -40,6 +40,8 @@ static int core_clks_get(struct venus_core *core)
>   
>   static int core_clks_enable(struct venus_core *core)
>   {
> +	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
> +	unsigned int freq_tbl_size = core->res->freq_tbl_size;
>   	const struct venus_resources *res = core->res;
>   	struct device *dev = core->dev;
>   	unsigned long freq = 0;
> @@ -48,7 +50,14 @@ static int core_clks_enable(struct venus_core *core)
>   	int ret;
>   
>   	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> -	dev_pm_opp_put(opp);
> +	if (IS_ERR(opp)) {
> +		if (!freq_tbl)
> +			return -ENODEV;
> +		freq = freq_tbl[freq_tbl_size - 1].freq;
> +	} else {
> +		dev_pm_opp_put(opp);
> +	}
> +
>   
>   	for (i = 0; i < res->clks_num; i++) {
>   		if (IS_V6(core)) {
> 
> ---
> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> change-id: 20250721-fallback_of_opp_table-4ea39376f617
> 
> Best regards,

Note to self add a

Closes: CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com

---
bod

