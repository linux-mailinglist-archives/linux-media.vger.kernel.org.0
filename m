Return-Path: <linux-media+bounces-45275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE608BFD010
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 18:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1DE28355259
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B3D26F2AC;
	Wed, 22 Oct 2025 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwAZpgPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7226D4C7
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761148977; cv=none; b=mgwtaJXf1I1mbQQFNSuhkk6NFMdvL36pS8+t/CJtFP3E8EvJARiEAj25eR+0FrLP/NuxcTiPRBoPXW4LOeibGUrucM/wu3GoGjVSOPbHJNG+pNqkkXGfIx4OLjHXaX0/18Yxj2hd8SCAh1kZW2PPKKlcKICQEkPCwUd0oqz/VRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761148977; c=relaxed/simple;
	bh=6/x4q1TD0Vfpez8lZM9NmTtdfX6AcobeeOsSKpt9cS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUQlCjszR2WCI1xYxWViVn/YRBki11rRkbgqm/9Wj0SRDLRfIQi/MH85qK79ruCsdhDgAFtzoM+rLMW6RFQIfnov+hAQRkPrh7szkkM01nHqLsHd5Dxjl0+/L4e7U0/waE3iodgFm2cCTpDrjOuUx+JussFUu4PUXk9zxrQcOX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwAZpgPZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MFqpea013592
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 16:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJi0OYMjtb7TI5hXccKCsroVX33ScGfPgbLnqsYifaY=; b=CwAZpgPZtZC4BmqH
	S6YdD7pK7D0ZZCn9IhbE0muq0MxaeOM1MbxkGWbFyr6cidsSuOPU0FEn/AtnlaKS
	F4IgLX+UM00QDAVPT3B5gY54DzJprP+89jX1Hb/gLqIS1MAvspEqrh+mTO3fGkiW
	nvOOCrScUu9xrBAYWwlA4mmgRITCR1EgFP/3WyAXuR0Op0g9XD7RvUJrCGTsbWnu
	LycPKgqEAXyJEEFcosF1wGk6/642GlfHRVzLg+rUjImiKvrExgvyyNGjJN+YKK5F
	VcjC8bZ1hgSvP7hW3cyrxjat1J0Otl47trdIXREPBaF2CGFREA7kcyvHt+YNNhGp
	9PXHhQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0k40b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 16:02:54 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5562b30f35aso410596e0c.0
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 09:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761148973; x=1761753773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJi0OYMjtb7TI5hXccKCsroVX33ScGfPgbLnqsYifaY=;
        b=FG9E/Yly8ZJbFtfuofqv+0dfIPBREZq4j9GxiPPUyXlqMu8c9PtaRaqQ83CIxpOEEt
         tMlXxniAqdAlCbhjlH8TGH+QhjJ90oCM/mOqO2+RVzmEREuBYSbEqFFg0HXuTDEF194w
         BAvY370yC2Agi+7dzDgWZ5gL0/3Rtqvl2+07DylFtq2jUnFtW/yAUfSn0ODQlkQE3r1M
         DpKBPh9GkyYZruxloQOO2Vaps1ntVQ3pJqDurDFzl0I0giZlnQ7WIEgrjAuV5fQ2ZnzY
         unffhpqwppmBgsSy5+So4Z/zb7ws1GB5pnj97SIy9eAckkzDwbTFLHsiL8XFDOSzagUz
         bvVA==
X-Gm-Message-State: AOJu0YxjwKj2maqhwSEA343XU0SIzsVDhKn3D+9tbyD/LgKI1aVagAgf
	lJetH4MEv9jA5vhHwTRnU/rkACHvcuGjM5mE+CXwqNLeNFwWBvZ0O/EwUn7vPdvEw2mAw4p7JIK
	UoVCN2RysSKFKBCca4kATg8FFdzA2xUdePlcyHhqifsLTQWvQ5CUgINrGHiFWkIundQ==
