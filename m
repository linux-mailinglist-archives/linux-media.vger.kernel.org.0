Return-Path: <linux-media+bounces-33711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48029AC9698
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 22:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04ADC3AE32A
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 20:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D958328315A;
	Fri, 30 May 2025 20:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQmNwwLL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FF32147EA
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637114; cv=none; b=iQbVYUa/EQfnSMeT3MqnwRtYomaVtTLeQb8SHji2WfwPkcgt31+5YPURuE17tjB20TuR+eW4ctYlUQMlwWHAG+Z5yRg9hR05xmQUlOtpLTpxSi0KSvWkvC/BwKrgZsXAxj7XZnbTfXp3fhCDafyz1eTp2dAH16NoqfmuzuMUTDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637114; c=relaxed/simple;
	bh=f1fdEMjT+pjjXh4re0AY7O/7xvlUQpzkFh1aeaLDwYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTj3WJRcMmzBTBhNncoDbI2gxaFiQRxIaOQycNVFpeN6GOBJhCCk8cGpOMDli8f2Drzl+9NvfYMXilfuXyZZP0cQsQPsw2/vsm9KWj37Dw5e8jJvUUvU0tXOG+sg/ZkDzV4SinIX0BUVkGYiBgNs0R8euOEcWEn76HT6qOr8AHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQmNwwLL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAwRTA014001
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 20:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M1p3EQmdtNCgV/iVOld1te3d
	tjXwAqfiklGbl9y+1ps=; b=bQmNwwLLYaTObDfHdgUdzsXfsZAhy0bclYSEKKgj
	wrbjsT1QZug6ViDpeBq4p/aHnoUdNXFiGnWG9Fk7qCu0/CEVh7TrzUN4T4xuNsUU
	NvAQXQ7V2iE57i/UyLYtjMPc2nYy5qAJf3AZqulPC0E8NmpckefI34IaA/Vqz/ai
	aOTkmE34JEJVCtN6ljdQ8ax8MFc71RspCVnAYCdeSS6WbEXtfnsKVUiNxKuF5uiT
	t3X3404gq4UUk6mPQApw8qE/jFnyrINzfnQ83m1pUi9pzGPSDvcqH66aLi8+lYp0
	VOLtXbCMdbei+q1hja/XVB7wnE6YwizLPHXx6FwwS85BHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm4cub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 20:31:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c793d573b2so398323685a.1
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 13:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748637109; x=1749241909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1p3EQmdtNCgV/iVOld1te3dtjXwAqfiklGbl9y+1ps=;
        b=RU8PeEw8qRCICG22qQiEpvKPEwY33hnB7Uf93mdkyvaBnw0wiGCIrptAc+9I0v6qIT
         3hOPsVJv20A5RmgaOD8nnvPyO8oX/y9esTbBqsQIaxTXfF5v6zzQs9S/y9U84S5RBB7n
         3Syl1T8YIY0UNx9TYJ4hj1jrYA0iHjbT8crIWq8hM8Tv/3cekZ/lptFblr8fRf9QRPmR
         6VXbrPg/Y8i1MCOTToL2sQU/7gkHyUA/9nFicEo+G18SmazDpLdEJWGsAw8wnKnMA7Uc
         ddnSp1RbQMX8FNGxfqlbrYSablnBgNgrmk6a2L4DqU0eBK2gFqx/BWzS3E8T+5MR9JgU
         HVDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5A4tQkkNeiu2kqYOXUmi/F3w/Lp8gfmmggskiFR9rjVEmyQcErjoEGCBqs4IILkpj1uropR1ISTpq+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA0zCmdoMNlDRY9zQksZo3Ao5EOKuVEaqOTPMXw4nS2kjpqvW4
	XHM8DC5BJdduxHSqbPyi+Ox2RQTMnq8lDQRc1vf/B4C8ONimeFjtg+wAwRBNoxfWdIo22oKEx6h
	hNmWSjduViRzsjo3uKdl29wuyTfJAjBzDrWGUBSm4G+JYJZxOW2WgnQ1n6/vMeELCQA==
