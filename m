Return-Path: <linux-media+bounces-35827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C8AE6F5F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 21:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE1DB7A7C23
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 19:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4AC1DDA3E;
	Tue, 24 Jun 2025 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fgK2U4UX"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD8422DF85;
	Tue, 24 Jun 2025 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792733; cv=fail; b=ZDrlVn/0uTYuCtA9lnmyqIn4PSlXz6xb3MCuTwkKPOhA6ON5N34tYmbyOMFt/R0SL7K7mGvvp3WUrIH+cliLG4Guifd/trws8/mFpH7lEc+7CmxKM9m0TUnpfm/mZZ30FUwWQtnz3V59Qp+Q6DtJ9ghaNiAmIt6XUJ+moM8PNeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792733; c=relaxed/simple;
	bh=GJl6O8Im0QLa0SKo0iUmPhN+DevzDp3qpwIeaOE7eFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j9FY8AwUTwh4PJfATTR9lVjqmO204UY2+AxD12o0Y9L0aCXR+s+Lr7N1qfMPVEhwcLcq9FFi5xpNNR8F5+yfPVSMJp13fBxvC9MIai7N3GLREljLUDU9Puh6Jm+m006ignvZvMBSc0T0BdfjSIalRRZoVnfBQ8BCV6cFArXHxTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fgK2U4UX; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfaxScWDpiorXV0V1JTGsb6xoaEO8m/z1zmrakFZ2yz5uq7iImqxGLNPEuDA55Md/L7udSx/lSeEPLzmJyP0Z0uVCqWmUftKVsXaxhxpU7/rBhIDFdtrg5M79PjiJxLgtCY8lk2fgzVZE8GdvX8FOH8o/4PgehaY1FzwbDMhf/R3oeZn64TDGZvamSt+kcPANDew33fyVpzQL7GM0OenBVQVUsqJzHbSaoErDOTPb5oQN9sFNOyn5FH39CAffpDRLGi9Exzdlq90rH2+CggcE+1JFHXFrOAjpkNqVEWj6mza5SkkfKxTb4U2jv9VZaFVjJ3edml7NtWRg4QJi3slnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QOltGaaUgaX+KwlxcPupw6ora07avFyhtGWzZEIp5Y=;
 b=LZ4u9Cyy189ei6E6LXZ4wMor+CZ5hpSTNRfaod5f9U4TV+SWZAoxuxATOoAgTOvtchytfRyVxP4wMZpuYG0TUBCKZz4aiqrYa/DCbK6JbxFgIGpie2wdGyCglHJ5XLcGBMukDwH/XDrcgWkQ+sP3DVV0sHZUzR9pwcbi2yURJ7K1z+hs/fuXOd9Lx94xYxVb9QJrku5KFfW42unBVZNOqywFuolfEoOlN1YHa3rfpqsk4M2NfAFGfYLifdpDG0SLKVfoyK6ScSu6zuUQeJFfa91dNsicqRVmzHhmFM5qsCqJaD/IKvQduVCq2wQjkHdOvea4Tmumy6k6DQdQc8pA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QOltGaaUgaX+KwlxcPupw6ora07avFyhtGWzZEIp5Y=;
 b=fgK2U4UX4DHIfAEI/ekg8Q67b10xIP3aw8slIEXxfiz70oNKhlzx8+yMhnqfhui3NidkKcJhxYVfPTkCraVlmGOUbm+5XeYJOv2FOCGAMhYzSBfpw2+C3KhyTJDcTqvub7b4/weHfU4vbaq9qIGa0OPE7MihNOmY+DvuGrtCEaiAQnvZwLn7qdaYCZP8OawBKfzcAZFkX5WyavbGtK6AvptnvgPQGm3J5KSQ7cZhfPXXiaOnCHtk+ZpHI1GtS2G1d0+DPcthkvAWPE3dJwAhrq3SoXfjf3zOPKeSqWw2beHTZTUj7XSqnvneAJyTqh2M5QbmJnT97X9N9+Ja6p10BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 19:18:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 19:18:47 +0000
