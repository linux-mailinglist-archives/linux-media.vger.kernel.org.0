Return-Path: <linux-media+bounces-45692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A791C0F722
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 17:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CCF41896A13
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 16:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928D686337;
	Mon, 27 Oct 2025 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eLV2u54+"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F55622068F;
	Mon, 27 Oct 2025 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583809; cv=fail; b=CH88f4y1miHD15e6JSkYaF+kuQb4r1bfl4Wn8ECmimgJ4VEyx6+8AwnqGhE3vf6SGByYe9Tim+BPai7cqOKMsJXXkegt1mQ/6kv482DP/6poak2MCn4eGMKYbT+3Y34HTQbGHy7E6NyK+MBMq/VrE5EZ1ON75O4VK96mZaC/L8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583809; c=relaxed/simple;
	bh=jR+vhadMHGWnlwj68qmYfxYHaKd7fmClZroCyt8FDmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KHmZm75cbtEdSY5b7RJd74736yf/XtjK9KlfJhgSOTKCdBVziIJ6ibxShga1skhpwHKhOVWix2InRQzGIZ0EwjZ1BnGwgB8haxcbPx6omGrBhyh8pGmQ1LnvQMEhaDcbj1xZndWzVtBRsrqEo1bC8baiJ4JCJ2OcXIGRL/MjYmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eLV2u54+; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9L5DL5axE+wG+aBlETJeRd5cP2Baqt3jmaRbaaDrQic/8/a5GyT34bxjTDaTF6EIbMtoUSGbp8pSthrKuAwPtW1BV32gtJwtj3GNAPGQd0FF42hNPfvEJXduwdiTMibkCGdC9PD2OUSojFicQIBTmB/Hl0ZF3NoDKlRjhl8mPmQVyOlD/fWmerrcuiFCJ5HBUFocqc4n515+yi81lO8KOf4gunxaR+ypwNCihvWEUo4OCqrEazGJ/xxpzBFbmPjzVshE/fUo3aEGY1zD6LpiS+7/WfMVUxOhggspItaQSb1BtrPRDPJNxjOSh1ocILk6i7RS8z+Jt04qbXHXA99iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+E0z/seq3kJfjV8qVkalqi9YkOmS1OfoiL8VxSQ1tpI=;
 b=K5fbRQ7G0pe0RzKMFyZYOUlhF6leLDImzb9gtbwWedXw0EhOQS1c0OcF6g14DomTzknI6Zfw+lQjxA5UF58wX3envKJ6kS/U1g9i8Pxr6zQhACgMZBvpXacrd/B0pTFmeVabL2wzKTU3BA7YtXbwKkK4HZ6rkOE6HGE14FbFkFPhzw2BDlWX0RlQPOPUX2DIqz8+MLPO/0BP8eIIqRsUrNAhQ6F6ej3lO0+7kRADAPu9Or1cwrXhCNkioXpvIOJng9P+pVhTyWUakepOS/df0YPFDL4mgpujrV6tfFlfqR0EwdN89rUlln5RPY0Xyamk0js0UoQtYoCCHh/9r/LKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E0z/seq3kJfjV8qVkalqi9YkOmS1OfoiL8VxSQ1tpI=;
 b=eLV2u54+NtODQ6xDlWaF55XyJcR7hX+qmfhaANmNaKhS8And7ksWrPO0L3HG+vZXgRmIIrPcN9OpEg5+baHH29ozBHhyzgDeOzEoLVV7YNA7uq/4QaSPjm211DvjvnvIgiFxoDyjyhIVRcT3IBTGbtw5wJGX2tm39I77Zk10zvrYBUcCsaafjtbda+pNCo3fcdboMevCKe4dFt1Ut10Q6LV4Q9qCk8zu+L38hQsGwoUQPuO9l8YyuAlpuXv3zXBjf85xo0pr4xwlge4ncW2BA9m17DXJYA76JeViav7H8OmhYL/mnhjF9fcyFJ8LgZZJ6aR1jsWl/1/Git6XMUEpBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAWPR04MB11676.eurprd04.prod.outlook.com (2603:10a6:102:50b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:50:04 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:50:04 +0000
Date: Mon, 27 Oct 2025 12:49:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 03/31] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <aP+isGnWmJ4tLXcs@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-3-c9286fbb34b9@nxp.com>
 <aP81s4FDhj0-3WFh@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP81s4FDhj0-3WFh@valkosipuli.retiisi.eu>
