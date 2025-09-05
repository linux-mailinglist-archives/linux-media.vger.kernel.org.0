Return-Path: <linux-media+bounces-41870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E70DB461E3
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 20:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1389F4E4861
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7DB31C56E;
	Fri,  5 Sep 2025 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nu0uZ71X"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C231C563;
	Fri,  5 Sep 2025 18:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757095876; cv=fail; b=txzCg500ukTsXcFz94uCta405QXJG4F1WpmjrYNn9fUDQuZSTdnjYKk7WK0inP5u9llqgHJOqrZb93xVqC1GrnAtp03rPJJeRoZ+BTiozhVFYWfp+d7hNvGwX/Demj0zi5pcgHHhz581UUUkpTIgd58AB5+wIklSLXXeYAMr+Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757095876; c=relaxed/simple;
	bh=Uudmn/mcutXQlwCred0W88SmgJz6auMxkVd5oe6B7L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eHOgYFrwJ02w+PchTR9+ElNsw1XaqAOqFnGoi0GAHPCOU46RcjBmsSTUmydyglbpgjcvrhfIFYtk7Ee6d0qdZaFeDdwsezm1RkyiFTsps0xivsO447LQtEvSDzu3x17ynqdaBNY+BdfI+zlYltiNMjohlCxIVGGER45lmse6Ehs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nu0uZ71X; arc=fail smtp.client-ip=52.101.70.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cd4/E1KGlbMlRPXTCKsw4GMCyBkZ4DHarmjHLU4F4gOGscwhL1qpYtQZnLWXZahrCtrc2ZAuv9gKwFOqoD5Hovg4+N5iiaiGF08cErM2wRpo/iD3yCJjBB/LAwMAe0ecsqtf+021G2VlscF9JSYoxxM1CzORNLgNxTQwSJIZRtTXCwn4Pi+XvPZObzmijg0MkEAvtCVATqHLDAZg3gCwA5cb1aKFHVJNUcCNm2PbeVD2ZLPjvR0OG3PvRsZhtb0C1BUxJC0UgruqXoha+AbR7R8ekF7mL78BhL2QqTa6a347Rv9vNdluaBZoCtw4qk5rN7W/mFWrQEIKDJ4n04chbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOYja64ZTpKbUcSWk32uoP9Y2b8KxWv3Bkn61BGNsMM=;
 b=kAF3qpg3LERg0AY88PTQxO3mcrjsdA07LOrh+B4uYjTc5BDh58ZUBt0m2FWmR/PPBi2vEFHICoMiBz8OC3n0XdXz3XyOdJD9JrsNw6x9gD7yJugFZS8Z/rZ2EkxfwpEdEIsRE2DQtsoI+6m+t/YGixDPpR57inVyUq299hGX5GK9N+IRbv3WqiBziik5/GCI3xsQNLdM5YJTYt1/5wQfmtfyjHKr8hxKuoCi+wHgeus01v1CMtRqpuD07Twm063VNOjKG3gYzc/NztyIYooZwCOI3VmEZYJG/Ry8nZqzm2MxTPmwjVcTgsTLIOT5WROzpCihLmXFpNXK8H7667DOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOYja64ZTpKbUcSWk32uoP9Y2b8KxWv3Bkn61BGNsMM=;
 b=nu0uZ71XOeN1/t6VLjirNZk9K8ncMFkzio6jY/6acmOv9vgx/ZnYKAOG1wsZ43SrCh+JZm5MWYC7/pi9riaqS095jZ7/rFW+t0jL0EBbm+iMQV6AKlRiH6F2/ufytku0/LBY44tQcLyTj5fnvZMHGvx/P0ztb2dXhdtyj5ivgvKAml1gW6YDw3FJmefpyHTajoJAoyXyzRN7NnI0LmCKuAbDJ1PYLeg83tuGS44bsugfDOCVTrkPuOegL3tTHg8f7kPvJ7BgabLiaqv9xU4xCP8hnjp2AQlyfOa6VFXuShXaoBPuPxSvbrzwZAS690jQaqERAcZHtVcZmPYzykbndA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 18:11:10 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Fri, 5 Sep 2025
 18:11:10 +0000
Date: Fri, 5 Sep 2025 14:11:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, rmfrfs@gmail.com,
	martin.kepplinger@puri.sm, kernel@puri.sm,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, mchehab@kernel.org,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH 1/1] MAINTAINERS: media: nxp: Add Frank Li as reviewer
 for nxp SoC
