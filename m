Return-Path: <linux-media+bounces-36023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A466FAEA317
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 17:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C32C57A3B2F
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807E42ECD24;
	Thu, 26 Jun 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IVrp9xFj"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377AD194AD5;
	Thu, 26 Jun 2025 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953524; cv=fail; b=BFoWf4EtJ4nwHH2tv9NQSYKUjpfTeMih/OykJFRFlt3sOKBHIb2N79gaN0TaY/oPfg8dfNRH4Ltr31CJgRfcME0Lzx89BBw83GhanF07bhshOAZ/bYw/9iTcla1Hw07VHw2gtezNP6+44ImY/HBmISOsLhUE+6HsE0PK/vcXjrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953524; c=relaxed/simple;
	bh=LfIgeehVFrmh/CenSBgs1kVyM+CadsfRDekHGz2mV7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KJLlOWuK41Ei+TF/Z6g5QVEvqB16vG5T2GVRdlYHP+TcHRmkUmqUZoy5wQXNsNeBIwverRFVKOYF/S9cE2Xq3WiZkGxNxp5Ei4LxjlUdBu18WSIrMyOu8koJKOHAYM2z2e4LXeNm7lwah8qjQfgptrEfIUeGHj+6qiWN6Garm/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IVrp9xFj; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtvTDAraD4N3cEEIEjxJztYL5FTVsoDqxAT+t+//9wAnEwgF9YvsxWw9/sj673lmcmjquVRGfyf6rN90hE4cFV08/EklKSjU+gochQdc8cFTYX5oSK/bqqhWKi7OMsf61s+t0ZhENoOqr74TH6JwrsLg9rZJ0V5q6Yo7gUCf+jS9J2wWZ5tQ0YjmANg54bntJB9zBWqoM5SS7jMKtvEYL+XwSGOUCYiY9FKe87wRvEuYL69AainiZPboejA72XN00ybBdRfEXjT5svqC95ggX0MIxMlTHnv5UOIK3FKj1caN+pyuEsGGAJazlKWsrjUxvpt3dA1yEHe0uX7fVbz36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgFNGdWScFITony/YnSEDyix/KaJdvBBJ2tGM9a2res=;
 b=UGQUAeUe9B5Z/EiBuHkEkD+53325560yVe9rJbLbjKQFqd1pBLxqze1NJ0iQZzOzbDsVyGGdGnLt95+yCufVSrhVMjy0Q1PeVc/6nk/bq/A7JN9ilG44LL3WACXirfTsqZGxYlvfJrYzYgNLJyeMfoCqY5fFhlU5P9BY1UrXsbppdU63wC/D/MkYFM6zUaamKoT6YPtIG6Ry8SjPsboLM8wxuT6H6rKgDCDPjCpVOaXWu4Ulv4R8TY/TTZ6kFEcJUQ674p8eJvlZDFYGFpDngceMZZMiQ/piqZYruquawUXxRVXDyRoG+1F3Ng9i+YxTh54GDqIBBy7blv/dSRKzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgFNGdWScFITony/YnSEDyix/KaJdvBBJ2tGM9a2res=;
 b=IVrp9xFjtXteZLZ0/2cCHDjDR0+bgU8IzOG8kNH3cWLEqy/sh0XdEiolGsV+sTIyK5iBufV9WxdtfzE8JbruG29SoFJyVA9pxpphcFUOKSOZG2ZJEcYPaIWHXPT0UIfYJE9g4MIH7yrlpstSL6G9RZlrlPmpRP+7qiYDrQLBvJMv9ShSoCxY2yvawBW6wSO/+ZIc7mFsZhv7EDjeCk1LDqzOdfLsGhxLmuCHyvoemWjlQWX7tvAju/JInfQH5C2vvJyLb6yit+kPTbBxFZCIlFsW7y0+X0RYkqb8/MDaNrlBZFpdI4t4D92gSvo+lopyRlRdEbE3bLaqG7JgzmeUYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8997.eurprd04.prod.outlook.com (2603:10a6:10:2e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 15:58:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 15:58:38 +0000
Date: Thu, 26 Jun 2025 11:58:33 -0400
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
Message-ID: <aF1uKaJyxFMx48HN@lizhi-Precision-Tower-5810>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-1-c9ca5b791494@nxp.com>
 <20250623224109.GD15951@pendragon.ideasonboard.com>
 <aFrxSOapkQ/QIXT8@lizhi-Precision-Tower-5810>
 <20250624185404.GD20757@pendragon.ideasonboard.com>
 <aFsAY1Nz2bIFH+t+@lizhi-Precision-Tower-5810>
 <20250626124002.GJ8738@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626124002.GJ8738@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM0PR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: bdacf9fe-6061-41f4-c157-08ddb4ca5095
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?/dv63HSShVKJ0Pi2YW+Tj3upwnKcSYQf/2v71ie8oXfGBx/sG29sps4oE5OW?=
 =?us-ascii?Q?WoJsBeaKBowunwcBXIi/Crqtn9SeKb12zohc00fEfu/u7URBvqEnB5nyRE3Z?=
 =?us-ascii?Q?owTjlHPQQcwjjl2fieN8VYPZ8ZzJRmZ0L7QDfxxEfGwQ5Uhir8lTwlA0pLHo?=
 =?us-ascii?Q?fmCriXzr8UARNa68T/zqXy0JV4iHpTTyaB436uFF1ByNcfmCo0Ei9JquHpvo?=
 =?us-ascii?Q?V3X0O9mswvPWSThyOaLyuNlrU48AAGr7h/XGG6oeVV5upkmKQukEycXdfGJD?=
 =?us-ascii?Q?AS0MsMr/DgEKvzWAgeky7yhm0Hl6dA+UrXpE5e3Jrbd9nos/9Qc0puiyeEM2?=
 =?us-ascii?Q?uVL4iJU/XjwM/OuNpiEign0dmoc1wKtWHC94zR4rhM6kKsaQ9tJarDjnZv4x?=
 =?us-ascii?Q?VxJGvuK/mnJ4tqengXpNgODa+mWdfCbEZd0ccrVgQhyOllA15NcNtgSAeka1?=
 =?us-ascii?Q?b+XJLlUZBp7hkCiHP9RyGPzuW4ONiEsg/orii36Sb4Mjcn01QqGgTyjDYfLr?=
 =?us-ascii?Q?1lc16u/HzSFSQ3kGz6ZRcN0CWlbUVPBQDlN1exwpLLbNLtqkNBfFXNGFHYyt?=
 =?us-ascii?Q?G6TuapEeG7oUq5ukG1Dw1mJcX+nKzUwIXCHF+IGdRDUdIa/kGhGA3OMof9qi?=
 =?us-ascii?Q?6R5g8mmCVUtgKjYXP+VpSR/+7nDVuw0KPjt2cruY42YLrOg8bxd60+6NK3x5?=
 =?us-ascii?Q?HWKzYVtksgg6w+8hKubvPaI1g2d55GnUkkcYM/pbiaS2lBFACFaediXvKOst?=
 =?us-ascii?Q?1cpd2H7/Lgd2+H/zLiApml8/aWQ7/XIAybFKGgyTgnTsVceRfEKNK12LK9bS?=
 =?us-ascii?Q?Vr99Uj0dz68TV/3AB4vaV9mh0Do54xNg4CbQY5gJvBF6lzkRjyofjztfxVg0?=
 =?us-ascii?Q?wQOfJYPkb+Kwr1Db5AwwCDEQBjD0V3D1lr7yoYZNlnU+Gdr9udb+1vxzl6km?=
 =?us-ascii?Q?LCh6YvMQuaXucOZlbcddG4j0PmSDBe+4TN106Cp+J2hrTSiVFJcdHrPQep/J?=
 =?us-ascii?Q?4FiSRc1phiGpL99Oi+7GLL5UVc53AnBi545jsyBZhiti3lRtIkztSOMb72ak?=
 =?us-ascii?Q?au2pNuEtvq4Yx4vvtqZ0eiike/apQGkV+SYaOPLl2pqEiEyRluf73APqGxtB?=
 =?us-ascii?Q?H9C7OuyWNjjUfY3ZHWzrHfyKYLYrueWe7trpyQACQMK+iK7Y8uYynmoIGHcU?=
 =?us-ascii?Q?JtxmTnqQD1//znKtZ+QtDcAyv1nHTkw/U/DBk9AYu3Cr+M9Hhw8P9MDOdbwO?=
 =?us-ascii?Q?039lJAEldDI1CAVHMZinLfBOMvQzCTBPgwgDRnK6xCkkGsmgxmw+xwH813l2?=
 =?us-ascii?Q?q91/O4Uld+t1Nrdj6QgKWmvG2hmPBVVD8y6+aOFVn7PbUj5gvOn8OQfqG05j?=
 =?us-ascii?Q?JsW2I90a46ppkabbbs/3P8js92L5zNx0BpfRxDUm/etOEohIrGEVaOE7odCS?=
 =?us-ascii?Q?ppxX753l6YJtv3UGGeLOe41xaGATcT9d?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?CVb5m6KoD+g67kAWkWFRW4K+oULCcU4e1SHz5bSA3Uf8q8daod7NZHl8nzDc?=
 =?us-ascii?Q?XVpH1pRGUCfwi9jiSOaTBFkDP5fmifDS6/ALEivx4rf2y1HFnEdUFdXJ2QMp?=
 =?us-ascii?Q?fSpLSjGDT+dJ+nTh+4yrgx9xQfwVtFBl3WOfcfbNBkcQZx1BbH5tLpOmRwTM?=
 =?us-ascii?Q?2E7EnqA4tM0gxEjHJRrb8cLwQAVDnJKgN0K0UZQgxaOw7LQOCaLyuPuut+9Z?=
 =?us-ascii?Q?SCYKlrFoyikyay1LC0mnC3TtREPrvTt3eKIjWh7tYd4aGv7khjvYwOeV4bRT?=
 =?us-ascii?Q?BZXOu2xlw6ZtUyRI9h8eXiavFLc+MWG1prXkjImJQIc4NM0la/POoQyUCWv8?=
 =?us-ascii?Q?PnS42b+SncrZbyP09plWgcYY6P/xDZ8fr560qO0JCnBpz3O7wkTKy5xkGZ9r?=
 =?us-ascii?Q?7quULAMBhX92pQI1pVctnm46UXe1sU1lyNLkdsNOF7iTeFYVHCeLTifdioyU?=
 =?us-ascii?Q?HID/5RFGYjhIDZOUJSyyJEAu43iTfHht1oXLQC6mJWs2JW2EntyHyhlEmRUX?=
 =?us-ascii?Q?MBokevEWq2eHYuRXhOXHe/g2+l4oUyFT2kyh9D2sG1PYHSwtQ3xdgMIXh4fZ?=
 =?us-ascii?Q?voJ9qGfaFGRCK3i6OhirTleqX8qob2AeEvIuvQhD/GN9Gz6uOprB5nGX9pEO?=
 =?us-ascii?Q?l+MSjvWOTnawSFGFYAdNdE6zEJMm3X4se2goMt1cu13dJ9zt+VKdL70czxfE?=
 =?us-ascii?Q?niVknjxZ6/4BsFKVNrSDyh+fCSJIX5K39rumOPq0L4Gh3MUWSemXtbKlAnR4?=
 =?us-ascii?Q?76I1XARvclAYXY/1wsOclNn3VS6JfmmgO+buJzb9Cah645Gz0yXkDU1rLTap?=
 =?us-ascii?Q?R+EQq4EzuAFlLK86zmeWTdMrqREVO1e5K4gh14jAmOctgZt4OIwvZVr+QnrT?=
 =?us-ascii?Q?ZHGJ9JRCCIZOAHu1by8qNkckZWnAvPMZJre+1ZEtxCxZZwD9urc+dnaI00YO?=
 =?us-ascii?Q?JqnvNEiWGpfnA54UNC4JO1bqyxP3LCDft6MKVtkeuDaVXXqHKROW7G2UdZUa?=
 =?us-ascii?Q?haMrE8Gk4jstqZdZy0pS9ZXq4pCh+V+FlWO73Q1z5TXoyeRpELGAj/JA3zfG?=
 =?us-ascii?Q?6/950tLsArM12KxxAi2GBeZ3xShnqYimaeaH/9i3A4wmX9+MkWaiSQlRF69K?=
 =?us-ascii?Q?HtTMIwd3+7LvFs13/+brRQWmrGCC1CLl0ArUT1eZNRZEu/PJgAKjUPa71ryv?=
 =?us-ascii?Q?iWwPALRIkAxF6BFJ1jmakz49lnGFAkuRgnfECNQRZ3vNCOQIaORLNy2LgSu5?=
 =?us-ascii?Q?2XikiGBOcbWbAV6/j+o8XtUUlCqUqf1/Cm5yJjUCd5S9ttZ/tLxjLiUX9eIH?=
 =?us-ascii?Q?daQjcilNMKZPcu0Z9s+0zjK0qiDUFELCTTx8SsBNNuE5gaQA8ipKTQCIew9M?=
 =?us-ascii?Q?LsbyruigL8+Gk92MALhzy+GhccV1y6EjxB9pCc5tQbBePL6ta9rhim3IlxfY?=
 =?us-ascii?Q?cFwZ8Nw09y/+dwktWlTMnrQ4cdHlF1FaxsAli0trKWcQQusOxyUbyckouRfx?=
 =?us-ascii?Q?tCJj61OOVEvI2iOeGm5k5Pt1Y9ArylXCBNhgto/0kQaYOjDLV0PF88mFHvWA?=
 =?us-ascii?Q?AkC6ExxXS41T5BjS7a1s+y0Nr2dkHFoenPhAtfax?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdacf9fe-6061-41f4-c157-08ddb4ca5095
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:58:38.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcmkPXb/PUZIVX7fZyCr8Jw/DymeTcR/0oF7ApStRw7II4VKrnzAW2ThFSFC/sRXw5Sxtwnsr2kFQNRj4sS2dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8997

On Thu, Jun 26, 2025 at 03:40:02PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> On Tue, Jun 24, 2025 at 03:45:39PM -0400, Frank Li wrote:
> > On Tue, Jun 24, 2025 at 09:54:04PM +0300, Laurent Pinchart wrote:
> > > On Tue, Jun 24, 2025 at 02:41:12PM -0400, Frank Li wrote:
> > > > On Tue, Jun 24, 2025 at 01:41:09AM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jun 23, 2025 at 03:17:37PM -0400, Frank Li wrote:
> > > > > > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > >
> > > > > > The AP1302 is a standalone ISP for ON Semiconductor sensors, which can
> > > > > > connect RAW sensors (AR0144).
> > > > > >
> > > > > > Add corresponding DT bindings.
> > > > > >
> > > > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > ---
> > > > > > Previous try:
> > > > > > https://lore.kernel.org/linux-media/1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com/
> > > > > >
> > > > > > Change in v3:
> > > > > > - Move sensors under ports
> > > > > > - use compatible string to indentify connected raw sensors
> > > > > > - Add onnn,ar0144.yaml
> > > > > > ---
> > > > > >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 151 +++++++++++++++++++++
> > > > > >  .../devicetree/bindings/media/i2c/onnn,ar0144.yaml |  75 ++++++++++
> > > > > >  MAINTAINERS                                        |   9 ++
> > > > > >  3 files changed, 235 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000000000..6b745dcf3fd3f
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > > @@ -0,0 +1,151 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > > > > +
> > > > > > +description:
> > > > > > +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> > > > > > +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> > > > > > +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> > > > > > +  Frames are output side by side or on two virtual channels.
> > > > > > +
> > > > > > +  The sensors must be identical. They are connected to the AP1302 on dedicated
> > > > > > +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> > > > > > +  from the host.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: onnn,ap1302
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    items:
> > > > > > +      - description:
> > > > > > +          Reference to the CLK clock.
> > > > > > +
> > > > > > +  reset-gpios:
> > > > > > +    items:
> > > > > > +      - description:
> > > > > > +          Reference to the GPIO connected to the RST pin (active low).
> > > > > > +
> > > > > > +  standby-gpios:
> > > > > > +    items:
> > > > > > +      - description:
> > > > > > +          Reference to the GPIO connected to the STANDBY pin (active high).
> > > > > > +
> > > > > > +  enable-gpios:
> > > > > > +    items:
> > > > > > +      - description:
> > > > > > +          Reference to the GPIO connected to the EN pin (active high).
> > > > > > +
> > > > > > +  dvdd-supply: true
> > > > > > +
> > > > > > +  hmisc-supply: true
> > > > > > +
> > > > > > +  smisc-supply: true
> > > > > > +
> > > > > > +  ports:
> > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > +    unevaluatedProperties: false
> > > > > > +
> > > > > > +    patternProperties:
> > > > > > +      "^port@[01]":
> > > > > > +        description:
> > > > > > +          Sensors connected to the first and second input, if no sensor
> > > > > > +          connect, isp generate test pattern. The compatible string under
> > > > > > +          port@0 and port@1 have to be the same.
> > > > > > +
> > > > > > +        allOf:
> > > > > > +          - $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > +          - $ref: onnn,ar0144.yaml
> > > > >
> > > > > You can't do that, that's plain wrong, sorry. There are issue raised in
> > > > > the review of v2, please try to understand the problem and propose a
> > > > > solution there. This is not what we need.
> > > >
> > > > After review previous thread, Rob suggest use compatible string instead
> > > > vendor specific onnn,model property. I also think Rob's suggest is good
> > > > because compatible already descript the raw sensor model, needn't involve
> > > > new property for it and we can reuse other property like xxx-supply.
> > > >
> > > > Your concern is that port0 and port1 have to be the same. Rob suggest check
> > > > at the code to make sure both are the same.
> > > >
> > > > I think Rob may have method to add restriction at binding doc to make dts
> > > > have the same compatble string.
> > > >
> > > > Anything what I misssed?
> > >
> > > The discussion died out in that thread, I didn't have time to reply
> > > right away, and then the mails got buried in my inbox. My bad.
> > >
> > > The sensor node does not describe a device in the traditional DT sense,
> > > as the AP1302 completely hides the sensor from the host.
> >
> > Yes, but still need some informations like xxx-supply
>
> That's right, DT needs to provide information to describe how the sensor
> is controlled by the AP1302.
>
> > > The DT node,
> > > and its properties, need to be interpreted in the context of the AP1302
> > > DT binding. Use a "compatible" property, beside duplicating a value and
> > > introducing room for mistakes, is misleading, as "compatible" implies
> > > that the node is meant to go through the standard matching procedure
> > > with drivers. Sure, we could use a "compatible" property without letting
> > > the operating system match it with drivers, but it would still be
> > > misleading. I don't see any advantage in using "compatible".
> >
> > According to what I worked with Rob, DT don't care how driver probe device
> > driver, and what they most care is how hardware components connected.
> >
> > Use "compatible"'s benefit is if sensor direct connect to Soc or other ISP,
> > needn't add new property. improve reusability.
>
> I don't see how it improves reusability, no. There is no generic code
> that will parse the "compatible" property for a sensor behind the
> AP1302.

- reuse one yaml to do dtb check. For example, new vddio-supply for ar0144
added. Needn't add two places, one for standalone and the other for connect
to ISP.

- use of_device_is_compatible(). Anyway need proptery to identify connected
module. Assume we use 'module'. The property name 'module' itself is
equivalence to 'compatible'.  But whole DT schema is base on 'compatible'
to match relatied yaml file. If use 'module' here, have to dupicate all
property restriction at two place.

  If use module here, it may face fallback problem. If new module, ar0145.
we have to update binding, code and dts. If use compatible string, just
need update binding and dts.

 'compatible's problem is that many people may miss-leading need a driver
to match it.

>
> > > Regardless, you should *not* reference the ar0144.yaml. A DT binding for
> > > the AR0144 (see below for a link to proper DT binding for this sensor)
> > > would need to describe the device from the point of view of the host.
> >
> > DT have not concept about view of the host. It looks like hardware schematic,
> > just descript how difference hardware components connected together.
>
> I don't think that's quite right. DT describes the system from the point
> of view of the host. It's quite apparent when you look at the tree
> structure, devices are arranged based on what control bus they are
> connected to.

This is implement phenomenon. From concept of DT, there are not such limition.
driver can grab some children nodes to send to remote async core, like m33.

>
> > > Here you need to describe it from the point of view of the AP1302, which
> > > is very different.
> >
> > what different?
>
> The sensors are fully controlled by the AP1302. They need to be
> identified first and foremost in order to load the correct AP1302
> firmware, and also to know which power supplies to control. That's about
> it, there's no driver matching the sensors, there will be no device
> corresponding to them in the operating system.

Actually, ap1302 driver create one device (maybe not necessary) for it.

>
> The data that needs to be provided in DT when the same sensor is
> connected directly to the SoC or when it is connected to the AP1302 is
> different, as you can see in the DT binding I posted for the AR0144. I
> understand your confusion as the hardware component is the same, but
> from a DT point of view it's two very different things.

I checked
https://lore.kernel.org/linux-devicetree/20240630141802.15830-2-laurent.pinchart@ideasonboard.com/

The property is the same. The only difference is that AP1302 have not used
all properties.

Assume in future, AP1302 can support over 100 kinds RAW sensor. It will
be big efforts to duplicate such property in AP1302's binding doc.

And if there are other ISP chips, it will become NxM 's problem.

>
> > >  Even if we end up using the compatible property to
> > > identify the sensor model, that compatible property would *not* match a
> > > onnn,ar0144.yaml. That's yet another reason for not using "compatible".
> >
> > we can add extra restrictions here if need. onnn,ap0144, some time later,
> > new compatible model onnn,ap0145 appear, we still use
> >
> > compatible = "onnn,ap0145", "onnn,ap0144";
>
> I'm sorry, I don't see how that's related.

see first my reply segment.

Frank
>
> > > > > > +
> > > > > > +        unevaluatedProperties: false
> > > > > > +
> > > >
> > > > ...
> > > >
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: ON Semiconductor AP0144 RAW CMOS sensor
> > > > >
> > > > > AP0144 seems to be a typo.
> > > > >
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > +  - Anil Kumar M <anil.mamidala@xilinx.com>
> > > > >
> > > > > Listing people as maintainers when they had nothing to do with
> > > > > development of a file isn't very polite.
> > > >
> > > > It is continue previous thread and copy from ap1302, If you have concern
> > > > I can put my name here.
> > >
> > > It's a separate binding, not part of the previous version.
> > >
> > > > > > +
> > > > > > +description:
> > > > > > +  AP0144 RAW CMOS can be use standalone with any SOCs, or work with AP1302
> > > > > > +  ISP.
> > > > >
> > > > > How a sensor is used is not relevant for its DT bindings.
> > > >
> > > > DT is that descript hardware. Many sensors have SPI and I2C interface, but
> > > > they use the same binding.
> > > >
> > > > DT just descript hardware feature, such as how many clocks, how many power
> > > > supply. All of property does not related usage at all.
> > > >
> > > > Some legacy binding related usage, but that is what try to avoid now.
> > >
> > > Yes, so you shouldn't mention the AP1302 here.
> > >
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    enum:
> > > > > > +      - onnn,ar0144
> > > > > > +      - onnn,ar0330
> > > > > > +      - onnn,ar1335
> > > > >
> > > > > There's also no explanation for this.
> > > >
> > > > It is just chip's compatible string, what do you want to add? Most compatible
> > > > string have not descrption.
> > > >
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  vaa-supply: true
> > > > > > +
> > > > > > +  vdd-supply: true
> > > > > > +
> > > > > > +  vddio-supply: true
> > > > > > +
> > > > > > +  vddpll-supply: true
> > > > > > +
> > > > > > +  port:
> > > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > +    additionalProperties: false
> > > > > > +
> > > > > > +    properties:
> > > > > > +      endpoint:
> > > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > > +        unevaluatedProperties: false
> > > > > > +
> > > > > > +required:
> > > > > > +  - compatible
> > > > > > +  - reg
> > > > > > +
> > > > > > +allOf:
> > > > > > +  - if:
> > > > > > +      properties:
> > > > > > +        compatible:
> > > > > > +          not:
> > > > > > +            contains:
> > > > > > +              const: onnn,ar0330
> > > > > > +    then:
> > > > > > +      properties:
> > > > > > +        vddpll-supply: false
> > > > > > +
> > > > > > +additionalProperties: false
> > > > > > +
> > > > > > +examples:
> > > > > > +  - |
> > > > > > +    i2c {
> > > > > > +        #address-cells = <1>;
> > > > > > +        #size-cells = <0>;
> > > > > > +
> > > > > > +        camera@10 {
> > > > > > +            compatible = "onnn,ar0144";
> > > > > > +            reg = <0x10>;
> > > > > > +            vaa-supply = <&vaa>;
> > > > > > +            vddio-supply = <&vddio>;
> > > > > > +            vdd-supply = <&vdd>;
> > > > >
> > > > > No input clock, reset signal, ports ?
> > > >
> > > > I am not famillar with this sensor, just extract from code. Do you know
> > > > where download spec?
> > >
> > > The datasheet is not public, but I have posted a driver, with DT
> > > bindings, to the linux-media mailing list. See
> > > https://lore.kernel.org/linux-media/20240905225308.11267-1-laurent.pinchart@ideasonboard.com
> > >
> > > > at least ports is needed.
> > > >
> > > > > > +        };
> > > > > > +    };
> > > > > > +
> > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > index d6f1670290589..1362d351f2574 100644
> > > > > > --- a/MAINTAINERS
> > > > > > +++ b/MAINTAINERS
> > > > > > @@ -1766,6 +1766,15 @@ L:	linux-sound@vger.kernel.org
> > > > > >  S:	Maintained
> > > > > >  F:	sound/aoa/
> > > > > >
> > > > > > +AP1302 ON SEMICONDUCTOR ISP DRIVER
> > > > > > +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > +R:	Frank Li <Frank.Li@nxp.com>
> > > > > > +L:	linux-media@vger.kernel.org
> > > > > > +S:	Maintained
> > > > > > +T:	git git://linuxtv.org/media.git
> > > > > > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> > > > > > +F:	Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> > > > > > +
> > > > > >  APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
> > > > > >  M:	William Breathitt Gray <wbg@kernel.org>
> > > > > >  L:	linux-iio@vger.kernel.org
>
> --
> Regards,
>
> Laurent Pinchart

