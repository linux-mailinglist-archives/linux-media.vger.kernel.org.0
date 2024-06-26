Return-Path: <linux-media+bounces-14190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A137918790
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 18:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2721A1F21D2D
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 16:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B1718FC9E;
	Wed, 26 Jun 2024 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e9NxQsmh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71818F2F9;
	Wed, 26 Jun 2024 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719419886; cv=none; b=bUv90Xvj4gxyjkOrWlFhuIKLIZT+J9LMRwwTr9Huam9ZZZeGTSWS9QmJTCSS4JZyG0ljplDp7suf8A9oyq5OM/2BJFwEcd7nfJ6WP8+WKi4EZLObtL3kLKXxSkMWYlVCUMDjtgI4WKhVUlKsQYRKLWw5UaAl+MzR6nC+O8TMqlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719419886; c=relaxed/simple;
	bh=quDgZOW6YvheFb7yHwFy1dLNIq03jS6xr5TWbu53Ok0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TFvcWyCBwSzGIllYfVchSLLb0cSUj1+imtb60v315OEB0lJhyDFttNIsjcx3WFNk5W8RRKgVm4YDavMpKLr1XdplwRz7B+z/wleKeY7d4B/sKL94gtRbl6jxPiTGMjGEvkrKiDzQQbzUFgLVEtXrrNMvEmgSAPBegBOj6P7lQ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e9NxQsmh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfPi0023204;
	Wed, 26 Jun 2024 16:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeQVUKZnUwKoGoDNJ2FAjvUYnjPiyCIqsv16t1D3psI=; b=e9NxQsmh0yKvL+HD
	8mWSoY5rsvRq3mgU9VZhg17Fu4PBjQ2+yEpbFvdRThH1Inmo18nkRpWeOod4Aqu+
	lyF7lqKtKonxkSKAmkuZAHLMyuTvLM9Rvh4IaXiDyEgxGsVnL1cT1ZrePthSyZNX
	dtVORKoTxEmAropQ/j+ErkI6P6Qyb1QAA++lHpsApdqT4nem/Zm3QYyBznEgEwhY
	zM+8xeFoCQHHTwvtp8nQ1YeleF+7P3TtIret0mBbVnpeIWR0+kETLtlJPq8S8/fY
	mikuiNBeEeQX4UyQsKAoXl92tjKXvpGfZVeJNUlXGCQXoCKr66rZBQud8fpzYyXT
	gPTAJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywpu19p5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:37:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QGbsAt004988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:37:54 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 09:37:53 -0700
Message-ID: <be4544a3-ac67-4d4c-b00b-0e2e47a7522a@quicinc.com>
Date: Wed, 26 Jun 2024 09:37:53 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20240610-md-drivers-staging-media-atomisp-i2c-v1-1-c7b63464fae5@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240610-md-drivers-staging-media-atomisp-i2c-v1-1-c7b63464fae5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rJ-s3Ke3Q4OKJORi2gQRNgnrVPlDxD72
X-Proofpoint-ORIG-GUID: rJ-s3Ke3Q4OKJORi2gQRNgnrVPlDxD72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260122

On 6/10/2024 5:34 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/media/atomisp/i2c/atomisp-mt9m114.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c | 1 +
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c          | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> index 7a20d918a9d5..3499353f8ea5 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> @@ -207,4 +207,5 @@ module_init(init_msrlisthelper);
>  module_exit(exit_msrlisthelper);
>  
>  MODULE_AUTHOR("Jukka Kaartinen <jukka.o.kaartinen@intel.com>");
> +MODULE_DESCRIPTION("Helper library to load, parse and apply large register lists");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index 23b1001c2a55..918ea4fa9f6b 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1614,4 +1614,5 @@ static struct i2c_driver mt9m114_driver = {
>  module_i2c_driver(mt9m114_driver);
>  
>  MODULE_AUTHOR("Shuguang Gong <Shuguang.gong@intel.com>");
> +MODULE_DESCRIPTION("Aptina mt9m114 sensor support module");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240610-md-drivers-staging-media-atomisp-i2c-18a7a4f883eb
> 

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff

