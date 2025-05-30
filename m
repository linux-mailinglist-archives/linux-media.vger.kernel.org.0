Return-Path: <linux-media+bounces-33709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8B5AC9688
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 22:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6675B504773
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 20:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2BB2820C6;
	Fri, 30 May 2025 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwLaF4YX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6298D22B8C6
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 20:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636805; cv=none; b=VkjoUArlwWkA2cEisQV6f3R9/JR6CO0hQQf/SwdhI/GIu2SRmeUtdvzITfc6HV7TZ5516iC7Vx92hHptMDsIh3CgaBMtA7hyC8QlN6l0JGFnrbPI1x6BJcGFyeFponiv/O5ju48tFfTZkEf/VuzKRR0VMWQdGKF/4WH6ofXqr78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636805; c=relaxed/simple;
	bh=UbC2ciAwBnXn3leWtQ8ADE+eX3jl61pPiAdh+E1mrx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXi97F2K01qA7ldZ4iRtgCksZalO4nq0tZ+ESbwcirP42/dLP2xtPxnnBL7qxE8LtLSKdXNi+/QQeFWNI5CtAvlN6hnTGN82Fyacf9gj1hwn27Zntpb/JhvD8gL7qqA72KAZstNapjJYfolqV01GuEbD2FxNY7Irf91hHZAi+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwLaF4YX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAavrC024051
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 20:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Smv5QWNwygSvZBVOmLYL3h4
	69JjSVp7Jf4WZWmUL3Y=; b=jwLaF4YX7rih8RAmco5UlwNGxmCbwx0bmdvHL62H
	safGvXEkAV536kdCF0Y676trAumd4gfdM7ovwvrDNxMgO0VVa4uSd+xJWaYnE3QM
	HfC0w/4qu9hVQpEcgKPcBAeRQrYGcAEFTIe6hly9GdAsVOWIfSkeqrhU0byI1Lmf
	OxbE16Le4w3tOWheuyOJoFR/Z/HSmihxnTq0a6MaT6bj2yOyQ1/dAqA8Ewj2Mjqs
	wWm+0HWkh0/rScJ7+TgmTbSXU1qQYomMNrVITwSA48E73U4RQ5v7TqILvQm20kge
	t88C6MDoh3tQ5HvLlPOxwrrENYRMq3hfZAFnPX8/TNltlg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d7f3n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 20:26:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso385090185a.2
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 13:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636801; x=1749241601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Smv5QWNwygSvZBVOmLYL3h469JjSVp7Jf4WZWmUL3Y=;
        b=d7pPUmeztewlQViy6xRTD6pBVGW/PhMKBEe3eH7tN8NdCkys3TMcGEAjk6jGEu8kar
         6srSiLlbaNMUxNw82uNQ2C2jdbHpr9rKRLCwdoVy9LEzSGg+k/bakBkQTmi0qr3GQ5JW
         zfuF6KzSIs/wwVQH1w8uV5EBH/kATCKeN5V8bZ315HI7XaFF7lSQbbSyCBQcQdDw1fdY
         ZEPm8TGD0kjYH+KmhJOC0wCh2CSSJOd3eounhcvtMuLot2vvCD7+UD8HNpxteQ9rHzLE
         c7TzvkukmDWbcVrnHbBU7TGiQvjqfV25ETBjHLFrWPIfvgRNd+8mgVSyN+azwQ8bsGpp
         wwLA==
X-Forwarded-Encrypted: i=1; AJvYcCXZGbyrlxkPdCQzwivi8xheSW4cYPrw3QAJZCcCdtRbbFV0ZyHCV9V1JcbxKpd53n2/E5NMJVesw+FzBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF527yATa0C9PPTdm10Y0V760atXoDIbpRmhju2iow9LxcFYD1
	IXaX6uak2h6CVyRGc87tn5Wgi4yeoptAH+UBwdY8ffSWHfj+7mGsvlYY6hSvbFOtK0FAInZJeoV
	hTfJSe8yemvPW45sahB8VwU0tKHtNMMCWoEgjwfQJf4udW+Xulu50DPHBz6HhYJ6H3w==
