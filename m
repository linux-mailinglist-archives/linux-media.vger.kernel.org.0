Return-Path: <linux-media+bounces-38185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43151B0C83B
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A58EF6C4191
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 15:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EB42E4242;
	Mon, 21 Jul 2025 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMR0HOfN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C4A2E3B00
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113149; cv=none; b=s4fiO62BJhsyQ1zsgOhtMd8r/1v3QP/wY9MxwAWK9bZ25fB9bSBIx73sYdTZmdrY0tlgybxAJqTwrWBb7kegLPLt5hLcKssvw0FveOO+nhq6m0vR5zuHnuQoRPpdATTN8eyeJJo5DEV6jtK4x7Q/tICDtwDLXEuK+dnd9e2Ghs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113149; c=relaxed/simple;
	bh=leVOEdV367Mi9TWGngaof+vtaEnm91vrpv2xXkFmOo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HePtzeev5IW+Mt9ObWJWiUbHQo3KH3ZZf+0MllSIKq7Dt5RJE8ZBmtDsYoFSEDBBs/Scel5lopiCasBRWJAIdAyS57PyCSpMPBaY+DKG0fHErS3WDUbqDYqJKUmQCgdPwZ1qWGTsq0nK6nWn/gTQNQy+CMXcJUXtmBT0PQLT0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMR0HOfN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L9qneJ016585
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 15:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1To2TtXrWvL7KDLUWwYZS+zt9S2lZ7nkcx7wxlUsgc=; b=UMR0HOfNvnMdl+Uc
	aUIUBqSvnw1RGmMDEBnY1JMRFTTxP2Z9qQLJyzDWK4t5Kh5ui6nVH9DZ9+SpWFQy
	r/S6xJKg1zJX7bCyCDTK68JxtdLP5pDkuNlvassiqkz5i5Nt/8Yc0dv1uFajWqjQ
	A5BPK6oCteGYiU0ELJO+agf/aE7m+aOB8xUnfDwZtpujON3yWq1Q+NeLtIS6uqwj
	7h0o2bzvXjRqlxMI3pNeEq9zFbI88TD0eAAfuAaKlZ5czEO7YvlIC182a/mdDfo1
	8+FNROe3LNH4TYC6m4vakJgFruUpowdEe/tghuEB8pSuz8IvFtywIuaKQvjsBUFS
	RUxaPQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rx2j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 15:52:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235c897d378so41673045ad.1
        for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 08:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113146; x=1753717946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1To2TtXrWvL7KDLUWwYZS+zt9S2lZ7nkcx7wxlUsgc=;
        b=bBr7//1iMopeID2gZvYKL+h9ffSxXBDy7u2KzmYOW06od8Ya2UJYzmeWpV/4RsRXSJ
         Yh2eG97bdsAlTkTOMiWHdx+OJc80X8kcKUZZAQ52p7V5o1xCF1Ihm1HPreK5BUoZdp99
         C8ypaF+foCSseRQ54ixsxxyn5+w+8aPkEMS7a+qI+dZ+V1BWF2dvhb/Tj/gJSwOSCCQy
         yETa99YPPLeqlDrcu0upRpfMjYxdn3OhZgwsv+NTDZd8U+qiAESJBOVngaqfV6Amf3wF
         rtOXToM7fNUFtzUPiu0n7vX/1n56l3D4rt3GRItyC647zydNhUlHyakNNGSTUmyAv0fB
         6Xog==
X-Forwarded-Encrypted: i=1; AJvYcCWMxwctPjgX1wA29frxh2JfjcUgfvOaGkUIrlF22WYxP8kDL7dQc8SXz0CeYrTAkOUkpixQ39WmY2cmfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ3HmT4AUynbvFuU+HooDoU0KZ69t0w6LBALCM4lxLRx2Zn1sg
	cN/zR1vQP2vEi2L8BjZpNSiWKkAYco7W4fj42o4db20ybIbgnPDCZDg5/vNQoYDfoy2zxOSFkw8
	gygJwDqLkWmQYCt3vlaHT46i3hr+cFO14W+beibWjLOK/bXdzPKCghPP9g3Ieh5S0Mw==
