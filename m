Return-Path: <linux-media+bounces-42096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D825BB4AAA7
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 12:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77C7C163FC0
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8821031AF0E;
	Tue,  9 Sep 2025 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SukDWI+I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388F2D0C63
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413784; cv=none; b=qMOpWi1AYkZX3lEPcdM7MjTWdIjSN72UJNKrthRbv4Y4cXGxdOdMgRSIx1pxT/RJjF6zO1e1/vZ/+UbS4m6oxZc5/Z/4brUaPGJ6JDYoF4Iw6xnONCiH/UW9dIrWMtJ+qOJRGsX4UW0ppKSCAYOYD265+omJOJsEIj2sptJsw2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413784; c=relaxed/simple;
	bh=usm4FdHvUrxmd9nPz9vE9Y9h2MKo8F0CD0Pm4gdOM3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcGbmO73fmdoqxRwb4GliMzX/qdogC9b/n/uMLQCLhQ4bSB6E5KANbcxDM9Hoft/ebniMCu0Hf7JQRiEjy73AyZiu5lSd25t5Ydjdd5rf0T1Vs/cjEhq769Es3wxrhLpZx42EBYbl/IV1E/xL2u9qnZyjtlhdhIlA4DFvLl0XRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SukDWI+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LYGq011088
	for <linux-media@vger.kernel.org>; Tue, 9 Sep 2025 10:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBy0MaLLwIMy5hmNCuvVLXpeZyI8/Mf8yaQGjy4D3lc=; b=SukDWI+IENYQRmB+
	xT7tyR+V4I6m4SBnnD/qDnJ/Z620L6GTS4HdZ9XgNEvbyRJiyt8BiWgD9gR40NL0
	wPrTBSLmwtESTV03ElCQuHf7obWaq28R5zgAB4dfl1c6ve3YJ524SrKYvkZvudCW
	F5nDBejDSJDjjosiOjB9+qWxDR/QBFQ9ehpjBOKLYR2ftE0hDFu++JcFUB+uq6do
	zl8krcaI+BKXSMCrjMjbu8a8avZeX69+pVhT01Il5nzkS4vEuO8KajynhzsApbgQ
	6hsY+DJNLsEn5p5etv9zgFI+QXDmvhIGXjGgjTsWg5e7E9O3qqxVxy4G/EbGpeJg
	vpmr4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0qvmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 10:29:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f76fe6f6so9678541cf.0
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 03:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413780; x=1758018580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBy0MaLLwIMy5hmNCuvVLXpeZyI8/Mf8yaQGjy4D3lc=;
        b=PKee9o3TjY3nZ95cwqIQWlFhsmbcjtAQ69COhphB+Uf0kiY++qs1WqiL0yldMzaGFp
         ViauXKU7tU8SGmLnWwXhWa5Ps8dybW3USM3qkgrMdwOSLotGjn3nZXRDsEDFHjGI51SM
         +B+h3gLiXEcjOBiZTRpQJ2YU8JhyehCxkbHiqqomN7ENInEWQqKQLlc319HpxnaoBUwt
         kSdEphHGVPDsGBC6l5v9AfeCLTxViEd2TumkVP0zXT4QgJF2FqJ0E2l8RyHSr0i/3hyu
         6x4kDlvVYqT7IUjqXOjc2vUB0M89DOvyaEJeZJnbz92It8Nt0Mj0vH/friOyu/ESH6bB
         4gQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV43HoysPqdZT5CwkPRefp6R6eddR8PXmNcimMNLugzmLNw57xhCAph2DatrWlPS149A5aYQBDxlfXXQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxY368dOpIwcgppWYYXJ+SrRcq36qa7abGnDWcI7RyczoB2jUk
	ByYLM1spCAo0uSbnomA2KyWcce1UJ/MUDruE6XTui+wz3UuswpwJTborxxW7NsOnYtiN1CYKob8
	g01cyya72I8SfxD5aRHkPgrgAn9FKUjqew7gsYUAL9/xUg0wChll61MGb9zAAyrzHuw==
X-Gm-Gg: ASbGnctgKSe7kQB4xHcQw+FXP/Z5a1HyMgSB3nJ9a3na/Rw6bv8wyF1YBXE54qijFWj
	5+PdS1eqmejdd1Pm7glAXhs55fQG91jPHkqAlAVAK5Rspi7E0skocQHBz34AioFpborAnWjaEuv
	ylBMxCF/1iPrFFgtbERc589Z0H3R4M1Kr1VVaoBQHaHV75GdfoBwmRYsfSm0VVC9eCaEvG1y5yO
	hYbVrctYtpk1KfFUq4/1Bk5Grh+ZrFFKNlXc3g5KPXznWgtF5kHVi2z6adS5FvMyEd82+7awliK
	3r2dNux1GCwNUS83RLQQbrlPmSgJr+s/RXGUP0osBD70C2vkEkgv91A87GHd/BhNZ7Z7Nmxgrtf
	xDqQqWCFXrDM+Rk5mKPAM0A==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b5f847af12mr82535101cf.6.1757413780356;
        Tue, 09 Sep 2025 03:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnb22PJ9048ALlRoPQ81RK5NwZI6keVm8Xomf4IIFy3Ah/BDXmg4UM7UmfQqnov5lleFpFMQ==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b5f847af12mr82534891cf.6.1757413779810;
        Tue, 09 Sep 2025 03:29:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0470f11088sm1406697166b.111.2025.09.09.03.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 03:29:39 -0700 (PDT)
Message-ID: <df9d2328-8d4e-49f6-a8d8-a3385fd3f017@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 12:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, vladimir.zapolskiy@linaro.org
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250909-camss_rb8-v3-0-c7c8df385f9a@oss.qualcomm.com>
 <20250909-camss_rb8-v3-3-c7c8df385f9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-camss_rb8-v3-3-c7c8df385f9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Gxs34JtH-KRWw_Yyd7Zlk-5a7cfXRrwb
X-Proofpoint-GUID: Gxs34JtH-KRWw_Yyd7Zlk-5a7cfXRrwb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX987SxDhS7zUT
 Ovwzhpq8EC4TeDFJjsCOuDGWNBf77pN3D3bdtoVlYBZIcegBJ3Yh2SXMv/HEDDW2rMpt79sheiF
 iuA3h5ZCdirqR2J9DDSezWyO4zo+Se8Y6LUQUAXkybbFmDjRAyXw4YC0ppSWSKkwCzjOyx4APXs
 IRQCeBYhIPEiJX52jwCloHfwNuprRDXIDOq/LeIddd/SJ+e2bIGgS4d3CcyvGILqsD6rVjMvXD8
 AoNwV2rh059oFK7zJQO5GLXsDcVGNW2TYnbvsR93N5lFfvWtrvDxzcMYivm3D5fDHNYA87/cexj
 C2Vvg1X4ylUgXbbgqjHtK77Ok97nYTRwa6eE9AoxKRnMC5yE+pjlwi4SdoIx20Gq28ZrLQKh80f
 3IHStxM8
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c00195 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4WODJ3-QYr2a6mbQJ8wA:9 a=QEXdDO2ut3YA:10 a=1SaFWpeTM14A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On 9/9/25 12:21 PM, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on LeMans EVK Core Kit.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

