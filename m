Return-Path: <linux-media+bounces-28139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C11A5F3AF
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 13:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2C3E19C185D
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FD7263C9B;
	Thu, 13 Mar 2025 12:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sDcnOB6h"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14773265608;
	Thu, 13 Mar 2025 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741867305; cv=fail; b=FtbB7jM9XrHpsNkyp4exQNKwj8OZeTg0EwN4qFUPkbmqWyqQrMe7q7DuJK8zkT8w040kZvDIiQCa6e2BLaFWtV2o2OBLt0lo03xxInNjBD1+R9zRBMTOVuoR7Aq9xZzZaUwQ8fB5yTB3E+jWY8NYyF92bfu07VF74gugugCMhPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741867305; c=relaxed/simple;
	bh=ueYhi/LZs3oNY0NoLq6gg/QJu6AiKweHU3VswnJLK8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UtXddGx9aXraGicWeTDE3waaaGErZYjgXKVaPTSvgPMbaK6HotqGut+OKlFe3jFpdx9iD2MOJAfjuTywgtMZbU+JPBmGMi6rj6SQROVM+rhYxnexS9cgqyzFvi6B80nMp8bxlPzKyFHLqHfHOkQoToPf0v6XVtrXhHYZBrHuMpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sDcnOB6h; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1FFaLHFE45uzHvS3DkkwIT6aH3h62NqcDVFyOLrFf9bHSPXDPrnVfdkrFD1CeB3SMmodeqcEmx5A6diuNkYb15GMYUEEXbQeO9l0wsRx2QkH3VJJe56VOniqePdqzkqgzcz4rCQnDkFz9zR3jr389nqR+X4L0SiPvyNHgdK1EG1B7yT9Qbk0GS9ElU9AFZutpfTauVHMfzxLgpDvrCqf1QoEEQK/JLQzW8uI6umJjRWzQPTzUE8RSNe1Hnj/39MrJzTaLqIID3COxmjQaq31Lg2qmE/HEWfiL8uAhtbZV8KTgZternrz32fwRHPmeeIWggTEPi7FFQ7ikbiQegYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao2sBeI9NlnUaO1h5kN5sKLD92KVsvjQ1qxetMuNZSI=;
 b=lgJmw3pqhHHh2jc8MHsxx6Z8zXW6h06rPnpsjTXINb+AqVhXaw+XtE0wyWsT1VNO2Tvo22a087itu1sLXCrjKPbM5FjolEn8V/MEB6hspiHa9yqQvgCFNjMCfGsg2/PxhLsfxAvytLfmBWwEKkKG9mGoqfGKT1A1C6i3LzgH5S+Y/8gvIh03mork8Ut2YSUmoohGUFHuryLgzAIIvvSiDHfnvVLpLwqDkNY2iA/RH4/HEIFlV6WFXCqeAVDaJOy2xKsiVaUc8gDyjB5bkzEDZ9hIfJVx/+DJnoPHfklksQhnsjqI1qs2MSzbR1QQ2B/1ldoozUox5LQFhcTTrsMbnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao2sBeI9NlnUaO1h5kN5sKLD92KVsvjQ1qxetMuNZSI=;
 b=sDcnOB6hzeujoiqgO4VZc1Rx5kYB3AOd/e3461SgNxOB0yrra28OqvzWmY8lzuQ3KFRZ0MWj2z23RXq/MOFygARF7f/rUIVVdLWyLjyUD8cEnAZ2h+2BHstQaDejKfg3uYXuJJtFeElhhS6mkKOPj/Hcq1CTm6uZ8CCi6+iNoIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13941.jpnprd01.prod.outlook.com
 (2603:1096:405:21c::10) by TY1PR01MB10641.jpnprd01.prod.outlook.com
 (2603:1096:400:321::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 12:01:39 +0000
Received: from TYRPR01MB13941.jpnprd01.prod.outlook.com
 ([fe80::1512:cd0c:8675:4688]) by TYRPR01MB13941.jpnprd01.prod.outlook.com
 ([fe80::1512:cd0c:8675:4688%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 12:01:39 +0000
Date: Thu, 13 Mar 2025 13:01:24 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
Message-ID: <Z9LJFCBbqbdlDP8k@tom-desktop>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
 <20250303160834.3493507-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113467D4C0BE9691A6E4630C786D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113467D4C0BE9691A6E4630C786D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To TYRPR01MB13941.jpnprd01.prod.outlook.com
 (2603:1096:405:21c::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13941:EE_|TY1PR01MB10641:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d37d8d-3cb4-4047-384b-08dd6226cfc1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eTpHdxWUmgMZ+xzJipQOlPyJDmM35HiaGhr1Z4FCN38VJT9IiWqmZH8Iej0q?=
 =?us-ascii?Q?RcRjN2ZIgMentoGZFwWvS1vydcBSZ5soFqG6OBmJR4eMTDHo8fmo4/vLChnm?=
 =?us-ascii?Q?PObVl9g/DNI5jWn/wSQj1c9tcqaSJ3pVD57+8/VJM4+Nt8eJg3QzqapJvuJx?=
 =?us-ascii?Q?jyisK6btNDi3xVj0IVGBoy3G7/9P6gWVreVCUrIwW6aH8EUedQwa9y6OOBfo?=
 =?us-ascii?Q?2LRurjlfWYh44tb/MZ97PLTP7S+9rlXeMGhCt0uHCqoQvNh06wGp+P6vfZPm?=
 =?us-ascii?Q?0/gUjr2lK+AqkY3DbVLtjlrZast4y2qOPzkvbq6O0C1QwMaFUvQLo88uAZSg?=
 =?us-ascii?Q?o0kBJZSfKiQgVp+V1rP7i6sDUMeth/gbX4hbhCfXCDTwkEig7ark7nDv6Fpu?=
 =?us-ascii?Q?xML5SUAclWerxq0sya1Pb9fUwe+8rV48mbE5eHBr0Nc3Dkq7fBMlPfiuBKYR?=
 =?us-ascii?Q?DLCW9WeS3bNId8WmAx1tUkS/vwY0ppZ5EKUN4dIwJkLekTYFhdtEG/HGu1qL?=
 =?us-ascii?Q?0xji35aeCBGpAZ1OOG8A9kQtWrZr6+1Ug/Pb3ILZiYI8rg+kVSkU7GWGtMxx?=
 =?us-ascii?Q?3xUtpN2CWs6dpS3T71VCznUCGbeveaajGYkvufj90hmsWU4Iyz6beUcp5/vm?=
 =?us-ascii?Q?tGC5QmbvwQnWHG0Qeuq4wXGvqw6Ibggm893DpKts3i+cS8UqwUBbG1cfg9NK?=
 =?us-ascii?Q?mPIwKToiijMkVxQtRrgRd1EdWNmvdNtVDlEUaGDR14Y8VHFTsKOc4YbvL75G?=
 =?us-ascii?Q?Xl/MI7jvQceDdNFsdiDROSawMm6G+qAgFWZ394Ulynq89tmgy4i38xDLQ2os?=
 =?us-ascii?Q?r6YFoCLQghOxDaOWD9U4pQ1tUPGPCldnM1FXHLsrf7QPhan43IER0RNLyBxd?=
 =?us-ascii?Q?xFqyipSiScGP1WRgNpWCaPif27PCP6HR8UyEQe6Rba310ZNrhkJs0T2PkwLT?=
 =?us-ascii?Q?zCoiliSj5fAqLiw/Fi13gIr4kKFjSpYCilzij2oiNlCNngZwJlME/lAmSnXx?=
 =?us-ascii?Q?+tLyD5/x/t4OogjdkdI3PsgE5mtxXCDzQOLO4uUiy9WodOzwEY1WvnJZKmF0?=
 =?us-ascii?Q?3HrQJ1NATo0JqBfqVeFJ4zrt0JM6kmJEUpSpCyXHl1jGseCx2/yZui5Yc1/k?=
 =?us-ascii?Q?5czl6eLOTbAd0bm1B7yjUhxWG8psp13gahIYVlc5H+x3TUjzyep4JInIXXwc?=
 =?us-ascii?Q?GudM+fFSNhSBBDVXvPgeM2miPC4gppXWFcfUDCOwT2Fwz+baoG8y0qQO65NR?=
 =?us-ascii?Q?xW4c5IStX6cGE1vYPn5r6VTXfmYFTlutLLOcIaKxoV+s93NxQPCkbPHuuSOe?=
 =?us-ascii?Q?2fQbNFFzkPB8XjUyZwcNTewXHu1bp4k79msqDkt7M1scsSg4hqffBQi+V6iJ?=
 =?us-ascii?Q?R/a6/FgK+e8kvqYxtKKndFa9HdY5jpElEv/KCW+2CA9L+s6uSt7inuf3C8Lg?=
 =?us-ascii?Q?1bCfYYlKgwkZRIuzyYBISjdkhSn06V35?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13941.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vjTYLzDdIiPPABiue8fUHH1B1K0mdFIoygXjAEMpdQdbTxRCub73/AuxlOsG?=
 =?us-ascii?Q?vNHQbO+gtfRiXCy3u+9Ohv3z7PBrZyhDfFzDheQeLhI1+BPWz/xHBxNPmvKY?=
 =?us-ascii?Q?ym44VkQD9bALm7OgdYJAtzZIZlO92G9thiDlkTtsswgCAC0bjqwt1P2hVwi+?=
 =?us-ascii?Q?bmx+r71aIuRRe1v9uu0Y4MXSX19MeKo5KnMyx+f/gY9JJ7VMIokL0RJxb/jq?=
 =?us-ascii?Q?M6+VgZL0jjcszWA+ATCZZUcZEalYa2/4W4o6H+nDSlyas0azUXOxqA5rhODf?=
 =?us-ascii?Q?aApxVQOeIs1DLZiG7NcZy5xOAHaPzQsvEQJnPDADjaQP4hQp1adtCjEkCSaJ?=
 =?us-ascii?Q?RI8DnkCGNO+M3h8t6qhSumS6cpTYBiTjJRzn0wdOu8jhRdQxXhyYkQB/rZj/?=
 =?us-ascii?Q?Eqry8WHpyI10tLPDcOScTRV4YE2MDeBnxC/Rc9datF9KivCWoibltvf67VZb?=
 =?us-ascii?Q?VNAjANEQQEXjch54HOpaD7O2L9K7URCpR1fKJpA/X2sFE++tSiJII2fx2qic?=
 =?us-ascii?Q?VhGg/o+2ihShcGKmyt7HCAVHOJPk5M7f8eI90TCJsrNeGuPo6agx9IgJvWm3?=
 =?us-ascii?Q?6zaqSdpIP/Y5r02rmciRBcyD93R2HXNLFmaN6EnLSIadeSUsqqiaV+l4hm16?=
 =?us-ascii?Q?6QUc1zYWbziH0uFANlnAo8sQZwsuiVX9Ytg7eoEjjdPuZ2OoAEyz2BJMQUIT?=
 =?us-ascii?Q?khxrMCjd1FkvfIvib2PzYtDRoHpLuMUbUgqF/of6r2vHnMACGhDe+M5yZUAv?=
 =?us-ascii?Q?6v1PGc+rMzAKYDpdliu6tMQ7TDHoTqovdj+ipSwqWndhxVOkMBDdRw2NHjcv?=
 =?us-ascii?Q?XJdFcJur3xzBEMqzCkCwOaIOI9Q5m96BHZM5krDSIf4/8puSssUV2SRaxuFl?=
 =?us-ascii?Q?UVAWFXsyIHnaBwa4y4H5jbriNLWzejBvWbokx1SemkybZ0A5pifLV89D34DR?=
 =?us-ascii?Q?aUebJS8FQvPNpEMGVBfKpd1AFtwAd92BLzsjm8ykkkoouJqS/0Fls4kay0oj?=
 =?us-ascii?Q?3j0GOUGQMKFbn8u9g6pyX6yxtM2LdKGVwjx7+/Z570Woe7f3mVZUXRACES3E?=
 =?us-ascii?Q?2XBZz0WTew+ZN+8/RRuHaxO7y/cmRmHAGbU5kLu6q5vCDgAtcNrITjyLDlj2?=
 =?us-ascii?Q?mlbo5FFVQWLP8xxHiYYdmx5skJfmjfiIb6ab3TSc26O782omdhlHQa8x/4gW?=
 =?us-ascii?Q?NUoVDr8AV2bzzGPhFvqy5SjyP5Pk0H6mGRb6o1rZ0m4JBcOIBlU3mDl+QiZH?=
 =?us-ascii?Q?HoWoDxzRaUjAZub+DKOM+9/wqkxSHTNzgwkOZeVulRvxVcR6+z4lXcFPEWTH?=
 =?us-ascii?Q?4xCOKPMfKqtPRuVbbku6fHBXYQ+4SFVUhTjAH54JX4yCX0eby7PpHZ8U9nHB?=
 =?us-ascii?Q?wFKVUDh7WOzkbuscKyQPB6Yh3QF+jRkprW23EzK8P4FI2MPK7K+DEQxqmjk1?=
 =?us-ascii?Q?DAPon/O0R2pN/RSYGjY9Flxhyz113W5oBw97AwkzGN/zoja+81qE1IdWmqBm?=
 =?us-ascii?Q?cZJv/l/lvRVMkiZA2cT1rktg0NvLJhbyRb4a9u/WVokMjqqhKDzdcGqLPPY1?=
 =?us-ascii?Q?6PfrzDu6PH+aNt5n7l8RGfwmzVX+xlBNPLCo/bJr9iSI2ItHSnzcwonebD+r?=
 =?us-ascii?Q?xw95znzrLzuEjmpYiQWsRbg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d37d8d-3cb4-4047-384b-08dd6226cfc1
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13941.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 12:01:39.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CehpW+2vq0lDtE5Qn9ZUy/KCgxnUmVNs25No5LiXRbypjhGTgmulqa/1NlrSguKV8tnpO2r3kt+3XPy5mhqCSdDEcc0kuMCqKgkpV7GtbJGxhdRjCdmE7dJOc3SyRQC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10641

Hi Biju,
Thanks for your comment.

On Wed, Mar 12, 2025 at 01:37:25PM +0000, Biju Das wrote:
> Hi Tommaso,
> 
> > -----Original Message-----
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Sent: 03 March 2025 16:08
> > Subject: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
> > 
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a CRU-IP that is mostly identical
> > to RZ/G2L but with different register offsets and additional registers. Introduce a flexible register
> > mapping mechanism to handle these variations.
> > 
> > Define the `rzg2l_cru_info` structure to store register mappings and pass it as part of the OF match
> > data. Update the read/write functions to check out-of-bound accesses and use indexed register offsets
> > from `rzg2l_cru_info`, ensuring compatibility across different SoC variants.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > Changes since v2:
> >  - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
> >    accesses as suggested by LPinchart.
> >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
> >  - Update commit body
> > 
> >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
> >  4 files changed, 139 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index eed9d2bd0841..abc2a979833a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -22,6 +22,7 @@
> >  #include <media/v4l2-mc.h>
> > 
> >  #include "rzg2l-cru.h"
> > +#include "rzg2l-cru-regs.h"
> > 
> >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)  { @@ -269,6
> > +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> > 
> >  	cru->dev = dev;
> >  	cru->info = of_device_get_match_data(dev);
> > +	if (!cru->info)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "Failed to get OF match data\n");
> > 
> >  	irq = platform_get_irq(pdev, 0);
> >  	if (irq < 0)
> > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> >  	rzg2l_cru_dma_unregister(cru);
> >  }
> > 
> > +static const u16 rzg2l_cru_regs[] = {
> > +	[CRUnCTRL] = 0x0,
> > +	[CRUnIE] = 0x4,
> > +	[CRUnINTS] = 0x8,
> > +	[CRUnRST] = 0xc,
> > +	[AMnMB1ADDRL] = 0x100,
> > +	[AMnMB1ADDRH] = 0x104,
> > +	[AMnMB2ADDRL] = 0x108,
> > +	[AMnMB2ADDRH] = 0x10c,
> > +	[AMnMB3ADDRL] = 0x110,
> > +	[AMnMB3ADDRH] = 0x114,
> > +	[AMnMB4ADDRL] = 0x118,
> > +	[AMnMB4ADDRH] = 0x11c,
> > +	[AMnMB5ADDRL] = 0x120,
> > +	[AMnMB5ADDRH] = 0x124,
> > +	[AMnMB6ADDRL] = 0x128,
> > +	[AMnMB6ADDRH] = 0x12c,
> > +	[AMnMB7ADDRL] = 0x130,
> > +	[AMnMB7ADDRH] = 0x134,
> > +	[AMnMB8ADDRL] = 0x138,
> > +	[AMnMB8ADDRH] = 0x13c,
> > +	[AMnMBVALID] = 0x148,
> > +	[AMnMBS] = 0x14c,
> > +	[AMnAXIATTR] = 0x158,
> > +	[AMnFIFOPNTR] = 0x168,
> > +	[AMnAXISTP] = 0x174,
> > +	[AMnAXISTPACK] = 0x178,
> > +	[ICnEN] = 0x200,
> > +	[ICnMC] = 0x208,
> > +	[ICnMS] = 0x254,
> > +	[ICnDMR] = 0x26c,
> > +};
> > +
> > +static const struct rzg2l_cru_info rzgl2_cru_info = {
> > +	.regs = rzg2l_cru_regs,
> > +};
> > +
> >  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> > -	{ .compatible = "renesas,rzg2l-cru", },
> > +	{
> > +		.compatible = "renesas,rzg2l-cru",
> > +		.data = &rzgl2_cru_info,
> > +	},
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table); diff --git a/drivers/media/platform/renesas/rzg2l-
> > cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > index 1c9f22118a5d..86c320286246 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > @@ -10,71 +10,77 @@
> > 
> >  /* HW CRU Registers Definition */
> > 
> > -/* CRU Control Register */
> > -#define CRUnCTRL			0x0
> >  #define CRUnCTRL_VINSEL(x)		((x) << 0)
> > 
> > -/* CRU Interrupt Enable Register */
> > -#define CRUnIE				0x4
> >  #define CRUnIE_EFE			BIT(17)
> > 
> > -/* CRU Interrupt Status Register */
> > -#define CRUnINTS			0x8
> >  #define CRUnINTS_SFS			BIT(16)
> > 
> > -/* CRU Reset Register */
> > -#define CRUnRST				0xc
> >  #define CRUnRST_VRESETN			BIT(0)
> > 
> >  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > -#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> > +#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
> > 
> >  /* Memory Bank Base Address (Higher) Register for CRU Image Data */
> > -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> > +#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)
> > 
> > -/* Memory Bank Enable Register for CRU Image Data */
> > -#define AMnMBVALID			0x148
> >  #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
> > 
> > -/* Memory Bank Status Register for CRU Image Data */
> > -#define AMnMBS				0x14c
> >  #define AMnMBS_MBSTS			0x7
> > 
> > -/* AXI Master Transfer Setting Register for CRU Image Data */
> > -#define AMnAXIATTR			0x158
> >  #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> >  #define AMnAXIATTR_AXILEN		(0xf)
> > 
> > -/* AXI Master FIFO Pointer Register for CRU Image Data */
> > -#define AMnFIFOPNTR			0x168
> >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> >  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> > 
> > -/* AXI Master Transfer Stop Register for CRU Image Data */
> > -#define AMnAXISTP			0x174
> >  #define AMnAXISTP_AXI_STOP		BIT(0)
> > 
> > -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> > -#define AMnAXISTPACK			0x178
> >  #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
> > 
> > -/* CRU Image Processing Enable Register */
> > -#define ICnEN				0x200
> >  #define ICnEN_ICEN			BIT(0)
> > 
> > -/* CRU Image Processing Main Control Register */
> > -#define ICnMC				0x208
> >  #define ICnMC_CSCTHR			BIT(5)
> >  #define ICnMC_INF(x)			((x) << 16)
> >  #define ICnMC_VCSEL(x)			((x) << 22)
> >  #define ICnMC_INF_MASK			GENMASK(21, 16)
> > 
> > -/* CRU Module Status Register */
> > -#define ICnMS				0x254
> >  #define ICnMS_IA			BIT(2)
> > 
> > -/* CRU Data Output Mode Register */
> > -#define ICnDMR				0x26c
> >  #define ICnDMR_YCMODE_UYVY		(1 << 4)
> > 
> > +enum rzg2l_cru_common_regs {
> > +	CRUnCTRL,	/* CRU Control */
> > +	CRUnIE,		/* CRU Interrupt Enable */
> > +	CRUnINTS,	/* CRU Interrupt Status */
> > +	CRUnRST, 	/* CRU Reset */
> > +	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> > +	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> > +	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
> > +	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
> > +	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
> > +	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
> > +	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
> > +	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
> > +	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
> > +	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
> > +	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
> > +	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
> > +	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
> > +	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
> > +	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
> > +	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> > +	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> > +	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> > +	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> > +	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> > +	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> > +	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> > +	ICnEN,		/* CRU Image Processing Enable */
> > +	ICnMC,		/* CRU Image Processing Main Control */
> > +	ICnMS,		/* CRU Module Status */
> > +	ICnDMR,		/* CRU Data Output Mode */
> > +	RZG2L_CRU_MAX_REG,
> > +};
> > +
> >  #endif /* __RZG2L_CRU_REGS_H__ */
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 8b898ce05b84..00c3f7458e20 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
> >  	bool yuv;
> >  };
> > 
> > +struct rzg2l_cru_info {
> > +	const u16 *regs;
> > +};
> > +
> >  /**
> >   * struct rzg2l_cru_dev - Renesas CRU device structure
> >   * @dev:		(OF) device
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index cd69c8a686d3..792f0df51a4b 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -42,16 +42,66 @@ struct rzg2l_cru_buffer {
> >  /* -----------------------------------------------------------------------------
> >   * DMA operations
> >   */
> > -static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> > +static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset,
> > +u32 value)
> >  {
> > -	iowrite32(value, cru->base + offset);
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	/*
> > +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> > +	 * rest of the registers have valid offset being set in cru->info->regs.
> > +	 */
> > +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > +		return;
> > +
> > +	iowrite32(value, cru->base + regs[offset]); }
> > +
> > +static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset) {
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	/*
> > +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> > +	 * rest of the registers have valid offset being set in cru->info->regs.
> > +	 */
> > +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > +		return 0;
> > +
> > +	return ioread32(cru->base + regs[offset]);
> >  }
> > 
> > -static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> > +static inline void
> > +__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32
> > +value)
> >  {
> > -	return ioread32(cru->base + offset);
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > +
> > +	iowrite32(value, cru->base + regs[offset]);
> Do you need this code as the purpose is to test compile time constant and
> It won't execute at run time?

It was suggested in a previous review.

I've done some investigation on the above bot issue here.
Using __always_inline for constant read/write issue seems solved.

I found this link: https://www.kernel.org/doc/local/inline.html

But tbh I'm not finding an example into the kernel that use both 
BUILD_BUG_ON and  __always_inline.

Laurent what do you think about? Do you have some hints?
Thanks in advance.

> 
> 
> >  }
> > 
> > +static inline u32
> > +__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset) {
> > +	const u16 *regs = cru->info->regs;
> > +
> > +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > +
> > +	return ioread32(cru->base + regs[offset]); 
> 
> Do you need this code as the purpose is to test compile time constant and
> It won't execute at run time?
> 
> Not sure, maybe adding an entry with MAX_ID in LUT,
> that will avoid buffer overflows and you can take out
> All out of bound array checks?
> 
> Cheers,
> Biju
> 
> }
> > +
> > +#define rzg2l_cru_write(cru, offset, value) \
> > +	(__builtin_constant_p(offset) ? \
> > +	 __rzg2l_cru_write_constant(cru, offset, value) : \
> > +	 __rzg2l_cru_write(cru, offset, value))
> > +
> > +#define rzg2l_cru_read(cru, offset) \
> > +	(__builtin_constant_p(offset) ? \
> > +	 __rzg2l_cru_read_constant(cru, offset) : \
> > +	 __rzg2l_cru_read(cru, offset))
> > +
> >  /* Need to hold qlock before calling */  static void return_unused_buffers(struct rzg2l_cru_dev *cru,
> >  				  enum vb2_buffer_state state)
> > --
> > 2.43.0
> 

Regards,
Tommaso

