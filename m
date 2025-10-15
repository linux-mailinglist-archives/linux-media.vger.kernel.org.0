Return-Path: <linux-media+bounces-44501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3D0BDC4DC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B703E4F6A53
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 03:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C041C5486;
	Wed, 15 Oct 2025 03:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xlf2kAIC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A489D1A9F93
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 03:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760498245; cv=none; b=RV0/O5xdi7jUEXNttnI98ScIEB3IJfgk9ZHnCF7hy53f6sj8aoj6Fdd1NBiALFNEJNwj+rJVeYs0tsHal4TTcUFJCvMa8cDyjAMQlli71pB2fiyQY5XUd72NhDQhKQcJbe8McdTGDdb8qv9+T49DTQ+GZ7SstPN6CzC+PGUJfqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760498245; c=relaxed/simple;
	bh=L8eRhqEBY6VPKEe+NuDuAvsDC5E/DLGuikVuC496Dlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+njU0SM1UmhWIlkG9DkRHjh1wor4d4zhtoMknRp14jvY6hbca2KIwQhL5HbJYAJL32rKyRhL3O4UhA06JS7OnzMGM+dK5CpEsdENYtG/Q0+bk6sypp8zIV9wznGqW3zg22RPPdjAiAahJIkDzvAUGfj0voQrWb+4C2Xx5VNQ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xlf2kAIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sQId015160
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 03:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UAYC8XZOapAdIGslkNfv0MnBEhGl58g6zptcvxFMsY=; b=Xlf2kAICwu1xDiM/
	mdhGqKZpxbowqFBG5SOuYG4quvVBRV1zWjPIhcmIPDxcgTpfhtKzdDETHleBWYp/
	g8BxLHz2klBzp14CkQ7C/wVTc10gMCBwcdJgLl08SmZ9N+nZPXdNGFdpyrbpKlqt
	1PrG616v9EXQeM/73X0hQgJgYuuGkLnzO3Y+Usyo8CVSufTHUFItsQwSCDTPlLuf
	MtkCrocT1DmPLcRuBHgOARP6ak3AUMeb1800PKE5aadme2UtC1CedD522kEKoJEM
	Dgk0k4ZMQrQAsn6PX/bT+laBYRORFgLt6F5DuLX6gFuZ7m54+VOEWMkuqQ3oRC5G
	VuVaFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj2w7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 03:17:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272ed8c106eso61728505ad.2
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 20:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760498241; x=1761103041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UAYC8XZOapAdIGslkNfv0MnBEhGl58g6zptcvxFMsY=;
        b=VEX1alCocyiNRMjdO7tyuo6OgxpuNb3TxQqpV+3XN204w6xtIlnDKLQOPW0NA8Ila4
         bGUyuIIL1NI2RxNA1ICXT6XM6DEeBUMqlSeKwcKLUSdfCN7Ckc9qbL5CTq+1/l1DlONb
         mfaTc62WFy75x5//05iOrB1Ch9d01qA1qDKQsIaF0J4Yj2vW6v4mGTVzN1K9DN6cEIOK
         qf+Zev7aUrzmldXFmy0mZorOwjjBnnkqKZMwqdcXHi6p3Om8ZznwufeOjyTKFkPPkHm0
         2euD9l+QT62QWig9LM88u70QFDiXAjNIkcVvH/aEvPYGg3dL2CnFlHHzFkuH0jTHH3LA
         CSuw==
X-Forwarded-Encrypted: i=1; AJvYcCXMRg1pErvEM34F6F1Pn/ogkLP1bwLxG5UQ8GUWVOJbveRz9dXB7tu97+8Vo3dYL3kUOyiXfewX5GXjjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkqCi/jP2kDzyJhZpoRPjm8+QvglHW0tJaFfdeqdFqheFbX6jp
	sIfhRxrOAFf8LLsluj9BcUG9kLRXEkITYatI/Arws8rRE8/pgEuirXJvdHjRlOtg0hbzwbw7zeD
	ENSX6/mOoYf0GX3t9bePL+P+YtjRDOUz2+DysTVCtHsrWUdoOZH5IbELOuLr7+5IaNcJC28fu49
	90txs=
