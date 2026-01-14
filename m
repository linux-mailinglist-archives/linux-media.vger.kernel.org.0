Return-Path: <linux-media+bounces-50644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928AD1CD64
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF03D300E62E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 07:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F3836167A;
	Wed, 14 Jan 2026 07:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp8n5oNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpKQcxYs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E4B35F8CD
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375747; cv=none; b=BjGOtIlu3g0xFiuxRd/t87eMHSg3TB0YwI7IpwBPZ4pVJKkgx85cZe2TCyadT9A1e8pAfcma5sKqI16jympp4aJ2qFiOtHiAQn7re34XGMLLpFdzzARi7cFsYnFTdCxf3p1rGI8AZWqrMIn6791llMGnq1yeEM4P2XHs3qPGe6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375747; c=relaxed/simple;
	bh=svwloPuWqcxO7bfrg7PFjEgIq+L6BI8w797MN6L7KgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwjKWAJumreB2Nv4FnnMwb3rQ9y4TXDX86g4OzzESmq7sOdEf+QT2vW8QQFxd3HcnyNQLga6no+YPEQOjj3gpUCwZ7e+jLwsFFf8647Yw8I4oEpKBIKKeJW5T4aMnlOZD2uxNa2SN+2uoMr4lpZa95EjpG5H79MC78zsjfHGnjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tp8n5oNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpKQcxYs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E663fo2285885
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=; b=Tp8n5oNvR/Vtq7h0
	s0i5rW07+zZadJjA4M6DJhtHLgSxobKOhMHtUsN7Vr68Gp9nOY2ZgRuwCnkoutiR
	yPy9sM/sD2aTd6kry87EMhcx+TWEH+aMIr04oltlqr108KBf/Z0QBl/I+GPnt6K4
	VZi5CapUOJyrkynBYsqQMdvj2eXqRBjRor3+ALMRnVHlIBr0uK7hv++dUMsjzoU+
	QmaDGjQFzAXnphzMtty22l8jvj5WyNc8iyUMFjj2KS4t49Aoxa3qC5d5D/tjx+KL
	ApEzTnYT1wHM4bL+8AySWohl5z3tB3rQpXXXVVSfC3weJMiefojVnKoNkmkRHILu
	TKfBCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x175g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:29:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso79019745ad.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 23:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375741; x=1768980541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=;
        b=fpKQcxYsHADz4lUV/LSe7JPg9wO8OKoLwkKKBQq5W5SHeAZZO3s1Qy3zSNLWEdJ6k+
         Jp+Ip3DIdMuOZ2uRnjpXmod0Vctbg3C9BfEUPDPGjykqnQYZwWt3qmn6X4YuIwaRyJMD
         c4va8Lz9xQDyGNhRe00S4ZYBlnpQv9Y+W/IJhw1misLKW7GGAJYQu5rytwHQCBbGIE8S
         fOZXmER8JMh+kcE+Tqzxszqo1AKAFoDuADUzwulOIArpBO2VJxh5R+EJJMCjcR2SRHNy
         olMfptM51MC3z3CG844q9nguAAtqfUsh3Fkliaq+d0YBuZii6VxBdAaaY6ca8XtZYWIR
         uCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375741; x=1768980541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=;
        b=o+nsTeDkU8OXpR0w4pr5PdQUYFwILyWmZuJqKCo2ubktoETKhnB8FjpoZAkuzsZ6/Y
         9CnFRtyFQyGlKPrGfs1j+YoDdBIW0mzQPDoQuVihzBvGpgduU9l6aVmyrZ538LrBuCoO
         LTSExCULtCNiERk5WWR1zE95w8iFTR0MIgEKDLx/q8WIkWdjCUGz2AfVPdH7j/XYVD5Y
         DZw5GptJ2nmbehtwY+BS9lBuz3P8/APivACHZD6T0lGFbZ0xTiXhlVvbCCn+VwJKqNuo
         WRu4eOQAHPqOZ1wbm+vJTDp16tc1rj9mhcJokHzOIuSqc4kReXdxo87QHIU5TpVrTgGD
         HCOA==
