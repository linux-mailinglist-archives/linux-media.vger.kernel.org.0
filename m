Return-Path: <linux-media+bounces-34635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D148AD77FC
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 18:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0902E7B3984
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 16:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321222BCF6C;
	Thu, 12 Jun 2025 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVB3vZug"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09629B8FE
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 16:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745067; cv=none; b=RLngmeeAH8wAjDCtw57Ul8ORbnF4P/6UFu5h6gnolmxekyN+KgRbRdamDSLnh5Zu9reIty5y/K4mtmDs2fPLCm7cXMyHpufVxpcn7qXxwrbsiLIYlvXxkaJkNnJaQod6S4t28EuPvkGA9bCyVT6xNdHzo9bTlnPTgVMP/LJOXrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745067; c=relaxed/simple;
	bh=hjD6V0mhi2dg21GCNRdKg9QvyzsrI4FuCSoKe47iQK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKlFvhCMHTrfQbNFOTbgTy49udqYSBcLis2Gk7PuLrFPR8Z2FXv6vS12a6avS+gfT/zO60J8J89TShjs5ghIx4akSLqXNB+T5En3mYfONsMPqTgU7eGQgr0hA4Gp4K9LG5N/hrKLDD3m5ddqZB4qm7/wgd/oDw5L9XaP4uPYrXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVB3vZug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C9lAUO031511
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 16:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6SYXi/ubPIU8g+IxTFXs7TAAN5L16ENK5ZIOpV/Wzk=; b=PVB3vZughy4B6wIA
	v+getIXr0RUVPcJUYp09k4JLuFb6HSRb0xkWob1FFdWnLGZFgI2n66VVOtrR0oQu
	+IWIEPbbAoTrGtgtXdMjm+83nmeECQTzittjOS/YxEiBb+aJofS7wZlxbms9rXCT
	AnsrD1cSWWI0zVuQNSYTGYiPAjJMNXp46yNfBBi/wTVkHhU0wzzsbc7hQ+7lwVSD
	WYroyKvt4YystL2Af4EtwaDyrzw3iyrRqqinz6Ed9wVUuGM4pia04p4+Lf3s+uKH
	MgdOSTlEd5Bw6SHJJ4yTZFOLdO23GaxrZu9TJtEYcQNfm5ErSWzMQjWyco5lJZRJ
	dkM2gw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdwtmp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 16:17:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a5ae436badso2790721cf.2
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 09:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745057; x=1750349857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6SYXi/ubPIU8g+IxTFXs7TAAN5L16ENK5ZIOpV/Wzk=;
        b=Dxj0bL1fODP+mEjhXs8vCE6DVrPHtSWsy6Kvw1VLlMabXirseOKkcWrIsLZPXbTbut
         OFpT3LHz9VbT0SisdkCA/w0Hq/ojtOnLeo4UHYVt3JCcrvUsMAlE+/NcJZK3mwJsyY/3
         PL2kFbpcu01Po85p4dZ5cPG3h2cdMAOgg34zNllE/XbLleEPzQuA9weErA+l2kpDExzV
         0r3NGtY1x5V8fFYFtovKVaQgY/fQy59UyIi+o4UmACiYuNn0/C7LSylMmpCa0sU3Q6jo
         HUMGmbc3rjI/aJCY4ofHJD+0/1DkMlLYFSr0ZbABvhisAEXko6ihGK1bZuBGlzq2Orak
         iyzw==
X-Forwarded-Encrypted: i=1; AJvYcCVPhr20Q47dSMRd2l6m/4o/LPJNF8bTW/Ts+1lNrkem2m/OMIl1kG7sv1Tsh27bsDMtCxr+cRt8yNmkWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTihUSyyjpqxrYew4hBivChJepUdWeE3fIcsKKOkTHcwg9mFHh
	SbZ6ro3dZ2WOZ/tzTvYyASjZfN4CblveTiZqyB6EdbKjOTIvB4Zt7Hd7sZ6YS3C+JbNYRyAMSVz
	M/2HplextOsQDXDjKSsCXFTB+toTyeAsjK3BRPWarL2EqkVcXOlUp0jT+p0PgwIDiHQ==
