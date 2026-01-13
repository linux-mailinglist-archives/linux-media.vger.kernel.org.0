Return-Path: <linux-media+bounces-50609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D22ED1B4C1
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DFF130C6CFC
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 20:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DBA31ED69;
	Tue, 13 Jan 2026 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlH/BiqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bubgec4K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4179318BA6
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337629; cv=none; b=kJcC67gwaUjw9S2LXTHvknYnQ9uLrlIHJFKZq5zBTZr3dkMgs8JQIbkr6NnEysdB/QNlx9cycn36qp4dEV3zlURKfwzk5m83DYbYeabk1jsnCfMH8b/KpRV0i4+7JsGrlxULeRzsPdqoRheNfbhmvzDzbO1sH+lKwLcwIkrjYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337629; c=relaxed/simple;
	bh=/7bIFzYyfl+31sKjQggmwqyoEPNR5xP3+nn03WYuGRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rS6qbO94Ls4Q1LaSOzz0xYEw/HKqacLbWGtr0wgNWADo/r8Jnb8eKxLb55J1GB252h48aVK9+cfFcg1S8q7fdutN67g3MNCQ+UAHz+57oGGC11fvlQi6T2VkPvh292MiYtg8ORWtIVeZ91IQUejVFrevJO8uuILTP70aG7lAw2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlH/BiqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bubgec4K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DH7Uec1120591
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZWU+g9QjzL0tqtxM6fgFHBpVcn+auaOkUPAWt/mGUY=; b=VlH/BiqWg9vWw2o6
	LfhC0Hg6qQRKgdxjBq6UFdRqXVK/hBcEfDLjf99DCEF4vb/ycdb99XBxdd/6B/ui
	11G9FCS0+1Haim9B/DmcM4RE7DCZWwXpescN577xB2mIzHkQvnYxRGBYuphRNySd
	vtkv+DQmMCqlI/tRLtlw4YTAFD/UHPMeemReduwClZLr3lu6kn0BsP9QL+e7HvL+
	ITecF1zT5kefyRd5PF8v34DWTLbJGU9g9Pw91Tnu2+pK7MyR94DiMP9WKBVgq7Io
	atGjd0Y+3tz83AEoOkyAhPe0KEl9SJOjtjSkmD6tvgP33TyTAzpRQhynxjC9XceP
	29fXNA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnt63rr4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:53:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso263152eec.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768337626; x=1768942426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZWU+g9QjzL0tqtxM6fgFHBpVcn+auaOkUPAWt/mGUY=;
        b=bubgec4KKgmz+DWq2PG6lVQ3Hyp1OKAM9wCXKprCm+6n3/BLwQViGopY95sFEdbES/
         E3r9E79jfkFiZXuVuVf3Ju6bWShq1eKcWb3uCyIA1kYVkIFes4wt/9lWUGeT83wxBlPB
         WvxAgKifXR+wknRvYPFDFHyJw4hOt4hQ/dVYaEsga+2KoNN6g76ngxnsNm+hGy9iSd9U
         5kWouV12HQ5QRQ953KOwbP8Tr/R1Q4ByCLwPlcRdxMIs5uAydvYT0QG1HMe+amMoRMY4
         O4YJpiNDWq922wByK9hEkbf4YHHx0MRrX4OBZHP8ruHz6isRXFkZPNFfWbr4IgA/yPpL
         kKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768337626; x=1768942426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZWU+g9QjzL0tqtxM6fgFHBpVcn+auaOkUPAWt/mGUY=;
        b=gy+DMNj6iLqEf9DBAnCCcxOkmeJN4CtGLyT0+fYuJfpPlH0NaKsDlBmq00BhpTDrRk
         1Xs1Q/qcpvh+9TZ/WnBvj9HaCSWRNzbIlC8MbKEclIaVsWKPo4cr/KGRWejO8qRa8+ZX
         GYT5jYoO1zZPW6TzH7CF9PdpymgZOlMr67WwFesruZranSHx82nr2wCVdRyQvBsxUdn5
         /cZLiVrYUpPFyotuawVHwDLmVQf5iLLlbe6/6w2uyh9et561rhiZVCZp7zQP43JR+PPQ
         xmCEqfkp+Y1Ccdfe880gXYqxKRffnzSQlw9/51f7xospmH5FKEzrj2+Uah5EUKPTIawy
         XtMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZfjthbkpoC3P6LcDxKByoZT9Gpgsg3W43pGlO+JvweNr2vBPIDmQFn/E8BJI6PEfZv0BOviiNXXfSJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2fdkV/rnszgFk/EneLbXdqrmiwyzhRTnROAeCFME0Gam3ggXd
	d7SboWQKfmcF52Jqjbaf+z060PJGCMxVCrYf/b/ToUzJ6e8DUcypTxLHk8Au/OSd5Knj2lgrDzx
	FUiA2T3HjDbs+lpx5HXb1F/6/XgvhGAAkBYUCGWcy3vpTOKefEGyf87mh/XNVdz6WEA==