Date: Tue, 24 Jun 2025 15:18:42 -0400
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
Subject: Re: [PATCH v3 2/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Message-ID: <aFr6Ehpl5Kk+nt7m@lizhi-Precision-Tower-5810>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-2-c9ca5b791494@nxp.com>
 <20250623224701.GE15951@pendragon.ideasonboard.com>
 <aFryrpyDByI6wu5b@lizhi-Precision-Tower-5810>
 <20250624185643.GE20757@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624185643.GE20757@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM0PR10CA0118.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a33a64-1612-4dd6-84fc-08ddb353f1a4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?liiYoN3iQZx9IA+Gw3RjwSOgXqMWEGa5S1RF2wYHRlg8X3JbVo3YjxiFApEs?=
 =?us-ascii?Q?yuK0Pb+YJwMaqXyvagNjuBkrw1JGwU7VzhMi+Z+P5v/Vs0Oy7B2AOnrTWXNV?=
 =?us-ascii?Q?i7noYVT24ZWOq1ulGRu0m6ODXgRMvbJNX5847qHnCoo/T0LDRX7ewRNq6GKS?=
 =?us-ascii?Q?NoFnLk9jfH5/ocauco3/wNkViZxLlvQA53pG9FGSHZXr2yOLJ1RSqQHIAfST?=
 =?us-ascii?Q?pffdiLQgVricXE11qVEVzGhXtHFylA8zFSVOK05hNFKrv8NwH9Y/MHjLrpri?=
 =?us-ascii?Q?tWYSta7cTRCcgruthvO6js/H6ODLnUN9vlEFCqdMp965Njfky7HsbxgNFSUq?=
 =?us-ascii?Q?TGlEEJ0Fj8HgW3/oTiVYwlMy3IwjHwLJP68ABbxCD9ZHrd3i1PbIBSO48ady?=
 =?us-ascii?Q?jstZrzXdcBiTahyqWbY3TzTq0vMBCY7Ou75hVy4kDAz1MJV/HqLaanw/4ev8?=
 =?us-ascii?Q?yXTTtOFC8LHK2O6acXQMFUmqUwCGvN6jQBEdjYKh+lZMdPDpQ1p2VaP3kkgE?=
 =?us-ascii?Q?xnWp2P0BHxvJs+bTdMEe8PJNzE4kn6m77MafS5OP/TDnOyojAL6GhJac1bZ9?=
 =?us-ascii?Q?YMO1Kch5IJ1z/1gx+7OFJp/9OMnfTsB3WgB2eu1O46mHcqV5rQlmNBMHnxBI?=
 =?us-ascii?Q?jUl15O9jFtmhI0t2FPmv2dUezC9E050RMeufDv+6QmFL0xiZLSpLOLk3F6QJ?=
 =?us-ascii?Q?ditGLAiBEODwU8yj7hrgGGSKcYrV5C7pt/Cgy2Xx0m3NH9Sb6WEj0fJozFrN?=
 =?us-ascii?Q?o2td1XZBZNUi8rEIhQoLa/Oh/ZBPEqA56uYtWQtJ8mkUVhKqEO9u8Ugof+XB?=
 =?us-ascii?Q?i4Coosy4mSScjdGWkdGo/UqAvWYECsdCahiVlavkjCWG2pqdC/pZbLhOwOSz?=
 =?us-ascii?Q?eN9MLZBYHTWLLTrduxNHfDaszXeAK+zGAQg6v/HXkS57qJHQekVIZYv27Ki1?=
 =?us-ascii?Q?HPoP8sbG0+nf3I6839m5SajmpGbYFhyks+1aQX6ryIQLt1P6fwn2gPH6ZZt+?=
 =?us-ascii?Q?ngcUBZu7q/q1iC1aaDFNWvvqNjggSf4IGH3Z13cfsmhgPnHMj8+V76YwTwun?=
 =?us-ascii?Q?o2fwBu1QLd13jxMyCszuXv7XCkowWuWtZQrkxbnC4EFOsFzROEM+OLyXJxSt?=
 =?us-ascii?Q?Ot5yStncKrQHqK0m/U3zAU/KiHSMVsKDS1mipY+Y8n1FxbC4AKaJNu+LMGar?=
 =?us-ascii?Q?PyjRH2sWzs2ul23jnojCecbTtBYenjdKP00+Af3g2b3IHHxC9l1FW0PmKQQi?=
 =?us-ascii?Q?Xvzaen1tG8lea1IGIQ7Ht6Wo1JYGRqqFu2An+g8kfkuKcvSIZbGxKasgr3kr?=
 =?us-ascii?Q?HB99pcN95yes+njwa5s1DobNBQHYjdVcWCl6Q8BJd7kNRuzAugOfsZ6q4uz8?=
 =?us-ascii?Q?pAzxt3jkSN7KUHRjd5NRGWcivF/rgb/9WYzCVRI/Y6SFecWlYsb1Dch6LKQe?=
 =?us-ascii?Q?saLYH32f6jWu97UZyyhvlN6QKc4JrEk8Wr6eKaxsNjgg/DoyPNqZIg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?68kS2aeS+llf5KKiODTrZq2BsfTjfVL7ZZsByvsZzW3MxNxaTgj37c8aaDFm?=
 =?us-ascii?Q?J/yv3QMl5pi1pbQXlx+0NnXcsDO0ey0sodCuqlIfBHU9UrQhAJ16AfrgnWuu?=
 =?us-ascii?Q?B8xu5yatKLguh67eg0xnm6VUX+hsueYLMkpDqK16PGu8HPqBQT6fWRkLYpWy?=
 =?us-ascii?Q?gEkItvp5SS7KEd9Yr8Vhnts4DDd8hLiF976Nxrh24p43fYoxHNdd5dS71ues?=
 =?us-ascii?Q?cLp+boP0oHyVW0p3IRQ06d6zvv6/b41qDOM5WrOuyTVbnBoI8IZ+RuMUgf5C?=
 =?us-ascii?Q?pk9cPY9lL+VV7t1gWmvKMOpzqhAunk4w1c2Utv/qctk7xMvLh2wkxpL7TEaL?=
 =?us-ascii?Q?KYCxH2bMfwn1lXkS/CD38QtNs011KF+mWcTVLxiA5zW1jxIYDPRH24xShZZB?=
 =?us-ascii?Q?Yytj6TTd1sM4O+wdjTbqisc2PzFCKJ5/DolW9IPX95kG9FfZu2MkqsNpUe72?=
 =?us-ascii?Q?31Ehq9fNF/KyJQ3IPptcHC8CczPdBPPAAj0m3j3VhBIS/w0UYPc+M1d0rGVl?=
 =?us-ascii?Q?4KhbBUmbiIljNMLdASMQi6G5SX8kSl/GLZlycgGepds+QKqcakVIEJK4Fx34?=
 =?us-ascii?Q?4FcrSIbqW6WY10hCycOp8COoA5tI3D38uybt2slFCxLoaXCQOIlO3xOREM2p?=
 =?us-ascii?Q?DcXucy8FnZw/VwM3RCqvQTex1n+CcCjC0UvT7Lmy3fd/bmZDs22i9A1b9RIE?=
 =?us-ascii?Q?X0x1uAtauqI0EKd0iwALMLNhilaPyKNqkzHhwWoviaPc/uO67JFIGKxtScdT?=
 =?us-ascii?Q?YgZUbYBumMzVrpSUut95XRLRkyz/2LOSnDd9Z4UIEdO2yliz9uENtMWXGHJ7?=
 =?us-ascii?Q?ih59X6YeBntOsJC1naBC5A0ZrbY07UdVX/FuHL9rhtCWB6Iv1F7GNxT+rVW6?=
 =?us-ascii?Q?Q3qjAgK3f4c8bXR05vf7KJ6nRxHvHY2TNibj5sl8CKGTRNSYQyEH9DdQlZlM?=
 =?us-ascii?Q?d2xH5CKcHnaXPIZX1c+KOzYJzdUMmIw/5cWFAZW3BP9Wo7oXKAFcqotC57+7?=
 =?us-ascii?Q?01ZyFrsAPl7SFWA6Lag5MrNaJpi/19lAQYAmOuAtGsD1PGpYfmVckSOfS3aK?=
 =?us-ascii?Q?WE1Iyenu6933OsCIaqiftubuQdZiI1OR02+zLvKRoGCRwn6WPGYxH6COk6xl?=
 =?us-ascii?Q?LBANn7qTBU3XxlPePMf5Hi7jcnJpgd+G3QC/5fSuVdSGd3m2HHxoAepCOuSp?=
 =?us-ascii?Q?/5haEyKFFd17GXpH9PjLcXO9oSd1tVAMG3beM8nND6VaV5aZTpEZbPt4P9WW?=
 =?us-ascii?Q?RiAdEEiyCQx7tDtzJ1iRrjKyYLTlfsqIzZQIoZTvfmgfmxyRj5ZosGLbAkpP?=
 =?us-ascii?Q?R+sT5gd+K3Sy4+R2pSL+7M9AlDY8GNu2GIp6nbyEluaVidaFlXI1keXjjaqR?=
 =?us-ascii?Q?G4QDg5hrxRZM5yIuheFWYJGWBuErcyaiAj6CN8V8/Vqoxo/6x+r7hSR46/40?=
 =?us-ascii?Q?9ULeIgKH+wFOlfITWTb6/T1TEViHo32mugOofMNQUUHwGu9jULWQywgOXPzQ?=
 =?us-ascii?Q?r8/WzGCKzlQdKz5uCAaM22FnBZVyTeMeZfZizEYinPHLmohxo2AvT4juX7B5?=
 =?us-ascii?Q?sGd6zZY8a3yvfhJTYHsp9XOE1q8Y2+IfQEyvYh3c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a33a64-1612-4dd6-84fc-08ddb353f1a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 19:18:47.5683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrsP4T16h9XWFBbSi8/Slqa50sDCl9hRHIwHJT8KD6FA5dMMrK4sBNaMCYjJCotrvpqbrbc4KskrVDpLTMAGGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786

On Tue, Jun 24, 2025 at 09:56:43PM +0300, Laurent Pinchart wrote:
> On Tue, Jun 24, 2025 at 02:47:10PM -0400, Frank Li wrote:
> > On Tue, Jun 24, 2025 at 01:47:01AM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 23, 2025 at 03:17:38PM -0400, Frank Li wrote:
> > > > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > >
> > > > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > > > AP1302 ISP supports single and dual sensor inputs. The driver
> > > > code supports AR1335, AR0144 and AR0330 sensors with single and
> > > > dual mode by loading the corresponding firmware.
> > > >
> > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > Change in v3:
> > > > - add extra empty line between difference register define
> > > > - add bits.h
> > > > - use GEN_MASK and align regiser bit define from 31 to 0.
> > > > - add ap1302_sensor_supply
> > > > - add enable gpio
> > > > - update firmware header format
> > >
> > > One of the main issues with this driver is that we need to standardize
> > > the header format. The standardized format will need to be approved by
> > > onsemi as we will need to provide not just a driver, but also a
> > > toolchain that will produce firmwares in the right format. Furthermore,
> > > some time ago the AP1302 firmware was extended with the ability to
> > > dynamically compute PLL parameters IIRC. This needs to be taken into
> > > account.
> >
> > It is quite common when work with firmwares. Generally, it need version
> > information at header.
> >
> > The driver need check firmware's API version, if miss match or incompatible,
> > just return and report error.
> >
> > we can't assume firmware always align driver code because many user just
> > update kernel without update rootfs or firmware package.
>
> Sure, but that's not the point. The point is that there are multiple
> out-of-tree ap1302 driver versions, developed or adapted by different
> SoC vendors. Those variants use firmware files produced by those SoC
> vendors, and they not standard.

I am not sure if firwmare is open source. Most like not. We need create
difference compatible string for difference Soc vendor.

> We need to standardize on a firmware
> format to upstream a driver, and that standardization needs to involve
> the device manufacturer.

we need workable version (easy extend) firstly, when let other vendor follow.

Frank Li
>
> > > I want to resuscitate this driver and get it merged. There's more work
> > > to do, in collaboration with onsemi, and I haven't had time to tackle
> > > it. If you want to propose a proper design for firmware handling I would
> > > be happy to participate in the discussion.
> >
> > who is onsemi contact windows.
> >
> > > > - update raw sensor supply delay time
> > > > - use gpiod_set_value_cansleep() insteand gpiod_set_value()
> > > > - update use latest v4l2 api
> > > > - use ctrl_to_sd() helper function
> > > > - add ap1302_g_volatile_ctrl()
> > > > - remove ap1302_get_fmt()
> > > > - use guard for mutex.
> > > > - use dev_err_probe
> > > > - use devm_add_action_or_reset to simple error handle at probe.
> > > > - use read_poll_timeout() simple dma idle polling.
> > > >
> > > > previous upstream:
> > > > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> > > > ---
> > > >  MAINTAINERS                |    1 +
> > > >  drivers/media/i2c/Kconfig  |    9 +
> > > >  drivers/media/i2c/Makefile |    1 +
> > > >  drivers/media/i2c/ap1302.c | 2838 ++++++++++++++++++++++++++++++++++++++++++++
> > > >  4 files changed, 2849 insertions(+)
> > >
> > > [snip]
>
> --
> Regards,
>
> Laurent Pinchart

