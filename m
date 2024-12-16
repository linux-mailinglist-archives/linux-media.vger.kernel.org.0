Return-Path: <linux-media+bounces-23487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 549CD9F38DB
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 19:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FC6B18926A8
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 18:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14136207A25;
	Mon, 16 Dec 2024 18:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+Jv/IvU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C0920766A
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734373302; cv=none; b=QF/Wo2TwB3LT/o18lqEvqGhsOIVwJNzLKYgIjGk5SSLvOe9n/rDQy+z/WFqeMYgDl+AG2ITt8GYWVW83WRQUUmf1qjnv/aZNTS89KW4Qf3OHQhpG2Uo6ia/vEPOSuxRl8rfH7k6J5bBFEK4fsS0QFQkhqu0SSUulWDHxtICvb3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734373302; c=relaxed/simple;
	bh=7T1EKvuCUGRJ3imkGbz1wsMSf965yxalHyEp9/eORr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMvdBCZRrk5HpGmNGqq6C3FE8i6bPM65l5D5G4Yqqze9+HYnxsOqFxE77LW6IkPiiDd03Vpp+GaUEDa+kmffoUtY/RbUnCg2cRyA3zXB//LEFTs678UpYv2+DYSLLIVnsTTFfPRYLWmg6F/OGmBkbUylokHo3J+sHIXVW5Ps0n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+Jv/IvU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGBCOTd007225
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 18:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2zAVQpUe77f3p8FH/Gp/4YPV
	QcATbXm3KqaR4kfxxAU=; b=c+Jv/IvUPJQ1x2O6s6AX96AARv0tmgMRItD2Cze/
	+mYPc+FklKXniZZQ7z/+EmeZWMIRzd+fRXnQCGLYzp5tYwvnrCBr9QWWS3+RI+nj
	y0oxebLr85UjOcRmw9eaZC+A0kijLZeHo5dSsQsexx2sIQChQ6QdUd1+MaXVGXcS
	r71Jsi0erWkKn+aL2isFH/BWdTEoHrp+sOITSwQnKIdJTAu03NeGbocaqbjQCaOJ
	Wzl6Zb6Thk7JgqVJYjwMWSMmxn1NB70xHrJDXqbVdi+EIOhmFfmAOwvkikrn4HEB
	3UfT/07EOS+OUCNOgBE+3GhMjbThnfff6RfA4StTjdpZeA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jk4nh6v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 18:21:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2164fad3792so37571315ad.0
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 10:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734373297; x=1734978097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zAVQpUe77f3p8FH/Gp/4YPVQcATbXm3KqaR4kfxxAU=;
        b=gZ7Pwoq1UXTyKHDKgZeblvkx4CeYziRXjTqxpZ4aGwwT14cPBQaSXXLBwxzdajZWXE
         NSmtf0TIWOdq7bSG9kz969YeoLEoH7QFrY5akcwViyCCFQ6mdzBlAKzRDl4myTW8kYz3
         cYqjg75bjwRKeP4e+Ddw4HzSV1gkvKfIJm37porin1xJ/7xj1PX+r0QYkLBFwktpNAcX
         n7wXFHdYdxuh5lKBl9GDarZWBRWrImoY0Pe0jW9qfJrtBYKgwfjs1bggRhpUxOr0t4oH
         Q0TL/wUIivtYT34ZofcE9WzJ9OFssRJ/3hCiuS9r0NoopoFuYFyzlJcgVtrCyssVrw6b
         q7BA==
X-Forwarded-Encrypted: i=1; AJvYcCUmdgkPpzgP9jjcaH0P/eJGiil/ghJTCa8NGXFL/aM0z2d6oq2Hn44r8O4WsL2W5KmBx7wIkfNAUS9iIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytKHgwtigFkPC1VdH3oPtFJWo8F8xzJzK7lmBKHMgwE8JTwiEP
	8TGMXcXC/IayWbQi48EP4hlm7M76LX6bxGUCg0KdNNqYd8q2ggOBn3mOdlBEA2p7G22qDzFVt8V
	dre0AkN/XUB0nYLWFOa8TQPyGmzenQrQ/xckUvghpxn2YREuvwHOvIL8L1FShlQ==
X-Gm-Gg: ASbGncshTdkP1QxHWiqRIEQaM7lHyDEoTbJxt9lt6WhjBEVc3YShs8I9i4tunT4UegM
	y4Mv7Q546idHJ7mLihT+wRCsb8RxEtgxfYMzg8I4eFdOINeOVdUzcqvTbTxcvcyKOqk/eSdGY80
	VCCWmfIaM7Ej9wyiGUHf0a6eG8HnrNUsIqw4kvNzBaO6mSOcGpV3NRqqFrRXhH7O8Dyp4dDtKz8
	EVJB9iM0J1PlouNPXk/F/+KmbKiVhIQlqVgarWJg4utCsg3Ggdao4veHSi4Zgm7vBs+xBbz77Qz
	SbRWQ6Kw4R17UrcZ3U0NR+OHGtvC0bv1mLCTV67P
