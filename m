Return-Path: <linux-media+bounces-33146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3CDAC0DF1
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0F5C3A40FA
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004F028C2D3;
	Thu, 22 May 2025 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="oIIcKTwz"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9472C28AAF4;
	Thu, 22 May 2025 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923680; cv=fail; b=XI0P5tjXeG9q7sTlXB7cTjC+k4nmU8JC0hqKvWLp808x9bW3xP2alN/5snrnVhtGYPQZf4iECGhpc6cRIAjzAnyqk7Q/NYZobcQ9XTcuZnxdr7kDEw+Z8oE3RNjmOIwfLBmi4O+mI4xIR1jyaUPd6oRdmF4i5Z+MaDwpiu8N8A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923680; c=relaxed/simple;
	bh=Nex5WAnF1P8cntDsOtNM4s/Qfw9RHd0p6xgXH8rdXmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mH23w804tPD2r6zR9wt3u93d7Bxa4/yf/rixZwrY1r3dT+ooDcJKMBvj0RAeFtGGRgKRIb+ypa0CGU3hm6UiyCddTC4XbyZAmQnn/Tp7pjYuSTudFgxXT2sBTRoJdaGzdm9G11UO1T8IGTD6EvPoLdzcxDZ/b4UulH7Y2UcvSf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=oIIcKTwz; arc=fail smtp.client-ip=40.107.22.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1HY8F9VBYMf/F+Sc5fpRPksEKjGFG7YotX2ItX8E16HRHhlAMDd5WuOkgjFa43D/VHPFFmLAsTnuP0Hy1s3hhKEtudb7jX9itu01SMPphQuh8SEtlqzuM39+IN/Z0kUrJqZGv6GklaKaJGSdZotxWfgZLtV6d85ky3LFlq3WpFhui0MFWpwQK9GbB5g9UbDnFJI/A3GsmOKQFk4qWh/CYYW61JoyAJyVTbWNJvJmFfJZCC8M6e/SlsZfdv8ziIVni5XxUFKQGvdSih+CJCX14JqwAIP4WoOkYVFIyRfJNu6s8BAmrRfNVsLbtZRIuf0riHTmULnuHb59vvFmr8iYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMYwQ1LnvjXjZqxjWFgMl/zM+ns4baIE3p+nqXqc/tQ=;
 b=Yb1P+lhN7dGNX0w3MOhl1ZxYdYF5fb62tUNprzmQuuWfPtHRMFVgLvBWxzhO96EhpfvyZRtoxeRiN7B6fbIqxtGRCaDejCprpUckMwNB6u58FJs1eflDa4VJ5rC9gceUv9fRyuNwaSBoULgCLacHAFapYI1RiaysnTy/TOGs0r8TIZFkvu2sZIThpIjryOj+swkGRaIdmf2rl6JKUaWd5ZTGNMmYlvy2+otas52GUw1b9S0PbZG5SGF0hmvyPtOIaOSLMaafoonBE2eujY92V6/4hmszr5SM80k8NdismzKT/2NSz40xZMwggQxxH/bmKDDLpsoc2LOOCGH9UNczVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMYwQ1LnvjXjZqxjWFgMl/zM+ns4baIE3p+nqXqc/tQ=;
 b=oIIcKTwzL1XeWzYsQ1pOU9fRcc0Te/vs58LIAWiu8ID0mSSmynCDEh5KNfHV5Xg8yJWSbObvhvayqLk8GSDYwTpQvafb2psHgNBcUBm4Xj9tKwG/mGUcBx7wJQ6hwe57lQySwMmvdCpH0zMeKog/Xrtc7TJ8UZlrLtBotTjp3oTCLbv/3opd9JtmnJgWInx9x8wwbec3cSJDDnKWVr+Fgey38+dEadik3s16UouCFqgUVnMKKR3NSuMsAZOURV1BXUw+6x2xTzqeYY0HcZmuGityFw53cClDXVnfb0IhqaTOPKRfiTatihtwJzCllSyNpfq782TljdFJy5Z0dvW8uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB7934.eurprd03.prod.outlook.com (2603:10a6:102:219::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 14:21:14 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:21:13 +0000
Date: Thu, 22 May 2025 16:21:03 +0200
From: Mathis Foerst <mathis.foerst@mt.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v4 4/6] media: mt9m114: Allow set_selection while
 streaming
