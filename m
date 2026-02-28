Return-Path: <linux-media+bounces-53808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLkxOXiIomkd3wQAu9opvQ
	(envelope-from <linux-media+bounces-53808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:17:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277C1C0825
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA3C830593F1
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 06:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADAD32D0DE;
	Sat, 28 Feb 2026 06:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DrBk8DfI"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E8F33F384;
	Sat, 28 Feb 2026 06:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772259418; cv=fail; b=mJetLAqXYvNa0Jv8AOyDlx1m22cUAIEkRLZrLaTeHxf1mhSo79lHY4KyXMdZUAViK5kFw0kb1voSTOjRVQ8JxrnlD2ZQsu+DStJT8XhCa9O9NOOKv/AQmfy51k3uocMDnhKEIX5Rm28/xamR+i2uXrR4ebvY5Z9eFU5VFYJtgg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772259418; c=relaxed/simple;
	bh=7bglsEHhwjB8wbLTx2D3+qQOsFmYnvNW/m8z5Rjd/DA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rVvU0cxIxEC3FYol4WVlPUvBPqTmEAbAGOfaE1Bxyd5G2Es/Vg3k18tSk44uUpyRShXzZLj/ys8AAy9Mi3BrCPVsUKYApmbgl2xu/mrY/Cox6YyCohdw0JQstFIPF6TlJFu/PkA4hyhF7+YJAg6MNVDVdPPizxBFZFiGvyORF6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DrBk8DfI; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gs8tGmszhzPG8d4MUooY6wH1PRf/j3PFUJ34hw5ZdNE1pRxl6QM+xHtc7ruCgbGL+F1D+IXEUyAE3ZuR3ZP29MunLIk8MuzuoA4xGhntvmr5isDnlX2nveFpd/m6GxmrwFwBaAGcAluMmInZQYCcqk4JeD3HKkKGZc81muNzv1P8MCJQezRfMgqqSKy0HIOJpjy+qDDNkkCqMAJoYiWGCgv+m1S+Yhf1qnOcnAAIfVHpEiGWa7scL+4XmotAEpKQxm5lvGg8tJBfF/bV9+x2vcG30wL6UKVjbUuGDXHIXVCR1onQ2O++OTLK3UlK26vNQo/NhFFUN3I/vZ0Pb4Lr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuvOezn5XQXVlaN0HZPzdbKPmh1F2t94Pv5numfDikA=;
 b=PPvwyXHSUkBdUOLG4EwiRqUSrrlNPiim++UAbkJKRNGmzVg8QLZN/aXujGIJ8izHmyJNNR9MLD/DXVrUhg06N+acF5otKbj1LsAz6hmzbC2CsYyj1FMgevtfBV13wWRG3GKGR+yVszAmDVGuKc6WCqVw0bDCZX7PB/nJeMO6B8/qjxNHQD1vtw2+fyVXa5+NAMeuPFfhLCKzuzmAsHePZEBqqU7ugthgJy3DxtP7kow1PW56FuESvKixTVzxQILiVULLBMKXD7J9TsbQ8FEF2LECFvc2QjBAmwOa9VxHJcX+QbtDH+3Ask3lAWfGtJzrs17nSJltF+NJFrJ/0wc36w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuvOezn5XQXVlaN0HZPzdbKPmh1F2t94Pv5numfDikA=;
 b=DrBk8DfIexfuwHTSpTUjtxTAShFHVPRdXPhfAO+dtLfVqk2PZQay85M+bweEZH/9oAmHqORHX5EtgTb0Kt/NVI6fLINq6Zfo8edFjT9dZ3mldLNG84eQJmLkF+BbtMFBX54io9QTsGosoJ7uIpHjWPJN2AWxrB8SKyfQp7xuZlYF9qhrx+3DK4XEGClHLz28+8Db5oV6kWbFGDCw/OXKLEHX0Me9pBRCbrQMsiJB3XIdNCM6x/YCLuCOmRB8z8kwIjPzg0ONTTGVi0bIRqLSnOUY//ve7BCwQN9BjdPsnkXitditSxFRXOS7j17qLiPX6ob31Y64kgaoUCVwRHOzvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB9809.eurprd04.prod.outlook.com (2603:10a6:800:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 06:16:53 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 06:16:53 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Sat, 28 Feb 2026 14:18:21 +0800
Subject: [PATCH v5 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-ds90ub953-v5-3-056cf07cc8f1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772259522; l=2687;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=ZtASOTXPV96hESXIhSLHGU9VKdpJ9jjyRpoEenlG2nY=;
 b=eAbj0FUlx4VB/9m3xrDF5t1t88y/ADthJprMXyp4Wn0VpBkR77lI18vu8KDXEcrkM7oMtE4CD
 FBOPaMWeUvVCZ4rSG80JB9SuMbWMZ0/pmlOeUdNfbWRqvXIqXw+2FjW
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
X-MS-Office365-Filtering-Correlation-Id: b1b0593f-2282-495c-0257-08de7690f759
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	zCufhM827g+d5XxTdD1MYOMZToA51DqJU6LHWKj0MrrsNm/4/zy3ImePmkZYPyHOdu2nxdsk9r9NZEdj1GxHnWpPQk8w3rgfk7i0qr1aZJQASnE5k72Y0Db1A+mmFL+aZB1wB6BDC7sarCBTWODqR6mh17GTi6I6ZcEH5ZhdHBeMGMOcSESlnbDrWQ+zcU/VTEKA3hvuRxa0fxTTvjal6xgJicVq9eMfxP3m0KuKlAXl6LfGCY9xFtpk/r6zi/IPrwJrpOwQEaoobMk3jzqOz0rdU0XpFgaaDkDCz1ZbUOkDVxt2yZe3dFcT2jlAMSUB6wVxeuGHCaxO+uUCUvd69mcFP5gk4OY1fJbAUPsn7UhMaL2KPF1grj9U9uDLsnapHYYmXc/lPW2ftMsG9nxR/bcaAVxg0Ty4pP4zsgpJ79+zVw1twI3YjGI15hDjMwUYRPc3iokNmPHwUvqKOnlgmMUabH+NizJoB7gyiUc9lZ80qIqhVvzl/pC76A1Oo7QEKJoaeLnBknvZURw8ct1TkezAPpY1AmrrWkUH8pktMGdPq31WLfp5HIZtspyDmtC9GboUgL0bDLWFEUb2q3eNmUJS/yjxqBttu2WzM1zfMem2Jtz/5CcSLFG8S4m8OJi6urpbiOQbcH4G4SiNL7ZYprgFvxX6OjegqflN5vIH8KAfGk3YyqOxqy2EWVwIitvu7VIlAOO/PEyormForlQT5K1Ebr71E02WXopKqmCMT/dsCaSPZXOwxL0dzjJ98choFar8j9JFYyh3dqPaAWPr2J0/SkqCIITUD3J4ejrm1ts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTBYeW56cjdWSWNtM3k5ODMyKzNqcEFCejlUM2g5WndzUDNqZDc4Q1JFam53?=
 =?utf-8?B?MzlsVFJvNFN5cmlsSlV0OXowZ3lNSjl6d3ZrSERMWW50dUlabU81b3BySW1T?=
 =?utf-8?B?MDZNeHZiNEk1SFRqaEJGUmFqSjBtQ2N6TTZwWS83NVBwZTlLcE5oZHgxNWV5?=
 =?utf-8?B?VWtmd0cxaXQvNVVWZThqRGZ2Nnd4ZEMwamUxZEhSNm9mV1BCOC9IY3RaWTFm?=
 =?utf-8?B?eHJROHUxN1lDWGFVbVVqaDFrVi9kYXVMY3ptNlRxNHUzQlV0bEp3eTRERE55?=
 =?utf-8?B?RXlNalZZMmhPRFZiU2JFTllIMHBMN2hiaVdJR0NnZHZhT0pDRVJnR3BuRmFS?=
 =?utf-8?B?UXlGSzRvZE00SVk0aWdIMlFCcW14TThiU1dvN3dINVVaOGFYUU9LSjI3RGFU?=
 =?utf-8?B?em40bTljQ3NnMkpZQnFYR0lCWElyY0pKUHZScmszZVVsdjBkeDhwWTNyUVZq?=
 =?utf-8?B?ejNHRWZnckxZaTdJNjR3RUdIWmhiMWZSREZzVTBKblRJcktqOEIvZWg5SnJi?=
 =?utf-8?B?bXZTTVQ5RDczY1FJQ3pmT2d6VWdPUFR1VHdSN3JUTTJ1VEM5OCtadFdRam9C?=
 =?utf-8?B?d1VUMFVHRGFWVGtaUkgxYUpWU04yZlVRRlVTbTFTMmhBK0FVa29yTC9NV3ZY?=
 =?utf-8?B?bEZRRENzU2p1VjhRWVUvRjRjMTdMdW12UkVzZktpTlgyZnorQzcxRHhPZmJZ?=
 =?utf-8?B?d2tjVHFJc3JpaHRKVVArRTFncnlXdFI5WHl1VDdOVWRzOE16SHkrTDd3dHJP?=
 =?utf-8?B?YkEwZDQxc3BFM0ZmalkwZk5iZ3BadUtBM214eVptazZRVkNSNUhyUW9tSklw?=
 =?utf-8?B?VGtnK3dWVDd3MkRSYnVjeG9VMVUySlRqclMyZUFHT3JhaEROaUdGZkgrU2d5?=
 =?utf-8?B?Sk5QTXA0ZWlGNWJkTVpLR1ZaN0ZvdlU0UFc3dEtUNWovRTlmTDZJSEladFlI?=
 =?utf-8?B?RERHMTZZeitXV1JETlBWOThlV1pTcXVULzQ4ampkYkU4MlJtbzFVYjRmNHZk?=
 =?utf-8?B?NHdSQ3Z3d0dsU2pmNC85bFhRQk5OdmordTRxRUpUMG45MVhGamFQMmpwU3pX?=
 =?utf-8?B?SHBMa3czNlV3SzNidDJRTEpkSWRHSUlLL2pXNHp4UXdYNkM3bnNKU2x5UXpI?=
 =?utf-8?B?a1lwQnlPcVJjNWtac1ErYUwzMkl3WlBscCt5MUlBcUFyRjA3aWNCbHNlRXp4?=
 =?utf-8?B?MW8rdDZ6VTRNN1dBR1B3QnJYaGk1aW5vQkhYbEttczJNa0JiTVlWQXY3MUZT?=
 =?utf-8?B?ZktvdjI5bG5LM3NneE9oYTJNV0hUN1FySnRJellqcWUvWWVZSHRSUjdXczU5?=
 =?utf-8?B?dmc2alAzdGFCMFJ3NFR0Qi9uKzBTK2IvT2ZPNFhQZXhOZnVNTmFNZGNLV0tC?=
 =?utf-8?B?bEo4TGQwWjlva3ZacTgzSlRLakIzYyswVVFXNWV1VlI3blVWT3ZYYnY3UjR4?=
 =?utf-8?B?a2NJVUFOZ0lJaGd6OWRacmRBMHNvL2dreVNNQzZMV3FweGlYT0FNNkxYRVph?=
 =?utf-8?B?STNleXViQUw1Q0J0RkFQck11OFBMU1lUYWI4K3NvdkdrRG82WkxnbDlEaWx6?=
 =?utf-8?B?eXVuQTJOc2V4dVJkaGRERUN1YVBKbHM3RmxhZ3J1NVZ1REhEQXA2b2s3cC9H?=
 =?utf-8?B?MzZzRkhtN0R4cEMreHhReDFsZzR0VWh0YjJPQ052REN6VXhJZ2NWSTdiQU9B?=
 =?utf-8?B?ZGUxeS8zY0ZFUi9EOE9Sc3J3N1lBY0YzTURNOFYyd0lxdGIxNGd0L1NZTVJ2?=
 =?utf-8?B?eFVraCtnUmxtbVIzTStMMjUzZlduVTVwQURpTGxpK0tkdUxRakZGdk9hRDRS?=
 =?utf-8?B?VUxCZzlkVHZEbHNqRkEyOHFORGR2cnE0aS8wcTJpa29QNXk3ZURWV3hZT3NM?=
 =?utf-8?B?d2V3MDh4aC8rQUM5cFFYLzJubmVCTXNWQ2tvUGpubWpPNzBYeXl1YmFGTnB2?=
 =?utf-8?B?a25UbWVoTU92U2xMVU52YkpaY29ra29XVVFJZ0ZxR0c0dTZTNm9ZdzlOWk8r?=
 =?utf-8?B?SXRiMlhCU0pwbWtKN2Y2VjRqb1BKOEVnUHVaUWYyb1U1Q1MyQTM0aVN2QTBK?=
 =?utf-8?B?dFdMeFA2cUFKTlBZOUNGNktIcUMxQTgydDVncVdXOThOaGc2V2hKa0dROFlS?=
 =?utf-8?B?ZnBrd0VrenlQbHc5SWl3YzljMzdOa2tvazJKZzZSZTZ5VS84eUF2ZXF4eFpi?=
 =?utf-8?B?ZWxGY2Y3M2lFVEJEcTdsYkp0VndNalZIcXVsQ1BseE1TMko2TFdZa1lGY2dh?=
 =?utf-8?B?UWxTUXIvbXVyZ2dSKzBPZjZtb0MxVVdrMVc1SE0rUlFpWWpEVTk3MWQ5Y1Bx?=
 =?utf-8?B?bVVGeUQ3cnV4LzYzVCtoMTlZYmF6U2l0dHZBT016ZDZDY1BsNEs3Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b0593f-2282-495c-0257-08de7690f759
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:16:53.1778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HariNr+TrhrO0FdIqHs7syoWZ2m2trpyZ8U/S6lFU/gSbfdQ5t8y3A3Eb2TdreKgXPHMCYcmNw0uyuh3DkQ6bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9809
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53808-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 8277C1C0825
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use devm_mutex_init() to simplify the code. No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Move PTR_ERR() in dev_err_probe();
---
 drivers/media/i2c/ds90ub953.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 14dd0aa4cc6ceba66a8c3545c7d7d19694007431..a85c6a9b64070491db161ca1586179dba9c69cb0 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1345,7 +1345,9 @@ static int ub953_probe(struct i2c_client *client)
 	if (!priv->plat_data)
 		return dev_err_probe(dev, -ENODEV, "Platform data missing\n");
 
-	mutex_init(&priv->reg_lock);
+	ret = devm_mutex_init(dev, &priv->reg_lock);
+	if (ret)
+		return ret;
 
 	/*
 	 * Initialize to invalid values so that the first reg writes will
@@ -1354,32 +1356,26 @@ static int ub953_probe(struct i2c_client *client)
 	priv->current_indirect_target = 0xff;
 
 	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
-	if (IS_ERR(priv->regmap)) {
-		ret = PTR_ERR(priv->regmap);
-		dev_err_probe(dev, ret, "Failed to init regmap\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Failed to init regmap\n");
 
 	priv->clkin = devm_clk_get_optional(dev, "clkin");
-	if (IS_ERR(priv->clkin)) {
-		ret = PTR_ERR(priv->clkin);
-		dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->clkin))
+		return dev_err_probe(dev, PTR_ERR(priv->clkin),
+				     "Failed to parse 'clkin'\n");
 
 	ret = ub953_parse_dt(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_hw_init(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_gpiochip_probe(priv);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to init gpiochip\n");
-		goto err_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init gpiochip\n");
 
 	ret = ub953_register_clkout(priv);
 	if (ret) {
@@ -1403,8 +1399,6 @@ static int ub953_probe(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 err_gpiochip_remove:
 	ub953_gpiochip_remove(priv);
-err_mutex_destroy:
-	mutex_destroy(&priv->reg_lock);
 
 	return ret;
 }
@@ -1419,7 +1413,6 @@ static void ub953_remove(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 
 	ub953_gpiochip_remove(priv);
-	mutex_destroy(&priv->reg_lock);
 }
 
 static const struct ub953_hw_data ds90ub953_hw = {

-- 
2.34.1


