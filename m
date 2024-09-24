Return-Path: <linux-media+bounces-18489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB0983F02
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 09:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B861281A44
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 07:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8F2145B1D;
	Tue, 24 Sep 2024 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KTNjdDLP"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CC01BC3F;
	Tue, 24 Sep 2024 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727162611; cv=fail; b=fhdqKDKV5QI34zpbx9841ISUHTgKQvh9AeZmJfaVZYLxBp3HU3nU5Ml7BWtdLdViY4AkaAIPuKnxD0bAmEOb/Zud7KGsMd3m4h1b56fZQek3cik1nltZBYmzY5KBVBYXMtFJMkwCKpFrJ8HJmyB2D/mAJ6xMRcDGUJQebuFy/vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727162611; c=relaxed/simple;
	bh=t/ho/prQVUaqXI6erllpYGqT4tEzhk8DlqOCVov1Pjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X7t6Hhrrot0hZYxbuA0rVX0NCSY+HpBIh0kOAZWZQzLPrKpUR6s3np0PNcMQpSmpNr/LdaRp+MictXRGtu2c8gxPzc0tCfVHuYUXPzAJnh66RcY1blk1btumjGGDOFxlXAEkQHNAN+x+b082xZH5saCQZ+XvMIgxNkkKgfDWiGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KTNjdDLP; arc=fail smtp.client-ip=40.107.21.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvWmH2M41ki24CK/4JDTPirIj/MzqZKZXjQt0v5lZ0T4EPKgN6iXK3XoZGxG3/Z5EJ9Mtqa8wN9oWWxHL9W/YTSpthTQg2DWr0agC2VXzjk8etOm4IUNh3Ld1speTlSa/z7bFVh97OJalhvPz7Zoe0B+9GmBJQKLEbuWOsY60fQ/5mT/ERe4wx0W8isjOfJxNM0KBICeoUli6yQQQLYhhlgHYTDWlBnN355LnteWN0b4qINpfl3o56m5G945kRFJVZj3AdLmeaBbVjezPvdhtzfluzQUwDuGYxYNzejJ3T/qu5ZsZRSSOJdWSdzHGXtRk5m39NWGGiSk9oere6R4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYtfrIlucZxTwR680IeS9lomgExbOnspiWg4tXWJxRg=;
 b=fYUzANvuTbnN7s8s7DjwiOKZmVgGv7dfWd58YEU2bqNIX+O6dbOotpRA7OkxSbNlpqpIYhp5LvNVy70TOSaLhbqQZNr9CX9VZJEs/YmUuodAhsnom/Bl/wyoCH/51kxdLTvwaA3ws5EWye8BQb4AGUGW6+S6ytX/BwIJU/y+H/9D0XmMYy6Bt3VzbcexI/kBJrHnvyYtc7Jywn6r4JRQ6MhQDzaOqK4VW8giufJHuoN8fV99bJKcNR7bKIdrQVn9a3XpwK57devj+aOXwDthk3f9rLF3KGFg5SWu6YnJoe7cS0HiMcOREa86NrxsaleGsS+ncsggOQvA+mqbeRyayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYtfrIlucZxTwR680IeS9lomgExbOnspiWg4tXWJxRg=;
 b=KTNjdDLPTeatE22LWUvOMb5peRtQ21t2O8mysE7I9QhdhcqD7rwNLws8jtnXl4CpX/36W4WRHfKBLt8AD+/A0fNBOjUi45A1RB3bzDyPRDPqN54cMlo2yLNGjiuMnGGZnqxQnldLH2gjwaNQwVvl6dssoXYJYtKRCLh32Rf7jTU4xDW9dklcu4X/D3eECYQXGQkXoJ7s/m7CQq0kpCXZp+sp0FOqrfcofWAnNBGWKc2eLOqd72yvzbpt8M4ok9Wy179U4Dbo9u9MsvMWeCaUvcthFcjcvWWVTWdvlFn6X95dnZvfJY6ByzmTJwsi7N0ts6yezGmhdGCcGnpiGh9xDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 07:23:20 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 07:23:20 +0000
