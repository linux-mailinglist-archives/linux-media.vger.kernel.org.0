Return-Path: <linux-media+bounces-65765-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vnrwHjCtPmpeKAkAu9opvQ
	(envelope-from <linux-media+bounces-65765-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:47:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3D6CF3A3
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:47:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=qst8xzfQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65765-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65765-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 403CC30087D9
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A3A3FB046;
	Fri, 26 Jun 2026 16:47:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5620A39B486;
	Fri, 26 Jun 2026 16:47:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492454; cv=fail; b=QSe7LQc7YoroF9mJyG0sdWFFRKgNgBjD/y8uSP+VwvCb/AoMP4bvp6/LvVA4oeZYXINvBdPvHgfuJDZB+1+Dbl7B8n11Mls9tOachwS1L4ot1vohiIvqzmGPCOmpOGNg7oh2fafKK5sADh8nHQA3kMSx2RmwmJdQTt417sBj+B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492454; c=relaxed/simple;
	bh=pYEg9HuKTaCOgBxY2L22rc1HX7BqconslK2lInROlhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Flp25KmLKa4gWHHnYNCx5xtbX2SsYlyUEB7rPz19/ls7aS97hMnPBEedc77l2OCgiLnoe4M0QF/FIpd+G2wiiV8+gDGJcPqdtBVq8cb9e+3tfBl5UKS9BRhqsw9md/ObSwHfASd81Be9inmW6viiy16VZSDmenIETXObUZjnGUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qst8xzfQ; arc=fail smtp.client-ip=40.107.130.56
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bztLHWZgeUj5Ga08edLrDe30k9wXmMBkqYhO2OqPQGuqP0A0wRHwQDbUuSzY86DQTFTmA3d/fo690vQ2CUnb3HFvZxtyV1MannVLXKcjV+h0FOKQV4EhBv4WVl5opWrWLGMz1v4JJeNDw/HRwA8luLv3oKyNbUBFXbW3G6B29l/hd1JYH/tL7HXG2jA7bWPGXjQZMKSKpQ70DmXThFfQhSJYfqNmAqAhOQSnLmw3BkSzIs0UreW4mVfT+nhED3IyasHwcENZNbhn01vZig4AfRPNrWtr0vtjOhLj+ARsZxBV9xwWwLH57RdTmghwpx3ELPr0HkbEeqGfS0vBiobPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkETcbZ8IzxcvZBIRynOzs9IyUtgXuu/C1mLS2H1VI0=;
 b=gLpON4ttNiDdud5o/ikuMNDKksAz+r5xZ79dWzya7MdOGrQJZW4NoC9w4jnEbubH07COPjQUCzeXxjjWfqufS1i1YNPqi50zUV06dQohgqBCoP5j+iJDfDL7riqjTAbnDEW6gkPGBaNbJhy3mCXZrDc4UlRqotXdn7CHG0dgCASHSvKh8bkmyoqcv9bccnl4el6CXn402zlsurH1nw/+MIcWwnNxIa7pVFkMO1k9kr+z15j1nWxzlW/c8yeVl8zd9Af2hEmHlfvD5Ofji/sInAu1iTLH7RI2b/lPa4JRq9DcWNBfQ2mXoXcCNr6640YneBobf8ViErYEJfdsanzMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkETcbZ8IzxcvZBIRynOzs9IyUtgXuu/C1mLS2H1VI0=;
 b=qst8xzfQ/S1YXEYFRoUlQJqfSdSHEsyiaomgVXEqlRJ0429OZLY/rGUondQqfjPRCyeplv5ftT1f8dfUR2ZgtJE5zzAQVMqKJeBDiwrLiLGsK7I7qyN21bgO2QFx5niLG21nA5OG5NOCAhXJFcSQw09lguKQwv3nOHi3tng4Xq2pCIAd4TIMfACCMbK4JnD45FgpupKfsPKmaU2JkeZUQ10wWmhcqz0irL8xuSeS+z5G1d7p6w6IXcwtTLCe0S9fISyw6sXENgPbYh0tNlm0W1epHMABe2gmEVWMNrIhiJbvWZRt5st1M4fYSxlVI9SnhwlxD5VJXoFtM6Gy9JiXIw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB12099.eurprd04.prod.outlook.com (2603:10a6:20b:747::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 16:47:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 26 Jun 2026
 16:47:29 +0000
Date: Fri, 26 Jun 2026 11:47:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: media: Add macros for video
 interface devices
Message-ID: <aj6tEW5xNW6UvXCm@SMW015318>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
X-ClientProxiedBy: PH7P220CA0094.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB12099:EE_
X-MS-Office365-Filtering-Correlation-Id: b67211c1-0a73-4022-fddf-08ded3a29bf9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|19092799006|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 qYZd9LZtRrOYd2Qg2lo/6mwWRCsOQRD1+LVRBcTqU/WvRqhbN9D+v44cVvZhliwaDWU8VQKnj/cgqSLlNMFr9kmTslQMirMz/xpY/jVoFRPVpFRuo048bHJzJGJHMC3X5iyRLvV/XMfh4L3w02tggnMroofMTYk7u1b22MEU6P3foEK946g88Rsn+ggquZkjKrypCeOUSFLbbt8OTuXo0CXZFa0F1nTd/oE9tSlVr58/HS1W6l4ZUiDNya3A42wbotatbm3RsdvSGKxJqqGlO7plDqa0vOaRC4RFH1G3Nq1xGcaL/o3Q1gsZmzvRYQdcxnSiy/liPAcffzaxTeUp5DWwWa6XmWzsFUhGDiXA746qao+oFUziMBq98fBimGpDdEzTVqC4PTRCGn5uWXEtehrAZKFAbWYmJf16lHchpU5AjIDjjs1KAgtz7ksC0hDoTk77t8xw1O5npSj8J1v4ig1JM+70DCAPG3kjuqjnZOQprdwDrsVV/tNG6z+S6PFhU8Gl25fwU92BElqN5Ulysc9kUcFS/mzuo9I10Hl74OujWZRDXB37TXswC4gmxn87wEQqPsM3leRry1NGqP+zuDrpKVLSarjlFJaFq+N+P1rrcAGV/Txim0WQpxRRVEmi5ropfN3zKbDXkO/GqZe7k59HCXzae6hiesITRXyVSdA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(19092799006)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?QyGlnEpu14K6Dhcq134EYknoH9s0r1yBQOyLoFrfsXiEpO2S78S/znKyztXD?=
 =?us-ascii?Q?TmaFqMDVfCoyzMREEtwQfNEpHCQ5wyI40N23KghheJmC1oQ+1XHmkLasfPUB?=
 =?us-ascii?Q?q7vIWsJuLuWkHIURGTpB3MHQOULmpUhKNkU1evpSu5wwqNDaySVcUPUXw18o?=
 =?us-ascii?Q?dgacmsWSPOU0LCWexUM7hnywYYYQ6og7qCZlQiKEwklCm1RmtQoeRfQNyH+k?=
 =?us-ascii?Q?bWU9XDps4lVwHnXffJDXNKZ71S589PqEr6Tu0MiEAYcWU4nHv6KPmjEIgn7V?=
 =?us-ascii?Q?p9ia0GPpPYXxsF2F5itia7PxWp6myi/St2NZLZxeN0Www/q9ub5/CAShNWWv?=
 =?us-ascii?Q?xfsUy6NORPF6NNkGm1vC/wSZcPr9sciQ4pPQ79OnTZamLhU5W0ylhZZgJ79M?=
 =?us-ascii?Q?h+duIudAwsiN/EYHzzhEHpzzYJJrXxYt/UUV5Lw4vFauKYZcv5c1ygutyX8L?=
 =?us-ascii?Q?OQlnsBLOo4BANc6DxRW8pmqrsbV9fx5nX76d8eeQkTG0Jli9Q7p0c+BkqZxb?=
 =?us-ascii?Q?+pXqNcb61ovPNwz+cpSLbgr4dT00xD5joezIDhSdFvfV2IRQ8gcD0G/tOXNK?=
 =?us-ascii?Q?tXEYQVuhkBOaF2kRscnTkWY/Mx1x8DERgFA+rxTf57S+BifdEMv1HFBNRxcG?=
 =?us-ascii?Q?605R9K7N9IH3HRmy3RaIKVDVyuzJNcvtqVmNPVVoGB3PRywb4bTtBBKrRVXi?=
 =?us-ascii?Q?gLoH7KGRJZjA+JA+WPjhkYh5cVVndaBRwrklDPVmAKxxo127M85brCOcV0K/?=
 =?us-ascii?Q?jTLIopEz+XPtf3AXwO/74cmScsHV0NzOpQ02unAnrLsiEesWQO3Mb+dgUIHv?=
 =?us-ascii?Q?KiGA1wzaWX70LHjGqWVj4i++uJNeE3LEfoAXOv/GMBmagMqe8z8/6bZ8cE43?=
 =?us-ascii?Q?PIKJuwcaBaDKky4cnH+ZkV4P3QPSL4A/U4DVQVjZ7YlQ9Pv9tU/usc2rJyzE?=
 =?us-ascii?Q?CaHB0lPA/5hNQk0kxxq+lBrZUBvNqvGifnxGuCyzWnRbOQiofeJTBf6OuYhl?=
 =?us-ascii?Q?0Muq+FkPRVOYK8xg053t0DEg5d5QFgkVwDzT1j+1lCzU2oy+jmUKwlAMBF0Z?=
 =?us-ascii?Q?NzmnhI+qfw/bzUpObtbutDJ4eJqS/gtShNwhP39YlCfy2x3DdcQlNdrkBten?=
 =?us-ascii?Q?DY3pwKLPSh5WcSPlRR6s2viAXChCcYuyp2rPiNcuCRzHdVW1Z1s3RI2uDwoO?=
 =?us-ascii?Q?tpTQHKpZ0VZyXUR/Jj/Xw+vRgVdA8pZCgZllJ5iHvpszMrF65fII4N6uVwm4?=
 =?us-ascii?Q?qA8+Dfy5qnevcEBXXegk2V0bfqSyjt+KKPDTiXgeLxNFha+t7DppYHP6jPB3?=
 =?us-ascii?Q?dfO8CTGrpvIjRA88dc7gp6FVX1U44m64v80UgtfQUlyTo44MCyJYd6nfurSj?=
 =?us-ascii?Q?NKspfuszjla1HzkPYSaWAOp0pZogejz+OnUHGfIanJnMy/bhy83DH7fpnVQv?=
 =?us-ascii?Q?9k1V1wx6SgHRwlHLynGdaA9+OBCoHp1QQIpo3rwR3oJ0YokhvORnLoVK3+nO?=
 =?us-ascii?Q?ojvkZ86zfX6xbK3t5zkzN+J9wuxzvD5KlDbjO41rpJeNz40QnTmtdMyAmjB/?=
 =?us-ascii?Q?XZuvebTYnba47c9sKLc9P93fxet1LPKJbnSYtEaj6+rB1nIidrcQB8oN58G7?=
 =?us-ascii?Q?SdQOPPWQm3y9HV016WS3SKR/qlhRpIm5Vz5RO+9ZsCNiM8JISW8ZS6Satiip?=
 =?us-ascii?Q?yB6dcDfFYlkc1u/Z1M61Mrj1gnvR0BvsyTpfSCx1TtAgmF3OszIrxKRt4oRu?=
 =?us-ascii?Q?4T5suwiVbUDiYpbLUhuWld7AxhpKmw/1AKcJtzZmLyN8J8YL+o4D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67211c1-0a73-4022-fddf-08ded3a29bf9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:47:29.1386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEfvsE3C6+b/zDgdbNnd+lzlkYRSpI8E4mJQBpfhqqrzgmZFD6V4R46CHLH70gweKoYyn2A1rzmZ00gCK8VR5vyQxjnIsietVZc4TmJcgbpZyiaPvw8glfn28UEq+HdY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12099
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
	TAGGED_FROM(0.00)[bounces-65765-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org
 ,m:linux@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,ideasonboard.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de,vger.kernel.org,ew.tq-group.com,lists.linux.dev,lists.infradead.org,microchip.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,intel.com:email,nxp.com:email,NXP1.onmicrosoft.com:dkim,microchip.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CE3D6CF3A3

On Fri, Jun 26, 2026 at 01:07:53PM +0100, Kieran Bingham wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> defines macros corresponding to the orientation enumeration types from
> media/video-interface-devices.yaml.
>
> This allows avoiding hardcoded constants in device tree sources.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
> new file mode 100644
> index 000000000000..d2340b457292
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interface-devices.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +
> +#define MEDIA_ORIENTATION_FRONT		0
> +#define MEDIA_ORIENTATION_BACK		1
> +#define MEDIA_ORIENTATION_EXTERNAL	2
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
>
> --
> 2.52.0
>
>

