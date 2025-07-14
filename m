Return-Path: <linux-media+bounces-37680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A9BB04409
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF68A167719
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CDF270ECB;
	Mon, 14 Jul 2025 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7U+IPM9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E251922F4
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506778; cv=none; b=lSQbQ33MFJa0EkIeNzSOxzVDh0DGX/JmSlO6m+RcRm73cAG7L3jjBSECj40Wr5WOP1cYM+HaDSk1el+5o+yVmjLywukjaEKi6PmNnASl3S/bW2RhqSuG3f9s0sHCQT/a2o4mcCGh/eb0p0/Nyy7BuPh1iCUq/61TZetS7Akqm9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506778; c=relaxed/simple;
	bh=vF+3oIvR9G4hKNt5aFVVvJYF/1g2cRUpSfW7rhM775U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYEvccZtRbIATot//KTgpozuUexJoM2T2twAIHyZFvOiTzRWKGaW7E0yV4IsQP/ETlnCJ+U1G8CSiVuRJNG1I9NK4crM4cm/rJZJGKDQanVOToyru7fiJIDlJD4iKDtjbaOisbil7vU4VWBGs4tE1qB+hBU/FiUdnzHcMbWOGgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7U+IPM9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ECYQiU032496
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 15:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0KRc7GaMj1tOTzPOduI20ILL8jxHWMuo/B1S/LPmPY=; b=p7U+IPM9yFev0Ztr
	7fs7/0q1vy3dqA4l6r/cM7wp+gal5U++3vS2iDY0/d3oK4ipsOnMvheV5Jwh6XKL
	iehvLY6jz88N79HW+sbrvn4tV2Z20MGCCcQ2VOgH5OnO+e423lm7Xt2pD9M9ZnNa
	zuz6bDDtey1v4Y8x1CDFwlta6y4+s1ZK0G7Idk+nnKe7UTpwOe7oky7Gu9yOJ+8y
	XDGCKnNq1PM0pm3lyUYRHPW5WrAsnZsOdfIWXDnSVdApEqjW3IH0dV4SxhwlDUs1
	MsDJVEUReZzX4o6qgKyPFwDkiTDnGU2gpmed3RvB2iYqO8IDzts7dD5o/71u1RwW
	XlV/Vw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvay1pb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 15:26:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabbaa1937so15743356d6.0
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 08:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506775; x=1753111575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0KRc7GaMj1tOTzPOduI20ILL8jxHWMuo/B1S/LPmPY=;
        b=k+qkQhdQAkRhDkt1zQT4nKSs38xcyck5rv0waPXUMawhoaXMrHcv/TP+LnVY5FHs0e
         80JiJVTBaJ9Ggqs7ZQVV2fE/HU+18w5omPniDzBPXYJnin3aPp2qA7fDdZznqjl2sq4J
         cu6cBf29GwfC5CMzEOsuo4DTEJD+Ezwp6LvXFLvnumJmmpOpgnA+Mv/N6K0qAtEqR5Vq
         eaWD65Y7Aw3ou5RVQRXfX5b8kclooo32+VP2g5LHh6QVHD70BE4EadqMLtI+FLa2wlRt
         b29QYGOI4TOOIznMhg5/6ZjT3CRqMLB9Xr2V40ajWfEgG9SokpSTejDhrtFAgTkVx8rU
         koXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpBB7AA4baRDQPzZUz8iWSzuqTR3pgwGfnp0XUu1Qvn8CHSxhAdFkfjzmRJrGW4Bqdj52FBRoSnxd03A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwErmAp/zWlnxr6EHKB5jw4FKOqt8ASdBXspFDNnSUbBFTdcgW5
	0CH0DbciVprXiWXnRV9Bpbu+6Zz4GGdf1tRM9VSwglI3vZMDM6u0157aVxJJUw/qhk7MlEk1kfB
	yV3QPQTxyHATwoID0Pr2NInDRKMUIODQ2S1Xg+VMGgxnBBmuDToaj2G7c0B+A6sLFww==
