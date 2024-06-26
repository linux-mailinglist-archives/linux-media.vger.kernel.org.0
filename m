Return-Path: <linux-media+bounces-14193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE68918815
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 19:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 696A728325F
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 17:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54B218FDA6;
	Wed, 26 Jun 2024 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pv4TzKQn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D0213B5BB;
	Wed, 26 Jun 2024 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719421236; cv=none; b=R+SuOYv7gYQ3UjTKej8TDp3MsL6WuLlNg4LPwxn12D8b1a/kr0xlorFlfyfplb15IrnuRshAOT2QS3iRf+hn5ZA++j6uAZtihmKXA4E68pZqRQbXnGiy9rwHt2/oKnnc1C3ldts8ZGxgcr4fnwZU6fmzwLRgmsbGLi3KzWsMzkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719421236; c=relaxed/simple;
	bh=kAJq1vqOBsIF3n9EKsntLdDTk+2KZyYEdUBRj4Hjz7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VOkimivCo5YmZofMdeqLUuyGsQlnDyyYdt50Z1FKijD6M0Q51V7jwAJROVdN8wRwe+GHg1VpV6HdvOeF7UfGUWUXvcV6+HSyakrlWKJN/pn5L2VXoa6UKN1fmxt6Qli8KQxfO2ng9lzkZcMuPpxgzAvceDhjeD4g74S1pWgsp78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pv4TzKQn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfOSj015311;
	Wed, 26 Jun 2024 17:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmPVPdiU8x1KB2xLvCt1RxGaCfCJc3EpM+BN6okWvWs=; b=pv4TzKQnzfNNmYqJ
	sqeSZ76soOAawDgYt0O7zeZY/gC8NCfeoiyybw28/jQTWAgXUJClH/IdifeGYavn
	eSUebRAPeikwyPLiE7+u6jFuf5h/jSoI5e68louiWIkfJ1npaB6cAdou5kDudTAY
	zpOk5rn7gOfjCFyVWGABdHFbU8mSuIi7Z4bg6SPtmFQMKttdQ4/bZp26xYOb6YVq
	XFxKsdra4TofzpRs//Tcp1/FWvw3ziPJmcjmOfggBurZ5jKHHWW8da5dDqmH49tl
	mwL7In/vl07O87q8QNZiQpS8ZUc+F/b83Qe1dEwk0UngIy3ZWn7QD8+lOUscKK/m
	5D3uIw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400gcm94nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 17:00:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QH0MRY024683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 17:00:22 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 10:00:22 -0700
Message-ID: <c8624081-40e9-4d12-9cc0-e5a8cc82f211@quicinc.com>
Date: Wed, 26 Jun 2024 10:00:21 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uda1342: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240612-md-drivers-media-i2c-v1-1-7011b578a07c@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240612-md-drivers-media-i2c-v1-1-7011b578a07c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LpoAU9foF5PIxlgNoyLvjH1ipMhFw39V
X-Proofpoint-ORIG-GUID: LpoAU9foF5PIxlgNoyLvjH1ipMhFw39V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_08,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=987 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260125

On 6/12/2024 11:19 AM, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/media/i2c/uda1342.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/uda1342.c b/drivers/media/i2c/uda1342.c
> index da7bc4700bed..abd052a44bd7 100644
> --- a/drivers/media/i2c/uda1342.c
> +++ b/drivers/media/i2c/uda1342.c
> @@ -95,4 +95,5 @@ static struct i2c_driver uda1342_driver = {
>  
>  module_i2c_driver(uda1342_driver);
>  
> +MODULE_DESCRIPTION("Philips UDA1342 audio codec driver");
>  MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240612-md-drivers-media-i2c-3e80a673c97b
> 
Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff

