Return-Path: <linux-media+bounces-27575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC14DA4FAED
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE52E16AC02
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC3C20551E;
	Wed,  5 Mar 2025 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="MdE/YNJX"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775801C8612;
	Wed,  5 Mar 2025 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168797; cv=fail; b=dixMbn+ksx+v9SEDaTZXr8XB2clT2otNZL8rcFsUylmw/OjbekjvxB3VUAieDrB26TwrAp3uGEPfQJfd55mJ+01OAJAJ54SOTEO6jogUAhC6YnXGU7dmW9XO30xtASvaH1e8av4kAuwtUk/UrqaaBg7UVJyZO5FOtSGhTyrq/yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168797; c=relaxed/simple;
	bh=Ypcn1ZXYLUABHRafSKJCeZCrayEFQTrNvRDa46yGG+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rFWkGfUpkCZDJKVJ6/orwKyxUqq1Q4WbG0AmpL4DMjbPjYIpOHzLBAdPCdSS2STjMCEn1gkW2KOGjKMAljdNp6Z22J7F/yekkqDmUkwLfBmWbpZl7mzAkfTwU8gdz86q+7Bgw9+ATRADQevpV/TZLan1qAozoi547y5YH5M6Yww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=MdE/YNJX; arc=fail smtp.client-ip=40.107.20.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yadd5pg/zuTfkQEWZ3YaGNIxhcf/4EmCkg4kg3NEdJRPjbHeoNui8sRxT/G5v9109gOiAF6WyvIge2jM+A/7UrqmJYkfA+OuIQekNBoJw6rkhx2yCLbh2YoebAi7VPL0at7k4c9oFp1tPiJp3r8yyZuuLSlVjMUF1rHkgYqUsGiGPR6BQ5BFOZkYjWaJGO8ElKrT6v9S4GBSnqaorORIWzpmAAMpJpSbBx5me3+bqMZO1XuS4oAUgwOkPHw3cvS+UbbQHi5Dos2whpgNLEMohbkU7gk8B+XcX7xo8KVNoSXbvBUWlBlR6c4/giPlH6fx9yytxIIken4zGugVSguSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxlP4M7ZCzgDrl2K4Rw6JE8KP6M8sjrHYWqmiS+x8UI=;
 b=WYhieZ0PokatfE+m0GTRLjpopGPQEwwTWD9qYucALNZOYC8ADBCWRCa9sx/dVOekvEtvY9FaTYZqSRZX1PhU6xxGkEejSol/NUmc6AZ+3tZ6Phw9VMjqDjlmpSXslfnVBl7c968e2sVp++oWeIllRkO1ofRuwuiHcEbvemrJgIKYtDUPGwPkk12BKL9r6OvaZbX1R6Ytml8OWkeeiWjA255x+n3LZzzm0VW5UBCzRsidHrn9kHG2b4wYul8VHlaqBb9Ytbv2a+0qlANmrU45Tyt09jGuD7vpumjrTgzw56KTS9q8kTPp67eBvfkocGOUkXntffG0tRMc2gZbX9kXTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxlP4M7ZCzgDrl2K4Rw6JE8KP6M8sjrHYWqmiS+x8UI=;
 b=MdE/YNJXI5u8YrJl2va52rIkVpkHXY65Zp3ZVTZuiMfYGGAwXXpTBeEPQxf6hfpAifTtevzo0JGEEfbmGNBVlWbHFQTv+9RhGMEv5yVbKm090bIJcwuQW4tQxi5H/8rUUobpXyv/FU9ezGoXeilAuU/gT5nIhSKACTNV/hbsIue7mLHAmd3EIooKI18VR1u+YT4uEqKsAIk9rJ7hmNGHrwKh8UXy4ax8UpejKrlGhfWQ2UBGb5MEB8mbuSGWjaqqDB+u3esDogT+lFyBupKaBGZiRklY0avof0l/Zrmv1jETFBXa8Bmb0S0b++DtrVt73D+AS+BrzvvlZK1WU25x+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by VI1PR03MB6381.eurprd03.prod.outlook.com (2603:10a6:800:192::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Wed, 5 Mar
 2025 09:59:50 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 09:59:50 +0000
Date: Wed, 5 Mar 2025 10:59:27 +0100
From: Mathis Foerst <mathis.foerst@mt.com>
To: Conor Dooley <conor@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	MauroCarvalhoChehab@mt.com, mchehab@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, manuel.traut@mt.com
Subject: Re: [PATCH v1 2/8] MT9M114: Add pad-slew-rate DT-binding
Message-ID: <Z8ggf4wXX6HAoCpS@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-3-mathis.foerst@mt.com>
 <Z8A66l02Et4J7hj4@kekkonen.localdomain>
 <20250228-helpless-delivery-42162772caa3@spud>
 <Z8boqvxEAhx7rG9Q@mt.com>
 <20250304-expend-isotope-cea613f4e9d5@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-expend-isotope-cea613f4e9d5@spud>
X-ClientProxiedBy: ZR2P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::14) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|VI1PR03MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf03427-58c4-4d57-1b30-08dd5bcc7821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SjdbBjMVUTn68CigJq+R3AOJWCtixNDMLkj+Eur/0bgVqOUxNWy0one91RiJ?=
 =?us-ascii?Q?h5SZv+NVr/gFVWzqJ3AxuVTW+ucuerbkkdFuZxjAXn4DvIav2Oxfcm1DnI+6?=
 =?us-ascii?Q?DkvvQMnmAJpFnabhlLch9NSf8SVKq4Xp8h5EZurmI3BIEXnuHxTh0TZCNb8r?=
 =?us-ascii?Q?NZTtvLuh0JVOQqDFELqy/lscpPUF8F4hRdqSMo3As1Uo/5IWpQlXpLuRPAMn?=
 =?us-ascii?Q?yRb8REvIPdTqvLzeljZl1viWXWP3Ck23bs1CbIkjYn9rds6H8ShwD0UqIl9n?=
 =?us-ascii?Q?aIclnFxCUFOSdAARBrCQo9KeRZeDdlPaq/tXwgptArkHuG9xI8tYX5PyZajg?=
 =?us-ascii?Q?qbjDhfmCgBOR8VSSWuJiIEgirvAp2gqIKvBWAuul83b3+2WVWOhvSY8ZJ1uF?=
 =?us-ascii?Q?c1+g4KjX82ipaXf8M/VVWFCaVSY75tvx8hvvDb51UjyLhHh/pMVFhVeXtGH9?=
 =?us-ascii?Q?3UuYRzB1Al3lhnQMd9kXGg35WiPvBMECcg+SOTW30mFxR6lUxXc12iPRkmZL?=
 =?us-ascii?Q?ffWQrj7JgtQX1jTc5jut61LxWyfcNTqZlyX+M264d/2Itv7dzcUEAEhKaIwV?=
 =?us-ascii?Q?2zctYg8iCIXHEH3LhAV7vMNSdxBnxcvfeNgVL5E2mxhN9f76jey6L7gIBqq0?=
 =?us-ascii?Q?EkLcOJpTw0BqvqD94bqpHUhuC29rX5y4Y/4kkEpZsGj8Vf+lh+i3jEoWpSSl?=
 =?us-ascii?Q?hd63NOgeTGDY9fSQhD4LikI3+GgjK3lDJmIunYBKxWOjTcYtKLdJrM8Nqv+r?=
 =?us-ascii?Q?eU5kHfiwpBh57738GhtKGAXZD3mgAKslUg/hKn8zzt8I85VOZqpALb7UyjCI?=
 =?us-ascii?Q?huoVPaBvg7Iq55Be9963LSG/vf9Ib1CcpGjbkAOeTWTcTBiym2TYipG4/bkC?=
 =?us-ascii?Q?GTbISKcBP8DdXldnxcRHaotmmF/hnqmrTQ/Z3Ra7Rxmz5ql9RE9ukJPaVN70?=
 =?us-ascii?Q?uhGOwRuKVIpxKdw/1K9wrzoTaje+w0Vqv2MtRjVbbCUJrqwcd3pxPXpRYj3s?=
 =?us-ascii?Q?Iy7PXLvknrE4q3ngPMUQjhxcmBe5T5JO7yPjrieTnbnLLiiB7XfKmjgu0w04?=
 =?us-ascii?Q?zzjnjHTQO46GqPO2E8JLZqOqscrlihB4/aDAIqU5bFfEzssNuOHfHMHmlr7C?=
 =?us-ascii?Q?5smxTCfJ+boldfhJdRCf7R1Y81paphPCmVDcr+e4C5JfEg956WyiddZQ4WGb?=
 =?us-ascii?Q?+S+ijYL3dxrqDG/w8N2/zaLIO+NzNPb2XFiM52MBEqa31QbDuO8oEIMNQiqy?=
 =?us-ascii?Q?WLacppXWR70JR/xe6XSQVUDRv12tiN4TdhM40IS4P5BruD2j1SdZFYGgC7rp?=
 =?us-ascii?Q?AvgwACBz530iJ6uLIV2z0dRz4wwjf7aXfPY7sJUEwW42/8viKzsWgRV6CxY/?=
 =?us-ascii?Q?R6LYlzxMz3zYk/EEQrFYv0aNgjSIHFRpjLJad3R0Vkz0MoA4gwbhAprHkNBR?=
 =?us-ascii?Q?wklHqHRh/gLPpGsVjeRH2YQDPul4M2b+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VaxYntRTotnIovXhoHXt64bmyTw6Ks6CAxtw7m5MRESU8p0nH5GQlcUpW8b6?=
 =?us-ascii?Q?lVxM24O3zk4pQkpG+DpJxv5BY46PUkQ6QlOmX/ghYRqBDQ4W84KRFIp8qvtr?=
 =?us-ascii?Q?sFDbLwDdoUh/mHyD29Q+mDIEfChPxBHX07hKmS6M3o3jMn3bb2pKCo3rAF9s?=
 =?us-ascii?Q?m3WOtwASnxOtPaXvEOIpqDCt6nRWCJ1h4kEvh+45KuqgkayFsiS9h3qBt2iY?=
 =?us-ascii?Q?BfuO+VEKDboLjHxnN5jQKoi8db9W2teVxbbTEtwDDVhXFDgNzIUIcVPuCrJV?=
 =?us-ascii?Q?cpEQUu5dR7TY+fPTzBCzTf3hxCNdTAO69LPwyGKwFaLUUAkYMNpFH5G2FPmC?=
 =?us-ascii?Q?dTDl/WuUTJqk4S6bvOloFe8vNYK7r8+MtVf+b5VQ+vnENtk2V9anJubWRVbD?=
 =?us-ascii?Q?Vp3p/ombz/RPqmjF2+JhCkddk8csZZxxpTP/0toP4JyQEW4jKw4YJcEzb6II?=
 =?us-ascii?Q?KneD//Jw4b7oI7Harx8aBYQdfOuzpLulRVKHtfSGG+ONlr7lMVDKFTABERbt?=
 =?us-ascii?Q?nP9GRM/pxihjaY0AtMc5zSpWhBqzRuxlI60XdMWuxc9k9d5AhnSrmCCzs/O1?=
 =?us-ascii?Q?dSikpbZ/sG1zN1U9oup/BCF4l0bkPjaELudBAzUu7rT/5WOq+EJMrVdPLaGI?=
 =?us-ascii?Q?R53PAs0nAK9U8dsblRfsKumyEosS7Gm6v7riHzJqc4azXk7vj0EqMjVwuPVv?=
 =?us-ascii?Q?zJzNG6kOqoMIdrJHMd7pIchkvu48xeI6v+T8aL7E7/UBzECZiZae5Auto08S?=
 =?us-ascii?Q?0OQuZrNKpLVJ46KMcJAn1qiYn9ULeMGNl2+UACFxaobyaDtAc3sqsn20hRoc?=
 =?us-ascii?Q?qyykxZEoLOn/82NuMjwfJOp4n04mSsqouUt7PK9doGXMJmfg6As/76mjbbN7?=
 =?us-ascii?Q?aqCzpY7ZMSFX78BQzRjrl2w8Oj6eGW2hC1B+jNNhIKaUFC90C2ZJr+rNjLGY?=
 =?us-ascii?Q?ZKAwJS/yXcs+yLhzvP3f8SJoZX+1jOBsf6G0IWJnAPTkQijEqglG+AgDVOPV?=
 =?us-ascii?Q?XHF0a1JjfcFu3wVapXGk73XztQOuywa68MPinJZ8mx+KcwovXhwQZ8TC0RfO?=
 =?us-ascii?Q?eUWZFfJSOh0Y2kDhKhr91oqK+LVsfVczQZin1WUPo+4Z9RH7qqstOoK74W3l?=
 =?us-ascii?Q?Hc4f2rGZnfC6x6mbMAspQ61syju3Jb58U3sT3QHu4SPS1/KrEtmCcSeB8hYb?=
 =?us-ascii?Q?DbmZGU6sKyfxhyXJkHk8L67pdrtYFTyTTfqT6ldtRMwEseTCRFXjqJsZesWJ?=
 =?us-ascii?Q?kVndDAjU2sEdH+dnfKH+b3FP4z8szQnQqlq9C2I39QaYSF6alLgmeEb2E9Sw?=
 =?us-ascii?Q?1+WYKTGTomTomiiOBoSzOufkjy0w9yS1py17iroogKb4VBaf1dJuZSEdImDb?=
 =?us-ascii?Q?BY8Pj86X4PjTJ26xju78QYc4CHeVjguyMnRf+q94/kAsIqk7IXis7d0B9V+C?=
 =?us-ascii?Q?jUT2RxMXngLK47r8TWclZQY5w2dQNI1yN426HL0B1nzxSarJDWCtdh69WShL?=
 =?us-ascii?Q?H3EB/QVqoC3WcZw7BYAv2ZMzCXcD6oaiTi9cCwF40RktbBWO7Kn1uHpeE/Bq?=
 =?us-ascii?Q?SeLfYnYSE8EmCge6gwXzDDzywnQsk09BnG82nJXI?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf03427-58c4-4d57-1b30-08dd5bcc7821
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:59:50.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21TD1f6c566vjMNTIFsLzKFobYIxe1+LmAm+IlGmdoilI3zJoxIsNj0BW/WzSHK+K3aDpuhrp9elz4p5BR3Ohg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6381

