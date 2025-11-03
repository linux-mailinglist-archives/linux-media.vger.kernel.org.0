Return-Path: <linux-media+bounces-46226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C03FAC2D717
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 18:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44E1F188237A
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 17:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CA331B111;
	Mon,  3 Nov 2025 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hn6T1KfZ"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3B31960B;
	Mon,  3 Nov 2025 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762190385; cv=fail; b=Xc0jQa7zz6vDYx+QnRW4FBgp1yQb6LsNXraL7HrRxXoTVRNjZAp57WegreJNqcIYWCem1vOLbdnnunAbJxlm4BRq+QgYMGMnpIe7FpfcM87ToF2m0lyIOHVjWTMrr3eoybxLq9W5JFNXQgo660/3Cqs8M5fc5TMRnI4vEtq5MRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762190385; c=relaxed/simple;
	bh=ZjlWYimgecxTAjam4DZ6EwRs50tC7RiXHn4bKZW/+Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZdmOzz9dDLIKOjj5YJxBnM/tiNod1u3h42hppelfdLWK9gVeuRuerMN/CLxoxeg5O0UYpJmPBfLIlwZXqTOARKfQLYN4XmMEOXgL2iyMTOAlY5Zh7pStZEKuRt9hTYJBy7avu6aNmqjVQKDIoG6cfMCPAPqBmWjRI+ClRdp1M4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hn6T1KfZ; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7QtEH0QtUvjtHwtpD5YUKBtwKsuWM23h1o9NDzInPv0cmTtuzxpzHPAaA54af+8Lvp2/+9wyZUTaekEALSbqhkwbp/9y4d2jyYuVsOyJICbrUHI+qXCNqLPPQQGADiMsaeqyMxAfAQjqA2FgIftgNecJI0g6IHeuIrkjDN6Uv2/r2A63Nh5RhlZW0+ILCj7gMQxn3So2KnKWCXR8rnWFaVReHAzMQ/vI3m2E5gZkjx3DMF/5oCC8R0xRc4Ib1XmaQUJFk/RLCI11RoCPOtI/oE0MMAGUELPiMzTRG08Jj5S5fYK6sQQdrbhSWcY4nxEBOkKyvf4ffOPdrf6LHWzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YJvNS7mXHjtKpHzE2dOF5gTX6Avx4OMlGdFZ5qV9wk=;
 b=oJtjL1nmmQdqQyVFOZrUB3MI+ljwITPLrpi4sgPkt3WeoT9t9zdPeh94mDNwK8vSRqdi/Cd+HvPq1r20H4P7ua93cELLBPAM34b4zXR/C+JVXwuTXGNvS6scVycPAyNfZ2qhITMkbPnX8m7y8xa4QasGJfyEQhLApUZnq66uMB96K/Bu3ntMFfmj0dZ8pFMzOa2coHJRZYtsv1nUbe6hBqFMqlkuSQhmZMnk42AIMmRY5qO4wDf/c4+vRFeipyLWMAnRLS0Qmg1CXAQ5AFQ6zCQIa2nNHbGsJ8VRN/hV/xHzeIPo9lwB7DQ/MhwjgunWo4WHiRwTDthC2IPlj5JG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YJvNS7mXHjtKpHzE2dOF5gTX6Avx4OMlGdFZ5qV9wk=;
 b=hn6T1KfZWd9HJLALaQ0e5uC6QsTYvZluqguOABXHrPKoufkfHJTvQxb7bbLOeOn4eFHH6WDpmlzFg/rgdMUiAzuUJiEaCnKdUynBJhbwQHncs7sh+oNuQWZUzyd3SLOu8nOO7B+1t+AH749Gz1gd4eiMVFVaGXE3ftdPFOrja2jQADwNsJSDC9Eh+MoKxTCPkITImSlVKvTXN/YemfxyawSUC5C9tzvwDamh9n814oyuO1Lf+0n3/dvL2zIs5+BoiHDbNgag7Tu0hAKAnNTclqec5aZbsFns22NphHMtzv/B19ZXHkSDrs6oh4QGSEbnrL7+6XXi2RMhCoJIQ4vWlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 17:19:38 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 17:19:37 +0000
