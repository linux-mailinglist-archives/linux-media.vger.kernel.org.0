Return-Path: <linux-media+bounces-26276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F53A39BFB
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 13:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698BC3B4BA6
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 12:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06232243382;
	Tue, 18 Feb 2025 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="p+qOlnBk"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D322FF40;
	Tue, 18 Feb 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880797; cv=fail; b=PbAt5OZcXZIMp/NggnoaRyBWTRzsAg4x6V+AqwMNPf6X0U5GczUhDeDo+iAKXyGOvJNQtr6ahcit4fAos6S6+8UMoLclAIo9r6g/0J9S7uC7DwU4KOmaQAAqEDiy0jheAV0hXU8GUPYez2guGyKsKYjBnX0tZoSmURr9S9N7dcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880797; c=relaxed/simple;
	bh=JAwhOhqeqojQvzDCLf08cFWBAllXWnjoOVVpODRXJA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E2cWuEQ1wwMKJFuJ6KZm2HjxV0m+EDXs2ABQqn/6Q4bqgUgVBDFyhmjLw7ZCXNAHXjc0o1c7gF3GA9bswClT8yRC+Z6CXGCbB4CgGYg4d3hNEMsJNk0U1edjYiuD3NwOwuZ3zkISyercoa3DiWrfbA4ChGUZQs0+wpq355gwfeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=p+qOlnBk; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgyUgPYBzWkAEIn5YAftXg00AhIWOmncEspxvwdK9i0XIS/q6khStR2jhoJSqTFHG1UzlhhFhWOW4WZlJ/t2rsjV2X0PEj3G+86QH/icLkhDp4zB0kJ5fxnGL7ejIvxDstMN0sY+vcx3TVvMx4Qte2RGsOp7Yq9u8Lcprn/7+sHycLulCruYYpKo2kXRtSRk7/IJsLcEJwfyTv4S77p62i4AE9Egh/3FaBIbV4V14fBKe4Nu43dswwR/wpQvS+n3HHpLNZe/lhkbzzkeY0JjbZy6yyEmcxkxiAI11gQ6M0PcfcRCOCUBeYyo8B4pXSoQ9XYoabn9eX7lzP4M2OJwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUixxzCJIaIeMtkO/b9B6ghhfg02Qy/h4629BUrDbEM=;
 b=pFuWT1HAp8bfTFRxr1d+FfH6EIdg4MXduyYTqYTHR0Q5AnTKqeMHtdh1C7NS71ewpiGQNpqDsYcukFE466TeANcv1oRYUcc22EY7vAcix7hHAVU0uv5qNCzU9Z+tzjEAs7FPcnAQ00eqPQtyfmy5WSdsrdvt/0EBGkc2fSju+1evUgJV+TFvVjKQuEEU1TFBb9h+LOuvsswrRsQKwDo+URtLorAuwxpV7izTIOY53J/5C2iSEzKL5IwXTG8FhDapQEeb8d4ed3rYKvSoOvKLN9kMM5OBvhi9OW+nRuWlivmMLElhaun9BxmEjXhgosDBiqHkyGrgrCiWsRHf6o9iug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUixxzCJIaIeMtkO/b9B6ghhfg02Qy/h4629BUrDbEM=;
 b=p+qOlnBkgiEG8MJCaAxzV1lwpybiz6MeQd4mq0dLyGlqoe71rnZ9dpaMStvQpFRNynmExdug9xWX/9epxlTispLqY/ZCT1MBNg0LGbWq35zWbmhMZiDYqGxMlBZnd/AOMjztryELm6VAQ+VfJZSMEWe/FAGzeRVWiguu+D8+hN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB8323.jpnprd01.prod.outlook.com (2603:1096:604:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.21; Tue, 18 Feb
 2025 12:13:10 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 12:13:10 +0000
Date: Tue, 18 Feb 2025 13:12:58 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] media: rzg2l-cru: csi2: Use temporary variable for
 struct device in rzg2l_csi2_probe()