X-Gm-Gg: ASbGnctjOH9O6sCdaDyMyXaHn7EOQdGFOwLzSIOyLZbQHytd16XSmytDNihMYvgD+7h
	euJJhSpNW4P4tSvgBEG9ySamxDjwr5sPriF02OddlYLNSbyFd7t8tfAe/sWy7bdxzQg0Z4lTCGJ
	8JZEDiVGMQl06CSJrnIECChxtw4ZIbdtgFPLnRCT6CQfPA4fqC6p1hv/cLggPC60DlP4UmSLQds
	Utg9YPvLWhI6uRU+pFYtZ+Fz0YX9sbM137uCQCtMlYPYqMq5hsj0pa0pnFSXz6luFlQyRilMG5R
	9/5NlurpUrPvw2DRDtJ2Qo+HdJ3uss1LGoXm9eZoX86m2OE7T9gZ4HmsvrI7vPvA7O2qf6g074s
	=
X-Received: by 2002:a05:620a:2789:b0:7d0:96d9:f8c3 with SMTP id af79cd13be357-7d0a1feb55dmr653462285a.34.1748636801206;
        Fri, 30 May 2025 13:26:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIWZaLbiNV5l4FpFBJv9XiFQqN5ZB1DIRxf8JfhoR2XVZtRVyRKE7qzxT+Kk2KYko6yQKGew==
X-Received: by 2002:a05:620a:2789:b0:7d0:96d9:f8c3 with SMTP id af79cd13be357-7d0a1feb55dmr653458785a.34.1748636800784;
        Fri, 30 May 2025 13:26:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910f0dsm831084e87.119.2025.05.30.13.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:26:40 -0700 (PDT)
Date: Fri, 30 May 2025 23:26:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/3] media: venus: pm_helpers: use opp-table for the
 frequency
Message-ID: <pyaoow6swlbazljgvav2vghixmb7swd4nkahqvxnhd6gsde26f@myhtwp72qxz7>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
X-Proofpoint-GUID: FBq0hFCk4jOpAG1LtTk5tRxMo0CYQ5Qf
X-Proofpoint-ORIG-GUID: FBq0hFCk4jOpAG1LtTk5tRxMo0CYQ5Qf
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=683a1482 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=4WTgWidf2JFRtI-FBxYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MiBTYWx0ZWRfX/mtVxCERLL6N
 NzLC90vQ3Ruu8zE9Ct2wz0soVfaaFUgZULl3IQeBfMdvv2OAXP8rb3PACwDNzTVghsg4Z7TnrGZ
 2nwp/IgjUdlc3z6f6YNX+PINzAWmiBOMmcrZZI2JcQUn/4pnh0++eWFdr5bv7qf1X4FkYMo9Wju
 ulfmavfhJd9NHbFcQ+0qcS8eT2S5p/vASyqarvghcnZhQ8IqM4YefZ3nGSlmbWhZYQd9L6+cIgb
 SW9UKdCuOflSXkeTePNNkRYaGiZgU1hjsKCUZUsIYjabI48I4ho11AKGYctj1/lDKhJxh70ulB3
 uG3/yOjWqoufNAuMW4Z+pwETQWPMBPoGqES4jCoschZSwq6e5FxaD37FyRgk3aOcd5q+Ijw+N8v
 o+5Kr7UNsRFizPk65GHRZK7h1VGmpLWgskhao4gEF7RdVTzu0my8SyKwqio3Ht8a6YLxkfmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300182

On Fri, May 30, 2025 at 09:32:13AM +0530, Renjiang Han wrote:
> The frequency value in the opp-table in the device tree and the freq_tbl
> in the driver are the same.
> 
> Therefore, update pm_helpers.c to use the opp-table for frequency values
> for the v4 core.

You are kind of missing the linking between the first two sentences. "The
tables are the same, so use the second one." You need to explain that
some of the platforms (provide examples) use the same core, but
different frequency tables. Using OPP tables allows us to abstract core
description from the frequency data and use fallback compatibles.

