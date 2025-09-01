Return-Path: <linux-media+bounces-41389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D91B3D9E3
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 08:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B91189A85D
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 06:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B1325A659;
	Mon,  1 Sep 2025 06:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Miq9vbd5"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E568258EDF;
	Mon,  1 Sep 2025 06:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707959; cv=fail; b=Rukly1eGotovrJJ1rSySPLHQg8x0YuShDUZr7YeifTyiYj5jB1HXkaZUACcw3CS0eqBQ1yWfwYtIp5DybZH14k3LGandym/ENsN1hNfuJ8A9/4MZb9gJKg8AWvTHpwOvoXJosLnRpHi41IVe/0na1IuxEl7izxnby5e9cP2Sd98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707959; c=relaxed/simple;
	bh=77UvUK+BCoT3T79F5VX1tdPPxnLCupQ2bU4OXvXZf6k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HIB/qrdgx0NeVRS8eDFVJHm0Pn2QZeOnP3zXMUoiaNaWS++a2Nxg1K3ByDnM+l/I2acyJUjW0qRyDqM2Quw1hkQrrGQFqlclckKTL/BkEnEIiN0klMe0x98ZMFFqlCibbwpj6e2ZkadfGRKqJA3pIGLPAwmd53LXmxc3mpJPm8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Miq9vbd5; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3JOxRlXzG0dmsqDReYE4kHjLW/6ydSk2Ne9+3btdL3LQhIBz6Uuw8H7A9Om4WvuRxq8c8sxUr+hQxRCN3gVYVf8CAVd0sE3XngLihmuIfH9/hnZoefccUYdzzORCdeYdRbIBDN0UBonvovhmSUrSRDT/slAv/dZ5GFCpMbJX8bq+OAY1MXmog7KgMkiK0ggMKu+PgxEAy6gvYlWDv70NaRwz84aMupWuqs9IW/cCimjZzgn9jPXlvuoS0S13+FynczDKFXnuN6W2hUU2QjEvp8ZZQIZuroxO0mRz/8TRTjC/donoEFtdZIVnSm4eLg+WcCcSq309k3V4MHxQe8mlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uokZVUoqUsS8nY//M07v4+8x5QI/ADjfAwzBPvE3tMQ=;
 b=YmcjNRGy3pJvacU2Qmg1XImLD79qe+7LuJXiqcCj1gldr+aV+Bkr8jkl51H77WBRS30Rc/w3we6YZYS7fQrbULgvpkMld+YCeu7J+fMdCVpw5Z5Ez9I/Fxoydq9iP5xOkNb5YcyRrw+L5iOpCp+ZuMoFXiuDHDZnvTpjt7C/1jUE1ilHjAOfXgOCY750n5Hl1qOLLQb+8i7JVp8YYugjFJ9RD+XvlbgWTVAPUSGyuphaqz7oKp1szmEmkb2sBp+wb4HmenRhXvbQwCjEtsFr9tbx1IVrqC3bI6K7dmZANYu7FXmolnaLT3hBkVvDANU5yV9Z2ehvcOX4X1Jgpk1YWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uokZVUoqUsS8nY//M07v4+8x5QI/ADjfAwzBPvE3tMQ=;
 b=Miq9vbd5NxcVTuk1/DTcWsH1/FI5FpgffCpn/kPWpj2a9YfwvOj3j+7bih8vFdpb6eyzxQzHguykvYmy8J0hPLj75ppF2Afr/vrJ/pvPMcsIwLKC3S7O937nqhfJGY4EbKn4Gz963ancPSA7iGAIqNuyYD+gfsfKWBIcQBA8CZsI9sKEWsuelyNMNpR1mGKRBkWUZWaDEuIfzIBG7JEW6BRFgfIjhqAaUiDYdYxJb3xGkmRtHA1ZnnQtvRJDJuIxiOoZ7oPD+/H+37GAdIHnKOBTehN8HtMUENeR0YruE5whtqfa+8p8YUHS3ovQ4dyeNriDIf+eEyVfAV1rui9mGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by PAXPR04MB8893.eurprd04.prod.outlook.com (2603:10a6:102:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 06:25:53 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765%2]) with mapi id 15.20.9073.010; Mon, 1 Sep 2025
 06:25:53 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Mon, 01 Sep 2025 14:25:29 +0800