X-Gm-Gg: ASbGncv1i17CXegGpfKCO4ZVgDO7qtJqCBQumkMz4K4dmD0iLdmf3+81Bkn9HTyH07+
	/B7z3GHIxKv+q3WohY5jPeuwmDOldJAR5aT12cy+iNtqk+khcCsZ5Ntld+MjQtggHyy8SdzM+6d
	5kqY/a3B0J3DI4ovLbewPso1YvKkt/2F7vUVt92TgEOX9GgBgqMuOiSc77LL+obQ2ltAlzF4flZ
	gCrrSbs+QogwB42MYBD2XWtvDskWDzY3+inJ6VtPsBD4Pw+ksbvcAXmPDH8EZlvWTBMLr1XHiw/
	8DgzHRDzoKkHeGvUHEl5fb6dwMkXIg43aiQb2N/e0Jvb2mya3cSlIo371Pl7Ura1AqsoKmFso4P
	kzOgLt1VRMg==
X-Received: by 2002:a05:620a:2496:b0:7ca:ef12:966d with SMTP id af79cd13be357-7d0a2044852mr807321385a.56.1748637109522;
        Fri, 30 May 2025 13:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5gxu0bW4BBklACGl0xDtBjzkJyvR+Rkmz3xZNctayUpx8OSvdPIjzBiRcKt4/SIxwXscdrg==
X-Received: by 2002:a05:620a:2496:b0:7ca:ef12:966d with SMTP id af79cd13be357-7d0a2044852mr807317685a.56.1748637109125;
        Fri, 30 May 2025 13:31:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b56359sm7062961fa.52.2025.05.30.13.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:31:48 -0700 (PDT)
Date: Fri, 30 May 2025 23:31:46 +0300
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
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: qcs615-ride: enable venus node
 to initialize video codec
Message-ID: <qeuxv2mpnnsieygdwvsb63k4n53tnc6yekiv2wels4jjwwpxf3@wutnfkefi7yj>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-3-c0092ac616d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-add-venus-for-qcs615-v8-3-c0092ac616d0@quicinc.com>
X-Proofpoint-GUID: Pst-YaTuI9H6h-Rw2BW84CTz38Qyiwe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MyBTYWx0ZWRfX0A1OtciNKXzA
 6RjBMtORF7BnB6GtBVBY105Y8okINWofVIbtUhqDSfvvl27TYy2kMMzyTUb3iSiaLICbf7knWxN
 EjnJXQ87lHtBqOImiTukuGdTchtreBM3Amj1tfhY4mLOuQqwkZw1r4o1MwYjDCsP085e2INJjXC
 k50kM9BkOw7YWtOZ3WgYmuBKLniQo75Wr4y30KvVUgnjml5C/CacFGuzefsrgOXPNlPFh5X+XIX
 iE7Q71aSZeNBUScWuMimJiVgUcjcbgwC0AmwdsMm54BHAECkJp0f4MDTS+TnEDnf55AvgihPBlG
 nhVZk9YYjNJN1OA5l4GrMEJY+sZoiMKHsDB3AKuxG1kLzSotXN/MYn7am/KdSSRMNog9Ez46PS6
 BZv3HPppd+uQH876tczoWsbCSritmZ9+PCrNw8VaM/ngf4MQAnpy/Z245XdomZa0YF0ImcYB
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683a15b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8 a=COk6AnOGAAAA:8 a=8HjAm6W-cWlp_Wl9Tc8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Pst-YaTuI9H6h-Rw2BW84CTz38Qyiwe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300183

On Fri, May 30, 2025 at 09:32:15AM +0530, Renjiang Han wrote:
> Enable the venus node to allow the video codec to start working properly
> by setting its status to "okay".
> 
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..0686f5c10bdaf7ba3f522e16acd2107d25742dd9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -338,6 +338,10 @@ &ufs_mem_phy {
>  	status = "okay";
>  };
>  
> +&venus {
> +	status = "okay";

Does QCS615 work with existing qcom/venus-5.4/venus.mbn or does it need
another VPU firmware?

> +};
> +
>  &watchdog {
>  	clocks = <&sleep_clk>;
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

