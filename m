Return-Path: <linux-media+bounces-25558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59107A255D4
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406313A8DEE
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6351FF1D1;
	Mon,  3 Feb 2025 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WEkCUQUj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE51FF61C;
	Mon,  3 Feb 2025 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574902; cv=none; b=rVkKY+jGkrFIJODioN30cd7TASv2rO+zA76/K1DlwJvM2f7qIbnFgNKz2ZtTvv+UYWT0saQuDtL2MAhQLFSABDV9rVg21cyROZ1qQgLm2eKoEtxBtJgwCccm6sk9HQdpRwYnpa7HLfZIah7VgJZCtzhbtJ21euLn2U2XFWgPsn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574902; c=relaxed/simple;
	bh=TpujSEcge8EYKw1QhJY7JTWk7WVpg4aAMiegf3GmC8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=drXGIb3PgPfcKxkpcLfxPQhWtj+A8IAo+UoAmNX5tnulsnzOjqSUgS1/viv8/R48jq9yb9m+peQtaj0ciqy/iwMwCPPjcK58k0PItT3OPSl31hXd1BW8W9VNwLPSiFswUObnVC3cgXK5DoOClMZbn3qdh0yQGcNZaClvRX3hFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WEkCUQUj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5138CbJP031483;
	Mon, 3 Feb 2025 09:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mn+PnTGOb4HsErWV3eK1Lm1zv+wphpiGyn5+Yosvbtk=; b=WEkCUQUjhWxN8IHb
	a+A/xeDlnoN7XaeENcl9p7YkxxXNV34V4fnANuRzk0H5YASamVCwzV4cPEd8f0AO
	bxcArNLXPR8a47Hkd3ghueuoU9Zh5YXSLRmx+oCd/UPqbyRfRILBpHGWN31eecEw
	mx8KoKTr4dZT+glYuK00kcb4blYszS3RbBKDig1XcOU+Gyw+aTDVa4t1FtB2LmZv
	ydUxzOgg/n0Jd8dTh/BQ5bGKmjUaXfWVV9tU7cLLqnpO1G+dV1fOIj+HBaQ6/xdi
	6USvArSdluIIsuUVxgM5rZycMleZ8yxKkePTT30o8dyvSOcZEAHW32yk8xIjpQN5
	g4qTdg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jt3ar537-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 09:28:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5139S98P001452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 09:28:09 GMT
Received: from [10.216.21.39] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 01:28:01 -0800
Message-ID: <4dab19d0-22eb-2395-56fd-758c3c0d8bc7@quicinc.com>
Date: Mon, 3 Feb 2025 14:57:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <Z3_kLJ6Oy6m9D_wU@hovoldconsulting.com>
 <CAEvtbuvHUF6tEiFOUUtqLh5hHf_Us+yA6TwtcmokM26v+QBLgg@mail.gmail.com>
 <Z6CBrMus4SdSG9oF@hovoldconsulting.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <Z6CBrMus4SdSG9oF@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tvZEWs4jbm0pUGZUtl8u2I2gNHwiYjP4
X-Proofpoint-ORIG-GUID: tvZEWs4jbm0pUGZUtl8u2I2gNHwiYjP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030074


On 2/3/2025 2:13 PM, Johan Hovold wrote:
> On Wed, Jan 22, 2025 at 04:34:51PM +0100, Stefan Schmidt wrote:
>> On Thu, 9 Jan 2025 at 15:58, Johan Hovold <johan@kernel.org> wrote:
>>> On Thu, Dec 12, 2024 at 05:21:22PM +0530, Dikshita Agarwal wrote:
> 
>>>> Introduce support for Qualcomm new video acceleration hardware i.e.
>>>> iris, used for video stream decoding.
>>>
>>>> Note: A harmless onetime error log "Lucid PLL latch failed. Output may
>>>> be unstable!" is seen during bootup.  It doesn't impact any video
>>>> usecase and is currently under discussion.
>>>
>>> This could be an indication that some resources are not described
>>> correctly and could potentially require both binding and driver changes
>>> to address.
>>>
>>> This is also something which could cause trouble later (e.g. during
>>> suspend) even if you manage to get the clock running after boot.
>>>
>>> Generally, you should not be introducing any new warnings; they are
>>> there to let you know that something is wrong.
>>>
>>> Where is this issue being discussed?
>>>
>>> I think we at least need a public analysis and understanding of the
>>> problem before merging this.
>>
>> Taniya Das proposed a patchset to reconfigure PLL in the clk-alpha-pll
>> which allows the videocc-sm8550 driver to configure it correctly.
>> https://lore.kernel.org/linux-arm-msm/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/T/
>>
>> I tested the Iris driver with this patchset and I am no longer seeing
>> the Lucid PLL latch failed warning.
> 
> Thanks for the pointer. Please make sure to reference this series (and
> summarise the underlying issue) when resending this series.
> 
> Judging from a quick look the approach taken there seems like a bit of a
> hack so it may not get merged in its current form. IIUC fixing the PLL
> issue properly may depend on adding support for multiple power domains
> to the clock drivers.
It would be good if you can add your comment to the PLL fix series [1] so that
the patch owner can discuss on your suggestion.
Regards,
Vikash

[1]
https://lore.kernel.org/linux-arm-msm/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/T/

