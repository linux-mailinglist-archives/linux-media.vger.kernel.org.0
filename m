Return-Path: <linux-media+bounces-38637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60278B150E7
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 18:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CE1A16280D
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 16:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C6A299A9C;
	Tue, 29 Jul 2025 16:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LKxMevAU"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE2222597;
	Tue, 29 Jul 2025 16:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753805252; cv=fail; b=teWJnY98Jz3CWBShnMLfwnWThV1h4v5U5ow0p7R8HMciQOK/tMzlyQN42DYljzOpOF2N8cth/98AEuoNYFCCVQmDjrFvQ74p0inczQwghqgf6rUyzHyPvSo27jXhKEkEcxUEnX60OWCEa2vjkPVu3snyrrwCsdz9HvcDoRVSZeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753805252; c=relaxed/simple;
	bh=9qIDNgcYdOBm/YxxXMalgQQAqMhduqyjn9QKgCVkc1k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nin3Xe0AT9GefGrjnOy55l0l/ICDAAOvwej0EQl2U2Eihaa3Z7WntEDvayCUHKClwH8V7i3WoADaKegF4eEw2piKM73Sg2UlQ/VTegq59tEcTM3o4nVd+LvhFHUUqcOWJOWUJVMgQ5EVJ1t0/wy5AGSXDy/yocMJE5rx1W8tZk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LKxMevAU; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fecfG+xF6rXW/NrsLeWYA91upVX6tfD/OdcHUYQoVjC1qoHYWchQ5AsD2X6Fe1+aBvWCl+AMx0gGEs0XLxeDdJywnySC2KZGSWLPvpWIq0ShCPrrowPMJWiH6FRp6PmruUZR8MAt919Rb1cj4NEYcW+iixiF+0dg9XrVDVIYRIkwoVTpiOvmAy7JV8nYSiu9YD2jfq4IOS/JijhAv5oQBfzuNjoXQXR2giCI7dwrEtzeiYcckUNYxlToLk+5H/BZxv3SPXVohtSB8Hg9HsE845Z6WVQr7JmPl8Uljj8giv9QcJbNhiFkkj6uuysmk9M+ZDSq/MfamJW0oIOdII9tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0AmwIytw8VcTDCV35uXWxaLTXEZaxXiIOB5DND3jJs=;
 b=SlxczzDGNeWtm01O4ASwo8BOyi/PuY0JUdlRhSWlVyVzWZZUmKLu+dAz1qqZYg7M4sf0yk9+feMS1f4bNjVvLw9jz7hoITD9pyraPEIS6mKRVg3dI7cw7Eph4I2irRAeh4BUspW4+wDCJByuQTRmNSSPSgiam4EONjWqZWzayNFVN8eB9FDGu6rLcroUSIyEhml/fzT/oC5SmBLTabRp85v4mtQJJOsZ0Es2wyasH9rwnutKTGEwtJZCW83sHnbxG4NNi7yChMQp3jyw/saGiWpqrkIBCfOanfH5J3G89IyK6OPfXjAuAMUDPG0hgVmPQkyscenZ9q0ngYxHJC0tIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0AmwIytw8VcTDCV35uXWxaLTXEZaxXiIOB5DND3jJs=;
 b=LKxMevAUHnh0KTXCKvs4iJPe9VBtFvz6ckskEmfwIxN7+pWfEuVZfNwL1Gski0nJs8MLhLoKchTlIqUWKJ1V9szWorvb2bg3dhLjATrwnOc80WEGOyPmUrcAc7YefEKUb91ejtEDZa4tOImEy/91GOQtcHC5uNOkqVLzVD4DMeUupRzTWELP+1ufpTV68CVV9+MYdy6QIphU6BPthXoFz0Qy7cX/HsmpIiMWZ4U/P4MxKaIjY4awnP17sTHf6WvU9zJXhN1PzC+vcNxHNjJ1rc0kpdzmIQt4SQmX0YBjf9WYfbQhiJS1MoemY024S0UN1aCJYHUhmA/mnXbjgDknRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10551.eurprd04.prod.outlook.com (2603:10a6:10:588::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 16:07:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 16:07:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 29 Jul 2025 12:06:25 -0400
Subject: [PATCH v4 4/5] arm64: dts: imx8: add camera parallel interface
 (CPI) node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-imx8qxp_pcam-v4-4-4dfca4ed2f87@nxp.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
In-Reply-To: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753805222; l=2314;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9qIDNgcYdOBm/YxxXMalgQQAqMhduqyjn9QKgCVkc1k=;
 b=pLkUFF3PFgv46T977pbcbdDylSoJjPEMq/MDn1FiESpm9tliigSQTIN1snJgPsLJKGdEA3RzG
 mQRoO8h6I8RCw6tmtwC8LSfO6cKcag+tLS6c/1xmu3BMmvd1UCtiuht
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10551:EE_
X-MS-Office365-Filtering-Correlation-Id: e407f390-70ff-48c9-d673-08ddceba03d2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?V2FVdllRcVBUSWUwTHdvYXcyaE42RjU4dGtpZFk4NWRtcXRsOU1tTmw4ZVo2?=
 =?utf-8?B?MEVkN2w1QWI2UGx6L2puRDQvc0g0WkEzbmJpdGFCSWUwUGlGZWdLQTg0djdF?=
 =?utf-8?B?WnBRcnBMOGdaOXVybDg3YU9QRXFycjdQeUJGM3RMNEtBU0pEcWV5V3JqNVRk?=
 =?utf-8?B?R3MwcDhOREoxZEFFQlMvck1lTGlwRHBQY21HMG9MTUZTMEJ4ZllDOTJmRlls?=
 =?utf-8?B?aWxhVU5KTnBPcDYyN1ZaUlc4SnNEbS9JWXdOYTF5TUowVHBNNk85a2ZTb1V2?=
 =?utf-8?B?OEYwTGpWQmZBYjJBVlpkWmdCaEJqSWVweW9ZTXNLcWZtaHl3aXB2Q1pSanM5?=
 =?utf-8?B?M1hPNDIyUDJVL05NdDV5K0MzQ0c5RExJcGhvYmNJeVphckVsOXovd2NleFlX?=
 =?utf-8?B?S2dEaGRBcGNTNmEyK1pwWW5HTFc5V2ZyaHlHK0VRNWFySkdGemp5UElWcGF5?=
 =?utf-8?B?UFFKdDJCc2xtTWZ0Tkt3VzFQK2lEakZWaGZrcG8yNGcwemc3YVp0VHVWSHpa?=
 =?utf-8?B?MFZvMDl5NnNSQlVuVWFXbWw2b3dTa3VJQWtzbFZrb2RyenhIbmxjVHlJTzJs?=
 =?utf-8?B?bFd5KzNDcllkQTNBSHBKb24xSVM1UFNuWUZUM2hHdGdFQUlYNDBCbHV5MDBw?=
 =?utf-8?B?N2ttemQ0bnJ3dlhXZmZ2WXlQcFRqZGgyMUN1UGozaTgrK293dXg4OXJtK05a?=
 =?utf-8?B?OVd3c3lZOHRZNmxyL2hJQndPNHFjQUxjUmRObWJ6TnZ5Q1J4c3VIL2lmcUs0?=
 =?utf-8?B?YkFud3cxK3ludmdaR1B6UzZ3WlNkSzBCaXlnbW5oU3kvMmo0eFpIVEhEZkF5?=
 =?utf-8?B?ME5CdnZLRkxEM1lRNmVFQnphT2NZR0daZjJyS3pCdHpYQmxWSnRzVmF2bWtt?=
 =?utf-8?B?SklpM3RyYnMyS0trTElhMjJKd25wMmpMMkNFK3pjdDR2bHRNZXVvbndHaTdn?=
 =?utf-8?B?VWkxdlAxYnpQYmVEWm01UkVya3VTTzRGaXk0UFVEZDZkTUlvaXVCUWQwS043?=
 =?utf-8?B?QUd6bnZqUjdjNkZaZ2ZEcGtTelA1TnNwZnNxc2FMUGxPTUJkUTRxakI5dGw2?=
 =?utf-8?B?ZDd6Q1pac3dCNGgxTmY2eXBzUDZSbzRqQ0x5Y29JaTl1eERvU2lxVVRMK3RT?=
 =?utf-8?B?TmJvbkRBRWVEM0FmVENWOWI3dWllNkcrTTdkbmlQMzRiN01rWDhoTmJOQjNi?=
 =?utf-8?B?SkFTalRSbEQrNFpIQ2ZyajdLTkttUFNqOVlYTmdiYkRTYlZVK0NKRkZlV3gz?=
 =?utf-8?B?OXQzYWJ2bXpQU0dOcGNDL0pqSGxXUktZYURNa3poUC8rKzAxUUNwcmJkWXNw?=
 =?utf-8?B?VldlUDBISEFJSG04Wk90WE52aktaM3VBSWVveGNPRzkyT21ZaUpoNzRxN0hE?=
 =?utf-8?B?cEU4dVFaQk5GdFNSYmdkbnFZdFcwUE5oc2xkbFJIejdxdHFVejVkcTVkbldC?=
 =?utf-8?B?d0pTWGg0Wm5BL3VhNWY3M2Q3WkVTdGZoTUgxeGhrQTFxZGdvV0xMbTEzREk2?=
 =?utf-8?B?K0tyVDNxUG1zWk9ZN0NUcnphNWRqcm9NWnQ1Qk9EOFdZVDZrWFErazdGS1k3?=
 =?utf-8?B?YXhBR2g2N1V0bVlzN1c3RGRFVnJHZDhrWENGSE1xVDB0NHlIelBIWnRrYWs2?=
 =?utf-8?B?ZW5JWnNoMXFZd0Rxa0ZvTDdpUHJkYnA3c2RVTHdpYVhwdVlWY0MvSjUrWkRl?=
 =?utf-8?B?TnhxUHBOSFdOVEhBaTAwRW9jcnI0SHJxWmZ3cHk3c29EUEMvYUFxY0o2VHdW?=
 =?utf-8?B?blJUVWlIeDBjRGp3bmo0S2NXejFGNkpnajJxcFZXemhzbEFndmVJbGYwa0Ny?=
 =?utf-8?B?K2kxK3dNenpKbUJmczlsYS9NcVhNRVRlQkNqdW5ETnB1WDVPcWV0Nno4aHJj?=
 =?utf-8?B?VmF0OTJFN2xlU2gzWktHR1BzS2E4TC9UNjA0NEJwNStjbXF2OXV4bTd4TXc2?=
 =?utf-8?B?bjFlV0Y4Tmt4cWdWZUFSRFU3d3dNaXZ0ZG45YmFFQkY3Z3RTWHkwZDBCZFZ5?=
 =?utf-8?Q?0CcMO6ahxiDQl2+rL/bvq5Fe5Ks1bc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bmlLYTdTMmUvbzRUK3BsTS9zK0sxQXZlKytJdTZFdnIrNHYveDJOMEwwblpJ?=
 =?utf-8?B?Q1A4bjdDRUUzcVpabHBqM2V0MEhIYTdiMklkR3paSzVKVXQxR2NQYS9aL1pk?=
 =?utf-8?B?RllLY1FxdFBIMStFRDJtelRyaFdEUENUS3VnQ2JtdGdmbnhxMzl0MldTUUdW?=
 =?utf-8?B?R2JxQnIyeWFmc2VvbjV0T012aXB4ZlFaSllXekNRdW1oSXdjdFVNNCtxbU1k?=
 =?utf-8?B?VlRlV0k1UXhHcVJweTUwRFVoZnRmRm9IYUI1ckVmdHlVMVR2aEhoTUhBUCtq?=
 =?utf-8?B?YWtsYWVKVlgrbXczb0JRNGcxVktyOCtnV3krNGpQYTF5VGRqTENNdHRXRjlu?=
 =?utf-8?B?RGxKL2dJRko4SVhiejV6emhRQ1dhOFRPWGZPcWVUYU1KRlBEZ1JYRTJqR29z?=
 =?utf-8?B?Y1N2NzRnVlp6dnZBcE1UcU9Mc0N5ZjRNOEhxNjZwanVQYVdPeWI5TnF3WlIy?=
 =?utf-8?B?UitXWjBWbkxYWlZUdlcwUDhSSUZKb2Jja1dkd1NGNERQdlgrMVFFZzgxVFdI?=
 =?utf-8?B?NUc5US9tdVNmNmROUnRUL3VXZ3hiNmpYdHA1d3JuTC83RGJicmFlL0RpOHl3?=
 =?utf-8?B?U2piN3pvNUVYUzFhQzQrSlV0b0lOSlpXRjF3cDhkZS9ISS9lNkJ3eFV1aVlh?=
 =?utf-8?B?WHRvTlJyVTQwV05raHJlOURXamlpSytyeHJkUkdIbDV3MVJ6eHpYWm9CbVdB?=
 =?utf-8?B?N2lac2tuY2VvTDVtajJ6YW51NXZVVTNlZmNCYTFZdkdLbG5GQXVLY1Z0UFQ4?=
 =?utf-8?B?ejJSQmwwVElOZWk0Z0JJNVcvSVFHMEJFVmpzTml2U25DUWNMSGhaYmh3TkxX?=
 =?utf-8?B?bTdmR0ZtY2FHdFpzcm0xbHE0dWdxdWxMMEJKcGJ3a0FpQ0lvT0x1R1FkdmdZ?=
 =?utf-8?B?c3k4WExGWUd3cWtZS2IxMVdrTXAxaUd2cFdxRDM5SkRibVFtcitKZVVMRE55?=
 =?utf-8?B?Mis5bER2UzR3NngzSXI5WHIwdDlMV3VFTis4cUo0Vk82L3lwS3NvcGFobXU4?=
 =?utf-8?B?STFMQ0N0L2E0ekZCNG9JM0pQMjB4MmQzQUhSdkRxOHExWGlFeE04QmtKUmw5?=
 =?utf-8?B?dFZuZmpic3ZYcWR4cEFTYjlIb2NwTTBKSmQ2MEs2ZW1CbmlaNWUzNmtiR2Jt?=
 =?utf-8?B?bmQ3Y3cybjdMWi9yMk9CeHJzOTBCeUN2aFAvZGo4a25XSEhiZG9wQzFrQkFU?=
 =?utf-8?B?WkE1RVpXZnV0Sy84ZjQ0YWp2YnFZTGhlVDdkWmttd2FjOEt0L0d0OG41ZnZi?=
 =?utf-8?B?QkgyNFFLeFJnWllXM0VXZExkOWhtZXoxbFNQQUFMUFBGQ3FlWXRyMUNTTytl?=
 =?utf-8?B?ZDFiNFZyb2NvS0IyVHZvcU56YzhrNTNaRlNZTWJkbUhIZnNmNmZJRUQyS3o1?=
 =?utf-8?B?U3BTdXpKMmR2WFJTM2NQL0VuenFmMWVjblpIbldDWEhDeG1Vczhoanc3UUgr?=
 =?utf-8?B?OFBzRUpBZkU4YVYrZVphVmprbTFqWThndXEvSHRlc3U0NnlYZjhadU92MHpi?=
 =?utf-8?B?amJVcHJTakNxSGZMOENib0dMcWtldFVsbm5VUURSbTluT2ZsQTI2MGgzTG4y?=
 =?utf-8?B?K3h6SHlFUVJwSWQ1VGpUTDBlbHFzMC84RVBHY0QyTXBmenBSVHRMaUZOdGY1?=
 =?utf-8?B?SlNCSkRycmJ0VHl6b0dTOU9ZQ2xQTVBWbFcxQnNPSlFWbEExR2liZFB3ZXc1?=
 =?utf-8?B?eFlzaWdhQUdFRkdUMDBSN1RsOVo2bXBnZ2MyL1M3VDR6cGNlRCtqMjU3emZl?=
 =?utf-8?B?YmtUMlJNWVVDb3U0bzRQbjlwU0J4azlhYkh2eC9BZllDbE1kR2U3dHhBblYx?=
 =?utf-8?B?VVBtbGtLV0kzNEZiTUR3MW1QWUhLdlhzdjl2TlZBYjYzVWxBZ2NXaVhiS3Uy?=
 =?utf-8?B?MU5qZFhQYitLSzdncXRCbW11SDg5VkpMM2RreVl2VUVxNEk1aXF1TVpnMmhQ?=
 =?utf-8?B?UXN1ek1zOCs3bkZXSGY2OWhtb1dzUXFjSlR0MzI2T2FLVld3eEVOdUorbVFk?=
 =?utf-8?B?MU5aVnJ5VUd4SlV5SDdEKzFOWHRSRUZleStlK21MSUFBUkFoeFdXcEpUS3ZY?=
 =?utf-8?B?NVd6UFhPSTdld25pMHdXUWdFOVh5M1NOazJINUlrOUlBOSt2cndxdmsrbmdZ?=
 =?utf-8?Q?omHSmCUxq4xwQlzSZiSycveVc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e407f390-70ff-48c9-d673-08ddceba03d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 16:07:28.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VS6NVmIfPktmEnGlFFF/TTZl4r+L5FuspGT37kubg4051Kaio+7rFELavb8fr4j/LKBCEfsLp7T8nZt4m43hzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10551

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
index 2cf0f7208350a416d77b11140279d2f66f41498f..e321b0d62cce13ef999085fce7aff9ea2fd7fc21 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -224,6 +224,19 @@ irqsteer_parallel: irqsteer@58260000 {
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
index 232cf25dadfcd1bfbed724de075a734f5b46b58f..5aae15540d6cb1b1b60fd09bf177488900c97c72 100644
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
2.34.1


