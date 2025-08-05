Return-Path: <linux-media+bounces-38912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2FB1B1B2
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 12:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8725B3B859B
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F1326C3A0;
	Tue,  5 Aug 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuKoO6EX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0BA25B2E7
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754388298; cv=none; b=oS5TIQ4/5PaR+omtPOR+fx5234+m+65WkNMN/hdAF9mCgtLlYFpyBZBYjpG+wOpVPmEWB97UYiTPj/LYyzyrhGe5QbSoA/uzaTOyOeN8gPp1iRK4GV3fispCFmQVg429hkYOfrN6iP3UX0/BMGYDEp9qzaEg7YLo7WxvjafGrXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754388298; c=relaxed/simple;
	bh=16NaxHMSEZhPQMhjlmNpZcKyw1FlxxouGtxWL5uWmvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMgrzNV03tCd5qETJwO6geQvjpCq7Kl2vRuFuYWS0fBGpoxZQE5/cU9BjobqPxacFMVxmjwxPBaYz6kNvRbGpGV0isBMe5M8kOKnjfQUA7jjF040WtRB3rfVJbTPQtTbCUKR1NFkG0dl9Krj63mAMhbk7Pb83B332cY+A4y1PFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuKoO6EX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5752vfp3023987
	for <linux-media@vger.kernel.org>; Tue, 5 Aug 2025 10:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LZ1Q7mltGYgZKuRjlXj10Xho
	1f26ht9lWK5c6ij/Em8=; b=LuKoO6EXUBF3DJ3QOFvbziK7d2B+xJruqrjmTwWQ
	HQGi0xUweghEiGaO1TCmBXJdUPjaTQTXBxHp+880PfmTamLyYm2ilfpcIDw03eBG
	c+mMLgCOBMzBL/b1XL2oxgskxsRB3frhm8Hxbd6MXYuA+WveRUn1rZhx5yiMPnIb
	gNpQapczuBtAOMSPxz65AYoChJuJTkX0SPVu5tbvYNFXTzORII9jH7ibxDROdiKM
	x3YHb9G1gcnZe5VtTDIPZOPICp9HXHlR5udn6fDMpV7x+7rceQKa589aEQZDKerb
	qhkW3l1drm8MYMNMce0XjFmu0U4pDv4Y4YF5mSyiTXZ0ZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48981rr92e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 10:04:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e6a5428a76so554299285a.1
        for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 03:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754388294; x=1754993094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZ1Q7mltGYgZKuRjlXj10Xho1f26ht9lWK5c6ij/Em8=;
        b=VbtatGwAAXqIejeW5ZAdDGPPlikeQNVAIpiq/v833f4eySWmBsqAk8JvAHm2BKnkIT
         TXFipt3njr/uaZhPPjdDnhmM7iW8VU1ycfq0QU9oK3iFPtkoFGq5Mgzs1zHc/bkmHPu+
         ogiMLuDbN5FBEttEgdBNMq1GAMO1NaIqxf9hv5BDSlFnDOP9tWFU9iXJ/I051ys0Dwg4
         up2QkuElLynC1XAMV3TkM4Czu7dHxDfx38bzo1hX3DKiCWPxpW2719lQ4lLfxYG+jPov
         CBrSwCUgJ16D+vJ1xCBgNH6F2e8zC0iR2n5CMngLw8Jiou6pXkz1gSw3Zl+btpWLOOYQ
         YoQw==
X-Forwarded-Encrypted: i=1; AJvYcCVYUaKS4cxgNFFnF9nVnZBmDpvxMojlLxn5EjgWJp992MkGZZ90N/NAUz/iQA97i9LgJrm4MtMqmy6snw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWmYe+R9vzhWXF8MLNBgAnlOCgsKxoVRMVgUUyCTUKngwCg/3Y
	x2lLXNkpxJdW+DZ2cvl3wcyr42Hpx+vuKiF9/Uq9Vs7irr05uZmFN1pasAxlIrGOvCndfygNuIP
	FN+x4B2rJbwKQZEDnmgsESAmsATdo5uIQgvY3TlWbQiZ1GnHNGRJGVqyt/QVOeM8TqQ==
