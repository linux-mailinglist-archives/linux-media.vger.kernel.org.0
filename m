Return-Path: <linux-media+bounces-14188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2BF91870B
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 18:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B537D287F0B
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 16:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A4A18FDA0;
	Wed, 26 Jun 2024 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nj82vlzZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B81A18FC63;
	Wed, 26 Jun 2024 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418314; cv=none; b=NZ6CPLSUrOZyk3WpdJtTNtCb6DsddJ8rszCgA2x1KNQSBxGXpl+kpCwejjOJJ9AcWbq/8SiZCheVAb8+z03dfv/kIcnGSaeZqMtL80PzTxHEprWk4R2k5GgxrYZ0PRrBo2IRPphaasLvSAuPsTrEE71csmck/186RmqEfsEmVEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418314; c=relaxed/simple;
	bh=CycWJsjw5yZJM3ZVhFKOH+S4YFA7w61TTk0bZI6t1Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OQJdEzEs3jb51r2NRU7mRckWr+F58+UYWU26o8+uAE6dhP3GG0D0w6RnntCQzWNMWxe6Tgc7j6Jalxnd+RrIbHziZhXnsOw9FuhIR6ys4FyN9AK/FuMdA7bzX59LEk+BUhRdnpvQXzxcd3XkSLDe4M3bdTlIUCCI8kkj/VFmwt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nj82vlzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfKRJ029750;
	Wed, 26 Jun 2024 16:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzJ1IkG1F1t2tt2P4RZt6bsSV0wBaMB3exbbUnL4gWU=; b=Nj82vlzZGMe001dP
	LcdvxWMhULPeyWkKlGP61KbY34VUWWg+R3AxKAelE7ZbO8dNNgsCHnzJzoc9t5j/
	cvwIAliPV6IcC/jqVxZLehn9YCsvAsaj49AHwv4x1qnjXzQIUkm24wJOf8x1E+v7
	zB3YgG/VuwwmjYfS2mezV2loxvL0dZw+CTSDGmDw50WydSLmgOMsy2Vq6E0Jp8xy
	JT1j6fgqV0BOxHSIeGU6B7T/+8KSdZdYTbjfcZHV1lcc07FfNNEuMyEQPqy4YGZ3
	a+phJ/B6WgjcAZTi9XcjG9rRnb4K1pROjRCMmXPKJSW6r0V6Wtu1Cy+YOt882GIo
	dDaN0A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400c469rm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:11:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QGBgMA018282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:11:42 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 09:11:42 -0700
Message-ID: <ff4accf3-eb8b-48f5-beca-4322c164df3e@quicinc.com>
Date: Wed, 26 Jun 2024 09:11:42 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: exynos4-is: add missing MODULE_DESCRIPTION()
 macros
Content-Language: en-US
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240609-md-drivers-media-platform-samsung-v1-1-d474799346dd@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240609-md-drivers-media-platform-samsung-v1-1-d474799346dd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GsTgrWebOi4Bg56DUYAt-fqwd6gj9xlt
X-Proofpoint-GUID: GsTgrWebOi4Bg56DUYAt-fqwd6gj9xlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=831 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260118

On 6/9/2024 2:03 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos-fimc-lite.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos-fimc-is.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos4-is-common.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff

