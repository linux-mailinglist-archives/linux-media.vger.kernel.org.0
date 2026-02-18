Return-Path: <linux-media+bounces-53047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCqmHfqrlWkbTgIAu9opvQ
	(envelope-from <linux-media+bounces-53047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 13:09:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E003815639B
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 13:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 232A4301D4DF
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507E43074AB;
	Wed, 18 Feb 2026 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MbV2km0O"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6164A3033EB;
	Wed, 18 Feb 2026 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771416559; cv=fail; b=mtfUSSzKQTQ6KhKm6ts7Ox/Cw301sIczeC2nOQ/rHAguk4bmwz5ZNfZ4qU/BVEiEERcMwyZdQ+cGE34nKzOHnAofETmARZSfRyBkNCOxDSbW9PhcKGlEtGcK40e2iQFlCeJ429XiGhibeI6EPIhwwwf9B44hoV/4Udqvh6YbzsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771416559; c=relaxed/simple;
	bh=GpxJBbVdefZCz2dBe7OMY3hLsMrwJC2VHR3natCRya8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H2ibmZUe3mE4kmvgZ8yjw6HvZxLhe3g0jkhc+3Yzcmob3ldmGHOa1UmYSh9oqvaCsU6TDripzMFm0KdwSpqKfFcLf/7xXgXP6vQL6YAQJYQSSuHCH50V2I4vdQqZJ2ba7U2vMTfdzdNQcSIt5Pu3naJh058AQFNTYzO3b4bWgoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MbV2km0O; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csUR7QbJz1GP0vJh+p5gkift8VSR/Y7Zs76tQ5lPef4H+98kPhbpaWxYwQ+oIMpRkrmsmh0eBvQMq00Hkokk6v67wDQ6Yo7ojGK2EDWQp6n3GIB169Jds2P3qJ8bnlpjzCnnaE3B8KHWrhORcsnRra2EhTuyfmrbJlhKLYTOkrCrZkpPmZpxr8v8HJaX2zk9bx7mR9tIxR2ZVFoc8KmH29xoe1ZTPlXJ4YH0XyEpPLP7JEkz46d7SLXMfRuiu0Z189kugLUffXYPWn6WC55Y2YQkk9em9vyfLxIMzyVud5yuVs34VlqDnIoOzG99S0pcgyQyeO4m4MuIlxsjBBgL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=609ppVu1Q6CkY5n7c8nVTiDYTvkvs1atfXPGrjYEF0w=;
 b=Nvlk5ZVZl1P+U3ZQA6J01Q3g8xtCAZ/qXDMDAVzDt5+9kFO5Nk/HLlvudyq3rP9F1tSiat8diICNS94XqFEpKhz3thn/WYIk05ZRC1RmIaxaALDf2QOSIRKRxqsphUahD6cFqUOM0O+Ytyedc7c5/D0aZuu7z8z3LyAEskk+FZh3YRW179xlJoPjL3k7P6Q2M9NJlgIvvOT0D/kvBtHxnTOBPYphk13KU2gkb0rf7QMCTYcjiKBr4acfGpPIaXeimVWi7xZx/k00s+mbqNJKarYj7GSSwnKC9bNs4duPE2+qSYe9vEsFSyEbivVSg5E2s5io/T3TL46gx5np+lgKaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=609ppVu1Q6CkY5n7c8nVTiDYTvkvs1atfXPGrjYEF0w=;
 b=MbV2km0Omr5oIzCevnO4SK0KHPDN45b4pcgh5xTcmFjNXcm+TnrwwRg31S8tO588Xx2Sxb40PEug9DMiEao8ObOyduCSnJx2J3ZVdfSJl5AzM/8X4WL9FBbl5NouUeBJNoTAKYBCdBZcCCEiKo0PZUjPG5EXxJyi1LMrAEIbBJHctAwoZEkNm73np9Ib4EQfBl3n1aeeTIO5FGdSZOR9eu+OLfDh84j0obFoNkCwdDSuMdaIf96ePMXCk4PrWtJWN5QEm47dU8RnqLSYrQDtMLCLFW760niFBrvSC9M6iaZMDkMddqgN4HLIvrkbnhUHvEkR4LhhsnIlGtU/fGJbhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by AM0PR04MB11878.eurprd04.prod.outlook.com (2603:10a6:20b:6fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 12:09:13 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 12:09:12 +0000
Message-ID: <ac8a285a-a2c7-473b-9c1e-fd7433d67b30@oss.nxp.com>
Date: Wed, 18 Feb 2026 14:09:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] serial: linflexuart: Clean SLEEP bit in LINCR1
 after suspend
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com, cosmin.stoica@nxp.com,
 adrian.nitu@freescale.com, stefan-gabriel.mirea@nxp.com,
 Mihaela.Martinas@freescale.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, s32@nxp.com, imx@lists.linux.dev,
 clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
 echanude@redhat.com, jkangas@redhat.com
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-3-larisa.grigore@oss.nxp.com>
 <aZN8hKJSsnnYhy1m@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Larisa Ileana Grigore <larisa.grigore@oss.nxp.com>
In-Reply-To: <aZN8hKJSsnnYhy1m@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::7) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|AM0PR04MB11878:EE_
X-MS-Office365-Filtering-Correlation-Id: a73c23b2-e2fc-4fe9-e911-08de6ee686f5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmtFVEtTcG4yeTJQYzVYMEVmUnBMTmxudEx4Z3c2T3JFL0N2amYzbVcyMXpN?=
 =?utf-8?B?VjJLams2dHdEbURaanRuNGQrd1IrdG9KSkJmSUM1bUthMnkwTUM0SUNtT0tx?=
 =?utf-8?B?c0xHRDF3UHoyN0k4Sk5VM2s1MUJCTFNUQ25HNURzRTZQdUo1ZjhXSTBjak1n?=
 =?utf-8?B?RUdJdXJXam8rcmRrWFptZ3gzeHFyTXhhSUZ2T0d4RU1PcUtTdHBQYXpVbWdi?=
 =?utf-8?B?SitkaTc0ZEhLRDNyenJSZnVjOHo5Z0xMNldmSndIOW9NVktWSFkvcWRZUVYy?=
 =?utf-8?B?dkRRalg1ZnRMUE4zbUU2djBydHdmWHIwMnlIeGl2YTBwNDV3MlRLQUFiTGQv?=
 =?utf-8?B?ZkQwNnFJbGxhYloySXdFSU5BZTdkNWRYRWpXeG12MSs1RXk0dkk0WmdaYUp5?=
 =?utf-8?B?NEI3TnZ4d002K2hodlYzZGI0anArVUNOSUdGenIzazdMbjRCekEvSklBRUc3?=
 =?utf-8?B?Q3JuTFN0VHhKdjJaK3B6dFc5cEc1SkI2Qkp5SUl1RkNPMnNPTFplbU0yd2Ru?=
 =?utf-8?B?VVpiQ043REJ6UmVQMTJvZnVTOW5vUTloTVpUR1IxRS9DcXVXeGxRTGl1Sk8w?=
 =?utf-8?B?TlZGTXMxK2pidWpBYXVwMVpXMXEyM0dOY1Z5OXRIZ21EUkZvbEJBSStleWxO?=
 =?utf-8?B?bWpXcUNlejYvakFubDIrbmlwbjRsMEtjQVRhYjM2WFVOTTZHd2F2a0w3alRS?=
 =?utf-8?B?THZ5QVRVUWx6bWcvNGdieUNsNmVtQTQvRklaMGgxK3gwQW1OSEErYTdYdTZB?=
 =?utf-8?B?TXJtemdkUlg0NEYreXQzQmd1bU5EbFVvMEJlV09meGFOQ3pkeUlUMWZvdXpY?=
 =?utf-8?B?bHYrU0JnT0ZBTVJRM1NTRC96VGRTbThYTmROdytTL3MzNUlxUVRPcGJxb0J3?=
 =?utf-8?B?TzFZdHZXV3lJdlFOc3dYUEtsSDJmZjVka281Ly84ZUQrclRmWUJkREJTTE4w?=
 =?utf-8?B?TzgvQXRlZVU2NklYU2FOT0ZlVU5RKyt2WSt2bHJCWGVZZmdoMGNibHd6SGpW?=
 =?utf-8?B?OG5TUXVsbER3c1JzOFU5MFErWmlrTm14YnZOUGtINUtDWncyS1JUZEhOZ25Q?=
 =?utf-8?B?RENLcXFzRHRoSDFvVzlTaTdRUlZwcGlEQjU4b25Yd2tnSnVEZnUyblhGYTVm?=
 =?utf-8?B?QldHQXhCUXc4K1cvSytldGdpc1hjL2w1bStZMTBMNzhTYisrc2FpRnJRSHlY?=
 =?utf-8?B?N1BLVmg4Z1F2aUY1elBsQ0Z3VllFK09wczVXcUgyaXVaRkk3VEJ6bkRJOHRk?=
 =?utf-8?B?cElyZmdHc0w2azZ2RkdoM3NBTEZZUEc2TE5ObVY3THh6MEtOdXBmOEJPUThy?=
 =?utf-8?B?NDNYT0VJYkM2ZFN2d1NPcm5EUFNDNzlvTktIQTN2empUNWpRQWp1VUwweEhB?=
 =?utf-8?B?WmJSMTgzKzU0WEc5b0hteDlMdlVCTG5La0ROOFNNUXRYZmlsV05OOGFNQjBU?=
 =?utf-8?B?dGZJRytQQ3QxQW5oa0pFNWgySCtsV0VXOHRoZWVuUUE3SVFKcnVmekUveUxu?=
 =?utf-8?B?MU12OFlkT3Y0d1E1Mk1PRzVPT1c5YU5QT1dMcElNc25oSjNBcjcyYjdpQTRK?=
 =?utf-8?B?SVpCbmRic3QzZS9QSFZTR25kWVBuSWt2OFh1M1hOVkNZa3VMZWErOWQvNWRD?=
 =?utf-8?B?U1JiTzRsajRhcFh6bU9mUWpWRjQ4UjMxSEJXWGlwaGQ3TS9Nc0QrTVRDa1ky?=
 =?utf-8?B?bHRqUnM5ZS8rUzhCblRNWlJUT21nNjVHWTN6VUo5c3pZditBTUR1U08rbWFq?=
 =?utf-8?B?T1hmK0l1eU1EN1VmZlFwUHVGdlB0SlJjMjRwdFNoUWVPSytJdGNKUkxoeW5h?=
 =?utf-8?B?YWVnakEraFB2OEdZZ1ZLSUxJTkdZbVU1TVRLZ0RsMTJNMjV1SUd5NHU0L0Rv?=
 =?utf-8?B?YnBVdWQ3VGhYWVJHc2l0WnAzR3E0bmtGQ0tXTjllczNpUEhrc2VGb2FTRXlD?=
 =?utf-8?B?c01pOThUMzNtMDh6MldYTzUveDJHRHRMbktxOTY5NmJEblo4cURlUkxsYjNz?=
 =?utf-8?B?NlFGT1dQR0E4b2ZVQWhoSS9pREt4UFRmbGV4MDJna1Q3VWI1VWtZcmp0WGxP?=
 =?utf-8?B?dmxuZWxJeE0xZzVjaStCak8reW10WDVGRFo4bFRHcVh2amNOdEc2OFh4Y0JB?=
 =?utf-8?Q?mhXk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9224.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWUxNnI0QVdnaElJSThqQWxhbC9RTW1rT01uRFRIMFdlTXAxMzl3QXgvN2c2?=
 =?utf-8?B?VndqTDludWh3NkpqMHZsNWlxYXA2UExnQ1R3TGJHNE8ra05xZGg2VFBoc0Z0?=
 =?utf-8?B?UUpqTndMQVE4UW5tdlBnOWNjaXpPRGFUWnYrSjNzTTBibThsOXBDZTFJRk14?=
 =?utf-8?B?S0VyejBueW5KeXhHcmF1cGxFRGZNR0luYW5WWWhWMkVvamxtaVdEb28xNmM4?=
 =?utf-8?B?V0Uxc3JzSVNkUWIrbnNsK0hMMkxzZ2JYbUIwdnZhN0VsSGU2NU5LbzVYMWRE?=
 =?utf-8?B?aHlXV2VwYjJIUjVPamYrdlF5bmp2QUJGMHZCTTVIT3hsK1pndXVlWVEwQzZT?=
 =?utf-8?B?SzFkUGYwTTBub3RqZ3VjYjd0ek9PVUxNWHFYMUFoU3hFVE1MYkNxNDhyTnVm?=
 =?utf-8?B?bEYxSVlQVTA5cFBGK1JlYlRKS3BibFQvcEZRd1dtbjZkcUhTWGEvZndvY05y?=
 =?utf-8?B?UEZwdUhzZTF0ZVMxRi85VHVjdjZmeXJ2bnUxK3BFK2UrN3V5QWhQdEhkaW9W?=
 =?utf-8?B?aDI2YVQyeDBPM0x0OWFON1VlQk1waFVzY3JSaGk4eDg4NzNTZ1pYRHZ2aUw3?=
 =?utf-8?B?bUNLcGRVZENvSWhTYlREaDZKZkhCNnoxdzdMWk0vNWNsdUwwMzRuM3kzZ1h4?=
 =?utf-8?B?RGtOOU1abWtJcW9GOXEzbmFWZXNuc2ZScjI2STlHNXJpd1ZPYmc4TzcxRWls?=
 =?utf-8?B?L0RkSE5Xa0J2L2lMblNNMTFWM1N2amg4OTNVREk1dUc4Wk1IdzFBV1hjeEl3?=
 =?utf-8?B?WW5jakFQSG51bmFRdVpsMWNLajBid3QzNldTQnhzejFodTBRaTV3aXVsTG5X?=
 =?utf-8?B?UmF4c2VlZ2V4WmVKOVRQbFplcFRyNGIwRlUyb0M0bTBwUW40N202aE1Vb1NZ?=
 =?utf-8?B?NFNmYS95ZTFlTDVUTHdPMU1McU1ZYStmOEwzY0lJajd0MHlHMHhOQ09hOVBH?=
 =?utf-8?B?dGFMbUI4Rm9WbU5na0dnRzBISDBtU0ZFZ2prTUpGSDkySTNsT0RmMjBwRk5V?=
 =?utf-8?B?UkJPbHVkQ3pkVXJUZ3BTdGcwREIyV3AvSGhkYUhra2krMVRoQW9ZNkJpSEM1?=
 =?utf-8?B?YUlKdzQzTWhsMWlKZDRaeXVWR2N2aXg4aVBmRm5KZW9mWHk5bk5MK08xQ2cy?=
 =?utf-8?B?UkJmU1Eyby9DYmZHcmVoZGJXc2tJWFBEUTl1M2FCV291d3o0b2tzRFJ0dHFJ?=
 =?utf-8?B?ZXB3cmt3OElMbW9yTEZRQkNSakVrWUEwNU90c3dnRE1GSGg5UjBiMW4vTmc4?=
 =?utf-8?B?ZU0zS2FuSEVDZmJVUmpha3FlcEdnWGhDTndhMHgvUTRZQmttQjRmcE51YUFC?=
 =?utf-8?B?UnFLRmw2K0ZaZW5nMW9XeW9ISGJrVkxITEZzMlI2WkxqY3hWRGRPaDVPZTZD?=
 =?utf-8?B?L05IWCt3bk1VM2ZFd1V3NmZFWmluVkVjeEovYzMvb3VpL3N2Zzd0Z0FsZEo5?=
 =?utf-8?B?M25OT1JzQ2NSczN4OUVNNndWaTV3QnhGaUJSMndTZXg3eURmYmFrQmpOeDZV?=
 =?utf-8?B?UFhheHFpb09ONGJQQXhxdWoyWVdUUW1CQWp5dThjMkJtdlpXRmExSmFlMUlH?=
 =?utf-8?B?K2JUUkdCSlNUd014QnZERkxZV1lGUHZsc0JnVHlpem1MTG1kZ2RwT3NVK0Jw?=
 =?utf-8?B?VzFwUFBpWGNIbTRDWkRPZ2FXUk5zTG9TWU5CN1plZHl4VGRkYThBeFdUZEdz?=
 =?utf-8?B?Yk1VdUQxOHNWTi9iMHNXbitoVXEwVXZWdVVIZGhhRVhuSytTc1Q1VEppZTlZ?=
 =?utf-8?B?aThtRUZLQlN4ZVl2MlBnNGlwVExwM2lVanh1Z3BwRXZMQWJPS3hqQ1YwSURh?=
 =?utf-8?B?elFKcUFycUNGSGNLTmo4SU80M1N2SmRQUlhaMWZ5QkZyQWREeXdmZ2tFV1J6?=
 =?utf-8?B?aXJkQTZWakRFeDkvdWFZdW9ZNEFlcElBck0yeWo2bmZ0VXJia1hwWVlwTmN2?=
 =?utf-8?B?aXB0R1F3N3p4cWV6U1d3K1V5U3psTWtwSHRzTVVtc0thWi8reE1FQ0ZVYkR5?=
 =?utf-8?B?Wk5NRXE5ZDRjOCtuQ21IUlNNTVI0Wkl3WEFNRmVIT0tXNE0xVER6enBvUEtF?=
 =?utf-8?B?bWRRZC9aRmo1RlJQUXhiSk1aTTJkNHVtYW5QbWc0OU5OVll5NVRzUGJSbkRo?=
 =?utf-8?B?UlU4eG5OQTNUaW5JSGJZck5IRTlmOU1NWTBOYis0V0tjaDRoU2IyQmsvNEh1?=
 =?utf-8?B?NTZDRVRocWZ4ZE0vbWRHWUljSzVLN2RGY1R2RkwzMXYrdkJzL2pjRFB4WXM5?=
 =?utf-8?B?WUoxUWlrSHBaN2xudkkxenJNbnNOTVcvTk1nNE43bmcwMnZraFExQXVwOGUr?=
 =?utf-8?B?ekVkMUowQXdPYWRSYW1ESW5oakx1dGRETGIzdzNaNlFWS05BbDM4QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73c23b2-e2fc-4fe9-e911-08de6ee686f5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 12:09:12.3843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xC4ozTyngscfv/RvuzRv6Qt9jfiGfk6ScBD1XAlTpEBkJ//+enC0bkTaE2NVStNV+THvGndqXDd1FuGUCLPwEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11878
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53047-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,redhat.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,oss.nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E003815639B
X-Rspamd-Action: no action

