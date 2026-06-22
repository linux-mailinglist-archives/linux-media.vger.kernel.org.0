Return-Path: <linux-media+bounces-65340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x3tpKnP5OGplkwcAu9opvQ
	(envelope-from <linux-media+bounces-65340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:59:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABD56AE011
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:59:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=tQVPRYEN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65340-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65340-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E19C300F0CC
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5BD3955D9;
	Mon, 22 Jun 2026 08:58:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81965393DF1;
	Mon, 22 Jun 2026 08:58:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118710; cv=fail; b=e+VeXiiJY9SQHHVPsnJiGGYxl2/Umbrw0eCykn+R+L2zcwrjyqebKZJeXM+fhMg+HLB/YDMMD3iUGjtwyJFw++PilQURO24t/P1Ptdtyaw/nxE3HbNtByyESwVmvJ7rRSfm9nfoAKQ7FjLAhkbJ4M77NWjz1cxYCkR27re2+O+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118710; c=relaxed/simple;
	bh=ETNNdhFmbhwpdDVhdET7G/plXHBuSEZXfGcUgWkRvkA=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=e+bsitQBqYbCSLYuLQ0AfS7kLpjKWsWPlUsGRxvMSrXbiVtQfCDf1238cIcu7CMr/BgwEAADOvMQzqpwMo/bldDWzLP3EO6VHHdDq/Np7qEvnaVILYhEXxYJaDSmlSmXOEOAxEpWFiVksD+KOxCFJzEYcN7k+1nEjyci079qbHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tQVPRYEN; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PflofQYkGKYNkvh/FeE2rjpffpX3H4DkAvJgDGhV0cAhqSubCvv0rZpwjy2hz6nHK0ma9z0Q3JfG3ZKzdLOJVvwO2ZAGHY9JHMdQi4HWTSoDMwCI5zbyQHImewoROyaF5woMSqVKaWdz/XAZlskzFZskB7HV8oh8Y0dDUi/ANxXgwTdbSfBz8Ub0PLH/srpG0uTKdGP2asOLl1nf51UAjj+xfn3NY9UA49shSsw1oBel+K2KKpgDjyCeuuN//u8omiGK9zerwWy9SLOqJlWRupUCKMbkEnF4/JyfdVYpRTwHpnwZ3OXi/whKYwK4KJCkxd4ppvmhguXwEiDtilcrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK63gOYxX9xSYGu9wfZaN0st0q6sKUAOJAcy+bhF1Mg=;
 b=i8pq3GO85pdlVSWhqC1e83IHDoKkAcCZ0C+c6J7qdZD+IFsizan93DPVKAZxcdwdjXTX4ZRp1tbe4YjpX4WBQTo8o50cpvW+cD5HJpkG3m1gCOfTAwSoHVpTpTiwFuQm4oR5iW0wJwws6qsp7BGktF8a1GKC06oZ6626IqX6KxjR6BFE4MTzb9cKVewU+1KgdFMqr1iE6QMVP1MCZNFEKbicXQ2gb+LwsiXKfAhKjg1E6/GI80KmHlq5BiA3p/XeQi5NcRS0KR2ITsNj4uc2QWeJITRWDnDbhT178D6VYe061jr9pWQhp4bM0R0hdo3wzvOwUriMLN4XPpqzdOd2eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK63gOYxX9xSYGu9wfZaN0st0q6sKUAOJAcy+bhF1Mg=;
 b=tQVPRYEN82YGVfwj0eVaOJGhUaTQYGAwASvbDg/hpOkj9iKmDQ1/YmDwMTCHGVoC/fkeO16/wh8Ngzq6mZLltcUwem/8e3LnAA5pCUAjHIOptGI+t3fJWhvA/10kFbc/moOXoNDS7X0+D59hixjX4kA41YLsWAg5Q7O11Y1+fE2WTTwOjDOC3QEKNOY4WKS/FhDa6/nA7tDETM1WwSePQRDhFG8vyyM0XaLQ5ZaUCFgZeuDnjIJ2MQ/5M6pzpCuBbKal2y3nOkEENLT4h5Gyfn3Gtq/M5iQDG/Dglz2ddqDRvCllwqDy1NwdzScZLkAuab31sw8Hq6Ew3ehWJhyDnQ==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by VI0PR04MB11765.eurprd04.prod.outlook.com (2603:10a6:800:2e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 08:58:25 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 08:58:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 6/8] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
From: guoniu.zhou@oss.nxp.com
To: Frank.Li@oss.nxp.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
In-Reply-To: <20260617-imx8qxp_pcam-v5-6-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-6-7fa6c8e7fba7@nxp.com>
Date: Mon, 22 Jun 2026 17:01:14 +0800
Message-Id: <178211887404.4030874.15403206352045716821.b4-review@b4>
X-Mailer: b4 0.15-dev-0e760
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782118896; l=657;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=ETNNdhFmbhwpdDVhdET7G/plXHBuSEZXfGcUgWkRvkA=;
 b=7fnLgfCZ3UUqCsksNJtt10WC/X8rGmPjCFSUGiFw++M9FiBIMl9Y693RDQHdShG2abd6n12Li
 XDh82+vI0LACpffjja3MZlv01u1SwNEUT2IjIQTJMRnChx91WBH56Q2
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|VI0PR04MB11765:EE_
X-MS-Office365-Filtering-Correlation-Id: 890f174e-5742-4750-414a-08ded03c6b4f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|19092799006|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 cNG1WYtYikihq256EJ4PTwbjTOOoidCJyZKlbCLOJM8Ls2RBMEcqXS8zaVY8kAJVXbPtwEkV0uMHt5/vzpq1DWPTkX6z6bzGPEA6IOjxt7eHI6xTI4RjCs1VScfeRAFm2dBUTw9LuPv9nDutS83gs6N/4Q9joNrWQOQdeT1Mnd9wso/01u7ZRTZ7S9LuygZZT00uup6Px2FfkkPKemk9sPV2XCZK2gY/be51tZcd0hvaxZlAuO3FrTdMrV3HRlZsUUHYpoQePcl/7nwcmMYJCxI1wB7Lxe5HLJWJwNpYxOjrAoZr28Fn/MxK06UqSHYXA5Pq5Nhum4Ity/dGcSZ1NkFeIl92wtp+M7xc+dLkWi+Ru2bxHdTEEhl7p3DhhqsPqDnJRvMlFNQquHrp6KNyHsqyJ6ovpuw4802Cnn9kvVay/GWcI9DsqQPnrMtgCUttj7HOrzPTtQgb4iuICdC7oTlthqbDkmIgcAkP8i6ieTdkE1Al2nimidzS+41NTYurUZrYEEvAh/Z67y4FYgZ9lcLtttXVATucIqydNmA/jgN0P7/cXy1oGMP9nmjxx5Xvkcn7vnNxgKeLeF7xqEpYXb8s663Cp+vjTYmXWULwGj6sMb6SLOYeSLwl14lKRAF2O41U60LwrflbcgXIakyyRH+4Vwlra0iBsUKsicM7/7U=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(19092799006)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RENUK0ZzUmdaK3AvejdDUGo1bEhSbVk5K2xIQ2JOV1VTQ0U4SWMwNmJkUUQr?=
 =?utf-8?B?V1BiVjl5T09KVTZ2OXBLTHB4S3RiK1RGVURJQ3VRK0tnZERFSG1OZjlPRU5h?=
 =?utf-8?B?aDBTNHQ0Y3lpRk5PVHZTTW9HaVF2dmlraTBtdXJPbHR6YjJRY0dwbVppdUYv?=
 =?utf-8?B?SGtrK0xnUnY0M1lkQXlQcHZDWGFjWDhSY2FOUUVMSFh1eFBRV0g0bU5TaFZF?=
 =?utf-8?B?a3V2ck44Ui9Jeko3ZDhaTzFqWnF2bUcyVVNKMFl0UlJwVVFWd0FIbGk4dzZy?=
 =?utf-8?B?SHdJWnczdUZHdGFmU2tUeDQ2OU1XdlMxUHJMK0x1ZG9wbkxuRUZ3cFJrZTRG?=
 =?utf-8?B?T0ttZUc4US91cldKYzN3UjdjTHBOMXlxTlAzckRYWjB2eU1oaTA1NzhVVEpP?=
 =?utf-8?B?aGc2U0VHbEJWbEdjWWRTamtudnZaWXdjMnF5VkNuMXFYUWlxQlhWeEVhREhW?=
 =?utf-8?B?VUNNMm5USkR2YzNvc2x6VTIzSnlrMFZxTUR3bVJUN2xWM2xReSt3QWVvektE?=
 =?utf-8?B?VGpLY2k5YTEwT0QzWnl2ZjQwSzVQTHVPU2J1VTZrNlJpZURpRUNvOVdQVmM0?=
 =?utf-8?B?QlIvLzJ3N1JXTkdMMWthL3F3NDdudmpjVHlLU2QyMURvVjZUL1N6N0NaeWJz?=
 =?utf-8?B?MG9KT0JPMGk3ckNYQVRDYkhEOHVnOEZsc1E3T1B0Mk5kbG50ZkE4YkVOZWRN?=
 =?utf-8?B?MG4wY3k5dEx3bGFmd2xWSjdya3JaRTN3NXZTTEF5U3hGMjVYZGtvZmRSWVBN?=
 =?utf-8?B?U1U4WldBRUpvTWdaK0x1WDRkZ1dQYytKVEFtZDRyelNQb2dRdzdwdm1PN2xG?=
 =?utf-8?B?WWEyb3E2Q2RhdzAvQ1Z5YWlPTlgwVnlTUVJqWlVYSEVjSW85VEtwbktyUjJV?=
 =?utf-8?B?cDBHSng1RjUwQTB3eGkxZXJZSCtGR0JldisxUVB3ZWtZZ3NnOWc1US9jQXJy?=
 =?utf-8?B?WVhCYjIxK0RhcFo0Z09SY2RnVHRtYlJ3eDZzc2xMSWVpSXRzMDk0MnFkS1Nz?=
 =?utf-8?B?bXFYWnd1a2s0bG13L1JqcEErNkVHb3BabDBtcW83eW5uNEhwRmJNL2dESC84?=
 =?utf-8?B?S2s3RzhPSHFuOFhidG9iSDkyM2MvSjdyMktRSGxIRHR6eEhqL1ZlS2E1SjRG?=
 =?utf-8?B?NkFtOHArTWRDYUxuQXo5OG11U1R5a1F0RnVFQmNxQjJrSERZWThVbkp0TktB?=
 =?utf-8?B?TzJ4TmdlWlJuYlgycnNaSVVIRHAweFFCb095MGRNMzk2dmJaMlBkeE5OdDNJ?=
 =?utf-8?B?UjhYMHdzS3R1cVdaTjBmRWpnSTkxTVhMRzQwdWdYQy8vN0ZweEppVnAwTzNy?=
 =?utf-8?B?UWR1MkNZTThPdTBSd0lhMFJaV1Y1RUlhVm14ZEJ4Z2w2dEZhLzBaMTc4Z2o4?=
 =?utf-8?B?K2VEemw5V3FWdWtWTy8yZEhPc04rSk56T3llZWFlbkNhbjByRzNVSkp6Q1dl?=
 =?utf-8?B?U25rR3pBbHBmWUdXVVZ3dmZjRmpoeitPRnFkNEs5WFh0dnF3U3hheFpIL055?=
 =?utf-8?B?eVJTcCt0S1NCZVZDNm9OeDFtUjVUYXhKRjdqTUtQOE4rYWVOMVBlczFiTE0r?=
 =?utf-8?B?Qnoyc0pheFZHM1NBRS9wOU01NlM1Y0g2OTZOWWY5WklKKzByenF0LzJjcDZM?=
 =?utf-8?B?OEU1ZXYxOTZHZ1htM0RsWktjcDlxYTdFaXF0UUdUODVCZ3NzZncyQVkxRk80?=
 =?utf-8?B?MmJxbDFBc3NhZTMwc0VUM3NWNmhtMHVzVzdXVzhVU1FWOUprdjI2STFWbnRB?=
 =?utf-8?B?S1RHVW9ySXloT0pGWmhiOEVjcE03bzdYRU9DS2NIVEcrbjNOSmVpVXJSbDEr?=
 =?utf-8?B?SkdsSGxSVmxpY3pnZFF0RUpVdmovZEVmZis2d3VNcE0vbDhBc2RDR1RBT0Vn?=
 =?utf-8?B?N25zNnMveUI0NlViYlJsaEhhZjRabW9Rb2ZwZTdsV2MrNm5Uei9OdEsvOTZ5?=
 =?utf-8?B?Zm8wb2dKalJCRXFQVzhlMXJOQmlBRFR4UXRPMkthK0FZM0IwQkpPUXQ2OHc1?=
 =?utf-8?B?WFgwVjNua2tFME0zb0diK3p4bDBsTmNWV2ZpazBrYXoveXEyd2hadzVNWlZz?=
 =?utf-8?B?MjhBZXR5L0lBWXE4UXJudDA4dS84V3Zad3h4eWpNOGhyWlErS2xkNko3emZ3?=
 =?utf-8?B?WnMwR2hkNTVCdDlKSlZzRzNWSHo5bUdneFpQeE8xSFRVY1VBcWFkTjUxQmJT?=
 =?utf-8?B?TFZJQ0piVThuR1NmV1E1ekJMTkRtZG43VUpNZ1l4OHhhUEZiTWhDWlM5Z29a?=
 =?utf-8?B?eTZDUzFrejhqNFJTaVNpUHBmaHdtNTRVU1lkTy8zVzEzYVdIUEo3a0lHNE5a?=
 =?utf-8?B?b2IzQkQ1Z28xWmtTbkF3alA2ait4UjBxUWoxdkVoUlFkVDdYZDYyS2pjRUN1?=
 =?utf-8?Q?b0sqNolw1lG2Fy+sCo89fdKoYo4hREVoDynmP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 890f174e-5742-4750-414a-08ded03c6b4f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:58:25.4424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ago+LPK7inbaxeGxJWfnsNLKlRWXrkGFXxFoVyCAG9ng8Cz9Hx4PhfuhYcHWQRKTijKL9WQKeVQ0fZnum3Ji/6h6yADwNh98nzVZ99SMfGNZp0baSk0zACjtt4uAelRV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11765
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65340-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alice.yuan@nxp.com,m:robert.chiras@nxp.com,m:zhipeng.wang_1@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nxp.com:email,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ABD56AE011

On Wed, 17 Jun 2026 15:50:16 -0400, Frank.Li@oss.nxp.com <Frank.Li@oss.nxp.com> wrote:
> diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/media/platform/nxp/imx-parallel-cpi.c
> new file mode 100644
> index 000000000000..00f5d5f47644
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
> @@ -0,0 +1,614 @@
> [ ... skip 245 lines ... ]
> +	}
> +
> +	val = CPI_CTRL_REG1_PIXEL_WIDTH(pixel_width) |
> +	      CPI_CTRL_REG1_VSYNC_PULSE(vsync_pulse);
> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg1);
> +}

The switch statement result is overwritten.

-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