On Tue, Mar 04, 2025 at 04:39:34PM +0000, Conor Dooley wrote:
> On Tue, Mar 04, 2025 at 12:48:58PM +0100, Mathis Foerst wrote:
> > Hi Conor, Hi Sakari,
> > 
> > On Fri, Feb 28, 2025 at 07:11:31PM +0000, Conor Dooley wrote:
> > > On Thu, Feb 27, 2025 at 10:14:02AM +0000, Sakari Ailus wrote:
> > > > Hi Mathis,
> > > > 
> > > > On Wed, Feb 26, 2025 at 04:39:23PM +0100, Mathis Foerst wrote:
> > > > > The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> > > > 
> > > > "the output pads" probably means pixel data interface (DVP or CSI-2)
> > > > signals in this cases? I suppose this is about clock modulation?
> > > > It'd be good to say that.
> > 
> > The slew rate defines the slope of the voltage flanks on the output pads (how fast
> > the pads go from LOW to HIGH or vice versa). I tried to clarify the description.
> > 
> > > > 
> > > > > At the moment, this is hardcoded to 7 (the fastest rate).
> > > > > The user might want to change this values due to EMC requirements.
> > > > > 
> > > > > Add the 'pad-slew-rate' property to the MT9M114 DT-bindings for selecting
> > > > > the desired slew rate.
> > > > > 
> > > > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > > > ---
> > > > >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml         | 6 ++++++
> > > > >  1 file changed, 6 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > > index 72e258d57186..666afe10c538 100644
> > > > > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > > > @@ -74,6 +74,12 @@ properties:
> > > > >      description: Bypass the internal PLL of the sensor to use EXTCLK directly as SYSCLK.
> > > > >      type: boolean
> > > > >  
> > > > > +  onnn,slew-rate:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > > > 
> > > > No need to make this 8-bit (i.e. just use 32 bits).
> > 
> > Okay, I thought 8-bit would fit the small value range [0,7]. Changed it to 32 bits.
> > 
> > > > 
> > > > > +    description: Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and PIXCLK
> > > > 
> > > > Please wrap at 80 characters.
> > > > 
> > > > Is there more information on the effect than 7 is the fastest?
> > 
> > There is no more information about the exact meaning of the values.
> > As described above, the higher the value, the steeper the voltage flanks.
> > 
> > > > 
> > > > > +    minimum: 0
> > > > > +    maximum: 7
> > > > 
> > > > Please also add a default.
> > 
> > Sure, I added the default value 7 that matches the currently hardcoded 
> > value in the driver.
> > 
> > > 
> > > It'd also be great (IMO) if it were given in terms of actual units, not
> > > nebulous values that I assume to be the register values.
> > 
> > I agree, but the documentation does not provide further details about the
> > unit of the value. So using the register value is my best-effort approach.
> 
> If they don't provide em, how is anyone meant to calculate what's
> correct? Trial and error?

The correct slew-rate is a trade-off:

You would usually start with the fastest slew-rate as it leads to an
output signal that's as close as possible to a perfect square-wave.
On higher link frequencies a too slow slew rate can cause the signal to
not reach the HIGH voltage level before going to LOW again s.t. the
reveiver cannot interpret the digital signal correctly.

But steeper voltage flanks lead to higher electromagnetic emissions s.t.
a device might not pass the electromagnetic compatibility (EMC)
certification with the high slew rate.
In this case you would lower the slew rate until your emissions are
within the allowed range.

The actual emissions depend on many factors like the PCB layout, the
length and shielding of cables etc. This makes it hard to fully simulate
them.
So even if would know the exact unit of the configured slew rate of the
camera sensor, it would not fully allow us to calculate the correct value
for it.


