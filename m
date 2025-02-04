Return-Path: <linux-media+bounces-25644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4F0A27662
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 16:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33B9C1884E69
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 15:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2990C21507D;
	Tue,  4 Feb 2025 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FjlkyCB9"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513AA215058;
	Tue,  4 Feb 2025 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684060; cv=fail; b=bPnxCBz3KLsvGzsg4yZyZlqVMoa0XK6NYZ3l4rXPmMfzkFuWjJFCn0BoS9h6dDPyDIW8AxDeAuxFprs31bHwXYgSAVE9kXSDANL6ngz2BvbeGBV15HqNyNH7nHUaKpbEb1MVL6tTZFt//pKS5FuMFF4R+0ZAFdlnlITDGHILHzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684060; c=relaxed/simple;
	bh=FD+Qi05aQzmNllsyhugxEtT645bsv7AAH2zGlmQ0BLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X3Yirua+AvfZTvbwEPmQQKS4u1e2Z3u9EN4CSbVCsrCcKItm6wHx2DlYm91I9BvZ6YKvVmQ7O05qj0WgmxUAj7GGFpTViyPGeYbENUz9BcPEjXrw0K2Jofs4iXEPxFkBYSd6/qLwa/mGu/FGV17vAef6WQpKiKFCSS/z8uIYoqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FjlkyCB9; arc=fail smtp.client-ip=40.107.103.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUke7af2qmSm6ZsAusXXMGbzGbDieSLuMlVmp5SjYzkjMwqcLsxV8VU++rw6UHp5jXEc4p/QmzvSHDugi+8mv1HNneTnq+bBblKLwa0ltFBesxKfNy/H0X2j1K3bm/GRA9oxQybo1ZpMNpyWjwwtLQOQnbsV98MEFiUtBemSgvKWl2ZCj+f5ZuhQe6KeL8i4sI5fBMzfBdZAArx0x2TOdYUVl3A2xLRT4dq6U6FS6q7j9AlWLnYp3SRF6Bgg0PvDZPZVv2ti4lUoKa420sAhxs2DDfhrnCyMGRZYWKoGYFHBdkqKTAxOIBDuTjWtdLhIOIwsTWoWSRFDa7tNudXXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2RBCX6OXLyKURpPtvNLzV15gQ5nuOpAXgLD7rRhNZU=;
 b=nakXlxwPuYTPETToBTtjK/bmrsWuTdF2nigngA72ReDUOFSKLN+SsFqVbcWsOEdwd51qwHWCzJWFGzAjAsFyp04gyZNlxDHWsqqL3PmTebhaSfxl6A4qHChA35Hm+Tlx1cpoP+H2WX223bUG2Xt36jvL3pSQzSsMONYw+yjChrHmbcZUiiwTu5Hdk31o6XMMFqIJ5+tfnHdyzrT3o772N1SKoYcOAueKv8cTaZLc/dwFHfvI8AkLK342kF6xI8D7macPoaIRcmAY3pi5mcn0vBDcHaXrc1KHiNdLjw9TcMzkdomIurWu5CYBS1ciXubtAR4vurARmf3Nt46CSPyiyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2RBCX6OXLyKURpPtvNLzV15gQ5nuOpAXgLD7rRhNZU=;
 b=FjlkyCB96zJl18YecfwOZNf3Qjuk2Pru/dhNjVv0iNpnFcQEz/SxTdlqBXsmwCpqqik923hbPPiZ51mqSx5bfFD4NTra2tzXP0wR2vzRKCQwnaGLzkReFdsxeMqxokik6+mk9CYzZxtdpKDEWHFChrF5UY8KLoxl985p3iCYD1u9DZKA6SnD+LDll/1i9C7SPmwqPRJaLRR8fEUVqlAJja3x0UHBr4rtFX3BVY2wRHkthxmI+PUSNmrH3C3Q5Hd6Zi0l4fy7ZDCR5/csHC7TBQJaJkx/bfxpF+0pSY30TiIRGqhW9tt6maeHVKbb8HTj4HpAfQNTMdUzFXVqdjjG0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 15:47:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 15:47:34 +0000
