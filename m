Return-Path: <linux-media+bounces-50630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165CD1BA52
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 00:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E99093029C48
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 23:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC55365A06;
	Tue, 13 Jan 2026 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c5lnPZI6"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8759C1D432D;
	Tue, 13 Jan 2026 23:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768345225; cv=fail; b=eRL5D/Qixw0cQ2yreTVk3NllAPuqFlFBHjEz0d3xJt977ruPR33ht330/yIlTsebN7QGkgcbeDXiL9aliqmCesWvXn6Gr6MdgTZPtSWenBrYscKTSx3qBXz5w0V/AUvbWN/CBRjCcYLRDqxJ/x34lw50lMDVuu/PLSpOvJnuR/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768345225; c=relaxed/simple;
	bh=BjDNoeKVEzJg4/5zKmC8lDInBmoq57Fy//9EcKqEjBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DhU+9gvqm+cH40BJuy5NGLSCAMXXECRwBQEbQfg9yhLTCD5IJzy0ntohEcO2OOvmGtRwMhwPyQWuhfZy3CzJC3MjlwXNrQ+lYAGSmH1NdNeaZBgjA3lhTO/T5DRZqsImvoMUAhK52Wboy3PvUBjJesgPWa3iuqcst+839JTsmfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c5lnPZI6; arc=fail smtp.client-ip=52.101.70.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm+10UZddL/iAS+i/sebAwZUgmWMgBbgO1+2KCRWuxGn2mWBl8A5l8RlcMxJvU283+5uoHy4abozvsCgic0PuMN/cH0DPoZGWHb9fMvyIEe6ccmaXRYAHgbqmlT8Xz/3p/nn+CU8M1CTNZyObncU23k5nkny+hvup6qa533Yq2hQ109GIk2+FvDeGLu8pAYTx/kXIfaPGS4t2/lDJwMyZnln6xV6HgWYdga9d/kILKsb8zOLpwbkpX6Lxots+ACtpo+s/o2jCRl0oIVtII5v24cxt4+xf+ie5H+T6Kexw+uLtKxTez++A2AxHDmomh+RYLmg+iMmpzY+sNs3Jtm/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qduaxtUhOKGBieCA9upG9ry9upET2745aVf+dmQViTo=;
 b=s84umoOV/rEsksbj0Gb80DNN9ttLaa/L4633CLHkoUr6BglzRPgrLsMRCg4Kg4ciGBx2EatrnEW/ipmc6wem2yEzTLJgGu08W/UnNLRknyt4mtOd4ASM5oDE6joPH6Rj3RObY+AfL2e/GhvVPck5TLe9F5nGREltzNZjCWA00D0Qmcf/V/7UhmGAc/CLwi0yoHAe37IoHkqTx5yr3HHTpASYsplYSxRIsg+41EIX6Bb56uzR7sVwCPKv/qWK6befAI3mqekFSB+g7hG8yKb3movYiA1B/7CjEewbUUo26IUCffUw8iC70OtvxuenIqbawX4B+kcYinz8HhiBs3KknA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qduaxtUhOKGBieCA9upG9ry9upET2745aVf+dmQViTo=;
 b=c5lnPZI6dqcuMrL5LIWAolyvxSJDmuyTOLeLW78XWX+71Wz3R8DAHq53wsrbtq4pcHmXsN7rtg+UfMAiefBwPQL+uTpebaIZ3czt0QQyvsQgIpXrMkbQdMzWd0f9i46DO9TznJlMclsOUoImX1M3Ga1XK8kRGOtul+75rGvtF+FkaBtAjykBLXnSz02hTmtjB44yI6tNR5krw2fTggwWJ8MVufgGkzeQvkhbPBRZZ0xjKalSIhedS1+SVo0hoqQQC3tNAX1PTq+NPeSbiueE06XMfChcJy2TP99N2P4+Vul/e6YaUv8WZ5xIScAKCVFRWAfqOZogeVjRtxjRdfhGCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 23:00:18 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 23:00:18 +0000
Date: Tue, 13 Jan 2026 18:00:09 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Message-ID: <aWbOean+pWoS1KUe@lizhi-Precision-Tower-5810>
References: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
 <20251114-rockchip-mipi-receiver-v3-2-16e83aa7f395@collabora.com>
 <aWbAK70dj4EazJ9p@lizhi-Precision-Tower-5810>
 <b1d9800d-54ee-453e-bc8e-7de092265e55@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1d9800d-54ee-453e-bc8e-7de092265e55@collabora.com>
