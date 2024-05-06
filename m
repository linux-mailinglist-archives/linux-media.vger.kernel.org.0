Return-Path: <linux-media+bounces-10867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D23648BCDB7
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 870B41F251EE
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 12:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E204B143C51;
	Mon,  6 May 2024 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k0eHOyo5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC440143899;
	Mon,  6 May 2024 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998136; cv=none; b=kNP2xCnZ9Ya1DBCYPgwtUfAWaa0B531zo78tWkCys7QW74BFuy1cs/EGGSz82iU51cB39EtfQAnOL7imkQJ+2aesba3Ube78NRfNwlnDUAZXKWtjvMBcptfsUGoHBz2dAtdOvlTr55e4FoPlV+z0HfPsMKJuVZMeioxDmvLHdW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998136; c=relaxed/simple;
	bh=vzd6/g0j/LKpzRJ0n5NOO5gT3MBm83kOUuJoCDjo1YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BUXBf4GOJ3iXnTezLmRbNEuQQDT8ySZre2+zvttydrHJ1YCRY2nN9I60GmC9EBKxdwKBub8ex3vmnKGlAMAc4Ck2qXBjIv2eYzkU+HzpPeJf3e/Nflt6z/J+soYcYTw3vifACkNwQd9n2wGTBSkXCVIwY6An7kmyLkas0yxg+YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k0eHOyo5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446BoaQr013364;
	Mon, 6 May 2024 12:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Dia/565uBgwal8VAh3McJ3ZZl+6Ufop3qtDDWi4EWFs=; b=k0
	eHOyo52uxrjZGsrpx3TME8nV3Nhcwhn0pIVNhxT0HIqVKi3XufocvoJGzTn2b5be
	PUdaBhxR1Eozk8QbFHmya0pswa7pqd36rc2jjE8HuSQr82grtnyolASBoQ83olza
	8oPBRbKEUIRIfb7AyRESl6CkpcYtPcAlPxOq4JpZrkMCmJaVtr/LaPXGABVNs5T6
	jUNGaOq23mRXzOP5VJn+E31yMdw+7kqmv+MLbfvHseGff33/UKVkYWvHdakmKNWD
	INvVvwDcF2JzoOTDdd6gcL38mRgnMMgfuCl9QkgCtfplR/81Em03ISEnQ/G3w7AS
	jcU9il/4gGDiK+N5tAjA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxt6n0n68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:22:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 446CM8t4002182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 May 2024 12:22:08 GMT
Received: from [10.216.21.139] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 05:22:04 -0700
Message-ID: <0bce5d7c-8133-f3c7-55af-c5b8f89a5371@quicinc.com>
Date: Mon, 6 May 2024 17:52:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/3] Add support for qcom msm8998-venus (HW vdec /
 venc)
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marc Gonzalez
	<mgonzalez@freebox.fr>,
        Bjorn Andersson <andersson@kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Stanimir
 Varbanov" <stanimir.k.varbanov@gmail.com>
CC: MSM <linux-arm-msm@vger.kernel.org>,
        linux-media
	<linux-media@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>,
        "Pierre-Hugues Husson" <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
 <f5b9c8d5-d8ed-4dd1-9cd6-fb016d84cbd5@freebox.fr>
 <12daeed1-0075-4a6c-bd02-dc70a0c0d721@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <12daeed1-0075-4a6c-bd02-dc70a0c0d721@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kTyPJ44fUyPfx9de_HpB-uPgdamB-N6N
X-Proofpoint-ORIG-GUID: kTyPJ44fUyPfx9de_HpB-uPgdamB-N6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_07,2024-05-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2405060085


On 5/6/2024 3:55 PM, Bryan O'Donoghue wrote:
> On 06/05/2024 10:57, Marc Gonzalez wrote:
>> On 30/04/2024 17:28, Marc Gonzalez wrote:
>>
>>> Changes in v2
>>> - Add Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> for patches
>>> 2 & 3
>>> - Replace qcom,msm8998-venus.yaml (copy of qcom,msm8996-venus.yaml) with item
>>> in qcom,msm8996-venus.yaml
>>>
>>> Marc Gonzalez (3):
>>>    dt-bindings: media: add qcom,msm8998-venus
>>>    arm64: dts: qcom: msm8998: add venus node
>>>    media: venus: add MSM8998 support
>>>
>>>   Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
>>>   arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48
>>> +++++++++++++++++++++++++++++
>>>   drivers/media/platform/qcom/venus/core.c                        | 42
>>> +++++++++++++++++++++++++
>>>   3 files changed, 93 insertions(+), 1 deletion(-)
>>
>> Not sure what's holding up this series?
>> Can it be merged before the 6.10 merge window opens?
>> (Whose tree is it supposed to go through?)
>>
>> Been working on this feature since Feb 19 with
>> [RFC WIP PATCH] venus: add qcom,no-low-power property
>> (First try turned out to be incorrect)
>>
>> Regards
>>
> 
> Vikash, Stan.
> 
> I think this is ready to go, can we get an Acked-by so Hans can do the merge ?
Thanks Marc/Bryan for getting this through and getting rid of that hack
"no-low-power".

There is a minor comment in patch 3/3, otherwise looks good.

Regards,
Vikash

