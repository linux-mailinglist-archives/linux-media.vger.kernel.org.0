Return-Path: <linux-media+bounces-61536-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLADChnoBGqnQQIAu9opvQ
	(envelope-from <linux-media+bounces-61536-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:07:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B43A53AD2F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64A843007A47
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2DD3955E0;
	Wed, 13 May 2026 21:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kzpaZwp8"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83625352C2B;
	Wed, 13 May 2026 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706448; cv=fail; b=IAzqH9xh7tz/LufSi2vw+ldYo/TGu4hO+R1hopq28DCIDRoqxQ+zeGTmwV/+HbwySdDyu/cek1k5anjP4ioB5Pkpg08z0vuegTCyJWB0QQvygPflXhCEZUPS0AXiQIqaANR2IQyotFHwXpXpzYIiauZrE0OEYrfbKphVX4+eqy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706448; c=relaxed/simple;
	bh=ZKVeFnDC9zcck8xu3ewcikoibZIQ6oF/fxdHKWFMoyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nyOgAMeBAt6rk7vGCU8wiIckrmaEidM+JdNc1tdxieSxNQknw1Jr014MakpUiv0zYY32I8gWrF6vquaYBb/orxUqxRZRtpAzfeGGO6JANbHIroKYH1S0FEztZOTnXSsk83CyoB7QBatK2T5xV+rZ/99PHZnkXsDn6gKfkTF13Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kzpaZwp8; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMbrjvOhtkgRRn7LFp0IXeGn9haSBG9kyrQBeA677+2DvRwpILpJgPhaBuet4nLsNS8Gp3T/n6IjxldQBoyok7Fg6nBsuXItp8J+/3+8YIgzgi8SzXHzImpXfnTeWBTUG/axdABQP808qtUYM339ho0q0+M/DCP9w8Jkvkpegivn+2PNSl7q4C5KtFeYm78YEX6Or8791AaDIotnv/vWsKp38QOKabg19YApwQH55kKCrGg/ONEP4u5XR1a3IM4MFsttdB0sVxK5yb+hyitsKkzegkc5FCMy0V5qUXz82kp2bcTkotztAzQiM7gkxFlCtNOzCc1+q7IX3MltfrQ9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgplIBQZDTr4rFpbFNZSQPfKmgQ2Ob1KpgDt77Svkls=;
 b=WS1Kzu++YmH6IQplD08InH00G+FP6SDiRjyz/3Hx5HAvEP+GK+SqUFT5PPIwxBgJqwmnxNMsWcjk/1yIwZXuDbdl4KOsTYTBD6IMiRTD4rUu3rsihQvm3U9ai90MpXVccGC71daBGhSt7qsqIohzXvImyR8iq06gNu54TPzRvT9Rw9GvsFVrm9/qt0O9LVU8wb5ZjO8FH6MZDsB65kplZRF6glsZrAbp+aRqBzpVELmARZcgU2xeUgaBMiCyxRgrJowZESwrtk4AzF/5vQ+KlcKLjN+Mb0VnIYV8lszklofy0bOKqJryk8lRQ7lswz+taxqlzEHZA+Z7ipe88J0ZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgplIBQZDTr4rFpbFNZSQPfKmgQ2Ob1KpgDt77Svkls=;
 b=kzpaZwp8DGmXPwu8p036xwcjBkxHpBjU6TX3suQtba4kc2vwZGtdqW1VysAx5m0Jo+5GJf2PlqT779rQrEUh6ueccOJU0AlY36gs86nY1EcF68PCcF9jcPg3d3X2/PkrRygHay91Od+1SCBrBAG6nKxTCmvH1VjXNXaw3CTwZwf09ZM3wKvBByfV0VIj2O/xJOTuHiW4PKc12z82izCpYCis2mRjwD6CHLFbmqbrO1wtkhPfI9RhiMLkMGz01CnpwveXc6wQ13b4xM0xjudkNXAvJf7+x+SYJgnq/nH6rWkpws0bm7LXw0bBL35tsHEEugEoy7+wNeJzLUt8i3asTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 21:07:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 21:07:23 +0000
Date: Wed, 13 May 2026 17:07:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v4 1/1] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <agToBSPfKC0DSVFz@lizhi-Precision-Tower-5810>
References: <20260513205949.105444-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513205949.105444-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SN6PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:805:ca::36) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: a5de0634-7306-463a-210a-08deb133a0e2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|52116014|7416014|376014|1800799024|921020|38350700014|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
 gcwdiRB3eCJ5lR9GrCLoG8C1ezWkPXx94+rAFS+iJ8GwQ8C7KeMP1E2wA4JTjZX12gMgI3f1mRQpGLQBUyuLsVPE+31Sp1zptA12FYjfipMD1ZTVZKHsnkv1odj71BMjct2KIcRymen6Fq3hBaTzuV3uFg7Trqeldz/61G6R8yhznediqdfaMZvakYfpaLf1YIzhwUh4CX0X3ljz4dBOh9qZFx++UgyUavwbSV8UhfgLJGEZtLrwyO88+VcXaXN2gi2airig6d6BXwVAV9AJPBhdu3tedOuJeSERREy4sqjnTvvcdIuktMSmYD8JeryUPPsKNB3oj8BFScoNENjANvq53QDvh7F54abYKuEENpfdqRdKJztSsXADRsyV2ycweANo/oLIrz4hDW0y2PdYIAzGA7uLhxR/u1Y6lkh2887PfNW8ASp73/SwkmGBzbHL8rEz7FKMSRYo5hFtSmayip9P5gc1Txx3D7mTogC8o/a1AmrAUGvU61gb3wvEHIiOzrdnxDnN7xOHX4y2q2Pa2WBT9c0bvfe8qBCZL1/c1a+Shh+QXkGt/dPiYmYyskXMMZyUlQSegfu4gd7UiWuIfis5L5blA46442g1XYAMw5A0Qj7ibdiu/DR3vVeiC1mcRxEagwifiON1zYin3j0jUNJ4mwZ+B1HFfB53x+bdVnLYV7+5POqZL8HIKmLUT+bIXkFvX9M7CsfmAXmzC40ixdMHPI+mFEVY4Blw/V28x6A=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?V/M/1bHPY8YwLJz3WyKh8JvwnPpOgdEdUS88uNx+l+fEy7YgZ3Fn2vyNK0hr?=
 =?us-ascii?Q?mJ2f/Cor9qfxHptAGPpRxvz6fj+1/jImfJdbme2rnQIU5157MHolnvuHI91x?=
 =?us-ascii?Q?S4zM7+GyCZM/2DuI3jmomznY4Y1dnHrP0ddlRfSU9AGgtiwXFY6DxS8P8Xqq?=
 =?us-ascii?Q?JJYnBUzfvhZanXugCAXAELCYfbAxtWjnpuFiBXzKHG5YgDkhySQf0n6mm5JY?=
 =?us-ascii?Q?aCYSxeWr+IgI+RA1WGNwEzkQzoujanSMuyW7CAQ6pZKAavQxZ5Dg13QJ5yGW?=
 =?us-ascii?Q?U12NLiJ6ZLLgRvfRcPteAJjInyR1Hqbv6NFfHB0G/HZ0cjDTl/WSzTLW7axj?=
 =?us-ascii?Q?/mJQVaxKku3O2hcNJ0B7Y8vjbPZ5UgI+i+LSu8K1jUAB0qKMxoYGxPczk8AV?=
 =?us-ascii?Q?c2X9gtIh6YfVTtafMqO2esfC0r/mRosCQE8Wfdk21rfbQg1tykP0kkOX043E?=
 =?us-ascii?Q?AWTnW1trUSykZ790WP0IwBxLuJS7pz2lfM1IjB00Kkrle+t66muomgUPBGmV?=
 =?us-ascii?Q?LxWw21l3ZXKTRlV7mZad2tOvw9WQPtjw7QCvTxBMsyPFE3lBPXVxd9xwYOVH?=
 =?us-ascii?Q?EGVGIdO+KpPXGLLyMdAO31GSZcCyOqCipva0TIKTXSPciULBRVw5voj4Zu1w?=
 =?us-ascii?Q?9npp/iShoV0P0zY80FwNKuarakqGAUdzKWwvsG88paYHnyLoVM+EHAlXQbhz?=
 =?us-ascii?Q?poC/a5+7ewyf75OdBVRx0qZ2nPfs0uPt1t/9JcWzBqlp+WZ8KoZtJSaqWexn?=
 =?us-ascii?Q?iSdaPAVhDrTqXcMG3e8om5j6snOUHiYD+YBXkjYHXnrYP4O7uBTF+T9OJHlB?=
 =?us-ascii?Q?uoeStWKaTngUEti0lodqasiY+Ik+CCKGcaRaYVIwZIkzO9/PHrn8bfVJZvUs?=
 =?us-ascii?Q?mMpfHMx9tCwse5OSVraTFoXTAfo0wnEiONMkdlUTCdvkoRyZjm7fT62EqFEW?=
 =?us-ascii?Q?1AlpWEVrkbbw6qAH+LrxmvXqwKGQuKEhYQwabkfwV6ekxgW84tCKwC8V5WTO?=
 =?us-ascii?Q?gUUDvJbeH8kDwEh+0FghHmLg1rayWRtZYZCtvSdb4G+k9cOIkuznk5akS9Hx?=
 =?us-ascii?Q?r1oQkg2yLedCgvFyhTHbwOhrPz/jDw/2t00YFB2N4iNW7z4IulLbD6PX2CDu?=
 =?us-ascii?Q?N9b25LmhN0cbuV16SgTCsHLSesQwtKBS0Jo/HLie601nRxaTB3MTNDsljnXO?=
 =?us-ascii?Q?+KuH57GiLvDQWCjSuVU+4/7cJzhZWlNe7iFOLw4QWcUZERBupRZlAiIFhzYs?=
 =?us-ascii?Q?AsV77uN8m3kLB2x5KJgGEQX8mnM63Bx4uJja2moSc2yyK4IA9AyfpcOsxzHk?=
 =?us-ascii?Q?3QAtEua2SVsKPF12fZbg0E6cooryO+idL1TMFLi7t43FRvQn+ZC26o/1jJBc?=
 =?us-ascii?Q?EME2pcdcjhBlAZ+3FvxPT06bah29RrZ0sRB94QyP16/Mu9kIdxz5mQt7s8dF?=
 =?us-ascii?Q?AmUapO3f2fH4k8NCGX1dS1yWX2porc7otQhOlM/TqzmpfO5VxF15tyueAhgV?=
 =?us-ascii?Q?EmZP+BN8Cs9BykRxSPdGUVIavBlTXL2wZxFgWvvWtotHHExrGLqHQ6DSLaBS?=
 =?us-ascii?Q?ZO6Nk9+Pq6aQu3u0m3rf6sCC6xtEcifVLJ/hGtNAwVo79Uqb7PDMBS0Vnh1Q?=
 =?us-ascii?Q?Qh7YGPeV1m5E3lQ4nCF7q2PlXMGeV5bpTuwBs513v3+ZZ9IVa2yhm87IWS6l?=
 =?us-ascii?Q?2LDEQdFrYpNN8DhhlXufRX4JmRf5QUocMHbmzEEv0Z6nDpi3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5de0634-7306-463a-210a-08deb133a0e2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 21:07:23.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80Rg/vo3sXo04DsTlHIbAb6fSZm25UWr3EyVjxOWwdCYhC7py11wfjw9eaLNj+r638Mo2Ynv8S1UtP7Y/AANoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
