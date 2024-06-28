Return-Path: <linux-media+bounces-14328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E28A91BCCA
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 12:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C74041F229E8
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 10:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1713E155CB3;
	Fri, 28 Jun 2024 10:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bDG1VjsX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2774DA0C;
	Fri, 28 Jun 2024 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571635; cv=none; b=DUuDSiaBocVDFUDjCRlolWUpsK6S2b/8R72DYiVIjmoXStzhp0k73lXLE2rGvqSHZjSZGOVgrloA0ZbqiLiV4Z6Ln3p1XhtasGDo1LW2P4/aXL00xkc3QNHXXW76O2OoIDAUNI/eoVy8YaIQtdJYopOFu8PgFll+Eru8fokqpAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571635; c=relaxed/simple;
	bh=tu81VLihDtiB2EU/b16jwlMJgEGb3wRkp9Jv94c7K7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mxTJwdUAxAjbRIpJYrh1XbmNXXteqPm5gE+ABU8fWmpzLObc/WE2eR6CO8n/k0z5Z5XQbIlbykzATQBdvcgYRNNZxSETZw1TlYXTUL/L8tnQ50g5BJQHsxcISoiAKFJBaiOmWUtgagkH+TRkQqJLfGVGUp38qXY/bRcPHNUCcfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bDG1VjsX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8Y4hs010650;
	Fri, 28 Jun 2024 10:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dl0rYJ1SY742x7n44ent2QKcUViTZ8BpLhl0ihXX8PI=; b=bDG1VjsX5Q+k6Kcr
	phNRceKLOHLh7HPPRaRToV0+kQMfwTQ2AbqBHq7QJOq/IOX9vPGGLOvYZdrmveYG
	qHZZVMpX59G+HV62ZjM3nYZR8e6Pj7gu6ttBuHNLOtp+pNbOyZW39sIot+CiEjfv
	5IiB81Kg2PnK6NGbGO/DmUUzBjczSPRQo/g6oV0N+VlbuO6upebcKAz+ckLVVXY0
	yjNramgH2XlWGPUHG3wEe4sVvq/cV+hGkTil5j8Jmu4xq56ZKZw8rpleBYTDWLZY
	1bAUSZzJQQAX+3pX7d1cr0txCrVKzjoOPLCbHgQLEeIGVHJ8ZURY25iJ4HJ3AR49
	TUntgw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdqf9n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 10:47:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SAl6oB019972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 10:47:06 GMT
Received: from [10.251.44.199] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 03:47:03 -0700
Message-ID: <75f15e4c-0e79-455a-a356-85c73a0f96ee@quicinc.com>
Date: Fri, 28 Jun 2024 13:47:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Remove unused phy_sel variable in
 csid gen2
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <quic_hariramp@quicinc.com>
References: <20240626074730.85-1-quic_grosikop@quicinc.com>
 <32e23a79-ad3a-465f-97e3-d32cbc75019e@xs4all.nl>
From: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
In-Reply-To: <32e23a79-ad3a-465f-97e3-d32cbc75019e@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OuzYOImc_n7Ez2JkUCZA4PE2r_tNN8xU
X-Proofpoint-GUID: OuzYOImc_n7Ez2JkUCZA4PE2r_tNN8xU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280080

Hi Hans,

On 6/28/2024 1:00 PM, Hans Verkuil wrote:
> On 26/06/2024 09:47, Gjorgji Rosikopulos wrote:
>> The issue is introduced with:
>>
>> [PATCH v4 0/8] Move camss version related defs in to resources
> 
> In the pull request I posted today I folded this patch into that 6/8 of the
> patch series, rather than having this patch on top.
> 
> I forgot to mention that in my PR.

Thank you for this.

Regards,

~Gjorgji


