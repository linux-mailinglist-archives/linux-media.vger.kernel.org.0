Return-Path: <linux-media+bounces-23557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B188B9F481D
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE885168739
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 09:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0091DF260;
	Tue, 17 Dec 2024 09:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IWxqgwI/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A98493;
	Tue, 17 Dec 2024 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734429311; cv=none; b=YC5/J2qVuiaYmxvR5K2UbKmMJoABLslpSeTpqxvWrm9UugrBaX8UL8ZyfkqVoyL/ol1uUTQsKAAXZfTzRjqtLeFQL54qz+TXm14fEtZiYSqjVTGtbeyWbvBH7+rqcsiL1NXXznK9rLpp2YfQm4p2sMjl0l0mDZ8bo1sgzkqw1qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734429311; c=relaxed/simple;
	bh=ASwT3dBIE+Xe434ZYqsgySLJsNTsAAHaS+TMDqk7T7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lseITdiyZO3xwOvIfHCY9yvL5ptXUxAda9BEJeHT3EObhuQuhJ5Lqg/GW66r8RmmxPI7L4nqun73beX8is6VO3TWa6KWiAvAgLf8kNOg5ZDszfh98pJXLc8kq0hb1+bnLPEGqvRZP6O4TbIBaARJJT1s7sSa7XpKpfBsZGLnx7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IWxqgwI/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6mlVA012414;
	Tue, 17 Dec 2024 09:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJF+dftQDbg32x5CFuyMgScGHiLqd4PnLoUlD3aMEbg=; b=IWxqgwI/KB6xpbf3
	G+vH3O0513T88tpZ2OIFY/wLOcSesoRzRW2m94eCx5W1eGYVV+4WntQkj/q+im8m
	sPuUvcRa5uslSObDEU48wYHn204Kt8WzTj/UZBd4+fOyKq52O7jj7+SUIVfiOmpf
	+3EwMJuZfj+y0iL4wAO+8BN1NHkmYSeI/UdpvOq82dJU4NIyPdm+wmcSRFihKO3v
	BLwPrfe2AVOWjAq9QRO2P/4ncPN4+XGeRNA4a2x16Yyhurz55FsW7LTtZkmA8Qb1
	qwNz5YlbCmUOApC7+of1WyPB3/mRrgoWGcLtmu0zEpEgv//iI08F1EpmbNKBD6hE
	oUzGNw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k4bx0ft7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:55:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9t3I9027034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:55:03 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 01:54:59 -0800
Message-ID: <3cb0d715-3756-4cef-bcc0-3bb550811c73@quicinc.com>
Date: Tue, 17 Dec 2024 17:54:57 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: qcs615: add venus node
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
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Stanimir
 Varbanov" <stanimir.varbanov@linaro.org>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
 <20241217-add-venus-for-qcs615-v5-3-747395d9e630@quicinc.com>
 <83fcb683-d610-4e47-bcce-128453a0afef@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <83fcb683-d610-4e47-bcce-128453a0afef@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AWIHRqAkPd4xZTxuhKud3K32m77Cn_Ny
X-Proofpoint-ORIG-GUID: AWIHRqAkPd4xZTxuhKud3K32m77Cn_Ny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170081


On 12/17/2024 5:38 PM, Bryan O'Donoghue wrote:
> On 17/12/2024 09:17, Renjiang Han wrote:
>> +
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +            };
>> +
>> +            video-encoder {
>> +                compatible = "venus-encoder";
>> +            };
>
> I gave you feedback on this in v4.
>
> Could you please provide some commentary on why you're persisting with 
> this ?
>
> - Driver configuration should not live in dts
> - A patchset exists to mitigate this
> - If you don't want to use that series, what do you propose
>   to resolve this ?
>
> Please don't just ignore feedback, either act on it or add to your 
> commit log _why_ you didn't act on it.
>
> ---
> bod

  Thanks for your review. You pointed it out correctly. As replied in v4,

  I also think your change is a good change, but your change involves many

  platforms. I am not sure if other guys have comments and when it will

  pass the review. Currently, it only refers to SC7180 and falls back

  QCS615 to SC7180. I have verified it on both SC7180 and QCS615 platforms.

  I think when your change review passes, we only need to remove the

  video-decoder and video-encoder nodes in the device tree.

-- 
Best Regards,
Renjiang