Date: Mon, 3 Nov 2025 12:19:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v3 00/31] media: add imx93 mipi/controller csi support
Message-ID: <aQjkG2f/Dgt0SLxz@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca9a862-67c1-445a-cb5f-08de1afd297c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|7416014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?U2uDe0KdPBl1VThIKL0VfhMy5QtI039y/28opZeWwQ89I2oRcMpy6bn1eevL?=
 =?us-ascii?Q?5CMIV4Fk66Dbl+yFYSiHDkJJX4jawPSsMixX7CXCHgl3IeXXKG5u6VERr6Cu?=
 =?us-ascii?Q?TP2xx2HwblcfL8Bg+MV2XRiXKKdJ+U6WunKjUu7q+fkWy/5Bd3ZHHU1VrcJG?=
 =?us-ascii?Q?sacsIfowgxH51HaevsOY1QvqEoSO7+tAvviiheUESAWzN7ezmilnLBCwnIsa?=
 =?us-ascii?Q?+GKIr/Wy6K1j5sIgDeGA+kWS4izqDUT8TEDk3QMHU+EX7K4ItWMCoXXtwcpe?=
 =?us-ascii?Q?i7Nj2iKRP04e1HizlUUTBEdFsv8EEFegqIX0vZcinPVjRUB39/VFZb8wNQ7y?=
 =?us-ascii?Q?0mImh6SQxYK1QDywXQmRlPL2qQgPdZHb1CoXagFMoTjvjHalQFgTc08I9c05?=
 =?us-ascii?Q?SpyV7Urdm2vQvTEYbtVJGu9dOFAxUneQ3SfuG+GbS9kMuTVidNlVVL2xsl97?=
 =?us-ascii?Q?mahezDHtTIdMpb4Nfn+U0SN0+yrsG3jcaK69eKRa7ccRq2atLKPOn+EsChCC?=
 =?us-ascii?Q?mPHxsrxl/QGV6j5VxHB8hTjqRYcrIkBm3S1DRLl5a6AQt40o2nZ8SAyI6ay/?=
 =?us-ascii?Q?eOSZOxaPlWZYF8nqxoLmkKfqF2PeSnsjsuiFiQR/eMuodOEbvNIXCuFaIQgm?=
 =?us-ascii?Q?FVDL16fg08w+Tdwo3PcKWUNUuhlkxcQt679Ks7Q/9gumM7tt36Yup3W4gQ/f?=
 =?us-ascii?Q?y6I1KiLcsf7kufbPwvGzEuMFtbUNWN372s5b4/nu+NWR/D5l5tBtr7WVchGl?=
 =?us-ascii?Q?4hi6Fsk/kWE/MLwNWZsiX7t+YxyqKCaPTssqElxot/mQV6ZfEjfLiWlmpJ4+?=
 =?us-ascii?Q?tFrlO6LxnFg8NuvmPTIHXs/e4zmnUKvgobx2lCOV9UyR7RpnElMwcJdDmD1Z?=
 =?us-ascii?Q?BEeN8zX/Og34DAjAdeeSm4vd9b8mNqIk99ATB9IEToyStIAH580ShchsqamK?=
 =?us-ascii?Q?YKp6R0hSD9pxgm+bQn9bkQEBK2sGZclyF2zNdxDipZEiIdGiTYm75/L5GqkI?=
 =?us-ascii?Q?2nHt8mQE0Y3EAmQjaua/lYBqO6+/1LwpWkTGjLe0kVNOb9PaUQrLqAYGkIr2?=
 =?us-ascii?Q?8roORON3KoEx7VORhEhhrfzWJvQqPdQgNGYqPdc6pcQS/VKFh9Z9BubBTroz?=
 =?us-ascii?Q?qBmhgivRs0sP/ol7SPheIa+kCla14HiASqs6t6lLn1QmTIT5bvz9oXzIkGym?=
 =?us-ascii?Q?s472gLxmYEBhpC53i18WbsIsTFCubk1IXC9YgFGSIZhglOkkyduxIXi3gPKB?=
 =?us-ascii?Q?WizoVhV/wUaEkBeaL6LBT/66Vm1e9IFCyn3+ZXBs+0TThUXaKz1VQWzA6QLw?=
 =?us-ascii?Q?iJGf+L51w+UizYG84QaJ2N4+ssrUxusL+rHiPAtJ0uAInVABcdxAjJqHrhdV?=
 =?us-ascii?Q?CLT3W5SMYbAAUYGZ6LuQnCaRT60gwO1PYufWflTqElObvqugx9V0vVYe/27b?=
 =?us-ascii?Q?8iw6/WCGi5Yb9xRXoQFNSZAjhvfLetvzJeUPB5FQbh5yC2kbUJCmsY+XbySv?=
 =?us-ascii?Q?CN/24wMi4tWFQYrpMcGzLaLq2dfQLFd6tVUaJ23KAMp3Titsrvi3pjkg6w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gfIKOVDqznKGI1v8smwjFb9lmcBZR5/wWUNNcNMRhPRb8T6GV/ZKzdhIrqf/?=
 =?us-ascii?Q?/1oDFebEf/PuBJ4VXiqmt1NPoXlHGITjBg2RdMc7ak0kh8M52yw7h2fcP8Ld?=
 =?us-ascii?Q?cEzla5K+zSW32fG/j8MPPNjj4M89qPATecoyp5o5DC+S7V6j8plz/cRXanVh?=
 =?us-ascii?Q?Xcfv2qy65adagnpy3JV7qB0csLYym/IQk6IeJgJuTg9txdfu0AMOAPmU5a+f?=
 =?us-ascii?Q?6dXqKb8bcQF1hzzVz2J9YQ4xZ1iBXmzj5CI9SLGXfitl0AOCpSNmQShKImYF?=
 =?us-ascii?Q?SyZZ1Wn3kQo4hkmAev0CVdXo5MVc2m05x9IMAr7o/MkDKo8+3m2970uAQBuz?=
 =?us-ascii?Q?3x0BvKeKxN6MbzGNhNvwUuDJvMG1bfm9A7S5JPb8qtR0SHpftiQGw4h7KQbU?=
 =?us-ascii?Q?3CG9t/ur+A3K+W3mfEjwt6IHXPe+PddtU6uk70wcfS0AoFH9XaWOnJdxUsk0?=
 =?us-ascii?Q?CT2Zo0gAV8nUnyN8AdbOwVgX97b7owj3OrT3HdfaQDzLLIPZAacT0eJ8qVYI?=
 =?us-ascii?Q?p9LhxSjL3evfCug2ySdWqA2GsPC9+uUC9sHXPNQBVQetc2odgaa6l5QhJJ19?=
 =?us-ascii?Q?T8sMjUrA2VomatCVykEAlxapR5/KhpM3baXGmz/6QtHg3kB6t5RyEUhqMM1N?=
 =?us-ascii?Q?fSDiXehH8Y4soE0wFBkx7RrQAnOdk/MpUxRMwvgQUGZp8roU9rqBdGRyvxkD?=
 =?us-ascii?Q?jGEOWoVSVNR0nGvqGewQYRRypNjjoSdhwyh0iWchv6Iq5vNkVA3Ynha6uWce?=
 =?us-ascii?Q?D7gHrHk6MCFF2SlfbcBkkN3phzYF6zAr6NkI5FUypdw4qZKqJ8PorNdWwxgt?=
 =?us-ascii?Q?JvA/ILmsIA1GRMOMOs6qJzil137+oRIqoa4cEdJ+ioSLBhRfWK6qDEaKFxm7?=
 =?us-ascii?Q?BT9tXatj2wCFd3M9/oJs3mNOapRtfE7S0WKKRT2Ncggope562yKz5T+QHyC8?=
 =?us-ascii?Q?m14M0ztypnFj/Vun/P3narEecHG/yFxQIy3z2qdpcPGBLYYsE7VJvdyGbQJn?=
 =?us-ascii?Q?f009ehOgAcDRZFWRyFpxHHY9uss46DWFaHU47zfcL6BM6/2Roede8JF3pIL0?=
 =?us-ascii?Q?6TM3VfqAPILL8Frlk5yF4OxSVgwQYl5CBjH95h3lsGH67ZHfIhlH/xXfo8/P?=
 =?us-ascii?Q?oh/4SoDaiyf4dbCSxXaDHtD5Ja46Jaw/1SWMoJ7xmELxcCnCzWlEV1UroU70?=
 =?us-ascii?Q?YCx90oKfYJ2GdvfNjuMw1GzbI8sylhNsnaKedrPVTl9mBrxenVATtUdmZa/z?=
 =?us-ascii?Q?U7hk2cxdoIc3CQO1pWhaj4Hdmv9bCdTkqma5q6Ssilao9nFNoQrn/3Vycjjk?=
 =?us-ascii?Q?20f/FScq3HtOvG1ncN9x94+4963exXhvb33NyTb0Nacwpu+uv54k396OEuUG?=
 =?us-ascii?Q?SBbZnDibZCfQh67C+L58wFaBshniwx0+j8fruC4UROeHL7a5TI5iPCDu/Dkt?=
 =?us-ascii?Q?wdSxVszbzt1kcIjyAd40A3auKjnMlyBw0si6HtBUGY0VkPd2elQXUtcK28JZ?=
 =?us-ascii?Q?ziIUHT53dZuR+6MNp8TXQ5cajCcrdG9SV2xM8RN31d9ufDUFB5Rf+nmWzL0U?=
 =?us-ascii?Q?vZSBt2VFiRIyAjw9nIVOmwE8gMz2dVdBPFzbCD17?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca9a862-67c1-445a-cb5f-08de1afd297c
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:19:36.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGA0eKQnORpYMw4oCudbuMoUlO8grdzn1/L8EJya0s67Qi7J8+WLUpraUBCI1MJ7knyLsKb/2M6yiWYEzbW4xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

