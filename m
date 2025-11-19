Return-Path: <linux-media+bounces-47391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE6C701EA
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 17:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A4C18351DAD
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 16:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96807341060;
	Wed, 19 Nov 2025 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="awvAB21m"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AEA2EBB86;
	Wed, 19 Nov 2025 16:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569048; cv=fail; b=FaGZ/GwysuFR2sT8/n/I2mjdXzGae9QZfz/n0KWgfnnsFUoMR3k2CY188eW0IuYSNKs29zA+R4mQekuCf+ZyWfe3+CCmaWN4xaELQWGSb3GP2RGY1PYPKPeW/GrbEbpQFn1Cwa6txnae7jnVV5ft1dFkAt1PHCNQS0J28CG3egY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569048; c=relaxed/simple;
	bh=LfHsxCePiijfr9gtR1Bw4Wn+j0Sjy4kI0BX/vDPeqCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SHRhjj01sYe3PSMtzotxl9kCERNre71oXLZzXkEGrnxv+ajWvXJ/+TWxh95O2IvYQqf122V3dYERFurbmCIcgJuKPrKi/8XtTJCUDI29GhF153fzxPM003jlUgixDd5Vq3yTcK8nU3+4AEs+liEWEdujs5M0/JHuYl4RO2UCA3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=awvAB21m; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+8LFCvyZy1QlpcJRGqfRgNSTvfgr5Vm5VQWf019J6ohzl+hz9ON+UgSpgHeHj5SpHuhIzJcrtBMl4OiVwCQ9WfqL7QAQrNIm9t+SsnQtUv/qDHEy/lxHhbnUjVpecWGHo4toNIOpBt6Uq/t0ZTDZmnqDco3wfNHllyhmKMWKB1/D72osmwjd9vC0H6Cc46QPwaQJLsJVe7F57199/xeaIBgRRs+tmFYfcJtJTi32RFmwdpw5sHglPEysbQtkH8mb+b/hac2m95WbXlOScZq9BIMOXFofcNmiCxOrjMPv83gQ5srxioUKLB9QEq5sxuQLexZeYaTfhNiNnhuLzkavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qI3pk46qsrL8yI5w0a1jufnKZHyXrTwd3oGXllU9cM=;
 b=JOnWEYnF/3IkN/gpgD4AFBSfKOIdrXsUyUxFkZsigtFrOTKmaZGl5WonjGRlHAFuUR4qxiO8hakeBzM9RgJyGAUpRk/wSEI3gZ+mA4aqkabmCG9MnOTXXoMmel9bf5HnzjyNzmBUiJDDCow8fI9M9EJjHtclmy/3xGRnVnadHXNIgdHvmZ2NorwWOaP92R42F88aasApzhI0VDAxuKmNzqQ57m1h1Lfwq1t7puOJzobfe2NPDJUwCf9YfnCK79tyvdbLlfuS7sCXyyNfX0iZSvPyCk+L9aY9p28Y04fQxsIZ5ypfhTW6A/P1lwjRxtxa7mHGzjytU6QKVmSYmOAyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qI3pk46qsrL8yI5w0a1jufnKZHyXrTwd3oGXllU9cM=;
 b=awvAB21mBnCSXsF6BakGBpPqZlnpdCnWbdpYC7YsRYXhZQ3e9XXX80Z4qJgoIH3DbD8Gw+cfmQqj/NnBx4yKuSExEkPIgUKnDOE0+XxLrVnVrtmBJqY4E7cKmVr0H0HeRMqRYHsAMkYVwQFnCa7DKeAkWAZ6TwlA7RETL3Y062veAod18XkTDT0bMjUwyi2qAj4cl9w+tjAm86V19B7f3FMG3rmEk5Y0/6/z4klLCILb9bJaU2fBQ9s56Yzlogym/x19Ig6Vllgv+5JLAAAxTSJWdbQjiIyH2v+SmCcWs0DFrQSwYlB0oUnY6Xa6CW0mcWv+RFRA7Kv7kAES5PtjnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB7694.eurprd04.prod.outlook.com (2603:10a6:102:e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:17:23 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 16:17:23 +0000
Date: Wed, 19 Nov 2025 11:17:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: nxp: use devm_mutex_init() simple code
Message-ID: <aR3tjIv5Xx9VsXhS@lizhi-Precision-Tower-5810>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
 <20251117-cam_cleanup-v1-1-6cd42872db79@nxp.com>
 <20251119042247.GL10711@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119042247.GL10711@pendragon.ideasonboard.com>
X-ClientProxiedBy: PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e51c852-4bc3-45d9-4322-08de27871f74
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?A4D5VKmt+ahQ8ffGk3ecMwdfJX+mK0lNT6KM4JX0yLEDRrFezaURCAGOf1pW?=
 =?us-ascii?Q?2MM/e33gmlZY/eRpfXr19hdbjfxGzpOrP8ib3MoTFh/V6tUx9ty/iBHSh8u4?=
 =?us-ascii?Q?+uboehGhci7B4fc8GLIIj5rq4CYZv/JrLX4kML9Vf7ZmrdoDJh7hVNH7MR5T?=
 =?us-ascii?Q?QJ5GAQ3IbVInvS+OuRfCkTBZlGRb9MtqOhV5OEeZU8j+dcqXeKH41iv1p4DF?=
 =?us-ascii?Q?l5GXwBKg2horTi/mOo68PZ0J0JxNo/OVgcaeN4YATldfCkD3BqLjlTynPvHA?=
 =?us-ascii?Q?UeakHj3dEr9UxQMkrtx4Xm3EwlnfDwF8ltlRqJ9nctlKZzBzWQiOPdiv8vo7?=
 =?us-ascii?Q?UoBh2SFaofmmbdTTojEFPP7kIfbDLw69hmmToiyrRLhpNqVvJzV8ZKz3lPgB?=
 =?us-ascii?Q?FFyVfU/iBC8Ptovt0L+WJrFgn1JWGUr5+LFMQLsXbUANxVJs+ww0JJ0HZ24B?=
 =?us-ascii?Q?PWBkVOIGSZNJl5WhEFY1BV7YZzdaknk+GqHBcuAlSJmo/2tWt2Pf8Bpzel2E?=
 =?us-ascii?Q?bjb15MNcq4Fr8tiZ76pYIBkSG60wb7rCN5vA/BXUo8YRgwi1nuIIlLifNAa1?=
 =?us-ascii?Q?GLorQigM4biUhSrL5JKSu6ZZT2z2XHMCurF5mFivjCJbDV+FTh+J4qgaQbHS?=
 =?us-ascii?Q?kwGsrUwiIlicJ9ZohRSjMQqdysaNXoO7wotXhnNk9MNgZExshHFDC2Gzor88?=
 =?us-ascii?Q?4ZL6nbzhJffbzzsoKWzRtC/vwgNDJnzZbtQiJTJ4gXoGtIXI3/dZFV5hs/uJ?=
 =?us-ascii?Q?5Y6jNzVUpa3S8fK9fpwnniJnGJJmUWJpOEEPxzBNDhlF80iE44ABZODIGr7D?=
 =?us-ascii?Q?olAuyg/3ZEvE1GfpuD4pJgZK76wPBoptIzuh3UvKNfR5W4UEcXAdos5UmMLC?=
 =?us-ascii?Q?se8zFZc6sj3u7tsePh3mdtFKXYEksk7wlOAnBFeB+cJQw+XCm3RUg6UwcPoN?=
 =?us-ascii?Q?v7KZeKlSTzmGtEBMAWeClJc7OyDeTtW/x/zka9bPiLSy/XQedAmjMFbQOOlR?=
 =?us-ascii?Q?JPEADVascUjvd4nsrASX0RbM7UdpANFgTcqPBG0pmpvNkBbwTHqDH8RCWS0W?=
 =?us-ascii?Q?DRKEnRvvtiOVoWEgN1isTZBGma5QRiAU/HL5h41oVQjEScdGNirRwJxUG5Pq?=
 =?us-ascii?Q?lbJyoT0+2MHuYfQqElAtw6wMyIdVKqHbCa40Oi6vIDLJT9kH6CWLdenq36mj?=
 =?us-ascii?Q?ozPfGzOA3aNwtzYXH8PrIpgm+iTYN40bQ0KfycM0DjfjRZm0OzHz41zxkY88?=
 =?us-ascii?Q?tgrre27mXmJaAGnxwtU2wOawtlbpLAh9nh2y3NFpGwVUXy/e4t4uH71hkbOY?=
 =?us-ascii?Q?uE9AHODsgOUzo/gciNp5CSNsSDUTGKW0g7kPVm2i53mGQN2tRd/Ue3kIL6qV?=
 =?us-ascii?Q?2yR/a4a0WlG7vyYKf0gkMjvGVXDWEKXdGiBRHKIq5QfcvYIDTjVfhbBquD8h?=
 =?us-ascii?Q?F/GjLHKPC8WtvMYEiPQJE34FILKDJmeazHeZ+wK9eZeNFAAA5Naz/j/7ay2V?=
 =?us-ascii?Q?kfoLLM15HWGjaDnUHK4jSmln7kI2PjbvDgQu?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?AjfLCPbM09WeDOpBVbTt3ZgoRbtwayjLGLWPcQ5EQbYbk8Hc1HAAn+hGGYmj?=
 =?us-ascii?Q?+xpmoobzN2EECWtfQO8rBBEFVy8a8MpmXdEbsq4tYMsoetpnRcGn1r7aXUJw?=
 =?us-ascii?Q?SAf1EWRyKQ/BTYFkyYxRYEWy9NAsinQdT3LEpoUJPiiIkeHtSmcOUEqs26sh?=
 =?us-ascii?Q?eY/Adwyi55v1M6/KZjYSrgjvpAzmp4+qKIKu0tIs/G7Z2U5MkbOhM3Lpmag3?=
 =?us-ascii?Q?lpO6q9QFs6vTWthXzJIuP5ZR6/ipd28kn6MB3n6WV2+NkjogoG4lXnlCxKKx?=
 =?us-ascii?Q?R9fE95BUO+XkK2scnp7a+1gnqxaDp09U2KAClRwIjqzOxhL5Kyim2NgXrRsJ?=
 =?us-ascii?Q?6LFL4Qi07Sj8j+q9O2xZiyx/T+JQQyoZuMpwgUBAHTd/xzP87SlnOnNsNTQb?=
 =?us-ascii?Q?EbZnStEQ3kG6q2qWTnXshWIa7lc1ttAEZEHD1I53YxMX6y+pVetTPvKlJp6e?=
 =?us-ascii?Q?cYActpez+m2+1X621K7Kg/yJYHW3XaDqw059nIxqv97KQhH4aFEYlpLWqjcg?=
 =?us-ascii?Q?V2LGLWi00cpflXKTm86VtPY+SgfnqD4p36NZmWZhZ+6OYZxc55DS9ez1AE6C?=
 =?us-ascii?Q?2qHZsqwaK5c+Hz+LyFDSDK0il6VIbCJt24xiKfZIqpchK4DFZ/+Fgazioj72?=
 =?us-ascii?Q?k9+pew0KatbxTJpyFJJNZ76+kJOjQkrB68pYBtRvvXkAGLt4E0s6/+gTNUMP?=
 =?us-ascii?Q?ZdyuAwnwSmnTYd1e4jRbgT8N4CDH8teLaRYskw965HBNhKXXHrlmyRNDe7r7?=
 =?us-ascii?Q?tN3F/P3uAm3LesBwRImyuer2X0jUCUucdhM2zdrFB67dqu3UOJEeyGpvfO5K?=
 =?us-ascii?Q?h09p23qeUQSc+bRzjizfKbSkfoSURbLNncLaiZ9RHLSGefYS9pSaG1H6tkZs?=
 =?us-ascii?Q?+mYTxwdKO5gpw06nzfdXkv7Ic1++sRy0IiSSZiTAoAkqFwZ69pIvqAifWII+?=
 =?us-ascii?Q?IySZp720eNDPGnVD65arr587FyQ5nas5HD8Y8sPcmL5pMKp0gIqNSIVGosgR?=
 =?us-ascii?Q?KdkYcmPmmNqaavyAXGQdI8L22fX8eYSr46XKqJ645cxTWAlyjTCXANKidZQa?=
 =?us-ascii?Q?32VMg2aZCVoBB7uly8+JvD3yDRgAPXLFmE5J6FR66+0rcNIrL7GcVll9Cx6v?=
 =?us-ascii?Q?4sCchAEETRtThHiYNsdLZ4pqUDs3wGxHQN/tkDPXWtMDwtwVXL0tkHj0TTjZ?=
 =?us-ascii?Q?UUHozSEtxvobYSroAcQn5IK4N1idtG3DDMaHg53NFZ/4njCBksIG3ftsFpEi?=
 =?us-ascii?Q?zPFOoszQ8SGO85jRQvABnvgvIrhMJUv9l/dyUDDQOBpqLx92epQRdLA6acDV?=
 =?us-ascii?Q?bsb5cAFQlKSxWphC4unHO/6R1BqwNqERFIOisxJgSduYptMaiah78DiQhn1R?=
 =?us-ascii?Q?a03CUZZ4SkPD3sKKOtQ3Pb4Jjxa16O4clXRJefI5cwmxdUy2OB3P+0ZWTTVL?=
 =?us-ascii?Q?2nfYCDPGtKzZw4BrLDrF9Klviy22liQgpv7o9xJOf/G/Fuv1t0jCqZMohGrU?=
 =?us-ascii?Q?guYS9CwpnyKYcK1WiP4s4gOCHK7QL/DmaoSCUPCqLh9kT/YHze6QdJVRtX2P?=
 =?us-ascii?Q?DAYk/yhfBrxvxDqXddp7dktWpKBzkbrJ1L8M8iXc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e51c852-4bc3-45d9-4322-08de27871f74
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:17:23.6760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZyOOfJ4vBz4s4c+j+ffpOoHeC1MxOU1ugB8YMF2Ch+XPsYlQgY0Ew6AUaVPW+IbM4hkaS7y8MRS19XfglOmxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7694

On Wed, Nov 19, 2025 at 01:22:47PM +0900, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Mon, Nov 17, 2025 at 01:58:11PM -0500, Frank Li wrote:
> > Use devm_mutex_init() simple code. No functional change.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx-pxp.c          |  5 ++++-
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 11 +++++------
> >  drivers/media/platform/nxp/mx2_emmaprp.c      |  7 +++----
> >  3 files changed, 12 insertions(+), 11 deletions(-)
>
> Given the diffstat, and the fact that devm_mutex_init() performs dynamic
> memory allocation, I'm not convinced by this change. I won't block it
> though, as I don't maintain the above drivers.

The major target is that reduce goto, which cause unneccessary complex.

it is too easy to make mistake miss placed label

Frank

>
> >
> > diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> > index 3f9a67a6bd4d268841f85f9b69af03138300d188..32d39c8013c7eef1f9629f971cc74afecd463ac7 100644
> > --- a/drivers/media/platform/nxp/imx-pxp.c
> > +++ b/drivers/media/platform/nxp/imx-pxp.c
> > @@ -1805,6 +1805,10 @@ static int pxp_probe(struct platform_device *pdev)
> >
> >  	spin_lock_init(&dev->irqlock);
> >
> > +	ret = devm_mutex_init(&pdev->dev, &dev->dev_mutex);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = devm_request_irq(&pdev->dev, irq, pxp_irq_handler, 0,
> >  			       dev_name(&pdev->dev), dev);
> >  	if (ret < 0) {
> > @@ -1831,7 +1835,6 @@ static int pxp_probe(struct platform_device *pdev)
> >  		goto err_clk;
> >
> >  	atomic_set(&dev->num_inst, 0);
> > -	mutex_init(&dev->dev_mutex);
> >
> >  	dev->vfd = pxp_videodev;
> >  	vfd = &dev->vfd;
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 371b4e81328c107269f89da23818ab0abd0179da..0851f4a9ae52d3096f454da643cfdc5017e000b1 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -1033,15 +1033,17 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
> >
> >  	platform_set_drvdata(pdev, &state->sd);
> >
> > -	mutex_init(&state->lock);
> > +	ret = devm_mutex_init(dev, &state->lock);
> > +	if (ret)
> > +		return ret;
> >
> >  	ret = imx8mq_mipi_csi_subdev_init(state);
> >  	if (ret < 0)
> > -		goto mutex;
> > +		return ret;
> >
> >  	ret = imx8mq_mipi_csi_init_icc(pdev);
> >  	if (ret)
> > -		goto mutex;
> > +		return ret;
> >
> >  	/* Enable runtime PM. */
> >  	pm_runtime_enable(dev);
> > @@ -1068,8 +1070,6 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
> >  	v4l2_async_unregister_subdev(&state->sd);
> >  icc:
> >  	imx8mq_mipi_csi_release_icc(pdev);
> > -mutex:
> > -	mutex_destroy(&state->lock);
> >
> >  	return ret;
> >  }
> > @@ -1087,7 +1087,6 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
> >  	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
> >  	media_entity_cleanup(&state->sd.entity);
> >  	v4l2_subdev_cleanup(&state->sd);
> > -	mutex_destroy(&state->lock);
> >  	pm_runtime_set_suspended(&pdev->dev);
> >  	imx8mq_mipi_csi_release_icc(pdev);
> >  }
> > diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
> > index 02d57229b9b3a600303cc0429e102139385071d6..384a2672884e96d17cca542ef51fbef62328b66a 100644
> > --- a/drivers/media/platform/nxp/mx2_emmaprp.c
> > +++ b/drivers/media/platform/nxp/mx2_emmaprp.c
> > @@ -824,7 +824,9 @@ static int emmaprp_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >
> > -	mutex_init(&pcdev->dev_mutex);
> > +	ret = devm_mutex_init(&pdev->dev, &pcdev->dev_mutex);
> > +	if (ret)
> > +		return ret;
> >
> >  	vfd = video_device_alloc();
> >  	if (!vfd) {
> > @@ -878,8 +880,6 @@ static int emmaprp_probe(struct platform_device *pdev)
> >  unreg_dev:
> >  	v4l2_device_unregister(&pcdev->v4l2_dev);
> >
> > -	mutex_destroy(&pcdev->dev_mutex);
> > -
> >  	return ret;
> >  }
> >
> > @@ -892,7 +892,6 @@ static void emmaprp_remove(struct platform_device *pdev)
> >  	video_unregister_device(pcdev->vfd);
> >  	v4l2_m2m_release(pcdev->m2m_dev);
> >  	v4l2_device_unregister(&pcdev->v4l2_dev);
> > -	mutex_destroy(&pcdev->dev_mutex);
> >  }
> >
> >  static struct platform_driver emmaprp_pdrv = {
>
> --
> Regards,
>
> Laurent Pinchart

