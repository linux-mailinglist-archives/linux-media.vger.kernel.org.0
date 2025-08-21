Return-Path: <linux-media+bounces-40649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D5B30240
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6275AAA0628
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 18:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3A2341677;
	Thu, 21 Aug 2025 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i+TBhSuj"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24FB78F4F;
	Thu, 21 Aug 2025 18:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755801915; cv=fail; b=JzxUCFLcIucr11Wu2F4KBYywTfePUhwlWW2xJENvEI/1dRnTp7/mmPkgzF4tpmEtOOrMssgNxDciOx1r9H43nN3O5KP32VjQijrDth/K4NeA85UFvlj8qW+CLxyWOFQsAmFYlvrOxqx9QnFZK2kqHEyJ3Qte+HAZo1luYYtciiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755801915; c=relaxed/simple;
	bh=tzqqq4H/lgYypr32agWu9c52L0fzprv8J1t1WbygvQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TPUErkUN1YDbMlfk/YVS/F8vgm55PkRbnCuBUM2QiS34XeILKuB8hHlHrPjHTKeluDw1tzr6Tr8HrsB3+WGZu4YsxBIKeRsuv1ljOKTlTLPvCDjXglQya+c/FEwqCh0Ag3SA5ACJEwUf+VN8evTiuj396SZwJWMw6f1uzeYy+bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i+TBhSuj; arc=fail smtp.client-ip=52.101.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xajdr7d/stiW2cZqHy5SUbz+GCV79YmGb3u8l2pjjlYngj2ASfsK2ZHx//HRyXJACYZjtJK/rrhyttDQ5h0mve55hISBQtdwYyy0d6xWWrpFlqTDvhfNZPW+1et0tRBilkhYxlKd114C38/F9tYSwZ7VOEudSXOHwTDkh9zzEfi4NRJDsWPPyyCUgK3e0Zg0r4JD235oyfbLtc/QSHKE+MMcyvklQ4gZh8erVzYQHfcendp3ELIfEnOaWXIncirPQCgMn4JGUbd6QO8CBWYbUG3t9KM3Zf6Lw3BpYYd9ErMeWFWSzyaUrVF/H+oJFDSzcoLbxuh0KFLkIZPG2QpORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLrXmQJL13ST37o/hMbOeTqe1R+uNBhZlL25gdSgNvo=;
 b=OvkErWmT9bVnhuMhQYGp1xfem7mqga81LT3TdODHS3qqlHLoyOekR/7UbcAeTxfFiPprDgueWMm4hd7ft0x6EHakAeqcWxOcPbCv/0z0y0X4eLVyeOplzuIYJecHnvRcIlGFe0srNa4usYJ2eZDLhbi4EwK6TFtOrmpWuyyQGDalHrnk1fX7ga+T/f1EkN3o3ML3/g+tHv/FJkw2Cm6/00ZBUQZz0KDcE9F6oHCS7D9ufXGmmNmBoNZba1+ckpEKTQ78ikzgQUoSdJFzVI+gbH9U1BjOkCryJt4G0N8W0GzEe/FkPAfJgN1vQD0VMqouqmUhKWU2SaxPzmCrUDa/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLrXmQJL13ST37o/hMbOeTqe1R+uNBhZlL25gdSgNvo=;
 b=i+TBhSujV4GrvRA4ghUtXQFru2+56HELCNBOOxp7rBxtXooNlGTEQMvAFH0pFEQJpD+0xpGu+2RyG0U7nREUtvTdzZGDscLn9Bo83eYMysC5q+9s6JuHlLhqkDPXEhNm5fvZELZKwUN363fgctOcMlte/TGabq281mF+/KYMiCvzSMI3UPjPZLNrrmZ5DEJYrcfPJnsU3IiUnKMYO1g2mmnLtdQeIAtD6cgnImKbqp1Fs2Tk19nMwwyWhoPQmXYmQJaFeh6rRzQlXTFY60rbZ+fCpWkjl6hvZ5BF80ySbv8TaPYuvX31cXfKNeGSWF/QPEf7vAwPZTtzhlFV1LMDlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7233.eurprd04.prod.outlook.com (2603:10a6:20b:1df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 18:45:06 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 18:45:06 +0000
Date: Thu, 21 Aug 2025 14:44:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/12] media: imx-mipi-csis: Initial support for
 multiple output channels
