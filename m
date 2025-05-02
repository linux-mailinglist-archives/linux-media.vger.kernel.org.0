Return-Path: <linux-media+bounces-31548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B7FAA681B
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 03:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF96E9833F3
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 01:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486598635D;
	Fri,  2 May 2025 01:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bUn1PHVI"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2066.outbound.protection.outlook.com [40.107.249.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5BDF71;
	Fri,  2 May 2025 01:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746147740; cv=fail; b=jUCeqTIZgUJ37PLFxSR1fVnHFNqu3tIob03siDbaTwqmyBJwPxUyNGgoKLF/Zb0zZT8j9D+xt7O5+q9aEGG65zVMFAlv+y+NZtXzjgQDgUoaCwakIUQRFcR01Pj78UU7et+3aDUzkTy+WbdJJNe7uWmoXOSpf8/WDXV8op2h+Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746147740; c=relaxed/simple;
	bh=KMSIaQSGNPd5Fk055VY8aaTAYGcj5J8LFGB0IZSnvFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WN7y7vbLIy8aFt2q1rrjbGCg3TrypbK38uueNKDxSu6I+cJMCE9L8us+xeT0SR4dbeTLnR8S1meJu2CO24uRVafwZ0pMe6et/MVQPoYdrN1Vn0Uybnrm60I92VG9Zm+2p2ECD4+3Z7iFpfdG1twqBfS36NuFNIDkVpyxRvFTC7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bUn1PHVI; arc=fail smtp.client-ip=40.107.249.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoixRh+dFNcUKOVniDTHifE6jV5tWV6oEuAFB0CIP7TvrkVI0cAGpdqG6Z1s+ssX+ojqQAxIpds/UfLmvkiPLZW7ogvaM+SxYAApTQkmJqF6OBDvS4bSIiN3BbvKKWI0Z00Y6NuKuxya99UuzWUnZIE9txfFmY1WXA7z7+Xzw3DNkCVQMlD/0FYp7Z3nAuqAFLP+yONuEx6BCguHbLgX4VEWBbF232qD/psNvDiMQN2mNSYRcq0QmLx2rPECEdQCuqgwJu2dh6Wj1tiqT3YuYyBVnKCbbq4+jkRQYTttfOG2z8e6JIVkItLoiiiAqFmqhwwiYIK30uSIm1Q80fW52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qkbv47cksRIbRihW9o+uD1KdSUdiSn1xNVzn7g8ptDM=;
 b=vebsRzrhtG5UJDV91RqaF9v4LBnU/Xs0L58dDD26duXbdXoj1cdREOQrfWOJaE7Q/vH/ITvilnQtSenEWqeUYpWk2BslVuQrcFIRfBBqOx4AQqiaEjDUM++C6iwfiAKOfbf2R5im/JiTRKXM2KLg+7QU+ibDZeSL8//54R1wUDlqXIB8/TvTK8Nhd3Z/C+VnrPXP65mzOCgrpaIjCJ9pTvYC1L+OUx79XS8XBW63s06YIMF9YHDU+RElN2cqB9ROyQeVpokq8NDtU4etHaXQKBW2/SzZEEsb9lAG4kt+7/nNs2c+wBzQxch9CU6UAiommcNbkHK33rzgb/AsTdn5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qkbv47cksRIbRihW9o+uD1KdSUdiSn1xNVzn7g8ptDM=;
 b=bUn1PHVISV54YXCbPka6cRkEg/bYLN8lt/BF3rsBAt4+2hIH0s/pexbKNNXvHNbR5+vQXAehhJdUSJxfAmM9dyfuMpbk3kjxT2zbZUL2/m1cWmA0XTu2XgB8GwiqzGWJkle+Js1UhAf+9sD/zYtVYndy+jZA7wHbsLRB0pPMeIbgXtRC/FMg9wtHiFeZeZ5kbiLV4GjFf5AvN2XIL1nhrT8AbhZyGfkhD19iEhbB7bf/q5S1gtS/Yf/r0TrWxVvAutYUx6xzOJ1lHWDpqJgv+kzU1kz5jR6Mns4dFdVuR7WcS6w+gpNWGB7c9IIb5nnUY76LkF351T6HKir2jTJX2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8716.eurprd04.prod.outlook.com (2603:10a6:20b:43f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 01:02:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 01:02:13 +0000
Date: Thu, 1 May 2025 21:02:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 04/13] media: nxp: imx8-isi: Use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <aBQZjFsExJh2uRfK@lizhi-Precision-Tower-5810>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-4-ef695f1b47c4@nxp.com>
 <20250421211438.GN17813@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421211438.GN17813@pendragon.ideasonboard.com>
