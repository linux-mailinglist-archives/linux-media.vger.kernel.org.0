Return-Path: <linux-media+bounces-50448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FEAD12296
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE7E5301F9C6
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BBE355813;
	Mon, 12 Jan 2026 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O41eejZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3u/Nrx1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698F2352F80
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215963; cv=none; b=UiwNKIN499y5riwsAKFgezRdro4sBJIcFU+5J09IVwNLwXAxEUHXuAZstwU+zIEX7v5UHdpe1GvVX3v/Xzc/zZJvDOR3TDMnkdhDFCmEJcCdaRFGnxc1LH/VcfM4oI4hgjdiQUsF9+mBTYa3A4AR60D5o+AVoP7BoJ4yq0Q2/2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215963; c=relaxed/simple;
	bh=kYuNmGVXmfIdPGufiGEVDlDRzP1O19QSfUdMGpu6JSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIiTvZBUFva6fmMibj6TNKGivNCkjkDMCWNAidxhkLW8n9JR1DqXqUFD7SRdVdjwmJwGxfcQI35z0kmg/EWD5s892uugi+moTTp4oezWclhFnJK5aB/AJg91f7IRu50X1PxrPRlJdjCb56W4Sm1dE+o9bYqttaeRTTo14o008N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O41eejZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3u/Nrx1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8pQD5113363
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=; b=O41eejZRHpAWdZ2l
	PNKFKurHrJh3SZCZmFjIu61O9IHVBoqQoULJ3GNgPi6ckTZqoZXR7qOvo9K3ob/r
	GhmbbNrrJby6gbn7Pv4c08c3crkKvnqeBwgeAdPcHzHUvJV3UWSYvXIvGX5yuOPz
	yw/veTUK+ISK8OS/QZBd6FgMVuIE++YzJuwPNRtthTOnqu1lOjmk/hbEeGHwHb1+
	KR25XPxLbeaBJiIIfvqPEtl1sO2DpArY9ko/451iYhyp+27nGNkgRErVb7NoxW49
	70G3LKnr9oYp+oUvu0OKaHa7bQl3BYGyV1f34ILMJKYoHPzQM61P0HcMv4ZYCMx0
	k6d68g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhfuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:06:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f77be4f283so8727101cf.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215960; x=1768820760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=;
        b=L3u/Nrx1Sxanu8OrCJS3q48XnWYsnOAia/VIu31mq13CWWb2Zs+JUVoe3g8ddApvBs
         xGVmLJLWTAQpCSKu4gBKf4Y3xwL3Af3l80k2ceEJjXKSzjCWKyOLur9wUCw6dn6LD6P1
         WjSZciqz7qeguAk8ij+U1G3hqobUGMuCoy7SnYIb55LmWNA0W+hk/URGbIEEWlMVDTuQ
         ZtB0bqttexJTYirNBBidS5xhXnMIhrhq8Nqk84+3QanVK3GFJ00TR/t7WYhH6AfL9Heh
         O5ntKjOUz/1b3Tcca5YB37cyQSkFQQ0UPqTyK3hdjeS7r9Si9vKS8ynbxLdJwRqpXHg9
         plAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215960; x=1768820760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=;
        b=fyju0IxM7nch648Ud+Y1Ff6GBk7x2G+VRnsuRkp2r358ND3wUpV4iZBu1hrOr1Xeda
         Sgr6KdUu09HG8hl/uCUJCz87QQVNXG3nuJag1C5Nr2xE5ycACFEsUJICTVF2Se+w1e/p
         qlj8QGgBOi+wdTp1GPSKjdHlkSH+y3YtZjioRXFJCN60G5umtGUt5u94T80x71WvJDdl
         F23H1/xK4pOAMtdqfxjmUyoJPlVTTjyaOaXzyn2+CDZDxe6OPfk4CGPnyS0AArLgj1Gr
         evVbbmd4u/Mq+ZzQnynXEG+TSvC5pmCL+IdDGd41L6yS+2zZYsHrMLLdDs9FdWFPnzik
         Pv6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQWCfKsNFH9FmtBla3ttKjPjXkbqduJBQ6VEdREXvHO7Kk1/edu1bmLnrXGGPKql0rpiN0IWwh2q/jEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt1s+ZDmWKCpv7nb0/ROvY6Oo/mybp1Hl31o2OkUvzcn30Yn7M
	sVFHmWP1uUvkTA80xST/DGOycUd10gq/ey7N5ltGwCmdobj15hJ3kzkT2dqZbE4q5qTk9Zt93wJ
	Sj1ioJ5kH8kmdnDsnH/FGptc80HdHeHldxUbkiD8B+A1MXsYGDIEZlYgdoRGy3IiG/A==
