Return-Path: <linux-media+bounces-59000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMoCHLMP4mkg1AAAu9opvQ
	(envelope-from <linux-media+bounces-59000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:47:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB42041A5E2
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4701F302C6CC
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D993B7B64;
	Fri, 17 Apr 2026 10:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IJYSN4lb"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A693BB9FE;
	Fri, 17 Apr 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422631; cv=fail; b=Xw4/Rp/Hxru/IiPuChxgBnwyApjtrUSpsZdRoXXiwIr3GFG13Efjt9i0Huq5FO4pm5ArHj/n0hgxaSqaB8cMIQAw/Zf+nFPB/HUbWSswR1Wo8oReyn8hmGvInpNPVibLVPft/RbdClelch5tMcV2iNGX+XrX6gPyTl4Il9UTbKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422631; c=relaxed/simple;
	bh=UHqfIYA8FI0IeN+OdxE5cSXf3q3pVgibm9ZawUVtA9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NkviV7TCuoq0lgNKzIHaSGBH1MUkfmLIfot6C968gIMAH/uAFhrsbt215x87uwCIU4DDQrV3PX4uqPNkN5i/Xed2uIBZFnT1o9Vf5nLL4VBuCYV1xaBqBnI0AkWnH75v7I0IC07sCptgqBBkkKQMGaXV6s9vewRGrtgAQ47jBlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IJYSN4lb; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLLBJXov32MCrnHSCjQKCwltcBr2dkHeDWSXGF4H3M7htoQIFJyc0PW3ZZaqsdS3+3ne0dmiOPOYt1m5nONtR7Yp/+rxL1S8fPO5FMuPmvNu8rIWjefEqWA7KAx6dGXL9yYrrcBaRf/P3XO24lOK6PRI1IIn64QsjCNjWNOfJ/GzvedWNY9H/A8Yi32mW2rTfY6JSUxo8zjZvJzGUf1c1Y4UluzZ5PS/i1OGVVid/9AKuFRvQ+dch7GxhXbVXjfimWa6ZPuxGlrS1UEGYYi1QkwBm/pSScJ2PjM6/yRfTF/mNB84coN4b9gYxyJTgo434iIrYO4wyNRQTA14WjGaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O07yf8tIga9QXXoZxlNSkh1BqEl9QlRdrtl5qWMDG74=;
 b=MegONJCizm+FogWrfhBsi3d5O5o4JhG7wtcCcHQijnGb1Xqw3RBBEW//VYxd0xEfzoJbxYy2VThvbYUdCrnimjh4Ps9j3iMHjF30hNbm3w7TJa3ghdKoDRwATv7S5igFG3Vhthg6+lw31SgzR0IGLmjDlbYAWXd8CskpnMncO5RXHLANw9FKa0EiMXiJnAQt5AmLMSmvhM/GgZkZNILpTFRZWNuUAt8Eu9wtkIyK0cvkFmqvfYATscK8oYRBX/wNAkQwKNKbhiMEiPpD1l9vnpZgrYoxb3wsXLYgiso8SWG5++1TycQ2bJG8kDCaP/yRn13cWIdoEexZECcoQGQt5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O07yf8tIga9QXXoZxlNSkh1BqEl9QlRdrtl5qWMDG74=;
 b=IJYSN4lbTg0z1Zr8FCFyPL6WLylzSZU6arneFz7cevEX3Q5bPiz/24WoIGOcenU2QYzSL2tMPrBrXaFXfCqixf6naQfY9HRvvYC924plh6lhlUSFMO2RNV5Qx6oVE3v5NIq5vrfXgGJL5wjMtEf8ADPpeWQzrI5kkL3honE07WZ4Cfwj4ZcduPFUBWSj53P0N/MkSFW7udpy181+tkEfgQenfidph+FMDXUXeb+npPu7stF+zPtXZIU5q5E2wZyVoT3eUh+e738P2veiYcwIQqqaXvHgD0N27s4ulzIbY6fnTpM8iFYZ1TPBY/2tWsV/AYnhJOjzyvtVtSRuAmZC/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 10:43:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 10:43:34 +0000
Date: Fri, 17 Apr 2026 06:43:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, kernel@collabora.com
Subject: Re: [PATCH v3 0/2] media: verisilicon: Simplification and clean up
Message-ID: <aeIOzjNv33z72-i2@lizhi-Precision-Tower-5810>
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: SN6PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:805:de::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS1PR04MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: d231b5b4-f3fc-43e4-43b0-08de9c6e2c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A3DwihLuGfJTMUcSaSgD6cL22pGGjBzwB7CXsw8+1tlw1YFvmXdBFRCHfZaGCK6c7RpPDD/M1yPjmML6PWnDbd1kz9DRWrSrrMnF2GfSopHX06nnBvhF0ByT+sgsQFv7DMKvrtkZGZKMhzOBWYrR7BqcPScb2qy8K7DdTZDw4QTTkrwnuqIv9dcgmEKHPqbwUnDGOnNAwBIIQUx6QKexkJJ8bV2ts/hgzYAnWn8aLmf/Oz30oAZVwksQmFrCBy5W0naZG8ND7YgPxXNdzetQiBH3uFSZo+PyYA/Zx9kYJ0C+DjxvMbrkfKDrrldzIkHxW4Wz47z6D/geYu0O5s/JkkP19RH5xGM08RnkeqRxaNfiJuR3MT/BRNGfEctoWr7jnVPxafkKrXuWvIELKk7iln3X2gX0NTYylSYOi05coAtHJKIoKpes/+IGxOzO95R3rtS9G7Fniwxuio8/IQ5NnQGdE0YQapT2NWAx0gu4BM77I6zSXhqD319UiESHSDeeRh0USxslfxCD6Y75o3BUS26z7prvnj1Uj7QPHq8eqlSZyg7wVL3jDv5pbBcDzlO+VYPTwF1RsO+wvLjX99l2S0ZSkusSxeNciC36S84sQJPgam3QEHWiBy0ypvuJSw5YTqGLqCrfNUAqb0IDZOzxkqRkKOeYTzkL60n5m4VQIulsbm+wz6XLmqlchRFHaNKTqJRB/zlCmFNYV3ze+dSnYUSgsptkids+8e2HRiqO9lP8cK1IN/lCfbxeH96VSRm27CzBQk7uFTiSSymjEooeSvKSVBz6R8yGP+ab3XkKjDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EihhU/Vp+YexsdPvTZkVG7h00rnBdPTagXrR0WNqHXer4dl1HHqzp/ZOhqje?=
 =?us-ascii?Q?kZn1un0cCINkzBhZt7BjjH7H8PrlfKsvqcKjYXSp6Bk6dPeSy23LNBARSpCJ?=
 =?us-ascii?Q?5rtNp5Y9uvhI5Yn5RtzOJUBrffN4Xgu8Isd8clhDM5Wdvot5dyqoHNKwQOuz?=
 =?us-ascii?Q?ec0/XnacdvZVIILWmVWJjzEZPdkZ7KlI4aEG5PHcnnhxg7cH+RGRg4un/tKk?=
 =?us-ascii?Q?lM6uIurOuuPinGgi3eXwyb5paWXevXUCC4HguZnVYijnO2yD+G2/XVJbM/Lw?=
 =?us-ascii?Q?AS2LyvS0TuyZAA7Y0zhkKxIsk6a+qy/rl6hlunPpZ3FJxBogCXy+FHvNoT8s?=
 =?us-ascii?Q?Tmh2KD4D49gkkIKz6F9Q6l9s4awQE9N21VxeB6fSH4UaxC0Bvle+evEvvsgm?=
 =?us-ascii?Q?6tSEaZsH3HCed3XcGZusbKhEy515vszEANRJw8J05OOGtXzTWCqC1b3Xmxcn?=
 =?us-ascii?Q?MyALH1geHvMljJR95FfUccH3W+axB5YCLl6HuDqIweTGKk457gVdkm1ZVX68?=
 =?us-ascii?Q?jUVwjwV5i+0dJOHgl2ZetAA7uS40sn/G5pc1iz5x7aSnkO2HW6plLjbMtTc+?=
 =?us-ascii?Q?TC1Z3tIbNxnspuYyuYoCMcJtKznpaJxcVxhz5wfpwlKI5CHqqzrqE3kZpSWt?=
 =?us-ascii?Q?+fy8+ICV/qNKYeCZsz9oSiBUrqGihAgM1qxJHQjuwVOa/r6hggvCULLL052V?=
 =?us-ascii?Q?N7F4wqTwACykim+S0LYONK628Xl+cbkfqfC562YuqepLEs6vfl/9cc0XwmwP?=
 =?us-ascii?Q?UfS1+f+eufXEIy2dW7FlLQEa+/lTQO1H39TussRFN0LyTI8i8EwHEyFgFwsX?=
 =?us-ascii?Q?YK3GQfg7Hndjv1tQNvuOebAQkg3DCKXxfZL55THq0gNDz/8oevVsrY6EQwhY?=
 =?us-ascii?Q?CmeZ+iF3BVWrKwNrDHl8uvHToWz2G8+2uTq74Lo/2V6rJYZIVBiZEu1Q8hMM?=
 =?us-ascii?Q?2rEUHnN0TsFcdPeFckjeaZTePd1RCKRw/dGyowKI0mcSdRiVPqt0Vcx9jUa1?=
 =?us-ascii?Q?kh1FKnKFL1PQvEZVoM+REsLRMxGh1wdmbpUqAn1AAtG/dZnQu5FtPjpqiAd7?=
 =?us-ascii?Q?2FCoft+Lj0syEM5dEuFRe2D3EgpHq12q2HsT1UJ+Tuk0P8LiWvC2HFBxpCEE?=
 =?us-ascii?Q?NWybFhAuz0wlXtnfOeZWx5tigSLSkswB+ekFjtmICPgwCb6RnSgDqsAbPgbN?=
 =?us-ascii?Q?kdcZlwuNNaMwUR5yls8B5hIR8AjRpEp9KHZHQmqd9d7Ru8sCLhJx8298wVW5?=
 =?us-ascii?Q?IjKkA/MCZvOkP1Khdn2dnSFHQQRFcVNWNHzCG9igKgqH7wuGdrHvyKqtYjZc?=
 =?us-ascii?Q?YXhOdIcf6GP5oAE46+HhVgfItGJFxAm4vekay4cv4KshCbKoSAL+w/wifmsL?=
 =?us-ascii?Q?wR/BbRpFG8t9lGizqkyJ8UWqJ6LUOuYRB4i7dzmkpfQ4aRT9RMFFrj+iQh0T?=
 =?us-ascii?Q?vohmEVH9fxHJTOAo/H9IRx5KMIt/hGyXvPjIHl0ONDKCxgKoW/rETt7g2X90?=
 =?us-ascii?Q?ii5uxcz8Wj7OJeSHODEP/YJqU+vbzM7ujDjzS6WRVbYnKbsko8Ql31IJadgk?=
 =?us-ascii?Q?ctLY2zlGonndP+p337nCmDrRyIzsD5LwZPbpmqIXX2/PpmW5Eyw+4y3FkVeh?=
 =?us-ascii?Q?9voQ2E7+e7EV8jst6NweFuOQMxm/XRkrNhb+m5Eqvux4K0x4uLBvDjzS8SSn?=
 =?us-ascii?Q?103wFJV2NPebfSfLXutdrCTBQEfdf/EZ4ZOEbYNlh8LKFLdiSbViFfTUIgBY?=
 =?us-ascii?Q?wzJpMXDaBA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d231b5b4-f3fc-43e4-43b0-08de9c6e2c63
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 10:43:33.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHruuLd/njBLmzTja/qNnyYxSOSIHfqhaYXMBmkxXGeCiqLeA64iQ1oFZ568X5G1byWR4/KBnWE4SxFFzOC+HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59000-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,gmail.com,sntech.de,foss.st.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim]
X-Rspamd-Queue-Id: DB42041A5E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:04:18PM +0200, Benjamin Gaignard wrote:
> Simplify motion vectors and reference allocation with common helpers.
> Since it requires to move some of codecs specific functions and
> structure in codecs header files add a patch to finish the clean up.
>

