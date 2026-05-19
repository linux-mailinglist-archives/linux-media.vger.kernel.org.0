Return-Path: <linux-media+bounces-62194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHEIFoXmDGoopwUAu9opvQ
	(envelope-from <linux-media+bounces-62194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:39:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DA6585BD7
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD7843048925
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 22:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C91935203C;
	Tue, 19 May 2026 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N1Fn4NwU"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AD272622
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 22:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779230208; cv=fail; b=tZQT40yRcF9lJFzoCwq1RsvbYyQqza9iGuf/qQSAX0W3jOFo9l0DY188xTyPkMhwdtFfipgJ6YCgjnEHOsiFgF71xmt+qFo0fI9C/rRBU8Dpc3+la10PKjq3OQq17nK/Y6PEnSEgR0BJo/XkLrtIgJh1WRsU6bMk++k37ZC0ycY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779230208; c=relaxed/simple;
	bh=sELnYp485ySEGShiY14JkV+vCLUiQhQbryUX8ix+VDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dqw0zf28J4qPHPxRmLef06Vcd4xeI5BKR93n+mcQwvkBUE1e3r4Ss7P43Lm16YdG1qCLR8zMj7fo9V7xfSmNfJFMm6M9aLCwyfxhojX5Pr1QZTQwPF/G/yQ9z9xt9GKYxtN9EafilsK9h83oOogL5cd7EKBKAcLn0yAm6UD+jlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N1Fn4NwU; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKM+hQRuhf0GIzjmcoufhJdzfJUuPPytjNMtoLIFHR1Q/xyKRYhXOhA4TZesaRHKW55BYj0s8tbLGYfXQqvc41FArsp0gl9Qjzt6TYIJ2nE3OKvMNumb8qt5VuCw59cALHPANHHLFajLrpPC+YFDn8mlnqeBEoqMpA5m7gEJvXMyOFZuYbqAsj8UMU1g080UQPvZwzFunVSS4a3WsCBnKALTYlpf/aOzOQt5IJpdqJ723WLCS67mgoLNaveKDBurtCX0q7hhItqubFKVJhjmX7Xrjy6HxJqjniz0LadfI/bRAA+3HGnIphD+28rdajr5nnTyvOBTIeR5IfvYCNiF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+t6jFqxwdubwRHH4Hn9vyVruIDlGr6ohgEKbAB/ZDs=;
 b=YvnKostKwthpNgtdoG/DCsKmuLzkDtyn5QbhYBJsWhQwgOxNppCGdUKxxSCXpzaheXo3ZhstXiIqpzB2GwtNmWy6vkIdsZ1vCr4H6ysZlZ9O/jQrZydexFmxMT4QDNW9WiArtuiwENeebqNh0Eq1VIHB17x80TTDBT76XqDZHBL+xGtfKCcHF1lnEz0jXD+j4aOjJpBBM9a9kLR8qDspyYvlXM3pp6caP2LP0vrH5QfsJcB4gWk2d98rMMjH3jq4ZmXfz1S32yJk1iR9Ez8JASkIseNpZ6xNzpzcBqCdCjJPLd1NMPQrTw5GGkZP/cZSvZOoFWxMw1ddVAmc1A46DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+t6jFqxwdubwRHH4Hn9vyVruIDlGr6ohgEKbAB/ZDs=;
 b=N1Fn4NwUAVVNePLM/i8FD10UWHp16xrBFyDG7q61uVPc5wDlCqVELKuKkZbmfle5Cpkrg9b2Y8gzOGNh+kt7NAT9+ciUt1P4ESZz3Dx0njEBSKJWOQ7OWPdamsiViV3R/OpNJMGGe09OJ31KZPMbn8FKk7l/NuNv+NpN3ScTDb58fCfW5UaHDZjHEZtJOp53GNIBljc9JYi7O89HNFcJ6Uiy8uMclK1lOHud/soMyLL7Fo2OKEyKL7P56aE10C2FiaKkMwmtmeUXS5ij+MZmG4hruQBhb9xIiBkV5pN+DGcuO5dyMlX8+69v56UvJqvuV8Yg1yi4HgL3EU2TGKFzuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6928.eurprd04.prod.outlook.com (2603:10a6:803:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 22:36:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 22:36:42 +0000
Date: Tue, 19 May 2026 18:36:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 10/17] media: nxp: imx8-isi: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <agzl9f5OngheX1x_@lizhi-Precision-Tower-5810>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <20260518164318.3367888-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518164318.3367888-11-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SN7PR04CA0109.namprd04.prod.outlook.com
 (2603:10b6:806:122::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ceea9d6-20be-45ec-06b1-08deb5f719d2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|11063799006|38350700014|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 vn/j4ycRtuoy+5K1yZoHXlVMQ8iPtr86yYHorNHsAJ9xGj6PJX+C8P14Qd3UKW2ixk3MUwjx4mo0zEaPySwklIFyMEartuRdhtThkHd3aw10XNSvGl3IlZ9Zv39f6sozyVN/A4ktHzGYrWP7XxPyWJQNMF3U+XvnNBMJJkT/FkbhloiAywQZoUGbXXlI0aCDloPHpfjmeGvMgZqpEUTDPopZzqJoHsPvbhXR7odIgb8btKoX6sVxRUxVz1m8O8enAlT2WkqHp3AIajujzmNmYsXKzzgCkCdwfuD5e9vUmnomsYztY8kT1Pb+8to6J3fwu8H8WNnir2+JPcj7XgKZ+CT79X52iT+4U1mnFUfYsKSsmWsI0V6suV7g5CzQrEbz1K1xpjxri8IUzoGhgsrGbWGPzuzkwc5NnZTaENCgByS0mYCXr6YjHGCRGvmSbkOVFq5PHZ2CcIqqhRNIZVvaN+FDAbF63l5a1d51sjuB41ydmxz9iytR3YxThdEnrMLubBB9exA3/O6zHtMAO3NfzPufUuAkoX0keppMWaRa6C5Do+d5DrY+SkYW3rwBQhtzaNIHuD6k8OmkzrSnWde5VTc9wuHlVvsYHXiYIlPLnIkHEc1SfN1K3lOsyL1aeiB2Z6DqWJUwzEBWQtzU/4PjhTHTqmrozw4L8O+B4Bj378Wd2wqMwkhk3Q6F5T0j7F9EwkwMKQ44LyfYuiCir20UB4E0KRgrqtbES35X4NQqpoQwCVvjKY3ZNIn7b6niKZAd
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(11063799006)(38350700014)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1U9fxotb3Ydf6jH8vKpgqQOQ38AZSjjlV97bbs2WMH2G/0NzjC/dOJuhDwRj?=
 =?us-ascii?Q?2/hxgcNv1BGnZXJQEscsqtIaeqOpjbxvShQkFj8ENOSH3AB+NEA30IEDo1FX?=
 =?us-ascii?Q?lwmu6LlmEFMYOOGugyCyWSIJCmcAdOkgjZUjc6gFjMidMPyHlo4bFHhKtdaZ?=
 =?us-ascii?Q?/PV5bQO7Tijv/mJfZPeBgGQvtitKerZVDaQMESYkIY+36N4c2oYuYGPl0PHT?=
 =?us-ascii?Q?rLKhxhLZZCtpb3lZe21s2MRvJJ2si1qcG8MDMnVlfzvvQuNbFyEgk2SZ8F6A?=
 =?us-ascii?Q?DqwL9Kz7yKYMpFA+Jm3o2sPKkPdlw4p8dz+aBEtE1JTYoxuXDMfN39sKsUOl?=
 =?us-ascii?Q?G4qn7zWx14sjBRfNfYUzfypDgtvD0tMQSk9dUujb4y3XJN3mvxe39SOQBujX?=
 =?us-ascii?Q?VyVc/2CecSBB2CQ1JYY5Syim9DsjaM/7v8MdMpufPyIG6eyx63rX6RFPD/Ur?=
 =?us-ascii?Q?2HDBFiz5l+O1BMXJW/pUaTr4VOafAwy6W0tgVBNrTycp7pJLDvrsTOBVCssr?=
 =?us-ascii?Q?AFGX0OuY8TgB2NGRL72ED58CRGUYb7H9V3yIJbSALT1K8NCVD/X9XK4uPvMU?=
 =?us-ascii?Q?z09ig+XFFe3Vnxk1sDi5qEa3pmScf0mh3/310T2HZBS3rhb+b9W/RZqRylWf?=
 =?us-ascii?Q?GEvzzBlbR3m47xQMTSSCMWX/ksvshCI/YeT8YGGXzLCNguESttQ7wyEzRwqS?=
 =?us-ascii?Q?4RXYEQuyDeggadCfzntl8yAyPK22iiMXTDa3g0p8nOzY3g+3McBrSr4a26Da?=
 =?us-ascii?Q?mk2SnZJXTwGAHr+q65QPMKbntnZ4csoUnXo3iheifpvXFhjdiLouFaJJuLRm?=
 =?us-ascii?Q?eA90OjjrCUaD0NXLV4idjJcWE2zpQ+UT+e1A2fWOIexz9Lg4NRJp8N/GERR4?=
 =?us-ascii?Q?drHchovnJGPvgTIcyp2q5Q+fP6qXTZRaiNYE0rIKN8X+lNGksTOiGxBcItJ/?=
 =?us-ascii?Q?E7nC8RCAsd1eV8WYElh5SS/DddjzdIYKUJeIdbd5Lygiqj/71b4Drzdd1n+E?=
 =?us-ascii?Q?QrBiBOYCSCkl653i9Fx1Ib/vCidVYG8erCCknBqmNWzf762aBKxQJiGEc3oH?=
 =?us-ascii?Q?zBkp8ZXK1gnrD3SIQd8VAbfWzEcKIpECUpirydJjwI2k2h+uZQ4iEU1T/i48?=
 =?us-ascii?Q?+dc9JkrZa2X0/Kbq2k/EaJl6RTfB/DIW3n9I+2mkyYPhgFUbgILbC7aTOnZX?=
 =?us-ascii?Q?dW1TuaGB1lPjA5Hx4jyAZozuzFEsMNdzXi0Pl1CgfIiuLlYOGZFOZXcGv8gA?=
 =?us-ascii?Q?Z5qEPtQdg0alBtZVQD1df6qBzgyrt27y1GbMxU+LYzM4lF6t9dukRDpa3dbO?=
 =?us-ascii?Q?dMNTUaOoHVcKuQRTlw7dVjOwOJ9B0Squmczi/DKxxqXjoOIgE4Wrk2ecL+Gr?=
 =?us-ascii?Q?/cQDYH4kWhTrAj54ADFh7QfLAUJ/n6iWRYpqxqVpRCzOZzexdsoCJ+twbRpB?=
 =?us-ascii?Q?+uyd98MfuPwsiYhLYFPPWg2ezbdRUFbPbvlRqltkTDrV5nJLZHfnLaAKi5Z2?=
 =?us-ascii?Q?xYE05J9bjGBAjR+MZerppDLEYLQtNHHVAhD9X33uc8B/C+sHX8HpRbvQ9uuo?=
 =?us-ascii?Q?ax47z1gp+Kax42sFXRxLaauJ6HZsxZX+DgJALZvuNJchjfslnLzW/wWuo5lr?=
 =?us-ascii?Q?9TvA1/jqOPH+RmKjI4qtyJies/SZXMz8+dntSA1PkzX3DER+x+yO0u4wurnw?=
 =?us-ascii?Q?yiOJZTsO+u0q0jNe1fASrC7gZu9AOasYDXHFuvKkoauLOKMs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ceea9d6-20be-45ec-06b1-08deb5f719d2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 22:36:42.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3tp3ffheuxhvp+gRaHPTySsejtZZPRt+DwGRkW5I//tZNOjWHKovDCYUmIf61vABXRggYiZDkfTpVR3iRpRaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6928
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62194-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: A2DA6585BD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 07:43:10PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 605a45124103..545b2addc9ea 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
> @@ -32,8 +33,6 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
>  	struct mxc_isi_dev *isi = xbar->isi;
>  	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
>  	const struct v4l2_mbus_framefmt *fmt;
> -	struct v4l2_mbus_frame_desc fd;
> -	int ret;
>
>  	if (!gasket_ops)
>  		return 0;
> @@ -44,15 +43,17 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
>  	 * to match the configuration of the CSIS.
>  	 */
>
> -	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, remote_pad, &fd);
> -	if (ret) {
> +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> +		v4l2_subdev_get_frame_desc(remote_sd, remote_pad,
> +					   V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL);
> +	if (IS_ERR(fd)) {
>  		dev_err(isi->dev,
> -			"failed to get frame descriptor from '%s':%u: %d\n",
> -			remote_sd->name, remote_pad, ret);
> -		return ret;
> +			"failed to get frame descriptor from '%s':%u: %ld\n",
> +			remote_sd->name, remote_pad, PTR_ERR(fd));
> +		return PTR_ERR(fd);
>  	}
>
> -	if (fd.num_entries != 1) {
> +	if (fd->num_entries != 1) {
>  		dev_err(isi->dev, "invalid frame descriptor for '%s':%u\n",
>  			remote_sd->name, remote_pad);
>  		return -EINVAL;
> @@ -62,7 +63,7 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
>  	if (!fmt)
>  		return -EINVAL;
>
> -	gasket_ops->enable(isi, &fd, fmt, port);
> +	gasket_ops->enable(isi, fd, fmt, port);
>  	return 0;
>  }
>
> --
> 2.47.3
>