Message-ID: <aLsntkMstrdDBjXi@lizhi-Precision-Tower-5810>
References: <20250904161720.514889-1-Frank.Li@nxp.com>
 <20250905160453.GA21773@pendragon.ideasonboard.com>
 <aLsRVWhK2mT32Kzf@lizhi-Precision-Tower-5810>
 <20250905163903.GB21773@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905163903.GB21773@pendragon.ideasonboard.com>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a0e1e9-73c7-4cde-304f-08ddeca7977d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xT9I1y76sMQGCyqLm2IDHgAASysn5tWSgjqevw2hv/ddwdk48VFVHCTVmo1K?=
 =?us-ascii?Q?NGxk25oa3AP6RN2vpzDPzAb+M/OK2R3mlpAmmiYkn5QErsGcdNmFSreoIEUF?=
 =?us-ascii?Q?28wsMb1aksKFnDY2xbDHcAC2HrBbk57z22kMYecGJ7uL5kBlk+qYQG/Dzs0M?=
 =?us-ascii?Q?8nqoesstIqq5Ed2AmaaekKBhLdiHHTA/gRu2+GBeJ1YSznWJE7eBZj8zKIxU?=
 =?us-ascii?Q?HMcFUv6PKQhEoMiUqsxPDKMECdssZGe0wZ3tdxFRQWA0DXIzR0GsE0XBM+4f?=
 =?us-ascii?Q?SaeTzSWnRfkSdptxCE2UkMgZZWQnnDUTdfzt+pLs5p5enqrSO4qfBjZfkLgs?=
 =?us-ascii?Q?A+qMx9Q/fQWC0/1BrT7rCsfFcPSq+TmpJlStlJwgqZ5dBlke3s8mxWmTPydA?=
 =?us-ascii?Q?AS2XsE5SzjR1W9fsq/nkOeVhL+3485R+MhtXjxW71wp7Yx/LghsE13NQRizV?=
 =?us-ascii?Q?fIPmTZlkiCZSYuxg3KOkjhX9MyALrDZDofcBSAWb/oPutNnGfYtFi7n9hq0m?=
 =?us-ascii?Q?1vmOBW3T9TjYZq1sc7RNznAAnFKPFJ/S16JQqMftSa/hgjKrOG7hxVIN23Sw?=
 =?us-ascii?Q?y6VIetHMEwjPPXPgxc2dXKRqSxPva3bY1CkYmdgWcVm/rulgfLnsM1IT5Nli?=
 =?us-ascii?Q?qJE5AbRGCM5YvLr02nX3c+E2ZyT6qGPctaeVz4IyL8nzSkIsf53oWusNmq0P?=
 =?us-ascii?Q?liZmcvt6TXw0fGBvu++CbMilkWrLCqm0mwx3LNKWO6vB48d58YVjx8CAuqSh?=
 =?us-ascii?Q?j+5eo8WGsA284NBTew2LaFC5wao7ilBUyBLT76947ajA3zs1j/mBnE08lu65?=
 =?us-ascii?Q?h24bR+krt5YS1OAt4YPmq0nHPprR8iqlzYzOrSoHQin7hl6wE1YR2YNikcEq?=
 =?us-ascii?Q?d79qfgsvza/cfwOMySR5j4rcQwPMzaYrpHSxqpMVTRM430mL3GRY3YhMmj5d?=
 =?us-ascii?Q?4O57ZSFY7Fum+0WYWvWa/1eluEDpRGzEnUbP336Dyroz9EEtlz6ExUfuV4Er?=
 =?us-ascii?Q?+AJytJ7cH/PSM+Z+Pg3w7YMq1OWsWL6bnGS0qn6eGAqpepRtJTGoWjlVBeTK?=
 =?us-ascii?Q?Y5XW3yqLvF6wLTQHMycO096e7mOxKVm3VoQImO7rL1ohhe8L9u6IwXQ9rPVk?=
 =?us-ascii?Q?+FD2JULt7nY2DsGaw2eF4QilEwdBfQWuqTpQLeGthys/GTlxCkDSx02k5X14?=
 =?us-ascii?Q?dGwomgFI8qUzju/IiHXwPN3CWVYvm8AB4mJAbNeDk9vhnq+4M3aeYk7J+oW1?=
 =?us-ascii?Q?pfatraI3VEg0mKen1yZmoww0Inng6Rrl/hRY7vq6ccCUq7ojrtcd8EJI6raJ?=
 =?us-ascii?Q?0Q1SniBsvan7WOUNAL+Ho4AuaR5aG9F5eK8w9an0EF8chc4wRxirSF8OKTji?=
 =?us-ascii?Q?u8XyIt077oqnN25P++hV0qkDNflS7baPd6K45+OajEqDN8ziugdoHc7Icp/y?=
 =?us-ascii?Q?3MIKkDVzt6gpBh4prf8pV4rmzW/pOnmT?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?y3uE6G24zygjk6ZOnnbiLlAiGrPmGGicurqTzDzARV/155pUAo+/IBzUTKWt?=
 =?us-ascii?Q?5iE/QyOnkLL2HBoPofn4RWxFKumuzbLMkhNpNIjQQMmyaw4aANsgGGkvaNyF?=
 =?us-ascii?Q?Vd44nPtUkNCtJ9zomIZCtWHgEjQknwn8o01AfCHGEuQS6JcLXxEfTA/64q9X?=
 =?us-ascii?Q?nHLzpAWxRxxVnIWgMPe3zYHznk7Fp66u85bP89EiiMWqU3H/2wcp05bDv+Qa?=
 =?us-ascii?Q?heO/5BnIvIFJ3zW8l7pEKcofWcrwANRBuIDBI47Q8B8E5UzhpWSDKLGADMFM?=
 =?us-ascii?Q?NBbyVTbS57KepWFKerVwfEvZjsE18va0wwXqee7hkAzWB8hqz3cNfymzCKUR?=
 =?us-ascii?Q?Gw1KrE/xcvRwE7LKhuyPdGZprin9ZvgGJD/5hZAO6kKmvOaQqtfY3Hg4Hp4t?=
 =?us-ascii?Q?3ixDAVxAEnmgQxfo60JmFvouhh0FpHW392E310nw1WhVkoNXZKYYvKrLudIb?=
 =?us-ascii?Q?+DR2iYfQYL28nq5QF3/oQw2lIeEO6KNWOxzyfJRqPIT0zlHOPzWmG2agyFDk?=
 =?us-ascii?Q?0yfZAE8IfFVx8Gtm6mx655vaAIC4kGni3lChexTUOZXlmnpeQs4C04geaRHQ?=
 =?us-ascii?Q?jMudmn4EvZv85UoWoXlSY90leLZ4SNCy+TqGxEEOi+Jov5qkXzsE4fCltS+F?=
 =?us-ascii?Q?e79vUz5XYE52It/+3dD4zMY2nfBz4I+VdnYT3qHoklfS/IOvKo7AWF1HntiQ?=
 =?us-ascii?Q?qkyScijD/cgrSiVMoF9aGDbFTcjJn7S9K6YKTwjQclPJfQJw5LNDHTtODEZr?=
 =?us-ascii?Q?mX5q9Hh+SteZrHVx86odg6ZS3faNzKV8mt20ZgywC9hDYdNmxSLoAZBAwyN2?=
 =?us-ascii?Q?YnDByGp2Nc2jf5WniPWfVIzVMfx2IOGjd4uBJbS3WtT5M9Djiut3WlF82gtG?=
 =?us-ascii?Q?lY0d0V2MpyfTwdnDhvBIskdIoehnP1XGmw/wWFZausb0n9jqAeo/AlmZgDpF?=
 =?us-ascii?Q?+/J+NpdbeGhfg78Stgd1cWNnmaUfGplSPOfC44BskywTDaVHJfxtQHTOPOOV?=
 =?us-ascii?Q?kk1GVetgHnmFOe/gyVfzfhBc4rLi3pKytTPqFiAc+Tz4j53EMK9g5sGaHwan?=
 =?us-ascii?Q?wsfVbvjZeRDHCi1Mcna+njaVH6Mz1oPpO2WFQlwvXTPxBr7bTgtB/1YSswsA?=
 =?us-ascii?Q?/MVh9SvhmeFA6W4/J82YhGtAJzIaCNqvDL1HE0VfUxPUWb1YISaa5v/eSiAp?=
 =?us-ascii?Q?Ma5YQg7cj1pKWPkPTzNyV6aHZPyWLo5wnpKRy+sZU1Z/CpHQPdLVuVJ6i/xG?=
 =?us-ascii?Q?2TUwcgwqKPJfRypOFj60VuSRRxmsjy0U6pSOlcGyKis78/tAfdD6V7DJBVGo?=
 =?us-ascii?Q?Y31qZcr//U8oCUB3mJABOnU9TkSYwMu/9GpHKA42jz6/8jlXUAqsIHAfbC+u?=
 =?us-ascii?Q?eOcadOKdVce8TS2QjgCQuINBx1PYdf7/cpkrYFvA4ZmHsvU0Q9ovrwrWP/U8?=
 =?us-ascii?Q?AxH86MghKfjBW7GNuersZk80pJQU40WI2hW2NZaXJA8nmQaOXm46U92p7rlJ?=
 =?us-ascii?Q?ffIhZzCuIw14OikxPKtoSBGrJtnzcdAWnJl1W8P22G/gmYvSZanjFwVHtNkf?=
 =?us-ascii?Q?7/K/aEOADiRWzAzSbBflJzYCFJm+wKnzU5A+1kvA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a0e1e9-73c7-4cde-304f-08ddeca7977d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 18:11:10.3804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKxOE+JvWr0tZvA9nkur2YDhNjvzJ3AxjNCVboJCoaEvyXtTxoKzi6QYILQ/d2kIXjM/STqJ7ZreZtGNGEXRNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On Fri, Sep 05, 2025 at 06:39:03PM +0200, Laurent Pinchart wrote:
