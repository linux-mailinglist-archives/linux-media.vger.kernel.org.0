Return-Path: <linux-media+bounces-65231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0YNrG+s8NGojSgYAu9opvQ
	(envelope-from <linux-media+bounces-65231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 20:46:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54A6A2341
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 20:46:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=HUmR6PK5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65231-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65231-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CE21303B72D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BEF416D06;
	Thu, 18 Jun 2026 18:45:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FE9362139;
	Thu, 18 Jun 2026 18:45:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781808347; cv=fail; b=DtnFZhWvHwPGz1e9eGqnDHYSqY1vzNQx4p91JmdQ4HuVApo4vCmIum7RLk7btnZ1Z1ASqcbpXwFOaq3sxQpl3z7AFCD+Ek53r7W4MgSsg3NdpmtwZFz3ttvk+0hejFmPBiLtpeIdXXT40tHVsvPkfj//Sx8QBjzLi2ERFz/4cQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781808347; c=relaxed/simple;
	bh=2X8/2uliH6/QjXG67NXWViOXhyPe0blsdfK3B1+IEBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mTwfXYhGrZmHu1a6QJWP9CWs0Xp/E9I8doBKXmmJNIGdO+QXZbZb6rmbqMV8R3NSF0ljOjOdu72eUnbsU+th0Ha481TiRVeTizwErZkvH155QYB1YCWwYIg/FLu6GXnSn1FggbJ1CvZ06XeRrVFbmqilq3VV7we7qL7JYy4Ve9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HUmR6PK5; arc=fail smtp.client-ip=40.107.162.70
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVZFCJZVcvDnq6iF8+Y7b8QgdBtts+gAGWYcxy1HLMPs68kopgnGJXxCPJWsAaXV6pSChxjb/8MS1S16zatChtaG39IF78NN0wDLrOkqjvJarX8ENpwMTVSkiCg2rgdMy/o3yU/TCKeh/D50mFYab0bhs5Qdp4h08NVI/SUNjx+LXOR0UucWgqKJgs66MngKuvFDcrS8CFW4vgqa0vHZQXlU26cGaJdZGFCqM95Y2eY4WccRRtBuB51nuIEXUrpMORukGnQ8T9HcgOlnjMnIC4rujN9Vr4aJFxGr3z4vMhgLrGxBDbhPrKUiaVby3NszHzwPoyo/E2Ec7yr+PN4Mzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU8s0hllREpVqw/tFUdo+aN/uX7mge8RiRJ2xgQRzi8=;
 b=aiLv2DdwHjIb4QbgKM2WSWH26V8Gplq1B+pNxQOW6Ux7TOJhXGFJK6yQQnQGC98CGu9aUCuzHweXAsksQjJ46UqiMZWrK9bFp1YJCacHtsE1Gh+tsiRrM5V49qv6TOWkZvI5QUPPGSWoZWopq4GonkDN+rtzv6d2sLt2xGe8blCeD6joAA4fwjPyEXpYt++8a4pR6eAwNFwMp/otPbVdXmeKWlO8Pf0xdFXTgIn6yD6UZWXLNycwySNUhuUQF5t8UDXBuDa5omxy8BKQJNjkj+cCEBmvfdYl6SxEIlaOhlWarSGEQGC7aigrJkIvq/cfL2CeEiv/MFpJWbUJSPq1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU8s0hllREpVqw/tFUdo+aN/uX7mge8RiRJ2xgQRzi8=;
 b=HUmR6PK56hG5kAdnj77B6kvVzImaWMtPl9G1vNG86nGHrWDA+WvGX1GFtT8LPfE2/ZBm54v6eiAes9AXbAucDn8oXmB3Jlfk4jw5MRSDwTbN5J1bmsu//I2doAQicZdVlS5bJBOXnRXS6tbhRyJK42mRNQDwca2C8p10o12MXYjwh4kM/yrCCV1AuJa+nqHL1hLubJCqZir5ZqCqgl8Io6BkJNjQjgcCk8AX/ICkW1XTYuQMBJKRbg2oWixC/dCGZ48zq6p7KuwJGhU5+oNWQSOfRRElRvyEbgCyr4DMAWSNFPSQNKEouX5J0MddVFwnXwVIAGfrsfFDYTHXSdEsdA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 18:45:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 18:45:40 +0000
Date: Thu, 18 Jun 2026 13:45:29 -0500
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
Subject: Re: [PATCH v10 3/4] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <ajQ8yfriJSOtvkEH@SMW015318>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-3-f23830312ba5@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-csi_formatter-v10-3-f23830312ba5@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:806:127::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVUPR04MB12217:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6da95a-e3ba-499b-d55e-08decd69cbad
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|19092799006|3023799007|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 L6Ok5+U5pnkWLZ4uFzdyecwNajjcPQxnu+j11L4pwq7NH8TPSAO4ivLqtfFtTYqvMqgAT/ll1Kritr/Diw0x5Io9MShyUBWqCQN2vnWNBliWASrj+FUXr58k9XVfTz1piURmC8rRDyNVMH2vnWkG78U65aP5ZCd2BYVRvrVwBBgRbS50WdtELOTmkCuupaXT5m5M0vSCIXfFr7JYTW6nvujLD4aOiF8xuHbZw13ZSn79bS6cauPqegDF0PKxWIWXC06liUqayzSIkSA3I6n/E5GyrYxASh1xQ1pe+sIyM2H9db7N3fpqRmTAaAOftDsfCIhzKGz2NK7WWsDIIMsgfcwlHzxRkZ7SEG+CZ/GzAD2v1398HKqAmEWv09acThz+ZXWKBP3AbpA/ViA0kq7irFAKjaxUzhzygC/VtqjrIOq2+qUkPNIzSgAjYbsE5VVcbI3v1tyqZaErPOYgWqaRqlvyKYdoGjQlOnbYFPg6h61iwi7xz7LHQB2jZe+c602hAKAGrctjncdVFlIfXOtbvy5Kdw85xkzFn3lvehKUMFlK5/2C/sR5mBky9tNvgfp6wGZFWsgBeda91sp3PlyDO6SK4qEJ5qDsvNJaCdpzufsZ7x/qrI7FigKtk4VGUOYmX4vJKpuxyydhszgbEoPJh6kbQlPOjkMRSNJcQcOOs62Pp58EW2wQo6XzzdVGuAHr
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(19092799006)(3023799007)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rsznfM4Gq1cOkFc0hr2JYD3KBGTDYiXNf/3lhyUNnyD5Vo8KhgtuQuHjMexM?=
 =?us-ascii?Q?0doPXQQx46jvmVOzkPmEFQifV1E4rXfxs4icEpmcSVrEQKwcCTTZEXO806pZ?=
 =?us-ascii?Q?+25W4/0TWeDypdcQ/hSwvzWVG3/XpqZYhGGfO0jozfpSpWllhO7u9W6/AYGE?=
 =?us-ascii?Q?DjoXJ+O44qkqpXkuvv82b9mxVvkkGIpb8dceD7P88ddw4zG8nk3QfR8Fk6dc?=
 =?us-ascii?Q?M62wZN0tOFVOwhVDBLOKAraEwt24Xr63zZkovPgEdP7T+bnClRiS+uoTmBUN?=
 =?us-ascii?Q?f9a6f4eBq4n82F/myo2z5TQ5yUbvirbsVZVl5Psbt0yeUvcwjK9JZXwyiUT1?=
 =?us-ascii?Q?le35pbU+gflG7x2hxGeZPsGcPaHUgX5kzEEqutKI/Ucje4MgoA8DDqr3/+rp?=
 =?us-ascii?Q?VOAx2ffaEpb1x8kz4xT2SoTb65Qffw1ddIbCfsHZWvW2VwI/P/k4CpXgNLQZ?=
 =?us-ascii?Q?SjnIZp1MHbWxjv7CzVDb/22MlsbMPytHkFlt6bdz20daENksXH9/mJ3qfDc8?=
 =?us-ascii?Q?uYMgKPFzlt8ikmIAUHQ8Dgvcxj4brnRBSCiUQL3UhVtYyryYu6CgshorW6Pq?=
 =?us-ascii?Q?T+alVz2/qe61gLSOwLsTTDpEzZJsCpZqlan+bFDWxF3mzl3rNGeURxYe+RgR?=
 =?us-ascii?Q?FPnL9PvEbztLNY7tFFy97k6BooqSuZgryhsBSep/aEfSzkYgLK/EDzf4IPce?=
 =?us-ascii?Q?r3ZCwjumTaQyjZNyRiZnOWFxphJDvrGRSMPiHYMZyl+BqmvPSIv1Xd3pwc0l?=
 =?us-ascii?Q?UEwlS8Tk7Ms5Oi0xX7S5k6iuOfjS4ved3l3rUCMv5x9EBjUuiMZ8iUH2q1bs?=
 =?us-ascii?Q?FBPX/qygbwqMDinMNzBOchQLsyvCu/sR5Y345G3J117GqNCJUxkXw9MxQZX9?=
 =?us-ascii?Q?SCnaHoXnQSF1W3TO0L2AR1+IUiEVDLXIKCUym7o0ylGOtIPGGd1YidXDIRL3?=
 =?us-ascii?Q?Ge2M3bJ+/a5nwd9C8ncrSvROmUoRZ/s51e18xWg56fRB67u8IvH2KbHzkPW2?=
 =?us-ascii?Q?Un5dIE+328M8Zpg3hV35AEPWZRNraQw4u2f/OklYwzZ5qzcsdPU6j52gjWvN?=
 =?us-ascii?Q?iP1Y2lqDfRAvCmmRKjgwfXmyBXLSl6k473E6vFWS8CkgYGFYRTtcUAmeGwW5?=
 =?us-ascii?Q?CSDINcEUAm9k3WlPN5s3JCfLEp5e1gPGx1EOww2E7KoZlenGt/iBymAmew6G?=
 =?us-ascii?Q?G3lsKmackcB9GSN5qFST6XIQBPMwP7ruaRwA6LsTcoAjYthL51+KJ8W4DnvB?=
 =?us-ascii?Q?rmsd+0OxrqFoLTeHaBMP6+Yc5h7jlAI6S1mNIC1tD5thmbBvYokeNS6opCEw?=
 =?us-ascii?Q?i/2YKrKgl6kr4k5QWEyCi33VoJaFUPHY12n12AgPL3hXqJux9V8jrPUx0S1G?=
 =?us-ascii?Q?4V7mxtKGjRH4JxbTBFAJp85aCck/bGeq4/rrxo7WNxpvftjwcoBLhITVV/bA?=
 =?us-ascii?Q?gJsZWrp26FzHTXxUejmMo/yGRAEy6nuQ/dVg8dGmBF5UsxHq/NmZKi6AeZrE?=
 =?us-ascii?Q?cgRnnBlkhcgvCdGxH9BQOq29eZ+Vs/JCqk1QAVFmPaImgVkkZQyTCJcf/vjn?=
 =?us-ascii?Q?DHBxKNS8HDxiDrB4iafN4xsYbuZqjdLuYo6F/ias+WAJEJcYhaLMXf7ZXTwe?=
 =?us-ascii?Q?a8fbXIiZMvtpqMAEYVGoT4p/bUxw/ReszbH1bk5PNhrl6TqiFEA4vvCuJI7o?=
 =?us-ascii?Q?UaJutGzMqbvaDAxSSVGk9vjLK+qacajll1d7tGzkkBVpbF8zxqWBeOLqVn7G?=
 =?us-ascii?Q?I8gF5LezyV+zl3t4ruDteWA/UOJ2YdCHenpHqfzmScvkv2pE7phU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6da95a-e3ba-499b-d55e-08decd69cbad
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:45:40.8593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4o/2rydRSWnQ31zAiGktGKJF+lA4Nz6JKtCvfIz9WftD5cIUXUWJzrcA7FruPekgZmf3hC1H1dEqA7DbIHhs7VXZo+GvGwuMmeHj2MKFXButOiQuJdrQauq4chV6pUW2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65231-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.nxp.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF54A6A2341

On Thu, Jun 18, 2026 at 05:41:37PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
>
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v10:
> - Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
> - Add formatter subnode binding and camera-csr syscon example
> - Update commit title and message
>
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 64 +++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 534fa219d9f9..b4d0a7670fac 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -46,7 +46,27 @@ required:
>    - power-domains
>    - clocks
>
> -additionalProperties: false
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,imx95-camera-csr
> +    then:
> +      properties:
> +        '#address-cells':
> +          const: 1
> +        '#size-cells':
> +          const: 1
> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +      patternProperties:
> +        '^formatter@[0-9a-f]+$':
> +          type: object
> +          $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#

suppose      "unevaluatedProperties:" false should under '^formatter@[0-9a-f]+$':

> +
> +unevaluatedProperties: false

here should keep original additionalProperties: false

Frank

>
>  examples:
>    - |
> @@ -57,4 +77,46 @@ examples:
>        clocks = <&scmi_clk 114>;
>        power-domains = <&scmi_devpd 21>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +      compatible = "nxp,imx95-camera-csr", "syscon";
> +      reg = <0x4ac10000 0x10000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #clock-cells = <1>;
> +      clocks = <&scmi_clk 62>;
> +      power-domains = <&scmi_devpd 3>;
> +
> +      formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&mipi_csi_0_out>;
> +            };
> +
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +              remote-endpoint = <&isi_in_2>;
> +            };
> +          };
> +        };
> +      };
> +    };
>  ...
>
> --
> 2.34.1
>
>

