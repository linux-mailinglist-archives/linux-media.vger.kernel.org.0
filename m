Return-Path: <linux-media+bounces-62193-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOv8DA7mDGoHpwUAu9opvQ
	(envelope-from <linux-media+bounces-62193-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:37:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8DB585B9F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A027D300E3F8
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 22:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB4036D9EE;
	Tue, 19 May 2026 22:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dNgzLPSS"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96F81B4F0A
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779230133; cv=fail; b=U+LR3ra0ubh+ImmAvdjJFfygw1/JzR8zyVvLjz3FttmVeblaLS7FMQoIwahpUjWNazlh7E58pgDxbgRwJLsOGisz6zqHpYefpG7Q8maj8KYTb2IV4cGnV1BdtYBretR39mPaGqBpeP0KDcsqW6NLECkCeAyLbUwaCvGDKzsWQJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779230133; c=relaxed/simple;
	bh=OOIXnnbX6AcdTAm6GiEpsbIy32KBnttKijd4pocvvQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uIN6ng921xhI+uqnJAZMiSae/XeIdt1699NITb7thPwt7yQCja22+3Jb2Ku6O/eISvc450mcvEn9VszHX8mEcSxDmhoiChCbBYd0kU0R6mqUKYyKy9HlyvbBG/CkMasFb+sZFs/+DHUGT0sOczIOhDfWiD4dh3SgGJ6wjJkpCOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dNgzLPSS; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fo8E1qq4GqeAzUqnX8IYFbHdJQQTpnZ06oWpFt3UImt1gVRS9GktVnJnUl3/1MDvLcSot6H1BN45giJ6Uz/Wu+7Klu1gIoWBN7C51SCUEfbV0qp63SjNCNXjMEcmkbImWgFhashRUSWWSjod6vRIcwpbN/hDoHOJ+Zhhj/PiCr2h/f9Vv480dAFMwD0D0cq0ifDES3X6jZIeYTak5PjSz22fqJyJHYhkiVccygPs+tLq+pjVjJzFYcWpyNxz3KgmG0AGZ3l421pPZnvgVFsh8WpZo78adMHY5TAuTa+BpDU5dmosRAEEa0vRZJSyPa5SViyCIZTt5XJraKkCSxMKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNg6q1Fz34lGBGAAxaKSATNiKdRy4jUrRKwE3dSmbqw=;
 b=tsLDQ/JbwQv6OPXevZstPKe6Shz+zju4OAQU1i/9cT9kUQPf+t8hbWNFeO53URV5AYSocr3q4oUqY6r6YwkISXEImVo/ifsGau8dvveapKwOm+R662Vqown1m5YKr32LLHjV1tYGLvz2ByzaqLkXSeqEiRHGXrwVEG9y+ZOkth9Z/Ql8tHlbS3DcDJ1MKrWlCFUol/cldbTB7u97d6aW5Rsdb6SVtjE2nQV3Gd7wi+xlNWg4g+Wbzi7UnFv4cuvbxtFfa8Zfa7RjDH3NZWfNlK4Amqu4zVMxXUkC/Hitp5mrsKeVwb2HAvETcMGvU9tDQCsqK+8qbtZkuFOVSCVTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNg6q1Fz34lGBGAAxaKSATNiKdRy4jUrRKwE3dSmbqw=;
 b=dNgzLPSS2uWE46/Je1p738BEDma5Ap6Lsv3i9QxwW6cncZPeO1HoJ163Xx+TfN5Sbw24kgi82nZUuK4APpyupSu+juYSRw9N5+iI77URdE74xFfaWMAthtTjNSm297ksKM9flFXCmjw0+H79bYPjzQ9IhgOzh9pnAVTul+DlMcYBnFJHR1IrbLSfo+82uIE/LtCkfIbZ9NFJmoAhwZnxMe0esKN3X//60nYB8pDOow+ijzM7oppIG4atk8ayuzesfJ6pIrJYJ8zEzWJ2GITllCeRL8uoAcEEIzNUmPKHpuLAXc+YP7sJqgjFT2ZhoqiZ1Lx1I5NI/X3OJ0AIDteqwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6928.eurprd04.prod.outlook.com (2603:10a6:803:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 22:35:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 22:35:28 +0000
Date: Tue, 19 May 2026 18:35:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 08/17] media: v4l2-subdev: Always return at least one
 frame descriptor