X-ClientProxiedBy: PH7PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:510:174::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 277a78ff-f196-4a5e-ba35-08de52f78587
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?r1lQhXokto7S65+jCalQQHbCfdKdX6IdQH3jrJzXAKrac8eYAcJdzQNoa65k?=
 =?us-ascii?Q?XwHNN9e+b9wc3KCP4BupbEWAGACwLvdfyzsNTXBY5f72/D6Zie9lYQ6OQmcC?=
 =?us-ascii?Q?U6YfNZhs0Rz672HyBshS79tOfTPRmowNm2o14sGykNQz1V6wU06lewU1tKoE?=
 =?us-ascii?Q?0xGvbjRKdLygsI70ixTMgZlfwBUOtUcUiY0cmZN5q0iR0TwtNa6kqo4wZuRp?=
 =?us-ascii?Q?UIT1ElFTIezGAAq3UHWFtnkzCmgyIraWhRvjcNKHF81+dtzb3/G4h2pVDnyL?=
 =?us-ascii?Q?/NNUdUw5F+WjCWWuMrlcrcsfwz0xzGCOHWsV0av7uwvhLcawdlAeIpaWVouk?=
 =?us-ascii?Q?FF2IAVy2Cfhyr+CWfJxn3EhEP+t9Dl4QyrJ3WoSbkhO57Y/tewiojpXhvOW/?=
 =?us-ascii?Q?W/aHr8SOKh1eRdtxrQHTM0CtE8jLbKDsiYRodOUv+EQ9x6TqQ6lJH8CRqwLP?=
 =?us-ascii?Q?24dpeF42jh6QPwxVnjCadu91MJWZsCzajcqo3GT/KYuyV0xRyILbBqDrNDxb?=
 =?us-ascii?Q?AS88qYs/+eMl/Kc4hQKGQ5RH/5j47s5BTVnsXhzb5cZuFHBKzV8j+QFo3PuY?=
 =?us-ascii?Q?uDXGVV8sHLj7rbdrQalwRjYUyB5s6wZLsuXyO8XepjHavUJ4cCztkcs9B483?=
 =?us-ascii?Q?M9kVMsvmn+JWA3nGPvdXfYDKk04yd7YLhv9eYEA2TdEPYKGAVdHmHHS+miWt?=
 =?us-ascii?Q?uPo4KQ1Chci/MkM3sX0vkCdz8k+h27UTwVcM+Z2t4OKyj5kfv5spByGdezo8?=
 =?us-ascii?Q?I+Xvzn4b6xvfI3ru56EnmFxzeVF1JNEJ+m/G14jTJnWG/FbVdNf7UheaHR59?=
 =?us-ascii?Q?D5sxyuInjwQ3pIA9O2v7/P2kCIuUJgRR6MyIFmSTl6j+8vWsgD8O9f+wMCKe?=
 =?us-ascii?Q?x02Do+9VBCV4o3Wv/oUfOYLierOGuHk9xgDDQjEXVNVwjZCL7LK/RssEcQDS?=
 =?us-ascii?Q?hGwpq0lvJWSmU91iDMnCaQ+nZo2bN4sa4jJSU2CMMqAqDU/gL6jYJH3UJE/r?=
 =?us-ascii?Q?CJgDsWIsZPOXtyAo8yuEGZyFc1BMnZEawRLpjLGDWayx1o2nCsnsWIaHS5TL?=
 =?us-ascii?Q?/SbMSY1NBkudvKUjl9hCizhZRKryfaCtYGEuU/yGo1E1auVnBF2D/HdaMBSu?=
 =?us-ascii?Q?ZQBNQxCn/h6zm6xiw2NwQY/JY+ZjnOL3AzumdPombzkCW91M0v6unnwALjxW?=
 =?us-ascii?Q?R2PasCXA8hFVrl4XZ4Z6tI60NVs1U6kFJXuSOfsWwPL407QVblQ293VCGnGw?=
 =?us-ascii?Q?N2Xx8bAaLbudOktVx1eueaVSRw8W/6h+sJab8bbOR3G77A7l4hanzcwhBHxP?=
 =?us-ascii?Q?8fjRfTA+IXUootP88CK7SDSH7ZBFRxAZwF0Uyf0YkHCCxel1rpxCOdiYKp/H?=
 =?us-ascii?Q?jiuWGRm75RDJp+1s5mpSfpK0DD7gi/onHbmrgE04u5xV/sZaDSprI2moo99x?=
 =?us-ascii?Q?QE4urrkdjmNfLE9YlRoQCFIB2fRRTuNs9X/4gfFbPOSXUv6DiXeXbCXSA9/Q?=
 =?us-ascii?Q?aCiAxYqq9tgc5UWM/4BqC1phconBoko0PYgwi+V7meQr4QMBqO04UGgXqw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?IQcpDKg2Yv6GyT8dfN/fpqheBZ8K6LIDeIcfikYoZ4lPcHR2QhhGLxnZnqTB?=
 =?us-ascii?Q?Q9Ko7aDTFVh/pEe8o4Mjft1pO/uJ6HAU3R4Ooc8NKNd4di+hXjr/GkRQaUNu?=
 =?us-ascii?Q?VJq1b2fpKWsJYOm7DkjNFgqfxZEETTghKLst5u+FL0TaUf20or5LZIncjI3q?=
 =?us-ascii?Q?/YZ5qbKRt5/6DpaUm8OIfdbMOEk0FCCl7DKwhoyCrauDubxLaTdv84hBEQTo?=
 =?us-ascii?Q?m9jSZkkEGAm5kWR0ipS7AZP183FtchEtxveH56HEXaMeo4s1bK24HnZfywH1?=
 =?us-ascii?Q?FWTgVE7i6Y57j/jJbbbS9NHDaxj6nf7GpieyJbdYeJrrflOTaR25nvWG/MgX?=
 =?us-ascii?Q?+MElDOe+t9OX0w3iB/4olx5ysId7nHrCI3tMeGW/slmYLYGPDX+T/QAlxFEe?=
 =?us-ascii?Q?42fZbOCP+CufOakA3q1XLkvjRMGW15xeQU2wwivYQJg5g2AId2Rfd55tXYuH?=
 =?us-ascii?Q?c6XImR8za3oeUbyzxB1sO2YKPIb8lKLr8qvEHloDoFbH4TnM++VfNWeNuh4r?=
 =?us-ascii?Q?2M4jmJMd9FRDSCvS7iXf+7GJ2q6K+kbpHXgBx3PHKdUOQuVNBuKqF0hp9hYS?=
 =?us-ascii?Q?LNRUpfMJT4FRKg2mXZxGOBMcxTgJOtAQKJHfUDvw0sCFkSpVem/HFxVJzrH8?=
 =?us-ascii?Q?wUKRalJFS5y/ZnIsDTw82/2lg4HI1DsLYdxMFjHNadYj3AB0rOpAX7TmNIVA?=
 =?us-ascii?Q?305deaRT0KYt4M85Ho1yYJWiDnRoFku+MNg/+TulRzsMo2zj9N/kGT6P64R1?=
 =?us-ascii?Q?HFxltJ097oKugNWQ6Gt606fHWrN7ZAL4sUcHy/QhvMSvjwAPN3bc1qZRefUn?=
 =?us-ascii?Q?hQQIyCwiwkRhczZoYgZNquGejeZUOEmoA+NLpcsGHhzSVxgnC8c7kJ3PtDaa?=
 =?us-ascii?Q?l3Q+0i+Q+Ng0cSyhHMttizca2CLgTbxcncsVkHSSZO2Lr2sbPHhJbR6mZdyM?=
 =?us-ascii?Q?jpp3P9AS8rBFPc1A5sEzgnc/fhtFbXDuj75zVtL9Bs9mhA3FvXOVSjz8pVT/?=
 =?us-ascii?Q?obe9wbdMrlxCmeYKbMpnGjSmwpo5dO/GCQyRAJv1yASUmSTdWOrL+EVxb6uF?=
 =?us-ascii?Q?LiDjxXMoeZwbNe7IF2WgObVKctyQrSzEA0zIzrDQhY4lxXb+ghsWkuDn1h5X?=
 =?us-ascii?Q?o8eioOOPEt97LyxIRjp51M7ypuFY6XNtvxRUDCP+QivWSqdL3Owm5ay8O0eJ?=
 =?us-ascii?Q?FmWOn4UtVNtjl2Hp5+tUqjzQWaGjpHL37MGdG7BOXGy6oVqd5gnYU+ygdkD5?=
 =?us-ascii?Q?4PDiHAwxENCt9czemtnfeai2q4YBWkzivYP/lu+GmKAt/HVMjeF+QHh8SIpY?=
 =?us-ascii?Q?xDgJsrZlOhKKXkE5RnWUDb7lhmZTOeuCeND/twh40IqvwnhHf0TF3EDoRh7J?=
 =?us-ascii?Q?XxaaHDJdQ1TVRhqcLapuqCegH7u5LOEz6ihOnNpJ8wSN2a/gAhfzzYbPVSWy?=
 =?us-ascii?Q?m5yn9ZZ7OWcEP51uhNRN31Z3eSEt/xRtgav+OD+qr/PtekT5D1rVDnhBcld3?=
 =?us-ascii?Q?egbAq+GKIrXENmACYR4djZmM2JDJu4ccwxuF7NiL+JfWs50j5ix41oeDmhit?=
 =?us-ascii?Q?pH9y4HUxMbHxsFgRLgXNwBVALENja7W5VmVN47K5ritmAPf0VnOVSFATj/Rm?=
 =?us-ascii?Q?6LrJ/gMDQacVsahSdoY81wCh7NwrPqEC8ejKHcP+Mit0qTu0gi25hO5Npj1q?=
 =?us-ascii?Q?7qNnGZrZG+esJ8+W/8IJbufLvmfG0Rcbp+YJVmQl+lom5Oy2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277a78ff-f196-4a5e-ba35-08de52f78587
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 23:00:18.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktmIDYw62qqf+lFoYFlbWwH+vRn84+Ao+EdNa5ky6FTMFTazFOwDh4PlNgZYnD4C0E9//rRMHwLvHjj3baoI8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

