Return-Path: <linux-media+bounces-27705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F217AA54AB3
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 374F516B921
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 12:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A10720C025;
	Thu,  6 Mar 2025 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KxoHPM7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC8920B803;
	Thu,  6 Mar 2025 12:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741264051; cv=none; b=S4R5aQJVOtdvU8BjaWZU4dwaJ/rncImJMkQ5TSfVD6Aw7028DJVk+M3IXebXrBZgvCPVYN/1ScGLePTOcU9vjWK6K7lP5kLYDxg8XOJ+OwRx3L7eegGoF2yVr4LmVQ95q3gS5SO0IfoT2+es6aAf80hiPQm1Jkd9cOTkRwureS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741264051; c=relaxed/simple;
	bh=i6lhP4dLCbuG+vXuHqvcoEZMh0tGfth+sV3ZOUeeA3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oYYvUQiqPwBUOq7GpwwNXwC/POYETJNhoq8TAqanexA+v06PKoMkqqttWKUaNlzEfm5DIEOOiIIoUZXBA9xkqnjQIjMQcpENc1XMFAYnxhwAD/v/SogF3q7WocjM41+Zm51SdfAnAkIt33kLG1htXtmxUIJOiT1iXEIVjQ4bdcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KxoHPM7Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52699B3U028897;
	Thu, 6 Mar 2025 12:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNvXtXzlNRsNDmsd+K6pePAdlNt7Cl9S+JRR+eX3utU=; b=KxoHPM7ZvSZqoyF5
	Bc4MMUoH6byTHr8V/1M9zm4OXYxsqhe2YMsKvsAWXEu/J4SptY6cfb+MwAJs+fGr
	vFsHswDXCODpEWH7caHTVYKloukOUqhGI3p7da8492jQvucZ0odJJ5rD8Ge+ql0Z
	J+i+tmi9mgEu0/vhNpgk6+F9n51hvuc4Wm0b+z/sJY0v+Cd9Xo4kPZjzSpgFAJjO
	QAo0KtNDWIziZ4jbtfM51SN5cd1UeZHtxsostfDOeFjpN572r+Gi2wD9k/ISHof1
	giR4563BcDaOsEXYAviTXbBTaksYt3Xn4zWsUSZZbYMO91VbmIHUGqou2nj6r0y+
	MXohVg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tryex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 12:27:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526CRPhX016421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 12:27:25 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 04:27:22 -0800
Message-ID: <a74e5ca2-f5ef-3dab-723d-6ed99d1d0d32@quicinc.com>
Date: Thu, 6 Mar 2025 17:57:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 06/12] media: iris: Update CAPTURE format info based
 on OUTPUT format
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-7-quic_dikshita@quicinc.com>
 <zw42tgyhxedcifrad5i2gam5sbjjczcaopv4iy2fy5hckkjdsj@crawjvp7bdox>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <zw42tgyhxedcifrad5i2gam5sbjjczcaopv4iy2fy5hckkjdsj@crawjvp7bdox>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c994ae cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=JMUmPn8huWlHet3H1LoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: r0d6DtmSGc0AZEFozAiyInf22UjI0l5o
X-Proofpoint-GUID: r0d6DtmSGc0AZEFozAiyInf22UjI0l5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=898
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060094



On 3/6/2025 2:15 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 05, 2025 at 04:13:29PM +0530, Dikshita Agarwal wrote:
>> Update the width, height and buffer size of CAPTURE based on the
>> resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
>> updated capture resolution to firmware when S_FMT is called only for
>> OUTPUT.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
> 
> This also looks like a fix, so Fixes, cc:stable, move to the top.
Ack.
> 