X-Forwarded-Encrypted: i=1; AJvYcCVP9JlWJa3gZEf9IRwXBrK9GGYRqhfsZBKOXNSuzPnMnUpf71GqqTVg7vWDfgmtcvMKgRSEHFIsnosKgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysY9fdFCb0H3b1ogV9nHo7n6WeDQuYroHd3UYuZpUxv7moEkmt
	+pA8/PINa/7dGA72JTjihViOCVUTZMheDA1Y3pEBOifkaCgobFXDQs+izFL0DzrHB+60x3pvnsw
	27SJJ9Zspu3zVGzWAh+kvhePF5/iYtjdlSavn6FX1ry77mZFS2AaGtxr2Bv7rXNwChw==
X-Gm-Gg: AY/fxX7AX3GSC52k7ZR29PPc/dYn3MwE8iCx7k31I+ZKlEulyhJltTNc9zQaMZ+JNaV
	0wUnku8DhoEwebHlg3E4H7WBEKDeRocyZGW3tFKodQr1PRFAULZnG4KrErBHsD04UV94rTiOxUz
	GCXY488MLNp6A3qpfwpTYewpwiCuS1lf6wPgP0e5KLQSp84wJgj7OlkJ+oLQp5PVZfqjL3pP/Ka
	FRj25XGFZCsHnYhC+EngeF9btxYwPoDmzIsay3Xhkmez8CndkqOeiylMArmPyh4rTEIIIFvxAF8
	tgDW62fmv8VVvbJgxjJqqc7BLJwf5FElPgdDZYRDqWmIEqFsG7EPXsA4KnyjZ8lSZw6J11PvK0q
	isXxNkKqaox1AV4oDt5Vb7Uje0xIzfFtA5sMYNaHgY9TP
X-Received: by 2002:a17:903:40cb:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a599d826b0mr20847135ad.2.1768375741540;
        Tue, 13 Jan 2026 23:29:01 -0800 (PST)
X-Received: by 2002:a17:903:40cb:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a599d826b0mr20846895ad.2.1768375741018;
        Tue, 13 Jan 2026 23:29:01 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a2f7sm223039555ad.16.2026.01.13.23.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:29:00 -0800 (PST)
Message-ID: <4124d961-b262-c75e-5e34-01be1edf7959@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:58:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 08/11] media: iris: don't specify max_channels in the
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
 <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LVK8lYSnl_Zpr6srMZ5_A6aqXU4_Yi6G
X-Proofpoint-ORIG-GUID: LVK8lYSnl_Zpr6srMZ5_A6aqXU4_Yi6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX1NGGSFHjU6AR
 BxdvcWsbBF+XBSbDOQPlA8wCifxby9zcqt3B435hA7O80ULf8OBVWpK6hU0KS1dtoxbBFPZlb36
 H2pqcWuyKwgHJN34EuhiLjAbhJO+di545GKO0fqsKusYjD/1i1pfH9EGnrD5j30LPBoJx83Y1Uc
 sk8slgORsKiotMRyrQYlPXzc26OeY84JaisiVzkPrKVzFDHZ3RQjyIizgxwrtysltFh5saYMkpP
 SYuEhONEclRWE1DUfcZrdgpw22yX+S+X6pRnH37VAtHpcr/ryhNMWZ6rqQyWSTYXbEq0CBLb5qw
 kNaHRXcrLECgieGiVsMmSsw35Hl0/ecwgv+sEJxXEvbWadBOMZKKcqC+uGPd8sNwNviBESAoIVl
 cpL6sic+mZC8i7TPsp6FrruJOMzNUNY15zkNdvyCJ+xS4dpsFgbnGLalHx1ilzTeTWjnp7EeKsz
 0KtZFLygdDx/M2e+eyg==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=696745be cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=S5pdipytwMNRnYpo3tEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140057



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
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
> index 9945c939cd29..91dbea4c6664 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->max_channels;
> +	payload = ubwc->macrotile_mode ? 8 : 4;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_MAX_CHANNELS,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f99fcbb8fced..4abaf4615cea 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -72,7 +72,6 @@ struct tz_cp_config {
>  };
>  
>  struct ubwc_config_data {
> -	u32	max_channels;
>  };
>  
>  struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c967db452dec..e78cda7e307d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  };
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
> -	.max_channels = 8,
>  };
>  
>  static struct tz_cp_config tz_cp_config_sm8550 = {
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

