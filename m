Return-Path: <linux-media+bounces-50643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8E4D1CDC1
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F22630935CC
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 07:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0167636165E;
	Wed, 14 Jan 2026 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFw7N+yR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTat/mun"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AE3361642
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375714; cv=none; b=hmBn8PpKW67mAyCwPwBD6FCwSd3BKQcJufcdRckT4mPMsjNV7XdrlKdJhp3jqZB6YosC6zmew9TRoq2hy/6/x0LSSR5kyZjgGzL8OJpus54xbQF6egi/UVt+K6YVz98I6j0Y9ejpercUtoZtB3RfLNun35yft3H/Q50Dn0P5uZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375714; c=relaxed/simple;
	bh=aDxtKzNEsVHqByOidgY/CPR7Hh79+kO4ibmjZJQIYxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCwjsJvXSu6RObUEF88L9B0CCWSmleO6eahTBe27+/k3D+/KozBUUjmv8+RwicPvj5EKrZXQhN+QDJe6T0Udyd7mrwqOjIZu+yOuQujMmfKT18RirXC0R5hnRKlk1h/HmGCHxw6vZdocJFcq/axZIwV2mItW65m6qFFASpIAFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFw7N+yR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTat/mun; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E65xYk1688437
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KdMG9WA+kJ7VqYbxQxfdg6qolJCk+4/maOFlurAClgg=; b=hFw7N+yRkHjxu+g/
	3URn+CzxOvP3v0Q+MBUanCZVI9eKOBF1UazHmnnOtSQAaJODueuzlsnpmi8d1iT/
	3klzaZ1vYYM/DbS48JYPjxIbZfJfbt12JQuj0WCMS0+I1/CNEe/GEqR4StfcU02E
	2BKoe9eoLlKYP5GzxDGSmowClBun+5ASjJX9ZbD8Q5xZccC+LRo57cNG9SK2gubr
	zYwgaMeBvfmHxNpi5eWfDCTJVe0YKAqRiOX4tQT+C7HWjzpFpaYzKJ/bmO7rPrK9
	4TQnamMPUyqUd7ep+cqp+dnWTrwviAIz6XAma9XhKLSjk+q8OP3pCNfPbsMKCNIL
	3qdAog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnsybam49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:28:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e952f153so216505025ad.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 23:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375706; x=1768980506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdMG9WA+kJ7VqYbxQxfdg6qolJCk+4/maOFlurAClgg=;
        b=HTat/munJNYRrkmd5jDHTkbzRF+YVzcJh2VJNwjAcqOQK233YyimXNnLnR//sBkyYk
         taL2swAumaJyspFaBwHhF4ecPU/mcU0cyFQk9vOMrXcHTHyAbEq0qvs6dcFmDE3TGMES
         FogEGNIIqvEu4SNSR1NO1PEVvT9gtlY+CyqjVOpW5mnO1aaO0+O9QoYJxtLuo2Av6fwh
         W2qsOL3DJdUrw40erC2/fUlL1QgnFlA7DMJOeCpYOzfqUIm6dd90K3zuZu4VuoxgigyB
         6WIKmJHcFyk7U2L5WG0x2XxdqzxtVE4khcVMztEinRA2yLLIH2UIEdPVXZPn7VRYZ+KW
         DsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375706; x=1768980506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdMG9WA+kJ7VqYbxQxfdg6qolJCk+4/maOFlurAClgg=;
        b=rvL30ndVz4iJqjrk2CUtQNIK9L73C0hSqjSjCDhRG+uLCbYuDeJtcYTTPUqb5+jlmO
         X6OexC8Fh7k1X6rmkQMNrsmC/vcNnJrmXkjHLsZ5Dlbjtsdf0KFM8imhl4nmXzVzzDtD
         7If3ArSaoHKvZEM2xO5YmrbZzG5sDFrD4tmeY/loNN3xd9iI0zMOWS2JSgn/kvfcUgPg
         PSDvEF6PE2BwfggCgMjJYU4WcDn0SNP8hb690Qh/hLYJa0sEQ4hKQC0ZUHdQDV1ozPK4
         1uVF3cEwsKWpeaGIKjqDc+GR1SYXOlDr4awUKHNFB2sWJ8IqiJ3UT+29qeMHLRNi2D74
         9jlA==
