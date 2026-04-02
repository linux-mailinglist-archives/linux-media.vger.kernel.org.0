Return-Path: <linux-media+bounces-57977-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDoCAAWYzmkBowYAu9opvQ
	(envelope-from <linux-media+bounces-57977-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 18:23:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FAA38BCD0
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 18:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AA6D30F8EE2
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 16:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FC63EE1E2;
	Thu,  2 Apr 2026 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OOrVmc1M";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OOrVmc1M"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013026.outbound.protection.outlook.com [52.101.83.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDF53EDAAC;
	Thu,  2 Apr 2026 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.26
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146470; cv=fail; b=kGUB7l88ai6CuHS4gGJLcbRwIUmfYp3X31Jp68EJb5MCK0xoVqVcSwkWXcX4hl4wdVG40qFGxQNXSGC8UfiMD/KTBLFRH2iTMhlzeUXVSXheOBwlFJ2O96bQSDYCmortgQfFBlDWVhZLi8OPD4cGgu8lZLdafha6A1JywLHl3TU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146470; c=relaxed/simple;
	bh=LkrpljgjKtmqxZCiSJxQNL+e8kVpVL+tlHqBoGavI44=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dTtnNhe5+jLB3J9oonmTR+9NUgLDN1q57Dm5il9qDjpbPraaomxEVSAhg400oBuVLUdzsYUH7Y20KIt92u/Zr/HvCt5RLvhWtaIAGzX7fMFmEYgtGg4iQsxjaMG7573Vqf1Kp62KLa7OhvfXlFLcpg0E6e1vuMOzAtalN4+aA8o=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OOrVmc1M; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OOrVmc1M; arc=fail smtp.client-ip=52.101.83.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EV4CNT5/VGPExXXdpINqus1QqHCn0Al3LAeMyoTUH5B6+Oo3CM+xAezOoRxUSWQNLTnoVqj30grWGvjPRr5eug2Y4qK8LYW6sz3TDlaZGaW9hOw+XpjXVzWWU4E3DrtQ2qIjvt3EjrIc1DKfZH3pz13jesBlU/PCH70Lw63sabIvzD8lKxLdO/wbObRZDFzC/aZAJfMf5KSgMzAIai5czmjbMOazSP5KKCRgLIcWiFfNxl7nG/QFglB4Q/LFj6mYWskCB34tS9BO6JN5mD6nG2PEcQZFFvedaPCmlVrTZjIMx/kcMF1ZTI4KGKFUcUK4zQR55XMqVGz9NYSKCy2aOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wNnmsTqBLOMci9G1iRkNSFgebbvN1FtmWgA2qmFtqs=;
 b=Zowm7Vk6+iMqqsU0orTQb7zkoJ0BaPfBFvguS71RmHfjqWEB39A5/SsvgtxFY2RwTZ/ik8HWrkkhEu0fZcNat3GcPjmjUwiCiL26+fZ0+MM5OQQJFehur5SVY6e3eQgffsgcQz7pejn7p1t5GYSZYXbI2U4JIM83JIC7vbRANZ6fnnOqCy+HtmS5iGdk4HtGa8kW7IkCqFOmeWIqnqj5S0FsXFhWvvgMIyhcwbOduQH5bu7/QOIGzALPLqwS3MdBRGXh0xUAu10v5DrU9XebwOSWGxeTV4Hz3QvWQ0owemfTi3TvhD+IehQ1iZr+6WzHNKAasRAlhaByz9lw1o/y4Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wNnmsTqBLOMci9G1iRkNSFgebbvN1FtmWgA2qmFtqs=;
 b=OOrVmc1MzFUpECoPAvDybiI42aP4a8XHJekNHeWFISkOokBnG28NNuyu3rIG+36RjWYi3Rv0qujP2cmkg8Y41SQEnI8hBgIm/+Eddky5yKH6pWfxwi57k9pn9TIMOhy4LjWuWNWgIjbqFWGns4Gzo+R3k8ztmy+F+qIVsNm7Q8g=
Received: from DU2PR04CA0152.eurprd04.prod.outlook.com (2603:10a6:10:2b0::7)
 by AS8PR08MB9043.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 16:14:20 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::d7) by DU2PR04CA0152.outlook.office365.com
 (2603:10a6:10:2b0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 16:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via
 Frontend Transport; Thu, 2 Apr 2026 16:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gx0qazeTFFwAFNqtR7gr9IzmO4u9r6u7kQM6bChbyPZjnEKog8Afzv22e4LV3sHcoZTZ/tfPcZChZn/eeQUDqL3awPf0B4g8em+rx+oxAkGGwS7tjLnCiqVZPiqeoo+QHE+jeiW8dNkmNgT+7WM0tZHBYKmX4wHSm0NZwNgir8Y8ZdxdlqT/d+kUac2B/xV13EkRp2amJf/lRtlO7LICuaX15c4mAuICw4sT2pK+xFJVPZkI3ygL+oZnS96smL5b2MgcdQ4WpyZp5a3VrhjR8VeNFziYjSydOhWWanNj5lBaSdB6pN8hCWA1seMJkrd6kEFYaW2pU+BSYMN5ZIUHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wNnmsTqBLOMci9G1iRkNSFgebbvN1FtmWgA2qmFtqs=;
 b=YSk/Lo5N9l8UU5lEXq6sFLVhd50sATlHnFuEvoeKH7kMGi+ZW76DW/1ze0/pmg5rZrrZZVQKtCZMb+m47jy2OS7GP1x0YplN7VBxF0q72fP4Oil0wkPYh1MEPxOa2SiwRqBGBlDNFWDYN87/geKNrTOqYGp52CWwnAa5SLr1x2LfHgG+9Pv4t3LHIBeZfcXT/i2qPCoHJvSwjOAb+rNpMc8pAHv7BVw7gRWBrD4s3Iiza6UVUpbejVh+sha1Zgs6Z3BhybDMZ7jhxeMpet4s2qaL5uiaAdj63+BuCLYiZ1M1Ih97IKC3KBRkK5YWBCxLkyAmOF7X+x3LTZD3XMm6vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wNnmsTqBLOMci9G1iRkNSFgebbvN1FtmWgA2qmFtqs=;
 b=OOrVmc1MzFUpECoPAvDybiI42aP4a8XHJekNHeWFISkOokBnG28NNuyu3rIG+36RjWYi3Rv0qujP2cmkg8Y41SQEnI8hBgIm/+Eddky5yKH6pWfxwi57k9pn9TIMOhy4LjWuWNWgIjbqFWGns4Gzo+R3k8ztmy+F+qIVsNm7Q8g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by GVXPR08MB7846.eurprd08.prod.outlook.com
 (2603:10a6:150::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Thu, 2 Apr
 2026 16:13:16 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 16:13:15 +0000
Message-ID: <c8dbb9e2-f1a1-469e-a0af-ba3a5e3a651c@arm.com>
Date: Thu, 2 Apr 2026 18:13:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/shmem-helper: Add lockdep asserts to vmap/vunmap
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Asahi Lina <lina@asahilina.net>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
 <20250318-drm-gem-shmem-v1-1-64b96511a84f@collabora.com>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-1-64b96511a84f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0233.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::22) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|GVXPR08MB7846:EE_|DU2PEPF0001E9C6:EE_|AS8PR08MB9043:EE_
X-MS-Office365-Filtering-Correlation-Id: 73290de9-59f5-4780-333f-08de90d2e5c9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 tCnzJijKPyim4Z7PHG9QnbdoBU6NvSmJOLwVyCC8iWHrFUfk0O0QevCX5aJlasvUbEaC4r5wxySB8RGZeDndEnk32Req+mYtNfnz+oF8A44Y4VSmMqUoDHBBQCy0nOfme/Oi0+ph8hZ5tlCc35wNxnOTY2KK+JsNHB8EnT8oPXNOSiC1wpAe0i2Gagvm1zoluoJ84cqJLvw0TCXgOUSzk6iiYJ7fP+/yXzmBTNzhD14C9JoJPE3HE3JuVl+Ha3lkg0lPc2Emr0r6dMb2454X4DgFKQsbZbcD72/Qytxl6iyIMajiPsCAwst7OCURQ3wo2JCiv6+7q9O94ScQbrzLtdsIEE4pXw/SAp3bq9/kuTLxk/9UYq4R5f+gEC4P+BStlGvdjsFxdBX7pOWC6fPpEOa01Damujd4VcXhRd/jswTH1fztYEGR3T56X6B0FJTPzc5x2caPsygETiYoKtuWaX7uCfavXQfnFL5gekgDTwz09gSIf0k1ToSSZIqFy5r+1byZuNVKN3bPAhZOD4SIe/9mdXQ0hns0EgIt2DiUcbZUHoVjPltb9w4lpJPdoK3oqjEXecNYd445qXknhFkSMMQgIRa0vNUOZLsRHDSmhlCj2ucWUfHHHe8Vac6RI8VwhxELk6jwuXag78w0nTog8i4DU0L3aYH4d/mDXeK6vErV0q5dtY3PRI4JinLpn1ocC4haXk9Gf8P8Sa3hQDlpykwXxcW5Y60y24bpXBStodWhtR6ideYKM6maVjQS+5QSB8dfBAIM9rPndi/37E3LIznB1kzsCfDCYg/z8Rs3eIA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 AD3WP8WRar2R/Sm/GALGJbozGv5DzpzDWz6wpkjMJ4Wf+T+3nZjURIEBOHCyyAdFUmyN2Gk2u8SkhIyFFhRbxkCB3rHPO7BEkq2HYjMYlt/P5KhSh62tR9ey2iTGIbJ4FwxqT5wLFM8V0el5OxTMbeKopR7ykWsshRVaX/S+iCLJU7QtoB4RBK48fZYQJPOLwddMJRy2vxJmydQAr03MvvjAcsT1PaHnZzPCrBrcMYD0NEbMyMI+JW3Q3oecDMtigz8jGfBxukWfXWr/sSkf+EGDANA/wTQ7G3OQjndriL4Pw0rEJLIGYCvUjgNfF8USrL5zhB8uknRpOTnKI/6LRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7846
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	24d7c49e-89ba-473f-055c-08de90d2bf19
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|376014|36860700016|7416014|35042699022|13003099007|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cT/ROtm7nFG7C5gkiFeNQZJdEuhVHN1VScfFaHDOPvr4tDssNGTRBlJo6tDLXHcPlG0YQElPSmcOP8CJxsy/Cwaqb74/PhwLocAnwLJfWXYQ/KRgUxsn62hxDMxkSCT4/YXhUAT+Nel3GbwfKWOy3yrMpcuqGKzSud36X+jSGAEbFGTOoq5TWHfUAY1p5VDbUM4YGfLCOd1Zh/boSmlQYAalipi8U7RGNOP0OBWsuC4FfRgPfZ4daGxx1CfjcILAe4e/WN6ewvlRdYyndSFC6QCCHYm2YcOQmt6cfQ5/O5gnLbqK0lmhm1bx1PKHGTHqh2iA5WQEwINHmjUtH3jNMMHJia1Ae1fdkIdKUPI+YWOn0GG26XinNGCKNhCKPfFjGHIRZrJhSE3SZmMFeeXS5ymuJtJyer1erymNe6plrj9F9VTg1mbulXsWlesSKyu5r1SJGoFjsGmyW2yQ8OIx7Lt6klItNL7Mw1735Ffm9pvAR6I4umZl40SRjmiLeoovu0hCF+YsKXEG2iBtrLqdYMEpMh9XXNmoboc/Ug4Gxye5+p2Fe5B6OJGGfybefeZTz8H34tE9GTDSGih3066lkw3/jWrcejW4PCMg/SnHEZeLHQrR7BtEFe6826WcTfx5SyV2R2BtOTOcRC00oria3A3mmdVSvna4Gt5CCgjRRYabrVN6qpBBZzcT4So2tqKUPdo9nZBFYBBRHdnKnF1M/tTpq2vUDfsqEUyybs0KhW65Oe5z+BOkyLT4t1idRM8T/64irbReTzImK5ptrNkk7g8bxLCcGDevf/vlr4M1jaS7WNl1+byNK0jJ1irqKZLs
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(376014)(36860700016)(7416014)(35042699022)(13003099007)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tdcvlV6Pi+K9B7qXyKUKhdJ41B3hNug3hL0DejQ28atf+kkNxvDf/+gOQsS9WMex5Guq1tHWEOopzQbwmhkz/lo0BVsBqrzMTABscP+BnDHazyEEclhoI8rPvKBDdd/eV8F86fjpruxBxwIBYWEtvjCpC1mbeeMve2WFmXdkOna2uOewh/iMbtVe8kv+QrWIvTQbYfdABkeqTWQO0Ta72T8PQKZZ/2+STgxJIIN7ugHLwmQXRf7YENkDZF5OjL7fmSIb6KkiUryFGjpu3VpqDSe579BLy3XsCvhcznRdUt0izestgHD5naByF63J1VYpgFdFqO4nNlcC4xnzAikoGm5vB+c6E9YOOd8IpFcq9yeyqzbmMbrjbXNaz2ZZIoTTpbG8Gi7zbPqci+JSS2x+Em2VfOHCeu1HYEh079+kmVUJdYm+MCoP5C1hPp8/8kno
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:14:20.4890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73290de9-59f5-4780-333f-08de90d2e5c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9043
X-Spamd-Result: default: False [1.96 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57977-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,garyguo.net,protonmail.com,proton.me,google.com,umich.edu,linaro.org,amd.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bence.csokas@arm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 55FAA38BCD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I just came across this commit while researching something else. 
Original patch had too few context lines, so I here's the diff with `-U10`.

On 3/18/25 20:22, Daniel Almeida wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> Since commit 21aa27ddc582 ("drm/shmem-helper: Switch to reservation
> lock"), the drm_gem_shmem_vmap and drm_gem_shmem_vunmap functions
> require that the caller holds the DMA reservation lock for the object.
> Add lockdep assertions to help validate this.

There were already lockdep assertions...

> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Link: https://lore.kernel.org/r/20250318-drm-gem-shmem-v1-1-64b96511a84f@collabora.com
> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index aa43265f4f4f..0b41f0346bad 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -341,20 +341,22 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
>    *
>    * Returns:
>    * 0 on success or a negative error code on failure.
>    */
>   int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>   			      struct iosys_map *map)
>   {
>   	struct drm_gem_object *obj = &shmem->base;
>   	int ret = 0;
>   
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (drm_gem_is_imported(obj)) {
>   		ret = dma_buf_vmap(obj->dma_buf, map);
>   	} else {
>   		pgprot_t prot = PAGE_KERNEL;
>   
>   		dma_resv_assert_held(shmem->base.resv);

... right here, and

>   		if (refcount_inc_not_zero(&shmem->vmap_use_count)) {
>   			iosys_map_set_vaddr(map, shmem->vaddr);
>   			return 0;
> @@ -401,20 +403,22 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap_locked);
>    * drops to zero.
>    *
>    * This function hides the differences between dma-buf imported and natively
>    * allocated objects.
>    */
>   void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>   				 struct iosys_map *map)
>   {
>   	struct drm_gem_object *obj = &shmem->base;
>   
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (drm_gem_is_imported(obj)) {
>   		dma_buf_vunmap(obj->dma_buf, map);
>   	} else {
>   		dma_resv_assert_held(shmem->base.resv);

...here.

>   		if (refcount_dec_and_test(&shmem->vmap_use_count)) {
>   			vunmap(shmem->vaddr);
>   			shmem->vaddr = NULL;
>   
>   			drm_gem_shmem_unpin_locked(shmem);

Or were those insufficient for some reason? If so, should we keep both 
of them, or should the older ones have been removed?

Bence

