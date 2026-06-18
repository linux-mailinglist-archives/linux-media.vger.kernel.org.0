Return-Path: <linux-media+bounces-65230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qajGMEM8NGrISQYAu9opvQ
	(envelope-from <linux-media+bounces-65230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 20:43:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02F6A2326
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 20:43:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="RL/ntmyD";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65230-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65230-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EDA530480E1
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A157A40BCC6;
	Thu, 18 Jun 2026 18:42:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43B8363C74;
	Thu, 18 Jun 2026 18:41:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781808119; cv=fail; b=HpPtCj+cn/M1pdU++dDA/G/o6UWkQIhRzEv8ArZK0bZv56LC5jm8z8XTMjbF/jtA4Xne2721xfTAxdScUweECK07W0/1bwDBhq96QI3t+AZ6Nxd0YAVooHTraOFY5n0xQu/N2hI4hF+unb3dnZXseSe1V5bzSqMdyMQtV1Dnf9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781808119; c=relaxed/simple;
	bh=9AHNpkGF+txp2wanSIKX6q+k8Mlx0Ddn1CLgwTQSq8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lq/LQpfaC6bv9R4qtIh8FSbxdJE68Bxf+Ma7pxRWxPPknjY/8NnHXwEPOlFFqS+mkVd4tr6Lj+fa308+Dj9vY7bFVIRyGqBHanatwe4pzlKP0jyf5lcwOUkRgPANK6AVbP0iVtrducbXy2XDjlpUYDYgca/zLsMHXlEgMJYQzEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RL/ntmyD; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdLuciKBKXnJUBCuDf5d4+2J6gwuB4C6qBdw4wwr88s9h/3oj0gu1zAissEJZA9+jfPD4KGlOhgeeBRlnesGuv5C7D9y7VPrYi8un/bGAjoLx6j1I7DM3aPYj6x+4f81KZV3l60d/tP9N7bMiVNQsCR3VYeajXXHu5RIlSX0V4yosdy9iE2J87VimoGERJ4r8u4fD3yN1AgtcaPoc4FAk5UtH4EaDKPb2dYtNdCyiBqv1NWRrJ7Hh+Vu7OMGafoyEeRJjX4xSBXgEyqpUo6Jgc4P4w5z5bGP1EzqQGSkoV1CkT7NtJzLI+gmQix1JXUCNKVzTRVBDLMicwC5EDpGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mniJR4vgmQ+wxpH72cFS3KDw/GUjN5AuNW+ew9iJCk=;
 b=ujhHO6joytBqxVTRCdAJS142ilp++IplupcgczPbLnWioMgEWx2r0JEgsHWLp0M5SUNlRFwkkJ9HZaEYLwxmpWPBmQDVBdSXuoNT47EAl6k4rVyKNbRRrToRGe2NquOsQZKQFYu0oQPyuYn1H0btqAfeahVOfdmY/ljqAucSfU6YeiUlWGsHIDgnMAN+mw1l1qMm1DZGPLGI7vfRWpeg1aUsvFg0DpKy/rQN2ID3MMNYr9cigyLpyUwi6slIwokSfYzedEATl6EZaAdwhr4ijExr3zE2QgzFW+kfrJbg8ufIsfj3YSu4I8xwNwuownGHpftVwMPUzuQehdDqIclgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mniJR4vgmQ+wxpH72cFS3KDw/GUjN5AuNW+ew9iJCk=;
 b=RL/ntmyDfArd43voCow7IIdATlGEdQExsGOKV/fiYT8zHZAVefTVaTJX/fChpQJ4K9zR/8rP983V5H+a5Eyf2zp2oxq5PlE85HujdBas4b3YGZSEQ8P9HZJjieFeROSx7RBZ+TcriRZa1e6GLiG6oR8VOZ5L+Ocuj5mBbQMjpQaDnlC44jm2oU/qK/dEUFo1GuBSFcJw4PF1ISd0pkrpJo1bXobAhvj7Ba1JUAmN7aoTpC0IdKSGRl+iRenVoGg09+9BJF67E81lu9iJeDtBYTLjQTvK+ADLIwcrCKxSkUUm+/EK/lpaN8myXmTnaIcupn4K+rd4N5Le/W2alEsCSA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7230.eurprd04.prod.outlook.com (2603:10a6:800:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 18:41:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 18:41:51 +0000
Date: Thu, 18 Jun 2026 13:41:39 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v10 2/4] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <ajQ74zlY-T70FK-I@SMW015318>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-2-f23830312ba5@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-csi_formatter-v10-2-f23830312ba5@oss.nxp.com>
X-ClientProxiedBy: SA1P222CA0067.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: f18f4cdc-823f-4038-c80d-08decd694338
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|23010399003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 DeEqt0YPOX9Zs9Y6miBnZvWBaywXECURtL7wEdzZ4LlteHSPv3sEiH5YV53cV1hlunSXzyc2mkxocVJXAawWH+MIxt5DeCd4LO8Z4EC8iFWk0/swrPFzXyeTqH+2r2rrGdMaBR7C0XiehrIKP98ky3ghQrdVEkr86w8X9MiNg6vIN88IFP4q+S65uI5JEGmmInXdzVZ0AVZToKOmk45Hpued6fJcUTCxBVjpfB8L1JD/xM5R3wytRz0dn0HrS07u88CTZMiAweFoeELHtrv7xhtq+TVq6JRwJd5e0umc1zK6eXmFPj6CS5nFeVdUNNvQL4TDAjNJfvihSkOdeJgrxK46EmEa9dI0GMwhOaozxwQATmuEz+cNOiOwOfk/scfT0chQPr4cav8oOtNdIiP5Kt1Jb7NoMxR8mi9o3T+kdKb3Z4RfxR2OM4h0+cyDX+S2nsrEfMpt3ppFV1wa89fE7goCPhoqokBzRnBiFIFSRnCOGDwhjvZn4mkjPnnWNhLpz6GOVWPf8CCSp5qk0bKWGWCIKDgI5ZISK32qCO5ZapamJDgCXoDxnwZpIclczXxpQrDNmsmK0POZOYKvl97kxUVZnnweUAVxWBJsgSIC6XG3XCUGpyETLz2w5BmRk3d5J2pONUN5VTeMUCpFEgDZuw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(23010399003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?YdQDhnoipU6e68XFrOcNhjqmxg3ex2XXotP016/DNiz+PEeX+chn9ElE51wM?=
 =?us-ascii?Q?Mcqte0Uik2wHq7o6dNd4u8K2mQXuWCj/R+fEAx8ATfeK67LLa349p4MR3GGP?=
 =?us-ascii?Q?r3lGDlNPXjov0HsEI2KrxJkK99qh1Iv80FM7XImEPPZGEJc7rY02V3hjtZdH?=
 =?us-ascii?Q?fnIE3xgorC02zZXR41pXmAbjp9VuOPrGv8TkSLpBSCXEo5PxjnYT3OovR68I?=
 =?us-ascii?Q?ftvpJj/UFeM8BZnKxMxeoy0jE/vR7gC7qdACF/koektyRGk7ws8TGxrUwxXV?=
 =?us-ascii?Q?6oRyNFEbzPrP5j5xlODaupSWiakI5tSrq1pZKPpoMPFPmQrmN3oyNFpBBFUT?=
 =?us-ascii?Q?9qRvlYbGH5WsuN3/kZcZyAESB7ePuQxr8xkEsXcJ5efzzuUqYCNsL+CSzKDq?=
 =?us-ascii?Q?DqrvV2HLx+4p6zVoB4rSvHtk0jy5i6su/SBR3j8VnXDcbdXXTEKhZOtIOxs6?=
 =?us-ascii?Q?tZPUUPFXTQAvWaJJ85jCuSkVfwSkUkufzc827mlKnYb7hQumJln8rhTfCdjn?=
 =?us-ascii?Q?HlJDzu56wVDCARJ8LUleAkaHoWDw2NO2mf1qqiL+L2mgMlhY6fitMcs5Ivd+?=
 =?us-ascii?Q?1h47fgkj4jqW0kZSOa+OaEc4HpKfwPQTrYsLtOgJFJ9qmOmOJ9qeQiJLYH+6?=
 =?us-ascii?Q?1PU2t5DoEmu2AKWJzthRSdDYPdHOgKY2Z+5OnhA7uUz2X23lqYQ45ypcAz01?=
 =?us-ascii?Q?3ePmdmcwSvGoLFjCN4T9Y7TLs4Wf4Wr1ROsA8HryJBD8ne95O/qqvfPQAIiT?=
 =?us-ascii?Q?e20cjZFbijfY2nTTYnJ5PosSQQaa8vNy80iOy7YXcw5Fg+SZnrdYsHcsvGnc?=
 =?us-ascii?Q?Ey+xJq4URS9VEGeSw2kAylBLddOlBGlbW3fKxc70K8fcpvBblm/1iDcTLbUN?=
 =?us-ascii?Q?bBIBrJ8c3gv1d8fXglWWhJL9Ri2guumjMNMdhicI7EfF0ax1URmSqEWGPvff?=
 =?us-ascii?Q?4tuBffqcUu4N8BA2plgJ+fVLAH1XknPgxDZ61hHBnbIqtT+BzOgHPfElxMgj?=
 =?us-ascii?Q?pUbsR6PMTNsKN9x1gk7cLxYGLsH+ICcberJcZhdfGenwSv0pGpzfeMaLHxlI?=
 =?us-ascii?Q?Mhx5F7ZiGVFzKL0+rMfYtu5m230uw5EhHXAbC8LwmO2oP6HmrBvhu1QpsH+f?=
 =?us-ascii?Q?s8ydEWkTiwst8Jm56wauArRoiSLfAV36gSimPqV3B/GdmKbFXj1N9/lh27yG?=
 =?us-ascii?Q?4AfUh1i1RVjxYSYDD5egBk6mPtG6qxpFMj83gJ11cnkscdHV9PncXbDxuYgm?=
 =?us-ascii?Q?fTUzzhhFv8UE3Y48JZtrhNzi5L7dbaAt537PP3blbJY5186184w0qeYmIFGD?=
 =?us-ascii?Q?Ua5Yd2k13tS0nl5nQScXpXNgqSnCoMTvvAMbiovrRkY6TGcFfnn9lE+At1BL?=
 =?us-ascii?Q?qMFLV+c6HGPgtcFTFR7gG/aj0GOAS5UTVBlu6ZKa20+C+9xDI/mqeg/8nM41?=
 =?us-ascii?Q?Zz37kktUNSNoRbE3O7cFWGX43LeLDU/9WLLn0bdi3BZ4rcsOWVyjT2eon+Su?=
 =?us-ascii?Q?IusIUSCNHN60enZMT4rAQywn6we95RJboWdozUZWpPO60qTLwsEGM0R7GP6i?=
 =?us-ascii?Q?L4bgGLuSYSp4WEtzZeSY2+mUel++mpr3f4AWt7Zjuqncj7LVZ7Rnji2KMXR/?=
 =?us-ascii?Q?T+mn/711p8inxDYgbxT5RUjGnPQl2U+4gBlPKXoFJ1aCA18vjP46Vvu2hSuw?=
 =?us-ascii?Q?2y7mwtMZIx69imxQfkfzjEjI9DzcpoJ67KKzqEqfjVLSZls/ivF/BgfNcGvk?=
 =?us-ascii?Q?/MBYHSDlOdCFUC5w8f6szk0WkpKhdf9PM8M+lnBcxpHpzFC4n2CA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18f4cdc-823f-4038-c80d-08decd694338
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:41:51.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCQYvfL1pEVNfq5LNX73rlBraMnsWATzje0AoO7OWjfNeVY/Sdfz4okb2yYoRpv4XleSvvk8cesj7R0oKF2wUfWgJPgiC/fV4CVkThlXqpagZZGEWrTsLOWUWZonYOle
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7230
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65230-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:guoniu.zhou@oss.nxp.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:from_mime,nxp.com:email,NXP1.onmicrosoft.com:dkim,devicetree.org:url,SMW015318:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B02F6A2326

On Thu, Jun 18, 2026 at 05:41:36PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v10:
> - Drop syscon parent node from example
> - Drop Reviewed-by tags from Frank and Krzysztof due to binding changes
> - Add description for reg property
> - Add space after formatter@20 before opening brace in example
> - Enhance the port description with more detailed information
> - Delete the blank line immediately following the endpoint in example
>
> Changes in v9:
> - Use direct node instead of syscon wrapper in example
>
> Changes in v8:
> - Use standard port reference instead of video-interfaces.yaml
> - Add parent syscon node in example to show device integration
> - Add required constraints for port@0 and port@1 in ports node
>
> Changes in v7:
> - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
>   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> ---
>  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> new file mode 100644
> index 000000000000..58c4e1cc056b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX95 CSI Pixel Formatter
> +
> +maintainers:
> +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> +
> +description:
> +  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
> +  and non-pixel data from the CSI-2 host controller and reformat them to
> +  match Pixel Link(PL) definition.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-csi-formatter
> +
> +  reg:
> +    maxItems: 1
> +    description: Register offset and size within the parent syscon
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port, connects to MIPI CSI-2 receiver output (IDI interface)
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port, connects to ISI input via Pixel Link (PL)
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    remote-endpoint = <&mipi_csi_0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                endpoint {
> +                    remote-endpoint = <&isi_in_2>;
> +                };
> +            };
> +        };
> +    };
>
> --
> 2.34.1
>
>

