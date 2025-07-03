Return-Path: <linux-media+bounces-36644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AC5AF6DA9
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 10:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEE6A7B314A
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 08:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FC82D29C4;
	Thu,  3 Jul 2025 08:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cMig6tFu"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813A02DE6E3;
	Thu,  3 Jul 2025 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532666; cv=fail; b=ZIl6Q+U9cthtTUz4+Ye5q5l3NH3cL02yz1PQSTfY85ByWrlVIBjex3i7ingSBKhnw7XWn7x+49MlIYqYW0Jw+tZCCRXgsxt2Bhe9PWj0++/uaobuiGCpOSAldsaXDbP7O+6O5mkNw2bZ/mAQsXSe8IRA7zSQj5dS1WP3kxpzVbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532666; c=relaxed/simple;
	bh=CpN5eGrc6RHahVczFpenRtKtUuZzwzoUo9uQmnvUR9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N8JlmY6stkcXyRfkMvQMMFaZgZQjCTS9SQ9lubzQlzu+izD9S+x1beUANJMq4vKmcjis4DnIEaSJ3HcoFbxIrt+WM/ksidhXJppigcbKdRrkcA0rJvgwJoP3Y+cg9tnFZR13lwmx8PaFuo8bWNIpHPlz6FBOpi8hEr6y/XVB4Oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cMig6tFu; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWOLrMzmBKuK/hw0mGyGfWaJ2T4URF3fSi58GUL53tlg4QnQzuz/HV6aN7WTpI6Np7vbBzkAmvJ9/lMR3xmEL8/CYbnSTo3HWAEMxf2Cu795uZeI7aHsle26BTy/mM1TUud3u3YEoFJvM+iJLaadiv0ePPm2PhQXISER8OPIeOSWTlbOuzYlG0x/QZpmy4tos/Ng3m6nJ1u2PdUz8A555XkH+BJWl1znz39dTntlf1ClyYuc9jSjbWZBkcRrpolkIUQRPXYrI6hd2bDHMHIG+i7HjmHGU/NVzOp+ZTHlS7TJRMfzgv8vMPtrBRd6kcnSbOL8jTDKxexoa1hov8/1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuSH/8Il1ULmtprn3CYejyozsb1mEksDd/X/RajVKTE=;
 b=OUXhoHv6Zrhp44DRGfegJ8joI24InT1lzOhhqoy7EWp7vhyjpoFz6vPJek+paozp9KTSMXITiGYbAwqwgOttHhFNubqVJ4ezlo5XF5ZV8av/gq9ymjKASXtIDZZErP11z2fLAqNE0L1PyvGLMfGmvpdcP9CjB60F2cpLoSBBD9qlbyUzW1PC3ZZkp2J7Q80dpc0IqFOOWpCJQRczV2pzpdYy+2cZv+voyZv8sdgLPgmZp/u/LZxKgC+RQIpM7DIs0BxdR/9W7d8+KmJq8WBhVBTyKlVtrhzhrH/A7q73UVuheV8M6zUJHb8Y2gN5EcBrXLUBA8zKk7+P9WKbKCRfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuSH/8Il1ULmtprn3CYejyozsb1mEksDd/X/RajVKTE=;
 b=cMig6tFuwZhSceiTYs8kbkDBJVtirBjPxmcO+XQHBiDD8NJz41abZAwZr/h/A3ldTQVMMcgPFq9XOrrth6lS0dLn6Iwz5sQX9cgvSHO8YHQR4iJq1SDV51Qr8ew8ARLSa70s5x2ya5zeiCUVqWTyWcCovgzZY8WuNV7o06Un8hL3+A++FBHObfATK2ZOXsn8eD47wYMNJ4wvJHcngJxDBK3f98GY0V/WygGq9/47qU1lceAHh4hDstOUOhHhXlg1jwYogSH2cRyMRo++yJVao2lOR52sUlQSVnTVpWvK/Txj5Y5O9Rhx3BUElavMuECte7Mr5+KQrPgFVp9UHz8nPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8444.eurprd04.prod.outlook.com (2603:10a6:102:1db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Thu, 3 Jul
 2025 08:51:01 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 08:51:01 +0000
Date: Thu, 3 Jul 2025 16:46:08 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, gregkh@linuxfoundation.org, 
	mingo@kernel.org, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, 
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/3] media: uvcvideo: use
 usb_alloc_noncoherent/usb_free_noncoherent()
