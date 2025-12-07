Return-Path: <linux-media+bounces-48361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4930CAB635
	for <lists+linux-media@lfdr.de>; Sun, 07 Dec 2025 15:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3F1D3017EC9
	for <lists+linux-media@lfdr.de>; Sun,  7 Dec 2025 14:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF44D22D795;
	Sun,  7 Dec 2025 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKHHXiJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfGtuU5e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8E2877C3
	for <linux-media@vger.kernel.org>; Sun,  7 Dec 2025 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765118626; cv=none; b=tvRKTmw6ga7QqGhWZrNg4mrGvL/p/aoSw29R/5Cn9s0VVG330+3MTTavXqBc1URPpZss283Av6fnrRD23VQV7Z1hWfPA9GeE3ZgFU8jcX6chF9Wii+sAltT9c/EguHg7/B6yXPs5rsWkJ/y0P1vAnRQyY/OYyIDhm9f+j6DCfR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765118626; c=relaxed/simple;
	bh=N/AlMPNy9lcY4VhplAEjXH+tZcWwQ6XaS+OqFJZACXY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OFaak2cwZ7BiI1+Nl4HYw/yaU9MbVYn1CkgUKPJ1EaY5yYUMjhbUP6eckwPp5CgkxG7ZSdP/xxvSR5WUdQ1Mkss7PFNFtvAdI4nY41p6o8vssy+bQ04sT1xiVuHDtUuMWJZnhKxzorG4XgPMyPXR08uJ9BwERlNeYNH0Aabd7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKHHXiJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfGtuU5e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B78tKEq739670
	for <linux-media@vger.kernel.org>; Sun, 7 Dec 2025 14:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/aaJFyQoXHpvQwzDEFmgidOgL9qCsCAZ9X7taPnYrc=; b=BKHHXiJ+nUEgoKku
	Fvdz+fmK+FjsgKxZvxrHErBn1BTMTXrQtN6eF4q+UmlcdMVIoiLfQoTWqkRKrz3Q
	NnvkBLXs2STX9raqgwHxWKLOZtVpbFqWsroT21Nvw+ZGvzMdD4ZDLlfqA4wA93oj
	nxs1RacIE7DhSoQOixd2ymfpIp1UDMrFNf3Zq+sWidv/x00ef8EjN1gbcxDt8wtl
	ycdaIk48S9hSodcpgkOOqwIEPVbu8ihMcCBpXjuAkbl0i8apeTOeeXB7yZYGwF9j
	fTpFkN6IvxkexpQPdH908sxJfjUG6w61KnwfxA4FxhhTKoeKX4BkhqyQWIU32YMW
	rhGyVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avdnjtf40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Dec 2025 14:43:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b6963d1624so386253985a.0
        for <linux-media@vger.kernel.org>; Sun, 07 Dec 2025 06:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765118616; x=1765723416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/aaJFyQoXHpvQwzDEFmgidOgL9qCsCAZ9X7taPnYrc=;
        b=jfGtuU5eF7mVO1xeSjNI20lNYgGrcjIqDL4eRZfedWoj2gWlrI2SIkwnGAGwvuonpE
         BMCRmU4Wc1WzNjkTovuYWyZmY+bTDSgQOnoRTfEm4vzMGJfcvs6nK5F05gfi2PJCvTFg
         0rg2REjzJ++BshJ7WP9rWclEOTqVghNnSPgJcV+OwBQlW3Tjgkcn242HB9kR+L04lrXF
         KifUFE8Nqmkl7BqiGy+fEqBKeWu4bvivVaLxp9lG1WuVPa/85joTvyiUAHO98sBqUfiw
         ZQF5zCNZIBkLTtmELyNglHN1dVHtVhba5BZxEkY3uxaFceU4NRj6LsI+RuLLDAW12kSG
         CNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765118616; x=1765723416;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/aaJFyQoXHpvQwzDEFmgidOgL9qCsCAZ9X7taPnYrc=;
        b=J+V6sb3A26kOSg8OFHw2+WIzEkCHdKfORP7RSIAUE6XTUgAdnTUk4HEPFCx6THTiAW
         6Rup8eBNbwHVqyig0yWu3xkBvSUf4JIpmQy6AEnITC+4Hy2ofR6FLsjdyMsii/yZ/yQP
         24cj1sZqlwjixMF7sLmOI4pXZmQXq7ROpMHnX2x4sRo7IvJTSniV3E8qlEAJy/dqIPDz
         sMkCiV2kzHf4wF9ExYfCGqF3TA3PXhutmaczSVNN1l6C4IRdh8BI8AcBPjNq8th2z1Hq
         P4Y9BWoj1HPT0U+oUPVKVSt1AFn0uRJSCPJXqHSIQl+kctmhvLHJXV7bfHqe/06W4Ed1
         jSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkzPOpeFWRA0bjgRnUKImzcy/IUs2RcVxTPwwKn3FGw9+p6vqQ5l3YXvU+UWhj7epm4fyvc5oxJeNbBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Nc/9fzcYMDri8AeCfnQ25ToJPud/g8JT24mvNDnnLbaiczDm
	5fx0SIxs36RbdfvVcGmbdvUApvwR7w8RTlxk7/ufLg6jsqtM9wDXyY0YWNvRa7W6UPvHZvH8fL1
	IniecA/gOYICnG/18CxRi/cOZrKlVFaI3KVQE+nas4iRxnYUwX05q5UGTTc+xXKV3+w==