Message-ID: <aC8yz1TpQ7MzWLEg@mt.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
 <20250307093140.370061-5-mathis.foerst@mt.com>
 <20250423183900.GF2675@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423183900.GF2675@pendragon.ideasonboard.com>
X-ClientProxiedBy: ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::14) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 65dd39a4-97ba-401c-12b5-08dd993be85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JGmGRY7Oot3f2BFV5fn8SSptUiQi2EcefF2l6I2+tdx5r1qSf5RJUZqLdKtZ?=
 =?us-ascii?Q?kyr8xwRes4wKWrwmSvaMHczrUeAb7MQ+zpwWCq7dC3aA5FEbSbAnFdngqVRC?=
 =?us-ascii?Q?TCOO5Q7vyg80E7l5LjEeX0hCj8wmNHsMqxWCUiGQSEt4R6xp2RN0iAdnO7ys?=
 =?us-ascii?Q?qhovtK3L1T5yCJyBRQpu4k+7RYVJM+qHDk/4dxX1YiF48hbTxaJ9syBBrgcX?=
 =?us-ascii?Q?/GI74TH/EsqPhKQCGV4x0pU8Bmc3xcn8uuNKevOg7nMjyioTG5cIzgmDoA7K?=
 =?us-ascii?Q?0AJsrIUro7jovqkJMydUPg+q/vaSj4rRJofakS074pzEotL+7lMx/0A5aw9w?=
 =?us-ascii?Q?FGFQl3TVB1Pu95lNGuJt3UOMwJ2QOJ5EJXuo/4y6ZeX3dAJl5H715D/5MdNi?=
 =?us-ascii?Q?gjeJvCvBBW4FuAXeleizETqDJ0OunTmaOxn87FzhuQS6025z0CeU9/HmQU4y?=
 =?us-ascii?Q?oZwlS83Qe5X6WRmH319Inw9vX9VNrxqhAFh5W3OACXnLuclHf/SYmCL8RPj2?=
 =?us-ascii?Q?xXTdCEKt4shkBHL/DB1b2qeM0+dZ9Kk3hcl37YpJDembo/91KKtXZgPfn2a9?=
 =?us-ascii?Q?CFsPD+Lhnyj669l6ss4doZzwzSEU2YVjV+BSCK9IS8vugLUiQggSLtLhwyfo?=
 =?us-ascii?Q?2XkKmcnZa9wbtsbYt+JKNBlUjsnOMb9p/NPA7atjR0jQM5rmZxsVmEkU8XsB?=
 =?us-ascii?Q?m7kgkHI0h0pD0pjHGsYsrkmWEt/g7NH9z/ZKR/Q22i8hYFc1WL0sxe41lLbN?=
 =?us-ascii?Q?nZkM4R+cB4923YolgoZF3gxxBc18AeRMS+FNIksRfQ15JgylQoqww6AaFF58?=
 =?us-ascii?Q?XK3CeOVVjsz8+3vRnlpnB+6KiztVvbpmA8Q4DDMbAGecSNkPvf8ijkn4GpVr?=
 =?us-ascii?Q?QarsMbPRNlnlEnXxD7xJ9sFlnLMjmxtcZegM4bNHLUWTonYxMIgQJdomJ3EY?=
 =?us-ascii?Q?L1eoVOmeVoOiZdT9BvdihTq5MiTCFZFw63uu3z9jREBUDHxzK1OSEQwhJPOR?=
 =?us-ascii?Q?+axgTraYxE5U4W24TA0D2EoXX62N5+2n4qalr0B2A57IzGsNskjNL68ewveS?=
 =?us-ascii?Q?KlTZyrhILdqUNih9bnnu5ETShqMGBip0xs32ok+ps4Z5IpB6oIyv0i1zHwU8?=
 =?us-ascii?Q?pzLREMBRxnuGXAN3SwH7wTr7G+tITNx5Ojutb3OOSeO6V61KxaS8Wg0FbN5H?=
 =?us-ascii?Q?hJhwSAoPhF+sG2fi78dRyhwXPWaT8IITO3FgWS6MC+ejGECH47jZkIzFpeIV?=
 =?us-ascii?Q?u4eD47Bq7lWm65VzJo3sT6w/kE/LQYLNqigaG4ub+SuXEUKqtSf6nzWvmNvn?=
 =?us-ascii?Q?x0Nj+mtF7kOmLxJm5ZNgp528TalkS+TiRphmoSaRrs9vWw8NpNqQhSPXZy9c?=
 =?us-ascii?Q?t0Pki5OVKdi+rlRIqZ0D+akkYI6/fojCBl3X11R/NUQQv970SG52a9wwtOBO?=
 =?us-ascii?Q?1vPkkW/h69iUCAUR9SRXSSL2RZbI8g/mDP20i7ZscLDjGoxTU6SgKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uCAYoE/N+8ti9lp3vWg9TyZF5yGxg5ohdfRbl5wH9fqDnzPoy4kmcM6xJH0k?=
 =?us-ascii?Q?1+fKxMYHCkBX+351Q9CSqZtgAjoDdV/MTbPerlPw9+5yPB2p2+Il7hPCWu+B?=
 =?us-ascii?Q?muwMBreWEpO/bEYCpXPC+PAwcCWeGzPibrY85pEvICJbpkQHT8NH1ldFKTTz?=
 =?us-ascii?Q?7OwpPWPUk6V2QDD+EPRJ4mgLijP9cJnLbXErRHXodaOXIcgaQq1ViCUdQeFp?=
 =?us-ascii?Q?cIgA/qhTaweTsTxN960TqDLEca3sZ+VvNVaSCnufM1U6knUJRoUhIWyKfiVS?=
 =?us-ascii?Q?z/otZJaujzZvHqtYpGsK9cLMjTvXkiwFS02Id5bQ1iW0W+a1cFsLp8eEAO0w?=
 =?us-ascii?Q?+P9QBla4cmqLEe85sRE7Chf0djqWKID+Rs8XatVuXtbat4OoEz2zUcIW9VvA?=
 =?us-ascii?Q?Xno+9AD/2OxXs1OHTErCDwOuc9MJRk++a0wdGwE6su/Pp6E2Z9La0mGZhvZ1?=
 =?us-ascii?Q?5GYQZwGDVq0hMf2bIwMqhuoeKBO3FUzDt/DAtm3yRHGT2fdZSihBEwfyDIZM?=
 =?us-ascii?Q?/FJvoTwQ6qBpPZo0vSc/J9ydBK+sXayRLl/ORzmQ5Tk5uuSo5V9uLA6Kwvr4?=
 =?us-ascii?Q?udFSEe6UIdiliUSpehpqCXzpjhQXzDR4NYyCjeIx7Tdp2QgpEJM20EeoHmtX?=
 =?us-ascii?Q?ZfWfyAzKDJjg/oA8gZ1vpQVXeQKhKxPDMt1YS5G/aCtdQPdSHwgB9yh9zOnu?=
 =?us-ascii?Q?CaYszI7olVy6LeNicJSrW8Oa00lLxB39PwMfOICyOmzYQ6Mmk7IjEMVb5Z6y?=
 =?us-ascii?Q?tccLE4l0b/r0LzBMMbY+Ej6tGUuRhS6poVp7RwfBUyOVwkT+8Ey6l1yv3kb9?=
 =?us-ascii?Q?XVKmH+12oPXOGFDzalHqkDe5ynm5ZDyPi5HoEjhof/M1XCiYXZh0RojFEFDp?=
 =?us-ascii?Q?/i/yZTEUqed7qetzY0QwOt6a8BNAOwzoznI8nBXuiVqcrVTRVGORgAl8xo+q?=
 =?us-ascii?Q?6arYwoWSIVNvUXe/s4FPlxw+ZkfpkgIG7oo+Qp0tQznWZn0E736nhm1PbMRQ?=
 =?us-ascii?Q?TjyswsKaMJ/VyL2qd4gWpDMm0rYlM0266biWdshc3Ai9vIyFlMlSezIf2g2q?=
 =?us-ascii?Q?UhMZWQw/E/mL2imrgGGwlSSg8KSbDsFFKFdu5lQeGtsl/J4hQTu3gAgl5MFm?=
 =?us-ascii?Q?bgv8IVwJ0g1jS5IFN8hTXBNReBPYSHpJNLBZGy8pY1HMWPdG7VFDPN288YLG?=
 =?us-ascii?Q?yuBIKUcCa80PzOZF1po+MdKr64TU32nSKUPqs7Otskl2AKqO9+cyJVrNSfgb?=
 =?us-ascii?Q?kvQhVq1WYV89pQQTgYT0GvCeq4Kv9iim5zVm3/Ot2ROudAPmNd0Zfh/9eexS?=
 =?us-ascii?Q?EaZgOzsULt46wyhUOuKJmDqlpUy3+FrIVUI80+pmC3CDFPREg7YvxTSMvOob?=
 =?us-ascii?Q?wv7wobyv7tz7YkvDna2MURQDOG+b9qAika+EK3kbA85UtJIbC/WEJjv9D9ZY?=
 =?us-ascii?Q?31kWAH/ypxGk/THwKo05OqVhjlAqnyItv1iyQlePiYnZvwExWqeKFA2Rl4+Q?=
 =?us-ascii?Q?ZFomU6e0Ee7Dly6euM5UvoP0x3qj/VbA7lmFkw7WAvQW1BxKOYbyC6leMwP/?=
 =?us-ascii?Q?aG4pn3J/5pYem17JBnKHAMIflD2GWJqaaUcmh30A?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dd39a4-97ba-401c-12b5-08dd993be85e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:21:13.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbLPFbx77XuGfSAzlm1dJPbkHlrOBiHd/wQrhBxi6ltPQirmFmXxAhtQGEiyCEuBOB6xedPDGkOrB2omOtuAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7934