Date: Tue, 4 Feb 2025 10:47:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Robby Cai <robby.cai@nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH 08/14] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM compatible strings
Message-ID: <Z6I2i73OLftL/k4a@lizhi-Precision-Tower-5810>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
 <20250131-8qxp_camera-v1-8-319402ab606a@nxp.com>
 <20250203222018.GA226659-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203222018.GA226659-robh@kernel.org>
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: fd562013-da8f-4e2b-f956-08dd45333e2c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?k5jJgv+kjT1nLRA+++RrQexzX4mI5OQmsVRYrkYtRO8oVQ9cG/3xMtrAvtTs?=
 =?us-ascii?Q?ujqi2+wTU64lLXxDyfuNRRpQMte4LWJGclbdzEOu3qOftTp/uvsexOy6Vxei?=
 =?us-ascii?Q?gVY+QmaXpJDP7D2mcXPgMpL632x9pSIqEvwCm8SqlUbnzWAE3Uml9HSnL5Cr?=
 =?us-ascii?Q?Tz9itA4IkinNFu8wYdB1D5tGxTYkeU8/qV7MedF1XA1I4ODZih5L44UURSDx?=
 =?us-ascii?Q?HgaZRv4JFuw4bT8KK1euK0GJ2aGKv7GgRavHbfLyoKKhcLdoNDxoo8jaKl4R?=
 =?us-ascii?Q?PD3015Z+t3RS53e6PzRGKwkfej57/LUzNhPohrreFgotAVL350c0sm7j1GXC?=
 =?us-ascii?Q?qOP6lOJg1q24NX9JrXnlqvf1m+zuPK04HpbmxYBXaRBJPRgXDw7CUnU+/0TG?=
 =?us-ascii?Q?HX6Eopwq2GpLth+qocl7Yk+tMplRfbg/J3nXWbLAONS9iCJTOwC6z8cQpfP6?=
 =?us-ascii?Q?h9qtQk3Q8fSBcQKiAnyl+yBQtz69VJTDk4COhy4r5pKIrcwS9Trc0zN4Wbl5?=
 =?us-ascii?Q?JGJcI91Gk56p0uK9cu8H3uvTlcHsMm80Rvmdfbs/qWosd+hEd/yb2GjZWjma?=
 =?us-ascii?Q?wWs1tJ6QbTfI7JsdAib3xElHMoBzEr28JUdTvXpdIh+qTogDySOFLzYcUxKu?=
 =?us-ascii?Q?3aQxo3KdL7wSlvbxfCoMW9j/aieZpCgL6U/8h/eYPXjdzHjPI5ql0FFv4k78?=
 =?us-ascii?Q?pW4L+PawlS5ypPW3T7eJQGWkvx4OJZBLn+QwUJd3vGsgieIfzEFdAwlFlx8h?=
 =?us-ascii?Q?sxMYSaoNqAoN1UkVGuGDt2BWyKl/YPRipyq9oZrkQNsts6Oh6fdvGcrxFVof?=
 =?us-ascii?Q?biexsRToQFKbBhDpAE9YZmhsbzhazSGKg1XXC7Gbz+Vxuc9sIWBPqICl/5tB?=
 =?us-ascii?Q?nh44Zeqec4m/+geAuUbi6H8XHraW4S+p9dwdpFXxyHqaRCe5aoAqoO0HzbLg?=
 =?us-ascii?Q?gWF95v/SbgFprGKMfuAKnUSbddT3mKOLpVXWPNXuFTjwDF53X4wxkQ3wYG7H?=
 =?us-ascii?Q?dhNxbFzKzz+6DUppOZXYnelgH2Ixzmw3pXqpCTLc9DQS3nz8WjYYMBMupqTU?=
 =?us-ascii?Q?pVpge6Wn8nK1RmBOPv7c+7kR8u/Ai1E00LuQfALHgSRU0Id4JWBd09zPAF+9?=
 =?us-ascii?Q?byllRtSgE//Nk5gHr7XJh+2RZxlu6vhx5QGU9KOGIoTD4H5rfD/0ig9RDFhj?=
 =?us-ascii?Q?j4h6Vb2dIXii3EXq5RnjpJtnEpKRbpPHrKjFTYTofH09tH0PK/mu148HBR/V?=
 =?us-ascii?Q?cPOUTiWLm3jm/+De8zK0WoV/LrNxSkfPaEt5sQA+OUYxRoNtrWrn+t+vXNNo?=
 =?us-ascii?Q?+KiJ5dc2nD4K/2i9YmWzyo/qQsIDV0EesODNPFgIajDPdP95B2hXAb1kDKMx?=
 =?us-ascii?Q?UBNzoGg4sY8bciyJpD0QoDFraej5aXy80IXRpHQC97Sv9Knwhx3YYoVaaWj1?=
 =?us-ascii?Q?I7SEdw6VO3c+VCDd20mbedWREyfzZbwy?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gk1JLBBa+WuQdGaJXUi7xAWjsoe60kS7/U86oWYiRjyZH3ZPo04h0xhkdcTU?=
 =?us-ascii?Q?F9e/GFj9/y6o9k565zEanAOgmGFCPJA9o5yNJqLySuUfjZIUa6SFdv4bJcNa?=
 =?us-ascii?Q?Lj2ov2m+5cguM8/pE8OeTZyvTZmIQA8Vuf7DROMNRsvRimqCvIKGsbRJb9NX?=
 =?us-ascii?Q?amS5zAVyYZ2voE3Q8F6tFo1t1TfVZMWAwOM4hSNJ8YWgjz3JuUyRTNVOU1l8?=
 =?us-ascii?Q?5Bk7iOCfqmCaFOuAJOfM8z0QOLF7x8+ICWy+BBxVByLqn5qidFPojRJcYrUi?=
 =?us-ascii?Q?IoIJRZNfr3YETu/J7T6Dmo/raR+M89U2rPxprPokVm7YcfOxE8TAd24hTN5+?=
 =?us-ascii?Q?N40WR7dBzSyvfJ37eaNcws+lNKhhPQBnj9QCvMiqYSnCH8wOe4KKh+Mx+au0?=
 =?us-ascii?Q?03L/rE6iMIz65w/ln4cVygsK+rQ2O/dd2mlz7/zkMIIZ1MlzmzJ0Wau4gux1?=
 =?us-ascii?Q?/rH/UHLNlJo1vZ8yVacQvVTHD6qzQPolCbN1Zfm9D9xr3rDLpNBCzkrGQqtA?=
 =?us-ascii?Q?HgZd9KcGNVQen7xwY0i5khYVM+5kVM+H5+vu2h4Ef1T0SxXIyy/J/HW4q4kH?=
 =?us-ascii?Q?ZjzEaw5NyK43yuEsh4eyPQCGKGVYiyRQpS46CVhqM24U15SPeSXdqoF0rlgt?=
 =?us-ascii?Q?2qltTRs+zrsarfY3HKJqmYcsnOefrt9iQjOADLlaGTu+UwikjLMtev3hSSF6?=
 =?us-ascii?Q?tpEnF922nXKQP+AJ9IWF82GqEfZftv/zK/dwW8fI9ImBoOLoiKi1HR0y8blP?=
 =?us-ascii?Q?9EYUShyj/KGIole2JbMG/h7x76bLK0SZ1uAiUoXLC3YDRT6aIheRqDsX6oSq?=
 =?us-ascii?Q?TJexqzOdizd2hSpmmSKCXldDfuf/XP+/FbORkY71wxVCZ3NPR2JHHDpJzNiA?=
 =?us-ascii?Q?gZLynPPOhYiuNLJZnEnWwQhRcS479jJaTy44tD/jM6luMcJXuQXP26Cie2AS?=
 =?us-ascii?Q?kBqcJp/kC2WjWSgRW09JRNl5RnJvPGiYnSuUdHKUM9mFPJQPapZEja1/e4ty?=
 =?us-ascii?Q?AcfZWF6OP5gUxvZ2T2GS7ETJdcl7JHjfErxvXxAX4arZJ4tE3a8vxxxBeFPs?=
 =?us-ascii?Q?nKOsRodTnxXCYA3uShNGsyu+bqfvm2ZCRXYLNPsISuLHS4uI1MqLDg8pE2Zy?=
 =?us-ascii?Q?dlFyi2WO/Nf71odct4XHWazePE4fixNWCfBJcIiN8N1oH++bJ/syekZ+sNX1?=
 =?us-ascii?Q?cJpu4SH1AEUb4fyhXvKM1exP37wnkqa1ecfVTgmDVnLn+hiBcd1ZZmetKGb7?=
 =?us-ascii?Q?NmqYeYjjPSplMVljlOHM+6gdVnND5FI5mM5yeMCMQL/1/5vGnnBlkV84CZr/?=
 =?us-ascii?Q?rCXcGo0qlxbgA4bBWTz/DLhZEHDoLw4UklqSweJl+juLNC7LT8Z6yyA2XVbG?=
 =?us-ascii?Q?3WgjBJ8QJvkRzecoaspp2yErN6huBqLW9WRc2TRElUrMK7j8Bn6E8RyR/lvk?=
 =?us-ascii?Q?KTgc7O6mavpRY1XL3Er8KjxHkz24ZOaHSK+YmwVURq6XW6hT4L5+gT35H7/5?=
 =?us-ascii?Q?LwmvJ+nW4RnSvwvjlkXMapPQcZcrcEA3scwFMr4SRI1EvRN3lCwZesjedSa6?=
 =?us-ascii?Q?aFcSj9inDlzF0fK630aPFzcr4e3bwj0HJgz9cRfv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd562013-da8f-4e2b-f956-08dd45333e2c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:47:34.6708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EBI0E/APptrbROax02RJdeHR5nOx5sQitkho/Ep35T99pox7lZEA3xRJOn9oro2S2Ej29TBV6mqE41T3qgGeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771