X-ClientProxiedBy: PH7PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:510:339::25) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAWPR04MB11676:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5d17f7-5f91-4100-cc98-08de1578e020
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?hgZHUjroV7bNY5CVZE2ek6NFK5Tyssri+PgVvDOZ7o2Jxeng48Ncih1AP/Lc?=
 =?us-ascii?Q?FmFJ2ntd/DEIzSNbRVertUw++WiF7yKY6VaC5Fvb5tWc6MHDz9vRLzDoGWP6?=
 =?us-ascii?Q?XCY4l3sQi98q7OlgGZYD5Pky1cpw7G4p3bQk62fR6tMeZSFuJlnUtYkFHKvO?=
 =?us-ascii?Q?BNe8jwUdicyhfNC8DLY9432+XJ76c3EihA+pSN2OmxBZyDTe6CjrU4LpBb3B?=
 =?us-ascii?Q?XcvRKPEdcoEbKNU3y/OF86rgHdmZK9B6seJ5HVtz9gVt8o1TrUY3Js483aZ7?=
 =?us-ascii?Q?lS6Khk8/oy/NHHnH4AQ3h8yU0RNfbvaa6CVWUqheWvUTcvk/5g/8S3qKSmvy?=
 =?us-ascii?Q?5eJfKEGVkgcEhxGL1L/8qG3OfbVpXed9I8b1g+I2L00s+P0H/3zewvIngtbh?=
 =?us-ascii?Q?qWO09RzzshXdd67WOGDBDsdUhtnhqM9ukj90ZSpRFxp65DTXyfloHc7Po7Q/?=
 =?us-ascii?Q?xA9SF+LWT/9yuth8a7e5Dt7fxT5Y+2Ijw7tNUmCSw0AZ7Wg7I8dIqu9fmDNi?=
 =?us-ascii?Q?6lPyhGdRCX8Z0X+A2+Lr4uUkQ267JqyoHyyOfH0FHattGDiIiztw5upluAah?=
 =?us-ascii?Q?OlHeRLlbKh4N55ZRrpD8tBei/hrjwJGzC3aXpRgNcYFTcItYIswHwVnQwWc6?=
 =?us-ascii?Q?w1FUgvbizEFeEgqwWhMDX4evPB0A+xPDk+rVPB4y9XMeRzS1BSd/I5iW53Ec?=
 =?us-ascii?Q?oTxI5fu01ODn4ytNcjrIopLda33SanZhPoa4bWXvvGjct9HTmPnMwJpdDgVu?=
 =?us-ascii?Q?AYXwTFilbod7O/6H+2ZFzS/M+4rTqhGxJ0L87zWf7c2XJaX+Z6eFlNB+fXM2?=
 =?us-ascii?Q?HAlsuHUjj0w4ENd9K883x31OwGxkLKhxfN9h401n/1mKjIHcQ++Cgy8Z0FvH?=
 =?us-ascii?Q?CEoiprXVjK3JB/j8A9UHS6NisbEzhPsqTTBgn09Bh0pL1hPrv1PWBEvRtnFl?=
 =?us-ascii?Q?Bt8L982UBegG1OffWwtz1WsPe8XteabbImvtTPX3Qk97GnIpXzH2swPwFUey?=
 =?us-ascii?Q?CWacfcm1CppESFmz7CUeiDInpwDkNIpYsUfN9VeJGT4+mP+mXXcEU1BF6q5r?=
 =?us-ascii?Q?PB/W20ybsM1aOJMb7ZXGNWV3dObboDb/+oKZwV1ksFyaWxGJXAY2aeyXMh7j?=
 =?us-ascii?Q?u3J5QyH0j+q3Kf51PqvTrFYNrnTY2FYqqaR27pRtbHB8RAlKNHgWl5IMBekm?=
 =?us-ascii?Q?5Z3QjwLDMRBoCiX4jHu3myNgLYDCTsAWEJwPKyt9Fb5Bqdgv/ojoA3Ys+tWH?=
 =?us-ascii?Q?0JegNFZV9smhLrrnhpP2AKGiTH+DlHW3DZAZ044tqxUVFgqkrQaVnRcWvKsv?=
 =?us-ascii?Q?lJiLNQXbx7zL6inkiEVQQgVARWG+6KO+g+hz+CD1CYq8wxJ0MerCKHVaoDpc?=
 =?us-ascii?Q?d3sE9HVELcPRM3fusIeiXzOA4B3tMOf3KnrKaFaydjalObYcxwc9Urhvb4C3?=
 =?us-ascii?Q?LIZemUh3ou5UmGUrwVfvGVisHQPAIs0DTn7dQV7ZWxTd0EO4yNlT/ENMyyq0?=
 =?us-ascii?Q?yZwwaS8+UgNZZlIfR2gS36bf3w1tMFta90fO?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xN+23tSxjOq2FU23aHOmrpOKztey1qqwf7uj7tPxBdwU3HB2Wap4Pr1N/vgF?=
 =?us-ascii?Q?h118JcXvkBq+hiR+XTBcTO3ULjk4C14ptXBmjxViNotVLyqP5uSmpcAQahJO?=
 =?us-ascii?Q?S3u/C/2uKBOJXURsfFSe2ShwWUfcjvDG9f19qER3euXl6U9+zC9Ps+pVOuG8?=
 =?us-ascii?Q?dJA0fjsTs9OjnZqpPfLbeCULsS/E2EB0VImg/pC28C6ls4VxkIc9RjwUc73x?=
 =?us-ascii?Q?U6AemsqmlLM+x6+2cJNuLtTIIcPTTp++17gFd4EgWa/wlUjfs4KQ9e4Ibxd2?=
 =?us-ascii?Q?9G1EH0BBGP5EgpcLo6rWViHjFKYLBFte5peY9rPmYOa+VW7oLmSOTmyWJd46?=
 =?us-ascii?Q?vt5+AkB4wbrYojeojw81CKXWKDuEoN0xbS6ZLlUX5rtFbUC5eNiFMcEqS3IS?=
 =?us-ascii?Q?WRHHX8M2wF9trGr3aVVfckk0eXAx2QVG7V2T1LD6Rl/3odxCiZU7BjUa/NZF?=
 =?us-ascii?Q?69RlX/VNBLcLeQK1NZCJukuajf9oOJIENhayBoIWZ9oPeIQe76q3tITpzi7Y?=
 =?us-ascii?Q?aoOif1c4TgyfG/cxn6FUvNAS8Vi4dFZjOGjWWtJVmbYCOFcVH1NxIKADHF4Y?=
 =?us-ascii?Q?g3x7B73GFQbiSHRujUpCM+D03LdBpy6a5sKivMgi2T1KfRNHw0NNhWb3iSUJ?=
 =?us-ascii?Q?ERI6FpSU+7MHRExCnTky8tdi9b0F7181oVRzBUvNO3cqa1VdxHMOASkgSsj3?=
 =?us-ascii?Q?0ZcGh6AovNIGsr4nU692RX9waItgGdXU9JbmH/P9jHSGKxrVI/OAV+LxCNws?=
 =?us-ascii?Q?N890V2RrAREIaDnOF1NjyagEakkq9L8WFO4Wbyq0Y/3yYWwlnFkyUQaEfkEu?=
 =?us-ascii?Q?wb30Crg9ezvm5Ul6NtObGYTYUlOTu2y3R38jYUa28Nz00QDzfT0NC7rMxW9j?=
 =?us-ascii?Q?KXXBYKC0CXlcw+GXQHlO2VoD7D/9YF4FLe33XMRobQvicB95XqboN6D497LW?=
 =?us-ascii?Q?4TRW3bUdcPdLjLvg0/jIXzvuaZqc9dsUWUouZaO7hLDFeyCkO9RjSqNC7yBx?=
 =?us-ascii?Q?clvUkQJsVDxgBCG9Q6isnd4c7F2xAIgR4hxQd9R7/MFW7hTAc8XHdN9OsnOx?=
 =?us-ascii?Q?cnJ/YQaofBV3uWpJ2+41SpZoqNbZGjsuLKWi7DFUgkTkgUADGZWBUZMD790E?=
 =?us-ascii?Q?V14s9B/Z/tyB+Xu9F1SLi6w1+UDSJq4jnLpYtUXc4OazSjTJ5trFrbah4+ew?=
 =?us-ascii?Q?abyZexwHim7b2ikmWAiPQl+wto02Xbrg1Xc8rcEdhLHyPZDIcEzEbrBZNPif?=
 =?us-ascii?Q?6YvsUP/7XR188LSj/hZviVPEwuIbaBFSNnaie9ZciqoseRyuY+a2ZuJaUFFa?=
 =?us-ascii?Q?bipGQEl790IYi8vbb0kfyP9UrkR2BimipoW25wM+tIGYxCQ4CvxxgRJZXRTi?=
 =?us-ascii?Q?FN+Lap+DgrfYmTZprpADP3T7pLWH+lIXJQmuDB6+pMdctT+Gxp305WCKrnPx?=
 =?us-ascii?Q?3lliDVuSRFxqwDueKco0IxT9l/LsiyycQH6PZzSunmxMT0WTWM1dBR3n+1/E?=
 =?us-ascii?Q?33w/yn6p8ch8ELAA4fxAISaxDrzISlYaENOecVqkCFco7MHgjqB5Tmmsk/0w?=
 =?us-ascii?Q?250okVCZ2tZzL8rhheYSF/zLNaVi/4Jfjn+qiReA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5d17f7-5f91-4100-cc98-08de1578e020
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:50:04.0215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEiiITMXoKaCzUvLI9f1vg0gYaQcuSWGjZePITNMuqKXWnlw2DqlaS/xRT3vIaC038OvPLY+L5tv0RoIcsiQ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11676

