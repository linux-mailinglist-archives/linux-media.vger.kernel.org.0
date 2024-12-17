Return-Path: <linux-media+bounces-23535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF4D9F4311
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 06:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9091A16C917
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 05:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316AC156227;
	Tue, 17 Dec 2024 05:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n5BOKR8h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203181361;
	Tue, 17 Dec 2024 05:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734414025; cv=none; b=gAAbWh7ubXa71TGwXx7KgnKDAl/GyizriLZxY3VMLYZAtqhq9C1NVdPftWKZqvSsVd1Ojj95JTemJLwg3NAkPHaEEY7LZ+N0sCmZcGjF/X8DUZYoXFfIbQI9aQmdkUhQ7dhM0X3yqdN7RQySDzoL7lXkouWuPhy2OOEYpXP0qcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734414025; c=relaxed/simple;
	bh=ajYQubgExtwxT9Y6UC7qPjH6IIHHBHbVSh6q42sE1Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jnqbAFVuDPmh7uH64RSQ4o3oXZMnCl2aVxeVFVB9lWd34O5ag0NUt1lbzE50/s7W4/jxLMA4c41mtVHjP4SgU+AqOA0Y60sUbg1JViTD8Kn+l/3LvHVrJcZ2LVmXcgb9wH9uYZIh2ZJ+W06c2z0UVrdy9ySPB86IOpjWgRWjbQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n5BOKR8h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4mKs6014621;
	Tue, 17 Dec 2024 05:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/Ww6Sh1gy0E5p7ShT8721JM6G512LBTOkj2cFNkvpE=; b=n5BOKR8h89PeoeYE
	oBQNbdfxt7DQva6LOYXjXaQFj+xReYHkI/Eq8MbzrdBSjBzn89KwKojpawRVXizK
	vhT7whEdKOy6TGS05/g3K6XNYLSMZvlInPQCF1EvZfTXqQOH2DWLEyLk3WEmWMlu
	Bqp3A/2GbtjkBMFMg5T35EKCI06eTiFKsQG80nOAdmyQFw9O825/qIXhRkyvYx3P
	Z07il7nYeZDoqsLc6jPqr2uPxvDuYl/HkARoYJJhoX22UT5bNyRlv9NugBvXPfAd
	30mS0x40/h8xv3H1EJwjVCozpHvRhwVUgMAX9APNewRPixddgpYKkRTXhvP2CawB
	gYrBJQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2k7g39w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 05:40:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH5eIZw015849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 05:40:18 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 21:40:15 -0800
Message-ID: <203d7c3e-84fb-45db-a81b-525419abaa89@quicinc.com>
Date: Tue, 17 Dec 2024 13:40:12 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: add venus node for the qcs615
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
 <20241213-add-venus-for-qcs615-v4-3-7e2c9a72d309@quicinc.com>
 <ae83acc2-534d-49de-a0ec-b2117e5bd4d1@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <ae83acc2-534d-49de-a0ec-b2117e5bd4d1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N4ZthVovUyymlxe7usnadGdo_m0l3Wff
X-Proofpoint-GUID: N4ZthVovUyymlxe7usnadGdo_m0l3Wff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170045


On 12/13/2024 7:31 PM, Bryan O'Donoghue wrote:
> On 13/12/2024 09:56, Renjiang Han wrote:
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +            };
>> +
>> +            video-encoder {
>> +                compatible = "venus-encoder";
>> +            };
>
> To be honest, I'd prefer not to continue on doing this.
>
> Adding a compat string to existing yaml might work-around the issue 
> but, it doesn't really _account_ for the issue.
>
> I've posted a series to fix the problem
>
> 20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org 
>
>
> Either that or deeper rewrite of venus to remove the above 
> dependencies should go ahead.
>
> I'm not in favour of willfully continuing to do the wrong thing, 
> especially when per above, there's a working solution for it.
>
> ---
> bod

Thanks for your review. Your change is a good way. But your change is a

  big change, involving many platforms, I am not sure if other guys have

  comments. Currently, my change only refers to SC7180 and falls back QCS615

  to SC7180. Now I have verified my patches on SC7180 and QCS615. I think if

  your change has passed the review, then we only need to remove the

  video-decoder and video-encoder nodes in this device tree.

-- 
Best Regards,
Renjiang


