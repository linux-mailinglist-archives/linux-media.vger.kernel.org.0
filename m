Return-Path: <linux-media+bounces-22742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B10829E5B66
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 17:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32DE41885506
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09DC21D588;
	Thu,  5 Dec 2024 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ch5SBvcB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FBA21CA18
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416121; cv=none; b=FGxZ7Q1KXYN2qi52V7Xd5D4YoE0i0dTwGWGBqdaMvdpUXLtqwWs2TnSbvag80spGiLz1wyOhVubb95BXu+JVLlzwx3CpbuboANAcKaACWtpHoqu6mPcTFQFXlXF99twz7Eiy3FCbT4rVRudzEZW3loks6t0vNy669bf3GqVYdvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416121; c=relaxed/simple;
	bh=Hyd0DGsgrgFFk1brp6woAw2Gve8VG2lrqOtM5Buj/pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JW5B2zA6TwgVd6OLOJKhl13LzFLcqgUxNZ6WLbWCYf5q4z0J+/9iwukvwRDyOJ+9ZT0uo/I/J3Xb5+CIL6njqZylklMC2h3K9T6gIGjQPFyI4JkRqmSlstg4O0NT3Lcqq3aV9wcr0ZnXQ2sw9wY6wZCnLlxhtlP/dEX9F8KD54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ch5SBvcB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5A9UUr031654
	for <linux-media@vger.kernel.org>; Thu, 5 Dec 2024 16:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVewGd+CHap/GFBRG9A4Vc53nu5CRbniCuyyyIyrS/E=; b=Ch5SBvcB0TbZns63
	81Peg1qa9GnWJwaAeVOgwplc7EZrn58imN7b63HagQ6JYvhDMxyBgtcaT/pmueuB
	zkUo2dJezjDsRZE+nbXSJnkLFlBzX3ZP8wC4PzS8mDIZPQpXCp0yy6E8LkoLR/DQ
	V3w+xxssOZOK08jCqrhFmfzGULacHOFNW4ZY23LdjK6pRM42tj28cJeoU6LNeCOQ
	PL+AxoFXYpW29PE4Z9V4mNkiv56UTIzSVPRwI+y/myG9y9EVMLcWumWjOeHxXYpG
	vUTvJlD6zXzVds1K+BYG0s9XDU3kJy7tWW1JTxKmz1qgGrx9ybNFOJMMnQ7eIh8K
	+MCIaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ayemamfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 16:28:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d3b1d1d8c1so2597016d6.2
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 08:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416117; x=1734020917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVewGd+CHap/GFBRG9A4Vc53nu5CRbniCuyyyIyrS/E=;
        b=qhIyKHgRiETzzVP8aXMRaW025x5NKM33wlFSXwaHfpYMsU2AjPZQ5n3vzYMakNg3ad
         /+ArlciG1DEPJ2Dmogk3D0EgZzb5SNoBWpX7rHQsu29Dpuy4iUPJcGeaL1T/lWWfVxvZ
         zUqX70LplIwmVHg7kfipJUmfgY9b4zC/B5AGjbb7vFFQxNkW4J4S/adCiXioDbaLLlqq
         4C425CR75nuj0KLIczXrikEpayvSL2rX4lTABdXcL467PqODnf3C5waNrkc0gIN6QRoY
         Xol+p9hjQyuVREt28oeeCS1xug6/36WQ+nJA2ski1NcRmJfv/2HIe5WaA7P0Y7jErHvj
         ftDA==
X-Forwarded-Encrypted: i=1; AJvYcCX2rtlBdapi8SpN3nlifrWimFDUMGgRtkTsp45kDXii8mDApXSnL0gqSOB9WpF6yoMEOF2sL9VM7PvKuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLLLXQkO5wA5gYlDroQvzTflcCo3K0KHCtiX5ZGTpoYAIhUmmD
	9pgprX8kZapFBLz0fkNIKxswwr691ia/r7uJDkcorjFCC1kipB3YbrB6F7SK2ZmDj5YKbDOsgvZ
	oI9h+QmlN+DNSGwjLFf+1hMam1ripOOp0XAb5yVzHwHkaVBHQqEhjJTcwwlF1SQ==
X-Gm-Gg: ASbGnctz8f3FwgN2CZIsz2vNFN49e/wpVyxbzyeB9oeY6T0RVe7uiQLmpk4aech8leO
	PVrC8koPR1SAzh3rh7IvokNlE0oXc/eXJ9TlAYDP2ctRElBPx92DRcEgRhwMh0amwQOiWWeWsZ5
	8/jx7rqOUQHMfiU4teI5jBiMEmyOaeAmY79BHlD787NTAYsNT6b3BeGSo+yDBSvq+OS+EU6024f
	or2dR/+nAzBZJrgYaRqlH82O5iUt0gjHnbcJuzhDuD/GFmqfstnHUMGkjAMLxRCR0AfRwTGxonp
	slZZ1qB5j8k4+EvPtjGJfopqwjHtZLQ=
X-Received: by 2002:a05:620a:2a0b:b0:7b6:72f6:210e with SMTP id af79cd13be357-7b6a6bddcf1mr653503085a.3.1733416117633;
        Thu, 05 Dec 2024 08:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIQmJDqB7aPqLdNqqxjOXlNlTRx0vV7ECtpg6Wubt2pVIN3Isf/fldXO36qKZaV1jYkkt/Pw==
X-Received: by 2002:a05:620a:2a0b:b0:7b6:72f6:210e with SMTP id af79cd13be357-7b6a6bddcf1mr653500585a.3.1733416117234;
        Thu, 05 Dec 2024 08:28:37 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa441sm964726a12.72.2024.12.05.08.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:28:36 -0800 (PST)
Message-ID: <e586b76f-50a7-47cc-9ce6-a37f9b53262f@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:28:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eilGefmIf6WhTZkTZOHjJBQsM-PxFcEu
X-Proofpoint-ORIG-GUID: eilGefmIf6WhTZkTZOHjJBQsM-PxFcEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050119

On 4.12.2024 11:00 AM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

(isp@ as mentioned)

> +			interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,

QCOM_ICC_TAG_ACTIVE_ONLY

> +					<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;

QCOM_ICC_TAG_ALWAYS

> +			interconnect-names = "ahb", "hf_0";
> +
> +			iommus = <&apps_smmu 0x800 0x4e0>;
> +
> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_IFE_2_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0", "ife1", "ife2", "top";

vertical list, please

Konrad