Subject: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
In-Reply-To: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756707946; l=2956;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=77UvUK+BCoT3T79F5VX1tdPPxnLCupQ2bU4OXvXZf6k=;
 b=uV+ceH9cQodVdKaRsNxr9ZZBRBEhfIPJe0QaNw6IknQhJtpJh9vG0HDFWE0eV2dsVveGOwbNn
 LqYFGbaoYkTBNMYvFqlO0W+mDRijwzMj0/okDZmTYkOny60x5avBJrD
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|PAXPR04MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c270b6-bfb9-4c66-96fa-08dde92066db
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?U2pLV2pEK2FrbDd5YXFKaW15SERkc2gxNDZMMlNuS1FRc2tpK09BRlZUb1FY?=
 =?utf-8?B?QlV3K3NySGgwWEoxMkdVMWpLNFNrNVFSaVRvSGlZdEhueGVFbHAwSm1adWJr?=
 =?utf-8?B?cWV5N1RTTmVIMXo5NmlCMElWcFRVQXRxVjZ1TGVTZ3FKMXRxM1ZWa2hJVk9o?=
 =?utf-8?B?YWt6elhwN0hwRlFNZnRndExPRm5Weno5bWNqTkFRN1hEVEl5ZlUxRzd1T2Jr?=
 =?utf-8?B?V0xHaXk3OGZOWFB6YmNsN2cwVk1UVXRURXpYQmwxOUU0R0cxdVEzL0JUVzBE?=
 =?utf-8?B?M3FCV0ROWllmbkNpMUdBaE9IZGZuSy9YMGUwWUY3Zkx0WXlvZnZmVkhmNFZ3?=
 =?utf-8?B?L2hyVTkxclBvK0xNMVhJM1dRSkdueU9vblJid3Z1V0tBQmkxeGtZNFpYVXBj?=
 =?utf-8?B?Y3lFUTltMHNodEVlMmhUTDBkdXlwWkVYUjhtMDEwMFMxME8yb3BwOXdocGEz?=
 =?utf-8?B?cjc0eExYSEYxOEx4NzF3b0lsYmVjUC92OW51U25mR1VQN1lSdjdYYU42NDMx?=
 =?utf-8?B?cmc1QmRyL2laZVM3eHV6QlBrUnFNWExRaXdEeWFYdFhpVVhsejJkalphQmJu?=
 =?utf-8?B?NVBzbjExUVB1ZFVkWjE2QlBhMmZ5MkIxU29DdUhrc2NMdmVrTkNhemd1M05F?=
 =?utf-8?B?WjI5OG1hVmpScXdiU3RVWmVYUWV1Z3JQTCt4YlFSbFB1dkN4VjBLaVlhbk4r?=
 =?utf-8?B?YmJMZ3p2ZUE3aCtaREp0bXZTei9Pc0VKcFk4ZExsbWwwcG1CNnAzQ01HZEJ6?=
 =?utf-8?B?aGlUT0hWNjlYL2ZtZXpTQUJUa0ZWWkFTRDJka1FvYTdDb09CWnFrZFdOTEpS?=
 =?utf-8?B?ZVBSR1RabHhxNkM1K2JsL25jK1lDZjNRcDczUndpRVBEM0hVSVgxOWt4dE9D?=
 =?utf-8?B?a1lwSDQ2RzV4LzlBWGtsbnJjeG1tdmlCRkpqTUQxakhmb0JCYWlCVUJmMWNh?=
 =?utf-8?B?UkEreXBmcFJOOXhURTlPT2JsR012eFJiK3N5UFplVDl6UTR1WFdVSDFFRXln?=
 =?utf-8?B?aVJxV2E1eitTSERDODN3c01IUEtyaG1aaXozdEFaaW1ZWmptcWdza3NLSFF1?=
 =?utf-8?B?Vy9vUmkzVCsvYkpJZEQ2OXJaaFpJNUJHdUJZR3hYNUI2ek9XMjcyR0Nic25l?=
 =?utf-8?B?UmxZdFlTaTMxMFFocmNXWmRjcE1RUFkxZ3pzelRKZVJQdW9NM1ROUGdab2ZX?=
 =?utf-8?B?VEJ4MjRidGJPbWhtK3ZBWWRjMkpxUG5XRFlHbnNqSVY5aHlNcEUwTm1naXM3?=
 =?utf-8?B?RlR3d05wK0xETmo5QVRGWXFKTVpLMEpHaVNkK05HRlJGN09OQm5FK0dwNnRh?=
 =?utf-8?B?WWkrUjNlcXJ2RmY0ZEs4NGxLTVE3QWhveXJWeUZZK2pncnRRQVR5SlJjSEto?=
 =?utf-8?B?Q25OMm1mcVVHcFVhVXdtRnFxekhLRERENUxZWFRQMzZBVHhhZWhpWVRJdjd3?=
 =?utf-8?B?VzVabi91MUNkcEp6NUJyQWN5Q0R6Y1d6b0kyaHNmQmhLVzE5VUtvVG5Nb1lX?=
 =?utf-8?B?aHQxcW5yZWlKTERlUWZOdDVSb2M4U2N3TWhrTE9DUTg4VzhuVFk2N21RQXN4?=
 =?utf-8?B?UjJsQkxhbHBER2FlbVpRbVZuRUpFNmhkalhNVFltZU5OeFA0OHJpNlVsZ2F1?=
 =?utf-8?B?eExFMVRRblR3cnFmK1ZqRnhTa21kYTQ3MXpjcklOeW1uY0tXMThRVHVTNzRF?=
 =?utf-8?B?cS9td2poNjBtSVFyZ3hyOHJyU083dlBqVDE1NmpJRlJWTDFmRmE3eFhpTjZF?=
 =?utf-8?B?R2tWNW5Idm9MTlltNkNjS2t0WVJYeUROeE51elc4L3NGUHNhYnZkK3F6aldN?=
 =?utf-8?B?Ni9NOU9iZEJVNUw4a09yRVZhMHg5b0Z2UmFKdVc3SGlXTjMxdzUrSUQzbC95?=
 =?utf-8?B?M1Y1SVNwOExvVDQxWS9lOGthVzE3Rk1QcnA3NjZ6NWNEdWs5dnIxeEovZ3Rs?=
 =?utf-8?B?R254L1ltMjJwY0RBVVFpOVJkVjNxSXdqYzErZysxU25FRlZhRExtT29nN1Fo?=
 =?utf-8?Q?cW659jj+RUcyWh5eS2ntcwvvG7bBqQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dlhGaFV3c0FOMEJETWFRTFl1WHhuU1E4dEFTSUdvVERXYm9tb0FtQlFFUjdQ?=
 =?utf-8?B?RDVtTDFPMFd6QUphUlVIYnRLS0dOSXFSUFI2SUJQcnZ6YWpNR3BRMHpiMkRx?=
 =?utf-8?B?c1JKZjExZE1aRWhPNGpJWVVhSmJRNjhkbTh1TVdzU3MwY244bGwwTitVTlNt?=
 =?utf-8?B?c0o3ZkVlMkdXYXFnS2lOUU5nT0VpRTY0TU94UGkxL0ptdlY5Yk5HQ2E2QzFh?=
 =?utf-8?B?OFE3L0NnWGdMT0p0SHB3bEZvejhwQ05RSVc1aGE2Y3hpdnd3dnhIVU0wZTZp?=
 =?utf-8?B?OTB6UGFudkRFc1lQYmJsRUd6THhNbGRhR0VlV1E2UE4wZmxsaDlQWlozU3hv?=
 =?utf-8?B?RnUrdUhlcnovVHhEcG1UdVp5SW5Ib1V6dS9QKytuRFVoNldRaFQrVnZObllD?=
 =?utf-8?B?RGlnU2IxQ2lQNU5TNTNyMEd2UUc4WTNRb29hOE5TWE5jVVVLZ1J2L3liN2hP?=
 =?utf-8?B?NUtYY2JlSEJUZnNkOXUreWxNTVFzNnNES3Bma3hTOUtyOThCODZaS3hEYVh1?=
 =?utf-8?B?S1hBRjNjWW5vVFo1TmJZbjczcjREd2NDQnRZM250akZkbmpHOHNXb2tsd1dH?=
 =?utf-8?B?RFBscjMyMDRvMm5yQWdBR3VvVGZGT2twQVZjbWVDaHo2VzhTMVYxWXpRWVFn?=
 =?utf-8?B?ZTB0ODUzb09uWENWVkJXajNMNWN3Wjl0WDhpS1B2Y1RvVnBwVm5ySjZWK3Vs?=
 =?utf-8?B?UFNDNjNiWTJqbEhwdlR2ZE1pVWJsZ1ZaaUxYZEJJdmg1aWkvM2tjR3IyNG5q?=
 =?utf-8?B?K1FjZ2ZBM0txbW5INmNpd0dzTXpSbFg2cDBjcXExRlNZL01tcWVRRFVRL0pk?=
 =?utf-8?B?WnRoWGpDVkFzV0YyT2IwTjkwbW1pcFVCOTBFQXcyM01XMC9sckN5RlIxb0R1?=
 =?utf-8?B?VzU2QTlueXQ3ZW44cXlvK0YwRC85VDhpZnZrcDIwbmRtdmdVRXlDWUZQR2Jz?=
 =?utf-8?B?NndrMG4wVDlQaGZBWGhqVS9BbWNneU9YNWsySjNjSXBzYWlPeFYwbG9EbTY0?=
 =?utf-8?B?dzc5RStuZWFCSU1sTUJJOWdlRk52a2Q5Yk1WRVFYZDVLRDRndXRuYWdmSjdJ?=
 =?utf-8?B?ZDFvR3hTVllSekJPSkNDUGtoODJLZzJyMzFKdTVmWGFvTkcrK0Q1ZzRjeFk2?=
 =?utf-8?B?YnFQRzZqR0tZS3lYaXM4NDA2Uk8zanFuNTk4ZmtmTWd3TC8rMjFqTTBpaS9O?=
 =?utf-8?B?NXBiZzBuYnhLNFRGTXN5SC9vU2dCbWFXemRUN3laRW03UmJ6QmtiR1lLR2JV?=
 =?utf-8?B?U0hmdVc3Zmk1Q3Y1dlh5N1pmRjRhT2RWaU5OVEVRSWdGaklLYkFtTG4yTjAy?=
 =?utf-8?B?L3J0cDVvT0hJK29Uc2JDeW9xcGhMR1J2MjFBa1c2dXE2SzR0RXAwWVNWaTA3?=
 =?utf-8?B?VEFmMFozQ0I2VVBPV0JudTFJeFNibmxpeDdmYTMrU0YrTC9vWDZJb2dXQUxE?=
 =?utf-8?B?TkMrT3dvZ0drcDdITCtaUnF3QWszR3dwSDZScFlDaTQrQldxVFJCYTNWK0ky?=
 =?utf-8?B?a3ZnbjE2VkJ0MTV1S1FnTytkM1JXRWovaUhLNGk1Qi9zVGpybkVEcWk0cE5E?=
 =?utf-8?B?WFpobHhKSnlQdWQxQmJHNXQwM3hjb0krcUk3QWJqRGdrWEoyK1J0ZHo3dTY4?=
 =?utf-8?B?Slc4SDM0MXVuTHR6Mjh3M2pZeWxPTE1ueWV1UkZaMndiNFAwanlzQUFsUGpS?=
 =?utf-8?B?TFV3Rm1pTFhHYVU1UG54NmE3NTBWZ2t6VkFXNnphVnMwaHpBb1dXMVlzSStJ?=
 =?utf-8?B?Z0lhV2o1cGkvNjdKZjNieVMvZW9qM3kya3pmQkVJUFpFYTY5VCtSMkF3SGFD?=
 =?utf-8?B?MG90dG9lQm90V2xIOFhnTDNrc2tGcnZWQ0N3L3E1cEgrTDNNc0Z2L1Npd3Ny?=
 =?utf-8?B?a09aN0tVeUhHS2dWWUlQQXQzTDZwQldLYk9LZ2JwMyt5eVZyRVd5TDNiQjhw?=
 =?utf-8?B?Y1lUNXVaZlJHU2IvTzJrcUN1L3ZFR2JUaGswcS9LNDg0czB3N1BFVmQreWtw?=
 =?utf-8?B?WkdaSEEyS3VkK2tLbkJVQ2FYTGFOdkJsaG1IRjZ6dTNncU5tVXJrMDJPZXZs?=
 =?utf-8?B?L2VEbHFKOUJDYk5WNlh1MTNjZGZkSHdJSGdtVG50ZkkxSUJNdWVxR2lVMHRW?=
 =?utf-8?Q?nrlCCDISIVNBLEzD4LsyKk0B4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c270b6-bfb9-4c66-96fa-08dde92066db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 06:25:53.3299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKdQJa41xMDlJtR/Cq+HaEJnVQ0S/FZlerfPsqNSS3fDbmUURqeCSXpqX1TtK4doY1TF+GgIhX6eOECSuQuZXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8893

