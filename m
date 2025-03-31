Return-Path: <linux-media+bounces-29017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA5A75E1F
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 05:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 875A87A272F
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 03:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A490142659;
	Mon, 31 Mar 2025 03:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="mt6Yrura"
X-Original-To: linux-media@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021115.outbound.protection.outlook.com [52.101.129.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136AB173;
	Mon, 31 Mar 2025 03:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391084; cv=fail; b=upuQHpHLOtfm+h8xivn4pNNM4xZdUN1QIBALokCSHIU55/75slfisydRe/x1xVq7cKaqB0MWJ/f+3OeHCaCWHFgL1DW9z6xYrxcayeWnvhEE333jtAdm8YldUYZQAKnrNgX4CrJXwncrjzncGjXYn15sXt729X5LlRMSb1szK2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391084; c=relaxed/simple;
	bh=aE/WOuZ0p4AqDpIJQiXET+G6SjVftQXo/BxXXecPiQY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=botJWKBBsA1zny2VR1rXqi1REbknWtWy4DvctTDWmXNTsf4d0r3ZmF5mm7FDkTb7NUWNRpizBaLw+5hrHQsUSHLHGu1rKrajJ8o2STZUKJnuX8BG+nQcZMqAE3sBnpgIo33xQIZpx+cz/HmV8mHLfjqoQVXeO8TLHJe9JYH/pLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=mt6Yrura; arc=fail smtp.client-ip=52.101.129.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvazHz+fGwiDjpsB1ZZ3Y+nHyCP/jlLidUh15Np1Q+Jhysine1hsYv96Zvx00R4TZsTxhONnIRNrzeJaf7pcT2aH6ajwUJf773clyxlCSawYPXYx3UbMq1az8H10ritItn7u1ENZ6peHaZSqt8FaGW9V2B8AftbNYdDE4ZSmdvXhGElxBcbMGiUy83MXhE1Htn4jBkZ0CsYHeH3ohnVCJVVeO4eC1DFq3XRnhA7E/5QEWa4Bf3oneRsRio1pSmpkvymifh7JTFBi/+C3RuQ4ay2SVOExcsgqFUZbti50NoYDHCfG2VuDbMdJEbj0ko/kIzFBIMiBNRDk5u6nV6M/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/O6jWHdujJJv8EAF9/ZsodxDZ82/q5LGswkTXChh7g=;
 b=Fo1ROCb0MSIYVfT1+2kiTv47MCs+7XHqz/skD6+GCHh1cdJY62UKdQl+HdyZIGWrwV7Ee29wPjQIUCJPFrcpBfyXWsiGJotgWruP0hKoTkF9kREkURcxGS9PNqOZ4z9jySzCt8lNAzRhW8w3RAHh/e9AC7Q2kjTnULsHNO8NUAginEkamgiuVVb1eppOhlCIuCxQpIIggPbUebA5AStC+50Al1jdbEtOJZW3iDV5zDUWoIB6RRSUn/oWa8rtSfQsxQ4cfX17einyGXqaZy9NtxvdXTZ6Z7UBMhz5kIaK9pWApaLZmXoX96WjeR1hDbVUh4s+KPcc5XKI+huhSfsshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/O6jWHdujJJv8EAF9/ZsodxDZ82/q5LGswkTXChh7g=;
 b=mt6YruraEkMm5wTPDG4b6Gngst4OyrBJ/Mx68CUewM60KLUH1h5ENMvFls18kyMtSjGZVNWLc/a9GjBY3s/Vr1h8K2PUQFDCgrcW0ib1YZHEWGMZKPLeetlcEo6EM4anfACBxryl8ADSQTILJ4QArzzIgqkVLF33WHITfoBufT27ngr+qP1BFdbYvLEymbekaalM5lIkVPx54xxOKi5HdjupQR3DhLVJ/7eH2AgT9+UTc4TO7bEsnLQk0KL6whWhtle9m0BPScNr1lNqcjDvUG6AY9lj2/1rmg+BJDJ4fKt8fBoYIxjMEW84cHwrtKmKRtWfQEouF0zbCk+jyp5G3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by PUZPR03MB7116.apcprd03.prod.outlook.com (2603:1096:301:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Mon, 31 Mar
 2025 03:17:40 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%3]) with mapi id 15.20.8583.036; Mon, 31 Mar 2025
 03:17:39 +0000
