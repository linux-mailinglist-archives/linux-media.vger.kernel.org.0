Return-Path: <linux-media+bounces-29191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08815A78845
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C2271888CFE
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 06:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCD6233704;
	Wed,  2 Apr 2025 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dylzw60N"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2089.outbound.protection.outlook.com [40.107.105.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8572219049B;
	Wed,  2 Apr 2025 06:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743576368; cv=fail; b=W9UCgIo6mJNfk+nm6BJ3fWUoXS7yYnZqL+y8BaXCNu8Qv/hCNSVY7Cbygds27kOC1NfI218oiDidk/lFX+Fz1g7Tkj/6WV0Onu5O1DoJufW3sz8+v+nf6tvUpEqEujsOaBjo1ZeW1O8prBgsCe/Q2T9zR3vxyP1UR/zDYN2RtPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743576368; c=relaxed/simple;
	bh=h7icQ/AKVwkIqxoEBRooyV2M7KQItzNgL7DmuxBfCNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nuQXMCpCgZAKu+BJg8NWLG59tTdjdGBNoOZ+6tT73C0lSyireK9+mTCPBOk0PaS51dZ6lnOg5eml/il+efItQWfipHH4lBGyCS+YL9zkD0YD+sBcTo80EGbHFAAoqUPsunU6+2mpheQvhZhZg7MPnxN8x32qWryYI5r7GkX+cok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dylzw60N; arc=fail smtp.client-ip=40.107.105.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLZceiLEWAcFCfMHGS1RsfdGhG5Rg7gQsLi7nLxNJ2wTNEBcwA4ssYjmMURXuTO7EwrrP8Vhq+lW0Y3rPKlz/rIB+ov8sqGQuFMiSRBQ8WdYkUop3JSoKQerYVe60euLx5E+n+Yf88svuZEGxwCcr7f6Aj4Y3L4QRoSyL49kn/odW3pHm+cdg87BiDULPZM8/px+EOwcTFZtQn4E11pKer/IaCrBGRGJrM1AEVre3uwohtgfw9+R+MHDtnVoVKWroC8258nlRLBM1SXH/ESKRu5k1gOBFsuSp7PMQtOPBEibDWJmFPSavuYEngrK1U0u0SBxXxFoYBwXBbsNE5h3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3XGTKSe3xYx1rA0yGDMdiCfM+I4pINvQWbfIsyRqbE=;
 b=AAUnL5lVeyzaxzISw/1fGqS1J7K0Lly6MC+NNKa8ooDz79FHdjLaaumGKivU7w5MjTUb7nD8Wkaad9FahG5rkX5g+/7H1gUQIhaT1AN96nENhsbEYo8yYn+xlgsmfbZ9urqpO5HTwHCPvBDDR+S+z6qKiN8TrBarAgN7/sYMdZgQtTMxeh15BOZfgzMubUwqgJdhmWj8UXvucEPSk5UxeMjpFtGdPqri4QJahpPFmZek1eWlj0+mrpUGUJY4wB1aQnluuIBNr5cOLJ16sZjR03XeZz5D0fcn2Im5eaVLndaNwPir2bXRscnonGoXoZcurwJ0LYSK8qMxpZkIu7mbYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3XGTKSe3xYx1rA0yGDMdiCfM+I4pINvQWbfIsyRqbE=;
 b=Dylzw60NsEgHdpE8H84K7EFe2RHqtt6Cv97RXDw0Bl1ukWPz2u8BXjenMKiG1KPcUzmjz2kNjSLzyHgNLVsuk1iIFjXZv4G4A2C4vdfu4xGUrJgV7Sl2RF5uiLruNVSGYRw+Q3Ng1O8HFkWnWytoIMHGzDYy4DZ2Kmk2qEx5thVMu4Xlf3Q/P1nuDl24XuxC26NuEomlzwEIhFtpGieRz3BwoLwB6jhtWaGJBbr/i3GXrIbcSEcNGV5P2cUY3II7I6m0VhN/FWnxPf6+dAyVTOifqnTPqwAPYJC2ns/JyU5Q3GBlVSQdTcN3NJwsmvIBque/5IqHbcIhfWYGDlBq1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 06:46:02 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%5]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 06:46:02 +0000
