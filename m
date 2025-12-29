Return-Path: <linux-media+bounces-49642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64433CE6DF3
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 14:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEB9730181AD
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 13:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104873164BF;
	Mon, 29 Dec 2025 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DI7f7SS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpjWjLdm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07854313E22
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014541; cv=none; b=Kw1RdMgf3HHg6l3ZDTUaLSEEVLnZmpQLYdKTw+yOYsFMSY8Z1ERkWfMNHq55zELfX9X/mKsGtorw2H2OtN4jpoA+B4WFAXoRcEpv+ghJLUHtKoKPQPbLhP9X5g/t0fb5arW9bBoA8k760AxIXdNYOA84baXLZSmuIuyLCGMGYRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014541; c=relaxed/simple;
	bh=HJqevJYAY1QZEuReRtLCKo0yBk0YcaGD7kh1FWQHyc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nF6gEPF397pYTiWOATY8jl1Wdmz3c4NtmDcKjDIR3/hiSNksYlqHW9qCm8Uyxluzr/UXnMCwG/751p0//drodBpKOljwOfGzromnj23S96R8q1PqdywBLwn7l+1SuXdYVd5YsBCQX8AULF5gamcam8kAlo2/kubFVhSBomWjVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DI7f7SS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpjWjLdm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTARcss3647987
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 13:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJqevJYAY1QZEuReRtLCKo0yBk0YcaGD7kh1FWQHyc0=; b=DI7f7SS1+EnsEhjZ
	cBCVIMv1rdkzLHA85yRF0q49iVULv/gLs4M16tz8gOCJFmhEqJvwSrMWq4VNP1b0
	8DwOPjo9SL4ZImtxT3N7Y41eQEWsc1nObUtAUPb33vcGoBNExQvDXHKkjbXRhDX2
	oOn7pkwjcB4PJ+kXdGSMFaJ9Qs7ILCRYhZtScgHtS2eXcjr+APHSYpGM6zywiygn
	vynQvtfwlvTjfvcwjUOTvlWeOyU+bgjrixzihUkcU4POUqFXcjn3+gdOeIvTEQRZ
	i0NJvvTj0FBUcX4uUil0105DPBkB3vWfPMLEehBDbyTW9YDv56stiEAmwAH2FLR3
	Tjekeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg4euj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 13:22:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2ea2b51cfso273124785a.0
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 05:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767014538; x=1767619338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJqevJYAY1QZEuReRtLCKo0yBk0YcaGD7kh1FWQHyc0=;
        b=RpjWjLdmPgeLc3DD5idzGPG7zEliIwa2L8/jOi/G7NwZYl+EaD/jNE81LiYGI0u8Ox
         Rd5eftJJgBeSnUasVc8PQzpYBZvCiyXTKpC+lDovctlUSiWkAfK7cjvpn3IPo6pTZvcw
         luzfOKDpXLwUUgwVtiuTLva2VkMzI/b+vhAAjuJ3DE2dO+eP9uZaBfH2DQQH2cLDgepS
         4vcDI+HJT6A9a+xXX21hTT9u3yRCdpMn6V5B85NFlOeoeHrRaOruljjWFZTuT1atsaD6
         gAQUV/Ib4w8vO1CS4klCR+0Zucukmhtmi/SbhXHZL27IZmAOt1PYgCI9CLkmGF9KCYsP
         lqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767014538; x=1767619338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJqevJYAY1QZEuReRtLCKo0yBk0YcaGD7kh1FWQHyc0=;
        b=PVD6eakYeVUyLt04NJBLuG8Q6f29KMTg57iuXacHK5qUsCAveOhID8DUbLX/1BCToP
         aElCkIMLe9KjoOi8PocZyNuzTUkI9j2WiL9N+cLvK5oTvwJOPNFOoyODoBG7TNh3jGJP
         +bCQ/NlnyGtHL5g9A1itDOtjy9iyJQONp9s41uPvsOnlqv/WFjgE1aUaseB2PKdf6QxK
         GbYQXhvdB+RsZdfXiGaB4xD0ETGAuy68qlkBzymRchZDo4gwi/3Arriiice5k7tb7Nmz
         JlxHWhMOF9WTtDFleS4T95j/3Vm+w6tPQX8RcuqxBJO2kdx1OEg7kVyyiMhi9nleHCSJ
         TCdw==
