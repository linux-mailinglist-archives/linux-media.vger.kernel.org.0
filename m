Return-Path: <linux-media+bounces-14192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3279187DD
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 18:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9041A1C224FD
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 16:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8013218FC8B;
	Wed, 26 Jun 2024 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SXUtAY1V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE9F18A930;
	Wed, 26 Jun 2024 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719420489; cv=none; b=tclfW5FAnkYdSTZWtGR48OuJkqHBz1aB6A4Uwx7S0C0dDg5OsxznHc5h4UeTiIK64uJSsNTFFMa7KOLVxlofIfWIVc+APoGrks81udcaPgITKu6HYYPNtdRjJ7626Xm1ygrQKcCkgd9DQrRROD7kaWaYANoymp7rXgMKzf0Czao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719420489; c=relaxed/simple;
	bh=v9c9gCDD50kJKTR98CPtlOUOthy3lH05Vb7day1o2k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LzQ22nmhczn45/ZPNh2ssLC9MvkxqV0rVNskTJ3UX5htWQbk0LjEJYM7vBMA5XVP777f6SGXbBhvSKAN9YzR8159+J9bXzyfnYvrn99AYOoQyxDR53VYDfQ5qNBsbSCWtKg64JBdjNJ3A57DVvRPU2F3lYWIIMRGrWqbg69YNzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SXUtAY1V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfTUS015135;
	Wed, 26 Jun 2024 16:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ETWPLAHJDK6OPrtKtGmoQayVyELxnRSARfONBaSNs4=; b=SXUtAY1VOmA6Y4Y/
	GtRX8x/NradVg+t/EW/y0qoxgIkKTENZNS7YARqEnxwrn5U9ypWtkfkIln9rFn1r
	Qv49odflaYAPCwp3AzwBqilfLx4l4a6XiKEr49CvSRyUdAr+AqgFJiWZxOhxM7Hp
	tqgk8zMl1Qmtl+K2MqS9bKOEG+ZFHRgEfg5MDlRP4NDmpeVfOf2Vf92/EyCWsxTC
	ScqbuzzSZB8QgvOZrCC881JelCDM3ho6KNeJBinKzGUKNg2jmfq++dAfmxnnDpAg
	+00AxtL9mtONvUXTvvLieaxls/PwfIABIMTPZvtuGvyN16FJ/TFZw7iJUG1J1pXm
	NgGVwQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqsht8k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:48:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QGm1ic019622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:48:01 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 09:48:01 -0700
Message-ID: <e4e37dfe-9d1b-4428-9067-7b9f584d2466@quicinc.com>
Date: Wed, 26 Jun 2024 09:48:01 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: uvc: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240612-md-drivers-media-common-v1-1-b5603c85f629@quicinc.com>
 <171824064052.2248009.2434759914694160537@ping.linuxembedded.co.uk>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <171824064052.2248009.2434759914694160537@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ye5-Y8z40Kwc-fLbLKBSE4xKcMQyDXnO
X-Proofpoint-GUID: ye5-Y8z40Kwc-fLbLKBSE4xKcMQyDXnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_08,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260123

On 6/12/2024 6:04 PM, Kieran Bingham wrote:
> Quoting Jeff Johnson (2024-06-13 00:58:59)
>> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uvc.o
>>
>> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff

> 
>> ---
>>  drivers/media/common/uvc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
>> index 9c0ba7a6c185..c54c2268fee6 100644
>> --- a/drivers/media/common/uvc.c
>> +++ b/drivers/media/common/uvc.c
>> @@ -180,4 +180,5 @@ const struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
>>  }
>>  EXPORT_SYMBOL_GPL(uvc_format_by_guid);
>>  
>> +MODULE_DESCRIPTION("USB Video Class common code");
>>  MODULE_LICENSE("GPL");
>>
>> ---
>> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
>> change-id: 20240612-md-drivers-media-common-01f67d64768a
>>