Date: Wed, 2 Apr 2025 09:45:57 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Christian Hemp <c.hemp@phytec.de>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Stefan Riedmueller <s.riedmueller@phytec.de>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: nxp: imx8-isi: better handle the m2m
 usage_count
Message-ID: <uie4tvosmzq63qpi4fgengjfuodkzoy3th5zhurt4j4yt772ml@rpplzhmbiky5>
References: <20241023085643.978729-1-laurentiu.palcu@oss.nxp.com>
 <20250206203749.GD7524@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206203749.GD7524@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM0P190CA0004.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::14) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e632009-1bea-492e-a285-08dd71b2087f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?WeVAzOy+W1YrSpSze8ElT0szsZD15mPZIvxw3ZzdxLVdaHASyHWeokamwpLE?=
 =?us-ascii?Q?2AvFlfZamloMBU7oACtHDyJCFJP2xogiIBhEzXuoijExe70r62XVLc610Hhn?=
 =?us-ascii?Q?X7RJcSGLapUjHzC/Ejukcn4VHWggaCvirZDxdaxThmYtmaoKU1p7JthDrvW3?=
 =?us-ascii?Q?0RJBlZn1Jp2vjZkwmzG7UeeLQsi1EO/kv8k/kJedWxrTQNlPbgPaewIr1KCM?=
 =?us-ascii?Q?NL9RiTd7K9/miZdxa8Qgp6+JAmN9Um171iZqdXgbG9/67ztWoPh/z211Ld9X?=
 =?us-ascii?Q?fj4Et1JJGGbLXwFxzjs9SULVZe3Ygy/BToQBXq5vBuuga27+18w9cbB2TWyg?=
 =?us-ascii?Q?uJbkdDquPHwupvmb5QhuA1fEt0mgw6AO4ECz+T2yz5Z1u1vD4dlCuWOI/0xp?=
 =?us-ascii?Q?5HUyBobUr8eQHEdArpeck3BhfrGkTYdAwB22WVjoF99nQcPKhfDq9vYxsUzM?=
 =?us-ascii?Q?pN/uEIsZhagemA04QoZE1DFOAHvquprQEu5HP8Ksec/tvCiWE717TOGe2so0?=
 =?us-ascii?Q?D8pHdHOF7fQQl7SwoujaxaEyhFT/o4qfjdjbEhapUyumecV6PC24ojaSZm/T?=
 =?us-ascii?Q?Hp6Z/fMhuKa6f36OFJqVNL1dNXy24T2dlDsHVNfk1lIMTZXt1JPjvREL2VlH?=
 =?us-ascii?Q?aIReTCy6P/Z/y2UrQvKa7QtUQ1uY7V2ycBSCGLh1nahFNvNREmLAABMSAHjP?=
 =?us-ascii?Q?ZlNlTU5yLH448Mne3JCgSXbcHopM1hSJWtO7a8NLSQEAVEBfPHjM3OoPdYEk?=
 =?us-ascii?Q?no9+v72a+voAFhoZFiSt0G5GzMw0Dn79dSKdV28Ljq0jGZzEmWLqTyL/IkPC?=
 =?us-ascii?Q?etrxB1VTkh5s/mvmkgUnZ2+WTvicDZONF0Qt+BtoDQvjoRaz2EM81K24n+va?=
 =?us-ascii?Q?D8gfjyHFvWQEWhVS+hzMZlc9i4q3s0J1TBf+oLqxPUTvgcFUeF4H7ltslfqu?=
 =?us-ascii?Q?k9QN+BfiMjp1Xv4UOO/88vn2/V8hmSaKn3lkTiSwcTq9ARCi27C59q9JFcDm?=
 =?us-ascii?Q?nz5K1HL1eoERkKskTzOYqGWAgaJurcRLx7wCrnyX2Lj8rXOIQ8/WrWS3W0Ax?=
 =?us-ascii?Q?mFbjcpQALs65T67IUBMhWDztSojcQpOJ/8U5Jdunupqwsd16cWw6nEGnHQmr?=
 =?us-ascii?Q?tdHTPAbTejnDz45psTMjWreU2ml/sbyahhMiYPOid0YzVnOXvwfgDdHE+I+w?=
 =?us-ascii?Q?k+V4vXyAvcnDEY4+uF1NvxytNVyTTXyONrUgsPwr/2BbtSdsXMVmjlL27AM2?=
 =?us-ascii?Q?sudS8gdsNdv8MzcDmGv3/IKOKWCR+AfPC4mby9RauApoEPei9s0ALR9QjRxx?=
 =?us-ascii?Q?mJFL8PjXR9dR/bubdEO5itkbJCZ2UTJowwGf/jrlcjcO8EfK5whAro4bJGkw?=
 =?us-ascii?Q?57vxmAJhV2CIGQ8St3/+RsajsYQY?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?cskkePzMBOKkxvxV9s6cVokZce+3DLjfqjFvINPZ7bjBYgYtqqaPgVfn6sKj?=
 =?us-ascii?Q?lolA63KbVQdDGGYmU9yj65W0f4YoSF3qug/WIj7uX45WhkwFF8tiyPEgK4W6?=
 =?us-ascii?Q?I2tqsUFIL0e1fbNeanyYb5z3hn/ax49sOxYKl+TE4g1zS3IpG/xBhrz9+Ubf?=
 =?us-ascii?Q?JL/8nwztsG7HAD88wmMVtGJ3GYlaU4ESv+nvZvriU4S4F0izsw55QkMRhlsB?=
 =?us-ascii?Q?jHptM8xsAFVDAGZLtFB4Pgd37vi2YfTAVVRxYa/ZtCL2jM+4+21neGgNc6rQ?=
 =?us-ascii?Q?nYCB0YWdxNlFKe+KPHYTjK39saOGSqrQmwfvyJ9ARaWy/R5XhlhNP58ep2QO?=
 =?us-ascii?Q?IMz6WwwBJJCzaSXa9U4s4vv7laA4veizOKqNElUA/v+RcTFX+u9wwWgl1AYB?=
 =?us-ascii?Q?SmBmlMAGuXCckmO0XLzJRjl+5vT+O3uA3GD62AGZYDtflm+u6ugvbMaSvwQA?=
 =?us-ascii?Q?5Rcdret8g2SzM4ia7puXiKB8PLTiwKXcajKNEl4KeDF0F9Yb1fQH9+Dfk3zy?=
 =?us-ascii?Q?3ZtsKH6Orz1Exn58YFFbsf9Czww0M+37IgxAJAXxecC/pFxmPLRiXobXzHh6?=
 =?us-ascii?Q?6dzTjVaseRRdQwTUlGlixmp44kIjE1qA0QREl2TqB/XIIBiPywTpB9XzpOnb?=
 =?us-ascii?Q?Qd3YdCS3PA13XMKf9s/xenVlq/QXPWyqR9ifMHToh1LVAx8g03O4PO4NVFlp?=
 =?us-ascii?Q?QvKTID9YbcopbWhIzx3ge8743k/LQnt+rkj68nrNnJMwLl93V5qbZzb0IWjE?=
 =?us-ascii?Q?55cg40jsyHoUp9OnHMJJ095H5ejPxADFbsc9949gQS8mPiO9G2nfG7fGn2L5?=
 =?us-ascii?Q?LRwMe++IblBDyIgo1WXB5tCzkw50RjEFklDSINul8ln7wAOKHgs/K6IO/GXS?=
 =?us-ascii?Q?kY0hHf9adr5T1inV6CsQa9orM6HruAKUf+XzPd6q5bMzLtFC/YgsN2qGdHDi?=
 =?us-ascii?Q?1fpCxltobRxvGlIjWSHrJL56qHjytu63AXrL1v8TXxYCxjsu5wojtJBjDM5j?=
 =?us-ascii?Q?NJ7zYucTtAIBL1zM+56DetCC13qPErdpm0ToZ+5z45/ogpjcvea64eXxQWSq?=
 =?us-ascii?Q?LESnpwVOneyYIML01KvGmVbxHnPm6Kle71PECuA5kg98NTvwg6tftL3LyxnQ?=
 =?us-ascii?Q?1zdZIig7L1BJiJsKOhG93/YhvghNHBRT1tRmucMqvvALBtsKDWXoRvSLe3nU?=
 =?us-ascii?Q?ijE/Vas6eoY4ad2uarBa5JAs47VT5dSppR/omnNoc3e69Xh9a740f9FfiRCS?=
 =?us-ascii?Q?dXvv4dxBx98C2Y4fwzKPIxgI9SjO/3C7M7P8DQElcMpvdv49gdhMVskRQy0M?=
 =?us-ascii?Q?Y2i4hNVNYA1WxG7ajT0AA/QTyGa4Sr3WCqJpyDP0gaDrphWxN12PRHdv/mhY?=
 =?us-ascii?Q?bqgDd+e28ie/T96rPWgQzHIQmYVO4D3w7dEkZ+57HyDkMqSHoqugtL7B8JMa?=
 =?us-ascii?Q?ckeUp2J/+otRmkA1a8YxplDa0iATf4UxfeEs6IDq8xyGj26upcZu6rq1tAJ/?=
 =?us-ascii?Q?gTLzgFdDzcp/gYZLaP2NYUpP5DvF3L7Y44CN1FqSUhnO1AW8h0bEajjp5Owv?=
 =?us-ascii?Q?rVr1X2HtVrG1ZAAxP3fI6PZaeOYXIPaBaVsq0u4DOHz9mDIhazamKMj4ILz/?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e632009-1bea-492e-a285-08dd71b2087f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 06:46:02.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4Uz7Cwa3bOr6YWuIkERuDZcbYtc6WdFTA/wDXBkciXchXre7KsaMKlApQ2Bc41DPAzg/JITFrjIpTd9cFxxdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