Message-ID: <agzlqpbe3Rq6U8kt@lizhi-Precision-Tower-5810>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <20260518164318.3367888-9-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518164318.3367888-9-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA9PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:806:23::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3a2dc8-c277-46c8-f805-08deb5f6ed2e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|56012099003|18002099003|22082099003|38350700014|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 v7sXREn5ReP5/99xb0SL5Q6/+iWJfsP3fYS956tJkJv36PhyX0q9ISMbGoF/QRJxkresH8Jk6yRUdV3ty7sW5pBHbLwoEI4ocvvqmda2Zr0vfUp06hWhIIinYBR3mzgpTV4qQeB3rbfOqQxhKw5JeAsKs4tJO8GaZoksZqLZ3RAmklRHlutro04I3QttrKedtMtMnZaOzpizHb+P3B9GwS3cc2KSW8o9C50ZN3kKPiBMeh9BdnaWVbVezD5sX/uSOOxA1U9/eXP7JQjuug+e+K8kpk0WkK28gtRE0eYJYDHx5JgXIEhUl9kZ4QR78AA9lYIqoBx2QL7A6iWmb7YmfjXj+C7pDBKwF+tvA0jwaKnbqPiwW02epmqkQgfGfvexHemZoK0G2JCxCDQg7X28+3zyrHZYoopLosqA7LYpbJJw9mDgn+dJr7SEiwfgjGQJbByX29flrnyEdYaldMLQsxFAo6vrMLVwCUxOhALTWUIhJRIKyd6PLU4BXj72LCyLjN/XMkdMQIc8ephiI86DUqnGbCZdq4EzeAeBiS6z6y/FZ9oIPHWnldzL3ZsxB7TCaDeP/qii8RDAs31QSx/QwjNWco87Ftzz2ykGva3M1dSs3R0czQ6qJalYjFzOX0CM9cQZBv+5cN4XVE93MBl/ztvlL1FKnFbrKfywqvw74ruXaIYZmyRL/hBIpL1wr22aJ/BCxPx5InEew4tDAjXsElIVZ38G5ACLQp0a7yGIQBWgMoa4C+ZhySB3XSNY928J
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?wTyJ/FO1BH+eHZT0WtmEKTB6WTdPXHKFBGPh3b+ffVlel3wDQVgIrPHEERj1?=
 =?us-ascii?Q?aWao70H7DPDR3vFO1uc+2HkWOjKBDtIADtidSVe9/cbQzh2iU5XSJebJzC3Q?=
 =?us-ascii?Q?rXcylv8pk7Yl+Ckq1AKr8pO+1xVj/fq+ghAJymq5o7b7BQJfq9MYewX7xHJe?=
 =?us-ascii?Q?Hx7gMkFjVM4i0PHsk3dOcjadHjl3FwTe44haFs8OOYRrIcDnsRKWjMvrk3kv?=
 =?us-ascii?Q?U9hQtEQ5vqjtYp/ED5Kf3Ou8+g0KhBYE94sZ0C0B613RDt/CfscFJQ5/wOQU?=
 =?us-ascii?Q?yAfCBrNKDSgCdIHxBAIDagXb0EW/JgcVutnUHcpGPsldLbk2hSDJEMCQeuYb?=
 =?us-ascii?Q?Knkc3qzje+YwJ3IZvv+M2d0b3UxLPQ3gsAOp8RZTeKJPxjVSsy8ZMNEamXie?=
 =?us-ascii?Q?SsVk+CrInX5wBLnipSjeGJxRR5sNYFxFYRpjOAE1ZSTS4jstBqXHmrjuer9n?=
 =?us-ascii?Q?/5eCG8XB+onbjCj5Gz640VH36kJ1xIvDU0EVSaV9WuPjQPSxe/5lo4+2WKZ9?=
 =?us-ascii?Q?JbP6uwAmXmkHIRIa51HyLPSk865ssn6RU2TXOsO2BJPT/LRnuhkiymCZvyW+?=
 =?us-ascii?Q?UKWfI+Q0S8qV78ualf5bpc4EvHbnnBBGrdYCSAW5PtK/knHS/nQKnxob+E0v?=
 =?us-ascii?Q?x36BtOWooL4AnrXg2TJegAKI8h3XHicAfmyKqALJmn5QVpCXPAawpOfajeKU?=
 =?us-ascii?Q?8WpUsJCXMMpakgfcbpLvqFhMtDvuAXHA5SXHPqLsf4CNFSeU4O7VaQyN3W9x?=
 =?us-ascii?Q?LM7UEEnan7imIfokSMYM0tHzcyNpisI2TJeGd3OLRSVF09DZEHJSXSI029jB?=
 =?us-ascii?Q?TDPPlLZOgIqI6y/EojuOfAKyfn3YI2qeOrkJaQt47Sh3OMsQO5UguZX8N051?=
 =?us-ascii?Q?013et1/G6s0a9DuVH5Dx0MkeX8L1E62Ur7fSj3pnvFFOq8Qt6wxvB4rSoESz?=
 =?us-ascii?Q?25bD1YqybkJrHQOJEhKdRoPrBSf5JFDN7XphimG/BzKEsqwaz242dBiIaRSf?=
 =?us-ascii?Q?Zlxng+YrwquRzLw0pHDF/zRvSK98/q+C7JE21DRoMxMByJPS1fCXnzKT71/Y?=
 =?us-ascii?Q?u/ryMa1FPAF5myu/oP1twV4eIRanDs45tHo/xFCyx9Bc0gVwM29+THrtijuW?=
 =?us-ascii?Q?dyyt7DnNK+Gw3eGHtEzU5FVolpRUZ1MhiExrXRzmOIzM5i38TmOognd+8WAV?=
 =?us-ascii?Q?SM12F5JZU52g+111i/tAn3s3uxqkdQ2nTrIbFXgOfwkXIX7qkKRxcfAARDDd?=
 =?us-ascii?Q?rTh1q73dKqavPQFO1259lzJmwu1OCIejd/ekq0goBy4D40jZsdwmdhwb1BvC?=
 =?us-ascii?Q?/bLZOTEVfF8vWl6Tp1g+2/b19usJysrgt9TavQzMQrmujH5ov1f09Tb+IjGL?=
 =?us-ascii?Q?8r6tJj2ld1YflIwuMdNXaVOrPfS4mrBAglF8Bu4lAAAyV6NR5Vw44QgyBxXR?=
 =?us-ascii?Q?bRKfst/xw9gSEhLs+Q3Ucwz+PSuRmCkLYQNdPo6JrgwRswGRiPncNUIwwFTc?=
 =?us-ascii?Q?GDh2+gV0jMOx+M3dvJFCQg5484usmL/ceHrHqO39SJcLJVPRXJ8YlyHn1qrJ?=
 =?us-ascii?Q?Kf9NyM6h3UhRsyXcRlUmMxVpHyhxKd/rKLIEFfykxNMQANGjWsZUlNbJc6qe?=
 =?us-ascii?Q?aRb/0I9Pt57sb+WRF2gxMd8E2AnGlcSUNGZZXm1ay3AupZdV2kAamKKuxMt3?=
 =?us-ascii?Q?A6VUCAPmz5qgKigoMheSMGVYzsODVC7SWh4ceMiWNjbnRoeu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3a2dc8-c277-46c8-f805-08deb5f6ed2e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 22:35:28.1480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bpRKrsEho+94PjzoT/Hz02yV4KsTnYhz781FK17Si9oO/Y3snuUpFknMdirpBcf1iG6Uz1KPbuLEmffqvZNJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6928
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62193-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4F8DB585B9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 07:43:08PM +0300, Sakari Ailus wrote:
> Make v4l2_subdev_get_frame_desc() return at least one frame descriptor
> entry or an error. Empty frame descriptors aren't useful for callers so
> callers can now omit this check.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++++
>  include/media/v4l2-subdev.h           | 2 ++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b5eef0baa237..dc4ac08c210f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2732,6 +2732,12 @@ v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  			goto err_free;
>  		}
>
> +		if (!desc->num_entries) {
> +			dev_dbg(sd->dev, "no frame descriptor entries\n");
> +			ret = -EINVAL;
> +			goto err_free;
> +		}
> +
>  		return desc;
>  	}
>
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f9b121eefa92..0361c8bbee38 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1817,6 +1817,8 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>   *    struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_desc) =
>   *            v4l2_subdev_get_frame_desc(sd, pad, desc);
>   *
> + * The returned frame descriptor will contain at least one entry.
> + *
>   * Return: The frame descriptor on success or a negative error code on failure.
>   */
>  struct v4l2_mbus_frame_desc *
> --
> 2.47.3
>

