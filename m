Return-Path: <linux-media+bounces-47335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D64D3C6C1D8
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 01:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C08604E6074
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 00:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D881F0E29;
	Wed, 19 Nov 2025 00:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRxyCUma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xuvjhxty"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58513D891
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763511831; cv=none; b=gOpN2KxeaESbh18nfixWoZocEu/aCVfKOEa0K8ddohTWMdLaJbnr2If6rSVaMUj2xBl1ZRfrES0THbl0QxkwG8gQmDqhpzijuguYehj52B+NVjsnFtlkFf/ASZDA9mNacwfgeHGj9pRVZa1jXb8eNka8AvRonX+Hh3HQAITCClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763511831; c=relaxed/simple;
	bh=dbxQ+lWbQ/v0JEBh7WfaNiELJev7d2uNdEhFBncVoVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lczpfuzpw1I1nYlOo8HhOGmdwS0ZLENqrq1TNcKhy4XP6DYOpg6/iM0AY9EGnM8Vtwjn6cNFBhIA3HT1hn+mkx9As759yjq9TlHEnqhNTvEtB4kr3c8FKUWcV2x17E2sfWbFD6b6pKSYjYNRQTL1vlDfWZn39pfoKoQfV6R6tMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRxyCUma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xuvjhxty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIH7ooP2664787
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 00:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NACq7p7BFA2chMCrQGix5RxOQsKwaCoHfjgKRgQT/oY=; b=JRxyCUmalpMTaAH0
	jrNkcwN+/Jixc7420knIWiaHfFrreM/BoV3SuFELWZaUIpVTwJnD54uKq0Nk72IP
	WGKAhZejaOQBpam7xA4Gj/T+q0gOC6na8MdPK2vUQ+JoI3cL9cP8PybJaeu2whYy
	xWXybs8D7IYZnwVEB++TzUxOZF7YQAC38RMTZlM0PaneT7QecI7ycH1ASttGfpjh
	+Jy8nuRPnTf+teNpDlxonmokFatbCyxoNBaepM+EqXZQWWDRmAxzivZGI6kl4W9H
	R8e4g9qbHVETYmZTAQtNyi48NHPq63NkUYBIQEVLlXXgaCsaLgKqGfJqVDYBVxB4
	AKqOSQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjkaa1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 00:23:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bce224720d8so5621616a12.1
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 16:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763511827; x=1764116627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NACq7p7BFA2chMCrQGix5RxOQsKwaCoHfjgKRgQT/oY=;
        b=XuvjhxtyrjKUIYyKReOESdyW0j7il6KELLMpz6CWYWko2BTbUCNRrIxDksNP9xo/6d
         LRJF4e7Zbyb9QQ5WuVYO95MFu3AwuT6/uhnbkE7qQQAd32cNac3/2NdAXLCiR1iA4Sld
         GiJMV4kAqpNFmVoOXI19FUP71s+0IurjF9wKlYelBRFL1kHOqSu0RTr8jM8NyaGdTrNy
         LEE/LQlHd4WCy7eWxvzkloeGXywnmd1xQadLSyTRt9jCbsXHX/z86oG6bSmpk6/V4v3c
         Y3g4RBlUrUodDcZKlKPS3GgTiPhgPH1p4sz+lqaxAasP56QpJj7f4KvU8kL42FQ+tPkY
         PNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763511827; x=1764116627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NACq7p7BFA2chMCrQGix5RxOQsKwaCoHfjgKRgQT/oY=;
        b=dSsodYL0GZbLDndGmt2/QF5sC4xtyxNlsvS6gmX5Dc9q6dO8e2ZfOkMx24lVC+j93R
         KqThBrU8HePCktP8fpH2b5opIVhGbCVwJC+3zPPAyReXqBeb6eTADIuO4XefhYVhpjSf
         kD0hFOCOI2eksMu6qg3QZCr6wZb6Sf+VRDNaXt4ZJ/IrEpODncqNbjsOepIZ3apASEu5
         +vKk9iePEv9EmlHdsHhgEHxrMyU21IScTIVz8vS9yhmXNfJ0RxbxU3we5Hl+SEihir0Z
         3jdZO7aCEbQHSMKBqWsMe0wd2Ds+xqPGAd+PbDC/BIGGXEwm+AJHBjkmlGkHaUIMYicu
         iNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK1OOUbkOXXsqHfBGiJpAb+tK1ZNyxFOlAQ+1lphlAZ1h50zENdK+puKRpgYILAWwCTXON16rcxbcH9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLj+J5E0uDgCBTQxXrimWtKbOWXTFdDekQVAdPdQfbid923H7
	osQHD0uub6ymLSjQciAWPOQ4esVNmr7LvIBqX8NsXbd8TjTkG/G7cTyMQGGXZQ0s1DCkSRIeqHj
	bucMGcT9l7BjmcMvxJexYGrgoITV+mtwj7Jmj1jRadJKKHpH+JbTpDWa8jVo4jtTPfQ==
