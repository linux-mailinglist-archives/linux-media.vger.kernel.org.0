Return-Path: <linux-media+bounces-55337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEbOIxEisWkOrQIAu9opvQ
	(envelope-from <linux-media+bounces-55337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:04:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57525E62F
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63C89304A9DD
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 08:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA464218AD4;
	Wed, 11 Mar 2026 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Oc4cZplx"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068C3A6B8B;
	Wed, 11 Mar 2026 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216080; cv=fail; b=MBjnKxZ98aPynD+oEwkgpwSNrNJDPdRB2C1o16ePgsn2ypyG28O9SFZLxLLLcfKZ8BXjiwIjbzlaBOEsVRlKv4ipSQBdxklQXsiAEyveDWJq2MougU2oWduY+0oIMKqBwGrFaxQ2KK3ZVHr+T6D6CjGxFXIwoYl9JCnP3C+SwBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216080; c=relaxed/simple;
	bh=dHs31LlCJjYqZ7Oo82NEqVL6+InNuTrM5y22oHC94i0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Z4p0KpwfUPOG2P9ozivbRQwB4ZsSOLkmbGDES/2xgRRlzXQ1LAXw3Vo9PaT3BEbxja2mxbFVPbakrhMDkmdofP1m2TqmSGr3Wn+kb8v1fr4+yMHHPdYTkdXIXnUf3RuY782/xvZtlORXW/LxrnoIyI38dekOVN3455Vpok49rjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Oc4cZplx; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=do34lOSzRe7JtOSRHfJ5sRj+vPDkaKcNnZUuI2OQqxrcqA386wvRhWEzopS5lxq+vbn+rivbqOdoZ6NMXsMkweiCPkbPo8D+IRtnNqQbAJEwWmR38B3GAc0XryfcFuMavEuJkYSkFI6fwnRj7ystlnR6mIwudRjdTLxScG6Dkra9sgF/3cp13Klyq8Z/tUUNCkglIX7qu5zGKtkO5LkEgU5B0Pqjg1aB4Ra7f1TnsgIuq149lz1P58o4sUjhJHG6L16vVbjXidJyT4KSwXxc/9eepY46SabFUveeggIuIOzEOrrEsu7ykZJVX8uG4U7oaAi5jgcfNLsnp3MevoD5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImZHhbVA0UHbI2Z7gsUP+fJRnsVarDiXkVohspeuCpE=;
 b=u6wE3wYT2k2uisesdlTX/8f1a5lpmARNrIVB3G6S0pHExcSZbMM86U8jznDF9iT2q279kep/fpctZGklnz+2uxT6ZwzDEQWvfcn/Tj99HMrRogn51FxDGf2KVJCj9WriZxt7B/tr2znktGDQ4H8NaZu+AoQl2SXO9wwKKUN6+l1cqLJ0SRnp4Va0p5gfdrG24dEedgsywouQXpL1oYPbTbu3MEXOA9dULyGzZZ/KY0PtzIhXMnoO2nAdNIC+NZJhqlZ/2nsc/hIvvfdLmolSpvBbJWv/Ue2f8XNBwFxuwWhNCPC7svkorY8FHLkPSizfeezJRml4NE+Zdyt6bmx5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImZHhbVA0UHbI2Z7gsUP+fJRnsVarDiXkVohspeuCpE=;
 b=Oc4cZplxQuaeB4DkIfKU5FeXsn/xEH9OA11RRTxWGAprwt6fE2rCk6N2hants9dtzShODymYpdoDhM8L6QknIv9JZi7fkJKNa/14lEL8HT7HP8qlDEz23YVdzTTbQoM++0GYAodijxeqOk+TdOAM4Gt5fBHXUklnqGseDhxf+MectECWe0Li4hheP7klpcGBLrIvfCvb4OyEPOvok3VNRfCPZNLnaRSNvT6j0OKIt5a2wTzSpkTuGRioO1p73mymDaqYQm0aBEhuTvFNtcl38xkhTHNJ95+VWV8LwvAVbPlCET8OGgMcJ3LVszazalGWhGIL5OzN1IqNm9aXs+5h5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB11967.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 08:01:13 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Wed, 11 Mar 2026
 08:01:13 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH 0/2] media: nxp: imx8-isi: Fix single frame capture and
 optimize buffer usage
Date: Wed, 11 Mar 2026 16:02:57 +0800
Message-Id: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALEhsWkC/x2MQQqAIBAAvyJ7Tlg3CeorEZK11h6yUIog+nvSc
 WBmHsichDN06oHEl2TZYwFTKZjWMS6sZS4MhNRgbVAXw20SnT9D4JS19bbF0ZAlqqFUR+Ig93/
 sh/f9APOfjVBhAAAA