Message-ID: <rvg5yvwij5wsegqclcwv4qnuim3mlohxpdgrd77d7mctxofbj3@r4d56gjavldb>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
 <20250702110222.3926355-3-xu.yang_2@nxp.com>
 <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com>
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 983be363-9ae5-49e8-3d28-08ddba0ebcbc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Zs05m7hpIn6bElz8UsrKKT3vbgiRUrXp3FwJK5tWNfgMc17bGlB/3jvooMmu?=
 =?us-ascii?Q?I84pOs6l5MkTqA5llR50yITiyDaImfz4BZryjrO4vH7H1ENUiB3+NC7Lt3JN?=
 =?us-ascii?Q?iAQYRAvdMh4ALUbF37R9qOZ1xGfhT/oBxXo3sj4RSDwM3VGbdZWZSGDcxEMe?=
 =?us-ascii?Q?03BVEK399QstQSoOSp0zdaudmHUtom8Ha5rwhN/xGo7jMETDNtV4tMaDn0ZL?=
 =?us-ascii?Q?ZrzfD1P01hWqTp5j7UUltswZZfjNI3puIRkTnMUQhbxNUbUkbUfugF19h1rM?=
 =?us-ascii?Q?Ueku1gudXMhMOBcXqVKGzuFGK4RC2tKdCn3Uhc71EIWJwF6/N9ju7CgZ+Bl0?=
 =?us-ascii?Q?vp9c0LHWnaopj/6EdP71SD+uiKkd4tBItlvdiXbH2rSH+48mibCQzsEcqxK7?=
 =?us-ascii?Q?zC64XP7mHtP5SsRWmo4/1d3lDoIRWtaSdVpgM/gycU6mXmh4GxEmdZgWViIu?=
 =?us-ascii?Q?OVlFmk5TxWYblGIC7D3xO8YiIvj/DdJV3ltymHF4AFqQ2aXQMXPa4vVKy4w2?=
 =?us-ascii?Q?algAv9Xvm0yXErYOPryQQaQQwol+tN/z2OJNQoA7KaZ9XgqyXkYvFOPcbpCe?=
 =?us-ascii?Q?DpTyx1i5HTE20rOVHNOaBEZ/DNaOfaMZlKINODMrjpomls0lcrCB+EMz0QeD?=
 =?us-ascii?Q?ZkndRp7/b2YMir6Qcf8vGwn4qaAGs3In4uJKeDWARAq5uUBBTIce7DncFHVN?=
 =?us-ascii?Q?+91iDTYTsxTO3sQIRZVdSUSw7kAHOP865EljA26VWZs91On4Ajmt5E6kTFQ9?=
 =?us-ascii?Q?1uma+Irx2t1eRa8J99Iyert+o+G1bj9MA3FklRpeJbz8UfGfNu2r6b+ahLhZ?=
 =?us-ascii?Q?gyWKszUdt8gYclupjzpa76/Tb2TJlYckM7VLIIVANchx5+sbU85kNTOTlVGM?=
 =?us-ascii?Q?2JOnn42jxsIFERexWZP67e/zTwZrdaJhMIOy+7dDOXcIhK+Ty13YvrFpK6eV?=
 =?us-ascii?Q?oBWhvjd0UjyXNoVhZyTJnu6d8181NW4yjJIxijqvr58Sel/5P5aC7VEDyiI4?=
 =?us-ascii?Q?nS6GV9iAWdZMv/eGzlQ+vAdDg+0zsko08xHbRrYXJVWL2TPykMOhgfhIDwOd?=
 =?us-ascii?Q?WpxVnlaA/OnMIHLdjgoHwWdo320JGOUSwtAA7x0Rvi9JhheaspDAeHKMCJ62?=
 =?us-ascii?Q?HPDIYQ9WX6/3ikChBKQAlc2tqDrCRwfYP34tUG1MMACNPlAFRpPW2A+6aKfN?=
 =?us-ascii?Q?BjIfYJ0tFG78LUen5sKlbdzcGB4M3Jh79zDpD8m/CHVyINA3+23kau3VS2uo?=
 =?us-ascii?Q?kO0EgmC0T/tMuO3TzUpnGON/yXdT1vjkh+zvWL++755g0ZDQpg/l4q1xDszi?=
 =?us-ascii?Q?jl1dM/3Br8athWLIxAI1O57mH83MRxk0j/HL+kPG1HoDc1KIymd2NWO4uayr?=
 =?us-ascii?Q?jucj3ErlPpvNBdoS3r8EmtNKSmZdmU5Bz+XkhMqeYphyZKGffqxuRrnYkExn?=
 =?us-ascii?Q?riec4JsbnJZVbwXWWxYCO2yG6i0Y7BYFolDLgBp8dvQ6PZcNCdcKAw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?n4Q9JH4/p6+ubM2Yc6kWiCl52E6NkFLOIqxJ8jOC8hN6nMUB5i4/gEbdQ4Pv?=
 =?us-ascii?Q?QY5cNiwNN4ksOv/VumDsK/M4KrTr5Ei+L/AG0mOiLay8SyXbzAL6CgJKGECj?=
 =?us-ascii?Q?gXQyjtouxw8jG2gBK52zTmkUaqsChFoNNXBmgy61y5aLP+P/UNwPjQ7kXOs1?=
 =?us-ascii?Q?Q4nj3g31kjKr23rQR8SW6qTcQMgLExodoVrcvFzHFHarsL5X6YfsnVADPBC/?=
 =?us-ascii?Q?xztDT8YrdbdnFKcU8Is250i/dkN/M8Wbp3pe29L0wVXg4z4b57uvV9Yep8BW?=
 =?us-ascii?Q?iwhWSW1pPpe6EHItQm7cU69iVoFPAeNraJws9WUqFyBdmusB0/KpuIha2lOL?=
 =?us-ascii?Q?2DoE8HCuDTnQzF4QcPL/1lpbY1LUomT824vaoSL3sUUD/sPP5ETA3ANB9zCY?=
 =?us-ascii?Q?3Hbg/sjowwjLIRSM2eWsTVPqvNKTzAthICfOBOqANROcI0+C48uRgNFytFvo?=
 =?us-ascii?Q?TLaK1FN7C1UBuaP5leDGXMzMI3NiruUZEOMLF2gAs6byE7dMVKtT65pnqhhm?=
 =?us-ascii?Q?4EtzCdqxhq89+10I/5QRIROUrpw3sbdBeGW3aKM6+YbBTc23mV6Gxj4u9SSx?=
 =?us-ascii?Q?TX/O5sst1dXBcapnZqV92Ckl5Owqs0Q2xHidpd+xXPmxOYv4GWUAfNRL/1lf?=
 =?us-ascii?Q?Mw2uNeuOcElOjv99GidLGingw8QeIlGym5lsjLskA+lCKhIGC1czSORMG98B?=
 =?us-ascii?Q?cmSlouK13DOPGEfdHcw3FGN+YfQeWIbVa0/zjdiGNrAmDAK47jLG7OJCZHlL?=
 =?us-ascii?Q?m0zB31ZJFZsTTi7UD7Mh2K4UUyaOkQjrbDkCLFFtNty4dgra1oMxdGcP14Jn?=
 =?us-ascii?Q?nVhetnG1v5Ee9JYoVJaDqbwudi/yCdpCAB/wQpBer+1qOXGD/WF864gVjLPb?=
 =?us-ascii?Q?jrewx45xTcLHKPNk3Gz8TVLUHgARC7BPLIyvZ99ATICTPC0kLm9YFE22Lrui?=
 =?us-ascii?Q?hKARq61lxsTeeeePcVusUYDAOczkx3tw095MHCVLCz7xVI3+oTGnSdRQCQVO?=
 =?us-ascii?Q?SxdrFvuZdQhEJrFKrNBY2Ro4Sp2QQ0CMSnzCsvh9I+vKLxQL9lm1D62SP1oc?=
 =?us-ascii?Q?VeksH1ragRWAGkcFRB/14USqpLO0+Y0E2oIXx/zYX0Ak4I3Muu94D1WUuSyw?=
 =?us-ascii?Q?zhcRPfBuB1oC+xFjCgqR4xRTdSxqklNw3VJ54KB+jxUwZoHjR0ajJGTT7nVD?=
 =?us-ascii?Q?+9JDDn1MdFSayyoIkBsK0VptYfTqWJQWtGYIpmGFhJg9raUZij3Y6Z1TlbzG?=
 =?us-ascii?Q?qN/U1so+TYPwoSWQgq8WRrnPdk4c1HBom14qxWeMq6eS0tv1lSdtbyT1uom4?=
 =?us-ascii?Q?/nNZ+4O7OVGSZAo6J7vr33TmX1LAh2ysNpbypIfv2DD+y6pzJQwCr3x61wp4?=
 =?us-ascii?Q?DQWkpdm/33RzUkwouAvjFP0JhA4GMve2XVCsrFbe41pReiis1rV9aI6DSQfE?=
 =?us-ascii?Q?rW8VJb674praC9UqcO1Ubs2GrSZL08vOS5Yo7BhP4bcMGBzNx/zjrknae6AE?=
 =?us-ascii?Q?6g8mK98Knvf/NUIemz0ueMuPYNUMz+ktVxQgr6w4Xk/YGg1NFUlo9XFBpZX0?=
 =?us-ascii?Q?aLTsTQ529agzOlwU98AKy7mJ9hUThr7daJ57xWH1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983be363-9ae5-49e8-3d28-08ddba0ebcbc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 08:51:01.6662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TJaxvMChxwvsf1rD/1B7LRYuhXE5VKDXpaUr0B012LLpKcga2NK85wPPA88hqd8K2irujp0QLZ7b2CCcrBDRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8444

