Return-Path: <linux-media+bounces-16213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C3095055E
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3A4328697B
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B956C19B3D8;
	Tue, 13 Aug 2024 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h8VKp2OM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D051519939D;
	Tue, 13 Aug 2024 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552992; cv=none; b=b+vx3n3I17L9atv+mJYDr0mX7DZLyQbaFBXCSd+CEr0hFUWxxpQEUirRq8mHg4g9Om7gjTACevGTdWs1Zs4yeYmX9eqhhRyh99x4slyrptGuTb/X3IdyFpuCsdyYJ8HPA1e45STfGtW6tsDCAGH85YtYP7q8yqArshPCKgKO3zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552992; c=relaxed/simple;
	bh=A0xDL8KkTPlRgp4KJ4mTJbfYl7ddVVsIH/I+T5JzRlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rab74Sx6zGeKFeLsAKII1bTODRZQbeZhcw/EJf95lEMzL0wIJIJyrQf4Kk7hlHa9yhKAt7t4hyD86tj7uie7ks6gRMD7YhTJ0sMNdI9N6pW7avlD6zxgOp1wSJNHAn5gZOmgfStzYtFFYNoZ/d16WPd4hscCMNe0ggeiBywq9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h8VKp2OM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DCJ8w9003117;
	Tue, 13 Aug 2024 12:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YliuGH2uLcBqc30vKu59+LNAekrgoOWTy+92pxgHbT8=; b=h8VKp2OMIlJaeY41
	aHQe4QXTz6F8oOz1m3TNsB742mx/pLl70GmRN9XpBW7rWufFoxZUvuIBLK26JCZP
	KmD1+qLitnsqUmYhH2zmE4roz8Zia3pr9vbTs85IBwT5PhiR6a2R7YOOrjjf+vxN
	avLtdNmAcwHStv7NMqNAZW/Wlr2tCl1g1EAiitHIoIAeGQ71qUtrlbJnMaUsGife
	nauddILU4bWD52OlLNqByRS215JlqwLRyorR8Zz6CbMEGT3a4fU2cvPW1GIP3NqA
	A9NAx/w+13adDJzDeG/etMX0leO29XcbhCJLTwnNDDDv0KLyFla7yacsQRFIRMtf
	lIWkJg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x17sfrqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 12:43:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DCh6xP017347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 12:43:06 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 05:43:00 -0700
Message-ID: <efe17eae-d578-41fd-a169-3a5c779e3b50@quicinc.com>
Date: Tue, 13 Aug 2024 20:42:58 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] media: qcom: camss: Add sm8550 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <69de592e-a3df-4fb3-ad0c-c8a44ae3efeb@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <69de592e-a3df-4fb3-ad0c-c8a44ae3efeb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4IayG6-89ERFG_mc1EDNNwHC9Ig2Dj32
X-Proofpoint-ORIG-GUID: 4IayG6-89ERFG_mc1EDNNwHC9Ig2Dj32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_04,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=775 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130092

Hi Bryan,

On 8/13/2024 8:35 PM, Bryan O'Donoghue wrote:

> 
> @Depeng.
> 
> Can you please fix the following checkpatch splats.
> 
> scripts/checkpatch.pl --strict *.patch
> 

Thanks for the reminder, I didn't add --strict before. I will make sure 
add --strict option for the new version series.

Thanks,
Depeng


