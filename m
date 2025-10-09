Return-Path: <linux-media+bounces-44066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FE1BC88B5
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 12:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B72FA3E6137
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B4B2DA760;
	Thu,  9 Oct 2025 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NIiP8vBY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846202D8785;
	Thu,  9 Oct 2025 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006487; cv=none; b=KmjWynhnNaNdy1TTgf3WYM3e0sYc0fBeZ9TlzsYv/nmJgU2au7MSJj3UQCvR713bwYQwTIgVZrtNEaPZe2kh++fmiSrWLGo6z48WSLV3nBUfe4GnrPWpF29wId9O6o9416WRLvunp1z5pHrg7uX5a9J79NmJBU3hgTTaMFTPWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006487; c=relaxed/simple;
	bh=iv1uYnWFWnJuO/yz+MCLq17avoNfVhzN83T1zNalVnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rukHdCpw+46Y6aWkfboTrHpfmtTbMRRkdEvQpjj45fm/mGvdecfobzeb8oOCWZS2XxqVSwrJb24KH5zdkFAcKsMfakjzAo9f8Hec2t7GLihx1HUajSc5/TxozUSQ3aOsrChUG/IuQET18hQcMxolleHKhrkGJdhN4wgP7xuILcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NIiP8vBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998V3EM031866;
	Thu, 9 Oct 2025 10:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w71AKsbRL+zDePTO8qqcFmW7+B619v+AU/CT6nw/bTo=; b=NIiP8vBYZovnOsFn
	IoWhOpJotnpEqKyJXaVoGdjHTXpFwvFchih5p5etCeK7Fm/rXo8Fbeh9pRcO4KIF
	Kqhxi2PBdrgWOffJKebrdUHXCY6VtzuwrJkhko0bqEqxWqNH0ZxW1BX4JFStYf9o
	Gh9cCwN2k2QrIu0x48+L0KF61jLC9FQX1o7PtxVh/eSwAUV2CdQ4gc2xbFZtvnaJ
	IwsgL4KltfyLrgzpVz7aIUI88IN01QEA7+5EifGZNL6Ud5ermy7d2l6HB5KS1jlA
	M116xfOynWOsZGz8oAAKKiIyffFxdhYC49f+5Akw1o5cWHrsFBzLmtrpXDHBE3t4
	+2huQA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0rbxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 10:41:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 599Af8Pu012011
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 10:41:08 GMT
Received: from [10.216.43.164] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 9 Oct
 2025 03:40:34 -0700
Message-ID: <4fac8b52-180d-7b79-f0d9-52c0f94186da@quicinc.com>
Date: Thu, 9 Oct 2025 16:10:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla
	<charan.kalla@oss.qualcomm.com>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>,
        "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
 <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
 <1516f21e-aee3-42cf-b75e-61142dc9578d@oss.qualcomm.com>
 <9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org>
 <MMSKAu89Ew7StAeFBV442KfKNzmqbTSQ-maFG35Jr9d8PkUV2L4sx44R2DRevXA8mC45vkA398l2mvVzarZwew==@protonmail.internalid>
 <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
 <d46c0335-99d6-469f-a61f-aca4c851f745@kernel.org>
 <GyrcG3qBN7c5C7ajCs3EV81hWvuaVbg64CpzQ-X3d_p6EauoiKxSoG2aOKE21-j12SWFjNDjV-kVSwYYqVm_lQ==@protonmail.internalid>
 <a0dc93ec-e35c-409b-8dfb-1642c92a9f0c@kernel.org>
 <98e6acf8-80d7-4894-b4ce-ce74660722ef@kernel.org>
 <soFAWqHDNosrZui972Ip7EvMCfB6tepD-HxHkc17RKmilPJpQZjMzni9LmMOpvKumHqFEibe5FdNkkJG8DKlcw==@protonmail.internalid>
 <5085c857-f6e8-4faf-b61a-a9ee562ccf06@kernel.org>
 <7ba3953a-166f-4c67-8f54-666b0c488b12@kernel.org>
 <e15f156c-cb38-4566-b275-ba156a7b598d@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <e15f156c-cb38-4566-b275-ba156a7b598d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e79145 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=QX6zwKueRfnGSD8Ekp0A:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: WohGYkK-oir618Q5Xxmhmw45nsWRvMrx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX1exSD3oyrq6q
 WgArgC7e0Lszp+gMvvDX1gdX1+n0l3OcgrcQd98rktuin18SavO06338alda1MJpbBwENVizI/1
 pKE7D1bhbizBHbCXNbG0PpmTg0cM5EvrxLQptgfWOVjtfmuYQjUww0r2VNj1h1nHkPfTPTvjzKz
 8h886U0dHoKaD1pDZD4Y/ONezOIHhN2Eli/ywCq0iRLiIaAKy94g6DyP+dC9tvZpE7/CXMMCE9W
 QA7l7qnuJOOqm9zlwebn0h3MGl1qmvkjdaMHNL+Lga5YJUqj2T/sTtvRUmI7HRPIiat1qFi06l+
 yKXRC6qu1KqYBe2nzU56QhbxjsclhI3iv93l9GzNF3D0TCth8nFd/yghXX4d7vETEDfaImnx6su
 oex33kZFyFnVAsFP5HCsudGwRZYRdQ==
X-Proofpoint-ORIG-GUID: WohGYkK-oir618Q5Xxmhmw45nsWRvMrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047


On 10/9/2025 2:41 PM, Krzysztof Kozlowski wrote:
> On 09/10/2025 17:38, Bryan O'Donoghue wrote:
>> On 09/10/2025 02:04, Krzysztof Kozlowski wrote:
>>>> The iommu description for this platform basically lacks the data that
>>>> _should_ be there -> FUNCTION_ID.
>>> No. The index tells that already.
>>
>> Hmm.
>>>> The rule is that the DT should really describe the hardware right ?
>>> It already does. Same as I wrote on IRC, DT already has all the
>>> information. Entry 0 has function ID-foo. Entry 1 has function ID-bar.
>>> Entry 2 has function ID-bar or whatever.
>>
>> That's the part I don't believe is true its a 1:Many relationship 
>> between FUNCTION_ID:SIDs
>>
>> Let me check the docs...
>>
>> Here's the example I gave on IRC for lore
>>
>> SID 0x1940 maps to AC_VM_HLOS (Linux)
>> SID 0x1941 maps to AC_VM_CP_BITSTREAM - protected bitstream
>> SID 0x1945 maps to AC_WM_CP_BITSTREAM
>>
> 
> I responded to this on IRC... Nothing proves here that 1:many cannot be
> done.

Kaanapali already has 1:Many relationship for FUNCTION_ID:SIDs.

> 
> Best regards,
> Krzysztof

