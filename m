Return-Path: <linux-media+bounces-33206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C2AC14AD
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72D171683C0
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333772BF3C3;
	Thu, 22 May 2025 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G5yiKSc7"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACD82BEC3A;
	Thu, 22 May 2025 19:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941323; cv=fail; b=GgLuBYw6S2mA6GdZuENqdps1zkbHvsLOdMnGNV8jyZfqH0jjgmI01fCj/kcEvunFHXJdh+UPd3SRf1owJSHBZX3IiB9h5og6aqodkMkcmYAbthN1xpiVNZdqVhnW/NpGVMLz265aoCYwxpyL33vsxlFu1lrKw+VhGDJo83AgKpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941323; c=relaxed/simple;
	bh=qsVGHHDQ4kOMkn7abCAOCRvtCxQ3rgtLnufDmAcx32g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sefZDF7xmLwSqqn0193vLhy8qxIMmTDg/rRE+nF5NHY8nvUDWmZkKeOvxGhUiU24puzaFr9ihX1nW44RkkKslM0m3jabkZPpoTwJ0kwvtoD2fs7yr6f71HIBoKuh7BFou54FO1Ld2I84XKW3PhGvC/xnK586lMmtaVgOPH7vym0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G5yiKSc7 reason="signature verification failed"; arc=fail smtp.client-ip=40.107.21.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNTqEJNxHvF/41aVbOtqOi1TtA07uD/jTrcButh1kUWE1aydR702giGrH6/YGVA/7CN/T7ahNhU1OUzcBsyNc0Vcqhz1shxidmN+unFf5zjLZRcRk7DSqYiJIy2VmPmr3YuKgEoCLLngz/Fx1kjzz+czdO+Ct5fARTPnhDcUbGjxAHwZLH/OTmYdAanME/FwbEkfWmasFIDhwVv/3lDsSaR+sbgphRFBBb9O9WhDcLWY3X8f9g9eKMw2wzmlvg7atipgtaNzuNjZAeeFoNW/hXnWVP+3cXXtQIGIw6BEJKjDcTgeuEYYuF+0Xs4mMDgIf0jQJgqfa/i1IXbltofkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQeGWD9zAstCRZTNLXv7c9OfrB26r/CZZtY2tfagaKE=;
 b=hyR4FlhOQPfNXECEumzmacjOKEOAHMJhE2W8VWeTp1xc+/nTcv9SEK/DyZS5Tp4M6v1fEzZmMVG7YDTXLhdufy4R4BN+r+I5fMBiFo+Rwdn58AqTlT3JwlC1EjTd+E6n0yQ63+g0HbW3SQvG1AQGoavhZ8ZcI5SA8RemA68nsxKGpwXfotyG/Bjo0FxixBz5hWjZ6x0C1tU1RhVkr+8LX6QlV3zm3RYxM8GodQabsj6/7Ue5JcpqbcK7VPkGf4/EBu1dzy6/y+2RQXQyp1ppQelrfrGQZIPiX8PqDY92MWVoGrXBeQuwudmfJD0RdlHV37+ff4uXg01nx9A19UU5gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQeGWD9zAstCRZTNLXv7c9OfrB26r/CZZtY2tfagaKE=;
 b=G5yiKSc79OkL/tRq6lAusZIOkYr+zLXFFNK2DQAMYU6C6ZcUBvxgmT5b5c1oBfc2IYRzc5US9DmDzforqgrKg0XZ/NkQCw/XW05U+4bzNCHVswKL1AVWB4ftvZbDvs88a53WOzkN30+R4Ah3aTQBTKLEuOGXhgB/e47B348A1jpDPCnCAvtHNPOi+b0v9dMxBg9B5O1t8y/q86di6X9dHU64a3qZxNK4szDjPqyZCHykL5Cf50G8KPoBd4oiJTiVtVB4jQffonct1zh/dotjifYyAb4JtcQEnA9WVLG+4nOb3I5W/jWxXnuKDyUTWDLhEkEuIu6+Py/aAGDKq4UJ3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 19:15:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 19:15:17 +0000
