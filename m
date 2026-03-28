Return-Path: <linux-media+bounces-57423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3n2sNsaQx2kDZQUAu9opvQ
	(envelope-from <linux-media+bounces-57423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:26:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3175C34DD04
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 383AD30330AF
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 08:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C0C375F73;
	Sat, 28 Mar 2026 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mEiUZPLd"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A19022D7B5;
	Sat, 28 Mar 2026 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774686398; cv=fail; b=MY6NMqWqlqcEihuSrIaPR9cv0VSBBZB3DMvh8Vi79BjvVBonPjBR7IXGFGj/w/1D0s3OoNxh/v3u3RjZb3Ic3SZdcCcZmFfmg4n8ih9Nlip0efR177/DmLBJm3kyDOe4NYhxdBn5Qj7E4/NYzY7QQT0YVM2bREW6HpILrApmye4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774686398; c=relaxed/simple;
	bh=KYfNjK7wdVe67dwQ6/bhgzOVEuk45i9EBUewyNX2gF4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=V/xCiPBy9c2diMx3LCwYfHkq4IIeyCqWF9apGwvLbogwxRb3f4J5GzNAyjBqUZLOZRvHFZ0XPiLOlGE5K9es5wCi3hdWTl5rx2UWPqc/LbMnQx16voeXs/LH8aCEjHTxJauh+AeZB7gcwDM70b4v+maTIWSTF69wc/mgCzKMffI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mEiUZPLd; arc=fail smtp.client-ip=40.107.130.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynx+y79DF1uoK+CC+Vx4i1c5MrMS9rdKgbq2V5fdQVES9M3woy0mCwBnNa2wPMPndrPWqi7lfQnjLW1IJiRgXZ1S8SKtR002sOVw93CK8eYsy0tnpAIo1MCDIS8Z6cEAyVALkYo8LC8EQyRMNhORkPWbiGaKyIqd2wBohHCTktCQVbtbC0t3vwGdqi7YkJ3kNiabZ1SlNABjHa4RyxiKnH7Vhu4PvW9C6NcmfTDgIq1t3y5x0aQApapPlUSvB0gjZs5uITEngLmpy2OgdS02723x3JsWsuIOxbW5BBa/a6FxLc9TVO3lJLu14ThXuFyZoH3CEAqEMU8nt2flsikCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqDnu+EGjKnKqTUz/gYufddkQTgFtetI/JuGpcaNlgA=;
 b=FLbJwJwfOKbuW7fEDd/dh6NgWaZdPSS2yL5X/8dHlX0ALNO8KRvKP1NAXzT5pRZiRaYBmoV/HZaOnY+xRry7bjId+sXvtj9ue0uDZSwkY0QnldQKS6sDTssLOYYMRennxnfaXzQWeyxvoVXrpYGMxf6nlLeNg29LKT1Fse7QMjhTDoBseQeaeFi34lAj1+3O/aUKYQBi7Tz4NTEHNhdSgyXcEOqCO5MlX/wcC4zljbINLHjp9OjB5BHurmf025BjcujL+p7waRzO0wFCxgusHfbrIQXlvVYMBIOyW11qTaYsbrnwFKkxwNOERBUSdGnNVqtEwJG9jXLwS6aYxZvqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqDnu+EGjKnKqTUz/gYufddkQTgFtetI/JuGpcaNlgA=;
 b=mEiUZPLdL06k7wUqni1ApEDbe8NgDxa84we7/YZXXh9zisaB8+JIsrEiW2sC3w+p9ZV8sAh9wLh0fOBOyrDx5USh6fMfCkgxmPBUUD5cur4KKJCI08vjexi/7MgKmDFCGDw0llOL1wngzXyCYptha4Bko/ubA2O68kCjbE6D+XTmFlv26dX+Vvr2eYguukEPW3eKd36rnC5Lxggo2Z47Vz6zQawSvqZv5I8XDs9Cym5/dpjIfk9kjCOJwvWVOxj4MvmVMsZ2HAWUbYNE1IVE9WEl9GJEHKQ6rp7p2UnaZUTkcWuThlUq6SLXl99gVeOQAOzWgw3B940AAucC0oTvyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI2PR04MB10569.eurprd04.prod.outlook.com (2603:10a6:800:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Sat, 28 Mar
 2026 08:26:32 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9745.024; Sat, 28 Mar 2026
 08:26:32 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v3 0/2] media: nxp: imx8-isi: Add virtual channel and frame
 descriptor support
Date: Sat, 28 Mar 2026 16:28:30 +0800
Message-Id: <20260328-isi_vc-v3-0-a03b9a6fe117@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAC+Rx2kC/12OQW7DMAwEv2LoHBUkbdlKTv1HURQWRSU6xE4lV
 0gR+O9VHSApelxiZ7g3lSVFyerQ3FSSEnOcpxraXaP4NE5H0dHXrAiohxb2ujY+CmuyJniLBjs
 QVcuXJCFeN9Hb+z0n+fyq7eV+VG7Monk+n+NyaIhtEAzYUQd+MIEASLB35Po9GyZPg/gOWf26T
 jEvc/reNhbcZP/nFNSogwdnoTUe2b9O18tL/bYJCv2BEB4QVWhkF4bBOyt9eELruv4A2rr9kRs
 BAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774686533; l=2100;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=KYfNjK7wdVe67dwQ6/bhgzOVEuk45i9EBUewyNX2gF4=;
 b=L+BwCIRQVZcD8fU9HPqb3WTEhz034dPdGkgCgV2yz/pexrlAHsxE0ISJufIeNhgQAmcgDUwaU
 ayY18n5hbqDAKIs4GY5fLA21qCRJotS0wdKvOAucWA+n4RIaT+LcKzv
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI2PR04MB10569:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfceae3-6adc-478b-44a5-08de8ca3b7b9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 C408cnW+7tjeSBdyF8Wjhm4KsZ5vB0a/uMk2HXZShpBaIELqbodPvsMq6YfpWJp6Z0d2YM3btbj2wkZAIHySbalCY+K4qxpF/MrXoUBLLTSJeuwv7GsDYtdfv6YZUMLiIoYQVzqtGaPwuAYV7ex3oqzE183zGmxv9SAs0egnNZOKBNk4Z3yoLQMEY9nqXH8b3RpjBmx+ludvQTaCbvLVAbQTdZB16CJ48K46KsF35R3I9SF47VEXufy6y58fQeH+LLmBmyX5Obr7Q7JFdwhu6qOejZwMw8LtM7Us27/b0mXdLxGa4dguRhK1UgzdRUENFhJfSSv6J29rPPIF0QlDhGYPg/a5k7GL/Pb0dbcvoLZPcdxdeg6tvmj22SpY4f9gTz6iu8R6MVWwqnTUd8VilyMX4I8Htp5KtwSFPKMplhJcTo+s6IP6q4FHdEL92Km8xUySx5mvk+W5S77UkqaQWi7JHeEkCVljLyQD6eSd0H9J0hYFTRJ7QQown4Bf+hh0bZzOJ2lBh9Bv+ln7VLfaUyRarx7+TPwoNPBKSO1B7kyx8cP+nNv8qV3XLCFhcIINPA7wVon9JqggH0Dblo8TJukg/tW1NxrH276ZU+/1y2dDn2dXNMJDZEWQjWjX3NtqqEGyuoHa+vBdeihHVvglFu7cDQzAAYmxuUGF4tBcAJpGfz5l1MknARuA7dmZI6IwC7rcXe4CxHiE9FyLzkF2w/rV8HfEhMUBqUDqapWIEWYRDJvrNjoBG0C3SW3tg5SV
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UXdjT3IwVlh3S3RuODVxK1JIQzFSY0lMNEQrb0RCZE8vYWtSMVNIbXNaRFZX?=
 =?utf-8?B?VHAra29RYnBPT2lkU2pya1Jkb04yM3B2d0FvVzZ6YWFsQllFRjErTG8rWHY1?=
 =?utf-8?B?dU0xVlp5Uk04aS9HTlBENzErRXFMZjlxM1F3SVc2TDFSTC92OEsxZVU5WmZk?=
 =?utf-8?B?dFY3VXZOdEhXSGkyREtsaFU4blRTdTg3NjVIdDBtZEx5SmZjSmZGY01LU1VV?=
 =?utf-8?B?STFPcS9PTWVYclJRZnJuMTl0OVN0ZjAva2crNlRicmNDbmh4SVFqN3hHKzZV?=
 =?utf-8?B?N1lwQkhKVlIzcTJqMWZZV2QySVhjcWVWWmJBWXZuWnBTRmZNbjRNODJHQ0po?=
 =?utf-8?B?Q29Eb09DN29TNStnN28yN0F3bUdkampMeWVRREdTWHR4VjcxcDg4dXZ0L0k4?=
 =?utf-8?B?alNxOFVzTXhwR1VkdTMwSFppYWRmRVRPMFNaSGkzZEd5NmNjL3hIRjJ3Q2ZW?=
 =?utf-8?B?WFVWcEU0V1o2TTZMV2tHaDJlblVxQVlJdkZqRTB6bE0yMC9NQXhNZVRaLzgv?=
 =?utf-8?B?OWpDaWFNMnYzOGFLOVNkdDJwcDR4VmNYTWhXZjNHRmw5VHAwWlpKRzMzVkVG?=
 =?utf-8?B?bDhCc0dNeVkweGRtQlpZd3dIOXI1NHUyVStQekp1NHo0U2xucmNBaEI0NzZD?=
 =?utf-8?B?R2lPQVFRUEFrZUdXdVVBZXJKQmlNdjhVdk50aFlvKzNFc2V6a2JrRzdHZlhv?=
 =?utf-8?B?WU91dnMyTjZYRnpVTTJha0xLQlNsZHpQeVRhT3h5QURYa2xEKzMzRityNzU4?=
 =?utf-8?B?dkY3V0pKRDBpc0RVMFl5dGFZcm5yZkIwSzJKSDA4eXEwQTdxckM0YjRIdmVv?=
 =?utf-8?B?U2Y1aXVvbUJwdjdwOVpCZUsyUlA0UGIrbDgwZmJHVTFjRmxOdlZ5d1pnSnh3?=
 =?utf-8?B?UVhwaHFMajdTUXRKa3hMc1R5WDlPalFLSXFtc0puY3BiL1BqcWYrRXBYZTRR?=
 =?utf-8?B?aTBvbGExamdrVTFnUGZiUjFiZmZDelBuT01FcVc4WjdTOThEUS9tV1VRdHYw?=
 =?utf-8?B?eUZXRXBCdTBYa0NBbzJtbjZwRWwwdTJkV21JZ2hERGZ2bzNWcjFXK2NabjdB?=
 =?utf-8?B?eWtadVBBb1NSVkUzTTAvMGpqNFJEeVNZNmZNRzBDT2trMTFiNVlTUUVpb2g1?=
 =?utf-8?B?M29QczRoS3RNb1U2QXhreFdXcGc5aXRLSElVQTNUKzNkeTEwc3F1RWQ1K1FV?=
 =?utf-8?B?TGlhbnZZR2J6Wm1DYTRhVEtnRmg0bFBjYlNDb2k2cHdsYllZV05BWUhwTW02?=
 =?utf-8?B?U2xLM2tmc1hGY09iTXRGaG5hQzVxblNtTzRTWnN3R0NmMmxQNklTRXFMRy9j?=
 =?utf-8?B?YmlDc1ZwNG5Bd0hxYkRXa2RPR2pBbnJZdmpuU2ozTnY2ZHZzM2hzVU1CZ2VS?=
 =?utf-8?B?TXdrMzRhbTNMVDV1cDNhR0JVSHBwZmxXR2E4Uk9kYWV0alFSMy8yNHBWZUF1?=
 =?utf-8?B?U0pLcnd0WkRsbTdMWW85R1lRa1VPSEZ1c1RicHFvQnhvS0k3cGUzeWtac2RE?=
 =?utf-8?B?Z1NPUHpqek5NSjFuSWJtV2JBbHF4Q1VrSGgwWHltOHJhelgyU0xVZzFPajMw?=
 =?utf-8?B?SWF0TUpmK3V1VXNxV3BoMkp0OXJ4ejRwdnlxMGlHQWxheE9aUUJYQnZHNXZL?=
 =?utf-8?B?M3RxS1FvQTNRVHJ3d05xYlBEWmtzWUpGWDNueVJLdCsrWUlCZm8rSXVlSG5z?=
 =?utf-8?B?WHRVVXFCclVCb0RxeG5MRHpaTHdnbUxPNVdQMXNTTitsaGtmdHU0ZzJLMFEr?=
 =?utf-8?B?NUc5SUFONkdaMzRCN3lObWY2WWRPdGpuZ2xSSEl5SWh5UWZIRVVyVmtmaXNk?=
 =?utf-8?B?YzRCL3hpSnBVdlIxU0lmSkNJNG1IQjFmeWNCN01CbzNhU3JpbTdxZ0VxVmxj?=
 =?utf-8?B?WFNiWGFaYnhST2lGU2F1VnFMcFptSy9rU3NTYVVNbEt5ZE90UkFCOEQ5T3c4?=
 =?utf-8?B?MXNzYmxmWFBJMC8yZ1I1YTRFYUFEeVlIVGRpUEVKRnR5QVdGRW9qbnYwQUtL?=
 =?utf-8?B?MDBXbG83dmc1bVJSOGlieTlORE1HQ1llM0dacDJnUzZxVkR6UFVOb0N1Zkhh?=
 =?utf-8?B?WnNLcWxmUkRPMm1JdGRLVlkwMlVWZlRXTDEyV1FIc2wyV2RMR1h2clBNZmNX?=
 =?utf-8?B?eE5RdkNNbXY2bGxzZkw5WEcwRDNTbTNobG5aOHNEanVUanFISVFtQmlRUi9Z?=
 =?utf-8?B?d1JkdGlmTU5iM2ovWHMrMDhUTW5MUXFBSkhHQkhiQjhZSGlobVpSQzhPYUNY?=
 =?utf-8?B?TXhFVklhdDcxbkM1SFRJb0hRL1M0b29SS0NMT0RoSDFpWXNqbVdjQmVZaHo2?=
 =?utf-8?B?VmFmRE5zeWRXVW9JSGxJWjh6aXdkb0Jxa1pEM0RWbWRvVUdzeWJYUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfceae3-6adc-478b-44a5-08de8ca3b7b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 08:26:32.8398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahm30JHjI6ckYDst+7rUiEcnkfL8U5eingD38SK+PScKW13JGmyeN7kosn059M1A2yEA6mP87ab/hwgTDa81ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10569
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57423-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 3175C34DD04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series enhances the i.MX ISI driver's with virtual channel
support and adds frame descriptor capabilities to the crossbar subdevice.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- Rebased on latest media/next
- Add num_vc field to platform data to indicate VC support
- Clear VC_ID_1 bit after reading CHNL_CTRL for proper VC switching
- Set VC_ID_1 only on platforms with num_vc > 4
- Improve mxc_isi_get_vc() error handling
- Add back CHNL_CTRL_BLANK_PXL and document platform-specific register fields
- Add xbar get_frame_desc() implementation (feedback from Laurent Pinchart)
- Link to v2: https://lore.kernel.org/r/20260310-isi_vc-v2-1-acbf77db8e6f@nxp.com

Changes in v2:
- Add Rb tag from Frank Li
- Fix typo in comment(s/support/supports/)
- Update commit log to include more details about ISI virtual channel support
  on different platform
- Include bitfield.h file to fix following build error
  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h:23:65: error: implicit declaration of function ‘FIELD_PREP’ [-Wimplicit-function-declaration]
- Link to v1: https://lore.kernel.org/r/20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com

Changes in v1:
- Depends on https://lore.kernel.org/linux-media/20251105-isi_imx95-v3-2-3987533cca1c@nxp.com/

---
Guoniu Zhou (1):
      media: nxp: imx8-isi: Add virtual channel support

Guoniu.zhou (1):
      media: nxp: imx8-isi: Implement get_frame_desc for crossbar subdev

 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  3 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  4 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 97 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 14 +++-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 52 ++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  8 +-
 6 files changed, 174 insertions(+), 4 deletions(-)
---
base-commit: 2c8fe1f14240d75f2002e16b2b69c5c2d27ed41c
change-id: 20260309-isi_vc-285fd815140e

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


