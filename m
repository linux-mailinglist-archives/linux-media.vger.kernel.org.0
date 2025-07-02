Return-Path: <linux-media+bounces-36610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9F3AF5DAC
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62C534E7AEF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B3C3196D8;
	Wed,  2 Jul 2025 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nnvuDvSv"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FD827E05B;
	Wed,  2 Jul 2025 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471747; cv=fail; b=IOMCmYCZsZHdUScbgq6eNNqVg4kd2EMlyIKxb9FKdH5o/cCYV18936xV4XYmoAGMtMe8SoCUZHQV49AxG0CgmteQhhetKGVkkofF+hGrGlYk3yfzWTEJN5lzwemEy8CIOfSPV7ViaWO/4AmejuvkMbHJ9bWtcP9Oj1PNU6xPkvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471747; c=relaxed/simple;
	bh=TMYzJPhtKQTOf6eg7Ne++/UoUf7k5yDQs+pN0AGDaus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PM2RHsmv2Kr+QV7298VvvubM+2O+eorxGCU8Fgx2VrzLT0MNeDRy0kwLdrNi+pzEwTXJ6++39FXvvE6VXh0r7WDal8FqR0HUr631ytTXM0qV72FHK8nzT+ZLf+pL4ReHwIP8MeVN35i8KihtL+mTiTJLtcSOm4LuOEzP5jo1+/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nnvuDvSv; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smQIAjE8135a+RHo67e/vpU80JM09uAgZyCbIEDKZt6eIXthjL+kMEFby6yLSF23VGRMgIxur31Wwmo74BryPZEu6XxScS0W+Y8sEbmsbMflu2zoE2CxjCqdqYN3YVzBkwtqEooe6XKhF0Q4j/UJeSQ3f/J5wLduxoHroia91t4vSd4MvsYaYLa7JIIYA93T+FC83crQHXxUL4DfzLA1IBW9PJRB6pHDXJMNOuUnbrXEUTmCqnbUUwrCwJX4uXhcLVzo5R5LdR1A4nD5VlHU+eI5F9Gq3QIBoENZLlDbI3ap5CxemtwwyuXxipn74dEF0K16REO/DCcamDQSl5sIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r88DZfH4cW/V57Wk5Ex09EUlio3YpDyK7ms7NEbhnu4=;
 b=rOINAluNkDDidwJQO+3snbeUoiprVQ5Hp9rcLxGM1KcmblVszthwgXssLGrfcZHcUejRyrkQ0mXIQbiwHu9goZWOdwXwYBu4xHfoQeQ28PLL2oo5pLP3e5lhcqVWllijutKFHREtsBk5z6nzMO3+NhfCezCtoiT0jtH+1ZoLlzbO/qMeb/arxY4nIlvZ8sRWPDh5XphZoRLr7j4B6SzA8x+O+SfLve5Lb3MV7yo/PEKqI41u1oI0DJXZuuZUgwNWcu7r1lj9PAAW4gQzbXGKUuHcv/SzeIeIfd6wvR5CqYKi5tjF6l5E3faVNusGr7k0WCRo+fGdKtLdmhTDuHJsfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r88DZfH4cW/V57Wk5Ex09EUlio3YpDyK7ms7NEbhnu4=;
 b=nnvuDvSvAkDB3MaDvOrFLJrhgyzg2NTbj1RYEMJn5a17DE8O02wADbqDLgTn8jvPR1H3vdqI47ManWVBPjIHlvFn9yV4ek+0FRSUUY6GirsWjmLVGgL3/v3mOWDtucNjUsEjL5aWffLsY5bArzba6dcpT2eeUpgi80NysV4PHzFYe9DXsY4XPOV/qECWR5HkXgBFbvYq33cdyYDXzt0CYir4MM10qdFBMcgeMm47lyPJIKd16tOpqubhYpIExDOmlKdEzHkX3UkQLkapTH0yflOpZpuuxibZ6gomnQ8no9fEflxA3pmiw8m0nkA3qLnkoOEuzVR/aaMyiQTEIog2gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10598.eurprd04.prod.outlook.com (2603:10a6:10:580::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:55:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 15:55:42 +0000
Date: Wed, 2 Jul 2025 11:55:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
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
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 5/7] media: nxp: add DesignWare MIPI CSI2 controller
 driver