Date: Tue, 24 Sep 2024 10:23:15 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Christian Hemp <c.hemp@phytec.de>, Stefan Riedmueller <s.riedmueller@phytec.de>, 
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: fix m2m device v4l2-compliance
 test errors
Message-ID: <pgz7woiqzp2ph56hdugrvfelqjtmgwn544vrufdxexiifdny72@iwxmakvwlv52>
References: <20240923120048.3200166-1-laurentiu.palcu@oss.nxp.com>
 <20240923220047.GH8227@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923220047.GH8227@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM0PR01CA0146.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::15) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI1PR04MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f86ee97-49c9-4a71-e471-08dcdc69c44b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?OPdQMsfTIjBv2snc7OTYKynHtD6c0wqImcuJwOniEXD0ODiV/ZuMCcZim7Jq?=
 =?us-ascii?Q?GgjWjhZcZtg8K4WIjsvhSQIu/Bqddi7hXFpbcShvY89tCdlR++s3bweoR3Xs?=
 =?us-ascii?Q?TFZrTpPgV2hkx6KLE/86lTO08Z6MG7XSbzTFvz8yEpR+Qhen5D3+NedWS9MK?=
 =?us-ascii?Q?UQEoKgFQLmCRPsOKS1JR2lYk8uPkG+YIcN4wsNCj/slfr5M2RY33pbUE/Rpk?=
 =?us-ascii?Q?P2uzu64ONkB+xZ4fcattl0kMRDa9WjeQ8jqEZ1i9T7626d6Gc3LNkVzoJhMJ?=
 =?us-ascii?Q?cbPyLU2lwrVP/gtQsRlaVgJNEcM3f/tK4Ad71Z54NxW23zNrLFbccwV0wEg8?=
 =?us-ascii?Q?SfcEWU6d82Yr9FAHujMildfWp18rDE21/p8rbcFxKP7MynVggcig2JUGzJS8?=
 =?us-ascii?Q?Obhr1AcLM3E18qZsqOhYK4HGmmske8ShLT8RjW9YLddWV+DB8xUP9Ps38QnK?=
 =?us-ascii?Q?1kFgE2cO8t5JXnbce+J96/c8hoidgRrVdqCdKnOOKgpu1u200KlbQeCTZhaO?=
 =?us-ascii?Q?Ud5bkAJg0YHCDWz0CnGYXldg0hqEPci2ew6frH2iBWv8BUxcjwYxbW2rPNfT?=
 =?us-ascii?Q?1HzI5DfdSShDd756HJ9xkU97NjaZ9RBDhbl27Ykt620gcrCcI+mVsDSz7p9d?=
 =?us-ascii?Q?QE9T6dlPkIfn1NLIVKgBJyNeHWSPgwiZIdobBRhwaOWC4sQiVvdhLafU7gE0?=
 =?us-ascii?Q?sB4i87ymkFVUfS1jRoukBlb0suRWiwPP2jHGv0m0FTYjYddEkZcuy9zFKeRw?=
 =?us-ascii?Q?6SS2absdnLN4brGwbgfbTNQy5aqNvdyqK4Us1KGEOfFJqewGK1F5EHYUVjm1?=
 =?us-ascii?Q?tgULKVNLkCE0G37zkXRo+RqqVTYmYN0oNc/+1HTUTyAJoAc/R8sxzuugduS4?=
 =?us-ascii?Q?1PqptwPMrzeDKqCVcHX5tRypQ5oI51jP2A4NZzKiNf8RnJTxgwmE7ZrWC6J0?=
 =?us-ascii?Q?oW2l+B3nk26yRFDoi0fkCljQqLwVUcG9ZpFuJ8lTZk6m4QZc16Mh8YanGJKU?=
 =?us-ascii?Q?N0jqYAhZR1OObjNqV8a5g6dXIFLtmx3eRhvfuFE6ImYcgrKy6rUu7/tJjBfY?=
 =?us-ascii?Q?uV8n590Jp/xYCH0lVvugs9TUph7V60cy0uIhTmnMCLBImbVgcrapGw4Lk4A3?=
 =?us-ascii?Q?+C+IRyCJIYUG7LxuGSg6J7d2s7tcHW/E8/dvBIOX03dOY0shdVfCFKEnzQzd?=
 =?us-ascii?Q?7s4GvoRRT9LUtFB8s3Eou7QthEqc8sVvlsz4OZpj5AA3yCVdkfuyDbJk7BtG?=
 =?us-ascii?Q?mrsmfKJ9gpRp17Uc9Ha1eTBRFGRK5Wo9Aw+R9YcsnQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5qP+6Ye6FZvrgpDnLeajmEtjR0iSupZGQe/KopJlPu7ekkxiU+3cklUbmNM/?=
 =?us-ascii?Q?PUu4HyCLWTz5Jg+OcfJVHK6Ctq7gYjhxwZ3D66tM5RqzoidcH8Pc6JRWGHpk?=
 =?us-ascii?Q?5zTQI6p9nEs4rHj7fDyj0Je9PhaEJ29YZdE9LPkvaThI2kJCxOGPwaddFX7+?=
 =?us-ascii?Q?jTdTkoWjTb55M8o7NhEQXcXhynemTMLv0z7kni3Mt8mMOWarhRAL1dWYwbm7?=
 =?us-ascii?Q?EyrAj8xZb+3inHAWH8DByBeXSuVGTsMGhEF3L4qh+Sq4AfmSRmjP3KzSYx/2?=
 =?us-ascii?Q?PJPy2MDy/2jSd/AVYlfIEuLHtvTlw7t9JWWhGUvVKuPQ5a6kx4r9GSAc3e50?=
 =?us-ascii?Q?zGiePsF9OF2tjecVIHbbcwpWB5MebrpGr25bumYZaYmEVtSk2vrOM/X220kG?=
 =?us-ascii?Q?nQRsYGLqM9EMb4eEFp11oBUffFLgErZ2uECln8daNHfCMxIG10fRXM7YURSN?=
 =?us-ascii?Q?5qNsHCrhpbUjxEGJjFWPsuurqsloYbyypqE9+j+IXFtO78v6YuLRmdRluUlv?=
 =?us-ascii?Q?T6RJVKYjb0XR1RIjewzLXNsYGZzyUGS9qPFqBTvrPdN/hUVS5t6NoC1uowVL?=
 =?us-ascii?Q?Ykr1DxCAXP0QDkQEZBfxBepNF3dUUo9uF868JvzJE48XWtA883phDKmg4g8W?=
 =?us-ascii?Q?mlNTaxM4Yd6Pm9u1wIYnkBJvwjfo6Yluu1PxCtNilvSDmSX001M2OQdf0Oa6?=
 =?us-ascii?Q?5pMAizBzV+ztUCKCXrUrS5e28dFXHFet4PXvjfZ0GUz0YBuiaCcc9mK03nZw?=
 =?us-ascii?Q?S8ExMK/dlZAfKMJG7B/hKm+89RPTv3ak7FlntwqZ+GbnwFpM+4NliZUYVOwe?=
 =?us-ascii?Q?GYpuvRNgB5CpMCQ5o9zyuhReoNw+C/3d0FkLpFoHjxSTypvY5TNu8M+vGJdu?=
 =?us-ascii?Q?AImKl7mLoF/8uxQvDK7MeGPZ2W2ib23UYczVjMhg53tQfdkdUmiBA8JyzgQA?=
 =?us-ascii?Q?5bv/q/eEW1qK2L/zrkt77ZZcnDYJC31NrQbpA/twbB3B9vY146F1v7uS2vjc?=
 =?us-ascii?Q?SVXYUUFVQ1CAxlnfvc05qvYL6EXg5E6867eFGqE5Ko9r6BWQ3l3A3JA/eJuZ?=
 =?us-ascii?Q?S+5+N+Q6tYvazfgKXu+5CwEYbW8EfU088FVXI4CvUpzfH3wrlJC6L85KENOC?=
 =?us-ascii?Q?r3JD5e+QdXzy0+5DlKR/K9YPiGZgI86E7/BHwCp5zBxvzdBiqb5003JCKAFb?=
 =?us-ascii?Q?J5frj4HNtwDR24E1JtmgR6KcXAUyMjSW5Kdwluo822sn1CCanKn/O6YMpvt9?=
 =?us-ascii?Q?6K8C9f6FtgiNpyXuT3oLo4hs/EUFjzMtvGA4Oqs0NvPyrHG3/ngvQePty3nP?=
 =?us-ascii?Q?UY3J+FgsvcV0ge0/vJhYDccigtR0MduJAj3sJO7X/2i0LzJMm9cwHzgPNhO2?=
 =?us-ascii?Q?Tj90mjdKMsnnkO8tt/6GevFfyij6D2e15AtL1KJiqNMnNBy51Vb+ehZXqnrt?=
 =?us-ascii?Q?25GYCS3LEPJouQUKRdjb9RSkybdCSZN1E2aho7xSwlCqxYXoYfeMitjkelOK?=
 =?us-ascii?Q?AtZhKJnlQt3NQpPT7VIoaekIJdHQDDA9kT716hZDHXUsUxC7xZSOCrjcjFYf?=
 =?us-ascii?Q?wKpke/31GQOAr/4cXNr8iwY1tQqTEg0eRweuKGvxURhukHd3DNhxLRYwOaNH?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f86ee97-49c9-4a71-e471-08dcdc69c44b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 07:23:20.5144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6mndv+a31X/xxQR/dPwNhhx6toBsRDXrAXPyoUVV+ZXed91EsSNEc/Z1/MQyLuywXkRUbUaLvY+ZJNs0p9jwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

