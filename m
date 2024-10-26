Return-Path: <linux-media+bounces-20354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7659B1AA2
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2024 21:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9509B2137C
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2024 19:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69206183CD4;
	Sat, 26 Oct 2024 19:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Kl04cS8o"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82418217F2E
	for <linux-media@vger.kernel.org>; Sat, 26 Oct 2024 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729972374; cv=fail; b=gA1MsKHbsAengBKkrBCvYT5i2Z3BCAHmDl1sIwA39N4P2RsdMYi/0NnFTEPE90QRo3EwfamHoDXs73IqxryN8rwnVZeBEbXz98B0xWz+fh+/EriCB0hKWsqDWcawFOenMbjCK7AD5eBMeLpv7h/qHj2zV+QbfPKF9vO70G4TF1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729972374; c=relaxed/simple;
	bh=pdPxNyt5yXig3iM7WfRm1hRNk7vhb9e7YM3PjLYKpu4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=huFqqW4u3JApdzXrQTpdMxJjRoXIw1fGhBhiGIIShaBDHDGxb3SrYYmzT/u+OdAVSIkt22S6xWivsFRr5qmxniLyB2W0lDaoD35iN04PwpAIiGat6az1LgphQULozGCl7fqCRtegeHPkz1CX9JpHPsEDxwpXNJd9dBdVfsR4FY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Kl04cS8o; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXLA3QiHQJx32eycpBdSQiw+b3KhnfB8B1bF/e2t4OUalw3CT0M27ZAy1ng9awas+ucKIu60E48BqdQC5RL1SOCXR9ByYUftxehGWxCIIGd9YyO1eB/umEC7aOUHdvnoBPVORRHh57IloqkEAilo8K+J+4sqxNfdR8FsZDRUAk0F8GB6LBMwvUOqI6a3xYji3lGJhUT6H+AyhOMN+6c5O0s3XJkCXWNmcRD2XdR+V5wyI30vSnWbEngOwwlJ0RPeW63CWf3IGnQSJgrHiKhfwymBXdxj84v+o7mtr8DVnaCuRe6+snOaPbVO9D9ItxHpl4Lenhu6w1FLD3iHrXrmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+7LWQqk+fpzZ60JJmviw3v9DZ0LzPiVv9GxdIfVps8=;
 b=LcA8s0zxRcNrEGZa4mE6E8ZWlOXSDwYVo0WVvfXVbcI9JBUIaF/3bp4g+bYwD1dwHKPrbDb1qmnbmGnjOZxZ1AGarmwlgTbT7xL9wezQamVzFaY1m3Mih/6rm8vUWhbqrb/9cev0f4HccVLVnq2+bomiLUbLp6RaZC1pCTgSuhSNXLbUv7AXq8TK5fCNrUxge4siTWTyLvxKDslBHGMmlNfxeXH4hscWDkM97I7why/ElBCZ9DP/ohZmgh06wj9sZXjcQISsDEtrT/vKS62PW+imSBjPgBk2NIPe+Y7QvQ1EBsAWvi8QOVodi2JSTaRdjOKSgDHgbLZ5+AGcNBFLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+7LWQqk+fpzZ60JJmviw3v9DZ0LzPiVv9GxdIfVps8=;
 b=Kl04cS8oc8MxNFnRyFHm+mtOob5pW6OgLyYRObkEOo34L0z6DzOdKe6Tr/5PwdJh1/pRhsG+WUNWFiYHXozz4tbyIaPJTgSsA9iNWTNRlnrYnOawnPCHclUAzrF4tOxrvsUG9Xi7C8E8SadJ0DmCfK3SbBFLucGzZ/sZ3+lIkVXVr3YdPR9T5CFZRXBouz4pfS1Os13wK3UndhDSEPUYb0ptKUI7WJZCcybnpugtlpVCpRMMZc+z/1hods63KKFTVCVhZkckqwfqoCq+yQg4VZLC+xt24PBWdL8gS4aldmkk+iQrggepQ9TOKnfFMIJhoi9oKz/o3bOsaIY4gbJCQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AS8PR04MB7654.eurprd04.prod.outlook.com (2603:10a6:20b:290::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Sat, 26 Oct
 2024 19:52:48 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::eeac:ae8a:b567:e3b3]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::eeac:ae8a:b567:e3b3%6]) with mapi id 15.20.8093.024; Sat, 26 Oct 2024
 19:52:46 +0000