On Tue, Jan 13, 2026 at 11:44:56PM +0100, Michael Riesch wrote:
> Hi Frank,
>
> On 1/13/26 22:59, Frank Li wrote:
> > [...]
> >> +#define CSI2HOST_N_LANES     0x04
> >> +#define CSI2HOST_CSI2_RESETN 0x10
> >> +#define CSI2HOST_PHY_STATE   0x14
> >> +#define CSI2HOST_ERR1	     0x20
> >> +#define CSI2HOST_ERR2	     0x24
> >> +#define CSI2HOST_MSK1	     0x28
> >> +#define CSI2HOST_MSK2	     0x2c
> >> +#define CSI2HOST_CONTROL     0x40
> >
> > I remember I said before. It is DWC compatible's CSI2 controller, even
> > it is not name as DWC. The register define and offset is the same.
> >
> > Can you move to
> > drivers/media/platform/synopsys/
> >
> > So other vendor can be reuse it easily.
>
> Quote from my mail from 2025-11-26: "In principle, I agree with
> refactoring out common code. However, I am
> not sure how similar these IP cores really are. Again, the answer I
> received from Rockchip states that this is *not* a Synopsys IP core.

This is not important. Many difference vendor controller is compatible.

Register define and offset is the same.

>
> Can you maybe test whether the Rockchip MIPI CSI-2 Receiver driver in
> this series works on your hardware? Then we will know if (and what)
> parts can be shared." [0]

