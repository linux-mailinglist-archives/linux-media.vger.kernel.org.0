Return-Path: <linux-media+bounces-57601-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME8RGuFbymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57601-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:17:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B70AF35A15D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C05330293D1
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18AE3C344D;
	Mon, 30 Mar 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sUEiUB1z"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A8D3C197D;
	Mon, 30 Mar 2026 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869321; cv=fail; b=TxqLwsSBSZCV0rD1IIB8IvgKXwD2v+ZB/w8gjEHpaZ0j78PuAs7epio/r/FPpkRbQp09/D8a68F5HeV09CnqBkXwSyRkeHqYe7AiB6JMT+lCH6+uIHXgwUfSqUiB0kUdHxYrbLpBqb/RV59Mvz2/hMG2zQY9+4a5Bc1eu/rKel4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869321; c=relaxed/simple;
	bh=1x7K1iuRRP/DfQMgGMAFmA3CcM1wgSWf+nXzLW1uhGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Za7Y5FkckrGIYfDEttP+pcB513d2AHAWmBvCRYZNgXL/2aEQTn1/KJaJ6P8AUlHu1Eu2ErUcCI1JyNfUDR/Ogevf8ILEvPjA7acaKMzjL+xH1NY5hAB0IU23KfyD/esGSCNAWM/kCZJSSndCOgDrMe0zrQTWGhGxN360zRUTlIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sUEiUB1z; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxUyqgg949aO/KfbRc5GWcY+RYHibmbmGW5v37/C+te/aUXWP+mVa87H7aln8BL7XtFjbsVm6yY+879sTvl1CLr8N8E9SLwxMm3Tc60Z7AxhJSfJOZXCX7UbWz8HQDoCrLInXYS31l2BkrIaEto061RNvsXAMQSnn/DEHwAqKNhalYmd9T1wfvENGydxYF1FPhBfNMTYS/VJTcuX9KdThSv17xVGv+gbq7+XdAnd7IYxzmO+DR0nJ4+4M/q+M7odzpcQ7FTGutXg8pPhs2rNeslxU88yyBppTTsBDe3mGjbSj1+6/yE2gC3DtbrA4Vzbnv6DBtUNcJKxpRJaClOQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hRxlPhgCOOMcDw95OG3oBgF85XbGVUJGljoTaljxTU=;
 b=WVNe8KgR/o5AD/z4D7GKsT5BFXWGzx1DZeqhwKBI86sXOFYcfrGGu3hoe4Z0zpUfCQZzH+POeWNQ7YBjZg6n4C4vRfchCWaSXz+Y+LX4ZVdX0uoYnbGietoq03dfIZEZIoE00FW2Q4ETZ9ykJ+Wzru3aXYenOLQZDDR4jy1zvB7XTbqkSVjZ9c6RD0dKGHydQtqfEVE7ACw6jXpiQuNzRfubdpiUOFRQo2PWpvd9E19SSkNVuPExkywLXB/PIzZqlw/AKp7yve/rSjytoTNO0RyuFQNTpTKicH/wjkUL9ihf64ePYHDOm3oIEH8tLPytrf9baUH9f8oB4FmCXgCy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hRxlPhgCOOMcDw95OG3oBgF85XbGVUJGljoTaljxTU=;
 b=sUEiUB1zuUSGU/xlbxBJwe8UZGUyj5lQNGzcathUfMiI4jJ8W95LOd4xz0GfzAGGnJ03I+AdbFwdn6A02qymZdopXz/3eLfRKtFR9BG6bpSr26FwOPAdmikzQ+QO0TdNI0sd3DQOieZNKLnHtR/2vpUgcYxLKIRcPSLQboHXMvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB12677.jpnprd01.prod.outlook.com (2603:1096:405:15e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:15:14 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:15:14 +0000
Date: Mon, 30 Mar 2026 13:15:03 +0200
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
Subject: Re: [PATCH 04/14] media: rzg2l-cru: Use proper guard() in irq handler
Message-ID: <acpbN_fbNxR3rvIs@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-4-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-cru-rework-v1-4-3b7d0430f538@ideasonboard.com>
X-ClientProxiedBy: FR0P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB12677:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a416a9-37b0-4ab5-6ff2-08de8e4d9dc0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rIiJpLaI2qIePwLn9QffNp0ZTAj0hJzYU/wCvYdFuFNYEhwNpnruN5Dukx6leAXbSkdAHj0pEvHr+Ko44MoOKr2OwsmQcMSjIbs5uWeRIt2Y3OYcO/NUbKVY9aAwTZ4Iv9hIvKzzHsahSN+oGezyBIIUMbkwXFu9opgYD5kBIzPAUq4WW11hbpbO5gpCXgrumNuMTfzL1RRDslvC7byNHod7xmt/YEizMF2pjHazS0U5xU73NlRQQb9A7ZxGUE560+46k3hw5IevnOLHM6HUcSHeke+PceDSHOYrO95G0SHtyJTdpxkqd2hVFR1DtnXfF4QPLPe7X8feXhyV3F2iIVoBm5QdgDzv0gfgqKyPgLH1KaFc6Piu4i3hsdUMMUl3lw+m0elopZ+9iiJKG4lUDXGiancELCyAUhDiHAtY9XGlO7vFBGhGXMRkx+ymlq257cDM+tM8dLoIHzIwxj6FeqQ+VpkRkC3PqdxIIiv5CqYLj2u3+0QvXgDxqWALYh3n3xxrquTVs2R1gPbSwlbZyERCZe8EEddtgzX9kW22dGVLWwVw0uhRHXER0tDV+Qw4Q1/kWeI2Fj2kTEf6qBaGHrz7ESt6ZRROGn51/kjtODBhick4UCMYayabxyWkFokUMCuKUg03AT3HaM92FuY/yjT0UxD+XzM+Sv5sCOE///vy2+MwNG9I7Y7UqthXXsmLvkqvwmIDiMxPYe89VWO4d2AQWpcT3sInD3OUtRzHmDK+rY7VdoAtsLGtwB3NQs8Yq3MHQfs29V0WVnZyrG6Hgjt32kkSbacM6ob3nr6EmRs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HYn0jmv2nZPucKre0f0o/GgRlKbOIppZdOqZfakaPOxKyLfbzvuEw+qsUyfg?=
 =?us-ascii?Q?oS6Hz0fcpqD4xPYiiREJYXTB7dWtd+KPYmQZ9NmeQTHCAITjhaEO0LHfXYnw?=
 =?us-ascii?Q?MM+ALKtEahxl9O0G5/oyl+F72/tVMdX+Wv9X8n1nQ8ZRjCG8ZPydFPkzx+gt?=
 =?us-ascii?Q?LfYNbEl3g6bcWpCu+ayXjx03GPcvYWR9Df6G7XD0G3nCpu29bhNqRkVMeP8M?=
 =?us-ascii?Q?DfwXcMq0m32AJGaBgaeyKGXtBHMS5NDajjSlmq4AwyRkGGT52XDOvxPZOQhj?=
 =?us-ascii?Q?xxr6VzOo8L/sIDIwKQVhW6CHW7MoRUp+RrIsSK2cXxXaIZ1r+dUgqnmVXbZ7?=
 =?us-ascii?Q?NrtoSnhU9+IAnlMgOjF32NpSbXv89XD9LxiArbeSNwPVwAZ5EHOrLtpgBpmt?=
 =?us-ascii?Q?zVp2su6IdqFfPblwrJpEkK0DFcE4YvoudeBXIxSUlZROMW/zxixtuh6wOa5w?=
 =?us-ascii?Q?5UFqlEPfbSPODtZgITcDgFwqrm8I/bUkxHPMIQe6BO1lUMxscJ88CcxCoEEa?=
 =?us-ascii?Q?YlW71Z3pwjSPnURE6qRS3gp6hw9kCREvzS2QQm9/AssVxYGgvvqVIuZL9aDr?=
 =?us-ascii?Q?74WVyhYb6keDHZ5BMvBibjzkqxhIw2QPNzOsKfp4t7SflLieQKh/hgeeiZmK?=
 =?us-ascii?Q?RuH1Duc7S19SGl6CNkw00km9wz8n2mtTYjTIMwhjcCOMx8qJkFbLVc0SROkq?=
 =?us-ascii?Q?7WtB1Gmk4pruQdlZzPUMWNgiZKl3tTFmU/HT0GvdbN2b1/2x/33MqOuo6WWa?=
 =?us-ascii?Q?gVyKhxmHBDP+5EZLtmBPt7R+RfsjIc6skD84j5lF/Vku2Uz4Xp+cqtoIc5bB?=
 =?us-ascii?Q?c4PTR8ityyfiPQcqMxWZw5Ri3SdIUTek2FwHCVyb+yfHN41uTtKi3lf2WfD7?=
 =?us-ascii?Q?IGeqoUk5frpXM/ZbgvyDnSZal7C+Ymg2ac/4/WDh1hGUCsz5dJkNp1iBV8xR?=
 =?us-ascii?Q?KoDc7ZCExBQ8xQCXwzAbS+tnS0fD9Kd5tvu0dc46z2qvhNcO+/5M5rKt028D?=
 =?us-ascii?Q?WOz3qB1OXDe00SHaRrMDN3mmYeuOvzOSIHrl+pQmGM7B0Xbcf8MHOYF7EmL8?=
 =?us-ascii?Q?0fKNyamQEzhUeL7iRHQFRvqjJKKIyJGAAOK+AEtfsBSLZBtBktwZNqXIbWNq?=
 =?us-ascii?Q?Q6mEcZRzsPjVtdrjD/8ekg0+r+VOlnsTpOA2M5ZALyV4RLYcdWOxw+W1W17s?=
 =?us-ascii?Q?UIW2t+H5IGLfYOhmLoFbDOstoWWBKyPxyzQqiodgCEHDbwX34T2nyM/NBiTr?=
 =?us-ascii?Q?vZEyWO/rHGTRSclFKTXF+a71ey3PML/z1Oj7Vn9I6WwUpbDjemwGnV42FWxt?=
 =?us-ascii?Q?PF/v95VugP5EN7Z87mSa2EVDWMsimsrqyiJv+tkBfp8L2QQ7BukPBtTctCe1?=
 =?us-ascii?Q?Mi7+inbgF/EEAeeyuT3UcT4K3pPl+OgJcmmOpvYZp8URR2G4Tp+DazrcGdaO?=
 =?us-ascii?Q?/VCLp/w7ad4NXsWHtAAfzbY8ZfStVGwBmAn/4bSjlNKKafEvfo3a7GJoxTG3?=
 =?us-ascii?Q?V2zvnpUTj09fkfC56VocZL/NanpYkf75pNR1pkVqo+Guc5zMgdxrMkbMIYMK?=
 =?us-ascii?Q?IW/BopcvX1MKvLtsTuSw/A1qgyNOJ5VnzcVXeU8+ZaDC5ZOj7yKZ0k1kvbIv?=
 =?us-ascii?Q?hfklr9U70Kmj6qUS15+xDGv5ndlBGIePdH66wxPxL+ZIzWHpxacHfMUkBSPX?=
 =?us-ascii?Q?O99hFG2fX7ceGaZOjZh3ci1W8nd3ad9WUb4mx6rCN/WyFXaBdKfqe6MxnjSJ?=
 =?us-ascii?Q?gMgoqMBLigBDGxLBdOh4tQQvmjxYu+T5l7jJhlnKE1wAczksuCZH?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a416a9-37b0-4ab5-6ff2-08de8e4d9dc0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:15:14.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5SQNbHP7WLAhkOlmwCeyvsQj1ucKMasJaldjCJPHOGVudMg7tME4PfgKO7AMiBWrRpT45YwuPtikxrrnS+QKIfs1+3iEzLDeawVlHYMWh8BtP6clYOyXUDKa82+cHHV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12677
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57601-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ideasonboard.com:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B70AF35A15D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,
Thanks for your patch.

On Fri, Mar 27, 2026 at 06:10:09PM +0100, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The irq handler uses a scoped_guard() that covers the whole function
> body.
> 
> Replace it with a more appropriate guard() and reduce the indentation.
> 

LGTM. Tested on RZ/G3E evk + ov5645 image sensor.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 104 ++++++++++-----------
>  1 file changed, 52 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 2d7ac9f37291..b041c72837c6 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -671,70 +671,70 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  	u32 irq_status;
>  	int slot;
>  
> -	scoped_guard(spinlock, &cru->qlock) {
> -		irq_status = rzg2l_cru_read(cru, CRUnINTS2);
> -		if (!irq_status)
> -			return IRQ_NONE;
> +	guard(spinlock)(&cru->qlock);
>  
> -		dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
> +	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
> +	if (!irq_status)
> +		return IRQ_NONE;
>  
> -		rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> +	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
>  
> -		/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> -		if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> -			dev_dbg(cru->dev, "IRQ while state stopped\n");
> -			return IRQ_HANDLED;
> -		}
> +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
>  
> -		if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> -			if (irq_status & CRUnINTS2_FExS(0) ||
> -			    irq_status & CRUnINTS2_FExS(1) ||
> -			    irq_status & CRUnINTS2_FExS(2) ||
> -			    irq_status & CRUnINTS2_FExS(3))
> -				dev_dbg(cru->dev, "IRQ while state stopping\n");
> -			return IRQ_HANDLED;
> -		}
> +	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> +	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> +		dev_dbg(cru->dev, "IRQ while state stopped\n");
> +		return IRQ_HANDLED;
> +	}
>  
> -		slot = rzg3e_cru_get_current_slot(cru);
> -		if (slot < 0)
> -			return IRQ_HANDLED;
> +	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> +		if (irq_status & CRUnINTS2_FExS(0) ||
> +		    irq_status & CRUnINTS2_FExS(1) ||
> +		    irq_status & CRUnINTS2_FExS(2) ||
> +		    irq_status & CRUnINTS2_FExS(3))
> +			dev_dbg(cru->dev, "IRQ while state stopping\n");
> +		return IRQ_HANDLED;
> +	}
>  
> -		dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> -		cru->buf_addr[slot] = 0;
> -
> -		/*
> -		 * To hand buffers back in a known order to userspace start
> -		 * to capture first from slot 0.
> -		 */
> -		if (cru->state == RZG2L_CRU_DMA_STARTING) {
> -			if (slot != 0) {
> -				dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> -				return IRQ_HANDLED;
> -			}
> -			dev_dbg(cru->dev, "Capture start synced!\n");
> -			cru->state = RZG2L_CRU_DMA_RUNNING;
> -		}
> +	slot = rzg3e_cru_get_current_slot(cru);
> +	if (slot < 0)
> +		return IRQ_HANDLED;
>  
> -		/* Capture frame */
> -		if (cru->queue_buf[slot]) {
> -			struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
> -
> -			buf->field = cru->format.field;
> -			buf->sequence = cru->sequence;
> -			buf->vb2_buf.timestamp = ktime_get_ns();
> -			vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
> -			cru->queue_buf[slot] = NULL;
> -		} else {
> -			/* Scratch buffer was used, dropping frame. */
> -			dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
> +	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> +	cru->buf_addr[slot] = 0;
> +
> +	/*
> +	 * To hand buffers back in a known order to userspace start
> +	 * to capture first from slot 0.
> +	 */
> +	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> +		if (slot != 0) {
> +			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> +			return IRQ_HANDLED;
>  		}
> +		dev_dbg(cru->dev, "Capture start synced!\n");
> +		cru->state = RZG2L_CRU_DMA_RUNNING;
> +	}
>  
> -		cru->sequence++;
> +	/* Capture frame */
> +	if (cru->queue_buf[slot]) {
> +		struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
>  
> -		/* Prepare for next frame */
> -		rzg2l_cru_fill_hw_slot(cru, slot);
> +		buf->field = cru->format.field;
> +		buf->sequence = cru->sequence;
> +		buf->vb2_buf.timestamp = ktime_get_ns();
> +		vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
> +		cru->queue_buf[slot] = NULL;
> +	} else {
> +		/* Scratch buffer was used, dropping frame. */
> +		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
>  	}
>  
> +	cru->sequence++;
> +
> +	/* Prepare for next frame */
> +	rzg2l_cru_fill_hw_slot(cru, slot);
> +
>  	return IRQ_HANDLED;
>  }
>  
> 
> -- 
> 2.53.0
> 

