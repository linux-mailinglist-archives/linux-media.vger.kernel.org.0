Return-Path: <linux-media+bounces-35828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81786AE7019
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 21:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B64217C887
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 19:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3782ED146;
	Tue, 24 Jun 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iFcJ2Qck"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013060.outbound.protection.outlook.com [40.107.162.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DEE2E92B1;
	Tue, 24 Jun 2025 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794352; cv=fail; b=Keb8in0XU0edFYyFrCXyv4fGBI+EAK7BoN3f23pGyPlI63WDD7oTS0iIDPOPiceMHNKy7jEXfnefTpa0bJgrEHOubZCTzIvIaOwbwW7TN8BmKyGi0n5DiP1zn+s1yrFjUmAZqbJAPJO8g9LiO0h5o7Qqn563ut8d4wfNvSHAqA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794352; c=relaxed/simple;
	bh=xaZ4M8Wl2BEl990p36K24Rf2NcfiWsc6x7wzA6CYvqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fy2SfpxpD8cBEDpLD7Nwo1wuMV2VBGK92TS807aG2gMqvexuzxfVdUVwuQKQ995SA7ZD3X+jzPMeuQuQgu0ih8QvCG/3I621AGNBJ6QynPF/iVBg0LIR7QRKIazyLkYN+C5DfNl8adxzKh9h2QXd75nvP65nAf2alJqp9p18g3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iFcJ2Qck; arc=fail smtp.client-ip=40.107.162.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqAHGmXf5osBVN84NUloeyi7nE6Uw2Vr6Vx7WMdU/r1pE/fiJQu7Ajs9kQvfHMNVCOWsptmJN+mNdmKQhbIik/LRLTudBmgKs0FgNG1JvWEQf6P0eZOacgdPO/sCqNCpOCBCMXshVkPNMA32HnCM4j471qvadGXFmP136ylgITVWQbTn7MCRhhkpbMMNK+P5S1YjF2hWFTqrMPNk98qdcNkWzQn83Nzrw52wDxUNnCbbjc6+Q87UOcgZy5SuMXdcHtV0ZisDAo6OEEOOZIymGubHeWEgZYA6nx63Uqxg1obHYLE8RuiARWK6fi0D1JTRc76MZotiEmHQQ6Yt3rJGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH6MB7QiZJEFtl4518agtic9V+1iqmedclMX9EvZXA0=;
 b=CI/HVp64AyOoSabrvHTv+oXsH/jp1o4xGMg9/g4itsp9JmihUOXuc2SQdG3//y2i3rozWJjzCrmQ5v3Kg7td6vGLfhsa8sBE0Aqo2Sw/cuLQr0V/qgW+vnKgdn7A2zebV6LEWQTMks49Tt6iTVD6iqZLul+iwhEqq8sQYSJH2a0UyZHoUYRsJjOv36Keu6gFfRHtQNVzveFd9clPxDzRx1GCxY9sMS2Q3Jplwtqa/RsQljoMHCfFAVM6xNigXgvSLhZCELC/h4uE85t6tKOu2hQLi/vwJd6iprPv3usskEp6kCEmInlLo0uo+rE0t4CxojvUSZIZCo7SuZSDZAbaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH6MB7QiZJEFtl4518agtic9V+1iqmedclMX9EvZXA0=;
 b=iFcJ2QckKk4hNrFbp2Fo3Gp4/UcXEFO6sVFuMi6n1LES0NkZPMzHhtbeZu/tfrxH1gsJ8PCY3H6H0Bjra1KsVf3FgtUOsxOTUYo+B0Z5OEcHBjZOoAm6CL4ZRIBBndXlAHiRthE4gwl5KfB5wH+/hHLzqlePpIhpegpgaEIzvJ7QO6n61vgzNsF61RDCvIKcWQuXPjVeo8Kb9Ndo7T2C8CVKp64o1Un1eBAqE/8McjQH3OrHEhWI6TAS20Bxk14ifLhqMeVSdrn2poYqClP/Olq8wgzmZkQAAhiJmP3z7LkGY3ZqD0ln2qYaFxZtH+1CAAd35O9JMeUElp3mPPXwyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU6PR04MB11133.eurprd04.prod.outlook.com (2603:10a6:10:5c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 19:45:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 19:45:44 +0000
Date: Tue, 24 Jun 2025 15:45:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add bindings for AP1302
 and AR0144
Message-ID: <aFsAY1Nz2bIFH+t+@lizhi-Precision-Tower-5810>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-1-c9ca5b791494@nxp.com>
 <20250623224109.GD15951@pendragon.ideasonboard.com>
 <aFrxSOapkQ/QIXT8@lizhi-Precision-Tower-5810>
 <20250624185404.GD20757@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624185404.GD20757@pendragon.ideasonboard.com>
X-ClientProxiedBy: AS4P195CA0002.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU6PR04MB11133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe347f0-b32c-4dcd-5447-08ddb357b5a0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|13003099007|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?eNljnAA3J7G1DMoiv0scqGgaitGUkAOr135i+3D9jXwyZ+8X3IysjSgojYs/?=
 =?us-ascii?Q?+mQdg2+++tJ/peSOvk7mM8oC+HE6c48KiCT5G3NfNkLUlEowJd3W8DsQTqvM?=
 =?us-ascii?Q?ZWKy1FE6Y1cSg6KuC6hVcSVP2ikr681K+BuVGjUiXiChs5w/fSnb7723n/li?=
 =?us-ascii?Q?6Ra5+KqnAKWDpmHnO7gRZhS/ZTP6lU3V+qf0RrqqjkX4cKjPk9jqIy89RVgP?=
 =?us-ascii?Q?W8Edt+qRZv5bQzw+8DB5idup/3aYoN2fqueUwvxmRGJM8+2nKrE2S+oDqkzx?=
 =?us-ascii?Q?23VCQqZHXaXpussixQyCw2p9ipyd1mxCPlZIpvdJA+Lx5nZeEFLGlZmCQ+M1?=
 =?us-ascii?Q?uCAIZHMBgv0xbthRglro8On8YS+eTm11KQZAL6c5kCOC6D1ffcI3UQaoFdFz?=
 =?us-ascii?Q?ibM+WMTGJGZw2DwTqo9ixM8V/ReNfa9+QTbsL73owo2V5qPt3rhVAxTmQtdC?=
 =?us-ascii?Q?BbfHrdDFvTUy8w1G+tl9P4IYhvl9JQJYSYt36JY12sExbrU9U/fT7qoqUy73?=
 =?us-ascii?Q?W1/6GpWmBtY0fKrl0P57LP3dG4kHSFciFMUPD8soWn71/aRaxJdnRLewU72a?=
 =?us-ascii?Q?5LcaUNxnBUHReSGxdWY8/i1exSOz/CbKgBLEfxHt75kCkeC6r9SuG68p+UvX?=
 =?us-ascii?Q?d3h5EgAlUPASvNtxG2mfy17P/wKsySY9TP6a+anFWO3d//Od2uA7Vin5ORC8?=
 =?us-ascii?Q?vBvjEbParXp5+rwTe1WQLnlzcr0PXKeHoQwe4Jac84iqNTcyXeUAPYxOUReD?=
 =?us-ascii?Q?f83jjhJpBbdoORSxpe8jhRxEMSAH0qjvnNHYJAKGRyjiSdkevr7+RupmF+3/?=
 =?us-ascii?Q?t9yTa9jz0YGFsu0EfOWccGryX7KH6loYaL0tIaQdSGC/4P4tHcZXZ8mw0ihb?=
 =?us-ascii?Q?hzbZNjNXqosTR1g1B/OdXHsdm2ZCZA1/V9lPX6lFCb0KBZ2meLHM7qTh3HFF?=
 =?us-ascii?Q?uefF3WZQtxlMilEnEr0KAdcW9qdRwEV4PSM0O6R9FC/0oejILIX0W1t6jk++?=
 =?us-ascii?Q?tF2OfYjaMTohw7BvTZtgF//2Yzhyq3XaTt0VizNU2wQIT9rt6KW61fzOetTP?=
 =?us-ascii?Q?8tR3tPPJtub49jrLfsfRa+C+Bo/JtqYqcbX+e25MWMV9cqwGlOTKYgy1njFH?=
 =?us-ascii?Q?/QVN1359ueyCLED7AtTltvQVrlwI6JliCML9FUKsGzehUj4pPiPaoPQUz6Lo?=
 =?us-ascii?Q?EdujuBf/OnYIV9jVvZGxkl5oxER60MpZa1Ura966ZVBhApHfXxtCtshWMpvJ?=
 =?us-ascii?Q?ZoURYVK41kHzc1YeQKE4XfZcnScbSGzzMvLqeeRmEk9KchyD1G9b0dLhk4kM?=
 =?us-ascii?Q?OVDuYxLsx5zXePYlS766euqVWzkorQjFLCUSfIyr5OcBjpflDkP2sGW42nfl?=
 =?us-ascii?Q?Lqc5yn8H8mlxBX1nZMpi8Rd1viqYBcUHVm0TMJJH/DAKAVdvDsk1fyGFoP4s?=
 =?us-ascii?Q?wg6FWFCvC8EINSgh52p8hYdc8pyMl/u1?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(13003099007)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?dnkbxgr3KW8u72SgEN4uC+/qDgyULbPOkVJZ4kGnXUtIS7CC+3DiMDscLauC?=
 =?us-ascii?Q?L7MgjJW6PM3xxf+kf5R3PQGYGO4Wbr+wROWD8rKSh3jYQl502bRk7qS+9/k7?=
 =?us-ascii?Q?nFIyhZmBcrsXKcwq8Jm341pyft1Gll1nmAgKk8iiN0duGi6SuiIhQnbQd4dX?=
 =?us-ascii?Q?H5b2hfupnHv3hEVhw49KxRobhoBylwCPTzMjPB2SN4/I0+tmXRoYannkQLCr?=
 =?us-ascii?Q?DLQ0L/ZPzjjF3Kr7ojqiiwuzUc+HUkNyyoOKbbC13/BglPMrGAYu3nHAcbwd?=
 =?us-ascii?Q?sDwCh4VT9tv/sIoeeGcA/1bfUYe1uynlqJFJPV3X0GJfu2tRP4Q++p6h22je?=
 =?us-ascii?Q?bIQPPCOWUPWN9PqFbk/ChUj1LMO4GGLlSBCVqBQx2jFDKFgX+7PkmS5oAsVH?=
 =?us-ascii?Q?vTQKqzuzhoKTjzpddyGZ9Wtq28VgMJULAHaqzX4FNZm0Ef5E5anERYatNIfO?=
 =?us-ascii?Q?1TA9rixiaYiFM0QF5PyLn+alwb15U50/m9sCDVRMLg5X/4ymTW/dDmPXq7Qb?=
 =?us-ascii?Q?XXFfsg6SrT1bSZvCsfAP4FbtTdEDhCi10Bua79wcR1AVpkX2eTJZiZvAcEob?=
 =?us-ascii?Q?yHeQ4vBW1lxT9ujsy7WXrpPbzWv6xdY6LMhcyfBY8vBEJtKATDP7DhQWy1Z/?=
 =?us-ascii?Q?6X0L18ywY/CxH08YiRxVjNHQPGy3eEn/uXps95W3riHzsdb6UO1XSUWdMMpB?=
 =?us-ascii?Q?nXTXLrD1VTUJPgcusvv2kZ+UJIe9ExTEA5NgzwAooZ5QItLXqwrW5+QyUHJ4?=
 =?us-ascii?Q?wM0tSWWMaFUQUQ/LABqpm+Mzr0b4CJ46KnDbfalpaE2zfZeBX6gSPY9nKm2M?=
 =?us-ascii?Q?zAxtA/2TPR83oBE3qi4Tu+OFPSBrzvoiNT+whJVTrYEqN9bDhfDI99m6iRVu?=
 =?us-ascii?Q?h7jQbB1NSpM+xdOOd0scWDRx06+/bz1lZqOWYx/FQyZ5khTqmK0Bt4y6Gwww?=
 =?us-ascii?Q?17aSd9UKjttTkQKgDkZTViHnRWYyzvE9MRJSRWO9opNNlTRf4LdSicK0qKjJ?=
 =?us-ascii?Q?hqODpJvg9/edvUVk6C6+aN/capoARIbPI3rtUw4uJoh9UEDVOpNFQ6cK0JAN?=
 =?us-ascii?Q?yIpe8Nq4muqqBh7AeCa2pPnZSMk9yaTnFPWuWTK3RFHcK36QszCoEYQ42weM?=
 =?us-ascii?Q?MiXwTr74/jyAq6a02hR6gKEOKlWcMkRIzpVtjlA5C6LkqTxgVjDhGh8WTRqi?=
 =?us-ascii?Q?2e9XUudqDjQGsDc7E2hLacc8sTcXkH8oRPY01HyzCPxfxNw6+13EYldyzpXq?=
 =?us-ascii?Q?ToAzBZq6JWO1Ro2krW/0vsCVGnJf4FXsOWcJqF6mk64aySKOTc66USnoXEkj?=
 =?us-ascii?Q?3QhCsFfS80SH11OQhw++ZbYwCphv0wuf/SJ8UN9wAhTCberzIx9xeHKbKPRd?=
 =?us-ascii?Q?RBsD8Q3zWIXwJHD+8OXcOL9uVw+iIqmKp5LvLxMehUebBzyACb6y/qaDMjFt?=
 =?us-ascii?Q?VK1Rk8zj9SGrNxO6+A77kK5NnQi+X/9bv+Wy5jh3EEbvM2XN2u/p3nAOb4xo?=
 =?us-ascii?Q?zKcyun8SkXNiNOY3OqxRNZx6LGYNvnrFRAPMbCOpxNmUut7D2RTp+z8M5hDu?=
 =?us-ascii?Q?dO8cTQffNFCktzPT5VlTqVVdvaxXrwd3CVaCrTWc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe347f0-b32c-4dcd-5447-08ddb357b5a0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 19:45:44.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82CWQgHqTYl+FkeL5ztdTwSARTHLQmBkYEOoNy4uVxYvnhLxZb2wlzghD1cNOG35XFcnzQTrSPj0MS+WpuKJug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11133

On Tue, Jun 24, 2025 at 09:54:04PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> On Tue, Jun 24, 2025 at 02:41:12PM -0400, Frank Li wrote:
> > On Tue, Jun 24, 2025 at 01:41:09AM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 23, 2025 at 03:17:37PM -0400, Frank Li wrote:
> > > > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > >
> > > > The AP1302 is a standalone ISP for ON Semiconductor sensors, which can
> > > > connect RAW sensors (AR0144).
> > > >
> > > > Add corresponding DT bindings.
> > > >
> > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > Previous try:
> > > > https://lore.kernel.org/linux-media/1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com/
> > > >
> > > > Change in v3:
> > > > - Move sensors under ports
> > > > - use compatible string to indentify connected raw sensors
> > > > - Add onnn,ar0144.yaml
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 151 +++++++++++++++++++++
> > > >  .../devicetree/bindings/media/i2c/onnn,ar0144.yaml |  75 ++++++++++
> > > >  MAINTAINERS                                        |   9 ++
> > > >  3 files changed, 235 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > new file mode 100644
> > > > index 0000000000000..6b745dcf3fd3f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > @@ -0,0 +1,151 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> > > > +
> > > > +maintainers:
> > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > > +
> > > > +description:
> > > > +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> > > > +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> > > > +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> > > > +  Frames are output side by side or on two virtual channels.
> > > > +
> > > > +  The sensors must be identical. They are connected to the AP1302 on dedicated
> > > > +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> > > > +  from the host.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: onnn,ap1302
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description:
> > > > +          Reference to the CLK clock.
> > > > +
> > > > +  reset-gpios:
> > > > +    items:
> > > > +      - description:
> > > > +          Reference to the GPIO connected to the RST pin (active low).
> > > > +
> > > > +  standby-gpios:
> > > > +    items:
> > > > +      - description:
> > > > +          Reference to the GPIO connected to the STANDBY pin (active high).
> > > > +
> > > > +  enable-gpios:
> > > > +    items:
> > > > +      - description:
> > > > +          Reference to the GPIO connected to the EN pin (active high).
> > > > +
> > > > +  dvdd-supply: true
> > > > +
> > > > +  hmisc-supply: true
> > > > +
> > > > +  smisc-supply: true
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +    patternProperties:
> > > > +      "^port@[01]":
> > > > +        description:
> > > > +          Sensors connected to the first and second input, if no sensor
> > > > +          connect, isp generate test pattern. The compatible string under
> > > > +          port@0 and port@1 have to be the same.
> > > > +
> > > > +        allOf:
> > > > +          - $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +          - $ref: onnn,ar0144.yaml
> > >
> > > You can't do that, that's plain wrong, sorry. There are issue raised in
> > > the review of v2, please try to understand the problem and propose a
> > > solution there. This is not what we need.
> >
> > After review previous thread, Rob suggest use compatible string instead
> > vendor specific onnn,model property. I also think Rob's suggest is good
> > because compatible already descript the raw sensor model, needn't involve
> > new property for it and we can reuse other property like xxx-supply.
> >
> > Your concern is that port0 and port1 have to be the same. Rob suggest check
> > at the code to make sure both are the same.
> >
> > I think Rob may have method to add restriction at binding doc to make dts
> > have the same compatble string.
> >
> > Anything what I misssed?
>
> The discussion died out in that thread, I didn't have time to reply
> right away, and then the mails got buried in my inbox. My bad.
>
> The sensor node does not describe a device in the traditional DT sense,
> as the AP1302 completely hides the sensor from the host.

Yes, but still need some informations like xxx-supply

> The DT node,
> and its properties, need to be interpreted in the context of the AP1302
> DT binding. Use a "compatible" property, beside duplicating a value and
> introducing room for mistakes, is misleading, as "compatible" implies
> that the node is meant to go through the standard matching procedure
> with drivers. Sure, we could use a "compatible" property without letting
> the operating system match it with drivers, but it would still be
> misleading. I don't see any advantage in using "compatible".

According to what I worked with Rob, DT don't care how driver probe device
driver, and what they most care is how hardware components connected.

Use "compatible"'s benefit is if sensor direct connect to Soc or other ISP,
needn't add new property. improve reusability.

>
> Regardless, you should *not* reference the ar0144.yaml. A DT binding for
> the AR0144 (see below for a link to proper DT binding for this sensor)
> would need to describe the device from the point of view of the host.

DT have not concept about view of the host. It looks like hardware schematic,
just descript how difference hardware components connected together.

> Here you need to describe it from the point of view of the AP1302, which
> is very different.

what different?

>  Even if we end up using the compatible property to
> identify the sensor model, that compatible property would *not* match a
> onnn,ar0144.yaml. That's yet another reason for not using "compatible".

we can add extra restrictions here if need. onnn,ap0144, some time later,
new compatible model onnn,ap0145 appear, we still use

compatible = "onnn,ap0145", "onnn,ap0144";

Frank

>
> > > > +
> > > > +        unevaluatedProperties: false
> > > > +
> >
> > ...
> >
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: ON Semiconductor AP0144 RAW CMOS sensor
> > >
> > > AP0144 seems to be a typo.
> > >
> > > > +
> > > > +maintainers:
> > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > >
> > > Listing people as maintainers when they had nothing to do with
> > > development of a file isn't very polite.
> >
> > It is continue previous thread and copy from ap1302, If you have concern
> > I can put my name here.
>
> It's a separate binding, not part of the previous version.
>
> > > > +
> > > > +description:
> > > > +  AP0144 RAW CMOS can be use standalone with any SOCs, or work with AP1302
> > > > +  ISP.
> > >
> > > How a sensor is used is not relevant for its DT bindings.
> >
> > DT is that descript hardware. Many sensors have SPI and I2C interface, but
> > they use the same binding.
> >
> > DT just descript hardware feature, such as how many clocks, how many power
> > supply. All of property does not related usage at all.
> >
> > Some legacy binding related usage, but that is what try to avoid now.
>
> Yes, so you shouldn't mention the AP1302 here.
>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - onnn,ar0144
> > > > +      - onnn,ar0330
> > > > +      - onnn,ar1335
> > >
> > > There's also no explanation for this.
> >
> > It is just chip's compatible string, what do you want to add? Most compatible
> > string have not descrption.
> >
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  vaa-supply: true
> > > > +
> > > > +  vdd-supply: true
> > > > +
> > > > +  vddio-supply: true
> > > > +
> > > > +  vddpll-supply: true
> > > > +
> > > > +  port:
> > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +    additionalProperties: false
> > > > +
> > > > +    properties:
> > > > +      endpoint:
> > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > +        unevaluatedProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +
> > > > +allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          not:
> > > > +            contains:
> > > > +              const: onnn,ar0330
> > > > +    then:
> > > > +      properties:
> > > > +        vddpll-supply: false
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    i2c {
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        camera@10 {
> > > > +            compatible = "onnn,ar0144";
> > > > +            reg = <0x10>;
> > > > +            vaa-supply = <&vaa>;
> > > > +            vddio-supply = <&vddio>;
> > > > +            vdd-supply = <&vdd>;
> > >
> > > No input clock, reset signal, ports ?
> >
> > I am not famillar with this sensor, just extract from code. Do you know
> > where download spec?
>
> The datasheet is not public, but I have posted a driver, with DT
> bindings, to the linux-media mailing list. See
> https://lore.kernel.org/linux-media/20240905225308.11267-1-laurent.pinchart@ideasonboard.com
>
> > at least ports is needed.
> >
> > > > +        };
> > > > +    };
> > > > +
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index d6f1670290589..1362d351f2574 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -1766,6 +1766,15 @@ L:	linux-sound@vger.kernel.org
> > > >  S:	Maintained
> > > >  F:	sound/aoa/
> > > >
> > > > +AP1302 ON SEMICONDUCTOR ISP DRIVER
> > > > +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > +R:	Frank Li <Frank.Li@nxp.com>
> > > > +L:	linux-media@vger.kernel.org
> > > > +S:	Maintained
> > > > +T:	git git://linuxtv.org/media.git
> > > > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> > > > +
> > > >  APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
> > > >  M:	William Breathitt Gray <wbg@kernel.org>
> > > >  L:	linux-iio@vger.kernel.org
>
> --
> Regards,
>
> Laurent Pinchart

