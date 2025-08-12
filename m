Return-Path: <linux-media+bounces-39548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D37BB22237
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 276BA188843D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216B42E7628;
	Tue, 12 Aug 2025 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aikkHwee"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1D2E62A4
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754989128; cv=none; b=WeTUSipNwQRrkwAPGGBunDsmvUVBVZl4Fp9tZevR9jBm5siZ5TTmfA9c5IkNgPLhTS/Gq6Wt1OFbyhJ5hku1PJcahh8xHVKdPdNrRrRpjIcko0MAD/sG8VRgBxdVcSsulCkONBy+JSD0AepPsrrrWh6VSu1/3XhvceSWpnO4Bmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754989128; c=relaxed/simple;
	bh=V/oI42HG+KmjCXX/P8qEQlNtlM/nYtmIKJRtZo69qvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDEYvpFTXW5RnW1PMibvOnj2N/5ICP6FY/feEIuJ2GjsSnpmSgc/k4lFDiCpsl6ZBwXniteplfV+JKFLxqztRkOu6U9T0tS5zeO7g/jXLueXqvD/6nxbWIuV2nTwHnYneb+sdqf1ZgH7cA/biCv+rYds8hpFYR0j3dIMSNIVs8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aikkHwee; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C6vBB1005715
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 08:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaRsxQR3yoNg6t3YPAkBb9tCcocZReZcc0Z1+xfukvc=; b=aikkHweerthXOovb
	kI/+eiVqwHRVMk9uYIwFZU9Xo3/Dd/qo6Hj/txPc1IOgPtWRfhKNe6GRmEQfih6K
	XnMSPTe2q+AlRaT/jnzTjOj127D6vMDjC7aTnS62b4dV/WNh6ahUJ6Ni+/9EE1wU
	Ffb+8ISRTuy6j5VelVmgr3SehIx4imgmpQxYpER7Q8ZarBaxEK+CrVzPnXIK7fiK
	MT3C78vl174dTVs2yYer+nDX8YH4wOqK12CZC3zuJ6t3x3hX0Hmu0obi2lurJXcf
	v6MfkmVglpg796P+6J6n2DXQhkYihaFFf1b3Px+Ga3UBC2Pg4mGet1ZutWvilvHa
	6TGaZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6kany-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 08:58:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af23fa7c0cso15457721cf.2
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 01:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989124; x=1755593924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PaRsxQR3yoNg6t3YPAkBb9tCcocZReZcc0Z1+xfukvc=;
        b=riAjQ+Bpcz3zBEKqMsd+fes3bvCiYf+O5ALM3Hxbzqk8BDqdEo/J38kCUNlRpbATQ/
         2GJluDQOJ/cWsjr2sLw4tcKvK9zqRCCGU/9mb1lQfBglOBxNev08dLxCpzQZyioMwWVT
         z862EGPTSI58NTQEu2lQBCydFxs7m4fKQeMugP1buuKBnUhYNVeMzafIm5/sRAWcJXZh
         SbsmcOyXh2yHPPlMVjgNFV7B6/MCeWFlqbQcWq/zH2t5A++x3X/tKt0RMQ7z59zojQDi
         4o1BnEeAF24cGCMi/nfXDa5iu45ks//j6d7RcodwMZD+oj7QPjN8Ivjj1AuLsQOIk7ct
         HFuw==
X-Gm-Message-State: AOJu0YySQV+zjXW4Q6eQk6FHlTkWvhCPEyYpuABeIBzgWudsj2Tu8aTX
	l7FrzszbxRm1XbTRQ38EmxwUA4Utc5OHZ6F4g1PMbhI928ibKDN8Ywfg/rCIxV6Wtd6h0NOtTLJ
	Y0L8TX9cqCg1Pda9ZiPx9fHkaVN1aw4fveMZiSwWTSKhkoXqiLA5ybGJ+UTaW4+OUCQ==
X-Gm-Gg: ASbGncsxQyAgzcoT/cG7qpAQ5Fae7jT6ZhvHPWjIzezgAXqdVHa7Vwxh6pMaAF7wpIY
	y14BGd+RXNjxGScaBlJFKJu5zH2xhRU+034Obv64Yiu7j6aWmqfE/UHiC2rTUhM+TO4/lK13D8L
	x5VqZsgj+yEiUckyRFrltxf7FJqYHYQnZD2AklhVeLlmFgx3c0NXI68XA5/iMN4h/uebYL8Td50
	wG67qHZqEhQzlq2pWh5wGng2zK5Nvze1kx8izMPrc9uHrxl8lWoElOOFt63Kfb6kz6tFuXsw6ES
	pT+IJrUXc7eklpdUu0SbTuSwWhp7ttikpDerBhxlpv3+hlJUB9k9RURh25coiGMBbERul8xzg0l
	XGXO3gSojOWCxbL2hLg==
