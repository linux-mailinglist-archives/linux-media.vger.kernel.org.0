Return-Path: <linux-media+bounces-51609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIZhKHlreGlSpwEAu9opvQ
	(envelope-from <linux-media+bounces-51609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 08:38:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EE590C48
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 08:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2FA893008C0C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 07:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3794832D0D4;
	Tue, 27 Jan 2026 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h94mWolf"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35CE251795;
	Tue, 27 Jan 2026 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769499509; cv=fail; b=ScBuFsgYEnsiHV8LP4FC1DNlBLiBLRVwTvCNi+fXZb6ea9v45YLIZ96k216nHu0qOI9vwbLPbF+3aRsIS85hhEQsIdBVQ6Ug/EW49I/Et44uxYEz+hoJnkSPWt9ViQ0PoHhIxNDOExi89EeVyyPPawdX0Amkg4vdNXlMM0PO7b4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769499509; c=relaxed/simple;
	bh=c4RlOuXr2bs+l0cbLMikJboQfWF9oOvV3EuAkdSXwcw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Enb4a23tz9OV9E+PrtnLXsiSZI8gHo/IvtcRpfr/6t0WEjLkiBNzSB3dOet3V+XoxJ0lzXHZxt0nOH4nVvYNj6QlBGzW+U2FAQgh9M2jcxrevQ3hVIrlxIn0R2LwrHn68SNjmpCYZVpu+g4ChUQ1897TVTt1PvalUx/7D7JcgP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h94mWolf; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKDg0/ANLWc7WEZMdZEr3j2YyaeJ45xiANIkkqoDPSxmHcDx3Kgf0Y6c92AiH2WgfVOTQhnro9733YjZiy0waVFrGKCSxACOFLuTRHn/udWbCb75maQttMn7bl0QMo3eQL9tyg0EUE4NqV1Mv6ouyYtMzUjRB8hZwszA9DCjgUQnT23HLwcjjws3qv8tahKFdgxht6C81m55OJbW3oqYaCnc9+D1/g9KkJzP8F+BAchePjZluS7qSrYyjTrwcdXtTItDNnHfK9sUdN9vpetatT1CAD1ndc+nqrS0fTz+jH+0Jld8VBIPvNnb2LCFg0u5d8yL1x6ALuPgca/zgz5HBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyCZQwVO5Q/VQ3de5OD3a0kpc735FatmxMYvF9sIGNc=;
 b=cUoabE/WZnr4NJse4xh2gmfAfUXcKuoD5LfDgrCkWG90g1Ju/8w1Uek0w86Xd806lQOKYW//23bPv66RK9dNmv1VYv9TkMpZs5PBngJq1Q9KmeXnPRAcVYQG+yV2kX4HNYYMOmtZK+rxvtRRe+B2eofMu1xbB1NiRRo3CV3CtCLOcRIlxkXd0HIUvAgiWjHkhNqP6k7uWtzkc6EovQnDwG1/Na+E8NhD6DZKr570lXJHA5FB5nZSrtfPC66JAJggghb0inQ4sfnnhkCY38/gCv9O6pygCS7nZ0h/Rhk9bBdXlgpYg2Ps+EG394WBNnzB2cOw1RV6IYclJ1Yku3CuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyCZQwVO5Q/VQ3de5OD3a0kpc735FatmxMYvF9sIGNc=;
 b=h94mWolfJVte+mDDv9ZHrx2GDYy9l7zCxUk/YL43EEEJJVQ05jkFTxAzMFLroryED47ZLE1tnMCS+0tvJa/Q2LxQsalGQUgyM2+SmhebVA60outhAyJXwrax+HwWNQC8+Qx2dxnl+/9XSvKQ6kHdY15paTdtpmrZww93RDYyKEoOUIwHEVyIrw2C3x49eMC9m+ogI1Zu3IbLaoDdSKcTIILBGO1NHnqfBPj3svNJmyithzq10si96X4f5EvHndf8mc+zxYheZvTuKPrc2xakV5ZDx6A0koYleCEZHGrgGf08uewvuAVrLQkt/6efxzAbC98k4wLmxLrjUCzArfDQLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU4PR04MB10598.eurprd04.prod.outlook.com (2603:10a6:10:580::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 07:38:24 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 07:38:24 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx-jpeg: Add encoder V1 support for i.MX952
Date: Tue, 27 Jan 2026 15:37:00 +0800
Message-ID: <20260127073702.1782-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU4PR04MB10598:EE_
X-MS-Office365-Filtering-Correlation-Id: 34aec3c4-ddf2-4808-6873-08de5d770d35
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j7gIU+NXUuPSLABq2Nau8HYFZSZsN74NtrtrpylKyl/sOkUm0LHFNkuO5C+7?=
 =?us-ascii?Q?8gIaj+ITk0c7OzSWcISmhQjHz/Srg8VZZhvLjiC7jOV087szXAJ9qx/NbXu5?=
 =?us-ascii?Q?KjJIw8L6Oc6tzLdmSFUeeuA01iydTq9SoOCafxpdYY7eJtyT7P/R2vGuZG6L?=
 =?us-ascii?Q?mBIae4jyz4N3AuIEdKDOgj8eWAV9fP1ZndlELWEOgQbGvK7GWzjq7m7YMPS+?=
 =?us-ascii?Q?0CK7okoJHKkBW4ZETYoJ/b6t4WrWUlNIJ4Ru6tNUdKyb9Necz4zY1JRD/iX1?=
 =?us-ascii?Q?iO+WGyOcXtUxlJ1GcJW2pmimHYEQPz5FKdXgHZHv8S/uRcaw/MY5P74upUfA?=
 =?us-ascii?Q?hvrbwk685zbjx9Cu8PkRLOtFPnGU5AyEHtuNzI2q0+W1x7JgP8stgNE1FXRJ?=
 =?us-ascii?Q?uJQd3jWu/1hLxeLQCbmjCZCTKypdQncyDk1OiHGDLTEpdbAA2DpZPI6Ii0JH?=
 =?us-ascii?Q?6GtOtKtdSTTpI27w7TxIrnLXGLB9W6edUl7KOmweO+vssVF3mdt/mlVS+8q0?=
 =?us-ascii?Q?mXpcb4sxUED0fBCr5PZRQF93vjuDujDhsr0S93VHFfAbBtg2pnzRKm0INlUi?=
 =?us-ascii?Q?83CJm8Xx3bOJjARakvrCZQ0Npo/ny6j9hbXb7WsQABSq3P14X1cNInhlrukj?=
 =?us-ascii?Q?TzAfcNDJ/17KX+iQL8g6EgaAM2JOZyRVsxf0rgtkihqmfw2IrPYOQBv0uGl7?=
 =?us-ascii?Q?pnxBi3d+D8uAeIAmhBjrpb4Z+N1UQ1s1avt1bo8pCnl9jqHJG0HJZu4Nu5zb?=
 =?us-ascii?Q?y3tzYhFLDA4GeEuEhqoyqv8cboCq9546jqzxIIgLd3IpQbXfS6aHhmUrzCWq?=
 =?us-ascii?Q?hE9JPIsFuXuE0SzFeCkeecZf9WmLZwNhS3tks1H8aiiWazAykkaFjzd76k6J?=
 =?us-ascii?Q?NaHsOL6NFhLwJhumTjNfMlj48FoE148GvrV58+TY3B5ESy10h93nf6ZnsmII?=
 =?us-ascii?Q?HrDU6PPiAMxSGNCmlLsFWU+ZjkkYR6nBoA/F/5vmfaOEDrwCpIl3AzrqHUc5?=
 =?us-ascii?Q?AK9O/BYHkDtRcXbfyrb6SIxOAvRPanaRTaVbmPj+fKEnF79wdmHUsHHOuJRH?=
 =?us-ascii?Q?c2aTYx3CM92XAuDNiAAFHXiTv61IHFWl46R5I4DYMCWP8JNMFy8pfF/ORDif?=
 =?us-ascii?Q?e0cGcJjQ16vgwYp+aDCMAk3k7BzBucUQK380ssH0o32OMiku5tcMV/kjz4Iv?=
 =?us-ascii?Q?pbBBUvj/BfypL6a91SvGhEMOTwNHVfOdHf1bD0A9wd+K/PnYyqYTCfvFu8Nr?=
 =?us-ascii?Q?VBMj+aVZWNAxdNqU5emPsl+1Q21Mt2FN9fobZhcnxUWb8Cv8LQ6qixCGqvOE?=
 =?us-ascii?Q?O8GL9C9URHBxMSPN7GLQe4aRNXoeBU2JlDhyCITBFSt1Ye1WdYngxFOMNbgF?=
 =?us-ascii?Q?5uKAvC8UqpnnrtqIl8GGoH5KlHaRHipR5+Mqy3GyYkNIWubBTyreoiGEAS/l?=
 =?us-ascii?Q?pQWBMeQQkmMndgnx6VtuCPutHFDkPCEvxYOys9lOwMe6hnhpENVw7b95K61D?=
 =?us-ascii?Q?bgbdh96cXxC9CrzM8A5LlVMjlZD23COwBumIU8Z71bq8uDmvd+/PBVOtz5lh?=
 =?us-ascii?Q?0ZcGCIh+eVqbXnPIwT6YEBo2qkhNlDwjAzGS7K9lBKev5/x8ttCHgzJAPaT3?=
 =?us-ascii?Q?1Yf8u77iLEQCZ8zxAjLLNoc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lj1Zl2pMeymw4W0CPeiaprW8cIDrXE/VvDaCMJtzsVwzdQ3qv/ZBt1wc9bss?=
 =?us-ascii?Q?nSYPVuW71xdIaXogCt42By7UiDmK8rV6w8TaMBIBkAqSCrIMpMM8jCOmGt5L?=
 =?us-ascii?Q?tDhUWqnjcB2ksGEiHVT72F4Tvm/MsU8T+/HK5nrTsz+dGnGrIYcvFcA1D636?=
 =?us-ascii?Q?R4jhywqksiBzEdIg6xWv+/Lj60lpyWcgKiWTajCk6gPbt1CnWtaiDGBOaieJ?=
 =?us-ascii?Q?Mr3r/fJ3TtMrrnXtf033vBha3aom5gxT6SzJ2D/A2TJwW0eoPSPO+jFT8tYW?=
 =?us-ascii?Q?CxiFlOnfIDO119vR3OM+zILArsOe1zchW0NkZeUuF/iG/H8e4dfWdKntgEqA?=
 =?us-ascii?Q?RDOOmfU+OwTS/ZIfvE+ma6OlLakUbjOfgTpYcJdzVoG0mH0dxxqZPvs/jQia?=
 =?us-ascii?Q?6clUg2QZVZJPwGWuEwGW7ZL5AoCFuDlYyNwtMAONCaaKAFuJUBYOj/OlSykS?=
 =?us-ascii?Q?0uls68Q4IZKMfDqnueJ0Nl74xZfKKfI3BJ8NNygd4ArNxfbBj1mO6ufpSlHh?=
 =?us-ascii?Q?nR2R8dqlbcuA/u3rHC5Vix+8vWqyXVjTcv6Bb5DcS89uFTeNI2JZBhBxK+G+?=
 =?us-ascii?Q?ZYVQSWf+UniseRjF7mnATf7c3506S1CrO9TRSyb45PZj9jNTpqIT6UelFqCi?=
 =?us-ascii?Q?lriqxg1vPcZeRwuxlC9yyTFVmk/YbK2A9stUEvszjF5Jw91xoMD3lgaAgVW0?=
 =?us-ascii?Q?u9hsmvWLjpLGA4koO+TULkQPQR831kRHIhsR+jzI24gNtid4U3ZYrlDrNur1?=
 =?us-ascii?Q?IgUD6cu+lxx5e6CHNrGtpgQgKaG7G4CLxres/lV3nkuqXfmsWrwHLIsdWZOp?=
 =?us-ascii?Q?9QKHWte3LuYCW7Ob0JKVK//o/WTamDVfwESErr9vGGWX2z8yx60c1zVjVKuo?=
 =?us-ascii?Q?lkUQSvR0b1/Bx43Oe9MG3Dlb3jE5Qu193kdLpCDE8M0yE/QIq6Xjhjgq3SFN?=
 =?us-ascii?Q?B/4nJAziuZ1EQs2unTVmLQgQ7fePnRILdns7J+gNAdEYeO9l2xZfDHG9pKaP?=
 =?us-ascii?Q?NzCJhSHuTnaGBsNIcB7cDvOsvE4gbAAED8dpqQNQaRdGJKi3qqyj0BcsBNLP?=
 =?us-ascii?Q?8z4HepasqFMM5+7mFEAf6zYsjLKFFJCRomnwNTO6d9yX10mqJJKxImmQbXaK?=
 =?us-ascii?Q?o81QN+5L3irg1EE5rrxSIWrWkQ3zgvz4CJfzrRfhGgbamODEmuooEGFiO+K+?=
 =?us-ascii?Q?0MRtVe7vI6YMnPgsfQwzyM82oIYeRbsA6wV+30Cj1iWcMrtZ3w/kJeiUoI4q?=
 =?us-ascii?Q?uyhcfUhURy8mwmCx0sg5saro3Gx9MWa2kch5tT1SvGWJcc9IkGcjVqF9I1pt?=
 =?us-ascii?Q?Bi5+Cwms8DS3fqJpu1kHnD4mQC1q9BX1c0c6iju568TJbJ9pzsabFvhEoFRE?=
 =?us-ascii?Q?JPPeBO1lsPFFYOcQdQsdUgDeQ+Iem5jXOQUNdaa5oaav7OOgUQmtrr8W0n3C?=
 =?us-ascii?Q?VyCkDB1EG0eyiZNIc7w2xQfcorNMJ0w75UKLqVR4xBvtSign4p7PP8V0/gVt?=
 =?us-ascii?Q?q8k5JjAB5eVByy5tjBe3LQOChc7t+0R5fJaCFQfqmcG2XCg9yt+Cox1sfoMf?=
 =?us-ascii?Q?6jAT6qMjUuVX2bXF6D9whYU0un1WbOF1pR6NdNUV+CkZfsQ+l1skqshBAyAs?=
 =?us-ascii?Q?JIBp2i5xWAaem7Q3VACHDX/a4lcMyZonk/MJNL/UgyoerLpgRLjtJEXOc601?=
 =?us-ascii?Q?yDGtVnjXwvNIVItqLUlSXAdByOnPRxv3Kc2hWS7viVLS90MdhOVf4D19bmDA?=
 =?us-ascii?Q?DI51mYgM9w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34aec3c4-ddf2-4808-6873-08de5d770d35
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 07:38:24.0187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyLc5VCyj61nWLc+OsDkkh9OtXcC3Zy3gV8jm/QN1/rHWRcCXOa3IkdX3SXv7gm+tLbuRk/nI+SME/J0G0xsYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10598
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51609-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 44EE590C48
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

The i.MX952 SoC features an upgraded JPEG encoder (version 1) with
enhanced descriptor-based configuration capabilities.

The hardware version can be determined by reading the
version register.

The v1 encoder uses an expanded descriptor format that allows
configuring all encoding parameters, including JPEG quality,
directly in the descriptor. This eliminates the manual
configuration phase required by v0 and reduces the interrupt
count from two to one per frame.

V0 encoding flow:
  1. Write quality to registers -> trigger config interrupt
  2. Start encoding -> trigger completion interrupt

V1 encoding flow:
  1. Configure descriptor with all parameters including quality
  2. Start encoding -> trigger completion interrupt

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c | 10 +-
 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  4 +-
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 92 ++++++++++++++++---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 24 ++++-
 4 files changed, 112 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
index 9a6e8b332e12..97a6e1426ba2 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
@@ -2,7 +2,7 @@
 /*
  * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
  *
- * Copyright 2018-2019 NXP
+ * Copyright 2018-2026 NXP
  */
 
 #include <linux/delay.h>
@@ -189,3 +189,11 @@ void mxc_jpeg_clr_desc(void __iomem *reg, int slot)
 {
 	writel(0, reg + MXC_SLOT_OFFSET(slot, SLOT_NXT_DESCPT_PTR));
 }
+
+int mxc_jpeg_get_version(void __iomem *reg)
+{
+	u32 regval;
+
+	regval = readl(reg + GLB_CTRL);
+	return GLB_CTRL_CUR_VERSION(regval);
+}
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index adb93e977be9..e9c7573f0fe4 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -2,7 +2,7 @@
 /*
  * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
  *
- * Copyright 2018-2019 NXP
+ * Copyright 2018-2026 NXP
  */
 
 #ifndef _MXC_JPEG_HW_H
@@ -73,6 +73,7 @@
 #define GLB_CTRL_DEC_GO					(0x1 << 2)
 #define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
 #define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
+#define GLB_CTRL_CUR_VERSION(r)				FIELD_GET(0xF0000, r)
 
 /* COM_STAUS fields */
 #define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
@@ -129,4 +130,5 @@ void mxc_jpeg_set_res(struct mxc_jpeg_desc *desc, u16 w, u16 h);
 void mxc_jpeg_set_line_pitch(struct mxc_jpeg_desc *desc, u32 line_pitch);
 void mxc_jpeg_set_desc(u32 desc, void __iomem *reg, int slot);
 void mxc_jpeg_clr_desc(void __iomem *reg, int slot);
+int mxc_jpeg_get_version(void __iomem *reg);
 #endif
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b558700d1d96..9624eea2450d 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -37,7 +37,7 @@
  *
  * This is inspired by the drivers/media/platform/samsung/s5p-jpeg driver
  *
- * Copyright 2018-2019 NXP
+ * Copyright 2018-2026 NXP
  */
 
 #include <linux/kernel.h>
@@ -64,6 +64,12 @@
 #include "mxc-jpeg-hw.h"
 #include "mxc-jpeg.h"
 
+#define call_void_jpeg_enc_ops(jpeg, op, args...)			\
+	do {								\
+		if ((jpeg)->enc_cfg_ops && (jpeg)->enc_cfg_ops->op)	\
+			(jpeg)->enc_cfg_ops->op(args);			\
+	} while (0)
+
 static const struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "JPEG",
@@ -1030,11 +1036,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 
 	if (jpeg->mode == MXC_JPEG_ENCODE &&
 	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
-		q_data = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		ctx->enc_state = MXC_JPEG_ENCODING;
-		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
-		mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
-		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
+		call_void_jpeg_enc_ops(jpeg, exit_config_mode, ctx);
 		goto job_unlock;
 	}
 	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
@@ -1272,6 +1274,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 
 	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
 
+	ctx->extseq = mxc_jpeg_is_extended_sequential(jpeg_src_buf->fmt);
 	/* setup the decoding descriptor */
 	desc->next_descpt_ptr = 0; /* end of chain */
 	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
@@ -1335,9 +1338,15 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	struct mxc_jpeg_q_data *q_data;
 	enum mxc_jpeg_image_format img_fmt;
 	int w, h;
+	bool extseq;
 
 	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
+	extseq = mxc_jpeg_is_extended_sequential(q_data->fmt);
+
+	ctx->extseq = extseq;
 
+	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
+	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
 	jpeg->slot_data.cfg_stream_size =
 			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 						  q_data->fmt->fourcc,
@@ -1348,11 +1357,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
 
 	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
-	cfg_desc->buf_base1 = 0;
-	cfg_desc->line_pitch = 0;
-	cfg_desc->stm_bufbase = 0; /* no output expected */
-	cfg_desc->stm_bufsize = 0x0;
-	cfg_desc->imgsize = 0;
 	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 
@@ -1372,11 +1376,14 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
 			 STM_CTRL_IMAGE_FORMAT(img_fmt);
 	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
-	if (mxc_jpeg_is_extended_sequential(q_data->fmt))
+	if (extseq)
 		desc->stm_ctrl |= STM_CTRL_PIXEL_PRECISION;
 	else
 		desc->stm_ctrl &= ~STM_CTRL_PIXEL_PRECISION;
 	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
+
+	call_void_jpeg_enc_ops(jpeg, setup_desc, ctx);
+
 	dev_dbg(jpeg->dev, "cfg_desc:\n");
 	print_descriptor_info(jpeg->dev, cfg_desc);
 	dev_dbg(jpeg->dev, "enc desc:\n");
@@ -1388,6 +1395,54 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
 }
 
+static void mxc_jpeg_enc_start_config_manually(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	void __iomem *reg = jpeg->base_reg;
+	struct device *dev = jpeg->dev;
+
+	ctx->enc_state = MXC_JPEG_ENC_CONF;
+	mxc_jpeg_enc_mode_conf(dev, reg, ctx->extseq);
+}
+
+static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	void __iomem *reg = jpeg->base_reg;
+	struct device *dev = jpeg->dev;
+
+	ctx->enc_state = MXC_JPEG_ENCODING;
+	dev_dbg(dev, "Encoder config finished. Start encoding...\n");
+	mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
+	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
+}
+
+static void mxc_jpeg_enc_configure_desc(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	struct mxc_jpeg_desc *desc = jpeg->slot_data.desc;
+	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data.cfg_desc;
+
+	ctx->enc_state = MXC_JPEG_ENCODING;
+	cfg_desc->mode = (ctx->extseq) ? 0xb0 : 0xa0;
+	cfg_desc->cfg_mode = 0x3ff;
+
+	desc->mode = (ctx->extseq) ? 0x150 : 0x140;
+	desc->cfg_mode = 0x3ff;
+	desc->quality = ctx->jpeg_quality;
+	desc->lumth = 0xffff;
+	desc->chrth = 0xffff;
+}
+
+static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
+	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
+	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
+};
+
+static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
+	.setup_desc = mxc_jpeg_enc_configure_desc
+};
+
 static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
 {
 	int i;
@@ -1593,12 +1648,10 @@ static void mxc_jpeg_device_run(void *priv)
 
 	if (jpeg->mode == MXC_JPEG_ENCODE) {
 		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
-		ctx->enc_state = MXC_JPEG_ENC_CONF;
 		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
 					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
 		/* start config phase */
-		mxc_jpeg_enc_mode_conf(dev, reg,
-				       mxc_jpeg_is_extended_sequential(q_data_out->fmt));
+		call_void_jpeg_enc_ops(jpeg, enter_config_mode, ctx);
 	} else {
 		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
 		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
@@ -3006,6 +3059,15 @@ static int mxc_jpeg_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (jpeg->mode == MXC_JPEG_ENCODE) {
+		if (!jpeg->enc_cfg_ops) {
+			if (mxc_jpeg_get_version(jpeg->base_reg) == 0)
+				jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
+			else
+				jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v1;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 9c5b4f053ded..8e68dcde9613 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -2,7 +2,7 @@
 /*
  * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
  *
- * Copyright 2018-2019 NXP
+ * Copyright 2018-2026 NXP
  */
 
 #include <media/v4l2-ctrls.h>
@@ -81,6 +81,17 @@ struct mxc_jpeg_desc {
 	u32 stm_bufsize;
 	u32 imgsize;
 	u32 stm_ctrl;
+	/* below parameters are valid for v1 */
+	u32 mode;
+	u32 cfg_mode;
+	u32 quality;
+	u32 rc_regs_sel;
+	u32 lumth;
+	u32 chrth;
+	u32 nomfrsize_lo;
+	u32 nomfrsize_hi;
+	u32 ofbsize_lo;
+	u32 ofbsize_hi;
 } __packed;
 
 struct mxc_jpeg_q_data {
@@ -105,6 +116,7 @@ struct mxc_jpeg_ctx {
 	unsigned int			source_change;
 	bool				need_initial_source_change_evt;
 	bool				header_parsed;
+	bool				extseq;
 	struct v4l2_ctrl_handler	ctrl_handler;
 	u8				jpeg_quality;
 	struct delayed_work		task_timer;
@@ -125,6 +137,15 @@ struct mxc_jpeg_slot_data {
 	dma_addr_t cfg_dec_daddr;
 };
 
+struct mxc_jpeg_enc_ops {
+	/* Manual configuration (v0 hardware) - two-phase process */
+	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
+	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
+
+	/* Descriptor-based configuration (v1 hardware) - single-phase */
+	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);
+};
+
 struct mxc_jpeg_dev {
 	spinlock_t			hw_lock; /* hardware access lock */
 	unsigned int			mode;
@@ -142,6 +163,7 @@ struct mxc_jpeg_dev {
 	struct device			**pd_dev;
 	struct device_link		**pd_link;
 	struct gen_pool			*sram_pool;
+	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
 };
 
 /**

base-commit: c824345288d11e269ce41b36c105715bc2286050
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.52.0


