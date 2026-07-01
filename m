Return-Path: <linux-media+bounces-66233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jQTuBIc4RWox8woAu9opvQ
	(envelope-from <linux-media+bounces-66233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 17:55:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78C6EF685
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 17:55:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=EwSO3NB0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66233-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66233-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 278B130E7C5D
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 15:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F5D3DEAC1;
	Wed,  1 Jul 2026 15:51:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B0F362138;
	Wed,  1 Jul 2026 15:51:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921110; cv=fail; b=IjtPST3/YE6+/DFEozaGGgAi9KuufJc5p0TtDonPeOQfWjQca1bbakqKHDBL/NvI0sBp0XlzNuF2cCgc88jZoe0UQU+yt56gkr6p3mphwxtjOh++s9l7ln9niU+ZwInPxTJ6HVWvabIkjSw/kG2FtBQC9gZG9Ow4MggyTuWKsgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921110; c=relaxed/simple;
	bh=NlGxO7q5i2eZz4iAu5PoPkJ6/jQsivlyKdc6aECMqRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nETopu8C7e8raZNZjGCe0WbmppQE2J6lcdp6nlPoFNRwrCQ8wwgJ6xdkA7k95V28Fxdqpv+zeenkQDdJnjEBBxzlkGUa+U+BleDIaV1f6QTFTTvgpO1PLcdbrbbRwDMCJljc24mJPNdRbYOSn39iFYyeocHiYaHvKFyUu3zspSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EwSO3NB0; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuBFudgjqOldQHVSp7Uy9FPN1k8u8VRFgDapaoeNj24kIYo3t9AgBASqpVPFp0yhCYXZlmVaYgVjS3e+5g6nPIAnzHXo8jZq097BrUVh4cppWF1fltgXVcHFpuKaThx6Xda8sbSjoOGcZhDVMTdw/GmLMZKMS2xeW9jh6ap0c6721XA/Hdqb4O+tU5dQDUxUvOhcQ5xxZFAz3UbCGKs8n3H7OpqOR9sBnMXiCPGjpHUr6b4eR9XNSEqQ5HVVJQjHRwNB5H//bZUqvRjI2PmigqXrAyKWFA56BoHSslJezTHlJMFwN2FB4HphZ0pc2IZUiC6ByFoAe5SOXyK+ieup9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jQkzC3Pax2XnP8jDyWgwRc464T0i+jeNfpMfd1jHV0=;
 b=hjQvZ9rfTt2Fou3UG4e+xSolqdfDM3B4Jyk5Uwf8avMBqFIUsJ1QeR/LxPfOilZSMMwFvMKSMi7ZAZmwoSbX6fu4HwZK4oKZ8njJOYrI0huYALwCz0yE7EuP0EhVZw/tiwEgmcT5m9s6q8kgl3efRTDwuZbrbE/E2C1/eNHGRH9BfrVjMS4OuQbMMxg/PEOEFYXKuziZlh24PQUaIplf3QY/lITHTPcd2bvSWIEJmsb4krPjqZ6L11aDRCNjEMon8jlVMU6RoF84gR6M6ffPi0pI4aVHKmdVhmfdgxj+KfN1KkY1c+AWBBtqWk1u0qylcp0q6Q74WxdVpGS0Bo9rMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jQkzC3Pax2XnP8jDyWgwRc464T0i+jeNfpMfd1jHV0=;
 b=EwSO3NB09HFl2SIqCk6dehN0ndy7KWqrAfCG56UstdFLoR8YZ+WR1J1jNZqB68qad9LQVuJCG9dOqCyf0ZgSD19cTnEzNslyQdEpE2NlEfoXsiCCc/IK8MvyNe+xDKz8SfE+r0dLqeH9iRcyiMV+jfm51tW8DJR/CKsFev5RndN6BLAsqFi38S2pCRebs0v90ocWAv85H8tcI7oXcDrkimxmUh4BDc5dKs8/PrzdgqQddxLdNdH4z4IcVyuUbQGHd0R3vKzd/Ye2XGjRE6J50Lj1snPOTbO69/+s9oEN8WWV/pX+m5kcyOp8dptJFYGFD8/fRUHaNO98BZur9aRYEg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12685.eurprd04.prod.outlook.com (2603:10a6:800:343::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 15:51:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 15:51:45 +0000
Date: Wed, 1 Jul 2026 10:51:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] media: nxp: imx8-isi: Add virtual
 channel and frame descriptor support
Message-ID: <akU3hNb_9IkwGLK2@SMW015318>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <178276214766.2429861.1950641421457268519.b4-ty@b4>
 <20260629202302.GK3054459@killaraus.ideasonboard.com>
 <geVpV765Vs_salSTWKnZ7gqdOqDTm2841DWzfwZnbn-oLEj-gSZ_-QddZyDalTzdWU-2_TGVwXOjYkXy1rwoLw==@protonmail.internalid>
 <akPsxPgLNgu3YsEV@SMW015318>
 <24be88f8-156a-432f-8d2a-4b0417e042c7@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24be88f8-156a-432f-8d2a-4b0417e042c7@kernel.org>
X-ClientProxiedBy: SA0PR11CA0179.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12685:EE_
X-MS-Office365-Filtering-Correlation-Id: 792758c9-8316-4d21-8865-08ded788a6ad
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|7416014|1800799024|6133799003|11063799006|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
 EBQugXCzpCqxTJtHpgeMwYLSoyYiAddWQGq5sLllXkUahGJRevaeSu2CYtxcyYSzy6g6U98W1OxjdLnmcwJBu4skMmNWcSC5OHFfTJjmKggy2f5wICxPMXGEFzYp+XgBMceSN/Mo9gr2druJmzM7JbzFOhNThHY4ErUJUula7SldsB7Ksgni6VIb0Jr44haUUmbG0rfbT+48XuEbBcfO8sjeukLxG5QKI7nvzQAKYE0I9Xd/NE66pmVZcb1fJDHoB/KC/En7nG3IItzQQytQC/PCJkBompyBiEdHTDD+zH4Jua9kSBOuiPpjBRmJovGddNBnEJOyEgPjfzeQrh6zb7S/sUrpH5k9rkJUqr3M9tmaMQ0ujckEM1X5/dwAq7IbFAMkumDdK5RNBLZVM4EUTMoLAX15ujiFqMTOLPHh8jPSqe02HTaDxb9xuXEacSHxeFXY3sMXYQvia+nwmGFq2kXgthNupv0aqRlTlcPSunrnSwPnPgfkor151gBXSZ7h8BAsGFLmXYy1Bbrp2YnZwM8so/7AaTimdNO5Bj+Q4wJdpjkemFA0C7b/oqKDb6lcgwpjjxkgvnnZuagFEr8qhDSo41cCEEJj3pGQFiHbNZ+SnDUMuGmcF2W4cwGtxotH9te3QnpJoIw8NLLki8LC9LELT11YteK0uOgmKtgBsVI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(7416014)(1800799024)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zSP4OxdUIgOFjLHb92CzMP6QhMgAk8fWipuaswcC+Vmoz61vjSCwrV+rnSm5?=
 =?us-ascii?Q?hdQxnQgJ9x6GcTnyF2an35cTu24D4ptPsuL5pw8F/H3AfE0HElJadpAZD0V5?=
 =?us-ascii?Q?fsT+ZDsBoF1MgTxMtUf2+ghQEwCnMU4AMMzXcm+q4UZWmZ1O/n1uwr1a7oB7?=
 =?us-ascii?Q?NJYE2R3SpvHIPHLU2BrU3XAgUXF+mtPw1yT3/CDHy9rpKB0qIJ7Xz1u7AAQv?=
 =?us-ascii?Q?x4/TrOfsKsxr3jvfJH94zPCyubrNiVLtBWbhhoTaz3T0ldSvg+qklBwV62qH?=
 =?us-ascii?Q?0YxirLjXaLZcvnzi5fxxrnfNRTqK41N0K0PGPPFk26dZ8DNtT3aFm/DpDegp?=
 =?us-ascii?Q?yEwcuNCnAIMtOnBKMWGVbKc4sj8uIxBYTWlJxULzMGQ8i1pnEmzrh9xrsxj1?=
 =?us-ascii?Q?k2QEJq7JKmzB8XhELsO3BwaBDTM+MlIN05k0acf72Me9MEWcnl87Gwa9tA2P?=
 =?us-ascii?Q?KtZ3gxokB1QJmqDj8UZxX0rOXB85ct5MdIA6S9VQGJGy1upm+lGmZ3H7EE03?=
 =?us-ascii?Q?Nn12jMSpdM0fSN78/6lr1bzw8h6JTsoe99bSPlPP5DNTh6Qd3DXblYCqyXHY?=
 =?us-ascii?Q?b7gIimgVWwGsbnd/CixuDuAwQTnnbR4lh41RSR6/Xd/X/j+zuXlJ38yZHJ3o?=
 =?us-ascii?Q?5ekmbHIRAjtzHlI4aQ8eJZUIgDRJyGTLbANOoJvee3KoCjjar0pDSO8eURm7?=
 =?us-ascii?Q?zsfsW72kxlaU8DKKQu3rFg9ktEhD/pWlHRmHYt4I7G+2ACw52B6gjO3+EI+r?=
 =?us-ascii?Q?lLXZoOBd2zJlMin+rhkRv4483IeagkSkcAglY8Na3oL0wA9C5r9IKNqabt0P?=
 =?us-ascii?Q?Jkx08aerY4B2ko7J9H0QLOwI4nonp+aq9z79nvVcFZjG7jenJcFw3cxM9VTN?=
 =?us-ascii?Q?RA62pNAId/ucENrCPhGnbQFR7GFdRU/BtB+QKbcMndmxu6reWflSJzSBd6MJ?=
 =?us-ascii?Q?OFicdtUK51KJWt1yLFKftbsXotoNfdr4guEjuaH51GXKbh4HUrmyzTGOdrWg?=
 =?us-ascii?Q?f2AFqBVEm/kZ5SkhgzIUi6cp8F/MjQZ0/LTOnlbm6E/XjhaA6cTJiXD89J2L?=
 =?us-ascii?Q?u1Dk44ZEIxSU6FDDhrkRGmxJMaKmuH24LpxwQFd3BYuTu0NxnZgPNel2JuFH?=
 =?us-ascii?Q?F6/vwRkt83QunQReRXRPOOQpPLrLv1NHcR0FPb+T4sUdAzV0yG18nOgRn4nn?=
 =?us-ascii?Q?eQd9zUrPCcQyNaI71n3EgCwJMqJ42bh/amWW4ptN53ve4eWFpxJ0aQSNecrE?=
 =?us-ascii?Q?/4ysk395fYhCNf35uniH6pobIrdplahe4N6gW3Zn4qkkPbTwtKlzYuvdSeBA?=
 =?us-ascii?Q?KnMkYgUDYAik8G/UkTXPPzudTlgwOXlMSBdu8da0OfEK3Vh9+5XgWcic2TU6?=
 =?us-ascii?Q?/IVs0eQso+56sYqCHoKP5xxlgeW7klslidFd/q/ymt1+zFUjY4HbnIdPvhgh?=
 =?us-ascii?Q?jxg0mwaL8Mr7yjfmyUjeL2GfsRR7OkAIWQTS1j9zpZHzSBu6TmDJaaUi5ZHq?=
 =?us-ascii?Q?4ScQ/8iNIju+ZwxqlvXeVIYlC/Vo7U3ZoUFsCzwysRkuo/Sv3f+2pZ6qKpkc?=
 =?us-ascii?Q?PtG5rcjQz4aG91lsbc87FccrzoP0c9n6USN9IQ/W4y9l5PkjmcSxRZy1Zarl?=
 =?us-ascii?Q?6KCgzKh+apjHYYorvfwhSafVVMMb59flt+zTvojb22onphpB/crDnjSZJSd9?=
 =?us-ascii?Q?5lDAzpjHAVJoC14HqFBuHU3SHGlDyBVuj0PTxk5D1+1iHp3tMpRwGjSevN0g?=
 =?us-ascii?Q?Qu1GM/8ewY8i+qnkfIndDhtwiazGlba/lCwchvLcfJSpgqZUBX3q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792758c9-8316-4d21-8865-08ded788a6ad
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:51:44.9189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bs2lpmuchiabCpQhFxIL6312Sd6T808PJDUQElQs5wrtbK9zigW3tCRLb/Ahu0PFxNHObf/s+79uuxStEP9lJpbnKlnW5trSa9HJspljxaiSYABRSIHNILfuP8cHnwik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12685
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:guoniu.zhou@oss.nxp.com,m:Frank.Li@nxp.com,m:aisheng.dong@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@nxp.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66233-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,oss.nxp.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,i.mx:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C78C6EF685

On Tue, Jun 30, 2026 at 11:20:53PM +0100, Bryan O'Donoghue wrote:
> On 30/06/2026 17:20, Frank Li wrote:
> > On Mon, Jun 29, 2026 at 11:23:02PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 29, 2026 at 03:42:31PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > From: Frank Li <Frank.Li@nxp.com>
> > > >
> > > >
> > > > On Thu, 21 May 2026 17:10:03 +0800, Guoniu Zhou wrote:
> > > > > This patch series enhances the i.MX ISI driver's with virtual channel
> > > > > support and adds frame descriptor capabilities to the crossbar subdevice.
> > > >
> > > > Applied, thanks!
> > > >
> > > > [1/2] media: imx8-isi: crossbar: Add get_frame_desc operation
> > > >        commit: 3e15a3510908c990ee352aa206d5f9c23d4b216e
> > >
> > > Is this a mistake ? Patch 1/2 has no R-b tag, and you're not listed as
> > > maintainer for this driver.
> >
> > Sorry, I missed checking Maintainer files, in media summit, agree on I pick
> > imx's media drivers, but forget finalize the file\dir list. Can you help
> > summery which files\dir I should take care?
> >
> > If you have concern about this patch, I can drop it.
> >
> > Frank
> You should set yourself up here:
> https://patchwork.linuxtv.org/project/linux-media/list/

I just register it.

"Registration successful!

A confirmation email has been sent to frank.li@kernel.org. You'll need to visit the link provided in that email to confirm your registration."

I have not recieved such confirm email. Anything wrong?

Frank


>
> That way you can coordinate with other maintainers on which files get
> reviewed by whom, see what the RB and ci status is.
>
> Its pretty essential.
>
> ---
> bod