X-Gm-Gg: ASbGnctCpBmtcj7njYkp/+id35g+XRvGNi5Re0XQBABEg1z2oW7SDrGK3BXScmd2rNY
	e8Evid3N4yhM6O8Q/uJyjLkyM2BVNQJNbdoBYuA4PMAf1hHkBjlU5JWqtNl5redh0pz40uxLYwy
	hxJ77E2RXt6J9t7UZQMMVd0OEXIWuj5/ZebtalncJk2AFfq/a0lEGaR20G9mh4QeYDjfXnida9K
	KKKMKXHm/43cRwjGLx3xxFnP3X4l73BTpGESttR4hu9kXdbxu3F/rlFgumagHA5Ux0nPylFvbXO
	+16vYaTY3BbOBxyx5FJv7rdwsSwjPl3lngluxuPNEiTTxEwON9VCS/zzddU2UaoX4EW2XCu7vsI
	taWwfD9r5Qf9SQKdaJpwBo+omrn0BvDVjU4apl7TIiPbjSVjQQx3eOSKuixyxpE5w/AO6r1/gT4
	K7Qr4wNZb2UzwQhKQR0F6QSIYwF6HtSfVvN0n4FdCDB1vPnCxvSzo4qa4cLNyoZBZwbTVa4vg/f
	5+n
X-Received: by 2002:a05:620a:2a11:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b6a2388c05mr637280085a.38.1765118615659;
        Sun, 07 Dec 2025 06:43:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0XFmkIf34WFVbXKGLe44+OBlysT3op2/v7IyhvdnovY4Uv/rO0mzOwvjhifu9aaaI5NRsOQ==
X-Received: by 2002:a05:620a:2a11:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b6a2388c05mr637277785a.38.1765118615137;
        Sun, 07 Dec 2025 06:43:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49d24a6sm847908466b.54.2025.12.07.06.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 06:43:34 -0800 (PST)
Message-ID: <d036f6dc-1150-4478-a3a2-cdb5723ae4c7@oss.qualcomm.com>
Date: Sun, 7 Dec 2025 15:43:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] platform/x86: int3472: Use actual clock frequency for DSM
 method
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, platform-driver-x86@vger.kernel.org,
        hdegoede@redhat.com, dan.scally@ideasonboard.com,
        ilpo.jarvinen@linux.intel.com, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251205095525.1264971-1-hao.yao@intel.com>
 <d4f08e2d-8257-ec95-9f67-7514240a4f82@linux.intel.com>
 <aTMs6PB2O58KbikU@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aTMs6PB2O58KbikU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Qv8CtIu73yJr2JnaVNe-F0srD5iQ4ZCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA3MDEyOSBTYWx0ZWRfXyVCpWqTYG1zz
 AA1ERhF9HpaNFgoUb/WP3CFm2C9KKMbvMAMuDrKGXgTIsLYUE2FvCu4tsxR/O671OVcprl9w1ON
 LJTjyg8L8Lx7TwU5UeRsddKHxoonOBNft77kMpluf/fifVb8zILX/N1lc/M5sbHC2P6rIhMh+WM
 TAy88neAJr1D9khSCsEnhhKYrE1M8ynlNVv/xV0OeU/BCimwLFZbmVmtprFpCMb8Qr8NG5SEg+9
 P9HDK21ogXQY6LzhrW/DjMG9XPS+Ou9Q7QS42Xmi/eiR9lKJU3o95Nr5VtrcKWZZCkkJiY4aLeh
 s/RdOhz6T+hHCkmX2IHBE/bZl4PUThEWMVlqM7Z3QfP5q8a1Ap9dHLb+OYiFdmM6D7VRolaLSXV
 7Vvg4QD++rasS/NGQJZ7KAk8YkaABw==
X-Authority-Analysis: v=2.4 cv=RvbI7SmK c=1 sm=1 tr=0 ts=69359298 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AdU8BewJLfuzazTBXZYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Qv8CtIu73yJr2JnaVNe-F0srD5iQ4ZCT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512070129

Hi,

On 5-Dec-25 8:05 PM, Sakari Ailus wrote:
> On Fri, Dec 05, 2025 at 06:10:10PM +0800, Bingbu Cao wrote:
>>> +#define PCH_CLK_FREQ_19M	1
>>
>> I like 19P2MHZ.
> 
> How about simply PCH_CLK_FREQ_19M2?

+1 for this, this is the standard way to write fractional
MHz clocks.

With that fixed / so for v2:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