Message-ID: <aKdpKflFLgxX33T+@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-12-laurent.pinchart@ideasonboard.com>
 <aKdBu9AQfwxl8b4I@lizhi-Precision-Tower-5810>
 <20250821163025.GB29629@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821163025.GB29629@pendragon.ideasonboard.com>
X-ClientProxiedBy: BYAPR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::28) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf50ade-9af6-4e27-8382-08dde0e2d8d3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?drpy1lARPXQ2pPeXGUQ7V5SRYE7QUmR2uKzHOS1/tKIb3DcjjZXTn+e2CiRp?=
 =?us-ascii?Q?TMiScHA9d/LJBW0wXCyG4Tr//UBnzUzv15zmAqTAXNm1D8BQShE5G8S7MB5b?=
 =?us-ascii?Q?XcJGsFpSRE/wbxS6AbDKWQ34MUeQRqcGKkUTCWwhCqJCoaWasIi0KHO+andE?=
 =?us-ascii?Q?EKJ20rKziz/FiCXtr9GocqyqSa5OesLFF2rYPx5aT0r2LEOs73gw4JWvJDEL?=
 =?us-ascii?Q?+/rUGuhhcsSc/wSk7bMzgGyUv1/3Ej5JWZCcw/SiSiFAT8r0jfnbDBomjorw?=
 =?us-ascii?Q?OIcTTcNjRKelVDVMqZMEBjYgePXdfE1wRePK1uro9mmOPdjE6vJQMbbaP1uH?=
 =?us-ascii?Q?d8J/YIkQ6ntgF3q4SHUN82EkwvvVkArXnwZ9MAIZiLqVUN+BomMXIKVNbc+0?=
 =?us-ascii?Q?puR3p22gKxE79hVHqJSZytflT2cBuLy/0TrVsM2KC1hbndfNCehxppG4UhnT?=
 =?us-ascii?Q?CmZMIrGM/d0AQksUu2BSSJAlMLn+1i+QZC5aNguxYT0Z+dm+bkylNxq7xL5D?=
 =?us-ascii?Q?xSpOWnowyjdb0e5hbNPtJKl2yVh+2fChbDw8I8uU2u7HPHvw94KFKLz+0IsP?=
 =?us-ascii?Q?LoTeq6JDLy0qQq70/VFDny8tDHOJmUj1oN01y1/wNij0mFtH3dHSsTNLhaxv?=
 =?us-ascii?Q?zwxcMvOCzhMe/KlfkWD+nxvuJ9NkJv2v1JoDHOSX10bcFw0ow4gQRkCcRCH0?=
 =?us-ascii?Q?RZEPx7F9dztrwiEl4jDfsoRJ+TB9vOraPEUW6mD2hPxI238W0nDg5zJvSxwT?=
 =?us-ascii?Q?DLYB0iCfQAtGUH3+8IiIVdoWkJm+DHtTg4wCyewuQuFW4O0F9dhj/Lv9CqD0?=
 =?us-ascii?Q?WR0R+afbLn5xoSkpe99j3zpUd0wwn+6KQc7UfZYeprnQRRigqvZL+zKhqLCN?=
 =?us-ascii?Q?2UHhMmXPqLorRTlGDpBnabQRQS/2U2uhXtf/ym4fNxmF9TUnafcKBLdVQCeV?=
 =?us-ascii?Q?Jy5aAfZqYUa7xWOdWLT6O6YW+v66zQrYTBVfGrwhBHwb6RlAOmQ3/yFgqqNU?=
 =?us-ascii?Q?aUY6pfTeVe8WIwIw3NCeXMSi/yqOr9WDYDlQ1DFzv2hSiDvMqW1HRmfMIUL6?=
 =?us-ascii?Q?ym6aG0aewCCHngeEqR+KeWsp8/hExrnqe1LI6bI7ecNqOFfMoRXG7IIM8lI9?=
 =?us-ascii?Q?YMZNVLjc14x9w/fQB3j8gXME2XW+GkXWeD/HuWY12gYQWz2UiHjTBkWm6Jdq?=
 =?us-ascii?Q?ZxMpwssd5dPs6zrY0jDVe8B/YisMj6CbNYY3gb/+BxYvaIs0PBTSlQfFi8a0?=
 =?us-ascii?Q?/sJj9lKFoh8RG/0zI/phMpozva6f3zXt5rTElCtviMxD5QAhmJ/yap4kuv0A?=
 =?us-ascii?Q?b7f18miM5qn/u1lXIaCWdL6vWmO6H2rwLxHq9uXlk8/oQduQhwQkiRYoMXMx?=
 =?us-ascii?Q?n1gNo7GyUIadzyWebMwywqyFyfqaxDAaT2uRJpcVGAI3L4uKujD83BoIn/Cw?=
 =?us-ascii?Q?PQcJuLw3tUyLbw0tFKeYlejr5/fQ+bJaIrcUXR+uQ4Y3kKz1bnne4A=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uDwQ92B5ymFZWMfkDTEfUxmNck7xzFktTjY5RQYWrzFYrUKjAq2c2autffY6?=
 =?us-ascii?Q?Wr4njyPZ2SK+CtpUPRcZoektiOE+8r4qeqqlSauVFOggyeUEPhz6oJTtzeA4?=
 =?us-ascii?Q?SeyZm8plXkEufFbYuinDRrSmq34gQMO7NuwRlYs9wa0N/Ux9V47g+HWStjUD?=
 =?us-ascii?Q?TtpFcTCCSOZKFC3pEiATlpFq8IKAD1nJg2ZxH9xGr1jVZCEhPsItzIzanDw3?=
 =?us-ascii?Q?fn00PuPMPhCzL8T7BfTiSczZU6uDLErvWYBu49SUBE/Co9pBB625/mTwsvNo?=
 =?us-ascii?Q?ldb3LOqQmdNZv8j1ofbVD5WhzbYhzHTeY4eaj4808WoSlLsTc425e2WmxBBE?=
 =?us-ascii?Q?ibNe+IcCYo3dFRwIR3sZqK0yiMms44gMH+AYxnw0ZuyP9hE4e7VrHvRc/zjK?=
 =?us-ascii?Q?BVPBMTqKBNaxZW4GRzvAF6aB+bXUeM2z+Efsj2GPXhlq0XIZ1cKU7Mjf1mpR?=
 =?us-ascii?Q?GrlHQyyotLdSj7+d/TsOtEtFWhda4ESsh5b710Il7ZqhJUtncSFeZiEhZWRP?=
 =?us-ascii?Q?h2oGNvHavbJ08BsFk1y9Szw2eLZIhplgucxTZI9GCCE3hS80pyIwMbQnebtA?=
 =?us-ascii?Q?M22p3JJkzzTIf59Dyj5WFrZecYtI38Oa5d1uFW639uO9SbV5n7K9HE4aQnYa?=
 =?us-ascii?Q?t7Jh4AFyse2unHEPSZypq+MDoup1gyIP+1xFlJ8eJ9fmnw6SyV+CoFOglZwv?=
 =?us-ascii?Q?qO86nI8vRasx7eXTEf+ks6jmhe2nplPejyTVKqpASdYBif/b/qo/VbkuJA7a?=
 =?us-ascii?Q?WdFUSukRZMoknV40pBv9Ao1AkupxeY3EWAwZ94pgIFvv8HvG4+oYM8RDMVCi?=
 =?us-ascii?Q?bIdIFcfitAB1XV7Uc6cXpFW7Ee5auovLbC75goirDQLSO8SE/0bAEYtKZgJD?=
 =?us-ascii?Q?W3yD3f0Dab5ilrzQ0dOnEzeduaRZiO4NGXInZX21UMZqFCJRSpH9gJYsIwPN?=
 =?us-ascii?Q?ckWDXLtlMBxoOhLBjnG9o1WMqrxmzRO5xOJN7EhqtSodvJIEw/zxQBb9/FkX?=
 =?us-ascii?Q?9bkYk7O9J3AQeZlMhyABW2PBtMbLlLghP9qs0fGGEZZG1sKvdcqun3H048zA?=
 =?us-ascii?Q?ZzeN9n0CKUabSYFqKxCDMSSgt0cd1V6TOzYpxNHSJWelVdmKy1NahwmU1b7n?=
 =?us-ascii?Q?qU0vWBH6b6N9txJTKUjMcmLyyRU+Ob/WreflcBlrPoF2+JaAvEbR8GIokMhc?=
 =?us-ascii?Q?sr0ekScTCaokPm0lhc3nmokas3xR6xNE1BrfwXFnkn+GI4qJkhTCHTAhgFHV?=
 =?us-ascii?Q?giVjoaookjoRnh6Sn+3Jzy2QZKvEHoxiMDMmmE1uaPsf2XeSOIYsEI9w+wLX?=
 =?us-ascii?Q?7TvKIYzA+zyw+1/XHO8+Y5RcXcIAS8s0KUjaqqQVVCNzbvh65qlTpdhqwYH1?=
 =?us-ascii?Q?4XKmH8oCo+UtLvPkMWMq/m5XsJD8Hkj3ZpBgSWWwXF+n49ZewD+H88CxvQx6?=
 =?us-ascii?Q?cwxLsDUpgKMLXDRO/hptSwqNMW66v8GCZEenuiHq1i3fIW+kti0K2gnlvJjY?=
 =?us-ascii?Q?76khMXrIdjfWrYHpf9uS6vxVjGTllxdefd3cd/LxURQLgZCFQ7F1Sg8Gyjro?=
 =?us-ascii?Q?NUHGS61FmjQRrOKd5jANFwfEqZ2oVUdmPmcwZoXN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf50ade-9af6-4e27-8382-08dde0e2d8d3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 18:45:06.3044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Hg+c0m9/qEgoVAlAd/uBVvRqJrPSHms0B4Ds+8TFfmhl0yOuUCuSQ5raPYF1kWRZtPiETnyXouhXB/XUo6KTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7233

