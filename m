Return-Path: <linux-media+bounces-40549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED5B2F44A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD0C0189A273
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7342ED16B;
	Thu, 21 Aug 2025 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Uz4esGfx"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FE02E8E10
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769384; cv=fail; b=lEannLLh1YxK38+DLG+eSm9xyEhhGhpsw3Bo7jkt4eUYz+x+CbtieDnFU0mcLo+yb+EikzbM70jflCqmbY38cxazukS0wN8TlyDQ2kyDw84lJewV+74JkJ9oQ0+oajbpSoqb8ansJ0w1yxRt90rJgkAEphS5Q/HkuEVrwKCBeUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769384; c=relaxed/simple;
	bh=OfSkHRrKSHXz0IzYQ2Ofx+Vb9taaqXjUQoBvG/8kt14=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B/i9vTH44sQRPB1jSqI6IVH7ny1JH9tt9EhlNZb0EMz8tcPmXGBwkPrzmHqH/Tg1KSQ+caLHETE5GqGG6OoECD3IrPeQY2EsuUDDTDNFriXQvjPGFYt7Aqd0imiQ01ihy8nbbKrRFAn/Kud0EcyxlIadsoN1krbKiOpRMEyNxvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Uz4esGfx; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L49Ns7awsKjBNAHPPc7aPJqqTa6NnlJ2pzYQaxWcd1IPHEKDLOPZTKPWCibjWz/Yp+Ssf9pHniUKV/ca+DswfpaEl51K3RyT+ocJnRIlDsJTX7gJNxayneD7JTkzCSLLlIGf4cJJbo5K5z7YgKZUkgkevKftZGRZ8HG4fXXmcJt6JNYtwxiuuUmz4b8HZwAzShoGCgeGqwCV7CsHm2AOB+yKumCDSqu1C+6QuoVokSKa0Zz9BiHFpTj6w1oGP5XomKVcFQNB6Acnf2BoOqLP3meDpxc60PHMUokinvLKn0JAIEZrhqND0t0wegRkbpnCreJ9PtwK0kVfJXiQdajf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W99MidA4iU8erJxLsGd9YIN74vkG17kZJ1XVd9UKvQk=;
 b=xF3++JwZB0uZHsLZdoeofNkqsErHbzIgNN43+bV3kvuP3Sc4Wh3f3EQokpEjkKaNcaPZU49jT/MwQrLsBPplXjQVboZnM+SXDD3BpI4fqdRrmMrrxvGEiR1onGJ2D6O0xW71NHvnB66+hw9fF8mXUvN7GnHbjdoJ+pRdURyFwNriKQBBVqSNk8AGlPvefEe50mt8aondLVegiS6iteA2K+a6gzWSuxgRX4Us52iqrhjK6xixkDEokETjwbDvLQyxcGYDcC0m6AvfhsFwPODoElJIXtdKT07fT7kUX1uD+GcTT2u4iNdbA/+5iLiT9cku/w2AYrJYNmGjCAth0b1CBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W99MidA4iU8erJxLsGd9YIN74vkG17kZJ1XVd9UKvQk=;
 b=Uz4esGfxeci2JQvoDtQVk2NNFBYJkkwsjGN2OTxnIEuZSqYt1aOQJxcSK//U4dX8eOXNkaGIka2w3dxMO8oManirQebGpLANWTp2RjY9lskW/uN8uiQoClyVrVP6q48u1OtPiezGSjJf+jdu/rl72N3WSaKuXGM9WAPdMvaoEIMMjIVxPrvn1fnZsKxGbMwerhf91dXrrTRZhQgej0gK7FTQnPVA2jMZ3Ms0U4SSi10TL27FCSNOP9MAtZPnOWO2cG7qswC4ZUpsEfayZdqFKkH38ZWscZgMy2Gus2j8qJ7dRtxyUEBxVIcPkSCb2MPbOmgBZw1g8gSp/JL/EYCmBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB8209.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 09:42:56 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:42:56 +0000
Message-ID: <6f6a149e-846a-45ca-b516-09482c87ea1a@oss.nxp.com>
Date: Thu, 21 Aug 2025 17:42:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-jpeg: Add support for descriptor allocation
 from SRAM
