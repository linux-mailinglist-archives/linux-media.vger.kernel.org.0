Return-Path: <linux-media+bounces-44105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3F6BC99B0
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 16:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 910C0189105B
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 14:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E7A2EBDE0;
	Thu,  9 Oct 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mqg2cHAl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C930D2EB84A
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021267; cv=none; b=fJzBNCb52IRwtUeeKsuGSWqmgOXxy1ndeujHMzHSirczvAKeLhpDxJSM/WbF7NYeitg5M8tZHrDZDaJBMHviuGwhRiM5yKqb613qCBcV4izIiLyjVTnKe2P6fGfr5GSkqMQS+lzexKhIqNXD9Lx2FFuwilfgJtHSvLkwXm5ICHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021267; c=relaxed/simple;
	bh=wCZcf1vJQBWFgMYZhxV0uN6s2NYKhluKHQpo1wlh134=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmVgXhPTPHrvbBp4LMTA5YD+zaIzPrH6cWmBr7juch2U4H0GXIjmiGDZTO+mBkrEioDpM9lgE8/z4YqjU4hGDFxAypQZSWjJASTQA5NyOUkCkCmsXa1chJMh2TQug7ksNV3jQXgeksrTOUv46RC44qH4ULd9XnLNB+/7EZEI7vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mqg2cHAl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EeRXj029031
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 14:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebeBjH17Tc33jzXaK2hqQGrPdF0j3wORZwYG8oLycWo=; b=Mqg2cHAl4vRoAEKh
	zY36ql9Ogij0IhkoIEpBO6O7ntKIJVD0uzTD/DcEhQlvb4V8YAfD1T1uto6atE/r
	Lt8QUkwZKCJf/0dp8KxhLnuUdRm0R8u8eF6kflmhprEQ8z5WEIVOCU3EEXtB86oW
	xrUjVRQYkE5Inf825XEhQqTocG+6txLsGFC43vxJEszhbXq1Amoaqt1bI0LdvOWh
	LgnsGTbDjtygnHCv8W5LsasaVqRYAdjM44/ZQOhBVc8fUDWNocTQugngNOdr5/+p
	nYuwMkPA/QL9a2ZDL7/P9FSyEP7wf810+mL2uWE5t36xn4Iu1QVeMawn2nfwKytZ
	C117tg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ku9d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 14:47:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8703ba5a635so40533385a.2
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021263; x=1760626063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebeBjH17Tc33jzXaK2hqQGrPdF0j3wORZwYG8oLycWo=;
        b=TPeRRTTGTaMSeMC/o/x4TwM4P5OoOCCnxQk4MmBAvMvKTaMuCIEsBcSEWcYfcOUwcc
         we2Hn8rct1YOUvXsOGiI9JQgL3T91QNacQ/CPdzzUzWBfRyzB08BLDIPwpfd3t7mi3B2
         2RLlJuyqVyu+IJQyjRPk7gFNQqIehyC0cDqrOOzaM0fNFPccj9jPQF/VrjIpBzvjsb2c
         b0VlU/oBs7wWJwvi5LgPLkOTSqAm/nU/ONYylxInCcuwvCPSKEbBX/e08353bZoGZ7S2
         7CZkb6fbxpibWU3bdhrgo/069otFs1oOf/bCffo0mkT8O60TIne8xIFY+OjYTfbgvyzL
         Y57Q==
X-Gm-Message-State: AOJu0YxrGSwd6waD4GJaiU1Wvw8dB1B8qKZnfM3/Synz8g1CoA5hA2/D
	4wFDLXXPs2UtaaZ/d/PozN1E6H+21j88VP1dGI9s/p3cjosgeeWefj6q11kAye6H38Nz7Z9/fBK
	WDOT+3034Q6zf3q+3dZj4ZUbKv3ehb6vh5+E8h8aCRYyXajzRfXeDyDeqmA0xP4i7eg==
X-Gm-Gg: ASbGncsa7cB0GYdHhNwHG1wPSv434YbK6HEh7euFcwcLV1qyBo2h5bPTvP7sqhrO6Ee
	CNFeYO6STYYi2hv7TBGOzg/GYWZVeYrVbGR3ix1kzUbEom5jgc6ScL7sBvUcZU4OfCTr4PyEqK2
	Ctvqk5ppsHIp4DgCYidnuRPrIhFheNTvQWjeQgUxwS5K5lIlfc04t/+BY+5pxsbTUYzzLekk6gj
	WV8C+sZQTOTklJGgfI9AikhiHV+hiSsabi1jz+CaHPTIukPdMrkrIpVgtMY+t2gyFoN+ApP96Km
	sjIqsMeym7TqiLEe8nuU7M3flnVT6j1HP2/GbfxsujXHwDQnYMzwlABL0KGnNxrigdFQ6d9vvDv
	yau8LskxVGvM2v+cDBjKjSf5Ccsc=
X-Received: by 2002:a05:622a:11cc:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4e6ead458c0mr75125531cf.13.1760021263233;
        Thu, 09 Oct 2025 07:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHvkCErGnAd+2F+0V519Y/X6ndedkfODnCNUsDw9spRdQiN0VpPtSkMUsOifF4sBmQy2FpHw==
X-Received: by 2002:a05:622a:11cc:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4e6ead458c0mr75125001cf.13.1760021262397;
        Thu, 09 Oct 2025 07:47:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4f3c7e057dsm766895066b.88.2025.10.09.07.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:47:41 -0700 (PDT)
Message-ID: <c16d4e6d-8643-42a6-a7a4-8ca18e6db265@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:47:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 CCI pull-up
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
 <20251009-dw9800-driver-v2-3-3c33ccd1d741@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009-dw9800-driver-v2-3-3c33ccd1d741@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4XB8ZB7qpYJ4
 EbfypgQ+z1MrQFgv4OVez9W1pyLXpys6Aof4YTTSXJsH9kZTv8v6+UmZApSTr+Is3UCb4W2F5KL
 KptRoz4R9Kk5v8ho2j8RJHK4KQEuJToBfUs61FQJe4VSaKD4zJIipMM+TZefZNBv/uzCosLvsb+
 +ajw+wxoD/gAtX8hOyelcpQdjb26enZd0+grAmANOgvZEArxS+pUgAAmSqlzc44dXHDDIFnOZY7
 Pdsn1F26aiwACroR3fuLphE0JdhtsDfj/OUHp1Ow8/UIHbc4xvx3i5qnT64AY2F7h7ZWZbKtLKB
 r/NtgVbuLnCZSYa66RFV68RGQTxz2QdPiXbFFuP+rBGka1QqDgyACnYgwiGagR8HFRkOJyJxJWp
 1q1ZpNxVVoIdK1vS5uMBm3ffj/61BQ==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e7cb11 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: N25WU7ECe7RVeZaAFD9GkptoFkIdZm2u
X-Proofpoint-ORIG-GUID: N25WU7ECe7RVeZaAFD9GkptoFkIdZm2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 4:35 PM, Griffin Kroah-Hartman wrote:
> Enable vreg_l6p, which is the voltage source for the pull-up resistor of
> the CCI busses.
> 
> This ensures that I2C communication works as expected.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

