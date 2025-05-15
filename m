Return-Path: <linux-media+bounces-32583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BE8AB8524
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 515DD1687AE
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53ED0298255;
	Thu, 15 May 2025 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="JYWzu5Bh"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023078.outbound.protection.outlook.com [40.107.159.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BC72628D;
	Thu, 15 May 2025 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309545; cv=fail; b=lLFxDxHlMPzcce4e2ILy7qHb8P6HEo7DN5Te1EPoxzdtHhZh4X3HvLaGyNE46tswmPHXpbSQlf/qoXFNuTsz18XiEW3aZfFD1GrKfl1t5uZRH1cKyXkB3f2MFLQ88pxAFoJbMg4ScO9doabh7dz+NdArU9WbpqZ68ddQ3/rQ144=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309545; c=relaxed/simple;
	bh=NM8wPszAUQkI5PUQfJtxGwYyNwX+DPBqPe1rmHG6KZk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E9dodLgyLGUXHGCj9ckg9BUnkZcKsY5X6UeDCsVdLs+GvBysnF7IRGa92xtcG6CVjEG6aPcMFBsdc8lAm8lEi/QtmawnEvQ2XMqhWbULlS9R7y5WdEKRwiwRXBPDr8gZqajvdjCuBEvs0Nbafve3AZ215jUoYv0YImQb22OcKeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=JYWzu5Bh; arc=fail smtp.client-ip=40.107.159.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZW772XBVOH0N/nTGb0f3KjwHmvfAGnNVKsD6bYOaNCR/NtM9qk27c6wLfv0h8BbC14nmgZ8JzOSrThSlACqoJucRt35ASpJErqntZXBhjPDP03TuPdpECCEbPFW+DKK2WqBcBYotnKrqhzzc0xqlWmwR68NL1H9jj6TMPcxRk7vJCQYNluxB6RGo1yJtdjA7aN33N3wxYhtsyILdrewDkFJIHtqlq2YxPDdGc+5Oz0yzPUEMRjU3KshN6hYWPlQIZY1r2gK+lR2PjA2Eh48nC6TMkYDgVPZoGe38Rfpl/DQfgzxllop9T75bKNEa/4gFz7HjzjKRP4nliQJm7Sc/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzQUaeDSdxwKzm5wHMJXr4c5yP5/S/eSnNdTZl6uY7g=;
 b=vYIQx+tecf/FDtHi5JiRs+Zp+jtbS3zidx0HkbTCBlMzkdNe8kiQKqCoA0fMDlxba8dSrnNARdMXjp+VcwithMJQ+fcO3UTPS9hoeSoHfp1q9QurbMlm6AfFTi/9T3O7lzWltYA3BrKhaHFOSfI5lidxby4zs85fO+LFkNMKfTmheAkkdkondFp6QKIdkoJvsM0EdS3rw4cO/H9yePRJTyE33aE/+VTon51QilKzh4JBZvuWY/TIeMdR6B0INOfQsyi/laS0NLtAsXsqKcwY8Y6hpbzfrkFx8Gzdq/P221L0eOkW8qn6dd+Sbez4iswNhwA12tt9Sp1HQ33Kqasntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzQUaeDSdxwKzm5wHMJXr4c5yP5/S/eSnNdTZl6uY7g=;
 b=JYWzu5Bh3EUD0V3ymUlqhl65WsFH6Zbsk+lZQ0EOBxyWwQQgLkD3xcvg3asBdmBORwNOpMJc3mJ0Gb2vrr0Ylahwx4eyyIYjXt52GSecjCoenDf+p35lyh9y9JZBH2IU8xbMU9qdPqnTpssC9UVBxq4gXX/wVtGgo1I2qZUmj3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DB9PR08MB7724.eurprd08.prod.outlook.com (2603:10a6:10:393::12)
 by PA6PR08MB10739.eurprd08.prod.outlook.com (2603:10a6:102:3d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 11:45:39 +0000
Received: from DB9PR08MB7724.eurprd08.prod.outlook.com
 ([fe80::ef67:bfef:6aca:11e5]) by DB9PR08MB7724.eurprd08.prod.outlook.com
 ([fe80::ef67:bfef:6aca:11e5%3]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 11:45:38 +0000
Message-ID: <9b7b54c6-568a-4534-960e-33269adbaee1@wolfvision.net>
Date: Thu, 15 May 2025 13:45:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/14] arm64: dts: rockchip: enable vicap dvp on
 wolfvision pf5 io expander
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
 <20240220-rk3568-vicap-v7-14-7581fd96a33a@collabora.com>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240220-rk3568-vicap-v7-14-7581fd96a33a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To DB9PR08MB7724.eurprd08.prod.outlook.com
 (2603:10a6:10:393::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB7724:EE_|PA6PR08MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c53864-c1d2-4a33-7566-08dd93a6032a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekVacWUvdCtLcGRCcmQrZ2dBNUhCUHFrclVNZEo3cXErRm1HV05EY3NkQ0Jj?=
 =?utf-8?B?VU9RNFBXVkdCSS9xWFhPV2xZNUZJK3IzaXZOWWRITmlJcFFoMS9EWW9aK2RH?=
 =?utf-8?B?eW11STl4bFgxYnBPWllSZ1J2WmpOUis3MzA3NE5zUTRDSktYaTBQU3BTcy9X?=
 =?utf-8?B?a2xjZzdsOThIV1JWK1lzY0sxZ1hRd2s5Zk5acmZPQzFQZEVhNTFhMG9QQ2lq?=
 =?utf-8?B?NEwzcTFHOUxJd1BKNXlFL3hBdjg1V2pCZldBcnJYZGRUM3hZN3FDZmtZN2hQ?=
 =?utf-8?B?ajI4M2VUZEdKTWRFRW9sZnc4bFp4QWtqZmtHRU1sSGFtaGEzUG1JWlZ6MWs0?=
 =?utf-8?B?aVMxY0wrZzNGU0JMSytJaXJ0SFBmQk04SnYvcHAwanNvTXFoSXBJN3ZCUU83?=
 =?utf-8?B?QlVkTFdONkhYaW15bWhwTjBNUGVUdzdBdUh1MHlzeHUrWWxmNkFsWWtFS1Jw?=
 =?utf-8?B?QWFpaEdWbzQ2dm5RM3NSN3g0NCtDYUE3VmVhdVpvWVg5RStZN3ZobUszY1g0?=
 =?utf-8?B?YkZ5aU5XbittRmpiczFaczhjUjFpOTZyU1NlT05aWHRuZVJSTmtPcW44M3VT?=
 =?utf-8?B?OHBYbDhzSGEyZUptaUhBRkZEcTBKU0gxVjU2MVhGeWFIM3B2M05RMG5OdzZN?=
 =?utf-8?B?bURsYndKaDY4WC9tdWF1bXNvN0dmNVJLcitJczQ5dmpWRDU0N21kYnhhalN5?=
 =?utf-8?B?dm5EYTdVSmdoSzh3L1dXc3k1YjA0eko5ZzMvVWJZTGFmNktIMHdpYmNNVmQ2?=
 =?utf-8?B?bDRjb2kwS1VvSjJyNGwzRFhwVG16SW1vM2R2S0NIZXl4Y0V5VmJrdkxMblQ1?=
 =?utf-8?B?VVlKL2RpNWhJUVR5clZtNTBpZnZTZlBLQVl0OFBjNzZoeGVOZlJvQlZOdXZq?=
 =?utf-8?B?d2hjZDd2ZEkwT0d5UkFzNXhlQ2psSGdiK1J2ekc4a0dzRktKOUw1K2g1bktC?=
 =?utf-8?B?bE13UUNQVlZSZXRZRFBaYmFLRmIzSmRTaDkzdlRlMCtzOEdXVHBJQjNIZi9O?=
 =?utf-8?B?NGYvcTljVUpINWlmK1pwN2NQNVEweGswQ3pEMThreXV3eS9TeWZROXNVVkFv?=
 =?utf-8?B?Rno2UDIwMmNmc1d5UXBUY1RkRDhkeDJKcWxwaEgyS1ZxM0JvWXdoN3IvQVNV?=
 =?utf-8?B?STFFeWxUbEhQM0xnczFrQitla3BiMzNVL0tldnpPWFJFaGxLV2twSGY1d1RX?=
 =?utf-8?B?czJLb1p0THI4UEIyeEQ5THlSRG03dWx1U0FrV3hwQnFMUGxLNERsNmxFS0F4?=
 =?utf-8?B?cXFaQzVISEhheUZEWkFFTFpYNHozekE1Tzlsa21QY3BkSEtxSmNKTTN0WjZI?=
 =?utf-8?B?ZDYrMmZleFdDTkEvNDVLQlJ1LzZxcUpDd3JkdlpPeWh2NiswVzNQenNVWFBT?=
 =?utf-8?B?d1dnQVZEOUlxZVdidU0zdTloclNyVHRQc1RGenUxZW1oN1ZUVXBpTFlFL3M2?=
 =?utf-8?B?MXNXRjdlcTZyV2NkK3BnNVdsVWhReGFnTTBTSExVRUUyU0dRNlNMNTBYeVF2?=
 =?utf-8?B?TWRoLzhPZmhYVUxCSzN5eWlMNkhmVGlWQ0o5RDRtREx5M2hWbnZjanRiWk84?=
 =?utf-8?B?cjJKbUNHelljcVhRSmhxcVJqaUhBcDVZalpVbXoyOE9jSnBkQ3JraUFnajgw?=
 =?utf-8?B?OUlGQ01qc0dKMHlRNzhvTWJsWjA2ZTJJOXhBMGxqL3NRdXY1SS8yK0Jjcitr?=
 =?utf-8?B?ckoyVGNXZUl1TzJMWnp0bVNZQzlBTE5LVWk1Q0JaY2pNL0ZOaWszOHk5d1Bv?=
 =?utf-8?B?YzdoVDhXNC96UTRxSWpFWVJrKzBURE1OTE4rdFl6WXJnamNHM3FUZFhidldI?=
 =?utf-8?B?WjQ1VUxkZ2xwenhKbHVIWk5STnFuMEx2eng4cmFCUXE0N1laMlovVXRrREJu?=
 =?utf-8?B?Y05qQXFXeWNMb2dvRTRnS0p6Ukx5b3ZOOXpXYnFSdllvaVdzZEFwSUwxa0tZ?=
 =?utf-8?B?aGJIUUNkZUE2ek96L2VaM2grVkozbXpBdGt4ckpTWGRiODZuTTlRTGVSUEdp?=
 =?utf-8?B?dFZJL1NneTh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7724.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHJENGRwTDJRNkFDWldqa1hVbE41UThva2s2R2NTa0svbEw5cnJpc2lxNitT?=
 =?utf-8?B?ZXdsM3dCWEtlZ2owdkMxeE01ZVBMYVY2VlZ3VnVPSjRkanVOaEJIZmdlMW5s?=
 =?utf-8?B?UVdUYnVMRnl4UEc5VkxQV01qVE5RdnVUdEZ2UnV2UFBsRC91dmtzbWxkd1c1?=
 =?utf-8?B?NURWOEQ4bHczU2gwSUV2ZVhtWW1RN29CMEVNOEQwSHNVYk5ia3ZyWFh5a3lL?=
 =?utf-8?B?WkcwQis5MVlIYlorVmdhOTdQKzVOZkp0c2tqcjFmdGl2VnhvMkFUbVRvc1ln?=
 =?utf-8?B?bkw3bEE5aXp1RzB2TGY1UVdJUjJCalRiV1Q2ZDhkZ1RsNytYemJHeGNxeVBX?=
 =?utf-8?B?cDN5UlZnUHgvakVvT0FYbVlCMnN5K0gvaS9iWFBiTEE0OGdRTzRmQlQrMEt0?=
 =?utf-8?B?dnRaYjZEblZOYkF4SG1SaktXV2dwMUdZb2VhYVYrNmtQTmZjVjVMd0RxemY3?=
 =?utf-8?B?R1ZGMWFRTmRkYVprcm9PKzkvT1d6RjhnREk5ZlF6dHBCRFRtRGh4aFFGclVp?=
 =?utf-8?B?S3llQVFCT2VCdjFjOVNZUjB0TDdIVzNWeCt1L1pzUFh0OUI4VjIzcXlpTTla?=
 =?utf-8?B?Z2x0MTVRVGpOTmlmeFdndnhDSFY4NHloUU9hcVRhdWhRNVBLUzB6aTNzNi96?=
 =?utf-8?B?NHEzakxqRVRET280Q2J0NFBzYncwVUhLWGdZa1NWeHdnMG94aldQSHJJSWJz?=
 =?utf-8?B?aHZnUUpzTmJnNDJ5VmtJWWtWMmFDYW9tUjdUd1FEVFk0MEtDNHViTGFDNUQw?=
 =?utf-8?B?NlR6YW1oMFFoak9EMTZocGx6NWdON3cwWlMrTFRUS2EwKzQ0UHowdGpzN3Bl?=
 =?utf-8?B?QTVwMHdzRElFai9uaE5BQ2JYb2ovR0wwUFN3ZnRTS3JNMmphdUFRaEJqN25k?=
 =?utf-8?B?UUp0aDN2eUtDNEl5eWF4Q21BbVZGZktyZlpWTlVHSjN4VENYUFlhL3VKWldw?=
 =?utf-8?B?dHBXcWxOVmhzQzhGdkhLTFkxcE1jRk4zd0RjeUY4THBEbU0zd1JLWjVUbFVh?=
 =?utf-8?B?emc0Lys0Qi9OTkh1RXM5MFdCcGpvd3BCaW5BWlFUT0NjNjdYenM1SFpaZ3g2?=
 =?utf-8?B?L0c3T25mU2l6a3hWelhrK2VraVlseTRiT2t2eXkwZW4ycjV3MkEvQmVJMFlo?=
 =?utf-8?B?NThoUjlVKzlNell6QzFEM01IYktpZkZmM1pDRDVEWWdHTExVZWsxZytLdTJ6?=
 =?utf-8?B?S2FrYlVyRHQ5enFpSDg3TVh3TlBQZ3g3ZE9XT1dkL0JnZTJVcCtHb2JDUXpy?=
 =?utf-8?B?ZStrSTlUdjllaEgwU3RyRHc0aEFweXF1QWVUZW5KZWFtQzhUbVFjcEgrbTRX?=
 =?utf-8?B?WG5ZSU43M01MUFBESjZTVzJ6WlZxeVN3VFNUQmxjek95MFNWYTN3cDAxMFdE?=
 =?utf-8?B?blJJdFJVdDBzVUFSNWlaNDM3ZVVhK0pXWE1oRFpiZEdZZXI2QVlacHhCSEdK?=
 =?utf-8?B?WVUzWW5YVjdLYW9Dd2ZEczFsUUFwdUlCRlZ0N3lRM0tCdm9xWmxJNEJ5QjYr?=
 =?utf-8?B?TGpnbGFtd2VsSG9oQkFzQ3k2a2IwVG1FU3NPSTlHL0VValRhdHJaNFU3WXg4?=
 =?utf-8?B?T2xFMzYxQ3hrZnc3SThKNmEwcDNkdTltTHduK1RYYjRBWkpZMzdScm5lMndX?=
 =?utf-8?B?aFFjODNaRWVBczVZN0owQWhhajM4YTRoRXpaNUdkVVhOWVFtY0hVSmRyY0pn?=
 =?utf-8?B?RE52Z3Y5S2xuM24vTUsveHNLWlVLSGhPak5sRTR4M2tqUjg2TTFkMVgwTkdB?=
 =?utf-8?B?NG9UbkUrRjBsM2JqclJkVXJQWktDK1pBWGxzYUJOeGRNeXZnYzA4TDA2TE1h?=
 =?utf-8?B?d1E4VU5vaGxyc2l2ZmswWjhXa0FDY3EvYjVLMWhBR25HWmNpa25OVHltSUJq?=
 =?utf-8?B?c1U2YnFyMkNIK3VtTjhwLzFSNGZxWjdEQllGWUV3WmVVeEZDRXdOOE1tNFJM?=
 =?utf-8?B?WkZNMFNmNy9vaVM4QmhpOVpGZE01cG5wUVZrbkp3QThsSWxqOTNZWlVDalJl?=
 =?utf-8?B?NnBIcjFtd1BCS0sxWkViTVNLTHhHMzNYRUZnK09yZENkYi9jcnRBaE9QbmZJ?=
 =?utf-8?B?ZUhjQTVMblQrc2Y1M09YRmVSZHRMeXpGYUVoaVJtL0tVaTRpNVZUVlNNNGxm?=
 =?utf-8?B?MnlrQmNYd0VKQjBmRTZ4L28yd0FacWppbGZwdSt1TFRBdDFFVkdzMzlCa2Vr?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c53864-c1d2-4a33-7566-08dd93a6032a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7724.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 11:45:38.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69ObVovUQniVX6OMTkzE87ecKIRilFt24JaibFj3qB7NrfF8H96aaleaOAb53O6qkMsKodFVcXB5H87h/YLqhN+lKD/Utb45TKT1Pl/Dua0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10739

Hi Michael,

Am 14.05.2025 um 17:41 schrieb Michael Riesch via B4 Relay:
> From: Michael Riesch <michael.riesch@wolfvision.net>
> 
> The Digital Video Port (DVP, the 16-bit variant) of the RK3568 VICAP
> is broken out to the PF5 mainboard expansion header.
> Enable it in the device tree overlay for the WolfVision PF5 IO
> Expander board.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../rockchip/rk3568-wolfvision-pf5-io-expander.dtso  | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
> index 048933de2943..8cfce71dd318 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/rk3568-cru.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/media/video-interfaces.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  
>  &{/} {
> @@ -134,3 +135,22 @@ &usb2phy0_host {
>  	phy-supply = <&usb_host_vbus>;
>  	status = "okay";
>  };
> +
> +&vicap {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&cif_clk &cif_dvp_clk &cif_dvp_bus16>;
> +	status = "okay";
> +};
> +
> +&vicap_dvp {
> +	vicap_dvp_input: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_BT656>;
> +		bus-width = <16>;
> +		pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
> +		rockchip,dvp-clk-delay = <10>;
> +	};
> +};
> +
> +&vicap_mmu {
> +	status = "okay";
> +};
> 

Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Regards,
Gerald