Message-ID: <a73be13d-a2ed-48cd-a84e-805fb379dc09@oss.nxp.com>
Date: Sat, 26 Oct 2024 21:52:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dw100: Enable dynamic vertex map
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20241022063155.506191-1-umang.jain@ideasonboard.com>
From: "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
Content-Language: en-US, fr
In-Reply-To: <20241022063155.506191-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::10) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8703:EE_|AS8PR04MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de5bf7f-beb3-4aa7-4563-08dcf5f7c263
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dzNRSXN6Z1pGYzczMkRveTltb0NFb0NkNkhmMUt1TWw4T1pINnJjUlp5Znlh?=
 =?utf-8?B?a0JweERiWUErRUFyMVNJT2RVSXVNb1RJOGhVNXo5U3lneVhyMlJjb1U5YThx?=
 =?utf-8?B?b0Fwc2VoT0V3dEp4a2tiWDBZWmpIQUp2WXNadlEzYWt5Uzh2NVBMMjZxYjcv?=
 =?utf-8?B?MUlSL3UwY0FMSjhwSnJob2hJeVFCR05EaENtRHM3U0RpYWJGVnEweEtRR1hs?=
 =?utf-8?B?NHNIc29mLzZaM05JWlROWU0zY1lOMWpUNFdwMVFLZElvWUx3cHU0LzFoSEFG?=
 =?utf-8?B?cGVVb1FQQzUvVlgzZmk5aHRBR1VUNGFSRE1YbEdSSjFCUFVzQmpSRnh2WjFy?=
 =?utf-8?B?emdiTHpCbVludGlhZjN0ZERYeVlvSEVuWnVSbENkek45eWVRMGltbit5eTJ1?=
 =?utf-8?B?MktwV2x5NWtUTG5YTkRwTzRkWVRiT3g3eHd6TzRkUUI5WFo5WHZEN2dJNUdZ?=
 =?utf-8?B?eGJ2eU4xZGU3UHVXN0R0azk4eCtwMEFXY3RrbWJHUk1PZnZrMlNuMkJFbXJM?=
 =?utf-8?B?a1JCNjBBMGtOMndQQXRxb1VJWGg1d1R6cTY5N3lqbGVSYjQvY2lFZDFUTU1k?=
 =?utf-8?B?cVV1S1hVRnRSeko0eVNBbDJrRjl6SitsYlpjdWVpbmtnQUdUSWxreXhIbXBi?=
 =?utf-8?B?eStrYzhRbmpXczE0cnRmTW5zYkxtTGgwZnB4MzVLajc4aEFrVmpDYTd4L3JM?=
 =?utf-8?B?aXJOUmxKSE8vb1lxOUQrdGU3amY0aEtuUDkyc21KYzRPVXlubk5ldjFJMk9K?=
 =?utf-8?B?Y2dmQVNSSzM2OWtEelBaQVA5Mmg0aElYUkNpZ1laU3drNmNaQlU1N0M2ZjZz?=
 =?utf-8?B?T2FEQm85UkNWRGNWZEovQWpqQnY5NU5taERkQTFwenRrcXlhamVOUFlGR2ZQ?=
 =?utf-8?B?TEFWbjhrazlURnBOV3MzMjdWWmNSM09qdG5hTXdHaXZwNjE0ak9YTE5OaW1G?=
 =?utf-8?B?ZjBmUnNlbDRlbnAySGh2SThzb2dpZmtZTGRtKzE5UFRZZUEwdFlHLy9LMVhK?=
 =?utf-8?B?ZEUwOFJ5QWtGNXQxRmRySDVPRWhoYjVsclRtR2ljaDRpVm5SOXNtVmlnQkM5?=
 =?utf-8?B?UFA4c2ZWa20rdVJrelZxV3ZqYmJsbHFYR1ZjejZmc0tZTElxUFNvQ2RJVVp2?=
 =?utf-8?B?ZDd1Y2VlWmY5NHBmNlBDci9RUnlNb09MeUhNVUhEK1R3b05LdExIeS8waElZ?=
 =?utf-8?B?MjI3K01jc3Y3b09RdnptNjE3OTRIWGhIeTNVSEEzT25sS09GbkVwSHNDSDgy?=
 =?utf-8?B?cWI1RGNLZjR0OGc3MFNlS01nb1pldStxVk9YNThTcU1VbnpWYkI2VTRDKzBx?=
 =?utf-8?B?VFpNckRZRWpwK2poKzRxeW5jWkJPZCt6ZnB6OFhrQWY1dEdPUkRGb2RheDg5?=
 =?utf-8?B?UUJRd2ljOG0zQWZzSHUrN3hPcmxlSWlOendWOFcwTXRoUWtuTDZFRlpvUVhN?=
 =?utf-8?B?c1NwbVdyQVVKcXd2OEdpUmtWMXFBSnF0VmVpcUVzS2prbHRtZjN3Wm5JTHlG?=
 =?utf-8?B?VXVTYTZjbFpLeXpOQWpQVkFoWjJrRjA4K2NuMnNWNURvMWplcko1K1Z4dkZq?=
 =?utf-8?B?OG1pUUZSWS84MDMySXRCY0Vpbi9oQnBHaktYbUhsK1ZIMjRKLyt2WU9DS0lX?=
 =?utf-8?B?c2lOc2hySUV1clhvOHJBc2JvbHd3c1pmQ0poK2J2L29RMnYxTUVHdnMvRkZm?=
 =?utf-8?B?UHpRVy9UTFFTa1NlUGRGaTVrbitEelVZUXQ0SHlnbElBU0dBU0t3eS9BSW1O?=
 =?utf-8?Q?h6t45UUwpS+xfejsKndnfAZQUPifA4ihZ2hjm+v?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Yng5WEFJR1UyYTdzTzkvWE1JQVhUUGVqbTRaR2IzZVltbGdCbzRqRTBNRWJN?=
 =?utf-8?B?V08rLzNNSU5QMmFhbU0wRXBzSm5PRU9FamRFRUtXd095YU8waS9xYUFSV2lY?=
 =?utf-8?B?Um8zclpDYWFnend3ZGFET2pQZEFsTGxMdENNRmxRRFRBTGNNZmZpbVdUUm1a?=
 =?utf-8?B?NkRjTlBaVm1nbENiVCt4SFFIVFBnUzZLVW1BM0pQWStHRCtSbmRYcGs4Mk9O?=
 =?utf-8?B?Qm1LSm9iRXJSdTR4aFJtWUtkRGFFbjhjOHBZZjJzRjE3dk1UOHhObFp6aTlo?=
 =?utf-8?B?UlBuZXZqU1VMeDdqRFk2VklTTWsrcDJ0b0EyaCtnc0phbmZlTzlIaXFVVVBu?=
 =?utf-8?B?REVYMTk1SlBpOUtiZzlTcjZCbmdtZmwxRGpLRWtOcW9YeUFuWlBrMXY3cG9R?=
 =?utf-8?B?N2dKcTY3ZTY4WFFQL3NjWlJrRGNEekFoN05PMjA0aWdHZGIvNjdlRUYwUUc2?=
 =?utf-8?B?Z2Z1bU8yN0lyMHh6ekVOdjlsZjdtSXRHVW43T1FvR00rMi8yekoyeHE0ZW5w?=
 =?utf-8?B?ZG9tbnFXOGt6eURLQ0tKQXcwVGZLdXZzN1FIK1BYUVVnbURBckdyZEZFZFBV?=
 =?utf-8?B?aFZCdVEvMUlJdHdQU3ZxMFdmK1dwc3NtYndKdm80WmVtVXUzTTdSVTNRbGdN?=
 =?utf-8?B?NDdwaFpMS1owVUZjL0ZpT0JqTU1SU2xTN0dLcFVzNDJNRERuQUlHSVJnMHpa?=
 =?utf-8?B?TTBwNjZvVU0rT1RMaEUxZWdNYzRVMnR6UFo2emQ0dUc1OC82aHJLQlNrbFU3?=
 =?utf-8?B?YmZvZWd2UTBpYXNuNWc1RkFZYnppRmFlay9UOTd5UHlRTk1RTG5kaUdFdUta?=
 =?utf-8?B?YXE5eHEzRU9OWDcvWnp2YUQ2Vkl6YWpXd2dENnF2NVNzRnVHWG56dEhNWFk1?=
 =?utf-8?B?bnRibnNnUi9TaldsUVNVclNDVUN4c0lMMDRrWFpzc2RuaGdpTXRmM3hJaVBy?=
 =?utf-8?B?OHpnZjI5dFB0dEtZbXpTNTEyYTlLbHRsMzFkYUdTZXcwWlI0YjB0UlE1OHJX?=
 =?utf-8?B?aU1sRHpKNDY0RGIrRWhiSDNWMEU3TnNGRnNDRnRMYW9GVitVM0xYQ2ZQcW8z?=
 =?utf-8?B?NXliODB6bEhOeEErV0ZiU0xaYi90czlEcTduY3Z1b2VTditGU2JtNWdwTkZo?=
 =?utf-8?B?N3R2SDN6VGx6WURPR0JsUFNOVWNJZ3ExeEZxc2lUTDlHZ3VtVkpuajh4dFo1?=
 =?utf-8?B?OUo0QWtxNy9hT05QT0tzTTVXR1hwS0UrM3BucHdiMkFKQVlXc0k1TnNnWDJy?=
 =?utf-8?B?VWkwaFBOMEtidjVjOWpFd3B0NXd1TVlmaHJjQjQ5K2NSeWJaWnBWdHFVbUFJ?=
 =?utf-8?B?QWs5cVZRbWhhVGRCT3dTR0pSYzhSNlhma2p3R0hpK0pNeGZJdzR2Q3pFOXlG?=
 =?utf-8?B?dzJxdEhIU2dYOEp3NjZiakdpcTBxM29PbWFRNmtPc0dRdDZUdTQ3ei9DOHNS?=
 =?utf-8?B?ZzBaMmhTcWZpYUV6aVgydEZOb3NZK0JSMVdmQXBRamZSalZ6cmcyOFZYRFV0?=
 =?utf-8?B?REg3UnJOT3dPZ0xCT1ZKaXJMNmtna1F4bTE1b2h2aU9aWkhOUHA3Zzh2cTEr?=
 =?utf-8?B?TWc1QlVpc04rV3JHaGtrWW53RS82eldvNmRSbEZYM1I3b29wRHVlaC9pM1Rn?=
 =?utf-8?B?eXAxY0o4eUZGWXhTeEdJM0s4cENSWXBWZHVvK3F6aXlUK1I5N20yMUY3R1hB?=
 =?utf-8?B?ZjUreVNGK0hBRWwzMzQyNTZsVVF4Q1ZocHpSY290anJIOXRYTGNjWTRMYi92?=
 =?utf-8?B?d25ydi93bUZlWmI5UFJUdUQ4UWRTOWFvd1BaZVZjWThnb3RsTEs0SDhUNTBW?=
 =?utf-8?B?U0hDS1JWdUlUT0dUb3F6QTRoMTlaM2NYZ1IxR1NhNlZwelRDZTk5dG1RQjZY?=
 =?utf-8?B?akY4Z29rSUVBakh1ZHlnem8wSk9QYkJMd3Y5STI0aytKcjQ5b2xPaC9kWjNi?=
 =?utf-8?B?MVVneENBMHhRdjFMZDNYNzdsYkpuQk5MSUFmNGNhZUlNUGIyU0JJVjBLNk5W?=
 =?utf-8?B?OGlkME1kejVHaDZpem1ERmVHSVlvZGtjaGhWUlJnQlMwZ2tqd0ZjK01FVUF1?=
 =?utf-8?B?TTNxdFhjc1UxZS92K21ldkg2TTFMaDdGK21laVQ0Ly9lUmx6cmZ3aXY3elY0?=
 =?utf-8?B?dVRwQ3ZHTFdQOEY2VTBvbG1PbEtjaGl3YXIzanQveFJGRHlkN0E4REpTcmRj?=
 =?utf-8?B?OC9aT3Q0V3gzRDlVVDZpU1dYMUQ5eHNheU1LSW10aUs2TXVxS1NlKzh3dHJH?=
 =?utf-8?B?NUVDR0drMjAxWEp2Ymx6NTdiM3VBPT0=?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de5bf7f-beb3-4aa7-4563-08dcf5f7c263
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 19:52:46.3746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAj6lN57wvUwMTAVoeI9UFVRxyscgWIDfPLp5Mixe8aiwlEK2tvDiXVdpWIxJUb5PG6PDowXOtFLMX98RR6GmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7654