Message-ID: <e99da06b-acf6-490e-b39a-a283bdb2415b@amlogic.com>
Date: Mon, 31 Mar 2025 11:17:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/10] media: platform: Add C3 ISP driver
To: Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250311-c3isp-v7-8-c3551bed9005@amlogic.com>
 <6ff5acac-4d41-4d4a-853c-9902e9673ef0@web.de>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <6ff5acac-4d41-4d4a-853c-9902e9673ef0@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::27)
 To TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|PUZPR03MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 585ca1bd-c671-41f7-91f4-08dd700297d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0pQMFl0TUVBTWxTRVFQQStoZVZIeWVkdGRWZXAxQnY1ZHNOZHZIbmEvcXA5?=
 =?utf-8?B?WWljSXYxTFdQbUJtVkVYTjBSdXdFcWVFcmUyOWlCQUFIb3VUQ1ZEOWR3TDMr?=
 =?utf-8?B?WFNJTU5CZGJjMnQ1MmNSMk9paW1mSFE5bXhzT0lNR0lxZVZiM0dBeUZuWGw1?=
 =?utf-8?B?VWQ0WTd6TzdwZ2FreVRBNE80cDNWRis2bU5PbVhFaXFyUVdLU1FjYUxMVHNE?=
 =?utf-8?B?c3p0UWg1RytQR0FBVDdrdWlkWU5aSEhIU3hqaE9yYm1JajdqaURacHAwbEl1?=
 =?utf-8?B?ekRnVEx0OUpDZndlbi8xMU1pZmtwdjRrNkJKd2ZmVERhOXR3VnNvQXVSOG53?=
 =?utf-8?B?SDR2RzhxendTU1NGUVZab0ZMSENJanp5TkllQ3k3YktaWUMySzBURE90UHNz?=
 =?utf-8?B?RlIvcDdJcTZwZXhRdU5sL3UzQUF3dytGTGFmVHB1Y01oNktPeTB5czZENjRP?=
 =?utf-8?B?dUZpWTQ0VFlZRGFHSFJlYis5U1lHeE03OVJJcEwyOENaTWdaOWpMTWJtL21s?=
 =?utf-8?B?SVBvM2hFMzN4M0NTZHY5bTdjUm0rMlJER1U0bjdKTHdwZFB6TTU2WDVoVkFE?=
 =?utf-8?B?YkJ0ekZkcU50ZERUVzl1NllVWmxTbU9zbTA0YXR6ZzVrS01YMXBjd2UycjBT?=
 =?utf-8?B?ZUI5SGxQTEFZc3AvcVNtR2VmWE8yaGVFQ000VUthbUR6SzFaR0JQeUthalVo?=
 =?utf-8?B?a1R6T1JSUitCbEx0T1Q3U3RMaXduNEZpc2JiekJ3YUVhNXpBTFA1WE1Yc3JE?=
 =?utf-8?B?SEdpNFB3YlllTmI2V3VqeUY0NWl2NU9ib3EwQk5UdUQ5QUJJVVhKSUN2d3JM?=
 =?utf-8?B?Q3BBRDhmcitSdzdrY3ZVVy9iWmgyL1FWUlFlYUFRNEVScnR3SmFGU3dyWmg4?=
 =?utf-8?B?YzhiNklyalF1dXhINVR2dVlGS1pSSkVQSzZMMU9aYkV6V2JCOHRXMzEzY2J4?=
 =?utf-8?B?NlAvRkpndzM0ODh0Q1cwZmtCWnhmcTRQaDRDUmhiamhWWk9TWlN5RklaUHJi?=
 =?utf-8?B?NGZZQkgxTFBsSlNlZ2tsZHV3ZG14T2g5Y2g5blNsVFZKelpRTzU0SzZrS2w3?=
 =?utf-8?B?NW1yQ1NBM25TK01KWFQ4RGIyV2kvS2RGTnVHRmpwQTlYSGRlTVRLbmFKWCs3?=
 =?utf-8?B?enBwaHkrbHV2VnZtaTNYK0dRVmFhQUVCSE4xbUV5TzJ2dVo0MlIrTzZxeVov?=
 =?utf-8?B?azRmM2FsS3dLTWhTeGNFVkIvck5pWXFCSHM5SU9VQkh0VXNMampSdFlxOVFH?=
 =?utf-8?B?QmtWd3Q2MWNFVExPTFRNYTRncGxod0RLRXRxL29aaEtEcG9hdHNRT3N4aVZS?=
 =?utf-8?B?aDFhOVdkczljTG5oMEtDSFFCaCt1OEhSdWhodjdlRXZkY3pXVmd3dEhsblZ1?=
 =?utf-8?B?RzNWS1hSaXR0MWlsbEFBRkU2dWQ1ckVUSHd1SnN6ZUphT21Zc2NzQXRjNk45?=
 =?utf-8?B?d1k5N1N6VUQrR1NJZU9NV3RaZUVnVldGNXN1a0t5am1scmVkSThaSDEvN1Vh?=
 =?utf-8?B?U0dBalZPZU10RjJPUFJuOHRUNW5EMXkwd3F2eFB5Z2xoWTVTT3R2N1grUlFM?=
 =?utf-8?B?SHozY0hOMTJ2OFQrOFJTVFEwcjczRmtQVTZrRkhjYlIrOXZZUkZZNVY0Z3VY?=
 =?utf-8?B?VkZnTnl5aUxjU2VDSFc5OHdMVXFvd204TGJLRk1ESjNiRUUzb3NqYW1FZDB4?=
 =?utf-8?B?OTNiaU5JOHg2UThrcERtd1pBZFpVOG94VDNQdnQvZmM3Mjc3bVc0aXkzTWlN?=
 =?utf-8?B?UmdyWWtTbUNsYkhXaUtiWHg0VnRXQ1k3enB1dG1xV3NLUVM2UCszZUN0RW5t?=
 =?utf-8?Q?L/Ar+th2wHxgv6nq8MnCUXjkkajCliTbmo30Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGdNZGV1eG9jWDdKYmM0ZGROdnNIQ29MSmtzaWI2cXN4M3RXZ1dzSndQRnNF?=
 =?utf-8?B?NlVncmcwZW11WTJlZWtiYkQ5NFRKeEloWS9vMEQxZzByaEVDeWRzR2tWS0Rh?=
 =?utf-8?B?eWxrK3B6VDNNeUIzcmNtOUFrSXN4dldwSi8zY1lmTmx4KzlEZzhPbFl6VEh0?=
 =?utf-8?B?ajlCeHNUT0dROGIrVnVvb1ppRlhGV0hVQnJtOUpLQi9SNGV5QzZUVS83RkR0?=
 =?utf-8?B?K2JzUGpXNzdHUERtN05JMjFvRjlNVkh0STJlc0k5a1VraGNYbnVLUURCMVEx?=
 =?utf-8?B?UDVqOUdhK25ETExsRERRdStKUjU4ZllLczd1U2ZhTDJPYmFZZlorVE1EamlP?=
 =?utf-8?B?R1NlMWRZa2VRc0JxVjhXcHV6bDRtYjliTjdIa25xZEloYlpyZ0hmWHZTWjBj?=
 =?utf-8?B?NUEvMS9TZVE5RmNraGo0bXFCVVQ0M01IMDhBT3h2OERBVTV2aGorQjlvR1pD?=
 =?utf-8?B?S1E2ZWNKaUIrQnFaTGYrMHRwQTNFZzlHYVhlcFNyRGFDMnJ3ZW14S0UrUWZx?=
 =?utf-8?B?TnJuNmpGMlVocXQvbHVLV2IzMGh6WXRRakh5anIrSGtWeEE3eThHbWZhK3hl?=
 =?utf-8?B?NU9EdkNGMnc4ZitJK01RYSt5QmlISVFRUGhrOUFnbmxEb3hQckVvclhQZiti?=
 =?utf-8?B?S21MNnFvWnY5Y0RpRWVIT28wd1RBa3RsTlc1b0lOQmtXQ1B0YnlPNXJpS092?=
 =?utf-8?B?ZUhTSklYWVhJWHZEamtJTUJ3ZSszWk5FcjNCK0RWWlNFdXVBbWJRYzhuZWdQ?=
 =?utf-8?B?Q3dQNzN3dU9IeGsrWW5RaWpOYWhnQ3VGTXJZNXR1dW1mRFpJYllwS050NHlM?=
 =?utf-8?B?VXBlRG9nVUJNcW5DMnZFUGdzSWVOVUdia1dxSzhpRC9kZHVnZ0VkNDIySlZY?=
 =?utf-8?B?UStKYVZiU0tMMW5OdEhnVTZUQ3FjbkozVTVyd3NHakFtMnkxK2FwUFlObmQ5?=
 =?utf-8?B?bUREb1BZcmVuU0NEc2xHSG4rTXV2cThLTUZLU1VYb3hnTkl6N1U0ajl3UXd4?=
 =?utf-8?B?WUVaS0I3L0lQTkpkWFluaXVwamMrOUZGeG14cFRtNEJKb1pYMExpVjJwd3dE?=
 =?utf-8?B?aGczMWxSTWxUWDR1MTViZUNjbC8xd2p0MDFLcVZYU3RLMHZDNFNZekNkY3ZT?=
 =?utf-8?B?N3QycDZEb1F0ZXRoSmc0OGdUMk0wZGtwL25aM0hCdjBERHk1TVhNRCtEci9N?=
 =?utf-8?B?eG9HcDBOM25NRXZVSFNSTENMM25uUlVVSitTYWVuOUdmczlOK25WelN3UG1z?=
 =?utf-8?B?RE1kZlQyNVcxd1BCQUhrSUJKZnBvN1p1WjNrZFIyRXlldDk4VE00cHloK3hm?=
 =?utf-8?B?MUd5dWQyS1lKTEM1Ymd1TlAxUTk0amhVbU1wU3R2QjRHOTJpYjNqT1EyZFZ6?=
 =?utf-8?B?akFIQVhpY0R1LzJsK1RpMlBHbnhzL3d4QWZUYWtyZW05WnR2Tk1DbUpjNXRh?=
 =?utf-8?B?RWdIRlI3ZkZEeTZaallLbVIrUkN3QkFuYXNHSmdjMXo5SUhSMkNlS0hSWlFJ?=
 =?utf-8?B?TnU5bVM1NkFuY09ZbTJOMjFNUFRRSGRnOVR2YkRob29hOHBuTk1iaDJtcCtW?=
 =?utf-8?B?cE1NRFdrMnNrdXNQZWx3ZE4wL0xPK2ZWWStYWnk1eFRGTjlMWlhqVFpRaHBK?=
 =?utf-8?B?S25ZTGV0V0dROUZvbXlVaEMwaDBLdG9iV1JrOHZlVGM5dUZyWFJ1bjA1NlQ5?=
 =?utf-8?B?bmVkVHQxeTJJRkFzMitYLzlNZ0FhbTJGL0JwdEFUR1h1M21HaHQvUmVlTmZ2?=
 =?utf-8?B?Tkp3UGpvTll2MEt6VmE0ZFlocjdoRTFadVpicDVBb0JRVVdtdGtteUdTdHds?=
 =?utf-8?B?MTdaTmpRZmtMTXBHN2o5WG1FWWNzRlhGb3MrY0Vwak55anh5YXJPZm5tYXNR?=
 =?utf-8?B?aE9VQkhjWWRicTJEdnZtbXlUdE1hM29hWTY4cDg0RnpLS0FzL1grRUdBeENY?=
 =?utf-8?B?M3FydU0vVWFKU0tyMG9GNkxCWFk0TW92NWJEOHRzQmNLRHJabXhVVk9KNGRl?=
 =?utf-8?B?c2RqcGU1OW82eWNyNnlJeXJMZFBVWkhvOUVvUmtKd2NhNXhxa0xzaGlUZkdD?=
 =?utf-8?B?Y2VjMDAraFpBc0c5UmFIUFcxMUUrZmFSbndTc25Kem1RUlhWTmJWaEFvejA3?=
 =?utf-8?Q?QHoHuK+B9lJLPOTfhzCKQK3pn?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 585ca1bd-c671-41f7-91f4-08dd700297d8
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 03:17:39.7996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMTamqVC4MtTF3qj8bzi+HvjqOdoQvfXOk2h5UQ8gG/c3P0NYrdnNbrFkwarMmutwli75X60XWlkFlxRKsCPbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7116

Hi Markus

Thanks  for your reply.

On 2025/3/29 18:23, Markus Elfring wrote:
> [You don't often get email from markus.elfring@web.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
>> The C3 ISP supports multi-camera and muti-exposure
>                                         multiexposure?
>
>
>> high dynamic range (HDR). It brings together some
>> advanced imaging technologies to provide good image quality.
> …
>
> You may occasionally put more than 60 characters into text lines
> of such a change description.


Are you sure the character limit for a single line is 60?

I find the description 'wrap at 75 columns':

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14#n145

>
> See also:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14#n94
>
> Regards,
> Markus

