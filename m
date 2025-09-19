Return-Path: <linux-media+bounces-42808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E981B8A853
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 18:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C0301C27738
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 16:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546F231D73B;
	Fri, 19 Sep 2025 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gFxdpiUD"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A0730DECE;
	Fri, 19 Sep 2025 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758298311; cv=fail; b=FWvypl9Z+KTHxxO0J0fmVh+nzpt243wvcBrFlqx96aYXvDRiKWJ9X+gtg4mClZNBEEVzH8NmKhrcgiVVR6lRSThRZTQgaF5vBUJw8BBV89pljctmdfWi/R1qhFUneVpwRD66jZo68vueo2ORKN8cEkKSqj50FC3hEuEZGFJWNls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758298311; c=relaxed/simple;
	bh=k6CQWHIm6hs7veaS0XPkpITKF6We58Q9MHk0/ePt68I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cYC6Ug8twcMBcIp13ETbUvtM1RbvJwGec3zbks+LZcdRJhC9BsUg862R/QlF2MV53S6apQZtU3bmICcmZDG8gnkLvkTFRvDp/o/1BFFahYnK7zdJJ9aiVUILTL/QoZEVAhmfUIlxsZZ/8rvsw8WupBJyO0iYQxUPb2Cm5Cn/gWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gFxdpiUD; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ca+3aA90ABWG6pteAT1bO6jVQ7dlw0TNSZLYSGaiYVtKNwpD9z4keP+xPzj96Ep3YdCOWJTwb0AXaBsu9ALv6D6xtm7eUx8SB2TnBb2IA6msJoXlqyIYA9zMuYJ07Vc1MrS32izpzxwgtk771LTTHRJvgDWI3H5TduQ4hZlikJ5Zk7a0Sb4kkCWBlU4inqVQHF7AnV5CRfsl0jXverDWJxSF+t5AAjWHXn72i0Je85VBIuh2BF2Te1DpypVUXzSHuymPs733HQv0idXyEep1ogCKNAok/Ahrt1XArFABTI8lq+9rLj4k1k52Upf+Pv4p0VyFmj4nQlWFhLkYOo62IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gz6/xl9i18NPJ/U8MC1y590pyHQBU3fCNs+5vzWNFco=;
 b=lW6dmH+Obr+z+976qhzq+B7wH0j3eHIthTqO3KXWoydMu7G97+eGl3RudlUSYNTW/z/Movbdnq9wawV4JJl8bE7+o5E7YFqXQjqDs9zQHp7bqDkm6TOTo4CJ2ANS25wFqtPvq48WWl4EGRI8sMMl6Ns1BudrAMsbimXPmvWUgbBxAgJGZMSpad3bU5GWA/L2RRxBj4lxNpQBbxGhnb6dXClwoSAcKTAPgYZbG9oQx4L7Pj0xrkUyjNsbj05VAY87gg9ho6bvSFNd2PFwxYBYlqGFKSHHJh5o05R5CpSJSiXb77BmQtCNcwHKwCHnnpQmXl0gxClY9wxb8+LWGXgeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz6/xl9i18NPJ/U8MC1y590pyHQBU3fCNs+5vzWNFco=;
 b=gFxdpiUDetZI2BMfi+DN4byMlu5GKGnpBEmr3JAZYtnnh9n5ZLBP6W38fnxArzKa47IhGC2PvuUNSA9OSgTg9/ZvzPb8gZu9gTFhIkcMDkMKQ066C1ZQ847drsU0emjEMCkaH+fBpGzSH9IstqYEB7FMt2/j0kuDzgBaeGZmzT1T3CkkuzU8rs2slyY2ELUMvqtmYkXMPElZrji3NTaZ3VkyMKu++11TJqP9+vUV6L+sJMdJC+L87PglZAtV5GAxCsy6qiKMwC4s0o+Q19YbwGa9W6mEKY54LU3Ik2ub5NXlPZ9R2pCpZ4fzRNRJ534X6T7qyNDE8lTichr1f/BiRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB7846.eurprd04.prod.outlook.com (2603:10a6:20b:2a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 16:11:46 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 16:11:46 +0000
Date: Fri, 19 Sep 2025 12:11:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/5] media: imx91: Add ISI support
Message-ID: <aM2AurOTxTB4raSg@lizhi-Precision-Tower-5810>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <AS8PR04MB90801C7CE8D06EDC8CAA6750FA11A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB90801C7CE8D06EDC8CAA6750FA11A@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH7PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:510:23d::7) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 556f74fb-ee40-4b1d-7c4c-08ddf7973b4e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?HBIqLaM1f7Aci+tZZG2SrOTc6CjjkEwh7HCsWpNA7gL32f9V2HweXwro+Hwi?=
 =?us-ascii?Q?0lFXVZa1Yq1q8p60MRxRoyMIVEFe5/gtve4ZRKwtZCwVf7Lw+haA22xf0GUs?=
 =?us-ascii?Q?//sz61blRN/E/pOPfBJ+HEWXWc3a8ukfI3XNt2sR6V71Xy8FwPyFPRII4YLF?=
 =?us-ascii?Q?JNkkXzU9g8Rp7FtfOeZbh6CjTpYD7cLP++VorMaTto6sWuWtavBoWkgq9FKW?=
 =?us-ascii?Q?kC4QOgdM1qkFmbXni11WuxsKW8bf7yqThsjyzVB1tTrXzbZG8BPmmqR3LWFF?=
 =?us-ascii?Q?3lIwddggBGiglZ7iWQRlow8EQoRBdE3NkwR1JOct8E1IknCMw+ooXNkmrJI7?=
 =?us-ascii?Q?cMbjY6JXj1hpF+NodU9qiaIfMWD60zSXdi/G0gsDSKmeTtRKLtstQ1Dv4x6X?=
 =?us-ascii?Q?JVOjhSG75evnVxhboToeVZm0kg+bM4Yli0tdo7K1A+u8KvFDuCGINC2zOBm+?=
 =?us-ascii?Q?9ze85JJjfRmepzgH3FwDknDn7KHLiF1Yvl8FyFUnrU5d0ygjDmBPRba5DFZg?=
 =?us-ascii?Q?jkigtRM3zz2bl+3Gck1DaC+NYMYJj4eDat5OtWeKsjmIKxghf+aXzCb5j77w?=
 =?us-ascii?Q?FIfFVAWqLJiGK5j/DgZ9vWsR7bng0vYeCB6iNfY5J/YhTFLs7CD8M+ZUCkt9?=
 =?us-ascii?Q?DpFUOJpj+o6XlfznPYOd1lXDMvQFAMlsZsnceIarl11WPdiTqMkhtxuCqbCg?=
 =?us-ascii?Q?RijIr6qiL36Yvxpj7Ymrpe8HkZOLykwgZLo9F/oJWbA/KWb2tk+QCrydLkKk?=
 =?us-ascii?Q?r7//mig+7WLKhPqo26B387pFE1oY7xcm6tC3+jp6bJeDauE7ahPXfeAFBu2p?=
 =?us-ascii?Q?xN7g+BU3cNDOjzkZ4nCO1wJn0tsiu8tjQwmEke3IFGkdIwoDHWvwl5TCR7tT?=
 =?us-ascii?Q?OgCGNuGSUED47YKooLzuYHr2DpJb5l8X5XjLC1olBtlB5m3AL9yVWOFo2KIP?=
 =?us-ascii?Q?elUkZur2mZXVLrHgvgQgZX9J8YaiMtwaz/LIhndzu6PV87PHFiLUvQDJwYBK?=
 =?us-ascii?Q?XnFpEmkc7VUWhJeG31CO9sGgH/U1BrKB8bgSePfD5XjgdspygBh3jB2+B6su?=
 =?us-ascii?Q?5zLKGwe3GgACI4yCqVVpBRvEdXAjWPqro6E839RBNzyfYebSXnDl7sFlB5Sm?=
 =?us-ascii?Q?TJ9yXNDDMqP5/FTonJYGZfcg1Spt6nSfHG23O8vvJ/iLoIAJIVTD+uhX8P36?=
 =?us-ascii?Q?p5J9pUYSqhX49kQDcEi5MfR6ixdr98aJXvJwNg9JLRGvz4QbCqTDZhecStG7?=
 =?us-ascii?Q?WiDY3sQlOfZtIsfs5SeWN6qlhjPVOfk5ivLum5gOlDSOja+3dzDYaqjYP7T5?=
 =?us-ascii?Q?hBfcR0gZTV3KU4lem7hGNjvaL4lNBNvRoGjbZF10YGRWIFOnwqRXyWE4ga0g?=
 =?us-ascii?Q?KTJQj4KXsckyNTCTjMCsOFQHx9GuZvLchi0qWjUEKiCGrRgexv0VujbAhou2?=
 =?us-ascii?Q?BRMN7aHNkJlTJGMcJeNsHOWQV+IUXDmXaAPo8/MOL5elgTlzpiytDAGHP1ZS?=
 =?us-ascii?Q?xCdtdGlDZ/KFdbs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?TOWnCW7rkKasI7XyiKbSnZnd3Gbu57RDMwjDW2ke5Gkd5mF2Fkp1bsGEZivD?=
 =?us-ascii?Q?2okFNztfXHnFouOg0Tk2lSeS/J/flEWtAvcpRTxfxDVbbVa1kZJW61LTkWwi?=
 =?us-ascii?Q?nLt8QHkzFO01HE3oiRnVBE3mLkLB70hGaDzOqnY5bneZhlE+WdsWt4GAhjJd?=
 =?us-ascii?Q?xbSYRiYBi0VLn3MHMz/ka5Wh/HS4RtDKEVNORZevBS2BQnyeBrhLSxzYFZgJ?=
 =?us-ascii?Q?szZV7SVhGJJO3OLlcta/7t78EpvRzuhUMMhr3qcHIkrO/051cRy9uDsN0/bT?=
 =?us-ascii?Q?ZMq+B40fRtlc8D1ZCJSFiEo15dIt0dnY2LphfS/O3pOc7IHcD9uM64qqTZUz?=
 =?us-ascii?Q?NhbZd1VpYcAvsFZ+dvbh91OFu7q3TYGxPaLoTvaMMVtp+ByZ1mDZvSzCkwB5?=
 =?us-ascii?Q?c5fXEp5qma8eQXwXdmaL6pFrqjUl2/oElrYvqX4aMIzQexw9Zl6Ddb8M6fmi?=
 =?us-ascii?Q?6LeNev+3qJRWOhIgnwvji47OQGCQpH+0LhfR2YDoIAq3hvi6knc8+YqX+V34?=
 =?us-ascii?Q?fS7mMbsuFblvMvmcbEy/+Wwk+CwYrl6/DpwwL6y/Yrl09wfo2MPkUHKJpx3M?=
 =?us-ascii?Q?6AxJoXrYqeSjM2qmnS1OEFWUv3JnYVbXBw8bQXCEy0P8v4M7cXnBj0ySPzLh?=
 =?us-ascii?Q?YMZbjFkIFxZiachophVkxtbSrfMDeDQc1GT8ullmi1sddXRYKP768wt6m7wy?=
 =?us-ascii?Q?7CjHXqvhepplO3eXsDaz1e9Ey8NUCIaD1Ahu8AMvIPEotliPECvS76NoLgmW?=
 =?us-ascii?Q?VhIf4glrVqe6oKAZ2+bUikFbmmBKhbAtf8kN80lOntNIMTTZHuXhzm5mOWCw?=
 =?us-ascii?Q?TXPjgBW+kEJzEJUy3YXU0CqfBg9oFJDtbzeqq7/qw3KMvqC4MZ1+937tr9lc?=
 =?us-ascii?Q?2/Quo7bXYV5Cg4WTuicrNeC7KtG4a9yjbUUAmPEFxv+8Yg1+vUkNgZ8Lokj1?=
 =?us-ascii?Q?mEAWzXOJmp9ZL2DUheaDFTkh1mg8kV1vF574MWXefKN3PQl/lbDptI4Md21O?=
 =?us-ascii?Q?+32/RE8ljIAycGZgX5c/P0C6q8me/9Xv4fDRpDWDP/Y3Q+ZBy/77DmQjZAMr?=
 =?us-ascii?Q?WMqNyjbEMDCCeSisCPIlN3udtLytmY/IvvrgasbXcIY0IqemPDyYZtaWSr0R?=
 =?us-ascii?Q?6PnggBww47BDHUeAiaYxNG8724eb4cf3crDwRVh8rC3a/r+6CF+3rDoe2kO9?=
 =?us-ascii?Q?NbFeGTanjS92URafiPejsm9+cF9ruIAQF9c4/QtNQCwF2IebNgizLS3NW2bx?=
 =?us-ascii?Q?Co6wWLekvNgLELrvMsWMgAlH7iznbg0zdKprIACVQVxrjX/5zhynaw7V3u9t?=
 =?us-ascii?Q?qTpiddORlFTCxNNl7WWk3Ic/9NWoMAX4UjKef5z+OuRdzf4F7fEYg6Upy2ys?=
 =?us-ascii?Q?Np9MlGF3nau5y82P3J2f/v8shA3lX+6wxzz0VauVkNx1JDBVSKiW8rnNx6fg?=
 =?us-ascii?Q?KGw1Hws9QBGcSbnRQge5rwD0d991CBCcUGQrPp1r0sE0za9IuicSmOxzKnu0?=
 =?us-ascii?Q?NUEwBJC10KtGxwkhRJykl6cY2rn3Z8PZRSj6ii4WN9BpV1foXNk/XDVciLQ+?=
 =?us-ascii?Q?B0k7POxqRChoHkmzVXtvBX0KtxnwIN1S1lO6gu4+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556f74fb-ee40-4b1d-7c4c-08ddf7973b4e
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 16:11:46.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4LPhxqtdGh4Po4TOYse8upUgLp45JsGJk0pjfw1kJKLkx/F70i0ZflDtL0tCEn0srBscPS+xqPUwQ11ugWudg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7846