Hi Laurent,

On Tue, Sep 24, 2024 at 01:00:47AM +0300, Laurent Pinchart wrote:
> Hi Laurentiu,
> 
> Thank you for the patch.
> 
> On Mon, Sep 23, 2024 at 03:00:48PM +0300, Laurentiu Palcu wrote:
> > Running the v4l2-compliance (1.27.0-5208, SHA: af114250d48d) on the m2m
> > device fails on the MMAP streaming tests, with the following messages:
> > 
> > fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
> > fail: v4l2-test-buffers.cpp(1508): buf.qbuf(node)
> > 
> > Apparently, the driver does not properly set the field member of
> > vb2_v4l2_buffer struct, returning the default V4L2_FIELD_ANY value which
> > is against the guidelines.
> 
> Strange, I would have sworn v4l2-compliance passed successfully when I
> submitted the driver. Maybe it has been updated in the meantime.
> 
> > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > index b71195a3ba256..3f0c9e2ac802d 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > @@ -222,6 +222,11 @@ static int mxc_isi_m2m_vb2_buffer_prepare(struct vb2_buffer *vb2)
> >  	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(vq);
> >  	const struct mxc_isi_m2m_ctx_queue_data *qdata =
> >  		mxc_isi_m2m_ctx_qdata(ctx, vq->type);
> > +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2);
> > +
> > +	v4l2_buf->field = vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
> > +			  ctx->queues.out.format.field :
> > +			  ctx->queues.cap.format.field;
> 
> Wouldn't it be better to handle this in mxc_isi_video_buffer_prepare() ?
> I think the same issue exists for live capture, not just for M2M
> operation.

Yes, you're right. I guess I missed the fact that the queue's pixel
format is passed to the mxc_isi_video_buffer_prepare() which makes it
easier to set the field there. I'll send a v2 shortly.

Thanks,
Laurentiu

> 
> >  
> >  	return mxc_isi_video_buffer_prepare(ctx->m2m->isi, vb2, qdata->info,
> >  					    &qdata->format);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