Hi Ricardo,

On Wed, Jul 02, 2025 at 02:30:45PM +0200, Ricardo Ribalda wrote:
> Hi Xu
> 
> The code looks much cleaner :)
> 
> It seems that the hcd.c uses the urb transfer_flags to know the
> direction of the transfer.
> But the uvc driver is not setting it, you probably want to set it.

The USB HCD will get transfer direction from endpoint capability. So
we needn't add such info to transfer_flags.

> 
> On Wed, 2 Jul 2025 at 13:01, Xu Yang <xu.yang_2@nxp.com> wrote:
> >
> > This will use USB noncoherent API to alloc/free urb buffers, then
> > uvc driver needn't to do dma sync operations by itself.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v3:
> >  - no changes
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 56 ++++++++-----------------------
> >  1 file changed, 14 insertions(+), 42 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index e3567aeb0007..614cf4781221 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1280,15 +1280,6 @@ static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
> >         return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> >  }
> 
> The uvc_stream_to_dmadev() function is not used anymore, please drop it.

Sure.

Thanks,
Xu Yang

> 
> 
> 
> >
> > -static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> > -{
> > -       /* Sync DMA. */
> > -       dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
> > -                                   uvc_urb->sgt,
> > -                                   uvc_stream_dir(uvc_urb->stream));
> > -       return usb_submit_urb(uvc_urb->urb, mem_flags);
> > -}
> > -
> >  /*
> >   * uvc_video_decode_data_work: Asynchronous memcpy processing
> >   *
> > @@ -1310,7 +1301,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
> >                 uvc_queue_buffer_release(op->buf);
> >         }
> >
> > -       ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> > +       ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> >         if (ret < 0)
> >                 dev_err(&uvc_urb->stream->intf->dev,
> >                         "Failed to resubmit video URB (%d).\n", ret);
> > @@ -1736,12 +1727,6 @@ static void uvc_video_complete(struct urb *urb)
> >         /* Re-initialise the URB async work. */
> >         uvc_urb->async_operations = 0;
> >
> > -       /* Sync DMA and invalidate vmap range. */
> > -       dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> > -                                uvc_urb->sgt, uvc_stream_dir(stream));
> > -       invalidate_kernel_vmap_range(uvc_urb->buffer,
> > -                                    uvc_urb->stream->urb_size);
> > -
> >         /*
> >          * Process the URB headers, and optionally queue expensive memcpy tasks
> >          * to be deferred to a work queue.
> > @@ -1750,7 +1735,7 @@ static void uvc_video_complete(struct urb *urb)
> >
> >         /* If no async work is needed, resubmit the URB immediately. */
> >         if (!uvc_urb->async_operations) {
> > -               ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> > +               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
> >                 if (ret < 0)
> >                         dev_err(&stream->intf->dev,
> >                                 "Failed to resubmit video URB (%d).\n", ret);
> > @@ -1765,17 +1750,15 @@ static void uvc_video_complete(struct urb *urb)
> >   */
> >  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> >  {
> > -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> > +       struct usb_device *udev = stream->dev->udev;
> >         struct uvc_urb *uvc_urb;
> >
> >         for_each_uvc_urb(uvc_urb, stream) {
> >                 if (!uvc_urb->buffer)
> >                         continue;
> >
> > -               dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> > -               dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> > -                                      uvc_stream_dir(stream));
> > -
> > +               usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> > +                                    uvc_stream_dir(stream), uvc_urb->sgt);
> >                 uvc_urb->buffer = NULL;
> >                 uvc_urb->sgt = NULL;
> >         }
> > @@ -1786,26 +1769,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> >  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> >                                  struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> >  {
> > -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> > -
> > -       uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> > -                                              uvc_stream_dir(stream),
> > -                                              gfp_flags, 0);
> > -       if (!uvc_urb->sgt)
> > -               return false;
> > -       uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> > -
> > -       uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> > -                                                uvc_urb->sgt);
> > -       if (!uvc_urb->buffer) {
> > -               dma_free_noncontiguous(dma_dev, stream->urb_size,
> > -                                      uvc_urb->sgt,
> > -                                      uvc_stream_dir(stream));
> > -               uvc_urb->sgt = NULL;
> > -               return false;
> > -       }
> > +       struct usb_device *udev = stream->dev->udev;
> >
> > -       return true;
> > +       uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> > +                                               gfp_flags, &uvc_urb->dma,
> > +                                               uvc_stream_dir(stream),
> > +                                               &uvc_urb->sgt);
> > +       return !!uvc_urb->buffer;
> >  }
> >
> >  /*
> > @@ -1953,6 +1923,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
> >                 urb->complete = uvc_video_complete;
> >                 urb->number_of_packets = npackets;
> >                 urb->transfer_buffer_length = size;
> > +               urb->sgt = uvc_urb->sgt;
> >
> >                 for (i = 0; i < npackets; ++i) {
> >                         urb->iso_frame_desc[i].offset = i * psize;
> > @@ -2009,6 +1980,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
> >                                   size, uvc_video_complete, uvc_urb);
> >                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
> >                 urb->transfer_dma = uvc_urb->dma;
> > +               urb->sgt = uvc_urb->sgt;
> >
> >                 uvc_urb->urb = urb;
> >         }
> > @@ -2120,7 +2092,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
> >
> >         /* Submit the URBs. */
> >         for_each_uvc_urb(uvc_urb, stream) {
> > -               ret = uvc_submit_urb(uvc_urb, gfp_flags);
> > +               ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
> >                 if (ret < 0) {
> >                         dev_err(&stream->intf->dev,
> >                                 "Failed to submit URB %u (%d).\n",
> > --
> > 2.34.1
> >
> >
> 
> 
> --
> Ricardo Ribalda

