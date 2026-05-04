Return-Path: <linux-media+bounces-60315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC75IybH+GlQ0gIAu9opvQ
	(envelope-from <linux-media+bounces-60315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:19:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 339BB4C1489
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFF9E3016D20
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 16:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBCF3E3C48;
	Mon,  4 May 2026 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QqEeQakK"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABED93D5645;
	Mon,  4 May 2026 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911586; cv=fail; b=r+2ombgMn8O6qks9hNisDR88LLQQoU8XVCftzCPuwojqmf64JEODY4zglHMmA2pdjgWj212og5rs0dwR5qUH9TaRuXOXS1GrIF7mIhRLFYYhQOwDE8J4QxTFOVYS2sEeqtZJXksjLIXHZvGH5oDEWaBC5I4QZR/6cweYGSyOwCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911586; c=relaxed/simple;
	bh=1cz01jMoEascJc/r53N/NFOHA2WT+m1UXHwb7gyptAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NA5uE6gRb1gQimUrCKLKE4BkLKC/roGgxMG7+M1DJWPEtAOBTrMV0EdcevKbC4PyTnZs2oBlnCCmP0QcPPqMtJT3IhboptCTWCGFCmAGX8T9htaAvGvuQMb0Znnm01ZuYood2X2OqjNsZ+9IX+0DHm0qVkw9pejf3wYBI88Nfa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QqEeQakK; arc=fail smtp.client-ip=52.101.66.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIUJPJpI3h8x8QFYaA8mrvE48EpTiszDFDohu0j3YwbINYs6Y6d/gNQKZ1SiHzYNYwlr3Hq5yIcR3i64rS3S18bhfRFv+6Np15psUR3+ubGczT9QaZRDVh0KqxCH0r4gYvI4/+BJW5zZsRz+FliBeuUFgRT7ydAUJRyqPphO3G+X53Bba+wJvitvnRY4T0ugpGIdv0lRmmqJjR0+c/q0VFYo2woUChq28HJLUlF7GlXYdpYbNggExOKehXhrPJbBRD9rN6kC3EeEmR3st9NIvr0Ki4nwwgSNk0dzWyI2Zw/t56hedy74/ZYowc9Q918W9tRpZWT9N0HqojgBXc36ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pFTQtagVzdaJBHhnSCTGDA6nHv9ubqjBcWcX9M6g98=;
 b=gFQuDlgTDKAp9WBJgbeA9NK15WCJFgGEBVaiQboVRCxHAfLmQTFAcR8oRQykJvDgyf6zI0vLSLztENIWOORuJIhTMEFTYJQFEbdauHUervrWveSFQlivjs6rfK5HKXTI0BzyjVL+sFufrSOilHNdUXCwC+OMF9k88yJ6tT6I3e/gCa15mUjtdCgzIodmwHwSJyXRrfQbIQAbi3hOefB9/OCz70UPH/cpNeD4As+i+KEK4NIsOYcoozLlHndRsOrObUfD//nSsOwr5Lnlm1Almgl/cVF7+8Zzhjzo4RgT2OCxCUZ6iz8MhIR1rLOFoNbmO8S1PNh4uKEGWdaxdsIIIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pFTQtagVzdaJBHhnSCTGDA6nHv9ubqjBcWcX9M6g98=;
 b=QqEeQakKJI8dyRL6/plnEE2sHCF0rGetcPtnUkqTkcFgkvX4SQZ1hX6Hk45r9jtM9e4+kJFpCIWsElndZBXDCW6HRRmYIn+UB//FFWkrKAxELgg+TmjZhXDRvIdkVNcLtZErJu3Kepzwyy5XihMQGUmZmDXvA8jyny9EMR5JmeR9eaFY4RwtHfNVWnuExo/Bdkpi0kCVT4+xIUjWUy3RNHUKCZT52OFmnrw7gp6b7i512GfUbVmNoJKgSR+b8V/eHeFWPlMVZYXmJsw9Fkiszt2irDGVu2PDtEsT2X1miVqQ7CYi3IbBrAihy/K3hw9dpUQSjSdo3C7ZphL0bYQO6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 4 May
 2026 16:19:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 16:19:40 +0000
Date: Mon, 4 May 2026 12:19:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
	s.riedmueller@phytec.de, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] media: imx8-isi: fix use-after-free on remove
Message-ID: <afjHFJV38m5g4Ifj@lizhi-Precision-Tower-5810>
References: <20260424231926.406079-1-xiaolei.wang@windriver.com>
 <20260424231926.406079-2-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424231926.406079-2-xiaolei.wang@windriver.com>
