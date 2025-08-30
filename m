Return-Path: <linux-media+bounces-41368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3D3B3C8E8
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 09:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A40A02E99
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 07:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A9C27F01D;
	Sat, 30 Aug 2025 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="YIboalfV"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012060.outbound.protection.outlook.com [52.101.126.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E9335971;
	Sat, 30 Aug 2025 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756540152; cv=fail; b=HseZRb82K06W7OqqUBBO1HvqI0SVWFWll4PA5Stz2hwp/2cczwJwTfMNGJNrWRAIwCETJkLMRJJGLblXFWT4m7j6TPdKIC+reU9BeozHGB6rFvA6dsQMna3YbO7tTFnxkcL680ATMHGszX+xhPv4gpOPBP+5Jzqjtc5mkQP4B78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756540152; c=relaxed/simple;
	bh=EiUmd8YC96IyGBpfP9qjn0wnkYSNvGQuamororRxYLs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hXZDwk2NdBcBf43jO2VkS85/dp3ly2yUOqZMrE3p+AahL3KhN/tHnQ4Vk0YKSy2arCRpX5G47laie3u4Tce7f8EYgkINYaznSgWfx8vT3l06Bbt3pkwja2zZApKaF95+l10QSDRykLHhHrkwE7nw1SH+57ziSSXHZPXThuW4edY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=YIboalfV; arc=fail smtp.client-ip=52.101.126.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MS9DS/5u0h8tYkwPXssfFBcvdSM2NOdJnDeGLBxNwxLa9SSY44ySzdHAh+RyevweCDVIn6SPbJXNABfi5kQSZ2+wkLNtiXeQ9TbWUZlqq6FZ+CeJBG/xVj2A5Lllr662ZOFPBVY32qeLgx4BenSnIkKsye7rOJ33Bn25wYQaZiUBMDC5wkLpNVm+OxztYMhoCi/ssG9JAVWEhZEazWZ8mYMRoBJdTdbaZjunG0JMlh0m4ninaUNHq3PMrNy85GXwdV8xL/I59yd5+J4Uebeg+Vi8wSstC6X889XlNmzlNlCN2/DhPRROcDCM5GVksVugDaUPWpOqiO/HM/uwLCnHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcDfk2ldsVTdPJpT6k6fZtYmViWZzQHAteeB7tG8Tdk=;
 b=KlOz/0wAhaZtxyRhBFKTjplyBMfaAKQRp2iIaAoVn+U3XbDTpdiotNbEP5J29s/2YejkEOP4byATajQL4Q/EdYcuzyl9Xs5UEXAmtwCFJnwF9dcFuH8p2mMfbCDoBUO7HncjNZ/gzUf8gSiJxmzB8u0P29LZz9clVmJTdR9njxCGEfh6Q2MZw7moGiAVlfOoud1POGEVEPiiBMZELAnW2FNWorhWaJTqTivFfLlGTeGCR5wcH8RPvho+nvxLdk5s9gGgG3NvaluPJUirD6SXAG0cZfmzyXTJ97bgTIjHlzDuQpVy9cjLvero5D0y7iQo1dpXm7e92wAtHDohaOY1gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcDfk2ldsVTdPJpT6k6fZtYmViWZzQHAteeB7tG8Tdk=;
 b=YIboalfVdTLnEEs5QVSVcIb6fqfZF75wkja9x8m+Jj4aOCYgUEGqfkoWexU1i+wwxEu66upBX/2csPu4BbgSnyhzp6ItoferXYuKmekBlc/qi36Y+AcLAuFzoh3+qhuOzYyFfPFjK+ZFAeL9EGmXO13wn+AA8ihHyM55tey0jMNqC78qZTQRKLlgib7KZZWJWoa6cKHPbPjIEnvMH105zh6L6DFqtgJ6BuropeXI/uD+Vf6RF/St2PUFmf8m4+KMLc3ion1756xGUg7vgekQMyxffCzCymb9W7z9dZKCjEefRY1QM8BTRMHyvaQCciu5tfNUQOl8U1ZaswetKnxQYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR0601MB5485.apcprd06.prod.outlook.com (2603:1096:820:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Sat, 30 Aug
 2025 07:49:06 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 07:49:06 +0000
Message-ID: <7555a522-b7bf-490c-a3ce-0cebaa821ead@vivo.com>
Date: Sat, 30 Aug 2025 15:49:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: media: mediatek: vcodec: use = { } instead of memset()
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
References: <20250803135514.118892-1-rongqianfeng@vivo.com>
 <9f0b868c-47f9-4c98-ac99-86bfbc6a432d@web.de>
 <e3903e95-3659-4d68-86ef-0f3d6b2c8d90@vivo.com>
 <887bfbac-0e16-491b-ab0b-a0997890ff2d@web.de>
 <44aa36a8aaa7da22a4552b910ceb966b3a911691.camel@ndufresne.ca>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <44aa36a8aaa7da22a4552b910ceb966b3a911691.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR0601MB5485:EE_
X-MS-Office365-Filtering-Correlation-Id: 22400254-2c28-45ef-1b33-08dde799b21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDNJdS9RSW52M0xZTDhzMTRzOFh6TlRXNmJCMWlCeURCOERnVlQzMkRCMEla?=
 =?utf-8?B?VnRIVnJxZWF6ZGF2ZXhRUmNaOUU1R2R1QUtpTW9JNVlUWkFubGUrNzJOM3VQ?=
 =?utf-8?B?Y1NNZzhtVm4ra1pSamgrcTdlT05hUmNsZzhxMlpjWElkZnRKc3FndVF0MldK?=
 =?utf-8?B?WHVjUmlCRTRXTlhPVzRoaTNTNjVzb3N6Z3FTUzErYkFPVE5xUnJTdDUrdEdw?=
 =?utf-8?B?dkNqSDNSeTJqdGhNekRZZExCcXQxUytkNlBPV3lEQVdiVnFRR1JodGNRUjNl?=
 =?utf-8?B?Z3hpdnlCejRweThPcTNUdHg1ckJmUzdLMVE2MXBFdmpLQmcxbmxnUldGZFZl?=
 =?utf-8?B?WmF2VXZ3SFBMYk9ZSVFSaGN0cHJxNkdqSDdyRXpIOWhMOGtTbnlwZTdzcDNN?=
 =?utf-8?B?b3cxZWE2MDR4NmI4cStQcHljZDhBZkUrMUM0bkFQMGJ4V1RtNUprdnpLcVV1?=
 =?utf-8?B?VktrcnNPelFtY0Y4ak5BMk9XVEFEaUxHQ3NuNzg3VnJ2TG5qMjRxZkhsUHdP?=
 =?utf-8?B?VGcycnJFMktZcFRVTzVDOFlkQ3g0MndGNGtBUTQ1Y3NjeitIVDdydkJxY09C?=
 =?utf-8?B?MFNwRUg3Q2NQVGd0VHc3WXlvY1M4VU5qMWMwZ0xvZnBERHhCSjdxYXo3cS9r?=
 =?utf-8?B?TTBBV1grVm1VUk1oRTdnZUpYc2RVei9NZCtwMERsbFQxRzByKzhXL3dQUHJZ?=
 =?utf-8?B?RUZpNXAzSlBtd1RmT0FCUVJlYVZrS1IvL1BpaDFIU0ZXejNtSG5RaGFrS3Uw?=
 =?utf-8?B?VDRNeDhJVE9jVHQvTnZSYTFUWkljS2YwdDdNbysvYzR5Vlh3bVBHKzlPQ0xr?=
 =?utf-8?B?UW9mN0RJYlpnV1dVT0k0VjFmUnFSR2xiYlQyWThrK1l6cytiZXhOT01Qaks1?=
 =?utf-8?B?YXZteTg0WlJtWmFNbFlrNzYrQXlNQ2RGRmd3cVhPS0ROeC90SW1HbFpoUEFU?=
 =?utf-8?B?Zzhma1FMVWNObjRJdEhoQVNGRGF2M25OM01EMzdRckRHRjNqZENTb1J1Qmc4?=
 =?utf-8?B?RnltbTNzeHRSTDhQWXpjTTZzSFZYUzluS0trN3VPdzRoZnh0QzJBRzhFWE5y?=
 =?utf-8?B?OXd4Qk5XRG9Malk0d29NT1AxMzFWZE9rOEljUUh2cUtXUVFxSlNnYUxISUww?=
 =?utf-8?B?MUVPMFFqdXFoQk9LL1ZCY0FMWURBK3dnQ2RDUGN5dW1jczE1SDhSQVhacjI5?=
 =?utf-8?B?NnNuZ1dNSVVlWmJETTlWZ0phR3NZWHNtUTBvNDFyYlJlYUpGSUE1WlB5dzlJ?=
 =?utf-8?B?WGh6ZXVsZnpqaFNXcjBCTVBOMUJIOFdBRnBWVzFId2NwdWRmNXJSN291L2Fs?=
 =?utf-8?B?b3hEeWxLZjI4bkFrY2JwZnVKOC93UjY4dVl6SmltQ2MwRTFLQTB0em93M3kr?=
 =?utf-8?B?STVCaU5BdWdpdVgvS1BMc2szMmNIWlpiM05ubW1aTTF5QTJ2MmJ1NjllQzdK?=
 =?utf-8?B?ejhFUnBXWVkwam9XSVZHV2NOOE1tTFhsZnhxamlSOFFkNk1RMVFVbFZCdXp5?=
 =?utf-8?B?NHA1b3Q2Vk1JS2RsN3NpVVN5OW9seEZZWE9DNnlQQ0NybzBCUDcwWXdTMVBu?=
 =?utf-8?B?akRBekZyNm9zK3Y1a0VRS2F0M1grdUtWQmtlMGxHd2RwZS9jQ0E1NTZjLzRm?=
 =?utf-8?B?WFZ2ZFQ0YVRXUTZKRjRsVXFuWVhiWnMrQlpPbTRIeTZ5VmFzUFRRQnlvckcw?=
 =?utf-8?B?ZlhMMGpkUFR2SXJuWDBxMDZMOS9RU1pSbWZ3YWdQTy8wakZhc2F2Y2lLRXY3?=
 =?utf-8?B?NzdRSmVXNWFhRE44RHd2czBXcnA5eXUzaVRkT28wakNqcThPUFJ6UUJpbk5X?=
 =?utf-8?B?d3R3eDlCNmkrajRiUTBvVlB5Rjl2QUdodWhtN1lJL0Z5YnA5aGpwVmJFOXJy?=
 =?utf-8?B?TmQrZnBtQjFmZ3dVYk5wQUl2MGZJTGZRZHcvNS94eXNNazRMNkNPYm10TCsv?=
 =?utf-8?Q?P3a2no4gNWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWNQUlBRL050T3lRM2J2QW1MQnJ1ZTM3MGNqQzRVSks2R1dJU1pRc3F2Rk5q?=
 =?utf-8?B?YnZiWTBvdWdjREpuWXJLR014MTZpVnJCb2pLbGFvaVlhNVVUMXEzS0VNcVNG?=
 =?utf-8?B?YzM1N2ZqVzBxUmxYQmpxOWZZbmVZemRKRStRcG9FekpiODN4MGZ6UlRPaG15?=
 =?utf-8?B?ZkZ4ZmdhOU9YUlZBRTRRWm1raHVDZGZlblBPTXh2SjFRcjUyTXZxWkJzby9m?=
 =?utf-8?B?dnBuc1g5Y0tlZkhwMGdZNWJ6UGF5UFljUnpVeHI0KzlKZGpIZUhDNlQ5b2dK?=
 =?utf-8?B?SkE4NlBCekJ6aEp2QStmdFB0SGtzR1ZJVWt1Qk43Z0NrdVYxZ3ZXbCtNcENp?=
 =?utf-8?B?UWN6aExReWpSejk0cUxQNW4wR29raFQ5QTZ5dzgwZG52VEZQd3pEVFdtek0r?=
 =?utf-8?B?dnUxUUh1ZjB5QnVseHp2dE9nS3p3c2hVSU5xN0JueTE2Z01rM05UWDZIQWlW?=
 =?utf-8?B?SXNVMHhWUVhHUzV3QllSS3ZGSm9jMWhRODVNc0pqTFpERm10cnBpNDlHZ1J1?=
 =?utf-8?B?MHc0emhmdTJjWGRZUnpzcEIzZXhRb3J2b1lXWHZPeXhWMDZFdlloTDNWSWR1?=
 =?utf-8?B?M1lKVHhhZ25JeGpsQW55Rmt6Ky9aTmRGZEx2a2dWazcwTVVqVDNBVitVdmZy?=
 =?utf-8?B?UDFLT2tRMXdSbVlBa2FhaTVsQzlUcVh1RzBoTWJEbXpaSVNuM0Rha0lXR0xF?=
 =?utf-8?B?dXZyOHpwVUp0RzVNbk9hK0NmL0NiMnMramIrS1lYWVZESUgrazRjUTZtNGdQ?=
 =?utf-8?B?OGt3NWs1Y1BOT29YTkRhdERDZTVBU0FTVGJGUWtMOEovNThsU0cyb096Nm0y?=
 =?utf-8?B?R2R2RHVVR2JkSEVNOGZDYUN1S3FBQjREWitkZUw1TUhYN05hellFL1dDTzZB?=
 =?utf-8?B?TS8zN2pMN1czT1Njbms4b1d5bm0zUlhRWFhyUzZqcnlZcUZERVk3ejIrd3dq?=
 =?utf-8?B?Z0JadDhjWlljSjI4bmRqREJTYXBWZDd4Z2xLWHJPNzl2SWRzQVNQVC85enBq?=
 =?utf-8?B?UndUejhwV3lPQnhzOFNYbVBITndKQmQ3ck1NVWowbDE5N28rQjNIbDVsL3kz?=
 =?utf-8?B?Y25pU0dDMXlPVnd5LzhjT0hUZW93dXJUR05RMVJiaTI5MzE0STRmTE1OdTFj?=
 =?utf-8?B?RHpNZUhpalN1bTBGY2tqbFRGS3JsZnlBQkFiL3BvbnFuTVlKZWFKNW9OanR2?=
 =?utf-8?B?Y0tyRkNpaGVUbkxaRStub1NDRGQ1aE0zSm5JQTNmNUl2bnlSK2JsSi80K2d3?=
 =?utf-8?B?UjVxeVhDandxK0U1Y01rT2ljRS9EN1hHZ1dEMkN6RGNDQzA2THZkL2xYSTlm?=
 =?utf-8?B?UWVzTzlGdURDbEZoditvS3NkUGpWT1VGZ0IwQTdKTXNpNFYwQ0VLWWNZNmFK?=
 =?utf-8?B?ZEh0UWpPU3B5VytucHUyK0ZvdTFRL2s3RjJQQ1hsbVlBMG9zKzltYkUxM1N2?=
 =?utf-8?B?ZWpyR1BXMFN4VFFBUFdaVGpVQUFZWjhoWjk4b3Z2cWJHcVFCN29sMVFwcnZ0?=
 =?utf-8?B?dmgxaWw1ejV4SVV4Z3hIOW5tTVZIRjhlMHprYkJJbmsyUzdPK1NsOEd3V2JB?=
 =?utf-8?B?eEg3MEZUbW9DSHorUzJTTWdHKzN6WGhqTGpxOVZiUkVLazJYTDVWNEJYbmNC?=
 =?utf-8?B?dXZEVU1kZGF0Y2ZISTV1blZqdmYrUTdGcGx0RWUvN0JkQzJqZ2RuSG15OEVX?=
 =?utf-8?B?Yis0TnhRazhnVjRZdUhuNmhCR3N2Zjd4T2FXdnJlVG9XaEtKNlJOaEdDSnhD?=
 =?utf-8?B?QWdKTmloL0c5NnNiRFhxVnNEZTZKQ3RBN1AyNEE4SzVLT1N6Rm1qSXlTaUtW?=
 =?utf-8?B?YjhYNkpQSkdOREIxSGp1dXdwNDdIWnFLTEk2cDYzUzJDQlhrQ0wrK0FWVWVZ?=
 =?utf-8?B?T3BIbjFmMGEzK21FNWFFUmQ1Y0J6cWQxVE9WODlDUTNnVW9RQ1FQQ2lzOWhi?=
 =?utf-8?B?S2M5Y0dKbVFiVzUycWdsdGUzUmdrWGh0M29jcHU0Z3d2RHFpekJIeDdIRmIw?=
 =?utf-8?B?L3UxVHB3cDc4OVdRc3JSVS9CcnFlaGFpYmIydXNQd0JHUnFSOVhnYkJqZzJQ?=
 =?utf-8?B?S1hzTkFYYkVGNzF3TjRNVkxjbUpiY0ZoNyt6M0tkVjE5Yk5rY2wvS1pGR0s4?=
 =?utf-8?Q?NxgbmwS2LcD53VQ9IEOYE5sW0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22400254-2c28-45ef-1b33-08dde799b21a
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 07:49:06.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEM4WWLo6GNS7FomTpO4PRKiDpAVGqMcUuRo1xacOrVFGx0k3QSxlCgROTwzuWWHg265L3XfBWJQBzm495RiOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5485


在 2025/8/30 2:57, Nicolas Dufresne 写道:
> Le mardi 05 août 2025 à 15:32 +0200, Markus Elfring a écrit :
>>>> …
>>>>> This patch converts …
>>>> See also once more:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.16#n94
>>> I don't think your point is a problem here. …
>> Will any contributors care more for the usage of imperative mood
>> also according to improved change descriptions?
> Markus, its the way you review that does not work. I'm far from perfect, so I
> don't normally give any lesson, but I've seen this this exact interaction too
> often. Try suggesting a rephrase instead.
>
> Qianfeng Rong, the suggestion is that:
>
>     This patch converts memset() to = { }, thereby:
>     
> Can be rephrased:
>
>     Converts memset() to = { }, thereby:
>
> Also, some maintainers may prefer if you swap the two paraphs, so you get to the
> point first, and give context in the remaining. Processing tones of patches is
> improved if you don't have to read the entire message to understand what the
> patch is doing at high level.


Describing patches and making them easily understandable often gives me
a headache.  Your suggestion has been particularly helpful, and it has
made me realize that this task is not as difficult as I imagined:
dividing the commit message into two sections. The first section
describes what the main changes are, and the second section provides
background information and motivation.

Thank you very much.

Best regards,
Qianfeng


>
> regards,
> Nicolas

