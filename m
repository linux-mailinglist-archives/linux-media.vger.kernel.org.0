Return-Path: <linux-media+bounces-50853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88010D2EE29
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8650E3004842
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716933587B8;
	Fri, 16 Jan 2026 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkAB15Nl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6gEeGy/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5961C357A5C
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556410; cv=none; b=p3rGiZlMjXjkhJnWc5vBpBNM46ochLqd5H4SmH0dpebSwsgg9/vMOlTS47N9iruTUkcROZoNYKXX9SjaimhJscPR+HIYuhoAt965/0/P3rxf5hR4tTF+yzHZx9HjKx3QUgY8I12+IG4W/m9xo8weR42WC9pjas1gAtPFzL9+dO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556410; c=relaxed/simple;
	bh=0Uz5gIlxM5jLtn5lnv22dcPUoUvY6r4H4ZzZYtBwljE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0+Br2eNQPDgp/fLofH4p5SjLbzxeR8lDJowQrJ0mVqXt00CNnjBmnh6aaTZv4Xdf8ZxrrX71RJAZw0DrSDYsCgSYbefIKzzrLnMrUo1nNjLSHCl3QoRcZebAqxiwVqDzVjk59s+e8XOUc8g25pKi0moUlfzg5NrSGcZS6AzUJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkAB15Nl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6gEeGy/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G83RO82615451
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RjWvcFnj4r19PSFRNYRS5QmNp/LUVzb9PfM+i9EfMv0=; b=jkAB15NlSu6D+kG4
	0FTbpv2SuWCJnOfRvLfAQsuM0dU+UUgolK0Zv00XEEWGJHhHvABv/0AAAhWe31DZ
	wNUuXt2QjnM7X/300au1TjjBdimwvpCebg+50Rl6a8DzRAI6qN3HTWEvO+eahlJj
	f7BgtjG00SUIoZzfXCn7xSFyjjnCJqz+bHBZ2LXOlHMAR0vfaqXztOX7qKWz/ALt
	j5TH0V6fBNxoIvgdhI2a2YWJR4IbUx5N9iW6QzN+5YnZKWpbodcPGK6Pho+cfG47
	ujRh16rKeVucuNrMwot/0nKTNsVYvsFrm76tD/bHF8i5B/vXQDT42ILFp2mrRlv4
	yg4ciw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977spva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:40:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d59f0198so20376645ad.1
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 01:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768556406; x=1769161206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjWvcFnj4r19PSFRNYRS5QmNp/LUVzb9PfM+i9EfMv0=;
        b=A6gEeGy/NXJyvlzdBGTl8apIZDadtxSP7+zTIrtifEu08mc5VpVp/+e9kMQOlM/yCN
         kR6p0CgHnk8cSy0HnNACTABOuGrrwqhd/PdvG/F1CMcCOtIggnVEp1kNlNnlHks//55i
         Mi09VuTCf7cf5Zco2wBHKFEypxREl7X88XWDfH3LOJA+HvuX+KkdzBO6YoulNJDZGIsU
         bFAWwodkkMytfpX8d/i8/LLalykrHbssP2nEnRD182deZewk/PtQ3U4pC3k6/Pqt4QpW
         8cLIFhgVURCIlcuU8IkEXW+H5e4HmxTaNXOt/uVo6mbjVX3oj6jKWU1TVI2Kja4Gs145
         8Hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556406; x=1769161206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjWvcFnj4r19PSFRNYRS5QmNp/LUVzb9PfM+i9EfMv0=;
        b=JUH77Vn77/6LeZpcPgAOotOIlnwGwp5Xi5hOx4LG+4GBbxK6uVvJ6j714jLnOLujef
         bUWskZ+ReSp0eokl1vLhp8TLpxazma6toZDkrJF6yxHdkwvDEWGktYFQdXUUsaP8fa1R
         zUJURL0J4W2AKq5NN9auFMClQCCpDBMaW4GtAfXgVJHmLbWWiXj4iQfaPbDJeLimDGjL
         CUqfdEP20tex3B+v7MQnliaSFpPVuet2jdjh41Ln7OPyzimzVH+PliMqxtzA8qij8mJL
         NpFJCHfTQSie4eUjGJKUbXHjWZPEsjghTgPqXQfyQpKJwum4OnAcEa1N5I01PIBmwGSV
         P1tg==
