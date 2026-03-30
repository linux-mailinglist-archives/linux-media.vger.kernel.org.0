Return-Path: <linux-media+bounces-57667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLGIH4SvymnU/AUAu9opvQ
	(envelope-from <linux-media+bounces-57667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:14:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E82D635F372
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A6EB30143F2
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7AA392C2C;
	Mon, 30 Mar 2026 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MgoLoJPG"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B1033B97B;
	Mon, 30 Mar 2026 17:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890878; cv=fail; b=fuD3QBLTRu8jW4qdBCaLm+xfKk5PJGTnIpWWqflOh8XnIkKX+UKyojVLAga7dwq+wgbR801ad2wBBl2OJoIxYg08/QQReA/NCMreEbWLjDGslaLs6+mokiMACLr2BFRok0FBFCqdQuSo0hXbQ5wIsQ+VW3wdBTcaoCFnu8Xhoyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890878; c=relaxed/simple;
	bh=Y7H/CXmpMlIhAtlKDDiizhsTgfl94nsV/jd1D2pWYAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c2ANIGdsPwav9btwufNLo9EcARU/Cs36sEdhvG1qcjQhfkNqEm2cqJuu1+J5HlsCt46blG4HL1MTl4ldhFDNde9X/7pvjfUXdgU3LJWsHI7uSMR7ia0cpLmHKfHl7Y5rJzfInpCEbSFURQUubwRvT6F/eOJqXFek//jlx3VF+cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MgoLoJPG; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCzPGf6gTlBpkrNFB91yon/tlqR6JJif3sgVCMqPNKfk59/vsTL9S/mOASsE+lyT/Q98ZtDyGiNWBhfw0H1eN8MVbRiZdo/f5w+5PGrggLZBGS6/20cQn5+7hsnzfuWnFD2xubNwxDmDo+24jvPy2A8YkjQ15Y0oByPD3WgUeWfnHSOEXmb/j62A4xFBpzOG+DGh9wQlYsTqOBS81TQ2jzscnRs/l+T0iUsODW4nqkOuNdxQBUm9yKJu1GZVYR4swmfL7COoJiViF05zEIwpVfuSa9qIc2q6QWehm+ixLqQD5T3s2shXfcwRQh5V5DUaPGG+cW91YfJfaATOu6tpdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QAvnXxg2bg5Oioug0DDs/aRNnJwBwGya0jFGckjlBk=;
 b=op7FrGMDSi3HQBazLdHQdE5PIOdbjoMFpQlelqQEZkVraX1O6p7kCmp1sgpwI8sNb6l7v5sb3aMY84lwnVnhZ7+5CkNhQM9FJ59VT1cWwUC4P7YAnMoVcxcgAvW4zcXJ6fj6TfhqNoffbUkAcCw/0cdj0dCP3RKNxYMv2nXBcKdN14KPj3DRXK/6txfbwQ6UhfEjJIcKdcPTFmTD1HElT/GRq+F9J7bijZqq5GILoxY/BhQYs3e4I+yttLpNkmPUjdkYuCHpUo/JO6CvSxJAHzdKqAkSu5l7RanfE4hKnUSlg0fg5r4FZeFzG9CzPH2xcPqbCC/27Dxtogm/uEV3Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QAvnXxg2bg5Oioug0DDs/aRNnJwBwGya0jFGckjlBk=;
 b=MgoLoJPGnHrv6xcW9I1Z0WRzkVM5y3Nfg6p0Wkco0u6Pl4lNkFUL4iHmtHsW2pjHklxVu7XDwwImOFMl30gh0sgz7d69kGcEf1jGLBN4Xx5HUP1alwV/rAN4DmqGHkGL+ya+NSvpWLnf27svDP9/lESnMpX5VUEqyT/ujq3KBxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13817.jpnprd01.prod.outlook.com (2603:1096:405:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 17:14:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 17:14:34 +0000
Date: Mon, 30 Mar 2026 19:14:23 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH 11/14] media: rz2gl-cru: Return pending buffers in order
Message-ID: <acqvb8odWl3DXWB_@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-11-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-cru-rework-v1-11-3b7d0430f538@ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0281.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13817:EE_
X-MS-Office365-Filtering-Correlation-Id: 760196b9-c648-4285-acc4-08de8e7fd05a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BHMh4WERVlj+uTu6JKtUAN3FSiVvETP7a2uUl+mfOPYiyAsUiWZfDgm0KRO0dIPDC9BTSxakqgyo12GlZ6TdwiOpG4c8mvv8qNU4eZDEsGhyFAieyc7ejQTx+FhAd1cwdX9T0IcpGWUn9NCpzQkkSQLGAE0NYrGS/53l0CRSBibM5c75VFqKjP6Lcx1HJoU/dBl8LgWLv7umPi25JBJ98slH/xQgfc2SjAU8QPVWFVNxOEJTtavwtySJkQPG/hIQa5lNRuoiysCkFOJ12JNkOIJzgU2ErHM6m7AXKMwK5qI5C7VaP8B+ANzfWF00XoNM92U9PXpb3hX1+5XU8trxfy+72pFmGLl6p0dmRCjNygk3euxopVxV8grbllDvF19B5CbCvzv3pnRcDcHI7Ma4rS03UBN5+pHujxg4JZ4MhX1QxULOAkrTUz9ejEXElneY6XsE2HGmifr+eMmfrLXzeygf21GIW+Mtu3lKOXN+3ELNUXN8b5FvzTTJ2yW1j/5v+IuphuVPeitYI/pqYkxHue7RiYRYfrxaBMWJzrBwabO2Ar8qLHaiAAtkDm/mkclUKujeoCkZCgyvCYGuYdgZV8kbcY87PyXY3QOX0sngO0sfq09A9B/TfykE7MvNk/TBCZoREZrg+iakwde0XGMAbgXiA60haX+H2PznpDdYAaAB3hLTWA/ychvoUFkMeVISBg83VYoQaRMLm5SkbsNaD+92fXzFQIciNYnUfeichnU2hHOUkKctc+9doHpQoSZumgpQ0wGVrL5C19z0TdsorgZxZMnG1HakZkElgrLSCHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZQIH/R35QfVZFuEw0FYjGtHvjgBjUghf9gifVy1/AVLMSF/TuIIHGWMhbaN1?=
 =?us-ascii?Q?GzgvZMT85Ov0C2wis+B6ZeUDch99ujmBrSHWNXPWZgkjH46FMUfFoKN5/jyP?=
 =?us-ascii?Q?MyddpE4E3BSdzG0U1QgO8Zqz0Jj0YGFE7SVvg/ky/tlNMqUN+dXsyASTRITU?=
 =?us-ascii?Q?1aqObn66ZmoCgEwZM2ngmICtH117N0ZhOlrxxooPIi4EYMxkIoM/IPBEdDfu?=
 =?us-ascii?Q?VQyu8QngkPOAzdrpy6BrXEzSXLwm1da/DCwkFfJ3ch26CG7vbLv1JCY75y3U?=
 =?us-ascii?Q?xS9DWA0CUnk2SS4LLeo975a00qkkAimnijdswiJPkw2HTHkqXQ4IblPJgS4M?=
 =?us-ascii?Q?Gk2qmstb7luDj7L1VykEa4uOyMGj5cPydXbUPOAAcJRYNpl46vn+j1AQk0cF?=
 =?us-ascii?Q?pvaCd8XE+JUmnREaeR1MVW2mmMWLNSA4n9njw8vCANQWoI/ynYZRVKDpXb36?=
 =?us-ascii?Q?Vi6SHnH8ZP9lwP3Q9A2hYjDEsRbEvIoO0yfE0mAFtYJ++yiFbr+egorV0GU1?=
 =?us-ascii?Q?ISv96N73fk0dAuiw25pF8SFrbbhTkXmPmL/oAppJIqbEATFDy6looOiRlgWc?=
 =?us-ascii?Q?FVj9kEuTmtT7oCsYXQNLUoa/ycr33BfcTfv+ZDg7EtCOZ/KLsA11f1GZNYh0?=
 =?us-ascii?Q?GYOMac8GpvgEx1978v0Rg/1LT8Yx4ny5EPwdAgCm3WOd87+0ilnjVBpEcYve?=
 =?us-ascii?Q?3+P4gNVf7/2af1R/Ica4P96TshClEzQTBa+ZqPocdV1E+MFQBhI3EaT5IuFo?=
 =?us-ascii?Q?e9YGCu48cHc1Hwbxg2jwSPoXgiCsYa0h2LStkEi6VnMrd0GB+gG9v+swp1i9?=
 =?us-ascii?Q?R8YRc+3pSZxB3DI5EC9378XGKth2QdKYHd2ikvV4YkMtZNtptoqtcY8JY+l8?=
 =?us-ascii?Q?pQ5dvyjy6XabQJV1jB4oYCRDBB5MxSfUqdRMLlnUiQQwDl4L4+Mz6yOP63jp?=
 =?us-ascii?Q?fveU1GwFA0xaz3WS6fVRF0720DGM+Z9toOEOEMhGJoHO/9v/LFYVNO2POAxc?=
 =?us-ascii?Q?rj4lpC6JbRBHD5CCPsTKmGFiPvKLM5soQbGY3NrDL2m7jC7ytMXkZFjOSG3b?=
 =?us-ascii?Q?eGGloxrCd3BmBOJOY0+cjR8yVyjg9PnU8aCgt3uzwuMKNKvsAnttDjD3QTeF?=
 =?us-ascii?Q?IxmeDrFMBmlohiSu5W4PHrQDBpg8h9XS1qBn8IgWVjzOpbba+j9l/Au1uwQk?=
 =?us-ascii?Q?OOdcuwgt2APKUk/CuuXVJeNLiogND5Qdm5ZAN3ZK+86ThT/bfT1jWGje8sx3?=
 =?us-ascii?Q?S5xn04XuNmfZz/4Nhh8jXw5xN+hfR8voJ7XD/dIvQPn3+hO4iUHZs2ydzRGA?=
 =?us-ascii?Q?Fhzv7nvjc7xE1rlUjJ2f28o58CztcQ24m0TzhmhiPATlSpiD+BmA6cUikDgQ?=
 =?us-ascii?Q?cr8NtCEgUBWdh5q1ojhRLMBDgfYsqMpvOo5yEMjlkRCL8T4MRoc/pzKJAa/V?=
 =?us-ascii?Q?Yt6EMNsvABypx8DTGFoXkLteuBXZH0NRlkWNL1or8tPc1y8mxNVx3qCDqgRA?=
 =?us-ascii?Q?+1nOjPG+EMLA1gw6WPZmM3q1+9RcGbBwa8k+u/cKzgNZrtY8Fal27IFU2ryo?=
 =?us-ascii?Q?vHE9YlrO+2lRTxmQp5fkJZMlK3G34+rHh/gp4gWjv0q/kr1+s5nbOF0PsHV5?=
 =?us-ascii?Q?Lf2/KU8YwQ8lz2HYcY0gVPh0rS/gsi+JsjX55HsEgjmDDQow7UGiNFvW1IIc?=
 =?us-ascii?Q?mS/nAFPC9dvw4On6jEiCuZXHPDDITmLkJ0yuQMXpC4P5JejwgKlglHqxpI7a?=
 =?us-ascii?Q?jCEw9pVTZnIAAU5hLQQzfp2KDbc2ERaHD/do+drteVDSM/mjRYp6?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760196b9-c648-4285-acc4-08de8e7fd05a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 17:14:34.1822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bjEPg4uYatBcdTIrDXdYWO/RQmH28vHa+Y+R4I2o8/KwE0TRltkwh7Sz3xu5iHO7mOj/4Vrrf2oBfe0wdLx9kW5fQhp517RGtJF0JqXAB3mEmkpccCOhGjn0ccHD+j0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13817
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57667-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: E82D635F372
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,
Thanks for your patch.

On Fri, Mar 27, 2026 at 06:10:16PM +0100, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Buffers are programmed into slots in queueing order.
> 
> When returning pending buffers we can't simply start from the first slot
> but we should actually iterate slots starting from the one is use. The
> rzg3e_cru_irq() handler already uses 'active_slot', make rzg2l_cru_irq()
> use it as well to know where to start iterating from.
> 
> As the pattern of iterating over slots in order will be used for slots
> programming in the next patches, provide an helper macro to do that.
> 
> While at it, rename return_unused_buffers() to rzg2l_cru_return_buffers().
>

Tested on RZ/G3E + ov5645 image sensor.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 68 +++++++++++++++-------
>  1 file changed, 47 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 17e0153052e1..a6b606c63f90 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -43,6 +43,24 @@ struct rzg2l_cru_buffer {
>  #define to_buf_list(vb2_buffer) \
>  	(&container_of(vb2_buffer, struct rzg2l_cru_buffer, vb)->list)
>  
> +/*
> + * The CRU hardware cycles over its slots when transferring frames. All drivers
> + * structure that contains programming data for the slots, such as the memory
> + * destination addresses have to be iterated as they were circular buffers.
> + *
> + * Provide here utilities to iterate over slots and the associated data.
> + */
> +static inline unsigned int rzg2l_cru_slot_next(struct rzg2l_cru_dev *cru,
> +					       unsigned int slot)
> +{
> +	return (slot + 1) % cru->num_buf;
> +}
> +
> +/* Start cycling on cru slots from the one after 'start'. */
> +#define for_each_cru_slot_from(cru, slot, start)			\
> +	for (slot = rzg2l_cru_slot_next(cru, start);			\
> +	     slot != start; slot = rzg2l_cru_slot_next(cru, slot))
> +
>  /* -----------------------------------------------------------------------------
>   * DMA operations
>   */
> @@ -106,28 +124,36 @@ __rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
>  	 __rzg2l_cru_read_constant(cru, offset) : \
>  	 __rzg2l_cru_read(cru, offset))
>  
> -static void return_unused_buffers(struct rzg2l_cru_dev *cru,
> -				  enum vb2_buffer_state state)
> +static void rzg2l_cru_return_buffers(struct rzg2l_cru_dev *cru,
> +				     enum vb2_buffer_state state)
>  {
>  	struct rzg2l_cru_buffer *buf, *node;
> -	unsigned int i;
>  
>  	scoped_guard(spinlock_irq, &cru->hw_lock) {
> -		for (i = 0; i < cru->num_buf; i++) {
> -			if (cru->queue_buf[i]) {
> -				vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> -						state);
> -				cru->queue_buf[i] = NULL;
> -			}
> +		/* Return the buffer in progress first, if not completed yet. */
> +		unsigned int slot = cru->active_slot;
> +
> +		if (cru->queue_buf[slot]) {
> +			vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf, state);
> +			cru->queue_buf[slot] = NULL;
>  		}
> -	}
>  
> -	scoped_guard(spinlock_irq, &cru->qlock) {
> -		list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
> -			vb2_buffer_done(&buf->vb.vb2_buf, state);
> -			list_del(&buf->list);
> +		/* Return all the pending buffers after the active one. */
> +		for_each_cru_slot_from(cru, slot, cru->active_slot) {
> +			if (!cru->queue_buf[slot])
> +				continue;
> +
> +			vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf, state);
> +			cru->queue_buf[slot] = NULL;
>  		}
>  	}
> +
> +	guard(spinlock_irq)(&cru->qlock);
> +
> +	list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
> +		list_del(&buf->list);
> +	}
>  }
>  
>  static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> @@ -591,16 +617,16 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  
>  	/* Prepare for capture and update state */
>  	amnmbs = rzg2l_cru_read(cru, AMnMBS);
> -	slot = amnmbs & AMnMBS_MBSTS;
> +	cru->active_slot = amnmbs & AMnMBS_MBSTS;
>  
>  	/*
>  	 * AMnMBS.MBSTS indicates the destination of Memory Bank (MB).
>  	 * Recalculate to get the current transfer complete MB.
>  	 */
> -	if (slot == 0)
> +	if (cru->active_slot == 0)
>  		slot = cru->num_buf - 1;
>  	else
> -		slot--;
> +		slot = cru->active_slot - 1;
>  
>  	/*
>  	 * To hand buffers back in a known order to userspace start
> @@ -669,7 +695,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  	}
>  
>  	slot = cru->active_slot;
> -	cru->active_slot = (cru->active_slot + 1) % cru->num_buf;
> +	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
>  
>  	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
>  	cru->buf_addr[slot] = 0;
> @@ -743,7 +769,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
>  					  &cru->scratch_phys, GFP_KERNEL);
>  	if (!cru->scratch) {
> -		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
> +		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
>  		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
>  		ret = -ENOMEM;
>  		goto assert_presetn;
> @@ -751,7 +777,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  
>  	ret = rzg2l_cru_set_stream(cru, 1);
>  	if (ret) {
> -		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
> +		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
>  		goto out;
>  	}
>  
> @@ -788,7 +814,7 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
>  	dma_free_coherent(cru->dev, cru->format.sizeimage,
>  			  cru->scratch, cru->scratch_phys);
>  
> -	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
> +	rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_ERROR);
>  
>  	reset_control_assert(cru->presetn);
>  	clk_disable_unprepare(cru->vclk);
> 
> -- 
> 2.53.0
> 

