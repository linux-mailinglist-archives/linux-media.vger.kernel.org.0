Return-Path: <linux-media+bounces-37766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA0DB05772
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 12:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE3EB5614F2
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DAD275B0A;
	Tue, 15 Jul 2025 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhZVbFib"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B24BA42
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573949; cv=none; b=eJBEMjfPZDaNGqLgYq9hbzYgRDHLypmjvLNjZdOUGKzGk3jsp7eNmcjR9c9cjkCPE2ORZxAXQ9Btu9xu8IqdA1LWRnDEZ+jCClVIvHfWGD8G2bKEFkUIezTTIJHZqhee/ZHcIUQ2pifM9D2yk/FkFMQDU6NZmp5Vwqz8GmNuvE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573949; c=relaxed/simple;
	bh=wcoEe8qNq7qcMF+Mu+Tw9LIFInIojyMTm7uEkxvUrFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbQRLcgnMqLqL18WSw11k3JnI6wD4ZolcchyHrevz7w8VeZ0lQZPrDS0W43FK+9wkXrzi3oItR0hNiU1oDoJ7FAksqRLPUMCe4rQU2EWO3OLstWwJFuMZ81TL8BoG8wBGvAbCac4Ppzw3lI4eEeDCqKLMg3HkulEFOSZs9stYTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhZVbFib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8nOO4002934
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 10:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xoD2R1SjXv1eRy5P+7pX3hNP7MpiMaL2xSBXTAGGJ0Q=; b=PhZVbFibWdSZ4YVe
	YbQSqaTGDvqH5BPqQazTg/P9lVpuBGj9aKMGpykFRgccqyPrZzPRdYJfi/6tLASx
	kWH84gZjv8RF3T/qV4hW/rOjGjxikmIA3M/sEQlVmdqNf3zgIdbyvQKq949UdZxk
	FYGJBe7RB+R0O9Yf84zdbF2QCMH4YUszN5uahI3SV4yDYF3kQlrxdIxPQlsFQsDD
	qFgujS3FEGjJwvzopuDkSO/6oRq1jWbAJhvssah70ryvzs5y3+LbWGwATj3AA8/F
	TeauzW/QnlulkSuswpW0B6E8XthReHj83aLiRam4uWlGbC/j2oKT2s+g1P0sVRN2
	BqEUQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut7np9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 10:05:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e0003c5851so27822385a.3
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 03:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573945; x=1753178745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoD2R1SjXv1eRy5P+7pX3hNP7MpiMaL2xSBXTAGGJ0Q=;
        b=l85DjkcZ+XS/qpFnqdsnBDX30OZTyVtetvfvtMWWqIBOT4T6KJq4DuoXxNrCCsn3ny
         5/jUY7TQv89J5enDR9UYCKo2IHjXVEHxoLTzWnbOScYU4QlBg9PvXuNhCTKBUSkNgEPE
         A6g2w1fkHBNM+pZVnxi0HUyfinfddRdutWk2m9VLrzQaV2LhPHdtb0f0WVKYUkqPB9VL
         oVWw9MDal7ypsJRgPjO3EPGthdDMUgrtpE6YbQq8Va8RSO4CtHkbhuyJoqtt7NyLshi8
         gejp2maLpJw6XrBO9zVbuppsAlTRfWLe0F4C9u4RR1c3s3wmKUJLSBbnCNnu/1m0Ed4d
         /v0A==
X-Forwarded-Encrypted: i=1; AJvYcCXR4ssB8tRQxZrSe7gGqO/voo9MmZHNDC/9/B7SWYDn1O5Q6r02zl+++WhdZ8yhsloJuGY4kKnV5nuk9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyU1EjbliixjZ3Pzu4GcgXMJJLr/HsGoZJNCTSSeRCPuaOtLx
	TL3GZKms7DntXzVs/s1pqWDC8ePNI/+qVNNr2olcoEFiF30ph4Z2wgX7I9i8ZEtLofvORYl/+x9
	yc95Yg9XmqCM/611jgR33x+3O5NfJUOROp/JhW5QvEuMK5rbo5aCFCORGE6aMxQ5DlQ==