Date: Thu, 22 May 2025 15:15:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
Message-ID: <aC93vDMFM7LsoDD4@lizhi-Precision-Tower-5810>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
 <174448105342.1415739.9619142538994119426.robh@kernel.org>
 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
 <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
 <8b18533170e7ba395c574de69768dcc27f718767.camel@ndufresne.ca>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b18533170e7ba395c574de69768dcc27f718767.camel@ndufresne.ca>
X-ClientProxiedBy: PH8P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e00afd-3593-435a-137a-08dd9964fccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?L0Ze5chbrNBzksqQrqmqAj2tpGjMtpZvPr4yPO7BnN45/YrRTNjNLDboD9?=
 =?iso-8859-1?Q?QJCM48wGilwukVcO0UL+OiPPZ2MjVMEfSOms4ZGdoaFRT6dam+fyRARtyv?=
 =?iso-8859-1?Q?xhXXmtxC5WIunfcAPRR0icMqH/tqjsM0YAUNm2jFCKqxnS7pTvl7C8wRQB?=
 =?iso-8859-1?Q?uPLzAkQ/yGSjj6ZeEVOASw/6Cdc2MIwSyXvvlxggpDguJiNRWZuV3IKu7U?=
 =?iso-8859-1?Q?7KB+YPFIZiYE+WEEZTgA/hwzD8Dg3R/+N77HKQQSNOFrZ74HKfB0E7/2EY?=
 =?iso-8859-1?Q?CpU66PkHRMNMKTog/B4dT/UvtIT3S753nCAQS3bTQgRU/ZPUagRJOISlgu?=
 =?iso-8859-1?Q?opgx8kKa8zX8Hr/H3nq7bTdergpUchC6gRea7EwpPSGgbPB8bHMk8r1ahS?=
 =?iso-8859-1?Q?YhT/sDjcGUi9ZZlKhBhqunrBC6YAmGHBuOgDqxcq0/hYFGedgQ41+xFiOk?=
 =?iso-8859-1?Q?Ou1IzDFwencFBdFbVcj968ufgsy7nVOwZoG+aLTO7e1RmBnbp12jcvUMVe?=
 =?iso-8859-1?Q?ZRQ9gXOolOTdNnOcX8T1wH1BobCVbdqM2X2ZOfTLFBhX3iWmynHc/kHcYv?=
 =?iso-8859-1?Q?hpkHShCMU30zAcflyFY37xU9wdCHhCnHC2v4OctqN2+xGdwLj9kUtQK7JH?=
 =?iso-8859-1?Q?o2UzADYYFISkUI6J4PCzTxJXwnpTlgsKq0y8NIeS2KB08m4naE2lXRW2uw?=
 =?iso-8859-1?Q?MGCjcZjrIbi3UCn9V3OZUmSvJv1AXdPRzLVkcHP7S6cyAOMLbxALPMCdvL?=
 =?iso-8859-1?Q?TW7MDitBI2VjlODhztvuZyPLHL/Gn66aok/VDml/kDHKrR5sHrD47lC05k?=
 =?iso-8859-1?Q?eZdwVitmSvwVJThhJXzUjr+0LHrgpG+nfQRrfjPMPBSpgAKBBJ2oKi6yur?=
 =?iso-8859-1?Q?EjTVtWQSNzFMQcInA9s/tATd1Mgw5fxCt2O611vAtEq+Z8aWxHvoxZKnyy?=
 =?iso-8859-1?Q?kqA302jRDG4lPbg6DwP7Jr3bExUP1KGT0pY7ToGCZAFqiXtWwAtK4ZFZ3e?=
 =?iso-8859-1?Q?BLvFvkGYK6HqRpXUUKjgDiDS1JuZCZkaN/MOa611J6tci5Y9gFRtYBHbZJ?=
 =?iso-8859-1?Q?01bAoRU4g+1hSq/qHcRpXM/pffls9wJDb4Y2PBPzyUZOcLT3V5GzqK2mOD?=
 =?iso-8859-1?Q?b7VoMfOnk88KHzAFuZZnRsMMex5Q5CX7pN82e4Adm5wBAate/F3+36vIdO?=
 =?iso-8859-1?Q?MwIunFc/BB9ypiWWoLfVKjaCvPFA7VLzPIVDPo5U5/3dxFMB07Rw6mdJjA?=
 =?iso-8859-1?Q?lNIW2QBFYXi2K+VBD5siKmeJZQzfdmT/9MEiLEDcPOo+mK881KuJd3+8MQ?=
 =?iso-8859-1?Q?eooQODxidqkr5NK4V5xnJr+gcAr4bMOoTZ38gOktNUswLhyrMTEaNM6hzD?=
 =?iso-8859-1?Q?IZZkFbFMRCAq89D6uZqOfiwNQurKrXd2G7i9QCVb61QlTFsRcVfZi2TMqI?=
 =?iso-8859-1?Q?MFsmS5rZgruXB+IhaMezq8TJDQI2QDhd73wZiGNlQQtMSQ9u92pgIH2/r7?=
 =?iso-8859-1?Q?Nszwtfn2MyQp6HQ5xItILphsrA7AQrLqHqsBHqsnJiiQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?+CWmQPE8QIiPmBifcK0yaoIgw0RYZpd8YhDcrEBLIV/bvJbok3PCuXg4lF?=
 =?iso-8859-1?Q?tg5ITr2ar2jBRm2CeNaTUKhrQe4HN8nDeI3LvH/4WEIL8mM+bAlirdvHze?=
 =?iso-8859-1?Q?pX8njln9gcZb7VmHlobBDypc0TglKUnxHLEiC/lfyRL9iP8BpDJAc4q8ze?=
 =?iso-8859-1?Q?MBbpNoWdrt7zipYI5Sqe35sbCq15AlLmkVDkHywCWf9ksKoB2zV6NIohYI?=
 =?iso-8859-1?Q?RRqnNUEx95c+lUkKp0M9BKkRyVzpNUCPrOAcVpyf/m1oBGtHatbqTf5Yrb?=
 =?iso-8859-1?Q?x5ZmzE3uzxQQtx3XrLghvKbBTQo4p0uGLItrY44Z6hDjSNUFe0tSWOKF3i?=
 =?iso-8859-1?Q?2f12cyWG74YY/TLDu/PLpIic8S+Woj2CAB8nkxkA1D58G/c058xKopisfH?=
 =?iso-8859-1?Q?iUzjQ3VlCuVrOR+7ZQNFfna8weG0G7OSOlCBEkDVf7n2Lkr/Yxfzjucx/R?=
 =?iso-8859-1?Q?jMDm0bj4SZynYOzDzQVJKI4sftDdyGEWt/r7f9CcjqmoeYBIH6w0xI5TpT?=
 =?iso-8859-1?Q?hFQXtklyWnVCf8cqltkYcdlAnoP4rMYyeti/Hlmb1CYKBc5x7S8KzTQ2Js?=
 =?iso-8859-1?Q?qAMkZAbKJczowYYjqOUqIFXQTK+7nX5MyxYf6fX16THDh2JedRLTvLNstr?=
 =?iso-8859-1?Q?1q2Vib+ysVP62stCx1pqc1lH1AmgWSwbXwxOWeVHDrL0oFYjqjE5Q3SFgU?=
 =?iso-8859-1?Q?0HbNK3MCAc61lmk3L1X9JIertnKFcrO/xkC6mQPtaiqdE7PAWMPQHJbGDb?=
 =?iso-8859-1?Q?RxxMMNZjyBPNH3P0PcH7DxoUdmqTUW7KUTkXdmuXys0+t2Qkv+zuQTI1Jm?=
 =?iso-8859-1?Q?thnhZ4uOBoqJQ9RLqatznOXw50+r2bK3SFa/g0iW077gMOErMb6/XpNs4N?=
 =?iso-8859-1?Q?4i6AmWJxNSzNgbce9SkBWfmqQUf7sjpIrlAVLP8etvFO7ejjwm0K87Jbfh?=
 =?iso-8859-1?Q?sIdJTUw+uckKbgo1eL8+qvuKqlmlDiYEyTSykFhxkTluvGcNRCYlPl6MSU?=
 =?iso-8859-1?Q?Uv+WSBabMGisXaQlnN6+AOOmO6ff2gaOnACHUcFLzKMlzXRAi9kSkr5iZp?=
 =?iso-8859-1?Q?SnEy8Bz8Q+5xFXS+s0Hwl+/IuRJdsFIK5V7krmZiND//fPIEkUJ91/qVgY?=
 =?iso-8859-1?Q?nMhSN4cri8uMtyPFq/GO8BWkf9shrJmjRvrA6SQ3ZWqEmi9mLwO2u1ZNmL?=
 =?iso-8859-1?Q?DN9Wno730WsMFHhB81F2KAhK6nm6zokhhsJGMzgteLeGhwsCzdyG0ryYBG?=
 =?iso-8859-1?Q?VEiptOwpwod6Ej4DVNozJnEdJPUApdp3O0FgJNYofDBmbjIMIgP4T15b5c?=
 =?iso-8859-1?Q?scG09uS84k09WkTLpGgRn0hyXU9alM8kiLj+6/OzvX0HexWEsei76mKHSF?=
 =?iso-8859-1?Q?oqUSGFOHrq282GzwdRH+4foPVEPJXUlkA/Pw66Yg/Uf5YgcU8Nf0fHWtNK?=
 =?iso-8859-1?Q?nC6lVx+FKTIvi2XXXoRiBEJPIUHYKZnRn8IU5ArRXAjhs4DcmRDBv6qNxs?=
 =?iso-8859-1?Q?jkuyAjg7ASn9eHf2Zp0RwhL7E1i/hxQkn7H0weVWVqv4pN603YbuHYsVyS?=
 =?iso-8859-1?Q?NJo44a46f54uBO1e+B+0i6dvFbgoHUTJQ7o+nhslZpS/wE5SZdfph0kGq6?=
 =?iso-8859-1?Q?kfIVGRWlb5hz8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e00afd-3593-435a-137a-08dd9964fccd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:15:17.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhQNaIsbWf6i1j4r1jeG6KoWbinmT+YyYION1T55Ms/yzT8p3nymG/NuDNMwRe+Gi6BBBVXYwplfTO6Mc9AbBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658

