Return-Path: <linux-media+bounces-51395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFtvIXAsc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:08:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0830F7233D
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00017303DAF2
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174D9364021;
	Fri, 23 Jan 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hp+z7Nak"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6B535CB8D;
	Fri, 23 Jan 2026 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155592; cv=fail; b=TZBkHcgUD0br1JlDfAGodAIFyWniOWvdcRNw8CqOv0no/i4jRyen5xpx4Wns5D+xbywLx/f34wmoIpl68g3mq2q1p4fxFIcDkeO/+jFtafkkTobZYA/h7HU5d5SijVymnwMZCqDS1kDeZOnT1Q2V2tt+sN2tCKquxBFcGCoM9vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155592; c=relaxed/simple;
	bh=5AdoobAH29s2pXPZeQWQo19uuOQ5ELqEYNhcvi0Ndok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N8mZSEqphi+dLmCAI9qrTSiI1vLkUVBd7oMuvG6To6o5r73FgL0rmIyQAkEPW5nlquFVHrzTXyd4n6hsjw0PIs6mX05K0ryG4JpJYlHhFkCgrNILUsVv5lhYjcWz7V4ngl1R7m+2dBbAI9OmOmwMfLr5Y1bHp9iLFj9p6ghEfsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hp+z7Nak; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpP+gunfY2svC5l3/FtUu//zpV/lS3GS9xbgElPzk71Ai/Gr+Qh4qVXKKA1w3Lxi4OTsWbXIRtGMIw93w5b6QmlANUrYaIgAY/lK0ok6mJ2mVvIIPIIGeLU2HUYvMv9leHaRBTgLhoqq36QKuybeDYHUGJO/8413N4mpLYP84Tptj7kWqjkmhMDHDNM68+xBzC5KDROGifysZRVh/z3qqZ33nnrhtLS1UFMgwO1YiD3KMf76S29ttFoztWGdu2xB7Tu3OL9TR5ojGvW7cWkR9OqIqFkraj0ruTcqA9rKkqFnEdIV/kBWlNrRhY4VboTrmDQY1uTRDu6nUexl58Knhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClJukCw7buNVm7qYcWHNun39CV79NCBXix7pwRj/Zc0=;
 b=ChJ/MYj7C7xqjWj71Oqfk2CGJyQj5I5m7OMTkml2Ss/u16+e6gB8OrGEotuEiFPNgeax2K1iEeNYu3BvN5Q+TjOsJ4oopJyrQgmTr4/fDBs8+IARnmRPSZzs5T/Ke+P0Dt+AXetfRBCLbqyoB341FBapIRo6e5KX8CAVopK38igHtaHnEW635ByN18NWSdswLUNwYUvcxywxLjjWZhYv9EgaU2BKjZP9avAfcl8bK3XZUnUAg6pZmKyhDy7M+WenI+wvDSwhuQVZ+9feHSHDAie3NGqHNacnm+uGm+PUV2yyE9+AwEK6zn5VLZJsl9EuPNUEzzoSrmlV+5yR7pAnEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClJukCw7buNVm7qYcWHNun39CV79NCBXix7pwRj/Zc0=;
 b=Hp+z7Nak3S40ieCnc5//ZcLU2cx/JBpmEKrl9EK+BivsrRpFYLHYALx+9af2UOiTsEB5TAxN8dy45P13Qjlxdvi60Q/jnwubcVGSwx5eWD0tkAYWMciVvWzopnYZQN1H1BLnM43hCB2/AbSRCEsc6WHFL5HtD2d0+0OwDOcNR3qXMzKFuBe89QEkrLwOVeN04OFaTQKJiISaN6hep9ic9t6eBOstKVKP9KK2a5cZrDzJaV0JcoU6pxW9uMVglKS+wdUGQR4wTj32LDhNSzaRrJMLwQJPUgW4ytkFsWvoWkxs//7KSEequlRuAFHHD5LvQyKcWoSkc3s47lEz9nQPoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8624.eurprd04.prod.outlook.com
 (2603:10a6:102:21b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:06:25 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:25 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [RFC v1 06/11] media: v4l2-ctrls: Add user control base for NXP neoisp controls
Date: Fri, 23 Jan 2026 09:09:33 +0100
Message-ID: <20260123080938.3367348-7-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: b34bca29-b976-49d0-1cf4-08de5a564d8c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ryM/Pw8L4hetK077lNA+QWyFbQiQdLRAA7OPMwsrvoB/qSRI8VdP70mHaBPT?=
 =?us-ascii?Q?1JCDrZIQY+XvD3j6u0os7tk1/DpaiYsyJkvqhHzCL5F8MdHPiClWZMqmaNCb?=
 =?us-ascii?Q?jsxpdzBBEzSpvmT0Cs+3AsgALKrePI4QkOgH9zIbbODNI88cqpZaWgllTJ+h?=
 =?us-ascii?Q?yj+1nuCFAtsEhaUuAAVaZQU4c8S9h2WkfX1e1ktdMEJ5NM52HaFzsUeYSW1b?=
 =?us-ascii?Q?iLbJLGs/gTlC9FZ3VdlqICxxDzloDO04Z/hmDSZWXensy6QyU8530LzM6pXo?=
 =?us-ascii?Q?/zBluzz+vP+bhs0WSWK89ej8jVcrTQybGhnXk/AIxeaUVHdGWNGiNiiQKY7G?=
 =?us-ascii?Q?dwRfF31DY3MlGqG+BccNqFUkh8U1eLkdtXxdKjEtw9BZBMgQshfN3DTH202K?=
 =?us-ascii?Q?aPGpCFxBYm6J52nxSM1HEF0QOUM0PxMUkU5BxKnmpOKbNReOdOq4wHD3Bh2C?=
 =?us-ascii?Q?WF7ceyj5gUGjyBH9dN/yDhi2dnopkVS6+47V56ElOh4sNWf2mmaz3hN3Dx9+?=
 =?us-ascii?Q?cHhGq5B/jVtaeJ06z8h1B7EkaHf7mptJEmtMFrN+oq3SUML+BJvHexwTDrUp?=
 =?us-ascii?Q?7/Mgw+BWHbYQwHjzYwYqZWrTs/Hx7eqv72qh/ATaZBGGtXRkyRKvKWinCgRd?=
 =?us-ascii?Q?cWJX6oCec/JShEOLJ+T2KzaLbWaA9gAYPpP01hYB/HH+q61k1CvrGvykbD+X?=
 =?us-ascii?Q?WkSi94Q9wFvP3lmp9WzHE52VHk1IDlWXjdSsZE1Z03hcmxigNMYMZUXztS4u?=
 =?us-ascii?Q?Q/kmJIyN+g8GCHZ+v1AFRTKHhpva8O/alb/4wtK9Y/tikyAmSuXhgR9Hm0Jn?=
 =?us-ascii?Q?Lfqy/JIvrlCN+ZrXCOzMCTRljThaIA+u53b4vZGvfJ6pbXkEbtqlgkAf1Ch7?=
 =?us-ascii?Q?Ot7NhAjuaHBFofGhL7Kvb6XDuYh6lvYwvgbaMkksU3WZmJ2L5im0ZRCs4C6+?=
 =?us-ascii?Q?aNILRqNXJpyPzgdC55eUkBLMkuvW8V9dFkdmWpX6N93QnctVtQfoIgrVHeFQ?=
 =?us-ascii?Q?EK9liffJlZmoh6RpHMjSugm95+MvtpxCOIzb0b2klNcsFFaSPP9yVFv+zx+4?=
 =?us-ascii?Q?//OY3+XY5Cx5665ELZv+RAa5s5Da74zgE0YTSkjSJSvwMnKE8pvKgKzoC5lp?=
 =?us-ascii?Q?Z0qRUXkxRYuaS5w3+9jhoyjt4qE7hbFDc20RHKlg9z116n/BF7hj17H6jN5S?=
 =?us-ascii?Q?tD1Uyvg9YavCrCsmUEk5lztG2CUQm0kA+0gaSJExMp3cr96vajp9K7Iw5p2Y?=
 =?us-ascii?Q?2mV042VO8aUwvyZBKtQ5nLvLUzysm3fLfRHIoO6iTZTOsWXpHrjAEl3Z7fE+?=
 =?us-ascii?Q?Z7JcDaHqfpYbz5hhu1j7Nztu3TNtfXDnnwNmELTWGQwg/CWGO19/zozKUZcK?=
 =?us-ascii?Q?u/PfgJvtmHv8x9p3LecjMd6+JC4DpIq6UlnDKjaAOZKlLzyEbjdzd0fi40Jk?=
 =?us-ascii?Q?1EhAB7BL2XQ3J3D805wY/hMNsvNw7qsj44nJxugNtkZWSmGfvC0ZBMHXArl1?=
 =?us-ascii?Q?EtotehT6ipWS3d8sTh9AGHFgKT7wnsguGlWpJbD6GQ/yns9oNjihgDCS5tI5?=
 =?us-ascii?Q?kyOux+PPaiU615/YfF6V1kzL+gnFEOZLWgACtW4qRCyb1XvG2YhaOBRC5gFk?=
 =?us-ascii?Q?dHc5fMDZjRu6ZAVEzyjxB3QA6YZtR/0bHtQgP3VEoy4t?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ivQmA5Xy27NRGXZdhBt/EEd6eGxXG+abzPpT0y7SzH0L4gxCR23YDbfQdaJI?=
 =?us-ascii?Q?IWfgL7O9iz90XeW7W+AigA9KsclQoX4K8GVGCD1tCV4S4MtgbmDGCe7qXaPc?=
 =?us-ascii?Q?eNem+RMsksHfHbfYm6d4dEpHAUq34KRnhaqqsSeVtR3UoxhzZP3G3rgRbyGK?=
 =?us-ascii?Q?yUVmL0piPx8+WOKap+KM2Js/iY0a4xB/nqv6eIDUcYpK17p7vQvuhdSaJyxY?=
 =?us-ascii?Q?n4YQi581L9QaOb3+bpKUT52M7Ga8OAyL1sJib/zMk45+aaQWMh7QHNuQZ3fd?=
 =?us-ascii?Q?akrmKNrzvxgUrN9za0/Tv/pCHHRlac4IgMZSHehc0QyV79x2RXDjguEYnEd6?=
 =?us-ascii?Q?VPVSsRrDllCTyXLwP58Z8P87PKA81zoN3Jihb+hdyLIjN4h/KNIJEkeyEuNk?=
 =?us-ascii?Q?5mgTifYip0PtRz2YdQ3shYzgEahN4G6qnUCNvmuFpHApyPZkmDMQ27lAN3k+?=
 =?us-ascii?Q?H8xyCvQXQj+etOMxnLzAC1JskRFwHQNdW4fWKXFUjzw77PfNgbIS/ai/wgh4?=
 =?us-ascii?Q?GZGg6eO8o7Wp//f9y8T7UyErIO+dJ1auDfNCcyf0M2A6WqweuNSx4yDDen2i?=
 =?us-ascii?Q?tJ4ExaJq/TibkFBnCsF4kM0NIxmvIRw8OyHVuieSd0p3fts9PNFM1/BJt9wY?=
 =?us-ascii?Q?fUNbbupEeCc1UZQaUQhmt3eL61wwvM++2UBL9KQQ1AFVoUNmJ3rCb5rdvP2/?=
 =?us-ascii?Q?5gYliWuPXkhh4YJLHHxWcMuIha3txzei/Wh6KCbj2jRspUvM0KU57q7PkDWA?=
 =?us-ascii?Q?qhrflSy7+Hv+5e7PBuKohPpzJFwkfX6uNQGw51I9cr+Cl68OLu7vNVcCJa3v?=
 =?us-ascii?Q?fuiIX2MM/a3VR5MU/DrUiLUMTnjoGOh2GRLUYmDU4fmzzdEREjOkxQrssst9?=
 =?us-ascii?Q?Q41BMxFh8H28NGXh+Hx6pl/4t9z4iDJStJ/pnJaLtT0izZ/3WlRywPqdk/xW?=
 =?us-ascii?Q?U6+/bq7Aox4RfIVs2iIZdh2Rr8LeKL1l8/ehv7DulYw+WhVUEBSGJlE+6XN/?=
 =?us-ascii?Q?n67Xx/51nTcKMYFvLh1unkQaI2jFHhYBw/DENCfz/sNNOiH0/sdetRTwcHps?=
 =?us-ascii?Q?/i9a4M0LiV7EPJ8gK/xVaKNWsy7C6HNjIBmim4w3WbqrvEHyK3PzVHswoSaC?=
 =?us-ascii?Q?Qrxqwx0p8gr3cWCaMguGlrezzLaD3Tb3D7hfwRTl0pamBPzikc4VPsELkauv?=
 =?us-ascii?Q?pbOvNLDKA8xZXb1/YfB+3gLUPIHe0GKXav2AJCQg4k+hHnNCkO1VBVRO3apx?=
 =?us-ascii?Q?1Oi5ou/t6xWFiOF3PbADMlk6RFl08n1tDJ6i+Tt1/b2vG7Dd5yQlfIHu2eOK?=
 =?us-ascii?Q?HDpulXDXKepZ0E37D3RnY4agzNB2hKaHLKZOT0skaX6A21A52ot2/FLBQiou?=
 =?us-ascii?Q?DCCmro4B80wB5YT6oI4mvDbSDrPsuLzq2oHn9GdaNINocwqAT3kGZRP5JZWb?=
 =?us-ascii?Q?jdGKrIdoQ1vuSwZ3WyW1zbixJYnSJgAvYlFFWU1VlpJjuNZJGG9r0odFbbyC?=
 =?us-ascii?Q?VVj1MU44Y8gvQiHuA/O1+zgOkRC1OEtSSeWzhIH6d8+NYo2z4L8lPdaec8dm?=
 =?us-ascii?Q?gxaOJSurMgGlfORt0z2KCfklO9uXajES5kI32EclpJ2ELO3k5s7CumejsOVj?=
 =?us-ascii?Q?JV6L0HDYxcouCMLiwFfm38cNs4qDrmDVkzW5rYu0U8pEAXi/KBY8W8IgGGAv?=
 =?us-ascii?Q?rLCeQ+UbSaNSZ01V/3fJrPIRCepBd9aPCmvfuDoHiRXbafUXhl7MjuSnN0AC?=
 =?us-ascii?Q?WxPCuY82VA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34bca29-b976-49d0-1cf4-08de5a564d8c
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:24.9768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6BNMxPRE7UF3K2AN1p72nz32XZUyRFSmNCANNu0Fk7hb/FiFJ48Xw7kcYUs3gUag95z3C2+e6sa4Pa2n8Hw/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51395-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 0830F7233D
X-Rspamd-Action: no action

Add a control base for the NXP neoisp driver controls, and reserve up to
16 controls.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 572622e4535e..e4d3c07fcd2e 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -234,6 +234,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
 
+/*
+ * The base for NEOISP driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_NEOISP_BASE		(V4L2_CID_USER_BASE + 0x1240)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.52.0