X-Gm-Gg: ASbGncs8r3MOlWHp2M6/eTM/Sk33ypXQMEfqt5U9K7PLJX4rlQ7exRyGiao+6//FjWv
	ZRk7S4glp68laTtlmngRyJ4ZqAi1M5Ih30Dj5aPw+rmwCCiBd/Zu5L3+2xLVBDjrskwJuekqGtX
	6pmiZcQFZEQ/IQ9GsYAsf4jOgWw4/oKr0lrT1MUNVSe1OEDXbDKZ0f2jOKqWVDdFzntOkOhQhO8
	w1ulPFJj2NAgoCgAMSO106S9sO1YnE7IZ8O89sth9JyLsmX4FnRL4Imjj3CMUOesEobIi2o+3st
	ugp+NtjtL64OJEKPWmX9SABasBD66Hjlg3Sv9SCPyFg9A8Xu/hwUawbEUoljYPL/VBekreoH9Gt
	uKQUX//mzxmJ2ZqoGrgSXFazHsG9j17/Lt2LcrqfVXGhhizF9kBYuYUke
X-Received: by 2002:a05:6122:e053:b0:557:4f6:869f with SMTP id 71dfb90a1353d-55704f68872mr118823e0c.2.1761148973059;
        Wed, 22 Oct 2025 09:02:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi5mRKbI+dib91eM8Z7Q+hS4s8HODIdacNkDVMa5lXczhBdSAgA5tmb1wtM5M/KDWuV6wPhw==
X-Received: by 2002:a05:6122:e053:b0:557:4f6:869f with SMTP id 71dfb90a1353d-55704f68872mr118782e0c.2.1761148972412;
        Wed, 22 Oct 2025 09:02:52 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb52603fsm1382657066b.57.2025.10.22.09.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:02:51 -0700 (PDT)
Message-ID: <4a4a24aa-d8a2-4150-a7bd-1d0a4b141116@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:02:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6150: Add camss node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-3-e7f64ac32370@oss.qualcomm.com>
 <b0224cd8-fe81-4229-94a4-c314c7b19811@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b0224cd8-fe81-4229-94a4-c314c7b19811@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXwtxVNCbtj9M2
 asxVlrEDuXGGsqRaU+p+gLS7hdIMcjdU+cswUzmhIcLCV03qTdbsEBmTRMENB06xEF0s+hqJtB+
 frCDDAJ/BDMfS7su3YeLww57FvGTU0VenX75Rinoj0AzpPmSG+qYlfAGKvXMNqDJEa8FDeKEDP5
 zYBqZ+DRFZW2G5xBGOi6RXYsfE7mu+tUeySXa3ZHebNvMXtby2SFGXyrv/6COwZTvaGz+YIKTsA
 up9MreO9CgiaOPhFb6jVROz2t0he5tDlKP2MyQpNBu2xZVhysed+elh5tl7P/e6QTcV1xz3yKee
 ontK0TlQ8R02H2d6uLbKr/m8dEaM6weiEuvR6+6eHJdRuzsdA6WivK2ZTQeuLpzUqFCSNpretT9
 Ui9pcxij/xVG7yhVdwb/aTBDCHENYA==
X-Proofpoint-ORIG-GUID: mYEccsjmsiT_HPeW8TT2OgQZb8k1BFxC
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f9002e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sD1Uv7CbK0E5T9jcHE8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: mYEccsjmsiT_HPeW8TT2OgQZb8k1BFxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 10/16/25 3:48 PM, Vladimir Zapolskiy wrote:
> On 10/16/25 13:22, Wenmeng Liu wrote:
>> Add node for the SM6150 camera subsystem.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---

[...]


>> +            power-domains = <&camcc IFE_0_GDSC>,
>> +                    <&camcc IFE_1_GDSC>,
>> +                    <&camcc TITAN_TOP_GDSC>;
>> +            power-domain-names = "ife0",
>> +                         "ife1",
>> +                         "top";
>> +
>> +            status = "disabled";
> 
> Please remove empty lines between properties all above.

What??

Konrad

