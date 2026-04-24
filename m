Return-Path: <linux-media+bounces-59470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEabBM/r6mnCFgAAu9opvQ
	(envelope-from <linux-media+bounces-59470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 06:04:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B90984599F2
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 06:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78AC3303B5DD
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 04:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B27328616;
	Fri, 24 Apr 2026 04:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lCKcTua+"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2175330B10;
	Fri, 24 Apr 2026 04:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777003357; cv=fail; b=aiJTw2k2fJxeEfLa8Qb6H9y4EQAIHqDPBoijwYtJm1BjRQjn9UTtefT74e6NwL0CBf1ynapPDYAVg/lPkuPxVraJuIBG1lhdxJViinILwU92x5gGBZXwbJyJL8SnvXyiSHgJiJVIko6oRrAhKkM/bEDAn+o0rYwFTG0r1dLqZ2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777003357; c=relaxed/simple;
	bh=N6Ny2fOVDIOG7qkFFdcBGXv16b/SQ1eBtjzTXBoYio0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oonT7tzcOSfiV5UKBVcntpVKhwueskNsS3rhLlTfFc6Kt6la4Kypag3cQN7HTgCnQXGTKO1uhe6gVvY4KBJ6JXN9Z8LtuYLbGWlcFrwv8Lqi9NYcAHKivGesuEzGsPVgsxh1POnN14FO8t9rOVQCHEUIAbQQRaiiflHNBG5ELZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lCKcTua+; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjODJDBhSJhkZLt1f1/gAsWS4qJB2iRxWPcIpYebKQVU8f4/vcTDOdWNeP+Cg0W6lCK0+7tDZs9BnvpZKkfbtwErta5i2ooRQ0+ZHb3MIAhSW170oq7+kJh5AXkx2CIt+5RdB5HHp+iBM0uIjyfou2YL61bnF9C6ylGoqYsb3tLT4XZvQnSDCclZCA6um0bXEyBjBzpKA1eSxxN+AyH55Ac/tzst6fzz4u/TzjrNncaYh5dTfY4BwvRSGZlSLMyT7BDp9coLS9v0nFBTtXohWI8Ra/pVpVN1j4pCRsINZ1sDBiwfzH6uwg7Lc3f/VuNwhLb0LYamO2PG+gQAbz2t4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAizIGK8Pt5jSPz1hglQKsngv1foI6Uctfns3Q+4Q3I=;
 b=NkEswohqSqVQqVYvg+54brxMLu4TKVr/ecRd7FloaH6QoSUFWu6fv135CInmMchx8l7PsI8ztLMzTEJyRMM20jfFGgSsV72RWU3OR7HV2J3l75S9MSpgB5wRyLfB0MaT9M/z2yZajU7/6mg78EoX5cRUQ40UiawjeU5WVGPOlv/f15xTTznFYzYRnecOTXMlvZmwq1wiDLcUig+72rpwZJ9McvoacR2eYRnnoMMRybTNV7hYQVAiGF7CijOv1KiisGMIHlMH3uzUsfhuhF9WqvoE5JKZsJKrcvQOSsWyXQgYT99vxX2Ix5Xx4nuzOePhx491gugyhkgi/apIp4QuPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAizIGK8Pt5jSPz1hglQKsngv1foI6Uctfns3Q+4Q3I=;
 b=lCKcTua+BmObR2PYRgr1VCcXKa6+cHmDiY+LA5NPQFD4Nnz0XU+orYvlz63Jgf19i+VuQBu8DmAraNe7kO5CnHh2aZoY0oxLRakP21e/utu8Mu5dHucIMtEFTBxUdP1aJrHddO+BGNaZ+4WN9GvSoHIxTJlhhtFaADbtrWTCSyUJrYS3o/ApDpC2SG1BxlCe4OL/mrRrUrnNyMxmZruwMXbBVCYOyT/MKrVadp1jZ4Wsv0zt9wYIAGYs06A/MEshTlH/kwiHSWUSsihYB6uxDbFNc3Xh76ymXtKwbCRLsYHlQHAY2zGvffoam270OsA1tbDILyBLEbk6u/hTATja+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRRPR04MB12618.eurprd04.prod.outlook.com (2603:10a6:d10:1d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Fri, 24 Apr
 2026 04:02:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 04:02:33 +0000
Date: Fri, 24 Apr 2026 00:02:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 5/7] media: synopsys: Add PHY stopstate wait for i.MX93
Message-ID: <aerrTtT8IAbFUiA9@lizhi-Precision-Tower-5810>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
 <20260423-csi2_imx95-v2-5-934c02f3422a@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-csi2_imx95-v2-5-934c02f3422a@oss.nxp.com>
X-ClientProxiedBy: BY3PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:217::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|FRRPR04MB12618:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c9c900-fad7-452c-bffa-08dea1b64fe9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|52116014|7416014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 +KTgWZgEuflFos9oKl/BPbMlOuZPw2SdcHomQpavKhHUFLQsSyIyzcQG6TKEsuA+Rjcdn3L4v5aOvxDortQ1pCkSTdq5JhEYoFKkjLok8c4U1vWmMVFyXmxv88/rUx427S9PcxaO/voDjZ1941MlbyApdJpCJ198e3UinqMtlND0Y58UEtZFFSGQHzv3YE2M8s8qw5ec4cFdOli71yl26zm2x4vfl3c+IlDgOiHzcS8CseWVIkk/Ue+baUL72F1P3W8irlu05y6LHQxqmnf6aR/AIkA4bvrhzp3oS77b0uVmyeNYON2wxTcJTo4MfcUL1dVXe2N2f0FBpFHfw22Ii4EgI+gw7r8AliFZcHKpzDfSZivFhOJxZekLd7M2QM50o74ruRTjxqwL0OQbDhnAqTtrjqBUKPjQM4U6F2sEHYirzNhg1bOnodU74Z5myywcnKIBW7ypb57IVtL/wPZ83er05dZrzOW7XWCGwWgcKP3+ETAnjyXXB9eE+7AZIXFGyVyRzumyNpg7BRZaotJMlQA0mIAhr1nonwaIApzBi+VkoW03783BWHm88mZpesUbmcWt5ffwIB1pnijLjJeg40letPpSOgIVKF7kjLP6L0nubQLHG5FCRNv49I8OcPhVTnPyJy3skBMUQJC9hJfHBloJOaVGn0ZuCDk8+OjCXHJL6zx7zLUqXy2KjotLmKXIODSPO8hy3DR5pHZKQN6vPUgj9/2LHh4XDc/PyeC71Yt2jadr1p+NioXlIBpZbCCUJpJvCTJYNtVqzvBMWfhIzDJ53lcRu8GILzH6jpvhXMA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(52116014)(7416014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6Pn0MgLDmurDS3e3zKE3GgrnkajgoMjpBZsPT0Z6Um0dVsQGNq7Az5T8Vo04?=
 =?us-ascii?Q?yIHKVoCJL0+IFWCghuHlsJKNPC9IivcM9O2PF10Xn10ChAtCYD72KqbYyY4c?=
 =?us-ascii?Q?KC9MrVzwfOhp38ChCz77sgikRFIc5TO7tKNvHYQ3REVcUWEvSZ0Fddh5Mhd8?=
 =?us-ascii?Q?48SaOshLmn4gQ6zsLJekQHY+Fy16c5lOcvXOCuNrzJWhuuJDF393tAZHhaiE?=
 =?us-ascii?Q?u6kCzjhCerXmzQbJkty+3RysAZiiQyA0zbOqJ0tJDDzefe1b2Q2VpDrTMdK3?=
 =?us-ascii?Q?smbk7SHWFJSwHX0Hl9LPZadj5F0vzwKWpU8pXwlk9uYiThJavZl8/xjMOpNB?=
 =?us-ascii?Q?8t/WH4VOlGA4Awa+QHte4NoAOo+4+Kg8ZLQuRm+KIMxBvRN3sF38Mx6RaotY?=
 =?us-ascii?Q?eGm+O23fidOP2T5zNYkTS7/5M6EjYcyRShTPkWLtBzPUZqrZtOcrvwa4iOdo?=
 =?us-ascii?Q?V1qyGNrx5WkU7ZQv1BMCPR8qU4rHmukRJBdc2WSgUW1LGihZ5RoUIm592YGY?=
 =?us-ascii?Q?g+lSwzRsDn74bxLpn0a5rSV6Sg5pvZXHR6pH9hxxHMnjRZYwWVOZLxRDNafJ?=
 =?us-ascii?Q?PMRXFMmX9NfEgavpWA4gHUgW/q8kzBHPMoMeGngWn5U7RIGaf+tQkk6W7hsZ?=
 =?us-ascii?Q?TrTs70Db8BzRULhZSyJaOYn8WFU0xuBY23lkpmnDJ/9Hpy6EtRK8Ay2Ehmbt?=
 =?us-ascii?Q?Yx007I5FnkDfSsZA79vi74ArEHhkA76fY/4fZet/3OU6bGjEtchBH3yjqFGS?=
 =?us-ascii?Q?tz+9HsPVaBl6Up82T8Ck0+t4bD29o71SjnD//U3Ug1ws3CEkP0vDO4GZl5Pn?=
 =?us-ascii?Q?Ip3NU5+AvIin7upbzmh4AEfsJBdNFSLjTFIXYtdMzjgOCMOX8t1VFbC8nmnE?=
 =?us-ascii?Q?fxJb5iaoVDCLseKVsxIAkzDJKmYleLFDcDUeARc965Il4fSlpKpO3v9RggrX?=
 =?us-ascii?Q?JoWW1X6ep+STpt9VCPV0KQCQfh93SFBaXCEBmZ5Hb8ABMlx6PxdpDHboFEal?=
 =?us-ascii?Q?gW8zfPg98hUGVkWxDZhhusntbWC4alG6qV3YEfLWP7bLs6LxsC/HsFFsSslC?=
 =?us-ascii?Q?BrnrTRok9jRPZcJw0CeAcw3qqmNw6EivFsbUTx7ZJINlP1iGt1TaRcIwgFV+?=
 =?us-ascii?Q?8XPl/ZhqkvAinTHPmxpJt+Q4OxC1plqNMDTSmep642j3ELOV/Xqx6NtZeYAh?=
 =?us-ascii?Q?FD+XGrUk6AEJD3Hk1Zj7+yHhY+XPYiuQITK/xLfCOJ2n8Bfdh10POVH8BfXS?=
 =?us-ascii?Q?oasPbh6dLOcwHp8zk7aOkNkYXqxmmnmSzW2e46OI04pc8n8s+FPvmgspE034?=
 =?us-ascii?Q?civwPkcKDI0zGRal+rpI8DmKCyh7BoUosGWNCtHcyZsaFmaxCgrj1y0FrnXs?=
 =?us-ascii?Q?EE7fzC6eJtP8wRJvX6nmgjt2YuRa2xlnYtXBzcV0ZMTfjn/ROAN4+xa+CuF2?=
 =?us-ascii?Q?7FOtWu4n7zMvpcvXss+PVwXPqlyEN0pkZrvCXwe092vpaG/+sY/8K06L9KMm?=
 =?us-ascii?Q?Bg75EjKic4p7d24DxTxpryT6Jkvx30Z2USXGfufIEVqYLI2Ua68BJGBYj8C1?=
 =?us-ascii?Q?XVBrdtSRipX6n7QmWuqITb/NH+X+xX5vDAHAL+qiXCa7kWrBoaGKARRjRT1K?=
 =?us-ascii?Q?R728ApN2ehPlJu8rB1rUqG/4THm4tIB6vdObJxvn2ZoPI2v7WwcDa6Y3Pv4C?=
 =?us-ascii?Q?Xan5eTKo3hshVWo18N0LzX10XZ8VwKNi7e4dtrIhEGPkUVik?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c9c900-fad7-452c-bffa-08dea1b64fe9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 04:02:33.2458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07w2HHc97MaingjVY1nKQT4uUbt21SahEpzccM+7bn6pxidlSkDhPnXZalTlB45VeSxK95YP2KDDNJuenr8eaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12618
X-Rspamd-Queue-Id: B90984599F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59470-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu, Apr 23, 2026 at 04:23:00PM +0800, Guoniu Zhou wrote:
> Implement waiting for D-PHY lanes to enter stop state on i.MX93. This
> ensures proper PHY initialization by verifying that the clock lane and
> all active data lanes have entered the stop state before proceeding with
> further operations.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Removes redundant register availability check
> - Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
>   readl_poll_timeout() with direct register address
> - Fixes stopstate condition logic
> - Check PHY stopstate after sensor enable instead of before to ensure
>   correct timing.
> - Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
>   balance performance and responsiveness.
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 36 ++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 5a2e74d055c0..8c38fe8a3f06 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -11,6 +11,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
> @@ -35,6 +36,8 @@
>  #define DW_REG_EXIST		BIT(31)
>  #define DW_REG(x)		(DW_REG_EXIST | (x))
>
> +#define DPHY_STOPSTATE_CLK_LANE		BIT(16)
> +
>  #define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
>
>  #define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
> @@ -65,6 +68,7 @@ enum dw_mipi_csi2rx_regs_index {
>  	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
>  	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
>  	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
> +	DW_MIPI_CSI2RX_PHY_STOPSTATE,
>  	DW_MIPI_CSI2RX_IPI_DATATYPE,
>  	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
>  	DW_MIPI_CSI2RX_IPI_MODE,
> @@ -87,6 +91,7 @@ struct dw_mipi_csi2rx_drvdata {
>  	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
>  	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
>  	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
> +	int (*wait_for_phy_stopstate)(struct dw_mipi_csi2rx_device *csi2);
>  };
>
>  struct dw_mipi_csi2rx_format {
> @@ -139,6 +144,7 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
>  	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
>  	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
>  	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
> +	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
>  	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
>  	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
>  	[DW_MIPI_CSI2RX_IPI_MODE] = DW_REG(0x80),
> @@ -550,10 +556,19 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		goto err_csi_stop;
>
> +	if (!csi2->enabled_streams &&
> +	    csi2->drvdata->wait_for_phy_stopstate) {
> +		ret = csi2->drvdata->wait_for_phy_stopstate(csi2);
> +		if (ret)
> +			goto err_disable_streams;
> +	}
> +
>  	csi2->enabled_streams |= streams_mask;
>
>  	return 0;
>
> +err_disable_streams:
> +	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
>  err_csi_stop:
>  	/* Stop CSI hardware if no streams are enabled */
>  	if (!csi2->enabled_streams)
> @@ -864,11 +879,32 @@ static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
>  }
>
> +static int imx93_csi2rx_wait_for_phy_stopstate(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	struct device *dev = csi2->dev;
> +	u32 stopstate_mask;
> +	u32 val;
> +	int ret;
> +
> +	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2->lanes_num - 1, 0);
> +
> +	ret = read_poll_timeout(dw_mipi_csi2rx_read, val,
> +				(val & stopstate_mask) == stopstate_mask,
> +				 10, 1000, true,
> +				 csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE);
> +	if (ret)
> +		dev_err(dev, "lanes are not in stop state: %#x, expected %#x\n",
> +			val, stopstate_mask);
> +
> +	return ret;
> +}
> +
>  static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
>  	.regs = imx93_regs,
>  	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
>  	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
>  	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
> +	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
>  };
>
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
>
> --
> 2.34.1
>

