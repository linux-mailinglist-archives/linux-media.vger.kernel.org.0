Return-Path: <linux-media+bounces-53806-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JXlBF6Iomkd3wQAu9opvQ
	(envelope-from <linux-media+bounces-53806-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:17:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5191B1C080D
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39299302BBBD
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 06:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2BA344052;
	Sat, 28 Feb 2026 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C6LCVWTt"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011029.outbound.protection.outlook.com [40.107.130.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A791E32D0DE;
	Sat, 28 Feb 2026 06:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772259410; cv=fail; b=FSHCXVidikuynYNRQg+kjfG5UKMBdrwNKoRw+44jSLeU6TPDS2bWVrwYmCPMAhAFw0jtXPvYFL4PMINztksIZaz10r4svtCwOTjj6y4o2coG14xrQUKFP42bhcZhR6Tx6DCuUQdmNcl0lGPv4oJCmgl9PHtw2oHixI9fPRixcBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772259410; c=relaxed/simple;
	bh=U9V4p3O15qLERtuol4xbCMuW3rDCwD8rpz6Jy6qSn7Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cteVkYS25sb16exTMcUpGMNe2TltQI6mhOTjeoJ5d7zHYqlZaIPZCC6l70ldKw9nVXKXZhOjQbI/doCuCITfRrhmEMXGC00LCsIECs1up8XHL62CeVPVrOpHc3kH6Hx2SL+nIQinvVXQS8uU2LD8EgklRqnudJAxZJDNI9JuORs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C6LCVWTt; arc=fail smtp.client-ip=40.107.130.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8iEN4Q+DiTGbdBm/XbiQDEEc68hKd7nBOD9M9FLeB80kwDtA6ArUWeE4YVzYi7s2GyLoFzVvVtXmvSxJHDekBY58StzZmK99gf6wc4XQZ++ZVkCHaAG0gG8X5var07XQukGig6GBBeBUT0ZaJ8Z0ngW9osuA1sL7AYWMj2JbqsewxDuu5lGrsNafRCZAZOvDAS+sEUgZ4EI4kk7PFhCAZ65x9z9j0GqJfMs7exqr6sdbrM3apoTDbJLeC3zYvlO+EDkYYoCqUv0T6eq65bgvjsFRuhswpU1JTu5q7UpuyqeTfnKA1gfGMC1cQd3vcLaMlhTDJlk5BmHY1wm1eZNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caNM3hdkZE/An3NztFcL0ghgQt/OaD1VdxgcinfnqO0=;
 b=qx6h33vr1atoFMthBYtg/QHdoL762IushMWO8m2GkIdIqnPQ995XEMdY8KLj+zRgPR8tCCbHskznOf+zlM23VCna7rrUQ0Ch6XI7wxRwu4C9fw4iastWt0pJncKsRbIGm4D29ye70FHIJPQBiswTIZQybVGRrpXJgB9ZPTbgH9EL7zFTwl5MMgF1wHq+cs7MKCoDOPe9KPPGJnKJIaU+bMEmd9TkNWsqIpB+1hbbhC6iTas0udP6/tKHSNSGiYqJEEQ/fzwkbJ0lXOpimRammBy6v/BDPnLSK/PQkJxZvHB4GWSsKEM3MEQTbIffPlW7PcgR5sNIWNDaclpQ9w5UWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caNM3hdkZE/An3NztFcL0ghgQt/OaD1VdxgcinfnqO0=;
 b=C6LCVWTtm5eQUgWxJQEIOKY/7cNAlmyxBB08GcUl9p/v+j3VNqx/pq8gZCoZOl5rkvsrQJJO/OCYq/1aGHCzSNm4PRYlyttyYfuF6Qp/pGqD6/BGsSHLAwLPM3wJJe5xe2SQPehSSUEyhsn3IFxdCjACsb1VyOTnmttpDWh6Wv7c3NTbies74gfhwnJs57IcJRTOx/2OKy8WOu4ulHa30/ywDp13iVrLiQ+sgDuEqPbwNtefVduyq/g6Bi8yoxw4uecsIylTC58g8vTtZ6nUXsHgxejpJYKiKez95QMe3hHVwLVMIt7eZzaL/hQT/pB/Ymb7Wu4aC6WwfdvigzDSNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB9809.eurprd04.prod.outlook.com (2603:10a6:800:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 06:16:45 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 06:16:45 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Sat, 28 Feb 2026 14:18:19 +0800
Subject: [PATCH v5 1/4] dt-bindings: media: ti,ds90ub953: Add new range for
 remote GPIO data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-ds90ub953-v5-1-056cf07cc8f1@nxp.com>
References: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
In-Reply-To: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772259522; l=1841;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=21a6bdBK7h3nUQCJihSk+ktGvnCQDfZ7n7hYzpkEEFU=;
 b=Vs7LLOKztEYYvzagol5PEj2NBgwlK3mCZBHatqSsHj9cvadPzRQDboCj38TU+LteAVXGoi/v2
 gGagVL2aFBIDKsJpylgiiinL/+C6F7qP+5LL2golG357HiRb2mJdr6w
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca04bf1-9a16-4bb7-ffa3-08de7690f2c5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	g0FxIlNKdjkprqJwHLRKz0+QFyAEgSqdjQaZGCP3PipAUyT8Z270LTGaEI8/tB0syXRhCjtGMQMWZeaqYnMaJlXLRXUlDIfYPoBTtqcLRnDnfKEBZpacDWfzfOpfqg6uyCV+VFt1lKCqClZCHeNPgzptKpxyWUJpyRKsWE+xxkEUb3HoOG94Fh64XSb3XIP4c19/4XTFdQxfIzYsXEmuBDf7M581N5OleauRte3nhWE9o9N3jhn+pLl82EnRmkrGwvy82nwJxEM/OWTJsnp7IOlxgkg4S8NbIazna9Ol/Lei3rI9FE/UzEL+J53/+/PXiy0uC3bXMPTrOHUJVXW/VB1AXu+4qfEzIlbZSo1iUsG26wM+Ch9EGUpULx/Lo3RXMrv6bb2rG9zXoqkB4xAIWy5dTWMCuixFrEvzXtwVb7tY3IEkTy6Yde2eIQQI5SFLoUQBrRIy6QZdzQFlBrrn2uI7BlMmVcWH063lcaERDNxWpvjb9yb58J8LFJ0PxJdrSQwpj41MI7u2BJXchMfcFJspiRCzh99J+b1FHn+AazlUdmDDMp4Y0g4RfRBkVK8astGtKxS5Lj2FtBH69Pj0l1KB0mwMUBYCeK7UEs2VCLX/dSaBX6GuLCVCpmubGBGw1clb8Bd3LOATrpIvhSCTRmWEVywhQatN5E9KyYEuNCgVu4DVFakbNvYwXBWbXtNaRy/q9RTkMhkf63uDyu7tlTAjd1NG5LPj2ZcycgWplPBJbo4l4UcctMC+EXxErpYqSqUdi2ebwWa/ov+Om1rd0FSE2jTlQtIWlOsjQ43v1p8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDBtaFhZUU1qU1Jqelh0aHVneWNxcWN1QmxXaWRaNEFPWVJCdElhUHdYUFUy?=
 =?utf-8?B?YjE4L0F2WDc1ZGhkYlFRekpTb0p6RE0rbDYvS2ZiMDVZQWdLNlVGZXE4VlE2?=
 =?utf-8?B?djBOc3RqL2FibitSbWhxeWdOYmg3eTM0UHYzb3dONE9jWmRaQmpPTHNIKy9M?=
 =?utf-8?B?Mmp1WmVZUVJUUFRoOG5iNDJiMDNoQk1pUzZmR3NadkNIbW43Zlg1RVdSSWY1?=
 =?utf-8?B?STJsZGE0VmZpeUIwZkp5L3V6SGNLc0lyVTlFcWd6MkU0ZU9Fb0VReUF1U2RD?=
 =?utf-8?B?OXZST3gzYjJlQzJFQUZPTUtjWWN3c1RudVhqb1BNamRGOTQyVjNnOXBrRERX?=
 =?utf-8?B?OE8zQVZpVG9SYkluY3VDSE1pN1RIWGlLcFR5bDNlYnZreXZNcFJicjA3Mngy?=
 =?utf-8?B?aDhIeS9YRVY5M3h4UTdHVWlvQUJLVDAyRkF3ZVl5TFdxWDd3YmRIRGE5Zkpm?=
 =?utf-8?B?dVU4WFl5NFMxK1oyMzYyVDRZWDhtbjRhcXJ5SUp0RmJDVFF5M1F1ZW5MckpZ?=
 =?utf-8?B?RDhFeUVKN2pzQ0FFdkNzdVpKdXFlZlNlUmtsSTU0MUVCU2dkcE9nNVB0Vk1t?=
 =?utf-8?B?bVk2cnorZE9wZG5xS2FwK0E1LzRpWmxhaUFKaEtrZGsvU21FQWZJU2MvTzA0?=
 =?utf-8?B?SUxzcjBNc3BrRGYrMG1aVG00TndTWVJPczU5V3VaeFpKVWZUM2xXSnROeC81?=
 =?utf-8?B?UTZvdmtEV20zc0RHamsvbXpXR0NUTVFMTjZhcTZvaklINFFqQWpFMU85VWJE?=
 =?utf-8?B?bjBZUXpjWXVVZG5Za3hLbWFZanBCRGVpWTc5eXQ4TnZBRWt5SWF1N3lnblVS?=
 =?utf-8?B?ZEJPK3VRWml5OGY1bGFCL2srSjNhaEEwMlNqelJ1aEx0THNUcjB2cytoT0lX?=
 =?utf-8?B?MG9KZE5QRHRoTmhvYVZOOTBtQ3B6Wkw0Z0R0cHNxKzhRQ0hXQmxnSnp0QlI3?=
 =?utf-8?B?WFY4VE9zVEM0QXE3ejFOZ1paaGZESm5CSTFMWWhpWTk5blh1bUtIYlRmS3R6?=
 =?utf-8?B?cGo5TXp4dytRbitOTzlwbUhwN0s2YkZHRG43c2JEeGhPMzVUL09yQkdZOCt3?=
 =?utf-8?B?cjdmaUJFbGJIZ0kyTFM2bVRYWkVjVnA0anpwK0hnSllWQTRxK3NlKzhndHpK?=
 =?utf-8?B?cmdpaCsvNGRqdlNaSEhuUHNkY0o2dHRrN2JRanFpTzBZUG5ZakUrbTE3dHZJ?=
 =?utf-8?B?M2NSV3ZNdlp5cVlINWxyczFmNkptSFpMQ3VOTXJWQjRuUVJOaEJPOFczWkhH?=
 =?utf-8?B?MWd0ZzVJZXpoeVVsbjFnSGxhUlpjdUxxbExZL0VoKzVOc2tTcEJqMUFNTDhn?=
 =?utf-8?B?djVpbE5qeDdLN05ZTlpoLzFzaWlGdnVrTkFJMjNxRXVTcFVSYnZYaW1MZ3o0?=
 =?utf-8?B?M21naG5BY01pTXRTaXZLZVg0clVKYUlJaW9jSDQ5aDE1OFowcHpWdVZ4cmZU?=
 =?utf-8?B?c0ErSisxN1JxNTBFc2JHZ092a0N5VkJXUzNEazZrdzl5Szl3ZisySDlGbnAz?=
 =?utf-8?B?NENvYVRyUkh2cUN4YzhjN1M5TjRQSXkxRXJJNGFqSnBxaDRqN2xHK2FoVm4v?=
 =?utf-8?B?Y0xnWXBBZC9tRjYzUlV5dm1Ed0NmUG1YOVZsVEtaVHBZcEFOVzV3YlJuOG41?=
 =?utf-8?B?b1NtZVVnaTJYdjBXK0g5NFpEQS9lUUlyaXY2NHNyMjNzdmFnRzhSKzdPem9C?=
 =?utf-8?B?TEhaRVFnWUpJdDZzU09FbzRtZERhZHFNaDdKUURhK3k4RGxqQ21zSlRVbEdl?=
 =?utf-8?B?bldoVzdheEVabkRFTXJqNlFoWjRIS2JBSU00dVdHdXBOMDZMbGFGZ25odFM4?=
 =?utf-8?B?bnAvZ2I2anZianRNU25udko1YU5rNkF3ZStQVjM5Qzk2U3RpWk9UQUFaUGpm?=
 =?utf-8?B?Y2tVZldqVStiVkgxSDlUMVplZzZjN1QxNWIxaFVpWk9IK3ZtTDc2VHZONEMw?=
 =?utf-8?B?WE1LTXlpMlBFKzJUUFMyTzdHaG90eG9HSjE3MmRGU0lWL1lsOGlLZnFBbWVw?=
 =?utf-8?B?ZG9jRmx5V2x1WGJNTEF3Zlp5Ti9mU3pDYUVEQlRleVFra3NHdGFRcG9leXNM?=
 =?utf-8?B?dEVpT0JRZ1BSY3QxN0Jmdllpbk1PU3NzR2hDVFZFUENhQ3NEaHZHMlhkd0x2?=
 =?utf-8?B?YzE1cVlmaUdqaFRFMml2ZU5ZMjJIZzdjcnhKT3pGS2Q5bmdlaEJvOVJrM0FD?=
 =?utf-8?B?U2ExMlE0RlRJZ0hXaUMwSk83dXFsWVZ4eXZOSnpaUnlWd2FXZ1FvM1QvL2tt?=
 =?utf-8?B?L2IxR2dKWE5vUXlML1UwQU9va3pjUUNJbHp0cnBkWnZqSHFodmd3dnFidE5v?=
 =?utf-8?B?STJvRDV6dnh3cGJuODkwYndOa2Nlei9NSkZYWGM5Z3dSZVU0cjA3dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca04bf1-9a16-4bb7-ffa3-08de7690f2c5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:16:45.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+nOMlpGUw4aneuUqN3vBKw7SFM3+ePyXnhunylx9Fr+VhagCfNVeSSwxByO3Vov+iumSQCbEsz2sWX7wiG4xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9809
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53806-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
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
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 5191B1C080D
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
output, it can be programed to output local data or remote data coming
from the remote compatible deserializer.

Make a different GPIO range for remote ones.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v5:
- Improve the description for "#gpio-cells" as commented by Conor.

Changes in v4:
- Use folder block instead of literal block for #gpio-cell property description.

Changes in v3:
- Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
  compatible deserializer suggested by Rob instead of adding third
  cell for GPIO controller.

Changes in v2:
- Remove new property ti,gpio-data
- Add third cell for GPIO controller to select GPIO output source.
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index 2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7..143d546ecb482d2eb78a113b1a57afcbff9cca01 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -20,9 +20,13 @@ properties:
 
   '#gpio-cells':
     const: 2
-    description:
+    description: >
       First cell is the GPIO pin number, second cell is the flags. The GPIO pin
-      number must be in range of [0, 3].
+      number must be in range of [0, 3] when enabled as an input.
+
+      If enabled as an output, the GPIO pin number must be in range of [0, 7].
+      [0, 3] are for local GPIO data and [4, 7] for GPIO data coming from
+      remote compatible deserializer.
 
   gpio-controller: true
 

-- 
2.34.1


