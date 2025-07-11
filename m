Return-Path: <linux-media+bounces-37446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68374B01299
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 07:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CDB01C24721
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 05:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475331BE23F;
	Fri, 11 Jul 2025 05:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bXwl3Ieh"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F5E2AE8B;
	Fri, 11 Jul 2025 05:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752211048; cv=fail; b=IabmSfyyf99o61aZCXebEbIv/1KR+GZKv6tOI5Ezez+KfTsrbsxcjsnB44DOzmbiVcG3arAN64orpDbQoKSQpy5ylQJONw2Zg8Jff0t5s+5RhcI7ZKkuDB/chrEq2fCUGBQ7CSVi6xmXzqgi2j4ZmRcToiO5g8/RGeaptiXQORE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752211048; c=relaxed/simple;
	bh=kUBeF7XF5PNx6Hlv289GzwoCE4DOY8oV8JjfrSuGy7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S9K0MURdhpVfREZ+8Xw+pHPdN2Q3izJP/vapuFSJ6TTU74c2cdw34cfls2hfEzMHlF2qE94Lwa5rIJWewVhVGSDpDx1djVYu6BUcnIs9B1j/37vgkg/8RW9fm/eX755me+1c23O1vsO6NBDz5sYqsE/tHkCeO/dA1AsVMAJ5VcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bXwl3Ieh; arc=fail smtp.client-ip=52.101.70.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVRw/wWElDFgKI8eFiMPlwJStDjKo6uC+mk+9G3yht3wXXw94AC3Bb6sH1jJPpaJmS6Es0qg2lPIbfO1Bpj6524zZTt0x6nLCSoO9i2xDiVGnviblgJgQGpt60wjvkqS0IpaR2wYGEt7bDxAuqMmwxMiTEX60CqemcUq6/4pw7i8t2BiCRWQrLhISMTz/fOUuFeEKZsyzf02sDcbpB82ecohl+tOZldB31d12JZwbND0ir4BWuBwX+MIPg9JsvVZ41DHJDKUHoSltFzxsUgktlwPu9y/LHmIleqCpRQ1PJ7v81IMWtA86QlHycZbyOxNoe2eCPNJ1bTJ3zl2xkxmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhBjpvnXui4wDeRoyrAU3P8XLpA0VZ4hDEpvxXNgsxM=;
 b=Z6qs0+DWa+nP7DswN7qEPF86AKglxLRxAM94GQTObkZK7sboFYnarwYY31FDkboaD58k+nPrY6jAqtSp9f5illNuXNWqFyBiJSwJgntHZcnZywYohB8aZm7fBm6n5xTIowKaZUQ3A3iqHO6lX3PDpgnb3i5Rku1uFlDdeWC1K8Azv5POsPGemwI+PCa3mp2QTp9ES1MkvtlUsVoPaDIt9h+bfZGCckeo40wycQNHd5fXakaoI2HAhY/AXX6XTO9v4VhUYvbOPMOGJhOESsm9dk8rNOvoaUxAYPNwNC3JClv4Hh+G17qzoMPfMID52Gu9/d+QguI+G+NfSxU1oywQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhBjpvnXui4wDeRoyrAU3P8XLpA0VZ4hDEpvxXNgsxM=;
 b=bXwl3Iehtr1P4EXEVgpICfHbgBYrWJHMxLK841qRsTswo2ni7sV3kZJ/HQk9IxlFP4JR3scW14keBtxPIG2GFJabZ3VDhPQ1cR80gLFUM1rJsYbSCpc4CO6h0OfUFN9v2VaPb620EHI7+6PrAD9LGbTz1LR2dLPDrQT1mie2/rCmE4Q3n5S0r+P/2gG2wwuvD2nTtjfMrCaTMvumxcQAkV2nXJfgEDXLTd0cZCExFuw8WzVjVujHrBHJzqOy3JBovq4jrGzf0nhUovEb1Z7kiijb7+2tUmzoawQ68H/yU+ay/VyC1f8WM5m1lmkW88vAp+RhQkoU2WO0d8PvtJn2Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB11527.eurprd04.prod.outlook.com (2603:10a6:150:280::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 05:17:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 05:17:22 +0000
Date: Fri, 11 Jul 2025 01:17:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/72] ARM: dts: nxp: imx6qdl-wandboard: Replace
 clock-frequency in camera sensor node
