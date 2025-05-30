Return-Path: <linux-media+bounces-33698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A23AAC93AF
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 18:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F19A1C21016
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 16:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2602E1C8611;
	Fri, 30 May 2025 16:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hS1NY1XC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BAD46B5
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622962; cv=none; b=npQtmHjTBcZdrI+KUpklz6Jn5lwUDtsallLLWSvtjpKC1rhhQN1Q9jOZ3hR/0D2AOYT3cKSeBMY2RGG8OeU+BRCMIbwt/CRVSolSiqQacGWWcmee7bQzYZpivaV63j4avc71hR+qeiaX4zwS8l8Qhenvq67MDtYvT3GKOf8STCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622962; c=relaxed/simple;
	bh=Ou28K7mPcEkrpg2bOaExpVD2dLuDalrqTtn2WNwNvfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6tlhJrB37cue4GXp6bFuBerj/EdZi4iasY08Slk6qOmopGm8SXudcjYLc3IeQ4QiVH0EFdRiiBZrw1845/nbEWRqkIbDL9iCYWnsUL8ILL4rkqBguKamYyluiX8LLX5+qn4whA8ukrSn7qurebxH4NTH/lqXkWsTAGfcAOEpjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hS1NY1XC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UA5NU9009553
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Shoo0tKVIcVl87O2cZuDQQ6KICwG3ajVLpAaOIpSTcE=; b=hS1NY1XCWJaI/L0a
	dJatO4IlRpSEMzQwwY6c+SNFZcYQnB/2uVSktsWPY/evcTwsqeyAoC8RlpC3jRT5
	PwBJxfWcS17aLFb3MyLV2CuDAdNs1tTCeaxyyHtzHnyQLmbFeJdD9x5lNa50Q63o
	tK5NWCrkoAz3Vd+a0iuaQBZe/GiJczyWL5VGp56jwk5No9co1fSOJzDRGdkezfD3
	Fmua1tTrWJBWsx97/dseKpjIUR4Egok5O8OUgpIBEPv+Zyzv0KGRUXjXIuwejRjs
	D13y+FQ5Tm0r0DiJGB+WMLhkIhJWdzZ69i6suJJNMWJ6ViZ9ISgdlRQMbWenOjmT
	+ru2/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691mcv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 16:36:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311b6d25278so2346145a91.3
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 09:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622959; x=1749227759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Shoo0tKVIcVl87O2cZuDQQ6KICwG3ajVLpAaOIpSTcE=;
        b=AVDgPlH227TmVv37bsfXlBMSWF3MarRUWesg6BqXmBNqp3KDST0hivwYC7ooqKrb1H
         0yWaqllHZQJm2/3Meov9X0adRiVNR/xuVw6xSbXcJc22v0ECeOJX+LEwdW5E3lZXP8Kg
         lRXJIAtTbFeZykJsu+kiLN3L4n9PlRAwhFU1IU+woh6IaGQvd4B41DrQL1ghmGOvN49J
         0ygPzjbKJeNAmMg76m1JzxD8TscITiBQU/NrZM6RX8oa0u0zlJx6coWpd2Chi4ZuTWnl
         NRQgagUsEAAhWo//2I7NKRhsxI1XMHSxkf1AOR+fCNw8G1z7nSNXDsZ2N7AkRfcz1dxr
         kwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxnwdJqaMoslUPzn1V4MbAmHqRJHfTS9mpaAbO3lZLHTpd7wVQzjlVwo+EtARLsxfnjm1OlWUMwoPsJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyiGpyLJ9AAHMAZ6pBzMVSW+K6NKinKBKgFjNqbgYaQzXkuR8S
	c+pmrpJ+JQi1+svBUagxFKvhgSeQKoDJZRwnKycSBMpJTTmt4hQ7M0zELs6+0zSgC0Tqvilw6db
	SWsN1rMYPn2/RGuW5VsuAdm0Cz+tOeJLt1+8GAPwgM1tLvN76kifL0utDXXrJlqc8MA==
