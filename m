Return-Path: <linux-media+bounces-53644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJwxMrXPoGmTmwQAu9opvQ
	(envelope-from <linux-media+bounces-53644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:56:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 502691B0A51
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A5B030B6B27
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 22:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BA645BD40;
	Thu, 26 Feb 2026 22:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K3+btOe5"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ABC46AF1D;
	Thu, 26 Feb 2026 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146554; cv=fail; b=uWO85iAgdFlx6+MgUYnVi+u/ZzzC0ru6N2O6kC6O90y0ZGpOLGlibUMgC+yqeSSdZEQiWHb/uYgU2Fk3wiXaiyR4ILCVrHLVzvsk4S53N1bkh4jjP52sXmMaH5vTKihO1VTQNk4JLc1CaV9jCfAkrBToQwCmiYzn44g93LjOy8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146554; c=relaxed/simple;
	bh=fsUf6IIpSVLcp0j/uAxMW6TF2yhD74kivWtCcqtj+GM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NL/san/8qRxG0FfrIm2hNgYdZjsrqKfKdQWoVgBrXOVW5Hw7Ph6IqDmMUP0qy2PlyW1Cv99LDxZ8LdhrxYOO3acVnFY5H0zwaokZxjMrj0bw/tumY9Y+9KYVCJW4M5xHBsywYNwsyDXk41iBCEWEESBoMEY3NxWKKnznxpIPwN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K3+btOe5; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCBcKaVNor6mVu7tz9KLGJNLqgkVvViMlViXRNNQL2fX5edp/4J2Is5EL5ou/i8ACLMuzBEK/kZu0PjadJz0Ig4lkyfFVmyWwxZxJA+W6As3N6jzlTIqlkZyNUSGS6GxGikNVq/5/ZXNjeU66Qm7eJAq5sGtqHs44btEkMS/M7MrOD0LUVTg3TgImc9BNpNOzmc/WqYH7LhHkurZfeRh449cXLAhOZa726bHpOFzcJg9E96H5HrgJDtYptCZ1PHh7UEWVCwCqjvZY3THNrot3GYy7vIBQGcw4/fVUHXeXDEoAWuwBZXEoI9Th8evBNzsFYXAuOWJK0g38lxNPFIIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FduYIcvCXSw5wIO1fZTQLRIMwIxZyLmbqrjnhOuBqUE=;
 b=tm77JleUrNX6IGjMe/Tduo1UNrpkaV1J1fNRYqIK1WNzXZQ2lwmZb6aVJGs8hVDycj4zprG6dF87/VP66nOPNFjXu11GkGGtWUYuG6jypItvhlbvtBW+HAIjx5Jt/Y3Ji21akJiZCKzU0DOKZUB8UCvelBOS3pNKqJKt6JLOUTdwSk91DG44EEa6neuvlOKOQ9fgzEMJjAEV+k67nPx9FvCOIici1f570PjDa+7NnbAqtfhb/kpg0hcN6O0UZQ1ok5vJuoZ8tB4SR47tu1MLM5t6tSk1inQiz4SqWN2wdpYsfhCqIOmezmHCysEN5eSZxPuuh2kYz/9Xf+tYO0G6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FduYIcvCXSw5wIO1fZTQLRIMwIxZyLmbqrjnhOuBqUE=;
 b=K3+btOe5TAj2KEndsL3hlVUWmTlIqnxYYVo4vkHwcrU0ieNk6xwSX/Fw75dsb9S+FtX7KQtFTxHTuNoAG0kRsuc+TixpRTtnZgCk5hgmJS3IOoXUf/8DDD2qfmJ7i09Z1uJqnIpGBjHCUWcdYbgB6E2KbWwCaugp3C5PC724OpSg/0+xi+umPU/HMBjX0s0k1DVXAJjFmxlT2D6Mm8Ulx70yVwBwmwbVFMhuw4Wgt9Hh4YUO01mnmOHD5+SQKEUTIZG7sdtVWyocoiUGhI3qJESVXeMmRsBvJxoOZxsLdU71iYQuCKeWPFNDvHHbpBVDKMdaa/M5iR5n/zMunmPK1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB12143.eurprd04.prod.outlook.com (2603:10a6:20b:744::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 22:55:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 22:55:51 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 26 Feb 2026 17:55:27 -0500
Subject: [PATCH v2 2/3] media: synopsys: Use media_async_register_subdev()
 to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-v4l2_init_register-v2-2-902d7140f9fa@nxp.com>
References: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
In-Reply-To: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772146544; l=1615;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=fsUf6IIpSVLcp0j/uAxMW6TF2yhD74kivWtCcqtj+GM=;
 b=kBxWVLeTsWV9gy1fKFlLTxiegO40pzO3gk+OuunHEwGFFefq3OhxeJ0KRnqu7jksC3UIJ23hH
 tpPFCU1md+gC5QqD7KXGOHioTlwy8DZET/FoMxMTFWLPgHTca6SV4ap
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB12143:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ecff31-e26e-479e-011f-08de758a30b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	ItJQc6H+wTW5KNs4i06tJf0LWmYCSH/MR1GvlmanM7M5+IFNbc66quOr4sqG+6KnEheDV3r0hzJkRkgTbdfkNvxtsenIdwkZhe3VUcKiexFdFp6z5U5Fz3SBtmYHQf7/ioZWPHRKjzSWOVTjd1yGO+Q7RyeQUc/+gJ/w6UD/LgUB8ULiDUBhgOSbSCgeqmVYb9hJwr8/olmcqBrRqOmtZgyVWsByKaekKAXvyxiAu/VN/6QyS0Dd9LmMQrDgjS21MFRsQAiKqQE0qlRrc7v2Tzj7tb1Vu0RqqY5rQ09QlFUY2myH5byg6OG8AJPL3nFDMVLY1OlK1BYm+riPNg9wNmScj1e9Rv0G7FJrTTBktC0GKtOlvT2I5BPfSDT4BauWUVxisBCtUNJAAiXbxFjbkcF2KYW0sBGQbeI9rURtyDqkRNZoS0iembUHGZvYDTh6pw4nc7ORA7EvwTC9dkusi+Y7DQbSL8vNbyTK+l3elSufWMhEwDF/PeSgWmQKP4Oc1yUV4aQYyniOY0onGdNMlIosKokEyiK0w8gK83yalUf0mMuEnaJbPL/aChxcXXL2q3ael6EbjLBKbCyHOKOvPL3PFJdHJQYyAXZNF7vMNJR2ZA6XgBcMdiSsGMdTmTibVbMEF74fkhZtH7wgrCTxEsjCDZlF8LDSnxzpyPBo+GDPV5tQNwWO10O/WxsWC3h1JkaaNbINJAf1eH+KQS97rzfcWDPMvdFEW8WBFCVXfzyPpWpfL/o2In7KEv/s/Fm2C4DWDQI72bwyqmYQhZM4O/E0B83PbCYBZwdv7b33wHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVYvdDZmK1pNdWozWFRiOEJLQUxxVWg3K3lEeFdOVWo2TUZrU05XOXNDcVNs?=
 =?utf-8?B?Q2F1dVhhN2xYUjIyLzhla1Vhd1FqaTFad0tDMDVEVVQraERoang3SWRwNTFU?=
 =?utf-8?B?Um1TTkJBNHpBL0daYnZHczBIUjNwRWEwVXF3bVQ0Ty9ramJUYVdWUnpWSnRO?=
 =?utf-8?B?R0NEUDY1ejcrK2gwMk1MT3UwNVZMNVM0anM3UGhhc3NNL0YzcjRMUE8xcFN0?=
 =?utf-8?B?c2E1d0x0YnliL2V1MzAydHk5WW03dnlxSWZ3T3hjZCsvZVhtQmNsMzMzWVdO?=
 =?utf-8?B?WEtZZEtKSlRxNms3VkY0R0p6c0VYdlFwemJOeDh5ak1vdDB0TE9meWJnQ293?=
 =?utf-8?B?SlVUaE4rSjFaODd1aWk1ZGFDLzZsZXgrVjJkYUJGY2JiZDV2N1g3bENFUE01?=
 =?utf-8?B?TU1WR0cwZnM3c2Fqd1VDL1BsTHk2L1ZYYndCbWlwM2JVaDI3Q3RSOVF1VFQ5?=
 =?utf-8?B?YXhCWWNRNUQ3bndqMFhOa2FQZXBxeGJjQm82M1JzZThueGJpclRMRGxtelR5?=
 =?utf-8?B?THVzendrWWxuelRYK0JHaldTNkRnaFhrZGJCWTlWeWp3ZjZaZEJPaUJPQ0Fa?=
 =?utf-8?B?YnFnNmVnTzZiZE9WME8xRGZuMFFQbktxb2NET2drY0U5dDBXaXhrRVBlZTNl?=
 =?utf-8?B?S2dLUUo3ZW5ZMHlwU2FVQmFKNmNJdkZSbXVFTkRwNm0razkyWFVUdnhzSHl2?=
 =?utf-8?B?THVOckdrZEJxSDg5ODYvM1JycGRPMnkvb2RPdmJxaTFXUjN1YlNUWHduclhN?=
 =?utf-8?B?NGRaeUlNMFN1Qjl1bzl5dkM1V1RTMVRvRWhhYStrNkVGZEJmN1lPakFjQ3V0?=
 =?utf-8?B?RGRXSHFUM09SdDJJRDFqVVViYTZHY1ZocjRlbEZVNnRETkxYTDI3MHdpTXU5?=
 =?utf-8?B?MlVmaWNDMW1Xc0dFdGRvdm9ycUJqeDFzSHNyWm9SM0M0Qm1lNE50c2t4V2xv?=
 =?utf-8?B?NmttZmJxcy83MEI3S2RROVBjbGQ1Ym1uMjVpb1p5Z3FXNW51a2taQVZEY1VM?=
 =?utf-8?B?OGRBbmh3NkJnZmUwTXg3OXZ4MjkvUjFrT3ovS09rbUdMZFdiR0ZZSjJUd3RV?=
 =?utf-8?B?YUdIT1ZvNXhiWjRiSFo4ejdML2lkckw3U1ZNS0pHK2RjNnlnelJZS3RMT2s4?=
 =?utf-8?B?UjUxMmhZRWZOSnB6NHorTW5ZZ3I3VTZGQmo1QlRvS1FVTndmSktCQS9MaVRP?=
 =?utf-8?B?Q3dWTm5wUGJ3dWw3WkJuQjNSaVVsNW81WjNKdHlJeGlFWEhlczYyQzFJZlpr?=
 =?utf-8?B?VndMbmJFZ1hWUFBGdkFVenFObEsrWlUzeUF2R3VMeUh6dVMraE4vaUJvUjJK?=
 =?utf-8?B?ODlFTVNoQncxR1Fja0NVYXFGbnFMcjNFYUU2ejFHTzF2UzhZY0ExZWMyTGJF?=
 =?utf-8?B?eWtwL2VBdVYvTWhTeHVUaUtZc3k0RjRLdkpuZExFVDRDaytKck9TQ0RNc1pN?=
 =?utf-8?B?dnVwQUdBajlFTngxVStEeG9MNnB0enQwMXFCZW55QktmamVSM3pSODRlVFVH?=
 =?utf-8?B?Y1FPS0RYS2k4UllzVGlyVnRwQ09aU1I4Qk8rNzliZGMwR0hjUWN1OTVxeGxW?=
 =?utf-8?B?cUxlZVlTMGh2dDYzZjNObFpXd285Wk9tS2VEVVNxK2tMR0FhSHMrMldyRGo5?=
 =?utf-8?B?dXZwOFdQUGtvNGI1dHVYaXBoNHhIN0cvYVl4dldUQjJXVXY4WUQxUXc1WHA3?=
 =?utf-8?B?T05PcDRuZmlRTVpaTlJQOVQvaE5lNXlvQk1TV1FpZEl5a1o5Q3h5VFNTcWVF?=
 =?utf-8?B?K0k1OTF2UUg3Z1pxbGF1ZHVHaFY0TEZES25ra0tyVnVVSGxGWlB0bk5Bckti?=
 =?utf-8?B?TnF2NmtWWDVXbUd6dGh2QTVRTEFna0lTQUs2a2Z6MVhOeURIZWRTQ3dua0Rx?=
 =?utf-8?B?L1pGZGFtT0o4bm1MT3lDVGVZdGh5N21pc0lTelFmNFdRYXcxd0RFTExyektJ?=
 =?utf-8?B?UVk1Q2xrVW8wenZRdWZzTmltWFljUW9Fdjk0dUhJK1BmWWROdTN6NHYwMmUz?=
 =?utf-8?B?Nm1vMGNWbnFDV2g0bDYzMk1xenlldUNJdDJmazRRdzJHKzdldVZIVDJhcS8w?=
 =?utf-8?B?MlhBYms4UGlJRStTd3pRVEpqVGFrUW5xTkV2cXlYeHdLNXBvOEJXemtFMFlL?=
 =?utf-8?B?WE10d29pdVl2WnhDc0VPWkJLVHQ5L1lFS0o0bEl1VGlyalNrb0hNUE14L0Rm?=
 =?utf-8?B?c2ppVWFRaUhZQng3ME5naXpRTUMyczJFK2tTREVKV3JsWndyR2ZzMjZRaGRz?=
 =?utf-8?B?M2FnZWt2RTlYZmJPY1dsTE1HemlyaHRWVTAxSkVzd3lmbUJyM2tPUTJIWlFv?=
 =?utf-8?B?cXp1U2tRQ1lOTjMxVm4zRzlFL21ldXJPMUxSRVJvT1p0azhQNUIyZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ecff31-e26e-479e-011f-08de758a30b5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:55:51.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPfY+50iC3sCTE8ApCBAjqsBX9XMAXi1PT9T4p4jGmxXimBXg6xiA5UHqmgSs6nq/V+9ASupJWoUv59u8TGlUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53644-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 502691B0A51
X-Rspamd-Action: no action

Use media_async_register_subdev() to simplify the code.

No functional changes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 5dc55b59d6aeed4b6cb207c8e2ebe0fb3c462644..1898b3c82efae6a74192bf987876a87848cffb48 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -681,15 +681,8 @@ static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 	pads[DW_MIPI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
 					      MEDIA_PAD_FL_MUST_CONNECT;
 	pads[DW_MIPI_CSI2RX_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&sd->entity, DW_MIPI_CSI2RX_PAD_MAX, pads);
-	if (ret)
-		goto err_notifier_unregister;
-
-	ret = v4l2_subdev_init_finalize(sd);
-	if (ret)
-		goto err_entity_cleanup;
 
-	ret = v4l2_async_register_subdev(sd);
+	ret = media_async_register_subdev(sd, DW_MIPI_CSI2RX_PAD_MAX, pads);
 	if (ret) {
 		dev_err(sd->dev, "failed to register CSI-2 subdev\n");
 		goto err_subdev_cleanup;
@@ -698,10 +691,6 @@ static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 	return 0;
 
 err_subdev_cleanup:
-	v4l2_subdev_cleanup(sd);
-err_entity_cleanup:
-	media_entity_cleanup(&sd->entity);
-err_notifier_unregister:
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 err:

-- 
2.43.0