On Mon, Oct 27, 2025 at 11:04:51AM +0200, Sakari Ailus wrote:
> Hi Frank,
>
> On Thu, Aug 21, 2025 at 04:15:38PM -0400, Frank Li wrote:
> > Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
> > to reduce codes such as
> >
> > 	static const struct imx7_csi_pixfmt pixel_formats[] = {
> >         {
> >                 .fourcc = V4L2_PIX_FMT_UYVY,
> >                 .codes  = IMX_BUS_FMTS(
> >                         MEDIA_BUS_FMT_UYVY8_2X8,
> >                         MEDIA_BUS_FMT_UYVY8_1X16
> >                 ),
> >                 .yuv    = true,
> >                 .bpp    = 16,
> >         },
> > 	....
> >
> > .bpp can be removed from pixel_formats with this helper function.
> >
> > CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
> > See section 9.4.
> >
> > Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
> > MIPI defined data type and avoid below duplicated static array in each CSI2
> > drivers.
> >
> > 	{
> > 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> > 		.data_type = MIPI_CSI2_DT_YUV422_8B,
> > 	}
> >
> > Only add known map for dt type. Need update media_bus_fmt_info when new
> > mapping used.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change in v3:
> > - squash two help function patch to one.
> > - use media_bus_fmt_info to do map.
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 149 ++++++++++++++++++++++++++++++++++
> >  include/media/mipi-csi2.h             |  30 +++++++
> >  2 files changed, 179 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index a5334aa35992e5f57fb228c33d40c51fdafdc135..a75987aa5fc69d6368709b7d521bede666da9513 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -46,6 +46,7 @@
> >  #include <linux/uaccess.h>
> >  #include <asm/io.h>
> >  #include <asm/div64.h>
> > +#include <media/mipi-csi2.h>
> >  #include <media/v4l2-common.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -757,3 +758,151 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> >  	return clk_hw->clk;
> >  }
> >  EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> > +
> > +static const struct media_bus_fmt_info media_bus_fmt_info[] = {
> > +	{ .fmt = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12},
>
> Please add a comma and a whitespace before the closing brace.
>
> > +	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18},
> > +	{ .fmt = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30},
> > +	{ .fmt = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36},
> > +	{ .fmt = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 40},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 40},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 40},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 40},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 120},
> > +	{ .fmt = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24},
> > +	{ .fmt = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30},
> > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 150},
> > +	{ .fmt = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32},
> > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 180},
> > +	{ .fmt = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36},
> > +	{ .fmt = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48},
> > +	{ .fmt = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 240},
>
> That's quite many bits per pixel. Is the value correct (looks like bits per
> sample rather)? There are other, too, that seem quite high.