X-Rspamd-Queue-Id: 2B43A53AD2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61536-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 04:59:47PM -0400, Frank Li wrote:
> Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
> to reduce codes such as
>
> 	static const struct imx7_csi_pixfmt pixel_formats[] = {
>         {
>                 .fourcc = V4L2_PIX_FMT_UYVY,
>                 .codes  = IMX_BUS_FMTS(
>                         MEDIA_BUS_FMT_UYVY8_2X8,
>                         MEDIA_BUS_FMT_UYVY8_1X16
>                 ),
>                 .yuv    = true,
>                 .bpp    = 16,
>         },
> 	....
>
> .bpp can be removed from pixel_formats with this helper function.
>
> CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
> See section 9.4.
>
> Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
> MIPI defined data type and avoid below duplicated static array in each CSI2
> drivers.
>
> 	{
> 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> 		.data_type = MIPI_CSI2_DT_YUV422_8B,
> 	}
>
> Only add known map for dt type. Need update media_bus_fmt_info when new
> mapping used.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

I just pick updated single patch from old thread
https://lore.kernel.org/linux-media/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/

for the below thread reference
https://lore.kernel.org/linux-media/agTbwqUAVcQytGB2@valkosipuli.retiisi.eu/T/#t

Frank

> Change in v4
> - add space after }
> - fix bpps value when m_nXk (m.n*k)
> - add comments about bpp defination. only convert from suffix of
> MEDIA_BUS_FMT_*
> - move struct media_bus_fmt_info to c file
> - change field name fmt to code
> There are some open at
> https://lore.kernel.org/linux-media/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org/.
> this version just fix known review comments.
>
> Change in v3:
> - squash two help function patch to one.
> - use media_bus_fmt_info to do map.
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 178 ++++++++++++++++++++++++++
>  include/media/mipi-csi2.h             |  26 ++++
>  2 files changed, 204 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 554c591e11133..6dba7267f0ff5 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -46,6 +46,7 @@
>  #include <linux/uaccess.h>
>  #include <asm/io.h>
>  #include <asm/div64.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ctrls.h>
> @@ -806,3 +807,180 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
>  	return clk_hw->clk;
>  }
>  EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
> +
> +/**
> + * struct media_bus_fmt_info - information about a media bus format
> + * @code: media bus format identifier (MEDIA_BUS_FMT_*)
> + * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
> + * @bpp: bit width per pixel, which is suffix from MEDIA_BUS_FMT_*, no pad. no
> + *	 compressed data.
> + */
> +struct media_bus_fmt_info {
> +	u32 code;
> +	u8 dt;
> +	u8 bpp;
> +};
> +
> +static const struct media_bus_fmt_info media_bus_fmt_info[] = {
> +	{ .code = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18 },
> +	{ .code = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18 },
> +	{ .code = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21 },
> +	{ .code = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30 },
> +	{ .code = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32 },
> +	{ .code = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30 },
> +	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35 },
> +	{ .code = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35 },
> +	{ .code = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36 },
> +	{ .code = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36 },
> +	{ .code = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36 },
> +	{ .code = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48 },
> +
> +	{ .code = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24 },
> +	{ .code = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30 },
> +	{ .code = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 15 },
> +	{ .code = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32 },
> +	{ .code = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 18 },
> +	{ .code = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36 },
> +	{ .code = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48 },
> +	{ .code = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 24 },
> +
> +	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16 },
> +
> +	{ .code = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8 },
> +
> +	{ .code = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8 },
> +
> +	{ .code = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 8 },
> +
> +	{ .code = MEDIA_BUS_FMT_META_8, .bpp = 8 },
> +	{ .code = MEDIA_BUS_FMT_META_10, .bpp = 10 },
> +	{ .code = MEDIA_BUS_FMT_META_12, .bpp = 12 },
> +	{ .code = MEDIA_BUS_FMT_META_14, .bpp = 14 },
> +	{ .code = MEDIA_BUS_FMT_META_16, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_META_20, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_META_24, .bpp = 24 },
> +};
> +
> +static const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {
> +		if (media_bus_fmt_info[i].code == bus_fmt)
> +			return &media_bus_fmt_info[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +u32 media_bus_fmt_to_csi2_dt(int bus_fmt)
> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	return info ? info->dt : MIPI_CSI2_DT_INVALIDATE;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
> +
> +u32 media_bus_fmt_to_csi2_bpp(int bus_fmt)
> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	return info ? info->bpp : 0;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);
> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> index 40fc0264250d7..bd22d2ae57e81 100644
> --- a/include/media/mipi-csi2.h
> +++ b/include/media/mipi-csi2.h
> @@ -44,4 +44,30 @@
>  #define MIPI_CSI2_DT_RAW20		0x2f
>  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
>
> +/* Use one undefined value in spec */
> +#define MIPI_CSI2_DT_INVALIDATE		0xff
> +
> +/**
> + * media_bus_fmt_to_csi2_dt - Get MIPI CSI2 data type from media bus format
> + *
> + * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> + *
> + * return MIPI CSI2 data type MIPI_CSI2_DT_*, MIPI_CSI2_DT_INVALIDATE means
> + * can't get data type from bus_fmt.
> + */
> +u32 media_bus_fmt_to_csi2_dt(int bus_fmt);
> +
> +/**
> + * media_bus_fmt_to_csi2_bpp - Get media bus format's bit width per pixel
> + *
> + * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> + *
> + * returns bit width per pixel, 0 is invalidate width, which can't get from
> + * bus_fmt.
> + *
> + * Notes: this bpp is suffix from MEDIA_BUS_FMT_*, no pad, not for compressed
> + * data.
> + */
> +u32 media_bus_fmt_to_csi2_bpp(int bus_fmt);
> +
>  #endif /* _MEDIA_MIPI_CSI2_H */
> --
> 2.43.0
>

