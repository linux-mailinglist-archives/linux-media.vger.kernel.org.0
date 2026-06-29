Return-Path: <linux-media+bounces-65981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bY31MKmPQmof9wkAu9opvQ
	(envelope-from <linux-media+bounces-65981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:30:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 200A46DCB21
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:30:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=kw+FBXkQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65981-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65981-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC6A33330596
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA484279E0;
	Mon, 29 Jun 2026 15:08:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389F3EEAF9;
	Mon, 29 Jun 2026 15:08:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745702; cv=fail; b=fB3W/h01kKEpgfHS1NfMEs5ntBXaHo/kdk75M2mVBmsOvMTZl5SSft6lWTvGGBsOQ93+0OuCqEBwtyPKljXxNomRxcB3KhvNGZQEuvMxJJBTwHWb6DMup96c4Dc6r1gHNTJvAWp5ACpdkrkk5FGTEC2bGgFV5Z4dUTzfwLLFqCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745702; c=relaxed/simple;
	bh=rrL6ymDv6zDv+ikdJUkTcZS4Q1XpDhMDn5gpoffl9+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fEtq3STnqXpwVca1Q8qntFc4htlIqKqjALvq3iBB78b950kZcmVTsLLEyX8IDyuGXgTYK0WkclTTJ7UnvveSar12mtXd0BOLaHKWq8+l6ZKjPeemDKX0aqThMoh5kcHUNkvoBriTyfRfOCeDJDXPkG1JY4orjjan87Tu4ajCC7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kw+FBXkQ; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpiSfwRpkqCMF57+EqdncWLc96iXVGjwk35MmSV6skbTieRquegAiYiF6Sfe2ki7dv/v5IMLSddDhDajCHEBPECG/Lej4yJRrkHH1s9VliTd+gyGOVy2CqApel3qbdVUU3w+pxh55Pt5owTPnvMsPc8h1q++Vb1GRa4iIVxa1X4K7D2Hq1+2QBVC67+ybHi52bsU9h9g0WpnaiRvFgzPBEUaKiFCttcBvK9qlmJnq2oa44paBcX5AT8A8e56BH0q+oglc4oBJAV7zta2Qt2wyOqaGnZaOsac9CsHELPyC5W9lkKB8QQvQNi5MYohwcjc0gyIFt0D7iLpl2p0jpDG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7H3G61ijq7+XHi73CDHVMxMTM8P0HCPp2X9yuonuEg=;
 b=WDwY4xMBngFXb7RideS9nfMRV0P6Ou5PDBXGPn+LSQN7uIKtfhdGpmn8TRxUj+tIouRINqgaRnAA48QUuUTqhnoZTOgTCnr4E8h65LwoF47DOenAI4ctbFIeSTlxvsIIUmRXS7RkIGfKnAbvYE3W9I3rpZtYi7WBHRi7gZs6grRS0Pk4nAOuJTkH36gxqN+XFMoYRbm04QOt3znvOEaJPWxiGyADnrrmQ2e3uZSu5rksE8DuYHVtQ+h3xxwa2MXP7mh4u0fPJFTGYD2IAqxOaGDRz/kHV0ZIbHl2i2WAsG7bF5QFSN5LnubWhF4F/7QfTnC0oeivSYxfBspVQpEbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7H3G61ijq7+XHi73CDHVMxMTM8P0HCPp2X9yuonuEg=;
 b=kw+FBXkQy0XS1CsJ/wP4nICiCav6kc69jZQO93qran0/YnPh3plknLuIc1Ek/RqrZ3it0hbDFsO+1kp7eLosqRfxP3IphZ/lFhy3hmSogCWpvcPe1obdrl4WODIuWziqXTCzAHH6stCVu1AAhS5BAGkUbFTKh6GNvi3Do5+pyoj3oXwb/kZdmQI7sFrqrXiDUXA9bp5uuuZjxlUFM6jhNsHdPL4FSh8IvpVfbbnBkI+1jVEAApV/OM1JPXR93BaQiRnhBlmbbJMORucNIPs1Vy0ZJ2V+oCuFTjbFFM3VkRSdwZpoaADKDS5uWen8nvhroufElX7rC5i9pZuWOoM5tA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:08:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 15:08:17 +0000
Date: Mon, 29 Jun 2026 10:08:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/5] media: nxp: imx8-isi: Correct color map between V4L2
 and ISI