X-Forwarded-Encrypted: i=1; AJvYcCWQaPkNHtcp7lUe5HyBQZHyOwl7gd5vxgOj7A4TUtzlJQsmW9DpkNCYAXUxjhPzJRvJrGUo5/dUxPI/1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU6R0oNY3AzFrVeJzvaFSLsRW9Non+rf9QyuviXTzdGH3ofMTo
	ckjnkk6F8o4Gb0Ee2dBKMCchHyTJl3MRA7unlJa8g2oxd++IWCQ+1Uh+bsmuyWbHPi7scENiCWC
	pXVu5zBkvs0tcEtJ8iHo3ZRK+b3O27+peQLEx+2aeVgfiK8UKfexFO+YE05NR0/iHbw==
X-Gm-Gg: AY/fxX5ZE1irXRxEcFEhzud3/Yl4MuZQufG6PG7NK+kTdj6u6jz3Ne2wUEPQ3tdIK8q
	og7PkoET7FZSNmIAYoLbFV3DRXHvPfOaZmAc9cssk6RrCboh9ZNZq8P1lTT1IC+9WBWIuOp9ez7
	DvfI9s8bLOKvrIU1UEQOeLQMWRDfLTIBrbsPDhSaiUOFJqVSCXUs6Qbe4Kf83PJ7Xr+3n7e9wNZ
	FWPe84iUV5J6qrq9zbV2Nk+hTfwEQyBr92f9BGcFwo3efgmdiY+cHjAZpH8T72+dA2cMt5xNwqg
	2+6MjbXpmoyfah/UUEQ0y/c15TKWxcCeHcLiziX3/Zk8qcZVcBvl8XKWOaLD+3twU+T5tBPCd9I
	C/oyNwBBPGQ0SSJPenx/Q2lr0j6+g176LORaZ4wFt4Q==
X-Received: by 2002:a17:903:1a2c:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a71751b7a6mr26533275ad.18.1768556406051;
        Fri, 16 Jan 2026 01:40:06 -0800 (PST)
X-Received: by 2002:a17:903:1a2c:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a71751b7a6mr26532935ad.18.1768556405549;
        Fri, 16 Jan 2026 01:40:05 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7194235ffsm16126295ad.102.2026.01.16.01.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:40:05 -0800 (PST)
Message-ID: <3b28e334-8083-c4a0-ebbb-46e045572a40@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 15:09:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/6] media: iris: Add support for multiple TZ content
 protection(CP) configs
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-2-8d11d840358a@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-2-8d11d840358a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YLV1Bd5uVUd-Gy9cswsfGukm0NBjif_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MCBTYWx0ZWRfX1owRMi5B47sB
 tnm0ofmdcbafzZ4epXJRd3VMwJ9nO6k+R+ZaQ3qOMBO5UqRpweTGHhGV4HruMzrhD+9A+av3yUF
 R7XHRjpe9UcA38HLwgwzm/9o85kNa02LZ8p47Y+MBt+kd4+P6uczs/WeCx6OkY7Ab+/10Sm55B4
 Ubf1kVDW7hAoFwn/YVyx82AjNc2wR2dS6nuRuX8B8tO1pSsMGPQsvJMXP+7N0u2zDXw2Jp1hhIN
 Y/MAJ4fy3YCxTPQT3j1G+MtoPNluZnxQf3I4AB1KwcYCpN3NySt/RNolonub4hDw52CVlAD5Zqy
 cbbrfnBE/iTiMkmyJKUpI7zOvXEADylQk1XqpA6PePQzsBY955ofkObiREIvlH9xCZlteyeqiDf
 EvMajL3zLAojqF3ilTCgufDTOQCsJlzHQ/cc2YNHA8oxlacRXivD0FoxFvD00celya6aP/UfGK1
 IRiQuCxBkCKZieEs2aA==
X-Proofpoint-GUID: YLV1Bd5uVUd-Gy9cswsfGukm0NBjif_Q
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=696a0778 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=6r5bptAOr2ABdC4uo40A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160070