X-Gm-Gg: ASbGncsYY/wR+V1uRfrVQc85y6KxPUEmEKWE/H5G82Wqp88Qf7wQHs38XVrYYtRC0Ba
	iC/EgDvaIYH9i9otdi02X4xdbBun97LmgAu9LA4gKy6Y/8Mav2NjiW045nJ6Fc62h+6EutBcEvG
	TrFqJIjIvkmuuZtchRJb+jVOLnA/5JJY8yaWu+V2a7iPaSoIhP+LlAUKCoGRARtQcksvgtyEQpA
	b+9XMhhrJERRyDx1pyuVSpwelWrOSgJ2S6i/4WyECOzbVcbpmSEEA4a7EP8ls4GTOycPge8Mycv
	EqU9qOAgISQrGppk/hLu53clmfByHK4jWOxgiNdP/Smmi7G1mqeRGqfztQxa0bHI5WkZ1tZnxCD
	6y3X2fs2Xiz7vT3CqNPJ0mbHJQu3yGevtKlEqJVOStYLpWFrs0pBU
X-Received: by 2002:ac8:7d12:0:b0:4ae:cc49:e9ac with SMTP id d75a77b69052e-4b07fae5b1bmr48884201cf.29.1754388294002;
        Tue, 05 Aug 2025 03:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjc6p47qGpkwh31qlCKW+VV6tTU4R+W2maetJnUC3VlVpc14sJK3TH5Iz5iQDFhJnukuCBxg==
X-Received: by 2002:ac8:7d12:0:b0:4ae:cc49:e9ac with SMTP id d75a77b69052e-4b07fae5b1bmr48883671cf.29.1754388293461;
        Tue, 05 Aug 2025 03:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898beb4sm1926807e87.30.2025.08.05.03.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 03:04:52 -0700 (PDT)
Date: Tue, 5 Aug 2025 13:04:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bZSVZP-wRY-fHcPi0BaXrFhsoYzYgbuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3MyBTYWx0ZWRfX8789FERlVTDL
 UVDL9u/LLSMXRKAHlOmBBTSoowOk06UqkguRr92sOroAdPHgpPEZanCBajC8OWE4PaOwE+OaUjk
 NIaDPMa9pWTu1w34A7etslH2MsZP3mCUJA2LVZ1PMhFxMIEXlMTG/Xz3bs7tjZ93p6d/EjTJkR0
 DjeJYPbYhKixtOgqNopTT23cxfRa1R+eOxFFFLCFzU63pWGJtCRMO0WCKMkreiU6Ri8PmBiV8ho
 FRyB+vmimEri5hp1M8s/6kzPZlUr8JKU/WwhUm9U1vTDyCZf/5HyOJclUyRjGfNwqb0KRdpIVfb
 E1uG202RsS3Wiyh3Ru/s+zXcu3VHTcgpOfGv8+bTqkWtMO63z5gx+KJUb9TFnmZwC/003T0a7Xw
 QEBTtSRmOXGcZuvr6yqwsO+7ZCDaSqkHi68i+d5ZrBHSEr5NWegeEdNcW2/bTF6ZZlhn/6kE
X-Proofpoint-GUID: bZSVZP-wRY-fHcPi0BaXrFhsoYzYgbuw
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=6891d746 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=lzajS59LejGemfuab08A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050073

On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the Cenus core.
> 
> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> encode at 1280x720 (HD).
> 
> The driver is not available to firmware versions below 6.0.55 due to an
> internal requirement for secure buffers.
> 
> The bandwidth tables incorporate a conservative safety margin to ensure
> stability under peak DDR and interconnect load conditions.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index adc38fbc9d79..753a16f53622 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
>  	.enc_nodename = "video-encoder",
>  };
>  
> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> +};
> +
> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> +};
> +
> +static const struct firmware_version min_fw = {
> +	.major = 6, .minor = 0, .rev = 55,
> +};

This will make venus driver error out with the firmware which is
available in Debian trixie (and possibly other distributions). If I
remember correctly, the driver can work with that firmware with the
limited functionality. Can we please support that instead of erroring
out completely?

> @@ -1080,6 +1129,7 @@ static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

Please keep the table sorted.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, venus_dt_match);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

