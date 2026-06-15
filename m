Return-Path: <linux-media+bounces-64910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gji/Mk4CMGraLgUAu9opvQ
	(envelope-from <linux-media+bounces-64910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:46:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B91686DA2
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:46:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=qEMduvhb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64910-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64910-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9537A300B589
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 13:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2482130D3FC;
	Mon, 15 Jun 2026 13:46:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4499E30BF67;
	Mon, 15 Jun 2026 13:46:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531207; cv=fail; b=KtywxUDQD1TT4Bn/AQpDYw1FE9cqyM0QR/BNxegMOu/UbLYJU1NG8Y1/QQfCpROzBRbCtI7rbasEWZmij/LeI7PdZ/iod8d7vlk+9wiM0b3zmnUfxGhlfymY2NlcGpz73hY+ML4SLAlnzFLdAK3HfuTOGM+w02JH+++9Tj2APHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531207; c=relaxed/simple;
	bh=KKPGnY6fVIeOGrbVRfldu9tpzyQqYTulsfy6myIWBIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sDcaymZMjsnHo6lKaCAT44Nv96wqH81zBDgHXOdMHBRKSrEQ9my5FII6S73YnoPN2z8bqt2EsILM+3YGOcOHzukMHyAlGrWC28Z2BnIeTQJ37tQsYDWEPWlqgpOuB6xpFYUDEll3XI7hvKgitYebIjD+7uaXyqF/8PCBP6YSY+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qEMduvhb; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V938/1nrMOsfnVtY/W1y26jdzGQi68Oe/TvxDGELcSN1VZEhwKxFquHE500jL9qZVBPX9B92g4Nun/5e4YkQ3HaNAA+OIxXmpO4hjyfViwYYr2954J+aM7/U/ue1U8qkSQJvvl8wVOv5tdCXwNVYRius6V83p/c1K+WF9Ux6c0Pj0j1OZLoKsrvcxPevHELSYut7tEf8aP/LG6dDR9p9G7UHXheOuiHaTBYWRs5ZWK6ANnqdoxwm2RgJYsp1sVPXyp27pA0xw7Fz//R19LdycHINi3p2HgzZZ/vfAyZKy2qo9tbEfXE5HT4uAUrf/M4rcokx+yACTp2XTiy/syol4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HD7eDGXguSf0B7OgsnxA6mLCpNOZS5hfSBPzIYTa8To=;
 b=dPVbzy6O2EmpG5U6RxxacPgFLB85BADW9s/3QcZ7pxZ+7Xnwn5qTCdOUEY1YYGw1MsQNY98QtDPc7zvOKN5FJ/FUuk18+cUS4ObCXkxh2o7R5BbtjDoD4z8Wqvv2omnFqpXMYwSUXtOlrLoDzqX89TRYfcglnDwsG/uBz2BtqO63hevukimznBF4raoIxhz5Mk1/2uXZam8fNEI5FWJZbFYpcpVZppxnNGApZb83XuhahKMFrU5XRH7t/+bl5LKJcDZewIDr8oN3uUy2m4ok5fFTp2s9r/MGgiRdz7Dj4I8LiKMqkd4I6eJ6+JfxDhbD0qZWdE5jnyjChC+gWECHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HD7eDGXguSf0B7OgsnxA6mLCpNOZS5hfSBPzIYTa8To=;
 b=qEMduvhb/x5TddPSWg9ZCZZFbE8xJ8dFTGLF6wJEp0MOqTWE0KqlRos8vVrBU268bS5+3yjzO6bjDp8ng64LTTGN7CXUBqo13bOws+30fCCJRKvYD/qd1UwAgO7hUlxX614PIHmlytmcFJ7Id4zVQ5YNmXiBwLorYqUR7iGNh8Enu0IQEUASKL312uluHedCE5iZYyVTRZoVqVVCYqW7n1OFVcrpilxJwLFLe0NnUPLw/tFiYO3itTCRNMP8frbaktRy7qEUoFE+SKtp2GEGRgi5lWYAYbq39BCbX9wHWM3Bj7X1MaBcZShwg15x8tLdXv6Dw9/YjmZxGX5imOFISw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11928.eurprd04.prod.outlook.com (2603:10a6:10:628::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 13:46:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 13:46:42 +0000
Date: Mon, 15 Jun 2026 08:46:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Antoine Bouyer <antoine.bouyer@nxp.com>, julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
	frank.li@nxp.com, jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	michael.riesch@collabora.com, anthony.mcgivern@arm.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	ai.luthra@ideasonboard.com, paul.elder@ideasonboard.com,
	geert@linux-m68k.org, sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org
Subject: Re: [PATCH v3 8/8] arm64: dts: freescale: imx95: Add NXP neoisp
 device tree node
Message-ID: <ajACNM8ZXiYGgRwe@SMW015318>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-9-antoine.bouyer@nxp.com>
 <20260614090517.GA7434@francesco-nb>
 <761f284a-1660-41d5-9625-9b25bf18aca5@nxp.com>
 <20260615112549.GA137559@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615112549.GA137559@francesco-nb>
X-ClientProxiedBy: SA0PR11CA0185.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11928:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc26341-d3ad-462d-2157-08decae487f0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|7416014|376014|4143699003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
 CiRjodhu4skNVEf9m/+WJR9RZ0EO7r5jXtUBJs0khjolxy7JvYqYW9QKyx/uLh6Yfk14yCYoLdx+B9OIPlT9QbuH7QBK0/AfqYgoSeOxlzYOlxTpClygcW6WUsYjcYaG/yxkxbqYqjNAdzAVuRm03EKS0VXjLfzmkPQKWL31dJUeyK7R7uG9i3K6d3QCFG1Ucmba41BOMO7IFWiQfUJPrrdETFsNNXjHdfpu3YuwYEEL9FOZQvAnAf0KtyKPd92yoqXjVhCccGOUCNv2mv0bSvt2S6TANAJ0yqq2pdCJsHat8VPnsWyyaV3KogwLYcjrWaA0JAk1N3Thspousvf6g9BWZSqRgu0vd2e1rGNcYyoiadXnUYTQY5b6PzeQcr0QrM2tAwN1LsTkehBGRhfshGEa8rrcYkvxRuN8qflDs/uGBLXVKZJ0I+ZeCO+Jq3+0TlG6CMgYBPda6RtYoZsHnYGXQGigs7aw9ocmdqJOVMnp5mxqgmHt1ZwV3M43QgcgPM5z5/QL/cAUM5K3asjGcJWSB9JtAeCP2zoVy6amx9tasmIQV2j5FLCDcyDfmUneLlF8JTHjfVCse8X5ETwxdYgASqtvdavg1ew8x48LpefTJhHSuNwg3U4bB3sPvYjTmUZE4Ul71HeSRD+FbDMzEQhS46wsbQ3nft4AZdSfqdiLvJZowVhmaVMqhyNJvxpS
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(7416014)(376014)(4143699003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?IsZAsrYi44mBdqQgNVTnZvhh0gK3XWglaJobM5DG8DStMdrrURD1OmuC8n6f?=
 =?us-ascii?Q?SNr+/a5EWOLsEOWnoAVMuYTJoGsvo1F4Oyj2d0R0m8dmFut4PL0JvthLMB0o?=
 =?us-ascii?Q?P/YHLCkAPdeN0+pS6iSTINSeHMPTbWMRS/bZv4VMP1nEGq0SXTEt51+w/wpv?=
 =?us-ascii?Q?c24JSWaRFr+6LZ24mynVJMeA71ViH8fAAIi4Ptv+GdY1Lm+0oaGQh6J005uA?=
 =?us-ascii?Q?ri3jpoY2d0TV3hhgWrJYt0FD3Gdr0G4ncfu1bz26H3QVC+9SEMyr9uKKgnEp?=
 =?us-ascii?Q?uFD/INv5U8A31xxzjymU5T1d7tjZoXhBMg0yhQ13hJXY9S3ehGS/splmmlXs?=
 =?us-ascii?Q?M/1YqqNvTaoJzUcAQ09XV1MZm/4Gdn+KZFgSGjQLWOF7YEcVj8QZOJzpKefo?=
 =?us-ascii?Q?2Aiu1/0+AJZEWWrwyV7Bqg2KURj0DOo5scYqamvQ4Jyrd+BO3hPKUVy9Kars?=
 =?us-ascii?Q?6AAOPUjIFeletSgZAQ8LSbmALuIYGicuYJrnue8ms2SS9ma3EL2AGfdfzPJz?=
 =?us-ascii?Q?CfCZlBdZwQHqbJR+MIg/rl9gY7+lxxo3u1vTz1AmQ77vKXX6iCjlA9cHWOjF?=
 =?us-ascii?Q?YFgnBBvhe/7GNnUTXRp9lnsihdZ1cmxL6ousBmFvbqtOMVxmSo0C2U6XLxnk?=
 =?us-ascii?Q?3Am96geaBaNdkaDFnawq8WrssqkcjOyX5nA+ExuHwvxyotvSW3h9DOHfoFZa?=
 =?us-ascii?Q?Vzc13wLF3vCdRlgKVCIGmKfvABSx5R1JQf6ctPwZCneS2v+vu3sCZCSLCvVM?=
 =?us-ascii?Q?n8E61OGtiX18KGMVhtYSpyGG5VcqSkF7qwUszOlfWbtTAAwS5y7nXTfOuYtx?=
 =?us-ascii?Q?UO9zR+tyFF0n52XMaKzngzmHiUKUXS+uvqwUBtuwBoOLzpnA28AyP4r5itMe?=
 =?us-ascii?Q?oN25r3+xINe4sXN+p1FVTUKUMByRbYBJsA4LLN8CZaigWWsMRPXwLG99VVm2?=
 =?us-ascii?Q?88osASFRtshgkBVGkZ+2YJ2s2rFNjfjMGshtRuTqhD5bnkz6MVx6o9j1ee5L?=
 =?us-ascii?Q?G7GW2unlrtgQeAAnwVmnVQD2YpMJpJ7gITcYMPtPHDoTrtx0V+xTKRjIaIIR?=
 =?us-ascii?Q?fB55EfQp/80sEvs888WIOw9e093oYEkFsa5vM0Mb4lnmdbVvyZWNNhxK7Kzo?=
 =?us-ascii?Q?WrJRh4mCO6qGGCWpH/ZL7suF/iRuqnDxA8xWwS44spWPA6ZoRDaDddTeb+Jk?=
 =?us-ascii?Q?mnsc19/AzOtVRqYSab9fM021WMO8ZH7ll7lutQMKT9vx9aXPXOwcJjk2IVtl?=
 =?us-ascii?Q?LXpYcHS/IO+NmWHlLhF6sCuuGRq0z2n7K4P7pbOTEzusyXx0Au/2Aax6Kd2j?=
 =?us-ascii?Q?BWAr7/DcHoS9FjtlmoaqgHoXP1d65HGeFtXGT4kaXegfVegegXjl2aFecR2T?=
 =?us-ascii?Q?Hoypz5fkj4AYnYHhZfEiA3bdennVp3+qEgfHHhJnBOK66R4vINsdb09TRnyJ?=
 =?us-ascii?Q?xu9IWVPpW45ry+4V/c8mLRSe9oqtS//2ZE+/pJqlrWUVuALZeaVeFBQv9dVB?=
 =?us-ascii?Q?zRBMykY+tLyVYVo4yQPPziVy5Vwg3hKZ6n3s4R5cx2mP3hnlKGSQuoNbZlB7?=
 =?us-ascii?Q?3KeOpempxxaD+nAJifjOQ1Z2DteEQcmvxCYOUFvCpoCA2OgksHWhoKYoWgnn?=
 =?us-ascii?Q?1A1fb0Ckc7cHxpWcfBkiWw9T9gi3y1pZwOYNC5UZKNxauhEyCZ5Q55ASZ4OG?=
 =?us-ascii?Q?D3uaTCneH8DKdpG9b0VZzGHgLU3YRizSRMYnUdFCch9Nn8m/UYv12Djfd/jw?=
 =?us-ascii?Q?cNDa45X7loDyadGwAYH38WHK+bRCCeSUyAN7sb85kUIEpr1aSaUW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc26341-d3ad-462d-2157-08decae487f0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 13:46:41.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /n6eybCALFiMRBRgewxKMVfeP9iSe0Y8kXfsLNzSqbT+PqgWuKHOz85XIdwqmyFd7d5p4GnUweaak1Rfk65M2fsnohTcuLb96+HPaIGiUH4B9i2LuCsBlEn1FZYPYmkB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11928
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64910-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:francesco@dolcini.it,m:antoine.bouyer@nxp.com,m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,SMW015318:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0B91686DA2

On Mon, Jun 15, 2026 at 01:25:49PM +0200, Francesco Dolcini wrote:
> On Mon, Jun 15, 2026 at 11:56:15AM +0200, Antoine Bouyer wrote:
> > On 6/14/26 11:05 AM, Francesco Dolcini wrote:
> > > On Fri, Jun 12, 2026 at 03:20:39PM +0200, Antoine Bouyer wrote:
> > > > Add neoisp device tree node to imx95.dtsi and enable it by default in
> > > > 19x19 evk board.
> > > >
> > > > Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> > >
> > > ...
> > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > index d6c549c16047..5543a6cb1250 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > @@ -1867,6 +1867,17 @@ pmu@49252000 {
> > > >                        };
> > > >                };
> > > >
> > > > +             neoisp0: isp@4ae00000 {
> > > > +                     compatible = "nxp,imx95-neoisp";
> > > > +                     reg = <0x0 0x4ae00000 0x0 0x8000>,
> > > > +                           <0x0 0x4afe0000 0x0 0x10000>;
> > > > +                     interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                     clocks = <&scmi_clk IMX95_CLK_CAMCM0>;
> > > > +                     clock-names = "camcm0";
> > > > +                     power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
> > > > +                     status = "disabled";
> > > > +             };
> > >
> > > Why the node is disabled?  If the node is wholly described in
> > > imx95.dtsi, it should be enabled.
> >
> > Actually, all nodes are disabled in the SoC dtsi, and enabled on the board
> > dts file, even if fully described on the dtsi. So I used same approach for
> > neoisp.
>
> This is not correct. Please check what we do for the GPU/VPU[1] and NPU [2],
> for example. Is there a reason to do it differently for the ISP?

I agree on Francesco. It is supposed be enabled by default if you can use
run time pm to manage clock and power.

Frank

>
> Francesco
>
> [1] arch/arm64/boot/dts/freescale/imx8mm.dtsi
> [2] arch/arm64/boot/dts/freescale/imx93.dtsi
>

