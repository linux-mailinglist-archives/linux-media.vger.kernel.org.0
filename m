Return-Path: <linux-media+bounces-34364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D056DAD24AF
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 19:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CC2E3ABC9D
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 17:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8CF21CA0D;
	Mon,  9 Jun 2025 17:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aGmq7Mwt"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D82153E7;
	Mon,  9 Jun 2025 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488758; cv=fail; b=tWW7LseaDEtpgcu+8J2p3iu9d5bmAJpnihsPuw/xhvqxYD0j79F1wYdYwOuapn9omerhmXiFW4Qd/YJazJ13GxXeBez59cUjQbCt+CrdJxHWJA7UKCauU/XnZ2yN7MxFa/y4YkJvACXuNGAsXWT8581m7DJUi4Mvl5U48vHtFwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488758; c=relaxed/simple;
	bh=7cDi72wuiz5QNxpFqFvPOQXBtddptJDWGoC6l3VTcXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XNoEmSsOzl8TcprftiF4dTRTg7oqq28iLJGd6A6LvmredeK6astuB+zFSkSJc3hAQ4acZZX0nO4doCuV8/MHS+eo38TXhlx18jXZu9lYUDpb1lqtzjvFNkyqnqEeLhKr/yjW4FzpBWw54b+0onPkrDFxeJ42oiNY+lFnWxYlE88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aGmq7Mwt; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEM0RbrvuCO62EWzXkAMo/EAh3SbWkokunKpg+r/u9NrdNoP5t0A5QEWzlTgZn2up3huQ+6CPvgmYNKKiyGwjA6qLuo03s9ntS8jcP7qQbfmFau+aXbbnBZWUdg94zz6yM8kXtj4U5kE5TYwezM5UB42z0VqITigz8JKQdoJnLM+ZVXCKytZtnnSp0YgZJ5N9ELLqMz2u+prmzHk1OzyoMF+eqdwplRq7HMQ9OFu8mqtnJrFisw5fgKW2js0PJ9tPrVKDxD2YMVOheeH4qtmZDLSipJsWTAm6zAsHsdVOSEiZLqolqJ5kPPQviLQ1WAVMv/+AFfqUWDS5i33vmt9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESMUB2KpLvI8eIQa6AEmM2snMb7PTs5jPFfltyRe8ws=;
 b=ZYM3xjzk0bP2xyrDjMoKyC1BN1Iw0C9Uk3OG0HBrhasFDgmFy6V6gbQQOdOTUaYwgkhFhliBJtXE0+LeXq45zMDTUSw+lN0nBxwRGkMSgtjxcKj3pppbTkfFRXE1pcTP0JQUTQpnZ+0LVZjF0oVh0aiTWxnQyhRbIoR84dj+xDTJvy/bHNqG+EBJaHW8oksWKHpHRGjItt8u+dMrR1hGhqwrt18nn1HchE/hc3r1aFHJ69Xq+ithAe/H0nrpoSW1TLqXp4rJfNfVKI4vUaXNLkCrun2EXy5YFuxrJ/r0UPN+Bdhg8JnCjctuapAbmScfD+DhWiyHuWcYbIOyq0TjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESMUB2KpLvI8eIQa6AEmM2snMb7PTs5jPFfltyRe8ws=;
 b=aGmq7MwtHeZmAhwMWRhzQIJum2atEPrHTjIZsB4KIwLa0lOLbDA5q4vmTA7zq44Y5F20YSGDGxRY+7hyvifyzt3nj/bSzG8/LjFfdkqa1glP/0Ur8rDXhv33EAniC66vIHnzjuscePhXeDwdEMksBF5mBN0cDYhb8t7LlzNz+XvKrBkUQbC6nuiseZixLrQkeDIzLLGsok/eLXKujYeXdN+RnZSew3DXd/WRJEFMhnNRlsWuVVREATo96FxoBqsY20ooMGnrRKOI3jAW5wZOFEtbtHuK3axoLi7nZ6cZPsQtt8ZqySkC8zWIHj1Hu3GNUTbgF/Iq8Vdz+UtNtRd0pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10665.eurprd04.prod.outlook.com (2603:10a6:800:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 17:04:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 17:04:34 +0000
Date: Mon, 9 Jun 2025 13:04:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 00/13] media: imx8: add camera support
Message-ID: <aEcUGXeAdf/gBBFX@lizhi-Precision-Tower-5810>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
X-ClientProxiedBy: PH8PR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:510:2da::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10665:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b51b9e6-15a6-401d-30d4-08dda777b52f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|1800799024|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?FbcvkqQhFlB1rFderzsxuqsUk6KmLpr9KScm/iwDqBIbCgqBCmUD0+S0sRNB?=
 =?us-ascii?Q?SifQbEAO2s0IYO/45EY2EhzJ4InbJUFwFsDPExZ7jTgo4GxhdeKC9rmFQG7+?=
 =?us-ascii?Q?0bUZDcpZVNAUWAmoZ3qJuRNBFhGQjDnCPvZXzGWJRcOqc/OyxHKOqJJxS8U3?=
 =?us-ascii?Q?vUp3B+JF5JnR8PGtHpMSm1c5r+UiuY5VyMiVmQdXKS22BiHQNcGCEfTnucRW?=
 =?us-ascii?Q?7D5VxhCfHmD386RIn101mFKBVD8X6/h5fRn834xQDFRxZ1Xf9U2I0OzSm/l2?=
 =?us-ascii?Q?GxrVDYbHrDjorKcSzvTSuMEnkqXNjNsST2rE6/FmkDHLpUeqlHiMrbSGWTrx?=
 =?us-ascii?Q?MVaJZvI6Xyy7rw8T9BRCidkUuNwGfGnjvT837e4JpioGqoEaXmkJMu+/1tuN?=
 =?us-ascii?Q?QKCtw+rtp7c4kAb0+fSigj3IcHWQjglNLN/dg4N2Ix51OINWIo/PtScmzYZl?=
 =?us-ascii?Q?h83f7ljYzpqd56Gq1odKjLZpw1cjSvzWhLupXYnb01Gp4RqcHjhk1KatUGsU?=
 =?us-ascii?Q?WXJf+gOg4vgKLSem9WnLFeWRkXS8JsU3lV9F1zWGRVzlgf0tZD8wj/Y3PPWF?=
 =?us-ascii?Q?b2DuKdHKYIGf4D2DDjOZk2qHk+xI5qmdu1P4ZHxdAA8WapnKnTddHbbeRDv/?=
 =?us-ascii?Q?R/59im/Wv/NYFR7d8FS80rMywiuzIdcRimPeUg+XtXp9ELFbp8EEwtGcIqPs?=
 =?us-ascii?Q?IUnRd4D0Iog9cBhT3eXO+WjZAliZhOP+buZiNujoTELGVhndQ+Ke2R1T1TAL?=
 =?us-ascii?Q?5ldID1qsWPBqVaTJ9Aj6PXn8WU2EB925zckf3cMzF9fVXEXlFRHqSuSHEU16?=
 =?us-ascii?Q?8DNN1zRez7WjAD8hq4RtFS/y8EBWpML+tSxkmuB3ohA1ENPSU2vQVe0pFima?=
 =?us-ascii?Q?BxTDS0s0uQm9uP/k00A6DrJd+C4hp3Z82nbjuh4LKn1eCtBkdo+eqGBBoB9+?=
 =?us-ascii?Q?OepR7eOa8CwnfgqskF/G+CECSW8voJFkiV8ET7iAfSQy3EsVX2WMKgalXaxf?=
 =?us-ascii?Q?PIk54tzwo82FXu4NavjghXd6ITLvYBXs8/WrHNanND8oD4nl8kzvw9qNbCV3?=
 =?us-ascii?Q?oZ+3F+OF2dXqcvT/o/B265uo4VfDEm3NodFOxcV+1rMOOKvZ0aD6OaPBtzHP?=
 =?us-ascii?Q?HXbMzCi0A6dqUhKFQZKmBpl3KfChCnuQuPah8gJJOlwISfkDYEq82fkTLjXo?=
 =?us-ascii?Q?YjrsF3gG6EPQ/kNx1MWF0a4lSe5o2bMhjJk8mr2FcgjYW9kieY2Wiy1ui30s?=
 =?us-ascii?Q?EspB5Z50yp9BknCfMoREylgBkmFD+J3P3Q9CLii9dEiTqddGZCALQyZRte1f?=
 =?us-ascii?Q?qa8bodgnaFVHAXf0y1M0f9xqiDXoRAFz9fTAORsn1KdSh5HW9JeRDUFqEzE9?=
 =?us-ascii?Q?z4O8A6MUTR0wVW64WHRmUhRf+IHYJsLOcQV3/YsoO4WiGfJ5SvqxfRZSRvP1?=
 =?us-ascii?Q?6moPyiOOg8Tfi3GeMlvKnu/HaDZ0ZciHkSWZhi2GJMMzjs8qNaFDWJN7fWDP?=
 =?us-ascii?Q?olFtapubHFfJfeWfVJOjIQNAKs1d108skfVE?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qIkrrXcq4++RZD7f7FO4GLKJ5ekbAQlgrgXWByF5V2tRq+4RN38dI5Ukx2lC?=
 =?us-ascii?Q?4JrmHqb/4YAFDcQmxOtgQBIIN3sYPchpZfGNGzY8sqXysxXUEPiwMlWmsTxd?=
 =?us-ascii?Q?VQD7tYUsFwyODHZByGoLSAH+O6TKOvb+64MoHaGHqlzn6yQcyMNMX+o9KkVT?=
 =?us-ascii?Q?eK2NQFXrYowtTy3g/Z6aXfSGJbyM0O5s3iWPlcfQGpxA9fav+o8RLW6gpJi3?=
 =?us-ascii?Q?pYU/mU1YC9kF+NS0HymUNkViVAGxko5Y4xGWstQ2EJ+JyU2AsYPKcXHKO8W8?=
 =?us-ascii?Q?eRvz+MRg/6Vg+KndbAdgJ5GwmvTWuvJpBr4IUd0p//ndm55kb86GvzenhDM6?=
 =?us-ascii?Q?vEAi4AUp+U3AJ5PunKgUfIJxcF7wQ17qqjFs3hjGfrUBISyP5K8idc7KlR69?=
 =?us-ascii?Q?h2vGIq2moJywQJWFqfIs/PEHy6qMjzOKvOnSGyB/WvpcCAv9eywCWYEmgEiH?=
 =?us-ascii?Q?oznXDq9tw4Cuw75LuLdWLNXb8P5z4ZzjOuB28Y+XvPHUzKgyCmD5tuJhoBaQ?=
 =?us-ascii?Q?TdLs0DXxzGvaYcBpVP6mAOJ2KJ/wiCld3xIN3EoJnVvMo/sgxE1Taqs3ZwDs?=
 =?us-ascii?Q?bx0eufaPAYELXFjJP0QuPaSBfITHDB+ja/iOVFuD89cJeY7GpGtD/tMZvS1m?=
 =?us-ascii?Q?npSScuryEIG/3/GNx2foUP4+n0Pro4xt6q0d7SHZ4ovG8gWipzqN2oHsIlsL?=
 =?us-ascii?Q?9ZO1JpJXIZHC6r2rWi8valaKQw1nXEYds7NBcKqbbwT5QRyYOKwqT6N2HZiA?=
 =?us-ascii?Q?S3TbGl9lkyxUfPXrdqc75AiraLpejwvChq0ToIh9uxaIAbJO5WKCfJXFvAEN?=
 =?us-ascii?Q?BkqT4OR/UEFlxPUXkA0vdDnyHYyzln/crOWNMWshexU8i/vHiW6ue+XKS68Z?=
 =?us-ascii?Q?0zW0tLbPORczRKxoEyAJ+o7RFMAeDF+85V5ZTxDFlhCh25VZiPG0JN+7hkCD?=
 =?us-ascii?Q?2RDWTMoxjmSM6UjeM0Oh1Rsa0iwYeZ0z8e+43+iUT/vy3kzN3xdv/66W9BdF?=
 =?us-ascii?Q?+Nl/IIW0u5KnJ5OFR8TozPdNtjmxLfQf8kJ68inY1kAkEc+Dq7aFlVYFHxfm?=
 =?us-ascii?Q?oMgHsoE4m1fdrhPZNwUjklE1k69ktt1qNH2D7FN/T7Hhjej9pY6J6vDLlilK?=
 =?us-ascii?Q?gOZheBu8QTevRZSv0TmDq+x9aGOOR4triPqJMlcWX3+9MAvprfNLSarL6h5O?=
 =?us-ascii?Q?3jjCn5IpZnwEUGOMBimw346SzQeNRvgXm6rj+PRfKMIEArqyyBKbzsQqKFuL?=
 =?us-ascii?Q?tJnpbT8VbUZj3tlaRufU1L4me074VfhtqqBAvVqItXfafWVu3ktaEyJ9i/3S?=
 =?us-ascii?Q?7k2wCNjtdmwd2S3bGvBaFUpyrIFJuMLpFsLjO5dhkH6qJI7nzQL0tBCHsYOH?=
 =?us-ascii?Q?tFcxVQu6kp6hG3nB+5Mmgi9oA5CtyCfqSeSi2RJaQj8TceISPUyG+7o+Os+I?=
 =?us-ascii?Q?9/fAtTJtzxgXQZExYJzpQnZcgOGWIGIP1TrTPYIJGAQQCl9DaiNTJPR4WXL6?=
 =?us-ascii?Q?NH4r6/YlINtUwtZBy3/ZfujUAbis0mnMgGVb4dbTZqtCBi9WcpMj7Xl4yr9V?=
 =?us-ascii?Q?HE1bs7HeAs35/NHhICY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b51b9e6-15a6-401d-30d4-08dda777b52f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 17:04:34.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPo03SeFvqFsx7mG4blZ8BLQtBLMEtNGUfjgcw8KDnXhDPOenkkf3+woyL6CqNDD8dEqlaJRU3oJb4EMCNFSVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10665