Message-ID: <Z7R5SvzU/5UNiuWE@tom-desktop>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-6-tommaso.merciai.xr@bp.renesas.com>
 <20250214004729.GD8393@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214004729.GD8393@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::15) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: de182375-a731-4120-ae1f-08dd50159bdc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?oOSCjL86fFmIUZdbbWHeQLrY9JQjA8u+fd4aIIsvJzq7cktfvtUW5h3jyD7Z?=
 =?us-ascii?Q?LzVPvcSL14ZKMCR2tCTaXI9W+AgXz8kYhlyw/PTqh0L51oz2E+rfEXqmHsvR?=
 =?us-ascii?Q?pfLMCY1lfEYawI4WrZkwMU94r9EHqIbeDTUGpR0XFvqBAXAy1WQhP2lW2l20?=
 =?us-ascii?Q?bBAgyuWmGhyA2DvQ8tvkqhkbjyFS56j03sOwwFpiIiVDL90ZwUde9J7jg4Zj?=
 =?us-ascii?Q?98oRBgx5dGt8Q1Z/JjGQVEH1QZqXyE/LoPLP6fg9bk9kmDnigOnKxpdQJ6yd?=
 =?us-ascii?Q?xkbsFZqX1rqSoIlCdGqDoMDDi6l5k7+SNJ8ku7uKULZunro+fMldcek+MRpX?=
 =?us-ascii?Q?uyJXH/yktv5dj3D3ALdX37w1LZ/7slboqrA289X5r3Q+2ErHXkXlRlJ/SI7s?=
 =?us-ascii?Q?oWvuLWE6uaV+T6yYFvagfzoy78oM9GG76f87Gb/ZDrcw1LYHtpfnM9BJHO5l?=
 =?us-ascii?Q?xkJ4utUg1cWErnZEg0/DpAPZeNqGiXmI0R0ylmKG+ME9b2amM1uI3/321eOc?=
 =?us-ascii?Q?Kx75ur0Jw81IApIQ8HE2wYQSscU2Rh66T9X3bLabAnfsx4J/XH8YXwSGq49u?=
 =?us-ascii?Q?WdQU82EQRueYvVYS3mWfcB4ZvxlQBs3zS0JJVnuxXgj4qpDt19VJShkE39it?=
 =?us-ascii?Q?WD71tr8ddE99fnXVx2Y6u30TMPgPHRmBxhl4n06C42HdI/q505oJ8sY+XOgx?=
 =?us-ascii?Q?7RqkJXq6Y9Hux48ctfZfR2jCuGiE3Oe1mNDOrlLvJ1NYDDNIgXM51cT3N5aO?=
 =?us-ascii?Q?3zwDXh3MvgpASm17e0oX6W1T7SQRFTqeTfzngxYwTI1xFW97jD6/6OPhMz1C?=
 =?us-ascii?Q?lud7jinZ7EWgsxfaTtdjcrUbIp89z8kaxlfjVGyOV3c1kdxKbvLLxp17NpOm?=
 =?us-ascii?Q?LeMFP5CKWgp8nMHKi/OLZVSeqJcUO4lCuVjbbJtKbKfkmJ6Xa9DtD/Mzrs4G?=
 =?us-ascii?Q?aN0S3HCvhNWT5otLdhIaiGw9O8QL+pRgnHHfkPy/5HDpyPf6aM0r6AZFlNEp?=
 =?us-ascii?Q?qwncIWJgqvoT5mlWv0VYj7+T8RtyFlJ6jNReOTiRzaTF0cblbKXwCoi+eCGN?=
 =?us-ascii?Q?vBXev3UUI1i1NZPf+NqbCscY5FHtCpI/VGtS2s9ecgSn0XG7ItAChA6A/xar?=
 =?us-ascii?Q?u+9jcIjBmBB1Pg7AJK34BxaFRJ5B25SknA5QvzDx/WAevfGAoVkuHvidash3?=
 =?us-ascii?Q?uVZDlX6uY3dRvCC7ACE8x2G2mWYVADCsl1w1ZmbnxYXZR6+R0agB0LGfr08K?=
 =?us-ascii?Q?pB2x7UCJPL+x/A1H5HVzHR1c+v/NyZKBeEN6ApHrboj17YwsYbcZ/SdsCMKJ?=
 =?us-ascii?Q?2BOA25hYViS4vAs/GL84ZAQQ1XsN/1JFUw03TiTQc8sDNFO8ycGkKKxowPYn?=
 =?us-ascii?Q?4nTfqDTYxNVk63O1LhjkyCoiP+Y5CnucXmrB+uTLpBWt8I9k5ZQcjgNDlpJ5?=
 =?us-ascii?Q?NAQ+5xiITN4hdJvIs2LdhG1Y5A0fb6+e?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qTuy+mXlpsrdTuobAAJGmoSqaJd6wFywLnkVvnMMyiIsbVWZtE8rpbFKNzUz?=
 =?us-ascii?Q?oRF4FIC0noGkJLvxzI7FdZHCwp/M/Kgz02+EdmO0exmOqutsqTSEe/lSS8Ej?=
 =?us-ascii?Q?p4lkOgHVC/DPRuCq5z2IKt/0YdyvZWWATVBe2WW6IxElszB2DiyNCNRS4Ouz?=
 =?us-ascii?Q?rXLfm6crhaPvSTNaH4UxnaAvtZOctEAya2FbVwy0YPv/MVf501Gf4ALFUjk3?=
 =?us-ascii?Q?XvElzz7oIfX7wcyn5Mly2BHOx5OnDGNahbnCrd3X0JVHSmK974Au78M8pLl1?=
 =?us-ascii?Q?qSNQ58V3GxotMMrWfY5zfbAk6OzmlJK81URIQ4KGxH4rrlnzzkBC0vA0WMlp?=
 =?us-ascii?Q?zuF+5qdSlh7j/FoTO0+memwhT0mrN+kXEyQzkeV0IdJ3JZVM97EsgiT4ZIeU?=
 =?us-ascii?Q?SBlnGBjfEShQQAfi+2IwvdnwJ8YfF4tmiDNocLQV49hzf9Tf5V8nLeszswPn?=
 =?us-ascii?Q?DHVc5GNf9e9wapfZk65gh4Mynyxt5DnB1YPUVrm4vnF91FQ5DUIg97rCtaSE?=
 =?us-ascii?Q?XzY7PrqRjjzU2zqlWm5bgEdzboNzZGhwiuBLT3HUFXpbyAuxgJNXP3E6LQu1?=
 =?us-ascii?Q?OxzicQejSYsf+3xKwH6DmbJHm/HhiegNZ0LI4TjSwYGwElY101t0c/sdYE/R?=
 =?us-ascii?Q?jRFF4WtRsTwh590TlOeKx4RHJdxSNMSFP2YLCFOQdiaEVLMqkMZlg81RHAzb?=
 =?us-ascii?Q?Za5FESJhmKWI2WSN8ih9DxLe5SGJR0KEAwQF1u7LFgsXVSL7RV1RVz/iwu93?=
 =?us-ascii?Q?C1osX6DyPC2w00LRyPbQ0ZMTQ1M5ExIjbbkO+LhW5dTSa36PMon2xJtjSosf?=
 =?us-ascii?Q?PXKXW/uOYXzd1QyzdEQx5A7f69mfquGApuSY9a5wTRXz84qOz0/HL06ATwYq?=
 =?us-ascii?Q?HMyU4Gj9nB2R7grqrWK3bbh+GmuvLpIcnBOjyq/ZRLUmITKdwZREmI4Lzd4g?=
 =?us-ascii?Q?vDfHIBCfbR9FLn7zS9j9nSMqRTT55Wer09JrvcOM+tOKsP2gXNz74UkNOfeG?=
 =?us-ascii?Q?U+TpdbQWnDgxTJN37qf3Qsm/g0qGGFi+ZB+CXnsWAJZh/DI0TxNfrhxQs+r3?=
 =?us-ascii?Q?lMn39lluTFKFm6aRlFX5GpZ9EKfKNmhB+o2gW8ECsnv1IK8IwHmhXcUOep1Y?=
 =?us-ascii?Q?SWRyuFvLZMjURUV3d4DYkn45iPmkXH9g5Xe4jF7zMPNvaWoOg3OvJgNhw01J?=
 =?us-ascii?Q?78jF6uGgme+9FRS/pLYoMBFPcXt2hP3yDR2gPfxbH4wLOXJZaSc7/V/DDm6+?=
 =?us-ascii?Q?vubLQRHBks2S2gza2JHBeLSNqbFybNFCgtQO0noR5Mm0yRjIRrHOtKSQB5M9?=
 =?us-ascii?Q?/E5YOP0xTBQi839ZuPD9u7JCsCsIWL7ZFiwfC+CpV9LoJ363hCtpD/+LA+K2?=
 =?us-ascii?Q?iy96bSkzadTfqb3txJ/nWYwLitzDIh7q6wu3v44qTjfhE8ngEwkqDbhwPdB3?=
 =?us-ascii?Q?cvG5tu0MkzV8URwRCIxxsBoC6lGtNc2G3DS6Q4UhfQ4iHRpYJ7sScjeKO8cW?=
 =?us-ascii?Q?8gOdD5TPykNNp2YbOkBcAahINe16OfZXakA/AuKT1bm25nLFSoXPRanv1Yf3?=
 =?us-ascii?Q?gqPs+DtMK94ONUUPbOoypFxUFfJcBdKAGrNrsh7f96GhqZn68fzscQ6Oc9Yd?=
 =?us-ascii?Q?+UYThrZiuSvavc77vkmyE3Y=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de182375-a731-4120-ae1f-08dd50159bdc
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:13:10.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9Vgq4XN39QBwQczQ3iFFw0Wi9wx2bMi4L4Hth4qT5Xs51WuLw/4is6CGq0CRfOm29tGGUbVCfOE9vtMWgZuTO8RSAsqct2+VGFH4DK4EOloK5soX5/F7p53N9ztoYgV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8323