Hi Laurent,

thanks a lot for your review.

On Wed, Apr 23, 2025 at 09:39:00PM +0300, Laurent Pinchart wrote:
> Hi Mathis,
> 
> Thank you for the patch.
> 
> On Fri, Mar 07, 2025 at 10:31:38AM +0100, Mathis Foerst wrote:
> > The current implementation does not apply changes to the crop-
> > configuration of the sensor immediately if the sensor is in
> > streaming state. The user has to stop and restart the stream for
> > the changes to be applied.
> > The same holds for changes to the V4L2 controls HFLIP & VFLIP.
> 
> Could you please split this in two patches, one for flip, abd one for
> crop ? From flipping I think it's just a driver bug that I forgot to
> issue a CONFIG_CHANGE, while for cropping it was by design. The commit
> message for the crop patch can explain why this has to change, while the
> commit message for the flip patch can just explains it's fixing a bug.
> This will also reflect all the changes in the commit subjects, while
> here the subject only mentions set_selection and hides the flip change.

As suggested, I split the changes into two patches.

> 
> > This can be undesirable e.g. in a calibration usecase where the user
> > wants to see the impact of his changes in a live video stream.
> > 
> > Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
> > in streaming state and issue a CONFIG_CHANGE to apply the changes
> > immediately.
> > Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
> > sensor is in streaming state to apply the change immediately.
> > 
> > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > ---
> >  drivers/media/i2c/mt9m114.c | 32 +++++++++++++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > index 9a49dab65180..65b9124e464f 100644
> > --- a/drivers/media/i2c/mt9m114.c
> > +++ b/drivers/media/i2c/mt9m114.c
> > @@ -1098,6 +1098,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
> >  		ret = cci_update_bits(sensor->regmap,
> >  				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> >  				      mask, ctrl->val ? mask : 0, NULL);
> > +		if (ret)
> > +			return ret;
> 
> Add a blank line.
> 
> But it's a bug, you'll leak a PM reference count. You need to break
> instead.
> 
> > +		if (sensor->streaming) {
> > +			// Changing the flip config while streaming requires a CONFIG_CHANGE
> 
> C-style comments please, and reflow at 80 columns. Or possibly better,
> you could copy the code from mt9m114_ifp_s_ctrl() for consistency:
> 
> 
> 		/*
> 		 * A Config-Change needs to be issued for the change to take
> 		 * effect. If we're not streaming ignore this, the change will
> 		 * be applied when the stream is started.
> 		 */
> 		if (ret || !sensor->streaming)
> 			break;
> 
> 		ret = mt9m114_set_state(sensor,
> 					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> 
> Same comments for V4L2_CID_VFLIP.
> 
> > +			ret = mt9m114_set_state(sensor,
> > +						MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> 
> As this can be an expensive operation, I think the hflip and vflip
> controls should be put in a cluster, to be able to change them both in
> one go.
> 
> > +		}
> >  		break;
> >  
> >  	case V4L2_CID_VFLIP:
> > @@ -1105,6 +1112,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
> >  		ret = cci_update_bits(sensor->regmap,
> >  				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> >  				      mask, ctrl->val ? mask : 0, NULL);
> > +		if (ret)
> > +			return ret;
> > +		if (sensor->streaming) {
> > +			// Changing the flip config while streaming requires a CONFIG_CHANGE
> > +			ret = mt9m114_set_state(sensor,
> > +						MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> > +		}
> >  		break;
> >  
> >  	default:
> > @@ -1286,6 +1300,7 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
> >  	struct mt9m114 *sensor = pa_to_mt9m114(sd);
> >  	struct v4l2_mbus_framefmt *format;
> >  	struct v4l2_rect *crop;
> > +	int ret = 0;
> >  
> >  	if (sel->target != V4L2_SEL_TGT_CROP)
> >  		return -EINVAL;
> > @@ -1316,10 +1331,21 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
> >  	format->width = crop->width;
> >  	format->height = crop->height;
> >  
> > -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > -		mt9m114_pa_ctrl_update_blanking(sensor, format);
> > +	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > +		return ret;
> >  
> > -	return 0;
> > +	mt9m114_pa_ctrl_update_blanking(sensor, format);
> > +
> > +	/* Apply values immediately if streaming */
> 
> Changing the crop rectangle modifies the output size of the PA. It will
> not match the size the IFP expects at its input anymore. Could you
> please explain how this will work and why it won't cause issues ?

That's a good point. I implicitly assumed that the user would only change the location,
but not the size of the cropping rectangle.
Of course, the IFP is not happy, if the image size changes on the fly, but moving the
cropping rectangle around without changing its size does not affect the IFP.
I adjusted the patch to only call mt9m114_configure_pa() if the siez of the cropping
rectangle didn't change.

> 
> > +	if (sensor->streaming) {
> > +		ret = mt9m114_configure_pa(sensor, state);
> > +		if (ret)
> > +			return ret;
> > +		// Changing the cropping config requires a CONFIG_CHANGE
> > +		ret = mt9m114_set_state(sensor,	MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> > +	}
> > +
> > +	return ret;
> >  }
> >  
> >  static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Best regards,
Mathis Foerst