X-Gm-Gg: ASbGncvD6dpmn7A0e6cgqazzAzVn+qYfVI2NwdNEtuC2MPZfAFE/MBX5a17zA6lCwnc
	8EFezXi+2LyjZTugCFhxjCYeIhCxY4gViggdOmPGP1Vppw5P4C1D5h4YIM7V+MqrbmhrcUUdxML
	awLF5YLghwpBs6sLRYT2SIaBYno/OcUqrGFBu/McSMECIGPa07YUBgNP4hz0o2s0NJUxs9Co1KN
	gk1AvCS0CACGtQ2rKlsfAS6ELqI+9xKEHO/YTEsviddynVL8UfakpXkzwbeyuCPHRXD3wwEU2gR
	FTLyuDPzv+726vyLvo523wqjDBN1gR0sibaUwos5VVG2oGyM7c4j/AmjD/yC0FqavBkEuWq4rdf
	OR2HF3MmCperD9lYuJ1pB
X-Received: by 2002:a05:620a:17a0:b0:7e3:3a8f:ab1d with SMTP id af79cd13be357-7e33c7321c7mr41632585a.4.1752573945332;
        Tue, 15 Jul 2025 03:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfltLcnZ3DJsRe4H0bNNgmV8fu/FyMBl4oio/EqiA77AbLronXmD8m8JQ1m83ZrCm3MBiZEg==
X-Received: by 2002:a05:620a:17a0:b0:7e3:3a8f:ab1d with SMTP id af79cd13be357-7e33c7321c7mr41629585a.4.1752573944895;
        Tue, 15 Jul 2025 03:05:44 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df311sm962103666b.165.2025.07.15.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:05:44 -0700 (PDT)
Message-ID: <8b54d58d-1b0f-43ec-912a-62edff10922e@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 12:05:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
 <20250714210227.714841-10-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714210227.714841-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687627fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=uTbtQnSn72Kwyy-wytUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: SIaBUR6NWxL8Uz7CONTrJGF68NJ--1p2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5MSBTYWx0ZWRfX06yAEOQxYlq2
 PTVzLFXs6sdIEc3jNB+1GDNEuVTT9mmkQWZi5nkmRIGMak1Ws5+rSqkTG+I3TeY4J73LrOsRp2L
 8gVuLEiGd9D9+HEGDhYbKVaPqmGFHMufvGKVMv5JFNjAv/LjkPfiI2ACDebc8ldymprd6CGZeLa
 P8Xusbvv1VG65w6vZ843ju4XZ4S5Jml+3t6+FhH9zyncbxBn5FHg3AldVpHIqdNtPZT2UNGVyJV
 2niQePyFY2nEv/w0z0iOVfqZNa8ywGtwkwZrFSlVnyQMN25nY1kneQgTyv99uFmF5sO1YdRvvqi
 8Fg8u1YcGLyQg9YhIaEIxX3DT67NihUkRcCIrwmWGu+lAoUzje2EfWnsD8tYXxj0zb+316Cq0dv
 50qPgl+xOGRSirku0QikHoVkrCe4lk76Hig1x5r+BuEEiyosu3WWTP91re0/vTEkU8f/Biey
X-Proofpoint-ORIG-GUID: SIaBUR6NWxL8Uz7CONTrJGF68NJ--1p2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=721 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150091

On 7/14/25 11:02 PM, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---


> +&pm660_gpios {
> +	cam_vio_pin: cam-vio-state {
> +		pins = "gpio13";
> +		function = "normal";
> +		power-source = <PM8941_GPIO_VPH>;

This define is actually specific to PM8941.. I would assume that 0
is generally bound to VPH_PWR, but eeh, this is not what you want

Konrad