On Fri, Sep 19, 2025 at 02:40:01AM +0000, G.N. Zhou wrote:
> Hi,
>
> Could you help to please review the patches which I have submitted some time back to linux media community and move forward driver part if possible.
> Your feedback will be very appreciated. Thanks.
>
> Best Regards
> G.N Zhou
>

Laurent Pinchart:

	Could you please consider pickup these patches? Consider these
related simple changes, is my Reviewed-by enough?

Frank

> >
> > Add ISI support for i.MX91 chip.
> >
> > The bellow patch refine code, no functions changed.
> >    media: nxp: imx8-isi: Simplify code by using helper macro
> >    media: nxp: imx8-isi: Reorder the platform data
> >
> > The bindings and driver patch for i.MX91 ISI.
> >    media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> >    media: nxp: imx8-isi: Add ISI support for i.MX91
> >
> > Add parallel camera input for i.MX93 ISI.
> >    media: nxp: imx8-isi: Add parallel camera input support
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> > Changes in v2:
> > - Update commit log in patch 5 to better describe why introduce it.
> > - Include two header files in patch 2 since kernel test robot report build
> >   issue when arch is riscv and compiler is clang-22.
> >   #include <linux/bitfield.h>
> >   #include <linux/bits.h>
> > - Link to v1: https://lore.kernel.org/all/20250827-isi_imx93-v1-0-
> > 83e6b4b50c4d@nxp.com
> >
> > ---
> > Alice Yuan (2):
> >       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> >       media: nxp: imx8-isi: Add parallel camera input support
> >
> > Guoniu Zhou (3):
> >       media: nxp: imx8-isi: Simplify code by using helper macro
> >       media: nxp: imx8-isi: Reorder the platform data
> >       media: nxp: imx8-isi: Add ISI support for i.MX91
> >
> >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 +++++-
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 50 ++++++++++++++--------
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> >  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 18 ++++++--
> >  4 files changed, 59 insertions(+), 23 deletions(-)
> > ---
> > base-commit: 603957ae903e81fb80d3788297c0f58a68802dfc
> > change-id: 20250826-isi_imx93-4a59288b33e4
> >
> > Best regards,
> > --
> > Guoniu Zhou <guoniu.zhou@nxp.com>
>

