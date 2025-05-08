Return-Path: <linux-media+bounces-32031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 559D0AAFA20
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 14:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C02B45008E3
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 12:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BA6227EA1;
	Thu,  8 May 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nv3uG+NR"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB252253EE;
	Thu,  8 May 2025 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707770; cv=fail; b=IOzdZua3d4Ge5cnqjh9xAjIyQilJwl90H/p0kmDNenG8nzz2x301P33hLwwvO6les5nXCnP35VmNUrtoWuPC7NM+D8U4EplpKbB6r1ZmXK0S6I+wr7IpfNQP1iwY1xIt+lbsq2gYpdwBOST1gCIXhiVKzgfSCxhECA/mWO5Qnrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707770; c=relaxed/simple;
	bh=lKW4DSaV3E906BPq3YzYJJdaRmy8KLIx8/fhjxyPI5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N2W/yNyRAivxyZmxVJn6GW7FbUZF44qF+HFtnVdLKxBDpT3laH/ZOatmMSAj+P84608ni++hqkBqToD/JcDyEioVd8SdUbovDqQTpoCT6QuQbMLH/L/F4TM5yj5+76KsglQo0NEwg4I9TVK003i6X4OTjCUFtzVt3nyVUIlgTRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nv3uG+NR; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOf1fs03f259u4VoDcHs7kPMr5NwlZ6E4bxwSyDwk1XzimJEiBUSqq8pla68yKWqRSZwdPSm6eKj0AGDXAvAXrbzVMrBcdLTOXm38t/A5IlOmOVl5yImBz0GXw5GjkXEGvo05efboA8K1KR/TEOGPaVgDyIeIFzAhm4Ctn+oWmCEq/fFomr85EX+wpPKpSDGt7V9qmIHZkf7PRxTG+r5gXQwwFRtkDFZd9zXE3GjhT0YBjNlTeSVjKvqV6l0mlmro975gT1P1tVAdPmxorVZv+acajTQGvFiT0lEgmx98p2BBYMMC0utgSGSB/wN7FBXQa0WWFXXVhnfSmcNOILRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtMcWXJCK0e/ka1KtPUIm70zDz5/jtIthhjM36SQHvg=;
 b=whD2xuJzmUmFPR+cIKq8KTddWyygWjHYHwbEkk0ypDBg95i72Sr62gGqKpGbWqgH5kgYEL6JFh2ABBtlsQoOz09Tl94S08pYDYu5xdzy8mnwEQjG8oaXWE0BYPKRfIgpBIZ7nU2CnSDiLlRS2jgdJb96R+VLZmQUH8Y3V0e+J/+xywv9zm+fib9akpoyFdyJbIBVz+giVcOstSl9Jp9/TpVZcdpIien7NyZVce91uS7EdSxEgmyIRaudVPqMM1cDvqtUAIrQoMJJfCivqzT0+YMLq5MowlXQL7UCMeoXL0Gm5SDVyIaGCtD6K1RQQZUXl6dYWQPyRXc6xa2+zlOoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtMcWXJCK0e/ka1KtPUIm70zDz5/jtIthhjM36SQHvg=;
 b=nv3uG+NRUvGlMJdn8o3LU3NIy8c0fMYwbEC1KBFFhCS1byruA/9BdIhU24nz+9OqmNE8HBGI8d2asYVipvvlGuWneSoCnWIz4Q3gqmQSIkVUyZ1jus9V5esy48aIGennGI1YxEt8Ej38NV4wo6hIhkp+jcGf4kUqim+j+ATw21ijZ4TAELsEFfH/SWm1gNfGXJ+s1zz8Z+PYISW2BWlcayuMAjxu+efD5IyMJqI++36ITXjnltmaR8WMSpDGI8j+diIJARLurwqjzpg/+khKZkRcA4SA4Spf2qFRDLJ9IMP4i2LtJjB3s5LE1jkV9DD7reeWUl5UI4LgIc4LjMUc7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10839.eurprd04.prod.outlook.com (2603:10a6:10:592::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 8 May
 2025 12:36:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8699.033; Thu, 8 May 2025
 12:36:05 +0000
Date: Thu, 8 May 2025 08:35:53 -0400
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
Message-ID: <aBylKcZyFInlKQAR@lizhi-Precision-Tower-5810>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-4-ef695f1b47c4@nxp.com>
 <20250421211438.GN17813@pendragon.ideasonboard.com>
 <aBQZjFsExJh2uRfK@lizhi-Precision-Tower-5810>
 <20250502155747.GB20093@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502155747.GB20093@pendragon.ideasonboard.com>
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10839:EE_
X-MS-Office365-Filtering-Correlation-Id: 787abecc-8afa-47f9-ee05-08dd8e2ce63e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?SCV3jPqLGzpmsdGxoPTjdg99Hm/hN1Uv+qq7fcu7PPdVvSaCZRgKdz4JTJU2?=
 =?us-ascii?Q?P/vmHlrUZku+GKgAmxZ8+KjlLWktzjv61jvBwINqbRCpUbHpStUdRkTq/dBk?=
 =?us-ascii?Q?+rYAPLZe/n0ltu9f9Dsl9Lv1BkmrSo2hCIlxCP+Ia/d6qV0nUgwd5M64UqPl?=
 =?us-ascii?Q?Dbcn2P2QA4P8QeND7NPkLOgqtDmjCTceNjDk0tsAbXMlFppfomk4GYWAz0ZW?=
 =?us-ascii?Q?Tmilp+mtBMYJqjEN72Q6NHANYQjozIaV1GXyyXmIBRORq6zYCDRLdH17kINu?=
 =?us-ascii?Q?CV7oOlZY4XYXkOoYiEPC6C+OU2//455sdEkDItUSlAMU90d7FLyfOH4gvSFd?=
 =?us-ascii?Q?UDNma50HDGQ1UMQbbH4MQc3TeeRPsU3AmuCi5ItDBuH/T6ULHQfJ14dAGptO?=
 =?us-ascii?Q?YHul0BgPLykZN/b7BDBS5H6InWmp+2apX/ogk5RKCg3Ig8Ujie+yba8h22fR?=
 =?us-ascii?Q?iEMJHtFKmGWKr8vIQ4tIEiLhthfptjs4LOtSs8U8zHQOSIw7Q3rPfTkx+qFT?=
 =?us-ascii?Q?thePQeo2cCc0RDaQe0JaO+7XkDaA71YscgLnldiGAoCeHUHPzXJYvpzWcT09?=
 =?us-ascii?Q?eop4FdjZ2+aVT295hvw82vR2XMWYSym8ImHl1ytNf3AUVTo7tzfl9aLIbDr9?=
 =?us-ascii?Q?4usbZJQPdGUsGTmyMFhaVO0kef8nTjPXjn2wtVJqTtyx6k0s4HM2QCT36Iyt?=
 =?us-ascii?Q?hxUiqIG5hBuFn/dht2UF6ubIrUMWRiJpD0w49S6eUs19rlaDT3lE3ScuqoOa?=
 =?us-ascii?Q?nYrKk8y7kODKneTvSOdgVzyAeNU9KwY8fJmx3pXCnv0PrhK6LcQC4yjuG135?=
 =?us-ascii?Q?bPEzD/iw0UMHNc3urbzgpTR1BgU7n7U7IxUx99qlR5rtEAonkKbmduqDw1ma?=
 =?us-ascii?Q?5K16Izb+d1Talj8UGarRKAAiQlpMt7VHZszE8mHC5jxOb0plHYr1phVcuioh?=
 =?us-ascii?Q?dFKFxRTEupuB9WwusbQiJlPa3fipedaWYfQBVwcHZzga32qei0z/I3nbci8D?=
 =?us-ascii?Q?U2GN8GFM7sCizkXm5F9mXuWOuaQkmZBqR9Yvj8dzBhXtvseRWvVifpETMAnr?=
 =?us-ascii?Q?ulDbcFnehu27I7hwA6nV/55p9j7EvVOZBxkuUxF5STn4y0gJ7InoqOTH4WiK?=
 =?us-ascii?Q?3lhifWNZjoqvzlw4hEC/h8JwLShmJmfg55Jb5FVz11ZUFjeSPSkR55N0vLfc?=
 =?us-ascii?Q?mm0bEHBWqfjGtunNP30XY28MlrlCHaoWymic4YtfsjG8VZqpTKTHolV4nf0q?=
 =?us-ascii?Q?N+FBCt5+w+g4Kk7GxOKCG0NVVsFTJv9scRxGOqG3dfjFjI/9IboqgR9Jse+z?=
 =?us-ascii?Q?+qyK98k0vF1mZOWiBuf7wgvbKxi4m8HD79olKbvMBb39Ih24qT/yWYZVsN23?=
 =?us-ascii?Q?nRK9pXLGBqy3TKapaOedCzUyHeKYCM0FzicCLEocWquN3agO1nI/vXNsql4W?=
 =?us-ascii?Q?KOq0SX6kZlkwXh53E47XYkDKWg33Rc8nEfh68Y/NxHK7rwF5Uu5ohg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?XP6fHi37fozQfd+/jYCcQBuZmqBiOIkXaiJTRgL/tHJNMCpeyTk0zCtuoGR9?=
 =?us-ascii?Q?h8eHJxlmXqYF5j3Fzx0ndfnEc6oiXTMynzOwSo6VSyVmOoO5K8bJHR9IXAyA?=
 =?us-ascii?Q?Dj+/UcJtsZ6aDo3bgsfgYrMLvPtorwKe1NJNh4gdOAOT1LXUcHPAKgVqbLPe?=
 =?us-ascii?Q?43c+MW6S43dHxTIDfLMTrquN9XB1+lEnPecsfJD1TB7y49VZk8IYg3oa3A9N?=
 =?us-ascii?Q?bRF3BphCNYir0Pdzj6FvOyXeduD2CIbTlMAZFS+liP0JxxBX4QUz5DtRuQmb?=
 =?us-ascii?Q?viiK3SLToM7z9xDYerN386QeHFbKuOkztnwEebH/Lh3VFQLAS+02qn+NNgPR?=
 =?us-ascii?Q?eLYt1j4454qZptH4reotFNbFBl/57OGrsmOUz57v7sbMdUnnA/tcz2M1x5Ws?=
 =?us-ascii?Q?DV7ccTF0ZMcTK+SYJJrrZ/phPtSqO2yAw66NcsT7FqLJW3He+cRUBO5yVJUV?=
 =?us-ascii?Q?Rklhm0/Hphk8i7ryAMwtewvdEuSe3mbQmLOyQ0BgpzxKbF0YYAxd8JdiAal3?=
 =?us-ascii?Q?LuOgqYLPzUUtSkfMm+JA2IWY7LvoW1DFI3k6ST7haail7hmW74GdsMrzv6bP?=
 =?us-ascii?Q?mdWIfDNr9oSdanNsshXf0/T+Wk2n0im+AdJeMybIMGgTkddoXA0XAgNaMgPD?=
 =?us-ascii?Q?xYyqPo52PnEdan1BR9Yshy726bRtZZEMRbcme1+OOQpqd6+sK74oo/iSxL5D?=
 =?us-ascii?Q?YHdLpbxkkJTMjYoHtuClgX8JDDkrZdTZ6CLud1oCec4sEeiwTLYZrPX602eV?=
 =?us-ascii?Q?j2PEoeL0BOOeoOsonbY0s/5FGl5C4NaOH1yNlYjIgmlVSa5PhydfuxV4kzjJ?=
 =?us-ascii?Q?kcs/9b9JERtOIn9WpRA6uVyo7fFKG4HuATj40aAbB3aUSqHxML/D5JXR00o5?=
 =?us-ascii?Q?jkW3LCj4gtPuKYySOUNNFaExztToFg4rexXxo1SLkGEDumofqqpEz5v3TRJ1?=
 =?us-ascii?Q?oQxqUWCU+SXM8utvRhGyAuCYleRW9e3LMPjUPuyyX9fi354R6s8OKFdDYoqh?=
 =?us-ascii?Q?taZeeIEs/i+BdHkBwqOOeGaia/VngfWEYwpj4IOVLokBJw56PaL9bJcGK/6v?=
 =?us-ascii?Q?7y2qSxWjmu5JeVJU+0fRdv7203ESFOmFx6tI7ZZN3wCqx8m13VQXce7skPY6?=
 =?us-ascii?Q?3Xnlvwbfcafs/1L64CaMLUPydPslVxlH6h+qBDr8/7ImpRzj2iIYYxAay4dJ?=
 =?us-ascii?Q?VT62g3a4RDjDVOqpJXJU7yJkIB6PFZm1miMXscvSUcU4SbLcdlSUROtAzMu9?=
 =?us-ascii?Q?gk76hjQMYTDtHOqrcLGqeAKnIg3fl8U5vjJlF9/xBE5gRaQw/dSKOoCWXU9D?=
 =?us-ascii?Q?IRagdLFdawnqGnHX0Azkyv36OQ5Sjy7qzUCJ5PObe4IOjH+Vm4063Ze1LsCF?=
 =?us-ascii?Q?rRHhTSIzvadic74EA6eCUh3kgCFBb1NEMOZqN+qeBZ76M9SM/Shyy0Y2F4u1?=
 =?us-ascii?Q?108Lhf9g8/ZF5oKoo07VIsjNIlB5LGsD2geULlYMO8z4zudxhPqJ8pv61cZ3?=
 =?us-ascii?Q?nwza+eAt/R7ecp+z9BlDjkekOTkp5p46tkUN33NzuNL7ttqHQEIE/xBt1ueg?=
 =?us-ascii?Q?XANvJ742cVJOavqWrrRYGze7JFi9esTUcZ1wdiYU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 787abecc-8afa-47f9-ee05-08dd8e2ce63e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 12:36:05.1372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54LyuhKAYqouH9JqrVzW5kfDHDzapMKL5wBBEGQGjpEWHaPTB/n9lsUkYY6vNW/IGybmPayMiEeiI8BHrcN9Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10839

On Fri, May 02, 2025 at 06:57:47PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> On Thu, May 01, 2025 at 09:02:04PM -0400, Frank Li wrote:
> > On Tue, Apr 22, 2025 at 12:14:38AM +0300, Laurent Pinchart wrote:
> > > On Tue, Apr 08, 2025 at 05:53:02PM -0400, Frank Li wrote:
> > > > Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> > > >
> > > > No functional changes intended.
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 46 +++-------------------
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 +-
> > > >  2 files changed, 6 insertions(+), 43 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > index ecfc95882f903..015350c6f2784 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > @@ -275,11 +275,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
> > > >  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
> > > >  };
> > > >
> > > > -static const struct clk_bulk_data mxc_imx8mn_clks[] = {
> > > > -	{ .id = "axi" },
> > > > -	{ .id = "apb" },
> > > > -};
> > > > -
> > > >  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> > > >  	.model			= MXC_ISI_IMX8MN,
> > > >  	.num_ports		= 1,
> > > > @@ -287,8 +282,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> > > >  	.reg_offset		= 0,
> > > >  	.ier_reg		= &mxc_imx8_isi_ier_v1,
> > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > -	.clks			= mxc_imx8mn_clks,
> > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > >  	.buf_active_reverse	= false,
> > > >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> > > >  	.has_36bit_dma		= false,
> > > > @@ -301,8 +294,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
> > > >  	.reg_offset		= 0x2000,
> > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > -	.clks			= mxc_imx8mn_clks,
> > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > >  	.buf_active_reverse	= true,
> > > >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> > > >  	.has_36bit_dma		= true,
> > > > @@ -315,8 +306,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> > > >  	.reg_offset		= 0x0,
> > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > -	.clks			= mxc_imx8mn_clks,
> > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > >  	.buf_active_reverse	= true,
> > > >  	.has_36bit_dma		= false,
> > > >  };
> > > > @@ -328,8 +317,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
> > > >  	.reg_offset		= 0,
> > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > -	.clks			= mxc_imx8mn_clks,
> > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > >  	.buf_active_reverse	= true,
> > > >  	.gasket_ops		= &mxc_imx93_gasket_ops,
> > > >  	.has_36bit_dma		= false,
> > > > @@ -386,7 +373,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
> > > >  {
> > > >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> > > >
> > > > -	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
> > > > +	clk_bulk_disable_unprepare(isi->num_clks, isi->clks);
> > > >
> > > >  	return 0;
> > > >  }
> > > > @@ -396,7 +383,7 @@ static int mxc_isi_runtime_resume(struct device *dev)
> > > >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> > > >  	int ret;
> > > >
> > > > -	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
> > > > +	ret = clk_bulk_prepare_enable(isi->num_clks, isi->clks);
> > > >  	if (ret) {
> > > >  		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
> > > >  		return ret;
> > > > @@ -414,27 +401,6 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
> > > >   * Probe, remove & driver
> > > >   */
> > > >
> > > > -static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
> > > > -{
> > > > -	unsigned int size = isi->pdata->num_clks
> > > > -			  * sizeof(*isi->clks);
> > > > -	int ret;
> > > > -
> > > > -	isi->clks = devm_kmemdup(isi->dev, isi->pdata->clks, size, GFP_KERNEL);
> > > > -	if (!isi->clks)
> > > > -		return -ENOMEM;
> > > > -
> > > > -	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
> > > > -				isi->clks);
> > > > -	if (ret < 0) {
> > > > -		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
> > > > -			ret);
> > > > -		return ret;
> > > > -	}
> > > > -
> > > > -	return 0;
> > > > -}
> > > > -
> > > >  static int mxc_isi_probe(struct platform_device *pdev)
> > > >  {
> > > >  	struct device *dev = &pdev->dev;
> > > > @@ -457,11 +423,9 @@ static int mxc_isi_probe(struct platform_device *pdev)
> > > >  	if (!isi->pipes)
> > > >  		return -ENOMEM;
> > > >
> > > > -	ret = mxc_isi_clk_get(isi);
> > > > -	if (ret < 0) {
> > > > -		dev_err(dev, "Failed to get clocks\n");
> > > > -		return ret;
> > > > -	}
> > > > +	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> > >
> > > This prevents validating that the DT contains the expected clocks, which
> > > could cause hard to debug issues. Isn't it a problem ?
> >
> > It is checked by dt-binding. Now no warning by DTB_CHECK under arm64 freecale.
> > CHECK_DTB should be enough to find expected clocks.
>
> Yes, the DTB check will catch issues at build time, but the driver will
> not enforce that. I'm not sure if there's a clear policy here, and if
> ensuring at runtime in drivers that the expected clocks are present is
> considered as a good practice by the DT maintainers. Rob, Krzysztof,
> Conor, do you have an opinion ?

Rob:
	can you comment this?

Laurent:
	Many driver already switch to devm_clk_bulk_get_all() such as qcom/imx6
pci drivers recently.


Frank


>
> > > > +	if (isi->num_clks < 0)
> > > > +		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
> > > >
> > > >  	isi->regs = devm_platform_ioremap_resource(pdev, 0);
> > > >  	if (IS_ERR(isi->regs)) {
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > index e7534a80af7b4..bd3cfe5fbe063 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > @@ -169,8 +169,6 @@ struct mxc_isi_plat_data {
> > > >  	const struct mxc_isi_ier_reg  *ier_reg;
> > > >  	const struct mxc_isi_set_thd *set_thd;
> > > >  	const struct mxc_gasket_ops *gasket_ops;
> > > > -	const struct clk_bulk_data *clks;
> > > > -	unsigned int num_clks;
> > > >  	bool buf_active_reverse;
> > > >  	bool has_36bit_dma;
> > > >  };
> > > > @@ -282,6 +280,7 @@ struct mxc_isi_dev {
> > > >
> > > >  	void __iomem			*regs;
> > > >  	struct clk_bulk_data		*clks;
> > > > +	int				num_clks;
> > > >  	struct regmap			*gasket;
> > > >
> > > >  	struct mxc_isi_crossbar		crossbar;
>
> --
> Regards,
>

> Laurent Pinchart

