Return-Path: <linux-media+bounces-44106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83442BC99B4
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 16:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B22B18935F2
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 14:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB5C2E8DF7;
	Thu,  9 Oct 2025 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZM2f7S7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969ED2EB5CB
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021278; cv=none; b=utPfR2qSjSBEDM0zTN/Us5JRrJ1xZCUSh3bBdYhxGok8VIxzE+8mILq8igY9hBobF+Yfk8fwLxaQAoxswrzWZt1WW+6fpKyw38Mw3EszRsEFjD+cUZrWyYgBjTBQZ0uQbcVRQV2S1RcNGSkkzXR2nGiN7sB+/+crdWlEAqKxExU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021278; c=relaxed/simple;
	bh=JebSc/8bvcUimgMsNd/lWd6nM62WGBHCTAHCfkSxQWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZI9TxCuA0OiEUtBC2I9RpltG2EjSWiG12Pra1KwHuPho0u67Opp8zkULhIQj+Vxnf4s+/rEWOtY7QElXBHFne7Ljkxgq4mMQ/jDnWu65wBtL9yHTHT+XbGCQ3v8LSsZdbdogP3/RE/vPqpR+p1ujT78r1QS9nli0aaTBMtNl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZM2f7S7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EIlc023272
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 14:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	keuwE60fL3CMGjPR1k/+ByDPG5LTHeSrV5RbukXg+LE=; b=SZM2f7S7PIqjbWJ9
	+9J8GwCkD1+bfzo2VJrkjNyx7Ezihft6ecbEG8trPG6arcDuw7BNYQxO27S284OS
	gjZ13Fyd1GmPsKgRm0mdZ1SOkJEDF82dhQ72fELRXjdR8uqfI/j4a5qCnb13WyLH
	ghb0Oag1ARok/vHkoCwfVVFTF85QuoixMONNjR53JXfateJqdslvT4w9i7Z0W/uk
	Ms3iEfoCLvA+9zTbn0r0TBfuM1GxuR4eyVsa21F2DvK+luw95VfEnyHK/a4z7OPU
	waYNpKqvKZl8jajCxZQ5Kr956BcH9JKdkEmEX/7LOgp4Mi1flYrqP3SkQOePmgcc
	JFwNBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m38qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 14:47:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dc37a99897so3877271cf.3
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021274; x=1760626074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keuwE60fL3CMGjPR1k/+ByDPG5LTHeSrV5RbukXg+LE=;
        b=U6d4rqJQzgb3DIIG3zHjhbJxGScxhkdJD1Z2PsvDzc96GcXWhDxnjtKQddLclBB5xJ
         70tab4PwidhoPVoft51C/Tatnx+7S12krJ9S36dFRUqWA60HECf2sHLQCJZLgqHA7Kib
         cslNiK5uLc8YfgsNbQ1Oh4cM0QV6aNC9vKxC46Z8amrza5kTV0rh9L1Y5bipyvJZG4GS
         A6DlU6wZ8OMhEf+OkaQ3KJcUlMbXmHXk1+/DOVBNVCPXVomXDiNXrP/VKr1tgn6t4PkK
         HqjTGRW5hqAf/wkwTaAYr6OlWoYAd8c9hPJrJjzSJ+keezhERBBAJ2KXdn02anvaRtsd
         /HPg==
X-Gm-Message-State: AOJu0YzOwtUkiSmc6npNUwiIyStcXo2Zq/FNbzq4Nh+MUPQN02EwhI7M
	DjbbWlzTTiZytm+DSbxZNfL8Ez9hPumz0+XYhJIAqJEPS6Ps/X4VtkaWorRXzCeriQW9sR+V8NT
	Ip+8B6KZvHu7nNZbXI2y8JTWDnr15oDlxLypH+xoAJElAwjZJezWC14WyK4Asj45X8g==
X-Gm-Gg: ASbGncvuhamvI+qwzeLzgL6Jv6+VkKdaInZema+TUn34oQfFjUwtc6U5iUTDRHaGznO
	0rU4YXe/uQPVJ6q8WfNzTW9qn9FapzcDZvE6HdOh7wxH9NeR8rpHM2Jont2e5VSO9FmKVvfLybE
	W00itRrX6Aaz8+1LqpOW4aUNBH+xGUi20kShPFbmMMXNPm9jAIchAQw3ACPQMjUDwqs4+mbyYvn
	vd313qVMK13gPYrHrcVWejBA1TbYYYK2yynixMzkl32stThnjGbs06CKivU0odj7cnjXdV4UJCb
	keXBh3UQufJ9ncJo88pfNX3uApkhsLKstTzY5ufw4IveimqjUKUym3xcdk+Hhxwg8nlaACMrx+6
	ZuJucYLr6BfIJ9Bc6jX+uXbXVxoI=
X-Received: by 2002:a05:622a:6788:b0:4e6:fa1b:3c74 with SMTP id d75a77b69052e-4e6fa1b3dc0mr21483971cf.4.1760021274272;
        Thu, 09 Oct 2025 07:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHucPuwt48acjEjaqleOEWnw/8ACTq2+92kgGJ2zdigPQCuo5wdaNFzwbwUde+dJsC4Wv8fgA==
X-Received: by 2002:a05:622a:6788:b0:4e6:fa1b:3c74 with SMTP id d75a77b69052e-4e6fa1b3dc0mr21483571cf.4.1760021273550;
        Thu, 09 Oct 2025 07:47:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7c47fsm1928735666b.37.2025.10.09.07.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:47:53 -0700 (PDT)
Message-ID: <d597ca50-c52a-46f5-b884-17ab8fa780c1@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:47:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW
 cam actuator
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
 <20251009-dw9800-driver-v2-4-3c33ccd1d741@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009-dw9800-driver-v2-4-3c33ccd1d741@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXzyKM+H1ylAzv
 dn6nYHC49uChZBix9S9rcV7H21TO4ztg0MXuUKNOINLcTv7of8WSvMFwV37se/zDjyI6gBggls1
 g2/aSOpAbqpkpbRuh2cfLf1sswWc7RAVde7wC209BaIdjUXwxkk2WmAQdvbJwK/gsKhGAK3iV1h
 gEvkAhbPHl441tXuC8WoV5mArQgo1GbE4cP+UPF5JHy/eniYcwhNAOctgmnvzcfRpjb8ZI17t6b
 +5Qo9VtLoXKyTpGe6QDKmGRQgUubx4JKitO8+jan9EGbFKqztarkLtDipakAtDGuXWrHndaNUIF
 Bas+GlACa0cYTdlmuSYw+kXx91b2e09kyVAMKqaqdDEFhCntbWJMZrk90J2Jcf6lG34Jlnqa1vl
 bGs6Vo27YVhfQ+CmaNonhqOGxk+NzQ==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e7cb1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: HKskvyPuTtcqeanFnFDcOy8tmtm44R1J
X-Proofpoint-ORIG-GUID: HKskvyPuTtcqeanFnFDcOy8tmtm44R1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 4:35 PM, Griffin Kroah-Hartman wrote:
> Add a node for the Dongwoon DW9800K actuator, used for focus of the
> ultra-wide camera sensor.
> 
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