Message-ID: <akKKVSKxibnRfgaQ@SMW015318>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
 <20260629-isi-v1-4-deebfdb1b07b@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-isi-v1-4-deebfdb1b07b@oss.nxp.com>
X-ClientProxiedBy: SA9PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:806:24::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df9b0a7-7d3b-430c-a021-08ded5f03f69
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|23010399003|19092799006|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 z73EazHhMYg3oSOIYw5ZEfuSRWQL5nddeMAf11bAXjcZRUOvhgLlaPN1jtNM5vV2MbfnhUI9cBL1obg5zuf05Oq5A+NpYHrbNGGekiQk8DOQDhDuBZE+SZdnXiUGsrPetJ7kqEozKdgbULLvh8vv3JCSKV5C39Izqmb59YNazUD776zI8JLK7jDY6pCCyyUiRVS92K4MM/12vqpGIwRi7BWCY4leZyqpwj52fjUdh3XnV8DfjDvl4jTYTwcgUEOsYynfXbtCrYTa8p6eR0YVTHLRtmqoq01pGHb6xF6+ffpbD5t/s+YYB8y5r5+/vf8H8RZNkvqFYmrpf52rTqwASXSGIgz6uPXZIbZ3RX3DY40EXKbKl7f8mnGnLnr8blhD1NXw3g62XnOIUZcFWM3ERO+1xSrQu/lEEHmguFbK8ZBfjdHUuKsbXE4S18mKSs72XCbhaeSGiaUu/YUjs3dwCY2TjjLSE0GjLWZdrLPjztq2z3aoo7ZkVqNEWu9BYiZgJFNafWrKV6WOXStlwU+ad754KOv70JViwOEcnwQHtqpC3iEXCQoSdE2sY89h+m/3dYOTc84NNMqHlQRljl47Olpd1FXd7aDP3GeoS38sOznO8/y1Ov9thPYKeeo9TF+6CX6OqM2DIMcIgVMY/x+ltXGfnFd7zJva6W9TZ0hABeg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(19092799006)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?j0Z9xFWRIKundIkFd+tzhyJYgBLCDMuhsQqnGsZv0jNDY3Q50GMOvXk5Qcv6?=
 =?us-ascii?Q?hUJlkZTCSYAqzOzGVtUSeCEBBVgbwhEbzNoDza2a59Lb/wri5umorRE9FkaL?=
 =?us-ascii?Q?x7W/BB2iTD0hlc6gfp7yKcT1fi89J8LQxAR5N1lJ78hKa2x8JhOWcjuBwWZK?=
 =?us-ascii?Q?DZzcLmwEbc72pIHp8G0/c9gMdfBEKx3Bf4H8vqv0HqWCFZi/mKhNvQOOUlWx?=
 =?us-ascii?Q?9+7mHPdFNTYrn0QkZuWPpIMB8eJACnBFhUrmBbgEfUzL9y4+FyvO+GSnrTpl?=
 =?us-ascii?Q?fIsTAJfZCXsHFdf9Pt0EpLZh4vLJLbAZoMzXtEkLIi1cpWY8Sbg+im5UrcS/?=
 =?us-ascii?Q?RmfU43y3kPJWq22ipBkdLKtlih7vZwlnEd9CuIeWmOQzn4JSdo26kDfJ9pSv?=
 =?us-ascii?Q?Munj2XBLwZBcCGEJoFYBOc3gRa3IpQ1prcNWsolYOtOg1HW6IYlPpbqhtMFJ?=
 =?us-ascii?Q?UZoD1Cyxfsj296qYB7NQaEdzjnHihUHO2pbGZrUf6XOIx3D82hBQKQHCJ5lC?=
 =?us-ascii?Q?WS4RcahN2L/bR1nvPWtseNCdCoQi1B5JyCDLq/gZk3zACkqYvVx3NO0KxwVQ?=
 =?us-ascii?Q?xZEXhSM6sMm4691NYvw1Ve5cUya2q1H4ysCmNW2gB0a+dSQ470lPtPiUNv34?=
 =?us-ascii?Q?gKXhcKanzZCFdJenqQaPtMSKcyZqw/36Cxy4JoFLMnH1XGMS0WMGg84ccZzD?=
 =?us-ascii?Q?vVFbIRgg1E9M7E1RqE27oIwjeW9I1cHTHQtzb+7NR4vc7AbE2hSYA98XoK+4?=
 =?us-ascii?Q?VXj84mXNqmqz1ADD0a03LF2FckTn/WAbVdHgMU1OacYHXoYnFLXivOcV2Ra/?=
 =?us-ascii?Q?XOESlMIAG0lV8LfJ1zkbyCNffGDIEHUTfJJNZCgvj4dB3UFzc0i3nwGLKiDM?=
 =?us-ascii?Q?pZUytpBHMZF6gCche9DeYL8JrSV0ic0bs1C5s8vjCO37Qr2q43VgIYfz8fkU?=
 =?us-ascii?Q?ITGUPpYYtsxVu2o4Up8jVVMAHcYkC/SEPQntdLQbrKv6migKP9CZR6LiWk4z?=
 =?us-ascii?Q?HxHi1sz0QePVXN3OgRspy71gIZ2mCWzgOlx+PLJ6QxkD+9TCrqZVvVYqx2VV?=
 =?us-ascii?Q?LqdOBFmBIbel0yrKD0pQhx1s7FsqlOmZmnFoEnjRbX2VgeVRaW4LwVPwWIRP?=
 =?us-ascii?Q?lHMhpQbba/Lrc7Do1xqtcqxyZA+pSQAkGjd6IOQWgkCk415Po5u4037+zDSK?=
 =?us-ascii?Q?6EKULORMPlQ8aRzbAxlDl3LswTg/8Bhki/rAj50gh0AqwcOUakhJVo/mMag6?=
 =?us-ascii?Q?CilQDzBuEVkhxgzoNC2hwrqiK1p8vaHRc62Zy7gzcSDM2QnYt5dLwSF1VJS9?=
 =?us-ascii?Q?z+SUy0sL/1JJMwRmA9bG3eoP1OQpp1Uc086RRYJlhdJFlCSsOCNDKAWzjeW3?=
 =?us-ascii?Q?0WqSINl1xdxkVA1gDDLiBPXXFkOv37dxyxmqnkU/4JcaZGDu3FXP/VuuFGQm?=
 =?us-ascii?Q?1HTtvK/SW8sdXeMT9y7AwPMMWwwVELl3CiSai5JR81E1LVqRV9kn0qVg7ErU?=
 =?us-ascii?Q?O2A/QZuGgocOWT+abZfoCHDhL7pOnCNpJGgqwhyMQKeBFDHZHC6vFkKW9oIT?=
 =?us-ascii?Q?2dIHhjV/aRtenJ20sGvdkIKXZZDZut0FPrXFJ0HWjA+6lstJfrfGYBYboZb7?=
 =?us-ascii?Q?x4v/A5Tkwz3kKkhr6hzh5BcBHMGQcfbiIH15+NJkjejA950pNWJtqthRelwJ?=
 =?us-ascii?Q?5YjMe8U5YojtL7/WdEWkn/9QRzZ4KKtYTt2q5FVyWAotpOWzvh1Qn5nYmyw1?=
 =?us-ascii?Q?FelmMxwNZT/9ZLyeeJTjHKBLySDWCNA2zC4/gP5GxxbI6ksoImml?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df9b0a7-7d3b-430c-a021-08ded5f03f69
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:08:16.9216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuCs48eCiQhvMuzTIATXF068LAL8HI26/SMT83TyuF5PWdATHmoQMLQAwcf8p31P8H9dpJnCSIbMNFxYQSt2va/EMDjmCMHdncYUDM5ria/z/Eoe504bO+XOpKyIcOdF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:guoniu.zhou@oss.nxp.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65981-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,SMW015318:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 200A46DCB21

On Mon, Jun 29, 2026 at 03:44:58PM +0800, Guoniu Zhou wrote:

Subject: Correct V4L2_PIX_FMT_XBGR32 mapping in m2m mode

> Correct color map between V4L2_PIX_FMT_XBGR32 and ISI input
> format XRGB8 when ISI works at memory to memory mode.

Fix the ISI input format for the color map V4L2_PIX_FMT_XBGR32 in
memory-to-memory mode.

Frank

>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 5eb448f4c26f..05b51b98344b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -151,7 +151,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.fourcc		= V4L2_PIX_FMT_XBGR32,
>  		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
>  				| MXC_ISI_VIDEO_M2M_CAP,
> -		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8,
>  		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XRGB888,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>
> --
> 2.34.1
>
>