On Thu, Aug 21, 2025 at 04:15:35PM -0400, Frank Li wrote:
> Totally rewrite CSI part driver compared to V1.
>
> This only includes CSI related patches.
>
> DTS part: see https://lore.kernel.org/imx/20250701-95_cam-v1-6-c5172bab387b@nxp.com/
> PHY part: see https://lore.kernel.org/imx/20250701-95_cam-v1-4-c5172bab387b@nxp.com/
> AP1302 part: see https://lore.kernel.org/imx/20250701-95_cam-v1-7-c5172bab387b@nxp.com/
> 	upstream: https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/
>
> First 3 patches add some common helper function to simple code and remove
> duplicated code in difference CSI2 drivers.
>
> Clean up stage imx6 old version csi2 driver, and prepare create common
> dw csi2 library for difference IP version.

Laurent Pinchart:

	Do you have time to review cleanup part? at least we try to land
some simple patches in this cycle.

Frank

>
> Move stage driver under driver/media/synosis.
>
> Create simple platform driver for common dw csi2 use case.
>
> TODO:
> 	1. create bus, to probe phy driver under "test_if" interface for
> specific phys under CSI2.
> 	2. support to combine phy, (which connect to both dw CSI and DSI's
> test_if). Need use DSI's test_if to config combo phy to switch to RX mode.
> and also need config RX part's phy register by use CSI's testif.
> 	3. move other vendor's csi driver to use this common DWC CSI
> library.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v3:
> - update binding doc
> - combine two add helper function's patch to one. and use media_bus_fmt_info
> data structure.
> - Link to v2: https://lore.kernel.org/r/20250808-95_cam-v2-0-4b29fa6919a7@nxp.com
>
> Changes in v2:
> - totally rewrite, see above section
> - Link to v1: https://lore.kernel.org/r/20250701-95_cam-v1-0-c5172bab387b@nxp.com
>
> ---
> Eugen Hristev (1):
>       dt-bindings: media: add DW MIPI CSI-2 Host support
>
> Frank Li (30):
>       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
>       media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()
>       media: staging: media: imx6-mipi-csi2: replace space with tab for alignment
>       media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
>       media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
>       media: staging: media: imx6-mipi-csi2: use guard() to simplify code
>       media: staging: media: imx6-mipi-csi2: use register structure to match hardware
>       media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
>       media: staging: media: imx6-mipi-csi2: move probe part to imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: move sd imx6's specific initialization into imx6-sci2.c
>       media: staging: media: imx6-mipi-csi2: move csi2ipu_gasket_init() to imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: move number pad macro define into imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: move dphy init part to imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: use runtime_pm frame to control clks
>       media: synopsys: move imx6-mipi-csi2.c to synopsys/mipi-csi2.c
>       media: synopsys: csi2: Remove deprecated s_stream and use v4l2_subdev_pad_ops
>       media: synopsys: csi2: Add phy interface support
>       media: synopsys: csi2: Add basic v150* version register
>       media: synopsys: csi2: Add irq support to record error count
>       media: synopsys: csi2: Handle alignment requirement for width
>       media: synopsys: csi2: Add register prefix to register field definitions
>       media: synopsys: csi2: Add need_dphy_reset in config
>       media: synopsys: csi2: Add default simple dw_csi2_subdev_init_state
>       media: synopsys: csi2: Add v150 lane stop state register bit define
>       media: synopsys: csi2: use standard v4l2_subdev_get_fmt() function
>       media: synopsys: csi2: Add customize get_frame_desc() callback
>       media: synopsys: csi2: Add Image Pixel Interface (IPI) support for v150
>       media: synopsys: csi2: Remove source pad connected check at dw_csi2_enable_streams()
>       media: synopsys: csi2: Add simple synopsys platform driver
>
>  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     |  151 +++
>  MAINTAINERS                                        |    1 +
>  drivers/media/platform/synopsys/Kconfig            |   20 +
>  drivers/media/platform/synopsys/Makefile           |    3 +
>  drivers/media/platform/synopsys/mipi-csi2-simple.c |   75 ++
>  drivers/media/platform/synopsys/mipi-csi2.c        | 1260 ++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c              |  149 +++
>  drivers/staging/media/imx/Kconfig                  |    1 +
>  drivers/staging/media/imx/Makefile                 |    2 +-
>  drivers/staging/media/imx/imx6-csi2.c              |  181 +++
>  drivers/staging/media/imx/imx6-mipi-csi2.c         |  846 -------------
>  include/media/dw-mipi-csi2.h                       |  120 ++
>  include/media/mipi-csi2.h                          |   30 +
>  include/media/v4l2-common.h                        |   30 +
>  14 files changed, 2022 insertions(+), 847 deletions(-)
> ---
> base-commit: ad0a162e543964443feec3a6a9395a64fe6c35c9
> change-id: 20250606-95_cam-b74c094ad1fb
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