X-Forwarded-Encrypted: i=1; AJvYcCV7H3VGwf6N/JUdchSRvyNigIWO2Y+j5Rs8NbBHviDDqTAMIsGnLijTWAhC4T4D+iuIzaMk7NEgZyub9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTvYUbOvmyX9nOX/TlPQqseFCFraGMlDuXfBcOSpx2q8UorY5h
	mf+AhMs65tuaJmLbiAVDqBAb552+hc5GOL2/hymVKgVBKuJl2iBKvoKVMvYBjS8YCsOmUmLkP24
	dOn7VFjRybavLjkczuyfL5ThU5gyYZ5dbrM9Tr+vA4Lh/13WfRUSIWUcaL/VU2qtGWw==
X-Gm-Gg: AY/fxX64Y2e38um4/2XuWvyBkOrld0fbMRmG491rbVc5/GBi+/jIJX9pui1i755o6Yg
	QmwZfDp/fA9NVv8S2n4XyKv7CJdYH/8OzKAUVi+JhAfm5jhJz9YGMbjpm9PaVaW0+S08l7J0x0c
	BHIpMkdo3ygEEHIEYv9wZLM/vkKiqyXKbIOzML6qAO/b3hxaJXrveGmbCoUxwM5cZn4tlsxPj2K
	mfaShfhil3FyLGKyCYcSXJD3BNaBm15RYyGlng7n7MYFPDmKrzt/OArdN6b0LZm5gw311Hi+e0C
	YWQfEkWeXJbjrIibXemg8/BfZZC2VcqmnAFoSxWvS6BYS5MZULTa0HWs+sMdvKXycC/RKCuZwtl
	VzzJylzuduXE/NfO7gJC66A5P7pyI++7rlb0zdiDB/baa/xmZcWStvGp8BjHrDlopOw==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f4abdb158cmr318186811cf.6.1767014538347;
        Mon, 29 Dec 2025 05:22:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB9vPODytiYPIOYJr0ojiA+7vTk9wG4QHcB35oQO/bx33xSmDZ0T9A6JaTvdLxFmBKp6uCVQ==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4f4abdb158cmr318186461cf.6.1767014537822;
        Mon, 29 Dec 2025 05:22:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ddffc7sm3340618766b.43.2025.12.29.05.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:22:17 -0800 (PST)
Message-ID: <0c7ed58e-4023-48f3-948d-0ca2811b331d@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:22:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: talos: Add CCI definitions
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-2-4d260a31c00d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150_evk-v1-2-4d260a31c00d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Amhsbwv-8SwCtHfBjpRQBFAcSwduycLt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyNCBTYWx0ZWRfX+6lo++0STfnF
 Fo/haJTfOxaZuEAKuW6xemP/dyHgjW1/Ld0Tjb3B82TIB99ImRnf+Sl0cPWa6ETc9TZDt3r1abe
 9LX/44hZA27y9N5MQlxxCNETU9dtxKzHZEX+CaHb4PeBQdqq7hHCY0j0C/0RJTIMF2LaoTo4bMs
 zKAHXV9WhX1rxQc2aPOHXUE9728t/4bs/npRJcI+2u6pFYOYBToqFbP3PGy4+6P+8o2eD6GIjXq
 Gub1uvsaU1neriJf3OPpprkTAqAEEbMm//nERhT3XIIS5SflVJsykdRvkYwlmHw+SE3BXuKPVgr
 o4ZTumc+BET9iOtOv8xTjFVrgfw8UT9HHCA2TKJxXBMwhbF5WVbsactRH9gd3AaUgTWstWap55m
 f0n9w4vdLKFVTF78WAZgR9nUGnNMOEP+DrSO+d1gHQEm9wNsotf5OZS2RfIg9hwD7nwD4puxRyl
 kcnrjFIGw8R3iPYM0zw==
X-Proofpoint-ORIG-GUID: Amhsbwv-8SwCtHfBjpRQBFAcSwduycLt
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=6952808a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EdBNvarzL8_vv18a1hgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290124

On 12/22/25 9:44 AM, Wenmeng Liu wrote:
> Qualcomm Talos SoC contains 1 Camera Control Interface controllers.

"[...] contains a single controller, containing 2 I2C hosts.
Describe it."

Konrad