X-ClientProxiedBy: PH7PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:510:323::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: a04f4d1c-b1a4-475d-c30e-08dea9f8f1a9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|7416014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 2H8RbAzbZuTP/1CPq6ru5DS5/f58W1RRO0dHsHzzsn5AgZUgDXwQFuQEz1bfaUIZU6zzzVww7hHLDERF4T59HnFBoK1V8aSTXfbnMaJ6QI6EEss9hYLx/9BP4t0E3vmIwO5vpcfevT3+sfCjWnueMS4+G7RaE3HS/mQ2jKMs89Kn9yq2wqKtSD0Br8w7ax9fJ6bLO7dqoplpGF8ymTUxST4p/gx7qHi25rlTAazt9IHNw90YfLTuFMwXZmUvI3F+0cMXae09Ff8MA1EJz10GrDWntBho/q5TuPqGzobZayzBw5lsbYZCF5w1dbZXnU7b0/oPgECwi9yvpaKSDvDJKD5TkA37+fzvdyiPCxAIKnuiKNu91vLMMzBqVOFrC0OeXig16QP6Xud4IWBHhrIHCqsPvFBO+Wc2wQFW8IOly151kWARFRxZZSECoGGT+WaJs1zJ7Z+YQJGq8hNkmMyhvHhawLVz6827Wbr926u6VXhgagqBTuazALqFGGivPikutWAyLRAw+SGFcBAOY3NK0JUXjGzqyfLt5BgDNyXzS25Of/OICpjtKQL9GQxvl3j0HuyvfKlJwQHOFGRCBkOR9H4JnKMP5VxARu3z+Mt4KJ/oMxpfxNMRw8FElzTRMrW7/wA1avoWaauqlffKzBBjBovSeo5860aYbUpMgZq8u1t85Oq9Am7U6X+lGwN0kC4aX25Q7ukPTAQ82IuR4Y8BMwSySO4s2T7sOJVu9j25/Unwe+Z8roC6Pxm+NUIGa0H2
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?EAq51aAlvWztFGlV8DB+bfBUS1GEzMqOlR0uiFhKCvH9GuJpREdwyK80GCmP?=
 =?us-ascii?Q?KPNIhuZe6Ws1OQzH5oE27llYQpPwD21DF3x8rxMysgIPGaQ2rgDKr6VBwjGr?=
 =?us-ascii?Q?YpwY9XKncswDaxeqr/hEMjA99E5OJBHltr/xNpqIRcGrIwQP+KiJKPwDPmv9?=
 =?us-ascii?Q?bADgDK7VgEfRGtO9V59RLnrJ7+RQJSIEthKdF4K0+dm6DLxZEri4Bk//mt6c?=
 =?us-ascii?Q?TszrJVnj/TVJnZ+R0D1xfhc0uIm+c7zW49Kr5+vVVhunP5Dn8wdxau2IXd0d?=
 =?us-ascii?Q?4fSzH4BDC+3WF3TbF42nF/Wes0J7QZFwR78cSRDGmH6143rEGMVPDwu7ei4a?=
 =?us-ascii?Q?5pLpASeRlRUsioYiJLYsVRUg3G2VlBXDVrdBEqYORatB3vYJ0K2NptDgfGXM?=
 =?us-ascii?Q?ak7vzE6iuS9/PbQNnt/W0lHVIB7O3JKN2lmwkiVYiqG8cdU5pwj/2OP2XT/N?=
 =?us-ascii?Q?sxFmLrp5Ess0wgVWvcs0Vi78rmAx2DB2OJTW5wLWb+38QjpNNK4Hvr2d/Twk?=
 =?us-ascii?Q?nNY/8G7qM1xETBn5V8ktG44FFDpMF588+TkX6PLSFtUD0ueLF+8Rt/9s2Icb?=
 =?us-ascii?Q?axVutfoH0KGWYT4z1DjO2Mzmnnb60s4IKghXjDR8wcGDeAPyTQA7th30V+AH?=
 =?us-ascii?Q?H43sOIknQbZP2AGbgw7SFZ1lgVMWYckDgLJea6rnwXQMyAxq7BbbPk7vLA2u?=
 =?us-ascii?Q?nz7lmqVw74zMJyN1eSkFl6rypU2avbrqFlVabi1GJxLS7h/7Ic0mtLgqK020?=
 =?us-ascii?Q?CO62+IupQ7Wo+KWo9lYc7JerIHNIRY8HP8CRwWvcHINCtWzQ5+/O9dHkKps2?=
 =?us-ascii?Q?vnz8i1fxzo0NrbDKL99sMtYKY49CoRPf/S5NcLhEqjCVJujo99t7qQCwK8S8?=
 =?us-ascii?Q?kOx7PvP0VJ53Kc6YEWatzUjixhvL0WQbQix+Sv+Vy+e5ixQmpwkyCSgIGggA?=
 =?us-ascii?Q?eis2mmm7cWQ7D1EbTWGV2MDwtrfeDoW+Hqgpq7oQPYvEHW3hQkLsW2YxT1vT?=
 =?us-ascii?Q?ZbTzyigLQJRRXliYnSUNOSIYVk5T+i17+YhnkuXw1oQsGb00fmBiVTpigNCX?=
 =?us-ascii?Q?OiIJuUmKjNo2oLLZz0NDUseR861vcTokgALGbY2bH0EuKdxRSvEQXkJWAcBS?=
 =?us-ascii?Q?M8qGtgIh3HzxB71Knj15YQfycfXkoDbT2bO/I79XSa8JrmC8JQijPsWQxqR8?=
 =?us-ascii?Q?MvtUR3IgKoXfUzpIqNSJpwJVIdbHCsvL8XEXmvXUVoLiJYkOOUNX4lZCvm0t?=
 =?us-ascii?Q?rRYd2y9s+m5l4g6/cNlR/cdDfbajm2YUNDHXBwpjbrzjpiLluZgjYzYOh4Z7?=
 =?us-ascii?Q?GyHf/LdnUQixScI4l157rJuQCAZwfqbVIUcmuuA2B8VXJ9mhkdQHRbXSCnK0?=
 =?us-ascii?Q?Ry3SHL8exyj581Vmay8YUqhzjbgUW7b2xcpxs1BEyIo0eqEfZunC8M29EFrs?=
 =?us-ascii?Q?GFKGJ9DCs+rbJJ/ezw+yfCQj6+9bq+tEMueuWR2XRJK6+oz1kBlzUz0AiVAe?=
 =?us-ascii?Q?FqF+3XeUXRh/wJs3QsZgSKjcATnF5Xdre1Gs2puas8jDQMPg0x8a6knpms7O?=
 =?us-ascii?Q?f4Bq7LVzHy1kDRVZKqZKbDe0PrqF4E8LZ1DUy+9ss0/9bxucRXxnCqpDkYfw?=
 =?us-ascii?Q?rV1xDFwnIMmj659+jxtOq7Coy4NeAwEtDa7MeqQXSqTLE6Z7M0giwYeO1o83?=
 =?us-ascii?Q?SslVljy3FbVXurYab2lM1IDh/5YY5AymAqrmx1W7If/C36pt95Wkhxaj2GYA?=
 =?us-ascii?Q?YiaAXTyF/g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04f4d1c-b1a4-475d-c30e-08dea9f8f1a9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 16:19:40.5975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNGrtxItZqA+DAWfW6rWyY1iJO8CzgRTSmddzh7utN+563q1FbPKEBzWhB4by750tN5FArp4eNEPOK27ywLgJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359