>
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 8},
> > +
> > +	{ .fmt = MEDIA_BUS_FMT_META_8, .bpp = 8},
> > +	{ .fmt = MEDIA_BUS_FMT_META_10, .bpp = 10},
> > +	{ .fmt = MEDIA_BUS_FMT_META_12, .bpp = 12},
> > +	{ .fmt = MEDIA_BUS_FMT_META_14, .bpp = 14},
> > +	{ .fmt = MEDIA_BUS_FMT_META_16, .bpp = 16},
> > +	{ .fmt = MEDIA_BUS_FMT_META_20, .bpp = 20},
> > +	{ .fmt = MEDIA_BUS_FMT_META_24, .bpp = 24},
> > +};
> > +
> > +const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
> > +{
> > +	int i;
>
> unsigned int, please. You can also declare it within the loop.
>
> > +
> > +	for (i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++)
> > +		if (media_bus_fmt_info[i].fmt == bus_fmt)
> > +			return &media_bus_fmt_info[i];
> > +
> > +	return NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(media_bus_fmt_info_get);
> > diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> > index 40fc0264250d779ab5dfa7d2fe16e6f1382c07d4..3227d28224b7c32ef2745548391da9e792cfa559 100644
> > --- a/include/media/mipi-csi2.h
> > +++ b/include/media/mipi-csi2.h
> > @@ -8,6 +8,8 @@
> >  #ifndef _MEDIA_MIPI_CSI2_H
> >  #define _MEDIA_MIPI_CSI2_H
> >
> > +/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */
>
> I'm not sure if I'd add such a reference here. At least it shouldn't be in
> this patch.

Still not in v6.18-rc3. I add comments in this patch because try to add
media_bus_fmt_to_csi2_dt().

If dt define is not standard, media_bus_fmt_to_csi2_dt() don't make sense.
the difference vendor choose difference dt values.

I am fine create patch for it before this one.

Frank
>
> > +
> >  /* Short packet data types */
> >  #define MIPI_CSI2_DT_FS			0x00
> >  #define MIPI_CSI2_DT_FE			0x01
> > @@ -44,4 +46,32 @@
> >  #define MIPI_CSI2_DT_RAW20		0x2f
> >  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
> >
> > +/**
> > + * struct media_bus_fmt_info - information about a media bus format
> > + * @fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> > + * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
> > + * @bpp: bit width per pixel
> > + */
>
> I wonder if we should keep this out of sight from drivers. That'd mean
> moving the functions below to the .c file, too.
>
> > +struct media_bus_fmt_info {
> > +	u32 fmt;
> > +	u32 dt;
>
> dt can be u8, too.
>
> > +	u8 bpp;
> > +};
> > +
> > +const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt);
> > +
> > +static inline int media_bus_fmt_to_csi2_dt(int bus_fmt)
>
> u32
>
> > +{
> > +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> > +
> > +	return info ? info->dt : 0;
> > +}
> > +
> > +static inline int media_bus_fmt_to_csi2_bpp(int bus_fmt)
>
> u32
>
> > +{
> > +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> > +
> > +	return info ? info->bpp : 0;
> > +}
> > +
> >  #endif /* _MEDIA_MIPI_CSI2_H */
> >
>
> --
> Kind regards,
>
> Sakari Ailus
>
> --
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