Laurent have not reply my last email
https://lore.kernel.org/all/aS3XfZFF8rmt8ZT6@lizhi-Precision-Tower-5810/

If agree base on this patch for DWC CSI2 support, I can start test it
at my hardware, which need some efforts to adapt it. If maintainer have
difference idea, that waste efforts.

Frank
>
> You didn't even bother to reply to that. Of course, I *could* rename the
> driver and move it (hey, I already did that once [1], why not again),
> but why should I bother given that you don't even respond to my (I'd
> still say reasonable) request?
>
> All that said, this can be resolved quite easily: if you test the driver
> at hand on your HW and confirm that it works for you, and I don't hear
> any other objections, I'll rename the driver, change the prefixes to
> "csirx_", and move it to drivers/media/platform/synopsys/csirx.
> Suggestions for better naming welcome of course.
>
> However, if I don't hear from you, I'll ask the maintainers kindly to
> apply the patches at hand. They have seen 11 iterations in total (v6-v14
> of the RK3568 VICAP series and v1-v2 of this series) and I doubt there
> is any harm in accepting it. The driver can be renamed and moved at a
> later stage as well, BTW.
>
> Best regards,
> Michael
>
> [0]
> https://lore.kernel.org/all/87049b4c-df7d-454b-a7f4-073975a7ee94@collabora.com/
> [1]
> https://lore.kernel.org/all/3aab9697-30fe-4697-a5ac-7fb8ebb61213@collabora.com/
>
>
> >
> > Frank
> >
> >> +
> >> +#define SW_CPHY_EN(x)	     ((x) << 0)
> >> +#define SW_DSI_EN(x)	     ((x) << 4)
> >> +#define SW_DATATYPE_FS(x)    ((x) << 8)
> >> +#define SW_DATATYPE_FE(x)    ((x) << 14)
> >> +#define SW_DATATYPE_LS(x)    ((x) << 20)
> >> +#define SW_DATATYPE_LE(x)    ((x) << 26)
> >> +
> >> +#define RKCSI_CLKS_MAX	     1
> >> +
> >> +enum {
> >> +	RKCSI_PAD_SINK,
> >> +	RKCSI_PAD_SRC,
> >> +	RKCSI_PAD_MAX,
> >> +};
> >> +
> >> +struct rkcsi_format {
> >> +	u32 code;
> >> +	u8 depth;
> >> +	u8 csi_dt;
> >> +};
> >> +
> >> +struct rkcsi_device {
> >> +	struct device *dev;
> >> +
> >> +	void __iomem *base_addr;
> >> +	struct clk_bulk_data *clks;
> >> +	unsigned int clks_num;
> >> +	struct phy *phy;
> >> +	struct reset_control *reset;
> >> +
> >> +	const struct rkcsi_format *formats;
> >> +	unsigned int formats_num;
> >> +
> >> +	struct media_pad pads[RKCSI_PAD_MAX];
> >> +	struct v4l2_async_notifier notifier;
> >> +	struct v4l2_fwnode_endpoint vep;
> >> +	struct v4l2_subdev sd;
> >> +
> >> +	struct v4l2_subdev *source_sd;
> >> +	u32 source_pad;
> >> +};
> >> +
> >> +static const struct v4l2_mbus_framefmt default_format = {
> >> +	.width = 3840,
> >> +	.height = 2160,
> >> +	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> >> +	.field = V4L2_FIELD_NONE,
> >> +	.colorspace = V4L2_COLORSPACE_RAW,
> >> +	.ycbcr_enc = V4L2_YCBCR_ENC_601,
> >> +	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> >> +	.xfer_func = V4L2_XFER_FUNC_NONE,
> >> +};
> >> +
> >> +static const struct rkcsi_format formats[] = {
> >> +	/* YUV formats */
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> >> +		.depth = 16,
> >> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> >> +		.depth = 16,
> >> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_YVYU8_1X16,
> >> +		.depth = 16,
> >> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_VYUY8_1X16,
> >> +		.depth = 16,
> >> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> >> +	},
> >> +	/* RGB formats */
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> >> +		.depth = 24,
> >> +		.csi_dt = MIPI_CSI2_DT_RGB888,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> >> +		.depth = 24,
> >> +		.csi_dt = MIPI_CSI2_DT_RGB888,
> >> +	},
> >> +	/* Bayer formats */
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> >> +		.depth = 8,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> >> +		.depth = 8,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> >> +		.depth = 8,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> >> +		.depth = 8,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> >> +		.depth = 10,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> >> +		.depth = 10,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> >> +		.depth = 10,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> >> +		.depth = 10,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> >> +		.depth = 12,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> >> +		.depth = 12,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> >> +		.depth = 12,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> >> +	},
> >> +	{
> >> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> >> +		.depth = 12,
> >> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> >> +	},
> >> +};
> >> +
> >> +static inline struct rkcsi_device *to_rkcsi(struct v4l2_subdev *sd)
> >> +{
> >> +	return container_of(sd, struct rkcsi_device, sd);
> >> +}
> >> +
> >> +static inline __maybe_unused void rkcsi_write(struct rkcsi_device *csi_dev,
> >> +					      unsigned int addr, u32 val)
> >> +{
> >> +	writel(val, csi_dev->base_addr + addr);
> >> +}
> >> +
> >> +static inline __maybe_unused u32 rkcsi_read(struct rkcsi_device *csi_dev,
> >> +					    unsigned int addr)
> >> +{
> >> +	return readl(csi_dev->base_addr + addr);
> >> +}
> >> +
> >> +static const struct rkcsi_format *
> >> +rkcsi_find_format(struct rkcsi_device *csi_dev, u32 mbus_code)
> >> +{
> >> +	const struct rkcsi_format *format;
> >> +
> >> +	WARN_ON(csi_dev->formats_num == 0);
> >> +
> >> +	for (int i = 0; i < csi_dev->formats_num; i++) {
> >> +		format = &csi_dev->formats[i];
> >> +		if (format->code == mbus_code)
> >> +			return format;
> >> +	}
> >> +
> >> +	return NULL;
> >> +}
> >> +
> >> +static int rkcsi_start(struct rkcsi_device *csi_dev)
> >> +{
> >> +	struct media_pad *source_pad =
> >> +		&csi_dev->source_sd->entity.pads[csi_dev->source_pad];
> >> +	enum v4l2_mbus_type bus_type = csi_dev->vep.bus_type;
> >> +	union phy_configure_opts opts;
> >> +	s64 link_freq;
> >> +	u32 lanes = csi_dev->vep.bus.mipi_csi2.num_data_lanes;
> >> +	u32 control = 0;
> >> +	int ret;
> >> +
> >> +	if (lanes < 1 || lanes > 4)
> >> +		return -EINVAL;
> >> +
> >> +	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
> >> +	link_freq = v4l2_get_link_freq(source_pad, 0, 0);
> >> +	if (link_freq <= 0)
> >> +		return -EINVAL;
> >> +
> >> +	if (bus_type == V4L2_MBUS_CSI2_DPHY) {
> >> +		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> >> +
> >> +		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
> >> +								 lanes, cfg);
> >> +		if (ret)
> >> +			return ret;
> >> +
> >> +		ret = phy_set_mode(csi_dev->phy, PHY_MODE_MIPI_DPHY);
> >> +		if (ret)
> >> +			return ret;
> >> +
> >> +		ret = phy_configure(csi_dev->phy, &opts);
> >> +		if (ret)
> >> +			return ret;
> >> +
> >> +		control |= SW_CPHY_EN(0);
> >> +
> >> +	} else if (bus_type == V4L2_MBUS_CSI2_CPHY) {
> >> +		/* TODO: implement CPHY configuration */
> >> +		return -EOPNOTSUPP;
> >> +	} else {
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
> >> +		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
> >> +
> >> +	rkcsi_write(csi_dev, CSI2HOST_N_LANES, lanes - 1);
> >> +	rkcsi_write(csi_dev, CSI2HOST_CONTROL, control);
> >> +	rkcsi_write(csi_dev, CSI2HOST_CSI2_RESETN, 1);
> >> +
> >> +	ret = phy_power_on(csi_dev->phy);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void rkcsi_stop(struct rkcsi_device *csi_dev)
> >> +{
> >> +	phy_power_off(csi_dev->phy);
> >> +
> >> +	rkcsi_write(csi_dev, CSI2HOST_CSI2_RESETN, 0);
> >> +	rkcsi_write(csi_dev, CSI2HOST_MSK1, ~0);
> >> +	rkcsi_write(csi_dev, CSI2HOST_MSK2, ~0);
> >> +}
> >> +
> >> +static const struct media_entity_operations rkcsi_media_ops = {
> >> +	.link_validate = v4l2_subdev_link_validate,
> >> +};
> >> +
> >> +static int rkcsi_enum_mbus_code(struct v4l2_subdev *sd,
> >> +				struct v4l2_subdev_state *sd_state,
> >> +				struct v4l2_subdev_mbus_code_enum *code)
> >> +{
> >> +	struct rkcsi_device *csi_dev = to_rkcsi(sd);
> >> +
> >> +	if (code->pad == RKCSI_PAD_SRC) {
> >> +		const struct v4l2_mbus_framefmt *sink_fmt;
> >> +
> >> +		if (code->index)
> >> +			return -EINVAL;
> >> +
> >> +		sink_fmt = v4l2_subdev_state_get_format(sd_state,
> >> +							RKCSI_PAD_SINK);
> >> +		code->code = sink_fmt->code;
> >> +
> >> +		return 0;
> >> +	} else if (code->pad == RKCSI_PAD_SINK) {
> >> +		if (code->index > csi_dev->formats_num)
> >> +			return -EINVAL;
> >> +
> >> +		code->code = csi_dev->formats[code->index].code;
> >> +		return 0;
> >> +	}
> >> +
> >> +	return -EINVAL;
> >> +}
> >> +
> >> +static int rkcsi_set_fmt(struct v4l2_subdev *sd,
> >> +			 struct v4l2_subdev_state *state,
> >> +			 struct v4l2_subdev_format *format)
> >> +{
> >> +	struct rkcsi_device *csi_dev = to_rkcsi(sd);
> >> +	const struct rkcsi_format *fmt;
> >> +	struct v4l2_mbus_framefmt *sink, *src;
> >> +
> >> +	/* the format on the source pad always matches the sink pad */
> >> +	if (format->pad == RKCSI_PAD_SRC)
> >> +		return v4l2_subdev_get_fmt(sd, state, format);
> >> +
> >> +	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> >> +	if (!sink)
> >> +		return -EINVAL;
> >> +
> >> +	fmt = rkcsi_find_format(csi_dev, format->format.code);
> >> +	if (!fmt)
> >> +		format->format = default_format;
> >> +
> >> +	*sink = format->format;
> >> +
> >> +	/* propagate the format to the source pad */
> >> +	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> >> +							   format->stream);
> >> +	if (!src)
> >> +		return -EINVAL;
> >> +
> >> +	*src = *sink;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int rkcsi_set_routing(struct v4l2_subdev *sd,
> >> +			     struct v4l2_subdev_state *state,
> >> +			     enum v4l2_subdev_format_whence which,
> >> +			     struct v4l2_subdev_krouting *routing)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = v4l2_subdev_routing_validate(sd, routing,
> >> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> >> +					       &default_format);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int rkcsi_enable_streams(struct v4l2_subdev *sd,
> >> +				struct v4l2_subdev_state *state, u32 pad,
> >> +				u64 streams_mask)
> >> +{
> >> +	struct rkcsi_device *csi_dev = to_rkcsi(sd);
> >> +	struct v4l2_subdev *remote_sd;
> >> +	struct media_pad *sink_pad, *remote_pad;
> >> +	struct device *dev = csi_dev->dev;
> >> +	u64 mask;
> >> +	int ret;
> >> +
> >> +	sink_pad = &sd->entity.pads[RKCSI_PAD_SINK];
> >> +	remote_pad = media_pad_remote_pad_first(sink_pad);
> >> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> >> +
> >> +	mask = v4l2_subdev_state_xlate_streams(state, RKCSI_PAD_SINK,
> >> +					       RKCSI_PAD_SRC, &streams_mask);
> >> +
> >> +	ret = pm_runtime_resume_and_get(dev);
> >> +	if (ret)
> >> +		goto err;
> >> +
> >> +	ret = rkcsi_start(csi_dev);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to enable CSI hardware\n");
> >> +		goto err_pm_runtime_put;
> >> +	}
> >> +
> >> +	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
> >> +	if (ret)
> >> +		goto err_csi_stop;
> >> +
> >> +	return 0;
> >> +
> >> +err_csi_stop:
> >> +	rkcsi_stop(csi_dev);
> >> +err_pm_runtime_put:
> >> +	pm_runtime_put_sync(dev);
> >> +err:
> >> +	return ret;
> >> +}
> >> +
> >> +static int rkcsi_disable_streams(struct v4l2_subdev *sd,
> >> +				 struct v4l2_subdev_state *state, u32 pad,
> >> +				 u64 streams_mask)
> >> +{
> >> +	struct rkcsi_device *csi_dev = to_rkcsi(sd);
> >> +	struct v4l2_subdev *remote_sd;
> >> +	struct media_pad *sink_pad, *remote_pad;
> >> +	struct device *dev = csi_dev->dev;
> >> +	u64 mask;
> >> +	int ret;
> >> +
> >> +	sink_pad = &sd->entity.pads[RKCSI_PAD_SINK];
> >> +	remote_pad = media_pad_remote_pad_first(sink_pad);
> >> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> >> +
> >> +	mask = v4l2_subdev_state_xlate_streams(state, RKCSI_PAD_SINK,
> >> +					       RKCSI_PAD_SRC, &streams_mask);
> >> +
> >> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> >> +
> >> +	rkcsi_stop(csi_dev);
> >> +
> >> +	pm_runtime_mark_last_busy(dev);
> >> +	pm_runtime_put_autosuspend(dev);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static const struct v4l2_subdev_pad_ops rkcsi_pad_ops = {
> >> +	.enum_mbus_code = rkcsi_enum_mbus_code,
> >> +	.get_fmt = v4l2_subdev_get_fmt,
> >> +	.set_fmt = rkcsi_set_fmt,
> >> +	.set_routing = rkcsi_set_routing,
> >> +	.enable_streams = rkcsi_enable_streams,
> >> +	.disable_streams = rkcsi_disable_streams,
> >> +};
> >> +
> >> +static const struct v4l2_subdev_ops rkcsi_ops = {
> >> +	.pad = &rkcsi_pad_ops,
> >> +};
> >> +
> >> +static int rkcsi_init_state(struct v4l2_subdev *sd,
> >> +			    struct v4l2_subdev_state *state)
> >> +{
> >> +	struct v4l2_subdev_route routes[] = {
> >> +		{
> >> +			.sink_pad = RKCSI_PAD_SINK,
> >> +			.sink_stream = 0,
> >> +			.source_pad = RKCSI_PAD_SRC,
> >> +			.source_stream = 0,
> >> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> >> +		},
> >> +	};
> >> +	struct v4l2_subdev_krouting routing = {
> >> +		.len_routes = ARRAY_SIZE(routes),
> >> +		.num_routes = ARRAY_SIZE(routes),
> >> +		.routes = routes,
> >> +	};
> >> +	int ret;
> >> +
> >> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> >> +					       &default_format);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static const struct v4l2_subdev_internal_ops rkcsi_internal_ops = {
> >> +	.init_state = rkcsi_init_state,
> >> +};
> >> +
> >> +static int rkcsi_notifier_bound(struct v4l2_async_notifier *notifier,
> >> +				struct v4l2_subdev *sd,
> >> +				struct v4l2_async_connection *asd)
> >> +{
> >> +	struct rkcsi_device *csi_dev =
> >> +		container_of(notifier, struct rkcsi_device, notifier);
> >> +	int source_pad;
> >> +
> >> +	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
> >> +						 MEDIA_PAD_FL_SOURCE);
> >> +	if (source_pad < 0) {
> >> +		dev_err(csi_dev->dev, "failed to find source pad for %s\n",
> >> +			sd->name);
> >> +		return source_pad;
> >> +	}
> >> +
> >> +	csi_dev->source_sd = sd;
> >> +	csi_dev->source_pad = source_pad;
> >> +
> >> +	return media_create_pad_link(&sd->entity, source_pad,
> >> +				     &csi_dev->sd.entity, RKCSI_PAD_SINK,
> >> +				     MEDIA_LNK_FL_ENABLED);
> >> +}
> >> +
> >> +static const struct v4l2_async_notifier_operations rkcsi_notifier_ops = {
> >> +	.bound = rkcsi_notifier_bound,
> >> +};
> >> +
> >> +static int rkcsi_register_notifier(struct rkcsi_device *csi_dev)
> >> +{
> >> +	struct v4l2_async_connection *asd;
> >> +	struct v4l2_async_notifier *ntf = &csi_dev->notifier;
> >> +	struct v4l2_fwnode_endpoint *vep = &csi_dev->vep;
> >> +	struct v4l2_subdev *sd = &csi_dev->sd;
> >> +	struct device *dev = csi_dev->dev;
> >> +	struct fwnode_handle *ep;
> >> +	int ret = 0;
> >> +
> >> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> >> +	if (!ep)
> >> +		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
> >> +
> >> +	vep->bus_type = V4L2_MBUS_UNKNOWN;
> >> +	ret = v4l2_fwnode_endpoint_parse(ep, vep);
> >> +	if (ret) {
> >> +		ret = dev_err_probe(dev, ret, "failed to parse endpoint\n");
> >> +		goto out;
> >> +	}
> >> +
> >> +	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY &&
> >> +	    vep->bus_type != V4L2_MBUS_CSI2_CPHY) {
> >> +		ret = dev_err_probe(dev, -EINVAL,
> >> +				    "invalid bus type of endpoint\n");
> >> +		goto out;
> >> +	}
> >> +
> >> +	v4l2_async_subdev_nf_init(ntf, sd);
> >> +	ntf->ops = &rkcsi_notifier_ops;
> >> +
> >> +	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
> >> +					      struct v4l2_async_connection);
> >> +	if (IS_ERR(asd)) {
> >> +		ret = PTR_ERR(asd);
> >> +		goto err_nf_cleanup;
> >> +	}
> >> +
> >> +	ret = v4l2_async_nf_register(ntf);
> >> +	if (ret) {
> >> +		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
> >> +		goto err_nf_cleanup;
> >> +	}
> >> +
> >> +	goto out;
> >> +
> >> +err_nf_cleanup:
> >> +	v4l2_async_nf_cleanup(ntf);
> >> +out:
> >> +	fwnode_handle_put(ep);
> >> +	return ret;
> >> +}
> >> +
> >> +static int rkcsi_register(struct rkcsi_device *csi_dev)
> >> +{
> >> +	struct media_pad *pads = csi_dev->pads;
> >> +	struct v4l2_subdev *sd = &csi_dev->sd;
> >> +	int ret;
> >> +
> >> +	ret = rkcsi_register_notifier(csi_dev);
> >> +	if (ret)
> >> +		goto err;
> >> +
> >> +	v4l2_subdev_init(sd, &rkcsi_ops);
> >> +	sd->dev = csi_dev->dev;
> >> +	sd->entity.ops = &rkcsi_media_ops;
> >> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> >> +	sd->internal_ops = &rkcsi_internal_ops;
> >> +	sd->owner = THIS_MODULE;
> >> +	snprintf(sd->name, sizeof(sd->name), "rockchip-mipi-csi %s",
> >> +		 dev_name(csi_dev->dev));
> >> +
> >> +	pads[RKCSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
> >> +				     MEDIA_PAD_FL_MUST_CONNECT;
> >> +	pads[RKCSI_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> >> +	ret = media_entity_pads_init(&sd->entity, RKCSI_PAD_MAX, pads);
> >> +	if (ret)
> >> +		goto err_notifier_unregister;
> >> +
> >> +	ret = v4l2_subdev_init_finalize(sd);
> >> +	if (ret)
> >> +		goto err_entity_cleanup;
> >> +
> >> +	ret = v4l2_async_register_subdev(sd);
> >> +	if (ret) {
> >> +		dev_err(sd->dev, "failed to register CSI subdev\n");
> >> +		goto err_subdev_cleanup;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +err_subdev_cleanup:
> >> +	v4l2_subdev_cleanup(sd);
> >> +err_entity_cleanup:
> >> +	media_entity_cleanup(&sd->entity);
> >> +err_notifier_unregister:
> >> +	v4l2_async_nf_unregister(&csi_dev->notifier);
> >> +	v4l2_async_nf_cleanup(&csi_dev->notifier);
> >> +err:
> >> +	return ret;
> >> +}
> >> +
> >> +static void rkcsi_unregister(struct rkcsi_device *csi_dev)
> >> +{
> >> +	struct v4l2_subdev *sd = &csi_dev->sd;
> >> +
> >> +	v4l2_async_unregister_subdev(sd);
> >> +	v4l2_subdev_cleanup(sd);
> >> +	media_entity_cleanup(&sd->entity);
> >> +	v4l2_async_nf_unregister(&csi_dev->notifier);
> >> +	v4l2_async_nf_cleanup(&csi_dev->notifier);
> >> +}
> >> +
> >> +static const struct of_device_id rkcsi_of_match[] = {
> >> +	{
> >> +		.compatible = "rockchip,rk3568-mipi-csi",
> >> +	},
> >> +	{}
> >> +};
> >> +MODULE_DEVICE_TABLE(of, rkcsi_of_match);
> >> +
> >> +static int rkcsi_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev = &pdev->dev;
> >> +	struct rkcsi_device *csi_dev;
> >> +	int ret;
> >> +
> >> +	csi_dev = devm_kzalloc(dev, sizeof(*csi_dev), GFP_KERNEL);
> >> +	if (!csi_dev)
> >> +		return -ENOMEM;
> >> +	csi_dev->dev = dev;
> >> +	dev_set_drvdata(dev, csi_dev);
> >> +
> >> +	csi_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
> >> +	if (IS_ERR(csi_dev->base_addr))
> >> +		return PTR_ERR(csi_dev->base_addr);
> >> +
> >> +	ret = devm_clk_bulk_get_all(dev, &csi_dev->clks);
> >> +	if (ret != RKCSI_CLKS_MAX)
> >> +		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> >> +	csi_dev->clks_num = ret;
> >> +
> >> +	csi_dev->phy = devm_phy_get(dev, NULL);
> >> +	if (IS_ERR(csi_dev->phy))
> >> +		return dev_err_probe(dev, PTR_ERR(csi_dev->phy),
> >> +				     "failed to get MIPI CSI PHY\n");
> >> +
> >> +	csi_dev->reset = devm_reset_control_get_exclusive(dev, NULL);
> >> +	if (IS_ERR(csi_dev->reset))
> >> +		return dev_err_probe(dev, PTR_ERR(csi_dev->reset),
> >> +				     "failed to get reset\n");
> >> +
> >> +	csi_dev->formats = formats;
> >> +	csi_dev->formats_num = ARRAY_SIZE(formats);
> >> +
> >> +	pm_runtime_enable(dev);
> >> +
> >> +	ret = phy_init(csi_dev->phy);
> >> +	if (ret) {
> >> +		ret = dev_err_probe(dev, ret,
> >> +				    "failed to initialize MIPI CSI PHY\n");
> >> +		goto err_pm_runtime_disable;
> >> +	}
> >> +
> >> +	ret = rkcsi_register(csi_dev);
> >> +	if (ret)
> >> +		goto err_phy_exit;
> >> +
> >> +	return 0;
> >> +
> >> +err_phy_exit:
> >> +	phy_exit(csi_dev->phy);
> >> +err_pm_runtime_disable:
> >> +	pm_runtime_disable(dev);
> >> +	return ret;
> >> +}
> >> +
> >> +static void rkcsi_remove(struct platform_device *pdev)
> >> +{
> >> +	struct rkcsi_device *csi_dev = platform_get_drvdata(pdev);
> >> +	struct device *dev = &pdev->dev;
> >> +
> >> +	rkcsi_unregister(csi_dev);
> >> +	phy_exit(csi_dev->phy);
> >> +	pm_runtime_disable(dev);
> >> +}
> >> +
> >> +static int rkcsi_runtime_suspend(struct device *dev)
> >> +{
> >> +	struct rkcsi_device *csi_dev = dev_get_drvdata(dev);
> >> +
> >> +	clk_bulk_disable_unprepare(csi_dev->clks_num, csi_dev->clks);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int rkcsi_runtime_resume(struct device *dev)
> >> +{
> >> +	struct rkcsi_device *csi_dev = dev_get_drvdata(dev);
> >> +	int ret;
> >> +
> >> +	reset_control_assert(csi_dev->reset);
> >> +	udelay(5);
> >> +	reset_control_deassert(csi_dev->reset);
> >> +
> >> +	ret = clk_bulk_prepare_enable(csi_dev->clks_num, csi_dev->clks);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to enable clocks\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct dev_pm_ops rkcsi_pm_ops = {
> >> +	.runtime_suspend = rkcsi_runtime_suspend,
> >> +	.runtime_resume = rkcsi_runtime_resume,
> >> +};
> >> +
> >> +static struct platform_driver rkcsi_drv = {
> >> +	.driver = {
> >> +		   .name = "rockchip-mipi-csi",
> >> +		   .of_match_table = rkcsi_of_match,
> >> +		   .pm = &rkcsi_pm_ops,
> >> +	},
> >> +	.probe = rkcsi_probe,
> >> +	.remove = rkcsi_remove,
> >> +};
> >> +module_platform_driver(rkcsi_drv);
> >> +
> >> +MODULE_DESCRIPTION("Rockchip MIPI CSI-2 Receiver platform driver");
> >> +MODULE_LICENSE("GPL");
> >>
> >> --
> >> 2.39.5
> >>
>

