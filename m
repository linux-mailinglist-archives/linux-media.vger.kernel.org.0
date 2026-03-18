Return-Path: <linux-media+bounces-56210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pn2L0yqumlpaQIAu9opvQ
	(envelope-from <linux-media+bounces-56210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 14:36:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9622BC2E5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 14:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1BBF3027DB7
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF9A3D7D9E;
	Wed, 18 Mar 2026 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PV0Lat7I"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42B346773;
	Wed, 18 Mar 2026 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773840967; cv=fail; b=mIdYjWUKDCDk60nMWLlbEqzblFxMnZauYVPsIeX3HMpWq7j01CllcTr95c8AfubrvX7g/QdVOeNdwigcb76AzchIFB7boPC35HJyo1AvEtcdsGlrkylPx+SUFoEMMaYJOULwlHVoCAG8GwBskfSHomyVt/YLEGWkALT76xXBNVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773840967; c=relaxed/simple;
	bh=+30MWZQJO84LsVTBGjpqIragDn2zo3p8QjeowbimNyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m4IVoWnY/p5nfPWoGMyN6R8ZL0sFpbdGkKI++d4ksdzczLqRwlRAGjA3Bvpt5AWo6xcZiiaEj5jXVfzx1YGvKJXngJ73oe6W39bREATnNaNMJZZAxjI87k4GB+FB+G+HwC1TW6Mmz+nVofaPYd3x7eSirQM8WeJmWpiC35ovvM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PV0Lat7I; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6U1e9Nx45+6/bAwqi+QKx8iDeP1sKSpIkETLewEoYb7L2Gybp1BPGDVygl8G3NwnELdrPNynWi7iOr2MrP2hHiwkqNW1feTt33gwDx9PGF/+QcDBUeGRr6mGNVaFSY02Y5I2KzW1pvywrGKBILaynF5ETBM+4pL0LE54npbbSRWA++jaEIGJfALNbZaVSu1zY1K4Q8B3e1O4eLb/e/xODJC1aX5yuxSwk4pLzRNO+bYTYA0FUReDPjqOD/yUfju+aflzu335M8Gw36K7m1kKUr+tFCNhYRl7BDA5FTpJxwavdAYT6oYidIgogP7g7HbFM/bGhIRpAMui0ZHHmKVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h99w/621sXC8ehrZNVYxkB4dfUK4KmvvEVjeLvp7nfg=;
 b=eXwbPiJWef/eRwI4KwVqriBgQgLg3AlbCHXEvzoRu8xYf/7vGkpMsHKJtr+T1d07cLta0x8hTjN+XgUJRqNg5XM7wNLwtt2KKizGbf6ybKdkWYw/9hfk+htxhie5h6oNtqRSg4PRpdrsd/GWQI/1aaqBEJMXa+F8UZsf1WS8cJ/ZnJ5VZDnFiOXa7iNWph6LI7FmKAHwyCxbeNPM1eSj4xL1/W4pxonrLfZG55W696KYV/xEvEp+Zixw/ZGg8zfJUzVwDOjSBdr12TrrfFE3hPFDsrWwK/swQ3lNdGRIranR7/OrKNqOfVN0nZoRgGYQ/kDEq0WJh2XrDPRAJxnZVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h99w/621sXC8ehrZNVYxkB4dfUK4KmvvEVjeLvp7nfg=;
 b=PV0Lat7I1jUf/sx9zFUo+htvRWooI0pZSEscgAUFYP+UEL3pWsbpOs33PTUSazyFZzONfxJf/hjaclCmR3vTURs+bU5sXJ+Kc+y79vXGOGUBIRXmZninaiYQmw+GvaWaEUDFsGlMfhELjjUXs7mYhRnKTaqt/keko0vCgE9y0Dig92vUzh7467LExNI0St0zKl1rRL13oKaZHF683g9g0kcM4PmKgTWRkDouDPHghiCjh5Q0+Shrto5JsVIkyqscZljGQ+HnVF+VTgJoHa72yz6N+PwXdAv/SCQxdoARZ3pSmdDXY4ZKsZDfcN7kZBGyEoOo385jfKqkhpAT0k+1Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11408.eurprd04.prod.outlook.com (2603:10a6:102:4f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 18 Mar
 2026 13:36:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 13:36:03 +0000
Date: Wed, 18 Mar 2026 09:35:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <abqqOw9JZDOSX3mR@lizhi-Precision-Tower-5810>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
 <aUPEs4wUHgAyMrPX@pengutronix.de>
 <aXOo0cc07cRi7-rF@pengutronix.de>
 <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
 <abqUAKj83Xaz0RzM@pengutronix.de>
 <20260318123644.GH408929@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318123644.GH408929@killaraus.ideasonboard.com>
X-ClientProxiedBy: SA9PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:806:6e::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11408:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb30baf-41a7-43a4-7de9-08de84f34cb7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 LbG9TOWTIJbchaAgvlyJVJPJgFvNIe9MsLlCdrj4+i41YrBcYHxapDtwlwtO7KK9RzfB5EtdvHIDkDuZ0tKdIRjz9bx0nvHhJpydrTe/A7NPD6cueX4V1/J13pCQGg52/q8PpL1BRDfmNd11wa7d8fwnqTxYRYZURAZIRveqz6FPMf5xukUc1faV1CowVun8A28+YJg1bM8aMactBEBRjsXW5OaT7VWEGkZb//88aSXin7bYY6wG3FccISaQpiEht8qhJoau+4sKKC72qNNlpmdWGrNZp51jF4nOBNvabD7uootGbgSu5QeG1I36llWMRIyZyGNK8r4hpeUlScphS5Oh2zzGwzUP98AwFGIB9uttXW20WjOe2xGT/ax11xdDdyHzIgr5jv63W3aJrcG+OK4uV1y3e4ZHRQJukTLj+SdjLe91MUiNzl8bxgEdgOkzFX+JO3Ex+K9ghCcx67UCzHGFSFTqOjuin3iZuku1rrqcAr/cQJD4OZJg/T8pJO456Dc80uiv/Qs3A8tnwENDCRG4PbFNaJzpuMhm84pKO49mWdWS3b+09jr58UlUSd8KCDaEIzdbvB3lgn3pJVfTkwZgGvgweydUtuEC6+MHpcPRCq77DMSyF+2CWnw5wuYl+pP77dAHgrrxtoqSnljX9dDEyH+3BQYVrWGRWtzwvSoou1YezK6vzdPamzs44vzR8qm3Mtf6PlrkOeWuhFjkgYw0cjiNTPnSvUQptitr6d4idS6RaHDwCZcxEmD+hdRz4p+ssQzpM7XIQKd2a/5CwkfYAYWEYlWAQ6tdHeNAvhc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Vc6YFavMQroIF6icjrd/R7EH2iZuLU2h8CHJOQG68fh2BQCIKC5IBGKVC/fs?=
 =?us-ascii?Q?/mTbBGDhriomdbsLMd3mRpeDIYg6A96xu4B+2+xZaksXt2gTrPM+t0N3lhnY?=
 =?us-ascii?Q?HiKRN0UlJpalq9+kWp+NLLX/PhXGOXdvFx8V4S/YBnE/DLB6jZba+s0MakAn?=
 =?us-ascii?Q?3+oPq3glVt5BC88cPRS8thhBH+8efQYK8226RhnnAP0NosPgW5osxl+f1N20?=
 =?us-ascii?Q?+DwEhOFnxSfBAz+FzMg21kC4IG/oGHMrxmN7PHU2DO5g97PAy9WmzjXWxJ+e?=
 =?us-ascii?Q?jhe5wBeInjjyjLNopBD1/gn/faUYxn60YmfjnwEuKyb8CzXmFGD1XiIU4Ioh?=
 =?us-ascii?Q?OW2pKxwy0MgOTsnRESbY40Hln6nZIugJxnZceizFETa6fHZLogDiF+zs+TEH?=
 =?us-ascii?Q?YMM1h0EWeYLtDF5K70AW1BziWZ2xUDIBURZgUDalRxo6vlsvG4zcNQQtmluy?=
 =?us-ascii?Q?f3AtXp9UyrT4q8W3+XQpCuXsfaDiqhjw2mUjv5hopZdkrScLkw7sk1rXSLfR?=
 =?us-ascii?Q?zYcBGZsyjJR8q6b/2ut7btTeTBIzW8zgKIGglnYXSsa3BAFpX90KC46TpsFO?=
 =?us-ascii?Q?IooEh4B7sSJTptKZQ/O/URfnOnw2zmAjD2BeoYFOpFcQ74YWP3mnu5hwxwjL?=
 =?us-ascii?Q?VLcnpxbeq6fSg3M2ex+oeLhSkyC3nmO3o5nDvJ3jxuJRhuFMr8JclOeKBnuu?=
 =?us-ascii?Q?POLfYSipK99fy0BwG2jftn62psHWAieCZX6tKOK31pyp7+P5jyAt2gIw+th4?=
 =?us-ascii?Q?uyqLFFEmhahSPSgEYy/ZVCEfCsp0GIfXioRBf1y/8+BRK+TOnOI2i5VCJLrz?=
 =?us-ascii?Q?5z5VYaHtxUH3T1cgn9Ou4KJoGJ1JBBo/se2gXYmOkkvkrjr2ElkoYnbRgy97?=
 =?us-ascii?Q?4oqio/Q138NE6aQnoouzu8sidLRuVHZUioJgU8TJ+O/fpk0AoHGi54V/e9pS?=
 =?us-ascii?Q?EH2shI6/1JmGkLYQ+IgWH2OYrpxjZkjrGGrIV5wiMr0V6tttRydSKZvXOXG+?=
 =?us-ascii?Q?6yCeOd1GNN9yWX5ypQNp4nyXE5PBxSfbcldD8rue5c3maxINOW6w2hkdy5ya?=
 =?us-ascii?Q?fvGdbGffnf5ajSDQZ26C5mtndKka3OyU8Ciz38AePQusK6dr30gP7e6ktd/7?=
 =?us-ascii?Q?wpX8T0LTJBI6qJl4PzH6Mqmt5Kq3fRzXmChKYmc0w9qKOiPsxZ4Xx2fYguRj?=
 =?us-ascii?Q?lyLd293yL4q2PPNzQ8cjMfPwmqaBDnmTf1XPvhl4ZODhuNnUqsxWGh4nsy5R?=
 =?us-ascii?Q?q/0lzFanxZW7GCtJOF0sjDYjq81mZZho/KCC+GeKv/yXCQ6aDLqUe/PDsxQg?=
 =?us-ascii?Q?4QtDNI0pP1vFRL9Nt7TmR7ZRgv3kO2yBK4tszyO/Z53iKlIKZDzYs0RGOBwM?=
 =?us-ascii?Q?C/P4XKX+VTbCriT8tbqhOUhsAMHyBVSjUcu14j4QvWyBAKgOijf7l21ydRgX?=
 =?us-ascii?Q?Saoo1PFxMQUesx2vMj5Ny1LkKjtD3/APyfW4P0SxSmID2vLzbZW2MbhMN3jz?=
 =?us-ascii?Q?HAU+e+w+YiGaVT5vtxpGO3huDBwJZ249xBI6JyH3947/ZUGsirTR//ww+Ibc?=
 =?us-ascii?Q?jzYgPfKWt/M5nm2/6veEXdybYHT32w+RjqRXp4oLsAZwMjl1ywNq6mXITL54?=
 =?us-ascii?Q?fxzh4sPsrkwUxMORWcqDEq6quzGqWqXCc03SmAkmq/pDGC/JHd++jY5Cs6d8?=
 =?us-ascii?Q?K8HoXESDKnC+NZiLNFWVe963B+AFNPfvmiiS3+atA/goHTZB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb30baf-41a7-43a4-7de9-08de84f34cb7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:36:03.4373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILIjmItpXnIq82ALc4uMcT1rbOXlGLzMh4Bq2/qVT6wQtVM0v93ZMExXds1CvL8icuJTGpDlM0aumD9/z9h5yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11408
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56210-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim]
X-Rspamd-Queue-Id: 3D9622BC2E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 02:36:44PM +0200, Laurent Pinchart wrote:
> On Wed, Mar 18, 2026 at 01:01:04PM +0100, Michael Tretter wrote:
> > On Fri, 23 Jan 2026 14:34:29 -0500, Frank Li wrote:
> > > On Fri, Jan 23, 2026 at 05:58:57PM +0100, Michael Tretter wrote:
> > > > On Thu, 18 Dec 2025 10:09:07 +0100, Michael Tretter wrote:
> > > > > On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> > > > > > If the IMX media pipeline is configured to receive multiple video
> > > > > > inputs, the second input stream may be broken on start. This happens if
> > > > > > the IMX CSI hardware has to be reconfigured for the second stream, while
> > > > > > the first stream is already running.
> > > > > >
> > > > > > The IMX CSI driver configures the IMX CSI in the link_validate callback.
> > > > > > The media pipeline is only validated on the first start. Thus, any later
> > > > > > start of the media pipeline skips the validation and directly starts
> > > > > > streaming. This may leave the hardware in an inconsistent state compared
> > > > > > to the driver configuration. Moving the hardware configuration to the
> > > > > > stream start to make sure that the hardware is configured correctly.
> > > > > >
> > > > > > Patch 1 removes the caching of the upstream mbus_config in
> > > > > > csi_link_validate and explicitly request the mbus_config in csi_start,
> > > > > > to get rid of this implicit dependency.
> > > > > >
> > > > > > Patch 2 actually moves the hardware register setting from
> > > > > > csi_link_validate to csi_start to fix the skipped hardware
> > > > > > reconfiguration.
> > > > >
> > > > > Gentle ping.
> > > >
> > > > Is there anything still missing to get these patches applied?
> >
> > I'm not entirely sure, who is responsible for applying patches for
> > media-imx. You handled the last few patches for this driver. Maybe you
> > could apply these patches, too?
> >
> > I also sent another series [0] for media-imx. Can you handle this other
> > series, as well?
>
> I don't have bandwidth to handle the i.MX6 camera code in staging, at
> least for the parts that are not on their way out of staging (I really
> want to help with imx6-mipi-csi2, but even there time is short). I'm
> fine if Hans handles this series.
>

Hans Verkuil:

	Since Laurent Pinchart have not bandwidth, do you need me to help
collect these patch and send pull request? I have collected imx's dts part
patch now.

Best regards
Frank Li

>
> --
> Regards,
>
> Laurent Pinchart