On Mon, Feb 03, 2025 at 04:20:18PM -0600, Rob Herring wrote:
> On Fri, Jan 31, 2025 at 04:33:53PM -0500, Frank Li wrote:
> > From: Robert Chiras <robert.chiras@nxp.com>
> >
> > Add compatible strings for i.MX8QM platform. Remove fsl,mipi-phy-gpr from
> > required properties and add 'phys', since i.MX8QM use standard phy
> > interface.
> >
> > Keep the same restriction for other compatible strings.
> >
> > Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> > Reviewed-by: Robby Cai <robby.cai@nxp.com>
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 30 ++++++++++++++++++++--
> >  1 file changed, 28 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > index 2a14e3b0e0040..91c4d8fbb1f8c 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > @@ -18,6 +18,8 @@ properties:
> >    compatible:
> >      enum:
> >        - fsl,imx8mq-mipi-csi2
> > +      - fsl,imx8qm-mipi-csi2
> > +      - fsl,imx8ulp-mipi-csi2
> >
> >    reg:
> >      maxItems: 1
> > @@ -39,13 +41,18 @@ properties:
> >        - const: ui
> >
> >    power-domains:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> >
> >    resets:
> >      items:
> >        - description: CORE_RESET reset register bit definition
> >        - description: PHY_REF_RESET reset register bit definition
> >        - description: ESC_RESET reset register bit definition
> > +    minItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> >
> >    fsl,mipi-phy-gpr:
> >      description: |
> > @@ -113,9 +120,28 @@ required:
> >    - clock-names
> >    - power-domains
> >    - resets
> > -  - fsl,mipi-phy-gpr
> >    - ports
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8qm-mipi-csi2
> > +              - fsl,imx8ulp-mipi-csi2
> > +    then:
> > +      required:
> > +        - phys
> > +    else:
> > +      properties:
> > +        reg:
> > +          maxItems: 1
>
> The max is already 1.
>
> > +        resets:
> > +          minItems: 3
>
> 1, 2, or 3 resets is valid for imx8qm and imx8ulp?

It should be 1 for imx8qm and imx8ulp, I will update.

>
> 2 power-domains are also now valid?

Sorry, missed it. I will update it.

Frank

>
> > +      required:
> > +        - fsl,mipi-phy-gpr
> > +
> >  additionalProperties: false
> >
> >  examples:
> >
> > --
> > 2.34.1
> >

