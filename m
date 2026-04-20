Return-Path: <linux-media+bounces-59114-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C2KHeG85Wk8ngEAu9opvQ
	(envelope-from <linux-media+bounces-59114-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 07:42:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B03EF426E6D
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 07:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA0BB301FA4D
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 05:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD593815CB;
	Mon, 20 Apr 2026 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ObTY2T4k"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013012.outbound.protection.outlook.com [52.101.83.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1299229E114;
	Mon, 20 Apr 2026 05:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776663766; cv=fail; b=q1dTQbJQS6lJb4FQSe/KdfUr9UflUa3j4lM8ac0W4tPGuCy7ORsy0yCvxSrdtbpIwHWpX3fHEQtMuEUF1ruz40DgAqcltZSGOQSTn1EGf53QG0IImDRZ/N9zJhCr3b2pNrvEBkRKggIkqB2yzPs8HL6FVUaAt8qGvzz3hl39OEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776663766; c=relaxed/simple;
	bh=HIvurB/n/tFI7yqID01qbIXpYoqAv/hfToFl24LhavM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kpnrIIMWGSwMAafy/h6KYdJunX1VRJhCITBmcbizHE/lwsnwiiP7QTzMsEhrmYDwgVDsKbAeFC6+B9rOhbGuC9O4iZfPKBC0OMClb1Jz9PaZnyjnfKcmoFsP4dJi+McJa6kUCqyusaEGMfO7Xh9f3+PGz/pkCI7h14a/DswlE5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ObTY2T4k; arc=fail smtp.client-ip=52.101.83.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sv/4jaL6YMllCGrFTZbbGxI4/vfhH9ac9x/T6hlexv5QL89hd0fIOrhWstaUOwjzKPQB8oQsXtEnXcJBv+ESXiqqAcEr/9CSgOcuA1tN5qzyoy8dmiECHh+gkM8mkUWMZELfkWGkizOV0s4/JnCpw8Ml+1oH9hEwi0K6VKTc6qY+w8LbGl5IukpYQbqisTx7SMrcQ4KGQczeJGz8NYi60cCOOiNvQ1NqvSLEcOFStQvAb405tbndb70tmqA4i1N87NVU9LkBxAlrWWXh//E9V44KqpB5ZjKxoa6Cw6xgOS9HXVLVqK7CpEa5iPgjkR8bhclR0a/gkp6ngI7/RgkhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/hJFDc/OXO+z1G1aFVdYtqUeTMvbhXCQaiOW6aQ2jU=;
 b=d46+bqK2YEyxPtqXGYe15HvqpM0IvrTZBbsGjorqozYDZEukMLR4uJDQT5/dOmwpX7iVk3TLzKLPZkIozgAglyXXGiOrZWUpdQrt6n9249sUkm/1uTY7o/ZhGBuE4KOUduZNgALqKlW/i9W8sg+VLd2uGg8F2rLujU2oxrq3RMmfA7sip8u1tgi8HQPfOtZDdqT22gcJlqmx9KrZu27NXdlxb8/aUPmutYnpZl0a5nlXyLMf7kjq4B8drsACMCTCgTy/DHq32Sc96qE/CxPBwalYlLY+E/4EdcjMX9BBzb04IA69FAO36kNIQ2MgIqQ2AlCVPr6w4CXHkWGwx5oC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/hJFDc/OXO+z1G1aFVdYtqUeTMvbhXCQaiOW6aQ2jU=;
 b=ObTY2T4kwSIf5diyCIQ4DKUnH8PQfKNMO1PhjnyCEUxtHm4s2A6w5Dj/g+3gD6Zc4ojSwgS4jPYng9NFJ62dIZaMWFEcHnjCGtv+w1HxC/lMOiPoSABYb2T7TquEjzKQNLEEkLRZ4oHpwh4KNEr5RW+yxySTrHvDNiKnRY2O0hCnLSxYQYK70nyy3O7SI7EpqRE7LdmXQmrU7oSwHz6fJNve6q4fRyRDPnKsRcn3zSzzgj9mrlu7xeC37cPK+x7z3Sp272a7/1RZRL4RnuU8Wj+0eCj/swpZq9LYYKTBQANqV2FH4Q6UQws4xhmdg2Y4mw+kxI4rkHhKsIeOmh3Uig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7447.eurprd04.prod.outlook.com (2603:10a6:10:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 05:42:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 05:42:41 +0000
Date: Mon, 20 Apr 2026 01:42:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/5] media: synopsys: Add support for multiple streams
Message-ID: <aeW8y9-Y-4yFKEZa@lizhi-Precision-Tower-5810>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-2-7d63f3508719@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-csi2_imx95-v1-2-7d63f3508719@oss.nxp.com>
X-ClientProxiedBy: SA1P222CA0125.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efd2e80-d64b-4ee9-5881-08de9e9fa354
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 IF1rZsg5cVaDgHWWdiZzDsM1LZWhstxp1P4jLQhmDP1E4KBEp5peGLxnxk367Y2KzjtuckMRwO4ivDsFSpb47DlPF/zHbYAyDHiQj0nHsAPNX1F/eFCJMLihTb1c/6sZ+hOKMoh8nVWsZOibkoI8Rq7LGU2JEx73QFW3bngd3ml5Lvx5OAiQY60G77LJpZzlrFwEDTaVk/YSrCaHcY7bhjuDs/8/OVabV3p7LF+EYXk7UbgIlxs07VeeTk7h6mvy2HuNd9C8aQc1A83Aw+820SbNIgoGjbdQV4o3pOYoTIV5h6qBczpaH878UC4h1O02Ohh2MgyJFhSh0Xhuk1l2vWMW/dhRmGeRJd+mEAHtbrJ7Pqp3edPqoxnBD0q+/z9aTE4cs9Ndf0eKUpaCEg9Z6ODAcWLW+BmdcNsR6dWxfhzctxVlms1AaGr2zyrKcwWGn6oKmeccnz9RLcoos2KAfR9ATsZN4zPzC0hL1VuF0tIhVrubN56eQAvCi05SdxL9xkDF5+Xk9vErdw7YLGYxqb3g5CZdk/DpGPYQz3mmXbKaRcZwUUCjQqM0iMvKxUIcmGMwzpHfUJlDYzWKB9AsMyE9QaIJO6Wkc4NN1wXE8QYB4cAOfX9QMp886ZwurJfVZnaLSwGzA2zHKZIPzn41hhPVo5zjnfhhZ3GjGFcSEeT/EvrwRQMd7LzCE7jGljEBug+ZAJ0qiLUmo1C5XXbyYexxNScVVtVH+eeEnOnOlZE8vgc8L39LiUs0O4aXjBZQE5FqgIBc3XXBW8BB6KpzHrad7X9ULsIg8WLLYT0rglo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?fv081oeamM5EdWwjZ0cDObSB7B7BRZjhQUpxFXNGwr7AR3gQ6xfwI9vEEsGt?=
 =?us-ascii?Q?yfLZ7Dy76Pc+QEWoYn5IGmojD07jVU0lrRyrhgBsTYhfceTjJ4kihiJ2nEtY?=
 =?us-ascii?Q?y7CFwk1NELH/8YS6m23kA9V6BV1rD+YKHcMWZhJcz66z+4TGZNxUvq3WJltb?=
 =?us-ascii?Q?LqlqRhREQsLtjhOh4NnURwLOcLCv5ofbhhnBUSyPK8F2QS19tF+pinNvlb59?=
 =?us-ascii?Q?4KEPM0PT/4qoKCJXSZtZ3KDm31qqIEbHNUE5+U3onUF+aAqW/FMqneZbpQrw?=
 =?us-ascii?Q?Vk5cl+EkHrOA11j9nmMiCHfgDWeq4VBzIq1hDaEzWVcbN8JQh0zjO7qp5Xaf?=
 =?us-ascii?Q?VgwKng7FrKuCmIjq3kDBqTP8GbCRVmaLeJR7Didg/y11xXROCl6hF1n92hpP?=
 =?us-ascii?Q?l4f8rlWcIgtNE2xdQBCfuD550BRX1+au1pVltvA+Q3bWMzNkRVFF3PLBOx3+?=
 =?us-ascii?Q?RfY0Imka8stAodsZZOkuSo/HV4/zs3H9XNzyjYWSXYhUoBJ9JIOT5v7b0MkS?=
 =?us-ascii?Q?C/Jh4h3ez7T7/AC3WoviTCqZpj63jlu/MmMytlU06OPvVrBUbIsjSaknElop?=
 =?us-ascii?Q?xIIoU0tkGb63+FctG98mHxjJDLIFBWHE/JWR+RdIDDY8tq8ew7zt+hsR8n2j?=
 =?us-ascii?Q?ZCOlGHUyM3s1FFgbF4nqQ+r7KkLgszvjCHlrv+pzsJoa1DLBfka/P5INEJoS?=
 =?us-ascii?Q?ho6iZYXyihedrD74m4VTAyy+dwzQvbdhCfh3oNSg8x8i9Nfsg1Grkp9lOFhl?=
 =?us-ascii?Q?oqOliCj8sQbX7T92l1l2OsCRGFcXArr2iVwQWTatXl0xA5FUxGTIUth79M+9?=
 =?us-ascii?Q?ZSQyeGC+dRnPDoRNkR+AWRLXqeWfliPV24wo35A8fg0C8XCYM+QbnBa5wEwe?=
 =?us-ascii?Q?TFcM/yrlu1MFrajqwr4XCwB43qr8bRLCvJUw3udh+v9Fij1w9dGCCt2AYn7K?=
 =?us-ascii?Q?NMWrp4HuOsa17rTaHHRDZJdQnWryKcoxm5RxImJlJpEavzxL3AxeCudFMm1M?=
 =?us-ascii?Q?CNIguTOwhU1K02kF6TEaWzlbJha5EVNmzrsfDj6LB80+6sNZ0fxFtC4fzZkb?=
 =?us-ascii?Q?rFsdbOZIm64XDuKMGTdIoQqfwVyGcrFG3mtPzfI5zobMMcRY4Wp3dPuQCMA3?=
 =?us-ascii?Q?eCKOFf+npV/mLDVzF3suINcx+AO00U6NCF7L/DVNnjx7DvMlZET86sQHv7Uk?=
 =?us-ascii?Q?aFb9uEw8M7tjsG/PzD1omj39XuPNaNg3X14fvbDE6nKZfG8rzRIu5Cnmw6Mi?=
 =?us-ascii?Q?y8eJE1qlH3JscyTYtkL1urVcgUbJGHt8aiM/L1ktiubf++MB82viVNt1Nwjn?=
 =?us-ascii?Q?DwHittvDAZ16bTmPVE/drRs1W47F8mErbjVz5ewugn4cutmjT0LrBXOiz3ix?=
 =?us-ascii?Q?9aKPbby4PO9heUHoa8EcGZcBgLJ8/DIr4chdHQpBFKUiWrfX2xsHWLwJsCA3?=
 =?us-ascii?Q?XRXa0EdL1cgSPUuChbKYiYXG/eiezQu9KYJ/qvinVIZ9S/O6iKpsU+pjSwMq?=
 =?us-ascii?Q?FGR2ppKKuL078bfXXFphu009qA2lJuMyX6MYw1ik7NG41i+IGpeDTmiEOofe?=
 =?us-ascii?Q?xM9v5rR01ODFXY0Q45OZ6yvOuwLV3PF7tHQxT78Bcw69+F+eAdpaxKO1Nwws?=
 =?us-ascii?Q?2NwLtnV73tbfj/Fe/RgIZruPM+LXAY5AXlKLwvFF3Q6gnvCSXUaf6GOPmwBm?=
 =?us-ascii?Q?juP2lwNQ5pePif1L1RIFiLv8tmMhC9ME0wMVCsL87LRyzweo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efd2e80-d64b-4ee9-5881-08de9e9fa354
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 05:42:41.3646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 310qd3gZJruAgEaTIFAuNywHrEvzVPjHe4fe22VLfYfGBtN9UQuJXKQ7KnL37rqwO78QOFML1RpFZ3yOdUhixA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7447
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59114-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B03EF426E6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:46:53AM +0800, Guoniu Zhou wrote:
> The current driver only supports single stream operation. Add support
> for multiple concurrent streams by tracking enabled streams with a
> bitmask and only initializing the hardware once for the first stream.
>
> This enables use cases such as surround view systems where multiple
> camera streams need to be processed simultaneously through the same
> CSI-2 receiver interface.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 45 ++++++++++++++----------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 46e2a4315ac2..85a2a95bf080 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -113,6 +113,7 @@ struct dw_mipi_csi2rx_device {
>
>  	enum v4l2_mbus_type bus_type;
>  	u32 lanes_num;
> +	u64 enabled_streams;
>
>  	const struct dw_mipi_csi2rx_drvdata *drvdata;
>  };
> @@ -528,28 +529,31 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
>  					       DW_MIPI_CSI2RX_PAD_SRC,
>  					       &streams_mask);
>