> If getting data from the opp table fails, fall back to using the frequency
> table.
> 
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 53 +++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 409aa9bd0b5d099c993eedb03177ec5ed918b4a0..434dd66076e8faf7f3feac6c29152789f8d2f81b 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -43,14 +43,20 @@ static int core_clks_enable(struct venus_core *core)
>  	const struct venus_resources *res = core->res;
>  	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>  	unsigned int freq_tbl_size = core->res->freq_tbl_size;
> +	struct device *dev = core->dev;
> +	struct dev_pm_opp *opp;
>  	unsigned long freq;
>  	unsigned int i;
>  	int ret;
>  
> -	if (!freq_tbl)
> -		return -EINVAL;
> -
> -	freq = freq_tbl[freq_tbl_size - 1].freq;
> +	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> +	if (IS_ERR(opp)) {
> +		if (!freq_tbl)
> +			return -EINVAL;
> +		freq = freq_tbl[freq_tbl_size - 1].freq;
> +	} else {
> +		dev_pm_opp_put(opp);
> +	}
>  
>  	for (i = 0; i < res->clks_num; i++) {
>  		if (IS_V6(core)) {
> @@ -631,12 +637,15 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool lo
>  
>  static int decide_core(struct venus_inst *inst)
>  {
> +	const struct freq_tbl *freq_tbl = inst->core->res->freq_tbl;
>  	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>  	struct venus_core *core = inst->core;
>  	u32 min_coreid, min_load, cur_inst_load;
>  	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
>  	struct hfi_videocores_usage_type cu;
> -	unsigned long max_freq;
> +	unsigned long max_freq = ULONG_MAX;
> +	struct device *dev = core->dev;
> +	struct dev_pm_opp *opp;
>  	int ret = 0;
>  
>  	if (legacy_binding) {
> @@ -659,7 +668,11 @@ static int decide_core(struct venus_inst *inst)
>  	cur_inst_lp_load *= inst->clk_data.low_power_freq;
>  	/*TODO : divide this inst->load by work_route */
>  
> -	max_freq = core->res->freq_tbl[0].freq;
> +	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +	if (IS_ERR(opp))
> +		max_freq = freq_tbl[0].freq;
> +	else
> +		dev_pm_opp_put(opp);
>  
>  	min_loaded_core(inst, &min_coreid, &min_load, false);
>  	min_loaded_core(inst, &min_lp_coreid, &min_lp_load, true);
> @@ -1082,7 +1095,9 @@ static int load_scale_v4(struct venus_inst *inst)
>  	unsigned int num_rows = core->res->freq_tbl_size;
>  	struct device *dev = core->dev;
>  	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
> +	unsigned long max_freq = ULONG_MAX;
>  	unsigned long filled_len = 0;
> +	struct dev_pm_opp *opp;
>  	int i, ret = 0;
>  
>  	for (i = 0; i < inst->num_input_bufs; i++)
> @@ -1108,19 +1123,29 @@ static int load_scale_v4(struct venus_inst *inst)
>  
>  	freq = max(freq_core1, freq_core2);
>  
> -	if (freq > table[0].freq) {
> -		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
> -			freq, table[0].freq);
> +	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +	if (IS_ERR(opp))
> +		max_freq = table[0].freq;
> +	else
> +		dev_pm_opp_put(opp);
>  
> -		freq = table[0].freq;
> +	if (freq > max_freq) {
> +		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
> +			freq, max_freq);
> +		freq = max_freq;
>  		goto set_freq;
>  	}
>  
> -	for (i = num_rows - 1 ; i >= 0; i--) {
> -		if (freq <= table[i].freq) {
> -			freq = table[i].freq;
> -			break;
> +	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> +	if (IS_ERR(opp)) {
> +		for (i = num_rows - 1 ; i >= 0; i--) {
> +			if (freq <= table[i].freq) {
> +				freq = table[i].freq;
> +				break;
> +			}
>  		}
> +	} else {
> +		dev_pm_opp_put(opp);
>  	}
>  
>  set_freq:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

