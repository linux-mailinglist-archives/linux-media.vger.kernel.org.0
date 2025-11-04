Return-Path: <linux-media+bounces-46240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E6C2F27A
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 04:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C7594F05C6
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 03:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C458627F166;
	Tue,  4 Nov 2025 03:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JKxw4SYD"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039AF277037;
	Tue,  4 Nov 2025 03:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762226521; cv=fail; b=ILID/I1J9F6/ufN4TYBvIb1HpXNB2yzQwJeQCnkMllxlvEVbbZB0jjiwTfWxaphtaX56CN6NQdk+fs4TwdEgoLB+6qLCVs6NRNwV4yBZH6/5LGsKRJO1M+jf79iRgtYRxJZAMLyuw3FxBKvodC4xardLQzInFxy8Fbn0dGrikVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762226521; c=relaxed/simple;
	bh=mt127yIyZ4L3CjfaKWbxE2euRUcBr30QnzObw5b2jXU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GzeXvvP38/JKXbhGfF+0PY/d2R9OdzMY2+SCnCpUKyfgzVXnsc03k+S+pEH4HmhjH0VVS0lsiSo8QS38um2m2CP17ODsRi0kuoXxypDItAmKGhGOxsDLowhNpmLfrzQRY+CnJ4fxfAhuqfoDyDlWo4Uw+WA0qekjLbT3Cb5Yew8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JKxw4SYD; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wycXKPGZeGlH/TMo3Xybx0lrwqc/BcQUPm3xg3VzD5QG7/YulV/YyLHNRw8B2pkGg91NCkQV+UJShDCqlQ9s22QowLPw2Y47KycOea7HkhAv4zog6CzAi2oDqKk5gfGzJH9EgaLDEgnPK9ywQ99/bDcerRA4L9k/AXIs+Ow7kDLBBgjYSfl170m+YAF/X0jLkEF7tJq6nXOsWpG+r/QthVE6Gjzx/iHA47GXHFSKuZjQ3uxKeA2AyHA/WN6Rcb+bjZIlH7u9CgT2UCD3FKu6E8kIismcZ0qKlS07/GmrZu3Ehwj8x2a2oANzWAwkk2EF/W/JtZgouV3ABrbDYCR0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdFiVuJHDnYK4lEFNmDOgipRBsqxUG+jH55+rWr/lRI=;
 b=ZWkQBMU3twcmiZW8YXxKhIqi0hLl3XrsQWPqkZc0EEdcchkwYY8W3ilwmeFMGH1o3V4oxyi4HOkzF/u30xzG49a96pjkdj4vVj6K5XTD2tE1BeS07UD4UGoxi4Qi8bJ5GJXXZnEYcgBwvArpyZ197oeCUUCBfXrTHxWjNaqq/pmTsQJr+VelNH87jfGfKVV2Z3Kz6s9GpuBqhKTxUe6FocB3sb/19mWg2Hq+smtibc3soR4KT5kh1ok8+QoYYyOzIGxBQ9dJool2F64gzgJJQBstfpR33AMf88pYexZ/KLK+Ga7td6lv9e6FgiO8CmQ0xIXGv0usQ1C2C1muUFvyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdFiVuJHDnYK4lEFNmDOgipRBsqxUG+jH55+rWr/lRI=;
 b=JKxw4SYDC43JHLCJ5up3mC3gYY+qrw/N24kSeDpvOgds5NW7lMmHt5ZuvxeG6zZZdzDKx5lYbFq8Mj5NR4BtHx1QGNtMOI7YeF3SMl9vXpiVysNjxNTeyKgKCDRP4thDZlAl9kmmrKaSgYZkNEpcyOKAXoRqAK1bEQbLm0qAESdO8S0Nbz7wcq0F/wSWhE4I6MzoUNGMp++HDLfpiyKWRbK8kXtbZrSgUf6VLRjij8CO8GaNgVEHvz6enBeah35Yu/EnuzxmQDOCh+xCOyl4vJx+dzoi7XFLztkbHsRySPZYh47y5H4v2WBcYc+UsIsY3ObCnDDsUE3lA1EuxG3Tww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:20:51 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:20:51 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 04 Nov 2025 11:21:07 +0800