X-Gm-Gg: ASbGncv28Hf9T0ar/WTRBKoWWRayvbeAU6OcN2nkNOE9h/dr3N27cpyPm6WrtNZtn1g
	GW9z+u5ANLaq8ToVecaUMP1keNJJ8Cen4Anvbegex2YneHNvzD96YpC01/AqHqfHyg2zNBEIMXG
	vQLui8fbcEfvQ1X7INCtBlbp/1uJEHxmoMKX8nCa9zz8r2Nooqzzj2razKWLerclj80763vA4nV
	a2MgFStCaM7AardCSuVX/3UTJO8RCv2own5+Gqxs5VsMAmbKQltEtI+HBEA014EboGNp5tG5+cV
	T6G5iYr7cnhL8KJisWHn350frnA/ZU6hgHK7mRLgKs8xZS7VZmFllGav1arOzigMqfEx4KQTlP3
	JLqehoKNndQC/+fb45PQI
X-Received: by 2002:a05:620a:4611:b0:7e3:3001:b055 with SMTP id af79cd13be357-7e33001b554mr110228785a.0.1752506775092;
        Mon, 14 Jul 2025 08:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX6IBsdWI9mVsEHLZqT+fwHbjjGKMDEgd6Hp1+Vyy78VGrEJC5/M7BkrDO1voksLgqSiIbnA==
X-Received: by 2002:a05:620a:4611:b0:7e3:3001:b055 with SMTP id af79cd13be357-7e33001b554mr110226885a.0.1752506774578;
        Mon, 14 Jul 2025 08:26:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294b7bsm838033166b.136.2025.07.14.08.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:26:14 -0700 (PDT)
Message-ID: <dd2754ee-ce89-4335-9974-6df4b612d3f7@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 17:26:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PotxV0kTqC-JEruVY5lp-cHxfdtKv3sf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA5MiBTYWx0ZWRfX7VXz8sY/bT/X
 MykZvgJI2J974bzb94u5H8JRbtPunYqh/7tWlzUDhJYp+OVCpqm+33/WtTAaaXeCKgsvPqUW2vz
 efl6mItFcIkAErbnchac7ZnoPy/1nhkNFVZIxWdT/0Vd0sKH44hPjMW1I+b0SSA5fvkvYSSgcbJ
 qm2ilLkMp5ENJhgsFvlnTKu03cfXi1qv+3NoRwUFwdNkCWXku6BxUIfpZn8zmZ+F9AkXBTnxiy8
 TxLpGINWt5o+GSkbdURWt9hH1aeNdNac0DecbSUQFUioSBRPuQwSPbpPmt5c11RmE5FeAWflccb
 4eDl0jgGbY/rB/a75uPpMOFZvRDRJrOHxr4Zzxgn89PKYLlOGKC3rGO1NQKWhD8PBuVARiagyEh
 tljt8Hs8zjE9wnLJng91TWfTofRLWGTTEt8BZAhOgC48nWybUqjuhtRGvsb9YTOfWz0CZv0c
X-Authority-Analysis: v=2.4 cv=GNIIEvNK c=1 sm=1 tr=0 ts=68752198 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=IbGhK8io7uJmbBfgTJ0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: PotxV0kTqC-JEruVY5lp-cHxfdtKv3sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140092

On 7/14/25 5:17 PM, Bryan O'Donoghue wrote:
> On 14/07/2025 15:58, Vladimir Zapolskiy wrote:
>>
>> This proposed device node scheme does not solve the known and already
>> discussed technical issue expectedly, namely there is no given way
>> to describe a combo mode hardware configuration, when two independant
>> sensors are wired to the same CSIPHY. This is an unsolvable problem
>> with this design.
> 
> I think that is genuinely something we should handle in camss-csid.c maybe with some meta-data inside of the ports/endpoints..
> 
>>
>> Sensors are conneced to CSIPHY IP blocks, CSIPHY is connected to CSID.
> My understanding of best practice is data-endpoints go into the consumer not the PHY.

At least in the case of USB, the PHY's of_graph includes signals that go
through said PHY (so HS for HS phys, RXTX for SS PHYs)

Konrad

> 
> These are PHYs with their own SoC pins and voltage rails. They should look like other PHYs in qcom and across DT, IMO.
> 
> ---
> bod
> 