X-Gm-Gg: AY/fxX5/e8GUnafZId7aQkOsnEKj/dSe7G3kUoEcT+i73sDLdFOq9XEQym5cSrMR0s4
	BbdDsf/uG5wKZAV2ojmROgcZ8Jwn3Sp/FJ93XKcefMmgR2jh6cogglDTb79ltmPmVMuXodVXY89
	HtourECJSzz9OUvupcxbAuywo/MOlRVsmqrFcEbAbOVSK4Pfe1yHobM765iUh/PDe06y21YQjda
	QLQSnTx/4Stm+R4uHbnEFBx7pGdhjOHlb4b140KhN4HrBIXDGOVUDZcmmtYY9CMIyzv/btzeMBd
	Q/tibFb1UUVBfVYdjQrLSO9xkES6aHPA0EoyDhA6SLhdMW83OD1XwzGu3Y8wJi/0ahhbGFXT0T6
	RzUUg9lEQd9+hce/qtjMZZNeK3UGRCX4pRZ7jcjvOqfY7ncpks3WYfcprG7aPMZzT0E4=
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr193903281cf.11.1768215960663;
        Mon, 12 Jan 2026 03:06:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNv1v7wEqgWI3tjOCT1nA3PXnJ9lceXAcF2SXq40DOYlfVDQzD03ft0+q3tMM/DtBiVV4WlA==
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr193902881cf.11.1768215960265;
        Mon, 12 Jan 2026 03:06:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871f50cdc4sm209534566b.20.2026.01.12.03.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:05:59 -0800 (PST)
Message-ID: <9b91ee50-9166-46f4-83f0-c7a46bc0ca06@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:05:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] media: iris: don't specify max_channels in the
 source code
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX5mrF6zc4Jooh
 5TlE9Lc7eeYA/AUpigujEKwBNJ6AHMSI8Xkr/jzes0s/+X4FITy/SnCRIZrMEuODCXoTWpc0UsN
 fUvdAGUjqwe3M3uCLWQas2fuMU5qnXMxKupgasd9O8xqzxm4HA/H6Ey3V5azHs38LRn9/3eFh+f
 RiD0yHUAPsBaycAuctddOfMod+8BIL79QbZNxvrQ+DF2YRSPfV4slY3u5Id/ILE2Jjl5ugZxshm
 9vQYKI4CNjvbRKjP5p2H4AvBJvJS0NuRjCM7JXdNU9XHjTqgYr2NVtkT6OrpH+8niFsZ4I1hk2D
 q/qEWoUn+u9la48CboW7F27RqWQ73PnCLpEgEH8BWR/6lYTRn7oKwrIbsO9qhlWbmKS+ieHwRvO
 oWWnEHAupBri8NfaF1r/HDGmNwsQ5TKqJPCsaoEwjq6FwnsgIGWiQ7mno1dW7DaYNIUQw3rCICk
 kC7h4/4r6s3tC3SbVIw==
X-Proofpoint-ORIG-GUID: 1J0E9GlGXhvywgAgX86zV6xehSCJGZ_b
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964d599 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z5E5LkF8W0bl65O362YA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1J0E9GlGXhvywgAgX86zV6xehSCJGZ_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
> 
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

With the hope that this never changes from a boolean

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


