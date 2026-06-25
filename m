Return-Path: <linux-media+bounces-65647-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id grvROVw5PWrXzQgAu9opvQ
	(envelope-from <linux-media+bounces-65647-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:21:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F87F6C690A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:21:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="YDKN/F5u";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65647-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65647-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45A6D300E24C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B245356765;
	Thu, 25 Jun 2026 14:17:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3532E121;
	Thu, 25 Jun 2026 14:17:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397039; cv=fail; b=m+/iHAvPqHEDdTiRIV1DoykFawXd5nt7i+Dyt8vDZK3uwjqD0S/26cB1ipsbIsbVRW7dJ0EcE7rwbxzrRAfTM0UKdRyhGfKVFYLNlV7UxTOaJUleSqAn9cHb1NizEX8wPk29fPfgIKYDrGPBk0wIkfz+1LXbE7hr23pflJrzyvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397039; c=relaxed/simple;
	bh=P9D+DSTesmxQwuEP10ffFqgQ2qCRfFPHXSEtlhzWDpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IZxzu059YI2Nf5UxaWF/Jr3UNEhbnsXwYlo4YLYuIRYJD90mp4/PkiEiv+5QURlPCzUnmE7W4l+C/jZI+/w425ILMVuLMQuxeauReQ8Jn7Q+etaFi6rVgZDp5fTpzr0XoUlF62pQpVwjD624Z1/R6m397gzAgEzoK3qwsm3Isxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YDKN/F5u; arc=fail smtp.client-ip=52.101.84.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjZVn54E52i4/N6tnFjlQNen0c2JWEXo84rWbyLUSJYN+Fcbut8uJIWCcTE2y+ZzEsUHln6bQ5DAaNV10Unpr4bA8AT3l+6WaFRA5WBTDB4JmX1A1wUAfwo4DHZ5PBmpyDpWFXlagIeDJYkYIlqcRfD4oLveK7blXaFfx4Geesel/+yt2e4ExByaKqdUayQ5Q0rFh/cV0zpGSxek2vLLWJeTUDglEJ5s9pQPTG4go/SI0nXLjCquqJcrX3F5j6zXb2ZNtP+jpmPgFSAQMJ3j0GhWYsaLR9QUK7SwyRD1JVUelpmRf1DZWy38nJk+E8/2uptAXvOiHh5/HvxXbN63ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sbdUymRZcXBs1kTSrSqN3X3GJed+VORa1JGC2816s0=;
 b=sqQbyt4/QymihRXQd1NEGBlwU2rXi/Auxgtte/wDpcrM5tc8Ua21++a5P0onu+OiIaVDyzYe6RGDW5Hof9RjKBDVDKUdFDn1NOAOd+MyhfICZj85Cqnqdi1NXxRmWDQQh5Kn2S0mti+5i2zZL63PF1cUAyWIbdpB1zOinbb6XxtT6dmmngtA8qsihHlWOSnRElnmCP99mGUtbYwIFcNdlG/weX5vYAQcjdwl1rt03J0R5pb9I9UNvzbnG2Jg2nEbGxaQblgRiPtXEeCpfMeI3Y6ul82+gLKRDjA2rg9wZ48yRGoKn6kXqMfXlb00X9XKX3fTXpPW6ht3lgQQe0k9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sbdUymRZcXBs1kTSrSqN3X3GJed+VORa1JGC2816s0=;
 b=YDKN/F5u/1i0rNv/M/u7six0qBYuDXHsaEsTWhlTR4fVd/8gh6vCL8OF5eXZ8+TLxGy1TtEJk+oKHy2cw1BmY5Our79rMLbMlol+pJkmsuThOjQsxwO50rDRSV/cKCYJ2N4+sFCHV3CXofHa9YXyWPfYHShzlVbEEMe4+lw4MdCFmyX0smQ/tspEYE5RRUNYMZpmvvoNaX7rJP5zMl+M/k3eMOGktm/UbGxaOBFXMprfmmX1k4EEu6tQ+UGLHW0BKqs0k4NEV4BaN61f8khVBr1YGbhzOKv8uRaD+/Xl8GC9iC1GUilxuwYFqvKNdwh+uIMabchzuS5/I2GMrutlew==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7364.eurprd04.prod.outlook.com (2603:10a6:20b:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 14:17:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 14:17:14 +0000
Date: Thu, 25 Jun 2026 09:17:01 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Alice Yuan <alice.yuan@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 0/9] media: add new API simple 1to1 subdev register
 and add imx parallel camera support
Message-ID: <aj04XVUrtSu_wcO1@SMW015318>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
X-ClientProxiedBy: PH7P220CA0143.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ea5eaf-2983-4623-482c-08ded2c4743d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|921020|18002099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
 tSxcMzLDGcgwsPDWAJXaPWD2rw8GdnoQnMZShncilHqmpO+2zIMebK79Btvzwbtx0Cz3Iz6fBN91pck2dA3dnt/zdylfKIUp22BHcDEx1paYVMD1eleNDbjbMk0MWFyLzXOfeqCSFXasuqOVPsd6qhILkS6t8ujknCoVT/cMfqCheLxZS9UT9Aodg2DQh2daUWOq84nKLeZp9ZJK+lD9HzpHbUMc3eUjdkWbm3lLOryXo5pMsKicPiWzVBAz3P7pdCk+1LTeMkRll/NRXllwGw9wPg06Ns2OjbbTdBlW07/FlNT0hNk5DRxg8NWc9UdAY4DgMO6V1BRgNTRRnzZnC+z6TS4ZEAVnSQP2WsgGLnuiI8QB0QvLVvyvEpPY7qhjoo7CKimuO6cPvfv9zgYuQxwY7j1u/0Ch603Ye+Ll7lRtOWh3uR748oQBtUedly5U2GJYWJ4hZSFvn22e+NYBkMlKArRG/qWyHdbhrbmSi/Wrrq2OjKkwvxbNwac0+8bU16xEjxNbIk2QDQqFNqoLhZAwenguRjdijoVUSxouFUHzHV5x6KeDPCQlHXVcx3fZ1JMpQ70iCkKWLIDd3bz8iLCaa389qCS7PN9+HTi9r5MyjYBWTaGkIg2evmzZ7mLKO5sO33EeuqunCHVzbhL+29W8z0CKAkP6VfNy5kRF+a4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(921020)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Cl5fttlzBuhEpz6jS5bSoIfY+mPDuIr82NQmu9epAjJw8XkZwodCt1VsNK3x?=
 =?us-ascii?Q?zlS+yQhROIMPcdXwPeajjT0GF+xcrMfL1MmchXISA5SScu1eN7ltye6+4CPw?=
 =?us-ascii?Q?y942dFnd4rwo+aPyeh2xgr2OQjd+wlOr8VLcg+68HZX+AQGh20ap76j/zbxc?=
 =?us-ascii?Q?NKE8Xn6XsmX59RsyDCwCc5wYnQhr8PDBKyWuKTL1OuqC21MNC9088LyREJ5G?=
 =?us-ascii?Q?cj2NePKeFketJwDodhAKTeUy57eFyu7pSBdQrP/ABHi93+eTggWRSSbE0eAd?=
 =?us-ascii?Q?HaLaI4xqBGhykJ/acDVdom3JtlBimxYxSG02H9SlUBf4WRjmueTvnVrewOP9?=
 =?us-ascii?Q?gBR1UQq8hHZrgjanZHr6UEoQME2PsmLPT156hHeMgr0HgoD3xSVPOGxRL3U8?=
 =?us-ascii?Q?37kZQfrqz7lv7Js4aOOT04YJJDFMkqia88PKJyHJmX8WkRCaCAC7TaR1+LeZ?=
 =?us-ascii?Q?HgmSj9uXm7k2SI5IptxoID5G6YsXoolcuXTJtcPLw29Du/ei2Ckwa25vjQF1?=
 =?us-ascii?Q?o3JEGS0/dJCAB/4AGM85dlZKMBAyQ5Iv+zEH49ONI5RxHWc5/RTFEWYaOeCD?=
 =?us-ascii?Q?4JeruWlWBKCIrRASmvenRlPNNXHWAYxMdA1nQVnXJbvlId5i6wAp0dxk5R8G?=
 =?us-ascii?Q?RFVChLxLAIMYAtNSr870Y7clBJmNPx/Ly/nZmSngXPenQIl8Ou/41+6w5P1G?=
 =?us-ascii?Q?9q+AC2PHPGKjX0SHQAa2ZMEYfS1cGo+wU7EfM40iIdiq+hXUq1itD6vG+wRd?=
 =?us-ascii?Q?xjU720aUGhnf8VYmgfiBDr/qC/Mq0UiJnAJ6sPMSKCqq/Y3xdATE5tPPunXy?=
 =?us-ascii?Q?3DP3QAuJIjix19BFz08MrWKeOc/aiBjzHUk3MgSo7E5ZwJOBFC2dRMa1ZUGx?=
 =?us-ascii?Q?srCQa/1GJriA4UUbhH/oeIsfzO3ql+xkt3n+pm3tLYXcbTAcMyNWdtGS8lVP?=
 =?us-ascii?Q?dYBRn9vWhZde69g/rTwahFnJC8xtVrhCMGZFWf+JW/0FRiX5km/GBRobxCf5?=
 =?us-ascii?Q?G0u5L/exgX2mReQiowNwSlZmtPOUf83A+aP0wSPpokWTWUu2yF+bkPEWUCXg?=
 =?us-ascii?Q?RUry/rKAUTbPH39hN27aj3XIEeoZcIMaFuyISTYbnR9raw2dLLpf6RKZkdzO?=
 =?us-ascii?Q?9Qvv+bnMnI77IDqmHOcbhLitCi+gtF8wmqPElT62wHdSjVFY69/jS9h6a4S/?=
 =?us-ascii?Q?FMx71+15iOt9Z3QbvvZvLBLBY2yXKfbdf/Fv/Po8NPr5ArfRIJ1qgxxIiIq2?=
 =?us-ascii?Q?6wPGEtZosAbfGwWOdAB3WZa7K4gKdV7UqKO5WZy4OJxXKmtbkJApox44Ou6R?=
 =?us-ascii?Q?M9ZRJ1cOAqM7X0jK+Ij5E/WsfMoyoEy7z91LCM61A9668trTk85T4dpQrUSM?=
 =?us-ascii?Q?pcrLvNdOTWLhWpfxPCYmAJnWXl1D+/Cei4k7A9KptMVhGtGif6QW5KiOmRSe?=
 =?us-ascii?Q?WG5z2l5p0mvSVGTN/6H8KvOVJoH8yJgRmOuO8UuuB7n/xhODtVnxqgoxo/a6?=
 =?us-ascii?Q?9J2fguKbpG0OOULCzPPH2cSdqUftaSKyC778oW5zoSUNEGo5vJyvzfcyMz2K?=
 =?us-ascii?Q?Vut/gBUIQDJbEiDqC9+PpnExyYlkCqQOwk7UDb0spbU4jgV2nlpz/oUKAIr7?=
 =?us-ascii?Q?zrOmYvv/skvAt1t4fLRk5q2gFNlXL+4zCyhjbijFBTFTZO1/XKBD3GX6JACr?=
 =?us-ascii?Q?+vnJf2gx5PxkfelkoC2fm8UDyH74iUXP8G5i2NruEcyTBZeURzi9Y9SQSmEX?=
 =?us-ascii?Q?dvrpinShtvrNtpWYOUZTmnKlEGuGFEpDCohOShGggeY6tYF8I1m/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ea5eaf-2983-4623-482c-08ded2c4743d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:17:14.3656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH1Fp0nmSYGRThuzwdZbBKqRozaLrE7boB08kW3ew9gFAnkYosodZ7WkKeew/bZJI5V3TpQHWQX3h0b0VCYYzKYVRupgXeY/CQEsyK3XBzF3e2fqpW1B5L7DxkaE1bGZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7364
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alice.yuan@nxp.com,m:robert.chiras@nxp.com,m:zhipeng.wang_1@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65647-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F87F6C690A

On Wed, Jun 24, 2026 at 04:37:47PM -0400, Frank.Li@oss.nxp.com wrote:
> Base on patches "media: add and use fwnode_graph_for_each_endpoint_scoped()"
> https://lore.kernel.org/imx/20260624200237.GJ851255@killaraus.ideasonboard.com/T/#m7969735b6c236c6b3abc16b9f3f55ec0488dbe89
>
> This patches base on previous' thread "media: imx8qxp: add parallel camera
> support".
>
> Add new API media_async_register_subdev_1to1() to simple 1to1 subdev
> register.

typo here, should be media_async_register_subdev().

fwnode graphic, there two mehtod to connect nodes together.

method 1:

port@0
{
	endpoint@0{
		-> sensor 0
	}

	endpoint@1{
		-> sensor 1
	}
}

method 2:

port@0
{
	endpoint {
		-> sensor 0
	}
}

port@1 {
	endpoint {
		-> sensor 1
	}
}

NXP/Freesclae use method 2, not sure other vendors or history support
mehtod 1

Most system one port have only one endpoint, not sure previous design hope
endpont map to media pad or one port map to media pad.

It is the same if only one endpont under port. So far this version support
all devices, which use method 2.

Frank
>
> Many V4L2 subdev drivers implement the same registration and media pads.
> Assumes a 1:1 mapping between firmware endpoints and media pads.
> During registration it parses the firmware graph, creates media pads for
> all endpoints, and registers common asynchronous notifiers for sink
> endpoints. These notifiers automatically create media links when the
> corresponding remote source devices become available.
>
> The set_pad_by_ep() callback allows drivers to determine the media pad
> associated with a firmware endpoint and identify whether the endpoint
> represents a sink pad.
>
> By centralizing firmware graph parsing, media pad creation, notifier
> registration, and link creation, this helper reduces duplicated code and
> simplifies error handling in V4L2 sub-device drivers.
>
> Add media_async_register_subdev(), a helper to register a V4L2 sub-device
> with the asynchronous sub-device framework.
>
> This reduces code duplication and simplifies the implementation of
> simple bridge and converter drivers.
>
>     In subdev driver:
>
>     your_device_probe()
>     {
>             v4l2_subdev_init(sd, &dw_mipi_csi2rx_ops);
>             ...
>             return media_async_register_subdev_1to1(sd);
>     }
>
>     ...
>     your_device_remove()
>     {
>             media_async_subdev_cleanup(sd);
>     }
>
> This API help reduce over line duplcated code in synopsys/dw-mipi-csi2rx.c.
> And use this API at imx8's parallel CPI driver, which over 90% code now
> hardware related.
>
> And also benefit on going pix format patch
> https://lore.kernel.org/imx/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com/
>
> It will also reduce missed media_entity_cleanup() problem at some error path
> https://lore.kernel.org/linux-media/20260614202835.11977-15-birenpandya@gmail.com/
>
> Previous do partial simpilfy at
> https://lore.kernel.org/imx/aaisdJSsFE5-PLx1@lizhi-Precision-Tower-5810/
>
> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Michael Riesch <michael.riesch@collabora.com>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Frank Li <Frank.Li@nxp.com>
> To: Martin Kepplinger-Novakovic <martink@posteo.de>
> To: Rui Miguel Silva <rmfrfs@gmail.com>
> To: Purism Kernel Team <kernel@puri.sm>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: Guoniu Zhou <guoniu.zhou@nxp.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v6:
> - Change API to fix more width user case, assume a media pad have one endpoint
> on dts.
> - other detail change see each patch's change log
> - Link to v5: https://patch.msgid.link/20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com
>
> Changes in v5:
> - Add media_async_register_subdev_1to1() to simple code.
> - Link to v4: https://lore.kernel.org/r/20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com
>
> Changes in v4:
> - remove imx93 driver support since have not camera sensor module to do test now.
>   Add it later
> - Add new patch
>   media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> - See each patche's change log for detail.
> - Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com
>
> Changes in v3:
> - replace CSI with CPI.
> - detail change see each patch's change logs
> - Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com
>
> Changes in v2:
> - remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
>   because pcif controller convert 2x8 to 1x16 to match isi's input
> - rename comaptible string to fsl,imx8qxp-pcif
> - See each patches's change log for detail
> - Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com
>
> ---
> Alice Yuan (2):
>       dt-bindings: media: add i.MX parallel CPI support
>       media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)
>
> Frank Li (7):
>       media: mc-entity: Store parsed V4L2 fwnode endpoint in media_pad
>       media: subdev: Add set_pad_by_ep() callback to internal ops
>       media: subdev: Add media_async_register_subdev() helper
>       media: synopsys: Use v4l2_subdev_get_frame_desc_passthrough()
>       media: synopsys: Use media_async_register_subdev() to simplify code
>       arm64: dts: imx8: add camera parallel interface (CPI) node
>       arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
>
>  .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/freescale/Makefile             |   3 +
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
>  .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
>  drivers/media/platform/nxp/Kconfig                 |  12 +
>  drivers/media/platform/nxp/Makefile                |   1 +
>  drivers/media/platform/nxp/imx-parallel-cpi.c      | 629 +++++++++++++++++++++
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 200 ++-----
>  drivers/media/v4l2-core/v4l2-fwnode.c              | 155 +++++
>  include/media/media-entity.h                       |   5 +-
>  include/media/v4l2-async.h                         |  39 ++
>  include/media/v4l2-subdev.h                        |   5 +
>  14 files changed, 1140 insertions(+), 160 deletions(-)
> ---
> base-commit: c425f8be0326d40823cd93cbca633872d099df2a
> change-id: 20250626-imx8qxp_pcam-d851238343c3
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
>

