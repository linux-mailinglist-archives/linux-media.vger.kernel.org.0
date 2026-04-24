Return-Path: <linux-media+bounces-59468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Mo1KLrq6mmKFgAAu9opvQ
	(envelope-from <linux-media+bounces-59468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:59:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E56459908
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 415F63013EC8
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 03:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9AC319860;
	Fri, 24 Apr 2026 03:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GuTryqtD"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CDA2F619D;
	Fri, 24 Apr 2026 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777003181; cv=fail; b=lAQZPJW3Du1HM1ob3Q/eRyXl4ySubbrHx3o7QyGqUy03WgwbodSlwxyir1IlSwfQR8iQDfsFEFuFPpCFj13bggaCJVVy2gUJG+/NCEOMBmoCL4vI7SlHVPeKyckWctwRsS5YhmBx91ZQQNdMQYqmlJ4XaQKjoj4w1uoy1Rv+G2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777003181; c=relaxed/simple;
	bh=r0X6Plz+hk3+KRR0DjW+dnPd8tth8OYI74BwxWnOubQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tRJ28OzLaR3z7c1umUFynC1oGxcphNhRnLFwKCCfDm1v6mGcUu069KvSiLE/Tx+mo8dzvX8F8kAEzI4/N/emx49P1hutjfeTW+CVqeuUG5zsIwfeLdb1pxv+PWhDgOPMcgt5aLDS6CSa2vqNQWhbi+ip/f/0MYAkdCK99rTMK7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GuTryqtD; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzcfJB30kvDepdklOfras4GZCq1kwFjnyPgpEcvWH0Q5xla0+2MWeIGLcU+0rPhJ1F1pZ0zDXEbvPO9aN6Suqs5OgW6OLq51KgES3uQWvPrcGn/L3ArcycLcLMG7v+05QOiT7SbwWAyJNeDpZ6RKdVMv1D0uReJ+W435a0HjJBZmogiNlpHDQmPz5cm2T/qgOPw69i2ll+zmNZNZZp/odiMcJrytXXdthXKOkx+b60YPhkQsP6oF6+K1yILOJ2RitgVppALaJ6phHVwnIhRQbTuTQplM+j9Sh/qpsWfr5DlU6vLS7AGy1kWzYYm/sCBE6PHo+WpyiSvU9qyK/MxzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04/d+iall2u6+IHTYz3gVhKoBWIgWO4doXzyid3WuX4=;
 b=KWMB1sMG5/s+MUK7TvlJ3fpD9ezUdBQqv+RXJ/e9QsSO6FjBh+kg4orz749zawkKbO5oFE9uW1k6FFgHhJ9+aWGmW+ep/wVXIT4epNLaah8SIdk+15IoLU/dWWfdrrGF1aYEeHmI+deN39v9GzuWljd/ubL89SW9swCoDKSw2rqWY04S2lKH7yu0n5plWpZoacdPIbVTyM15winbybO2HMchJxGzlQL9M2GzOwDR835/SPKMyGAH0BHXD9cU1MDCGZnFq3ZeLNQoEdDVJtzGr4ooUdjQcve1zDKR95pemYhZ121B2UCCymMKmAHovw4X+995tHmYJWjMpLY3vjHwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/d+iall2u6+IHTYz3gVhKoBWIgWO4doXzyid3WuX4=;
 b=GuTryqtDg47QmraNMW9FMrl1Am4Uc0Wr6B6gQ8xXqChm3lLrGyLK3NPk/lklQtyJ0scFurqF9gEZ8oY2JclFfzKCJ4mqiRLeMSMtkva2cgRRawUK4tgFBTf8sb2WSG7m/wErEJIS/2XFDsc0l0EFGjHGi3P5tZ3+nXXkbGv0ZxbTs/klOzYJSYalwMc3JT8nKOVPDf2zkJj9ilTSVMvj6e7ggppjKsx+u8gAHSgj8HK5z70bfdwjgvxR0A7KBtVNs0ocCgWmT4KSflECugBXux5hYMM+Um18S5fR9wdRViM+aVghUA/I4cUeO97TzJI2lTMSQ4p4FobSqdwp5MZW4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 03:59:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 03:59:36 +0000
Date: Thu, 23 Apr 2026 23:59:29 -0400
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
Subject: Re: [PATCH v2 3/7] media: synopsys: Add support for RAW16 Bayer
 formats
Message-ID: <aerqod2RukDF8if6@lizhi-Precision-Tower-5810>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
 <20260423-csi2_imx95-v2-3-934c02f3422a@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-csi2_imx95-v2-3-934c02f3422a@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:806:d3::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d55d4e-a887-42dc-c2c0-08dea1b5e6c0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 6OueplkZbkfgO+Zr37VpfbpBWRtYqQEgLT5qURZ3pI8iwHo+j1LsPiO4OlsbM+jMYSwcyOkvdz+qJrz3dvzT+0HGQQL838uPYQGI+lOmRNOEF/iahiuc7AbDcSPD2Um4yahYMD8w9yaHj3eXByeM/+NCsjXCpdAISs1cMtAx2Ua5VJm/FcnyViAs8lMTf0q07nMzhQR3y01YgN52KzXFudCF9dWeNDMUUg01UJeoXtet2ihMCpzW1++fPGQpOqmy98InD6gKnoKG9q4xhruTm84EI3A/s8oLLpJIrDggwQH67l7ZOgS4/jWouJ7L+qs0BTKDSHeUS6WxW+8ydb/WDpk6yXV2xE9URs6W2BLy7t0/MKiXilN3DhrvZWD1GvXKbb0eq2O/0qc18bfFO2pmQlJk8eoDaV0QtPU65pjlcPzJBSuCMdq5V8Xe//nNHwlhVfccfjr5/ysqSlAEFBMXhqDTVQXQfLK9o6wGiFjj/rsUmH1Gq+eW6qBxxzRLO51eYLGnGZz64pqySIOMQpWoSJpj6eVeA0YlfVqZzIS5Wnu+xcWiysTRqSKe5NIBLqmMQJMbDQ82nT6CIWXjZUar1qPMz1tyBslgiFfPBLd1mUlayVqY2RITYdHmCIIGkUE/ce0/nzDe5Byea2aqzJKXmSvqH6NLEHU0ZfUqWRphDywfqTwoRc6Q92N2mrfuqt7Ou3/fLGY0c/gPJT2EBG8yNb0vchna3VzIvt2kNgIlkdI12aF8Nx7MprcjL7u/3E423XpNNiAnpZWSg4iuBfqx7Gcvtk5YCO8c2p+c6j1/7YM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?P0OWsLjnrgWe51Pn6FQ5vnCvVvJBVl/yj6PJpY7UX/JVqJ3141j4ivHepRdd?=
 =?us-ascii?Q?Z/zXERI01G8pnpPX1kY60YEmxJncgWcAQ1P28PC2mE2xKjpu3kcawvHhDrND?=
 =?us-ascii?Q?QgnDumx1w01yaeMZRd7wLIdyab8qlSlTnNOONFq4+iovhM9ZxrCvcvPT8lRy?=
 =?us-ascii?Q?R0QFiagT+ZPsL7ZCAs93h9rKRAzriut0CY27iMl/WoALVzhAdPKgSiTE1x2G?=
 =?us-ascii?Q?fttdBD0hKGwZU5WkgCVf192bxVC5PdAAAXMm4MdSEor6ZLwrDU+xro5ca+Jg?=
 =?us-ascii?Q?r6LrhN7Mg9UeHV0BKNjZ8dL8ZhqlDhKwZQ0jst6dHUUTCzpFPvQvqjX7OmFg?=
 =?us-ascii?Q?/G1pY2YR9BbtReaUG1Sz9LOTEToahV3/h4Ow/nbYcoul3FwQCTz1vjKyoKeL?=
 =?us-ascii?Q?z4N3Pixs3Aw95EnHxsYh+n+tNq12l7akrAwZ3v1mlCA17/bcPdROE/QbJkgg?=
 =?us-ascii?Q?EhxyiYe3hRClBspFb7SY+DomXAG+FlcJmHQ95R4SibQsx3gzEiTUU1pWg4Ga?=
 =?us-ascii?Q?fSgbEvXgqoznzC8FcnCdu/S6lLuPBi7rZijY7kUFfjtm/BjfW99JwRM9esfm?=
 =?us-ascii?Q?kqJGBIkwncJZt8YO4aat5QW7aVauZW01euMHlxZKhG5FbsILuXoS5ngz8Ojl?=
 =?us-ascii?Q?MksOG8Oxc5d0RpbXKO98md33KSxfLN7cQz/F1mq+o8B4PgXS//1VPixbO4Mp?=
 =?us-ascii?Q?8GTeoxv9nAZZetJJlPUsiH0U6lCFzDiPFT/a9Qim5EPF/LOoQY+/oaElWpIN?=
 =?us-ascii?Q?pzIDQeX4UWJxzMvVCF38k/E46wy3WtJjZ23zfNfTuKykwyIZqua8nZQzF8ry?=
 =?us-ascii?Q?xUgm26yAEXg4jJIKr8a4mpYle1c4ZBxgH+co1eFhsPpLac8RPySmkuj9Rkwt?=
 =?us-ascii?Q?7hYODVVP72z4OUShRrr3jf0zNT1hnQSEdFlsNtGOQoOTuumwBRdKysyPs75D?=
 =?us-ascii?Q?gPCYgVJgRZ0RAWFHmGDsNBrz54sorOoYWlXyt1mJovAAd9uxPPrO5I3AopRN?=
 =?us-ascii?Q?gsGYtbm1ydCiyzBo8x8hfgE5F+g+/cRNC81FmF+8HQSDxJcOtl0abU6Vtd9b?=
 =?us-ascii?Q?4KYZN1Rh8FlgI08uAz7TryEBaPcbP9Mc0L5uEj5BNRrJJe0PhZ6lfWcCnW1Y?=
 =?us-ascii?Q?Auuj1kV2ZnqoiWebd8v0wR1Xsr/49E+0S6JN/dE2xHyJvPIIO8iLq8saMggM?=
 =?us-ascii?Q?HKhkME/7Ht07Z++i6BEysfCn7kqHKgT8XvT+mP+BCU6f5dP8t6OcmbeZNyJy?=
 =?us-ascii?Q?dd4Ef+S1HUCJfIoeJTnHJN8I5onMgVL/W6k0om9NxE3ndPVYHKM2KpTrLwO1?=
 =?us-ascii?Q?7xdH6AcIuRFe5/nJaQVjrZAxaApxvfINUOI/gmUWkAr/w5nbBzQ2o9bVJGfc?=
 =?us-ascii?Q?sQ14x3jtCkafxej/4ApyDUqxSEhHF2zOTiGQRmerrgVcPPK0Pkjcu2zdWelv?=
 =?us-ascii?Q?HanGe1clBlu11++RTBLNb+tXvyrmPtNf4KHB2CMI8ht0tInf3ZqGqHxOOTHG?=
 =?us-ascii?Q?GCJLW2fJvQZHzvB0Xv5ta9GVgbY+2KirevV1zZumKzBle0UXclKgMEUOH4fd?=
 =?us-ascii?Q?poqiPme2zu6/i+bj3iW6yn0rmuNDpS/tGwNkT2vkiZtF6dRVBKOYKCtuKJ/g?=
 =?us-ascii?Q?oxOfA3iPp3TCX4lsD6HjZcLES6dAHqzh2hVg8khuDP5jpcKv9vwm5X6o1pLV?=
 =?us-ascii?Q?o5IUBCqqNB8pviNWdoMEwO0MPxy1gH9ixuzGgKwEPwc17YV3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d55d4e-a887-42dc-c2c0-08dea1b5e6c0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 03:59:36.7905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFZ7ZZ2WD1Do5J8juVsFK3D1hU0lSmhn3W2/xquzz23zuLDJu1AmjJLu9vYhqkwc/z431rhpfiZfTK3xH+CEzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906
X-Rspamd-Queue-Id: 24E56459908
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59468-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu, Apr 23, 2026 at 04:22:58PM +0800, Guoniu Zhou wrote:
> Add higher bit-depth raw image data support for the sensors, which supports
> 16-bit output.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Changes in v2:
> - Update commit message
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index b3f90da8b43c..d572d2eb3bcb 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -252,6 +252,26 @@ static const struct dw_mipi_csi2rx_format formats[] = {
>  		.depth = 12,
>  		.csi_dt = MIPI_CSI2_DT_RAW12,
>  	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_RAW16,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_RAW16,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_RAW16,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_RAW16,
> +	},
>  };
>
>  static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
>
> --
> 2.34.1
>