X-Received: by 2002:a05:622a:d5:b0:4ae:b029:cd7a with SMTP id d75a77b69052e-4b0f6231105mr1197271cf.9.1754989123800;
        Tue, 12 Aug 2025 01:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlKi3sCQ/nXhiFxDdZunj9DNpWvDw6ERg/7xJDhHp/jZJJQ/cubrxBq47LFDNNRZuMuook0Q==
X-Received: by 2002:a05:622a:d5:b0:4ae:b029:cd7a with SMTP id d75a77b69052e-4b0f6231105mr1197141cf.9.1754989123327;
        Tue, 12 Aug 2025 01:58:43 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e82a5sm2171730766b.82.2025.08.12.01.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 01:58:42 -0700 (PDT)
Message-ID: <7376d383-632d-42ce-bbdb-68c245d3879d@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 10:58:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: vpu3x: Add MNoC low power handshake during
 hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX87amEa1KHBhY
 394OMHDs30tytijLGA5x3nMInQlPgKwrR1wcjnURprRuKDuFRZBmYbUodOy/FlSpMpL20qbzJut
 lwQM4mJUfBLHOZAUxMRnflEgnU21sUrwn27giZ4vbXbsqVMOv3g0Gwq+QrVqVOqpcXuDEEuerN7
 EafdGznziym2CZNq84I/XS9AaczQhU6aJ+TK+PCFHEpCXIaawP+kvW0ysqcoi49LOpsB508UoRD
 6OC/6Wm0wXz/F1diixi6YCc6g6PzuLuW6Dv2tRZaU18uSUenAu2sI53VH9iK66hkqVUh5/ojGV2
 BZzevBtBy0ShR/MEOpZAIqUiBxkffD5Mr3b9GHiHMXOzwMpILvS3pPNNDLxb/XNsRcqnubLkGQZ
 LXEpJkyp
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689b0245 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=6ItR197CiITtoEHbj2UA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6yO_KUNeQA9_zQr8SYXRVMHobBWhnCAJ
X-Proofpoint-ORIG-GUID: 6yO_KUNeQA9_zQr8SYXRVMHobBWhnCAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

On 8/12/25 9:48 AM, Dikshita Agarwal wrote:
> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> reading the LPI status register. Introduce a handshake loop to ensure
> MNoC enters low power mode reliably during VPU3 hardware power-off with
> timeout handling.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..c2e6af575cbe4b3e3f2a019b24eecf3a5d469566 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -110,6 +110,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  {
>  	u32 reg_val = 0, value, i;
> +	u32 count = 0;
>  	int ret;
>  
>  	if (iris_vpu3x_hw_power_collapsed(core))
> @@ -128,13 +129,31 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  			goto disable_power;
>  	}
>  
> +	/* set MNoC to low power */
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +	while (!(value & BIT(0)) && (value & BIT(2) || value & BIT(1))) {

It would be useful to introduce some defines for these bits, so that
we can reason about why bit 0 must always be set or neither bit 1 nor
bit 2 can be, in order to consider this done

> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);

This write may be left unobserved by the hardware for quite some time,
but IIUC it's vital for the next write to make sense (i.e. you won't
meet the delay below as they may be buffered and reach the endpoint
essentially together)

> +
> +		usleep_range(10, 20);

https://www.kernel.org/doc/Documentation/timers/timers-howto.txt

suggests this should be an udelay, so that we can accurately reach
this (small) period

> +
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);

If these writes aren't actually necessary to be repeated a 1000 times,
you may want to use readl_poll_timeout

Konrad

> +
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +		if (++count >= 1000) {
> +			dev_err(core->dev, "LPI handshake timeout\n");
> +			break;
> +		}
> +	}
> +
>  	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>  				 reg_val, reg_val & BIT(0), 200, 2000);
>  	if (ret)
>  		goto disable_power;
>  
> -	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
> -	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>  
>  	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
>  	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> 
> ---
> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> change-id: 20250812-sm8650-power-sequence-fix-ba9a92098233
> 
> Best regards,