X-Gm-Gg: ASbGncsq82Sy+4xtdQCIz/x7XUZazhSKP/NVOThmylER/soBdZTl6AxaoegJz6hbHad
	HFe+y6Sdet54akKnMGfLpqW1Dx5BVD/ruQDDlLD2CF1jx+BS4+tqPPSdBdQvAVMV6lLCk9mSMqR
	L/lopnyJLUFCsn8uyiCZpti4s5aQOkeGvN9uYBdy3AjTFMFcz88rGzLJm+kR0+E2mUgoIUo9W/u
	78E2YnLBwaagO0Zvg8NUhEtZbat9Pk1kEGf3RJvK4FalN9E+Klf3aOInHzIu9JxRsNgZlcz/abg
	5AHm35wxX3qaIL2LCQijoTl2lG9WKwFd2Fw4Rygszi9oudQVxcjQoM/Y4c9c0rY3xOYsUxioBbv
	I/jo=
X-Received: by 2002:a05:620a:29d0:b0:7d0:a0f2:e6ba with SMTP id af79cd13be357-7d3a87e59a0mr451472285a.5.1749745057221;
        Thu, 12 Jun 2025 09:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOx+5bQB13xARfR3GN0LFa6nGsEEEybs2kRaiWyxZ9tnL2N3182lRrA+vM9Uw5QJBu4ZHqkg==
X-Received: by 2002:a05:620a:29d0:b0:7d0:a0f2:e6ba with SMTP id af79cd13be357-7d3a87e59a0mr451468985a.5.1749745056801;
        Thu, 12 Jun 2025 09:17:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086a551246sm1412457a12.8.2025.06.12.09.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:17:36 -0700 (PDT)
Message-ID: <4848f13b-3b2c-4210-933c-b4f28d7c6ae7@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 18:17:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e02cead0-665d-443a-a884-c3a307409c66@kernel.org>
 <9e38a09b-1521-4196-b179-d29c62e143bc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9e38a09b-1521-4196-b179-d29c62e143bc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEyNCBTYWx0ZWRfX5qB7D87AyyA8
 9Yp05r9qZmbvnw5C+3Ova2SQgOvDwmyPcOT5lcrTJPY7cL0XVPGH9kdVq0yTbeCQZ7DFIwaAKdP
 zEZ5fY7LmTPpkR7iJz5EFQNucEyzshe3xp1dGU4RX7lIhk4IAS1+60Yra6DRKFHknemTW8+hAfv
 gOu73LABfyhriANpKFyQDbmaIibFZIMy7F/vFDmAUBwMDEnzfogILUCtRxRDyow8ifnHoEUqHAF
 DiVWvFUDeeJU3OtyNepZ/i7syzCco/qly3oCJAJ/vWs8rA2PQl2mqD9FwuiduXYJ+jUcF6Isclj
 DwpPVM7270NeNXiU4idBHpCazfmW6Tcc5kH41owBum6fddIFEiscspaRrZr85RGB/0ARX3BdNHI
 +RIWTy7ynaQ6WFicy34hvNgNlYJSsumdGt4xDHdTlJIKVhdQmrDTh5sv+Vohg8RTY2EKrWw+
X-Proofpoint-ORIG-GUID: G1elDAgVXOOX0lK9tDn3Z3vz9VgJEjJW
X-Proofpoint-GUID: G1elDAgVXOOX0lK9tDn3Z3vz9VgJEjJW
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684afda2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=LZMvtdFs93sqpN7HcN4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120124

On 6/12/25 9:57 AM, Vladimir Zapolskiy wrote:
> On 6/12/25 10:39, Krzysztof Kozlowski wrote:
>> On 12/06/2025 09:38, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> ---
>>>> RFC verion of the change:
>>>> * https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/
>>>>
>>>> Changes from RFC to v1:
>>>> * moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
>>>> * added 'clock-names' property,
>>>> * removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
>>
>>
>> Now I noticed this... weird change and clearly a no-go.
>>
>> Device binding cannot be generic, so it is not good enough for now.
>> Please write specific bindings for specific hardware.
>>
> 
> Can I add platform specific changes on top of the displayed generic one
> like in Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> etc?
> 
> The generic compatible is sufficienlty good for adding the enhanced
> CSIPHY support to any currently present in the upstream platform CAMSS.
> 
> Obviously I can rename it to something SoC-specific, but then a question
> arises, if a selected platform has to be a totally new one in the upstream,
> or it could be among any of platforms with a ready CAMSS, and a backward
> compatibility is preserved by these series and the new CSIPHY dt bindings.

A YAML file hosting common properties will probably be very welcome, but
the compatibles must be specific to avoid having to redo this dance in
a couple years..

Then, the camera ip is well-versioned, so you can use that as the 'specific'
part. It'll also make it easier to resolve the unlikely case of a SoC using
a mix of different PHY versions.

Konrad

