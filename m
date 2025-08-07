Return-Path: <linux-media+bounces-39035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DFCB1D660
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D41C18C2AD7
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 11:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AC71F4CA4;
	Thu,  7 Aug 2025 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fw4D04Ep"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65E7231A55
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754565042; cv=none; b=CeObvvt0kxjAphVrNuc4z7INYI+PHRf/90VjBfLTrXgn9YUECr5HygJIVXWrqKJqW7jDg1TOJZXCU0Kfx6GKu3H92k4rT2ykBWjooegRJ3snu5cJfMmPMLyaLAgX2T4XEiNkBda0tfTty+Q+ARzO4ZRdFAsdTilsplipgRmpau0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754565042; c=relaxed/simple;
	bh=m5jWNEvGkMzDuErMr4s4xW21ahh0JKQb4e3hPiNzJGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIeruJ9gLo5Qv/lwIcFvTxR1EzDW/rxN7NPNX8t+B5PwaVDV5ln1erxb5DUZLP0Hcif4fqLyrnoUvG3qz0EYb3momeh98o36Qd79HYqb28s/kpbwplJWLGrPoASgW9GH/XQ8dSUUMdj0G9IBu9lyt/pt3JMWozHeet1dyKW0fDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fw4D04Ep; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D51Z018265
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 11:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6QbTd5oBtfokcdGnfaL3ss1dZtp3HHu7abxC5K6Xgs=; b=Fw4D04EpYVpdxFyC
	bM2AUmSmJA8+WxuGhswRdnZ39HAZ6qQuifSBmNHcr00zA5bo/oUZY5N4kG6fpODd
	Lzov9pK6fQyujbnQzGgZVhLgecEVgWV0cK/U182my6Yy1h83r1RDH6I4e4MP4rrD
	oPiGYhHpT4Ox4ql1MahzP/pUDZPM1oQaaVB2ja2+vB++Oyj/CRnQVMkLEbmypAaE
	erWiCb2JOYsjxt5Pzk9izkG87OqaHRvNDRm3lSGV9Epa0m25eVC2Z54n/lJvRGOD
	V4XXNixo1gVRuLBmZfXARCGIUcbcya6LRtBHZK+pAXvp23IWqMccuUgP69/PwBDX
	40yaZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586bnqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 11:10:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b06c7cf38eso171511cf.1
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 04:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565039; x=1755169839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6QbTd5oBtfokcdGnfaL3ss1dZtp3HHu7abxC5K6Xgs=;
        b=flUQEOMfDw08yLVqJ+DyZ4v68MfrEW77tb4DNB4U5iXkobQTTqwIqYn/HAP/uE7FY5
         xiK6dwQsqzOkohtGon7DLMHG4nhVTo/H9exSmsyUBuT+oAYO4nMz2gy0RhOShathQooZ
         lFVDhFK2FJn+6V54vGrC3a25LZtQUfB0/6dRmRWmtu94u6YBzS4jPgXnlfBvlP08qGhZ
         R+quv5zKRd5QbR9hGKerry7KSH0bv+ZrYvEm4M8GQWSIxCjihDDDF1suQu2/fVHDRhfS
         k/GefY1kUS7dxi9Tuk6TpaM+ZQomrd0OvMhcoC+M+qhdKE6RUrqnqZZleioaQywhyXbU
         qZzA==
X-Forwarded-Encrypted: i=1; AJvYcCXVeHliZ2wQSs9v0qcs+6a6kmfhQQ35hMgBeyy40BYNCm74C2TFFni6Y8eNzDmUYVcUrPJhrVWAl6y6dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDulQ+ffHt5JvYvTylwDmFEDRe0PgQ0OlpIoTNnAQAKVPvzSI
	LZrLmY2tx1nGJjMOVZTKuWyof/9dC+lhRz/+jaLHosqVyIjAntG+71UrnTiOxs7LKEXU19zXzQN
	ZiHHDogF6tDRYzpN96fLaqp3TVv3qNd1T64QIp8JFW0odIvaBASrpQhBpofPo/0EWSg==
X-Gm-Gg: ASbGnct4Khwi9lh3tEwv4wAdiY0VxBtfNikRHLi9oRxeeslcbVoM8CrweGReCs+wh8W
	c326uSIEwolB20wkFSm0af93jHZQN0MnVC6tlzju1IRr6ww10iZZXK55Hx4WJ9KvkjDATUsiZEl
	lO3s3NDL5sg5smEWUxP1kuxC4qL8THkH8B+JUENHFelgEkgBUAaxJvu8sj97FTivGM/evS6gf/8
	qm3VB7b1lCF/VwJNqxO4irblPkd1qoOuey/bJ3RiAe7Dr92pKYxsxDAHgyGeV81lDbB1zRxj+U8
	9cBjQWMGgEscyyxXY7Jcm2SpMSi++rlAt7/SH8f45iSH6RsmQAT54WGdfUnc/PmrtqNjHYNfGs+
	gn9BSALaMKGRpzLj4iw==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr45527301cf.6.1754565038632;
        Thu, 07 Aug 2025 04:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0EgQGvuGZuwaUug6DIZAl5YiLhPSTetS5nLC8plJAjvhb/juDcAiunqpwFSjSp5lL0p+Glw==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr45526901cf.6.1754565037949;
        Thu, 07 Aug 2025 04:10:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c099sm1288976466b.108.2025.08.07.04.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:10:37 -0700 (PDT)
Message-ID: <f6432247-7455-417e-9bf4-068b564461ba@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 13:10:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y5yagzfkE1Y-Lw1osyIUjNi3Gcnpv8vu
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=689489af cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NyTICe1PHtTOfF-B13wA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Y5yagzfkE1Y-Lw1osyIUjNi3Gcnpv8vu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX63WL+8PTzS59
 H0d/2P6DjLty/txCABH8s7iH3zgGCTnS9LDqMU0LIfh7j1DkM0VVJhHUWFVLyXVNHxzRVuPgh6q
 USouit62L+k8GjX3Kg/Ii4/u2ZtomYejZvEjF/vRu17vWqRwPz9UZ49M6jfizvSOeX9dasHvJ8+
 MLSOd9NBa6jzh/F0irmQXcxQjuFH/EsUBK1zZGJjLUUu/VH6QXg28HL+JGXT8QX7TN4vJaFNU+2
 iFyyMo6cvmm8jS3/eJWP1MN4KrsC7Mo3O7lJLjgQT2QjQihaa4pRXPd+8MI7XF0ENuyh2M0F/Vr
 WCtb9s3QUTlASrfM0tD45zPghc2UFAoMPEh3yKbDinsdXLhMRNjybX4PhI+yrw3b5qte7DYVAcL
 0H6r+Qi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064

On 8/7/25 9:43 AM, Mukesh Ojha wrote:
> fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
> used in the past for logging it but due to code refactor this parameter
> is unused now.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