The CSI-2 receiver in the i.MX8ULP is almost identical to the version
present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
clock as the input clock for its APB interface of Control and Status
register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
same restriction for existed compatible.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 ++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 3389bab266a9adbda313c8ad795b998641df12f3..412cedddb0efee1a49d1b90b02baa7a625c797ec 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -21,7 +21,9 @@ properties:
           - fsl,imx8mq-mipi-csi2
           - fsl,imx8qxp-mipi-csi2
       - items:
-          - const: fsl,imx8qm-mipi-csi2
+          - enum:
+              - fsl,imx8qm-mipi-csi2
+              - fsl,imx8ulp-mipi-csi2
           - const: fsl,imx8qxp-mipi-csi2
 
   reg:
@@ -39,12 +41,16 @@ properties:
                      clock that the RX DPHY receives.
       - description: ui is the pixel clock (phy_ref up to 333Mhz).
                      See the reference manual for details.
+      - description: pclk is clock for csr APB interface.
+    minItems: 3
 
   clock-names:
     items:
       - const: core
       - const: esc
       - const: ui
+      - const: pclk
+    minItems: 3
 
   power-domains:
     maxItems: 1
@@ -130,19 +136,53 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8qxp-mipi-csi2
+              - fsl,imx8ulp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          minItems: 2
+          maxItems: 2
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qm-mipi-csi2
+            const: fsl,imx8qxp-mipi-csi2
     then:
       properties:
         reg:
           minItems: 2
         resets:
           maxItems: 1
-    else:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mq-mipi-csi2
+    then:
       properties:
         reg:
           maxItems: 1
         resets:
           minItems: 3
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
       required:
         - fsl,mipi-phy-gpr
 

-- 
2.34.1