Message-ID: <aHCeXFLJP/MPF70Z@lizhi-Precision-Tower-5810>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-7-laurent.pinchart@ideasonboard.com>
 <aHAgHygUe6rWB/TA@lizhi-Precision-Tower-5810>
 <20250710203421.GC22436@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710203421.GC22436@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB11527:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b8399e-ee71-490d-35f7-08ddc03a36d6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|52116014|7416014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0S/bZA6g2ooebK77tB/qiszAShdQv+rq2d5aqho3P+sAErvqwkpYTvFEj5t1?=
 =?us-ascii?Q?Hv7oVL5uzqEmCd9p340jhBoc/IlTIGolJJHYRB9NceOEE0uWXw/4qRaobZG3?=
 =?us-ascii?Q?2FcZyxeUx4GSBA9uM8nlrlXIfxZki4HgQDaQY3CZCgSZJzZvl5LfSj2dajVH?=
 =?us-ascii?Q?cCTauHu4oaQCv65lk0WnDl1AA/0GA0FF+wwS21qSQeyhK/cKyB+RudPV8xNv?=
 =?us-ascii?Q?R44MH6ZUSbp12xNPCQ5ePtnDkpiVcm8jOe5ljncb9l84mLwoMjVQxroqTs5Y?=
 =?us-ascii?Q?TMITid1dwoRw7Zb9DC8P7D2FYB+nLVJywYrTG5QkzdI5Q4xICBXlJEJFqtYK?=
 =?us-ascii?Q?AuMGjYmEjp2IyzF69usQP9k5vNxcrLq30QzsIhcszE1JcD6cGd/rTecclAhG?=
 =?us-ascii?Q?MbCkYZJr9WmTWY4y/Mq2uEhZqclsre9aDQ9hyWjy5QxojgLwouKqP2W7mkrO?=
 =?us-ascii?Q?t/fQfgLxiZMQ7vFH5iNJRSTRfe13Rz4kKYbjWyPVDAKGtWADasXUj7eNK+vr?=
 =?us-ascii?Q?byfUkPt6luidTOqefTcy/NYsk2XZRLgyh46PBOdFaAO6Kiqnbi6kaoAH+zPq?=
 =?us-ascii?Q?qio9YGmK6WbV/MhSAcaLJnM4mfhjbuLguKNhmuu85ktgarJ/opruYamHMI87?=
 =?us-ascii?Q?fIvXobABYV9Nl1A5Ij9MlMmGe81n45/5FWN36T3D1bZdoA9OCV6Qlxpwgcg3?=
 =?us-ascii?Q?Ckg2ruUykopNdWRD1DPOtmhIhMlAdkQcKe8USvwHClIT7oROBTzJtcU0p2mS?=
 =?us-ascii?Q?BOACypqURPI/MKSXiW5MasjBvZZxHRLJs/MVYI8LTvvdn54POn4E3OZq6IDd?=
 =?us-ascii?Q?Q7i7y/uy3LaO0BrjsTb4zeClK+WYNi1nDfSOpM6mxg9TC5WaMkni1G0noQIm?=
 =?us-ascii?Q?6dX9Rqfmc2JOeb4aomjqhqKp90qRuoENC5Y/qdMS4rDcl/ws9pkv081rG1Lh?=
 =?us-ascii?Q?LDHZv0cigPxOJ5lDB7MDi19PI8bi92SdNu301Oxe7Zr6daN5COYrFWKWES2k?=
 =?us-ascii?Q?DSmWiB8b+V7VEO33FJKpIc16iyM5wnfFXdLSPOc/N6N4Ttw9g+RvojcH7F+H?=
 =?us-ascii?Q?pOgSuhF2PNKzd1aZoxVMWnRqApK1BY3po/3jxCq+PGJonJ8X4azFTDf1sG/O?=
 =?us-ascii?Q?Tu5GdPwA1O08yKxE9D2j4qjZFpH9N//b95JupbVQY6IAQ80ugRXFfkkTWguH?=
 =?us-ascii?Q?rb9Bub8hYrrDFJWFM7SX33pk/NLuTQvR9WbKE1NrXhEoaoXtdtkwV1FGB71j?=
 =?us-ascii?Q?Tl8agSdolbuMa2RdvQWBNSIQjxWl8k5mrX06SFjStLPn48Pgh2xQOV5Xc304?=
 =?us-ascii?Q?q04iaNkf0OXC7LKtf2mndMUFSm6TN1m6chIFCTkK0O8JLcDHYfCOL4sr3Amu?=
 =?us-ascii?Q?B0YYuNCcn43qwtNO9UiY9H0knzHXatkmZx25AAI/6hDDmBb3R2/QRV3S6fsU?=
 =?us-ascii?Q?9kSmpNSEukVENGxb9HVSPBxNolBtNCcI+qNd+c6L8/xXvzCS5DJUm+8qzun8?=
 =?us-ascii?Q?0Ko9whv3BOHLAMg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(7416014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?PlGtsaNTuCn2iQytG9pjbCoEqzAkqAYcfTVFPqgeyhTuP1sK4sddlhEQBHyT?=
 =?us-ascii?Q?KLWkv9sKjJv6FDtA+VQ/lNsVC0ZO/3gAbZrddiiRujbn/pJQ/cPD7XZS+6on?=
 =?us-ascii?Q?8kGEDxSg4HqHuHgTHXBQUxhSDHM2aRSQlGmSbPleQcol/qpHMl2+JSjAVm6L?=
 =?us-ascii?Q?hsOxIvjefa/jl+EGZymSNRGJ0/c+L+n4NESWo6kJu+KquXKGZmlFQEbUcb08?=
 =?us-ascii?Q?Qel6IniOo+0/jjZrTLoSXVsuf/Aq5tC9URicKpcKjNZNpFRLREHaFjeLcoVS?=
 =?us-ascii?Q?FOq1NY9/quzhkYaeAZGm9YJPzwv08v4/GVameJ8mwr7xZFPbfYLEvirKaMCH?=
 =?us-ascii?Q?Y2mp5OYf2xb0AW4sWjc3SkdUqI1GeP42vano/ZhRX3thXNcWeJpZ57+ly/Wn?=
 =?us-ascii?Q?sf8QiU3AtB9EZ81XNe3GZoglPbMCJOCEddE5rhby11VknXPSoX9etUJxYjiG?=
 =?us-ascii?Q?xcs+eoR+C71K3FSq4LaJsLyt4GxEsMA7voGatnyDEz9Cp52GDU6DfZpUNopX?=
 =?us-ascii?Q?JNW58yc9+WEfDgMqmKaBc4llnfVOClxsfUxXUb8zBXk2+c+/swSuYGSAY5ts?=
 =?us-ascii?Q?rfNG9hNuTlmozx6M9eqDpgXy5bjNn3r0i492y1E5+Um6vmcBBaxxUMqF/afw?=
 =?us-ascii?Q?b/5pVzzSIKr5sM7LH2swBiybk1MxhTo+Eb5FaT5NLEaOTbuEB11QNDMBrbpc?=
 =?us-ascii?Q?ZGhOQbpH6W9WQcUTeNJoLDwnR1byqE+bx9lxuTUuRukbYjAkmddKuU43Pp0n?=
 =?us-ascii?Q?NEMytMefedA3KAfLQai70WKO7NLc5Vo0zBUcKQ8mz5o+e5xp7NT9QuDu2XyU?=
 =?us-ascii?Q?WTkeyyw708k7BK/57b8St1kmb7Q9R5efNPBrNWpdXRXApxsrB4N23oxrTDl8?=
 =?us-ascii?Q?PM5kooyHtb7xXi+OFsLc0e4cqB4A4OMVGFyhqqn/Aq30PC7B1uUA5xx51e90?=
 =?us-ascii?Q?kEDYTGMfbjqzjVjSVTxHFRuSn8Cs/xJCSEHl4e/FYnjecQktkwqr7ZGhoFpJ?=
 =?us-ascii?Q?lDfJRgnCdh19T2kIbFisu2D6FZtKTwWxw+7ft6eErb4lbvNYYtjLL1NfinJP?=
 =?us-ascii?Q?S674s6ktqBGupwfHgDpVSU7n14nCot1oNSfrqPunnhQ2MxLYaCxmDZC+ytJA?=
 =?us-ascii?Q?rYQHfUqaj7zHFgJjXn+gYyw2K8G6UI87f5J2CWcO2iXsZ73biSmdGAMYxvbt?=
 =?us-ascii?Q?xAjKw/9XIhr10fbu7i7ZA0Qgqc8HB+1+b3ark/RcD9f1+6DvahX+5SJlpghy?=
 =?us-ascii?Q?xwcj3vQzevczF4uhhVjcHlGfHhxUqlkNj6qjWx1v3ZXjjCx8vzK1OVsC/0S+?=
 =?us-ascii?Q?pv8mHFP1mAIkd1OviJKOl8hfzkSI2m7rv8cVehx8SY7LKRUY8G1YX3Rncw55?=
 =?us-ascii?Q?0CruVEucKWFm9RfCmTIRNc33oADxBnocUfHlpbkKEzQGBVBKe6dtusEVzVdn?=
 =?us-ascii?Q?iu4SxnxFrr244pJh9u06lk8KPx9rNLenpqxAacoJFoXZ6j5ejzn4K+n++iVM?=
 =?us-ascii?Q?iKNPkHaveqgOY9rjfQtvtdNCRJXdYiZVTkV1a8rLOP6/EFEQGpA/ohSFUxOn?=
 =?us-ascii?Q?7xAN4eJkDNH9eFRKhlGk0zW4Um1uu+s4sAJnrTFE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b8399e-ee71-490d-35f7-08ddc03a36d6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:17:22.0091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrJedv5vIwg1ViyprJ7PNjDJTi7hnX+v40WjLL3Qugfbcs/EtuO5bAvC2fWzJCL9YoE6pYfcb+Ha5uRI2lRpYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11527

On Thu, Jul 10, 2025 at 11:34:21PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> On Thu, Jul 10, 2025 at 04:18:39PM -0400, Frank Li wrote:
> > On Thu, Jul 10, 2025 at 08:47:02PM +0300, Laurent Pinchart wrote:
> > > The clock-frequency for camera sensors has been deprecated in favour of
> > > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > > the device tree.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> > > index 26489eccd5fb..e5ac78ffb31c 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> > > @@ -136,8 +136,11 @@ camera@3c {
> > >  		pinctrl-names = "default";
> > >  		pinctrl-0 = <&pinctrl_ov5645>;
> > >  		reg = <0x3c>;
> > > +
> >
> > unnecessary empty line here
>
> There's often a blank line after the reg property. I don't mind dropping
> it here if that's preferred. Same for the other patch you reviewed.

This patch just drop clock-frequency. empty line is not related this at
all. So I perfer drop it.

Frank

>
> > >  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > -		clock-frequency = <24000000>;
> > > +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > +		assigned-clock-rates = <24000000>;
> > > +
> > >  		vdddo-supply = <&reg_1p8v>;
> > >  		vdda-supply = <&reg_2p8v>;
> > >  		vddd-supply = <&reg_1p5v>;
>
> --
> Regards,
>
> Laurent Pinchart