To: Marek Vasut <marek.vasut@mailbox.org>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820163046.209917-1-marek.vasut@mailbox.org>
 <8d38e622-a743-41f9-81e6-d8608e3c60ec@oss.nxp.com>
 <83a65b18-76e8-4ad4-9d4d-c1ef68d3d181@mailbox.org>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <83a65b18-76e8-4ad4-9d4d-c1ef68d3d181@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf67f97-ff34-4032-6907-08dde0971b71
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZzJUbEd6ejRTUWpJSXJpTUtUOWZFQXdFcURFWG83TURaUGRRYnp0dUNHQjYw?=
 =?utf-8?B?RG8yQk9yMmdtTXRWemJ2aGgvY1F5SGVEOUptdnZxam1wa2NwNGkybmczbDVI?=
 =?utf-8?B?NEU5WUxQbmlHWkRQVk9mY0ZlWlR2SWtyWVFxZHp2clRlS25MTWdtRWFla0hr?=
 =?utf-8?B?WnNvNjQxcFlhK1NTbzFVNlg1OUNzT2FuTW1rTnZIUC9xdUs3VjVUMjZnbXFG?=
 =?utf-8?B?djNKaWdzdkVKVGJ1Y2xTQ2I1WGliczdaMVozOGJJZ2ZOcnNkZVYwOCswMkRh?=
 =?utf-8?B?NU55OURmampycUxTLzJKNVBqM1RmaHEvQW5MOURXTGc0TWkwaStUT2tJeFAw?=
 =?utf-8?B?ajFhN1hyV29XcDk1YUl0K21BUTNIdlhuQk96MWJibzloaEJYbHhENTZSUUlx?=
 =?utf-8?B?WVlLUTkvamcyY1EvT2pXZWszV2pEN3A5cmx2bDNoZGxxbXRKZE9WWTE1dVd2?=
 =?utf-8?B?OXN0dUlmZ2RDREtwdzRHUVlZcmlFSWNQWkFOOWE5RHVGVFlBVnhvbjhLM1lF?=
 =?utf-8?B?U2NmcTc1NWpZMmVwQ1hYSUZGNm1YYXErbHJzLzNIdHp1R1FvdmpzaDQ2eTJj?=
 =?utf-8?B?T1BUWDBIQU1YajRTNHdvSVNhZzhLcWhKVlRjSitYMFJzRjg0YjdKMk4renYv?=
 =?utf-8?B?UGNYMXE0dGJ0aG14Vm9JYmlzVGE0SGVGOUlkQjF5enAxMlpuZ2lITU80RGhl?=
 =?utf-8?B?dERxVmFYUFhEeFNuSW1ZRDlmNzJ1b3cvdTg4TnVneFJlNkxiSFZ6LzJQTlU3?=
 =?utf-8?B?NVJRNTlVN09UcFpsL0s5OVE1TmdVZ0l0cFFzZytBdnZxcThzZ1dDM3MxUWZs?=
 =?utf-8?B?NU4xSXJNK0dqbWN2TDRoZmo2K2ExUGhDcGZSWGswalpSeVpxcVZKUktwS1Fr?=
 =?utf-8?B?VEVYSjdoRVNlUzd1eTJ3eHlZdHl6TEp0N1NlMGNxN2dUOFVqR2Y3WGRoUGYz?=
 =?utf-8?B?KzQyRWUzeDdPQ25sTXVqenlrYmZ1TUpBNTRDZmJFN0Y5SjF1LzlqT2FPOXBH?=
 =?utf-8?B?anBHajkwUXcrWmdXZE5QNEdxZkJpU3BadmpBOGR0TWlvMXNaemJVVEl2TGpV?=
 =?utf-8?B?dWhqWVFTSkNUNnYrcCttSTgvSEtXRTArUGs1S05OaEdiK1VwOHhKRXdQL1p5?=
 =?utf-8?B?RFpyc3RRODVZL2tqR0ErV1Z3dVE4QmJWakxlUXR4VG0xSXFKNkpmRXNMbCtC?=
 =?utf-8?B?d0RWOU0ycGxwZmVzT292dHJQUHFKdGYxVFBPby9ITTg3R2xpOFd0eUR4SWtx?=
 =?utf-8?B?ZEQyb0EwR2E5YitTekdMWVpxeHNDQk5LWFUra2EyL1l2T1habTFHc016MmhZ?=
 =?utf-8?B?SGRDbnU1aW5qUG9GUzlVR0FsTDVSQXdCZ1ozdndaYlg2RTduY2ZKQVhFS010?=
 =?utf-8?B?d3JzTzZHdzRiT2pWS0NjOWNjOHdzKy9iTVRKVUhTSjRBZ1htMTFNd2FrNW1H?=
 =?utf-8?B?SGRLaFI1VnJFeWUxZGFudFRZb2hoV0VGQXkvZXpDeEZuRzhBZmlaVk5TdWpC?=
 =?utf-8?B?VTJsSlhPeUkrN25OQ09pdkYyaWRLZkZHVWNycUlaWGU4ZlBpclIrajJNUHpj?=
 =?utf-8?B?RG5ENWozM1M4bUtpMTBhM2lKczRGR1NOL3NSVkJaNUpaajhQNm1ObFA0VG1G?=
 =?utf-8?B?Ump6dGQrOFZJYXFYZ1pjMUZKMzNiNVNRT1N3UTRPakNWY0Y2T2tuT2lUeTdV?=
 =?utf-8?B?TzFIZER6Z2hhSG5razdRcEw1b3ZqRjZROXZlNVZhdDlwM1FIVzNhZGMyOEpy?=
 =?utf-8?B?U0l2eDF0Q3VScFk3bVNoVExlTksrMGQxQzNENnZOUk5iN3MvZ3lxWGlRN2JR?=
 =?utf-8?B?Y2FtREhOSTF3ZXhKVEs1c1oxVlNQMGY4dVJSSEx1WHNvRGF2WEJ6UVo5VXRK?=
 =?utf-8?B?Q2tSMFVJei92MlZWVWE2NWJmaUUvRGNtT2dkdWM0bVRObjZVMytpa2pZNmlN?=
 =?utf-8?Q?eimau5m7qDo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UzdwSm5sdlJORzZVSXNFUWQrQ0pnTVcvcGhuR2hnd2pZTlNSa1JXaW8yZFp4?=
 =?utf-8?B?UW5Xc1RXMUpVcUhKN1NKTjYyNTIvRTBZY0ZkWjVXNC9jVEpMU0had3BRSHJG?=
 =?utf-8?B?azhRd2NwMmxSV1YwdkxzTjIzOHFJV1M2VTlRWUpjWkVHSFRFM3lXUk5VL0Zm?=
 =?utf-8?B?U3VZRDQxaVZOSnZVcWV0Sld1QmMyQ1Y0RDRMaEh0ZkQ3dWxmQVFvWUN0Y05i?=
 =?utf-8?B?WWhQaTJwUVVTZEtVWWhKMVFxUTVxakhiTlh2T0RpeUJzVW9PaThDUXRzaUxm?=
 =?utf-8?B?M2hidi9tdkI1NHhVVFVTRVNxQUduc2l2aGpEMzEzR3hTU2FySEUxMUJURG5Y?=
 =?utf-8?B?cDJ6N1h2WE1RcEg2ZGQ1WXJwazlBWTVVWWhHKzhtRGw3S1VHbGJnZ0g0TGFt?=
 =?utf-8?B?LzB5TWVQWEFLTFpzblFlME9xQW9BSk1GaHkrSTkvOWJpTDBVMHRoV2ZZb1h4?=
 =?utf-8?B?aDk2UVZaK0hzd21VTS9Ua0RmWTNMMldESlpjdW16K1FWQWd3Qks3cGFOUGRI?=
 =?utf-8?B?V0I1UTc5MnBnWEsxeGxndFpkMzhNV1ZFMm81VXJ3VkF5bGw4MzFnR0RMUVF5?=
 =?utf-8?B?SUdPOU5tYy9WaE5PZVQ5SVplbkVsajczUkd5M2dKWE1yNVFURTY5YTMzWTVW?=
 =?utf-8?B?amVFdHJvalU5R1RoZU9aM3FqRktENUhIeE1oUWI3azkvbXRDejRNVWc0MVp2?=
 =?utf-8?B?RmE4MDVjbWdrdGtYYlFSSEMvRmlzY3FMTnp4aVhMcDNJRWlrWmJsWnBXbHl2?=
 =?utf-8?B?QWgvU0VhdkV5RG4yb2MwUHNqN09JT2dlVnFrNXE3S2RYSU1WdDNVa01HY0VP?=
 =?utf-8?B?dG92eXdwdnBvRkxRd0dsbWVZOWVtVVgzcncyWmpwZnBlSVlTQ01kSWhuMHBh?=
 =?utf-8?B?bTdVUEJBMndPS0dqTkFCRXR4SE1IL1NHalI1OGFPRWFqTFFtNTExdGRka29u?=
 =?utf-8?B?Q3pKVGVlc29xQUVtV0RHT3BrMmY5OCtRNHhaSDVPdisrWWh1SjlmZHdtWlhE?=
 =?utf-8?B?bXVtQ0xZdXlncmNYMVJKZWlxdXMxMVEvUjQrR0Y0Y0RWQkkweDd5bXEzZ01n?=
 =?utf-8?B?ZzBRQmg2c0J2eVdLV2xuaTZPTHU2T1VaTUdHL0lmYzh1TCtLRmFSSEdyejhW?=
 =?utf-8?B?VUt5M1dEODZQblNhcXFUMTJKR1VIWGhrYmcyQk9mUzFNVWNtdHVGa1NqZFg4?=
 =?utf-8?B?SkJIdjMrQnBVSW9TN1hJMzBOY1pqWVc0TW1sR1hBalBwcmh2YzVlbE9wdk5o?=
 =?utf-8?B?MjVsQUxJWnFqTkhHUHJsRkVTNkNCUDRITzRxMENMVk9xbE1nb2huejFCZjlT?=
 =?utf-8?B?MVY5dUdQNmw3QlJHK0U5SVRESDVSVS9TbWkrTWY3eDFDQ2tPVWh2K1YwbnlO?=
 =?utf-8?B?Y09aQnRab2pIT20vMmhyL2RxS2ZiY1VSQkdMcUgxQnYvT21YWWtkR0VBQUxY?=
 =?utf-8?B?WWR2QThGaWtwQVdpbkRiSDZVbXRXVllhZnYvWmlwSkNUSklONjZzaXdCOEcz?=
 =?utf-8?B?RUZtNXJHSm15ZmtFSVhmYjlvSkJWb1NOL1JqUjFKd0NiSHk3SFJON0kveDE0?=
 =?utf-8?B?VlJZOUNtc01UTUh1Qk9DdVBIalJQelVmRXZlZW5DN2VWNUdUalg3YklmWkZx?=
 =?utf-8?B?Q0xGRjFEUGc0L0gwT1ZLTGdpMk1TRlBZcHA2QW05WExKWVd6TllrUEJDSXVh?=
 =?utf-8?B?ZndkeDhMeXlTZENlUnQzeVE3TkVLNFBXd1FzSlViYXNDZUMvYnc4K0E2OGc4?=
 =?utf-8?B?b0hxR0RCUDkrTTl3RnlsODB3SkpoVWswNEpyOHU5K0VGc1RlbXFndWVCenM5?=
 =?utf-8?B?M3d6eDU1Q1QzOFJsQ3hmUmFNZzloSHlYbUlkdi90dWlUZXY0VEFyQmNkWm5u?=
 =?utf-8?B?R1dIQ2lKcmVYQXFzejlra2ppRUdibFB1OTFWMno1R3k0dDN5Nkl5U1VvMGJF?=
 =?utf-8?B?S0FnUGNHUGZ4RTJ3UmV5bHRFMDNUbXlDQnlOSFU3Qzl2SlQ3Q3RobDRFOFBS?=
 =?utf-8?B?N28vY01KVmJKMnlhZWpNVjNuVnlVbjIxYTlxRDBrZFdCRHZXQ1FoQkVtWG1T?=
 =?utf-8?B?eUZXdnBIbDZZR2I4a0VOMUhIeFlsa0x5eVhPYWtIYU5JbnNuWVgybGRFakcy?=
 =?utf-8?Q?C0gfJnLn1aOtqErWWIvE9wk72?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf67f97-ff34-4032-6907-08dde0971b71
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:42:56.4760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S30qBCVG+yOLOTVJ+GlW6cRIYXrNmdSQUr9SkDeHYPyH8ud8fmwHqeigaqEUOG+SLJJnG7U9GVwYAmHEKauqqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8209