On Thu, May 22, 2025 at 01:56:38PM -0400, Frank Li wrote:
> Add SCU reset driver for i.MX8QM/i.MX8QXP.
> Update binding doc.
> Update driver for imx8qxp and imx8qm.
> Add dts files for it.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Laurent Pinchart:

	Do you have chance to check these patches? Only below patch
media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
missed your review tag.

	DT team member still have not any comments about your concern by
use devm_clk_bulk_get_all(). I have quite confidence about this
devm_clk_bulk_get_all(), many drivers already switched to use
devm_clk_bulk_get_all() recently.

	Do you need me rebase to v6.16-rc1?

Frank


>
> Changes in v5:
> - collect Laurent Pinchart's review tags
> - remove empty endpoint in dts
>
> Changes in v4:
> - Add 4 clean up patches
> 	media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
> 	media: nxp: imx8-isi: Use dev_err_probe() simplify code
> 	media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
> 	media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> - rebase to v6.15-rc1.
> - Remove scu reset patches, which already in linux-next
> - Remove patch
> 	 Add fixed clock node clock-xtal24m to prepare to add camera support.
> - other detail change log see each patch's change log
> - Link to v3: https://lore.kernel.org/r/20250210-8qxp_camera-v3-0-324f5105accc@nxp.com
>
> Changes in v3:
> - Remove phy driver parts.
> - csr is dedicate for mipi csi2, so add it as second register space. csr is
> mixed with PHY and link control with csi2.
> - Link to v2: https://lore.kernel.org/r/20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com
>
> Changes in v2:
> - move scu reset binding doc to top scu doc.
> - isi use seperate binding doc for imx8qxp and imx8qm.
> - phy and csi2, compatible string 8qm fallback to qxp
> - remove internal review tags
> - Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com
>
> ---
> Frank Li (10):
>       media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
>       media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
>       media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
>       media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
>       media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
>       media: nxp: imx8-isi: Use dev_err_probe() to simplify code
>       media: imx8mq-mipi-csi2: Add support for i.MX8QXP
>       arm64: dts: imx8: add capture controller for i.MX8's img subsystem
>       arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
>       arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek
>
> Guoniu.zhou (1):
>       media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings
>
> Robert Chiras (2):
>       media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
>       media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings
>
>  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++
>  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 106 ++++++
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++-
>  MAINTAINERS                                        |   1 +
>  arch/arm64/boot/dts/freescale/Makefile             |  11 +
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 362 +++++++++++++++++++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  64 ++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  64 ++++
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  67 ++++
>  arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  79 +++++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   5 +
>  .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  63 ++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  45 +++
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  83 +++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 135 ++++----
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   6 +-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 169 +++++++++-
>  19 files changed, 1334 insertions(+), 94 deletions(-)
> ---
> base-commit: ae1fdcf4b210cd66ac7e97b24219c160e4bb7be5
> change-id: 20250114-8qxp_camera-c1af5749d304
>
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
>