> On Fri, Sep 05, 2025 at 12:35:33PM -0400, Frank Li wrote:
> > On Fri, Sep 05, 2025 at 06:04:53PM +0200, Laurent Pinchart wrote:
> > > On Thu, Sep 04, 2025 at 12:17:20PM -0400, Frank Li wrote:
> > > > Add Frank Li as reviewer for nxp SoC.
> > >
> > > Great idea, and thank you for volunteering ! I really appreciate your
> > > help with reviews so far, and I have already mentioned it in a
> > > conversation with another SoC vendor as a model they should follow.
> > >
> > > I'd mention media drivers here though, unless you want to volunteer to
> > > review patches for the whole SoC :-) Maybe something along the lines of
> > >
> > > ----
> > > MAINTAINERS: Add Frank Li as reviewer for NXP media drivers
> > >
> > > Frank has been reviewing NXP media drivers for a while, and is
> > > volunteering to continue. Add him as a reviewer for the IMX media
> > > drivers.
> > >
> > > Also add the NXP i.MX platform mailing list (imx@lists.linux.dev).
> > > ----
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Do I need repost it with updated commit message? Or you can handle it when
> > pick patche?
>
> No need to repost if you're fine with the proposal. I've applied the
> patch to my tree already to avoid forgetting about it. It would be
> easier if Hans or Mauro (on CC) could pick it though, to avoid sending a
> pull request with a single patch. Otherwise I'll send a pull request.

