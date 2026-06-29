Return-Path: <linux-media+bounces-65988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H9gJO8mSQmro9wkAu9opvQ
	(envelope-from <linux-media+bounces-65988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:44:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8346DCDBE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=TNZGYOPz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65988-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65988-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CB513127855
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0692E43634E;
	Mon, 29 Jun 2026 15:29:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081742848C;
	Mon, 29 Jun 2026 15:29:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746983; cv=fail; b=otU3wcQN5QP7K1XeKWELUcXiqQW7U6ypKe5bQSSexXAIXH8LtFkaxannWtNcVjejrOUarjObE1sngh55ElKFjAtqDax8+2jRPSMqNup5DZdt/CzxQK3bgKOs/Q+CEB6PY9T5ssDAd84JVqeoLC4fGIELcPqLGna5CzLu+/iI7dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746983; c=relaxed/simple;
	bh=Vt7erQc1gnA/H4xNHBuGW6O/FeRh8tCBBpMN2h25svU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OSa8AP5qcv8568QP6kLmg7bNNtkK/X9tiZVAK5JYHV3MHruYvwAvyTAKNgGnb1raZceVfl49XUAp93XAcdDm5rnwBsM1GcQ6skQXjEym9uUo4rwJJJ+8nTN6FUQbT1K61lsnoDTD+62Bwycl+esZEp7E5YY/154oNWuARm+b2kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TNZGYOPz; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h68z1V2U163BXQ6Uq/mWPPiNxXN1cqnCdE7hoUtMFx7nUAGxVXabQ295MXRACypM7vlyifWsyfP6vit0Lz6m0uHxmtsfsi4rn7RkPR1mpff5iccKHHss4WlOU2qDJW1qZrVzJNXPJ+FIN5DNRcD8cZmOIZ+NZ5Wtyj1ES5euSJGZp4hFXDRdYLxQcM0eZKp5TpnI8AstsSJT3sr14zSXcXRo19ylgzk3oqSD0qEiAzxrenAjGXHx1sEFOQgyGYRxmla4cmT+SZqbX6Pts1phiGAC+Tjh5H49nD/BgohsFSTGcOPnfkcQXlugYwaLqo0xQ/A8gX6OAB44GP5JLLjOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53Q7fDvsLHfCdpxdhUVIYXmixubrZSQ008lgK//m+lE=;
 b=JxJP/cZCs08OcKFzRo5tB4jhr2/cldnUvVSjWNa09F5zfMn6U62BFZ5xDR4PPhFWTd4L2TaRU8HEmRvCm9IT/emjdT5U4XC9gaHr1/inCh2OopfNKgIHHz5M0zb2NsQAuSIX8DsNIhRXEb4Bg8M6alZRzLC1Oi3TEffWYUQjsiauQex60pfY8ymIgGCnfHWSKrkwgA85f5aLwoUNoPKkJHcHY+ZOtsqVIF3aCpR7tfCRD2ikkQG0JCuRICeZ/eLRTLKGBLmLoy0Lh/msSRiQpY+41NTg3yEv8hCe1yWwa1pH6d3MRX9mLTDT+tCMm7Uhkn8o/LgwyDOMx88TtuEXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53Q7fDvsLHfCdpxdhUVIYXmixubrZSQ008lgK//m+lE=;
 b=TNZGYOPzRT8N6Lx+pQc5dxd3iOAsx4xtQZW74Xxo66EcpyiPRNb51ULej0aT2YmIYk4hWWEEmDKoZ9/6aDyjuWemokxBd94j6+IPvz12u35dqx0Ukbof09iiSj2cvf0+fJxW55NX1o+fLQRhq/ZQ3Zi+eYhYR0v17zL2NhzPLCL/6xfWEcilt8coVap9xuoGDreNhc28TMZlp+pCEahmbHmJkvNjmX6PVwp4vJfgYW1VrCOHjVvVe1a+WA/3zO00iz6OT4R4OfW6GrmDNWhWosChWiLhR1Dw37slQGn9llambghVcBwHWjtIDcp6y53gf7dOQsX1pJIX0/smHrUR6A==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11070.eurprd04.prod.outlook.com (2603:10a6:800:264::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:29:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 15:29:34 +0000
Date: Mon, 29 Jun 2026 11:29:26 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v12 2/2] arm64: dts: imx8ulp: Add MIPI CSI-2 and ISI nodes
Message-ID: <akKPVovk-j-gKAjz@lizhi-Precision-Tower-5810>
References: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
 <20260424-csi2_imx8ulp-v12-2-da148eabc035@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-csi2_imx8ulp-v12-2-da148eabc035@oss.nxp.com>
X-ClientProxiedBy: SA1PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c62635-7909-4b85-5396-08ded5f3388e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 0czYZSUmzppef8WFIG6DbOrsLmi85eeGHY2dqYwkgMk1tBJlED1h9+i1ivY0h3FhNXaEtZfeR9NRKc6QUQELdkeFuWNx3jWxb3NUn/f6x8+Sx8tU0WyjDLlsIi3ybg8g9G/B+Nq8pOmxUDFT243QLGRFS9tI6XZ6tskke6vFV8ldJrzLYNTW+QoNNwPYtMn8zt8nsDnlu/qlAuLyynamg6slzmNRgkWSuR8dHG9Hu+NlA+CkZ3EWYnS88d38m9uThHHpf2L4czIf8nfoSaf+69ibHcW/OygBk6rNfsGN2zaSVQOf3iibTa8filTmgrsxNcJuliqr+HdREsJ54eMGIiCaLt+uTVc+wEJk+BAKjjJ2x3RsTyUdUirOrpd6rOcOZlw0oMoK+U4jODeD7PBuE+zFVzMLW/PQp1/gM9G3wSJE5LBlGM29SU4lLh+Esg5nvk5OP+LtfMZjzZotpkDU//1oYZKiXyUOUc2RhyiUEpwPSSZwW7x4JwyQaRR43Datc+7jyVJRwJRZYRRks6B8OkBu05vHNuu8pZm7iC+ZoTEB2xYh5i487LKR0JS3aEBGTzZZtWj/xp0MVwB4za8JIFe/cf6u3eJvdk4Dfmlz6GhDXUVuzLz1tB7/MRHDCAySdRUQbYF9HfWG8diu/y6PO6StUVdNlBPHHqC5MTRToxk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?/mwmAL4roQi4WdTapljkoQDAKOWxzyzzr2RqzL3ztuLnSHGuRwM87hh94yOS?=
 =?us-ascii?Q?onw3Azw3w2g14LmN34Wso8/Jul3SVEGzqtIGFNkD7NQz08NfQ60VJrqxpxFt?=
 =?us-ascii?Q?5+s1MDBAumxHarlRS64zVe6Q60bNwsvZF7q7j6+XhlctLWzDUNuSjSOqwe5B?=
 =?us-ascii?Q?kNTymk5cFYHbX9ZpMuI0afFULGnCYNmIyU4Nwp8hXGJ3yVbkN4PBOE3ly8VB?=
 =?us-ascii?Q?aOGrIedy+PF1DPnMyJUuqJ/oH1dWD6HG3kuGYjfFkDUTPltv0QIMVF4vAG4v?=
 =?us-ascii?Q?jntEBBfLPntLVXToB8E1J3TRPV/0kelRv2ikNJJo8SK7EgNnO8kfIxH7hYdF?=
 =?us-ascii?Q?AIwZvL/KXDSgE163vXJmeGB+XJiMzsi9k0xXI20q9kF2J/PfJ+ZpRk3819Is?=
 =?us-ascii?Q?gq5CvcGi0NCHkmrOLJ5yzTcLSrVrXLJSwzPx3S+dRKViBN0MATAd9ej+14Vm?=
 =?us-ascii?Q?pxgwpzpzhTk/uAtPLGMxvPXgiAjE1D+E3me1JBQIX+Bx+C6El5raHj8+oBYp?=
 =?us-ascii?Q?BZKvEOoBIWucJW9P5IYzN0gnZdUWKhMC6eB8ZjFX6KARiAn+076LnXR2+tPr?=
 =?us-ascii?Q?dZS7dB68U+UoS8Ao5NuMtjLgfgFXbeyAWjPZitCZhNCRzHCAFDNmxltibuli?=
 =?us-ascii?Q?GdXij2womtZ8Fo8nnd/wIT1Wq5IBt6bCsqJ7ANaGaOLxU98eLlx9KPfdnhH8?=
 =?us-ascii?Q?17Bh35m2rS1UrBqpnyKHU86GPdRo970GjiO3SS26/YcFrdEEdIHpbef0MwOD?=
 =?us-ascii?Q?8EbrxPlYbwqaUF0FUGD4viRJGH71qfvdpq3PHBjavNhdbnON+DXvePTHSRTT?=
 =?us-ascii?Q?0aNhRULW9wzm4ypbupAXgpnnfze1Qqftqt0ps49ppDGttP4UaDF4zcjw1hTp?=
 =?us-ascii?Q?qXJKSvZT2+zr9AJDqM+nnqF0pwSU/C+2tHzO/BdbT5kWRJonIvTMs9pOqfuQ?=
 =?us-ascii?Q?jRDdakZle2O9SXbvRdqqYO+9tzPg89b1Lbh5usBAwQqj/aQ8OnoDR9twJpzb?=
 =?us-ascii?Q?mucjarOnJwm2Au2sEV76Zt/NCkgt5JhcIWWqVx0myDQFfiCO6TXftYNXgw6q?=
 =?us-ascii?Q?ukErl1FS/j9x1XQbgxiQWlodjDDELK2r1YS8f7d7YXlFv/B1mULkW/B5BOi8?=
 =?us-ascii?Q?GcFj7v6Dw652ngsi7+78ntN4kBBpFin1qIdBTvnp/gZj3fXdm/OElO+SaEKK?=
 =?us-ascii?Q?K8kM4VY4euOJ4kuRBSmL7EOc1dNUQ6iDHL44Uq0L8TsPBS7eo9I9vskW3VAH?=
 =?us-ascii?Q?UzEpYU13aEPcvWJPoSm79koN1VTlhgIp0UfHx4daOn0u1z+tBZiJ05F8Ph28?=
 =?us-ascii?Q?TYJBDMQL8EwNBjujVcJuHgyVr4JJuGvQcz9HFTQPT8MW+P2sJhKzrq920Epc?=
 =?us-ascii?Q?Ez5HSOPhhrSzl6DKS/1G+MJTV9pO/5Dh4b/ZT1IQBqWwFCZgAr5GVR+7SMup?=
 =?us-ascii?Q?EdFCUr6EDvZl1s9jHBL3p8jgjJDah8mjxCLIAycObqXvkLCQsMTBKDcUqz20?=
 =?us-ascii?Q?0MhRZXED9uxNzAOT1GfkqttlTNB5d6oWOpVZukkmdhDXYOs2X22c565wvukn?=
 =?us-ascii?Q?7VUQts2jjgBAF2KsPg3/BrI3FT2xjp14Ak3pcHpW3GJA8sbh2sA7VnVAMGDT?=
 =?us-ascii?Q?9pHCuU7Mo25PvuVsGZ4AdVczfEh8+ZQbJwYohLvgyQra9Eer3PzWCaoHv1ts?=
 =?us-ascii?Q?7vpb57wfAeScKtrzOqmuegNhhRvHfQVvLmajHzA73ag7QKQ9LnwZqqoLqXcv?=
 =?us-ascii?Q?uZAIFfaHImGv3g3IhchMmpbs6fDq07VK9dCLPWGWRv4SD9vZ14s2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c62635-7909-4b85-5396-08ded5f3388e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:29:33.9256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2mBgyT/iczUU1WF0Wtss5vYHSChaVg4eB8GiMK+Pc3OZEdGyQaECQfl8pzPRyM5GwRfvhVRADXbeTbqfiDtFqZQBs2Kqd97OzNsbKWv9eUy2E3+skZXXyUSeUWjPYXz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65988-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:guoniu.zhou@oss.nxp.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:laurent.pinchart@ideasonboard.com,m:festevam@gmail.com,m:p.zabel@pengutronix.de,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,ideasonboard.com,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,nxp.com:email,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB8346DCDBE

On Fri, Apr 24, 2026 at 02:49:51PM +0800, Guoniu Zhou wrote:
> The MIPI CSI-2 in the i.MX8ULP is almost identical to the version present
> in the i.MX8QXP/QM and is routed to the ISI. Add both the MIPI CSI-2 and
> ISI nodes, disabled by default, as they require an attached camera sensor
> to function.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

This part of the previous version patch should be applied. If missed
something, please send new patch, which base on my dt64 branch.

Frank

> Changes in v12:
> - Swap ISI axi and apb clocks to align with dt-binding requirements
> - Update commit message
>
> Changes in v11:
> - Removed #include <dt-bindings/reset/imx8ulp-pcc-reset.h> which was
>   deleted by Rob's dt-bindings cleanup series [2]
> - Replaced reset macros with numeric values and added comments to
>   document the reset indices
>
> Changes in v1-v10:
> - See cover letter
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 66 ++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index 9b5d98766512..c5cae7675ce0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -859,6 +859,72 @@ spdif: spdif@2dab0000 {
>  				dma-names = "rx", "tx";
>  				status = "disabled";
>  			};
> +
> +			isi: isi@2dac0000 {
> +				compatible = "fsl,imx8ulp-isi";
> +				reg = <0x2dac0000 0x10000>;
> +				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>,
> +					 <&pcc5 IMX8ULP_CLK_ISI>;
> +				clock-names = "axi", "apb";
> +				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						isi_in: endpoint {
> +							remote-endpoint = <&mipi_csi_out>;
> +						};
> +					};
> +				};
> +			};
> +
> +			mipi_csi: csi@2daf0000 {
> +				compatible = "fsl,imx8ulp-mipi-csi2";
> +				reg = <0x2daf0000 0x10000>,
> +				      <0x2dad0000 0x10000>;
> +				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
> +				clock-names = "core", "esc", "ui", "pclk";
> +				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
> +				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
> +							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
> +							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
> +				assigned-clock-rates = <200000000>,
> +						       <80000000>,
> +						       <100000000>,
> +						       <79200000>;
> +				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
> +				resets = <&pcc5 5>,	/* PCC5_CSI_REGS_SWRST */
> +					 <&pcc5 6>;	/* PCC5_CSI_SWRST> */
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mipi_csi_out: endpoint {
> +							remote-endpoint = <&isi_in>;
> +						};
> +					};
> +				};
> +			};
>  		};
>
>  		gpiod: gpio@2e200000 {
>
> --
> 2.34.1
>