X-Received: by 2002:a17:902:ef49:b0:20c:9821:69af with SMTP id d9443c01a7336-21892a40599mr189000545ad.45.1734373296895;
        Mon, 16 Dec 2024 10:21:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK3n/qfuVZMWrwi2xip0f+pklE9I3FXny2TZ9ZG/on/4pahTLK9utkwVgntMiTD/QPnKJe6w==
X-Received: by 2002:a17:902:ef49:b0:20c:9821:69af with SMTP id d9443c01a7336-21892a40599mr188999935ad.45.1734373296469;
        Mon, 16 Dec 2024 10:21:36 -0800 (PST)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db7976sm45851355ad.53.2024.12.16.10.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 10:21:36 -0800 (PST)
Date: Mon, 16 Dec 2024 10:21:33 -0800
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] media: venus: core: use opp-table for the
 frequency
Message-ID: <Z2BvrfYEaIqFcjwg@hu-bjorande-lv.qualcomm.com>
References: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
 <20241213-add-venus-for-qcs615-v4-2-7e2c9a72d309@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-add-venus-for-qcs615-v4-2-7e2c9a72d309@quicinc.com>
X-Proofpoint-GUID: aeHJo8QS_UchSH-B2Qpcj9-wr-Sw4Wse
X-Proofpoint-ORIG-GUID: aeHJo8QS_UchSH-B2Qpcj9-wr-Sw4Wse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160153

On Fri, Dec 13, 2024 at 03:26:47PM +0530, Renjiang Han wrote:
> Get frequency value from the opp-table of devicetree for the v4 core.
> For compatibility, if getting data from the opp table fails, the data
> in the frequency table will be used.
> 
> The order of variable definitions is adjusted only to keep the reverse
> Christmas tree order coding style.
> 

1) Do the best you can to add your variables while trying to maintain
the order, but if it's not possible better leave it than making it hard
to parse logical change from shuffling of code.

2) This comment is useful during review, but not necessarily so in the
git history, so I'd suggest to keep it below the '---' line.

> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 67 ++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..a5c3f9ad2088d8c80247b52d5c1b8e053f499bfe 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -40,17 +40,23 @@ static int core_clks_get(struct venus_core *core)
>  
>  static int core_clks_enable(struct venus_core *core)
>  {
> -	const struct venus_resources *res = core->res;
>  	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>  	unsigned int freq_tbl_size = core->res->freq_tbl_size;
> -	unsigned long freq;
> +	const struct venus_resources *res = core->res;
> +	struct device *dev = core->dev;
> +	unsigned long freq = 0;

Is it really necessary to initialize this? I'd expect that
dev_pm_opp_find_freq_ceil() would either initialize freq or return a
failure, in which case you assign freq.

Perhaps the compiler isn't clever enough to see this?

> +	struct dev_pm_opp *opp;
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
> @@ -627,12 +633,15 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool lo
>  
>  static int decide_core(struct venus_inst *inst)
>  {
> +	const struct freq_tbl *freq_tbl = inst->core->res->freq_tbl;
>  	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
> -	struct venus_core *core = inst->core;
> -	u32 min_coreid, min_load, cur_inst_load;
>  	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
> +	u32 min_coreid, min_load, cur_inst_load;
> +	struct venus_core *core = inst->core;
>  	struct hfi_videocores_usage_type cu;
> -	unsigned long max_freq;
> +	unsigned long max_freq = ULONG_MAX;
> +	struct device *dev = core->dev;
> +	struct dev_pm_opp *opp;

Here the line shuffling makes it hard to determine what is part of the
logical change and what is just style changes...

Regards,
Bjorn

>  	int ret = 0;
>  
>  	if (legacy_binding) {
> @@ -655,7 +664,11 @@ static int decide_core(struct venus_inst *inst)
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
> @@ -1073,12 +1086,14 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
>  
>  static int load_scale_v4(struct venus_inst *inst)
>  {
> +	const struct freq_tbl *table = inst->core->res->freq_tbl;
> +	unsigned int num_rows = inst->core->res->freq_tbl_size;
> +	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
>  	struct venus_core *core = inst->core;
> -	const struct freq_tbl *table = core->res->freq_tbl;
> -	unsigned int num_rows = core->res->freq_tbl_size;
> +	unsigned long max_freq = ULONG_MAX;
>  	struct device *dev = core->dev;
> -	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
>  	unsigned long filled_len = 0;
> +	struct dev_pm_opp *opp;
>  	int i, ret = 0;
>  
>  	for (i = 0; i < inst->num_input_bufs; i++)
> @@ -1104,19 +1119,29 @@ static int load_scale_v4(struct venus_inst *inst)
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