Hi Umang,

Thanks for the patch, this feature sounds promising.

On 10/22/24 8:31 AM, Umang Jain wrote:
> Currently, vertex maps cannot be updated dynamically while dw100
> is streaming. This patch enables the support to update the vertex
> map dynamically at runtime.
> 
> To support this functionality, we need to allocate and track two
> sets of DMA-allocated vertex maps, one for the currently applied map
> and another for the updated (pending) map. Before the start of next
> frame, if a new user-supplied vertex map is available, the hardware
> mapping is changed to use new vertex map, thus enabling the user to
> update the vertex map at runtime.
> 
> We should ensure no race occurs when the vertex map is updated multiple
> times when a frame is processing. Hence, vertex map is never updated to
> the applied vertex map index in .s_ctrl(). It is always updated on the
> pending vertex map slot, with `maps_mutex` lock held. `maps_mutex` lock
> is also held when the pending vertex map is applied to the hardware in
> dw100_start().
> 
> Ability to update the vertex map at runtime, enables abritrary rotation
> and digital zoom features for the input frames, through the dw100
> hardware.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   drivers/media/platform/nxp/dw100/dw100.c | 73 ++++++++++++++++++------
>   1 file changed, 56 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 54ebf59df682..42712ccff754 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -83,6 +83,11 @@ struct dw100_q_data {
>   	struct v4l2_rect		crop;
>   };
>   
> +struct dw100_map {
> +	unsigned int *map;
> +	dma_addr_t map_dma;
> +};
> +
>   struct dw100_ctx {
>   	struct v4l2_fh			fh;
>   	struct dw100_device		*dw_dev;
> @@ -92,12 +97,14 @@ struct dw100_ctx {
>   	struct mutex			vq_mutex;
>   
>   	/* Look Up Table for pixel remapping */
> -	unsigned int			*map;
> -	dma_addr_t			map_dma;
> +	struct dw100_map		maps[2];
> +	unsigned int			applied_map_id;
>   	size_t				map_size;
>   	unsigned int			map_width;
>   	unsigned int			map_height;
>   	bool				user_map_is_set;
> +	bool				user_map_is_updated;
> +	struct mutex			maps_mutex;
>   
>   	/* Source and destination queue data */
>   	struct dw100_q_data		q_data[2];
> @@ -308,24 +315,31 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
>   {
>   	u32 *user_map;
>   
> -	if (ctx->map)
> -		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
> -				  ctx->map, ctx->map_dma);
> +	for (unsigned int i = 0; i < 2; i++) {
> +		if (ctx->maps[i].map)
> +			dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
> +					  ctx->maps[i].map, ctx->maps[i].map_dma);
>   
> -	ctx->map = dma_alloc_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
> -				      &ctx->map_dma, GFP_KERNEL);
> +		ctx->maps[i].map = dma_alloc_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
> +						      &ctx->maps[i].map_dma, GFP_KERNEL);
>   
> -	if (!ctx->map)
> -		return -ENOMEM;
> +		if (!ctx->maps[i].map)
> +			return -ENOMEM;
> +	}
>   
>   	user_map = dw100_get_user_map(ctx);
> -	memcpy(ctx->map, user_map, ctx->map_size);
> +
> +	mutex_lock(&ctx->maps_mutex);
> +	ctx->applied_map_id = 0;
> +	memcpy(ctx->maps[ctx->applied_map_id].map, user_map, ctx->map_size);
> +	mutex_unlock(&ctx->maps_mutex);
>   
>   	dev_dbg(&ctx->dw_dev->pdev->dev,
>   		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
>   		ctx->map_width, ctx->map_height,
>   		ctx->user_map_is_set ? "user" : "identity",
> -		&ctx->map_dma, ctx->map,
> +		&ctx->maps[ctx->applied_map_id].map_dma,
> +		ctx->maps[ctx->applied_map_id].map,
>   		ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width,
>   		ctx->q_data[DW100_QUEUE_DST].pix_fmt.height,
>   		ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width,
> @@ -336,10 +350,12 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
>   
>   static void dw100_destroy_mapping(struct dw100_ctx *ctx)
>   {
> -	if (ctx->map) {
> -		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
> -				  ctx->map, ctx->map_dma);
> -		ctx->map = NULL;
> +	for (unsigned int i = 0; i < 2; i++) {
> +		if (ctx->maps[i].map)
> +			dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
> +					  ctx->maps[i].map, ctx->maps[i].map_dma);
> +
> +		ctx->maps[i].map = NULL;
>   	}
>   }
>   
> @@ -350,6 +366,15 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
>   
>   	switch (ctrl->id) {
>   	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
> +		u32 *user_map = ctrl->p_new.p_u32;
A warning to fix here.
> +		unsigned int id;
> +
> +		mutex_lock(&ctx->maps_mutex);
> +		id = ctx->applied_map_id ? 0 : 1;
> +		memcpy(ctx->maps[id].map, user_map, ctx->map_size);
> +		ctx->user_map_is_updated = true;
If you call the control before to start the stream, the dma mapping is 
not yet done(dw100_create_mapping not yet called). Hence, copying the 
user map to a NULL pointer.
> +		mutex_unlock(&ctx->maps_mutex);
> +
>   		ctx->user_map_is_set = true;
>   		break;
>   	}
> @@ -655,6 +680,8 @@ static int dw100_open(struct file *file)
>   
>   	v4l2_fh_add(&ctx->fh);
>   
> +	mutex_init(&ctx->maps_mutex);
> +
>   	return 0;
>   
>   err:
> @@ -675,6 +702,7 @@ static int dw100_release(struct file *file)
>   	v4l2_ctrl_handler_free(&ctx->hdl);
>   	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>   	mutex_destroy(&ctx->vq_mutex);
> +	mutex_destroy(&ctx->maps_mutex);
>   	kfree(ctx);
>   
>   	return 0;
> @@ -1453,8 +1481,19 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>   	dw100_hw_set_destination(dw_dev, &ctx->q_data[DW100_QUEUE_DST],
>   				 ctx->q_data[DW100_QUEUE_SRC].fmt,
>   				 &out_vb->vb2_buf);
> -	dw100_hw_set_mapping(dw_dev, ctx->map_dma,
> -			     ctx->map_width, ctx->map_height);
> +
> +
> +	mutex_lock(&ctx->maps_mutex);
> +	if (ctx->user_map_is_updated) {
The hardware register must unconditionally be updated while starting a 
new context, as a v4l2 m2m supports multi context operations. Otherwise, 
you may be running with the user mapping used by the previous context.

Moreover, the hardware mapping will not be set in case you use the 
driver as a simple scaler without user mapping, which causes the process 
to hang as the run does not start and never completes.
> +		unsigned int id = ctx->applied_map_id ? 0 : 1;
> +
> +		dw100_hw_set_mapping(dw_dev, ctx->maps[id].map_dma,
> +				     ctx->map_width, ctx->map_height);
> +		ctx->applied_map_id = id;
> +		ctx->user_map_is_updated = false;
> +	}
> +	mutex_unlock(&ctx->maps_mutex);
> +
>   	dw100_hw_enable_irq(dw_dev);
>   	dw100_hw_dewarp_start(dw_dev);
>   

It sounds as this patch requires a collaborative application for running 
well. All my simple tests failed.

You can test a simple scaler/pixfmt conversion operation with v4l2 utils:


v4l2-ctl \
-d 0 \
--set-fmt-video-out width=640,height=480,pixelformat=NV12,field=none \
--set-fmt-video width=640,height=480,pixelformat=NV21,field=none \
--stream-out-pattern 3 \
--set-selection-output\ 
target=crop,top=0,left=0,width=640,height=480,flags= \
--stream-count 100 \
--stream-mmap \
--stream-out-mmap

Xavier