It maybe simpler

	u64 enabled_streams = csi2->enabled_streams;

	csi2->enabled_streams |= streams_mask;

	if (!enabled_stream)
		return 0;


....

err:
	si2->enabled_streams &= ~streams_mask;


Frank

> -	ret = pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		goto err;
> +	if (!csi2->enabled_streams) {
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
>
> -	ret = dw_mipi_csi2rx_start(csi2);
> -	if (ret) {
> -		dev_err(dev, "failed to enable CSI hardware\n");
> -		goto err_pm_runtime_put;
> +		ret = dw_mipi_csi2rx_start(csi2);
> +		if (ret) {
> +			pm_runtime_put(dev);
> +			dev_err(dev, "failed to enable CSI hardware\n");
> +			return ret;
> +		}
>  	}
>
>  	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
> -	if (ret)
> -		goto err_csi_stop;
> +	if (ret) {
> +		if (!csi2->enabled_streams) {
> +			dw_mipi_csi2rx_stop(csi2);
> +			pm_runtime_put(dev);
> +		}
> +		return ret;
> +	}
>
> -	return 0;
> +	csi2->enabled_streams |= streams_mask;
>
> -err_csi_stop:
> -	dw_mipi_csi2rx_stop(csi2);
> -err_pm_runtime_put:
> -	pm_runtime_put(dev);
> -err:
> -	return ret;
> +	return 0;
>  }
>
>  static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
> @@ -572,10 +576,15 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  					       &streams_mask);
>
>  	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> +	if (ret)
> +		dev_err(dev, "failed to disable streams on remote subdev: %d\n", ret);
>
> -	dw_mipi_csi2rx_stop(csi2);
> +	csi2->enabled_streams &= ~streams_mask;
>
> -	pm_runtime_put(dev);
> +	if (!csi2->enabled_streams) {
> +		dw_mipi_csi2rx_stop(csi2);
> +		pm_runtime_put(dev);
> +	}
>
>  	return ret;
>  }
>
> --
> 2.34.1
>