X-Gm-Gg: AY/fxX5gE5iOmKQGk62YxdxkaKi7d0g59cfMM4PO+Kfuw8jCCnPoukLSrzTWGod6mq5
	6cZLkwIHQxYliipxvXXbDZxFhub9uLHsChYBFQvRGhwrqMPUdk43bQngrspbO4whYcgpSwRJ7sP
	SoYeZJSHIWBp3yO1EJ/ZyytaLK8pb+MXGEnAzeXmCEsGv6JrSF92LPQulIx4JmQMdsRbHfZJdyw
	g6r2GH4rvGp5G94zhgfW2aDfyW0OjC3saJuSGC0/QykHNnHQP8dXcT6GHKQC3tR7+ugQXpfw8uq
	7Kj9AOo9z6D4z+lNV1/y9CTGzr50Df3NsQ91UB0ngQrviSkhjqiGcgOVG0rVqRAcOZCSM4xb1WA
	K1czjfUt0NUCC8hI5LpuxaTWsaYliDiPNYBVFO1DWXBjcFh6d7CxyKb1bBm+BNCCNEw==
X-Received: by 2002:a05:7300:5353:b0:2ab:9c11:4c91 with SMTP id 5a478bee46e88-2b486de3db6mr365854eec.12.1768337626305;
        Tue, 13 Jan 2026 12:53:46 -0800 (PST)
X-Received: by 2002:a05:7300:5353:b0:2ab:9c11:4c91 with SMTP id 5a478bee46e88-2b486de3db6mr365816eec.12.1768337625723;
        Tue, 13 Jan 2026 12:53:45 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b21dasm20399681eec.27.2026.01.13.12.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 12:53:45 -0800 (PST)
Message-ID: <61801034-225f-429c-9f34-f80044506bf3@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:53:43 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
 <20260113-sm8750-camss-v2-2-e5487b98eada@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260113-sm8750-camss-v2-2-e5487b98eada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE3MiBTYWx0ZWRfX26BfqZAH0tFl
 HTcHqvdaOq2VnufgTxCVxbVVK7/oB3N6NVXZIe5qjspJkSzO1BxNlvxYYizgseN1Hp8KJ/gh3QK
 c4Ux/QKPzwEaeH0b8FJ3F0Uef5NAHwIGi0ImTVVELSFpkFCGglJc6IOJEKuj+3VqJvZlDUOMDRW
 ugmzE+2tmFEV8kKNylwy1n1yD++Cy+TJJfkU6neWZfoFqfrbJhhX3SM5oQ2hGEBKHhBG5SHoWav
 E7b40bLy+7As3j0eQhOCuHXEz+rAvgbciLgWC+Nso1KN/pJUZih37zQRQoUs0Jjg9+YeRf5r5+u
 8A3hMctvu37TTN3GpFU931wIaf8j+Qi/xHdS3inMCo1wWVeFFv2j9H9qUM03QsQkSS9Lf1SvaVt
 G7HOtRQzrhvLCd/nNP5DHjrD0DSHiyHHAZr/AifBhx7czK99tUULpFxQO5NETYFb9uq6zFLYGFi
 weCWpGNtV0Oz/htiQcw==
X-Proofpoint-ORIG-GUID: MQr-UItSYcKu7kztLJ5XeP79p987DQII
X-Proofpoint-GUID: MQr-UItSYcKu7kztLJ5XeP79p987DQII
X-Authority-Analysis: v=2.4 cv=EujfbCcA c=1 sm=1 tr=0 ts=6966b0db cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6gQvxzz4ZpawDXRFAvoA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130172


On 1/13/2026 2:28 AM, Hangxiang Ma wrote:
> Add support for SM8750 in the camss driver. Add high level resource
> information along with the bus bandwidth votes. Module level detailed
> resource information will be enumerated in the following patches of the
> series.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Hi Hangxiang, I believe some reviewed-by tags are missing for these 
patches. Can you please double check?
> ---
>   drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 23 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 36ff645d9c1e..56f20daeca3e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4066,6 +4066,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_sm8750[] = {
> +	{
> +		.name = "cam_ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +	{
> +		.name = "cam_hf_mnoc",
> +		.icc_bw_tbl.avg = 471860,
> +		.icc_bw_tbl.peak = 925857,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5487,6 +5501,13 @@ static const struct camss_resources sm8650_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>   };
>   
> +static const struct camss_resources sm8750_resources = {
> +	.version = CAMSS_8750,
> +	.pd_name = "top",
> +	.icc_res = icc_res_sm8750,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
> +};
> +
>   static const struct camss_resources x1e80100_resources = {
>   	.version = CAMSS_X1E80100,
>   	.pd_name = "top",
> @@ -5518,6 +5539,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
> +	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>   	{ }
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 616ed7bbb732..2a53524dec93 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -91,6 +91,7 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8550,
>   	CAMSS_8650,
> +	CAMSS_8750,
>   	CAMSS_8775P,
>   	CAMSS_KAANAPALI,
>   	CAMSS_X1E80100,

Thanks,

Vijay.