On 2/16/2026 10:22 PM, Frank Li wrote:
> On Mon, Feb 16, 2026 at 04:01:54PM +0100, Larisa Grigore wrote:
>> When coming back from reset, we need to re-initialize LINCR1 register.
>> SLEEP bit should be cleared, otherwise we can't enter INITM mode.
> 
> serial: linflexuart: Clean SLEEP bit in LINCR1 at linflex_set_termios()
> 
> Re-initialize LINCR1 register (Clear the SLEEP bit) at
> linflex_set_termios(), otherwise the controller cannot enter INITM mode
> after suspend/resume.
> 
> Frank
>>

Thanks!

>> Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
>> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>> ---
>>   drivers/tty/serial/fsl_linflexuart.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
>> index 5a410e2d56ac..016011fd8760 100644
>> --- a/drivers/tty/serial/fsl_linflexuart.c
>> +++ b/drivers/tty/serial/fsl_linflexuart.c
>> @@ -413,8 +413,7 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
>>   	old_cr = cr;
>>
>>   	/* Enter initialization mode by setting INIT bit */
>> -	cr1 = readl(port->membase + LINCR1);
>> -	cr1 |= LINFLEXD_LINCR1_INIT;
>> +	cr1 = LINFLEXD_LINCR1_INIT | LINFLEXD_LINCR1_MME;
>>   	writel(cr1, port->membase + LINCR1);
>>
>>   	/* wait for init mode entry */
>> --
>> 2.47.0
>>