X-Change-ID: 20260310-isi_min_buffers-4b490a124223
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexi Birlinger <alexi.birlinger@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773216202; l=922;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=dHs31LlCJjYqZ7Oo82NEqVL6+InNuTrM5y22oHC94i0=;
 b=Ww1VBGMeNO5RbLbZ4zBha4Gg2fcl/2lGFJlgBh2XUJP9wR4EcH6IOJX5W1SLcfJaKeVFRyYeY
 JTEsQVvibMNDejBq1ICkg+Gz4ywAFRYM+O/Teiv2UE94/jPNgX41AmI
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9e4ab3-e761-4ca8-9fd3-08de7f445d28
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 VVXj5qT6et8q2IAt7nuRlwJibrSvlIpevETPTHDtKD21lILZMdFf+QuU17i1gSLc7V35NB/mT5okkbcX+QIAUDqfkk/jnjSefJDgSiCCjPxQN41YjmXjUTKjkLxsHXbL7z/EQOIMvxKDj2r820JD21x1fYkLUXBoKjemlvLkAQByi7v+l+Ow1FTZMMKpAcH+YYqspBLTwQlFrfWK7eAeBjDMcYBDmS0gybDK9h7u1vZlPr9Sd1/nn+LzYo0Vgl7I3uWON2kf6OmeMvAJ4uOvUrpIfM1v0415LSdAsA7lzEJvKuasAVrDT+CZxCa9eJFasIjRE+fpqDMETDFCN8lr1CSJHU+CCv8BxREqhtuLw0KXrJY+lfseBJRYv7LdQrU4Oec1owz4t9RapgYwATpeCL6h5TD+2csXZ4ZKXdQALCZpmm6pOhxFL5dfwnx0UTJbIbvxAHrHwCKybInRJkzp8HSMuHGqmSjmjgvW0DGoWCv6PBIdCF4EhDQIe2fZLI03SQ/vByI86YQknhsSfJumbztlZ7yBtCCXKqweX5dytLO0w5D4QWdDx3eFm/kKELE0eiKLFM/cJCkw45tObbt//+oGSn+5IYyY3OgkwRqk69VQ21IEEec23Zzkr//XMbmeZS4hzEpHsvJ56L0kWAfCf2UsyCQALTYJx3bb3NKZvV1+XWPZKsL0HOn5tzowvNJK6m85jWUeCD5utakB3xtmHEFJG0KYZ8MEGOUIRXfVB0XqHTrJoXr+Hq0mYZNRpzxWOXohej37qjlmmo2QzOZzTVNrsd8n2bfZnuLBfGEhQDw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?STdaRDJWSjQ4Q1p0WGRUWGUvbllZNDVGVXN0cGZzVU1NTjdQM2ZSSTA2K3hL?=
 =?utf-8?B?SjlrRXREVGVXUzNJWkQxSVRMV3Vva0JoOXdZWUFpcnA5R0FkSFRFbXQ0RG9Q?=
 =?utf-8?B?cTVjSXUxNldNUFNlaE9IRjMzd0MwdGtndlRqRDZJRHR6ejREZ0RmbkRyS1JT?=
 =?utf-8?B?ZGhWNkZjQ09yVUhiTlFKbkJkdlBxOVo5TW8wNG9Hb0I3WDhteDdPT2FTdkJy?=
 =?utf-8?B?eENVK1EvK2svK3RJRDJYNm9yb3pCTzV0U0N3UTBoZzhvUjdwL0NSVlg5WVll?=
 =?utf-8?B?b3daZWhtQU82OG5Id1YvWTZvV2lYMVRRZ25kL1FKOVVwSS92ZkpxL2hEdlgv?=
 =?utf-8?B?YzZSKzZwUVM0YkxrdFJlSWc5NUQ2N3lZaE5wZVMxbmtTQ3d5VWZZQVZ2TWxE?=
 =?utf-8?B?UmFuSFlQV3NDUERFOXpWQnl2aVhQRjdCVUVzSEFSdTFuamNBNG93M0pESWk3?=
 =?utf-8?B?TC9meTYrRitOY3lzWG1LUGg1ZituVlI4UzZ2dWhrd3VuaERYVTVmVUFQRk90?=
 =?utf-8?B?bTdqTC9CMmFLZnJocmtTQWFqYXVzVngyVEY2bGVlQmY5YXN1Q3dDcVJFU1Rk?=
 =?utf-8?B?MVN2UkNBcVRvTkFWT0o4WWJrRUhPWjM0SU5NcjV5RnpsYjhxSERnWTNlNElL?=
 =?utf-8?B?ZnpSZ3hSK1g5Um5mSkU5eVhPT3NxWWo5SXUzdENuVVhSN3Ftc1lZQnlGcFkx?=
 =?utf-8?B?RmE4MXk3UTNMbUhiQTdpcHFqTi8yRjBLelBiYkZVbmIra0k4bGZtbzFIcllT?=
 =?utf-8?B?UG1QSFdBSzdiVUQ4Ym1SaHE5enB5dU1uaXo0REZjSGJJd29qT0l5TWhtY05r?=
 =?utf-8?B?M0djdU9wdzZDV1lQVEtlTU04bGZtQ2tCTUtKWlhGYVRBMWJxdVgxV01NOXlh?=
 =?utf-8?B?WVZaelcwU2JtQURvTWxwZG9xa1BXSlA5anRrTFN1bXpNNWtGUHh4ZG5aMXN4?=
 =?utf-8?B?UHZUWUFmSWd0dlM4WXBwSEIvOUVDeG9sV0djMkNmKzljenJ0TWdmUEN1NzRk?=
 =?utf-8?B?WnRXUXVlcFlkcUtZeTR6WVhicnJWSWM3QVhiWEtJSGRwT0FuWXJZY0R4NHpT?=
 =?utf-8?B?Ry8wZk5jZUxQMWsrVXcwcmRWU21XVVZ5S1pTMWIyYkJUaFR5RzZPbXRCaWE1?=
 =?utf-8?B?M2U4RG4vNm1hdjJPYTYwWG0yMCtycHRiMXRGOEwvVW5ZYkovRXBzelY1NFJB?=
 =?utf-8?B?aW55MklydngrSzRwSUxZSnVtaXhiWU56ckRyOXRkeSt6bExkUTlUeUJ5dm9P?=
 =?utf-8?B?dDdSMUNjMGJIeS9tTm55WktCdnc1SjM0d0ZFMWpjMExWU0tqVXg3dlNFZGdY?=
 =?utf-8?B?Zzl1N3RQL0hncEhsb2U2eUJ2blF2TjNNazlOQzNIdW5lY0Q4bmRiVjk1RldT?=
 =?utf-8?B?Ym5WZFdOSDZYbkNVSlpzUXFuY0lBK1FqMGhNRlVGRUVhU3ZWbXF4VzVGZE5k?=
 =?utf-8?B?dGdLSVlTa2JZeVdxZGlCQVhKMUdRVzFsNGF3WnVuOUphWkhBbTdpSjU3WjVj?=
 =?utf-8?B?UHlHVFZZSy9wbWNTR093NWpBVWF1U2sxblJLdlBJRzZZYlM4b2NJVG83NXhV?=
 =?utf-8?B?L2xHWklwUVVuMHdSNUxDdng3YWNJQ09XekJ0STN6SkJBaStlb3FhUll2L1pa?=
 =?utf-8?B?aTZiUUdLR1RKRkZkMUYwV1h2Z3pEVHpFRWVIUDBZbG1hd1dvSytRL2NOTzd0?=
 =?utf-8?B?dnRvd3l6OFdlRm1YSFREdVdoRWZEY2p0eGhVVWF2TzVnZDhPWGJQZE1qNk41?=
 =?utf-8?B?TjR5SDVhZkExVXBPSHFkN2prY2FPclNVbEtSQ1FobEVOMFNodmE4Skd1L3pD?=
 =?utf-8?B?Q1lVSmFpU1dnSytDR3NZL0VoVkt0eUEvRXJPMUtHMHo3SC82eDZnTTlGdE12?=
 =?utf-8?B?Q1ZXbXlRNm9xRHRlZFpDam9FY0xFKy9KWklQSVhSMzM0Rm1qL0NYaDU1cVVa?=
 =?utf-8?B?ak41dnFjVUl0OWtHZWU1YkxpOXdDbHRLeklteWJGMHZ1QlRUNE5QV21PVHgr?=
 =?utf-8?B?Tjl4aHRKeExlb29pQUJkMWVETjFRcEMrUFZGNGJlay91QjltV2kxR3pCbFht?=
 =?utf-8?B?Q0psZEJBVm9INUkzQnVBd1BTcFVuUGVZenNVMnVLc3dqL1dmaHV0UUtXRWtj?=
 =?utf-8?B?UGJCRW5kWFUwWHZQMkl0NE5xbkNnWDMxTWEyQWJVY010R0NIQjM4UXNkU29V?=
 =?utf-8?B?OWRIUzlZd0VNYlFNazNqYXV4ajFaZ2ljeHU4YXpDRjFkMlJIc2owbjhGano1?=
 =?utf-8?B?NE1POG9EYXNjRGd6cjhaOUNCNEEzNUlCalNIU1FPbFBIR1dmbkd2czZCeGVu?=
 =?utf-8?B?Z1I5R0liUGtJTXFMNlRoM2RsS2FNc1FjMnR4aG5DOEIraXFMbHpRZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9e4ab3-e761-4ca8-9fd3-08de7f445d28
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:01:13.2108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SNnUmM3DHQHnJPWvP01NxZ+WSTkcQ7aVKqlIh4f/5xoKIwhw3U1QN6yN0RprmC3eK1sm3H9NbFiudWWdrUvNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11967
X-Rspamd-Queue-Id: 2D57525E62F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55337-lists,linux-media=lfdr.de];
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
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

This series fixes a hang issue when capturing single frames and improves
buffer utilization by prioritizing user buffers over discard buffers.

Patch 1 reduces min_queued_buffers to allow streaming with a single buffer,
fixing hangs in applications like libcamera's cam tool.

Patch 2 changes the buffer selection logic to use pending user buffers first,
minimizing unnecessary frame drops at stream start.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Guoniu Zhou (2):
      media: nxp: imx8-isi: Reduce minimum queued buffers from 2 to 1
      media: nxp: imx8-isi: Prioritize pending buffers over discard buffers

 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260310-isi_min_buffers-4b490a124223

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