Hi Laurent,

Thanks for your review.

On Fri, Feb 14, 2025 at 02:47:29AM +0200, Laurent Pinchart wrote:
> Hi Tommaso, Prabhakar,
> 
> Thank you for the patch.
> 
> On Mon, Feb 10, 2025 at 12:45:37PM +0100, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > Use a temporary variable for the struct device pointers to avoid
> 
> s/temporary/local/ (in the subject message too).

I'll fix this in v2.
Thanks.

> 
> > dereferencing.
> 
> The only advantage of this is shortened lines. That's a coding style
> preference, and I'm fine with this patch, but the commit message should
> mention this, not "avoid dereferencing".

I will go for:

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Thanks.
> 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 31 ++++++++++---------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index 881e910dce02..948f1917b830 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -764,10 +764,11 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
> >  
> >  static int rzg2l_csi2_probe(struct platform_device *pdev)
> >  {
> > +	struct device *dev = &pdev->dev;
> >  	struct rzg2l_csi2 *csi2;
> >  	int ret;
> >  
> > -	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
> > +	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
> >  	if (!csi2)
> >  		return -ENOMEM;
> >  
> > @@ -775,28 +776,28 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
> >  	if (IS_ERR(csi2->base))
> >  		return PTR_ERR(csi2->base);
> >  
> > -	csi2->cmn_rstb = devm_reset_control_get_exclusive(&pdev->dev, "cmn-rstb");
> > +	csi2->cmn_rstb = devm_reset_control_get_exclusive(dev, "cmn-rstb");
> >  	if (IS_ERR(csi2->cmn_rstb))
> > -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->cmn_rstb),
> > +		return dev_err_probe(dev, PTR_ERR(csi2->cmn_rstb),
> >  				     "Failed to get cpg cmn-rstb\n");
> >  
> > -	csi2->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
> > +	csi2->presetn = devm_reset_control_get_shared(dev, "presetn");
> >  	if (IS_ERR(csi2->presetn))
> > -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->presetn),
> > +		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
> >  				     "Failed to get cpg presetn\n");
> >  
> > -	csi2->sysclk = devm_clk_get(&pdev->dev, "system");
> > +	csi2->sysclk = devm_clk_get(dev, "system");
> >  	if (IS_ERR(csi2->sysclk))
> > -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
> > +		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
> >  				     "Failed to get system clk\n");
> >  
> > -	csi2->vclk = devm_clk_get(&pdev->dev, "video");
> > +	csi2->vclk = devm_clk_get(dev, "video");
> >  	if (IS_ERR(csi2->vclk))
> > -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
> > +		return dev_err_probe(dev, PTR_ERR(csi2->vclk),
> >  				     "Failed to get video clock\n");
> >  	csi2->vclk_rate = clk_get_rate(csi2->vclk);
> >  
> > -	csi2->dev = &pdev->dev;
> > +	csi2->dev = dev;
> >  
> >  	platform_set_drvdata(pdev, csi2);
> >  
> > @@ -804,18 +805,18 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	pm_runtime_enable(&pdev->dev);
> > +	pm_runtime_enable(dev);
> >  
> >  	ret = rzg2l_validate_csi2_lanes(csi2);
> >  	if (ret)
> >  		goto error_pm;
> >  
> > -	csi2->subdev.dev = &pdev->dev;
> > +	csi2->subdev.dev = dev;
> >  	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
> >  	csi2->subdev.internal_ops = &rzg2l_csi2_internal_ops;
> > -	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
> > +	v4l2_set_subdevdata(&csi2->subdev, dev);
> >  	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
> > -		 "csi-%s", dev_name(&pdev->dev));
> > +		 "csi-%s", dev_name(dev));
> >  	csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> >  
> >  	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > @@ -852,7 +853,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
> >  	v4l2_async_nf_cleanup(&csi2->notifier);
> >  	media_entity_cleanup(&csi2->subdev.entity);
> >  error_pm:
> > -	pm_runtime_disable(&pdev->dev);
> > +	pm_runtime_disable(dev);
> >  
> >  	return ret;
> >  }
> > 
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks & Regards,
Tommaso

