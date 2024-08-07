Return-Path: <linux-media+bounces-15889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3B6949FC8
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897CA28624A
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 06:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F6F1B32AE;
	Wed,  7 Aug 2024 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MttVHUsw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88AF1B140E;
	Wed,  7 Aug 2024 06:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723011861; cv=none; b=cOWCNzFDYFv9ADHa2MUU7sO3G+Cpq8JEXmx8yhF6yZ/avWyueZji8SAvNVyOZuaBtoJt5I6C/IXBNPUQwALaVRPW5GBkFBU2gKLnUkllkb7AmXtI4lkDYdkedf4K08BsaYGYjmoHx1PyWy2nycbS7W2hcZATBBRDG0HMrj+0h8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723011861; c=relaxed/simple;
	bh=qYL1jdUFmUofOJhUNwRtcnZ1ZDkikdXKOxyp7AkVQtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DN95zlYtTAdciIUOOAPVwyA2tW/fzckmaaQIyeD2rrZW0tzYdfLekO23HZmGQ3yIdsXofmNbtqdJO4GFLF7ArSaU+5h3CRg3X0fmnCxvZcln/Yz14JLA7IT1kRaX+4H+Hv4JlgqaHO2qwh0tyAs6gvHrnCxAT57axJif12KQ9sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MttVHUsw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476H6Pis026262;
	Wed, 7 Aug 2024 06:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9s79fAKYiUlsCZo3uE1MmEk6PCJRg+7oFdxceWMbMqw=; b=MttVHUswSwJ0ur/u
	JlGLA/TOlRd9BCA56Zcvr/5q8zrrpByx6PsMknzMgZ+s+8w1I1006lDWea0ZwxdG
	EmHmzxYwGeKvtH37sPrGzLHfkWELoOHIFdwzFisZtcO1uxWESMU4tS0sTRDcnUgK
	lnrhrhryi33bum0w8LhyvQzzpNqLOvOscnNdY9fAOU58hqKgQcTHIbFej7h+fSMd
	8EV5eACnxIS+0RAB27nOvYOMarAIC01X3sDcBKZRJsPuttkwBVRtG5OOoKuuf4D3
	Vg/ZnWEV7oeA6MKSl7YbGuMTtuwsI86LspCr7waSOt/K++D1H83y5id7/iA5vrzV
	gjTsLA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40tuhvxdfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 06:24:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4776ODjf024968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 06:24:13 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 Aug 2024
 23:24:08 -0700
Message-ID: <ddfe9789-2747-461b-86bf-ba751f51d918@quicinc.com>
Date: Wed, 7 Aug 2024 14:24:05 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add sm8550 CAMSS core dtsi
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240807053400.1916581-1-quic_depengs@quicinc.com>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <20240807053400.1916581-1-quic_depengs@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4mrN3EEgpWL8lp2LXf17jvACK9Lg-emr
X-Proofpoint-GUID: 4mrN3EEgpWL8lp2LXf17jvACK9Lg-emr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_03,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=666 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070041



On 8/7/2024 1:33 PM, Depeng Shao wrote:
> The sm8550 provides Camera SubSystem hardware interface similar to
> antecedent parts sdm845 and sm8250, but different interrupt lines,
> clocks and other resources are declared.
> 
> This dtsi definition has been developed and validated on a AIM300 AIoT
> board, the description for this board can be found from below link.
> https://lore.kernel.org/lkml/20240618072202.2516025-1-quic_tengfan@quicinc.com/
> 
> The driver can be found from below link.
> https://lore.kernel.org/all/20240709160656.31146-1-quic_depengs@quicinc.com/
> 
> Depeng Shao (2):
>    dt-bindings: media: camss: Add qcom,sm8550-camss binding
>    arm64: dts: qcom: sm8550: camss: Add CAMSS block definition
> 
>   .../bindings/media/qcom,sm8550-camss.yaml     | 517 ++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8550.dtsi          | 199 +++++++
>   2 files changed, 716 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
> 
> 
> base-commit: d4560686726f7a357922f300fc81f5964be8df04


Hi All,

Sorry to disturb you, please ignore this series, I will resend the dtsi 
patch and drop the bindings patch in this series.

Thanks,
Depeng

