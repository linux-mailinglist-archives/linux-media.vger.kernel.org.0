Return-Path: <linux-media+bounces-51978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIQeHKl1gGkV8gIAu9opvQ
	(envelope-from <linux-media+bounces-51978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:00:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A62BCA5E2
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41DD8300AC89
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 09:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000043563FD;
	Mon,  2 Feb 2026 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DDffLlpO"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4633343D;
	Mon,  2 Feb 2026 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026383; cv=fail; b=gr2QZdFh4wLPOBZu7MVkLdUCBD7gMRresN/qDSK+kawI1UxzH3BJHXuTii5jXJogFO9jMPQ8gAZ3r882Gbj17o35KbiaGf8MpQpuFY7Ww8Cv4/BuAoN4zl7jqRLrr/Qkz360K25YuSd6tnOeC8Za3R4jt1m/KJ5+KlYLQLsD4ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026383; c=relaxed/simple;
	bh=cOGiiu5JGnU3kXf7mmwJqKJLxtvooq1m2p4IePYwjGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nVki3VCrCTmPPgG3VbUaA3dnVIk1u0iYj3VyVTY1b2zzHXm4GDmHz8kp7EABxl9dKVdAgB70Z8JGJWkgdynYdmu+ieDFWcrh/HSsmyMJzgyjSungpSJ97YZkOprwNdJ2KVCTo6Fl1bSwCkHTz7namdw06i3q3oLoyneC5dqPNzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DDffLlpO; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPnMSyulPYRu/kKfMOfJWzPxuF/MPSTRpA7ndYlXk9veaTXzGzJIzpMNYye0tvT4mIELFhiSw1TooU4qXnbhFl38wuT/BmMm+Um07KmgJITuBEZF7N4y1Vgi+QT3zf01N1TEIuKYefGhYk6/h6GyPX9WX0XIZr5mLc/58ZWfazQgwrCEy+qb09Gt7PJaUdn/Z5bypitG5/v5CsI9CzgNyZTKqAAka59A4cX8e/SL+4mZgHQqdDWmziEgdc0h4rTAjgVqrJBGFmtVOOKS+XDgp+EFFcb6jIgASEE1CItmxQ1pGpoluYU0rJ/JdFd3CF0W5rjuBWrUVJhBJBCvqPeTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJfTIh2o2CFn2GacROj6QyU093eEqXT+XuL5cbsLKGo=;
 b=AmnO2csidTpdYAd2No8a9hNQhXuXcG6Brfc+gUEhGTbJk8YqsJEhRHLhV3aR001356FvBZrCKqiueALkTmAyWVsSJ+Nf6vlB0ZDvSq3WB0ZTla442d0WsX20s9SAs6p5YeGpdIrsP8ElLI6zu1FtlDnYRovFNZrIA9tan1XmCEREKWx8yWWVLDLN7hMTDAc2O0oYoMGgUANWEhgkUUCNJeSkz3wupR6MpqMh0hVAHvE2l025Z0fQ9WED+6YBtzAZKOsAy4NbVoV3e+KqqOUuBjkn7903yAyph/pain3KJ6xo/MUtFau9y17Z8IXHeLNg5F8tX29ncX/MZWm9ZxGXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJfTIh2o2CFn2GacROj6QyU093eEqXT+XuL5cbsLKGo=;
 b=DDffLlpOLrAuyNkty0zLzx07J/rp79mLiFdFXNC5mHiNzy5zxUcDXl+dr/aroshNQEqjKAabJ5lEeU6FZKh6r8/utLKtc7YpE2y1H9uIDRbvqc0vqh5UV7R3Sp7OIbOFTL71sCGodxe/zUAcfIhLWyb+kT6nYVGJhlBj0TipJwmfotOW/3gNATjg+S63d03z64GR3IbsR3FNttM2755wjjH2nWCS5gO1nZmZ2ih3cOk1dP8eeSONhB3ofrTwG2JKmFlsI1bWKUjeZDT9PDx90sryhbBBuXOX+b4VuQiOjL09WvYDOQUOm2idItBf83l5X7/pOHEyXDKhFBtnwJJcog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 09:59:38 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:59:38 +0000
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
	Frank.li@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] media: imx-jpeg: Simplify descriptor initialization with memset