X-Gm-Gg: ASbGncuQqnHhjVwonb/q0pfXr8oe5+cKMKDKxHDg0cvOIhKYiVDCRPN+MpdeI1/gfBK
	wk3IuOoDQRfKD0MBhZsTDgGQvNXtxWYcFQpTbuvQJJHOiwdkYT71szwDkdERv/Bmqe8d7vkOhgJ
	YDxsrVzTAIoHCPjRpp1+ovC7oegSxXbwI4jAV9QKL5efXZI5aAwGP0SQCHiDfgfsfx3Vm2rvpQK
	x/bP52V7FDEKW4M6Dzv+6y4qYh4cR5cWBgcsdSivd5Xe6K8I6dAd6duNRb6ho763+U+oVeVPqUm
	224qkre9K9NgxLvUbSQQ8DRTNR79ijGhkwTSSzwmYKdUS2HjwATuZEwr7BWhsH3vCYUCRIIBHcF
	yD/Tss6r+upViBQ==
X-Received: by 2002:a17:903:11c5:b0:23e:1b99:2a71 with SMTP id d9443c01a7336-23e24f59902mr290415475ad.39.1753113145663;
        Mon, 21 Jul 2025 08:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPCwCxq1QkhMyEoe34Z12143edz1TUZnWOSk/9IkmrEyBMoiqaPExRfBVgfEPrzhXVmpdjcQ==
X-Received: by 2002:a17:903:11c5:b0:23e:1b99:2a71 with SMTP id d9443c01a7336-23e24f59902mr290415145ad.39.1753113145178;
        Mon, 21 Jul 2025 08:52:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d2a8dsm60084815ad.165.2025.07.21.08.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 08:52:24 -0700 (PDT)
Message-ID: <7649e4ff-c712-4db4-8777-f96bc4de97c4@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 09:52:20 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
 <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
 <4109088.mvXUDI8C0e@diego>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <4109088.mvXUDI8C0e@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE0MSBTYWx0ZWRfX8hGpxB2UMVG/
 5z+TTSrme12x8c6Ho3M0Z2WhKpokjW8M1ZVFCmtxvgrht244wc4zahsYwKCUptkstzGc7zYSYVB
 pI2t0HJkzIN9eyeb9u8Raasl0pK0Pu40VevZgHvMaVLGWikHLBdjc2ml4HYTQINavXB97wBLNsG
 V/hQ6VUUjD/cjck8+iGBJtFO657TVOrxq5iyyO8dSra9cHKN/0hP6S+F4w9U6JMm0JF3M/E/Q7O
 BQfpvyNjsiHy0fonX/C1AweqU1/qipP6TfEKvHjNolQq70+kjGZq2IXdE11++YRAxBwVltdtAOa
 cjpRuBNdFiJHaut/oh4BkMKFvTXVWTU/LT7KbFP7u7LGgo8k9Ky8huT1MwjkEx/Tsg4o0BJbpRF
 Wnt7QlN0QVOQF+YMejxlh8vA0CLAxi2dxvVL6hijB5pKNqovi499qoCNDJeh3OluhrXPUa6l
X-Proofpoint-ORIG-GUID: EJyYafELNhTSmTgAljOZe9UXEmmxKvvj
X-Proofpoint-GUID: EJyYafELNhTSmTgAljOZe9UXEmmxKvvj
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687e623a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=eRn_eXbfG_JMZ2bVrUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210141

On 7/21/2025 9:24 AM, Heiko Stübner wrote:
> Hi Jeff,
> 
> Am Montag, 21. Juli 2025, 16:55:01 Mitteleuropäische Sommerzeit schrieb Jeff Hugo:
>> On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
>>> This series adds a new driver for the NPU that Rockchip includes in its
>>> newer SoCs, developed by them on the NVDLA base.
>>>
>>> In its current form, it supports the specific NPU in the RK3588 SoC.
>>>
>>> The userspace driver is part of Mesa and an initial draft can be found at:
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>>
>> This (and the userspace component) appear ready for merge from what I
>> can tell. Tomeu is still working on his drm-misc access so I've offered
>> to merge on his behalf. Planning on waiting until Friday for any final
>> feedback to come in before doing so.
> 
> sounds great.
> 
> Just to make sure, you're planning to merge patches 1-6 (driver + binding)
> into drm-misc and I'll pick up the "arm64: dts: " patches 7-10 afterwards?

That works for me. I'll plan on merging 1-6 and leaving 7-10 for you.

-Jeff

