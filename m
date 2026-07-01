Return-Path: <linux-media+bounces-66248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4umiIAw/RWpP9QoAu9opvQ
	(envelope-from <linux-media+bounces-66248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:23:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C86EFBEE
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:23:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="bvFd/Hf+";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66248-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66248-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E04630FF98F
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694DE356744;
	Wed,  1 Jul 2026 16:09:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9737D4963D2;
	Wed,  1 Jul 2026 16:09:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922181; cv=fail; b=F/SG0wVKbjnNyswY0Olm1NTULSqh6vIrQ1zrsGzGXeclnWtiHcr9FOoY418H5g7yL8AdzGztwXrE2uVUVKUx0xPQpAs+8U2l4rgigoHkYCHeo/Fbjnq4oNJNwMw2M3vsLe27T1Em6ufAxMbl/pXFCkQiIIYSG+6VB1kKFLTs0zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922181; c=relaxed/simple;
	bh=RX5EsBjkdzeGJWQ8GalW3HQXczqm4rRtgM06Plaggqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XsKGS7ghb30rrguCP0Xi4YCxJq5QESoamca1PiYPsE4GPjBzFS1lcc0IOyoKZMCB7rb2PonMBhsZq61AM1DgcKzJdahAgLPdVkMdkgCVqjTcD799Ll8e4xEtacbbwLpzb8tHWMy6J78TTzH54sZ6oSn2Dsx9UJWw/7836QGJSVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bvFd/Hf+; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/U9HozC+CZPZdHHegN6aaNrNFo7uFe5xMhPOqhS0DzoxxZEYwu9VO1zMhiC0Q+TRNY7Oml5UbVvYYivGNTz74zVzPkm6GDN8AB3RIjl6DTpJHYITpEubDSDPF/Dci9rUKixJgmz5Zdh69pikdQLdXaa5N4KkHyKToskwdXB0v5zdYMJZk4M8XnzsEDPTztMD1LNeBFiQaY0OKxp5gSJIOnacHQPlyjxZAtqGRRUJXNrf4gcjT4bsHcx6R9CkHyORXiynXe8kS0ka0PZmLyN25DjjISicLVy8zlLDNAUicHuH7lsNufaIS6V9YjIBSp8oxGHXnprEWZeESCn/cictA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFIDbbVfqXVTE1ZFrBd9o+vSA6cGlqSe0YuIv/Kzb5c=;
 b=BHW3VlYgUVOgH/Sll3wTxV+TTYLgNnCfPYkajk6S7g1/6KZFTTtyuOuFf174aceghkpRJMICiP72EvKlxWfTf1M4mZ0yPZfwP6aJRe3T0/UgAskP/l00+UFsx/RoTff/tVyoyKRO6SOxaGNzLXTApxKndvlB25iCzkQL1kUxDZzjsR6wsvpoC/BN8X/wIwX2cM5wa5Gs5iwnbcYWfNATviMXq3PXOa4GryfVhMKnZPLz0VYiu5g55Ur1tJhvP84P2pupGEXx5gjgj4fh5jklewlk1bor/tpAlN6Crz+8SNVilxC3QqR5SdsWlPFIF3+QONqPx/O/f75PVd1SSj1e7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFIDbbVfqXVTE1ZFrBd9o+vSA6cGlqSe0YuIv/Kzb5c=;
 b=bvFd/Hf+GKD7uOGYB6VFU5pnCM6RmG2DquT1KXYXZY2tkll+kx8Z64GcwCoJHvBWIjQm027O7ZAsQcSrNU5VaFuY1HwTA05D9ZSsF8BPl3OiGQuK/vgHNZWcZgE+8gEjjiAlYrg5HlifFtK8RZReZlO+aSTrvLp+wBjT9IMhBLFH4m9UO9ncY6xRtPDveVARDq2RZXxJ70tiV5DzP72px38mKVtm/BdgG1q03j7u7RQpD8qfABjynTuDRGsqJTdpv6qxpLKoYwakDM0xSccaa2sWQQZ3KO5hnWZHf6dtMNMHjb6JwLsXBZjwdy9v/BRPhz8osihW3KotQT0EwqOZ9g==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7656.eurprd04.prod.outlook.com (2603:10a6:20b:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:09:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 16:09:23 +0000
Date: Wed, 1 Jul 2026 11:09:11 -0500
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
Message-ID: <akU7pzJHFXT0ZNNE@SMW015318>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <178276214766.2429861.1950641421457268519.b4-ty@b4>
 <20260629202302.GK3054459@killaraus.ideasonboard.com>
 <geVpV765Vs_salSTWKnZ7gqdOqDTm2841DWzfwZnbn-oLEj-gSZ_-QddZyDalTzdWU-2_TGVwXOjYkXy1rwoLw==@protonmail.internalid>
 <akPsxPgLNgu3YsEV@SMW015318>
 <24be88f8-156a-432f-8d2a-4b0417e042c7@kernel.org>
 <akU3hNb_9IkwGLK2@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akU3hNb_9IkwGLK2@SMW015318>
X-ClientProxiedBy: PH8PR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: cb85721c-2f86-4463-55f8-08ded78b1db7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|23010399003|56012099006|4143699003|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 OZBFqzKhFFCsIzblJF59CaFkekhZbPDGUSdPYIvnXw/DfsL5neTfKXWEkH5xoiMR5/pKNR6+9cGCScGAtQIHbEhFsHibWzV2bQ2FLJojg8lO4rIp3obI+dBRPFXX8T2qLe6AFT0wK3HX/gCGoeCG1pGMbMm1LtiKYZTOiZcjyRHUhddWGmN4Jp7Rie9bZwFfN/GfWE5MCwSq64RIk9W2LZ9JWeTiVr/SgCbZb17lDuisW8fgv3AvdH2LdeOCwa1u1q5YCEJgWK797AhBrHmpAaDNBoAD/I9y+aCRqctRq0yaZdpB9i280OcAy9lBjVaObfSC1cR7RKxrmFANar9g+7FRZ4Ecm7DXSut+YtipxJH2Y2QfYksNFpJ+IiLzad1ADZzyyOZ2m78XaZ1ip5Xt3MraICbzDrBB/MO9ZaRg37FIjSP1MFQzBAoAiwyECJHYRz/e4eUw4v3KCw6vOryaw3iLwQPukopF1/wWiqbirYlr4WCb1q7WqTs0QBQ9B2KQ5Z3YktVeKFV/uRoqgUTC6qGW3QhlKxNIEgJ+T/xFqu9ZcrdbnOrR/WPPkuBE2xLXUkUF19rQrp3mOc0xAbYQN4w/Qihvz07nKBkknxAZSV2OtVhGpGlxuscgvaIqSwlcqS1oSwFkBPfHDXG1etBAwR43wwglnApAPaJ74jA8+Dk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(23010399003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?tAeoG8Y3A2GTWvRYFZwDQBYZxmw/ycoEyVso8Sjr+NkY++XJoS/FENAyLv4h?=
 =?us-ascii?Q?7bhEf+9tj9CK2fQguvXx5KUqbZu0tnKLev78HsI0yP4amD8FQT9boVFwzvXP?=
 =?us-ascii?Q?2fY+5c4MvpyRBaTvVRy0zTgVLjsi5B3zc2Tps8aaP+kNfw1ep6giGBfI/G/a?=
 =?us-ascii?Q?NaW+v8EnmUi+Eq3fL5i9YiCOPrzgbt8mwX2B7TvLfFzUYgvNAA0Yx4+0J+dp?=
 =?us-ascii?Q?Hh8y0QvHBRANfCeDFPeFlDmO1sfZgOUjy7qeNHP/LcbNsHDg3CaZayHWxhPk?=
 =?us-ascii?Q?FeTseVge4lK7K9UwC7ewkAORnHuGuonC+3nBiGQ1C6Hc01QXc/AK89EgncLQ?=
 =?us-ascii?Q?FrjBvCkPzxSxEElnWlVoO9qu1kVSTbClXX98j3J7PZqjFwEGp0oVNqHOGGh2?=
 =?us-ascii?Q?BT/YX6UGEo4lBwcwRWl7lM2qaZOsdEjn3OK39GW2iowNhLi8LhlOzWhuLzuZ?=
 =?us-ascii?Q?D4bVJx1mRPu92MXQaYUunswxHb6CFIB2SIX4Nle8Kt7khwaN/ZHdJqn2GsMl?=
 =?us-ascii?Q?B8ooJnKwWvFKDxh/wIEE+oMH07vVoEJMh5eRJr5v9dva3MjksYqF2+sY+rKy?=
 =?us-ascii?Q?dLH4J1tT3uR/ZGcjIarzcxIjt7tThPZylI5i7ZHFOtewOaKJUDwCb0gNlUez?=
 =?us-ascii?Q?ouizmR1OXOVMdX91s1/4ZfgYE8RlcXcoU8Wq8jnuYMhuw1jtI5QpHU3slbCa?=
 =?us-ascii?Q?vDH1MNb1pSY+YuS6DCaSzMklmqTf/P+xysT5rIn4aOhReqbzGwWybVPzLx4r?=
 =?us-ascii?Q?GhDJ+OG6L5ITKo55mvElDW1Aws9wdo1elh0HPKw1ayzd20NtnhaD48mKd+b6?=
 =?us-ascii?Q?6z01qYEinCAXv9bs/XYAn3hA706DdBxtkcDzVBdExOFs43M2SRm1QSXfNUPG?=
 =?us-ascii?Q?tUtriu9qtS41bqZunyJX8NVdmTmFXcLJW81jZ5M7DogRnGBDmJHPRvusYxzR?=
 =?us-ascii?Q?HlVxqyPjZOHk3tendTHXCZSLHJKpnA+9INbbTyVUoaNppa4jaBby15wJ6tHa?=
 =?us-ascii?Q?7GUP+9Cu9QwIN1mPkjHvDCkDWf/ve2I8mKBDorFh9b2PcP1v9m7znd86t/k+?=
 =?us-ascii?Q?KUTNSj+m7Tw4HTjrnsYRjHa6gYg9Sm+iKoI8Dij9OJh+2GYYLMS8uk8kLQeO?=
 =?us-ascii?Q?qtmMj7iy2s6cKIFVq5pWIMv92ZWMDNvxE9+DwsOTr4d6xN6jUiKfCc7jOTOb?=
 =?us-ascii?Q?m4a9KQlAPg0qYJHjhfUYjM+BXi5VhjWXiI6DU0VfVQCNNxYjuOdGFTmrpArh?=
 =?us-ascii?Q?u7dl36p45GRL8hO0PLqDyCuva8C7dgkCkjQhALx2xkSGrNDXehtkprt8UyrC?=
 =?us-ascii?Q?ngskUgERmT+1yKX/gEy1eTVF7WXyuPOcDr4irtdgDxU2aGHRmYO9AahiOaEP?=
 =?us-ascii?Q?z4IUy8fDtp/EZu+cs3ZOssfJMn8woxXs8spt1fl3a3vK5sdFpH/F9hh3pWxO?=
 =?us-ascii?Q?hv2EKeC1CyrgO0NSLkEVwgGh+4jf7KpzXkwsxMopYAhlfhoqi9SJHCiUby/I?=
 =?us-ascii?Q?so37R+Q3JzVQlNQD5zyckUEBzGRSc7ALA9xhcSwKhuAdC5am8YH98a46cwD3?=
 =?us-ascii?Q?csYAtfkl+onsE+UwInCiTVXkXqnWMXLy3poDPEyC/vhTwUx7Tt6OGZnY5hCK?=
 =?us-ascii?Q?zQw63IpekhYWr0vFRfQfIjT4qnv7dzXjpWNmiYKhwQo1si7WaMvDJ8Nwr0AR?=
 =?us-ascii?Q?jCn5ArMTIqJ6vdszkdx2VFGtpBQLKEx0dlyqKrIoUaRcb+n4twkWCB/2mpkR?=
 =?us-ascii?Q?uMe4OqtUpuQy2Q1geHCIsl6dRYhxqvaTHkRzDalR8JaHEc2cbP5v?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb85721c-2f86-4463-55f8-08ded78b1db7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:09:23.5065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFmpJ1cx+o/6SJ93m02QZvKtNJrWN1LR1kqu6hij+jazk3b3N12PArbz9hqTUwn4kxYYJp2rgR+Ei/X3G1S8kz430CegSFl8O+qsT9rntm3P+7QWvZ6uUQN0K0xML8Q5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7656
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:guoniu.zhou@oss.nxp.com,m:Frank.Li@nxp.com,m:aisheng.dong@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@nxp.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66248-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,linuxtv.org:url,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,i.mx:url,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 027C86EFBEE

On Wed, Jul 01, 2026 at 10:51:32AM -0500, Frank Li wrote:
> On Tue, Jun 30, 2026 at 11:20:53PM +0100, Bryan O'Donoghue wrote:
> > On 30/06/2026 17:20, Frank Li wrote:
> > > On Mon, Jun 29, 2026 at 11:23:02PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jun 29, 2026 at 03:42:31PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > > From: Frank Li <Frank.Li@nxp.com>
> > > > >
> > > > >
> > > > > On Thu, 21 May 2026 17:10:03 +0800, Guoniu Zhou wrote:
> > > > > > This patch series enhances the i.MX ISI driver's with virtual channel
> > > > > > support and adds frame descriptor capabilities to the crossbar subdevice.
> > > > >
> > > > > Applied, thanks!
> > > > >
> > > > > [1/2] media: imx8-isi: crossbar: Add get_frame_desc operation
> > > > >        commit: 3e15a3510908c990ee352aa206d5f9c23d4b216e
> > > >
> > > > Is this a mistake ? Patch 1/2 has no R-b tag, and you're not listed as
> > > > maintainer for this driver.
> > >
> > > Sorry, I missed checking Maintainer files, in media summit, agree on I pick
> > > imx's media drivers, but forget finalize the file\dir list. Can you help
> > > summery which files\dir I should take care?
> > >
> > > If you have concern about this patch, I can drop it.
> > >
> > > Frank
> > You should set yourself up here:
> > https://patchwork.linuxtv.org/project/linux-media/list/
>
> I just register it.
>
> "Registration successful!
>
> A confirmation email has been sent to frank.li@kernel.org. You'll need to visit the link provided in that email to confirm your registration."
>
> I have not recieved such confirm email. Anything wrong?

I just got it. But I am not in delegate list yet.

Frank

>
> Frank
>
>
> >
> > That way you can coordinate with other maintainers on which files get
> > reviewed by whom, see what the RB and ci status is.
> >
> > Its pretty essential.
> >
> > ---
> > bod
>

