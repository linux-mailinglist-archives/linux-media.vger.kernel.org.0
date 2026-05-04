Return-Path: <linux-media+bounces-60314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA7YNSzG+GlQ0gIAu9opvQ
	(envelope-from <linux-media+bounces-60314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:15:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F644C1404
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C438307B071
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 16:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C94D3E1CE4;
	Mon,  4 May 2026 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZPWDNXah"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852137883D;
	Mon,  4 May 2026 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911031; cv=fail; b=kfyj5ZiD+AuhDlVJLj8MQm/KAtGsiueCf50QLsjyiprv7xCbFSr8H6Spwym+TLhg9fjd1H+3VTRBMykjlJUiVTEcuCfcp4VuF3loHVgGy8jx9jcdNokzyAprg+p5GpXMsM1SfRQYh81rsyb5cTVpDs0VsvNZ8ohLum3NFYWZ66Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911031; c=relaxed/simple;
	bh=So+ra4uJlqRVujEN6FlYv6F6WOBdEac7VUi1MgCChh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GoxOl/a6Oc1KDu0qdP7xRLckQ3GrSsl3NLpG9H8mtTgYFeg69o0uK7ljsyjqqIvfagDdM2VERCk2aSuDCQzNr5cYSBjCUR5VhEygghdntVEIC0eTJ2FnYh9SC97OKOLrniZKxhGAmloZL6hbR6rSSt/Sc9qSgjC5LAGhtt2U4eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZPWDNXah; arc=fail smtp.client-ip=52.101.65.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lv+1pfmFm4wk9rdab66aJ4xbZXi8CyMZC8nw46Qi3HknbHXfdxNfJ9AukiT5EDWFmss1Q6FmvdWMsWJPmsCqiYtQkaA5JBRQLqS3YMdW1VmV3CSH7rk9N8H6xCa3wAuVSI8jLK9D4m+4IbLoJvLWvSyc58xcSBg9sliaQzYnjlB0nEBHSdAfgYBemQF3cYPL6PVFkH8AHW84s0x1XPzaT3pMQHd2ofrXiFGka+n2ngsEv7nm5ll+x+WEN7iB6F+/3H8Xve+XEH/xpLntDIWbkrgBvMPtwA878cxqPi/l10ALDHtJaqJfEcEmOR5HdrFReMLj1jkkHi4Uy9QIL9362A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0rUpXTGfZpd9h3IW1oTsT4zfnv8W5wD/pf/NDfeYT8=;
 b=LCUL3OcMbklF5lIBUa8R5zW3YKS1JddIczQSQ+WQPAySV4M8FpdVXw0jipxRweeUA22o4j2gsrSW81DbZ3rqBBeC04CAC/M2uC0B07C9+0kibV8063LZfU8lJrZYiZtHUCwNqaswKgDHzHivWt1Y8X9077Fsc/j00nEEvcWnEPnFEiv/fafw+tX1cxmbsbgHa8Mp5gpQkixaM3ShwGwvJfZXCruK/+O/jna574XkJOD8BoZHYD+QEtDeD3TuVz7wRMczii0b5Wy962YOhE9l6Vgl3wAal45aCsnZ28TpqrfFRJnr6W2WrePAzuMHfrGBP45ZQftnWmXjVPyNiHoumQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0rUpXTGfZpd9h3IW1oTsT4zfnv8W5wD/pf/NDfeYT8=;
 b=ZPWDNXahHGkWWLLhtKipq2cPAgB9xQuEGDTRJ35ydEVqy2lDdiKVQm4szMyLjNce4P18l9Y5pgQBsPzhCjSUW+h92KOf1g2STXCs8f/WP6dRsFMBAy/vfVYi3kdBFo++y/E0S1t4p/nWK+tSoiBl7hUd/XuVzdRaTVX8hSgJ4RVPZ7HxWSkxhWXKLMinUDTg0Ys8fX1kGQEuFFWNLjfqQH9UzvvDrEhnq0qoMmnjpNSvsMCuL3tQa5v5CBA+E4v647dVf20Ao+hL3+1FAs7pNP5ta2BO/jZnEF4UIgySC0Ly9yD/anXcPYZABsv+KskJvM4i4/O1R6JIfks+tymTOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8120.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 16:10:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 16:10:27 +0000
Date: Mon, 4 May 2026 12:10:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: michael.riesch@collabora.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2:
 add rk3588 compatible
Message-ID: <afjE7Df6g3JRjuUa@lizhi-Precision-Tower-5810>
References: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
 <20260305-rk3588-csi2rx-v5-1-3b7061d043ea@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v5-1-3b7061d043ea@collabora.com>
X-ClientProxiedBy: SA0PR11CA0075.namprd11.prod.outlook.com
 (2603:10b6:806:d2::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6e7c57-b1f5-4284-db2f-08dea9f7a79d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 9W+lQOvTMivHbWkpfrI2oemcHMImLJfH+XtK0n84XgxdKfZkY9EjTNPJGifZQw5aw7uCs5O4ziOipmiMN597RRCRSeLVg566hVCC8XVvtKLKheI1pIfEvoWMGKkj5hAZCkm/xI+dMGNzoqmjYCKT0YU27sO4P494tCrL6RVhvtlUwAQiTlcRA2n28HlG0nHptaNRAynZvM5faI2BR+mLol67JOkxyITWQPHAA3STKzYmn2/wUh75JJahPZmzZa0XOSX355+tIUzUH+vRaZveEJ+Hq3EnJwrwDqzjGe/Huf39loFAL8WUhv/fOQTLCPKht1PEW3npaVdXChZiCt6aPzap5cbPX1GAJPWGjyWwnN+QStFAr5tP01VXg2vExuZLpdNa34pNV+yLaNkX4CfKs/zBOvjfClVww0oF8KlV59aYEd+Mk8wBkdTyXlYHpUXWj6kwYYt4f/jd8uUyl6MJLOTxtm96Tvp0BBlsJo495E/o/zsPTFwPFAVElz8mV2d8HCJZSvc+kbkdpROogpgCiol7G/CwzApF2p0rjiFf1l7kr/wfEHFmVsGOcx7r9XP4beF+p+VH0Z+fFlI6PeHgTKZgR4cVKoZ5vGsMmZMMoIu/ZojT1VIU/uhccKvGUalN3R4VXK2lnBm4XF+S8s5BZnALUzgyzVL9tRGHayQutz8v6Nk2V49LWqTeIqIM51E7WrEUGybVQa7BhGMmwzRUTebbJb30OR6sH05vHoeJs3T9lWGpqbC4dWka6ZAWzA5M
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?jS1FvneL9C914qYjr/KjUhxsixnh+gR3XOnshaptmlkloOZYBB2N/cjKYgs9?=
 =?us-ascii?Q?bEtnpbqdnkzBEdgT1Hbz9e9hcBYMqDFHQp8o2tVq6kwJ95tMbM5OVGI5t9p3?=
 =?us-ascii?Q?hWzbt2nYaEPCq2mpFg8XP0hO8MQQIccINXWxPDSh3x1kOeL5T29AEgqqhB/w?=
 =?us-ascii?Q?A2v+qtUfP8DuCZh+E1ioCWDEjJWTNn54nT7fpDWlMAF4VhUC04S4ivTx572e?=
 =?us-ascii?Q?WDI/2iLXvX0jIkjETgYVT8CEXoHJlvwXzKabKoQUXD46tda1kqFiwRuNi8Cq?=
 =?us-ascii?Q?hrAX3wTCBL/RZzOkP2TB03meh9Z8uRZW9mq5HHXMLoUTuKa86yHZoTjtCn2h?=
 =?us-ascii?Q?ftU3+eUPz0hQtUDeYqRriInxTq4CRF2HOeZtiLl10oLMoU8a+tboUrJre12N?=
 =?us-ascii?Q?bho+/yXTDxfsttoIWTxIMKgei/DftyfLr+fMynsOUK2iW9ofEube9+91anUh?=
 =?us-ascii?Q?Sa+TLBsE1ou/y0TgWTrcNIJkhuHbVr/d4uSEXJpGuwd/Uc9DlJEn6tCr8JQQ?=
 =?us-ascii?Q?PcPc32e5Ew7IOEvuoRfOhGoluYBj5lZkHo6pE0KYskChBELVBUrtkdljm898?=
 =?us-ascii?Q?2K/wCK2oplln89qkOb58UZq4XaY4X7dddcr/b5nC5jl9Degoyki4zkkhBEF/?=
 =?us-ascii?Q?PXaf0LFt9Cq4Z3jXLBSRCk+isiMH/Z3t9d5yOYNXmD9ccKSPGwr5hw9Xb+Vg?=
 =?us-ascii?Q?ebZqMTQI606xmFLXHPptwmBfHzWmz1BsaJvEXsMwa/U5pJW4DihotcNzWSG6?=
 =?us-ascii?Q?p5CP9AYo+RSC/d6jnokfXMFlQtqrEn4+BnyG/XP208A9pH2Czr9wU2tNOIzp?=
 =?us-ascii?Q?KlnoerbzTWpdTKz33wumorF2bYiuKZZ2eAeszeD2AxQ3W6Rid3yKAqYOQAH4?=
 =?us-ascii?Q?xmnqpf+8pF81cwQRrBggx4Zeu8dDy11hp8qaCmqrriqDzCcvLoNlZ8InkP0E?=
 =?us-ascii?Q?Zwa4nvy9qOc6OemcPUXzvkpmiKoDsdZ9TCBF9gY//0wvHFHo2wZp/0hjvrLB?=
 =?us-ascii?Q?pdxeOcXk0OQHmIMqc5FzzDSf7xPFxN1Lh/BhVKYYaLugh5TMZKzquoTGtcyU?=
 =?us-ascii?Q?ESIu14LgpA2jCFix7pwj88ULNuCp0lZ74YXPzBz6HrMKxoFAliwHEHmVnWs8?=
 =?us-ascii?Q?491MWlrT3xAiaMszvMlk/RUQ9sCSLrOMz+ZWho4TdP5YPORbdGPZ10o77u2P?=
 =?us-ascii?Q?zN+zPCrcjSnIGRHdfeFK2MDdZ5bnrY8I3PNMsy+RPbcDibZzMLbnzbbJ7+Ch?=
 =?us-ascii?Q?5V72nlFWEXE8dXy83L6ZbnJI0aYX9dpDJA0Mz4bkM4SkRSAA1+1laT9TGBb/?=
 =?us-ascii?Q?5nn69Ia7fuvflVhVznvWciNlOdQtTd13tCMrMEnAmpNJlkPCf7sMyjXECv7V?=
 =?us-ascii?Q?pjGu5OBO4hOYY+lXqPhrYcQkrTQpUIltrx5XKEyXFVEnrd9/ECNfaVXtXEbg?=
 =?us-ascii?Q?2votVfCI7JH2tuaaT7jy1RQVeshpOdsHZJzY55uWTzfGOGMF7ElGVlAd3z4c?=
 =?us-ascii?Q?Ihu4qwSUGm9Xc1BYwQOYYuIts1Wbh46pv8HTSN3umdO6vPL6L7IiEQpncMCt?=
 =?us-ascii?Q?9wPFQi3EsvzSm7r7+RAt1SKhrttQpTl4WAo8cPM5odPIk/RZhBde3OGYCgCX?=
 =?us-ascii?Q?TGm9ZNk50kot1BvuIVdxtDNKHdqCRhY0XfPW/8rG7bbErKQEJwtQ8tZVyWlO?=
 =?us-ascii?Q?bi5BuqU+kwANFbMoKKRRW4AYbGHq6sQzK7y+lgjUvnhU8Rgm4VXEBV617SW9?=
 =?us-ascii?Q?wj9bx5KiXw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6e7c57-b1f5-4284-db2f-08dea9f7a79d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 16:10:26.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdtCU/An9J4lZJ4uYXoO1QZ7z8utLQNz3pGN/3Lx2ivUwXxLVfeKFdkM2LjfqZ7GXri/Lj3cBzihohaIF1w+4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8120
X-Rspamd-Queue-Id: 68F644C1404
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60314-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]

On Tue, Apr 28, 2026 at 09:27:23AM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>
> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in the
> RK3568. Introduce a list of compatible variants and add the RK3588 variant
> to it.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> index 4ac4a3b6f406..fbcf28e9e1da 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> @@ -16,9 +16,14 @@ description:
>
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx93-mipi-csi2
> -      - rockchip,rk3568-mipi-csi2
> +    oneOf:
> +      - enum:
> +          - fsl,imx93-mipi-csi2
> +          - rockchip,rk3568-mipi-csi2
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-mipi-csi2
> +          - const: rockchip,rk3568-mipi-csi2
>
>    reg:
>      maxItems: 1
>
> --
> 2.39.5
>
>

