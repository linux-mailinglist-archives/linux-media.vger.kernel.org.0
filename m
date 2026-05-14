Return-Path: <linux-media+bounces-61563-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLAYLrFIBWpDUAIAu9opvQ
	(envelope-from <linux-media+bounces-61563-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 05:59:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE9D53D7AA
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 05:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54D7D30335BF
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 03:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B47B3AE712;
	Thu, 14 May 2026 03:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="abuOLfdz"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011018.outbound.protection.outlook.com [40.107.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11453A9624
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731125; cv=fail; b=K9n7Bc0HkNFM0M4cLq25VETQLuyhf0JZOEoLf4LejYHDynQ/BE5nKmzVNhvegGAcjtlbbI4zo2Q1+Yxc8M88hHqSmRQxjmDPvi9BHebphGMr/W3WLwEZUUMIWKk6p/snT2LGjoT0zFScDRbX4vt+gVMSvJZoRxsk4R1cHowdsZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731125; c=relaxed/simple;
	bh=vlft7yAMfTFRJ8u56FKY4/stQImk/T8N7J1K2/CB4/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kn4asNocloxt9iDJRtE5g33xZUV3TRo1VAo8nyp4TxUZ4AmLj5apFItRin1RinxOY2s0n8aQ9RltkiPQYOOi4/0zmtIWBlbTha+8JSdWwWSdFve/eJ1Df5tbyNvN/mjRDZgG27iA8j9Q1RxD1j+C+MU/ZjeQllz39IHzfYrwChc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=abuOLfdz; arc=fail smtp.client-ip=40.107.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pm9rmwmYvN3ysrxU5jeoP4UKauueJGHeDFSmHiE8qXV4bQX5WivdLCz7sor+kPeZfnaa/KsgOM2oHuctN3JKzAgQmzlf6zuBBu//wS//epBzqHk5+fjWtZ7Zy2LZ6F97KT7kdQDHdLhQ0GbEaZ2bj/9CN4YVqTtYoFImrczHRreM0qgR/bpPZ4conTqOQ8tD/q1z4VGNRLI9A40+Vv4PhZ5xNhHf6Tug0qWcvArTjHD0dOIKYOwj3oYdehF5EXcOw3gWs9mpFkhggCMi9WAavkDXyeFd3B3pNO+e7n7sxE74Pz/I1KMMbBi26sSZqoZoSFkUtlI9aOhNGz+KHFUH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ6Zw223eWcWl4iwU1x3lQdxicxfvnz7WDdDBIJrb1Q=;
 b=Pci7cw7Wvh2oMxfpBrDgjYA1PW5iwPaRrFpEDj/xbovZFEp9dNoORgNy+0eaDoUoy8oqXfZ6KoSAw96q7GjC36riU3d6+mz8blDqOn5yG4CeLKZe4NL8H0Y5RXWfFykPa59fl3q6W7RKuLgr2f39/CYZ0ke6DoXogdnVjr1pR332By7xGcXTMlRPQOx/7E8BUS1Kx0M9RFJoRzCkgoO5QTZsfrHeZWv+j/N8yGNsGrhhoS3x1tiPP8OILCfQoyJZYy2Ui3sCvWOwULqRRK6dQuu8Imv47OZPvVkqOcaaKJRjREQPMjlJeB/Id2rolDM8T1RUFqH57LPydh7P5PVFGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ6Zw223eWcWl4iwU1x3lQdxicxfvnz7WDdDBIJrb1Q=;
 b=abuOLfdzS0T0Er4/ByUvePlaWmoURXrITrYLGWhMTLZawk8RMmJ7+xHu/gY+OUnsAaEIKRQ7+MIpqJlIjMBiHtgUt0E5OzhC36wllZmrCWG4kAzL8cm+olU6Nmokx3GQzlpiPphhW0ywjfHAKBoPWVuUpDr0k6pqaYqFYY0eyt/A7lz/ihuPyIeqjY9CVs+gkaszzDu9eTsR0Tn5KDVQwmmCZ6ohHAJQUyLTWMpSZOgPGdZ/OoRldmrRZRvpQic3lKSDkQ2fgfbRd9Wqk2CRrCjgAx7lGHOVmVbpgl9/fDiG8ppTSowXpYG9ik7qRP45dThKOFxVEY7wxW3Vk8SgOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11506.eurprd04.prod.outlook.com (2603:10a6:102:4df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 03:58:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 03:58:40 +0000
Date: Wed, 13 May 2026 23:58:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 10/17] media: nxp: imx8-isi: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <agVIaYwnJpUN7KLc@lizhi-Precision-Tower-5810>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513104358.2252605-11-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH1PEPF000132F4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::39) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11506:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a87744-3d39-44c5-2d2f-08deb16d1539
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014|22082099003|18002099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
 T2YKpBNUFmGE3cOc3OMw3gOM3jaou2mja7JICaVseVT8VQfHZEhLIVCUwkKSauV4FqPmm5yxQvgix+aG28jN0DempkKSJliGWtEOqhckhBX4FhvxiM/BABSVXkrioIeOWFxs8v5732GVjWV1R0jPB5gmMVrcT32ElzpvHUFXa7Fs00XDRSLMh0TaB0cxx9x+NfQIVtO1EpSnmUe2QEdnY9O/Ums+5VBVeZ+iTDPvcGlp7WnKuWIuI616BdgMhVZ3tMekSyr1NHUPqx9KcmXvXIs97sP0SZBO1TMzC+wvGbg2rIhEyFWgr/x95AJgX91nB5r112qU83DkmoPKf4Q7F8z0RMYGhh+4xJos1vm2vK9g+htO/pKf6zwrGlc30ds5TWkOK9V7WJNCcjiIauocIcTb5L313fUIsbBvAoBdXob3engYAzuehwBpL2aEhjHEQM9/CKx9fq52QMs27g9lLtj3en1Hkf93x0v3DfhMcdkCPI0A4YFIKklkiXoU7vSMkabGIuQpK8ohJuftuNtUDt+2tMmtlAb9JOn+TM2tUI0U9z98hNLOXK5Khc2YOzo8yWwPhrm/nVgGq/ra6NSc2fdsMw6itvI3cu+LzG/KC9rmjykyfn+vG6fz/quNBxOvFZ5dDo//eg3D3Q++4tWKZB9xGBce/C6XxqU3cEZEUuFowwXWlqPzqnc0YnJMvPy8JDpI8rS8RlMd/ChdCjbAJY1KxwzYDEyKYyNJXBSu4no9M41yRIFqQenNBeaYWQqq
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?c8i0z0sxPYCcwaRkSrxjmzqQtC+i9EAeZRtafRD8W/V/rtojihZ9sxeZQ9T1?=
 =?us-ascii?Q?U1hKRLXVEFETEV/W62XcUg4xXjPwYJVzsRL7RuN7CE6CFsL3i2lH15c/XrDb?=
 =?us-ascii?Q?GDzSjIEzgjq20lt9vsmmUz+HYXGiboy7xa2J8NnM3feFY0efTbug0qBqBjPD?=
 =?us-ascii?Q?C3zUuY9XBGm4KdVEDlli5xNMA2IGsx6sT5sGNktc9f1ozb1Tn1F2T2IMoJ2U?=
 =?us-ascii?Q?P0pNDfj+rZGEeecppYLMsv8Ic5I27ogdczYuBZsgce2Vgz7w28z18Y7cV43z?=
 =?us-ascii?Q?9DTq6NCh8lB+1JRvPFeD2ILSilaa9sWGcf98hOuTxMx5VZO0IRzO27J0j2ex?=
 =?us-ascii?Q?7J9ixNOzWU9QylpJd3xx24+RWzvZxzsU8FHosrE+AbAPtrjepYKPP0gx6qyM?=
 =?us-ascii?Q?jhzfot0Tr3LYZDoc11dmMsEdO62jwlm3pL6FqTz2LEq058GX+0QoFWpDvBxv?=
 =?us-ascii?Q?wDv29HCrufg+kKFSG7c/0JuW0ps7HsOZI4496rGFZ99wxMk2CKN6yAvXCxal?=
 =?us-ascii?Q?qCqvnQeJJlgOpCG6+ZqyJFv6VVsC+MEPSFA+7c94eDJQBjU690cVUluL3mA4?=
 =?us-ascii?Q?8aKsmYJ+sG+M7/e4CuK7+mnKr6R85W8gJ8jWm61Kqop0KKJg2oixXh7Qqkqq?=
 =?us-ascii?Q?COvzGRtnlSTsyYD3I4jsytPGJ4tc86XkE+hvoFh4l1ei9C2+nq5AwzXnhaJ1?=
 =?us-ascii?Q?Ojs/tPj83bs+jdqYTwOWYNefqgTUhhwG1WlPW/VPUFqJ6eA0zX4Igz2Txpmo?=
 =?us-ascii?Q?dGQz75SDQiPXS0xvth2kj4vb7KOm+MlO2P0KPrOplPIJAD1LMJLWpdmTRR+5?=
 =?us-ascii?Q?s0+mReTeoZlfP5eOn+M3r7x/8dVpOlek3NsybkIySfp/LgCQWOv6HVf95riG?=
 =?us-ascii?Q?C64F0PmuojPFE9GQu3ZuDW8BxaUs4cnbP3k1xS4LYOy9SaNt2yv/7H1JHI+n?=
 =?us-ascii?Q?yxIz36qd5JwfSzt1nMwEQaAVqGgWNMIuNvgUf/5F0TgADHYH6b4BWppbxxH7?=
 =?us-ascii?Q?8YrPXeeSXPa6xgJOtfeciABZpzDYtU8c8+xPecnmbL9KCNkO8pfth2hBQ078?=
 =?us-ascii?Q?ExBb8w0rBul+Ci746+ha0vr8OXX2VeYuLdvFFAMyybhgcO8b07rFL7vFSGLl?=
 =?us-ascii?Q?g6ittCjw4dHCvz8aEtHw9wh6Q1yHEuwUat5Y9ztAovrgshQ6dyzVHV4V3cyF?=
 =?us-ascii?Q?yw+4WKzO94gVf0Naesc0khD1wsgiQ7ZIfkd+72p0a4ROLVC/JkCF+2YQSOGa?=
 =?us-ascii?Q?Ta9caO+LPyb3ueGrNZsAQ2UabOEifJtqrnT5vZcMlqGxH2UIxaFlRvrIgF4x?=
 =?us-ascii?Q?S+SMagTU35MEFIIBAs6U0GOvBlCCNpXP82izkmlqqPlVQ8/MyySeyWyjls9M?=
 =?us-ascii?Q?fPmt6a6tzXs4sjWCVGCO9JGtRK8df0tRp8BBsVK/4BiKwb/iShu8QZ+fUfCu?=
 =?us-ascii?Q?K3W+lI0zbt2uGN794rzA/Vckiato6T+yjBcKZXUnlKI01YwUx84DXZpOZBBW?=
 =?us-ascii?Q?LXHsSukf2FTEyiwhAtr3/kMrQPYUpG2ffYnsXex3CqV9w1AO4N2TqWx6crC6?=
 =?us-ascii?Q?2y/X8jmuOmjEzaTNBaSc+QRbRSvLxZT+QHxb0AsUSB4RB+Ub2RzyDdKU2gaN?=
 =?us-ascii?Q?SyXaKkDMC9AOmuSkg2iOcz3uD+z4V3GNdIkEI6/tiwMTQiEf3t28NN7Z1dXd?=
 =?us-ascii?Q?GoAh/6R66+r/ryvCvJdPTYGITKzPkOIm9s9G3WLHoeXKtpm5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a87744-3d39-44c5-2d2f-08deb16d1539
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 03:58:40.0197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGj04IdH79DO4S4s2m1rVBIwF8lvGuklqw0ixH+om8aATJSJNG4w2l6dhLcuuqCuu+ppvz4LqHUWEOnFBN8JZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11506
X-Rspamd-Queue-Id: CFE9D53D7AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61563-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,nxp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:43:51PM +0300, Sakari Ailus wrote:
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c     | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 605a45124103..5bb536465c57 100644
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
> @@ -32,7 +33,8 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
>  	struct mxc_isi_dev *isi = xbar->isi;
>  	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
>  	const struct v4l2_mbus_framefmt *fmt;
> -	struct v4l2_mbus_frame_desc fd;
> +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> +		NULL;
>  	int ret;
>
>  	if (!gasket_ops)
> @@ -44,15 +46,16 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
>  	 * to match the configuration of the CSIS.
>  	 */
>
> -	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, remote_pad, &fd);
> +	fd = v4l2_subdev_get_fmame_desc(remote_sd, remote_pad,
> +					V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL);

cleanup.h perfer declear fd here

	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
		v4l2_subdev_get_fmame_desc()


>  	if (ret) {

	ret is not set

	if (IS_ERR(fd))

Frank
>  		dev_err(isi->dev,
>  			"failed to get frame descriptor from '%s':%u: %d\n",
> -			remote_sd->name, remote_pad, ret);
> -		return ret;
> +			remote_sd->name, remote_pad, PTR_ERR(ret));
> +		return PTR_ERR(ret);
>  	}
>
> -	if (fd.num_entries != 1) {
> +	if (fd->num_entries != 1) {
>  		dev_err(isi->dev, "invalid frame descriptor for '%s':%u\n",
>  			remote_sd->name, remote_pad);
>  		return -EINVAL;
> @@ -62,7 +65,7 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
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