On Thu, Aug 21, 2025 at 07:30:25PM +0300, Laurent Pinchart wrote:
> On Thu, Aug 21, 2025 at 11:56:43AM -0400, Frank Li wrote:
> > On Thu, Aug 21, 2025 at 03:09:43AM +0300, Laurent Pinchart wrote:
> > > Some CSIS instances feature more than one output channel. Update
> > > register macros accordingly, parse the number of channels from the
> > > device tree, and update register dumps and event counters to log
> > > per-channel data.
> > >
> > > Support for routing virtual channels and data types to output channels
> > > through the subdev internal routing API will come later.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > >
> > > - Update more per-channel registers
> > > - Update commit message
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 239 +++++++++++++--------
> > >  1 file changed, 152 insertions(+), 87 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > index 83ba68a20bd1..b1136336a57f 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -54,7 +54,7 @@
> > >
> > ...
> > >
> > > +	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_START(0),		"Frame Start 0" },
> > > +	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_START(1),		"Frame Start 1" },
> > > +	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_START(2),		"Frame Start 2" },
> > > +	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_START(3),		"Frame Start 3" },
> > > +	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_END(0),		"Frame End 0" },
> > > +	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_END(1),		"Frame End 1" },
> > > +	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_END(2),		"Frame End 2" },
> > > +	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_END(3),		"Frame End 3" },
> > > +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(0),	"VSYNC Falling Edge 0" },
> > > +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(1),	"VSYNC Falling Edge 1" },
> > > +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(2),	"VSYNC Falling Edge 2" },
> > > +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(3),	"VSYNC Falling Edge 3" },
> > > +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(0),	"VSYNC Rising Edge 0" },
> > > +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(1),	"VSYNC Rising Edge 1" },
> > > +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(2),	"VSYNC Rising Edge 2" },
> > > +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(3),	"VSYNC Rising Edge 3" },
> > >  };
> > >
> > > -#define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> > > +#define MIPI_CSIS_NUM_EVENTS		ARRAY_SIZE(mipi_csis_events)
> >
> > unneccesary change for this patch
>
> It's meant to have the same alignment as the next line.
>
> > > +#define MIPI_CSIS_NUM_ERROR_EVENTS	(MIPI_CSIS_NUM_EVENTS - 20)
> > >
> > >  enum mipi_csis_clk {
> > >  	MIPI_CSIS_CLK_PCLK,
> > > @@ -300,7 +334,9 @@ struct mipi_csis_device {
> > >  	struct clk_bulk_data *clks;
> > >  	struct reset_control *mrst;
> > >  	struct regulator *mipi_phy_regulator;
> > > +
> > >  	const struct mipi_csis_info *info;
> > > +	unsigned int num_channels;
> > >
> > >  	struct v4l2_subdev sd;
> > >  	struct media_pad pads[CSIS_PADS_NUM];
> > > @@ -655,8 +691,8 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> > >  			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
> > >
> > >  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> > > -	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> > > -	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
> > > +	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
> > > +	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
> > >  	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
> > >  	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
> > >
> > > @@ -673,7 +709,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> > >  	/* Update the shadow register. */
> > >  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> > >  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> > > -			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW |
> > > +			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
> > >  			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
> > >  }
> > >
> > > @@ -764,16 +800,19 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
> > >
> > >  	/* Update the event/error counters */
> > >  	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> > > -		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> > > +		for (i = 0; i < ARRAY_SIZE(csis->events); i++) {
> >
> > This is nice change, but I think it is not related with this patch. May
> > need sperate patch.
>
> I think a separate patch just for this one-line change would be
> overkill. Given that this patch touches event reporting, I'd rather keep
> this here.

It is not big deal. Generally, don't touch it to simple review.

>
> > >  			struct mipi_csis_event *event = &csis->events[i];
> > >
> > > +			if (event->channel >= csis->num_channels)
> > > +				continue;
> > > +
> > >  			if ((!event->debug && (status & event->mask)) ||
> > >  			    (event->debug && (dbg_status & event->mask)))
> > >  				event->counter++;
> > >  		}
> > >  	}
> > >
> > > -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> > > +	if (status & MIPI_CSIS_INT_SRC_FRAME_START(0))
> > >  		mipi_csis_queue_event_sof(csis);
> > >
> > >  	spin_unlock_irqrestore(&csis->slock, flags);
> > > @@ -850,7 +889,7 @@ static void mipi_csis_clear_counters(struct mipi_csis_device *csis)
> > >  static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_errors)
> > >  {
> > >  	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
> > > -				: MIPI_CSIS_NUM_EVENTS - 8;
> > > +				: MIPI_CSIS_NUM_ERROR_EVENTS;
> >
> > I think old code logic is strange. err events is not last trail of events
> > array. when non_errors false, only last 8 events have not logs.
>
> The error events are at the beginning of the array, and before this
> change there was 8 non-error events at the end. The code would log
> either all events, or just the error events (all minus the last 8).

yes, thanks.

Frank
>
> >
> > And I found all place call mipi_csis_log_counters(, true) in whole driver.
>
> Indeed. I wonder why. Looking at the code, I think we should only log
> non-error counters when csis->debug.enable is set. That's a candidate
> for a separate patch.
>
> > >  	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
> > >  	unsigned long flags;
> > >  	unsigned int i;
> > > @@ -861,45 +900,67 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
> > >  	spin_unlock_irqrestore(&csis->slock, flags);
> > >
> > >  	for (i = 0; i < num_events; ++i) {
> > > +		const struct mipi_csis_event *event = &csis->events[i];
> > > +
> > > +		if (event->channel >= csis->num_channels)
> > > +			continue;
> > > +
> > >  		if (counters[i] > 0 || csis->debug.enable)
> > >  			dev_info(csis->dev, "%s events: %d\n",
> > > -				 csis->events[i].name,
> > > -				 counters[i]);
> > > +				 event->name, counters[i]);
> > >  	}
> > >  }
> > >
> > > +struct mipi_csis_reg_info {
> > > +	u32 addr;
> > > +	unsigned int offset;
> > > +	const char * const name;
> > > +};
> > > +
> > > +static void mipi_csis_dump_channel_reg(struct mipi_csis_device *csis,
> > > +				       const struct mipi_csis_reg_info *reg,
> > > +				       unsigned int channel)
> > > +{
> > > +	dev_info(csis->dev, "%16s%u: 0x%08x\n", reg->name, channel,
> > > +		 mipi_csis_read(csis, reg->addr + channel * reg->offset));
> > > +}
> > > +
> > >  static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
> > >  {
> > > -	static const struct {
> > > -		u32 offset;
> > > -		const char * const name;
> > > -	} registers[] = {
> > > -		{ MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
> > > -		{ MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
> > > -		{ MIPI_CSIS_INT_MSK, "INT_MSK" },
> > > -		{ MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
> > > -		{ MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
> > > -		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
> > > -		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
> > > -		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
> > > -		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
> > > -		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
> > > -		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
> > > -		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
> > > -		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
> > > +	static const struct mipi_csis_reg_info common_registers[] = {
> > > +		{ MIPI_CSIS_CMN_CTRL, 0, "CMN_CTRL" },
> > > +		{ MIPI_CSIS_CLK_CTRL, 0, "CLK_CTRL" },
> > > +		{ MIPI_CSIS_INT_MSK, 0, "INT_MSK" },
> > > +		{ MIPI_CSIS_DPHY_STATUS, 0, "DPHY_STATUS" },
> > > +		{ MIPI_CSIS_DPHY_CMN_CTRL, 0, "DPHY_CMN_CTRL" },
> > > +		{ MIPI_CSIS_DPHY_SCTRL_L, 0, "DPHY_SCTRL_L" },
> > > +		{ MIPI_CSIS_DPHY_SCTRL_H, 0, "DPHY_SCTRL_H" },
> > > +		{ MIPI_CSIS_DBG_CTRL, 0, "DBG_CTRL" },
> > > +	};
> > > +	static const struct mipi_csis_reg_info channel_registers[] = {
> > > +		{ MIPI_CSIS_ISP_CONFIG_CH(0), 0x10, "ISP_CONFIG_CH" },
> > > +		{ MIPI_CSIS_ISP_RESOL_CH(0), 0x10, "ISP_RESOL_CH" },
> > > +		{ MIPI_CSIS_SDW_CONFIG_CH(0), 0x10, "SDW_CONFIG_CH" },
> > > +		{ MIPI_CSIS_SDW_RESOL_CH(0), 0x10, "SDW_RESOL_CH" },
> > > +		{ MIPI_CSIS_FRAME_COUNTER_CH(0), 4, "FRAME_COUNTER_CH" },
> > >  	};
> > > -
> > > -	unsigned int i;
> > > -	u32 cfg;
> > >
> > >  	if (!pm_runtime_get_if_in_use(csis->dev))
> > >  		return 0;
> > >
> > >  	dev_info(csis->dev, "--- REGISTERS ---\n");
> > >
> > > -	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> > > -		cfg = mipi_csis_read(csis, registers[i].offset);
> > > -		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
> > > +	for (unsigned int i = 0; i < ARRAY_SIZE(common_registers); i++) {
> > > +		const struct mipi_csis_reg_info *reg = &common_registers[i];
> > > +
> > > +		dev_info(csis->dev, "%17s: 0x%08x\n", reg->name,
> > > +			 mipi_csis_read(csis, reg->addr));
> > > +	}
> > > +
> > > +	for (unsigned int chan = 0; chan < csis->num_channels; chan++) {
> > > +		for (unsigned int i = 0; i < ARRAY_SIZE(channel_registers); ++i)
> > > +			mipi_csis_dump_channel_reg(csis, &channel_registers[i],
> > > +						   chan);
> > >  	}
> > >
> > >  	pm_runtime_put(csis->dev);
> > > @@ -1422,6 +1483,12 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
> > >
> > >  	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
> > >
> > > +	csis->num_channels = 1;
> > > +	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
> > > +	if (csis->num_channels < 1 || csis->num_channels > MIPI_CSIS_MAX_CHANNELS)
> > > +		return dev_err_probe(csis->dev, -EINVAL,
> > > +				     "Invalid fsl,num-channels value\n");
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -1445,10 +1512,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
> > >
> > >  	/* Parse DT properties. */
> > >  	ret = mipi_csis_parse_dt(csis);
> > > -	if (ret < 0) {
> > > -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> > > +	if (ret < 0)
> > >  		return ret;
> > > -	}
> > >
> > >  	/* Acquire resources. */
> > >  	csis->regs = devm_platform_ioremap_resource(pdev, 0);
>
> --
> Regards,
>
> Laurent Pinchart

