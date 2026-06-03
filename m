Return-Path: <linux-media+bounces-63685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /0+RIIGiIGo+6AAAu9opvQ
	(envelope-from <linux-media+bounces-63685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:54:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D119863B797
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:54:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=aZVG9dLT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63685-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63685-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEC8C30221E3
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2554ADDB5;
	Wed,  3 Jun 2026 21:53:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1012A3A8F7;
	Wed,  3 Jun 2026 21:53:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523617; cv=fail; b=KIRgRoxZGA34k2H3qCmke7oARvu9d8EdozVrOWI35Rs0nZGdZPxfgIKMjJehB1C3PhPO851ATt1E4Ku902/ZbvsNV7Vb81ghouWk6CYm5x/PlvTYAilfkVjY6nJwDfmskOf7VGdk21L5YMR+z64121U30cw45pOKw5YSALcA6Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523617; c=relaxed/simple;
	bh=cDWKm20fn0ApY2CwB5wRuxfY8VNfI3h9+kf+sVMY7B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bfnD7MrPrunPS/1zj9xau1CygJ83R8/i2MIPIKHe3aYcv8H+Na6bvb89YH93kK1Hu9J1pi0olJrMXE1CP012FpFuHJCxUMeV4VnOigrw4h/GmlqUMOhSS23Vj5YaghguyZ4ihVfHAVVg1wJSx+kZFbnrTjR3aYkj3/JAI6DQIJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aZVG9dLT; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0HM9leGEmWsj7Xxz52WtCfcoFr8s+b+KBYhJeeK5aw+5TYbrj30Kb/4VdsoqFlHTeiUWUEbgVte1dOxRRJX//kUQb3rTbc+c0rjc0Xc8IkxFu6UTw8ULsNWnTbTRLIRV+dVGboEbscKcBThWKybmiHFSOeHiz1RpaCV+EyViu1QgitNsw2pldlcdbXhEe3Mhmi5YkHTWkOJBhxJHL11b1oziDThEKd5bxwY1juavqfuCXwapqqdsmoVqAol2/eDDghGHI0jitViBTt3EdG6FSYbOHZ8Z8GoeNi0jww3TM2Rfu5tet8acRKacohBFxtl32TQ65Ny9beKmcHaIqRh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ifeKWhxdUMNJ7tVTPgFOJDF8iLK1HRVPghfVEdVR10=;
 b=JoYmhkng7XBf5ky2asjyLlxGY9pO6melyCVoA/kocI31ze98tj12Qp8WkvZfxrU3/J8Bkc2ZNzATGBikVXgooQwL+4ejkR6zKEyPyPvoUfeYiP5LKhu7GrjUrXrGt+7Tf1wiXteoN2DV0SyCDk18vc+cuuJdN9YFqQd5HTeMxO2rBC8zmHKqKQ/gVS04Oki4Ndpj8mvvw76Z/TpQBZZmeG7NcwdPRbjs5vXRIspRU+Kc0aK3UvHDw/Ctai/c91Lz4pQYQQV8JLs4PSJ50PUIQInjkm4w+L4EcBoXrqxaOHvR/r0Zm1fLtmmnqDeFehPGpaCYeqRV3EmEMahDDflwdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ifeKWhxdUMNJ7tVTPgFOJDF8iLK1HRVPghfVEdVR10=;
 b=aZVG9dLTz7RcpP2GBJcXFy/al4XzpwXlJhheAyM7Er0Cl4Iqd6aJMAihOqmWoBTP+1k+/OdRV3LVIYulfbzV5owKUWiCIJUkDvJKPkNA03RB5WnNN+a+XkWUY9USkRTSQE6QebgvnTv5VzwmGRg3IB7F4XSid3oiAjPdpts0jGOdqkTahCvaXLXXmQApK13x7D2ugNJ6f6/tpe1+WEAyGg9bNlRBY46l25CvoRNrAS7an5Xcy68T+DvMN1D0cNc7ti4PL/cUopgld8ZWrAwaQ8rPts53/BT8+zFPSEd/JwZp0ecSE71X998Dj4DSH06llAh+aveU/AqzYjB0QU+MQg==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6778.eurprd04.prod.outlook.com (2603:10a6:10:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:53:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 21:53:33 +0000
Date: Wed, 3 Jun 2026 17:53:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 C-PHY init
Message-ID: <aiCiVe_LRA4DXTCL@lizhi-Precision-Tower-5810>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-5-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-qcom-cphy-v6-5-e50de0b557a8@ixit.cz>
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: c0df1633-066f-4bf4-9a8b-08dec1ba8e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014|11063799006|4143699003|56012099006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9uusKsm4bYCKwZEfpbas8eYTzgkvtahGS02KryiuaAMLzP02uLchqY596vXgGU/hkOaPAPHtWeaQJDbu3a8oiukGjSN5oHSfhbU3fSQpcXWk9ezOoNpDf5GJ9kpzNk/ciQHOnk918GbhLIVaQqdWyksR8DrVU0VMYvrQcla3f0RKIV19/vretszCYBgqBGpL38d9ui842Ldo45XX0Q0GnKjhzRoGSs7y6hIey61wwimTYK3DkBn2jMrf0MnC9YLHxaX6+WinynXY+W3ub7pcT8Teme0i8KooD4wDMklAVqqJdnEdibNgxqtAu7XncGNx/FgD7/0406d3RqP/oi1+omg3NaXTgs2LgIeYe5Cqwdk95lmy/I6SjofFuNagzQ6gWzImWQl9uVhhAIKPMaWg6+YuR4ufxIPkEAP0c8Hm9o1Xrabc/tvhRqK+7wAk7pCSzBBZ3pzuMla9mXds+4TqslBluznq7JrmwYhEyRzR4ZQlyPhyeEHH8ZLHkmN0NgwOcUT0qQCbtiqs/MJR51d6x2l/jNGBULEBkj9P+cCAGz96rtHlL+79Z60S13awMQk+iGeCjlkOexIIQmasZA8DLbWM1h6WMeErsYLrf8ZHTyoOIVMAtgT+vSE1skoQGBt9qX12Q5Zw+qkgRI4/VRAE6kx3W5CpClqDTu6fytlgC3kgla13AHD3AhniRKMfjguWFjPK0vxFgReIV087+QXuTPMsPUGU/TRjn0CvBPh/3fe1/rSnNhr/BDKZrinvbp0e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014)(11063799006)(4143699003)(56012099006)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IdDlr2K4pjVrCLsDG2Da2ozP3hwXlqVyGEdiGW6C8lkleQHeaZ8HeEgoNr5D?=
 =?us-ascii?Q?Zbftuwaj0x79+iasweYWRwOOF49pmSFI6K/n6OeDQv0erT81suToZC3lGvEM?=
 =?us-ascii?Q?n5Zz/KUSdtuhEb/lOyRHZ9YZQtdEvsnQT5C+h2fTn8/awFH2dNOQNfCFT20c?=
 =?us-ascii?Q?Xk3U0rHxKEAJK9BOyYNgVwiwTDBcme568j4Tzsad0VtdM0RrTIn6Blq2J5Pk?=
 =?us-ascii?Q?w5CgyCzrnCRea5a9jKmBvxCK0whwMh5qqELYtqi4A/xqNA8OSNc4qjOt9Mve?=
 =?us-ascii?Q?RfwUqCmhuoWhqmDcMUtvhgQhrz0rl6oMXtnPgWESEUcUbHbxdtc+WFlak/yi?=
 =?us-ascii?Q?3TjT2W3ZFI/aZ0/F6k2SLTAuwHYNIvRs2DWUKJQGD+6b+8NwYoyyiJBzRNmw?=
 =?us-ascii?Q?T5/f94YcrU3a/lSw9AbjIg4E1np1d3DSPKEIG44bxqs7+RZsrKqMiSH9BbGg?=
 =?us-ascii?Q?BlGpRh9kdkJQDQofL2uRvjXQQMVk7Y6Eu+bbFmu8mW2DlOo5BW3tf+TluyB9?=
 =?us-ascii?Q?A6SR6TZkG0TKyKfrsatci/20+l7XaGcFm/GHJ0jEAInJ4B5EoSryeU4eem1u?=
 =?us-ascii?Q?tCdBU6iOdkbYVry5UpmtOGwUQJcG+vnTVXXvCTmEyZthISiU7HBcsGXH27ZB?=
 =?us-ascii?Q?sp8fNcKZ5xZWSktSHgg0mNaq+1lO+Lh3XzxP6ql6P1ZWGo98XWLpaKtZZWmt?=
 =?us-ascii?Q?6tZeB/JBLuxTWT2pby81KBhKoR90DLdf6cPnjsNKbo6SYjMNVanWqZPUCHUZ?=
 =?us-ascii?Q?XpOYG7tLqkwLu/L9eOnUa2o84bilIUW+KI8F8X0zvv+3FrAJmp8Ny3L4jNyE?=
 =?us-ascii?Q?ninW3ncFt3OPp8TBdk7sur9IL6A7Ln52S3tuVpVCGz5hh/TqBK3UiegoUemP?=
 =?us-ascii?Q?ldCvxLH/eA5CfO4Zd9EQv9GGPQ3tH/8GcVIJ3jNVwQ05y8Rpjv6MAsGvy2as?=
 =?us-ascii?Q?fT045K8LiHDXxwy0pLSWcuGMzHt6ov7W7TbyyEbOWeVWmLBeRl6jwPs6/ozF?=
 =?us-ascii?Q?7IMGeMjPE2CpJZhzrwp8WEl+gRuKEhPfpXE48UKs8DWORRcdyfw42BaySsKk?=
 =?us-ascii?Q?sGuBHFk7ufkyzlEVp7xJvRFlnR0oJltl16lghas+0vdso17Q5ec6+hXbJUgr?=
 =?us-ascii?Q?ssZT4/EWujY992FxiFd8B9HVOJ5MgJKowjsBF7NwU1EBXbiWZ/65eB+QCSID?=
 =?us-ascii?Q?wJ3UWrOjdnbXJup6MvSI13+rCY9jv7wZ163zLlJ53qlWGkTWRrsXLb1ICobO?=
 =?us-ascii?Q?+zgAewH4oI/CP+N879sSb2r4fB0uOvb4ZXaJdPv/ls5sp4624bCNneUZHgAE?=
 =?us-ascii?Q?bXTYYld1JNLrdYT0cCzQmNW2O37EQ3ViDjaA+p38FRRabn8KfogsDWiiTcb3?=
 =?us-ascii?Q?LcplphWMXbuUX795q1vtsIQ2hKsZQ/CKrBd3xbmosbzoCI+iN7iijUYNUdgJ?=
 =?us-ascii?Q?2NoA5vxNIYMGmYs7XiDaUXXY3nyQuDKsKdfgxdV88SNQbH1E59TW2cVj67R+?=
 =?us-ascii?Q?n0vgd31HyV3jeIyDZDv1jqUx/to9p7OJX3kqK+1rUYXzp79w7Wc23LDJMHYS?=
 =?us-ascii?Q?A9WndGYKL8U5NnvM5h7c8Ypvgez75t5H/vZd+rG3/YEhE3/D2Qi4Mk4IQ1PQ?=
 =?us-ascii?Q?kU62oPy+hEhl+/51LwPQiHUFuTIuM4+6skGkVcj4OtYGYzIWwfu5C+u4Ueka?=
 =?us-ascii?Q?KKdcdybCy+U7cHDON3Q6Jn3RyGQhNEs03FRkkJ5Ai9mjRszK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0df1633-066f-4bf4-9a8b-08dec1ba8e59
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:53:33.0708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcMbAHEpRhaOBVXHsTqQ9GvkEFAPxE5+w9KzAu7a5r+JZBSdem5yvWHpcYN+o7/KJHBI8jCOZMRj+9A1utb8Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6778
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-63685-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:from_mime,nxp.com:dkim,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lizhi-Precision-Tower-5810:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D119863B797

On Wed, Jun 03, 2026 at 01:30:43AM +0200, David Heidelberg wrote:
> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
> Gen 2 version 1.1 CSI-2 PHY.
>
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 78 +++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 938c365eb352f..13d7372bd225d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -45,16 +45,23 @@
>
>  #define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
>  #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
>  #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
>  #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
>  #define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
>  	((offset) + (common_status_offset) + 0x4 * (n))
...
> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(9),  0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},

what's these magic number in ADDR(x), if it is register, it'd better to use
macro.

Frank
...
> 2.53.0
>

