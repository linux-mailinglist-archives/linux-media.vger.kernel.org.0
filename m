Return-Path: <linux-media+bounces-27507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 110A5A4E7C3
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B7B19C3E89
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CBA25FA30;
	Tue,  4 Mar 2025 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYCxbjOt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC13204C1D
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106496; cv=none; b=iJKQ0uFJ7QuYu/AToA41GmEqcCVg0gOq4hntJk0+fa1z2D4Hkoyi5971L6FDl/WrNLc3A3V8qGTEC/Md+1kzdKFWNojYfqh+0bNRN6Yv5TLfyp4c9AQ9BpmWFmHAIxOxIEAB7tNQJajm9CS8yOTU5t56Qc69I1OPCQvBUIDM/DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106496; c=relaxed/simple;
	bh=ffThSbYQesCsr5BdSh0lmlwxJuRduHy19rXFVPc7B+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsZuc2VE4uiqN2prJ4EeWwtHYLG145QjojZLth+T4+NSVAMl1KouBrcsvnIxHpqi2UQuqNSMtpSgD26I+XwQg6L2LWhbB8AwqBwMAzZuBsmTzqLFTJ5Ry7EUQKusQIRFucBnNKXhc8JdidbpVlQ5l5rLagfAo1BhO3MPjYJe4eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYCxbjOt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5249qkmE015521
	for <linux-media@vger.kernel.org>; Tue, 4 Mar 2025 16:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aweo2aVYPK68EM8Nsal2jdoc4Zn3ezHG6xAKnUyHqJU=; b=CYCxbjOtLrNjzUq6
	ZRHZL7OodaIbFoCVNd72utSpRZnzo16Y+klL9VIBMLbNc7fZpBOcvefuHjdEGYfl
	9NaxEvVFKLWFQIRzpmU6n+wd8fmDEC+BUvgmC0CqVQte2rFUHcx7oew/zWrDYUlN
	CHP995YgliwP4CVwpzrVXw0MnuW+y3B8zOrEFk2GzOBPn+v+ERszd/PlrlnZDRWg
	2e0Iqyq0WnJi169XuStO9wBKOnKcklTdWoDUPlF88b0uTNxmHpVuBOA2ITMKXG41
	n6gtkA+tx/m+TxLVqlCrXzbQJFAyJcKn9KTOATuF9DJzzCVHDPM4PZ3u6cvqvYZ/
	U56d+Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v2fmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 16:41:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e892c72145so14072886d6.1
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 08:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106491; x=1741711291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aweo2aVYPK68EM8Nsal2jdoc4Zn3ezHG6xAKnUyHqJU=;
        b=COK9QNO6Y86pzgnI2/jMLo+4fdKfv6RyRzFURzrvtBy6Ncp6uzrwpHd0a7xLOuUEQ4
         eOraPZ0r79K16hhQVOupz8CVunAzbB8j1axIfO7vTI3CdighrCA0O0iDqzUFkKwtJ2vS
         3K5L0FVwfqrRtQ0KVD+KPZDpuw2rYDQxF7/lXqwWz1B7VsGvVp2iL7Mc7P4CE5qTNbLG
         nALkjeYclLjMmQ17uQEM2+hQmG+X/ijw4pfijwVhYtI3q9T3nIlOfi8NHbKt57F238wp
         JdodTP96nk7eHFyydk31Pdw5z2cb/JXtAlE44XDmNwN895theYLejgYpLnIsEMeCVAhI
         LmKQ==
X-Gm-Message-State: AOJu0Yx/1W5LrLqdoZ9245UekuZeeDLhQ0YAWRmkIEwLIjFvUw354sIK
	q6sEc5Ybd5vJ1kcC8pj+AXID87u/7zoq0r1qBvady63KFK/aaT6KYkXdf4+G24iAXoUlQfHAQIZ
	37vopZ0RIdkPd0E7MUHIPW/9XFHrpVlpXYsEkQmRLJ1AWVo2cVyUwjfzGuKB44g==
X-Gm-Gg: ASbGncuVj5mDpHEI5pbTzjykI7m4RKugcaAbgnRhNTQfGWEFsdgV4Asbu7GCXBI88I3
	Q37IfcPSDSIYm8NuCus+t5SSMUGikpjuyf+3USVCaXdPmP+cgy2aIUifp9rumGHUpUWZIyhv6rh
	hMxrGgJbyGXmlptoc4alXxZgXkJ/pByJrkxnZPZevGR1gkr668A5nhij/aFs2VJk0lLfQyUasLQ
	0Cnyw3hCys2fc63mbUq07TyTYvsviBfgC9nM0W13ydYRC9Il+5sl4uk03lZE44FLDhzH2LVzNsE
	7a6ZznCP1itaDD0owKpw9XhjbPpPKnyfMBE5UIROXtuZZaIuRjV4sLwUMd4vzxSJHDLiMg==
X-Received: by 2002:ad4:5f0a:0:b0:6d8:8283:445c with SMTP id 6a1803df08f44-6e8a0d05d81mr86128576d6.4.1741106491372;
        Tue, 04 Mar 2025 08:41:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Cz9Nh6swuZbgLPf/pRvOeYz9E1GRDU9wKVJ0wtg4BkA6pMrkakuUP21/Z1WqbGOiSQ7Lyw==
X-Received: by 2002:ad4:5f0a:0:b0:6d8:8283:445c with SMTP id 6a1803df08f44-6e8a0d05d81mr86128426d6.4.1741106491049;
        Tue, 04 Mar 2025 08:41:31 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c74c714sm975253166b.124.2025.03.04.08.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:41:30 -0800 (PST)
Message-ID: <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 17:41:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sc8280xp: Add Venus
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-7-279c7ea55493@linaro.org>
 <77475c23-c173-4512-b257-d7b01fa2054d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <77475c23-c173-4512-b257-d7b01fa2054d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hMxrmzPjF6laV5VI3M2lDJ1LqhIbbYAn
X-Proofpoint-ORIG-GUID: hMxrmzPjF6laV5VI3M2lDJ1LqhIbbYAn
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c72d3c cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=iUC3nf1AerQT-j-K12QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=802 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040134

On 4.03.2025 3:02 PM, Krzysztof Kozlowski wrote:
> On 04/03/2025 14:07, Bryan O'Donoghue wrote:
>> From: Konrad Dybcio <konradybcio@kernel.org>
>>
>> Add the required nodes to enable Venus on sc8280xp.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> 
> SoB and From do not match.

.mailmap breaks this

I previously worked around this by kicking the relevant entries from the
file, but that in turn broke base-commit in the cover letter

Konrad