X-ClientProxiedBy: PH0PR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:510:f::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4fecbc-8e43-4203-951d-08dd8914f97a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?qztW4dE/JgSEumKI/3y+qe/s20pwyYyT3MsqroLE3E7xDnSIylQjFlGSCZSn?=
 =?us-ascii?Q?zGT/2KCJYQqju51beVWar5zEbe/hmlDd6eX4j68jEwKhun2GW9RAmN3hQqdO?=
 =?us-ascii?Q?5fyZh9Ei1JqagpQ9/keRbsPrOIiwlRlurXslLhVz7c6E02E6L4frBx+SFJdB?=
 =?us-ascii?Q?SJpqeNXJq8Dm7VxM8I1Air1X67AVcsOAO+xI7bVIj4WO6zKHDlBvxRN4yvtt?=
 =?us-ascii?Q?VH6h52M+SGxpI4xbCW4B8S7Zz2qfp0jTBw6h1OYQaQyQ+uIzlzItidgRQ+Aa?=
 =?us-ascii?Q?80ARQEdisaxfKraimXZ2wA2ocrh3szDiM4RPwoP1CGRT+0lDZ4PdhFWetTxa?=
 =?us-ascii?Q?0Sa9wWZGcZfz3QkIKe/K0zY9Rd+PpNtozLHdCF6sisrdi5j7KyZVhgmNOq9P?=
 =?us-ascii?Q?y9eCU0pgz7tSsEv2EubEoaO+rekiI77OkiUN49z9c1joCaDgASlhMdSIk26o?=
 =?us-ascii?Q?atLHZQTKBwhlhwjD+rzL2bQPuoD2LmWilcGiF4RndPG9N0CasJWOoRoHRlP2?=
 =?us-ascii?Q?E43QPoIpVuRHcpjdNL5T61YFdThy3zmV4T6endnU4F0Xtp2vjuxwUQG7HkK3?=
 =?us-ascii?Q?/ye+5zc+IuGWx+FLCyvQuo8NUGd5Y8bd1ecqjNPdaQdoQGg2SOZThmyjQMMo?=
 =?us-ascii?Q?kmx/hT7O9v4UhL5KH3aEzLU9lMAx0UF+WvK8t9cqdW3M7p47YjqBBZr97W+k?=
 =?us-ascii?Q?zsB+ja3jucJdolUqmXrYwl9PWk96f5MxJeG6INk4vw12//K50HOtINVovLW8?=
 =?us-ascii?Q?kVuAdULt4gJ0U2+kCWk1XplN8R54uQ8Jids2BxWNpsodMa+c5t7do7XhP1mD?=
 =?us-ascii?Q?CuA5PIB2Tr8aJi0+oXOS+9LwNR0VpSL17h0PRxMQEtaXJpMwQqLA9PkSh8oD?=
 =?us-ascii?Q?/NoG7BEkPnKXIHvKzeBb1jE+MIczsolk/oJonGvtb+ifQreyIznn11GSFXel?=
 =?us-ascii?Q?+xonSvKQX9pOdmNmtdW5QMFnrbo6bQp0+8nDWD5gjdIQsk4ga4kD9sDcqggF?=
 =?us-ascii?Q?pEARSCRUpL7UJ0uUmMLNrXXRAnbyGsAacdHkvGvVvDUX5aGOFKjPdm+goqte?=
 =?us-ascii?Q?tIUaWUYPkaGEgZVOpyaXWgb9G7WKrYMkNnlLzaaOn+twBM2ZlDcTPLn0TfGO?=
 =?us-ascii?Q?5LoVksa83VokrXdni4SnCz4OvjTu0MBUvBOgsCYf316WqtoAX7kBHnYeVRE+?=
 =?us-ascii?Q?LlmdVChDrhN8pzIfDlH2u6Z72aN2sDw/2Hg8sG8cTyjq1Y1gOyRLYpVN8nTU?=
 =?us-ascii?Q?TSMALPId3uVfKjRzcDCaXGRy1/7oZ67FsGHB+6XRm4tW+mQwja1zX9R5ixPB?=
 =?us-ascii?Q?kJQpUdaLBYKHemvI0z8hhTM9kGsXWwi2cZD2it8Bxj4DpjRzzhCYDQXKrxIP?=
 =?us-ascii?Q?LUDO0qraA/DbG5yXl8N5HDuWwqndPno2Ez8PaZ7scThlE4NAML4RWVbkCJBS?=
 =?us-ascii?Q?pF3EFgOwDJ+wXIfpSgxs5jY4cM+a1JOqR1xamZOh4JcjCgl3PdiSWw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1bGl7wUyBF9ixt3CswB8O/RoYx6jgpS3/7CW7zythxVyVt2UjbdzHbLsWyYy?=
 =?us-ascii?Q?EbdvVU7ZbmAOtUTAGcMvJkljpx9nSL2ecLRvLR8pDdwL+1OofY1oGukt5NML?=
 =?us-ascii?Q?eRP3HWZRDEkmI3hQJxPYKFAyaz0/oKRNS5AWrUiKQzhsdeafr7Qd/5qW2vOh?=
 =?us-ascii?Q?iGr9ImobqdVqgJVs9f+JA7Y6sKUwFycOQ+AxuMsuIgoaQzpIKmTvzCs4VVEO?=
 =?us-ascii?Q?1rn3EMG+ocm3EOG1YuNfDHoaPiYeInyaOoli7k+IHq2kNyXUAzZNQujEdpJW?=
 =?us-ascii?Q?O074syR3RYyPkftkQRS4LTQbUlOVxgmXDwRuGIX7OnUnzsdfwHg+s7HG4+p6?=
 =?us-ascii?Q?CZolIZOCHSfPaOS4vDDlVUkt7W2+6tdH987Ztbhvmk9sxnmIWTU6iywzTWRF?=
 =?us-ascii?Q?3j95oy0T2cQjTPPixtUCo4dvZWZmZcjZTEt4pvrI1/2vEnzxBsvljy6vNjv2?=
 =?us-ascii?Q?kaZiTZKflFqmvMFEfSZv+UT1qxE7rqt2JW7G3HWc15vRuKpVT/RgY+Be+p4V?=
 =?us-ascii?Q?SWrYveR5XDhClzv2f2dxIWPdV9PplDd0jj5wXWEiB9Nito/c+p/yzGylTO2V?=
 =?us-ascii?Q?vtWjNdiNz8TcUuGPpYs6wXoAP0L3tDxkmsQM/Syb/gwmy5oaIiWuhtCvNa2Y?=
 =?us-ascii?Q?HQYBBsvHGx0Kcd2ttglRnMJ9z+aPQblRFGOwr+dOne8vTQod8U0HLh5EaNhh?=
 =?us-ascii?Q?oyYUYv9hsBD2ycwqJaOUspACGtGMgXjpD5biP63nH4f8KmsHx3VKJntFnbiA?=
 =?us-ascii?Q?mYKg80U2Mu6J8apTqBptCRJSQQpaiz73S5n81l8igfhjx0jNEbq8lt219CtJ?=
 =?us-ascii?Q?RfpMebhwJTWNJ3OiBaaw+EgGouqkyfoCbzgmFdbHE/uhPHLitoI3laHCGmpt?=
 =?us-ascii?Q?jsiwkFVYC71OAReqQBvYCtiM5urx+7M/j8CJBewxIxXEowe4y/jvE8O/eu9z?=
 =?us-ascii?Q?kJFk3fjzQ+fq/ckqiGZb833rkhVRLILxXtkmvM3X20FPRLhLhDX1iscnTGSA?=
 =?us-ascii?Q?DCRWud4BkjuTbscYymYevH3TLyXafuBfCvYDXrr2Ak6QI1eHLBZcKtFERZkL?=
 =?us-ascii?Q?xBD+NOGEGLmZdKMIVbECsJznVEDPw0TFse132OV+iMDB+p/3MyTeBhKAIgRz?=
 =?us-ascii?Q?IFYmL6do0W5PT0C1MHemo1Iu+u41vSSOOAuADLW0b88g0yYngY1odZcsLcLR?=
 =?us-ascii?Q?nFGpaV/JlKdJnwdK4Ro5iQMe4h+Jgu87TxqdsaMPPeit0ONhBdg9EEdQyIvO?=
 =?us-ascii?Q?KYBLNXz5DxzIUMMr2T+2wuvD1OILrdj3XCwY9Y38n7N+FZu/JlnII8a4kaGx?=
 =?us-ascii?Q?My5TjB8ajyLvK43bWGLHQAul0H5YC0iaoMZjIjZmBhG8Q8GGRTjxn9S3SC3i?=
 =?us-ascii?Q?/IQ02dwXpPRPYz3ty9JrhEgM1NS0y6vU1lBmiwzUHILY38fNUEbTEBTXsoO/?=
 =?us-ascii?Q?95aCkuP4xg79H6GnExmYfjf/0z8/RgE8r6Reh0cl+kM2nlNP+btFOQ/D+dtf?=
 =?us-ascii?Q?aw5J2pbPtZz7PZGRHDxB5X36erdSzHzBJDJW0zv/aoTxb0qql/F4BZwp5Jwr?=
 =?us-ascii?Q?hCw8nvKjXQAL6trUmnZKmhIzgLzA3V3ruMGfzEKF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4fecbc-8e43-4203-951d-08dd8914f97a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 01:02:13.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7ABYW/m/xNRlycaTnFfQG3kPn8WrDU8jvuYOAWvm6rxqCC7LSyh8wHi5IN3kQeDzTrEObhzi3L+k0EQevKHEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8716

