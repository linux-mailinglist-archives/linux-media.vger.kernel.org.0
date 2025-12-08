Return-Path: <linux-media+bounces-48389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99478CACEC6
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 11:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08B26301B12D
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 10:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A35312837;
	Mon,  8 Dec 2025 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVBxkF1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CP8khLrX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DCB31079B
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191271; cv=none; b=KYPaeOnwnVMXM2GBHvx4FP/OWMotGfwOza2FB37yjWxm8FT3jGl9UlthJLU4eyMwOy0HfcLPI6z2yVidfUe0srXY8YL71/ZUUyUOuwL4hzZ0n9P+ebRzEoMAJYXOvdYs0jfYt9kaclrXyfShpAsbKgZ599jGxYgERf/ZX27gwmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191271; c=relaxed/simple;
	bh=L2PFKeWLruFT7HhSZW1fWbSIekQGNtX6aWxeUgNX2rE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cL05n43eq60mYCbpojFodtxzZoMvTt8u1Pd4TcUrGQKMvam4HwXb9MckepCZi5Y+QhOoJumOWSqgZFtH58d44zu2LEUjCDthuQWuYY01l4czfRyflUDGY5dM1rS6CdHGTi4dmwts4rrWpwX4plPV7qiI6DLWshsdIpf3OJO7ViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVBxkF1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CP8khLrX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88Rx2u3946042
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 10:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YGYntBelCU0BbNsavFK91z9JODq2w5Zuuf+jwFRJWo=; b=aVBxkF1dh5l/ICM4
	bDpHw40Cs9ex8+0MJYHeIXSwfBvUUXwT7R9xZxOeK6f5xlvT1OiLYRVIH837A88O
	cQswzKOeN/IDYeb6YUyLjE2MbVrfqlI4w03CMcPUt3WKELZe+w+vq5GViSqPwWP2
	HLb+blE1/OaXeiI4aXEqXnlobKepSqOpJtNxAcU+8WJ4n55MXsYRqElOXbliE8iC
	Np8hWHAaXfd0s5Gvt+TZv7aLZUtCd0Apt9xQFQFGZWgzDGyS20lVqWecCqjOElGW
	TZu4FqDYpkyCqWB0s6sSKBpsu5T/YMjenST21BS2UsZdE6Y0+TPX82W1Ju+DA3C5
	KrxTmA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbga4smc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 10:54:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b96038aa68so3342788b3a.0
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 02:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765191266; x=1765796066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YGYntBelCU0BbNsavFK91z9JODq2w5Zuuf+jwFRJWo=;
        b=CP8khLrXUzJbgG8tIbkC7TSjRRTYXXv3D29wHgB18j5OjRETqi4tPpnw6GACRuDyK3
         RbGEQGwd5Bm1KLfFjmsVp1uk5R/2TVsQeZwSgTfPvcg8saGCM0zUdjShg2ZwHF0mPd9p
         I0Z9cV20+eIOh6R8ZFcuWgdTKtRJLkJ5Zdu3agDVO2EXoOW2ch/yrwggagKMnpPJqLor
         a/bv/YG95JHN7QxjSYvoilxd8BTq0jYy93M3EjHrA8C9uaQujH2wUPoyBLhO2MWMqjVn
         wbPBUebafJiw5MYymZYxyPalYQ0EHO5SX/VLkoMp47pa7yTq88X4rBfbP12pgvRVk/4A
         ojng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765191266; x=1765796066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YGYntBelCU0BbNsavFK91z9JODq2w5Zuuf+jwFRJWo=;
        b=J130uUtsXdPafDxHf8RlbApfAvBylRQwA8ez/L0R1lPl2RImihTq4J8FDGz7wg3AbI
         qinleZUMg+Y3HaonzEPUtNyG7KXJCLO+uy8XK+tMGq6M5zUTHJYf+Spx1g33tJQJ1KUt
         ub6TIlHFi684P7pr5T26cBNaHNy8R9IbmDiN1SDywSHpV39Ua0DiBbMgzBnHpb5EuMuS
         wC1sfV4qOOjKUH1j6qUdaKRb4Gxzc0E2P9WCKHmFCQ7fYYp7jBMciytjVHT9Xo/qwwOy
         tc3CaME2e1Lzj8uxSp8v0qc9BilC1mgSzgcEibE94kY/SyMys3+tWIrsIuIrRb0nYbPz
         WOUA==
X-Forwarded-Encrypted: i=1; AJvYcCUsK1rD6KW73QBQDD2ajMCv5Ovx5HtaM44/tB8afeVMILmNejZiU3+HuKZUYX7f0LtAegCBc+VWLYOY6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YziMrkXrhjoIo6TohEiKu0bBUMMYgMvkxMnkOXIlxjQy9lV+r4O
	2FOip4uALT/cVAwguydfpX5vz+bFqaCTSr4PC8RRGUr4ziw32ovuFmN6kT20XkIMFfJl+6LX4u0
	naINbUjupEBBa114kVG39HxK30S+x+vKQJ1YiJbcLlp1kLPoqhKS6wj4bIA1DGfrB/Q==