Message-ID: <aGVWd/bo22pPeKVS@lizhi-Precision-Tower-5810>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
 <20250701-95_cam-v1-5-c5172bab387b@nxp.com>
 <20250702093806.GF16835@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702093806.GF16835@pendragon.ideasonboard.com>
X-ClientProxiedBy: AS4P192CA0007.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10598:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df0996b-0546-4b60-6b1c-08ddb980e5cd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?iKT2dw47ZShwO5buj5PUjnv2eCxiYtk0KYKhvw+SyHDeqlFpjvjXrxXVejvM?=
 =?us-ascii?Q?H+IVIXJaQpxF7ikyJZ7272W1aKHtJuRtcFBE+GFwGbu36EDqQQDtlpIfa0+o?=
 =?us-ascii?Q?y/vr4Urngo55NmFmYWcXgIZKDE/oukXtCFXsVcQSbtoPqXqlBzv7gEwkudsv?=
 =?us-ascii?Q?dAqTyjjMbH5NaDNLMmE0sD8/ar23T4Lco6lOz2V2hEK2i1nk+SOsBNhvTAly?=
 =?us-ascii?Q?vzwXbE0RbyCElla2Fm8Zd/Y8MWZznm8dlm7R+wL2FcAD0uyPHSl+mZu/otl9?=
 =?us-ascii?Q?ieLAYH8IeVSayFVxy4lxrSsFkdgJx6VIJGmq2yu35IK7BGGMF/XY6l84zLyx?=
 =?us-ascii?Q?5WpOKvqy7EwRGOpkx3houad/IrcsQnBlVkRKz3eNgUC0d0kv5JvpnxcW0oAX?=
 =?us-ascii?Q?iwtzUk8wN51OQLR1zuGHiQ4zVJJeIzZsji4ICBUz6e4irfC0kD06OHuTzw4a?=
 =?us-ascii?Q?FWgjKc1Vf1BeXCkLYeWusaR7gbVPi2bkZvUHPIXsXaKbnURc3AbI4A8fN6oT?=
 =?us-ascii?Q?RiGMralVE2wDoRGNnykTQkvAoMTdEHUyJyH+loE/fkKqXNxYIE8zCLQ1gxtG?=
 =?us-ascii?Q?pgmA7W8zvI183ZVwDrifUca+pxhLikgmIglx/9zfJfwLzbY7QGi54xHajbSr?=
 =?us-ascii?Q?GJ53P1mYRuSMb08Ts2SO/t7uAjBZUo9HXIAu3Xyvzl6xXLd1IFi3am2/bENx?=
 =?us-ascii?Q?fyQm/J0Mzj/zHw3i8gozwMcb6rLvCwDf841SylqOeBgAdUssTFXihKSAoIBc?=
 =?us-ascii?Q?9UdVFR02pDoi9OrvQVExwDF9Pxi8UeodBSk2PpTcU5hBDER27HZ5aZs+lcMb?=
 =?us-ascii?Q?I5/Qn/ovHTh1amlfcar1JvsDLx8T8wdxbXsNpaGqrtSZN9FnpxV3vXmfQCFp?=
 =?us-ascii?Q?Xu4jANnH/Dj2tqhsLVt7S/I/OZmugkb816cbbar2EgPgwnNt13MRV1eCLtzD?=
 =?us-ascii?Q?iAMKcPKlMMUmy55NGmVsSkp87pkC2nRu6CKhF7ZW3HG6Dr84tbjQONZ4K4Zx?=
 =?us-ascii?Q?QH0Pe3MMtTkQAjZEeo6B/Ci9vAbS+2TiSzWTtNfUiY8D3v+YWOBoyd0ZUdab?=
 =?us-ascii?Q?2qFqNqrWU0NewmmYT9Iu0TbqMKDl+wW8k8IqWtPZJrPRuDVosSuj6zQuBR7O?=
 =?us-ascii?Q?z4Zo3DROOpSfjhfpJmvARQLPoAJ6FAZJiKDqdjRDee8iDZGhTr2yj4CzZxu9?=
 =?us-ascii?Q?UVwAorRhoWyFYsBaUhLA4W0i+Kx1UJRi/fwC7Y49Mx9BVqUgUVumiRrXOZL1?=
 =?us-ascii?Q?f7JWLbCKd+VT6SUUuy90eduSCe4m5K9gMajmBXO714WWdxYFwdjbRG6ardBg?=
 =?us-ascii?Q?xpkDqCYYkVE7g04g3Sd95q/IAXnxoemuZsVykihrPazSLMKGrlrKBG7hKOAn?=
 =?us-ascii?Q?4vjXoOfTpZmEWBSP/S4C2JD4BzEy4hKgY3nsMgljSItPzPWHz9oA/0Hhg8FV?=
 =?us-ascii?Q?InjNpi8OmXt6jShCWfzX34hbtXO8rsz3tM1P3zqTcFqzvbTbNrIa8g=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WFh5KTD1diOAXHtkZsXg8a48z5+8jmjFhkyHBO5I9cZS+NVVerfp1Ea9Oo8j?=
 =?us-ascii?Q?XFfGgZyk6A7dR397lpAfmibAtU1oamZ1PqRqz7/kCZ7mXEpWb2GCq0jRPVj6?=
 =?us-ascii?Q?2qjxRetgWF4MBb758knmNUUByXiVIu3xvgVc8NzB6sU4uK+15ef976emVwpz?=
 =?us-ascii?Q?p/V4svCC+fFHmKMoQ0Mrh7v2jj3190Q4t7CmQGn7vJMcixa1HFP/btjVbVPY?=
 =?us-ascii?Q?WdbJ2zcfXCVMaJiVPNC9NiahE3eNxGBAd6KzVGKmGypQKgpFOx4UkOALlrz9?=
 =?us-ascii?Q?PLVcHR0j8R/NCGZNI6FBTnFvdNjTjJjonzzjJvwQS8dwagYWEGHIwHmliEAx?=
 =?us-ascii?Q?1Ky2UAG0qYQ4wxoD/9jnRQ5b/3Tg9Wr40MiSRefV+xvZUSSt1gf/izLgttfU?=
 =?us-ascii?Q?FMBg0HoupGqs7lDryXV/Iz25XOmaqc0KtR1CoGBb+YeJBX6ln+WGpyuxoB9h?=
 =?us-ascii?Q?X/bdbhNg3NxuCfy4vVgoqWFbnIx4WLwLrLByZUORsKDfs+yWLT4mt7cz8hwv?=
 =?us-ascii?Q?rehnqLb+t6j/52ybS3hmRyItf3Pzo8TVDDmvpm+NmkTm1RcKkRcWNYxvq3dT?=
 =?us-ascii?Q?05xxp2ABNF5EbOlqXGOvDkidq13H0otgkFsggr3lZDLVDdSQXNyRH2JIHM7O?=
 =?us-ascii?Q?4GqGiw7W6WENUpKsZluA8xVYtMKFvtgp/JIyR8r9JHWECHGRd/FQewRagz09?=
 =?us-ascii?Q?YJDcEsRwWAElf5L5E4NtDuW8pFcDvOsI4svWfx3dZrk44scHQ+lSXiYtYAUY?=
 =?us-ascii?Q?GNITrk+4cPzvMJCu5cAsKpLQ3vlm15OmKQ7S0Q9I+uQLFC5O/zVRGoJiqD3y?=
 =?us-ascii?Q?EmCUsFd6yngBTXYq29/2JCwGgCTuEZ4FaQivi9gf+78weqWmsfYBXC3hw3fM?=
 =?us-ascii?Q?gwVbljCHbivTKy5qPaWGsXzDL5HW1Pe3CLTwPwvCF3BbAXaElXAtyhWbPGJx?=
 =?us-ascii?Q?hqCoB9cuCnDSVTrktRtE6OoVxudR0Me3GYrgwKuHW5zrXBvhBIm0W7fzmlTG?=
 =?us-ascii?Q?FTxwKTeN3Qzks2MxJ95hBAAM8Ph6m+NnvDNI05HAkGKKG5Ted6sJtdAHCpgB?=
 =?us-ascii?Q?SKcRYKuuvUNoYfue4gp2yp6ppDXcm76RNvYJhuaaqQGffeTry+m7evdtZrzk?=
 =?us-ascii?Q?QSTbeOEfyOwMFjq0yMSSuNJk9yYf6bymg/hKRi/hvXJkWsb2CSBeFxu995wT?=
 =?us-ascii?Q?evRggGkzcb88kX/YkkwqMAamfECiOHxiLf33rvLBACYiCaNBe4W9w/chD4XC?=
 =?us-ascii?Q?hRIKLVHooJO0iu2JoQaVmhZe9s6p4msE/uwTRFKHc96AkbBHJEIGascnZb+r?=
 =?us-ascii?Q?On8QS1f9UxBJausakQC2RscuFjCIwojHvTzCAhas5I93ErLlIulc01cLQIWp?=
 =?us-ascii?Q?Y2e17wZczQI80c0gipUh75YJYc7PLMrxMjhRouNBhhOQ031BrxRsDByYwR1T?=
 =?us-ascii?Q?aXtyizqvTv8NdskU7FdLYEnKQQxKalJ9702eIujbLHD+YfvXmCq0Bk5BfeOe?=
 =?us-ascii?Q?nxQtyJRN8TmScwHbqye3VeVPN3tNAgWuYBFMx1LcSdKwqL+BdoSkE/GHFD2O?=
 =?us-ascii?Q?zUCM/oWYjNy9iAU2VRg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df0996b-0546-4b60-6b1c-08ddb980e5cd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:55:42.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bgQjkyvpoNg7tm8nT3ao3IIRPrGRW11fKHkSacyQJExyKJpt2ObipoqWaRlEaUiqheS+RTvrwb9i983V8INFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10598