Hi Marek,

On 8/21/2025 5:03 PM, Marek Vasut wrote:
> On 8/21/25 8:28 AM, Ming Qian(OSS) wrote:
>> Hi Marek,
> 
> Hello Ming,
> 
>> On 8/21/2025 12:29 AM, Marek Vasut wrote:
>>> [You don't often get email from marek.vasut@mailbox.org. Learn why 
>>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Add support for optional allocation of bitstream descriptors from SRAM
>>> instead of DRAM. In case the encoder/decoder DT node contains 'sram'
>>> property which points to 'mmio-sram', the driver will attempt to use
>>> the SRAM instead of DRAM for descriptor allocation, which might improve
>>> performance.
>>>
>>> This however helps on i.MX95 with sporadic SLOTn_STATUS IMG_RD_ERR 
>>> bit 11
>>> being triggered during JPEG encoding. The following pipeline triggers 
>>> the
>>> problem when descriptors get allocated from DRAM, the pipeline often 
>>> hangs
>>> after a few seconds and the encoder driver indicates "timeout, cancel 
>>> it" :
>>
>> It's a hardware bug in i.MX95 A0, and the i.MX95 B0 has fixed this issue.
> 
> Ahh, this helps, thank you.
> 
>> Using sram instead of dram only improves timing, but doesn't 
>> completely circumvent the hardware bug
> Does it make sense to upstream this patch anyway ?

I think this patch is helpful.

But so far, we don't have any SRAM resources for jpeg.
The i.MX95 does have sram, but it is very limited, and it has been
assigned to arm_scmi and VPU.

This patch makes the jpeg can support SRAM. Maybe in some scenarios, we
can assign the SRAM to jpeg instead of VPU.

So for me, I welcome this patch.

Regards,
Ming