X-Gm-Gg: ASbGncs3zED+f3/v3UnfPrsYryiHagX0Cg6FsWe7bXiQ4HuZBLDMjDPu65SXAxt4ySu
	pXdbKOhsQPXH51PjwsotncASyLj/sg52mH1umvTnxBIe3JDMXYU75yukCtdY6BUoRBVQ1XGspZh
	kWu3jGi4BRTi3p9TpF5W+EoX4KajgbPsmQOqwVNW/buNb5B3ZKuOOAU2cfWHI2uzOTUnfOnvikh
	XnTPbkU/AN4GniQgVlsykJjVEqdEMCLYvrKUwQS5wpOQm21znfkmswKq+56Gg3nqH+pDq2XziP0
	ugCjrY8WQofVa5JzA1qJek92XcBoCtgI1zDxJpFn9j83xVNN/SGekFbeo+KjE5aQ9zK5W7kHpV1
	c2R972+MTLtTEmZv22y6I/hyg/FDUXlnX5ndu2gG5DTShiLpxDIiy2RRT7ewPmykTcz3FbjLOqJ
	7l2rY=
X-Received: by 2002:a05:6a00:94c3:b0:7aa:d1d4:bb7b with SMTP id d2e1a72fcca58-7e8ba3e05bcmr5969925b3a.16.1765191266368;
        Mon, 08 Dec 2025 02:54:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVJ4BfiayXI3USMdJhTQB/6nSjE5qeDOWZsrG9ZJqjSZ3nCF4lPkB00yUa8weUUa1tLSsWEg==
X-Received: by 2002:a05:6a00:94c3:b0:7aa:d1d4:bb7b with SMTP id d2e1a72fcca58-7e8ba3e05bcmr5969907b3a.16.1765191265865;
        Mon, 08 Dec 2025 02:54:25 -0800 (PST)
Received: from [10.249.8.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm12804088b3a.20.2025.12.08.02.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:54:25 -0800 (PST)
Message-ID: <161da76e-b05f-4267-a4b8-bf290b74f85e@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 18:54:21 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v8 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
 <20251202-av1d_stateful_v3-v8-4-2f74a81773b4@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-4-2f74a81773b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4z4CBjE c=1 sm=1 tr=0 ts=6936ae63 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xfU0YH49k9lLscIIeUMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 5uQHhL6HXOcLg7tK7q7FpX8NkTwRr5lQ
X-Proofpoint-ORIG-GUID: 5uQHhL6HXOcLg7tK7q7FpX8NkTwRr5lQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA5MCBTYWx0ZWRfX211GwBjQV0Z7
 UEr37w1UI+f75SaIfHmrJrV8U883gVfLjUGUMHVCDhKxK6iviSdEldkCjLAKEyTWTzEVdV9u7ME
 TMuY6ZXsmoV9oKmwNdWP7SNjGfUBlYdUW+HjMbD/to7ozKlvhEH7xnCxM08IcuwtGhetSmVx6uL
 Y4XPwByqxfTadrSbMiKINHNZm7tARtHvg90NexGo9yTb4Mykxg/nyKqBTDTEhBeNViigasuP3t9
 gDt9lwY8XfHEdto/ioT0BqlOoNIGiGsj6sWOVB4IT87dtSE0JL2OK+u27Nn8y6NDS8xsuG+kNX0
 qG59m+J9M71bVpnxU71iYwXKEUHHgNRkU4KfjJFqf1x/7k6cWNI3AmlbLGkvj8rgIcde/t9XFRq
 06dkKk/ext7ouQ9aHU217TnenarvYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080090



On 2025/12/3 7:03, Deepa Guthyappa Madivalara wrote:
> @@ -805,11 +909,14 @@ const struct iris_platform_data sm8550_data = {
>   		sm8550_vdec_input_config_param_vp9,
>   	.dec_input_config_params_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>   	.dec_output_config_params =
>   		sm8550_vdec_output_config_params,
>   	.dec_output_config_params_size =
>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
> -
>   	.enc_input_config_params =
>   		sm8550_venc_input_config_params,
>   	.enc_input_config_params_size =
> @@ -830,6 +937,9 @@ const struct iris_platform_data sm8550_data = {
>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>   	.dec_output_prop_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>   
>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> @@ -899,6 +1009,10 @@ const struct iris_platform_data sm8650_data = {
>   		sm8550_vdec_input_config_param_vp9,
>   	.dec_input_config_params_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>   	.dec_output_config_params =
>   		sm8550_vdec_output_config_params,
>   	.dec_output_config_params_size =
> @@ -924,6 +1038,9 @@ const struct iris_platform_data sm8650_data = {
>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>   	.dec_output_prop_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>   
>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),

dec_input_config_params_av1 also needs to be added for other platforms 
if they support AV1.

-- 
Best Regards,
Wangao


