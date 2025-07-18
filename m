Return-Path: <linux-media+bounces-38103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30BB0A918
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 19:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B0A67B7CE8
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 17:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D66A2E7162;
	Fri, 18 Jul 2025 17:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhVQL7bg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B1B2E62B8
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752858582; cv=none; b=ZyJQiYkvD1y1fatzCQqkQSRyILxM0TL9yMW3R5OHIxrM6nQyg97sPCIxe92eyBEJToDT7JSoPnElztDpYuxMWNK795DvMk/3WTaO+gnykreivi8zk7jSZMft01a95t79hfj8u33ANj0Go++QQ/lMhu2QsOMwRhOBHG8fMRMAWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752858582; c=relaxed/simple;
	bh=7jRgCSNtMJ+4XBY+7GdkIf+b0OTtc3sZXlxYI5FwFc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioW8sKx9ns0t0UU9dtptijCxm9CKWaBfxLm4Hj7UbrI/QrVh1vAbAXgBj9Lh4+1nTkXevsl07kBGutysyPCTW5cvG46zgMg2xPFHSgnZnQlHCj/SSw8SGUBOujgo9EVlP5A12MOWWjIZ8Ga/7ZPD+s+7SiK23va7A/M2NhNCSm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhVQL7bg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8aDwt021792
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 17:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvWIjxTgsWqTg+EpU1jF6w7w0dCuZOGk2IF4h2JIZKw=; b=BhVQL7bg08dH1Lyy
	sCNahyhXgLOooPUk6k8lhKr8X6uJk+1Pa2UywOtv1yU1ysnUtDgNZt4yqdpLZuE+
	K0tv2dxCzW6dvx8A4AAJj193IuREjeMHuDLlmtdnunNxuIVo2SkVCir+j0RyVX/M
	DYLgDAHww3n9z70tbq466VWkBPIVGCMhK+FGx8MfhiEBU9WEbLjFPgNtruQac7W4
	H0ncRaq33YzE0XB6rSNXGqFRZcmgcu5MhyjlXY0V7iyZJUiP7XPWZL0Oj9dh/qRa
	WzKiISQhUKpSQuddWBkeXHQ2hpidzoxFHYU6x5T5fvEiwFh+6mY2YvQkzlkNqfQh
	hbR8bA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8m6x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 17:09:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce66d7cso34302925ad.1
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 10:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752858578; x=1753463378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvWIjxTgsWqTg+EpU1jF6w7w0dCuZOGk2IF4h2JIZKw=;
        b=SP/wd8bAae1d4/H5/CGgZ0qDNzUwmoarJ3j6zj1TgLLoMLy0cp7dZCXVJn0EjH2Tp7
         UEY2WXtQF7D9Pe+qiAPIuU/YiOv0z2kFzpbqIe5mjP7BcySKVEZ94dgFI0TUnILNR+UG
         BdsgE+L5L0KsivcogXfuxvETWgBnB3C+te/SyyhYFloqX+8ZecfNBiKdVJg29q6iyPBB
         I+Se+dV+Auq6oF745ndY7UFY45ePoD0l42BauzeH77SpgwrX71L4p4wdH10dSeK+xZIE
         LYEgCn/oMXl/cEhH0569rdaP60um7+KaJA+eO5ehu3QYJokOVba7YSuViECnR18iTPcK
         Q1tw==
X-Forwarded-Encrypted: i=1; AJvYcCXDRl8SwbN9cUhJFg/RgYglxQXwdf6D9EQYZabZnCj+BM6ghWfuAtrQ9U9kKOvoJFxPmskAc8MTqBLNcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybuzd2uycWlFkuAPJOFoHoLbhAHmXdwCghXRJEubrYzvt+0v08
	LCP75x4E4jcLlOqCeGlgyEzTac6xtyo/nrQVpQXEiKjFXwijpulOkfs9QGd9BjPARI90gS0cHSL
	2AjD6mcSaeH8OFEBOOK5ujie1/TDl4Z+8BmdzsSfNmSNEifkry3a6ohrPAb8t9k6ZDw==
