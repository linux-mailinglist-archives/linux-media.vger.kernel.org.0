Return-Path: <linux-media+bounces-49072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5475ACCC113
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 14:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D9E7303D680
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 13:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B892F3621;
	Thu, 18 Dec 2025 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceZazrGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqdyUO8K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C0314D3D
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065182; cv=none; b=G0//kxICzMw1wQKl/1BQHkzNqmaauxUDOX8i/AqLNGkTEjsKMKxyAkq8p/EPNzJLsRyl9A+HQgW9tu+shHB1abZZ6m0LDKdwsgSRNK1Ds5A8Ct2EtnEREeMEJNz6mdv33LiaRfeDbJVwHQ/6Y3zFSknGw0NY9sqBTJ2ZuTlhff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065182; c=relaxed/simple;
	bh=iXBjavAzr+b344rqXrPUfRCnf/+ZQMxOzlCBRlY9bI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uovObwNT16mzT79G/H9b4qPMmFiOs2+plpXyDkoHRjmZ3f8g3kFKMFU+rS/l6AIX8gqpxEePFN/iKbsZK9TfgBaMRHR6QWeOslDj6aKlPPtuuCaxapge4nzbJCZLPFFcDkRnhJjq/v7A/CLPrX4m68jbGC1ru357PO3GFvGJ+nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceZazrGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqdyUO8K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9BlGc4148410
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 13:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXBjavAzr+b344rqXrPUfRCnf/+ZQMxOzlCBRlY9bI4=; b=ceZazrGplkJgGn4k
	g7hXFkAeQ2jBeSnDxZEy1vQTHBTxuhby02BQuDiGOOKJkqVXe5E6Maqz7D213Gum
	ocnw+GOeTQTGwuLcbDoULUp8HN+F/CoSpKwXrdYF3zYJxE9yHP2kW16wHcxVHktv
	a7b5jrTRQ/hIAssAo/XIKj48VfLJMx8YQQKcxA+IimfpTi9uBRyIziKFses9TDN+
	hXGhsEZ6ZigaV8KDeDo+Wi7ZDzUZpvUsl2HZ3xarAqxAVQ+a1rPTsRsFa1lyeXLd
	N6riFxSR0MacQFGBpdnQ43dF4+wBU6YyEYGUWygtjj1ioOKk1puQRlgv0Gz2jXQK
	I+Tz5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u7bb7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 13:39:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927183so467411cf.0
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 05:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766065179; x=1766669979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iXBjavAzr+b344rqXrPUfRCnf/+ZQMxOzlCBRlY9bI4=;
        b=KqdyUO8KTClHPoh9dGH7KLmlKzNXUpzhic4KmEL1cAI/N6sqhTp0wYEoGyW9YAmj/E
         qOpzwRT4sPYMFUNL9ZPmJvX79r86qD2Vnr0A53vTBb4je/UqjfrwX6U76Y83kBzAALA/
         uxPhNh19GK6qZ/4RoajIFZKxHSKjTUDrlPIjRvvp9b6toQo+Y9T23bB2SaSEm+X7x0xO
         ZvdnX40g3yW9dTdAA3CilB+NECisxSYAh2Sv6ROdLNjngDT4SJ568fb3qPJONhJJMjG7
         cXZ1UvjrjMCtie+Xp1NpAtLqLkqElKs6HYlSTarE7IeaG38TJNsegRX2s+ndk8PAdYwv
         4EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065179; x=1766669979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXBjavAzr+b344rqXrPUfRCnf/+ZQMxOzlCBRlY9bI4=;
        b=g0yqidK0X04P+es56Y0k31Kn6zK9u24CQXSPqO7r1/172xrteFfzq2Xns5o6cwijNT
         F3GAEa2AJHiudtYvXys9SsOSnzni+tPOQ9semgUoJ4FaqGSKrLRTl/Hbf5WX9QBGKpXj
         ve6ZLaGblSGzxMLk1aYKrJV3y7bHsKGgaRGe716g1MjeAaSuMOQEngEdDvgRtccGUUdX
         oLTeR+ogYOryhY36A47uvH85b/DZuKQbeiCTMUA+ouvAAJ4Min2WBZ+Yu06bjhqx7UMX
         BYWfFcGzvGOuCUb97VZiGTDJCPmEAXtRcqLuaX0vl/yQb3tlOL9eCpAv4wrug2n3XGyy
         rFcg==
