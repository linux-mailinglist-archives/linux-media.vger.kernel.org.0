Return-Path: <linux-media+bounces-65143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7CmHGur7Mmom8QUAu9opvQ
	(envelope-from <linux-media+bounces-65143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:56:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B647D69C43C
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:56:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=jEWBK8Jo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65143-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65143-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78D9230FF682
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164F83A8753;
	Wed, 17 Jun 2026 19:51:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B62D38B149;
	Wed, 17 Jun 2026 19:51:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725882; cv=fail; b=puTBu1+lk4cV/2Nbdp2NeTE8TcKPW6cC+RaxdnNanH8a/CubeKsJKgI5bpeO625XsgvKJ6b0U6WBlQrMyScqWZrLV14HazL07N8Ap7DKm1GMDCWXGfOMcQJqukM2PJo83CQRXuFlFTXBLafZrHqQ4RXE86kscKXnOpHEq7ucu+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725882; c=relaxed/simple;
	bh=328wXg2AEJzJO9gGKLomnbt14oWefxjp5ShVi6rP2gk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pS34eJTVpgj+Oesi581OGo8Gz5FgN8UBdfQuE1riJytOw/jUmcomsD+8+bBKblGiZd7A2YyEEY4B+fcVUFNi+X5sSLY9JiDLNuHHIjbN07cAZwl/TWTsZP+eNxu6udaNpwoM9BF2X1qnuCkGHC1k+NdELAhInob2N+pI7jJQC24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jEWBK8Jo; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCyQzfubtvDuTYMw0Io7+nwrAMu7CZCYHuoWfx2lTs1pRjz/ioMQRpoYTA4406GVt5VosXT2mVW7SnIUGFV26zpqZLVEJAIHUCTPCUboeViVTKGoQKNTPwtZ5RsaFfyxzu29LmdHJVeSyaIENk2sP9wtOBjMygwxwsJrESLWCCSDAiJmanOEoMT+3RVHRN+JDbg0JCzZkLo5GXmmK/9b2bEYQRngS+wB45A99Ra56GRTOVjeXbXw+enLe32IoIfycypCzbSwKtQJsoDOn0y6wXw3B+zYnw/KO906XWXfUwNw5gCCixk9xrhVTEj0PdeJjf9Os/IDwDye+gqi7AVTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sj+xfsSeTCnH5YCQfudWNFQXL9Mb6wGmkUM43ucUSs=;
 b=LbY0ifU6FWuJ+Sl1lUPxNMdYDp61FM9HKdZJeg4RGroCFUbIqPMgOxZdGo16wVXC5eX7z/0hMfp2WHLJk40ecpGfWUgtT0ZTkOM5QFlXVilkaobzpVrU7SG1pZ/ywpWRZ1gv99MZcSeYFDkIMalp4kHZmI4UI3+QcFljdrVXO75kB0EW3rD3GPF7KennXm/TmZKoiO8lWGfKAUaFJtL35pqUIckF/b9BY8UhmqFuaecaTIOgGOiWnO/XoHlvhZ88/Lccud5Nj7X0l7SIb8WaQlw9hGBiRdVu/SLCs2AAgIql8WZK9khk6mTs0mMqHylITLVb17rzetZ6rUMqgBi2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sj+xfsSeTCnH5YCQfudWNFQXL9Mb6wGmkUM43ucUSs=;
 b=jEWBK8JoMb6IsR1exaMW9F/AxPXs99UHC7mmx0AGaIaGS+p8pCA0Dpbqv4RgWQPFFIPdzQtsBkKfj7gfdrbbMRADfV9JSjJd1iI8NKYgTcZkQCak/k3RVPGvgyjknanHRBfcUqzue459RxXZmmic1DjbW/ZM201kLyiwfidCvW61Nt+aERqY/CQVfpz3cpm/jKYLaHXkP8ou+EjbasmwR9PzQ2QJnNOoMHjQE/XJj5owIl8m3Qa+ihEZHzeZAMgC26stJpARbAXFwK15q6zLcksdTnXmHHX+LoIYSDUBABx1URXbqBKBB41aPlEHc8YkFD02LX4uUUYL67aczh0DCQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:50:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:50:52 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 17 Jun 2026 15:50:17 -0400
Subject: [PATCH v5 7/8] arm64: dts: imx8: add camera parallel interface
 (CPI) node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-imx8qxp_pcam-v5-7-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
In-Reply-To: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781725817; l=2206;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LK/hncx3HqRc945tyn+QBZZuYVNHrkFw+ggUvCQJWbk=;
 b=Vr+qGzq7RqfN2EDWJuoTrgijDkl5QUrePBVPykDesxXWZjlP27yZ8+8xRXV7n7zB86QELpc0e
 N5IlEd0hr36Bvtb++CsOKp7tVlMceYiWBrwZ5/53nOlVBVqS5PujsBf
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0187.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: a15217a9-ea99-4358-f55a-08decca9bcb5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
 5hAZjKTUADguFeq3Zd3mXFc5fdmDzws0ypLznEgw+JVvLotsBuX/2F5peZlqZ6cRr5cplhMlqsUUUT5RMrhmnLyHwEqpx+Uu+7gZRIuR+pGnITTwklNfitelXVdoLfIVZ3pbk3Fs87/lkU2bXVAg8QK0znK+Bvz0djygcx+WiYml3f8tlCWGAw92SXecPWEGPHINg0KtwxRNpXkKXCYx/s55gZlfdOTZ/cRWO/oH+GrqmhGv/yl6mo149ylWH/uQ8deRY7vUdjaSppsBFzjtFIV4iR/aXU8l9Ptg7G9YhiskZsF5SScvDOeTo3s6a5OoAOvbM0wYoYoLU4HwprdC4JtTFQomIGYeHpGsLrp2s7lFGBffKEz8ohSxOJy1i7jVzYcVqIW5CVtrf60UtU9ikwqM2dOLTSdVbd6TUfKuk61Gzd9C2kvRI0zKG8czmnVSdODMYgkNpB1g3SuDQ85jG3pQ2MbPgVZn83vjChb9plEJjiF8zXF20iO+mz0XjjMlYl4Tzaxjxk7EvMZLwpt5/c3nrzx2UevxOATM+4eDz4n04e9gnHhRJbUFIsFoujZSV8cmtgFrypJ/6HOE6mq/XJPk8c6AHcpz/rMhwl68SrNe0wLaYf6eSX/te8SnX2PZLkyX6gVaxByJFSSQPYvAFc1wU/PhY31mm2YTWEpD5fyqLFa/c0Yy6kJA6y6orqxqeC1M2tSRIRUOOweH4UMYH6OY3e8CeIcvUI50LJOyrwc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZE5zTS9YZXNSTDJxd2JSVzhickM2NmZxUHhUNzVVeWdQTnZSTURVbmdMYTNw?=
 =?utf-8?B?ZGd6c3ExMmhCRHZyYjdkK3hkNVlkZnlCdlpaSDgyUmVsRWZFeGRwTFcxQVk0?=
 =?utf-8?B?VkZzeTl2VVZaV2h2TzZORHhQUHF3b1lieXdld3E3cjRzTjFvTDIwUndnYjd6?=
 =?utf-8?B?NnQ1SXpQUUpXUm9OMHN3MlIzak1HU2VvZEV3MG5VWHQxeXdTL3B3YnJQTzly?=
 =?utf-8?B?UFBYYUU2RWs3SXFJZFdrQnNuNllCZ29ESk1Pd1E1dnJVN1Z2RitPcy9aUFBs?=
 =?utf-8?B?NjdRT2NYRElRV0trZFNvTDRvZFhHQ3BUN0VIQUZNSlJhYzJrV1BJS3dwY1Ju?=
 =?utf-8?B?VmJSeVRWMlEvWGZ2YkVNazdpU3FYYWhIWHNicnhnYk0rQ0JhTkUraFYvN0dT?=
 =?utf-8?B?dGdQOTdoUHlISW5OUC8rWTlmbnNTM3Z2OVEzdWFYWHVKSVdock12U1ZzZ01a?=
 =?utf-8?B?Z1F6SXBPL3QwZ2ZySFZnOVNQMVFUaHd1Nnh3bXhhRUNxTElRMjl2VGFIWGI3?=
 =?utf-8?B?M2NnUFg4aFNKak9JU1ZscjNmNTV6ZVovN2VldFdHTkRKcEpIU2ZzT1Nzakl1?=
 =?utf-8?B?NVpkck4xNURrYjBsaWFTZHp2clFJVjZzSnoyT0xKTmVGN012M1RyV2xIWnZK?=
 =?utf-8?B?SkM3RGxNeGdsb3BHWHdFMzNyQmIydndJSDRRUllMMjVRNE5SNlh5VDB0UTdP?=
 =?utf-8?B?ckpkOWN4N3p0MGkrS1dhSVJ3VDlaUURUdWszSzlNYU1tTDBORWNNaWhsMzJp?=
 =?utf-8?B?WklxZjFuaVZlb1BINUc4RE5McE5sNnJwNG5KakljNGpmaFhSbk1hSURReGNO?=
 =?utf-8?B?T0RDa0JCWnluNnQvd1RoZERVVXhJRHd5Wk4zYWFZUElLSmJDcDducTFVS3Fu?=
 =?utf-8?B?Rkl1R0NOdGhsVEZpczZUc3ByREdYY21NdHZwalBkT25wLy9qRzFBcEk5Vm03?=
 =?utf-8?B?ancyRkllRkRYOWFVMVRUaTJFWU54ZzFpMDNDc0tRYi9HQ1lBdTcvTTVVclIr?=
 =?utf-8?B?K1BmRnI2MllVYUxPTmxYYWYwVndMQ1ZPeFlmL0JDYmtSWWR5Sit4cGUxQUF5?=
 =?utf-8?B?bmhYenVsbGhrUTVvSk1hRURsN3hjMzRoclBqZEQ3dzZPNUQyMFd3T2wrUEx5?=
 =?utf-8?B?Y25FTU8xaHZuL1BqV2ViVDAxdG1SL2Z4bkNIajIwWnZjbnpNeDRNQjBFQllF?=
 =?utf-8?B?Vkgxek0yZ05wdUFKaHFJOHVVeC9DT3ZtQXlQQjRPYXF3RlNzZFFlaWgwd0ZT?=
 =?utf-8?B?WFhaazVGbDR4RjZnNkNDNWJUcGlRbVFGSk0xU1diQlA3aDNlYTJuazI4Z3BP?=
 =?utf-8?B?bWxCcnA5bWp0eHEzaHhFVUJuTHEwVGRnb1JBOVIvNmVYalpLOUtIS1ZwMkZL?=
 =?utf-8?B?RE50QkFBYU8xZ3Zqb1BKcGZmcm9DMlg2SmhaZWU0UC8zbHJTTlpzM2dWMldW?=
 =?utf-8?B?TEZDYXNyT21wZEhyV0JQT2VsenpVaWxnSzVML0VwdnJrL0d3MmloYkNQNkxP?=
 =?utf-8?B?eDZ2b3JrT3g4TUVwbUtqK0MrZVZZOHhBZWhVZG0yMkdVUWl3Y2RKL0t3SGVo?=
 =?utf-8?B?Zm9yR0xQcGZiWlVtRnBRWGtKMkVVZ2tJNmZCb3Bua3VaRXV6ZjBQdGR4aU5U?=
 =?utf-8?B?d1NsRXVYOHBsbDNjUm56ckREOXZyL2UxOXdzQUhvcGR5M25GV0RHMjFpREVN?=
 =?utf-8?B?b2JYZ1p6dzR0aDFMOGdpK0RGd1YyT1k2VkdsdVFrSkpNbVB1alZDK053dStw?=
 =?utf-8?B?MFprZDVEL2VycGR5U3ZuVzdRZXY1ajhKQzIyNXJjeW9rcTRWZ3BQQmJZZVgw?=
 =?utf-8?B?ZTJVdHU5UlVmZTdZMlZLbmYyYnRhSENnT2g1aXlNbzEyeFc2cTRmWkJuT2JE?=
 =?utf-8?B?ZkJyalVuYTlrUnlOdzNUUEZyYksrTHVRdTFaTnJsbW10Unh1alhjV3JRazhV?=
 =?utf-8?B?R2FNUnVXVWRvQmVqYm5LMTY4SW04cnFjTXQwa21vem5VZ0hFamdGcUdBTm9W?=
 =?utf-8?B?SUQ5QzZFVE9oeG1rb3UvVFhlY2kzZmNPbzRTUGRyVGFxYTBvMDVpMG9zVDQr?=
 =?utf-8?B?Wkl6NTNxcVQrWlNPQTNXd1NvT0Rick1kYVVlUDJsaXZ0MHc1UGs2N204THc5?=
 =?utf-8?B?OGVVeUdrTW1LUGRzQWRFTmNzSGU2SzhLcVllQWw1QUxHTjA3OUtrWHdlaEtX?=
 =?utf-8?B?TkNabUMwd285MlEzRWdTVWJpOHVkeXZLVXhwcDgzdFNoTm5EazBMbWowaVdh?=
 =?utf-8?B?VDBsc1dLeVgzSUFWV2hFSFFrTy9JajRwQjJZeFdKRXVyUnh3bWpnSE9pL0pN?=
 =?utf-8?B?N2xRNzZPb1JNdWloeWRGNG5lSHQ1QmM1elRlSlMrR2FsTzd1d0Nubmx4L0U0?=
 =?utf-8?Q?erMqxwSdXQbYKGb/Ud4yYbGEHZ4FTDsnwt18J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15217a9-ea99-4358-f55a-08decca9bcb5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:50:52.2158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYsBuMgIb8cPIClKKzgjAm7lkGwGms/YQYhhZD8nm1MN4ygqQKzrXAx72jIDyvlzomg9JBZZ+thXfaSDCuUM/1y9PjHtvhRBvQAzXS2I1Qx8pWfkiCu9wqgCrEkuiLTK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8227
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65143-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B647D69C43C

From: Frank Li <Frank.Li@nxp.com>

Add camera parallel interface (CPI) node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v4
- none

changes in v3
- replace csi with cpi.

changes in v2
- update compatible string to match binding's change
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index a72b2f1c4a1b2..b504f99f6acdb 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -222,6 +222,19 @@ irqsteer_parallel: irqsteer@58260000 {
 		status = "disabled";
 	};
 
+	parallel_cpi: cpi@58261000 {
+		compatible = "fsl,imx8qxp-pcif";
+		reg = <0x58261000 0x1000>;
+		clocks = <&pi0_pxl_lpcg IMX_LPCG_CLK_0>,
+			 <&pi0_ipg_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "pixel", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-parents = <&clk IMX_SC_R_PI_0_PLL IMX_SC_PM_CLK_PLL>;
+		assigned-clock-rates = <160000000>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		status = "disabled";
+	};
+
 	pi0_ipg_lpcg: clock-controller@58263004 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x58263004 0x4>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 232cf25dadfcd..5aae15540d6cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -62,6 +62,14 @@ isi_in_2: endpoint {
 				remote-endpoint = <&mipi_csi0_out>;
 			};
 		};
+
+		port@4 {
+			reg = <4>;
+
+			isi_in_4: endpoint {
+				remote-endpoint = <&parallel_cpi_out>;
+			};
+		};
 	};
 };
 
@@ -95,3 +103,22 @@ &jpegenc {
 &mipi_csi_1 {
 	status = "disabled";
 };
+
+&parallel_cpi {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			parallel_cpi_out: endpoint {
+				remote-endpoint = <&isi_in_4>;
+			};
+		};
+	};
+};

-- 
2.43.0


