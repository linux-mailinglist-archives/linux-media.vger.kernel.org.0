Return-Path: <linux-media+bounces-28887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B66A73F4A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAA14189B683
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CACC1D0E2B;
	Thu, 27 Mar 2025 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RjF3Y/7t"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2077.outbound.protection.outlook.com [40.107.247.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5401C84B7;
	Thu, 27 Mar 2025 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743107253; cv=fail; b=gAi2vUathegVRxUr9fc2wStkPjY13zjcVR4U4Lq/D6SvT/VLip5yXlQAa01UCPYdiam+LLai8b5MC9bL5AU9eG+88a8k3oKoQ1RwZdOqTR9q8A/FTeLv/D8OBL9RaqTzgPYgff3Jcprx+6nlNkyAzvMxmDmy/fiYwoccP9+xm6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743107253; c=relaxed/simple;
	bh=hHodjMDuJ6IEdT8+y/UxnU4dxKGbC52Hsex8MrwFa6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=en1P8GrRlZNSjoAxyYV6rvuq6zaMy3po85ypJIKRZmmwyFllP62nEO6Z8LyFlbAVnhDHynAmtlCJl5Xg0rB0qZ6+QNRuG9eCUWyZTtvV/4vSgTBbFEIQvbr+oZDRdCskYdg7uiOsDp39vMRLaeVXQleRlYPnUZ4QUKJIM3+gGK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RjF3Y/7t; arc=fail smtp.client-ip=40.107.247.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTgtFqUwB3+raVLJEQXSgd/OjHchrwCcthhXAhnfgmHfy9aQCrUpBcvMQgczSy0rAlSB8enVx5+5NU/pI26urv7vtlJrEV2zBofrQmjHAD3vYI7k1IB7jLTEalYQ7JZe3vbRq4cA7qqjmEyd1B97It2iOkmYvqSEfZcC4Jzt9Ha/4qzr13woxyZ6N9Fqtz4qEj4gH2OLLQ0qaia4AOq9TY04Gr8Bzw6fsI41XoFjI73lDc2sisdGj/TVBbLjBGM2YqtTL1UMqGQU58uXQXW3pP7kXWYazb1Ao2nwOl/fOScRDnxp+mogK/DN8z9CeBPW0mkFqdVHxES5kzMlTm9rNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3C6o/ZRIAelj13b/m5b+voYBX7+x+R9ZNeX7UK/FfKY=;
 b=xsUJt1lketq3AbCqVF9VwXJkHsij4FdSyRvQEAphSaRy9rTC/f6TJqQ5ZJX/FkGKEkROk6t81Kf9IXR0WcRShvAwzcAeEeKaF1+rhk5/a7Pi6cuuDyDT7bMW+sagqgFEzjgymwaEaBgYaGK7vSTxq32OW7KPyWnySa8ljLiBsTBLEoJeYJ1XJxmNDmu5rHPQcYR3u/zgmRasR1s0f4RTviM7rM6vvZMYvQSNsXKdZLX/hGC4HH3k8YnxDjJu/7h3fnNC/8P79MjanuKJ6qgM639vis9vPea/9DCi7+imuVE1Mdx3/uImTQwOIu+O+Xo3kXUsYw0SpWSV2DcYhaQgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3C6o/ZRIAelj13b/m5b+voYBX7+x+R9ZNeX7UK/FfKY=;
 b=RjF3Y/7tgu1nZqAO0+yY4vXIQWiu6+bS7AA5SC6L/El1ycEhEPOaNb4PuEhJsY6bAM7cB4VQ99W8Ww8wHu5QsYp4tlhc9wYtEogI2oSXXDGfY7jyeOyYXxdbm1hNHicVcYG/MKvmFo1ykAhcUEJtmMl4tf7xtsBRZ9n3geIsRuUAW/wYGAOPBiJ0A0pFVULXBHXDNozfnVqynbQE0pkjDQDQYnBkHxaacAdeq6Mwh2FN2GjdJWZkDRqwCFhpmNMLYzKWY/GJ8xt3J/ERost/TiTCSfIOMOuUK1jy5pVEK0aujrB0mhWdCdhYaXt/XEeGd9edluFNzqucWdfL/DjWig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10452.eurprd04.prod.outlook.com (2603:10a6:150:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 20:27:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 20:27:27 +0000
Date: Thu, 27 Mar 2025 16:27:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Message-ID: <Z+W0psOVpyXMa8pD@lizhi-Precision-Tower-5810>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-11-324f5105accc@nxp.com>
 <20250327190037.GB22659@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327190037.GB22659@pendragon.ideasonboard.com>
X-ClientProxiedBy: PH8PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10452:EE_
X-MS-Office365-Filtering-Correlation-Id: 659cd664-51b0-4a64-c1b6-08dd6d6dcab5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?gYoIOL4uygL3G47C0ETzBSXtHTMyYZELEB/mfgtzckE/eI+8yKvrOjQWLQPd?=
 =?us-ascii?Q?wcBA1re0TMZO61VDCKu2/qLbKn4k40A71ECx4mKuja3CeqoIKs0YsCGk4iNn?=
 =?us-ascii?Q?b+M8lTPng9534UzpOKr3GpYjhgMxUkobwTqhTlYgF1RsILa+XoEMddqZoZzl?=
 =?us-ascii?Q?5lRWQXrySKe3j5RZOMi62MPerHQKxWCkYdW65ye33eKM6as0sUaVraaphqHd?=
 =?us-ascii?Q?SL//rlcxSdStGQMeaZH5XllongdExDJBT4pFvJbWSOdVNjglllt0nbU0za9U?=
 =?us-ascii?Q?pumhHVt/zKQxTtuptdwmVMQp/0X9PI0SKsMG2qxOlieU6TMHOyl+0iL9UBZo?=
 =?us-ascii?Q?NK5xSrQ4PxOAAc/Xmms67xXFFyJyrr/mM5/zaqRvji2j2jrYPdsuYRlWdqN1?=
 =?us-ascii?Q?r8PWYgfVdYP4afiOClyBYhEzyJOj3EFVw46n87N+CmtvqbFAUSkmiShfRGb9?=
 =?us-ascii?Q?0QJh7pOOgZjCibtJKhwG6iTqx5X9ftCrP9UVI1ovOQ7+KopCr5LTAjRm2fff?=
 =?us-ascii?Q?zaHkNstBfP1Yto95qNF59JJsDiqApGWB9IXyOMqEWIxn2rDnNOmMP6p2DzWF?=
 =?us-ascii?Q?p15mPhcyXXJXizFgFYNtNihfwultggedeMGdOSzXE5k3X52mGVe/itwTAtp4?=
 =?us-ascii?Q?iHv0Ka8uCdotZhF0RJmv2ZQCEZLiFKZhPHeKte8XrtyGQIAYgrmP/JdcD1Ik?=
 =?us-ascii?Q?YT/Wj7XhaoxSnk9C84t7LR+H0LQW35oXzornkuGn6bR8PIsZwOKegj2/LuOo?=
 =?us-ascii?Q?22XlNAZ+i8ZNr3YT0IsEmd1AVaiRxHm9uoCxz9AnUdYf29zDcq4+ngvV1dGz?=
 =?us-ascii?Q?U2rmRtbLo8Dmsp/0K/BaLXJeyQHA4haqeJFyornbL6yFZgKt8b+sSwDabb3z?=
 =?us-ascii?Q?kqJqm1mxxQZMKmRoCv7vrSjYtXktbb+ymy9WUWTmnogyKmnWCoSGMT/NpIcC?=
 =?us-ascii?Q?nKW6/bOfyr839e7uZoVR84Hoy1jTZUVq3g4yBDyEb/h/i277pAY0HsOEeXpK?=
 =?us-ascii?Q?Ptcu6zkH6nd5GXl6lWv1BH0vaPS80t2B2P4f+Or+krTn4pGtWKgkpgT8voPH?=
 =?us-ascii?Q?vTM8VCXWwMKeAJSevEDX0hNfG4d6CcehjI8AFu2f4dlBA4nUtQuK18aMxMv9?=
 =?us-ascii?Q?uGb6YV33DDbOXVe2g5H1TPo0gV/rPUcZypgxqSteYEi5lvY9C73ZIzZA0ecV?=
 =?us-ascii?Q?zas69CYKM3aCYpwNCKzcpkcx40FgIYqvtULXj75FXYdyQqWaDzWtJNL2+pfH?=
 =?us-ascii?Q?3jZZD2+gXxxJA+BVKHhSUZD4ugxiAuONTqQdvmbiwWVfr7mVEbhFGHRy55df?=
 =?us-ascii?Q?N34cFLdXKr6OX0FnDr0VFjvIYSOhQHg3v9IWJFsufSrfLZWqpOskBqcU+ywY?=
 =?us-ascii?Q?wbVvQqeBRFksyoJN46z+tQz5PCLOHABuKWBCxTkgHCU63eaoAyE714AMewXP?=
 =?us-ascii?Q?vaFE6egNKHhGZa5+pd8Nrt7t7flRRE9S?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?sq07NS7KN36sS99UharBKs0WJxOh6g6iXe5rsRpGG9142PavZo3kULmzahLY?=
 =?us-ascii?Q?wPXO/dpa9F5sr9+rC7oJJPrYYb6M0ET2dq7i9BIrWhpmhkDbG1DgJ6rPator?=
 =?us-ascii?Q?6vpayb4dk5Q3BWf1DRO1ouRYb+WrnVkkre3w8Nryq9WR2WXWA6wwKPi5D8Ql?=
 =?us-ascii?Q?sk6CZtYJBqMLeZw3wpqfigi+c3kKhWkj5MUrY3dor/2K19Bnzwy7GiMIXTMQ?=
 =?us-ascii?Q?bftvLjCJjBiZSrZupKNVBxzd5cDhGV8EGTJGfqKXZuizDHzgkNAbd7UnodcL?=
 =?us-ascii?Q?mjNXZh52R/4T5nNtS95IlLugQndlHiHhI3HCmgdZN3fkxaXLR+6LtUD6N+Qa?=
 =?us-ascii?Q?7DlV1AfoKLMH3rtdUPREJ1x3LplBiYQJKKwbsE7XwX4nubKZRUb+sqI6V9lY?=
 =?us-ascii?Q?gGIXoiP0thxt3OacFPbyUjHMQfjPMFLfdk+8la4LONprDunr85aaVHzfsPVR?=
 =?us-ascii?Q?B6TELt4a9EnkYMxaENK8Vm4iPxj598FJF8s6DO+OkWzjE8dTECd4iYij2w1W?=
 =?us-ascii?Q?rDVRqvuxt93uOaGX5VrFIwuAj+X9n5DDGoKyUG4LD7yrxI6WVaZZyDoVsz9N?=
 =?us-ascii?Q?oMx0t9CYkn+VbKQYVb4HBSAnt1s8NoHlwXuVvID+94HB43jtPduAbNlCOHOd?=
 =?us-ascii?Q?lub61Oa2MI95/fCZMBlSu2o7AmGMfQlPy3qvX27lCbDBtuCu+xBYXxiYfYql?=
 =?us-ascii?Q?cPti0dGTwWyjitv9tCF6CvrNAkVgiq/1emH6BuNavurqibIcoue92qHrP5gy?=
 =?us-ascii?Q?VSP+v/iD4EGLQZpu0vP0MGRoltOirqJegAvpzIRj7vg2dNq4dK51Wws43SCJ?=
 =?us-ascii?Q?zPwCTHwh3psJShPEHOZzFTHU9sVe2B4DmLkxgwbb6Rry5du2dJlv7QTTM/gi?=
 =?us-ascii?Q?RcLJsb+4ZmojYjIZy5RwGhp3z2riaDIL0pHRA1iwhmriTzHryWrrSK1skQYd?=
 =?us-ascii?Q?CaKxp9UniorJUke2ZdEDIry50ZeIjKUjAsb/DALjQHSLiQo8djvlGv4SWBZG?=
 =?us-ascii?Q?UwTRQvDCBM34pO7vWiZVbRQvfiKAucfss2pEKcQZ/QmyYWFU4Mhe+SZfxf39?=
 =?us-ascii?Q?4It1+7zLZ2GVUGCJ3QK4RH2mSaMlYeHHQ12xBv+k5HpW1HjiJCiTfx6LZH9v?=
 =?us-ascii?Q?/Y9Ke0FFOwtINsVmXySKF7Qzgy0u3AICdL1YDvL7VdZqSJoBB9OhQGbh9Cv7?=
 =?us-ascii?Q?tqhpwrrVFjfzjlenMUxt5W2KLLHkX7js2gkdn5sxpcaVO+jEw41S25Fau+LH?=
 =?us-ascii?Q?6SDTpZ8i1glcMCRmE3j5OgpKuuodVJnQosfOM47AyfMTRxscbyYFh3HnkJns?=
 =?us-ascii?Q?Epvq6cYblIOdHwYUpvCaGQ7vagkOSyNofhxJS1D6PFyjTx4XgubN8oDrRAuL?=
 =?us-ascii?Q?jjvx/ANjQVerL4Zcd0ZuH2g6QvNq/Dd95KpJnmwToLA1OHWUFLSdtN7Dt2qc?=
 =?us-ascii?Q?tXTfGV6sD+qVvylaKzLUZlnbyCXRfjtnj5PPaK/qKROxAhdV35X9+l6hiQ1I?=
 =?us-ascii?Q?71yV1BE2U/LApaZNaGNvGzBgs/D9xcdmKSMvcWxeyEDrHq69mcUzLClwzjAw?=
 =?us-ascii?Q?MGS9Dp9tLwRSdr5VinMLqo8XIGBgAONDIWS8a7Vr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659cd664-51b0-4a64-c1b6-08dd6d6dcab5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 20:27:27.7978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iv0dOv6hJfsYp4/BGMhJ05ollnvdbAcO63ma3KEXlQGfkx4mXNs6w3hV2OfAzgODxnjIawjDuGXkyGAx67Rtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10452

On Thu, Mar 27, 2025 at 09:00:37PM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Mon, Feb 10, 2025 at 03:59:30PM -0500, Frank Li wrote:
> > Add linux,cma node because some devices, such as camera, need big continue
> > physical memory.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v1 to v3
> > - none
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 9 +++++++++
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 8 ++++++++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > index 50fd3370f7dce..61ef00f4259e1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > @@ -113,6 +113,15 @@ dsp_vdev0buffer: memory@94300000 {
> >  			reg = <0 0x94300000 0 0x100000>;
> >  			no-map;
> >  		};
> > +
> > +		/* global autoconfigured region for contiguous allocations */
> > +		linux,cma {
> > +			compatible = "shared-dma-pool";
> > +			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
> > +			size = <0 0x3c000000>;
> > +			linux,cma-default;
> > +			reusable;
> > +		};
>
> This is system memory. Why is it reserved here, hardcoding a specific
> use case in a board DT, instead of specifying an overall CMA size in the
> kernel configuration or through the kernel command line ?

Other imx boards dts also have linux,cma, which provide a default CMA size.
Generally we use one linux kernel image for difference boards. DTS should
provide default cma value for specific board.

kernel command line is more like debug methods. we don't want to depend on
uboot too much.

Frank

>
> >  	};
> >
> >  	lvds_backlight0: backlight-lvds0 {
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > index be79c793213a5..89c6516c5ba90 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> > @@ -56,6 +56,14 @@ dsp_vdev0buffer: memory@94300000 {
> >  			reg = <0 0x94300000 0 0x100000>;
> >  			no-map;
> >  		};
> > +
> > +		linux,cma {
> > +			compatible = "shared-dma-pool";
> > +			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
> > +			size = <0 0x3c000000>;
> > +			linux,cma-default;
> > +			reusable;
> > +		};
> >  	};
> >
> >  	reg_usdhc2_vmmc: usdhc2-vmmc {
>
> --
> Regards,
>
> Laurent Pinchart

