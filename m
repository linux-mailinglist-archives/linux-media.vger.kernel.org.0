Return-Path: <linux-media+bounces-65381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ipaXMaJHOWpNpwcAu9opvQ
	(envelope-from <linux-media+bounces-65381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:33:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E87816B057D
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:33:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=wcZUYlEK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65381-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65381-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA658301318C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1863B840E;
	Mon, 22 Jun 2026 14:30:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013030.outbound.protection.outlook.com [40.107.162.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E702DCF6C;
	Mon, 22 Jun 2026 14:30:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138655; cv=fail; b=WfTbXzvZxcdjHwHNKWqgmcjaGt14vZCmsytbySjAANqYUIoSGf6754V4DIWRyxXbyH+yo3rlbNSiBQC3jrI8Dg3rj6VOC45WKmQB2krhH2vVnDvwN95guYLzjsDN9AVulLb0XMitJjdAMftMGgpACz+DKWm+63g1fpOCZqo8uR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138655; c=relaxed/simple;
	bh=1+laEBJBDhR3M9EYHTxGD24fXGUCkMG2MCF/k+xgkK0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Nx4Kj1cB0dx0VaiLopCwAaRgIa0lUIIJND/AfNen24eSDE2VIHPhB3Wf8P43GzsfgcGO83M9jEwiubPyczDIIP0TpUBWukiBfc1PK7WSJHEmeJWdSIbRPRx6Up5ovUhMutAPpHxZs/BMlBt+y3gEjuZfaO7kgmcMjIM/fLEAA6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wcZUYlEK; arc=fail smtp.client-ip=40.107.162.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPXZSjDNXBm2CHaA+jkt9poYkJUNf2IKH43Vw3oTjX7XMjgFx8qpq5DcsLEzEIS1Xqn1R16BYwUCUJNQ+b98iF9l73NJUjnUxBOfldg4GpWl/HSz7XwlEXdN8W6V8ioez94WJlH6tYywzykmP87gxEiHj10mwTN3vnKLDavSzZJ7JJXFts9+LElP8L0Xzi8P04cg//i597WtjYNUqSPnAAbLAQWSR31zBFftO3w7fi0oYRVll4NKYQdkfWxouzyczaBFGughftBnszOQaw6BkF8KwMDY/KM12rb5UYu1yn7bObWZD79Eg3jIalCbo5MJ5EigXFTymFUaEhhU1MSieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qFoY1vgxLEX1VOw9z9m0LV0/yKi48dhQE1/1fdVDto=;
 b=J2ZIeGY7U4FTxlRWUEQFTm+4mdFgpkAK7BeaoxPJEoJVG82JGKxRHIgw4bNr9cskoU+J2ZaDcF5sk2Anu5I30rey65gQcHJf2JPrXShApFV0BFywc0Mp3e0JAgzyWNp3UA76t/vyV2ZFxn7NWVm+e4mPMU95J93sOnSu/GsBogk6Emq3yF7KWEdomfQQEKFb+wjWkMmPcCzeuJA4bTS37nCz4F0AH2+5t12L3aZ2HZJ5R3ZV8/mTAI+ARl5BYhTmzxVe2ESxASRNsXDz5YE5XQxvMhSEHnIr/HnWh7P9igU5gnsymuysKdqe0/Lv1/RQOP+mQEvkcl5pLru1ZtIPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qFoY1vgxLEX1VOw9z9m0LV0/yKi48dhQE1/1fdVDto=;
 b=wcZUYlEK+j3jSYzO3B0YJcHHmKSNAHvDHC15w1BOVWx/cpfzSJUv70sox7k+ABDYFNyJq7Wo01XL1QvH8NEHHuviWG636jy7UqQG+mSPrEgH7ncnKhkFOIZv9bncKGfIM99Q3PKxIL1SEfGqxGzJv0JykgavUzhGxEioO7aAC1YFOexlozvl3EiInmz4r5ZUxp3iDF6yh6QmLX6RHqI9Ex7ygO3N4F9fT/hJ8vFsA0CltOz+DnBGeLtj0iDqvDVDexMhNeRRw1f/89zteI5X7m4ZByNVa1KQQIXfQ/XUdP0IyW78TKPayLhk07cHWlP4ibxrVEcOjTUqWUOYqz9OWg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12304.eurprd04.prod.outlook.com (2603:10a6:800:304::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Mon, 22 Jun
 2026 14:30:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 14:30:49 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 22 Jun 2026 10:30:13 -0400
Subject: [PATCH 3/4] media: rkisp1: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-fw_scoped-v1-3-a37d0aac0a68@nxp.com>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782138630; l=1395;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Bq6NvfrUnSkw3HI/DuFE/DI4Iax4VC6/bRo+p3bUzEU=;
 b=A74TFbKShzPUknbnGEfd7SVPzBZOnyR5eJxLxtOzh7kfFtmcZeFOsWmXBQ8ZTs3oB5ZdDVDn0
 FEEsw8i/GyaC9ioON0UBmhGUy1jqrmZLqmGL688iyInEUvfPJHTwzaT
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0203.namprd04.prod.outlook.com
 (2603:10b6:806:126::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12304:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ea0f77-37a5-4f8b-b160-08ded06adb0b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|7416014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 Dpzqk2ym6rssylh6y64QzmwgR2BeXy53b1pqeNBISjqL/gPHGC1fd5S0xRQ4yz9OFOVvg9O7XimLVbA43dyokxgpCA7qlNpe3HMQkf2oZ9TIrdOpqMOFytF9R0lXSZedhoiqUmLEyDH/zWRT0BJ72Afr/1ZAMUE26LxmugMbzHfp0rEQbD18Luo0MP7TxkuCIus1pHouxdMAjQ7CIDkkV3HZZcHSWl0Vm2gUg2awspbZhYcqu4pTp9nkpPKbr84lG3wHucBGC4XOkwdnY4QBQzgOilJpRrdxi8WAeHDHe2mLYyNSM6pD3Kma2/qZK5pO0rjKw7o2h/s0Je8ix/BvWBI++4oEERcMut9VnPqTcaFj/GN9BfaVrJXqACA+W23NUc5wv6+YWFRqeJvoWHMfgwvKkZfyNw33g0cbuOlmUxefWpSLCok2osvFXOraiQjbJbWiHI/ZJh8HX9qPg9G7QtVLDKmk+KcV1bHTxvUfl6rn1VbevCVuwIHHsJJHu2FwIwdEBN2yGGax6aXve6TnwM2q97/GYtonIK/l3LsAixRv8qPg0A3JX6TgLu1DG8Ho3O8tAca4Q7l2PZpUU0JRAfKA9iDeBwwboHq1CdUdqABPV97CoiTAJhzb5lY6OAl97lelwfCFRbqzsKi46HBb4SlRZ/aF6kD09dkxkBWtkXqVBor01DOuOSdIM+1Jl6FiP5G+dJRWt2FE5UtQQFxWRQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z2dtRS9MZTlLbzYvSHYrTnZRM3RodW1mdWZUMGJiY1QyVEU4OGhGRk5uOEJs?=
 =?utf-8?B?OWdEc2ZWbC9QUUxBK3RUWGF3Uk5nNmJUY3Y4VVhBT3F3anpXY3dWdmhzcWtB?=
 =?utf-8?B?S3dBaXZyZzlRUjExeE1sdkRjMGpKcVQvejRWVHczYlVkUktBdkozcE5FN3lX?=
 =?utf-8?B?QUlMVUN5OEdHWkh1MWdPbmJaRzc5bnJ5NmJQTEN0Q2w2QU1tZUpTVWVQVkF4?=
 =?utf-8?B?N0daamdCVFZFdkJlVm9jOCtxeUxydWNha3hjUTFDZG5QYmZIRkhtZ0NPa201?=
 =?utf-8?B?UFBsY04rbW4vMENSYnphZlZsR0pza0pjNHNhbHQwQ25SQUhiWFBQYk5nQ0Fw?=
 =?utf-8?B?Z0U2ZHpXTnZ6c1A4dEZ4TlhiR0o5Z0pnaUhrVWpZYUNzeitZNWFaVGJKUVp4?=
 =?utf-8?B?WXBaUURNSHI3Snk2bnIvenhwVUJTbG5hajRrYndUNWpIOVpsQXVYU1psR09Y?=
 =?utf-8?B?M09yREhZTWlNOStFYkpuWFh5QThyTVM0eGo5S2l6b1Q3ekRuRVlvQXZPNnEy?=
 =?utf-8?B?M25SZVVlWDY2ZnBya3ptbjR6Y2hFL1VVTlN0L2JVZ2YyVisrLy8rWkNUcVIx?=
 =?utf-8?B?M2RNRWZvZk9jeDFidzBvUXpQaWVvRmJGcG1tSEEwVFJ6Zkl2UFREa2tiN1BI?=
 =?utf-8?B?WmRMc3pKZHpFSmdmWEhjMlU2eGZwKzgrLytzYlgvdlBnaWd1WEM4aDhMbDVN?=
 =?utf-8?B?bW95WXRHdFI4K2g2dVZZMDVRamk2MFZscUtWOGZOdzhueGJtYmJ1TUdzczZk?=
 =?utf-8?B?MTdlY1l0SDEvRUZHQURmQkhPOEErWW5DU01hOWh1Qld0dkY3K1JXMGpCQnBi?=
 =?utf-8?B?dWZKZUd5MngyeW1hUmZSQlpuOWpQSGs0ZHhkamFoMkRBVE1YdGNrYzVSeDA5?=
 =?utf-8?B?TndlaUNhbUZNQU8vZXZvRXNtYVR2Y1dLRm5vSVdna1ZtdENrQmNHWm9TUDlw?=
 =?utf-8?B?SWhxUW5GNUNWNXk5UXoycStRc3o4cityclFKK3NJbldZZ2dZTzZ4U28yTzBq?=
 =?utf-8?B?d2l2TGlsM3VJRmJlSmpQeVRZZWFYR2lId3FkVkdWS1VUTEtkUG9vZjFtK216?=
 =?utf-8?B?U3lYREJUZ0luME1mdzcvbFhyN1dySkdod2JxS0ZOOWtFKzlpM2g3OXVHTm84?=
 =?utf-8?B?RmJxTFdkc0FBd2c1UUM3UVdmQ01HcDZmMWVMd0w0UEdUYU54M05qLzRhL3dX?=
 =?utf-8?B?RU44UWpHdW9WcWZmVHNkL0tMNXNGaWNUcDJ5S0pZOU56QVJObkNwYmtXZ1Jr?=
 =?utf-8?B?SzBlMFVzaFh0eVZJMzhGZnBYVVNEUUhKWHZnMWtTUDdHWG5NZUl2dTlWbGdR?=
 =?utf-8?B?ZTBHYkc4MHM0MTBDTWY3dk50QVhBVHVXdGExQUtYdDFNRHJteU5lMnhTL285?=
 =?utf-8?B?Q21HRGZVK3d1d2ZldWNLb3ZtYjJjVFR3RXZrSWpXSUFMTndmU2lhS0c4ZnF3?=
 =?utf-8?B?aUZTWXJWbU83MzdkK1pzYUtWS2c4THhwOUM5b00vMGprRU1KeXdmWHVYQTlm?=
 =?utf-8?B?L0s4Z3NTMVF6b2paMjN5VVl2YWNqbnRTS0FKSytvYTFXN0FHekZVSTJJVWlV?=
 =?utf-8?B?c2FBb3hlR3lCd3ptQy84QmlRUlVsSndSTkZrT3VMS0o0OHhtU2RFYlVsNXJI?=
 =?utf-8?B?dm1KRTdlYXpPQys1S0JqOUgxeHdNb1MzZlJQREdGSitjVlJiTnRiSDc5QzlK?=
 =?utf-8?B?WXAyYkVWWmMwbDdKbldHNEppY2J2R3hRNWNBSXpGdUVYSFVkZFNnY2lmR3I4?=
 =?utf-8?B?MG9hZENTQ3VPWHhKUmNhWXFyaHY3TENiek1BeFNPamtkUW1kYXVnWWdBeFJ4?=
 =?utf-8?B?WGxVMDdJZUdMNEdHb2V4cGZrdVMzb3doUEFBb2lxMWVKTzhKZEkzWlFacTZP?=
 =?utf-8?B?K3A5UlhEUlQyRDZoejI4Vm5vR2EvaFRRd2hHMHFUNHFJMkRRUnhjRm80TjQ0?=
 =?utf-8?B?b2J2emtTbVNsNGthU1Ixa0Npc3VyU0laSXlJQWdjQTFrdExoYUZpUGtQNlhF?=
 =?utf-8?B?cUFabzJad2F4Q1BtdW1JZkdMdVRwWGhMbUIweEtPUnA3Y2RyT0NJb0lHUGdi?=
 =?utf-8?B?UzM4eUMxdG9Wck10WDBYWmx0YXEvbEl2d2pzOHdEeEFYaHY5VmhpWUV2aFg4?=
 =?utf-8?B?UHF2Ri85STZ3Sk5ENjJPd056YlJIalcxVURLeEl5cXBUU2hiY3duUDdrRGVm?=
 =?utf-8?B?SGZxQVhYVXZHbFdHYnVObHFNcm1tc09xbzdXR3k1Nm1uWk44cjA1Q3A5dWds?=
 =?utf-8?B?QXMxR0VkS3JOb2ZWM0FNbmdDTWk0b1dEVFNxZzJXYmRuYmFXM2dDUzVEV0or?=
 =?utf-8?B?M2RhM0dTRVBGVS9laCswZVM4ekdrbVh5bmxtVGNtOC96L1BmL2Jwa05qTnV0?=
 =?utf-8?Q?1MlSvvIzq9zpVXHMHdIxHwn6hMB7bcTc3lTsE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ea0f77-37a5-4f8b-b160-08ded06adb0b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:30:49.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61cieYfNTMZj4rPvy+Xbv9RSZmwqwDfLcBDnG/dp4/poan6Zn4KyQ/UpcaLV4uPPPBQdrg62Zaw/vNu8T20NZ72H4+hIKXOkkx9IbSMpxPkD4FgjvUOz/KZ6z6q3GdCK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12304
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-65381-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E87816B057D

From: Frank Li <Frank.Li@nxp.com>

Use fwnode_graph_for_each_endpoint_scoped() to simplify code.

No functional changes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 1791c02a40ae1..f90e01301943c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -187,7 +187,6 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 {
 	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
 	struct fwnode_handle *fwnode = dev_fwnode(rkisp1->dev);
-	struct fwnode_handle *ep;
 	unsigned int index = 0;
 	int ret = 0;
 
@@ -195,7 +194,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 
 	ntf->ops = &rkisp1_subdev_notifier_ops;
 
-	fwnode_graph_for_each_endpoint(fwnode, ep) {
+	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
 		struct fwnode_handle *port;
 		struct v4l2_fwnode_endpoint vep = { };
 		struct rkisp1_sensor_async *rk_asd;
@@ -286,7 +285,6 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 	}
 
 	if (ret) {
-		fwnode_handle_put(ep);
 		v4l2_async_nf_cleanup(ntf);
 		return ret;
 	}

-- 
2.43.0