Subject: [PATCH v2 3/3] media: nxp: imx8-isi: Add ISI support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-isi_imx95-v2-3-c05b7cb104cd@nxp.com>
References: <20251104-isi_imx95-v2-0-c05b7cb104cd@nxp.com>
In-Reply-To: <20251104-isi_imx95-v2-0-c05b7cb104cd@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762226484; l=2321;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=gnvecHE6Mauet66Qt3yYLsGzcoW58ew0cWsAM243R/E=;
 b=7t3Drr97A+MVp9RvOCGjDotrZs1OACvr6Bi0+rcaTSP1CsBuyC9IMBDu/fld3K8YXzN7SjhGp
 iiCGxByRjTKARglP11AcZrprymxbDHYfkRqN/L73NsUTUx64bPOxMLc
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0109.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: e2917b69-b788-4c17-c96d-08de1b5127f0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QksrRURkTWlaSkhyU3ptTkNrS28rZ3E2WTF2N1V0Qk5HaTdkZVVWd2N4Vk0y?=
 =?utf-8?B?Z3YzYVVSaFpMalBOT0hxOHRGL3E0YWlyZ0luS1RaWEt2UnF2MURNckNEd0FJ?=
 =?utf-8?B?ZXdiQ3Y4R2lnK09jZzc4RWlMemRMYjd4ajYrR1p6M0gxNERDUEVNVldyYXl5?=
 =?utf-8?B?czVkdjVlQ3RWdW91a0FJeVJwaStwVEVlQUdwR0wwWXhnbFpxUlZsUlpyMGlB?=
 =?utf-8?B?YlNKZmVHY2w5eVFGYUxuZkJkaURVbzJQUGdqNDBYZFNZUjI5RmVMSWVuN1hJ?=
 =?utf-8?B?cks0Ly84WkVCRkxMaG81aUpuT3BXaWpMRERMM1VXK3pyYjlKRXc5SjdzSjlM?=
 =?utf-8?B?SXNTaHltWGVKQkxwalVEODhVMFVFZFZLbXVPL1BNZnI3MTU2TGx0L1VWZmpi?=
 =?utf-8?B?dGRxNWpOb3lwQ0lWS0ttWkhGZ2xPVitkUUJZYkVXMGlsU0dxTVRsTmNLUGt6?=
 =?utf-8?B?ZldSSldiRjNvU050c3pPU0xqMTF5cXlUbkNobld3VkEvQ2Y0U1NockdxalYr?=
 =?utf-8?B?V3oxSVJ3TTNxak51VVNweGdibCsvTFdUUXh5REg0QkpZaDFNL0sydlo1Q1RZ?=
 =?utf-8?B?SzZwOVZHQ1dYczRqTW0yNTZndzNMbzhOeVBxV1ZZYjd1R0RFcW5LaWl4dFBu?=
 =?utf-8?B?Yi9pMXZ2OFl6QTlJWWMyOWtJQlhxOHQyREdOZ3RPZjlmU2R0RDMyVmhmYVYr?=
 =?utf-8?B?RjBmenhockZaeVpxTTNVQlAvcFVvTHNwbEtWSlJxYW1KZ3lpalhXdXVualYy?=
 =?utf-8?B?SXVLTzlTVHN6OWhRTlB3c3kwYVg2d3E5aldoYS9XVFYvWFJVbjRxRXFjU0lN?=
 =?utf-8?B?ZjNGTlVqelNBK0JORkZGeDBxS3BONWluSk5iNUNFWHdvdkxqejc3ak80UUQ5?=
 =?utf-8?B?N3lyaEQ5RHNHemdDL1ZZWVZjQi9USUd1UWEzUHc4cVAzanhpc1BzSkg5RGcx?=
 =?utf-8?B?VUh4bTRqVVg1aHA2TUd2dzg5dFhicmEvVkljSFVxdlhsdWxWanVzZHJjUmV1?=
 =?utf-8?B?VndKV281L0NBdUNZUWZRWGdVYXpHUHZJOFM2WGNxVW1WaWphemxXUVFtS3NC?=
 =?utf-8?B?K0Y4UUdWcUNTOUdxZWlmNHBRMTh4eVF1bld2SGUxTlAyNnZTbm0vbFJ6WU9B?=
 =?utf-8?B?Q0NuT2lqNDhqbkhWMDhXc0JWWUN6U0VsdmR6TjZmSVpGZTQ1c00wRFBaNzMr?=
 =?utf-8?B?aFZFd2xXS0UyMFRvU0hGWXhjUTJVbFl3YXhDZkUvejZnU2E2bUdxNHV3bVdM?=
 =?utf-8?B?aW1sdUEyQ3MyVWNDNE0xUnBBZ2JaUkFSa2M2M3g1cytEVmZZWVE5aXhOQVdE?=
 =?utf-8?B?Y1FodWVjZ0xkUENZS0VGYkFsMDJpTERkTEczYVAwTGUrTDRrdDRKR2YzQThv?=
 =?utf-8?B?MXVSbFZoaFRqUUZiZitIMW9xZFRDS3p3L1d3MktwUU5hdkhvSlFiSjVRSmNp?=
 =?utf-8?B?blpwMmQ4K05UaVVhM0lDdGhuUjB0dlRhQVk2THJta0xXTlBLYmdhU0dNaTR3?=
 =?utf-8?B?dmpuYW0wKytieXhNYmo3VjZyaWhvaWljVWEzZTF3MEVGeDlnN3pqU0hnUXVW?=
 =?utf-8?B?YlJkaFJRam1GYUNyNVZhU053WjZJK0VEMUhBTnB6TUc1cWNreUs3N0lBRDFZ?=
 =?utf-8?B?TWJndE93S3JyS0swemhYbjJLaEFHeS9VVnZTV2FPRy9ML2hrelNrRmI4UlI2?=
 =?utf-8?B?Yk1XTUNNRGFsUFdKUkk5cG5CUUp4Q2xnRUR5V2dlalA2WHlMaDBkdGFkc2s1?=
 =?utf-8?B?c25PYmY0ZVRzR2xyWDE1SVhZMzBnSDlQcG4yWDRkY3E1V29RYktMbjRZa2Ro?=
 =?utf-8?B?TW8yV0NrRXRqbTV0dnhJbXBhNnU5Z2NsRklOclFaZkY1b2lESUh1Vm9mMzF0?=
 =?utf-8?B?aDUvMEYzdGRZcXhyNG5taERPcFJlRUdmdUZDM09jSHhhOWtZN1NQd1FUWWJj?=
 =?utf-8?B?ZGNGZjBXQmNWcWdYZTdOYmp4NmNMNGRBTjhJYmJ2YlZPVjllck1aQTNQZFJy?=
 =?utf-8?B?Y01qblFVbW4wZndZcTdTUW5OSGFDc3d4U2Y0c2duT015dzN1VkZkcmVsMCtH?=
 =?utf-8?B?VXJWakZIbGg1aDc2ejVzSDFjVG04V2UwZlIvUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z3JIaGVQS2pBNWdoUWNIc2hYS3R0RXRWenBZM2UxVFQzbGpHOUE3WkpNUk4y?=
 =?utf-8?B?QzBSTlRjUkV3MlJ5eU9iSmtMWVBseVNzVUlsZHoyTWMrV2hLUzhneDZoUmxx?=
 =?utf-8?B?Vm5oZE5GOG9yb1NpMFVUYUhwaXErcm1TRU9rRUw4Wk1mSnJOcEtXMDhiUDNW?=
 =?utf-8?B?UDM3YkJhRk16eWU1bHg4V3NES3NXUFFpVzhjNTdWeXozMWNMRlh6RTZ0M0sv?=
 =?utf-8?B?WUh6RVdmaUdYRWdRMTJ0SXFVZUhwcmR0ZGd4ZEMzTURFcTNEeHgzQ2F4K0Zp?=
 =?utf-8?B?QjVyVnRnWG5tSWM0K2psa3VJc1VRUU1Pa3h4SGFIZnNKU1dDS25xTmxVY29B?=
 =?utf-8?B?bzdDZC9uK2FzbEZTWFVNVlZkTjFERzhCeTJZZjBuTDV5U2JVb0loNEFhek11?=
 =?utf-8?B?Q0VQME5ZUndMTDI5UXZzK0lXdm1PRklzMERvRU5rOXF3VDczK3F0djAxT1U4?=
 =?utf-8?B?cSt3TFNZMm9aUFlzSjUvZEk5NHV4VDBaNGhlWG9iOGdieTVsNFBlSWtGc1dx?=
 =?utf-8?B?amcxL0pFV003MEl6VWR2dVUxUCt2dStUTGt3UEhISGRXSUw1elpubkhZdk03?=
 =?utf-8?B?UjFLczk1bHNheEFMdlF6U0FJRm03Q1MwRXA3cjhSdng4bTYrRURxdm5RVWpW?=
 =?utf-8?B?Z3RUQ2lWN2pQU2lyVjg1K281L1BtZFhPSmpIN2hVTHhPQlA4SGhTZDlsQUIx?=
 =?utf-8?B?THh5dFBkNG85L3J5RkVHUDROOXpqVVF0bmxpK0drNnhxYmxvSjNOMk5JZVRn?=
 =?utf-8?B?ZklQaUlocjBmMGZweU52SFJEYThmQS9wb1FVeDlxNXczYU14dllXWldCVHBx?=
 =?utf-8?B?WDFvK0YxMkF3SEk0NjFGZFFqeUxLaE9XWHNMS3ozajg5UFpsem8vN2R6SGVW?=
 =?utf-8?B?ZDRtQXBORGl3T3RXWlFGN0trODJyakh0RDFlcDJmQ2U1WnMzNlJzTXVsUDd2?=
 =?utf-8?B?U2NtSWdLL0ZiUlJqYkhnemY0bDNhWS8xSzcvampsTWNkWVpFWmtrR0NjVU5X?=
 =?utf-8?B?dnBaNDFnb2s1RmE2cG1JazYvcnBJMDVVeG9ieFMxb2drdEtaTHZnMk9OMloz?=
 =?utf-8?B?NlM5R0FGZEFXbm1UUHJwNEQ4RXhYc0lDUEFORDdsTC9EN0NTaGtWZ0NadlZz?=
 =?utf-8?B?REVneFQ1WXRRejBxOTltMTg3cktMZElHMi92R3ZWN095bG42N29nYk4yREZr?=
 =?utf-8?B?RksycWdxVjBnWVBaZklwK29LRVQ5N3hzTnFsempUblZnZ1ZUY1hoMGd2ZnNQ?=
 =?utf-8?B?OU80TTd1TUlOcGxyS3RISWxOOUFlaDF5S0FqcU82U28rRENQWWV2Qm44WDNm?=
 =?utf-8?B?NmEzKzRYcmlzSWEwa0E0aFVrOGRBK3NLR1VPRXhvbEFkYzVuQnRPY2VUR1E0?=
 =?utf-8?B?R2d0WjNEa1FwVzZuUVRZQmlUUjFjUkFiZDg4d09QRHp2ME1jN2NTNUVKUkky?=
 =?utf-8?B?S3JWK2ZYQlVNMWVyMG5IZk5UUk1mOWM0Wk9FZGkzT2hwcnVJMGNGelVrcUhw?=
 =?utf-8?B?QWRxR0JCQ25KWE4wQlBlTUQ1bTRaRHRxbVlwZ2ZDVFBqY0ZoZ0ZjU2MyajEv?=
 =?utf-8?B?cStTQ3JYL1Q5ZjlrS1FaUklFa2t1SXMxZXJQYVlKVitnNm5nVGVabTdQZmU3?=
 =?utf-8?B?TFdvZmxiWTA2b2lHMklYMndxSWJIalJqL1ZmNGhqUko3a1NRdlM5NkFaampo?=
 =?utf-8?B?aTZlMnpDVlZUM21Fd0ZNV3ZwZHZmcHZ4WTExTjRWWTdSREVsWWhoMkRtd2R3?=
 =?utf-8?B?b0p4VVRPNUlWeWtGZjhmWVVNRUFROVRINjAyQU85elJjY01mWllLd0RRQlB3?=
 =?utf-8?B?cGZOTXoyV3pkTFBuQ01UQ0ZUQlp6K2lQT3JyTzc0c3VKKzlnNkZoVHdRaHFZ?=
 =?utf-8?B?bkNwc1ZMNVJqcWhOV3FYNkRwYzNrTHVGSklRSzRDZmdTUEJOMU9SYWxXVlhp?=
 =?utf-8?B?cmxJR2hGbG02Sm80NlBjQjM2UkNKSGxRbUpCUWZTeXhEYXAyNXhjS3VrQVpB?=
 =?utf-8?B?Rlk1aGM3WFRvN1d3djJIbHlTTFZacnBLdUtkR0h5WW1mUDNuVlMzRU1jNTdW?=
 =?utf-8?B?c3Z2Wis3TUFjT21vWVRRNVpCQ2RtTGg3TlpsVUZQZkFVaFJuL0dWeHQvbG8z?=
 =?utf-8?Q?NqYEV8ENpxY5UK+v1aDWOMdIa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2917b69-b788-4c17-c96d-08de1b5127f0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:20:51.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXeXT7YFRLg5GByGH1pcTqmqhVhLaS2VupNRgphzrkEH1Lur/ykmsMMwsBBQBxGZXjzpY4VNftJBHXkdRkdgag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ISI module on i.MX95 supports up to eight channels and four link
sources to obtain the image data for processing in its pipelines. It
can process up to eight image sources at the same time.

Add ISI basic functions support for i.MX95. It works well when system
loading isn't very high, such as no ISI buffer overflow.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 12 ++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index adc8d9960bf0df87d4e475661a3439beaf5ce9f6..cf609320f19e91c9c0f57634fabd62e0ff65123b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -337,6 +337,17 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx95_data = {
+	.model			= MXC_ISI_IMX95,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= true,
+};
+
 static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
@@ -548,6 +559,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
 	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
+	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index e84af5127e4e7938e55e31b7063bee5e2cd4cb11..e52c7fc334b0f5624ade600914c275e7539290b4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -161,6 +161,7 @@ enum model {
 	MXC_ISI_IMX8QXP,
 	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
+	MXC_ISI_IMX95,
 };
 
 struct mxc_isi_plat_data {

-- 
2.34.1