On 12/10/2025 6:06 PM, Vikash Garodia wrote:
> vpu4 needs an additional configuration with respect to CP regions. Make
> the CP configuration as array such that the multiple configuration can be
> managed per platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c   | 23 ++++++++++++---------
>  .../platform/qcom/iris/iris_platform_common.h      |  3 ++-
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++++++-------
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 24 ++++++++++++++--------
>  4 files changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 679444327ed73a40c5cacd36f4156fc94c9ca45f..5f408024e967fd21ade66cc3fa377d8507f9002e 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -64,9 +64,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  
>  int iris_fw_load(struct iris_core *core)
>  {
> -	struct tz_cp_config *cp_config = core->iris_platform_data->tz_cp_config_data;
> +	const struct tz_cp_config *cp_config;
>  	const char *fwpath = NULL;
> -	int ret;
> +	int i, ret;
>  
>  	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
>  					    &fwpath);
> @@ -85,14 +85,17 @@ int iris_fw_load(struct iris_core *core)
>  		return ret;
>  	}
>  
> -	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> -					     cp_config->cp_size,
> -					     cp_config->cp_nonpixel_start,
> -					     cp_config->cp_nonpixel_size);
> -	if (ret) {
> -		dev_err(core->dev, "protect memory failed\n");
> -		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> -		return ret;
> +	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> +		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
> +		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> +						     cp_config->cp_size,
> +						     cp_config->cp_nonpixel_start,
> +						     cp_config->cp_nonpixel_size);
> +		if (ret) {
> +			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> +			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			return ret;
> +		}
>  	}
>  
>  	return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f63fb58b2fa87d31407be0f14524c963edd85d68..29900c3ea9b9ebbab614c804a249b08ba6001494 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -223,7 +223,8 @@ struct iris_platform_data {
>  	u32 inst_fw_caps_dec_size;
>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
>  	u32 inst_fw_caps_enc_size;
> -	struct tz_cp_config *tz_cp_config_data;
> +	const struct tz_cp_config *tz_cp_config_data;
> +	u32 tz_cp_config_data_size;
>  	u32 core_arch;
>  	u32 hw_response_timeout;
>  	struct ubwc_config_data *ubwc_config;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 6092667687bfe34a52f3ec4865f99eddeea435a8..d1dda98271fb7ecdc396fe1a2dfda1b73720dec8 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -278,11 +278,13 @@ static const char * const sm8250_opp_clk_table[] = {
>  	NULL,
>  };
>  
> -static struct tz_cp_config tz_cp_config_sm8250 = {
> -	.cp_start = 0,
> -	.cp_size = 0x25800000,
> -	.cp_nonpixel_start = 0x01000000,
> -	.cp_nonpixel_size = 0x24800000,
> +static const struct tz_cp_config tz_cp_config_sm8250[] = {
> +	{
> +		.cp_start = 0,
> +		.cp_size = 0x25800000,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
>  };
>  
>  static const u32 sm8250_vdec_input_config_param_default[] = {
> @@ -348,7 +350,8 @@ const struct iris_platform_data sm8250_data = {
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
>  	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8250,
> +	.tz_cp_config_data = tz_cp_config_sm8250,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
> @@ -398,7 +401,8 @@ const struct iris_platform_data sc7280_data = {
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
>  	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8250,
> +	.tz_cp_config_data = tz_cp_config_sm8250,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.num_vpp_pipe = 1,
>  	.no_aon = true,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 65860e3f43700ddb70eba617d78971c47945d008..38734293d811cd5a12244797dd0cfcd95e3fb311 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -646,11 +646,13 @@ static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.bank_spreading = 1,
>  };
>  
> -static struct tz_cp_config tz_cp_config_sm8550 = {
> -	.cp_start = 0,
> -	.cp_size = 0x25800000,
> -	.cp_nonpixel_start = 0x01000000,
> -	.cp_nonpixel_size = 0x24800000,
> +static const struct tz_cp_config tz_cp_config_sm8550[] = {
> +	{
> +		.cp_start = 0,
> +		.cp_size = 0x25800000,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
>  };
>  
>  static const u32 sm8550_vdec_input_config_params_default[] = {
> @@ -770,7 +772,8 @@ const struct iris_platform_data sm8550_data = {
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>  	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.ubwc_config = &ubwc_config_sm8550,
> @@ -863,7 +866,8 @@ const struct iris_platform_data sm8650_data = {
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>  	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.ubwc_config = &ubwc_config_sm8550,
> @@ -946,7 +950,8 @@ const struct iris_platform_data sm8750_data = {
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>  	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.ubwc_config = &ubwc_config_sm8550,
> @@ -1033,7 +1038,8 @@ const struct iris_platform_data qcs8300_data = {
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>  	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>  	.ubwc_config = &ubwc_config_sm8550,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