On Tue, Apr 22, 2025 at 12:14:38AM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Tue, Apr 08, 2025 at 05:53:02PM -0400, Frank Li wrote:
> > Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> >
> > No functional changes intended.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 46 +++-------------------
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 +-
> >  2 files changed, 6 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index ecfc95882f903..015350c6f2784 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -275,11 +275,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
> >  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
> >  };
> >
> > -static const struct clk_bulk_data mxc_imx8mn_clks[] = {
> > -	{ .id = "axi" },
> > -	{ .id = "apb" },
> > -};
> > -
> >  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> >  	.model			= MXC_ISI_IMX8MN,
> >  	.num_ports		= 1,
> > @@ -287,8 +282,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> >  	.reg_offset		= 0,
> >  	.ier_reg		= &mxc_imx8_isi_ier_v1,
> >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > -	.clks			= mxc_imx8mn_clks,
> > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> >  	.buf_active_reverse	= false,
> >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> >  	.has_36bit_dma		= false,
> > @@ -301,8 +294,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
> >  	.reg_offset		= 0x2000,
> >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > -	.clks			= mxc_imx8mn_clks,
> > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> >  	.buf_active_reverse	= true,
> >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> >  	.has_36bit_dma		= true,
> > @@ -315,8 +306,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> >  	.reg_offset		= 0x0,
> >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > -	.clks			= mxc_imx8mn_clks,
> > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> >  	.buf_active_reverse	= true,
> >  	.has_36bit_dma		= false,
> >  };
> > @@ -328,8 +317,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
> >  	.reg_offset		= 0,
> >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > -	.clks			= mxc_imx8mn_clks,
> > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> >  	.buf_active_reverse	= true,
> >  	.gasket_ops		= &mxc_imx93_gasket_ops,
> >  	.has_36bit_dma		= false,
> > @@ -386,7 +373,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
> >  {
> >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> >
> > -	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
> > +	clk_bulk_disable_unprepare(isi->num_clks, isi->clks);
> >
> >  	return 0;
> >  }
> > @@ -396,7 +383,7 @@ static int mxc_isi_runtime_resume(struct device *dev)
> >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> >  	int ret;
> >
> > -	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
> > +	ret = clk_bulk_prepare_enable(isi->num_clks, isi->clks);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
> >  		return ret;
> > @@ -414,27 +401,6 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
> >   * Probe, remove & driver
> >   */
> >
> > -static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
> > -{
> > -	unsigned int size = isi->pdata->num_clks
> > -			  * sizeof(*isi->clks);
> > -	int ret;
> > -
> > -	isi->clks = devm_kmemdup(isi->dev, isi->pdata->clks, size, GFP_KERNEL);
> > -	if (!isi->clks)
> > -		return -ENOMEM;
> > -
> > -	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
> > -				isi->clks);
> > -	if (ret < 0) {
> > -		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
> > -			ret);
> > -		return ret;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >  static int mxc_isi_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -457,11 +423,9 @@ static int mxc_isi_probe(struct platform_device *pdev)
> >  	if (!isi->pipes)
> >  		return -ENOMEM;
> >
> > -	ret = mxc_isi_clk_get(isi);
> > -	if (ret < 0) {
> > -		dev_err(dev, "Failed to get clocks\n");
> > -		return ret;
> > -	}
> > +	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
>
> This prevents validating that the DT contains the expected clocks, which
> could cause hard to debug issues. Isn't it a problem ?

It is checked by dt-binding. Now no warning by DTB_CHECK under arm64 freecale.
CHECK_DTB should be enough to find expected clocks.

Frank Li

>
> > +	if (isi->num_clks < 0)
> > +		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
> >
> >  	isi->regs = devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(isi->regs)) {
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > index e7534a80af7b4..bd3cfe5fbe063 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > @@ -169,8 +169,6 @@ struct mxc_isi_plat_data {
> >  	const struct mxc_isi_ier_reg  *ier_reg;
> >  	const struct mxc_isi_set_thd *set_thd;
> >  	const struct mxc_gasket_ops *gasket_ops;
> > -	const struct clk_bulk_data *clks;
> > -	unsigned int num_clks;
> >  	bool buf_active_reverse;
> >  	bool has_36bit_dma;
> >  };
> > @@ -282,6 +280,7 @@ struct mxc_isi_dev {
> >
> >  	void __iomem			*regs;
> >  	struct clk_bulk_data		*clks;
> > +	int				num_clks;
> >  	struct regmap			*gasket;
> >
> >  	struct mxc_isi_crossbar		crossbar;
> >
>
> --
> Regards,
>
> Laurent Pinchart

