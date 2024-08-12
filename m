Return-Path: <linux-media+bounces-16136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195994ECC4
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 14:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07201283DD5
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 12:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DB817A59C;
	Mon, 12 Aug 2024 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cMbjAZL/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD1D1E488;
	Mon, 12 Aug 2024 12:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465253; cv=none; b=I+tt9s5u/GvTMBD4Yckf0zKko4Pu2Q1ZCUiW6eh/xS3BZUVzokitAv6HhsNa/X5+mLaUFEM8EZHbBp8VBju88WiMsEt8KNX7uLEFmV9XonzD1wo5nvhjrHZkua7vV8RzUhNtx9y5B/9QDH2f0hHgHr8CbwWWJf6gnUyqbtu6dP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465253; c=relaxed/simple;
	bh=1YupIR/WrFatl2Xt2QU3NY9HGthGZzzdM1AN2OFbVoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rcf2Vi/DFToxRUG26saPhJX50MQSrdvH6g2v1lD4/juO7vU0JEFsKKgmCJB6bK5Uj4lyzPXs/mFsg1ef61p9o27Lk/joidl22nJ6GqRgJkQzGY7jeUwOduOyBdhX4DLOvO2L3nRPJbjucWaM5xnmxlZXIaBfqddq1mZisa4F1Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cMbjAZL/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CBGirj013406;
	Mon, 12 Aug 2024 12:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWPtKDhp4eEtFiuCOfIQxpQ/ou+Qfq27kgkQVcx5ZkI=; b=cMbjAZL/yhVHT5Ui
	x8Hup7xL1YOojbz8FmcwV2ct2GZgqnrHbB43uMEtHC7r644c7LgJRhncPs1yR12Q
	9X3saVd5bh82b0L3OfaiurJGi/l+ol7x88PAWUbFe+Ot90I1MvoGrxCMP9xiIwrg
	B6r2xxsT8ecCUB45UInvJNZFcTV73UWiyX02tjvUnN3PnzHlpNGbOIpd+hCvE2ra
	ZapPvY84SrHDlg8LwX80vfSF1cJ41lNtULO5q2szhJ1gEPoZI8q8Uuiqq+DjZ3/h
	iF7bbSqOXa8F4m/sNdOkdl++lzfmbgvvdH9xkxYgmJc7WV8PKeyONDWLHHwlt7YY
	7R57/g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x17y43ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 12:20:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CCKkbg025121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 12:20:46 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 Aug
 2024 05:20:41 -0700
Message-ID: <8b2ce0a5-ac79-462f-aed1-48de90973a66@quicinc.com>
Date: Mon, 12 Aug 2024 20:20:38 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        <rfoss@kernel.org>, <todor.too@gmail.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-5-quic_depengs@quicinc.com>
 <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
 <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
 <4426c0e0-f877-409c-b2d2-a5aac5e8c645@linaro.org>
 <1226d080-d1fc-4e06-ac81-84e93cb314e0@quicinc.com>
 <8f935a7d-87b5-479c-a98e-c95671dbe259@linaro.org>
 <7c03280f-908d-435d-acef-b6bf4f865029@quicinc.com>
 <ff12ce12-41d6-4aa5-ab97-222b07146e36@linaro.org>
 <3241cc15-c920-4c88-ac53-005903baf9e7@quicinc.com>
 <e7476a09-4e11-4171-89ed-61b41c9f5cc9@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <e7476a09-4e11-4171-89ed-61b41c9f5cc9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aAMEPhFpRKYy2-ETS2FBa9e58br64j89
X-Proofpoint-ORIG-GUID: aAMEPhFpRKYy2-ETS2FBa9e58br64j89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_02,2024-08-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 mlxlogscore=838
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120092

Hi Bryan,

On 8/12/2024 7:32 PM, Bryan O'Donoghue wrote:
> 
> Ah, I hadn't recalled why the .init was added -> because sequencing.
> 
> Lets retain the patch but expand the commit log to explain why the init 
> is being added, instead of jumping through hoops to restructure to get 
> rid of it.
> 

Thanks for the confirmation. I will retain the patch and add more commit 
log.

Thanks,
Depeng