Thanks, I am fine with you suggested commit message.

Frank

>
> > > > Add nxp open source mail list imx@lists.linux.dev.
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > I am work on kernel community for the while. And upstreamed/reviewed:
> > > > cee06ca7a6748 media: imx8mq-mipi-csi2: Fix error code in imx8mq_mipi_csi_parse_dt()
> > > > 51ad3b570ea7b media: imx-jpeg: Account for data_offset when getting image address
> > > > 642b70d526ab8 media: imx8mq-mipi-csi2: Add support for i.MX8QXP
> > > > 382d53e9cefb3 media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings
> > > > 859278460faa4 media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
> > > > dee8521f69874 media: nxp: imx8-isi: Use dev_err_probe() to simplify code
> > > > 73a40554f979e media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
> > > > 60b8de2b9b4be media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> > > > 66ede6d71d4e8 media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
> > > > 2021b8d51cdb5 media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
> > > > 038d27acf987c media: imx-mipi-csis: Use CSI-2 data type macros from mipi-csi2.h
> > > > fd5b6cd730676 media: imx-jpeg: Check decoding is ongoing for motion-jpeg
> > > > f65fbf8c3d671 media: imx-jpeg: Change the pattern size to 128x64
> > > > 7500bb9cf164e media: imx-jpeg: Cleanup after an allocation error
> > > > faa8051b128f4 media: imx-jpeg: Reset slot data pointers when freed
> > > > 46e9c092f850b media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahea
> > > >
> > > > On going thread:
> > > > 5 patches, https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-1-4dfca4ed2f87@nxp.com/
> > > > 32 patches, https://lore.kernel.org/imx/20250808-95_cam-v2-0-4b29fa6919a7@nxp.com/
> > > > 2 patches, https://lore.kernel.org/imx/aLbdRdS3TmLHjW+Q@lizhi-Precision-Tower-5810/
> > > >
> > > > I am volunteer to review media related patches so add myself to MAINTIANER
> > > > so I can get notified when related patches post.
> > > > ---
> > > >  MAINTAINERS | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index b3ca0ba848879..2884a5216b427 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -15327,6 +15327,8 @@ F:	drivers/media/pci/ddbridge/*
> > > >  MEDIA DRIVERS FOR FREESCALE IMX
> > > >  M:	Steve Longerbeam <slongerbeam@gmail.com>
> > > >  M:	Philipp Zabel <p.zabel@pengutronix.de>
> > > > +R:	Frank Li <Frank.Li@nxp.com>
> > > > +L:	imx@lists.linux.dev
> > > >  L:	linux-media@vger.kernel.org
> > > >  S:	Maintained
> > > >  T:	git git://linuxtv.org/media.git
> > > > @@ -15341,6 +15343,8 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
> > > >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >  M:	Martin Kepplinger <martin.kepplinger@puri.sm>
> > > >  R:	Purism Kernel Team <kernel@puri.sm>
> > > > +R:	Frank Li <Frank.Li@nxp.com>
> > > > +L:	imx@lists.linux.dev
> > > >  L:	linux-media@vger.kernel.org
> > > >  S:	Maintained
> > > >  T:	git git://linuxtv.org/media.git
>
> --
> Regards,
>
> Laurent Pinchart