X-Forwarded-Encrypted: i=1; AJvYcCXrknJkFK835Ziv9Z89Ugm0AP3idvHGoeSaEg9B5xpdduaWPgo3HBvcL0vxYx/VPH9cO0T7fsIWwuHDxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnJs9RNzVT0HWNaRuLeb+kl3oSuvsTQYSdRO4jkVzOsprPKDP
	YudC+jaI412WQHi0GdTuVOcNNf7hiLHrIia0BxsllPusjQBYje5MxgU7IabPYLCfcWN+GFvmYJ3
	9aQpr0d/QwE9qiqn3/1RpMSQhKAmb9Qh5nE5thhQ1IzEtjkmRAolJdx+YpiiYxBzdmg==
X-Gm-Gg: AY/fxX4NeQuZzxZ32xi7i+Zw2u+ndAhxQsW/keEtwLS1He1YLawpbMBYKuyVE/OEOHz
	199KBc7aYFEqTnuA0q69nHg9UCU+hGqNni+fsD2+vjjFIkmkwjlwJ3e8DAsmM+f7bQUXTq5OXlK
	DlVIe5hURmWs0M0ue+3PIxJYkA+Pwum+BG1PQhmtHZsZ5iTkmHaL6ipbVX7c77mPbD6Hmr2zpDV
	mY/762FlyMnxZ3EwRke9+XaZajh+b9wKEplSjjsqmVVhgxIMTBDDr+puxxEg4PfQmz21d+am71a
	phocDfsKdrHyFVzv40wFDI1iCwqXdm6vgV4LsWoiygme/IMy/hAPWxgO89I5DPIOim3fu8jDnjJ
	6+yjC8ARB/av69isukHDA0zGPSsw1U25zapeQBEYU6QMc+BW3QfV7SEj9dgKeuQwd3Q==
X-Received: by 2002:a05:622a:43:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f3610818f0mr19712151cf.4.1766065178745;
        Thu, 18 Dec 2025 05:39:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTeIvy/NjnisAiBdGVDUI2R7PT5nt+0PAwtdl6wvnjsNYp+nDPPgKkDdnegJEkAxI51ztlow==
X-Received: by 2002:a05:622a:43:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f3610818f0mr19711931cf.4.1766065178347;
        Thu, 18 Dec 2025 05:39:38 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5887d4a0sm2459517a12.23.2025.12.18.05.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 05:39:37 -0800 (PST)
Message-ID: <9964bf4b-a6ed-4429-8c70-520cd19781e9@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 14:39:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-6-quic_nihalkum@quicinc.com>
 <5bd29b5f-6fcf-428d-b451-698d92f0883e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5bd29b5f-6fcf-428d-b451-698d92f0883e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WhCzkqARqsJy5xrRt2ekgdavUuXJn7St
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=6944041b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lOoz2d9cngm9sXlBlawA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: WhCzkqARqsJy5xrRt2ekgdavUuXJn7St
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMyBTYWx0ZWRfX37yLxzYzRVx+
 M0q9UMYR8VZx2hmstpGTONI5dJS++wHl9pAqu2rdq0OjDU2SdIhsXdWdrmBskjfVUnDuBNOIQIV
 kQ+PjcrDjkKIh+Uhb2A1BmImgiHbe2I7kldFhsnWt+9WjJFWW1uUQuuoqbom+JXePMbu8jbxTBM
 n5mY1JYmVb+vjH4eQPba7+EU05P4+Bvh6J2+DrVliWzmj0yaCPbJUGwK0dZmutiTftRxn8/J2XV
 IPyjwcD7WYN9zhsA+vOrLOj3I/Bv4eyjyFxKhIrTbyvMSRryCnQpzgWy5KSboAw/8NRhBLcunLI
 gm6UyM+BwtQTFTP2cy+4G+JMmzEl4g6r/ikQoq92x5x5/fvIrj6RHkxphoKtFoyZnfrvQ9kpBVp
 xPc7R2d3B9qhZbJv7FCIAxFSImmTrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180113

On 12/16/25 8:35 AM, Vladimir Zapolskiy wrote:
> On 12/16/25 08:22, Nihal Kumar Gupta wrote:
>> Monaco EVK board does not include a camera sensor in its default hardware
>> configuration. Introducing a device tree overlay to support optional
>> integration of the IMX577 sensor via CSIPHY1.
>>
>> Camera reset is handled through an I2C expander, and power is enabled
>> via TLMM GPIO74.
>>
>> An example media-ctl pipeline for the imx577 is:

[...]

> If only one of 3 defined from 4/5 regulators is used, do you really wish
> to describle all 3 in advance? You may consider to remove 2 currently unused
> GPIO controlled regulator descriptions, and squash this change with 4/5.

This is useful, if only to surely park them when unused.

Konrad

