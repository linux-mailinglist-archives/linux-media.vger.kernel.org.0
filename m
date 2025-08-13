Return-Path: <linux-media+bounces-39808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB00B248BA
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 551D03B569A
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9A72F069C;
	Wed, 13 Aug 2025 11:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="QYYfgYCY"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020122.outbound.protection.outlook.com [52.101.69.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0BE2D9EF5
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085547; cv=fail; b=F0gNpE0mCidXJaFxqE9S9pAZ4qNSXBCfiq3n2ROOxz5QmYLMi1g25J7Y8P7+Z7n2Jv/gTl4z58NGQKdMEhWmpVCM8xlT7wtA0tq9HILobjxqrt1VGij5CPoPTjcMq18lNL+LtMjq95lbWP5QI1IUAXpY4PtDQVk5I9r1aeVavx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085547; c=relaxed/simple;
	bh=TKWUfICYUhtP2cVeZt3ELZc/Civf/5YAPNmmJ56bIRM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dFr1jWBXKMmGt8CkaOOh3MpPqmTpU1PG5+yJAfuLwPy5gGn5vMHEqbISRHkhgs12AIXilb14zqPCxcU3wf3NT8s20Vfpx+Fy1RggdKe8QoZXdt0wcusPPP2z/d06jbQl6QXD52S5df4uk0YFH9pF4aJWRTUBluHZiBPo/6+hmlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=QYYfgYCY; arc=fail smtp.client-ip=52.101.69.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unaxqcTA/KjRKM61wcbsp2BY4Vk8o4lq9U1R1dISUiNC7UvDujtsUkITkpeT2o09YqJO3oCEtOwKZVPtN4v+MKHeym3/+Vho0qFuIBsQ30IcdT1fYt+iSXnoqPSFRh7+uZyyR1/Z4HR9p220HzKPxE9i53IXhJaUTy4eaSWzgCvT6wfeq3+OCSkpsBwonI17ctz4sYcIQ9xMR7saDwRdLXGB68QP4eUePdIVk1oD9hB6t/JlTzcxRKjuNp+psh7PLUnXzncq7RICCcJVIq+sdjtycpJoCBK9gQQiDapjWffTZ3QKhMwNByWRcBpEwxnGFovNhmni2pwQiJo6XieJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mpX/iIFQCaaLStWMeYLqer43LpGi+9e9ZjgOqDpZtA=;
 b=xxnyEZKcoRcUJPnU4c5XRlAAkriPmNSxH5+wk3YQyyTyxfIJQ4XKfugQUuhz4svw7WDHtYT8yWKAaPJUbn6as9t10uqDBy4rAklbkmyn1tJj/4CNnBHUycNdT7jPppqztxbB9N+UfZucNMGWYYISJy8zmd22YcGithDJ3OT6XirDcAPyZsB4gLqlN17s7Q6rL6hEsuXC1EEOak/63gghPbUixZGr1UTM6HA6+zsGYtEdJkSb42sYLWVUURGwZDK/+Bnz7+xWE9e6EbwDITUDlPwCg1PCNZ/n3N5a/uhyDFGe/iMejm7oXvJFAQxbn6dYMMRK5/6FT8BYw9qwnnbzMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mpX/iIFQCaaLStWMeYLqer43LpGi+9e9ZjgOqDpZtA=;
 b=QYYfgYCYKJVWsME+NTipvF0QR1xJ6hKE/Lf3Mlkr7vBLhBUKug0XHh+nF1vmHRQG7QtfXq+JiigG7LEm5KhhFv2vll+Up7rnTnq7YMHDhq5La6tw4K3LiAuODaQFZX0+39RnYjXucoRhptIpmQFOoMZsOWYFChvMD7UATi9sRNVzmhM6TGZaM17h6Eqv7Rx5bg1Ahgh+CJEQEVzAxqk9sbB2sVOIvZpiFog2SSbM2nsC29yV2Y9bz+X2383lCAf2KU4qfC6xom34OMjpt+ckKQCJV8GWf7E5zGV4euSxsm1pL48x9Vu+ye+TpfmONzdTFYuyB3Dav8s7xSxBNxqMrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DBBPR04MB8041.eurprd04.prod.outlook.com (2603:10a6:10:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 11:45:41 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 11:45:41 +0000
Message-ID: <cd44c529-9c39-40c5-9fb7-07b36ab4c616@gocontroll.com>
Date: Wed, 13 Aug 2025 13:45:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Panic when trying to capture camera with ffmpeg on imx8mp
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Fabio Estevam <festevam@gmail.com>, Tim Harvey <tharvey@gateworks.com>,
 mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-media@vger.kernel.org, imx@lists.linux.dev
References: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
 <CAOMZO5C3o+UaLRaXfB+sfmgB801mNTLztE_cy-e5duKDAL-1Hg@mail.gmail.com>
 <8d4d8d75-fe89-4c6f-b8af-2f90d7e370e9@gocontroll.com>
 <20250813113558.GH6440@pendragon.ideasonboard.com>
 <20250813114153.GA20174@pendragon.ideasonboard.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250813114153.GA20174@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0033.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::13) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|DBBPR04MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf2c90d-7eca-4a26-e3e4-08ddda5eedf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3NoUDZqYVUzNEE5bXJVclB3bTNRK3YrZWNBaXVjc0ZqQ2RVS3FtbGFLMExj?=
 =?utf-8?B?UWF0VVJwcnJsWWhyMkNVWWxmaE5meG4rT0MrQUg1UGtkWk5rTG82QmNyMkpS?=
 =?utf-8?B?TmxobnkvYUNodW9heFNFaFhrNjRaS3dEcUxHa2dnekR1aUE5VkxKUGYrblp0?=
 =?utf-8?B?MmdJWTFjTmRST2JZYXR5aHphS09QRDVTcldPbCsrdXNlUTNNQmFaaStrYTg5?=
 =?utf-8?B?R2F5TmMvRHVvMkJqcEh3S3VjVDJiUVlhZWZDdVo1cGw4WktjWkRjSk0xQmMy?=
 =?utf-8?B?TjlFYUR0QWM3NzZOd2FsTm9tVE95SGZJWTZjSWQyeE9MMVJUSm5mNnJBb1dU?=
 =?utf-8?B?T0duN01RYnB2R1ZpK0dXVHZsTjEvTjkxMUQwbE84TXBpT2RqaW1BK2J1Y2VR?=
 =?utf-8?B?SUVBOWpJVk5JOGc0OXV3elZlWWlTTERIODFIbWhjR2JvUjk4RFhwNUx3ZWdV?=
 =?utf-8?B?aWdIQ3JBNzJIMFd4MnVnVG02allFYnlrdnl0S0Nyb004aVZRdndBTlJnODkv?=
 =?utf-8?B?VjRTYlJ3NGdtNXhhWVk2Mno0Q2F2MFJTZi92L1FZcUhLOXVsVjhQSE93QWlR?=
 =?utf-8?B?bnFDRlpzRmk5eDRtN2tVaGR5ME1jeFVUSEVCUXZtTTVidDB1R0VXUEZBdFl3?=
 =?utf-8?B?WUc3K1ZHRFhlK0pwNEZsU2tvbnJ1T05GalVmaXR6VHR2Nk1SOUFrcXZLYVB6?=
 =?utf-8?B?TWVmcmZsUTNqRndWY0pHWjhnQm1Kb0ZlVWxzL3dSMUlaaG5UcTNjZVBmNnZQ?=
 =?utf-8?B?dzBEL3FMNkJVb3BUZTVLSTJLZkpDS2RZNFUvbUVyMVpTa0ZHNHA5RFc1SCta?=
 =?utf-8?B?K1BaeWI5b00wM2xxZ21INm5yZGtpTHNiWlJ5dEJCbEdQa245VE9TaGwvbENz?=
 =?utf-8?B?QkhSaUhkdGJkZUlUQmdsaUtRRWxzZzRjcG80a0FvWUNYL0ttc2VBNStKdTEv?=
 =?utf-8?B?dWdPTHRxRVMyWUtvbDZJc2J1RmduNmdFcklwZXVsOHFZVUFUcS9hdEc0Yzdk?=
 =?utf-8?B?MFkvNFhWRW41SDJwZGo0UEZYREFqaENqaE9MUm5OVzJtRm13TGN0RitJTjFv?=
 =?utf-8?B?eGg2SW5COXR1ZEIwOVowRkNBL3NyRHJEVWpXUnp2OS9uVk9mZ3RFK0lHczIy?=
 =?utf-8?B?OXNmdERleGFsdnNWQmg3WU1xVjhiUUdOeWMvLy9UajRvZmVQTEd5R0pxUUNO?=
 =?utf-8?B?R3JUaXNwdjFheHF0QXJqdzh0RWdjQlRTY0x0TnRpdXZGYjJkcU85ZzBzcy83?=
 =?utf-8?B?S0NEY2g4Zzcrejlyb0d5NVlEVnhZOVhFZXd1WGJVNDFpUHo4R2pYaGVlMEll?=
 =?utf-8?B?MTRvdGdnRzl3cmhpZXg4ZTBrR0JEbWdDbEhGYWNQc0NrYXR5TlhLM2NjQ01X?=
 =?utf-8?B?cERQSWs5bzZJUGdmWnI0akQrTXFDU2l4ajk4WGxwMjRmc29MS01TSTVrcmFO?=
 =?utf-8?B?Q2NjWHV3Rm8xQUVSYjlrVzJncVhmaDloL3FjUjdydnBnN01hZmFHWmZKbkFD?=
 =?utf-8?B?Y0liQmd3bi9SNndsSGJmVkJOQWlOTzU2VlpjMXFjUlZsQWhYWUw2VFVPajJS?=
 =?utf-8?B?c2tkQ25UdjNoQUUvckJPRFJDUE1IS3M5amc4ZVRVTWpuVmpQUFBlcHhVM2th?=
 =?utf-8?B?bnZRVWczbE1VWUY5NWFYeE1JdmVlckMvNVFWdm9RNmV2L2lNUzlhWmd1VlY5?=
 =?utf-8?B?T2xZSnpCb2lkTmRiZHBINjRHSkY5eSsvQUt0WVE3akZMN3BjREh5dFpXeDBj?=
 =?utf-8?B?RWI4WDYyc2t6VEFYT0k5dCtvWi9DWUFFMVVDQzE2OGppRWM0V3ZmeCtUcUtl?=
 =?utf-8?Q?TcL9oL6w4mrM0pgs8ET988sGhqnHJE0RKCCfw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzI1Szg3UnFqeGZLTWRRZFQwZitHSW1maHV2NXlzZ2djb292LytaZWRUemhB?=
 =?utf-8?B?TUtIV09jallIY0dqU3FaSmV3OCtlMjE0MzVRQmhMbW1aWGVuZ0V3VlBOZUlG?=
 =?utf-8?B?NFJlekxGdWNnaXdIdHlUaWFNTVVwVEVHbzAvZE1PemVjVWxLcmZoVXFaZTFE?=
 =?utf-8?B?R0ZTcktZNXBkdFNCYXp6Q2w5bCt4TEVmbUhsN1dhZUxmamVvUitYd2RyQU1k?=
 =?utf-8?B?a0hsN3M2U1o5a2dBZGo5elVQOWhCRko2aXRGRHY1NlZ0aWE3OFNUa0JXL1Nh?=
 =?utf-8?B?amRxbXV0SkI3TTBaWTUxakxVTjd1VTFodHp0d09weTRZTEtGWjFQa1dxN2tO?=
 =?utf-8?B?MU0rcWcrN0JoRi9oUXhkWHNOS1QzOThwM2p4Mm0wVnRCWVNIRWVOU1hIUDlx?=
 =?utf-8?B?bkpFTDZzUVFXc3VhUmVMVlk0RWlaN29lS2tsQm4xSk4rMkRSL1R6YlhDVWVx?=
 =?utf-8?B?K0lmTmtMMXJmUVZxT2MyaWE4T1d1cnpFaFh6a3NqbE5qMi9EUUZBR0JHY3Bp?=
 =?utf-8?B?c3g3S3JsMFhFeHR3WEN6VjhYeFV6bnNoNmE1bE41clVlcTBmS3RaQU9Ubm04?=
 =?utf-8?B?ZnFtV1ZraTEyYTMzbGl2dXROeVBhOW54NWRqUWR5anR5bDJjTnROZzBodUFH?=
 =?utf-8?B?U3A0WCtZM0tsaStUMU1MTGpBWTdwbnBkd0VwZVNzMU1aY29seXcxYm0yNHZq?=
 =?utf-8?B?a2FtV2UvRElCM0tmQUxGSThRZzlkUG9RcGxqejVlR3lpdFpDbWZRZ0FmWmNB?=
 =?utf-8?B?NzE1MXd1YTk5U0NSSmVveDkxUHFUS3hRLzBVaG8wOHNXN05zN3JvRnBkOGtm?=
 =?utf-8?B?ZDd2a3dmNHpUc3R0QXV4cnpMYnlUQ2wzUEZVTUhrNi9Rb0dRbktEN1pIa3Fn?=
 =?utf-8?B?OTY4dytwckNTM0gwLzk3NUUvTzEwekJ0Zk9rL2k0L0xVdnRlUGNpM1ROMFpo?=
 =?utf-8?B?NzdHbVRjNzhtQXhQREo0TWlEbkVUNFREQkRyenBzM0NJenk4blAzbGk4UXdw?=
 =?utf-8?B?Q3R5aUtFUExUenM5TmtsRUY2WFlPdHBOeHBxQzJ5aDl3ek91SHZVMUE1WXp0?=
 =?utf-8?B?SXR6bG1sc2ZHTG9JZ3piV3FzZWNTaEQ5blgxaVFOQktxNHF3Y3o3YmhsU0lQ?=
 =?utf-8?B?QmJneEhzSG5rMDhDQUROZ0ZHWFZnM0RsMnE4ak9Vc3ZzanJlSXY4UHRXbXJR?=
 =?utf-8?B?a0ViYlZNRzV1cTVmalJZUVpIUEp1eE5rNVNJV3o4RE4zR2VjNC9QWlFLdTV5?=
 =?utf-8?B?YVBtRUR0VDdwaGkwbGVEak5qNCtNSGNkUjdhYzcvcjRFYXR1SytLRGI4dU9n?=
 =?utf-8?B?Nk9oby9sV1A5b1hPYit0dkhVRnF1dXZUamNKWGtkTlY5Z3RPVUUyb2FKYkZM?=
 =?utf-8?B?UFEyUExOaEo1SmFzZk4reWJnZGU2OFZ5QWYrMmFKZlBCSzBTSkdnVTVzWXVK?=
 =?utf-8?B?eG8wTDluYWNTZmx6RFRvM05FMWpzL2RjcVlTTkFFTmNzbDNIcFE0VHMreGlF?=
 =?utf-8?B?OTFoT1VpaVVBWko0RXV3MG96YVNUMlJQY3N1VndieVJHTXgyQ1RtZnozVEV0?=
 =?utf-8?B?ZTY1TEJzdUNUaFdSdWZSVE1IS1drT2F3ZW1wT3pWQ2FCM2lFc0U4L29ad0t2?=
 =?utf-8?B?ZXhScHM3V3NGdVRZcGx6cTErbHVSVDJKaWxGelF3a2NZZGtpbXVzdDlCYU9X?=
 =?utf-8?B?aXg3SVNENG43amV4NXFKd21rQ0U4Wmh0REZ6R3NlUU1jK3N3RlNmMWMyZEtv?=
 =?utf-8?B?Ym5ESVluNU8rNkNhb0puSFFOelg3cTJpV0pQazZ2aGVCWkhwbmw2aHZmTElS?=
 =?utf-8?B?aTNsdWRWQkdjUzFtRE5lT2M2RGNNMkE2Vm1BZVppc3ZPUzV6QlNTakNPQm1t?=
 =?utf-8?B?aFpSZW5ZZnhwaU5xRCtIYnd0UWRidEZpMlFma0hYaHI1dU9qazJRRUVjSHFP?=
 =?utf-8?B?bVdLelQxaWovb3ZYaHI2c080WFVHSFRwTXg2dXpTdTlwdzV5Z01uOWE1Vkcv?=
 =?utf-8?B?dmNjK0lva0g0Y2NsTHhnemtDR0k5Y1dFVjJiTmN5RG53bEwxYXJPVGY0ejFo?=
 =?utf-8?B?SWp4Y1JweEFFbk5oWVN2WE0vTzdicGZUZDVxTkhESFhMZlVMUC9VVzQrbFdt?=
 =?utf-8?B?dlh1SGRwZzk5d080SFpSTS9zaGJHWDVLcVRQQmhpemdSV2x3SncranUxSEM2?=
 =?utf-8?B?Y0M3NDF4RTFlSkpxOHBFVmFNeVlxNkQycnBKL3hIV2xTNm5COUZuTkZsT2hn?=
 =?utf-8?B?dnc5WVZybXVBT1BHRlg4d1oxM29RPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf2c90d-7eca-4a26-e3e4-08ddda5eedf2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:45:41.1725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /79YG0gci7+dI+OJOk99VJm3+6LSdzhTwR4almOMR6ogrgBSWdssjyt/objCDSX0QrrOmKSvQaQjh25utt85vA2Lfj37m7f1vl8Vj35r0vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8041

On 8/13/25 13:41, Laurent Pinchart wrote:
> On Wed, Aug 13, 2025 at 02:36:01PM +0300, Laurent Pinchart wrote:
>> On Wed, Aug 13, 2025 at 01:31:34PM +0200, Maud Spierings wrote:
>>> On 8/13/25 13:23, Fabio Estevam wrote:
>>>> Hi Maud,
>>>>
>>>> [Adding Tim]
>>>>
>>>> On Wed, Aug 13, 2025 at 8:12 AM Maud Spierings wrote:
>>>>
>>>>> My devicetree setup is practically identical to the one in
>>>>> freescale/imx8mp-venice-gw74xx-imx219.dtso (different i2c bus and
>>>>> regulator gpio only)
>>>>
>>>> You'll need to configure the camera pipeline using media-ctl commands.
>>>>
>>>> Take a look at:
>>>> https://trac.gateworks.com/wiki/venice/multimedia#MediaControllerPipeline
>>>
>>> I have been messing around with that, but it still shouldn't panic right?
>>
>> It shouldn't panic, no. That's a bug in the driver.
>>
>>> It seems to be happen in:
>>> sd = media_entity_to_v4l2_subdev(pad->entity);
>>>
>>> in mxc_isi_crossbar_xlate_streams()
>>>
>>> Checking now if the pad variable is the issue
>>>
>>> it seems media_pad_remote_pad_first() can return NULL which would cause
>>> the issue there I think.
> 
> Can you share the media graph as output by `media-ctl -p -d /dev/media0`
> just before running ffmpeg ? You may need to replace media0 with the
> device corresponding to the ISI if you have multiple media devices in
> the system.

media-ctl -p -d 1
Media controller API version 6.12.41

Media device information
------------------------
driver          mxc-isi
model           FSL Capture Media Device
serial
bus info        platform:32e00000.isi
hw revision     0x0
driver version  6.12.41

Device topology
- entity 1: crossbar (5 pads, 4 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev0
         pad0: SINK,MUST_CONNECT
                 [stream:0 fmt:UYVY8_1X16/1920x1080 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
                 <- "csis-32e40000.csi":1 [ENABLED,IMMUTABLE]
         pad1: SINK,MUST_CONNECT
                 [stream:0 fmt:UYVY8_1X16/1920x1080 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
         pad2: SINK,MUST_CONNECT
                 <- "mxc_isi.output":0 [ENABLED,IMMUTABLE]
         pad3: SOURCE
                 [stream:0 fmt:UYVY8_1X16/1920x1080 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
                 -> "mxc_isi.0":0 [ENABLED,IMMUTABLE]
         pad4: SOURCE
                 [stream:0 fmt:UYVY8_1X16/1920x1080 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
                 -> "mxc_isi.1":0 [ENABLED,IMMUTABLE]

- entity 7: mxc_isi.0 (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
         pad0: SINK
                 [stream:0 fmt:UYVY8_1X16/1920x1080 field:none 
colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
                  compose.bounds:(0,0)/1920x1080
                  compose:(0,0)/1920x1080]
                 <- "crossbar":3 [ENABLED,IMMUTABLE]
         pad1: SOURCE
                 [stream:0 fmt:YUV8_1X24/1920x1080 field:none 
colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
                  crop.bounds:(0,0)/1920x1080
                  crop:(0,0)/1920x1080]
                 -> "mxc_isi.0.capture":0 [ENABLED,IMMUTABLE]

- entity 10: mxc_isi.0.capture (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video1
         pad0: SINK
                 <- "mxc_isi.0":1 [ENABLED,IMMUTABLE]

- entity 18: mxc_isi.1 (2 pads, 2 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev2
         pad0: SINK
                 [stream:0 fmt:UYVY8_1X16/1920x1080 field:none 
colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
                  compose.bounds:(0,0)/1920x1080
                  compose:(0,0)/1920x1080]
                 <- "crossbar":4 [ENABLED,IMMUTABLE]
         pad1: SOURCE
                 [stream:0 fmt:YUV8_1X24/1920x1080 field:none 
colorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range
                  crop.bounds:(0,0)/1920x1080
                  crop:(0,0)/1920x1080]
                 -> "mxc_isi.1.capture":0 [ENABLED,IMMUTABLE]

- entity 21: mxc_isi.1.capture (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video2
         pad0: SINK
                 <- "mxc_isi.1":1 [ENABLED,IMMUTABLE]

- entity 29: mxc_isi.output (1 pad, 1 link)
              type Node subtype V4L flags 0
         pad0: SOURCE
                 -> "crossbar":2 [ENABLED,IMMUTABLE]

- entity 36: csis-32e40000.csi (2 pads, 2 links, 0 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev3
         pad0: SINK,MUST_CONNECT
                 [stream:0 fmt:UYVY8_1X16/640x480 field:none 
colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                 <- "imx219 5-0010":0 []
         pad1: SOURCE,MUST_CONNECT
                 [stream:0 fmt:UYVY8_1X16/640x480 field:none 
colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                 -> "crossbar":0 [ENABLED,IMMUTABLE]

- entity 41: imx219 5-0010 (1 pad, 1 link, 0 routes)
              type V4L2 subdev subtype Sensor flags 0
              device node name /dev/v4l-subdev4
         pad0: SOURCE
                 [stream:0 fmt:SRGGB10_1X10/3280x2464 field:none 
colorspace:raw xfer:none ycbcr:601 quantization:full-range
                  crop.bounds:(8,8)/3280x2464
                  crop:(8,8)/3280x2464]
                 -> "csis-32e40000.csi":0 []

media0 seems to be dw100, 2 and 3 are hantro-vpu