Date: Mon,  2 Feb 2026 17:58:34 +0800
Message-ID: <20260202095843.1030-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260202095843.1030-1-ming.qian@oss.nxp.com>
References: <20260202095843.1030-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0188.apcprd06.prod.outlook.com (2603:1096:4:1::20)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0ec59c-b3cb-4e20-c2a3-08de6241c69e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dOPWfQu33PupCZgIc0pN3UztgaUAP7yMusVPk7QNqnfDESAdMMxesrQSPZH2?=
 =?us-ascii?Q?60MCJisgovf8ZO5u+MSJiCYFLP7xm/kf05AO5lQJBncINmaAAjC+1V6iWA2X?=
 =?us-ascii?Q?4rzG5vQoUOmPMcBFUSJ+d0rr5+2Dv5oJ577q/ZTmlHaRIwiRrhE9/hZ7Iylr?=
 =?us-ascii?Q?QFzQNyS6gSogxuWfj2hQxAveRQsF0Cfk/GDCuzeyGTSOLQD/+pctFGOoBk2Z?=
 =?us-ascii?Q?YS6fyKDxyZ+QsNzIsCQBE1/SLeBNe0QT821gGhKsYBmsuDqYo5Y/LsAzfA8E?=
 =?us-ascii?Q?LjrX2pAK1FoZzZJvL4QQQjI/HAGHbHCGiuQLlI1Fc2Xd7AP4SCIup90Y7xPX?=
 =?us-ascii?Q?Jowf1DoMRVSKQvM1VO/Uk8DeWMoiLQl+gPQVJ1TaZLTS2dtM48KLiGniPhfP?=
 =?us-ascii?Q?Chrj1+ElnXLbmWF+SDb9XbLgje3xetu49Bpt8zQdVE6mqJ7xl/zh+8VyjTeU?=
 =?us-ascii?Q?FC7aLcSWlR/VrNQmt9H+c9pTs/6CvX7yEWNRfYVaxo0HeiyRTU/c5l8SEraL?=
 =?us-ascii?Q?gALwxzdufyj4qgQiT51E1FMEVbpX3AW4PEBQ06aZXxqE1evMUW68arQHG3nz?=
 =?us-ascii?Q?LdO42Osl/iR+5h5ZAkTfFOLCL64PkERcT7QmFxDNZ2sl4nrwuxZtDpBRB4D9?=
 =?us-ascii?Q?taj3aFN7MKgUQQPunOLOvIAD+bJxamPOzig2OXUwu41dTbzFaIlbftq5u54k?=
 =?us-ascii?Q?RICWhKpIEGiRLj1AJ6/Hntb9MSCbcZ64DQSj1dt1gXVXGaMTB5uIWY59E3Yh?=
 =?us-ascii?Q?54+oSr0E03MU15XsjjFgrdPShDI04pqAXviFhKladAMsLrRlbGz9EQmKQ0rL?=
 =?us-ascii?Q?JXJ0z7tWtZl2p45zCIro8xyDU1fzwoJR9ynq3TMX99jiaSorEPHH9WdZX4nE?=
 =?us-ascii?Q?Wvzxid5kaKAnNNEkT98/B0fb1Hot/5Ik5OCohjWQWrnbteMNx5CbNnWk+15v?=
 =?us-ascii?Q?/9v0iockkXtISRVGlBJgo866j2z9E4QL1u/PYuTKt/BI//ykwqvjcDg93M8t?=
 =?us-ascii?Q?FrpGt4Pbr2wa9guGXlNrRESLCqF6/Ja0gyIoQoc88l++JWCM/nop0K9ZSL9r?=
 =?us-ascii?Q?iKtuEeEOsYN/K0MM0Sqv7pIVkzYBC1GW65RRFuAaSyGj8SQ4wRdjN766jtAp?=
 =?us-ascii?Q?a5/Qo/zp2S5RZA2vnsHfLqKADcB89OU2Lp7W7sdjQE8u7utFS2wLku+SsoIK?=
 =?us-ascii?Q?ACA28d555CNn+a7JaPA1klF/cvA8i1hGitNLSma/bWXQwDBFDYybRXYAIMNj?=
 =?us-ascii?Q?ORbxaMvv6arYbc0wJURxmJj1p5wLMZHV+MXFaqY1o/VqBU6O+2TVmhviQpQX?=
 =?us-ascii?Q?genl56M/CWt+Sb0QTtbgECtbG2JGku6zLmOUDBDm+GI6GK6ywCGw8uFnMgVa?=
 =?us-ascii?Q?++VIQ6CmVW9Kt1T4R+puD5351ypo2RFtfjJGx3HPZcNfbHyZdFj5jN2yEMgW?=
 =?us-ascii?Q?R3l1COA5quEn4OZf2mO+24nRloB6DmZq6C98IH3qePuA1CFC4zs61nyDyQYv?=
 =?us-ascii?Q?1HcPfnMug7Yfsmwa24vgK+u4YorXLXCuv1LCIk5DOe9bkWv4dBe1Q1pAFtc6?=
 =?us-ascii?Q?thqpYstZKv3eYrkRLcSNV5/KsRy3eSWFw1Tn1rRrT4nzkqFQjpg3KSnr5OhP?=
 =?us-ascii?Q?oSwBNkFZyo66MF0qdd8qYkI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KA6v4VG7KK6UDymdF40PjxZu9FN7hc20xs90WVI9YBWzUQDCBpdd0sClrBEc?=
 =?us-ascii?Q?3sxcTYM2LZZIIWmPmoIa+rgZ7AiP01KO9D3ET0HOWwkiSKq9pS7y4v67MbPa?=
 =?us-ascii?Q?B5t25JwGB+geioeq3sXfKJaA65kkTmgVxuKEu8412HViACHW5miekG4ssRHp?=
 =?us-ascii?Q?IK6C8cxbXWsArLpl2tJ7pEZjTYFsa5RIE5cnxNJUoWMil13ib1jKBHEFuDEH?=
 =?us-ascii?Q?c6CL5r5pK0Qux6tY/5SYoVsORevDW5vYG2Q+xHXqoJHcpVzYRBoEyk1naoR9?=
 =?us-ascii?Q?Vyr+l9e9n38SLKYyKyW+BBlsJH5C1VjzLfRreF5RlyGIsK98iXj8+3bk1Rqx?=
 =?us-ascii?Q?IiW7m2Rc50oDH6J2L3DM2YYHfHXP6zIcaDbXxuk+HC3UHswAMWkwGT5ZD9AO?=
 =?us-ascii?Q?KH0ZI251iKVnAEHbNBOI4/U/jxMfQfY6Zi0vXXo2ilNe1do7VEHKJgXFctrt?=
 =?us-ascii?Q?q3q+gJ5fg3kbPC1KrTBsEFbv67Vqob0Ti0Fn+mn7VAvADbOLix2WdchfbwN6?=
 =?us-ascii?Q?v7HinO9CgHEu7Xx43/vGtByBJG7LlvGUep8OmIIBpwNHWVkBcrqxEVUnnZy0?=
 =?us-ascii?Q?xoz1zJ7n5vH0xWxbmc6PjnV1JLGgyXVlFuAGCUVxTrhxSA5hSIRur+d5qqOR?=
 =?us-ascii?Q?lHBI73dY2WB8BSn84ML4/GPIax4f/puk44QJWRKomCGxRlFLFwR0Az901mDZ?=
 =?us-ascii?Q?BHK218+7qxiUWdAgCAxYj1o0cwBeqE/jzZQSxR5qXBcNa/VV1dySvByjr1hO?=
 =?us-ascii?Q?zMX1vnrqTdVkOu9qwOKjZEc1VjiYkrBrD596JtlztGsPHQ39YO7sViQ5A1PJ?=
 =?us-ascii?Q?ua4j9Li0j+Zaxq8owm/5XyT5mNMlkiDmObY0q1SMKXq8GINiJRTSE5f34b+X?=
 =?us-ascii?Q?jqxk4ZnyiYYZxhFtn9MBnShcqu2D6e3SfChbUgU1TUIienulSR7O8TuMmTio?=
 =?us-ascii?Q?OMAmiYbc++15n1CxXAh+3ZyXuFby+TcKOK20ePMFvCkZKrOhfKVD3DT6tz8P?=
 =?us-ascii?Q?mYUJeiCJ+DEDNCGrawkCSy13Uwu392DHb8RP953YneDWG9wcetJjrRrIGw5g?=
 =?us-ascii?Q?hWqE/iosgfGuPMgqVWdBAMbmonb/E3F5DYRbvxuBxBAjHiESbL52AyqmUUil?=
 =?us-ascii?Q?i3dsSJvinHW1vSpGOoVJnB7bl9jW59Phh16kCdQ1iM2crF3uKKGPZ6hel94V?=
 =?us-ascii?Q?7K1XE+OS7V/5MbkyxjvieEbb3WNAxpSXQVe943tshYkJqe/LWCMjr4ES9Uqp?=
 =?us-ascii?Q?VcIqJ5LMQK8/MpPpsI34lSa3RWGGIfbfdn9ZJwEa2VgDctbwZAloC3GggU6Y?=
 =?us-ascii?Q?EBjsjySTFR11uYqgRR9EYwglCmlMwuQOiwiL+59gDbnGdYSXyFaFBOobR4hM?=
 =?us-ascii?Q?ZWDjDvP1omb+GGFjEDJpSxNUiIK1lNfTw5T2/MJPDlFwj5XSpExY2YQit/P+?=
 =?us-ascii?Q?+KzqldJiUC+4Jg+RMHrSpS2wjuapr8PuhFV4u6xHPxpVA1VQRJXxhdhLjvH9?=
 =?us-ascii?Q?E7+VtxlHUvu5ci7dIaVMgGnbfs/zrady6EHM+zoCW+V5vjLXSVxTVvT4LjwJ?=
 =?us-ascii?Q?IScdHn20Rx+/I8dZj+B5bmhzjfrj/gM6HUVdWn6TqmhqE8/EWqxtjRo725fD?=
 =?us-ascii?Q?SpC8+rcNRwe2+oeT9WJO2Ct+8JD6rTu/bM7jbNeBcJ9Dti5yuKKL/An5Kkg7?=
 =?us-ascii?Q?bv5H9XMQLIo4Aub+MevW3x43soanUMDBO+tYJyrGDxEo3T4xIRqYCSLQ84N7?=
 =?us-ascii?Q?I9Epgx8R5A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0ec59c-b3cb-4e20-c2a3-08de6241c69e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:59:38.1694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rWTWrT1xgVLeFB3yD7rHdjaYwnY8t4epI6FRWsDMCi+BTYWIbDNb2oYf9HsbIgC9MhIxrx3+e4Ur/ZdvCVYtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51978-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org]
X-Rspamd-Queue-Id: 2A62BCA5E2
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Use memset() to zero-initialize desc and cfg_desc structures instead of
assigning individual fields to zero. This is cleaner and ensures all
descriptor fields are properly initialized.

No functional change.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b558700d1d96..39022c1bf36d 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1338,6 +1338,8 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 
 	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
 
+	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
+	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
 	jpeg->slot_data.cfg_stream_size =
 			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 						  q_data->fmt->fourcc,
@@ -1348,11 +1350,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
 
 	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
-	cfg_desc->buf_base1 = 0;
-	cfg_desc->line_pitch = 0;
-	cfg_desc->stm_bufbase = 0; /* no output expected */
-	cfg_desc->stm_bufsize = 0x0;
-	cfg_desc->imgsize = 0;
 	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 
-- 
2.52.0


