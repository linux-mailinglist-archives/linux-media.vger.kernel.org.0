Return-Path: <linux-media+bounces-51422-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG2MDu2Dc2kDxAAAu9opvQ
	(envelope-from <linux-media+bounces-51422-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:21:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD776F3D
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EE23304FC37
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 14:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CF93128D9;
	Fri, 23 Jan 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fax92HUk"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788411F4CA9;
	Fri, 23 Jan 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177923; cv=fail; b=EF/8xm9DAnOJXz05lTst/f0e0MHn3UOk/jjF/M5g38n2GNI3XOffFCbcnb1Kb3ai5HBAsowkoCO2EZ5F1y70rz7Ro8UEJsRlXiZprNBb/0FWTUgFCn6KfOHIQLwftRYvKUnMhC8aCyrqA1poughyLV0WMAMD//2A/oFCwSIJtOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177923; c=relaxed/simple;
	bh=zknlsDZqmZwG8JtKYj7zHz3COP3rCn857JQB2DpaYUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=snmUGBzMIa3yXX/JyxG/j6KsdNrcbfWcKI+mI+L6P+jViOPyOZOlTZdgC+skPrEoMeRrKLNQ8MtCurFSucr8mf11Sp/Xg+V0Eo53Lvxgl+LGRKrzO9gByTnyHodryAp+V0dTntpZ/8o5jjMgdo9TnjOZXPs+bh0VsDl64WS4qzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fax92HUk; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgCvonepipVXWHmqtd+yUiusmRtIzYv6m+0fpnrX8qAUCxB8uPez2k8jCHpszbElRSn30geXhcdTN4idYBN9Hk2gjdXLXlSCXSNVB2qhoKmj1XGakUSV3LtoEJWJOxt98qe/bUKe+iozZ4FvhUoP2H9jZH+PsGpv4ri09EwKOE/Cw3SNdjt2JRLDVJeGR98gxEyhaQ8Wdd1i0UYTBvD49HF/5yFlqHoasMyVnrVAFcIQGq3hQpNtBmnlFn1zOSicW1YDIJyHzfU4QXLK8Pnzougau3hEjUoS8KAXbOp/SRBN/8De+Z7+XVJC2zdfuqpmzc1jzaiTAuj3H0oxkxD2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ARGQ+Ps5S6VlY75Yy446muAI/A7y7H3uxXCuVXwYEA=;
 b=TR9Pz2XTaJbkM/cNorxw698AZX8kyqYlChC85xo6kkzVlN2z1PB+ie+RfvDjNHwf4OdzFhKOlF9ojiWU0GKapzBkHO8eLlx8YqHk/7vJGwkA4H6TNeeORiYt8kxKZYrb5OQaGv5vpt2FFc8UPTUHIEOWRICasmayLmtgNefEhTra3H0eACz9FCyaITJktHIE3of/ini/m9ckdCvT3WwvjrH+JoBQDkd3xDB523pawMzDblRNFEBq2QGiMzWHrpYHcirxZl5NaDfJaGgL1QHxhlGPc0r29ApqSDFEXeW0tK1YGJsSt2FBgtK6WTwBC1Wdvwd19rDAJ+WGyHI+6036FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ARGQ+Ps5S6VlY75Yy446muAI/A7y7H3uxXCuVXwYEA=;
 b=Fax92HUkyLXLE1n5ouc+S9bmoLJevZWWelkMVam7bFJT5ai06+yv8G0euJcODOSPqKjxV2+aaxOseOI8wGKlG0tOv0UXt8IL9WcYMEiv5F2zoRh4CwwWdF7GA8aHNqo9iWmguREP8GsG1zYYEvQwDScldUjJj2G8zXLZNDZq/Zs5LuiDe9NdC9h/ZVPx8Ie0wMarKcrodXslGEHPumUFzUolc/+5gGNk5ORjp+x2Vo37nhiQLu3Zqi44vGIofV+oZqwu02lOgiqBjLfV4p4VDyUhc0ZvdEuvwST4EVs38J/tWs55Hv8yYXuzFy1DJHv/i4t0FZMc8ir2ZGFdiSNoiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:18:36 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 14:18:36 +0000
Date: Fri, 23 Jan 2026 09:18:27 -0500
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Message-ID: <aXODM8njMTFhmci0@lizhi-Precision-Tower-5810>
References: <20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com>
 <20260123-csi_formatter-v5-2-d5b803f867bf@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-csi_formatter-v5-2-d5b803f867bf@nxp.com>
X-ClientProxiedBy: PH8P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::19) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|DU2PR04MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b3ac314-f91a-4266-7ce8-08de5a8a4bd4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?lnIGk7k9LL3S/EJt2hyRvq2HGFxNrKdD6NqhEio9JZFioOxjbrwloj0q0Oew?=
 =?us-ascii?Q?MUTdNzy9u7AeHmiB9VEo1wAUW4UjXa5EoI3sQ2GTeAFkPlCmdyD89snNamL7?=
 =?us-ascii?Q?MxfFvSZL+Tp4TBH+4o0M5LOrXHpiTj1L0yzSWSag1R6MABhxU4nNHL/WnR5z?=
 =?us-ascii?Q?gzmC8nRBH6OCY7m/qecsmj6JRjxua1OLzcs/MSQb0bYzjH81Efmh2wNhBVR9?=
 =?us-ascii?Q?TtdELYXx9E0dBD8M02qLQJ2loRxn88i5tUtHLbVZmEyl5wgzZN9Ln8U++DIK?=
 =?us-ascii?Q?NkmBGwBjXeykrVibylAX2c8+j6FOm8A55ZmHHQKvvLTNlBhsJ8Dx1dPKxa8y?=
 =?us-ascii?Q?oEGR8h+wNkVA9nNbGWFYRsXfcxjrBIJ6q2BRjwt7MkVyTW0OUiu/V816ZJzZ?=
 =?us-ascii?Q?gIhapTQHr4mDoz+pcxsn5ieRy3PYTld+PXa/AHjEpiy2b1D0lU3faqjBoWi3?=
 =?us-ascii?Q?VQWNSnLGQXvbfn1TuUeZIEYIUiiRDN/56wBGA0bZhWpA8qTRe5IiuZNLNMaJ?=
 =?us-ascii?Q?46l1m1jtWtZWYrvwslgDygdi5udf3pYKZ4xF+Dy3QN3WoAhgJQgiaSuc9S8L?=
 =?us-ascii?Q?Eq16wZDt+ZvcF5WjCPi6ZQnTDiTyemxxE/b3Pzsj2ELHdb7dVBJBD+bT+afC?=
 =?us-ascii?Q?5mxGyozzPQaB3INVJ5/B11uZ3vLGT8p9C2iC0NiYqJl1bQxGT7etu2TwfVPX?=
 =?us-ascii?Q?nYUtXCHX6nQEy6SV04BHPJhYSqfW9YbU0e0gV2zXTA2SFZN8nj/nsBb5yqim?=
 =?us-ascii?Q?TTmOQiXM7sHWvGi7LCjGH58aIom856dDaezBd7P+VKfTfWMwmPVNW2N0ew4W?=
 =?us-ascii?Q?AnVa9EgHfeAkFdxoyr6/cC5nQXvpVrhOS6fZ6uAKo/ilni6TnIfq1f4hTbt9?=
 =?us-ascii?Q?7/kAhQstFu3okNUauKFlG6tlnO1ZHFLZ/eS2PcngZ15B53+tRKrK9x5cDe3V?=
 =?us-ascii?Q?cYPlxdlMrKF0a8QV4qOB3UAXjZO1eDbPVhoKldLEOEG9xVz3kVihVS2CmMTN?=
 =?us-ascii?Q?hl5aR0C51vaCDjxnjBEVClxj1Q7PyliR+3FugEucKrJyRZxmeZukGlY559bx?=
 =?us-ascii?Q?aNgh+MfAL7df9N3XxmQXgaR9cZ9qgN1NH1LUU16lnSCiVfyO7H0g6p/EgwZn?=
 =?us-ascii?Q?lVdssKIk/S323j3EGC+gUpknxB5rEYsqOFuDq25EHIeGCayrwWKm46Tkt7Ga?=
 =?us-ascii?Q?SVUYjtxuHmqW+zLFwFKO+wDl0ICWk4FcSAyzDnyoZvtMy2ssuE/ta46CqstT?=
 =?us-ascii?Q?34M3A+79AG91/8rNuH1MB9nR0nPTbdAedMrTuJfoyFAlNggT1rMTM5NXclwK?=
 =?us-ascii?Q?g/FRkc8f0h/xILVaDgQGHDmecEe6npPi2F4jIQB/cdnz74lUWWslEUdL05Su?=
 =?us-ascii?Q?SoruufGRhGoZIzgsoBhKKH4KNDYqYjhecv1sPimQXAzJsWz64u4eaceaob0k?=
 =?us-ascii?Q?lA5/9wBMUI6y0pGmR6XSXKlvprfeXRGJVLwmge+TPtUVgnfVh/aWewRP84Qg?=
 =?us-ascii?Q?ni72hpd9aQzqDmTz62A4AJ2e+g6FnFSl9qn2G/GUqDKLdWgQGytS72z4+pti?=
 =?us-ascii?Q?K7szdw/8TDrEVlPaQ1jL60eliZvqG2yrYt1kXl/3mn3LnjuFy0OSzxDsUb25?=
 =?us-ascii?Q?rRgQCe+1uzTyUwuSYp66aOs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6EjcITtbZCRZ1w/0UB9A+ZGANri0wZXS2/g923gFB3De+G2z9MNGVmwjAMN4?=
 =?us-ascii?Q?R3P58T1ddlrx6Jx09725L0TQ90DMj9ZAKXc9M8UPhMd5nRRsqtJC86YOnjDX?=
 =?us-ascii?Q?upJRoSXH+cymWqTx8v3TEqJa89fRrGVALY+b4ev6NJkDG7g0I4mJaxXj+RlS?=
 =?us-ascii?Q?jOYQPig4DaCrpjJu+fFvvIF8h4WB3y0r0eoizWJT4t+wZLMgrOfD8ZdIImWS?=
 =?us-ascii?Q?oxzqlrHkIu0Uv9fLJP9TDOuTHuOsQEN1ksX8mSaqZxLlKk9rcaD/bwxAdgfA?=
 =?us-ascii?Q?bDD1A9/4QCyImWh4Ybh17Gkf3owz5Lrd5bzhwOKxg7HGxNWJfDScVWhTXmCW?=
 =?us-ascii?Q?8rBkKLiuow+MHxLXTIbRVb/teS/Kr6haV6ca4LxO7xk38NYBJnm+Nf8HYZ/T?=
 =?us-ascii?Q?ZChrGHfWQdByIZ6X1oNfQe/zLMAV57C7ZuziWJbT0NCDYMLn9ZIQNl4dUe8g?=
 =?us-ascii?Q?pVsvGR2AxA9Vg5imo2nWbJch3rToIcbj8ahgB8i6XkCCTVf5jI2blUI923zh?=
 =?us-ascii?Q?2J3OfBUFiwf1V4s+upPab27IeDYYORLPAx8DhmTZaLOAZxAo9b4V5p0iZG3m?=
 =?us-ascii?Q?8CQcLsTQbM19b6i3MBHG/ol1mcA1vz/dDocsZmpBWMqFRBMuUQqSPsG2zOSx?=
 =?us-ascii?Q?pU9GIJEOvO+PTT3UGLzgShc+2SrM1oudk5XgLQ/MiTulzFkA5mMz1rhhqRYl?=
 =?us-ascii?Q?3Zdu+LU29YCcAU3F4w/s6CO/EwKb8RujTxmqLDjm8aeMIRKHYS1nEtiJWW5j?=
 =?us-ascii?Q?bA99PyuQESA9FBWt7YdhSYXQoeJ8z8NfmKpUiFSpzdtGB97XzX0N5bfBFKZc?=
 =?us-ascii?Q?Jir5/cLyFuiywFqMTmKsswYr/3J/IFTSv309L9r/XNcu8d7QrFqysnpWck/S?=
 =?us-ascii?Q?LVLZOdXu6G6u/ZV53XF571CKnXMnChC5OP+6Hvlzz9XqocRNbQOsybjfGiEF?=
 =?us-ascii?Q?qm1r023TNcU2Rb2puffIGplqu8KaLhpdlkKKxUPhBCU6tAzXe1RS3s8xcKa8?=
 =?us-ascii?Q?X990EbvMrxuhm6x3ldwiDX0pA+8diHwZ1GSPdOv6+j0NLfRePPSXJM5rtZN7?=
 =?us-ascii?Q?O12LGGVV5k99cuHsRbOgy04i8dKSM6wdS/xiqcSGDnzs7+DAqugVPwTHUTcQ?=
 =?us-ascii?Q?dRIjU4wulETUxn/ZrqiAGY+slWutXa7XkRXA5qHMJWYzpgICHKzsjpNx44xi?=
 =?us-ascii?Q?o3h9dTXhHxJNJanBOInARvbPpkhCCIjuqoNekSd6rjSAD9J9FUouIRu45fAz?=
 =?us-ascii?Q?z43AuWwvrFaGgoYACT/0sVviQoDqhNYHP5oitcIUIbbiiWga2tsb2+Y9hpgX?=
 =?us-ascii?Q?8zmeTwZTkoS9QXtvKY4SbImZpG4etf3YLdyfvuvFmV+tV1iUKyB1zTE2VSvb?=
 =?us-ascii?Q?Pl66Xy4l1xEbsGqrPhnMwfEQTN2jZ99IdB7DvGp4S8S82cnGTAE1wO2oWRxP?=
 =?us-ascii?Q?io1ZuvgYrIyi/+qCHLnz2Y7L2zmwbRTLLlJZlO/XMIAgFlIU3Uraecn3cPsn?=
 =?us-ascii?Q?892xnFdbSrcnB0FQO2aWLl62ES0XzkBKJvaacuYi+ZdHrCtP9jbONqmIING0?=
 =?us-ascii?Q?vnNoeweQqDxl9YIrC4/WFfQyhFBU7aK1EIsZEBp8wLJu70HszsALS0n8fNLT?=
 =?us-ascii?Q?IL9g+VikA7ID04NdU3MOxWn02irT+xEmz91XTeRHRs5hDvEqIU60opNJsiyq?=
 =?us-ascii?Q?ihI973X0IJbzS6TcvQjJQ+tDPRD/gaiQd1U/ZPwskMuM4Zqm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3ac314-f91a-4266-7ce8-08de5a8a4bd4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:18:36.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vla4cvNSxa7wvpuj6JbwZ/JjHkrDuWsuk+jg0jsRr2J50478Hj4+KAJTo7swimQCx5HSpcx/DwY2SPfOiJrMaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8695
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51422-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,i.mx:url]
X-Rspamd-Queue-Id: AFCD776F3D
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:35:18PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI pixel formatter is a module found on i.MX95 used to reformat
> packet info, pixel and non-pixel data from CSI-2 host controller to
> match Pixel Link(PL) definition.
>
> Add data formatting support.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  MAINTAINERS                                     |   8 +
>  drivers/media/platform/nxp/Kconfig              |  14 +
>  drivers/media/platform/nxp/Makefile             |   1 +
>  drivers/media/platform/nxp/imx9-csi-formatter.c | 861 ++++++++++++++++++++++++
>  4 files changed, 884 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5560da0deb716c247c9bf8f245e7bbeb9b69e788..c2c80148e8b225768d32e3069cc4a70115ae21ab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18867,6 +18867,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:	drivers/media/platform/nxp/imx-jpeg
>
> +NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
> +M:	Guoniu Zhou <guoniu.zhou@nxp.com>
> +L:	imx@lists.linux.dev
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> +F:	drivers/media/platform/nxp/imx9-csi-formatter.c
> +
>  NXP i.MX CLOCK DRIVERS
>  M:	Abel Vesa <abelvesa@kernel.org>
>  R:	Peng Fan <peng.fan@nxp.com>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 40e3436669e213fdc5da70821dc0b420e1821f4f..a7bb62a2b0249659ffdfeac50fa488aee9590a87 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
>  	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
>  	  SoC.
>
> +config VIDEO_IMX9_CSI_FORMATTER
> +	tristate "NXP i.MX9 CSI Pixel Formatter driver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This driver provides support for the CSI Pixel Formatter found on
> +	  i.MX9 series SoC. This module unpacks the pixels received by the
> +	  formatter and reformats them to meet the pixel link format requirement.
> +
> +	  Say Y here to enable CSI Pixel Formater module for i.MX9 SoC.
> +
>  config VIDEO_IMX_MIPI_CSIS
>  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..39ba5660ba923141e7637b01b5b34a021dad7bb3 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -6,6 +6,7 @@ obj-y += imx8-isi/
>
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> +obj-$(CONFIG_VIDEO_IMX9_CSI_FORMATTER) += imx9-csi-formatter.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> diff --git a/drivers/media/platform/nxp/imx9-csi-formatter.c b/drivers/media/platform/nxp/imx9-csi-formatter.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8a91e88d6eed639159a5672623a3292beca4c675
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
> @@ -0,0 +1,861 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* CSI Pixel Formatter registers map */
> +
> +#define CSI_VCx_INTERLACED_LINE_CNT(x)		(0x00 + (x) * 0x04)
> +#define INTERLACED_ODD_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(13, 0), (x))
> +#define INTERLACED_EVEN_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(29, 16), (x))
> +
> +#define CSI_VC_INTERLACED_CTRL			0x20
> +
> +#define CSI_VC_INTERLACED_ERR			0x24
> +#define CSI_VC_ERR_MASK				GENMASK(7, 0)
> +#define CSI_VC_ERR(vc)				BIT((vc))
> +
> +#define CSI_VC_YUV420_FIRST_LINE_EVEN		0x28
> +#define YUV420_FIRST_LINE_EVEN(vc)		BIT((vc))
> +
> +#define CSI_RAW32_CTRL				0x30
> +#define CSI_VCX_RAW32_MODE(vc)			BIT((vc))
> +#define CSI_VCX_RAW32_SWAP_MODE(vc)		BIT((vc) + 8)
> +
> +#define STREAM_FENCING_CTRL			0x34
> +#define CSI_VCx_STREAM_FENCING(vc)		BIT((vc))
> +#define CSI_VCx_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
> +
> +#define STREAM_FENCING_STS			0x38
> +#define STREAM_FENCING_STS_MASK			GENMASK(7, 0)
> +
> +#define CSI_VCX_NON_PIXEL_DATA_TYPE(vc)		(0x40 + (vc) * 0x04)
> +
> +#define CSI_VCX_PIXEL_DATA_CTRL(vc)		(0x60 + (vc) * 0x04)
> +#define NEW_VC(x)				FIELD_PREP(GENMASK(3, 1), x)
> +#define REROUTE_VC_ENABLE			BIT(0)
> +
> +#define CSI_VCx_ROUTE_PIXEL_DATA_TYPE(vc)	(0x80 + (vc) * 0x04)
> +
> +#define CSI_VCx_NON_PIXEL_DATA_CTRL(vc)		(0xa0 + (vc) * 0x04)
> +
> +#define CSI_VCx_PIXEL_DATA_TYPE(vc)		(0xc0 + (vc) * 0x04)
> +
> +#define CSI_VCx_PIXEL_DATA_TYPE_ERR(vc)		(0xe0 + (vc) * 0x04)
> +
> +#define CSI_FORMATTER_PAD_SINK			0
> +#define CSI_FORMATTER_PAD_SOURCE		1
> +#define CSI_FORMATTER_PAD_NUM			2
> +
> +#define CSI_FORMATTER_VC_MAX			8
> +
> +struct formatter_pix_format {
> +	u32 code;
> +	u32 data_type;
> +};
> +
> +struct csi_formatter {
> +	struct device *dev;
> +	struct regmap *regs;
> +	struct clk *clk;
> +
> +	struct v4l2_subdev sd;
> +	struct v4l2_subdev *csi_sd;
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_mbus_framefmt format[CSI_FORMATTER_PAD_NUM];
> +	struct media_pad pads[CSI_FORMATTER_PAD_NUM];
> +	const struct formatter_pix_format *fmt;
> +
> +	u16 remote_pad;
> +	u32 reg_offset;
> +	u64 enabled_streams;
> +};
> +
> +struct dt_index {
> +	u8 dtype;
> +	u8 index;
> +};
> +
> +/*
> + * The index should correspond to the bit index define in register
> + * which enable the data type of pixel data transported by Formatter.
> + */
> +static const struct dt_index formatter_dt_to_index_map[] = {
> +	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
> +	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
> +	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
> +	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
> +	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
> +	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
> +	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
> +	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
> +	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
> +	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
> +	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
> +	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
> +	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
> +	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
> +	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
> +};
> +
> +static const struct formatter_pix_format formats[] = {
> +	/* YUV formats */
> +	{
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.data_type = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	/* RGB formats */
> +	{
> +		.code = MEDIA_BUS_FMT_RGB565_1X16,
> +		.data_type = MIPI_CSI2_DT_RGB565,
> +	}, {
> +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.data_type = MIPI_CSI2_DT_RGB888,
> +	},
> +	/* RAW (Bayer and greyscale) formats. */
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_Y8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_Y12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.data_type = MIPI_CSI2_DT_RAW16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.data_type = MIPI_CSI2_DT_RAW16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.data_type = MIPI_CSI2_DT_RAW16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.data_type = MIPI_CSI2_DT_RAW16,
> +	}
> +};
> +
> +static const struct v4l2_mbus_framefmt formatter_default_fmt = {
> +	.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +	.width = 1920U,
> +	.height = 1080U,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SMPTE170M,
> +	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +};
> +
> +static const struct formatter_pix_format *find_csi_format(u32 code)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(formats); i++)
> +		if (code == formats[i].code)
> +			return &formats[i];
> +
> +	return &formats[0];
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 subdev operations
> + */
> +
> +static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *sdev)
> +{
> +	return container_of(sdev, struct csi_formatter, sd);
> +}
> +
> +static int __formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +					  struct v4l2_subdev_state *state,
> +					  struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +						&formatter_default_fmt);
> +}
> +
> +static int formatter_subdev_init_state(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = CSI_FORMATTER_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = CSI_FORMATTER_PAD_SOURCE,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +
> +	return __formatter_subdev_set_routing(sd, sd_state, &routing);
> +}
> +
> +static int formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *sd_state,
> +					   struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
> +						   code->stream);
> +		code->code = fmt->code;
> +		return 0;
> +	}
> +
> +	if (code->index >= ARRAY_SIZE(formats))
> +		return -EINVAL;
> +
> +	code->code = formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *sd_state,
> +				    struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	struct formatter_pix_format const *format;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +	/*
> +	 * Validate the media bus code and clamp and align the size.
> +	 *
> +	 * The total number of bits per line must be a multiple of 8. We thus
> +	 * need to align the width for formats that are not multiples of 8
> +	 * bits.
> +	 */
> +	format = find_csi_format(sdformat->format.code);
> +
> +	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> +			      &sdformat->format.height, 1, 0xffff, 0, 0);
> +
> +	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +					   sdformat->stream);
> +	*fmt = sdformat->format;
> +
> +	/* Set default code if user set an invalid value */
> +	fmt->code = format->code;
> +
> +	/* Propagate the format from sink stream to source stream */
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
> +							   sdformat->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt = sdformat->format;
> +
> +	/* Store the CSIS format descriptor for active formats. */
> +	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		formatter->fmt = format;
> +
> +	return 0;
> +}
> +
> +static int formatter_subdev_get_frame_desc(struct v4l2_subdev *sd,
> +					   unsigned int pad,
> +					   struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	struct v4l2_mbus_frame_desc csi_fd;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	if (pad != CSI_FORMATTER_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &csi_fd);
> +	if (ret)
> +		return ret;
> +
> +	if (csi_fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +		dev_err(formatter->dev,
> +			"Frame descriptor does not describe CSI-2 link\n");
> +		return -EINVAL;
> +	}
> +
> +	memset(fd, 0, sizeof(*fd));
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *entry = NULL;
> +		unsigned int i;
> +
> +		if (route->source_pad != pad)
> +			continue;
> +
> +		for (i = 0; i < csi_fd.num_entries; ++i) {
> +			if (csi_fd.entry[i].stream == route->sink_stream) {
> +				entry = &csi_fd.entry[i];
> +				break;
> +			}
> +		}
> +
> +		if (!entry) {
> +			dev_err(formatter->dev,
> +				"Failed to find stream from source frames desc\n");
> +			ret = -EPIPE;
> +			break;
> +		}
> +
> +		fd->entry[fd->num_entries].stream = route->source_stream;
> +		fd->entry[fd->num_entries].flags = entry->flags;
> +		fd->entry[fd->num_entries].length = entry->length;
> +		fd->entry[fd->num_entries].pixelcode = entry->pixelcode;
> +		fd->entry[fd->num_entries].bus.csi2.vc = entry->bus.csi2.vc;
> +		fd->entry[fd->num_entries].bus.csi2.dt = entry->bus.csi2.dt;
> +
> +		fd->num_entries++;
> +	}
> +
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +}
> +
> +static int formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					enum v4l2_subdev_format_whence which,
> +					struct v4l2_subdev_krouting *routing)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    media_entity_is_streaming(&sd->entity))
> +		return -EBUSY;
> +
> +	return __formatter_subdev_set_routing(sd, state, routing);
> +}
> +
> +static inline void formatter_write(struct csi_formatter *formatter,
> +				   unsigned int reg, unsigned int value)
> +{
> +	u32 offset = formatter->reg_offset;
> +
> +	regmap_write(formatter->regs, reg + offset, value);
> +}
> +
> +static u8 get_index_by_dt(u8 data_type)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i)
> +		if (data_type == formatter_dt_to_index_map[i].dtype)
> +			break;
> +
> +	if (i == ARRAY_SIZE(formatter_dt_to_index_map))
> +		return formatter_dt_to_index_map[0].index;
> +
> +	return formatter_dt_to_index_map[i].index;
> +}
> +
> +static int get_vc(struct csi_formatter *formatter, unsigned int stream)
> +{
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_mbus_frame_desc_entry *entry = NULL;
> +	unsigned int i;
> +	int ret;
> +
> +	/*
> +	 * Return virtual channel 0 as default value when remote subdev
> +	 * don't implement .get_frame_desc subdev callback
> +	 */
> +	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &source_fd);
> +	if (ret < 0)
> +		return (ret == -ENOIOCTLCMD) ? 0 : ret;
> +
> +	for (i = 0; i < source_fd.num_entries; ++i) {
> +		if (source_fd.entry[i].stream == stream) {
> +			entry = &source_fd.entry[i];
> +			break;
> +		}
> +	}
> +
> +	if (!entry) {
> +		dev_err(formatter->dev,
> +			"Can't find valid frame desc corresponding to stream %d\n", stream);
> +		return -EPIPE;
> +	}
> +
> +	return entry->bus.csi2.vc;
> +}
> +
> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +				      u64 stream_mask)
> +{
> +	const struct formatter_pix_format *fmt = formatter->fmt;
> +	unsigned int i;
> +	u32 val;
> +	int vc;
> +
> +	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
> +		if (stream_mask & BIT(i))
> +			break;
> +	}
> +
> +	if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
> +		dev_err(formatter->dev, "Stream ID out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	val = BIT(get_index_by_dt(fmt->data_type));
> +	vc = get_vc(formatter, i);
> +
> +	if (vc < 0 || vc > CSI_FORMATTER_VC_MAX) {
> +		dev_err(formatter->dev, "Invalid virtual channel(%d)\n", vc);
> +		return -EINVAL;
> +	}
> +
> +	formatter_write(formatter, CSI_VCx_PIXEL_DATA_TYPE(vc), val);
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				     u64 stream_mask)
> +{
> +	unsigned int i;
> +	int vc;
> +
> +	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
> +		if (stream_mask & BIT(i))
> +			break;
> +	}
> +
> +	if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
> +		dev_err(formatter->dev, "Stream ID out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	vc = get_vc(formatter, i);
> +
> +	if (vc < 0 || vc > CSI_FORMATTER_VC_MAX) {
> +		dev_err(formatter->dev, "Invalid virtual channel(%d)\n", vc);
> +		return -EINVAL;
> +	}
> +
> +	formatter_write(formatter, CSI_VCx_PIXEL_DATA_TYPE(vc), 0);
> +
> +	return 0;
> +}
> +
> +static int formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *state,
> +					   u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	struct device *dev = formatter->dev;
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       CSI_FORMATTER_PAD_SOURCE,
> +						       CSI_FORMATTER_PAD_SINK,
> +						       &streams_mask);
> +	if (!sink_streams || !streams_mask)
> +		return -EINVAL;
> +
> +	dev_dbg(dev, "remote sd: %s pad: %u, sink_stream:0x%llx\n",
> +		formatter->csi_sd->name, formatter->remote_pad, sink_streams);
> +
> +	if (!formatter->csi_sd) {
> +		dev_err(dev, "CSI controller don't link with formatter\n");
> +		return -EPIPE;
> +	}
> +
> +	if (!formatter->enabled_streams) {
> +		ret = pm_runtime_resume_and_get(formatter->dev);
> +		if (ret < 0) {
> +			dev_err(dev, "Formatter runtime get fail\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = csi_formatter_start_stream(formatter, streams_mask);
> +	if (ret)
> +		goto runtime_put;
> +
> +	ret = v4l2_subdev_enable_streams(formatter->csi_sd,
> +					 formatter->remote_pad,
> +					 sink_streams);
> +	if (ret)
> +		goto stop_stream;
> +
> +	formatter->enabled_streams |= streams_mask;
> +
> +	return 0;
> +
> +stop_stream:
> +	csi_formatter_stop_stream(formatter, streams_mask);
> +runtime_put:
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +	return ret;
> +}
> +
> +static int formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +					    struct v4l2_subdev_state *state,
> +					    u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       CSI_FORMATTER_PAD_SOURCE,
> +						       CSI_FORMATTER_PAD_SINK,
> +						       &streams_mask);
> +	if (!sink_streams || !streams_mask)
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
> +					  sink_streams);
> +	if (ret)
> +		return ret;
> +
> +	ret = csi_formatter_stop_stream(formatter, streams_mask);
> +	if (ret)
> +		return ret;
> +
> +	formatter->enabled_streams &= ~streams_mask;
> +
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
> +	.enum_mbus_code		= formatter_subdev_enum_mbus_code,
> +	.get_fmt		= v4l2_subdev_get_fmt,
> +	.set_fmt		= formatter_subdev_set_fmt,
> +	.get_frame_desc		= formatter_subdev_get_frame_desc,
> +	.set_routing		= formatter_subdev_set_routing,
> +	.enable_streams		= formatter_subdev_enable_streams,
> +	.disable_streams	= formatter_subdev_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops formatter_subdev_ops = {
> +	.pad = &formatter_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
> +	.init_state = formatter_subdev_init_state,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Media entity operations
> + */
> +
> +static const struct media_entity_operations formatter_entity_ops = {
> +	.link_validate	= v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +static int csi_formatter_subdev_init(struct csi_formatter *formatter)
> +{
> +	struct v4l2_subdev *sd = &formatter->sd;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &formatter_subdev_ops);
> +
> +	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
> +	sd->internal_ops = &formatter_internal_ops;
> +
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		     V4L2_SUBDEV_FL_HAS_EVENTS |
> +		     V4L2_SUBDEV_FL_STREAMS;
> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	sd->entity.ops = &formatter_entity_ops;
> +	sd->dev = formatter->dev;
> +
> +	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
> +				     formatter->pads);
> +	if (ret) {
> +		dev_err(formatter->dev, "Failed to init pads\n");
> +		return ret;
> +	}
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		media_entity_cleanup(&sd->entity);
> +
> +	return ret;
> +}
> +
> +static inline struct csi_formatter *
> +notifier_to_formatter(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct csi_formatter, notifier);
> +}
> +
> +static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
> +				      struct v4l2_subdev *sd,
> +				      struct v4l2_async_connection *asc)
> +{
> +	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
> +				      | MEDIA_LNK_FL_ENABLED;
> +	struct csi_formatter *formatter = notifier_to_formatter(notifier);
> +	struct v4l2_subdev *sdev = &formatter->sd;
> +	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
> +	struct media_pad *remote_pad;
> +	int ret;
> +
> +	formatter->csi_sd = sd;
> +
> +	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
> +
> +	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	remote_pad = media_pad_remote_pad_first(sink);
> +	if (!remote_pad) {
> +		dev_err(formatter->dev, "Pipe not setup correctly\n");
> +		return -EPIPE;
> +	}
> +	formatter->remote_pad = remote_pad->index;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops = {
> +	.bound = csi_formatter_notify_bound,
> +};
> +
> +static int csi_formatter_async_register(struct csi_formatter *formatter)
> +{
> +	struct device *dev = formatter->dev;
> +	struct v4l2_async_connection *asc;
> +	int ret;
> +
> +	struct fwnode_handle *ep __free(fwnode_handle) =
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> +
> +	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asc))
> +		return PTR_ERR(asc);
> +
> +	formatter->notifier.ops = &formatter_notify_ops;
> +
> +	ret = v4l2_async_nf_register(&formatter->notifier);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_async_register_subdev(&formatter->sd);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Suspend/resume
> + */
> +
> +static int csi_formatter_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	clk_disable_unprepare(formatter->clk);
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	return clk_prepare_enable(formatter->clk);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(csi_formatter_pm_ops,
> +				 csi_formatter_runtime_suspend,
> +				 csi_formatter_runtime_resume, NULL);
> +
> +static int csi_formatter_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct csi_formatter *formatter;
> +	u32 val;
> +	int ret;
> +
> +	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
> +	if (!formatter)
> +		return -ENOMEM;
> +
> +	formatter->dev = dev;
> +
> +	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(formatter->regs))
> +		return dev_err_probe(dev, PTR_ERR(formatter->regs),
> +				     "Failed to get csi formatter regmap\n");
> +
> +	ret = of_property_read_u32(dev->of_node, "reg", &val);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get csi formatter reg property\n");
> +
> +	formatter->reg_offset = val;
> +
> +	formatter->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(formatter->clk))
> +		return dev_err_probe(dev, PTR_ERR(formatter->clk),
> +				     "Failed to get pixel clock\n");
> +
> +	ret = csi_formatter_subdev_init(formatter);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "formatter subdev init fail\n");
> +
> +	/* Initialize formatter pixel format */
> +	formatter->fmt = find_csi_format(formatter_default_fmt.code);
> +
> +	ret = csi_formatter_async_register(formatter);
> +	if (ret < 0) {
> +		v4l2_subdev_cleanup(&formatter->sd);
> +		return dev_err_probe(dev, ret, "Async register failed\n");
> +	}
> +
> +	platform_set_drvdata(pdev, &formatter->sd);
> +
> +	/* Enable runtime PM. */
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static void csi_formatter_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> +	struct csi_formatter *formatter = sd_to_formatter(sd);
> +
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +	v4l2_async_unregister_subdev(&formatter->sd);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	media_entity_cleanup(&formatter->sd.entity);
> +	pm_runtime_set_suspended(&pdev->dev);
> +}
> +
> +static const struct of_device_id csi_formatter_of_match[] = {
> +	{ .compatible = "fsl,imx9-csi-formatter" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
> +
> +static struct platform_driver csi_formatter_device_driver = {
> +	.driver = {
> +		.name           = "csi-pixel-formatter",
> +		.of_match_table = csi_formatter_of_match,
> +		.pm             = pm_ptr(&csi_formatter_pm_ops),
> +	},
> +	.probe  = csi_formatter_probe,
> +	.remove = csi_formatter_remove,
> +};
> +
> +module_platform_driver(csi_formatter_device_driver);
> +
> +MODULE_AUTHOR("NXP Semiconductor, Inc.");
> +MODULE_DESCRIPTION("NXP i.MX9 CSI Pixel Formatter driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>

