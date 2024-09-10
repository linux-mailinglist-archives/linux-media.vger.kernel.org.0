Return-Path: <linux-media+bounces-18044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B621A97271D
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 04:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E67D0B23749
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 02:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EC2155A24;
	Tue, 10 Sep 2024 02:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="VxFDXDZn"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2106.outbound.protection.outlook.com [40.107.255.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EBF153800;
	Tue, 10 Sep 2024 02:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725934976; cv=fail; b=QCtD52n9fzv4ZzuZO7vcvvSRACL1zDEf1ucFR8H+Qg0myYGNq9FQ0zfbpiORB8karuz1Rr2P5mu2A/N7S4eyCBg4Jt6iAviv16jtqfZcgjD0Yrc5T2cIaZOO7uv9GUp5EPYMIWRYtpVHcHSoA3VP25VOe2jQHUiHFqgRV+Y9MjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725934976; c=relaxed/simple;
	bh=PRPYGMfiheGGWVIUTD4iD54LATvGMW+haVqzNhM8v0s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vCXTd/xSBTqSgrDD1JGOWEskFOC8kHbtGQo5nmTJLnxs6iSB7UWAMkT5whQDahWh0AxcppXM//aqiYVJsa9T4J1PvrMZUn/6O153MMBjczu/st4RmC+VzJFf26sCBOQoMR7X5ro4Do59iQFFovNTs/NbopG7mT0QEpY1gTMLAm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=VxFDXDZn; arc=fail smtp.client-ip=40.107.255.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9jiFfxA7F8BqOKU/8pVDXSdVa6wFKYDuPwJsc+eTNR4e04TKmJF87lo8khBW/we3VvFSZfPi+ZfC3MozENNm6yNtIuH4kKhlM0IRWYssTibYwa3kh6RnJUifRSuxcuP3ixiWYnCf4h7Qb5dkbfXHafUdKLtl2Q4ENSeS1A/tqtyLhsvtfeCK1LrQkwPD43EhHovux4ihq+fIZ+HggCjnhQ6NK6EM5xxNitWBt3SKmChzIBW48zuoPGfaVdqPzmoMlJ/urL4QnAChrtrkcOmPDW1w6UpNvSEXEKyn0iOaZIaIR6WL5Gccc8UdQT6yOqYcqviH+DHmyAiz0Q3hkCExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsCKLwFxQKBzvQY32LYb4KQy2wb74EMT0PmXotnQ2oU=;
 b=Hw3OmQ6pQfZbm5Bk6y4JtKItXcclx2jVgPGrIBepLyzETOgJMxsyR8b1aiCVIGBFEQo5iJ8ju/cHWCwRyMQiUngDFvmO9OQ+BVi9WgSr9eSbI1HvCiioNktpgCWRaSWruV4O5aeotEyZQ/c1T85UQTjFdB2mJx+cSwUt+eTlLpbyE45Ds30AHDikeRnB3XKFOwwcQgg46k9NbhrQoDkqzqs5ryvjayw2xyFKSt34bP0TRE2eMZHFeNY51fTqjLGOph3Ryzj0kvd5IWjLuyCDeea+UmvxPR8VzDOgayLqxbQBHA72Hn8nlD/nCq4UISV4Z62g8DGCcVUIOlYff1w8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsCKLwFxQKBzvQY32LYb4KQy2wb74EMT0PmXotnQ2oU=;
 b=VxFDXDZn11x2MJ4zNqb9gRoxolwiFYWIyKpl0g+16Rc/3LeoOAlbMfEKV5aklq65qS1n2VeJW6LEQQRSi+LHllYNUhWIQRj4aGOzHwDRRFzav+XAF+fMv3hGUlsZhAPGB+jq51hCYVYcnRH7nysPKml3eO6OKSzDYdKr0ZCpSAXcxPmD3YpVFqFQFGOudBF/63Quzr/R/+g7If4IO2j7Dbyb4qOCmBujsUs/TOWFYDofqpTxoFvmzEpTtkMwAK1jrRsdFazOIKy0oeo0017JK1u+bYfq7E06xxV0ps1lm43nfo9+jdhvv2qxq3f5Iqri0Sk/Op9kuo9/oVYTuKivEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB7345.apcprd03.prod.outlook.com (2603:1096:400:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 02:22:50 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 02:22:50 +0000
Message-ID: <3ac91ab3-6f9a-4d88-9545-408a8fa0bf30@amlogic.com>
Date: Tue, 10 Sep 2024 10:22:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] dt-bindings: media: Add amlogic,c3-isp.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
 <20240909-c3isp-v2-5-3c866a1cea56@amlogic.com>
 <el2p23rs3p4ng5qqljdc6vr5exvpveoda3rimq3pax7l5rwlju@2ebdcjzf7ju4>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <el2p23rs3p4ng5qqljdc6vr5exvpveoda3rimq3pax7l5rwlju@2ebdcjzf7ju4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: e6256e6e-2506-4557-129c-08dcd13f7793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXJ4eUdyb0NOaTY0R211Q2lnVGdsdFppNlJhOUFCTmJDNnN3emtmTnU1Ukox?=
 =?utf-8?B?Z2NvM3psdHY0Zkw4SW1YQ0c5STNyM2VZeHl4dWVEakprQWJ5T0NMckI1QnFF?=
 =?utf-8?B?Z3ZHdDJhMC9iRi9OYnR3cXpaVkN5cmtkUlllek5JcXJwTURyMmhzS0kxaHc4?=
 =?utf-8?B?endpWHhpSlhNVHFNZGhVYmJBdHFqdllXZExXbWlzYndFR0orUzRLK0k1NmJT?=
 =?utf-8?B?bG1rOVdGbVplUnJtQ3V3cjN1MjZpQVV3dFA5ajBWWDdRYndST1hzTkFvZmVB?=
 =?utf-8?B?UVdKK1h2R2tHMnBIUVRYbDRURHpBZENPRitiOVppOWhQaXBzYzNYMlpaVzlN?=
 =?utf-8?B?VHBEdUNGeC9GMHVScEd4dWpQczVJR3VSajJVTnM0WVNKRmN5akNmRnFuVXRx?=
 =?utf-8?B?YjFJeDVuaWhibTRQYlIremUrTzBZU0p1dVFlR1RabkRDVWRXNlcyb2tJZ0Ro?=
 =?utf-8?B?VU14cmRiR2l0aStaK0ZzOUFZbFRyMmM5RDY0NWJsZFhjcUhieHpDT1dVUlEv?=
 =?utf-8?B?S1FyeGtoTU1hMmpTNHRMWXRtY0tHUE9DQko2d0JtU0VTRHFROWhYVkwzMUhw?=
 =?utf-8?B?M250WjRzWGNyeXloc0EzZnVNTVhUNnMxNTBLV0VjVU9GMGJBWU1kZnhaZTJj?=
 =?utf-8?B?UHkvblFuU3Jtbmdrdmx1RnFxK1pkTGFMOS9YUnpEZlB2eDVuamZIUTBNNjJp?=
 =?utf-8?B?VE9GTDNabDl0bENadUw0R3dvZ2dxaENPbGxsaUpHZkZKd0RsNEpvTG84U0ZE?=
 =?utf-8?B?K0FrOEhwaGdjSFlhTGJ2Z2cycmNlbDQvSE9NdzNxTEVuUXhDS0d0eE83ejFR?=
 =?utf-8?B?c2J3L1Z3dTlmM3N2L2FlRmpkQkpud3IrM0pqR2Vac25TT0NBOVBCTDgrWm9U?=
 =?utf-8?B?d2ZYTGpENitPUk9kZzNUTXpVMUVMb1RDVDZOTVZJZ3h2V0NrQU13elZqOGI4?=
 =?utf-8?B?aGo0UVVReEpOeXJya1FDMStQTjVOc2FKMmZGUzM3N0ZPZjhJcjRKLy9qM1c2?=
 =?utf-8?B?VDRJOUc3QWNwVStPUG9zMjZnOEQxWmhuRkxuaU8yNW4zSHVkQzFFeDdyMWtp?=
 =?utf-8?B?bTRlVlN3RWVDdU1FWHNFNjdBTitoV3gzTFo0bktFQjlUS2I0eUtIaVBSUUdS?=
 =?utf-8?B?M1o0QUhsRWpPQjdZTmR6MUludUhXYm9ZbE5JMGd1QnNZWHJJS0J2aVJQdjhZ?=
 =?utf-8?B?RnAvUE1YeVgxRnc2VGFYVG9BZEtRV0VPYXV3dS9xdWdFUXdnNjdNWjFDODl2?=
 =?utf-8?B?TjRXYUpyMTY5SHdBMzRXMGgycE1Yb1JHcXd2VHdUOUV3ZjZWWDFDcG1FNEJa?=
 =?utf-8?B?bnByWkl4cmhpeVJab1ByUGdTbVg1blgwUUsvVFI0KzBBVS83RldRSkg1bE13?=
 =?utf-8?B?aHdSNFcrYmVleHZoU09MWmhqR1cvd2VLaVdnTHY5YUZkaTVDeWI3eXlHMnJV?=
 =?utf-8?B?c2N5L1JONjk0YXNRS2crNVY5aDlqYlZUa1hEU0ZlMk1lc2MrQVRiOWJoTzNv?=
 =?utf-8?B?RVluWEJlZEk1RlNOTDJDOUVpQVlhU2lBZWJQc3ExeXk5NzlIVFdXOWV5RnQ2?=
 =?utf-8?B?Vk1NajJqNUNmVGZYZEdSYzVRQWtxRnR5eUFtQ1d5OUduMjdsMERqSFZQNHZL?=
 =?utf-8?B?Q3UxTW5UL21MbnZlclZZd3E4S0xFMzl4WDltNHd2YVRrQnVWalM2aDFpS3lu?=
 =?utf-8?B?MWZOc2tqcWVCSjNtMGdsZGFNd0pNQ282eHBVZTZUeEpJaUVvaWRUN21QNEFp?=
 =?utf-8?Q?rbgSdw8Jujw9nt6yVY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REFXT0g4ZlJwdEhBMm50alhEamJVWlBlSm01enJ0bld3d2VBMzNhWjA3MTFa?=
 =?utf-8?B?d0cwWmxEN2Jlcmt0eUVPMXN6d2JOS3ROcjN3NklDQms0Mm9DQ1R4NWxZSFBy?=
 =?utf-8?B?VkloaUtkMWJjMHJ5dFQ4UUpnQ0M2c2pWK1hNNmhycHltVU5lNVBMc1VuYnZG?=
 =?utf-8?B?UXNFOHdnSXVnd013T0N5OHFuSzJ5Qkd2ZHBuK3lndkpHaTN5TzZ2NW1NL2c3?=
 =?utf-8?B?d3piaEVacW1jRkUrUFY2OG9ROG14MGNKTVpDdEF0UytiMXRVSkh4MTQzTHpF?=
 =?utf-8?B?eGdDaEhrSkxIbWdVL3FBWE5BVFBNakVjbitRSWlNblBnZEhJdGZuOTJLUFhV?=
 =?utf-8?B?ZG1sRDlsaDJxcVZqV2tWWXkxTkxkbjNQN3Y0T3JycFRNdllPcEtZcHVLQWtq?=
 =?utf-8?B?VSt1VXQzTjFaZ2hWd1UwY1NSNXBVTnNaYk1vT3dDb0xlNm0wZENrWXAxWWJP?=
 =?utf-8?B?QkRlQ1pkUjNTMmdjMXA5bWJQYzBHUVM3ZFp2b3czc2E5QXRIVGkzaUdXOGJF?=
 =?utf-8?B?MUZnckYvaVlFemFGbkJaVG5HRUR5aEs5U0pDSlhKeVQydE1YSDcwbWdxSjQz?=
 =?utf-8?B?SWJKTmdsTk1lYjBoTlh3NUlFZEhYOGR5T3RVN1RSbVVrUHdTMDd0L0JjL3U5?=
 =?utf-8?B?VjZ0VVgyUDNxRVJ0cTJxZDdIWnZMSUcydjNWV0gvd3NxdFdKbjJRenBZdlZY?=
 =?utf-8?B?TERUNnpFU0ZyVXJrYzI4K3AxL2Ywbm1pdmlIOXFnMmhGK3RUZE00QkljN3dV?=
 =?utf-8?B?YWp1UmFSR0ZJbUFHdS9LVitvN2xhWGk2b3hhem9LeGdndExWVmVIM0YvSGlM?=
 =?utf-8?B?NFB1Z281SUJCV2wyUDVLek9QanJzcnJMNUozeTdvZUk2NE5nZkZKdTJ4cC90?=
 =?utf-8?B?ZWRnQ1N1Y3lzTmowN0lNTFA4bUtXNFhzdlV1RDRPUVB2Skl1RitZRkQzNCs5?=
 =?utf-8?B?VmxTRkZnYVJWRFpheGZmSFpEQU5CSmJuSGdwUXJMUzcwMEo1OVpneFFVY1Fm?=
 =?utf-8?B?WVVzL3dkUWlrb3VJY25uWkNidzNWT01RNG5DR3pxUVVWUklBZExnWHdvQnVJ?=
 =?utf-8?B?SW10S3hRdGQzUUFBMEhQNUNQOVBQVlhSZjA1eDA2N2t3blpnVUJJU0hkck1Z?=
 =?utf-8?B?eXhDVG92WTdQbVhqODRFSTc2ZTRZVUxyREx6cjhjV1AvZng1dnlRRWlVcHBQ?=
 =?utf-8?B?WG9zSzM4NHJhT2dJNDlGaDkrcElLKzJ2UUNYQ2JJUU43QjJESUtYQ09yM3FQ?=
 =?utf-8?B?L041N3kzbkxkSlViMjlBcHg5c3hBN3RhSHd3NTh4ZkZES20zSGhySnFEeWxs?=
 =?utf-8?B?YjNhSHZ3VGtjamZzdWlQeFR3NE5PVjEwQ3FkMXlTT002WDJ5YStuTElaSFdJ?=
 =?utf-8?B?Tkk4cE1WV1AxYmJEQ2FnWG8xc1Azdzg3bTVVNnNnYTZDQzJmaWhHT0FIL1gv?=
 =?utf-8?B?NDdKcldIZUFEZGwySFFoM1pEbUNEOFBMb20vK1B2eE56TWhUcllmKzJmTksy?=
 =?utf-8?B?T3V1dVQxK1lQMHNwRmkxZmd2NHdlQTlFSUpLQXRTekxoRVc5azdhT1BId1I1?=
 =?utf-8?B?SlowUU5mVmE0UmVJeEVQMTE3a0FQR0kwMHkzYUxPTjU1YlBobjQyWDkvZGs3?=
 =?utf-8?B?VzJCMWxtMjFwdnBxazI5R1lVN21zdHRaWWNuWlNZSzc3VDVLd2JTVnRwTXI3?=
 =?utf-8?B?MUZOSGNibVpCU2R4MzFWbVFiRWV1RWxYVGNzbVpBcTBqUXBwN0pyOHNQSm0z?=
 =?utf-8?B?eHdHcEIwczc0RG9vNkEyQitCeTJ4SllncnBndXVLa01RclgweDNFTVlGblF2?=
 =?utf-8?B?NGsrOXE5aFkyd25INXNSNUlMTWNteXZqTEx4VGpHeGNYaVlFYU00eEFya2Zw?=
 =?utf-8?B?S3JWYS92aTNibVEwSm9kNjRGV1BtWE5xaTJINTRiSjJGNHJWMkNSZHZCK0Nq?=
 =?utf-8?B?ZDU0U2E1MU5IaVZIZlRJWXFvUkE3allYdngxQjFhSms5T2gzdklMRTVGbi9N?=
 =?utf-8?B?aWoxOTZES1RlRTVhS2xCSGhoMlVhMEtGRkNMdUZWbEVSTnpXbXFWNFpsWEhH?=
 =?utf-8?B?cFFiVHIzV21NRlZhMllWNUpBRHY2aTl6SXZidzIvREFiWFkwUXN3dHFKb2dK?=
 =?utf-8?Q?iKGVwhpMq+MA7MiBc0lxohUP1?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6256e6e-2506-4557-129c-08dcd13f7793
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 02:22:50.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUglctljFEUHYTME7rExKdBblDaWdRba8ax8Xo3Of+XQvBtIc1zZx9uJ2sMjCp9/a+GzmmWh75jVDt1XiwN/ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7345

Hi Krzysztof,

         Thanks for your reply.

On 2024/9/9 18:15, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Mon, Sep 09, 2024 at 03:24:15PM +0800, Keke Li wrote:
>> c3-isp is used to process raw image.
>>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   .../devicetree/bindings/media/amlogic,c3-isp.yaml  | 98 ++++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
>> new file mode 100644
>> index 000000000000..dfa439cdc380
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,c3-isp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic C3 Image Signal Processing Unit
>> +
>> +maintainers:
>> +  - Keke Li <keke.li@amlogic.com>
>> +
>> +description:
>> +  Amlogic ISP is the RAW image processing module
>> +  and supports three channels image output.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,c3-isp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    items:
>> +      - const: isp
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vapb
>> +      - const: isp0
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
> Only one port? Then use "port" instead of "ports".

Yes, it has only one port.

I will use "port" instead of "ports".

Thanks again.

>
> Best regards,
> Krzysztof
>

