Return-Path: <linux-media+bounces-25738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90030A2B463
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 22:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3443A9434
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 21:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127EF236434;
	Thu,  6 Feb 2025 21:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QE6pIJan"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B8235378;
	Thu,  6 Feb 2025 21:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878553; cv=fail; b=FjFt1NCmN/mLiLVhlxHSfCKgQqtrSA99+7VoBeNQBI57jRr6lI7T8oPoHuOdLolXeqOvUUPw7cKW3+4izmhi32nG+N1NJpsIccbdUKvqcM7teOZhJiuzyMYhgAh1eni5Jw2xaMZbBMBLBYzaFAluwvoGnmcUEpyqIgW1m8krdO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878553; c=relaxed/simple;
	bh=t3VOII7WYWT8DWys31kqmFvOUmed8dKazlSbdV6fdw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KkTb5hulpHv/FNKwkFTDUoSWUT2O/TaV02r6dnShyWbdn7qjk6yZu1Ln26reimn8shVK57QmB45EmesZ9qhGr2hCe2afZi88sy5tfEHyW8VvvjS/CiGji1t3bwKd9hYEfIq/iUPLlxYwImptoAvGbJIPFe9tRGLM0PQRRCyCXlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QE6pIJan; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJtb4Lp7UHrKKCkIRW089PPrIPEVBizYzDEdKMP7eZoLgGbL3xFdWeaQf6gpr9CJiaD1BVdhCk80K97Sw72C7c/9WNM3Geu+Mp7JXyYMxwf0EgHlyLmyPGQYywkUlALlMoDsC8ZxUuJJv72bOQxFvrHOfNHziaUc6Rtp0/y9JKbQvuVscz64NaY+x+49ktSoPNhp8ek/ClqVndM1oDZwiSVHcgJrIgveOGbKh4dDJdn6jEDyy5YOR8W4aXovfFmvnQMz1qchomPRPY/h7UckN6AfbHd2dxlg/W5dvrou5X4JhYXzfSsiPjlV2b6dZHtMu8GT6aLiNvgV3BzChoz0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkKfYAcyVnF4iK5aGhizpMBcd0HBbT3R95ccB5EPqSA=;
 b=F+D6k+6UM+CiXB3Hg2GAjEeMB1uOgbHKGThJ7VbvsEs7+vYzMHKj4J1Q0JR5WInj84wsGU3q1oOQqbVW7Y8mYwGdUH3/uK8tazWLCA/L1tmpI1hzrLLZPCBwNBUjjKMyBc9EJGlgOOyfjS+EuHVQAt0F3hi8GdHq/lRVjO1Jq1dCKab1WJZf+8LgzKwdPFJFCxWHziSvp7DLg1kZdLYkAueQ6GRUoAdDq4e7H4+/aRHy//jY3uJsQJUK2mdYi7ukshE27JmkiKkYVKgvTzqUonqFY7P4wjPRGdyPUclQt4aBOLAPUdBUoNxutJgTxXMstCbgaGkU4a2defa+pPMbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkKfYAcyVnF4iK5aGhizpMBcd0HBbT3R95ccB5EPqSA=;
 b=QE6pIJanL9kOMjo9gugQ1Nm9Zpx26sEglnkFEhKlbAJvE+05FJDPSwoydSyac7MqIRb/d1stJZfdWtvepTEcMGdJZBBYmDIriKqIcwGHBBnnRPz62Z7dEGAfxn0UG5E24pfSqF72lI7+itD2NKDCfcmjzVI/IS83mYtLa3caFvFTOt3bEHY7AyS3dgYUT8bvo5yhye2/BBEAaiaIJU3mA733VMTN2n9u/yBTSkMXvxq0cQ6pN/PheQo7gbzoiIutSWd34T+95JA81ivkVbU7DZmiHgEDBSfXWxMT5A7hAYqH2aAavpOP9EWVPJ84RY4XZumPtK7FTHk7ulRKEZ5QEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7967.eurprd04.prod.outlook.com (2603:10a6:102:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 21:49:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 21:49:07 +0000
Date: Thu, 6 Feb 2025 16:48:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Message-ID: <Z6UuR9mHhQUdnBEc@lizhi-Precision-Tower-5810>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
 <20250205-8qxp_camera-v2-1-731a3edf2744@nxp.com>
 <20250206211808.GA24886@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206211808.GA24886@pendragon.ideasonboard.com>
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: ae93a92f-1da3-4847-5dc6-08dd46f81500
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?S38HYKS7QPKAqTsfTmXYTCOtpdk+wnmvkTmtW9WGWU0bJg6OF0qMSFs9tFXF?=
 =?us-ascii?Q?//1it19MwkihYhhN94OvKniAJKHv4GwozSV2gOuOl8HHclTdW1sR1pnKfXkc?=
 =?us-ascii?Q?cBjgnaLcEo5cUuhaq4JHpplgh0HY/d25o6JE+BmUnRS2XH85NFKPO51DBqJc?=
 =?us-ascii?Q?xbSUKfS6yjYBSdzwtQHSxxfSEB2plr3oa7kIMBJzq+BF77QxtHDkFA0Qr7K6?=
 =?us-ascii?Q?7mt2CtCDKPSjKnhtln0m5Tt1fumzzZZnJ6HCl5jD+ToHLT3ztHFL6GXFMiqe?=
 =?us-ascii?Q?gDYZC431WynUJAOJNMONdCUIkNklb7HVmug+wsnvaidyjR5OGH6NOXoSHPck?=
 =?us-ascii?Q?J4+zSSSyefi20jc3qUE9VoygSnlG7a94VMvHqQIEl3/aBP9JHNxu55gB5M9T?=
 =?us-ascii?Q?s+qvDd+wMEETpkNg2KDLhbAEb4dtflXJT8vHTTGKyW65rZ72o6geOrkYcMDh?=
 =?us-ascii?Q?3UGyeD8UWOq2CwaeuUyMtQmWhAYY8kH7Fp6xpPqMSmbT6STvMJX2yCTb0f0A?=
 =?us-ascii?Q?CBntfP7Gw2FD5DTAGUswveC6pdUhDCEIVidGLnNjMcr70qX/ClBAoh/NQ1mp?=
 =?us-ascii?Q?ZAzfgFhzoLGndtxG3XUkLNZk+9B7yldwyQgWMADGacu84KacwlPYo3c8YSzd?=
 =?us-ascii?Q?8j7rLdYHi6+yEE4OYnEyFZ4lWoSVsKnvL5oOVFq6ZLSXxtrCb98wiZB3Xnh6?=
 =?us-ascii?Q?SjNrHagKdcpFoTLGY7XKW0cE5MATuLThs8sLbyvq9si2NOXSqqXHR4k3PwdY?=
 =?us-ascii?Q?cgRQ211FYKe2p8KOLGkFc1hXSffmDm5QDrylb66VdH/gzU/k3fnsATdJgb6h?=
 =?us-ascii?Q?HQHDbzZZC3xfhKVVigMARiEX+o2V+74f1yQooGE11UnutnYai05qxTG0cJyT?=
 =?us-ascii?Q?yD+Fk67JFx3drdCINg5FJdq7LgOhliiikEbVbqg2bgZnlNhJKFHyJImLnYM3?=
 =?us-ascii?Q?NKE2ucyKBD2SmW6iaiybuppcE7bpPN+07B2SzJaxGHU3r0M/5u02u4C7lksp?=
 =?us-ascii?Q?IZKx629Gey4adMGpcIoVgOzoSHLOyza7Ny6FhA3UBOH5cwr9wWAiALmpb+D0?=
 =?us-ascii?Q?epcK1ZuETSrOyi0cJfAN56Jzgw7xPwzXlRF37qbeDU+G1TqXFsliagQP5Lyf?=
 =?us-ascii?Q?myoV3/RUlYhVO5gbzqxUiQmizLLL1/Lb3IHsHYrsmRxVi6q3FTyh+MEO6Uzi?=
 =?us-ascii?Q?uH9k/PI1oplSsbt7vCNUvEKjIueZkzfz7X03L+2ASR5LLeSod5V8HJZOzSdK?=
 =?us-ascii?Q?F8/AwFtTbA4Hn57bHhGxLgqThAPpOJ4VSWT8aOZeCgK07HLAu3Y2CjcQ92Qh?=
 =?us-ascii?Q?aF5Df/AI54E5mvpwgG3RSuKYbNiwQFugKbzyBNQ9wV28uMwlsnvWpmAaln/A?=
 =?us-ascii?Q?ubkKR/umqbW2C4YMvlCGKPxHSIl6?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3pz8YO+9DatHyOwgnU42c2hhheF29vD0MLPGgEjkzfp7Kg8Sr8ujNRTAl2OH?=
 =?us-ascii?Q?NmFhJoOYdnMIJ3zIAYb7iyLydgV5e7uUSjvkRqAoQhqQ0kiDMNHqvXXY5qfU?=
 =?us-ascii?Q?GC5wHM0pl/yNYxzSvjRAnOLGRR+9I7uPITR18jlIileJLMseMoy1iDZfuKEM?=
 =?us-ascii?Q?iviqcgGGICryP7ONkmTnw/vv7mtKxLNfCGCD/CEbfJxe3p/qCQ5etW1PeSsg?=
 =?us-ascii?Q?c/PD/2/xw76ZNb+HR4FX2Wf5KLJhX+whwkd+0bBbIW7Lo/qsGU38MBAceQhg?=
 =?us-ascii?Q?XKxPJ6pfIrI+j+h3LgQ5eY80VnKtL34qqXH6tG5hv08hVuy+85feIyzXh/2G?=
 =?us-ascii?Q?SnKkeT8N5mqZxkSCx5W22zcD7MyEzugcXaskSkW8tMifyxU6bpDJzmr0Vpko?=
 =?us-ascii?Q?rli0RPyhhj+CU2EOjnW2bg1+FdXNKouIxGeo/4VlC/Df9r3xYna9gsx6/MAL?=
 =?us-ascii?Q?vL1tgAe4u9o6d7+1s1Q+1fZ5f035Su0QzMvK2o321ci32NcWID5R924RPr5F?=
 =?us-ascii?Q?+/ZWozHE/c6+OaBnGnAW7bu+xkMMSP6OMeOV/sDAdbG6vBUDePMi7GnE+y9O?=
 =?us-ascii?Q?6LxhOFMLyvvSleyJU7s0GMcKEwgphyVDZu3H5jlrgJL1MufL7gfO1heGIx4D?=
 =?us-ascii?Q?r0j0R+1Y7OSQXwJGJfjS9jGiHXMJc3G+/7g1pqRaYcdFYQpc3Z2ANB4vCVbP?=
 =?us-ascii?Q?sjD3mcKsSseG/NMbfQzDAeD8uQQQhWSYl5qz4hW7da7UEkXm+tjCcb3EuvOd?=
 =?us-ascii?Q?u7cVO6fnQPW9umb23Jk1mSiTdqufObK44Vb782ED1QPJTF3yIirSih71kqd6?=
 =?us-ascii?Q?zyDfQZO1V/PRjFfgwjDgoRC28TFKr8hZ2iE8qSeL9oybtrVjpm9KkwQfkw4R?=
 =?us-ascii?Q?AQyDJukZ8m/kdO/WecrB6e9A+nNhIZ7/jZan9Fe+Zi3it/BwLW4xSxMlL0hk?=
 =?us-ascii?Q?/KjX0RBOloIBgVyzTGSwMzmY92+y6yJZJJPDg/L9YiX2Yp1r3U4VhGpuw8K7?=
 =?us-ascii?Q?kr5hMG99A+cFNboJXT6eVNjhjH3nGc6Nx6xcWeVYpbX1O04hyWabb84mU6jW?=
 =?us-ascii?Q?wcjMuPn5JjZi4rWw49RfXhQSnYzlcbaQLzTDoWEncOEhln+bOQVdcymQqS4G?=
 =?us-ascii?Q?FEDDvyiejR5hqwGfxffsrwj1BLQlhsfGf5JeIUIu2Rd3A2J1ICkI2VEJy3ds?=
 =?us-ascii?Q?6nJm1hacZn4O9ZVmdXqB6RijQHL3VMfTgKW3sm+YmvQ+TIfFoa1btYDUXBq1?=
 =?us-ascii?Q?x24REKMlI3OxRf/i40KjQoO6O1roqOpYILZ6qRyKWmKxr96al5a2Y0k/Jn82?=
 =?us-ascii?Q?k4M3y5oZDqxW1wuGcndEtBYWt6Ix8w0T+CODyS/R63VzufTjybo7wqBWnUVJ?=
 =?us-ascii?Q?Bv34j0p+3sQR0MAQWx40kkFIDb7pJAV/wOP1Q5STXQSx+HOCG8S1ah+tP8NR?=
 =?us-ascii?Q?VtdrlUUULceOaWqEYa2n3s3bKIIwi7zoAlm4oPYzsrRfnTS0YD2h+Z/WbPxf?=
 =?us-ascii?Q?Q648mEgW4EXEdWBrMB5Wf/V5P70KkAs7UIkLJ56tTzYR0wnLP/X5fc9fLSRH?=
 =?us-ascii?Q?YCxikXBvjWpLk7+/BvejRbExIcDM4zxWBb2Ukh2q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae93a92f-1da3-4847-5dc6-08dd46f81500
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 21:49:07.7128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TksmNRqHevaRALzEVvGpvYR1Szdt0Iag4hm7GWwhsZ9ZEsz4GV8PUhfpZgbe5zwIApkHnuWU1XcozPrAKThXVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7967

On Thu, Feb 06, 2025 at 11:18:08PM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> Thank you for the patch.
>
> On Wed, Feb 05, 2025 at 12:18:10PM -0500, Frank Li wrote:
> > Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.
>
> s/CSI/CSI-2/ in the subject line, here and below.
> s/phy/PHY/
>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v1 to v2
> > - Add missed fsl,imx8qm-mipi-cphy, which failback to fsl,imx8qxp-mipi-cphy
> > - Move reg to required. Previous 8ulp use fsl,offset in downstream version.
> > which should be reg. So move it to required
> > ---
> >  .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 57 ++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> > new file mode 100644
> > index 0000000000000..7335b9262d0e7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8 SoC MIPI CSI PHY
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
> > +
> > +properties:
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - fsl,imx8qxp-mipi-cphy
> > +          - fsl,imx8ulp-mipi-cphy
> > +      - items:
> > +          - const: fsl,imx8qm-mipi-cphy
> > +          - const: fsl,imx8qxp-mipi-cphy
>
> Why are those called cphy when, as far as I can tell from the
> documentation, they are D-PHYs ? Does that stand for *C*SI PHY ?

There are already have D-PHYS for MIPI display phy binding. cphy just means
for camera PHY.

> I find
> it slightly confusing, but not so much that I'd ask for a change. It's
> just a name at the end of the day.
>
> Apart from that the binding looks fairly OK. Except maybe from the fact
> that this device is not a PHY :-( It has two PHY control registers, but
> the rest seems related to the glue logic at the output of the CSI-2
> receiver. I wonder if we should go the syscon route.

Do you means use phandle to syscon node in csi-2 driver? Actually this
ways is not perferred by device tree team because it should be exported
as what actual function, such as PHY or RESET by use standard interface.

We met similar case at other substream.

Frank

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - "#phy-cells"
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8qxp-mipi-cphy
> > +    then:
> > +      required:
> > +        - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    phy@58221000 {
> > +            compatible = "fsl,imx8qxp-mipi-cphy";
> > +            reg = <0x58221000 0x10000>;
> > +            #phy-cells = <0>;
> > +            power-domains = <&pd 0>;
> > +    };
> > +
>
> --
> Regards,
>
> Laurent Pinchart