X-Rspamd-Queue-Id: 339BB4C1489
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60315-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,nxp.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sat, Apr 25, 2026 at 07:19:24AM +0800, Xiaolei Wang wrote:
> KASAN reports a slab-use-after-free in __media_entity_remove_link()
> during rmmod of imx8_isi:
>
>   BUG: KASAN: slab-use-after-free in __media_entity_remove_link+0x608/0x650
>   Read of size 2 at addr ffff0000d47cb02a by task rmmod/724
>
>   Call trace:
>    __media_entity_remove_link+0x608/0x650
>    __media_entity_remove_links+0x78/0x144
>    __media_device_unregister_entity+0x150/0x280
>    media_device_unregister_entity+0x48/0x68
>    v4l2_device_unregister_subdev+0x158/0x300
>    v4l2_async_unbind_subdev_one+0x22c/0x358
>    v4l2_async_nf_unbind_all_subdevs+0xfc/0x1c0
>    v4l2_async_nf_unregister+0x5c/0x14c
>    mxc_isi_remove+0x124/0x2a0 [imx8_isi]
>
>   Allocated by task 249:
>    __kmalloc_noprof+0x27c/0x690
>    mxc_isi_crossbar_init+0x22c/0x560 [imx8_isi]
>
>   Freed by task 724:
>    kfree+0x1e4/0x5b0
>    mxc_isi_crossbar_cleanup+0x34/0x80 [imx8_isi]
>    mxc_isi_remove+0x11c/0x2a0 [imx8_isi]
>
> The problem is that mxc_isi_remove() calls mxc_isi_crossbar_cleanup()
> before mxc_isi_v4l2_cleanup(). The crossbar cleanup frees the media
> entity pads, but the subsequent v4l2 cleanup still tries to remove
> media links that reference those pads.
>
> Fix this by calling mxc_isi_v4l2_cleanup() before
> mxc_isi_crossbar_cleanup() to ensure all media entities are properly
> unregistered while the pads are still valid.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 4bf8570e1b9e..2d639b789910 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -556,8 +556,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  		mxc_isi_pipe_cleanup(pipe);
>  	}
>
> -	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  	mxc_isi_v4l2_cleanup(isi);
> +	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  }
>
>  static const struct of_device_id mxc_isi_of_match[] = {
> --
> 2.43.0
>