On Wed, Jul 02, 2025 at 12:38:06PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Tue, Jul 01, 2025 at 06:06:10PM -0400, Frank Li wrote:
> > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> >
> > Add V4L2 subdev driver for DesignWare MIPI CSI2 controller.
>
> This seems to be at least the third instance of a driver for the CSI-2
> receiver, the first two being

when I read spec, I known it should be used at other SoC. But I just jump
to into this area, not easy to find who use it easily.

> drivers/media/platform/raspberrypi/rp1-cfe/dphy.c and the second one

I think this one is not good abstraction. it should be phy driver, which
use "test" interface to community MIPI phy. I think it'd better create
a bus driver, like test_if, DPHY should be child devices of this test_if.

like
	csi2@000 {
		...
		phys = <&dphy>;

		dphy: dphy {
			compatible = "...";
		}
	}

	The tough problem is that dwc phy have one kind of combo phy, which
	under both dsi and csi controller's test_if.

	CSI need config such combophy by DSI test_if. I still have not idea
	how to descript this type hardware yet.

> drivers/media/platform/renesas/rcar-csi2.c (the latter seems to support
> multiple CSI-2 receivers).

This is one mixed PHY and controller to one drivers, which is not problem
when use one big MMIO space.

We can create dwc mipi csi common library, let each vendor driver to link
it (dwc pci/usb did this). The issue is that I have not their hardware to
test it.

> drivers/staging/media/imx/imx6-mipi-csi2.c
> seem related too, likely for an old version of the IP.

After we create common dw mipi csi library, we can move this to there.

Frank

>
> Could we please try to avoid code duplication ?
>
> > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  MAINTAINERS                                |    1 +
> >  drivers/media/platform/nxp/Kconfig         |   11 +
> >  drivers/media/platform/nxp/Makefile        |    1 +
> >  drivers/media/platform/nxp/dwc-mipi-csi2.c | 1675 ++++++++++++++++++++++++++++
>
> This should go to drivers/media/platform/synopsys/
>
> >  4 files changed, 1688 insertions(+)
>
> [snip]
>
> --
> Regards,
>
> Laurent Pinchart