X-Gm-Gg: ASbGnctgo+aFgO4UPrnt80rZ3r+vaT3T9zUUB/irJVIBc4Ur0E4GcSAp29riGdr/BHa
	bjWyAdoI7UFy4priXkSY5xrPJSz9SAXar6aeoee+gqbPUFkEfZgtfjzTf29KFIObZh1AY1j/WHT
	m0O9Mc65Qmq85Qm47qss5POgg99BOM4heP9jAl5xySNMECXCNq9k4qA3s3rw2bwxnSzpkRFFgMe
	euD1hGn7/YfkTWTR+0FBy/7eGQ5ECaiBEga6hyhoa7I+Tz7mGVM3BEPQmPonzxde4BFfrWe81rp
	HUnRsMKnuofP0yPyhtLWRyEYFleM1mMAm0orV2CsF7TNVad/3BBcWEy6yBpWTm+b9dSpOwj1iSz
	xlyavthopexakOhXg1lrJ0pt0bJcLr/4UVeI=
X-Received: by 2002:a17:902:f64d:b0:27d:6777:2833 with SMTP id d9443c01a7336-290272e1cb3mr334523675ad.47.1760498241023;
        Tue, 14 Oct 2025 20:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxCCtupf0AwQhQZ0njtfPCJ2MZQQSKAfVp9ujpBXzGdvRclHdjEwejxG1jW4b94TQOYMHR3Q==
X-Received: by 2002:a17:902:f64d:b0:27d:6777:2833 with SMTP id d9443c01a7336-290272e1cb3mr334523375ad.47.1760498240576;
        Tue, 14 Oct 2025 20:17:20 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6de2sm180043285ad.18.2025.10.14.20.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 20:17:20 -0700 (PDT)
Message-ID: <ba63c3e9-df0c-4309-9de0-253a41569925@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 11:17:14 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: qcom: camss: Add Kaanapali support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <30f9292e-e6d3-4fd0-8d1c-f10317ca7751@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <30f9292e-e6d3-4fd0-8d1c-f10317ca7751@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwb/G2/2w3GLR
 bDGyj/DF12nZMOcsTu8nFTz7GE8IgDJrldocMmz8mZjCOrZLS79E6gg32cPLsos3DByII95s9ei
 DiMLWfKbH3HdKiY0JY+px7F7h/0mWOHWlyuoS+9WWb3Io62IKLhExS8aRB822n9t5OHKOuhUHV7
 WbO1lvOu+/N6vkn7qxUul9DDYWUXpkN6xf1I5v3B5ttJmHJy6GdqKhiXPl0T65lqAF/9z7/hliF
 FEtMrz4nQqmy4AiNA7Y0j+MVeC+1+XY1CF/NXD3IKFuRbj9k4W2UKf2XKa8omqjAiy20Gp6Tkic
 MKGoXHf3olaRMg23b/jPJGHBo+avMKmP6etaEDcAtT/ohrkt/YUgJclaZCBiKQEQa5ACg51B2nF
 ZIMPFaWdVKn9MuAECQcUz7JlFvTUKw==
X-Proofpoint-ORIG-GUID: 3QsrlU08KmUIWAEa43MEEBoal0VzyHIp
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef1242 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=v1UKZosia19T5iwvbEQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 3QsrlU08KmUIWAEa43MEEBoal0VzyHIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 9/26/2025 6:48 AM, Bryan O'Donoghue wrote:

> On 25/09/2025 01:02, Jingyi Wang wrote:
>> Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
>> RDI path involves adding the support for a set of CSIPHY, CSID and TFE
>> modules, with each TFE having multiple RDI ports.
>>
>> Kaanapali camera sub system provides
>>
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSI PHY
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> How has this series been tested ?
>
> ---
> bod 
Will update in next revision