X-Gm-Gg: ASbGncvD4neHspi6ye1kqmtmTo+2jDbNu6yjzYIvzpWtc7Fz19IiXVQahCnf0DZ6hF6
	eK1uYfaQUsuMH3mLKCwIVfG5mfaWO2L0dt21/AOJYHDYKFdxRyCX4UJo3EGqpBIsat4Ur4XlHtM
	D50+oPGJRFQRX2NgIlF+Stq7aNxx/PC2KqqOpZwsD2IglrIvq3092SRxJnOu/MeicLeis1Sqhfx
	3SGLRGwpBXno2OzHqCJ8+9ZQPo3lxJ7dg0kqzQ3JoruAjW8hENMakJPyqYmN1c4feq/BsOk1Lqn
	kfZ/OHL3ihhc4DCKxvRP2JkcDlctiOeD/utmYoAAUsnUkFBKOSVq8ejfxCeQEgapDGVoeocOD3U
	QttmEUSd35kAT5T3Ji2qvKQKKo6XyN4jiTB3PUkvz
X-Received: by 2002:a05:693c:248b:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2a4ab75ea03mr8177619eec.0.1763511827289;
        Tue, 18 Nov 2025 16:23:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY/LUvIaYspXXBZKdhgqXXbTL2b9p/z+6obt25kh74FGuJV/7c04bkuMplZXWKtSHgF7QJnw==
X-Received: by 2002:a05:693c:248b:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2a4ab75ea03mr8177609eec.0.1763511826697;
        Tue, 18 Nov 2025 16:23:46 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db4a36asm48843525eec.5.2025.11.18.16.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 16:23:44 -0800 (PST)
Message-ID: <c2f30fc7-8123-4711-a45e-d02155590d22@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:23:42 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] media: qcom: camss: csid: Add support for CSID
 1080
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-4-1e6038785a8e@oss.qualcomm.com>
 <79097e86-1570-440d-b18c-43b143f9ab54@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <79097e86-1570-440d-b18c-43b143f9ab54@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S5hawuhOtq3say9zvprBzFso6r1x8-kF
X-Proofpoint-GUID: S5hawuhOtq3say9zvprBzFso6r1x8-kF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAwMCBTYWx0ZWRfX8Lln36rnNvhD
 Pa6R26L3ZKO54BYKT/vJihXk1GL3ivKnBA8ScNykDz2vGaiK+v8Qtidi0eOhW/ABhE2YtHagasW
 2ftGRVe/M7D9x0wfngs8AX1oFYo7UghzUO6m48PJDTtMaSX+0CRvheS7cyaoSLSV2elHB+3aZLd
 Q+u2I1Ud7uGdXObhk9pmuoUl6y1z5l2VE3Kao9NCcjxmolcZF3D2DbwTlLdRoXQEDcIk+eCs0tu
 ikDix7c0EGKzQvibslwgxZsj4/SXe4oxWbcJy4cqFb2XDmSVrHjbp50S+rnjSjlRJRvlgc/JXtZ
 Z4BIEz1+IOOr+A6BAtgbGbxxefkzv4nja667Z1ScPTJ02uNNRBorRKi+94O0nMpa3auUkRKXaGx
 S5iqMdbIiMX0vfVwoduIS9eZGM/UEQ==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691d0e14 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5SxNaTsAWBRRj6OLVwAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190000


On 11/18/2025 1:43 AM, Bryan O'Donoghue wrote:
> On 14/11/2025 03:29, Hangxiang Ma wrote:
>> +            if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + 
>> i)) {
>> +                /*
>> +                 * buf done and RUP IRQ have been moved to CSID from 
>> VFE.
>> +                 * Once CSID received buf done, need notify VFE of this
>> +                 * event and trigger VFE to handle buf done process.
>> +                 */
>> +                camss_buf_done(csid->camss, csid->id, i);
>> +            }
>
> Somebody needs to have a conversation with the Si design people to 
> tell them to stop moving this functionality around... its completely 
> demented.
>
> ---
> bod
>
If this is different between any of the recent chip sets (which I am not 
aware of), we can discuss with the HW team and standardize. I will take 
an AI on this. Other than that, I believe there is no code change 
required here. Thanks.