On Thu, May 22, 2025 at 03:06:01PM -0400, Nicolas Dufresne wrote:
> Hi again,
>
> Le jeudi 22 mai 2025 à 14:57 -0400, Nicolas Dufresne a écrit :
> > Hi Frank,
> >
> > Le jeudi 22 mai 2025 à 14:49 -0400, Frank Li a écrit :
> > > On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> > > >
> > > > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > > > Convert fsl-vdoa.txt to yaml format.
> > > > >
> > > > > Additional changes:
> > > > > - Add irq.h and imx6qdl-clock.h in example.
> > > > >
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > >  .../bindings/media/fsl,imx6q-vdoa.yaml        | 42 +++++++++++++++++++
> > > > >  .../devicetree/bindings/media/fsl-vdoa.txt    | 21 ----------
> > > > >  2 files changed, 42 insertions(+), 21 deletions(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > > > >  delete mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt
> > > > >
> > > >
> > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > >
> > > All:
> > > 	Anyone pick this patch?
> >
> > Thanks for the highlight, this is stuff from before my time and I had not associated it
> > with CODA initially. I've picked it now.
>
> Actually, before I do so, any of the following warnings should be addressed ? I effectively don't
> see a clear entry for that bindings, but could have miss-read and there is a second warning,
> which based on having Rb is likely false positive ?

The second warning is false alarm. When convert txt to yaml, only need update
MAINTAINS only when old txt entry already in MAINTAINERS.

>
> ---
> [[ATTACHMENT|junit/./0001-dt-bindings-media-convert-fsl-vdoa.txt-to-yaml-forma.patch checkpatch.err.txt]]
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #21:
> new file mode 100644
>
> WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-
> patches.rst

This one is check patch script issue. I met many similar issues at convert
txt to yaml.

Frank

>
> total: 0 errors, 2 warnings, 0 checks, 42 lines checked
> ---
>
> Nicolas
>
> >
> > regards,
> > Nicolas
> >
> > >
> > > Frank
> > > >