X-Forwarded-Encrypted: i=1; AJvYcCU4fhyCVdyt/mnhGb7hHHFwEl0s3xrikDJkVb/frbImW8zBD0x3zK+R7f/WJVan9SSWwVbnR3iVH5tlKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhVfx8f/pEnA5zBSVMurhdaO5244t2kBMYDMUHbgvX7U409CHW
	aMixMGS186p+PgNfGbKixrE7BgFCw2mwvgazHt1UZPbFujehRbi3uexToqHTMLcI5XoOp4JRLzz
	lcCsQOI2y7Qfd8B/bLNP+BG+M/vgjgb8/vEMwop9s+X4LEX34XIbLrLP+iGCHLGouKA==
X-Gm-Gg: AY/fxX40uFb/tvnRKr9dkZayHWSyVnvMHQ32R0kHneZX50LecBKe4QvF/E2cVvbmTNh
	e9LQMg4i06ji0YaAGvTST/f8ZXCs3ioMZtmzldcZTHvXT6taLqZ4Y6accZjwf9CJC4KU+7elsyQ
	N0Lo4VrPqj3W1oIs9Pt/6/aLcK7K15vbodGk5ygVpVNjoAAQUYjfVlm8mVYYXTNm6QRy3w3G/iL
	zzyeYUNlwoCPcCkBS9dUOPSLWmdNKXpUW+k9ihY5YxrXtQGqwrI8b5PBIZCqErwGZxI88mXFVe+
	13hE59mRiQ8QdcDP0jIblxP9mNL24gwZCx2/Ce8yWPlFRiY78g95GFLymzSzbfxs7v/EHrGQAWL
	nIzBJoBuTx67R99SG32RO5oRjRcREOBRpDZp54+C6yVA4
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210c with SMTP id d9443c01a7336-2a599da501fmr16776745ad.1.1768375706090;
        Tue, 13 Jan 2026 23:28:26 -0800 (PST)
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210c with SMTP id d9443c01a7336-2a599da501fmr16776485ad.1.1768375705647;
        Tue, 13 Jan 2026 23:28:25 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a560sm216788535ad.21.2026.01.13.23.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:28:25 -0800 (PST)
Message-ID: <b16abe0d-da13-ff3c-ec29-4e26981568a2@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:58:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/11] media: iris: don't specify bank_spreading in the
 source code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-7-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-7-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HmKuzLt5x1OQIU4MB2DeLE5y9Yw48TVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX4uLUJKIsCux8
 i43tGOfGFWRsMdy7g3RpBsMwJQyYZYg1zxk75nMK/YKWO2mEpT+WwQb3VQGGU5Tp2Ik7IU52B2C
 6Kccbu3CueBDOhb6brJeyZb6sy8772yVyQIll6zrMCYgzQu7OPb9p7pO8piRcImuapkIwoa9olf
 McEn7fSoYYOa+33PcjugEft+3zGGRfs7wKX+UEGW7qsPD/a9z4gsoH3VK/Tr9pS7aT12o5A8CJj
 IrnKdrnEZJDbF3SWqk26pCGxNlh/FFZIdo7YaUWv31sSylQInm977foBpChyjn8vuluyAyKF+fD
 UHWVVXYYI90gTFZ1aCiEabeujynXavDcXMgBRTlUt+VLETOuiEEI+kqz8fRzCliohuTOO9I4l/O
 B8ALk0461Yqx1EoVB7ztoS5UrqKszVOErx+5H1gc8LxkewEsq0K2Jxo5yddtbPvq6LZkDndYo/q
 l3lUjTcfWEFXtK1ysdg==
X-Proofpoint-GUID: HmKuzLt5x1OQIU4MB2DeLE5y9Yw48TVm
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=6967459b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yL4243FK61EKG2Nsi2QA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140057



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The UBWC bank spreading is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index a880751107c7..9945c939cd29 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_spreading;
> +	payload = ubwc->ubwc_bank_spread;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SPREADING,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9f9ee67e4732..f99fcbb8fced 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	bank_spreading;
>  };
>  
>  struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 0f06066d814a..c967db452dec 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.bank_spreading = 1,
>  };
>  
>  static struct tz_cp_config tz_cp_config_sm8550 = {
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