X-Gm-Gg: ASbGncuK6wKKH9zpweuupBvyvzWwiIgroIgGOuEbsRmNPX1SRup6grnvI5Ep9E/Wwl2
	c9G6q7/hKD2MPjyIfNbAo1NKOAVfs9iwgwNv0X+9TiyEak+GlPyMSmoLiAoaYh+LRo3a3AomM78
	XNJyCVinryRdpDg4nXGZmZM00o80EpcUw/hCzFHBo6jkgjNbiTzNUIRS9lLiQN5BfLad9TBZRXH
	dSDzMy7Dd14nf70f5M4leTq/wNVkqgKmnCHWJfqdbX3ic0M+WK6DYgPdQWVXu9L/kNj4WqT0BXi
	sChSiODEQv0prkT1joTAqMnzvGx+jK6HN9cq+N9iAhoLF6SyI0V5m/Pd1Pkd2w==
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-31241e8cb1dmr6395392a91.24.1748622959267;
        Fri, 30 May 2025 09:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7gZlETTzuM/nB9i8V58eslnhzSbt76+bQeUPi+dwYMc6LXYsmcqrpPQXpymgaj7IkyAYV1Q==
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-31241e8cb1dmr6395344a91.24.1748622958819;
        Fri, 30 May 2025 09:35:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c1358sm1544883a91.37.2025.05.30.09.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:35:58 -0700 (PDT)
Message-ID: <bf24ba20-dad5-410a-934c-f5963a2769ec@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:35:55 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] accel/rocket: Add IOCTLs for synchronizing
 memory accesses
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6839de70 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=DISFzqtZAAAA:8 a=EUspDBNiAAAA:8
 a=CskBsiFdeBhsZAe0Fc8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-GUID: -F0VWWuynyy6KdPdyaTjqjIyusTmmBnY
X-Proofpoint-ORIG-GUID: -F0VWWuynyy6KdPdyaTjqjIyusTmmBnY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NyBTYWx0ZWRfXzxz6mqQV/awV
 4ewLil0Lno3/uJRxwZBvPtl5HTaZIaGWiQLDkb+zPxoW+uwmuz6mCZfhkWbAbguZyjox+8+tRsA
 h/PMBA/vifaOCRnT0Y2O/3fNAg92f2r1SqOMWvlz+Rbyl8hwZi1Q/nreaSasJ38HsTY22/ZScKd
 DdYg9CBFzozo+LS31f88/BNtttUNVS5YBR/25Y6ysPS7HV49NUHxC5VnReUJPUrD98ehxB1Xqtz
 QmKiBeoZEOAGK+8eZox13yP5EAicb9y2+WVvq/xNWNROfSKH+Qlr9L0mTxuyrzgspEiccTez/nh
 MGOOzG9L3IpWnkibqxVmAhReujj9iAlb/uzrJBEYOL+Ob4oPG3fw0Hi5AJnDO7m25i+V/TLiULE
 UUR3sD59E2rTGMsRu6zHEUwLx32kzvE5uGNG54Tjrr0fKOuTwwK45dNYv9IFyq7scBURO9FC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300147

On 5/20/2025 4:27 AM, Tomeu Vizoso wrote:
> The NPU cores have their own access to the memory bus, and this isn't
> cache coherent with the CPUs.
> 
> Add IOCTLs so userspace can mark when the caches need to be flushed, and
> also when a writer job needs to be waited for before the buffer can be
> accessed from the CPU.
> 
> Initially based on the same IOCTLs from the Etnaviv driver.
> 
> v2:
> - Don't break UABI by reordering the IOCTL IDs (Jeff Hugo)
> 
> v3:
> - Check that padding fields in IOCTLs are zero (Jeff Hugo)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Assuming what Lucas pointed out is addressed,

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