Already V3:
	where the change log?

Frank

> Benjamin Gaignard (2):
>   media: verisilicon: Simplify motion vectors and rfc buffers allocation
>   media: verisilicon: Clean up messy include
>
>  drivers/media/platform/verisilicon/hantro.h   |  31 +-
>  .../media/platform/verisilicon/hantro_av1.c   |   7 -
>  .../media/platform/verisilicon/hantro_av1.h   | 100 +++-
>  .../platform/verisilicon/hantro_g1_h264_dec.c |   1 +
>  .../verisilicon/hantro_g1_mpeg2_dec.c         |   2 +-
>  .../platform/verisilicon/hantro_g1_vp8_dec.c  |   2 +-
>  .../media/platform/verisilicon/hantro_g2.c    |  36 --
>  .../platform/verisilicon/hantro_g2_hevc_dec.c |  26 +-
>  .../platform/verisilicon/hantro_g2_vp9_dec.c  |  12 +-
>  .../media/platform/verisilicon/hantro_h264.c  |   2 +-
>  .../media/platform/verisilicon/hantro_h264.h  |  98 ++++
>  .../media/platform/verisilicon/hantro_hevc.c  |  37 +-
>  .../media/platform/verisilicon/hantro_hevc.h  |  82 ++++
>  .../media/platform/verisilicon/hantro_hw.h    | 446 +-----------------
>  .../media/platform/verisilicon/hantro_mpeg2.c |   1 +
>  .../media/platform/verisilicon/hantro_mpeg2.h |  27 ++
>  .../platform/verisilicon/hantro_postproc.c    |  29 +-
>  .../media/platform/verisilicon/hantro_v4l2.c  | 262 +++++++++-
>  .../media/platform/verisilicon/hantro_vp8.c   |   1 +
>  .../media/platform/verisilicon/hantro_vp8.h   |  29 ++
>  .../media/platform/verisilicon/hantro_vp9.h   | 104 ++++
>  .../media/platform/verisilicon/imx8m_vpu_hw.c |   5 +
>  .../verisilicon/rockchip_vpu2_hw_h264_dec.c   |   2 +-
>  .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c  |   2 +-
>  .../verisilicon/rockchip_vpu2_hw_vp8_dec.c    |   2 +-
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  16 +-
>  .../platform/verisilicon/rockchip_vpu_hw.c    |   3 +
>  .../platform/verisilicon/stm32mp25_vpu_hw.c   |   2 +
>  .../media/platform/verisilicon/sunxi_vpu_hw.c |   1 +
>  29 files changed, 796 insertions(+), 572 deletions(-)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_h264.h
>  create mode 100644 drivers/media/platform/verisilicon/hantro_hevc.h
>  create mode 100644 drivers/media/platform/verisilicon/hantro_mpeg2.h
>  create mode 100644 drivers/media/platform/verisilicon/hantro_vp8.h
>
> --
> 2.43.0
>

