Return-Path: <linux-media+bounces-22763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C229E6416
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 03:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D3481884E9E
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 02:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54290176242;
	Fri,  6 Dec 2024 02:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iu4rUoOQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B70B3D6B;
	Fri,  6 Dec 2024 02:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733451995; cv=none; b=L8z/+ulPnyGf+SrhE8O83rkWFjS3s3cJo6YKhb0BVQlHwTXwneyqHzfaxG0GRUihf0hQGyuudo7LpMt8UhY1v51/ZTP0ZRcWlWNTScXa7L8O/rtw0UdWPo+aavZJTBjvRPFLjpS+bDvwYK2cpEfI0auod0x1TGm81Hbb+UW+XDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733451995; c=relaxed/simple;
	bh=BLvlRbUmyq9wqF6MOnOUf+wp2LcCr1ZjnyexWKZ5QMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iC+uxBTAs5ubB3/mtKvdbmdvR8yduyOo/VIOdi/UpVyNqODv+kKlpzGoo7DVpbnvrswZ+X5p9gv8HSg4bDAMmE5hd1Bey/F9z/jkcjgWW0x4Ym5IKo1sPWfA4raBk8IPz5SqVfOLcdDn+zPKsnjd+TSpvsvfXGxKCOp3W1HXN2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iu4rUoOQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Hab6m031661;
	Fri, 6 Dec 2024 02:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuXV/WTJk/ApAbbvIzzdpMweeZCe4oTmgvEo2j1f0ig=; b=iu4rUoOQSn94S1dA
	9xSz3k/tJ1F3SePhtSVCxiegVAp9eWJU5Ewp4a2tC8rTsR7V4sHj4ok9DxLYDa8h
	98g/WvCcg1FpzHs4NBBzqFD/q1dzuZ470gAqjgUObjCrWeinnYpUCp4GTPQ0imIT
	fA4BbMAjc5hoHPpcHmogBNQQulbwWmycr2rxebZ3FrjPgWY7HYj4TV+NuTsXtMkg
	msqc/dTAnj4zIA8S7RqreO6EWfiMDRnO1uzILumY1JlwfkDSMbelGKTCnom2RNhj
	1qIKfBFMCh6Ww6icfONpfQp8geMCQhbCr7vJDrmOUGVwSG0rgQo8XmrmSYxT8fuc
	NH3zhQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be171m1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:26:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B62QSOt021104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 02:26:29 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 18:26:22 -0800
Message-ID: <80db8c51-90a8-4c52-ac88-3c29da436e39@quicinc.com>
Date: Fri, 6 Dec 2024 10:26:19 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2
 two-phase MIPI CSI-2 DPHY support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-15-quic_depengs@quicinc.com>
 <85166c63-1e8f-4f80-abb7-5426383b4641@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <85166c63-1e8f-4f80-abb7-5426383b4641@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G0eZuDHAzH8PwwI83ePejLWk-_bGEtdu
X-Proofpoint-ORIG-GUID: G0eZuDHAzH8PwwI83ePejLWk-_bGEtdu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=784 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060017

Hi Bryan,

On 12/6/2024 12:15 AM, Bryan O'Donoghue wrote:
> On 05/12/2024 15:55, Depeng Shao wrote:
>> +    {0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
> 
> Please uppercase your hex.
> 

Thanks for the comment, will update it in next version patch.

Thanks,
Depeng


