Return-Path: <linux-media+bounces-31547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF3AAA6807
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 02:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45EAE9A1251
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 00:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F111F78F4C;
	Fri,  2 May 2025 00:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="haDqlruz"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2072.outbound.protection.outlook.com [40.107.249.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BD62576;
	Fri,  2 May 2025 00:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746147213; cv=fail; b=F1/dfPBSWoUbGCgUD1gZp+cZDom7g2eJx9fAj8ysD0zPNSFzZq9zfwIX9OYebzgkH3UGLNH5cMz+sf60H2ntJhoqIbTXmk6dy/sZdAPkFKQVYYaCA5k2g9IjlOOpgb8uE7uciVpVG6uEBQ6o0hxHOvF9t0z4flSh8A58JZp49Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746147213; c=relaxed/simple;
	bh=/4S1YFgckpMKa/fHS+bY/JXLyW31ZdpFrBi3mBS5QK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jG8598jRbXPCRPkVLzCyvOFHwiZ0w6+UbMCszZIVdKQ0lQb5vDdgRV5StxBdW7mGOCp3CmOsxwLLmY/r7ltr/Q4TGarxADBmuq9z+bQH5dV4MeOc1huwL5eELGBEzjGV9GzuE2ctOvcJlxq0uv1+Dj/ZnULEV9GWr5ieBQVTgos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=haDqlruz; arc=fail smtp.client-ip=40.107.249.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jz/rq4ZApivzun0D75nMy7qrpFuHppCjC9k48DqSkHXvfbtk3Y/jqvI/i/0rkynRkJPOEJywi3etFkiSx4aAkOYwxSIhYtZ7N3VIs0w1lPkVg0HYSQ9kawzBhW6fjummlbHghDchT6IkxtOHepO6n1SFmYnnnDAZuC8Df2qGltqa/0n6t5fyRE4FYsRx6Ot7VFGkIdrPRZKBoK6v9wzcUpAOf59aEac1ATPKJqnu1MKUsXMHyEMXP+YyfE144vt2Ds0tyKkjkAH+5emUgp1c/u/cVm3VHJK7QcsAPHZfaTVXGZLZsQQBMsghUZZO8vXZXXwq4iwWqAMVxEbIkvtSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaPAhhYZdAQb+b6bbsjQvDIxS++tUdBdh4ugELOxs1g=;
 b=AFwmV7rbtauJcnyV1omW710+gHXlUMd1jFZc+epX8PnKUcLD/1pIHwCpC5H5b1AyTPZtHRrm/wQePpynrteSe3ui8QSZLRbGe/Sp7rSE//22nbRAp2MMoi84WH6o8WtsPmFQcwzO2m9ffug4OOeycBNqOkVAYD4CPIbd0QeEk4XsI0Dc83jYR1PZQQB73OkSEHFb81wJ/tvCnpRBdnTFa5VOjanu1PvhI058cJrpmWXKMpJC3csTE0E7EyDdpFJQQoobpnrPP2Phx574KrvmvjRJmNh0ryp9kE/4NrwKSbf41Ej9G75svOnGJHw5N61RKSAtEMlMCy5HOIzOi5hNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaPAhhYZdAQb+b6bbsjQvDIxS++tUdBdh4ugELOxs1g=;
 b=haDqlruzXP9WS2kAjryo6+mhbhPcO0nNxDLD4Q0rJDGqafYQGZHRl6vtyV6HWu4ZxXoiQ3TMSzUZ98saE2WEI/bZn09tyyrlGuqu6AYqoPgj8OJkJanlnvU4M0OazFCL0hfqW4zkVwSgL5Wt13E2nrBCDvY3CqmuX0HQ/V2N3oHEHg1zevgtBPeAs/o4UPE0Ts97ubynEGSBzNW2TZnbQpTN+BBbRVMatA8p2rSSlhXVnmXRJuF98rs9Ge3aWhe3SxSc9hySeGHQxuDHnLEIdMs9ktmXu2yGftmxSGDDIkkC8TWDOfIBox6mmMUsWqZEUL1dce3SwQVJjBCNG5pSiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10574.eurprd04.prod.outlook.com (2603:10a6:10:581::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 2 May
 2025 00:53:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 00:53:26 +0000
Date: Thu, 1 May 2025 20:53:17 -0400
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
Subject: Re: [PATCH v4 03/13] media: nxp: imx8-isi: Remove unused offset in
 mxc_isi_reg and use BIT() macro for mask
Message-ID: <aBQXfW6dzdyFI1GN@lizhi-Precision-Tower-5810>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-3-ef695f1b47c4@nxp.com>
 <20250421210655.GM17813@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421210655.GM17813@pendragon.ideasonboard.com>
X-ClientProxiedBy: PH8PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:510:2da::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10574:EE_
X-MS-Office365-Filtering-Correlation-Id: 32259751-d1a9-4d5e-46db-08dd8913bf3d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Xlwo0E5d0WAIy8A742avJGPsw6lyH+UnkZfAM6CsKjV3d9pfge0CTQmQlGpX?=
 =?us-ascii?Q?Sd8NBQjL3nrmeM8OzKNssnmpR9oyxLSIlFetJ8dnH66R6yYGlToU/lD4DPS9?=
 =?us-ascii?Q?TREeHGCfkHWoeMz8bW0tBNMWCv7AQrG6NqJ6t/5O0aw8vDTohB8M9UHEi0Ao?=
 =?us-ascii?Q?YQg31bVOAMZXZxUPt2vzpBJ1CSPFcDh6WbHwLOTHpsBkDtw7LQgHeea/76ce?=
 =?us-ascii?Q?v30AxfsfoeuX8JGV/Ta4YDA9j6xA3gE8w7bbbcV+P3b1CNuhzA9X1OJvFm58?=
 =?us-ascii?Q?lpBitxBcotf7ue33Ik8vZegXId8oS3OWmF1ScE3s/6zN3vKjSeMygYMWD3LZ?=
 =?us-ascii?Q?qilJKM3Mw/TjVnY59rXMrepmBdWoOonbP0vv8KhmIO+w8NBMw4en9nWq6raR?=
 =?us-ascii?Q?CeRbUWnfl3DVFeFxB2tNqoq0QSxdwnGIYIg9I0HWDKd5lHkOdFR0ZWcbQDoY?=
 =?us-ascii?Q?xN2sPbuHrDcQw5uPN/7xf04jdVFBac23/QnrGK3tQZ93WqY1C1LOY2jBIG41?=
 =?us-ascii?Q?pI/ukXm+RD0M5m3Y9DRURA0+YU4XQ5ey0+aHe+uJZkthWasaPZvOtk+qusNq?=
 =?us-ascii?Q?MGN33zO1oxgT11dp91+6UQT4lUuw0jDwunKyWLTZk6Doa7giy4DvdjWOy2zn?=
 =?us-ascii?Q?VcXykrEtYo0Cgty2pARMjpbTIm4fkv7Wv5qexNRz34yySHTd52XUdmil/KBp?=
 =?us-ascii?Q?/9afYQVwN+TECCKXseCd3P8bHnNPTI7KxtpbR+57f/NLRb4/5KhjnwMNRlWL?=
 =?us-ascii?Q?jsR6SG+JZUfb2kSKth/YjxCkhxk2WDbxo6hV7wzu8dBkAAfMvh78/eyxwzLV?=
 =?us-ascii?Q?oLjtDx5o3Wkp6SZD0LyQwhvaXB9ITlPVrA6Sxd+OxvrRuCQx8vORhX70t5KZ?=
 =?us-ascii?Q?Bip/ZOYygTZrE91ARiKb0hRAphVsWn/oWHwWr1eAGztOSo8sr5+zn8j3cUFZ?=
 =?us-ascii?Q?QZ1z8cWoMwUHq6Smn3iIoOhB4dbHS/+nYziwR1IXXinBe/5UYmPYikIF9gPi?=
 =?us-ascii?Q?jTWqPrJOUTCKCoUQA9ouFjtZ0UCQhKEDmw3MY8lulXJJt7StntRMiqGvUQRP?=
 =?us-ascii?Q?jkbYuQtIxpfot4qWC9bBqmb51rLao7ds/LbKJzjTTnWYhF2If+AqPIFxl6j1?=
 =?us-ascii?Q?nzExNz3T5eOrFYZm/3KaGpOqjGhMXcLXgM4/SvJ82B2pYaB477TlZwyQ50Fg?=
 =?us-ascii?Q?bqcE63VRQw7491J8dPFuA87tXaUBJt0xLitPZXHxpgKthnf9FlqCyuiQsnu8?=
 =?us-ascii?Q?ozg4Qn4iDYOYp6gdFZ1NURoSz500jLxv3m6gA7H/bO8N5dHYZBcpVhuj8FMy?=
 =?us-ascii?Q?g3YaTF0poBKJR3k9QKkk9juG3Mez9Ne7M020sQAVqoJhhKbD75xr7QBNGTYC?=
 =?us-ascii?Q?9uBGDhf5XtlsDWWtE7WTAdSbxmYYbv3nZmuwr43QYHBoPXNVwyXaN+jKDYQ4?=
 =?us-ascii?Q?NvoX3jextVZKOyOuJXZ81iIARebIrNAVuynr/r+a5e1bCSyw4WSsIQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?YlsCJQ9sRQujVgJHf42f9gTRwo9BYbBXqBy+a6ZdWw0lQOBr4LLnPbMfcDWu?=
 =?us-ascii?Q?NUPqrjyVC7HquUKy5Lx/EWGDZfmkuKr+A+0UAvlwu3YOzWPC9T7vbC1eRp6k?=
 =?us-ascii?Q?JryBS3tX0Nm7jYqZqzi0Xs9XNWmfhwK5LjNHfbtjxNkrlgt/zRpLmdthKCSo?=
 =?us-ascii?Q?FGMOsD9jhSkQZSL6r8oBStHTQ0sIZjSnj1BZEB/FKMm0BXL7x6iI6XdknrCL?=
 =?us-ascii?Q?Tsl4wySjW1y6NALSKlzpGPh/a12eqhr79cbWyUdyiMwJ01slL8CjkARxDE7F?=
 =?us-ascii?Q?Gdilx5yVuPnQXxRjYWaJB0Ekgrcmzdieo/X3YJ0QLF758fd/MWxs6fD4OenJ?=
 =?us-ascii?Q?fmKccz4XRvMrRArtmMO7xJeQvn4AWysGGbmI/3oljODtP5JyrQqh3lvRmEJS?=
 =?us-ascii?Q?9uPrqW1+iAA8gH3Xj13XpxxwiLu63cYMFrikxyUKHErQUG+gU22kFX/DtiJ/?=
 =?us-ascii?Q?F6EuLqi3Iiu7UrBp+0QarCdm8ZfZm7kDHaJZs7qVJHFa4YCelZCrIo5Dm/Bh?=
 =?us-ascii?Q?USc9FLZJmXjUbcJEgKjDt3Lt/eS5ghSPSEldC4DPHMGmfEyxyGUgGJ07Qarf?=
 =?us-ascii?Q?Mx2eAd07EY2hsN4bz5QxrW2fSwlaxX5Bf3OIUI/sk6BNyQcoK3uquqSU9xvi?=
 =?us-ascii?Q?t2jodZml3D6dFYkewERQ5XI2PmrrDikkN3cDhfKS2s6u5nuoY+AeJV9xHcaj?=
 =?us-ascii?Q?OnuVf8sPfGuYupqPz+KPqC4hvKkwd8X8DOAGlpndzvJBV5kXAkeqE8/5Gpm8?=
 =?us-ascii?Q?N0lQ/Kx9bG3pXs65iwgrxBoxcWMgl7T1RdqXrd9UC95i4dl0qBPkGPzE2m/o?=
 =?us-ascii?Q?ydlXCHojv9cDQ5hbBxPOcJymVQqMTZtWi2/Yy3uPXDSJcwk9daKLdgNVq3gZ?=
 =?us-ascii?Q?k8EkZut6wn+Kk5mX/yr/RBYr0EacGuFiY3F0ovucrjgYfCLV8woLepYUreNw?=
 =?us-ascii?Q?c74MOs7v6mQh60ln/zDWk3DxZ7XnMaPLqm0h2+NB9aauxBR9oimdVxZxBPju?=
 =?us-ascii?Q?b5/ZgD07O4n3PdXpbCg1FPdzWJBAhJQfeuhcyX+zq/esiANh0dK9IRV+05qm?=
 =?us-ascii?Q?DUTIrqyzE9uqoOvQnVrJAOos9dlA0dbM7vQ0aRi9wVDIROOtG+oHvqrR1Ftb?=
 =?us-ascii?Q?MMEMIX/KuQfyTZrQAZBckFg9+Lb7kvC1zrDl3Ppr+PKAY94HfHncMi3rEYFp?=
 =?us-ascii?Q?IAVEN/WEs9aIP3pugl5t67gAG7uM5V7ylCZw+wPF4QWLDEE7VuYYbaHwgvsy?=
 =?us-ascii?Q?6Fum+AdUOufQro7LQ443IKYW0/KFr6r6eEBczGVDUzkUnl1Fkfl8QJ0xmiO0?=
 =?us-ascii?Q?bNawfD3FqxCmJdxTADlSVvEc3kolTvpfFgqI7kaXkj3Io5CnLF9ATQigCwZZ?=
 =?us-ascii?Q?ZbuTMiEbR1+jcm89CIRiFR1+BTeWg+HbGSNQJ4NvufDUXYIq3gWqPAJMixPj?=
 =?us-ascii?Q?MaJP5BMI1InvnveJyNZ+O7ji342VIvHZGl6cY4UXzHbbr8bQUKlPg/QqOXhL?=
 =?us-ascii?Q?Uta1YIU9GW9FQ9DITjDcSWkMPhrpAl61GkTXi4PeNeGuyi3ybnb36x2giVvE?=
 =?us-ascii?Q?i0zX/aDWm6SVZc/GwE0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32259751-d1a9-4d5e-46db-08dd8913bf3d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 00:53:26.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwryeYR0iZouu6ZZnj60ghJLmrcyLaEVb6GUarVpAMTvInghUu/zFwpTq0x/E9KnKwvKBHI+kmIZRRFepRq8NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10574

On Tue, Apr 22, 2025 at 12:06:55AM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Tue, Apr 08, 2025 at 05:53:01PM -0400, Frank Li wrote:
> > Preserve clarity by removing the unused 'offset' field in struct mxc_isi_reg,
> > as it duplicates information already indicated by the mask and remains unused.
>
> The commit message line length limit is normally 72 characters. I can
> reflow when applying if no other change to the series is needed.

I remember it is 75 chars. Any document show it is 72. I need correct for
the other patches also.

Frank
>
> >
> > Improve readability by replacing hex value masks with the BIT() macro.
> >
> > No functional change.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 25 +++++++++++-----------
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 -
> >  2 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index 1e79b1211b603..ecfc95882f903 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -3,6 +3,7 @@
> >   * Copyright 2019-2020 NXP
> >   */
> >
> > +#include <linux/bits.h>
> >  #include <linux/clk.h>
> >  #include <linux/device.h>
> >  #include <linux/errno.h>
> > @@ -247,24 +248,24 @@ static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
> >
> >  /* For i.MX8QXP C0 and i.MX8MN ISI IER version */
> >  static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
> > -	.oflw_y_buf_en = { .offset = 19, .mask = 0x80000  },
> > -	.oflw_u_buf_en = { .offset = 21, .mask = 0x200000 },
> > -	.oflw_v_buf_en = { .offset = 23, .mask = 0x800000 },
> > +	.oflw_y_buf_en = { .mask = BIT(19) },
> > +	.oflw_u_buf_en = { .mask = BIT(21) },
> > +	.oflw_v_buf_en = { .mask = BIT(23) },
> >
> > -	.panic_y_buf_en = {.offset = 20, .mask = 0x100000  },
> > -	.panic_u_buf_en = {.offset = 22, .mask = 0x400000  },
> > -	.panic_v_buf_en = {.offset = 24, .mask = 0x1000000 },
> > +	.panic_y_buf_en = { .mask = BIT(20) },
> > +	.panic_u_buf_en = { .mask = BIT(22) },
> > +	.panic_v_buf_en = { .mask = BIT(24) },
> >  };
> >
> >  /* For i.MX8MP ISI IER version */
> >  static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
> > -	.oflw_y_buf_en = { .offset = 18, .mask = 0x40000  },
> > -	.oflw_u_buf_en = { .offset = 20, .mask = 0x100000 },
> > -	.oflw_v_buf_en = { .offset = 22, .mask = 0x400000 },
> > +	.oflw_y_buf_en = { .mask = BIT(18) },
> > +	.oflw_u_buf_en = { .mask = BIT(20) },
> > +	.oflw_v_buf_en = { .mask = BIT(22) },
> >
> > -	.panic_y_buf_en = {.offset = 19, .mask = 0x80000  },
> > -	.panic_u_buf_en = {.offset = 21, .mask = 0x200000 },
> > -	.panic_v_buf_en = {.offset = 23, .mask = 0x800000 },
> > +	.panic_y_buf_en = { .mask = BIT(19) },
> > +	.panic_u_buf_en = { .mask = BIT(21) },
> > +	.panic_v_buf_en = { .mask = BIT(23) },
> >  };
> >
> >  /* Panic will assert when the buffers are 50% full */
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > index 9c7fe9e5f941f..e7534a80af7b4 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > @@ -114,7 +114,6 @@ struct mxc_isi_buffer {
> >  };
> >
> >  struct mxc_isi_reg {
> > -	u32 offset;
> >  	u32 mask;
> >  };
> >
>
> --
> Regards,
>
> Laurent Pinchart