Hi Laurent,

I'm really sorry to keep bugging you about this patch but it looks like
this one fell through the cracks again... :/

Thanks,
Laurentiu

On Thu, Feb 06, 2025 at 10:37:49PM +0200, Laurent Pinchart wrote:
> Hi Laurentiu,
> 
> Thank you for the patch.
> 
> On Wed, Oct 23, 2024 at 11:56:43AM +0300, Laurentiu Palcu wrote:
> > Currently, if streamon/streamoff calls are imbalanced we can either end up
> > with a negative ISI m2m usage_count (if streamoff() is called more times
> > than streamon()) in which case we'll not be able to restart the ISI pipe
> > next time, or the usage_count never gets to 0 and the pipe is never
> > switched off.
> > 
> > To avoid that, add a 'streaming' flag to mxc_isi_m2m_ctx_queue_data and use it
> > in the streamon/streamoff to avoid incrementing/decrementing the usage_count
> > uselessly, if called multiple times from the same context.
> > 
> > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> > v3:
> >  * Changed the implementation as suggested by Laurent and add a Suggested-by
> >    tag to reflect that;
> > 
> > v2:
> >  * Changed the way 'usage_count' is incremented/decremented by taking
> >    into account the context the streamon/streamoff functions are called
> >    from;
> >  * Changed the commit message and subject to reflect the changes;
> > 
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > index 9745d6219a166..dc10e1a9f27c1 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > @@ -43,6 +43,7 @@ struct mxc_isi_m2m_ctx_queue_data {
> >  	struct v4l2_pix_format_mplane format;
> >  	const struct mxc_isi_format_info *info;
> >  	u32 sequence;
> > +	bool streaming;
> >  };
> >  
> >  struct mxc_isi_m2m_ctx {
> > @@ -486,6 +487,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
> >  				enum v4l2_buf_type type)
> >  {
> >  	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> > +	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
> >  	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
> >  	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
> >  	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
> > @@ -495,6 +497,9 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
> >  
> 
> While at it I'll drop the blank line here when applying the patch.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >  	int ret;
> >  
> > +	if (q->streaming)
> > +		return 0;
> > +
> >  	mutex_lock(&m2m->lock);
> >  
> >  	if (m2m->usage_count == INT_MAX) {
> > @@ -547,6 +552,8 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
> >  		goto unchain;
> >  	}
> >  
> > +	q->streaming = true;
> > +
> >  	return 0;
> >  
> >  unchain:
> > @@ -569,10 +576,14 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> >  				 enum v4l2_buf_type type)
> >  {
> >  	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> > +	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
> >  	struct mxc_isi_m2m *m2m = ctx->m2m;
> >  
> >  	v4l2_m2m_ioctl_streamoff(file, fh, type);
> >  
> > +	if (!q->streaming)
> > +		return 0;
> > +
> >  	mutex_lock(&m2m->lock);
> >  
> >  	/*
> > @@ -598,6 +609,8 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> >  
> >  	mutex_unlock(&m2m->lock);
> >  
> > +	q->streaming = false;
> > +
> >  	return 0;
> >  }
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