X-Gm-Gg: ASbGncuj0cWbrozvZCuHrqvOhg/btjyDrGmpYhMO7JHl2c1a/AaWq3hfvdToPESCHBx
	ZBuVpdaoZtXrw+HJBsr8iRfkQ3hy0c0L8w0fiSTL/wxkIkGN0KX9sIUuxo24iMZC/KqrzmQQtWM
	lhutY+w/gS54QQBPEFKQYUIsh8K1lq4Zjl/IVYbulMe6kH40WNuDBrFbVCtMyiK+6wG9UPSIXir
	RtgrFmqpQ0q1/jLluk4XSPZSMGqViQvLGRIy4ROBvIcP/9iT6Rgu4Pa5bB73Y/maVT50tiOl2EW
	u0jG+l3T/VnE6eL7nxBmdZNm/qYkXCXZd4egrXE1etZnA2Q/GEvy6T1I+gnHLHrcGWcL5QuuzVk
	JQl4EvF4cFguL+Q==
X-Received: by 2002:a17:902:c40a:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23e25693727mr159582825ad.4.1752858577958;
        Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETvEp5rZykda6Fkwq9ZXpRv9woHFJ3xh4GKGF4HzLDjXZN+/v8QGQrNtiX8DgvikLdgkWCIA==
X-Received: by 2002:a17:902:c40a:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23e25693727mr159582215ad.4.1752858577500;
        Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60ec88sm16079385ad.65.2025.07.18.10.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:09:37 -0700 (PDT)
Message-ID: <b7653a05-f747-4764-9c33-793346cae223@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:09:33 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] accel/rocket: Add registers header
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
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-1-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-1-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNSBTYWx0ZWRfXyvh03HgkMHan
 A4WKGQUchQ8yPYOyNsPaywvW9+J7/aShHuv63TKBmzRg/uWPwcycjFebhZCxtVxbfEQOAV+Cg6h
 2InriY/u3u01FTYfK4Zse5eUZujcker2yOxVDNnqAuqAbzlNToOmCuIRnLJxoHxn88y0KFoT9uA
 3vHe53sQZwulkkLvc/Jh/JMUTN0v6t7erYqH5qttTB2U8WpAn4RADmUf3KNuUwb0v/N/3d3h9Fz
 hdHuU+iYjePy5L4QMpSkTnoLyJAXwhZxrAJynXW/cVufNg5gdxX8bPM/EyAB87pDOdXu3OAe+2g
 Sdi8LAO+OXxLxuR4m9gvx1PL9UPfGHtFm0T44U24AEJxA9A8Dro6/feliRcttwCTQMmCZxmCN+l
 Jq4rVxram1puR18LRmQtfwJMvNuduK73gMkU05MuCqeDfitEKrZyklUwRdG7GBFz6TU1hjKG
X-Proofpoint-ORIG-GUID: t1PiLJ6muTghb-KKgHWJz_qFpOITB5ze
X-Proofpoint-GUID: t1PiLJ6muTghb-KKgHWJz_qFpOITB5ze
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a7fd3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=DISFzqtZAAAA:8
 a=EUspDBNiAAAA:8 a=4Ppn7do-3_l0xiadvqUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=775 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180135

On 7/13/2025 2:38 AM, Tomeu Vizoso wrote:
> A XML file was generated with the data from the TRM, and then this
> header was generated from it.
> 
> The canonical location for the XML file is the Mesa3D repository.
> 
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> 
> v8:
> - Remove full MIT license blob, to match other files with the same
>    licensing arrangement in the kernel
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Structure of the file and markings look sane. I'm not familiar with the 
hardware specifics, so the autogenerated content is a bit over my head, 
but I guess for something so large using automated generation should 
minimize errors.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

